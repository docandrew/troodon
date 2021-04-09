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

with Compositor;
with Frames;
with Setup;
with Util; use Util;

package body events is

    -- focusWin        : xcb_window_t := 0;

    -- Window movement & resizing.
    -- need both the original window pos
    -- and the mouse pos, since we want
    -- to adjust the window position by
    -- the delta, not just put the window
    -- where the mouse is.
    winStartX       : Interfaces.C.short;   
    winStartY       : Interfaces.C.short;   
    dragStartX      : Interfaces.C.short;   
    dragStartY      : Interfaces.C.short;   
    dragFrame       : xcb_window_t;
    dragInProgress  : Boolean := False;
    -- mouseX          : Interfaces.C.short;
    -- mouseY          : Interfaces.C.short;
    
    ---------------------------------------------------------------------------
    -- handleMapRequest
    ---------------------------------------------------------------------------
    procedure handleMapRequest (connection : access xcb_connection_t;
                                event      : eventPtr;
                                rend       : render.Renderer) is
        use Frames;
        use Render;

        type mapRequestPtr is access all xcb_map_request_event_t;
        mapRequestEvent : mapRequestPtr;

        cookie : xcb_void_cookie_t;
        -- dummy  : int;

        winType : xcb_atom_t := XCB_ATOM_NONE;    -- type of window, if set.
        -- title   : Unbounded_String := To_Unbounded_String ("");
        -- screen  : access xcb_screen_t;
        -- frameThis : Boolean := True;

        -- drawable : GLX.GLXDrawable := 0;

        -- geom : xcb_get_geometry_reply_t;

        -- frameValueMask : Interfaces.C.unsigned :=
        --     (if rend.kind = render.SOFTWARE then 
        --         XCB_CW_BORDER_PIXEL or XCB_CW_BACK_PIXEL or XCB_CW_EVENT_MASK
        --      else
        --         XCB_CW_BORDER_PIXEL or XCB_CW_BACK_PIXEL or XCB_CW_EVENT_MASK or XCB_CW_COLORMAP);

        -- frameCreateAttributes : aliased xcb_create_window_value_list_t; -- := (others => <>);

        function toMapEvent is new Ada.Unchecked_Conversion (Source => eventPtr, Target => mapRequestPtr);
    begin
        Ada.Text_IO.Put_Line ("Enter handleMapRequest");
        mapRequestEvent := toMapEvent (event);

        -- See if the map event is for a frame we've already created.
        if isFrame (mapRequestEvent.window) then
            -- If so, go ahead and map it as-is.
            declare
                F : Frame := getFrameFromList (mapRequestEvent.window);
            begin
                F.map;
                return;
            end;
        end if;

        -- If not, is this for an app window we've already framed?
        if hasFrame (mapRequestEvent.window) then
            -- If so, go ahead and get its frame and map it.
            getFrameOfWindow (mapRequestEvent.window).map;
            return;
        end if;

        -- If EWMH in use, and this window sets the _NET_WM_WINDOW_TYPE property, honor that here,
        -- map the window without framing.
        if setup.ewmh /= null then
            winType := getAtomProperty (connection, mapRequestEvent.window, setup.ewmh.u_NET_WM_WINDOW_TYPE);

            if winType = setup.ewmh.u_NET_WM_WINDOW_TYPE_DOCK or
               winType = Setup.ewmh.u_NET_WM_WINDOW_TYPE_DESKTOP then

                -- frameThis := False;
                Ada.Text_IO.Put_Line("Troodon: mapping docked window");
                
                Compositor.addWindow (mapRequestEvent.window);

                cookie := xcb_map_window (c => connection, window => mapRequestEvent.window);
                return;
            end if;
        end if;

        -- This is for an app whose frame doesn't exist yet, so create a new one
        -- and map it and its child.
        declare
            F : Frame := frameWindow(connection, mapRequestEvent.window, rend);
        begin
            -- Only need to composite the parent window.
            Compositor.addWindow (F.frameID);
            -- Compositor.addWindow (F.appWindow);

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
        -- Ada.Text_IO.Put_Line("enter handleConfigurationRequest");
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

        -- Ada.Text_IO.Put_Line ("Configuring window" & configureRequestEvent.window'Image);

        dummy := xcb_flush (connection);
        Ada.Text_IO.Put_Line("exit handleConfigurationRequest");
    end handleConfigureRequest;

    ---------------------------------------------------------------------------
    -- handleButtonPress
    ---------------------------------------------------------------------------
    procedure handleButtonPress (connection : access xcb_connection_t; event : eventPtr) is
        use ASCII;
        use Frames;
    
        type buttonEventPtr is access all xcb_button_press_event_t;
        
        buttonEvent : buttonEventPtr;
        cookie      : xcb_void_cookie_t;
        ignore      : Interfaces.C.int;
        geom        : xcb_get_geometry_reply_t;
        f           : Frame;

        function toButtonEvent is new Ada.Unchecked_Conversion (Source => events.eventPtr, Target => buttonEventPtr);
        -- function toCharsPtr is new Ada.Unchecked_Conversion (Source => events.eventPtr, Target => Interfaces.C.Strings.chars_ptr);
    begin
        
        buttonEvent := toButtonEvent (event);

        Ada.Text_IO.Put_Line ("Button press" & buttonEvent.detail'Image &
                              " Modifier"    & buttonEvent.state'Image &
                              " on window"   & buttonEvent.event'Image &
                              " on child"    & buttonEvent.child'Image);

        if isFrame (buttonEvent.event) then
            f := getFrameFromList(buttonEvent.event); -- COPY?

            -- Clicked on a frame. Register the start pos in case this turns into a drag.
            --@TODO see if this was on the resize area.
            dragInProgress := False;                -- Drag not in progress yet.
            dragFrame      := buttonEvent.event;
            dragStartX     := buttonEvent.root_x;
            dragStartY     := buttonEvent.root_y;
            
            -- Need to get geometry of window to determine its current pos
            geom := Util.getWindowGeometry (connection, buttonEvent.event);

            -- if returned geom is invalid, this might cause some weird results.
            -- @TODO find a good way to validate that.
            winStartX := geom.x;
            winStartY := geom.y;

            -- Focus this frame.
            Frames.focus (f.frameID);

            -- Ada.Text_IO.Put_Line ("Clicked on frame, focusing " & f.frameID'Image);

        elsif hasFrame (buttonEvent.event) then
            -- Clicked on app. Focus it.

            f := getFrameOfWindow (buttonEvent.event);
            Frames.focus (f.frameID);

            -- Ada.Text_IO.Put_Line ("Clicked on app, focusing " & f.frameID'Image);
        else
            -- Clicked on a non-framed window, unfocus all our frames
            Frames.unfocusAll;
            -- @TODO give input focus to unframed window?
        end if;
        
        ignore := xcb_flush (connection);
    end handleButtonPress;
    
    ---------------------------------------------------------------------------
    -- handleButtonRelease
    ---------------------------------------------------------------------------
    procedure handleButtonRelease (connection : access xcb_connection_t; event : eventPtr) is
        type buttonEventPtr is access xcb_button_release_event_t;

        buttonEvent : buttonEventPtr;
        ignore      : int;

        function toButtonEvent is new Ada.Unchecked_Conversion(Source => eventPtr, Target => buttonEventPtr);
    begin
        buttonEvent := toButtonEvent(event);

        -- If we were dragging, stop.
        dragFrame := 0;
        dragInProgress := False;
        Frames.stopDrag;

        ignore := xcb_flush (connection);
    end handleButtonRelease;

    ---------------------------------------------------------------------------
    -- handleMotionNotify
    ---------------------------------------------------------------------------
    procedure handleMotionNotify (connection : access xcb_connection_t; event : eventPtr) is
        use Interfaces.C;

        type MotionEventPtr is access all xcb_motion_notify_event_t;
        motionEvent : MotionEventPtr;
        
        windowAttributes : aliased xcb_configure_window_value_list_t;
        cookie : xcb_void_cookie_t;
        deltaX : Interfaces.C.short;
        deltaY : Interfaces.C.short;
        newX   : Interfaces.C.short;
        newY   : Interfaces.C.short;

        dummy  : Interfaces.C.int;

        -- screen : access xcb_screen_t := setup.getScreen(connection);
        function toMotionEvent is new Ada.Unchecked_Conversion(Source => eventPtr, Target => MotionEventPtr);
    begin
        motionEvent := toMotionEvent(event);

        -- Ada.Text_IO.Put_Line ("Root X: " & motionEvent.root_x'Image & " Root Y: " & motionEvent.root_y'Image);
        
        if dragFrame /= 0 then
            -- Only want to start the drag once.
            if not dragInProgress then
                dragInProgress := True;
                Frames.startDrag (dragFrame);
            end if;

            -- Update window location
            deltaX := dragStartX - winStartX;
            deltaY := dragStartY - winStartY;

            newX := motionEvent.root_x - deltaX;
            newY := motionEvent.root_y - deltaY;

            windowAttributes.x := Interfaces.C.int(newX);
            windowAttributes.y := Interfaces.C.int(newY);

            cookie := xcb_configure_window_aux (c          => connection,
                                                window     => dragFrame,
                                                value_mask => Unsigned_short(XCB_CONFIG_WINDOW_X or XCB_CONFIG_WINDOW_Y),
                                                value_list => windowAttributes'Access);
        end if;
        -- @TODO consider introducing some hysteresis so small mouse
        -- movements during a button click don't turn into drags.

        dummy := xcb_flush (connection);
    end handleMotionNotify;

    ---------------------------------------------------------------------------
    -- handleExpose
    ---------------------------------------------------------------------------
    procedure handleExpose (connection : access xcb_connection_t;
                            event      : eventPtr;
                            rend       : Render.Renderer) is
        use Frames;

        type ExposeEventPtr is access all xcb_expose_event_t;
        function toExposeEvent is new Ada.Unchecked_Conversion (Source => eventPtr, Target => ExposeEventPtr);
        exposeEvent : ExposeEventPtr := toExposeEvent (event);

    begin
        Ada.Text_IO.Put_Line ("exposing window" & exposeEvent.window'Image);

        -- If we're exposing a window, expose the frame too (if it has one) and vice versa.
        -- We'll tell the compositor to blit the frame first then window contents after.
        if isFrame (exposeEvent.window) then
            -- exposing a frame
            getFrameFromList (exposeEvent.window).draw;

        elsif hasFrame (exposeEvent.window) then
            -- exposing a framed application window.
            getFrameOfWindow (exposeEvent.window).draw;

        else
            -- exposing a non-framed window, just let it expose.
            -- @TODO if we determine this is a DE menu or something like that
            --  then we'll want to draw it here too.
            null;
        end if;

        -- Ada.Text_IO.Put_Line("exit handleExpose");
    end handleExpose;

    ---------------------------------------------------------------------------
    -- handleCreate
    ---------------------------------------------------------------------------
    procedure handleCreate (connection : access xcb_connection_t;
                            event      : eventPtr;
                            rend       : Render.Renderer) is

        use Frames;

        type CreateEventPtr is access all xcb_create_notify_event_t;

        function toCreateEvent is new Ada.Unchecked_Conversion (Source => eventPtr, Target => CreateEventPtr);
        createEvent : CreateEventPtr := toCreateEvent (event);

        win : xcb_window_t := createEvent.window;
    begin
        Ada.Text_IO.Put_Line ("Window Create: " & createEvent.window'Image & " with parent " & createEvent.parent'Image);
    
        -- We might get this notification after a window has already been mapped/focused.
        -- We will only add non-framed windows to the render stack here.

        -- Add to the list, but ignore the overlay window since we get a
        -- create notification for that too.
        -- if win /= Compositor.overlayWindow then
        --     if not isFrame (win) and not hasFrame (win) then
        --         Compositor.addWindow (win);
        --     end if;
        -- end if;
    end handleCreate;

    ---------------------------------------------------------------------------
    -- handleDestroy
    ---------------------------------------------------------------------------
    procedure handleDestroy (connection : access xcb_connection_t;
                             event      : eventPtr) is
        type DestroyEventPtr is access all xcb_destroy_notify_event_t;

        function toDestroyEvent is new Ada.Unchecked_Conversion (Source => eventPtr, Target => DestroyEventPtr);
        destroyEvent : DestroyEventPtr := toDestroyEvent (event);
    begin
        Ada.Text_IO.Put_Line ("Window Destroy: " & destroyEvent.window'Image);

        -- Compositor.deleteWindow (destroyEvent.window);
    end handleDestroy;

    ---------------------------------------------------------------------------
    -- dispatchEvent
    ---------------------------------------------------------------------------
    procedure dispatchEvent (connection : access xcb_connection_t;
                             rend       : Render.Renderer;
                             event      : Events.eventPtr) is

        XCB_EVENT_MASK : constant := 2#0111_1111#;

    begin
        case (event.response_type and XCB_EVENT_MASK) is
            when CONST_XCB_MAP_REQUEST =>
                events.handleMapRequest (connection, event, rend);
                
            when CONST_XCB_CONFIGURE_REQUEST =>
                events.handleConfigureRequest (connection, event);

            when CONST_XCB_BUTTON_PRESS =>
                events.handleButtonPress (connection, event);
        
            when CONST_XCB_MOTION_NOTIFY =>
                events.handleMotionNotify (connection, event);

            when CONST_XCB_BUTTON_RELEASE =>
                events.handleButtonRelease (connection, event);

            when CONST_XCB_EXPOSE =>
                events.handleExpose (connection, event, rend);

            when CONST_XCB_CREATE_NOTIFY =>
                events.handleCreate (connection, event, rend);

            when CONST_XCB_DESTROY_NOTIFY =>
                events.handleDestroy (connection, event);

            when CONST_XCB_KEY_PRESS =>
                Ada.Text_IO.Put_Line("Key Pressed");
                    
            when others =>
                null;
        end case;
    end dispatchEvent;

    ---------------------------------------------------------------------------
    -- eventLoop
    ---------------------------------------------------------------------------
    procedure eventLoop (connection : access xcb_connection_t; 
                         rend       : Render.Renderer;
                         mode       : Compositor.CompositeMode)
    is
        use Compositor;
        procedure free is new Ada.Unchecked_Deallocation (Object => xcb_generic_event_t, Name => events.eventPtr);


        event          : Events.eventPtr;
        ignore         : int;
    begin

        ignore := xcb_flush (connection);

        loop
            --Ada.Text_IO.Put_Line("Start Event Loop");
            -- event := events.eventPtr (xcb_wait_for_event (connection));
            -- exit when event = null;

            if mode = Compositor.MANUAL then
                -- If we're compositing ourselves, we need to refresh the
                -- screen even if no events are headed our way so we poll
                -- here to avoid blocking.
                event := Events.eventPtr (xcb_poll_for_event (connection));

                if event /= null then
                    dispatchEvent (connection, rend, event);
                    Compositor.blitAll (connection, rend);
                    delay Duration(0.02);
                else
                    -- Need to perform compositing here ourselves
                    Compositor.blitAll (connection, rend);
                end if;

                free (event);
            else
                -- In automatic compositing mode, we can afford to block
                event := Events.eventPtr (xcb_wait_for_event (connection));
                exit when event = null;

                dispatchEvent (connection, rend, event);

                free (event);
            end if;
        end loop;
        
    end eventLoop;
end events;
