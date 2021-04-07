with xcb; use xcb;
with xproto;

with GLX;
with Render;

-------------------------------------------------------------------------------
-- Compositor
-- Troodon is a compositing window manager, this package sets up the X
-- Composite extension and requests an overlay window with a GLX context that
-- we can render each window's off-screen pixbuf to.
--
-- Note that if software rendering is used, this defaults to the X Server's
-- default compositing functionality.
-------------------------------------------------------------------------------
package Compositor is
    
    CompositorException : exception;
    
    overlayWindow   : xproto.xcb_window_t;
    overlayDrawable : GLX.GLXDrawable;

    ---------------------------------------------------------------------------
    -- addWindow
    -- Add a window to our scene at the top of the rendering stack.
    ---------------------------------------------------------------------------
    procedure addWindow (win : xproto.xcb_window_t);

    ---------------------------------------------------------------------------
    -- deleteWindow
    -- Remove the given window from our rendering stack.
    ---------------------------------------------------------------------------
    procedure deleteWindow (win : xproto.xcb_window_t);

    ---------------------------------------------------------------------------
    -- bringToTop
    -- Raise the given window to the top of the rendering stack.
    ---------------------------------------------------------------------------
    procedure bringToTop (win : xproto.xcb_window_t);

    ---------------------------------------------------------------------------
    -- initCompositor
    -- Initialize the compositor
    ---------------------------------------------------------------------------
    procedure initCompositor (c    : access xcb.xcb_connection_t;
                              rend : Render.Renderer);

    ---------------------------------------------------------------------------
    -- blitWindow
    -- Take the off-screen pixbuf of a window and draw it to the overlay
    ---------------------------------------------------------------------------
    procedure blitWindow (c    : access xcb.xcb_connection_t;
                          rend : Render.Renderer;
                          win  : xproto.xcb_window_t);

    -------------------------------------------------------------------------------
    -- blitAll
    -- Copy the off-screen buffers of all windows into the overlay window.
    -------------------------------------------------------------------------------
    procedure blitAll (c    : access xcb.xcb_connection_t;
                       rend : Render.Renderer);
end Compositor;
