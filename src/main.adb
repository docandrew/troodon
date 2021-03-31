with Ada.Text_IO;      use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Ada.Unchecked_Deallocation;
with Ada.Unchecked_Conversion;

with Interfaces.C.Strings; use Interfaces.C.Strings;
with Interfaces.C;         use Interfaces.C;
with System;               use System;

with Xlib;
with xcb;      use xcb;
with xcb_ewmh; use xcb_ewmh;
with xproto;   use xproto;

with Events;
with Render;
with Render.Fonts;
with Render.Shaders;
with Setup;
with Taskbar;

procedure Main is
    display    : access Xlib.Display;
    connection : access xcb.xcb_connection_t;
    ignore     : int;
    rend       : render.Renderer;
begin
    -- @TODO perform a check for required libraries, and offer helpful
    --  suggestions for what the user needs to install and how, depending on
    --  their distro.
    -- We can do that with:
    -- $ LD_TRACE_LOADED_OBJECTS=1 ./troodon
    -- @TODO move this, make sure we can connect to the X server before bothering
    -- with loading fonts, shaders etc.

    display        := Setup.initXlib;
    connection     := Setup.initXcb (display);
    rend           := Render.initRendering (connection, display);

    Render.Fonts.initFonts;
    
    if connection /= null then
        -- Attempt to get EWMH atom values, if successful they'll be available from setup.ewmh
        Setup.initEwmh (connection);
    
        -- Start desktop environment components
        Taskbar.Taskbar.Start;

        -- Enter main WM event loop
        Events.eventLoop (connection, rend);
    else
        Ada.Text_IO.Put_Line ("Unable to connect to X Server. Exiting.");
        Ada.Command_Line.Set_Exit_Status (1);
        return;
    end if;
    
    Ada.Text_IO.Put_Line ("Troodon: Disconnecting from X server.");
    --xcb_disconnect (connection);
    ignore := Xlib.XCloseDisplay (display);
    
    Ada.Text_IO.Put_Line ("Troodon: XCloseDisplay return code:" & ignore'Image);
    
    Ada.Text_IO.Put_Line ("Troodon: Going extinct.");
end Main;
