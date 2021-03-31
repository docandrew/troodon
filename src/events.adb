with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;
with Ada.Unchecked_Conversion;
with Ada.Unchecked_Deallocation;
with GNAT.OS_Lib;
with Interfaces; use Interfaces;
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with System;

with GL;
with GLX;
--with xcb_glx;
with xcb; use xcb;
with xproto; use xproto;

with frames;
with setup;
with util; use util;

package body events is

    focusedWindow : xcb_window_t;
    
    ---------------------------------------------------------------------------
    -- handleMapRequest
    ---------------------------------------------------------------------------
    procedure handleMapRequest (connection : access xcb_connection_t;
                                event      : eventPtr;
                                rend       : render.Renderer) is
        use frames;
        use render;

        type mapRequestPtr is access all xcb_map_request_event_t;
        mapRequestEvent : mapRequestPtr;

        dummyCookie : xcb_void_cookie_t;
        dummy       : int;

        -- mouseCookie : xcb_void_cookie_t;

        -- frame   : xcb_window_t;  -- parent window
        -- window  : xcb_window_t;  -- app window
        winType : xcb_atom_t := XCB_ATOM_NONE;    -- type of window, if set.
        title   : Unbounded_String := To_Unbounded_String ("");
        screen  : access xcb_screen_t;
        frameThis : Boolean := True;

        drawable : GLX.GLXDrawable := 0;

        -- type geomPtr is access all xcb_get_geometry_reply_t;
        -- geom : geomPtr;
        geom : xcb_get_geometry_reply_t;

        frameValueMask : Interfaces.C.unsigned :=
            (if rend.kind = render.SOFTWARE then 
                XCB_CW_BORDER_PIXEL or XCB_CW_BACK_PIXEL or XCB_CW_EVENT_MASK
             else
                XCB_CW_BORDER_PIXEL or XCB_CW_BACK_PIXEL or XCB_CW_EVENT_MASK or XCB_CW_COLORMAP);

        frameCreateAttributes : aliased xcb_create_window_value_list_t :=
            (if rend.kind = render.SOFTWARE then
                (others => <>)
             else
                (colormap => rend.colormap, others => <>));

        function toMapEvent is new Ada.Unchecked_Conversion (Source => eventPtr, Target => mapRequestPtr);
    begin
        Ada.Text_IO.Put_Line("Enter handleMapRequest");
        mapRequestEvent := toMapEvent (event);

        -- See if the map event is for a frame we've already created.
        if isFrame(mapRequestEvent.window) then
            -- If so, go ahead and map it as-is.
            declare
                F : Frame := getFrameFromList(mapRequestEvent.window);
            begin
                F.map;
                return;
            end;
        end if;

        -- If not, is this for an app window we've already framed?
        if hasFrame(mapRequestEvent.window) then
            -- If so, go ahead and get its frame and map it.
            getFrameOfWindow(mapRequestEvent.window).map;
            return;
        end if;

        -- If EWMH in use, and this window sets the _NET_WM_WINDOW_TYPE property, honor that here,
        -- map the window without framing.
        if setup.ewmh /= null then
            winType := getAtomProperty(connection, mapRequestEvent.window, setup.ewmh.u_NET_WM_WINDOW_TYPE);

            -- if a dock, then map this as-is.
            -- @TODO keep this top-level?
            -- @TODO grab inputs?
            -- @TODO check for other types of unframed windows (certain dialogs, etc.)
            if winType = setup.ewmh.u_NET_WM_WINDOW_TYPE_DOCK then
                frameThis := False;
                Ada.Text_IO.Put_Line("Troodon: mapping docked window");
                dummyCookie := xcb_map_window (c => connection, window => mapRequestEvent.window);
                return;
            end if;
        end if;

        -- This is for an app whose frame doesn't exist yet, so create a new one
        -- and map it and its child.
        declare
            F : Frame := frameWindow(connection, mapRequestEvent.window, rend);
        begin
            F.map;
        end;

    end handleMapRequest;

    ---------------------------------------------------------------------------
    -- handleConfigureRequest
    ---------------------------------------------------------------------------
    procedure handleConfigureRequest (connection : access xcb_connection_t; event : eventPtr) is

        type configureRequestPtr is access all xcb_configure_request_event_t;
        configureRequestEvent : configureRequestPtr;

        windowAttributes : aliased xcb_configure_window_value_list_t;

        dummyCookie : xcb_void_cookie_t;
        dummy       : int;

        function toConfigureEvent is new Ada.Unchecked_Conversion (Source => eventPtr, Target => configureRequestPtr);
    begin
        Ada.Text_IO.Put_Line("enter handleConfigurationRequest");
        configureRequestEvent := toConfigureEvent (event);

        -- @TODO, see if a frame is being configured, and if so, make sure we update
        -- the frame's internal width/height also.

        windowAttributes.x            := int (configureRequestEvent.x);
        windowAttributes.y            := int (configureRequestEvent.y);
        windowAttributes.width        := unsigned (configureRequestEvent.width);
        windowAttributes.height       := unsigned (configureRequestEvent.height);
        -- ignore window's border width, since we frame it ourselves.
        windowAttributes.border_width := 0; --unsigned (configureRequestEvent.border_width);
        windowAttributes.sibling      := configureRequestEvent.sibling;
        windowAttributes.stack_mode   := unsigned (configureRequestEvent.stack_mode);

        dummyCookie :=
           xcb_configure_window_aux(c           => connection,
                                    window      => configureRequestEvent.window,
                                    value_mask  => configureRequestEvent.value_mask,
                                    value_list  => windowAttributes'Access);

        Ada.Text_IO.Put_Line ("Configuring window" & configureRequestEvent.window'Image);

        dummy := xcb_flush (connection);
        Ada.Text_IO.Put_Line("exit handleConfigurationRequest");
    end handleConfigureRequest;

    ---------------------------------------------------------------------------
    -- handleButtonPress
    -- Notes: if our mouse notifications are coming from root window (because
    --  we called grabMouse there), then buttonEvent.child will have the
    --  window we clicked on. Unless we clicked on empty space, in which case
    --  it will crash. If our mouse notifications are coming from an app window,
    --  there's no child, and it will crash.
    ---------------------------------------------------------------------------
    procedure handleButtonPress (connection : access xcb_connection_t; event : eventPtr) is
        use ASCII;
    
        type buttonEventPtr is access all xcb_button_press_event_t;
        
        buttonEvent : buttonEventPtr;
        cookie      : xcb_void_cookie_t;
        ignore      : Interfaces.C.int;
        focusWin    : xcb_window_t;

        function toButtonEvent is new Ada.Unchecked_Conversion (Source => events.eventPtr, Target => buttonEventPtr);
        function toCharsPtr is new Ada.Unchecked_Conversion (Source => events.eventPtr, Target => Interfaces.C.Strings.chars_ptr);

        -- Raise window to top of stack
        procedure raiseToTop (connection : access xcb_connection_t; win : xcb_window_t) is
            winAttr : aliased xcb_configure_window_value_list_t;
            cookie : xcb_void_cookie_t;
            ignore : Interfaces.C.int;
        begin
            winAttr.stack_mode := xcb_stack_mode_t'Pos (XCB_STACK_MODE_ABOVE);
            cookie := xcb_configure_window_aux(c          => connection, 
                                               window     => win,
                                               value_mask => unsigned_short (XCB_CONFIG_WINDOW_STACK_MODE),
                                               value_list => winAttr'Access);

            ignore := xcb_flush(connection);
        end raiseToTop;
    begin
        
        buttonEvent := toButtonEvent (event);

        Ada.Text_IO.Put_Line ("Button press" & buttonEvent.detail'Image &
                              " Modifier"    & buttonEvent.state'Image &
                              " on window"   & buttonEvent.event'Image &
                              " on child"    & buttonEvent.child'Image);

        raiseToTop(connection, buttonEvent.event);

        -- We look for press on the frame window. If we get a click with no
        -- child set, then we know we clicked on the frame or an un-framed
        -- window.
        -- If we press on the frame, then we can start dragging.
        -- If this was _not_ a frame click, then just pass the event to the app window.
        -- If an unframed window, then it already got the event since there's no frame
        -- to grab it.

        -- @TODO - need a way to get the app from inside the frame so we can focus the app
        --  when the frame is clicked.
        --  (separate frame->app map)
        --focusWin := (if buttonEvent.child = 0 then buttonEvent.event else buttonEvent.child);

        -- If we're exposing a window, expose the frame too (if it has one) and vice versa.
        if isFrame(buttonEvnet.window) then
            -- Clicked on a frame. Register the start pos. 
            getFrameFromList(exposeEvent.window).
        elsif hasFrame(exposeEvent.window) then
            -- exposing a framed application window
            getFrameOfWindow(exposeEvent.window).drawTitleBar;
        else
            -- exposing a non-framed window, just let it expose.
            -- @TODO if we determine this is a DE menu or something like that
            --  then we'll want to draw it here.
            null;
        end if;
        
        cookie := xcb_set_input_focus(c           => connection,
                                      revert_to   => xcb_input_focus_t'Pos(XCB_INPUT_FOCUS_POINTER_ROOT),
                                      focus       => focusWin,
                                      time        => XCB_CURRENT_TIME);
        -- If the frame was pressed, continue to maintain the grab until we release, since it
        -- might be a drag or resize.

        -- If the child was pressed, go ahead and ungrab so it can receive the events.
        -- if buttonEvent.child = 0 then
        --     cookie := xcb_ungrab_button(c => connection,
        --                                 button => 1,
        --                                 grab_window => )
        -- end if;
            -- Ada.Text_IO.Put_Line("Sending event to child " & buttonEvent.child'Image);
            -- -- cookie := xcb_send_event(c           => connection,
            -- --                          propagate   => 0,   -- don't want this event back after we send it down.
            -- --                          destination => buttonEvent.child,
            -- --                          event_mask  => XCB_EVENT_MASK_BUTTON_PRESS,
            -- --                          event       => toCharsPtr (event));
            -- cookie := xcb_allow_events(c => connection,
            --                            mode => xcb_allow_t'Pos(XCB_ALLOW_REPLAY_POINTER),
            --                            time => buttonEvent.time);

            -- ignore := xcb_flush(connection);
        -- end if;

        -- --  geometryCookie := xcb_get_geometry (c => connection, drawable => window);

        -- --  geometry := xcb_get_geometry_reply (c => connection, 
        -- --                                      cookie => geometryCookie, 
        -- --                                      e => xcbError'Address);
        
        -- geom := getWindowGeometry(connection, window, errorPtr(xcbError));

        -- -- for debugging
        -- if xcbError /= null then
        --     Ada.Text_IO.Put_Line("Error getting geometry: " & xcbError.error_code'Image);
        -- end if;

        -- Ada.Text_IO.Put_Line ("buttonEvent->response_type" & buttonEvent.response_type'Image & LF & 
        --                       " buttonEvent->sequence    " & buttonEvent.sequence'Image & LF &
        --                       " buttonEvent->detail      " & buttonEvent.detail'Image & LF &
        --                       " buttonEvent->state       " & buttonEvent.state'Image);

        -- if buttonEvent.detail = 1 then
        --     -- mouse button 1
        --     if buttonEvent.state = unsigned_short (XCB_MOD_MASK_1) then
        --         -- holding Alt, enable movement
        --         windowAttributes.border_width := 1;
        --         focusedWindow := window;
               
        --         -- dummyCookie :=
        --         --     xcb_warp_pointer
        --         --       (c => connection, src_window => XCB_NONE, dst_window => window, src_x => 0, src_y => 0,
        --         --        src_width => 0, src_height => 0, dst_x => 1, dst_y => 1);

        --         dummyGrabCookie :=
        --            xcb_grab_pointer
        --               (c          => connection, owner_events => 0, grab_window => rootWindow,
        --                event_mask =>
        --                   unsigned_short
        --                      (XCB_EVENT_MASK_BUTTON_RELEASE or XCB_EVENT_MASK_BUTTON_MOTION or
        --                       XCB_EVENT_MASK_POINTER_MOTION_HINT),
        --                pointer_mode  => xcb_grab_mode_t'Pos (XCB_GRAB_MODE_ASYNC),
        --                keyboard_mode => xcb_grab_mode_t'Pos (XCB_GRAB_MODE_ASYNC), confine_to => rootWindow,
        --                cursor        => XCB_NONE, time => XCB_CURRENT_TIME);
        --     else
        --         -- not holding Alt, just raise
        --         if focusedWindow /= window then
        --             Ada.Text_IO.Put_Line ("Focusing window" & window'Image);
        --             focusedWindow := window;
        --             dummyCookie   :=
        --                xcb_set_input_focus
        --                   (c => connection, revert_to => xcb_input_focus_t'Pos (XCB_INPUT_FOCUS_POINTER_ROOT),
        --                    focus => window, time => XCB_CURRENT_TIME);
        --         end if;
        --     end if;
        -- else
        --     -- mouse button 3
        --     windowAttributes.border_width := 3;

        --     -- if geom /= null then
        --         -- dummyCookie :=
        --         --   xcb_warp_pointer(c            => connection, 
        --         --                    src_window   => XCB_NONE, 
        --         --                    dst_window   => window,
        --         --                    src_x        => 0,
        --         --                    src_y        => 0,
        --         --                    src_width    => 0, 
        --         --                    src_height   => 0,
        --         --                    dst_x        => short (geom.width),
        --         --                    dst_y        => short (geom.height));
        --     -- end if;
            
        --     dummyGrabCookie :=
        --        xcb_grab_pointer
        --           (c          => connection, owner_events => 0, grab_window => rootWindow,
        --            event_mask =>
        --               unsigned_short
        --                  (XCB_EVENT_MASK_BUTTON_RELEASE or XCB_EVENT_MASK_BUTTON_MOTION or
        --                   XCB_EVENT_MASK_POINTER_MOTION_HINT),
        --            pointer_mode  => xcb_grab_mode_t'Pos (XCB_GRAB_MODE_ASYNC),
        --            keyboard_mode => xcb_grab_mode_t'Pos (XCB_GRAB_MODE_ASYNC), confine_to => rootWindow,
        --            cursor        => XCB_NONE, time => XCB_CURRENT_TIME);
        --  end if;
 
        --  dummy := xcb_flush (connection);
        --  Ada.Text_IO.Put_Line("exit handleButtonPress");
    end handleButtonPress;
    
    ---------------------------------------------------------------------------
    -- handleButtonRelease
    ---------------------------------------------------------------------------
    procedure handleButtonRelease (connection : access xcb_connection_t; event : eventPtr) is
        type buttonEventPtr is access xcb_button_release_event_t;
        buttonEvent : buttonEventPtr;
        cookie : xcb_void_cookie_t;
        ignore : int;
        function toButtonEvent is new Ada.Unchecked_Conversion(Source => eventPtr, Target => buttonEventPtr);
    begin
        Ada.Text_IO.Put_Line("enter handleButtonRelease");
        buttonEvent := toButtonEvent(event);
        -- dummyCookie := xcb_ungrab_pointer (connection, XCB_CURRENT_TIME);
        -- dummy       := xcb_flush (connection);
        cookie := xcb_allow_events(c => connection,
                                   mode => xcb_allow_t'Pos(XCB_ALLOW_REPLAY_POINTER),
                                   time => buttonEvent.time);

        ignore := xcb_flush(connection);
        --Ada.Text_IO.Put_Line("exit handleButtonRelease");
    end handleButtonRelease;

    ---------------------------------------------------------------------------
    -- handleMotionNotify
    ---------------------------------------------------------------------------
    procedure handleMotionNotify (connection : access xcb_connection_t; event : eventPtr) is
        type MotionEventPtr is access all xcb_motion_notify_event_t;
        function toMotionEvent is new Ada.Unchecked_Conversion(Source => eventPtr, Target => MotionEventPtr);
        motionEvent : MotionEventPtr := toMotionEvent(event);
        
        pointerCookie : xcb_query_pointer_cookie_t;
        pointer : access xcb_query_pointer_reply_t;
        
        geometryCookie : xcb_get_geometry_cookie_t;
        geometry : access xcb_get_geometry_reply_t;
        
        dummy : Interfaces.C.int;
        dummyCookie : xcb_void_cookie_t;
        rootWindow : xcb_window_t := setup.getRootWindow(connection);
        
        window : xcb_window_t := motionEvent.child;
        
        windowAttributes : aliased xcb_configure_window_value_list_t;
        
        screen : access xcb_screen_t := setup.getScreen(connection);
    begin
        Ada.Text_IO.Put_Line("Motion on window " & window'Image);
        
        pointerCookie := xcb_query_pointer (c => connection, window => rootWindow);
        geometryCookie := xcb_get_geometry (c => connection, drawable => focusedWindow);

        pointer := xcb_query_pointer_reply (c => connection, cookie => pointerCookie, e => System.Null_Address);
        geometry := xcb_get_geometry_reply (c => connection, cookie => geometryCookie, e => System.Null_Address);

        if geometry = null then
            Ada.Text_IO.Put_Line("Failed to get geometry");
            return;
        end if;
        
        if pointer = null then
            Ada.Text_IO.Put_Line("Failed to get pointer");
            return;
        end if;
 
        if geometry.border_width = 1 then
            -- moving window
            if unsigned_short (pointer.root_x) > unsigned_short (screen.width_in_pixels - 5) then
                -- moving to far left
                windowAttributes.width  := unsigned (screen.width_in_pixels / 2);
                windowAttributes.x      := 0;
                windowAttributes.y      := 0; --screen.width_in_pixels / 2;
                windowAttributes.height := unsigned (screen.height_in_pixels);

                dummyCookie :=
                   xcb_configure_window_aux
                      (c          => connection, window => focusedWindow,
                       value_mask =>
                          unsigned_short
                             (XCB_CONFIG_WINDOW_X or XCB_CONFIG_WINDOW_Y or XCB_CONFIG_WINDOW_WIDTH or
                              XCB_CONFIG_WINDOW_HEIGHT),
                       value_list => windowAttributes'Access);
            else
                -- moving elsewhere
                windowAttributes.x :=
                   int
                      ((if (unsigned_short (pointer.root_x) + geometry.width > screen.width_in_pixels) then
                           screen.width_in_pixels - geometry.width
                        else unsigned_short (pointer.root_x)));
                windowAttributes.y :=
                   int
                      ((if (unsigned_short (pointer.root_y) + geometry.height > screen.height_in_pixels) then
                           screen.height_in_pixels - geometry.height
                        else unsigned_short (pointer.root_y)));

                dummyCookie :=
                   xcb_configure_window_aux
                      (c          => connection, window => focusedWindow,
                       value_mask => unsigned_short (XCB_CONFIG_WINDOW_X or XCB_CONFIG_WINDOW_Y),
                       value_list => windowAttributes'Access);
            end if;
        else
            -- resizing window
            -- TODO: make sure this stays above some minimum
            windowAttributes.width  := unsigned (pointer.root_x - geometry.x);
            windowAttributes.height := unsigned (pointer.root_y - geometry.y);

            dummyCookie :=
               xcb_configure_window_aux
                  (c          => connection, window => focusedWindow,
                   value_mask => unsigned_short (XCB_CONFIG_WINDOW_WIDTH or XCB_CONFIG_WINDOW_HEIGHT),
                   value_list => windowAttributes'Access);
        end if;

        dummy := xcb_flush (connection);
        Ada.Text_IO.Put_Line("exit handleMotionNotify");
    end handleMotionNotify;

    ---------------------------------------------------------------------------
    -- handleExpose
    ---------------------------------------------------------------------------
    procedure handleExpose(connection : access xcb_connection_t;
                           event : eventPtr) is
        use frames;

        type ExposeEventPtr is access all xcb_expose_event_t;
        function toExposeEvent is new Ada.Unchecked_Conversion(Source => eventPtr, Target => ExposeEventPtr);
        exposeEvent : ExposeEventPtr := toExposeEvent(event);

    begin
        Ada.Text_IO.Put_Line("enter handleExpose");

        -- If we're exposing a window, expose the frame too (if it has one) and vice versa.
        if isFrame(exposeEvent.window) then
            -- exposing a frame
            -- @TODO eventually this will be drawDecorations or something
            getFrameFromList(exposeEvent.window).drawTitleBar;
        elsif hasFrame(exposeEvent.window) then
            -- exposing a framed application window
            getFrameOfWindow(exposeEvent.window).drawTitleBar;
        else
            -- exposing a non-framed window, just let it expose.
            -- @TODO if we determine this is a DE menu or something like that
            --  then we'll want to draw it here.
            null;
        end if;

        Ada.Text_IO.Put_Line("exit handleExpose");
    end handleExpose;

    ---------------------------------------------------------------------------
    -- eventLoop
    ---------------------------------------------------------------------------
    procedure eventLoop(connection : access xcb_connection_t; 
                        rend : render.Renderer)
    is
        procedure free is new Ada.Unchecked_Deallocation (Object => xcb_generic_event_t, Name => events.eventPtr);
        --focusedWindow : xcb_window_t;
        XCB_EVENT_MASK : constant := 2#0111_1111#;
        event : events.eventPtr;
        ignore : int;
    begin
        ignore := xcb_flush(connection);

        focusedWindow := setup.getRootWindow(connection);
        
        Ada.Text_IO.Put_Line("Focused Window:" & focusedWindow'Image);
        
        loop
            --Ada.Text_IO.Put_Line("Start Event Loop");
            event := events.eventPtr (xcb_wait_for_event (connection));
    
            exit when event = null;
            --Ada.Text_IO.Put_Line("Received Event " & event.response_type'Image);
    
            case (event.response_type and XCB_EVENT_MASK) is
                when CONST_XCB_MAP_REQUEST =>
                    events.handleMapRequest(connection, event, rend);
                    null;
                    
                when CONST_XCB_CONFIGURE_REQUEST =>
                    events.handleConfigureRequest(connection, event);
                    null;
    
                 when CONST_XCB_BUTTON_PRESS =>
                     events.handleButtonPress(connection, event);
                --     null;
            
                -- when CONST_XCB_MOTION_NOTIFY =>
                --     events.handleMotionNotify(connection, event);
                --     null;
    
                when CONST_XCB_BUTTON_RELEASE =>
                    events.handleButtonRelease(connection, event);
                --     null;
    
                when CONST_XCB_EXPOSE =>
                    events.handleExpose(connection, event);
                    null;

                when CONST_XCB_CREATE_NOTIFY =>
                    -- TODO: give input focus to the new window, probably
                    null;

                when CONST_XCB_DESTROY_NOTIFY =>
                    null;

                when CONST_XCB_KEY_PRESS =>
                    Ada.Text_IO.Put_Line("Key Pressed");
                        
                when others =>
                    null;
            end case;
    
            free (event);
            --Ada.Text_IO.Put_Line("End Event Loop");
        end loop;
        
    end eventLoop;
end events;
