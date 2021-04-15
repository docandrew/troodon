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

with Compositor;
with Desktop;
with Events;
with Render;
with Render.Fonts;
with Render.Shaders;
with Setup;
with Taskbar;

procedure Main is
    use Render;

    display        : access Xlib.Display;
    connection     : access xcb.xcb_connection_t;
    rend           : Render.Renderer;
    compMode       : Compositor.CompositeMode := Compositor.MANUAL;
    ignore         : int;
begin
    -- @TODO perform a check for required libraries, and offer helpful
    --  suggestions for what the user needs to install and how, depending on
    --  their distro.
    -- We can do that with:
    -- $ LD_TRACE_LOADED_OBJECTS=1 ./troodon

    display        := Setup.initXlib;
    connection     := Setup.initXcb (display);
    
    if connection = null then
        Ada.Text_IO.Put_Line ("Unable to connect to X Server. Exiting.");
        Ada.Command_Line.Set_Exit_Status (1);
    end if;

    Setup.initExtensions (connection);

    rend := Render.start (connection, display);

    Compositor.start (connection, rend, compMode);
    Render.Fonts.start;
    Desktop.start (connection, rend);
    Render.Shaders.start;
    Desktop.changeWallpaper (connection, rend, "bg.jpg");  
    Setup.initDamage (connection);
    Setup.initEwmh (connection);
    Taskbar.start;

    -- Main loop
    Events.eventLoop (connection, rend, compMode);

    -- Cleanup
    Taskbar.stop (connection);
    Desktop.stop (connection, rend);
    Compositor.stop (connection, rend, compMode);
    Render.Fonts.stop;
    Render.Shaders.stop;
    Render.stop (connection, rend);

    Ada.Text_IO.Put_Line ("Troodon: Disconnecting from X server.");

    ignore := Xlib.XCloseDisplay (display);
    
    Ada.Text_IO.Put_Line ("Troodon: Going extinct.");
end Main;
