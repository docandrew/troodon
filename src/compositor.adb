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
with xcb;
with xcb_xfixes;
with xcb_shape;
with xproto;
with xcb_composite;

with Render;
with Render.Shaders;
with Render.Util;
with Setup;
with Util;

package body Compositor is

    type OverlayReplyPtr is access all xcb_composite.xcb_composite_get_overlay_window_reply_t;
    
    -- If supported, the GLX_EXT_texture_from_pixmap extension should be a
    -- faster way to get the XComposite off-screen buffer into a texture that
    -- we can render.
    fastTexFromPixmap     : Boolean := False;
    glXBindTexImageEXT    : GLXext.PFNGLXBINDTEXIMAGEEXTPROC;
    glXReleaseTexImageEXT : GLXext.PFNGLXRELEASETEXIMAGEEXTPROC;

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
            raise CompositorException with "Attempted to bring non-existent window to top of render stack";
        end if;
    end deleteWindow;

    ---------------------------------------------------------------------------
    -- bringToTop
    ---------------------------------------------------------------------------
    procedure bringToTop (win : xproto.xcb_window_t) is
        use WindowStack;
    begin
        deleteWindow (win);
        winStack.append (win);
    end bringToTop;

    ---------------------------------------------------------------------------
    -- createGLOverlay
    -- Given a overlay window from the X Composite extension and the OpenGL
    -- Renderer, create a GLX window that we can composite images to.
    --
    -- @TODO some overlap here between this and Frames.createOpenGLSurface,
    --  could probably avoid some repetition.
    ---------------------------------------------------------------------------
    procedure createGLOverlay(c          : access xcb_connection_t;
                              rend       : Render.Renderer;
                              overlayWin : xproto.xcb_window_t) is
        glxWindow : GLX.GLXWindow;
        drawable  : GLX.GLXDrawable;
        glxRet    : int;
    begin

        glxWindow := GLX.glXCreateWindow (dpy        => rend.display,
                                          config     => rend.fbConfig,
                                          win        => Interfaces.C.unsigned_long(overlayWin),
                                          attribList => null);

        if glxWindow = 0 then
            raise CompositorException with "Troodon: (compositor) Failed to create OpenGL overlay window";
        end if;

        drawable := GLX.GLXDrawable (glxWindow);

        glxRet := GLX.glXMakeContextCurrent (dpy  => rend.display,
                                             draw => drawable,
                                             read => drawable,
                                             ctx  => rend.context);

        if glxRet = 0 then
            raise CompositorException with "Troodon: (compositor) Failed to make GLX context current.";
        end if;

        Compositor.overlayWindow   := overlayWin;
        Compositor.overlayDrawable := drawable;
    end createGLOverlay;

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

        cookieVersion : xcb_xfixes_query_version_cookie_t;
        replyVersion  : access xcb_xfixes_query_version_reply_t;
        -- errorVers   : access xcb_generic_error_t;
    begin
        -- Need to explicitly query the XFixes version here, otherwise the create_region call fails.
        cookieVersion := xcb_xfixes_query_version (c                    => c,
                                                   client_major_version => 5,
                                                   client_minor_version => 0);

        replyVersion := xcb_xfixes_query_version_reply (c      => c,
                                                        cookie => cookieVersion,
                                                        e      => error'Address);

        if error /= null then
            raise CompositorException with "Error getting XFixes version, " & error.error_code'Image
                    & " response type:" & error.response_type'Image
                    & " major:"         & error.major_code'Image 
                    & " minor:"         & error.minor_code'Image
                    & " resource:"      & error.resource_id'Image
                    & " sequence:"      & error.sequence'Image;
        end if;

        --Ada.Text_IO.Put_Line ("XFixes version info:" & replyVers.major_version'Image & "." & replyVers.minor_version'Image);

        -- Create the region
        region := xcb_xfixes_region_t(xcb_generate_id (c));

        -- Ada.Text_IO.Put_Line ("Troodon: (compositor) Created new region ID:" & region'Image);

        cookie := xcb_xfixes_create_region_checked (c              => c,
                                                    region         => region,
                                                    rectangles_len => 0,
                                                    rectangles     => null);

        -- Ada.Text_IO.Put_Line ("Troodon: (compositor) Create Region sequence#" & cookie.sequence'Image);

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
    -- initCompositor
    -- Check for the X Composite extension and, if available, request an
    -- overlay window from the X server.
    ---------------------------------------------------------------------------
    procedure initCompositor(c    : access xcb_connection_t;
                             rend : Render.Renderer) is
        use GLXext;
        use xcb;
        use xproto;
        use xcb_composite;
        use Render;

        cookie     : xcb_void_cookie_t;
        error      : access xcb_generic_error_t;
        composite  : access constant xcb_query_extension_reply_t;
        root       : xcb_window_t := Setup.getRootWindow (c);
        updateMode : Interfaces.C.unsigned_char;
        
        cookieOvly : xcb_composite_get_overlay_window_cookie_t;
        replyOvly  : OverlayReplyPtr;

        -- Procedure name in C format for glxGetProcAddress
        procName1   : Interfaces.C.char_array := Interfaces.C.To_C ("glXBindTexImageEXT");
        procName2   : Interfaces.C.char_array := Interfaces.C.To_C ("glXReleaseTexImageEXT");

        procedure free is new Ada.Unchecked_Deallocation (Object => xcb_composite_get_overlay_window_reply_t,
                                                          Name   => OverlayReplyPtr);

        function toBindProc is new Ada.Unchecked_Conversion (Source => GLX.uu_GLXextFuncPtr,
                                                             Target => GLXext.PFNGLXBINDTEXIMAGEEXTPROC);

        function toReleaseProc is new Ada.Unchecked_Conversion (Source => GLX.uu_GLXextFuncPtr,
                                                                Target => GLXext.PFNGLXRELEASETEXIMAGEEXTPROC);
    begin
        composite := xcb_get_extension_data (c, xcb_composite_id'Access);

        if composite.present /= 0 then
            Ada.Text_IO.Put_Line ("Troodon: (compositor) Composite Extension Present.");
        end if;

        -- @TODO probably want to grab server before doing this or do this in Setup while
        -- we have it grabbed.
        -- If we don't have an OpenGL renderer, just let the server do basic compositing.
        if rend.kind = Render.OPENGL then
            Ada.Text_IO.Put_Line ("Troodon: (compositor) Using manual redirection w/ OpenGL");
            updateMode := xcb_composite_redirect_t'Pos(XCB_COMPOSITE_REDIRECT_MANUAL);
        else
            Ada.Text_IO.Put_Line ("Troodon: (compositor) Using automatic redirection");
            updateMode := xcb_composite_redirect_t'Pos(XCB_COMPOSITE_REDIRECT_AUTOMATIC);
        end if;

        -- Instruct the X Server to redirect all window output to off-screen buffers.
        cookie := xcb_composite_redirect_subwindows_checked (c      => c,
                                                             window => root,
                                                             update => updateMode);

        error := xcb_request_check (c, cookie);

        if error /= null then
            Ada.Text_IO.Put_Line ("Troodon: (compositor) Error redirecting subwindows:" & error.error_code'Image);
            raise CompositorException with "Failed to redirect subwindows";
        end if;

        if rend.kind = Render.OpenGL then
            cookieOvly := xcb_composite_get_overlay_window (c, root);
            replyOvly  := xcb_composite_get_overlay_window_reply (c, cookieOvly, error'Address);

            if error /= null then
                Ada.Text_IO.Put_Line ("Troodon: (compositor) Error getting overlay window:" & error.error_code'Image);
            end if;

            Ada.Text_IO.Put_Line ("Troodon: (compositor) Received overlay window:" & replyOvly.overlay_win'Image);

            createGLOverlay (c, rend, replyOvly.overlay_win);

            -- Set overlay as pass-through. If we're using server-side compositing we don't
            -- need to do this.
            allowInputPassthrough (c, replyOvly.overlay_win);

            -- Attempt to get GLX_EXT_texture_from_pixmap extension.
            glXBindTexImageEXT    := toBindProc (GLX.glXGetProcAddress (procName1(0)'Access));
            glXReleaseTexImageEXT := toReleaseProc (GLX.glXGetProcAddress (procName2(0)'Access));

            if glXBindTexImageEXT = null or glXReleaseTexImageEXT = null then
                raise CompositorException with "Failed to get glXBindTexImageEXT procedure";
            end if;

            free (replyOvly);
        end if;

    end initCompositor;

    ---------------------------------------------------------------------------
    -- blitWindow
    -- @TODO we should buffer all the window quads at once, then just call
    -- glDrawArrays here.
    ---------------------------------------------------------------------------
    procedure blitWindow (c    : access xcb.xcb_connection_t;
                          rend : Render.Renderer;
                          win  : xproto.xcb_window_t) is
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

        geomOvly   : xcb_get_geometry_reply_t;  -- geometry of the overlay window
        ovlyW      : Float;
        ovlyH      : Float;

        orthoM     : Render.Util.Mat4;
        
        -- Pixmap info from XCB
        cookie : xcb_void_cookie_t;
        error  : access xcb_generic_error_t;
        pixmap : xcb_pixmap_t;

        -- GLX Pixmap/Texture vars
        Type GlXPixmapAttrList is array (Natural range <>) of aliased Interfaces.C.int;

        glxPixmapAttr : GLXPixmapAttrList := (
            GLXext.GLX_TEXTURE_TARGET_EXT, GLXext.GLX_TEXTURE_2D_EXT,
            GLXext.GLX_TEXTURE_FORMAT_EXT, GLXext.GLX_TEXTURE_FORMAT_RGBA_EXT,
            0);
        
        glxPixmap : GLX.GLXPixmap;

        tex       : aliased GL.GLuint;
        
        -- Destination quad to which the window shall be rendered
        dest   : Render.Util.Box;
    begin
        --Ada.Text_IO.Put_Line ("Blitting window " & win'Image);

        -- Get window geometry
        geomWin := Util.getWindowGeometry (c, win);

        winX := Float(geomWin.x);
        winY := Float(geomWin.y);
        winW := Float(geomWin.width);
        winH := Float(geomWin.height);

        geomOvly := Util.getWindowGeometry (c, overlayWindow);

        ovlyW := Float(geomOvly.width);
        ovlyH := Float(geomOvly.height);

        -- Set up projection
        orthoM := Render.Util.ortho (0.0, ovlyW, ovlyH, 0.0, -1.0, 1.0);

        -- Get pixbuf of window's off-screen storage. We have to perform this step
        -- because a window's size may have changed between blits.
        pixmap := xcb_pixmap_t(xcb_generate_id (c));

        if pixmap = 0 then
            raise CompositorException with "Unable to generate new ID for pixmap";
        end if;

        cookie := xcb_composite_name_window_pixmap_checked (c      => c,
                                                            window => win,
                                                            pixmap => pixmap);

        error := xcb_request_check (c, cookie);

        if error /= null then
            -- If off-screen pixmap isn't ready yet, just go ahead and bail.
            return;
            --raise CompositorException with "Failed to get off-screen pixmap for window " & win'Image & "from X Composite extension, error:" & error.error_code'Image;
        end if;

        -- Need to bind to an intermediate GLX pixmap object first.
        -- Note: GLX documentation says attribList is unused, but example in the
        -- GLX_EXT_texture_from_pixmap document provides it.
        glxPixmap := GLX.glXCreatePixmap (dpy        => rend.display,
                                          config     => rend.fbConfig,
                                          the_pixmap => X11.Pixmap(pixmap),
                                          attribList => glxPixmapAttr(0)'Access);

        GLext.glUseProgram (Render.Shaders.winShaderProg);

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
        GLext.glUniformMatrix4fv (location  => Render.Shaders.winUniformOrtho,
                                  count     => 1,
                                  transpose => GL.GL_TRUE,
                                  value     => orthoM(1)'Access);

        GL.glViewport (x      => 0,
                       y      => 0,
                       width  => GL.GLsizei(geomOvly.width),
                       height => GL.GLsizei(geomOvly.height));

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

        glXReleaseTexImageEXT (rend.display, glxPixmap, GLXext.GLX_FRONT_LEFT_EXT);

        GLext.glDisableVertexAttribArray (GL.GLuint(Render.Shaders.winAttribCoord));

        GLext.glUseProgram (0);
    end blitWindow;

    -------------------------------------------------------------------------------
    -- blitAll
    -- Copy the off-screen buffers of all windows into the overlay window.
    --
    -- @TODO track damage and re-render only as necessary?
    --
    -- See http://developer.download.nvidia.com/opengl/specs/GLX_EXT_texture_from_pixmap.txt
    -------------------------------------------------------------------------------
    procedure blitAll (c    : access xcb.xcb_connection_t;
                       rend : Render.Renderer) is
        glxRet : int;
    begin
        -- To ensure all window pixmaps are in a coherent state, and not mid-copy:
        --
        -- receive request for compositing
        -- grab server
        -- glXWaitX? (to avoid screen tearing I think)

        -- perform rendering/compositing
        glxRet := GLX.glXMakeContextCurrent (dpy  => rend.display,
                                             draw => overlayDrawable,
                                             read => overlayDrawable,
                                             ctx  => rend.context);

        GL.glClearColor (red   => 0.7,
                         green => 0.7,
                         blue  => 0.0,
                         alpha => 1.0); --FRAME_BG_GL.a);

        GL.glClear (GL.GL_COLOR_BUFFER_BIT);

        for win of winStack loop
            blitWindow (c, rend, win);
        end loop;

        GLX.glXSwapBuffers (rend.display, overlayDrawable);

        -- ungrab server
    end blitAll;
end Compositor;