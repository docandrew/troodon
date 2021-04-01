with Ada.Text_IO;
with Ada.Unchecked_Deallocation;
with GNAT.OS_Lib;
with System; use System;

with Xlib;
with Xlib_xcb;
with xcb; use xcb;
with xproto; use xproto;
with xcb_ewmh; use xcb_ewmh;

with GLX;

with Interfaces;
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;

with util; use util;

package body setup is
    ewmhObj : aliased xcb_ewmh_connection_t;

    ---------------------------------------------------------------------------
    -- initEwmh
    -- Set up the Extended Window Manager Hints connection
    -- setup.emwh will be non-null if this succeeds.
    ---------------------------------------------------------------------------
    procedure initEwmh(connection : access xcb_connection_t) is
        --ewmhConn : aliased xcb_ewmh_connection_t;
        ewmhCookie : aliased access xcb_intern_atom_cookie_t;
        ewmhError : aliased access xcb_generic_error_t;
        ignore : Interfaces.C.unsigned_char;
        ignore2 : Interfaces.C.int;
    begin
        ewmhCookie := xcb_ewmh_init_atoms(connection, ewmhObj'Access);
        ignore := xcb_ewmh_init_atoms_replies(ewmhObj'Access, ewmhCookie, ewmhError'Address);

        if ewmhError /= null then
            Ada.Text_IO.Put_Line("Error getting ewmh init atoms, error code:" & ewmhError.error_code'Image);
        else
            ewmh := ewmhObj'Access;
            Ada.Text_IO.Put_Line("Received Extended Window Manager Hints Connection");
            Ada.Text_IO.Put_Line("Atom values: ");
            Ada.Text_IO.Put_Line("_NET_WM_NAME: " & ewmh.u_NET_WM_NAME'Image);
        end if;

        --ignore2 := xcb_flush(connection);

    end initEwmh;

    ---------------------------------------------------------------------------
    -- grabMouse
    ---------------------------------------------------------------------------
    procedure grabMouse(connection : access xcb_connection_t) is
        mouseCookie : xcb_void_cookie_t;
        rootWindow : xcb_window_t := setup.getRootWindow(connection);
        dummy : Interfaces.C.int;
    begin
        Ada.Text_IO.Put_Line("Grabbing mouse inputs for root window:" & rootWindow'Image);
        -- Snag mouse button bindings
        -- @TODO may be able to remove this code when we grab events in each frame window

        -- grab button 1 (left click)
        mouseCookie :=
           xcb_grab_button_checked
              (c             => connection,
               owner_events  => 0,
               grab_window   => rootWindow,
               event_mask    => unsigned_short (XCB_EVENT_MASK_BUTTON_PRESS or XCB_EVENT_MASK_BUTTON_RELEASE),
               pointer_mode  => xcb_grab_mode_t'Pos (XCB_GRAB_MODE_ASYNC),
               keyboard_mode => xcb_grab_mode_t'Pos (XCB_GRAB_MODE_ASYNC),
               confine_to    => rootWindow,
               cursor        => XCB_NONE,
               button        => 1,
               modifiers     => unsigned_short (XCB_MOD_MASK_ANY));
        checkFatal(connection, mouseCookie, "Unable to grab mouse inputs");

        -- grab button 3 (right click)
        mouseCookie :=
           xcb_grab_button_checked
              (c             => connection,
               owner_events  => 0,
               grab_window   => rootWindow,
               event_mask    => unsigned_short (XCB_EVENT_MASK_BUTTON_PRESS or XCB_EVENT_MASK_BUTTON_RELEASE),
               pointer_mode  => xcb_grab_mode_t'Pos (XCB_GRAB_MODE_ASYNC),
               keyboard_mode => xcb_grab_mode_t'Pos (XCB_GRAB_MODE_ASYNC),
               confine_to    => rootWindow,
               cursor        => XCB_NONE,
               button        => 3,
               modifiers     => unsigned_short (XCB_MOD_MASK_ANY));
        checkFatal(connection, mouseCookie, "Unable to grab mouse inputs (2)");

        Ada.Text_IO.Put_Line("Grabbed mouse successfully.");
    end grabMouse;

    procedure grabKeyboard(connection : access xcb_connection_t) is
        keyCookie : xcb_grab_keyboard_cookie_t;

        type KeyReplyPtr is access all xcb_grab_keyboard_reply_t;
        procedure free is new Ada.Unchecked_Deallocation(Object => xcb_grab_keyboard_reply_t, Name => KeyReplyPtr);
        keyReply : KeyReplyPtr;

        rootWindow : xcb_window_t := setup.getRootWindow(connection);
        dummy : Interfaces.C.int;
    begin
        Ada.Text_IO.Put_Line("Grabbing keyboard inputs for root window:" & rootWindow'Image);

        keyCookie := xcb_grab_keyboard(c            => connection,
                                       owner_events => 1,
                                       grab_window  => rootWindow,
                                       time         => XCB_CURRENT_TIME,
                                       pointer_mode => xcb_grab_mode_t'Pos(XCB_GRAB_MODE_ASYNC),
                                       keyboard_mode => xcb_grab_mode_t'Pos(XCB_GRAB_MODE_ASYNC));

        keyReply := keyReplyPtr(xcb_grab_keyboard_reply (c => connection,
                                             cookie => keyCookie,
                                             e => System.Null_Address));

        if keyReply /= null then
            if keyReply.status = xcb_grab_status_t'Pos(XCB_GRAB_STATUS_SUCCESS) then
                Ada.Text_IO.Put_Line("Grabbed keyboard successfully.");
            else
                Ada.Text_IO.Put_Line("Failed to grab keyboard.");
            end if;

            free(keyReply);
        end if;
    end grabKeyboard;

    ---------------------------------------------------------------------------
    -- initXlib
    -- Connect to X server and get Display
    ---------------------------------------------------------------------------
    function initXlib return access Xlib.Display is
        display : access Xlib.Display;
    begin
        -- For OpenGL rendering to work, we'll need to use Xlib initially.
        display := Xlib.XOpenDisplay(Interfaces.C.Strings.Null_Ptr);
        if display = null then
            Ada.Text_IO.Put_Line("Troodon: Unable to open display");
            return null;
        end if;

        Ada.Text_IO.Put_Line("Troodon: Connected to X Server");
        return display;
    end initXlib;
    
    ---------------------------------------------------------------------------
    -- initXcb
    -- Take control over the X Server connection and set up event handlers.
    -- @return connection if successful, null otherwise
    ---------------------------------------------------------------------------
    function initXcb(display : not null access Xlib.Display) return access xcb_connection_t is
        connection   : access xcb_connection_t;
        screenNumber : aliased int;
        screen       : access xcb_screen_t;
        cookie       : xcb_void_cookie_t;
        screenIter   : aliased xcb_screen_iterator_t;

        rootAttributes : aliased xcb_change_window_attributes_value_list_t;
        numScreens   : Natural := 0;
        
        ignore       : int;
    begin
        screenNumber := Xlib.XDefaultScreen(display);
        
        -- Get XCB connection from display. Have to use Xlib here for OpenGL.
        connection := Xlib_xcb.XGetXCBConnection(display);
        
        if connection = null then
            ignore := Xlib.XCloseDisplay(display);
            Ada.Text_IO.Put_Line("Unable to get XCB connection from Xlib.");
            return null;
        end if;

        if xcb_connection_has_error (connection) > 0 then
            Ada.Text_IO.Put_Line ("Could not open connection to X Server");
            return null;
        end if;

        Ada.Text_IO.Put_Line ("Troodon: Received XCB connection from Xlib");
        Ada.Text_IO.Put_Line (" Default screen # =" & screenNumber'Image);
        
        -- Acquire event queue ownership
        Xlib_xcb.XSetEventQueueOwner(display, Xlib_xcb.XCBOwnsEventQueue);

        -- Get info about screens, have to iterate through them to find ours, if
        --  there is more than one screen available.
        screenIter := xcb_setup_roots_iterator (xcb_get_setup (connection));

        -- Get first screen of connection
        while screenIter.c_rem >= 0 loop
            if screenNumber = 0 then
                numScreens := numScreens + 1;
                screen := screenIter.data;
                exit;
            end if;

            screenNumber := screenNumber - 1;
            numScreens := numScreens + 1;
            xcb_screen_next (screenIter'Access);
        end loop;

        Ada.Text_IO.Put_Line ("");
        Ada.Text_IO.Put_Line ("Found" & numScreens'Image & " screen(s)");
        Ada.Text_IO.Put_Line ("Information about screen" & screenNumber'Image);
        Ada.Text_IO.Put_Line (" width...........:" & screen.width_in_pixels'Image);
        Ada.Text_IO.Put_Line (" height..........:" & screen.height_in_pixels'Image);
        Ada.Text_IO.Put_Line (" white pixel.....:" & screen.white_pixel'Image);
        Ada.Text_IO.Put_Line (" black pixel.....:" & screen.black_pixel'Image);
        Ada.Text_IO.Put_Line (" Root Window.....:" & screen.root'Image);

        -- Make sure another window manager isn't running, and register for events
        -- which defines Troodon as _the_ window manager.
        cookie := xcb_grab_server (connection);

        rootAttributes.event_mask := XCB_EVENT_MASK_SUBSTRUCTURE_NOTIFY or     -- if additional screen plugged in
                                     XCB_EVENT_MASK_SUBSTRUCTURE_REDIRECT or   -- resize
                                     XCB_EVENT_MASK_POINTER_MOTION or
                                     XCB_EVENT_MASK_BUTTON_PRESS or
                                     XCB_EVENT_MASK_BUTTON_RELEASE or
                                     XCB_EVENT_MASK_STRUCTURE_NOTIFY;

        cookie := xcb_change_window_attributes_aux_checked(c  => connection,
                                                   window     => screen.root, 
                                                   value_mask => XCB_CW_EVENT_MASK,
                                                   value_list => rootAttributes'Access);

        checkFatal(connection, cookie, "Cannot start Troodon, another window manager is already running.");

        cookie := xcb_ungrab_server (connection);

        checkFatal(connection, cookie, "Cannot ungrab server.");

        --grabMouse(connection);
        --grabKeyboard(connection);

        return connection;
    end initXcb;


    ---------------------------------------------------------------------------
    -- initRendering
    -- attempt to get a GLX context we can use for accelerated drawing.
    -- @TODO fallback to software rendering
    ---------------------------------------------------------------------------


    ---------------------------------------------------------------------------
    -- getScreen
    -- on multimonitor setups, I think we'll want to specify the screen num here.
    ---------------------------------------------------------------------------
    function getScreen(connection : access xcb_connection_t) return access xcb_screen_t is
    begin
        return xcb_setup_roots_iterator (xcb_get_setup(connection)).data;
    end getScreen;

    ---------------------------------------------------------------------------
    -- getRootWindow
    ---------------------------------------------------------------------------
    function getRootWindow(connection : access xcb_connection_t) return xcb_window_t is
    begin
        return getScreen(connection).root;
    end getRootWindow;
end setup;
