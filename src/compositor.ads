with xcb; use xcb;

package Compositor is
    CompositorException : exception;

    procedure initCompositor(c : access xcb_connection_t);
end Compositor;