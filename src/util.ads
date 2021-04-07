with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Interfaces.C;
with Interfaces.C.Strings;
with System;

with xcb;     use xcb;
with xproto;  use xproto;

package Util is

    type errorPtr is access all xcb_generic_error_t;

    ---------------------------------------------------------------------------
    -- charsToUBS
    -- Given the address of a xcb string property reply and it's length, return
    -- an Unbounded_String with its contents.
    ---------------------------------------------------------------------------
    function charsToUBS (charPtr : System.Address; len : Interfaces.C.int) return Unbounded_String;
    -- function charsToUBS(charPtr : Interfaces.C.Strings.chars_ptr; len : Interfaces.C.unsigned) return Unbounded_String;

    procedure checkFatal (connection : access xcb_connection_t;
                          cookie     : xcb_void_cookie_t;
                          message    : String);

    function getStringProperty (connection : access xcb_connection_t;
                                window     : xcb_window_t;
                                name       : xcb_atom_t) return Unbounded_String;

    function getAtomProperty (connection   : access xcb_connection_t;
                              window       : xcb_window_t;
                              name         : xcb_atom_t) return xcb_atom_t;

    function getWindowGeometry (connection : access xcb_connection_t;
                                window     : xcb_window_t;
                                error      : out errorPtr) return xcb_get_geometry_reply_t;

    function getWindowGeometry (connection : access xcb_connection_t;
                                window     : xcb_window_t) return xcb_get_geometry_reply_t;
end Util;
