with bits_stdint_uintn_h;
with GLX;
with Xlib;
with xcb;
with xcb_damage;
with xcb_ewmh;
with xproto;

package Setup is

    -- Thrown if there's a fatal error during the initialization process.
    SetupException : exception;

    type connectionPtr is access xcb.xcb_connection_t;
   
    -- Contains atom values for EWMH properties if EWMH is available.
    ewmh : access xcb_ewmh.xcb_ewmh_connection_t := null;

    -- Base event # from the Damage extension.
    DAMAGE_EVENT : bits_stdint_uintn_h.uint8_t;

    -- ID used to refer to damage
    damage : xcb_damage.xcb_damage_damage_t;

    -- Keep visual ID's with desired color depths that we can use to create
    -- windows.
    -- visual24 : xproto.xcb_visualid_t;
    -- visual32 : xproto.xcb_visualid_t;

    ---------------------------------------------------------------------------
    -- initExtensions
    -- Make sure all X protocol extensions needed by Troodon are present.
    -- Raise SetupException is anything required is missing.
    ---------------------------------------------------------------------------
    procedure initExtensions (c : access xcb.xcb_connection_t);

    function initXlib return access Xlib.Display;
    function initXcb (display : not null access Xlib.Display) return access xcb.xcb_connection_t;
    
    procedure initDamage (connection : access xcb.xcb_connection_t);
    procedure initEwmh (connection : access xcb.xcb_connection_t);

    function getScreen (connection : access xcb.xcb_connection_t) return access xproto.xcb_screen_t;
    function getRootWindow (connection : access xcb.xcb_connection_t) return xproto.xcb_window_t;

end Setup;
