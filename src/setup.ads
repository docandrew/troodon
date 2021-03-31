
with GLX;
with Xlib;
with xcb;
with xcb_ewmh;
with xproto;

package setup is

    type connectionPtr is access xcb.xcb_connection_t;
   
    -- Contains atom values for EWMH properties if EWMH is available.
    ewmh : access xcb_ewmh.xcb_ewmh_connection_t := null;

    function initXlib return access Xlib.Display;
    function initXcb(display : not null access Xlib.Display) return access xcb.xcb_connection_t;



    procedure initEwmh(connection : access xcb.xcb_connection_t);

    function getScreen(connection : access xcb.xcb_connection_t) return access xproto.xcb_screen_t;
    function getRootWindow(connection : access xcb.xcb_connection_t) return xproto.xcb_window_t;

end setup;
