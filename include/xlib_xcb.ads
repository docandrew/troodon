pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with Xlib;
limited with xcb;

package Xlib_xcb is

  -- Copyright (C) 2003-2006 Jamey Sharp, Josh Triplett
  -- * This file is licensed under the MIT license. See the file COPYING.  

   function XGetXCBConnection (dpy : access Xlib.Display) return access xcb.xcb_connection_t  -- /usr/include/X11/Xlib-xcb.h:13
   with Import => True, 
        Convention => C, 
        External_Name => "XGetXCBConnection";

   type XEventQueueOwner is 
     (XlibOwnsEventQueue,
      XCBOwnsEventQueue)
   with Convention => C;  -- /usr/include/X11/Xlib-xcb.h:15

   procedure XSetEventQueueOwner (dpy : access Xlib.Display; owner : XEventQueueOwner)  -- /usr/include/X11/Xlib-xcb.h:16
   with Import => True, 
        Convention => C, 
        External_Name => "XSetEventQueueOwner";

end Xlib_xcb;
