with Ada.Containers.Doubly_Linked_Lists;

with Ada.Text_IO;
with Ada.Unchecked_Conversion;
with Ada.Unchecked_Deallocation;
with Interfaces.C; use Interfaces.C;
with System;

with GL;
with GLext;
with GLX;
with GLXext;
with X11;
with XLib;
with xcb; use xcb;
with xcb_xfixes;
with xcb_shape;
with xproto; use xproto;
with xcb_composite;

with Desktop;
with Render;
with Render.Shaders;
with Render.Util;
with Setup;
with Util;

package body Compositor is

    type OverlayReplyPtr is access all xcb_composite.xcb_composite_get_overlay_window_reply_t;
    
    -- Overlay window returned from composite extension. We'll actually draw to
    -- the sceneWindow, which is a child of this overlay.
    overlayWindow : xproto.xcb_window_t;

    -- If supported, the GLX_EXT_texture_from_pixmap extension should be a
    -- faster way to get the XComposite off-screen buffer into a texture that
    -- we can render.
    fastTexFromPixmap     : Boolean := False;
    glXBindTexImageEXT    : GLXext.PFNGLXBINDTEXIMAGEEXTPROC;
    glXReleaseTexImageEXT : GLXext.PFNGLXRELEASETEXIMAGEEXTPROC;

    -- If supported, the glXSwapInterval function can be used to provide vsync
    -- for less screen tearing.
    glxVSync              : Boolean := False;
    glXSwapIntervalEXT    : GLXext.PFNGLXSWAPINTERVALEXTPROC;

    ---------------------------------------------------------------------------
    -- Keep a list of all the windows so we can re-draw them in stacking order.
    -- As a window is focused, we remove it and re-append it to the end of this
    -- list. (bottom = first, top = last).
    --
    -- This can be thought of as a sort of primitive scene graph.
    ---------------------------------------------------------------------------
    package WindowStack is new Ada.Containers.Doubly_Linked_Lists
        (Element_Type => xproto.xcb_window_t);

    winStack : WindowStack.List;

    ---------------------------------------------------------------------------
    -- addWindow
    ---------------------------------------------------------------------------
    procedure addWindow (win : xproto.xcb_window_t) is
        use WindowStack;
    begin
        winStack.append (win);
    end addWindow;

    ---------------------------------------------------------------------------
    -- deleteWindow
    ---------------------------------------------------------------------------
    procedure deleteWindow (win : xproto.xcb_window_t) is
        use WindowStack;

        C : Cursor := winStack.find (win);
    begin
        if C /= No_Element then
            winStack.delete (C);
        else
            raise CompositorException with "Attempted to delete non-existent window from render stack";
        end if;
    end deleteWindow;

    ---------------------------------------------------------------------------
    -- bringToTop
    -- It's not necessarily an error to call this with a window not in the
    -- list.
    ---------------------------------------------------------------------------
    procedure bringToTop (win : xproto.xcb_window_t) is
        use WindowStack;
    begin
        deleteWindow (win);
        winStack.append (win);
    exception
        when CompositorException =>
            raise CompositorException with "Attempted to bring non-existent window to top of render stack";
    end bringToTop;

    ---------------------------------------------------------------------------
    -- createGLScene
    -- Given a overlay window from the X Composite extension and the OpenGL
    -- Renderer, create a GLX window that we can composite images to.
    --
    -- @TODO some overlap here between this and Frames.createOpenGLSurface,
    --  could probably avoid some repetition.
    ---------------------------------------------------------------------------
    procedure createGLScene (c          : access xcb_connection_t;
                             rend       : Render.Renderer;
                             sceneWin   : xproto.xcb_window_t) is
        glxWindow : GLX.GLXWindow;
        glxRet    : int;
    begin

        glxWindow := GLX.glXCreateWindow (dpy        => rend.display,
                                          config     => rend.fbConfig,
                                          win        => Interfaces.C.unsigned_long(sceneWin),
                                          attribList => null);

        if glxWindow = 0 then
            raise CompositorException with "Troodon: (compositor) Failed to create OpenGL overlay window";
        end if;

        Compositor.sceneDrawable := GLX.GLXDrawable (glxWindow);

        glxRet := GLX.glXMakeContextCurrent (dpy  => rend.display,
                                             draw => Compositor.sceneDrawable,
                                             read => Compositor.sceneDrawable,
                                             ctx  => rend.context);

        if glxRet = 0 then
            raise CompositorException with "Troodon: (compositor) Failed to make GLX context current.";
        end if;

    end createGLScene;

    ---------------------------------------------------------------------------
    -- allowInputPassthrough
    -- Tell the overlay window not to receive events using a (well-known?) 
    -- XFixes technique. I'm not sure the origin of this technique, but I most
    -- assuredly did not invent it.
    --
    -- Essentially, we create a XFixes region with an empty shape, and set that
    -- as the input region for the overlay window, essentially making it an
    -- "output only" window.
    --
    -- @TODO when using checked versions of these functions, we seem to always
    -- get an error code. Notably, Qt does not check for errors on these.
    ---------------------------------------------------------------------------
    procedure allowInputPassthrough (c : access xcb.xcb_connection_t; win : xproto.xcb_window_t) is
        use xcb;
        use xproto;
        use xcb_xfixes;
        use xcb_shape;

        -- rect        : aliased xcb_rectangle_t := (x => 0, y => 0, width => 0, height => 0);
        region      : xcb_xfixes_region_t;
        regionInput : xcb_shape_kind_t := xcb_shape_kind_t(xcb_shape_sk_t'Pos(XCB_SHAPE_SK_INPUT));
        cookie      : xcb_void_cookie_t;
        error       : access xcb_generic_error_t;
    begin

        -- Create the region
        region := xcb_xfixes_region_t(xcb_generate_id (c));

        cookie := xcb_xfixes_create_region_checked (c              => c,
                                                    region         => region,
                                                    rectangles_len => 0,
                                                    rectangles     => null);

        error := xcb_request_check (c, cookie);

        if error /= null then
            raise CompositorException with 
                "Troodon: (compositor) Failed to create input pass-through region for overlay window, error:" & error.error_code'Image
                    & " response type:" & error.response_type'Image
                    & " major:"         & error.major_code'Image 
                    & " minor:"         & error.minor_code'Image
                    & " resource:"      & error.resource_id'Image
                    & " sequence:"      & error.sequence'Image;
        end if;

        -- Set the window input shape
        Ada.Text_IO.Put_Line ("Troodon: (compositor) Setting window shape region");

        cookie := xcb_xfixes_set_window_shape_region_checked (c         => c,
                                                              dest      => win,
                                                              dest_kind => regionInput,
                                                              x_offset  => 0,
                                                              y_offset  => 0,
                                                              region    => region);

        error := xcb_request_check (c, cookie);

        if error /= null then
            raise CompositorException with "Troodon: (compositor) Failed to set input shape region on overlay window, error:" & error.error_code'Image;
        end if;                                                              

        -- Destroy the region
        cookie := xcb_xfixes_destroy_region_checked (c, region);
        error  := xcb_request_check (c, cookie);

        if error /= null then
            raise CompositorException with "Troodon: (compositor) Failed to destroy input shape region, error:" & error.error_code'Image;
        end if;                                                              

    end allowInputPassthrough;


    ---------------------------------------------------------------------------
    -- start
    -- Check for the X Composite extension and, if available, request an
    -- overlay window from the X server.
    ---------------------------------------------------------------------------
    procedure start (c    : access xcb_connection_t;
                     rend : Render.Renderer;
                     mode : CompositeMode) is
        use GLXext;
        use xcb;
        use xproto;
        use xcb_composite;
        use Render;

        cookie     : xcb_void_cookie_t;
        error      : access xcb_generic_error_t;
        root       : xcb_window_t := Setup.getRootWindow (c);
        updateMode : Interfaces.C.unsigned_char;
        
        cookieOvly : xcb_composite_get_overlay_window_cookie_t;
        replyOvly  : OverlayReplyPtr;
        geomOvly   : xcb_get_geometry_reply_t;

        sceneWin   : xcb_window_t;
        sceneAttr  : aliased xcb_create_window_value_list_t;
        sceneMask  : Interfaces.C.unsigned;

        -- Procedure name in C format for glxGetProcAddress
        procName1   : Interfaces.C.char_array := Interfaces.C.To_C ("glXBindTexImageEXT");
        procName2   : Interfaces.C.char_array := Interfaces.C.To_C ("glXReleaseTexImageEXT");
        procName3   : Interfaces.C.char_array := Interfaces.C.To_C ("glXSwapIntervalEXT");

        procedure free is new Ada.Unchecked_Deallocation (Object => xcb_composite_get_overlay_window_reply_t,
                                                          Name   => OverlayReplyPtr);

        function toBindProc is new Ada.Unchecked_Conversion (Source => GLX.uu_GLXextFuncPtr,
                                                             Target => GLXext.PFNGLXBINDTEXIMAGEEXTPROC);

        function toReleaseProc is new Ada.Unchecked_Conversion (Source => GLX.uu_GLXextFuncPtr,
                                                                Target => GLXext.PFNGLXRELEASETEXIMAGEEXTPROC);

        function toSyncProc is new Ada.Unchecked_Conversion (Source => GLX.uu_GLXextFuncPtr,
                                                             Target => GLXext.PFNGLXSWAPINTERVALEXTPROC);
    begin

        -- @TODO probably want to grab server before doing this or do this in Setup while
        -- we have it grabbed.
        -- If we don't have an OpenGL renderer, just let the server do basic compositing.
        if rend.kind = Render.OPENGL and mode = MANUAL then
            Ada.Text_IO.Put_Line ("Troodon: (compositor) Using manual redirection w/ OpenGL");
            updateMode := xcb_composite_redirect_t'Pos(XCB_COMPOSITE_REDIRECT_MANUAL);
        else
            Ada.Text_IO.Put_Line ("Troodon: (Compositor) Using automatic redirection");
            updateMode := xcb_composite_redirect_t'Pos(XCB_COMPOSITE_REDIRECT_AUTOMATIC);
        end if;

        -- Instruct the X Server to redirect all window output to off-screen buffers.
        cookie := xcb_composite_redirect_subwindows_checked (c      => c,
                                                             window => root,
                                                             update => updateMode);

        error := xcb_request_check (c, cookie);

        if error /= null then
            Ada.Text_IO.Put_Line ("Troodon: (Compositor) Error redirecting subwindows:" & error.error_code'Image);
            raise CompositorException with "Failed to redirect subwindows";
        end if;

        if rend.kind = Render.OpenGL and mode = MANUAL then
            cookieOvly := xcb_composite_get_overlay_window (c, root);
            replyOvly  := xcb_composite_get_overlay_window_reply (c, cookieOvly, error'Address);

            if error /= null then
                Ada.Text_IO.Put_Line ("Troodon: (Compositor) Error getting overlay window:" & error.error_code'Image);
            end if;

            Ada.Text_IO.Put_Line ("Troodon: (Compositor) Received overlay window:" & replyOvly.overlay_win'Image);
            overlayWindow := replyOvly.overlay_win;

            Ada.Text_IO.Put_Line ("Troodon: (Compositor) Creating scene window");
            geomOvly := Util.getWindowGeometry (c, replyOvly.overlay_win);

            -- Experiment
            -- Now, we create our own window with the overlay as it's parent but 32-bit color.
            sceneWin := xcb_generate_id(c);

            sceneAttr.background_pixel := 0;
            sceneAttr.border_pixel := 0;
            sceneAttr.colormap := rend.colormap; -- colormap
            sceneAttr.event_mask := XCB_EVENT_MASK_EXPOSURE;
            
            sceneMask := XCB_CW_BACK_PIXEL or
                         XCB_CW_BORDER_PIXEL or
                         XCB_CW_COLORMAP or
                         XCB_CW_EVENT_MASK;

            -- Create scene window. We'll render everything to this.
            cookie :=
                xcb_create_window_aux_checked (c            => c,
                                               depth        => 32,
                                               wid          => sceneWin,
                                               parent       => overlayWindow,
                                               x            => 0,
                                               y            => 0,
                                               width        => geomOvly.width,
                                               height       => geomOvly.height,
                                               border_width => 0,
                                               u_class      => xcb_window_class_t'Pos (XCB_WINDOW_CLASS_INPUT_OUTPUT), 
                                               visual       => rend.visualID,
                                               value_mask   => sceneMask,
                                               value_list   => sceneAttr'Access);
            
            error := xcb_request_check (c, cookie);

            Ada.Text_IO.Put_Line ("Troodon: (Compositor) Created scene window:" & sceneWin'Image);
            if error /= null then
                raise CompositorException with "Troodon: (Compositor) Failed to create scene window, error:" & error.error_code'Image;
            end if;


            createGLScene (c, rend, sceneWin);

            -- Set the package globals here.
            Compositor.sceneWindow   := sceneWin;
            -- Compositor.sceneDrawable := GLX.GLXDrawable(sceneWin);

            cookie := xcb_map_window_checked (c, sceneWin);

            error := xcb_request_check (c, cookie);
            if error /= null then
                raise CompositorException with "Troodon: (Compositor) Failed to map scene window, error code:" & error.error_code'Image;
            end if;

            -- Set overlay as pass-through. If we're using server-side compositing we don't
            -- need to do this.
            allowInputPassthrough (c, overlayWindow);
            allowInputPassthrough (c, sceneWin);
            free (replyOvly);

            -- Attempt to get GLX_EXT_texture_from_pixmap extension.
            -- @TODO consider checking for availability before going through all this work.
            glXBindTexImageEXT    := toBindProc (GLX.glXGetProcAddress (procName1(0)'Access));
            glXReleaseTexImageEXT := toReleaseProc (GLX.glXGetProcAddress (procName2(0)'Access));

            if glXBindTexImageEXT = null or glXReleaseTexImageEXT = null then
                raise CompositorException with "Failed to get glXBindTexImageEXT procedure";
            end if;

            -- Attempt to get glXSwapInterval extension
            glXSwapIntervalEXT := toSyncProc (GLX.glXGetProcAddress (procName3(0)'Access));

            if glXSwapIntervalEXT /= null then
                null;
                --Ada.Text_IO.Put_Line ("Troodon: (compositor) Using glXSwapIntervalEXT extension");
                --@TODO this doesn't seem to play nice with Xephyr, and gives screen tearing
                -- anyhow.
                --glxVSync := True;
                --glXSwapIntervalEXT (rend.display, overlayDrawable, 1);
            end if;

        end if;

    end start;

    ---------------------------------------------------------------------------
    -- stop
    ---------------------------------------------------------------------------
    procedure stop (c    : access xcb_connection_t;
                    rend : Render.Renderer;
                    mode : Compositor.CompositeMode) is
        use xcb_composite;

        cookie : xcb_void_cookie_t;
        error  : access xcb_generic_error_t;
        root   : xcb_window_t := Setup.getRootWindow (c);
        
        updateMode : Interfaces.C.unsigned_char := 
        (if mode = MANUAL then
            xcb_composite_redirect_t'Pos(XCB_COMPOSITE_REDIRECT_MANUAL)
         else
            xcb_composite_redirect_t'Pos(XCB_COMPOSITE_REDIRECT_AUTOMATIC));
    begin
        Ada.Text_IO.Put_Line ("Troodon: (Compositor) Shutting down.");

        GLX.glXDestroyWindow (rend.display, GLX.GLXWindow(sceneDrawable));

        cookie := xcb_destroy_window_checked (c, Compositor.sceneWindow);
        error  := xcb_request_check (c, cookie);

        if error /= null then
            Ada.Text_IO.Put_Line ("Troodon: (Compositor) Unable to delete the compositor scene window, error:" & error.error_code'Image);
        end if;

        cookie := xcb_composite_release_overlay_window_checked (c, overlayWindow);
        error  := xcb_request_check (c, cookie);

        if error /= null then
            Ada.Text_IO.Put_Line ("Troodon: (Compositor) Unable to release overlay window, error:" & error.error_code'Image);
        end if;

        cookie := xcb_composite_unredirect_subwindows_checked (c, root, updateMode);
        error  := xcb_request_check (c, cookie);

        if error /= null then
            Ada.Text_IO.Put_Line ("Troodon: (Compositor) Unable to un-redirect subwindows, error:" & error.error_code'Image);
        end if;

        Ada.Text_IO.Put_Line ("Troodon: (Compositor) Stopped.");
    end stop;

    ---------------------------------------------------------------------------
    -- drawShadow
    -- draw drop shadow for a window
    ---------------------------------------------------------------------------
    procedure drawShadow  (c          : access xcb.xcb_connection_t;
                           rend       : Render.Renderer;
                           window     : xcb_window_t) is

        -- identify the corners of all our windows.
        geomWin : xcb_get_geometry_reply_t;

        shadowX : Float;
        shadowY : Float;
        shadowW : Float;
        shadowH : Float;

        -- By changing these values the drop shadow can move to different positions.
        -- Could use negative values here for a glow effect
        offsetX1 : Float := 10.0;
        offsetY1 : Float := 10.0;
        offsetX2 : Float := 20.0;
        offsetY2 : Float := 20.0;

        shadowBox : Render.Util.Box2D;

        VAO : aliased GL.GLuint;
        VBO : aliased GL.GLuint;

        -- orthoM : Render.Util.Mat4 := Render.Util.ortho (0.0, sceneW, sceneH, 0.0, -1.0, 1.0);
    begin
        geomWin := Util.getWindowGeometry (c, window);
        shadowX := Float(geomWin.x) + offsetX1;
        shadowY := Float(geomWin.y) + offsetY1;
        shadowW := Float(geomWin.width) + offsetX2;
        shadowH := Float(geomWin.height) + offsetY2;

        shadowBox := (
            1 => (shadowX,           shadowY + shadowH),
            2 => (shadowX,           shadowY),
            3 => (shadowX + shadowW, shadowY + shadowH),
            4 => (shadowX + shadowW, shadowY)
        );

        -- VAO, VBO
        GLext.glGenVertexArrays (1, VAO'Access);
        GLext.glGenBuffers (1, VBO'Access);
        GLext.glBindVertexArray (VAO);

        GLext.glBindBuffer (GLext.GL_ARRAY_BUFFER, VBO);
        GLext.glBufferData (GLext.GL_ARRAY_BUFFER, shadowBox'Length, shadowBox'Address, GLext.GL_STATIC_DRAW);

        -- Shader needs shadow dimensions to calculate blur, screen height to invert coords
        GLext.glUniform4f (location => Render.Shaders.shadowUniformShadow,
                           v0       => shadowX,
                           v1       => shadowY,
                           v2       => shadowW,
                           v3       => shadowH);

        GLext.glVertexAttribPointer (index      => GL.GLuint(Render.Shaders.shadowAttribCoord),
                                     size       => 2,
                                     c_type     => GL.GL_FLOAT,
                                     normalized => GL.GL_FALSE,
                                     stride     => 0,
                                     pointer    => System.Null_Address);
        GLext.glEnableVertexAttribArray (GL.GLuint(Render.Shaders.shadowAttribCoord));

        GLext.glBufferData (target => GLext.GL_ARRAY_BUFFER,
                            size   => shadowBox'Size / 8,
                            data   => shadowBox'Address,
                            usage  => GLext.GL_DYNAMIC_DRAW);

        -- glErr := GL.glGetError;
        --Ada.Text_IO.Put_Line ("drawCircle: glBufferData error? " & glErr'Image);
        GLext.glBindVertexArray (VAO);
        GL.glDrawArrays (mode  => GL.GL_TRIANGLE_STRIP,
                         first => 0,
                         count => Interfaces.C.int(shadowBox'Last));

        -- glErr := GL.glGetError;
        --Ada.Text_IO.Put_Line ("drawCircle: glDrawArrays error? " & glErr'Image);

        GLext.glDisableVertexAttribArray (GL.GLuint(Render.Shaders.shadowAttribCoord));
        GLext.glDeleteVertexArrays (1, VAO'Access);
        GLext.glDeleteBuffers (1, VBO'Access);

    end drawShadow;

    ---------------------------------------------------------------------------
    -- This is an experimental method to batch up some of the requests like
    -- xcb_get_geometry, create a bunch of textures at once, but this still has
    -- issues and isn't ready to go yet.
    ---------------------------------------------------------------------------
    -- procedure updateScene (c            : access xcb.xcb_connection_t;
    --                        rend         : Render.Renderer) is
    --     use xcb_composite;

    --     -- Set up parallel arrays of all the elements we need here.
    --     type GeomPtr is access all xcb_get_geometry_reply_t;

    --     numWindows : Natural := Natural(winStack.Length);

    --     -- geometry cookies
    --     type GCookieArr is array (Natural range 1..numWindows) of xcb_get_geometry_cookie_t;
    --     type GeomArr    is array (Natural range 1..numWindows) of GeomPtr;
    --     type QuadArr    is array (Natural range 1..numWindows) of Render.Util.Box with
    --         Convention => C;
        
    --     -- pixmap cookies
    --     type PCookieArr is array (Natural range 1..numWindows) of xcb_void_cookie_t;
    --     type PixmapArr  is array (Natural range 1..numWindows) of xcb_pixmap_t;
        
    --     -- GLX pixmaps
    --     type GPixmapArr is array (Natural range 1..numWindows) of GLX.GLXPixmap;

    --     type GlXPixmapAttrList is array (Natural range <>) of aliased Interfaces.C.int;

    --     glxPixmapAttrRGB : GLXPixmapAttrList := (
    --         GLXext.GLX_TEXTURE_TARGET_EXT, GLXext.GLX_TEXTURE_2D_EXT,
    --         GLXext.GLX_TEXTURE_FORMAT_EXT, GLXext.GLX_TEXTURE_FORMAT_RGB_EXT,
    --         0);

    --     glxPixmapAttrRGBA : GLXPixmapAttrList := (
    --         GLXext.GLX_TEXTURE_TARGET_EXT, GLXext.GLX_TEXTURE_2D_EXT,
    --         GLXext.GLX_TEXTURE_FORMAT_EXT, GLXext.GLX_TEXTURE_FORMAT_RGBA_EXT,
    --         0);

    --     glxPixmapAttr : access int;

    --     -- Textures
    --     type TexArray is array (Natural range 1..numWindows) of aliased GL.GLuint with Convention => C;

    --     -- VAOs, VBOs
    --     -- type VAOArr is array (Natural range 1..numWindows) of aliased GL.GLuint with Convention => C;
    --     -- type VBOArr is array (Natural range 1..numWindows) of aliased GL.GLuint with Convention => C;

    --     gcookies : GCookieArr;
    --     geoms    : GeomArr;
    --     quads    : QuadArr;

    --     pcookies : PCookieArr;
    --     pixmaps  : PixmapArr;
    --     gpixmaps : GPixmapArr;
    --     error    : access xcb_generic_error_t;

    --     textures : TexArray;
    --     -- VAOs     : VAOArr;
    --     -- VBOs     : VBOArr;

    --     procedure free is new Ada.Unchecked_Deallocation (Object => xcb_get_geometry_reply_t,
    --                                                       Name   => GeomPtr);
    --     i : Natural := 1;
    -- begin
    --     if numWindows = 0 then
    --         return;
    --     end if;

    --     Ada.Text_IO.Put_Line ("Drawing" & numWindows'Image & " windows");

    --     -- Send out all geometry requests and generate pixmap IDs for each
    --     for win of winStack loop
    --         -- We can probably do this even earlier, then do some GL setup while
    --         -- the server is figuring it out.
    --         pixmaps(i)  := xcb_generate_id (c);
    --         gcookies(i) := xcb_get_geometry (c, win);

    --         if pixmaps(i) = 0 then
    --             raise CompositorException with "Unable to generate new ID for pixmap";
    --         end if;

    --         pcookies(i) := xcb_composite_name_window_pixmap (c, win, pixmaps(i));

    --         i := i + 1;
    --     end loop;

    --     -- While waiting for geometry requests, create textures
    --     GL.glGenTextures (int(numWindows), textures(1)'Access);
    --     GL.glTexParameteri (target => GL.GL_TEXTURE_2D,
    --                         pname  => GL.GL_TEXTURE_MIN_FILTER,
    --                         param  => GL.GL_LINEAR);

    --     GL.glTexParameteri (target => GL.GL_TEXTURE_2D,
    --                         pname  => GL.GL_TEXTURE_MAG_FILTER,
    --                         param  => GL.GL_LINEAR);

    --     -- GLext.glGenVertexArrays (numWindows, VAOs(1)'Access);
    --     -- GLext.glGenBuffers (numWindows, VBOs(1)'Access);

    --     -- Receive all geometry requests, create quad and GLX pixmap for each window
    --     for j in 1..numWindows loop
    --         geoms(j) := xcb_get_geometry_reply (c, gcookies(j), error'Address);
        
    --         declare
    --             winX : Float := Float(geoms(j).x);
    --             winY : Float := Float(geoms(j).y);
    --             winW : Float := Float(geoms(j).width);
    --             winH : Float := Float(geoms(j).height);
    --         begin
    --             Ada.Text_IO.Put_Line ("Drawing window at " & winX'Image & "," & winY'Image);
    --             quads(j) := (
    --                 1 => (winX,        winY + winH, 0.0, 1.0),   -- Bottom left
    --                 2 => (winX,        winY,        0.0, 0.0),   -- Top left
    --                 3 => (winX + winW, winY + winH, 1.0, 1.0),   -- Bottom right
    --                 4 => (winX + winW, winY,        1.0, 0.0)    -- Top right
    --             );
    --         end;

    --         if geoms(j).depth = 32 then
    --             glxPixmapAttr := glxPixmapAttrRGBA(0)'Access;
    --         else
    --             glxPixmapAttr := glxPixmapAttrRGB(0)'Access;
    --         end if;

    --         gpixmaps(j) := GLX.glXCreatePixmap (dpy        => rend.display,
    --                                             config     => rend.fbConfig,
    --                                             the_pixmap => X11.Pixmap(pixmaps(j)),
    --                                             attribList => glxPixmapAttr);

    --     end loop;

    --     Ada.Text_IO.Put_Line ("c");

    --     --@TODO figure out how to change this per-window.
    --     GLext.glUniform1f (Render.Shaders.winUniformAlpha, 1.0);

    --     -- Buffer all the quads

    --     GLext.glGenBuffers (1, Render.Shaders.winVBO'Access);
    --     GLext.glBindBuffer (target => GLext.GL_ARRAY_BUFFER,
    --                         buffer => Render.Shaders.winVBO);

    --     GLext.glVertexAttribPointer (index      => GL.GLuint(Render.Shaders.winAttribCoord),
    --                                  size       => 4,
    --                                  c_type     => GL.GL_FLOAT,
    --                                  normalized => GL.GL_FALSE,
    --                                  stride     => 0,
    --                                  pointer    => System.Null_Address);
    --     GLext.glEnableVertexAttribArray (GL.GLuint(Render.Shaders.winAttribCoord));

    --     GLext.glBufferData (target => GLext.GL_ARRAY_BUFFER,
    --                         size   => quads'Length, --quads'Size / 8,
    --                         data   => quads'Address,
    --                         usage  => GLext.GL_STATIC_DRAW);

        
    --     Ada.Text_IO.Put_Line ("d");
    --     GL.glActiveTexture (GL.GL_TEXTURE_2D);

    --     -- Draw the quads
    --     for j in 1..numWindows loop
    --         -- bind/re-bind texture
    --         GL.glBindTexture (GL.GL_TEXTURE_2D, textures(j));
    --         glXBindTexImageEXT (rend.display, gpixmaps(j), GLXext.GLX_FRONT_LEFT_EXT, null);
    --         GL.glDrawArrays (mode  => GL.GL_TRIANGLE_STRIP,
    --                          first => int(j - 1),
    --                          count => 4);
    --         glXReleaseTexImageEXT (rend.display, gpixmaps(j), GLXext.GLX_FRONT_LEFT_EXT);
    --     end loop;

    --     Ada.Text_IO.Put_Line ("e");

    --     -- Cleanup.
    --     GLext.glDisableVertexAttribArray (GL.GLuint(Render.Shaders.winAttribCoord));
    --     GLext.glDeleteBuffers (1, Render.Shaders.winVBO'Access);

    --     -- Delete textures
    --     GL.glDeleteTextures (int(numWindows), textures(1)'Access);
        
    --     -- Free all geometry requests and pixmaps
    --     for j in 1..numWindows loop
    --         GLX.glXDestroyPixmap (rend.display, gpixmaps(j));
    --         free(geoms(j));
    --         pcookies(j) := xcb_free_pixmap (c, pixmaps(j));
    --     end loop;

    --     Ada.Text_IO.Put_Line ("f");
    -- end updateScene;

    ---------------------------------------------------------------------------
    -- blitWindow
    -- @TODO we should buffer all the window quads at once, then just call
    -- glDrawArrays here.
    ---------------------------------------------------------------------------
    procedure blitWindow (c            : access xcb.xcb_connection_t;
                          rend         : Render.Renderer;
                          win          : xproto.xcb_window_t;
                          transparency : Float := 1.0) is
        use xcb;
        use xcb_composite;
        use xproto;

        glxRet : int;
        
        -- Window geometry, location and orthographic projection
        geomWin    : xcb_get_geometry_reply_t;  -- geometry of the window we're blitting
        winX       : Float;
        winY       : Float;
        winW       : Float;
        winH       : Float;

        -- Pixmap info from XCB
        cookie : xcb_void_cookie_t;
        error  : access xcb_generic_error_t;
        pixmap : xcb_pixmap_t;

        -- GLX Pixmap/Texture vars
        Type GlXPixmapAttrList is array (Natural range <>) of aliased Interfaces.C.int;

        glxPixmapAttrRGB : GLXPixmapAttrList := (
            GLXext.GLX_TEXTURE_TARGET_EXT, GLXext.GLX_TEXTURE_2D_EXT,
            GLXext.GLX_TEXTURE_FORMAT_EXT, GLXext.GLX_TEXTURE_FORMAT_RGB_EXT,
            0);

        glxPixmapAttrRGBA : GLXPixmapAttrList := (
            GLXext.GLX_TEXTURE_TARGET_EXT, GLXext.GLX_TEXTURE_2D_EXT,
            GLXext.GLX_TEXTURE_FORMAT_EXT, GLXext.GLX_TEXTURE_FORMAT_RGBA_EXT,
            0);

        glxPixmapAttr : access int;
        
        glxPixmap : GLX.GLXPixmap;

        tex       : aliased GL.GLuint;
        
        -- Destination quad to which the window shall be rendered
        dest   : Render.Util.Box;
    begin

        -- Get window geometry
        -- @TODO keep track of geometry in a window record in the winStack and
        -- just reference that here instead of hitting server.
        geomWin := Util.getWindowGeometry (c, win);

        winX := Float(geomWin.x);
        winY := Float(geomWin.y);
        winW := Float(geomWin.width);
        winH := Float(geomWin.height);

        -- Get pixbuf of window's off-screen storage. We have to perform this step
        -- because a window's contents may have changed between blits.
        pixmap := xcb_generate_id (c);

        if pixmap = 0 then
            raise CompositorException with "Unable to generate new ID for pixmap";
        end if;

        cookie := xcb_composite_name_window_pixmap (c      => c,
                                                    window => win,
                                                    pixmap => pixmap);

        -- error := xcb_request_check (c, cookie);

        -- if error /= null then
            -- If off-screen pixmap isn't ready yet, just go ahead and bail.
            -- It might not be mapped yet, or some other weird situation.
        --     return;
        -- end if;
        -- Ada.Text_IO.Put_Line ("Blitting window " & win'Image);

        -- Determine color depth of window
        if geomWin.depth = 32 then
            glxPixmapAttr := glxPixmapAttrRGBA(0)'Access;
        else
            glxPixmapAttr := glxPixmapAttrRGB(0)'Access;
        end if;

        -- Need to bind to an intermediate GLX pixmap object first.
        -- Note: GLX documentation says attribList is unused, but example in the
        -- GLX_EXT_texture_from_pixmap document provides it.
        glxPixmap := GLX.glXCreatePixmap (dpy        => rend.display,
                                          config     => rend.fbConfig,
                                          the_pixmap => X11.Pixmap(pixmap),
                                          attribList => glxPixmapAttr);

        -- @TODO generate all the quads at once, load all textures at once, then
        -- index into the quad array for each window.
        GL.glGenTextures (1, tex'Access);
        GL.glBindTexture (GL.GL_TEXTURE_2D, tex);
        
        glXBindTexImageEXT (rend.display, glxPixmap, GLXext.GLX_FRONT_LEFT_EXT, null);

        GL.glTexParameteri (target => GL.GL_TEXTURE_2D,
                            pname  => GL.GL_TEXTURE_MIN_FILTER,
                            param  => GL.GL_LINEAR);

        GL.glTexParameteri (target => GL.GL_TEXTURE_2D,
                            pname  => GL.GL_TEXTURE_MAG_FILTER,
                            param  => GL.GL_LINEAR);

        -- Set up attribs/uniforms for shader program
        GLext.glGenBuffers (1, Render.Shaders.winVBO'Access);
        GLext.glEnableVertexAttribArray (GL.GLuint(Render.Shaders.winAttribCoord));
        GLext.glBindBuffer (target => GLext.GL_ARRAY_BUFFER,
                            buffer => Render.Shaders.winVBO);

        GLext.glVertexAttribPointer (index      => GL.GLuint(Render.Shaders.winAttribCoord),
                                     size       => 4,
                                     c_type     => GL.GL_FLOAT,
                                     normalized => GL.GL_FALSE,
                                     stride     => 0,
                                     pointer    => System.Null_Address);

        -- per-window Alpha to support transparent windows
        GLext.glUniform1f (Render.Shaders.winUniformAlpha, transparency);

        -- Draw quad. A little confusing since texture coords are (0,0) = bottom left
        dest := (
            1 => (winX,        winY + winH, 0.0, 1.0),   -- Bottom left
            2 => (winX,        winY,        0.0, 0.0),   -- Top left
            3 => (winX + winW, winY + winH, 1.0, 1.0),   -- Bottom right
            4 => (winX + winW, winY,        1.0, 0.0)    -- Top right
        );

        GLext.glBufferData (target => GLext.GL_ARRAY_BUFFER,
                            size   => dest'Size / 8,
                            data   => dest'Address,
                            usage  => GLext.GL_DYNAMIC_DRAW);

        GL.glDrawArrays (mode  => GL.GL_TRIANGLE_STRIP,
                         first => 0,
                         count => Interfaces.C.int(dest'Last));

        -- Cleanup
        glXReleaseTexImageEXT (rend.display, glxPixmap, GLXext.GLX_FRONT_LEFT_EXT);

        GLext.glDisableVertexAttribArray (GL.GLuint(Render.Shaders.winAttribCoord));
        GLext.glDeleteBuffers (1, Render.Shaders.winVBO'Access);

        GL.glDeleteTextures (1, tex'Access);
        GLX.glXDestroyPixmap (rend.display, glxPixmap);

        -- This is important. xcb_composite_name_window_pixmap_checked keeps the
        -- pixmap allocated until freed.
        cookie := xcb_free_pixmap (c, pixmap);

    end blitWindow;

    -------------------------------------------------------------------------------
    -- renderScene
    -- Copy the off-screen buffers of all windows into the overlay window.
    --
    -- @TODO track damage and re-render only as necessary?
    --
    -- See http://developer.download.nvidia.com/opengl/specs/GLX_EXT_texture_from_pixmap.txt
    -------------------------------------------------------------------------------
    procedure renderScene (c    : access xcb.xcb_connection_t;
                           rend : Render.Renderer) is
        use xcb;
        use xproto;

        glxRet : int;
        cookie : xcb_void_cookie_t;

        geomScene  : xcb_get_geometry_reply_t;  -- geometry of the overlay window
        sceneW     : Float;
        sceneH     : Float;
        orthoM     : Render.Util.Mat4;
    begin
        -- To ensure all window pixmaps are in a coherent state, and not mid-copy:
        -- receive request for compositing
        -- cookie := xcb_grab_server (c);

        -- perform rendering/compositing
        glxRet := GLX.glXMakeContextCurrent (dpy  => rend.display,
                                             draw => sceneDrawable,
                                             read => sceneDrawable,
                                             ctx  => rend.context);

        GLext.glUseProgram (Render.Shaders.winShaderProg);

        -- Set up projection
        geomScene := Util.getWindowGeometry (c, sceneWindow);
        sceneW    := Float(geomScene.width);
        sceneH    := Float(geomScene.height);
        orthoM    := Render.Util.ortho (0.0, sceneW, sceneH, 0.0, -1.0, 1.0);

        GLext.glUniformMatrix4fv (location  => Render.Shaders.winUniformOrtho,
                                  count     => 1,
                                  transpose => GL.GL_TRUE,
                                  value     => orthoM(1)'Access);

        GL.glViewport (x      => 0,
                       y      => 0,
                       width  => GL.GLsizei(sceneW),
                       height => GL.GLsizei(sceneH));

        if glxRet = 0 then
            Ada.Text_IO.Put_Line ("Troodon: (Compositor) blitAll - Unable to make context current");
        end if;

        GLX.glXWaitX; -- Complete X work prior to GL call

        GL.glClearColor (red   => 0.7,
                         green => 0.7,
                         blue  => 0.0,
                         alpha => 1.0);

        GL.glClear (GL.GL_COLOR_BUFFER_BIT);

        -- Always blit the desktop first.
        blitWindow (c, rend, Desktop.getWindow);

        -- need to switch shader programs here.
        -- GLext.glUseProgram (Render.Shaders.shadowShaderProg);
        --drawShadows (c, rend, winStack);
        -- GLext.glUseProgram (Render.Shaders.winShaderProg);

        -- blitWindows (c, rend);
        for win of winStack loop
            GLext.glUseProgram (Render.Shaders.shadowShaderProg);
            GLext.glUniformMatrix4fv (location  => Render.Shaders.shadowUniformOrtho,
                                      count     => 1,
                                      transpose => GL.GL_TRUE,
                                      value     => orthoM(1)'Access);

            GLext.glUniform4f (location => Render.Shaders.shadowUniformColor,
                               v0       => 0.0,
                               v1       => 0.0,
                               v2       => 0.0,
                               v3       => 0.5);

            GLext.glUniform1f (location => Render.Shaders.shadowUniformScreenH,
                               v0       => sceneH);

            drawShadow (c, rend, win);
            
            GLext.glUseProgram (Render.Shaders.winShaderProg);
            GLext.glUniformMatrix4fv (location  => Render.Shaders.winUniformOrtho,
                                      count     => 1,
                                      transpose => GL.GL_TRUE,
                                      value     => orthoM(1)'Access);

            blitWindow (c, rend, win);
        end loop;

        GLX.glXSwapBuffers (rend.display, sceneDrawable);
        GLext.glUseProgram (0);
 
        -- cookie := xcb_ungrab_server (c);

    end renderScene;
end Compositor;