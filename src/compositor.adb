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

        Compositor.overlayWindow := overlayWin;
        Compositor.overlayDrawable := drawable;
    end createGLOverlay;

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

        cookie := xcb_composite_redirect_subwindows_checked (c      => c,
                                                             window => root,
                                                             update => updateMode);


        error := xcb_request_check (c, cookie);

        if error /= null then
            Ada.Text_IO.Put_Line ("Troodon: (compositor) Error redirecting subwindows:" & error.error_code'Image);
            raise CompositorException with "Failed to redirect subwindows";
        end if;

        if rend.kind = Render.OpenGL then
            -- @TODO note if we can get the GLX context here, we don't need to do that check in Frame anymore
            cookieOvly := xcb_composite_get_overlay_window (c, root);
            replyOvly  := xcb_composite_get_overlay_window_reply (c, cookieOvly, error'Address);

            if error /= null then
                Ada.Text_IO.Put_Line ("Troodon: (compositor) Error getting overlay window:" & error.error_code'Image);
            end if;

            Ada.Text_IO.Put_Line ("Troodon: (compositor) Received overlay window:" & replyOvly.overlay_win'Image);

            createGLOverlay (c, rend, replyOvly.overlay_win);

            free (replyOvly);

            -- Attempt to get GLX_EXT_texture_from_pixmap extension.
            glXBindTexImageEXT    := toBindProc (GLX.glXGetProcAddress (procName1(0)'Access));
            glXReleaseTexImageEXT := toReleaseProc (GLX.glXGetProcAddress (procName2(0)'Access));

            if glXBindTexImageEXT = null or glXReleaseTexImageEXT = null then
                raise CompositorException with "Failed to get glXBindTexImageEXT procedure";
            end if;
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
        glxRet := GLX.glXMakeContextCurrent (dpy  => rend.display,
                                             draw => overlayDrawable,
                                             read => overlayDrawable,
                                             ctx  => rend.context);

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
            raise CompositorException with "Failed to get off-screen pixmap from X Composite extension, error:" & error.error_code'Image;
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

        -- Presumably glXBindTexImageEXT takes the place of this call?
        -- -- Copy to texture2D
        -- GL.glTexImage2D (target         => GL.GL_TEXTURE_2D,
        --                  level          => 0,
        --                  internalFormat => GL.GL_RGBA,
        --                  width          => GL.GLsizei(geom.width),
        --                  height         => GL.GLsizei(geom.height),
        --                  border         => 0,
        --                  format         => GL.GL_RGBA,
        --                  c_type         => GL.GL_UNSIGNED_BYTE,
        --                  pixels         => g.bitmap.buffer);

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

        GLX.glXSwapBuffers (rend.display, overlayDrawable);

        glXReleaseTexImageEXT (rend.display, glxPixmap, GLXext.GLX_FRONT_LEFT_EXT);

        GLext.glDisableVertexAttribArray (GL.GLuint(Render.Shaders.winAttribCoord));

        GLext.glUseProgram (0);
    end blitWindow;

    -------------------------------------------------------------------------------
    -- blitAll
    -- Copy the off-screen buffers of all windows into the overlay window.
    --
    -- @TODO we're going to need a list of all windows
    -- @TODO track damage and re-render only as necessary?
    --
    -- See http://developer.download.nvidia.com/opengl/specs/GLX_EXT_texture_from_pixmap.txt
    -------------------------------------------------------------------------------
    procedure blitAll (c    : access xcb.xcb_connection_t;
                       rend : Render.Renderer) is
    begin
        null;
        -- To ensure all window pixmaps are in a coherent state, and not mid-copy:
        --
        -- receive request for compositing
        -- grab server
        -- glXWaitX?
        -- glxBindTexImageEXT (blitWindow)
        -- perform rendering/compositing
        -- glxReleaseTexImageEXT (blitWindow)
        -- ungrab server
    end blitAll;
end Compositor;