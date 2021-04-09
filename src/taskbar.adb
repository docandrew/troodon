with Ada.Text_IO;
with Ada.Unchecked_Deallocation;
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with System;

with xcb; use xcb;
with xproto; use xproto;

with events; use events;
with setup;
with util; use util;

-------------------------------------------------------------------------------
-- taskbar
-------------------------------------------------------------------------------
package body taskbar is

    TASKBAR_HEIGHT : constant := 32;
    TASKBAR_BG : constant := 16#FF77_7777#;

    ---------------------------------------------------------------------------
    -- clientConnect
    -- establishes a connection to the X server
    ---------------------------------------------------------------------------
    function clientConnect return access xcb_connection_t is
        screenNumber : aliased Interfaces.C.int;
        connection   : access xcb_connection_t;

    begin
        -- open connection to X server
        connection := xcb_connect (Null_Ptr, screenNumber'Access);

        if xcb_connection_has_error (connection) > 0 then
            Ada.Text_IO.Put_Line ("Taskbar: could not connect to server");
            return null;
        end if;

        Ada.Text_IO.Put_Line ("Taskbar: Connected to X Server!");
        Ada.Text_IO.Put_Line ("Taskbar:  Default screen # =" & screenNumber'Image);
        return connection;
    end clientConnect;

    ---------------------------------------------------------------------------
    -- taskbarEventLoop
    ---------------------------------------------------------------------------
    procedure taskbarEventLoop(connection : access xcb_connection_t) is
        procedure free is new Ada.Unchecked_Deallocation (Object => xcb_generic_event_t, Name => events.eventPtr);
        --focusedWindow : xcb_window_t;
        XCB_EVENT_MASK : constant := 2#0111_1111#;
        event : events.eventPtr;
        ignore : Interfaces.C.int;
    begin
        ignore := xcb_flush(connection);
        
        loop
            --Ada.Text_IO.Put_Line("Start Event Loop");
            event := events.eventPtr (xcb_wait_for_event (connection));
            exit when event = null;
            Ada.Text_IO.Put_Line("Taskbar: Received Event " & event.response_type'Image);

            case (event.response_type and XCB_EVENT_MASK) is
                when CONST_XCB_KEY_PRESS =>
                    Ada.Text_IO.Put_Line("Taskbar: keypress");
                when others =>
                    null;
            end case;
            free(event);
        end loop;

        Ada.Text_IO.Put_Line("Taskbar: Exiting.");
        xcb_disconnect (connection);
    end taskbarEventLoop;

    ---------------------------------------------------------------------------
    -- Taskbar component.
    --
    -- Troodon desktop environment components are Ada tasks running their own
    -- threads. This makes it easy to share information and is lightweight,
    -- avoiding process context-switching overhead and expensive IPC or clunky
    -- stdio piping between DE elements.
    ---------------------------------------------------------------------------
    task body Taskbar is
        -- Connect to X server
        connection  : access xcb_connection_t;
        screen      : access xcb_screen_t;
        window      : xcb_window_t;
        taskbarAttr : aliased xcb_create_window_value_list_t;
        cookie      : xcb_void_cookie_t;
        geom        : xcb_get_geometry_reply_t;
        ignore      : Interfaces.C.int;

        -- EWMH Properties
        wmType      : xcb_atom_t;
    begin
        accept Start;
        Ada.Text_IO.Put_Line("Taskbar: Starting.");

        connection  := clientConnect;
        screen      := xcb_setup_roots_iterator(xcb_get_setup(connection)).data;
        window      := xcb_generate_id(connection);

        Ada.Text_IO.Put_Line("Taskbar: Creating new window with id" & window'Image);

        -- We want the panel to run the full length of the screen, so query the
        -- root window geometry to figure out how big to make it.
        geom := util.getWindowGeometry(connection, screen.root);

        -- Set up the frame
        taskbarAttr.background_pixel := TASKBAR_BG;
        taskbarAttr.event_mask := XCB_EVENT_MASK_EXPOSURE;
        
        cookie :=
           xcb_create_window_aux(c              => connection,
                                 depth          => 32,
                                 wid            => window,
                                 parent         => screen.root,
                                 x              => 0,
                                 y              => short(geom.height - TASKBAR_HEIGHT),
                                 width          => geom.width, 
                                 height         => TASKBAR_HEIGHT,
                                 border_width   => 0,
                                 u_class        => xcb_window_class_t'Pos (XCB_WINDOW_CLASS_INPUT_OUTPUT), 
                                 visual         => screen.root_visual,
                                 value_mask     => XCB_CW_BACK_PIXEL or XCB_CW_EVENT_MASK,
                                 value_list     => taskbarAttr'Access);

        -- Set some window properties to let Troodon know we're a taskbar
        -- @TODO figure out what properties to set if EWMH not available
        if setup.ewmh /= null then
            wmType := setup.ewmh.u_NET_WM_WINDOW_TYPE_DOCK;
            Ada.Text_IO.Put_Line("Taskbar: Setting window type to docked");
            cookie := xcb_change_property(c        => connection, 
                                          mode     => unsigned_char(xcb_prop_mode_t'Pos(XCB_PROP_MODE_REPLACE)),
                                          window   => window,
                                          property => setup.ewmh.u_NET_WM_WINDOW_TYPE,
                                          c_type   => XCB_ATOM_ATOM,
                                          format   => 8,
                                          data_len => xcb_atom_t'Size / 8,
                                          data     => wmType'Address);
        end if;

        -- Make taskbar visible
        cookie := xcb_map_window_checked(connection, window);

        ignore := xcb_flush(connection);

        -- enter event loop
        taskbarEventLoop(connection);
    end Taskbar;
end taskbar;
