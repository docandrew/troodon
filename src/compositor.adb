with Ada.Text_IO;
with Ada.Unchecked_Deallocation;
with Interfaces.C; use Interfaces.C;

with GLX;
with XLib;
with xcb;
with xproto;
with xcb_composite;

with Render;
with Setup;

package body Compositor is

    type OverlayReplyPtr is access all xcb_composite.xcb_composite_get_overlay_window_reply_t;
    
    overlayWindow   : xproto.xcb_window_t;
    overlayDrawable : GLX.GLXDrawable;

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

        procedure free is new Ada.Unchecked_Deallocation (Object => xcb_composite_get_overlay_window_reply_t,
                                                          Name   => OverlayReplyPtr);
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
        end if;

    end initCompositor;

end Compositor;