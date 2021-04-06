with xcb; use xcb;

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

    procedure initCompositor(c    : access xcb_connection_t;
                             rend : Render.Renderer);
end Compositor;
