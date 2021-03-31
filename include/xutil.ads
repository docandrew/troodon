pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with X11;
with Interfaces.C.Strings;
with Xlib;
with System;

package Xutil is

   NoValue : constant := 16#0000#;  --  /usr/include/X11/Xutil.h:68
   XValue : constant := 16#0001#;  --  /usr/include/X11/Xutil.h:69
   YValue : constant := 16#0002#;  --  /usr/include/X11/Xutil.h:70
   WidthValue : constant := 16#0004#;  --  /usr/include/X11/Xutil.h:71
   HeightValue : constant := 16#0008#;  --  /usr/include/X11/Xutil.h:72
   AllValues : constant := 16#000F#;  --  /usr/include/X11/Xutil.h:73
   XNegative : constant := 16#0010#;  --  /usr/include/X11/Xutil.h:74
   YNegative : constant := 16#0020#;  --  /usr/include/X11/Xutil.h:75

   USPosition : constant := (2 ** 0);  --  /usr/include/X11/Xutil.h:102
   USSize : constant := (2 ** 1);  --  /usr/include/X11/Xutil.h:103

   PPosition : constant := (2 ** 2);  --  /usr/include/X11/Xutil.h:105
   PSize : constant := (2 ** 3);  --  /usr/include/X11/Xutil.h:106
   PMinSize : constant := (2 ** 4);  --  /usr/include/X11/Xutil.h:107
   PMaxSize : constant := (2 ** 5);  --  /usr/include/X11/Xutil.h:108
   PResizeInc : constant := (2 ** 6);  --  /usr/include/X11/Xutil.h:109
   PAspect : constant := (2 ** 7);  --  /usr/include/X11/Xutil.h:110
   PBaseSize : constant := (2 ** 8);  --  /usr/include/X11/Xutil.h:111
   PWinGravity : constant := (2 ** 9);  --  /usr/include/X11/Xutil.h:112
   --  unsupported macro: PAllHints (PPosition|PSize|PMinSize|PMaxSize|PResizeInc|PAspect)

   InputHint : constant := (2 ** 0);  --  /usr/include/X11/Xutil.h:134
   StateHint : constant := (2 ** 1);  --  /usr/include/X11/Xutil.h:135
   IconPixmapHint : constant := (2 ** 2);  --  /usr/include/X11/Xutil.h:136
   IconWindowHint : constant := (2 ** 3);  --  /usr/include/X11/Xutil.h:137
   IconPositionHint : constant := (2 ** 4);  --  /usr/include/X11/Xutil.h:138
   IconMaskHint : constant := (2 ** 5);  --  /usr/include/X11/Xutil.h:139
   WindowGroupHint : constant := (2 ** 6);  --  /usr/include/X11/Xutil.h:140
   --  unsupported macro: AllHints (InputHint|StateHint|IconPixmapHint|IconWindowHint| IconPositionHint|IconMaskHint|WindowGroupHint)

   XUrgencyHint : constant := (2 ** 8);  --  /usr/include/X11/Xutil.h:143

   WithdrawnState : constant := 0;  --  /usr/include/X11/Xutil.h:146
   NormalState : constant := 1;  --  /usr/include/X11/Xutil.h:147
   IconicState : constant := 3;  --  /usr/include/X11/Xutil.h:148

   DontCareState : constant := 0;  --  /usr/include/X11/Xutil.h:153
   ZoomState : constant := 2;  --  /usr/include/X11/Xutil.h:154
   InactiveState : constant := 4;  --  /usr/include/X11/Xutil.h:155

   XNoMemory : constant := -1;  --  /usr/include/X11/Xutil.h:170
   XLocaleNotSupported : constant := -2;  --  /usr/include/X11/Xutil.h:171
   XConverterNotFound : constant := -3;  --  /usr/include/X11/Xutil.h:172
   --  arg-macro: function XDestroyImage (ximage)
   --    return (*((ximage).f.destroy_image))((ximage));
   --  arg-macro: function XGetPixel (ximage, x, y)
   --    return (*((ximage).f.get_pixel))((ximage), (x), (y));
   --  arg-macro: function XPutPixel (ximage, x, y, pixel)
   --    return (*((ximage).f.put_pixel))((ximage), (x), (y), (pixel));
   --  arg-macro: function XSubImage (ximage, x, y, width, height)
   --    return (*((ximage).f.sub_image))((ximage), (x), (y), (width), (height));
   --  arg-macro: function XAddPixel (ximage, value)
   --    return (*((ximage).f.add_pixel))((ximage), (value));
   --  arg-macro: function IsKeypadKey (keysym)
   --    return ((KeySym)(keysym) >= XK_KP_Space)  and then  ((KeySym)(keysym) <= XK_KP_Equal);
   --  arg-macro: function IsPrivateKeypadKey (keysym)
   --    return ((KeySym)(keysym) >= 16#11000000#)  and then  ((KeySym)(keysym) <= 16#1100FFFF#);
   --  arg-macro: function IsCursorKey (keysym)
   --    return ((KeySym)(keysym) >= XK_Home)  and then  ((KeySym)(keysym) < XK_Select);
   --  arg-macro: function IsPFKey (keysym)
   --    return ((KeySym)(keysym) >= XK_KP_F1)  and then  ((KeySym)(keysym) <= XK_KP_F4);
   --  arg-macro: function IsFunctionKey (keysym)
   --    return ((KeySym)(keysym) >= XK_F1)  and then  ((KeySym)(keysym) <= XK_F35);
   --  arg-macro: function IsMiscFunctionKey (keysym)
   --    return ((KeySym)(keysym) >= XK_Select)  and then  ((KeySym)(keysym) <= XK_Break);
   --  arg-macro: function IsModifierKey (keysym)
   --    return (((KeySym)(keysym) >= XK_Shift_L)  and then  ((KeySym)(keysym) <= XK_Hyper_R))  or else  (((KeySym)(keysym) >= XK_ISO_Lock)  and then  ((KeySym)(keysym) <= XK_ISO_Level5_Lock))  or else  ((KeySym)(keysym) = XK_Mode_switch)  or else  ((KeySym)(keysym) = XK_Num_Lock);

   RectangleOut : constant := 0;  --  /usr/include/X11/Xutil.h:277
   RectangleIn : constant := 1;  --  /usr/include/X11/Xutil.h:278
   RectanglePart : constant := 2;  --  /usr/include/X11/Xutil.h:279

   VisualNoMask : constant := 16#0#;  --  /usr/include/X11/Xutil.h:304
   VisualIDMask : constant := 16#1#;  --  /usr/include/X11/Xutil.h:305
   VisualScreenMask : constant := 16#2#;  --  /usr/include/X11/Xutil.h:306
   VisualDepthMask : constant := 16#4#;  --  /usr/include/X11/Xutil.h:307
   VisualClassMask : constant := 16#8#;  --  /usr/include/X11/Xutil.h:308
   VisualRedMaskMask : constant := 16#10#;  --  /usr/include/X11/Xutil.h:309
   VisualGreenMaskMask : constant := 16#20#;  --  /usr/include/X11/Xutil.h:310
   VisualBlueMaskMask : constant := 16#40#;  --  /usr/include/X11/Xutil.h:311
   VisualColormapSizeMask : constant := 16#80#;  --  /usr/include/X11/Xutil.h:312
   VisualBitsPerRGBMask : constant := 16#100#;  --  /usr/include/X11/Xutil.h:313
   VisualAllMask : constant := 16#1FF#;  --  /usr/include/X11/Xutil.h:314
   --  unsupported macro: ReleaseByFreeingColormap ((XID) 1L)

   BitmapSuccess : constant := 0;  --  /usr/include/X11/Xutil.h:339
   BitmapOpenFailed : constant := 1;  --  /usr/include/X11/Xutil.h:340
   BitmapFileInvalid : constant := 2;  --  /usr/include/X11/Xutil.h:341
   BitmapNoMemory : constant := 3;  --  /usr/include/X11/Xutil.h:342

   XCSUCCESS : constant := 0;  --  /usr/include/X11/Xutil.h:353
   XCNOMEM : constant := 1;  --  /usr/include/X11/Xutil.h:354
   XCNOENT : constant := 2;  --  /usr/include/X11/Xutil.h:355
   --  arg-macro: function XUniqueContext ()
   --    return (XContext) XrmUniqueQuark();
   --  arg-macro: function XStringToContext (string)
   --    return (XContext) XrmStringToQuark(string);

  --**********************************************************
  --Copyright 1987, 1998  The Open Group
  --Permission to use, copy, modify, distribute, and sell this software and its
  --documentation for any purpose is hereby granted without fee, provided that
  --the above copyright notice appear in all copies and that both that
  --copyright notice and this permission notice appear in supporting
  --documentation.
  --The above copyright notice and this permission notice shall be included in
  --all copies or substantial portions of the Software.
  --THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  --IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  --FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
  --OPEN GROUP BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
  --AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
  --CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  --Except as contained in this notice, the name of The Open Group shall not be
  --used in advertising or otherwise to promote the sale, use or other dealings
  --in this Software without prior written authorization from The Open Group.
  --Copyright 1987 by Digital Equipment Corporation, Maynard, Massachusetts.
  --                        All Rights Reserved
  --Permission to use, copy, modify, and distribute this software and its
  --documentation for any purpose and without fee is hereby granted,
  --provided that the above copyright notice appear in all copies and that
  --both that copyright notice and this permission notice appear in
  --supporting documentation, and that the name of Digital not be
  --used in advertising or publicity pertaining to distribution of the
  --software without specific, written prior permission.
  --DIGITAL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING
  --ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL
  --DIGITAL BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR
  --ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
  --WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
  --ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
  --SOFTWARE.
  --***************************************************************** 

  -- You must include <X11/Xlib.h> before including this file  
  -- The Xlib structs are full of implicit padding to properly align members.
  --   We can't clean that up without breaking ABI, so tell clang not to bother
  --   complaining about it.  

  -- * Bitmask returned by XParseGeometry().  Each bit tells if the corresponding
  -- * value (x, y, width, height) was found in the parsed string.
  --  

  -- * new version containing base_width, base_height, and win_gravity fields;
  -- * used with WM_NORMAL_HINTS.
  --  

  -- marks which fields in this structure are defined  
   --  skipped anonymous struct anon_97

   type anon_98 is record
      x : aliased int;  -- /usr/include/X11/Xutil.h:89
      y : aliased int;  -- /usr/include/X11/Xutil.h:90
   end record
   with Convention => C_Pass_By_Copy;
   type XSizeHints is record
      flags : aliased long;  -- /usr/include/X11/Xutil.h:82
      x : aliased int;  -- /usr/include/X11/Xutil.h:83
      y : aliased int;  -- /usr/include/X11/Xutil.h:83
      width : aliased int;  -- /usr/include/X11/Xutil.h:84
      height : aliased int;  -- /usr/include/X11/Xutil.h:84
      min_width : aliased int;  -- /usr/include/X11/Xutil.h:85
      min_height : aliased int;  -- /usr/include/X11/Xutil.h:85
      max_width : aliased int;  -- /usr/include/X11/Xutil.h:86
      max_height : aliased int;  -- /usr/include/X11/Xutil.h:86
      width_inc : aliased int;  -- /usr/include/X11/Xutil.h:87
      height_inc : aliased int;  -- /usr/include/X11/Xutil.h:87
      min_aspect : aliased anon_98;  -- /usr/include/X11/Xutil.h:91
      max_aspect : aliased anon_98;  -- /usr/include/X11/Xutil.h:91
      base_width : aliased int;  -- /usr/include/X11/Xutil.h:92
      base_height : aliased int;  -- /usr/include/X11/Xutil.h:92
      win_gravity : aliased int;  -- /usr/include/X11/Xutil.h:93
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xutil.h:94

  -- obsolete for new window mgrs, but clients  
  -- should set so old wm's don't mess up  
  -- numerator  
  -- denominator  
  -- added by ICCCM version 1  
  -- added by ICCCM version 1  
  -- * The next block of definitions are for window manager properties that
  -- * clients and applications use for communication.
  --  

  -- flags argument in size hints  
  -- obsolete  
  -- marks which fields in this structure are defined  
   --  skipped anonymous struct anon_99

   type XWMHints is record
      flags : aliased long;  -- /usr/include/X11/Xutil.h:120
      input : aliased int;  -- /usr/include/X11/Xutil.h:121
      initial_state : aliased int;  -- /usr/include/X11/Xutil.h:123
      icon_pixmap : aliased X11.Pixmap;  -- /usr/include/X11/Xutil.h:124
      icon_window : aliased X11.Window;  -- /usr/include/X11/Xutil.h:125
      icon_x : aliased int;  -- /usr/include/X11/Xutil.h:126
      icon_y : aliased int;  -- /usr/include/X11/Xutil.h:126
      icon_mask : aliased X11.Pixmap;  -- /usr/include/X11/Xutil.h:127
      window_group : aliased X11.XID;  -- /usr/include/X11/Xutil.h:128
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xutil.h:130

  -- does this application rely on the window manager to
  --			get keyboard input?  

  -- see below  
  -- pixmap to be used as icon  
  -- window to be used as icon  
  -- initial position of icon  
  -- icon mask bitmap  
  -- id of related window group  
  -- this structure may be extended in the future  
  -- definition for flags of XWMHints  
  -- definitions for initial window state  
  -- * Obsolete states no longer defined by ICCCM
  --  

  -- some wm's may put it on inactive menu  
  -- * new structure for manipulating TEXT properties; used with WM_NAME,
  -- * WM_ICON_NAME, WM_CLIENT_MACHINE, and WM_COMMAND.
  --  

  -- same as Property routines  
   --  skipped anonymous struct anon_100

   type XTextProperty is record
      value : access unsigned_char;  -- /usr/include/X11/Xutil.h:164
      encoding : aliased X11.Atom;  -- /usr/include/X11/Xutil.h:165
      format : aliased int;  -- /usr/include/X11/Xutil.h:166
      nitems : aliased unsigned_long;  -- /usr/include/X11/Xutil.h:167
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xutil.h:168

  -- prop type  
  -- prop data format: 8, 16, or 32  
  -- number of data items in value  
  -- STRING  
  -- COMPOUND_TEXT  
  -- text in owner's encoding (current locale) 
  -- STRING, else COMPOUND_TEXT  
  -- The following is an XFree86 extension, introduced in November 2000  
  -- UTF8_STRING  
   type XICCEncodingStyle is 
     (XStringStyle,
      XCompoundTextStyle,
      XTextStyle,
      XStdICCTextStyle,
      XUTF8StringStyle)
   with Convention => C;  -- /usr/include/X11/Xutil.h:181

   --  skipped anonymous struct anon_102

   type XIconSize is record
      min_width : aliased int;  -- /usr/include/X11/Xutil.h:184
      min_height : aliased int;  -- /usr/include/X11/Xutil.h:184
      max_width : aliased int;  -- /usr/include/X11/Xutil.h:185
      max_height : aliased int;  -- /usr/include/X11/Xutil.h:185
      width_inc : aliased int;  -- /usr/include/X11/Xutil.h:186
      height_inc : aliased int;  -- /usr/include/X11/Xutil.h:186
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xutil.h:187

   --  skipped anonymous struct anon_103

   type XClassHint is record
      res_name : Interfaces.C.Strings.chars_ptr;  -- /usr/include/X11/Xutil.h:190
      res_class : Interfaces.C.Strings.chars_ptr;  -- /usr/include/X11/Xutil.h:191
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xutil.h:192

  -- * These macros are used to give some sugar to the image routines so that
  -- * naive people are more comfortable with them.
  --  

  -- * Compose sequence status structure, used in calling XLookupString.
  --  

  -- state table pointer  
   type u_XComposeStatus is record
      compose_ptr : Xlib.XPointer;  -- /usr/include/X11/Xutil.h:232
      chars_matched : aliased int;  -- /usr/include/X11/Xutil.h:233
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xutil.h:231

  -- match state  
   subtype XComposeStatus is u_XComposeStatus;  -- /usr/include/X11/Xutil.h:234

  -- * Keysym macros, used on Keysyms to test for classes of symbols
  --  

  -- * opaque reference to Region data type
  --  

   type u_XRegion is null record;   -- incomplete struct

   type Region is access all u_XRegion;  -- /usr/include/X11/Xutil.h:273

  -- Return values from XRectInRegion()  
  -- * Information used by the visual utility routines to find desired visual
  -- * type from the many visuals a display may support.
  --  

   --  skipped anonymous struct anon_104

   type XVisualInfo is record
      the_visual : access Xlib.Visual;  -- /usr/include/X11/Xutil.h:288
      the_visualid : aliased X11.VisualID;  -- /usr/include/X11/Xutil.h:289
      screen : aliased int;  -- /usr/include/X11/Xutil.h:290
      depth : aliased int;  -- /usr/include/X11/Xutil.h:291
      c_class : aliased int;  -- /usr/include/X11/Xutil.h:293
      red_mask : aliased unsigned_long;  -- /usr/include/X11/Xutil.h:297
      green_mask : aliased unsigned_long;  -- /usr/include/X11/Xutil.h:298
      blue_mask : aliased unsigned_long;  -- /usr/include/X11/Xutil.h:299
      colormap_size : aliased int;  -- /usr/include/X11/Xutil.h:300
      bits_per_rgb : aliased int;  -- /usr/include/X11/Xutil.h:301
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xutil.h:302

  -- C++  
  -- * This defines a window manager property that clients may use to
  -- * share standard color maps of type RGB_COLOR_MAP:
  --  

   --  skipped anonymous struct anon_105

   type XStandardColormap is record
      the_colormap : aliased X11.Colormap;  -- /usr/include/X11/Xutil.h:321
      red_max : aliased unsigned_long;  -- /usr/include/X11/Xutil.h:322
      red_mult : aliased unsigned_long;  -- /usr/include/X11/Xutil.h:323
      green_max : aliased unsigned_long;  -- /usr/include/X11/Xutil.h:324
      green_mult : aliased unsigned_long;  -- /usr/include/X11/Xutil.h:325
      blue_max : aliased unsigned_long;  -- /usr/include/X11/Xutil.h:326
      blue_mult : aliased unsigned_long;  -- /usr/include/X11/Xutil.h:327
      base_pixel : aliased unsigned_long;  -- /usr/include/X11/Xutil.h:328
      the_visualid : aliased X11.VisualID;  -- /usr/include/X11/Xutil.h:329
      killid : aliased X11.XID;  -- /usr/include/X11/Xutil.h:330
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xutil.h:331

  -- added by ICCCM version 1  
  -- added by ICCCM version 1  
  -- * return codes for XReadBitmapFile and XWriteBitmapFile
  --  

  --***************************************************************
  -- *
  -- * Context Management
  -- *
  -- *************************************************************** 

  -- Associative lookup table return codes  
   subtype XContext is int;  -- /usr/include/X11/Xutil.h:357

  -- The following declarations are alphabetized.  
   function XAllocClassHint return access XClassHint  -- /usr/include/X11/Xutil.h:366
   with Import => True, 
        Convention => C, 
        External_Name => "XAllocClassHint";

   function XAllocIconSize return access XIconSize  -- /usr/include/X11/Xutil.h:370
   with Import => True, 
        Convention => C, 
        External_Name => "XAllocIconSize";

   function XAllocSizeHints return access XSizeHints  -- /usr/include/X11/Xutil.h:374
   with Import => True, 
        Convention => C, 
        External_Name => "XAllocSizeHints";

   function XAllocStandardColormap return access XStandardColormap  -- /usr/include/X11/Xutil.h:378
   with Import => True, 
        Convention => C, 
        External_Name => "XAllocStandardColormap";

   function XAllocWMHints return access XWMHints  -- /usr/include/X11/Xutil.h:382
   with Import => True, 
        Convention => C, 
        External_Name => "XAllocWMHints";

   function XClipBox (arg1 : Region; arg2 : access Xlib.XRectangle) return int  -- /usr/include/X11/Xutil.h:386
   with Import => True, 
        Convention => C, 
        External_Name => "XClipBox";

  -- r  
  -- rect_return  
   function XCreateRegion return Region  -- /usr/include/X11/Xutil.h:391
   with Import => True, 
        Convention => C, 
        External_Name => "XCreateRegion";

   function XDefaultString return Interfaces.C.Strings.chars_ptr  -- /usr/include/X11/Xutil.h:395
   with Import => True, 
        Convention => C, 
        External_Name => "XDefaultString";

   function XDeleteContext
     (arg1 : access Xlib.Display;
      arg2 : X11.XID;
      arg3 : XContext) return int  -- /usr/include/X11/Xutil.h:397
   with Import => True, 
        Convention => C, 
        External_Name => "XDeleteContext";

  -- display  
  -- rid  
  -- context  
   function XDestroyRegion (arg1 : Region) return int  -- /usr/include/X11/Xutil.h:403
   with Import => True, 
        Convention => C, 
        External_Name => "XDestroyRegion";

  -- r  
   function XEmptyRegion (arg1 : Region) return int  -- /usr/include/X11/Xutil.h:407
   with Import => True, 
        Convention => C, 
        External_Name => "XEmptyRegion";

  -- r  
   function XEqualRegion (arg1 : Region; arg2 : Region) return int  -- /usr/include/X11/Xutil.h:411
   with Import => True, 
        Convention => C, 
        External_Name => "XEqualRegion";

  -- r1  
  -- r2  
   function XFindContext
     (arg1 : access Xlib.Display;
      arg2 : X11.XID;
      arg3 : XContext;
      arg4 : System.Address) return int  -- /usr/include/X11/Xutil.h:416
   with Import => True, 
        Convention => C, 
        External_Name => "XFindContext";

  -- display  
  -- rid  
  -- context  
  -- data_return  
   function XGetClassHint
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : access XClassHint) return int  -- /usr/include/X11/Xutil.h:423
   with Import => True, 
        Convention => C, 
        External_Name => "XGetClassHint";

  -- display  
  -- w  
  -- class_hints_return  
   function XGetIconSizes
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : System.Address;
      arg4 : access int) return int  -- /usr/include/X11/Xutil.h:429
   with Import => True, 
        Convention => C, 
        External_Name => "XGetIconSizes";

  -- display  
  -- w  
  -- size_list_return  
  -- count_return  
   function XGetNormalHints
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : access XSizeHints) return int  -- /usr/include/X11/Xutil.h:436
   with Import => True, 
        Convention => C, 
        External_Name => "XGetNormalHints";

  -- display  
  -- w  
  -- hints_return  
   function XGetRGBColormaps
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : System.Address;
      arg4 : access int;
      arg5 : X11.Atom) return int  -- /usr/include/X11/Xutil.h:442
   with Import => True, 
        Convention => C, 
        External_Name => "XGetRGBColormaps";

  -- display  
  -- w  
  -- stdcmap_return  
  -- count_return  
  -- property  
   function XGetSizeHints
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : access XSizeHints;
      arg4 : X11.Atom) return int  -- /usr/include/X11/Xutil.h:450
   with Import => True, 
        Convention => C, 
        External_Name => "XGetSizeHints";

  -- display  
  -- w  
  -- hints_return  
  -- property  
   function XGetStandardColormap
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : access XStandardColormap;
      arg4 : X11.Atom) return int  -- /usr/include/X11/Xutil.h:457
   with Import => True, 
        Convention => C, 
        External_Name => "XGetStandardColormap";

  -- display  
  -- w  
  -- colormap_return  
  -- property  
   function XGetTextProperty
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : access XTextProperty;
      arg4 : X11.Atom) return int  -- /usr/include/X11/Xutil.h:464
   with Import => True, 
        Convention => C, 
        External_Name => "XGetTextProperty";

  -- display  
  -- window  
  -- text_prop_return  
  -- property  
   function XGetVisualInfo
     (arg1 : access Xlib.Display;
      arg2 : long;
      arg3 : access XVisualInfo;
      arg4 : access int) return access XVisualInfo  -- /usr/include/X11/Xutil.h:471
   with Import => True, 
        Convention => C, 
        External_Name => "XGetVisualInfo";

  -- display  
  -- vinfo_mask  
  -- vinfo_template  
  -- nitems_return  
   function XGetWMClientMachine
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : access XTextProperty) return int  -- /usr/include/X11/Xutil.h:478
   with Import => True, 
        Convention => C, 
        External_Name => "XGetWMClientMachine";

  -- display  
  -- w  
  -- text_prop_return  
   function XGetWMHints (arg1 : access Xlib.Display; arg2 : X11.Window) return access XWMHints  -- /usr/include/X11/Xutil.h:484
   with Import => True, 
        Convention => C, 
        External_Name => "XGetWMHints";

  -- display  
  -- w  
   function XGetWMIconName
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : access XTextProperty) return int  -- /usr/include/X11/Xutil.h:489
   with Import => True, 
        Convention => C, 
        External_Name => "XGetWMIconName";

  -- display  
  -- w  
  -- text_prop_return  
   function XGetWMName
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : access XTextProperty) return int  -- /usr/include/X11/Xutil.h:495
   with Import => True, 
        Convention => C, 
        External_Name => "XGetWMName";

  -- display  
  -- w  
  -- text_prop_return  
   function XGetWMNormalHints
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : access XSizeHints;
      arg4 : access long) return int  -- /usr/include/X11/Xutil.h:501
   with Import => True, 
        Convention => C, 
        External_Name => "XGetWMNormalHints";

  -- display  
  -- w  
  -- hints_return  
  -- supplied_return  
   function XGetWMSizeHints
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : access XSizeHints;
      arg4 : access long;
      arg5 : X11.Atom) return int  -- /usr/include/X11/Xutil.h:508
   with Import => True, 
        Convention => C, 
        External_Name => "XGetWMSizeHints";

  -- display  
  -- w  
  -- hints_return  
  -- supplied_return  
  -- property  
   function XGetZoomHints
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : access XSizeHints) return int  -- /usr/include/X11/Xutil.h:516
   with Import => True, 
        Convention => C, 
        External_Name => "XGetZoomHints";

  -- display  
  -- w  
  -- zhints_return  
   function XIntersectRegion
     (arg1 : Region;
      arg2 : Region;
      arg3 : Region) return int  -- /usr/include/X11/Xutil.h:522
   with Import => True, 
        Convention => C, 
        External_Name => "XIntersectRegion";

  -- sra  
  -- srb  
  -- dr_return  
   procedure XConvertCase
     (arg1 : X11.KeySym;
      arg2 : access X11.KeySym;
      arg3 : access X11.KeySym)  -- /usr/include/X11/Xutil.h:528
   with Import => True, 
        Convention => C, 
        External_Name => "XConvertCase";

  -- sym  
  -- lower  
  -- upper  
   function XLookupString
     (arg1 : access Xlib.XKeyEvent;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int;
      arg4 : access X11.KeySym;
      arg5 : access XComposeStatus) return int  -- /usr/include/X11/Xutil.h:534
   with Import => True, 
        Convention => C, 
        External_Name => "XLookupString";

  -- event_struct  
  -- buffer_return  
  -- bytes_buffer  
  -- keysym_return  
  -- status_in_out  
   function XMatchVisualInfo
     (arg1 : access Xlib.Display;
      arg2 : int;
      arg3 : int;
      arg4 : int;
      arg5 : access XVisualInfo) return int  -- /usr/include/X11/Xutil.h:542
   with Import => True, 
        Convention => C, 
        External_Name => "XMatchVisualInfo";

  -- display  
  -- screen  
  -- depth  
  -- class  
  -- vinfo_return  
   function XOffsetRegion
     (arg1 : Region;
      arg2 : int;
      arg3 : int) return int  -- /usr/include/X11/Xutil.h:550
   with Import => True, 
        Convention => C, 
        External_Name => "XOffsetRegion";

  -- r  
  -- dx  
  -- dy  
   function XPointInRegion
     (arg1 : Region;
      arg2 : int;
      arg3 : int) return int  -- /usr/include/X11/Xutil.h:556
   with Import => True, 
        Convention => C, 
        External_Name => "XPointInRegion";

  -- r  
  -- x  
  -- y  
   function XPolygonRegion
     (arg1 : access Xlib.XPoint;
      arg2 : int;
      arg3 : int) return Region  -- /usr/include/X11/Xutil.h:562
   with Import => True, 
        Convention => C, 
        External_Name => "XPolygonRegion";

  -- points  
  -- n  
  -- fill_rule  
   function XRectInRegion
     (arg1 : Region;
      arg2 : int;
      arg3 : int;
      arg4 : unsigned;
      arg5 : unsigned) return int  -- /usr/include/X11/Xutil.h:568
   with Import => True, 
        Convention => C, 
        External_Name => "XRectInRegion";

  -- r  
  -- x  
  -- y  
  -- width  
  -- height  
   function XSaveContext
     (arg1 : access Xlib.Display;
      arg2 : X11.XID;
      arg3 : XContext;
      arg4 : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/X11/Xutil.h:576
   with Import => True, 
        Convention => C, 
        External_Name => "XSaveContext";

  -- display  
  -- rid  
  -- context  
  -- data  
   function XSetClassHint
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : access XClassHint) return int  -- /usr/include/X11/Xutil.h:583
   with Import => True, 
        Convention => C, 
        External_Name => "XSetClassHint";

  -- display  
  -- w  
  -- class_hints  
   function XSetIconSizes
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : access XIconSize;
      arg4 : int) return int  -- /usr/include/X11/Xutil.h:589
   with Import => True, 
        Convention => C, 
        External_Name => "XSetIconSizes";

  -- display  
  -- w  
  -- size_list  
  -- count  
   function XSetNormalHints
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : access XSizeHints) return int  -- /usr/include/X11/Xutil.h:596
   with Import => True, 
        Convention => C, 
        External_Name => "XSetNormalHints";

  -- display  
  -- w  
  -- hints  
   procedure XSetRGBColormaps
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : access XStandardColormap;
      arg4 : int;
      arg5 : X11.Atom)  -- /usr/include/X11/Xutil.h:602
   with Import => True, 
        Convention => C, 
        External_Name => "XSetRGBColormaps";

  -- display  
  -- w  
  -- stdcmaps  
  -- count  
  -- property  
   function XSetSizeHints
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : access XSizeHints;
      arg4 : X11.Atom) return int  -- /usr/include/X11/Xutil.h:610
   with Import => True, 
        Convention => C, 
        External_Name => "XSetSizeHints";

  -- display  
  -- w  
  -- hints  
  -- property  
   function XSetStandardProperties
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : X11.Pixmap;
      arg6 : System.Address;
      arg7 : int;
      arg8 : access XSizeHints) return int  -- /usr/include/X11/Xutil.h:617
   with Import => True, 
        Convention => C, 
        External_Name => "XSetStandardProperties";

  -- display  
  -- w  
  -- window_name  
  -- icon_name  
  -- icon_pixmap  
  -- argv  
  -- argc  
  -- hints  
   procedure XSetTextProperty
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : access XTextProperty;
      arg4 : X11.Atom)  -- /usr/include/X11/Xutil.h:628
   with Import => True, 
        Convention => C, 
        External_Name => "XSetTextProperty";

  -- display  
  -- w  
  -- text_prop  
  -- property  
   procedure XSetWMClientMachine
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : access XTextProperty)  -- /usr/include/X11/Xutil.h:635
   with Import => True, 
        Convention => C, 
        External_Name => "XSetWMClientMachine";

  -- display  
  -- w  
  -- text_prop  
   function XSetWMHints
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : access XWMHints) return int  -- /usr/include/X11/Xutil.h:641
   with Import => True, 
        Convention => C, 
        External_Name => "XSetWMHints";

  -- display  
  -- w  
  -- wm_hints  
   procedure XSetWMIconName
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : access XTextProperty)  -- /usr/include/X11/Xutil.h:647
   with Import => True, 
        Convention => C, 
        External_Name => "XSetWMIconName";

  -- display  
  -- w  
  -- text_prop  
   procedure XSetWMName
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : access XTextProperty)  -- /usr/include/X11/Xutil.h:653
   with Import => True, 
        Convention => C, 
        External_Name => "XSetWMName";

  -- display  
  -- w  
  -- text_prop  
   procedure XSetWMNormalHints
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : access XSizeHints)  -- /usr/include/X11/Xutil.h:659
   with Import => True, 
        Convention => C, 
        External_Name => "XSetWMNormalHints";

  -- display  
  -- w  
  -- hints  
   procedure XSetWMProperties
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : access XTextProperty;
      arg4 : access XTextProperty;
      arg5 : System.Address;
      arg6 : int;
      arg7 : access XSizeHints;
      arg8 : access XWMHints;
      arg9 : access XClassHint)  -- /usr/include/X11/Xutil.h:665
   with Import => True, 
        Convention => C, 
        External_Name => "XSetWMProperties";

  -- display  
  -- w  
  -- window_name  
  -- icon_name  
  -- argv  
  -- argc  
  -- normal_hints  
  -- wm_hints  
  -- class_hints  
   procedure XmbSetWMProperties
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : System.Address;
      arg6 : int;
      arg7 : access XSizeHints;
      arg8 : access XWMHints;
      arg9 : access XClassHint)  -- /usr/include/X11/Xutil.h:677
   with Import => True, 
        Convention => C, 
        External_Name => "XmbSetWMProperties";

  -- display  
  -- w  
  -- window_name  
  -- icon_name  
  -- argv  
  -- argc  
  -- normal_hints  
  -- wm_hints  
  -- class_hints  
   procedure Xutf8SetWMProperties
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : System.Address;
      arg6 : int;
      arg7 : access XSizeHints;
      arg8 : access XWMHints;
      arg9 : access XClassHint)  -- /usr/include/X11/Xutil.h:689
   with Import => True, 
        Convention => C, 
        External_Name => "Xutf8SetWMProperties";

  -- display  
  -- w  
  -- window_name  
  -- icon_name  
  -- argv  
  -- argc  
  -- normal_hints  
  -- wm_hints  
  -- class_hints  
   procedure XSetWMSizeHints
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : access XSizeHints;
      arg4 : X11.Atom)  -- /usr/include/X11/Xutil.h:701
   with Import => True, 
        Convention => C, 
        External_Name => "XSetWMSizeHints";

  -- display  
  -- w  
  -- hints  
  -- property  
   function XSetRegion
     (arg1 : access Xlib.Display;
      arg2 : Xlib.GC;
      arg3 : Region) return int  -- /usr/include/X11/Xutil.h:708
   with Import => True, 
        Convention => C, 
        External_Name => "XSetRegion";

  -- display  
  -- gc  
  -- r  
   procedure XSetStandardColormap
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : access XStandardColormap;
      arg4 : X11.Atom)  -- /usr/include/X11/Xutil.h:714
   with Import => True, 
        Convention => C, 
        External_Name => "XSetStandardColormap";

  -- display  
  -- w  
  -- colormap  
  -- property  
   function XSetZoomHints
     (arg1 : access Xlib.Display;
      arg2 : X11.Window;
      arg3 : access XSizeHints) return int  -- /usr/include/X11/Xutil.h:721
   with Import => True, 
        Convention => C, 
        External_Name => "XSetZoomHints";

  -- display  
  -- w  
  -- zhints  
   function XShrinkRegion
     (arg1 : Region;
      arg2 : int;
      arg3 : int) return int  -- /usr/include/X11/Xutil.h:727
   with Import => True, 
        Convention => C, 
        External_Name => "XShrinkRegion";

  -- r  
  -- dx  
  -- dy  
   function XStringListToTextProperty
     (arg1 : System.Address;
      arg2 : int;
      arg3 : access XTextProperty) return int  -- /usr/include/X11/Xutil.h:733
   with Import => True, 
        Convention => C, 
        External_Name => "XStringListToTextProperty";

  -- list  
  -- count  
  -- text_prop_return  
   function XSubtractRegion
     (arg1 : Region;
      arg2 : Region;
      arg3 : Region) return int  -- /usr/include/X11/Xutil.h:739
   with Import => True, 
        Convention => C, 
        External_Name => "XSubtractRegion";

  -- sra  
  -- srb  
  -- dr_return  
   function XmbTextListToTextProperty
     (the_display : access Xlib.Display;
      list : System.Address;
      count : int;
      style : XICCEncodingStyle;
      text_prop_return : access XTextProperty) return int  -- /usr/include/X11/Xutil.h:745
   with Import => True, 
        Convention => C, 
        External_Name => "XmbTextListToTextProperty";

   function XwcTextListToTextProperty
     (the_display : access Xlib.Display;
      list : System.Address;
      count : int;
      style : XICCEncodingStyle;
      text_prop_return : access XTextProperty) return int  -- /usr/include/X11/Xutil.h:753
   with Import => True, 
        Convention => C, 
        External_Name => "XwcTextListToTextProperty";

   function Xutf8TextListToTextProperty
     (the_display : access Xlib.Display;
      list : System.Address;
      count : int;
      style : XICCEncodingStyle;
      text_prop_return : access XTextProperty) return int  -- /usr/include/X11/Xutil.h:761
   with Import => True, 
        Convention => C, 
        External_Name => "Xutf8TextListToTextProperty";

   procedure XwcFreeStringList (list : System.Address)  -- /usr/include/X11/Xutil.h:769
   with Import => True, 
        Convention => C, 
        External_Name => "XwcFreeStringList";

   function XTextPropertyToStringList
     (arg1 : access XTextProperty;
      arg2 : System.Address;
      arg3 : access int) return int  -- /usr/include/X11/Xutil.h:773
   with Import => True, 
        Convention => C, 
        External_Name => "XTextPropertyToStringList";

  -- text_prop  
  -- list_return  
  -- count_return  
   function XmbTextPropertyToTextList
     (the_display : access Xlib.Display;
      text_prop : access constant XTextProperty;
      list_return : System.Address;
      count_return : access int) return int  -- /usr/include/X11/Xutil.h:779
   with Import => True, 
        Convention => C, 
        External_Name => "XmbTextPropertyToTextList";

   function XwcTextPropertyToTextList
     (the_display : access Xlib.Display;
      text_prop : access constant XTextProperty;
      list_return : System.Address;
      count_return : access int) return int  -- /usr/include/X11/Xutil.h:786
   with Import => True, 
        Convention => C, 
        External_Name => "XwcTextPropertyToTextList";

   function Xutf8TextPropertyToTextList
     (the_display : access Xlib.Display;
      text_prop : access constant XTextProperty;
      list_return : System.Address;
      count_return : access int) return int  -- /usr/include/X11/Xutil.h:793
   with Import => True, 
        Convention => C, 
        External_Name => "Xutf8TextPropertyToTextList";

   function XUnionRectWithRegion
     (arg1 : access Xlib.XRectangle;
      arg2 : Region;
      arg3 : Region) return int  -- /usr/include/X11/Xutil.h:800
   with Import => True, 
        Convention => C, 
        External_Name => "XUnionRectWithRegion";

  -- rectangle  
  -- src_region  
  -- dest_region_return  
   function XUnionRegion
     (arg1 : Region;
      arg2 : Region;
      arg3 : Region) return int  -- /usr/include/X11/Xutil.h:806
   with Import => True, 
        Convention => C, 
        External_Name => "XUnionRegion";

  -- sra  
  -- srb  
  -- dr_return  
   function XWMGeometry
     (arg1 : access Xlib.Display;
      arg2 : int;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : unsigned;
      arg6 : access XSizeHints;
      arg7 : access int;
      arg8 : access int;
      arg9 : access int;
      arg10 : access int;
      arg11 : access int) return int  -- /usr/include/X11/Xutil.h:812
   with Import => True, 
        Convention => C, 
        External_Name => "XWMGeometry";

  -- display  
  -- screen_number  
  -- user_geometry  
  -- default_geometry  
  -- border_width  
  -- hints  
  -- x_return  
  -- y_return  
  -- width_return  
  -- height_return  
  -- gravity_return  
   function XXorRegion
     (arg1 : Region;
      arg2 : Region;
      arg3 : Region) return int  -- /usr/include/X11/Xutil.h:826
   with Import => True, 
        Convention => C, 
        External_Name => "XXorRegion";

  -- sra  
  -- srb  
  -- dr_return  
end Xutil;
