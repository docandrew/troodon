pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with X11;
with System;

package Xlib is

   XlibSpecificationRelease : constant := 6;  --  /usr/include/X11/Xlib.h:36

   X_HAVE_UTF8_STRING : constant := 1;  --  /usr/include/X11/Xlib.h:70
   --  unsupported macro: Bool int
   --  unsupported macro: Status int

   -- Troodon: remove these
   --True : constant := 1;  --  /usr/include/X11/Xlib.h:84
   --False : constant := 0;  --  /usr/include/X11/Xlib.h:85

   QueuedAlready : constant := 0;  --  /usr/include/X11/Xlib.h:87
   QueuedAfterReading : constant := 1;  --  /usr/include/X11/Xlib.h:88
   QueuedAfterFlush : constant := 2;  --  /usr/include/X11/Xlib.h:89
   --  arg-macro: function ConnectionNumber (dpy)
   --    return ((_XPrivDisplay)(dpy)).fd;
   --  arg-macro: function RootWindow (dpy, scr)
   --    return ScreenOfDisplay(dpy,scr).root;
   --  arg-macro: function DefaultScreen (dpy)
   --    return ((_XPrivDisplay)(dpy)).default_screen;
   --  arg-macro: function DefaultRootWindow (dpy)
   --    return ScreenOfDisplay(dpy,DefaultScreen(dpy)).root;
   --  arg-macro: function DefaultVisual (dpy, scr)
   --    return ScreenOfDisplay(dpy,scr).root_visual;
   --  arg-macro: function DefaultGC (dpy, scr)
   --    return ScreenOfDisplay(dpy,scr).default_gc;
   --  arg-macro: function BlackPixel (dpy, scr)
   --    return ScreenOfDisplay(dpy,scr).black_pixel;
   --  arg-macro: function WhitePixel (dpy, scr)
   --    return ScreenOfDisplay(dpy,scr).white_pixel;
   --  unsupported macro: AllPlanes ((unsigned long)~0L)
   --  arg-macro: function QLength (dpy)
   --    return ((_XPrivDisplay)(dpy)).qlen;
   --  arg-macro: function DisplayWidth (dpy, scr)
   --    return ScreenOfDisplay(dpy,scr).width;
   --  arg-macro: function DisplayHeight (dpy, scr)
   --    return ScreenOfDisplay(dpy,scr).height;
   --  arg-macro: function DisplayWidthMM (dpy, scr)
   --    return ScreenOfDisplay(dpy,scr).mwidth;
   --  arg-macro: function DisplayHeightMM (dpy, scr)
   --    return ScreenOfDisplay(dpy,scr).mheight;
   --  arg-macro: function DisplayPlanes (dpy, scr)
   --    return ScreenOfDisplay(dpy,scr).root_depth;
   --  arg-macro: function DisplayCells (dpy, scr)
   --    return DefaultVisual(dpy,scr).map_entries;
   --  arg-macro: function ScreenCount (dpy)
   --    return ((_XPrivDisplay)(dpy)).nscreens;
   --  arg-macro: function ServerVendor (dpy)
   --    return ((_XPrivDisplay)(dpy)).vendor;
   --  arg-macro: function ProtocolVersion (dpy)
   --    return ((_XPrivDisplay)(dpy)).proto_major_version;
   --  arg-macro: function ProtocolRevision (dpy)
   --    return ((_XPrivDisplay)(dpy)).proto_minor_version;
   --  arg-macro: function VendorRelease (dpy)
   --    return ((_XPrivDisplay)(dpy)).release;
   --  arg-macro: function DisplayString (dpy)
   --    return ((_XPrivDisplay)(dpy)).display_name;
   --  arg-macro: function DefaultDepth (dpy, scr)
   --    return ScreenOfDisplay(dpy,scr).root_depth;
   --  arg-macro: function DefaultColormap (dpy, scr)
   --    return ScreenOfDisplay(dpy,scr).cmap;
   --  arg-macro: function BitmapUnit (dpy)
   --    return ((_XPrivDisplay)(dpy)).bitmap_unit;
   --  arg-macro: function BitmapBitOrder (dpy)
   --    return ((_XPrivDisplay)(dpy)).bitmap_bit_order;
   --  arg-macro: function BitmapPad (dpy)
   --    return ((_XPrivDisplay)(dpy)).bitmap_pad;
   --  arg-macro: function ImageByteOrder (dpy)
   --    return ((_XPrivDisplay)(dpy)).byte_order;
   --  arg-macro: function NextRequest (dpy)
   --    return ((_XPrivDisplay)(dpy)).request + 1;
   --  arg-macro: function LastKnownRequestProcessed (dpy)
   --    return ((_XPrivDisplay)(dpy)).last_request_read;
   --  arg-macro: function ScreenOfDisplay (dpy, scr)
   --    return and((_XPrivDisplay)(dpy)).screens(scr);
   --  arg-macro: procedure DefaultScreenOfDisplay (dpy)
   --    ScreenOfDisplay(dpy,DefaultScreen(dpy))
   --  arg-macro: function DisplayOfScreen (s)
   --    return (s).display;
   --  arg-macro: function RootWindowOfScreen (s)
   --    return (s).root;
   --  arg-macro: function BlackPixelOfScreen (s)
   --    return (s).black_pixel;
   --  arg-macro: function WhitePixelOfScreen (s)
   --    return (s).white_pixel;
   --  arg-macro: function DefaultColormapOfScreen (s)
   --    return (s).cmap;
   --  arg-macro: function DefaultDepthOfScreen (s)
   --    return (s).root_depth;
   --  arg-macro: function DefaultGCOfScreen (s)
   --    return (s).default_gc;
   --  arg-macro: function DefaultVisualOfScreen (s)
   --    return (s).root_visual;
   --  arg-macro: function WidthOfScreen (s)
   --    return (s).width;
   --  arg-macro: function HeightOfScreen (s)
   --    return (s).height;
   --  arg-macro: function WidthMMOfScreen (s)
   --    return (s).mwidth;
   --  arg-macro: function HeightMMOfScreen (s)
   --    return (s).mheight;
   --  arg-macro: function PlanesOfScreen (s)
   --    return (s).root_depth;
   --  arg-macro: function CellsOfScreen (s)
   --    return DefaultVisualOfScreen((s)).map_entries;
   --  arg-macro: function MinCmapsOfScreen (s)
   --    return (s).min_maps;
   --  arg-macro: function MaxCmapsOfScreen (s)
   --    return (s).max_maps;
   --  arg-macro: function DoesSaveUnders (s)
   --    return (s).save_unders;
   --  arg-macro: function DoesBackingStore (s)
   --    return (s).backing_store;
   --  arg-macro: function EventMaskOfScreen (s)
   --    return (s).root_input_mask;
   --  arg-macro: function XAllocID (dpy)
   --    return (*((_XPrivDisplay)(dpy)).resource_alloc)((dpy));

   XNRequiredCharSet : aliased constant String := "requiredCharSet" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1110
   XNQueryOrientation : aliased constant String := "queryOrientation" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1111
   XNBaseFontName : aliased constant String := "baseFontName" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1112
   XNOMAutomatic : aliased constant String := "omAutomatic" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1113
   XNMissingCharSet : aliased constant String := "missingCharSet" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1114
   XNDefaultString : aliased constant String := "defaultString" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1115
   XNOrientation : aliased constant String := "orientation" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1116
   XNDirectionalDependentDrawing : aliased constant String := "directionalDependentDrawing" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1117
   XNContextualDrawing : aliased constant String := "contextualDrawing" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1118
   XNFontInfo : aliased constant String := "fontInfo" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1119

   XIMPreeditArea : constant := 16#0001#;  --  /usr/include/X11/Xlib.h:1173
   XIMPreeditCallbacks : constant := 16#0002#;  --  /usr/include/X11/Xlib.h:1174
   XIMPreeditPosition : constant := 16#0004#;  --  /usr/include/X11/Xlib.h:1175
   XIMPreeditNothing : constant := 16#0008#;  --  /usr/include/X11/Xlib.h:1176
   XIMPreeditNone : constant := 16#0010#;  --  /usr/include/X11/Xlib.h:1177
   XIMStatusArea : constant := 16#0100#;  --  /usr/include/X11/Xlib.h:1178
   XIMStatusCallbacks : constant := 16#0200#;  --  /usr/include/X11/Xlib.h:1179
   XIMStatusNothing : constant := 16#0400#;  --  /usr/include/X11/Xlib.h:1180
   XIMStatusNone : constant := 16#0800#;  --  /usr/include/X11/Xlib.h:1181

   XNVaNestedList : aliased constant String := "XNVaNestedList" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1183
   XNQueryInputStyle : aliased constant String := "queryInputStyle" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1184
   XNClientWindow : aliased constant String := "clientWindow" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1185
   XNInputStyle : aliased constant String := "inputStyle" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1186
   XNFocusWindow : aliased constant String := "focusWindow" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1187
   XNResourceName : aliased constant String := "resourceName" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1188
   XNResourceClass : aliased constant String := "resourceClass" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1189
   XNGeometryCallback : aliased constant String := "geometryCallback" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1190
   XNDestroyCallback : aliased constant String := "destroyCallback" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1191
   XNFilterEvents : aliased constant String := "filterEvents" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1192
   XNPreeditStartCallback : aliased constant String := "preeditStartCallback" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1193
   XNPreeditDoneCallback : aliased constant String := "preeditDoneCallback" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1194
   XNPreeditDrawCallback : aliased constant String := "preeditDrawCallback" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1195
   XNPreeditCaretCallback : aliased constant String := "preeditCaretCallback" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1196
   XNPreeditStateNotifyCallback : aliased constant String := "preeditStateNotifyCallback" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1197
   XNPreeditAttributes : aliased constant String := "preeditAttributes" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1198
   XNStatusStartCallback : aliased constant String := "statusStartCallback" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1199
   XNStatusDoneCallback : aliased constant String := "statusDoneCallback" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1200
   XNStatusDrawCallback : aliased constant String := "statusDrawCallback" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1201
   XNStatusAttributes : aliased constant String := "statusAttributes" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1202
   XNArea : aliased constant String := "area" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1203
   XNAreaNeeded : aliased constant String := "areaNeeded" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1204
   XNSpotLocation : aliased constant String := "spotLocation" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1205
   XNColormap : aliased constant String := "colorMap" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1206
   XNStdColormap : aliased constant String := "stdColorMap" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1207
   XNForeground : aliased constant String := "foreground" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1208
   XNBackground : aliased constant String := "background" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1209
   XNBackgroundPixmap : aliased constant String := "backgroundPixmap" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1210
   XNFontSet : aliased constant String := "fontSet" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1211
   XNLineSpace : aliased constant String := "lineSpace" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1212
   XNCursor : aliased constant String := "cursor" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1213

   XNQueryIMValuesList : aliased constant String := "queryIMValuesList" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1215
   XNQueryICValuesList : aliased constant String := "queryICValuesList" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1216
   XNVisiblePosition : aliased constant String := "visiblePosition" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1217
   XNR6PreeditCallback : aliased constant String := "r6PreeditCallback" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1218
   XNStringConversionCallback : aliased constant String := "stringConversionCallback" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1219
   XNStringConversion : aliased constant String := "stringConversion" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1220
   XNResetState : aliased constant String := "resetState" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1221
   XNHotKey : aliased constant String := "hotKey" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1222
   XNHotKeyState : aliased constant String := "hotKeyState" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1223
   XNPreeditState : aliased constant String := "preeditState" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1224
   XNSeparatorofNestedList : aliased constant String := "separatorofNestedList" & ASCII.NUL;  --  /usr/include/X11/Xlib.h:1225

   XBufferOverflow : constant := -1;  --  /usr/include/X11/Xlib.h:1227
   XLookupNone : constant := 1;  --  /usr/include/X11/Xlib.h:1228
   XLookupChars : constant := 2;  --  /usr/include/X11/Xlib.h:1229
   XLookupKeySym : constant := 3;  --  /usr/include/X11/Xlib.h:1230
   XLookupBoth : constant := 4;  --  /usr/include/X11/Xlib.h:1231

   XIMReverse : constant := 1;  --  /usr/include/X11/Xlib.h:1247
   XIMUnderline : constant := (2**1);  --  /usr/include/X11/Xlib.h:1248
   XIMHighlight : constant := (2**2);  --  /usr/include/X11/Xlib.h:1249
   XIMPrimary : constant := (2**5);  --  /usr/include/X11/Xlib.h:1250
   XIMSecondary : constant := (2**6);  --  /usr/include/X11/Xlib.h:1251
   XIMTertiary : constant := (2**7);  --  /usr/include/X11/Xlib.h:1252
   XIMVisibleToForward : constant := (2**8);  --  /usr/include/X11/Xlib.h:1253
   XIMVisibleToBackword : constant := (2**9);  --  /usr/include/X11/Xlib.h:1254
   XIMVisibleToCenter : constant := (2**10);  --  /usr/include/X11/Xlib.h:1255

   XIMPreeditUnKnown : constant := 0;  --  /usr/include/X11/Xlib.h:1269
   XIMPreeditEnable : constant := 1;  --  /usr/include/X11/Xlib.h:1270
   XIMPreeditDisable : constant := (2**1);  --  /usr/include/X11/Xlib.h:1271

   XIMInitialState : constant := 1;  --  /usr/include/X11/Xlib.h:1279
   XIMPreserveState : constant := (2**1);  --  /usr/include/X11/Xlib.h:1280

   XIMStringConversionLeftEdge : constant := (16#00000001#);  --  /usr/include/X11/Xlib.h:1284
   XIMStringConversionRightEdge : constant := (16#00000002#);  --  /usr/include/X11/Xlib.h:1285
   XIMStringConversionTopEdge : constant := (16#00000004#);  --  /usr/include/X11/Xlib.h:1286
   XIMStringConversionBottomEdge : constant := (16#00000008#);  --  /usr/include/X11/Xlib.h:1287
   XIMStringConversionConcealed : constant := (16#00000010#);  --  /usr/include/X11/Xlib.h:1288
   XIMStringConversionWrapped : constant := (16#00000020#);  --  /usr/include/X11/Xlib.h:1289

   XIMStringConversionBuffer : constant := (16#0001#);  --  /usr/include/X11/Xlib.h:1305
   XIMStringConversionLine : constant := (16#0002#);  --  /usr/include/X11/Xlib.h:1306
   XIMStringConversionWord : constant := (16#0003#);  --  /usr/include/X11/Xlib.h:1307
   XIMStringConversionChar : constant := (16#0004#);  --  /usr/include/X11/Xlib.h:1308

   XIMStringConversionSubstitution : constant := (16#0001#);  --  /usr/include/X11/Xlib.h:1312
   XIMStringConversionRetrieval : constant := (16#0002#);  --  /usr/include/X11/Xlib.h:1313

   XIMHotKeyStateON : constant := (16#0001#);  --  /usr/include/X11/Xlib.h:1378
   XIMHotKeyStateOFF : constant := (16#0002#);  --  /usr/include/X11/Xlib.h:1379

  --Copyright 1985, 1986, 1987, 1991, 1998  The Open Group
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
  -- 

  -- *	Xlib.h - Header definition and support file for the C subroutine
  -- *	interface library (Xlib) to the X Window System Protocol (V11).
  -- *	Structures and symbols starting with "_" are private to the library.
  --  

  -- applications should not depend on these two headers being included!  
  -- replace this with #include or typedef appropriate for your system  
   --  skipped func _Xmblen

  -- API mentioning "UTF8" or "utf8" is an XFree86 extension, introduced in
  --   November 2000. Its presence is indicated through the following macro.  

  -- The Xlib structs are full of implicit padding to properly align members.
  --   We can't clean that up without breaking ABI, so tell clang not to bother
  --   complaining about it.  

   type XPointer is new Interfaces.C.Strings.chars_ptr;  -- /usr/include/X11/Xlib.h:80

  -- macros for screen oriented applications (toolkit)  
  -- * Extensions need a way to hang private data on some structures.
  --  

  -- number returned by XRegisterExtension  
   type u_XExtData;
   type u_XExtData is record
      number : aliased int;  -- /usr/include/X11/Xlib.h:149
      next : access u_XExtData;  -- /usr/include/X11/Xlib.h:150
      free_private : access function (arg1 : access u_XExtData) return int;  -- /usr/include/X11/Xlib.h:151
      private_data : XPointer;  -- /usr/include/X11/Xlib.h:154
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:148

  -- next item on list of data for structure  
  -- called to free private storage  
  -- data private to this extension.  
   subtype XExtData is u_XExtData;  -- /usr/include/X11/Xlib.h:155

  -- * This file contains structures used by the extension mechanism.
  --  

  -- public to extension, cannot be changed  
  -- extension number  
   --  skipped anonymous struct anon_36

   type XExtCodes is record
      extension : aliased int;  -- /usr/include/X11/Xlib.h:161
      major_opcode : aliased int;  -- /usr/include/X11/Xlib.h:162
      first_event : aliased int;  -- /usr/include/X11/Xlib.h:163
      first_error : aliased int;  -- /usr/include/X11/Xlib.h:164
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:165

  -- major op-code assigned by server  
  -- first event number for the extension  
  -- first error number for the extension  
  -- * Data structure for retrieving info about pixmap formats.
  --  

   --  skipped anonymous struct anon_37

   type XPixmapFormatValues is record
      depth : aliased int;  -- /usr/include/X11/Xlib.h:172
      bits_per_pixel : aliased int;  -- /usr/include/X11/Xlib.h:173
      scanline_pad : aliased int;  -- /usr/include/X11/Xlib.h:174
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:175

  -- * Data structure for setting graphics context.
  --  

  -- logical operation  
   --  skipped anonymous struct anon_38

   type XGCValues is record
      c_function : aliased int;  -- /usr/include/X11/Xlib.h:182
      plane_mask : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:183
      foreground : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:184
      background : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:185
      line_width : aliased int;  -- /usr/include/X11/Xlib.h:186
      line_style : aliased int;  -- /usr/include/X11/Xlib.h:187
      cap_style : aliased int;  -- /usr/include/X11/Xlib.h:188
      join_style : aliased int;  -- /usr/include/X11/Xlib.h:190
      fill_style : aliased int;  -- /usr/include/X11/Xlib.h:191
      fill_rule : aliased int;  -- /usr/include/X11/Xlib.h:193
      arc_mode : aliased int;  -- /usr/include/X11/Xlib.h:194
      tile : aliased X11.Pixmap;  -- /usr/include/X11/Xlib.h:195
      stipple : aliased X11.Pixmap;  -- /usr/include/X11/Xlib.h:196
      ts_x_origin : aliased int;  -- /usr/include/X11/Xlib.h:197
      ts_y_origin : aliased int;  -- /usr/include/X11/Xlib.h:198
      the_font : aliased X11.Font;  -- /usr/include/X11/Xlib.h:199
      subwindow_mode : aliased int;  -- /usr/include/X11/Xlib.h:200
      graphics_exposures : aliased int;  -- /usr/include/X11/Xlib.h:201
      clip_x_origin : aliased int;  -- /usr/include/X11/Xlib.h:202
      clip_y_origin : aliased int;  -- /usr/include/X11/Xlib.h:203
      clip_mask : aliased X11.Pixmap;  -- /usr/include/X11/Xlib.h:204
      dash_offset : aliased int;  -- /usr/include/X11/Xlib.h:205
      dashes : aliased char;  -- /usr/include/X11/Xlib.h:206
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:207

  -- plane mask  
  -- foreground pixel  
  -- background pixel  
  -- line width  
  -- LineSolid, LineOnOffDash, LineDoubleDash  
  -- CapNotLast, CapButt,
  --				   CapRound, CapProjecting  

  -- JoinMiter, JoinRound, JoinBevel  
  -- FillSolid, FillTiled,
  --				   FillStippled, FillOpaeueStippled  

  -- EvenOddRule, WindingRule  
  -- ArcChord, ArcPieSlice  
  -- tile pixmap for tiling operations  
  -- stipple 1 plane pixmap for stipping  
  -- offset for tile or stipple operations  
  -- default text font for text operations  
  -- ClipByChildren, IncludeInferiors  
  -- boolean, should exposures be generated  
  -- origin for clipping  
  -- bitmap clipping; other calls for rects  
  -- patterned/dashed line information  
  -- * Graphics context.  The contents of this structure are implementation
  -- * dependent.  A GC should be treated as opaque by application code.
  --  

   type u_XGC is null record;   -- incomplete struct

  -- hook for extension to hang data  
  -- protocol ID for graphics context  
  -- there is more to this structure, but it is private to Xlib  
   type GC is access all u_XGC;  -- /usr/include/X11/Xlib.h:222

  -- * Visual structure; contains information about colormapping possible.
  --  

  -- hook for extension to hang data  
   --  skipped anonymous struct anon_39

   type Visual is record
      ext_data : access XExtData;  -- /usr/include/X11/Xlib.h:228
      the_visualid : aliased X11.VisualID;  -- /usr/include/X11/Xlib.h:229
      c_class : aliased int;  -- /usr/include/X11/Xlib.h:231
      red_mask : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:235
      green_mask : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:235
      blue_mask : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:235
      bits_per_rgb : aliased int;  -- /usr/include/X11/Xlib.h:236
      map_entries : aliased int;  -- /usr/include/X11/Xlib.h:237
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:238

  -- visual id of this visual  
  -- C++ class of screen (monochrome, etc.)  
  -- class of screen (monochrome, etc.)  
  -- mask values  
  -- log base 2 of distinct color values  
  -- color map entries  
  -- * Depth structure; contains information for each possible depth.
  --  

  -- this depth (Z) of the depth  
   --  skipped anonymous struct anon_40

   type Depth is record
      depth : aliased int;  -- /usr/include/X11/Xlib.h:244
      nvisuals : aliased int;  -- /usr/include/X11/Xlib.h:245
      visuals : access Visual;  -- /usr/include/X11/Xlib.h:246
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:247

  -- number of Visual types at this depth  
  -- list of visuals possible at this depth  
  -- * Information about the screen.  The contents of this structure are
  -- * implementation dependent.  A Screen should be treated as opaque
  -- * by application code.
  --  

  -- Forward declare before use for C++  
  -- (Troodon - edit)  
  --type u_XDisplay is null record;   -- incomplete struct
  --type XDisplay is null record;
    
  -- An 8 by max_keypermod array of modifiers
  -- * Display datatype maintaining display specific data.
  -- * The contents of this structure are implementation dependent.
  -- * A Display should be treated as opaque by application code.
  --  

  --(Troodon: edit)
  type Display is null record;  -- /usr/include/X11/Xlib.h:487

  -- hook for extension to hang data  
   --  skipped anonymous struct anon_41

   type Screen is record
      ext_data : access XExtData;  -- /usr/include/X11/Xlib.h:258
      u_display : access Display;  -- /usr/include/X11/Xlib.h:259
      root : aliased X11.Window;  -- /usr/include/X11/Xlib.h:260
      width : aliased int;  -- /usr/include/X11/Xlib.h:261
      height : aliased int;  -- /usr/include/X11/Xlib.h:261
      mwidth : aliased int;  -- /usr/include/X11/Xlib.h:262
      mheight : aliased int;  -- /usr/include/X11/Xlib.h:262
      ndepths : aliased int;  -- /usr/include/X11/Xlib.h:263
      depths : access Depth;  -- /usr/include/X11/Xlib.h:264
      root_depth : aliased int;  -- /usr/include/X11/Xlib.h:265
      root_visual : access Visual;  -- /usr/include/X11/Xlib.h:266
      default_gc : GC;  -- /usr/include/X11/Xlib.h:267
      cmap : aliased X11.Colormap;  -- /usr/include/X11/Xlib.h:268
      white_pixel : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:269
      black_pixel : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:270
      max_maps : aliased int;  -- /usr/include/X11/Xlib.h:271
      min_maps : aliased int;  -- /usr/include/X11/Xlib.h:271
      backing_store : aliased int;  -- /usr/include/X11/Xlib.h:272
      save_unders : aliased int;  -- /usr/include/X11/Xlib.h:273
      root_input_mask : aliased long;  -- /usr/include/X11/Xlib.h:274
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:275

  -- back pointer to display structure  
  -- Root window id.  
  -- width and height of screen  
  -- width and height of  in millimeters  
  -- number of depths possible  
  -- list of allowable depths on the screen  
  -- bits per pixel  
  -- root visual  
  -- GC for the root root visual  
  -- default color map  
  -- White and Black pixel values  
  -- max and min color maps  
  -- Never, WhenMapped, Always  
  -- initial root input mask  
  -- * Format structure; describes ZFormat data the screen will understand.
  --  

  -- hook for extension to hang data  
   --  skipped anonymous struct anon_42

   type ScreenFormat is record
      ext_data : access XExtData;  -- /usr/include/X11/Xlib.h:281
      depth : aliased int;  -- /usr/include/X11/Xlib.h:282
      bits_per_pixel : aliased int;  -- /usr/include/X11/Xlib.h:283
      scanline_pad : aliased int;  -- /usr/include/X11/Xlib.h:284
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:285

  -- depth of this image format  
  -- bits/pixel at this depth  
  -- scanline must padded to this multiple  
  -- * Data structure for setting window attributes.
  --  

  -- background or None or ParentRelative  
   --  skipped anonymous struct anon_43

   type XSetWindowAttributes is record
      background_pixmap : aliased X11.Pixmap;  -- /usr/include/X11/Xlib.h:291
      background_pixel : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:292
      border_pixmap : aliased X11.Pixmap;  -- /usr/include/X11/Xlib.h:293
      border_pixel : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:294
      bit_gravity : aliased int;  -- /usr/include/X11/Xlib.h:295
      win_gravity : aliased int;  -- /usr/include/X11/Xlib.h:296
      backing_store : aliased int;  -- /usr/include/X11/Xlib.h:297
      backing_planes : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:298
      backing_pixel : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:299
      save_under : aliased int;  -- /usr/include/X11/Xlib.h:300
      event_mask : aliased long;  -- /usr/include/X11/Xlib.h:301
      do_not_propagate_mask : aliased long;  -- /usr/include/X11/Xlib.h:302
      override_redirect : aliased int;  -- /usr/include/X11/Xlib.h:303
      the_colormap : aliased X11.Colormap;  -- /usr/include/X11/Xlib.h:304
      the_cursor : aliased X11.Cursor;  -- /usr/include/X11/Xlib.h:305
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:306

  -- background pixel  
  -- border of the window  
  -- border pixel value  
  -- one of bit gravity values  
  -- one of the window gravity values  
  -- NotUseful, WhenMapped, Always  
  -- planes to be preserved if possible  
  -- value to use in restoring planes  
  -- should bits under be saved? (popups)  
  -- set of events that should be saved  
  -- set of events that should not propagate  
  -- boolean value for override-redirect  
  -- color map to be associated with window  
  -- cursor to be displayed (or None)  
  -- location of window  
   --  skipped anonymous struct anon_44

   type XWindowAttributes is record
      x : aliased int;  -- /usr/include/X11/Xlib.h:309
      y : aliased int;  -- /usr/include/X11/Xlib.h:309
      width : aliased int;  -- /usr/include/X11/Xlib.h:310
      height : aliased int;  -- /usr/include/X11/Xlib.h:310
      border_width : aliased int;  -- /usr/include/X11/Xlib.h:311
      depth : aliased int;  -- /usr/include/X11/Xlib.h:312
      the_visual : access Visual;  -- /usr/include/X11/Xlib.h:313
      root : aliased X11.Window;  -- /usr/include/X11/Xlib.h:314
      c_class : aliased int;  -- /usr/include/X11/Xlib.h:316
      bit_gravity : aliased int;  -- /usr/include/X11/Xlib.h:320
      win_gravity : aliased int;  -- /usr/include/X11/Xlib.h:321
      backing_store : aliased int;  -- /usr/include/X11/Xlib.h:322
      backing_planes : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:323
      backing_pixel : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:324
      save_under : aliased int;  -- /usr/include/X11/Xlib.h:325
      the_colormap : aliased X11.Colormap;  -- /usr/include/X11/Xlib.h:326
      map_installed : aliased int;  -- /usr/include/X11/Xlib.h:327
      map_state : aliased int;  -- /usr/include/X11/Xlib.h:328
      all_event_masks : aliased long;  -- /usr/include/X11/Xlib.h:329
      your_event_mask : aliased long;  -- /usr/include/X11/Xlib.h:330
      do_not_propagate_mask : aliased long;  -- /usr/include/X11/Xlib.h:331
      override_redirect : aliased int;  -- /usr/include/X11/Xlib.h:332
      the_screen : access Screen;  -- /usr/include/X11/Xlib.h:333
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:334

  -- width and height of window  
  -- border width of window  
  -- depth of window  
  -- the associated visual structure  
  -- root of screen containing window  
  -- C++ InputOutput, InputOnly 
  -- InputOutput, InputOnly 
  -- one of bit gravity values  
  -- one of the window gravity values  
  -- NotUseful, WhenMapped, Always  
  -- planes to be preserved if possible  
  -- value to be used when restoring planes  
  -- boolean, should bits under be saved?  
  -- color map to be associated with window  
  -- boolean, is color map currently installed 
  -- IsUnmapped, IsUnviewable, IsViewable  
  -- set of events all people have interest in 
  -- my event mask  
  -- set of events that should not propagate  
  -- boolean value for override-redirect  
  -- back pointer to correct screen  
  -- * Data structure for host setting; getting routines.
  -- *
  --  

  -- for example FamilyInternet  
   --  skipped anonymous struct anon_45

   type XHostAddress is record
      family : aliased int;  -- /usr/include/X11/Xlib.h:342
      length : aliased int;  -- /usr/include/X11/Xlib.h:343
      address : Interfaces.C.Strings.chars_ptr;  -- /usr/include/X11/Xlib.h:344
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:345

  -- length of address, in bytes  
  -- pointer to where to find the bytes  
  -- * Data structure for ServerFamilyInterpreted addresses in host routines
  --  

  -- length of type string, in bytes  
   --  skipped anonymous struct anon_46

   type XServerInterpretedAddress is record
      typelength : aliased int;  -- /usr/include/X11/Xlib.h:351
      valuelength : aliased int;  -- /usr/include/X11/Xlib.h:352
      c_type : Interfaces.C.Strings.chars_ptr;  -- /usr/include/X11/Xlib.h:353
      value : Interfaces.C.Strings.chars_ptr;  -- /usr/include/X11/Xlib.h:354
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:355

  -- length of value string, in bytes  
  -- pointer to where to find the type string  
  -- pointer to where to find the address  
  -- * Data structure for "image" data, used by image manipulation routines.
  --  

  -- size of image  
   type u_XImage;
   type funcs is record
      create_image : access function
           (arg1 : access Display;
            arg2 : access Visual;
            arg3 : unsigned;
            arg4 : int;
            arg5 : int;
            arg6 : Interfaces.C.Strings.chars_ptr;
            arg7 : unsigned;
            arg8 : unsigned;
            arg9 : int;
            arg10 : int) return access u_XImage;  -- /usr/include/X11/Xlib.h:377
      destroy_image : access function (arg1 : access u_XImage) return int;  -- /usr/include/X11/Xlib.h:388
      get_pixel : access function
           (arg1 : access u_XImage;
            arg2 : int;
            arg3 : int) return unsigned_long;  -- /usr/include/X11/Xlib.h:389
      put_pixel : access function
           (arg1 : access u_XImage;
            arg2 : int;
            arg3 : int;
            arg4 : unsigned_long) return int;  -- /usr/include/X11/Xlib.h:390
      sub_image : access function
           (arg1 : access u_XImage;
            arg2 : int;
            arg3 : int;
            arg4 : unsigned;
            arg5 : unsigned) return access u_XImage;  -- /usr/include/X11/Xlib.h:391
      add_pixel : access function (arg1 : access u_XImage; arg2 : long) return int;  -- /usr/include/X11/Xlib.h:392
   end record
   with Convention => C_Pass_By_Copy;
   type u_XImage is record
      width : aliased int;  -- /usr/include/X11/Xlib.h:361
      height : aliased int;  -- /usr/include/X11/Xlib.h:361
      xoffset : aliased int;  -- /usr/include/X11/Xlib.h:362
      format : aliased int;  -- /usr/include/X11/Xlib.h:363
      data : Interfaces.C.Strings.chars_ptr;  -- /usr/include/X11/Xlib.h:364
      byte_order : aliased int;  -- /usr/include/X11/Xlib.h:365
      bitmap_unit : aliased int;  -- /usr/include/X11/Xlib.h:366
      bitmap_bit_order : aliased int;  -- /usr/include/X11/Xlib.h:367
      bitmap_pad : aliased int;  -- /usr/include/X11/Xlib.h:368
      depth : aliased int;  -- /usr/include/X11/Xlib.h:369
      bytes_per_line : aliased int;  -- /usr/include/X11/Xlib.h:370
      bits_per_pixel : aliased int;  -- /usr/include/X11/Xlib.h:371
      red_mask : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:372
      green_mask : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:373
      blue_mask : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:374
      obdata : XPointer;  -- /usr/include/X11/Xlib.h:375
      f : aliased funcs;  -- /usr/include/X11/Xlib.h:393
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:360

  -- number of pixels offset in X direction  
  -- XYBitmap, XYPixmap, ZPixmap  
  -- pointer to image data  
  -- data byte order, LSBFirst, MSBFirst  
  -- quant. of scanline 8, 16, 32  
  -- LSBFirst, MSBFirst  
  -- 8, 16, 32 either XY or ZPixmap  
  -- depth of image  
  -- accelarator to next line  
  -- bits per pixel (ZPixmap)  
  -- bits in z arrangement  
  -- hook for the object routines to hang on  
  -- image manipulation routines  
  -- display  
  -- visual  
  -- depth  
  -- format  
  -- offset  
  -- data  
  -- width  
  -- height  
  -- bitmap_pad  
  -- bytes_per_line  
   subtype XImage is u_XImage;  -- /usr/include/X11/Xlib.h:394

  -- * Data structure for XReconfigureWindow
  --  

   --  skipped anonymous struct anon_47

   type XWindowChanges is record
      x : aliased int;  -- /usr/include/X11/Xlib.h:400
      y : aliased int;  -- /usr/include/X11/Xlib.h:400
      width : aliased int;  -- /usr/include/X11/Xlib.h:401
      height : aliased int;  -- /usr/include/X11/Xlib.h:401
      border_width : aliased int;  -- /usr/include/X11/Xlib.h:402
      sibling : aliased X11.Window;  -- /usr/include/X11/Xlib.h:403
      stack_mode : aliased int;  -- /usr/include/X11/Xlib.h:404
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:405

  -- * Data structure used by color operations
  --  

   --  skipped anonymous struct anon_48

   type XColor is record
      pixel : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:411
      red : aliased unsigned_short;  -- /usr/include/X11/Xlib.h:412
      green : aliased unsigned_short;  -- /usr/include/X11/Xlib.h:412
      blue : aliased unsigned_short;  -- /usr/include/X11/Xlib.h:412
      flags : aliased char;  -- /usr/include/X11/Xlib.h:413
      pad : aliased char;  -- /usr/include/X11/Xlib.h:414
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:415

  -- do_red, do_green, do_blue  
  -- * Data structures for graphics operations.  On most machines, these are
  -- * congruent with the wire protocol structures, so reformatting the data
  -- * can be avoided on these architectures.
  --  

   --  skipped anonymous struct anon_49

   type XSegment is record
      x1 : aliased short;  -- /usr/include/X11/Xlib.h:423
      y1 : aliased short;  -- /usr/include/X11/Xlib.h:423
      x2 : aliased short;  -- /usr/include/X11/Xlib.h:423
      y2 : aliased short;  -- /usr/include/X11/Xlib.h:423
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:424

   --  skipped anonymous struct anon_50

   type XPoint is record
      x : aliased short;  -- /usr/include/X11/Xlib.h:427
      y : aliased short;  -- /usr/include/X11/Xlib.h:427
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:428

   --  skipped anonymous struct anon_51

   type XRectangle is record
      x : aliased short;  -- /usr/include/X11/Xlib.h:431
      y : aliased short;  -- /usr/include/X11/Xlib.h:431
      width : aliased unsigned_short;  -- /usr/include/X11/Xlib.h:432
      height : aliased unsigned_short;  -- /usr/include/X11/Xlib.h:432
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:433

   --  skipped anonymous struct anon_52

   type XArc is record
      x : aliased short;  -- /usr/include/X11/Xlib.h:436
      y : aliased short;  -- /usr/include/X11/Xlib.h:436
      width : aliased unsigned_short;  -- /usr/include/X11/Xlib.h:437
      height : aliased unsigned_short;  -- /usr/include/X11/Xlib.h:437
      angle1 : aliased short;  -- /usr/include/X11/Xlib.h:438
      angle2 : aliased short;  -- /usr/include/X11/Xlib.h:438
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:439

  -- Data structure for XChangeKeyboardControl  
   --  skipped anonymous struct anon_53

   type XKeyboardControl is record
      key_click_percent : aliased int;  -- /usr/include/X11/Xlib.h:445
      bell_percent : aliased int;  -- /usr/include/X11/Xlib.h:446
      bell_pitch : aliased int;  -- /usr/include/X11/Xlib.h:447
      bell_duration : aliased int;  -- /usr/include/X11/Xlib.h:448
      led : aliased int;  -- /usr/include/X11/Xlib.h:449
      led_mode : aliased int;  -- /usr/include/X11/Xlib.h:450
      key : aliased int;  -- /usr/include/X11/Xlib.h:451
      auto_repeat_mode : aliased int;  -- /usr/include/X11/Xlib.h:452
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:453

  -- On, Off, Default  
  -- Data structure for XGetKeyboardControl  
   --  skipped anonymous struct anon_54

   subtype XKeyboardState_array1030 is Interfaces.C.char_array (0 .. 31);
   type XKeyboardState is record
      key_click_percent : aliased int;  -- /usr/include/X11/Xlib.h:458
      bell_percent : aliased int;  -- /usr/include/X11/Xlib.h:459
      bell_pitch : aliased unsigned;  -- /usr/include/X11/Xlib.h:460
      bell_duration : aliased unsigned;  -- /usr/include/X11/Xlib.h:460
      led_mask : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:461
      global_auto_repeat : aliased int;  -- /usr/include/X11/Xlib.h:462
      auto_repeats : aliased XKeyboardState_array1030;  -- /usr/include/X11/Xlib.h:463
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:464

  -- Data structure for XGetMotionEvents.   
   --  skipped anonymous struct anon_55

   type XTimeCoord is record
      the_time : aliased X11.Time;  -- /usr/include/X11/Xlib.h:469
      x : aliased short;  -- /usr/include/X11/Xlib.h:470
      y : aliased short;  -- /usr/include/X11/Xlib.h:470
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:471

  -- Data structure for X{Set,Get}ModifierMapping  
  -- The server's max # of keys per modifier  
   --  skipped anonymous struct anon_56

   type XModifierKeymap is record
      max_keypermod : aliased int;  -- /usr/include/X11/Xlib.h:476
      modifiermap : access X11.KeyCode;  -- /usr/include/X11/Xlib.h:477
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:478


  -- Forward declare before use for C++  
   type u_XPrivate is null record;   -- incomplete struct

   type u_XrmHashBucketRec is null record;   -- incomplete struct

  -- hook for extension to hang data  
   --  skipped anonymous struct anon_57

  -- Network socket.  
  -- major version of server's X protocol  
  -- minor version of servers X protocol  
  -- vendor of the server hardware  
  -- allocator function  
  -- screen byte order, LSBFirst, MSBFirst  
  -- padding and data requirements  
  -- padding requirements on bitmaps  
  -- LeastSignificant or MostSignificant  
  -- number of pixmap formats in list  
  -- pixmap format list  
  -- release of the server  
  -- Length of input event queue  
  -- seq number of last event read  
  -- sequence number of last request.  
  -- maximum number 32 bit words in request 
  -- "host:display" string used on this connect 
  -- default screen for operations  
  -- number of screens on this server 
  -- pointer to list of screens  
  -- size of motion buffer  
  -- minimum defined keycode  
  -- maximum defined keycode  
  -- contents of defaults from server  
  -- there is more to this structure, but it is private to Xlib
  --(Troodon: edit)
  --type u_XPrivDisplay is access all anon_57;  -- /usr/include/X11/Xlib.h:550

  -- * Definitions of specific events.
  --  

  -- of event  
   --  skipped anonymous struct anon_58

   type XKeyEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:558
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:559
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:560
      the_display : access Display;  -- /usr/include/X11/Xlib.h:561
      the_window : aliased X11.Window;  -- /usr/include/X11/Xlib.h:562
      root : aliased X11.Window;  -- /usr/include/X11/Xlib.h:563
      subwindow : aliased X11.Window;  -- /usr/include/X11/Xlib.h:564
      the_time : aliased X11.Time;  -- /usr/include/X11/Xlib.h:565
      x : aliased int;  -- /usr/include/X11/Xlib.h:566
      y : aliased int;  -- /usr/include/X11/Xlib.h:566
      x_root : aliased int;  -- /usr/include/X11/Xlib.h:567
      y_root : aliased int;  -- /usr/include/X11/Xlib.h:567
      state : aliased unsigned;  -- /usr/include/X11/Xlib.h:568
      keycode : aliased unsigned;  -- /usr/include/X11/Xlib.h:569
      same_screen : aliased int;  -- /usr/include/X11/Xlib.h:570
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:571

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
  -- "event" window it is reported relative to  
  -- root window that the event occurred on  
  -- child window  
  -- milliseconds  
  -- pointer x, y coordinates in event window  
  -- coordinates relative to root  
  -- key or button mask  
  -- detail  
  -- same screen flag  
   subtype XKeyPressedEvent is XKeyEvent;  -- /usr/include/X11/Xlib.h:572

   subtype XKeyReleasedEvent is XKeyEvent;  -- /usr/include/X11/Xlib.h:573

  -- of event  
   --  skipped anonymous struct anon_59

   type XButtonEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:576
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:577
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:578
      the_display : access Display;  -- /usr/include/X11/Xlib.h:579
      the_window : aliased X11.Window;  -- /usr/include/X11/Xlib.h:580
      root : aliased X11.Window;  -- /usr/include/X11/Xlib.h:581
      subwindow : aliased X11.Window;  -- /usr/include/X11/Xlib.h:582
      the_time : aliased X11.Time;  -- /usr/include/X11/Xlib.h:583
      x : aliased int;  -- /usr/include/X11/Xlib.h:584
      y : aliased int;  -- /usr/include/X11/Xlib.h:584
      x_root : aliased int;  -- /usr/include/X11/Xlib.h:585
      y_root : aliased int;  -- /usr/include/X11/Xlib.h:585
      state : aliased unsigned;  -- /usr/include/X11/Xlib.h:586
      button : aliased unsigned;  -- /usr/include/X11/Xlib.h:587
      same_screen : aliased int;  -- /usr/include/X11/Xlib.h:588
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:589

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
  -- "event" window it is reported relative to  
  -- root window that the event occurred on  
  -- child window  
  -- milliseconds  
  -- pointer x, y coordinates in event window  
  -- coordinates relative to root  
  -- key or button mask  
  -- detail  
  -- same screen flag  
   subtype XButtonPressedEvent is XButtonEvent;  -- /usr/include/X11/Xlib.h:590

   subtype XButtonReleasedEvent is XButtonEvent;  -- /usr/include/X11/Xlib.h:591

  -- of event  
   --  skipped anonymous struct anon_60

   type XMotionEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:594
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:595
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:596
      the_display : access Display;  -- /usr/include/X11/Xlib.h:597
      the_window : aliased X11.Window;  -- /usr/include/X11/Xlib.h:598
      root : aliased X11.Window;  -- /usr/include/X11/Xlib.h:599
      subwindow : aliased X11.Window;  -- /usr/include/X11/Xlib.h:600
      the_time : aliased X11.Time;  -- /usr/include/X11/Xlib.h:601
      x : aliased int;  -- /usr/include/X11/Xlib.h:602
      y : aliased int;  -- /usr/include/X11/Xlib.h:602
      x_root : aliased int;  -- /usr/include/X11/Xlib.h:603
      y_root : aliased int;  -- /usr/include/X11/Xlib.h:603
      state : aliased unsigned;  -- /usr/include/X11/Xlib.h:604
      is_hint : aliased char;  -- /usr/include/X11/Xlib.h:605
      same_screen : aliased int;  -- /usr/include/X11/Xlib.h:606
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:607

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
  -- "event" window reported relative to  
  -- root window that the event occurred on  
  -- child window  
  -- milliseconds  
  -- pointer x, y coordinates in event window  
  -- coordinates relative to root  
  -- key or button mask  
  -- detail  
  -- same screen flag  
   subtype XPointerMovedEvent is XMotionEvent;  -- /usr/include/X11/Xlib.h:608

  -- of event  
   --  skipped anonymous struct anon_61

   type XCrossingEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:611
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:612
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:613
      the_display : access Display;  -- /usr/include/X11/Xlib.h:614
      the_window : aliased X11.Window;  -- /usr/include/X11/Xlib.h:615
      root : aliased X11.Window;  -- /usr/include/X11/Xlib.h:616
      subwindow : aliased X11.Window;  -- /usr/include/X11/Xlib.h:617
      the_time : aliased X11.Time;  -- /usr/include/X11/Xlib.h:618
      x : aliased int;  -- /usr/include/X11/Xlib.h:619
      y : aliased int;  -- /usr/include/X11/Xlib.h:619
      x_root : aliased int;  -- /usr/include/X11/Xlib.h:620
      y_root : aliased int;  -- /usr/include/X11/Xlib.h:620
      mode : aliased int;  -- /usr/include/X11/Xlib.h:621
      detail : aliased int;  -- /usr/include/X11/Xlib.h:622
      same_screen : aliased int;  -- /usr/include/X11/Xlib.h:627
      focus : aliased int;  -- /usr/include/X11/Xlib.h:628
      state : aliased unsigned;  -- /usr/include/X11/Xlib.h:629
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:630

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
  -- "event" window reported relative to  
  -- root window that the event occurred on  
  -- child window  
  -- milliseconds  
  -- pointer x, y coordinates in event window  
  -- coordinates relative to root  
  -- NotifyNormal, NotifyGrab, NotifyUngrab  
  --	 * NotifyAncestor, NotifyVirtual, NotifyInferior,
  --	 * NotifyNonlinear,NotifyNonlinearVirtual
  --	  

  -- same screen flag  
  -- boolean focus  
  -- key or button mask  
   subtype XEnterWindowEvent is XCrossingEvent;  -- /usr/include/X11/Xlib.h:631

   subtype XLeaveWindowEvent is XCrossingEvent;  -- /usr/include/X11/Xlib.h:632

  -- FocusIn or FocusOut  
   --  skipped anonymous struct anon_62

   type XFocusChangeEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:635
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:636
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:637
      the_display : access Display;  -- /usr/include/X11/Xlib.h:638
      the_window : aliased X11.Window;  -- /usr/include/X11/Xlib.h:639
      mode : aliased int;  -- /usr/include/X11/Xlib.h:640
      detail : aliased int;  -- /usr/include/X11/Xlib.h:642
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:648

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
  -- window of event  
  -- NotifyNormal, NotifyWhileGrabbed,
  --				   NotifyGrab, NotifyUngrab  

  --	 * NotifyAncestor, NotifyVirtual, NotifyInferior,
  --	 * NotifyNonlinear,NotifyNonlinearVirtual, NotifyPointer,
  --	 * NotifyPointerRoot, NotifyDetailNone
  --	  

   subtype XFocusInEvent is XFocusChangeEvent;  -- /usr/include/X11/Xlib.h:649

   subtype XFocusOutEvent is XFocusChangeEvent;  -- /usr/include/X11/Xlib.h:650

  -- generated on EnterWindow and FocusIn  when KeyMapState selected  
   --  skipped anonymous struct anon_63

   subtype XKeymapEvent_array1030 is Interfaces.C.char_array (0 .. 31);
   type XKeymapEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:654
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:655
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:656
      the_display : access Display;  -- /usr/include/X11/Xlib.h:657
      the_window : aliased X11.Window;  -- /usr/include/X11/Xlib.h:658
      key_vector : aliased XKeymapEvent_array1030;  -- /usr/include/X11/Xlib.h:659
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:660

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
   --  skipped anonymous struct anon_64

   type XExposeEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:663
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:664
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:665
      the_display : access Display;  -- /usr/include/X11/Xlib.h:666
      the_window : aliased X11.Window;  -- /usr/include/X11/Xlib.h:667
      x : aliased int;  -- /usr/include/X11/Xlib.h:668
      y : aliased int;  -- /usr/include/X11/Xlib.h:668
      width : aliased int;  -- /usr/include/X11/Xlib.h:669
      height : aliased int;  -- /usr/include/X11/Xlib.h:669
      count : aliased int;  -- /usr/include/X11/Xlib.h:670
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:671

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
  -- if non-zero, at least this many more  
   --  skipped anonymous struct anon_65

   type XGraphicsExposeEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:674
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:675
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:676
      the_display : access Display;  -- /usr/include/X11/Xlib.h:677
      the_drawable : aliased X11.Drawable;  -- /usr/include/X11/Xlib.h:678
      x : aliased int;  -- /usr/include/X11/Xlib.h:679
      y : aliased int;  -- /usr/include/X11/Xlib.h:679
      width : aliased int;  -- /usr/include/X11/Xlib.h:680
      height : aliased int;  -- /usr/include/X11/Xlib.h:680
      count : aliased int;  -- /usr/include/X11/Xlib.h:681
      major_code : aliased int;  -- /usr/include/X11/Xlib.h:682
      minor_code : aliased int;  -- /usr/include/X11/Xlib.h:683
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:684

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
  -- if non-zero, at least this many more  
  -- core is CopyArea or CopyPlane  
  -- not defined in the core  
   --  skipped anonymous struct anon_66

   type XNoExposeEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:687
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:688
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:689
      the_display : access Display;  -- /usr/include/X11/Xlib.h:690
      the_drawable : aliased X11.Drawable;  -- /usr/include/X11/Xlib.h:691
      major_code : aliased int;  -- /usr/include/X11/Xlib.h:692
      minor_code : aliased int;  -- /usr/include/X11/Xlib.h:693
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:694

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
  -- core is CopyArea or CopyPlane  
  -- not defined in the core  
   --  skipped anonymous struct anon_67

   type XVisibilityEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:697
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:698
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:699
      the_display : access Display;  -- /usr/include/X11/Xlib.h:700
      the_window : aliased X11.Window;  -- /usr/include/X11/Xlib.h:701
      state : aliased int;  -- /usr/include/X11/Xlib.h:702
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:703

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
  -- Visibility state  
   --  skipped anonymous struct anon_68

   type XCreateWindowEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:706
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:707
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:708
      the_display : access Display;  -- /usr/include/X11/Xlib.h:709
      parent : aliased X11.Window;  -- /usr/include/X11/Xlib.h:710
      the_window : aliased X11.Window;  -- /usr/include/X11/Xlib.h:711
      x : aliased int;  -- /usr/include/X11/Xlib.h:712
      y : aliased int;  -- /usr/include/X11/Xlib.h:712
      width : aliased int;  -- /usr/include/X11/Xlib.h:713
      height : aliased int;  -- /usr/include/X11/Xlib.h:713
      border_width : aliased int;  -- /usr/include/X11/Xlib.h:714
      override_redirect : aliased int;  -- /usr/include/X11/Xlib.h:715
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:716

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
  -- parent of the window  
  -- window id of window created  
  -- window location  
  -- size of window  
  -- border width  
  -- creation should be overridden  
   --  skipped anonymous struct anon_69

   type XDestroyWindowEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:719
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:720
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:721
      the_display : access Display;  -- /usr/include/X11/Xlib.h:722
      event : aliased X11.Window;  -- /usr/include/X11/Xlib.h:723
      the_window : aliased X11.Window;  -- /usr/include/X11/Xlib.h:724
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:725

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
   --  skipped anonymous struct anon_70

   type XUnmapEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:728
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:729
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:730
      the_display : access Display;  -- /usr/include/X11/Xlib.h:731
      event : aliased X11.Window;  -- /usr/include/X11/Xlib.h:732
      the_window : aliased X11.Window;  -- /usr/include/X11/Xlib.h:733
      from_configure : aliased int;  -- /usr/include/X11/Xlib.h:734
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:735

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
   --  skipped anonymous struct anon_71

   type XMapEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:738
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:739
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:740
      the_display : access Display;  -- /usr/include/X11/Xlib.h:741
      event : aliased X11.Window;  -- /usr/include/X11/Xlib.h:742
      the_window : aliased X11.Window;  -- /usr/include/X11/Xlib.h:743
      override_redirect : aliased int;  -- /usr/include/X11/Xlib.h:744
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:745

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
  -- boolean, is override set...  
   --  skipped anonymous struct anon_72

   type XMapRequestEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:748
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:749
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:750
      the_display : access Display;  -- /usr/include/X11/Xlib.h:751
      parent : aliased X11.Window;  -- /usr/include/X11/Xlib.h:752
      the_window : aliased X11.Window;  -- /usr/include/X11/Xlib.h:753
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:754

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
   --  skipped anonymous struct anon_73

   type XReparentEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:757
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:758
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:759
      the_display : access Display;  -- /usr/include/X11/Xlib.h:760
      event : aliased X11.Window;  -- /usr/include/X11/Xlib.h:761
      the_window : aliased X11.Window;  -- /usr/include/X11/Xlib.h:762
      parent : aliased X11.Window;  -- /usr/include/X11/Xlib.h:763
      x : aliased int;  -- /usr/include/X11/Xlib.h:764
      y : aliased int;  -- /usr/include/X11/Xlib.h:764
      override_redirect : aliased int;  -- /usr/include/X11/Xlib.h:765
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:766

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
   --  skipped anonymous struct anon_74

   type XConfigureEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:769
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:770
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:771
      the_display : access Display;  -- /usr/include/X11/Xlib.h:772
      event : aliased X11.Window;  -- /usr/include/X11/Xlib.h:773
      the_window : aliased X11.Window;  -- /usr/include/X11/Xlib.h:774
      x : aliased int;  -- /usr/include/X11/Xlib.h:775
      y : aliased int;  -- /usr/include/X11/Xlib.h:775
      width : aliased int;  -- /usr/include/X11/Xlib.h:776
      height : aliased int;  -- /usr/include/X11/Xlib.h:776
      border_width : aliased int;  -- /usr/include/X11/Xlib.h:777
      above : aliased X11.Window;  -- /usr/include/X11/Xlib.h:778
      override_redirect : aliased int;  -- /usr/include/X11/Xlib.h:779
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:780

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
   --  skipped anonymous struct anon_75

   type XGravityEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:783
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:784
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:785
      the_display : access Display;  -- /usr/include/X11/Xlib.h:786
      event : aliased X11.Window;  -- /usr/include/X11/Xlib.h:787
      the_window : aliased X11.Window;  -- /usr/include/X11/Xlib.h:788
      x : aliased int;  -- /usr/include/X11/Xlib.h:789
      y : aliased int;  -- /usr/include/X11/Xlib.h:789
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:790

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
   --  skipped anonymous struct anon_76

   type XResizeRequestEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:793
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:794
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:795
      the_display : access Display;  -- /usr/include/X11/Xlib.h:796
      the_window : aliased X11.Window;  -- /usr/include/X11/Xlib.h:797
      width : aliased int;  -- /usr/include/X11/Xlib.h:798
      height : aliased int;  -- /usr/include/X11/Xlib.h:798
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:799

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
   --  skipped anonymous struct anon_77

   type XConfigureRequestEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:802
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:803
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:804
      the_display : access Display;  -- /usr/include/X11/Xlib.h:805
      parent : aliased X11.Window;  -- /usr/include/X11/Xlib.h:806
      the_window : aliased X11.Window;  -- /usr/include/X11/Xlib.h:807
      x : aliased int;  -- /usr/include/X11/Xlib.h:808
      y : aliased int;  -- /usr/include/X11/Xlib.h:808
      width : aliased int;  -- /usr/include/X11/Xlib.h:809
      height : aliased int;  -- /usr/include/X11/Xlib.h:809
      border_width : aliased int;  -- /usr/include/X11/Xlib.h:810
      above : aliased X11.Window;  -- /usr/include/X11/Xlib.h:811
      detail : aliased int;  -- /usr/include/X11/Xlib.h:812
      value_mask : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:813
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:814

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
  -- Above, Below, TopIf, BottomIf, Opposite  
   --  skipped anonymous struct anon_78

   type XCirculateEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:817
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:818
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:819
      the_display : access Display;  -- /usr/include/X11/Xlib.h:820
      event : aliased X11.Window;  -- /usr/include/X11/Xlib.h:821
      the_window : aliased X11.Window;  -- /usr/include/X11/Xlib.h:822
      place : aliased int;  -- /usr/include/X11/Xlib.h:823
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:824

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
  -- PlaceOnTop, PlaceOnBottom  
   --  skipped anonymous struct anon_79

   type XCirculateRequestEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:827
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:828
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:829
      the_display : access Display;  -- /usr/include/X11/Xlib.h:830
      parent : aliased X11.Window;  -- /usr/include/X11/Xlib.h:831
      the_window : aliased X11.Window;  -- /usr/include/X11/Xlib.h:832
      place : aliased int;  -- /usr/include/X11/Xlib.h:833
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:834

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
  -- PlaceOnTop, PlaceOnBottom  
   --  skipped anonymous struct anon_80

   type XPropertyEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:837
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:838
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:839
      the_display : access Display;  -- /usr/include/X11/Xlib.h:840
      the_window : aliased X11.Window;  -- /usr/include/X11/Xlib.h:841
      the_atom : aliased X11.Atom;  -- /usr/include/X11/Xlib.h:842
      the_time : aliased X11.Time;  -- /usr/include/X11/Xlib.h:843
      state : aliased int;  -- /usr/include/X11/Xlib.h:844
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:845

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
  -- NewValue, Deleted  
   --  skipped anonymous struct anon_81

   type XSelectionClearEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:848
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:849
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:850
      the_display : access Display;  -- /usr/include/X11/Xlib.h:851
      the_window : aliased X11.Window;  -- /usr/include/X11/Xlib.h:852
      selection : aliased X11.Atom;  -- /usr/include/X11/Xlib.h:853
      the_time : aliased X11.Time;  -- /usr/include/X11/Xlib.h:854
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:855

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
   --  skipped anonymous struct anon_82

   type XSelectionRequestEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:858
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:859
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:860
      the_display : access Display;  -- /usr/include/X11/Xlib.h:861
      owner : aliased X11.Window;  -- /usr/include/X11/Xlib.h:862
      requestor : aliased X11.Window;  -- /usr/include/X11/Xlib.h:863
      selection : aliased X11.Atom;  -- /usr/include/X11/Xlib.h:864
      target : aliased X11.Atom;  -- /usr/include/X11/Xlib.h:865
      property : aliased X11.Atom;  -- /usr/include/X11/Xlib.h:866
      the_time : aliased X11.Time;  -- /usr/include/X11/Xlib.h:867
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:868

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
   --  skipped anonymous struct anon_83

   type XSelectionEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:871
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:872
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:873
      the_display : access Display;  -- /usr/include/X11/Xlib.h:874
      requestor : aliased X11.Window;  -- /usr/include/X11/Xlib.h:875
      selection : aliased X11.Atom;  -- /usr/include/X11/Xlib.h:876
      target : aliased X11.Atom;  -- /usr/include/X11/Xlib.h:877
      property : aliased X11.Atom;  -- /usr/include/X11/Xlib.h:878
      the_time : aliased X11.Time;  -- /usr/include/X11/Xlib.h:879
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:880

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
  -- ATOM or None  
   --  skipped anonymous struct anon_84

   type XColormapEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:883
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:884
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:885
      the_display : access Display;  -- /usr/include/X11/Xlib.h:886
      the_window : aliased X11.Window;  -- /usr/include/X11/Xlib.h:887
      the_colormap : aliased X11.Colormap;  -- /usr/include/X11/Xlib.h:888
      c_new : aliased int;  -- /usr/include/X11/Xlib.h:890
      state : aliased int;  -- /usr/include/X11/Xlib.h:894
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:895

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
  -- COLORMAP or None  
  -- C++  
  -- ColormapInstalled, ColormapUninstalled  
   --  skipped anonymous struct anon_85

   subtype XClientMessageEvent_array4364 is Interfaces.C.char_array (0 .. 19);
   type XClientMessageEvent_array4365 is array (0 .. 9) of aliased short;
   type XClientMessageEvent_array4366 is array (0 .. 4) of aliased long;
   type anon_86 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            b : aliased XClientMessageEvent_array4364;  -- /usr/include/X11/Xlib.h:906
         when 1 =>
            s : aliased XClientMessageEvent_array4365;  -- /usr/include/X11/Xlib.h:907
         when others =>
            l : aliased XClientMessageEvent_array4366;  -- /usr/include/X11/Xlib.h:908
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type XClientMessageEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:898
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:899
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:900
      the_display : access Display;  -- /usr/include/X11/Xlib.h:901
      the_window : aliased X11.Window;  -- /usr/include/X11/Xlib.h:902
      message_type : aliased X11.Atom;  -- /usr/include/X11/Xlib.h:903
      format : aliased int;  -- /usr/include/X11/Xlib.h:904
      data : aliased anon_86;  -- /usr/include/X11/Xlib.h:909
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:910

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
   --  skipped anonymous struct anon_87

   type XMappingEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:913
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:914
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:915
      the_display : access Display;  -- /usr/include/X11/Xlib.h:916
      the_window : aliased X11.Window;  -- /usr/include/X11/Xlib.h:917
      request : aliased int;  -- /usr/include/X11/Xlib.h:918
      first_keycode : aliased int;  -- /usr/include/X11/Xlib.h:920
      count : aliased int;  -- /usr/include/X11/Xlib.h:921
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:922

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
  -- unused  
  -- one of MappingModifier, MappingKeyboard,
  --				   MappingPointer  

  -- first keycode  
  -- defines range of change w. first_keycode 
   --  skipped anonymous struct anon_88

   type XErrorEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:925
      the_display : access Display;  -- /usr/include/X11/Xlib.h:926
      resourceid : aliased X11.XID;  -- /usr/include/X11/Xlib.h:927
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:928
      error_code : aliased unsigned_char;  -- /usr/include/X11/Xlib.h:929
      request_code : aliased unsigned_char;  -- /usr/include/X11/Xlib.h:930
      minor_code : aliased unsigned_char;  -- /usr/include/X11/Xlib.h:931
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:932

  -- Display the event was read from  
  -- resource id  
  -- serial number of failed request  
  -- error code of failed request  
  -- Major op-code of failed request  
  -- Minor op-code of failed request  
   --  skipped anonymous struct anon_89

   type XAnyEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:935
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:936
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:937
      the_display : access Display;  -- /usr/include/X11/Xlib.h:938
      the_window : aliased X11.Window;  -- /usr/include/X11/Xlib.h:939
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:940

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
  -- window on which event was requested in event mask  
  --**************************************************************
  -- *
  -- * GenericEvent.  This event is the standard event for all newer extensions.
  --  

  -- of event. Always GenericEvent  
   --  skipped anonymous struct anon_90

   type XGenericEvent is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:950
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:951
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:952
      the_display : access Display;  -- /usr/include/X11/Xlib.h:953
      extension : aliased int;  -- /usr/include/X11/Xlib.h:954
      evtype : aliased int;  -- /usr/include/X11/Xlib.h:955
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:956

  -- # of last request processed  
  -- true if from SendEvent request  
  -- Display the event was read from  
  -- major opcode of extension that caused the event  
  -- actual event type.  
  -- of event. Always GenericEvent  
   --  skipped anonymous struct anon_91

   type XGenericEventCookie is record
      c_type : aliased int;  -- /usr/include/X11/Xlib.h:959
      serial : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:960
      send_event : aliased int;  -- /usr/include/X11/Xlib.h:961
      the_display : access Display;  -- /usr/include/X11/Xlib.h:962
      extension : aliased int;  -- /usr/include/X11/Xlib.h:963
      evtype : aliased int;  -- /usr/include/X11/Xlib.h:964
      cookie : aliased unsigned;  -- /usr/include/X11/Xlib.h:965
      data : System.Address;  -- /usr/include/X11/Xlib.h:966
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:967

  -- # of last request processed  
  -- true if from SendEvent request  
  -- Display the event was read from  
  -- major opcode of extension that caused the event  
  -- actual event type.  
  -- * this union is defined so Xlib can always use the same sized
  -- * event structure internally, to avoid memory fragmentation.
  --  

  -- must not be changed; first element  
   type u_XEvent_array4379 is array (0 .. 23) of aliased long;
   type u_XEvent (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            c_type : aliased int;  -- /usr/include/X11/Xlib.h:974
         when 1 =>
            xany : aliased XAnyEvent;  -- /usr/include/X11/Xlib.h:975
         when 2 =>
            xkey : aliased XKeyEvent;  -- /usr/include/X11/Xlib.h:976
         when 3 =>
            xbutton : aliased XButtonEvent;  -- /usr/include/X11/Xlib.h:977
         when 4 =>
            xmotion : aliased XMotionEvent;  -- /usr/include/X11/Xlib.h:978
         when 5 =>
            xcrossing : aliased XCrossingEvent;  -- /usr/include/X11/Xlib.h:979
         when 6 =>
            xfocus : aliased XFocusChangeEvent;  -- /usr/include/X11/Xlib.h:980
         when 7 =>
            xexpose : aliased XExposeEvent;  -- /usr/include/X11/Xlib.h:981
         when 8 =>
            xgraphicsexpose : aliased XGraphicsExposeEvent;  -- /usr/include/X11/Xlib.h:982
         when 9 =>
            xnoexpose : aliased XNoExposeEvent;  -- /usr/include/X11/Xlib.h:983
         when 10 =>
            xvisibility : aliased XVisibilityEvent;  -- /usr/include/X11/Xlib.h:984
         when 11 =>
            xcreatewindow : aliased XCreateWindowEvent;  -- /usr/include/X11/Xlib.h:985
         when 12 =>
            xdestroywindow : aliased XDestroyWindowEvent;  -- /usr/include/X11/Xlib.h:986
         when 13 =>
            xunmap : aliased XUnmapEvent;  -- /usr/include/X11/Xlib.h:987
         when 14 =>
            xmap : aliased XMapEvent;  -- /usr/include/X11/Xlib.h:988
         when 15 =>
            xmaprequest : aliased XMapRequestEvent;  -- /usr/include/X11/Xlib.h:989
         when 16 =>
            xreparent : aliased XReparentEvent;  -- /usr/include/X11/Xlib.h:990
         when 17 =>
            xconfigure : aliased XConfigureEvent;  -- /usr/include/X11/Xlib.h:991
         when 18 =>
            xgravity : aliased XGravityEvent;  -- /usr/include/X11/Xlib.h:992
         when 19 =>
            xresizerequest : aliased XResizeRequestEvent;  -- /usr/include/X11/Xlib.h:993
         when 20 =>
            xconfigurerequest : aliased XConfigureRequestEvent;  -- /usr/include/X11/Xlib.h:994
         when 21 =>
            xcirculate : aliased XCirculateEvent;  -- /usr/include/X11/Xlib.h:995
         when 22 =>
            xcirculaterequest : aliased XCirculateRequestEvent;  -- /usr/include/X11/Xlib.h:996
         when 23 =>
            xproperty : aliased XPropertyEvent;  -- /usr/include/X11/Xlib.h:997
         when 24 =>
            xselectionclear : aliased XSelectionClearEvent;  -- /usr/include/X11/Xlib.h:998
         when 25 =>
            xselectionrequest : aliased XSelectionRequestEvent;  -- /usr/include/X11/Xlib.h:999
         when 26 =>
            xselection : aliased XSelectionEvent;  -- /usr/include/X11/Xlib.h:1000
         when 27 =>
            xcolormap : aliased XColormapEvent;  -- /usr/include/X11/Xlib.h:1001
         when 28 =>
            xclient : aliased XClientMessageEvent;  -- /usr/include/X11/Xlib.h:1002
         when 29 =>
            xmapping : aliased XMappingEvent;  -- /usr/include/X11/Xlib.h:1003
         when 30 =>
            xerror : aliased XErrorEvent;  -- /usr/include/X11/Xlib.h:1004
         when 31 =>
            xkeymap : aliased XKeymapEvent;  -- /usr/include/X11/Xlib.h:1005
         when 32 =>
            xgeneric : aliased XGenericEvent;  -- /usr/include/X11/Xlib.h:1006
         when 33 =>
            xcookie : aliased XGenericEventCookie;  -- /usr/include/X11/Xlib.h:1007
         when others =>
            pad : aliased u_XEvent_array4379;  -- /usr/include/X11/Xlib.h:1008
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- /usr/include/X11/Xlib.h:973

   subtype XEvent is u_XEvent;  -- /usr/include/X11/Xlib.h:1009

  -- * per character font metric information.
  --  

  -- origin to left edge of raster  
   --  skipped anonymous struct anon_92

   type XCharStruct is record
      lbearing : aliased short;  -- /usr/include/X11/Xlib.h:1018
      rbearing : aliased short;  -- /usr/include/X11/Xlib.h:1019
      width : aliased short;  -- /usr/include/X11/Xlib.h:1020
      ascent : aliased short;  -- /usr/include/X11/Xlib.h:1021
      descent : aliased short;  -- /usr/include/X11/Xlib.h:1022
      attributes : aliased unsigned_short;  -- /usr/include/X11/Xlib.h:1023
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:1024

  -- origin to right edge of raster  
  -- advance to next char's origin  
  -- baseline to top edge of raster  
  -- baseline to bottom edge of raster  
  -- per char flags (not predefined)  
  -- * To allow arbitrary information with fonts, there are additional properties
  -- * returned.
  --  

   --  skipped anonymous struct anon_93

   type XFontProp is record
      name : aliased X11.Atom;  -- /usr/include/X11/Xlib.h:1031
      card32 : aliased unsigned_long;  -- /usr/include/X11/Xlib.h:1032
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:1033

  -- hook for extension to hang data  
   --  skipped anonymous struct anon_94

   type XFontStruct is record
      ext_data : access XExtData;  -- /usr/include/X11/Xlib.h:1036
      fid : aliased X11.Font;  -- /usr/include/X11/Xlib.h:1037
      direction : aliased unsigned;  -- /usr/include/X11/Xlib.h:1038
      min_char_or_byte2 : aliased unsigned;  -- /usr/include/X11/Xlib.h:1039
      max_char_or_byte2 : aliased unsigned;  -- /usr/include/X11/Xlib.h:1040
      min_byte1 : aliased unsigned;  -- /usr/include/X11/Xlib.h:1041
      max_byte1 : aliased unsigned;  -- /usr/include/X11/Xlib.h:1042
      all_chars_exist : aliased int;  -- /usr/include/X11/Xlib.h:1043
      default_char : aliased unsigned;  -- /usr/include/X11/Xlib.h:1044
      n_properties : aliased int;  -- /usr/include/X11/Xlib.h:1045
      properties : access XFontProp;  -- /usr/include/X11/Xlib.h:1046
      min_bounds : aliased XCharStruct;  -- /usr/include/X11/Xlib.h:1047
      max_bounds : aliased XCharStruct;  -- /usr/include/X11/Xlib.h:1048
      per_char : access XCharStruct;  -- /usr/include/X11/Xlib.h:1049
      ascent : aliased int;  -- /usr/include/X11/Xlib.h:1050
      descent : aliased int;  -- /usr/include/X11/Xlib.h:1051
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:1052

  -- Font id for this font  
  -- hint about direction the font is painted  
  -- first character  
  -- last character  
  -- first row that exists  
  -- last row that exists  
  -- flag if all characters have non-zero size 
  -- char to print for undefined character  
  -- how many properties there are  
  -- pointer to array of additional properties 
  -- minimum bounds over all existing char 
  -- maximum bounds over all existing char 
  -- first_char to last_char information  
  -- log. extent above baseline for spacing  
  -- log. descent below baseline for spacing  
  -- * PolyText routines take these as arguments.
  --  

  -- pointer to string  
   --  skipped anonymous struct anon_95

   type XTextItem is record
      chars : Interfaces.C.Strings.chars_ptr;  -- /usr/include/X11/Xlib.h:1058
      nchars : aliased int;  -- /usr/include/X11/Xlib.h:1059
      c_delta : aliased int;  -- /usr/include/X11/Xlib.h:1060
      the_font : aliased X11.Font;  -- /usr/include/X11/Xlib.h:1061
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:1062

  -- number of characters  
  -- delta between strings  
  -- font to print it in, None don't change  
  -- normal 16 bit characters are two bytes  
   --  skipped anonymous struct anon_96

   type XChar2b is record
      byte1 : aliased unsigned_char;  -- /usr/include/X11/Xlib.h:1065
      byte2 : aliased unsigned_char;  -- /usr/include/X11/Xlib.h:1066
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:1067

  -- two byte characters  
   --  skipped anonymous struct anon_97

   type XTextItem16 is record
      chars : access XChar2b;  -- /usr/include/X11/Xlib.h:1070
      nchars : aliased int;  -- /usr/include/X11/Xlib.h:1071
      c_delta : aliased int;  -- /usr/include/X11/Xlib.h:1072
      the_font : aliased X11.Font;  -- /usr/include/X11/Xlib.h:1073
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:1074

  -- number of characters  
  -- delta between strings  
  -- font to print it in, None don't change  
   --  skipped anonymous struct anon_98

   type XEDataObject (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            the_display : access Display;  -- /usr/include/X11/Xlib.h:1077
         when 1 =>
            the_gc : GC;  -- /usr/include/X11/Xlib.h:1078
         when 2 =>
            the_visual : access Visual;  -- /usr/include/X11/Xlib.h:1079
         when 3 =>
            the_screen : access Screen;  -- /usr/include/X11/Xlib.h:1080
         when 4 =>
            pixmap_format : access ScreenFormat;  -- /usr/include/X11/Xlib.h:1081
         when others =>
            font : access XFontStruct;  -- /usr/include/X11/Xlib.h:1082
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- /usr/include/X11/Xlib.h:1082

   --  skipped anonymous struct anon_99

   type XFontSetExtents is record
      max_ink_extent : aliased XRectangle;  -- /usr/include/X11/Xlib.h:1085
      max_logical_extent : aliased XRectangle;  -- /usr/include/X11/Xlib.h:1086
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:1087

  -- unused:
  --typedef void (*XOMProc)();
  --  

   type u_XOM is null record;   -- incomplete struct

   type XOM is access all u_XOM;  -- /usr/include/X11/Xlib.h:1093

   type u_XOC is null record;   -- incomplete struct

   type XOC is access all u_XOC;  -- /usr/include/X11/Xlib.h:1094

   type XFontSet is access all u_XOC;  -- /usr/include/X11/Xlib.h:1094

   --  skipped anonymous struct anon_100

   type XmbTextItem is record
      chars : Interfaces.C.Strings.chars_ptr;  -- /usr/include/X11/Xlib.h:1097
      nchars : aliased int;  -- /usr/include/X11/Xlib.h:1098
      c_delta : aliased int;  -- /usr/include/X11/Xlib.h:1099
      font_set : XFontSet;  -- /usr/include/X11/Xlib.h:1100
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:1101

   --  skipped anonymous struct anon_101

   type XwcTextItem is record
      chars : access wchar_t;  -- /usr/include/X11/Xlib.h:1104
      nchars : aliased int;  -- /usr/include/X11/Xlib.h:1105
      c_delta : aliased int;  -- /usr/include/X11/Xlib.h:1106
      font_set : XFontSet;  -- /usr/include/X11/Xlib.h:1107
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:1108

   --  skipped anonymous struct anon_102

   type XOMCharSetList is record
      charset_count : aliased int;  -- /usr/include/X11/Xlib.h:1122
      charset_list : System.Address;  -- /usr/include/X11/Xlib.h:1123
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:1124

   type XOrientation is 
     (XOMOrientation_LTR_TTB,
      XOMOrientation_RTL_TTB,
      XOMOrientation_TTB_LTR,
      XOMOrientation_TTB_RTL,
      XOMOrientation_Context)
   with Convention => C;  -- /usr/include/X11/Xlib.h:1132

   --  skipped anonymous struct anon_104

   type XOMOrientation is record
      num_orientation : aliased int;  -- /usr/include/X11/Xlib.h:1135
      orientation : access XOrientation;  -- /usr/include/X11/Xlib.h:1136
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:1137

  -- Input Text description  
   --  skipped anonymous struct anon_105

   type XOMFontInfo is record
      num_font : aliased int;  -- /usr/include/X11/Xlib.h:1140
      font_struct_list : System.Address;  -- /usr/include/X11/Xlib.h:1141
      font_name_list : System.Address;  -- /usr/include/X11/Xlib.h:1142
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:1143

   type u_XIM is null record;   -- incomplete struct

   type XIM is access all u_XIM;  -- /usr/include/X11/Xlib.h:1145

   type u_XIC is null record;   -- incomplete struct

   type XIC is access all u_XIC;  -- /usr/include/X11/Xlib.h:1146

   type XIMProc is access procedure
        (arg1 : XIM;
         arg2 : XPointer;
         arg3 : XPointer)
   with Convention => C;  -- /usr/include/X11/Xlib.h:1148

   type XICProc is access function
        (arg1 : XIC;
         arg2 : XPointer;
         arg3 : XPointer) return int
   with Convention => C;  -- /usr/include/X11/Xlib.h:1154

   type XIDProc is access procedure
        (arg1 : access Display;
         arg2 : XPointer;
         arg3 : XPointer)
   with Convention => C;  -- /usr/include/X11/Xlib.h:1160

   subtype XIMStyle is unsigned_long;  -- /usr/include/X11/Xlib.h:1166

   --  skipped anonymous struct anon_106

   type XIMStyles is record
      count_styles : aliased unsigned_short;  -- /usr/include/X11/Xlib.h:1169
      supported_styles : access XIMStyle;  -- /usr/include/X11/Xlib.h:1170
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:1171

   type XVaNestedList is new System.Address;  -- /usr/include/X11/Xlib.h:1233

   --  skipped anonymous struct anon_107

   type XIMCallback is record
      client_data : XPointer;  -- /usr/include/X11/Xlib.h:1236
      callback : XIMProc;  -- /usr/include/X11/Xlib.h:1237
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:1238

   --  skipped anonymous struct anon_108

   type XICCallback is record
      client_data : XPointer;  -- /usr/include/X11/Xlib.h:1241
      callback : XICProc;  -- /usr/include/X11/Xlib.h:1242
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:1243

   subtype XIMFeedback is unsigned_long;  -- /usr/include/X11/Xlib.h:1245

   type anon_109 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            multi_byte : Interfaces.C.Strings.chars_ptr;  -- /usr/include/X11/Xlib.h:1262
         when others =>
            wide_char : access wchar_t;  -- /usr/include/X11/Xlib.h:1263
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type u_XIMText is record
      length : aliased unsigned_short;  -- /usr/include/X11/Xlib.h:1258
      feedback : access XIMFeedback;  -- /usr/include/X11/Xlib.h:1259
      encoding_is_wchar : aliased int;  -- /usr/include/X11/Xlib.h:1260
      string : aliased anon_109;  -- /usr/include/X11/Xlib.h:1264
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:1257

   subtype XIMText is u_XIMText;  -- /usr/include/X11/Xlib.h:1265

   subtype XIMPreeditState is unsigned_long;  -- /usr/include/X11/Xlib.h:1267

   type u_XIMPreeditStateNotifyCallbackStruct is record
      state : aliased XIMPreeditState;  -- /usr/include/X11/Xlib.h:1274
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:1273

   subtype XIMPreeditStateNotifyCallbackStruct is u_XIMPreeditStateNotifyCallbackStruct;  -- /usr/include/X11/Xlib.h:1275

   subtype XIMResetState is unsigned_long;  -- /usr/include/X11/Xlib.h:1277

   subtype XIMStringConversionFeedback is unsigned_long;  -- /usr/include/X11/Xlib.h:1282

   type anon_110 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            mbs : Interfaces.C.Strings.chars_ptr;  -- /usr/include/X11/Xlib.h:1296
         when others =>
            wcs : access wchar_t;  -- /usr/include/X11/Xlib.h:1297
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type u_XIMStringConversionText is record
      length : aliased unsigned_short;  -- /usr/include/X11/Xlib.h:1292
      feedback : access XIMStringConversionFeedback;  -- /usr/include/X11/Xlib.h:1293
      encoding_is_wchar : aliased int;  -- /usr/include/X11/Xlib.h:1294
      string : aliased anon_110;  -- /usr/include/X11/Xlib.h:1298
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:1291

   subtype XIMStringConversionText is u_XIMStringConversionText;  -- /usr/include/X11/Xlib.h:1299

   subtype XIMStringConversionPosition is unsigned_short;  -- /usr/include/X11/Xlib.h:1301

   subtype XIMStringConversionType is unsigned_short;  -- /usr/include/X11/Xlib.h:1303

   subtype XIMStringConversionOperation is unsigned_short;  -- /usr/include/X11/Xlib.h:1310

   type XIMCaretDirection is 
     (XIMForwardChar,
      XIMBackwardChar,
      XIMForwardWord,
      XIMBackwardWord,
      XIMCaretUp,
      XIMCaretDown,
      XIMNextLine,
      XIMPreviousLine,
      XIMLineStart,
      XIMLineEnd,
      XIMAbsolutePosition,
      XIMDontChange)
   with Convention => C;  -- /usr/include/X11/Xlib.h:1323

   type u_XIMStringConversionCallbackStruct is record
      position : aliased XIMStringConversionPosition;  -- /usr/include/X11/Xlib.h:1326
      direction : aliased XIMCaretDirection;  -- /usr/include/X11/Xlib.h:1327
      operation : aliased XIMStringConversionOperation;  -- /usr/include/X11/Xlib.h:1328
      factor : aliased unsigned_short;  -- /usr/include/X11/Xlib.h:1329
      text : access XIMStringConversionText;  -- /usr/include/X11/Xlib.h:1330
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:1325

   subtype XIMStringConversionCallbackStruct is u_XIMStringConversionCallbackStruct;  -- /usr/include/X11/Xlib.h:1331

  -- Cursor offset within pre-edit string  
   type u_XIMPreeditDrawCallbackStruct is record
      caret : aliased int;  -- /usr/include/X11/Xlib.h:1334
      chg_first : aliased int;  -- /usr/include/X11/Xlib.h:1335
      chg_length : aliased int;  -- /usr/include/X11/Xlib.h:1336
      text : access XIMText;  -- /usr/include/X11/Xlib.h:1337
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:1333

  -- Starting change position  
  -- Length of the change in character count  
   subtype XIMPreeditDrawCallbackStruct is u_XIMPreeditDrawCallbackStruct;  -- /usr/include/X11/Xlib.h:1338

  -- Disable caret feedback  
  -- UI defined caret feedback  
  -- UI defined caret feedback  
   type XIMCaretStyle is 
     (XIMIsInvisible,
      XIMIsPrimary,
      XIMIsSecondary)
   with Convention => C;  -- /usr/include/X11/Xlib.h:1344

  -- Caret offset within pre-edit string  
   type u_XIMPreeditCaretCallbackStruct is record
      position : aliased int;  -- /usr/include/X11/Xlib.h:1347
      direction : aliased XIMCaretDirection;  -- /usr/include/X11/Xlib.h:1348
      style : aliased XIMCaretStyle;  -- /usr/include/X11/Xlib.h:1349
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:1346

  -- Caret moves direction  
  -- Feedback of the caret  
   subtype XIMPreeditCaretCallbackStruct is u_XIMPreeditCaretCallbackStruct;  -- /usr/include/X11/Xlib.h:1350

   type XIMStatusDataType is 
     (XIMTextType,
      XIMBitmapType)
   with Convention => C;  -- /usr/include/X11/Xlib.h:1355

   type anon_114 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            text : access XIMText;  -- /usr/include/X11/Xlib.h:1360
         when others =>
            bitmap : aliased X11.Pixmap;  -- /usr/include/X11/Xlib.h:1361
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type u_XIMStatusDrawCallbackStruct is record
      c_type : aliased XIMStatusDataType;  -- /usr/include/X11/Xlib.h:1358
      data : aliased anon_114;  -- /usr/include/X11/Xlib.h:1362
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:1357

   subtype XIMStatusDrawCallbackStruct is u_XIMStatusDrawCallbackStruct;  -- /usr/include/X11/Xlib.h:1363

   type u_XIMHotKeyTrigger is record
      the_keysym : aliased X11.KeySym;  -- /usr/include/X11/Xlib.h:1366
      modifier : aliased int;  -- /usr/include/X11/Xlib.h:1367
      modifier_mask : aliased int;  -- /usr/include/X11/Xlib.h:1368
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:1365

   subtype XIMHotKeyTrigger is u_XIMHotKeyTrigger;  -- /usr/include/X11/Xlib.h:1369

   type u_XIMHotKeyTriggers is record
      num_hot_key : aliased int;  -- /usr/include/X11/Xlib.h:1372
      key : access XIMHotKeyTrigger;  -- /usr/include/X11/Xlib.h:1373
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:1371

   subtype XIMHotKeyTriggers is u_XIMHotKeyTriggers;  -- /usr/include/X11/Xlib.h:1374

   subtype XIMHotKeyState is unsigned_long;  -- /usr/include/X11/Xlib.h:1376

   --  skipped anonymous struct anon_115

   type XIMValuesList is record
      count_values : aliased unsigned_short;  -- /usr/include/X11/Xlib.h:1382
      supported_values : System.Address;  -- /usr/include/X11/Xlib.h:1383
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/X11/Xlib.h:1384

   function XLoadQueryFont (arg1 : access Display; arg2 : Interfaces.C.Strings.chars_ptr) return access XFontStruct  -- /usr/include/X11/Xlib.h:1394
   with Import => True, 
        Convention => C, 
        External_Name => "XLoadQueryFont";

  -- display  
  -- name  
   function XQueryFont (arg1 : access Display; arg2 : X11.XID) return access XFontStruct  -- /usr/include/X11/Xlib.h:1399
   with Import => True, 
        Convention => C, 
        External_Name => "XQueryFont";

  -- display  
  -- font_ID  
   function XGetMotionEvents
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : X11.Time;
      arg4 : X11.Time;
      arg5 : access int) return access XTimeCoord  -- /usr/include/X11/Xlib.h:1405
   with Import => True, 
        Convention => C, 
        External_Name => "XGetMotionEvents";

  -- display  
  -- w  
  -- start  
  -- stop  
  -- nevents_return  
   function XDeleteModifiermapEntry
     (arg1 : access XModifierKeymap;
      arg2 : X11.KeyCode;
      arg3 : int) return access XModifierKeymap  -- /usr/include/X11/Xlib.h:1413
   with Import => True, 
        Convention => C, 
        External_Name => "XDeleteModifiermapEntry";

  -- modmap  
  -- keycode_entry  
  -- keycode_entry  
  -- modifier  
   function XGetModifierMapping (arg1 : access Display) return access XModifierKeymap  -- /usr/include/X11/Xlib.h:1423
   with Import => True, 
        Convention => C, 
        External_Name => "XGetModifierMapping";

  -- display  
   function XInsertModifiermapEntry
     (arg1 : access XModifierKeymap;
      arg2 : X11.KeyCode;
      arg3 : int) return access XModifierKeymap  -- /usr/include/X11/Xlib.h:1427
   with Import => True, 
        Convention => C, 
        External_Name => "XInsertModifiermapEntry";

  -- modmap  
  -- keycode_entry  
  -- keycode_entry  
  -- modifier  
   function XNewModifiermap (arg1 : int) return access XModifierKeymap  -- /usr/include/X11/Xlib.h:1437
   with Import => True, 
        Convention => C, 
        External_Name => "XNewModifiermap";

  -- max_keys_per_mod  
   function XCreateImage
     (arg1 : access Display;
      arg2 : access Visual;
      arg3 : unsigned;
      arg4 : int;
      arg5 : int;
      arg6 : Interfaces.C.Strings.chars_ptr;
      arg7 : unsigned;
      arg8 : unsigned;
      arg9 : int;
      arg10 : int) return access XImage  -- /usr/include/X11/Xlib.h:1441
   with Import => True, 
        Convention => C, 
        External_Name => "XCreateImage";

  -- display  
  -- visual  
  -- depth  
  -- format  
  -- offset  
  -- data  
  -- width  
  -- height  
  -- bitmap_pad  
  -- bytes_per_line  
   function XInitImage (arg1 : access XImage) return int  -- /usr/include/X11/Xlib.h:1453
   with Import => True, 
        Convention => C, 
        External_Name => "XInitImage";

  -- image  
   function XGetImage
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : int;
      arg4 : int;
      arg5 : unsigned;
      arg6 : unsigned;
      arg7 : unsigned_long;
      arg8 : int) return access XImage  -- /usr/include/X11/Xlib.h:1456
   with Import => True, 
        Convention => C, 
        External_Name => "XGetImage";

  -- display  
  -- d  
  -- x  
  -- y  
  -- width  
  -- height  
  -- plane_mask  
  -- format  
   function XGetSubImage
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : int;
      arg4 : int;
      arg5 : unsigned;
      arg6 : unsigned;
      arg7 : unsigned_long;
      arg8 : int;
      arg9 : access XImage;
      arg10 : int;
      arg11 : int) return access XImage  -- /usr/include/X11/Xlib.h:1466
   with Import => True, 
        Convention => C, 
        External_Name => "XGetSubImage";

  -- display  
  -- d  
  -- x  
  -- y  
  -- width  
  -- height  
  -- plane_mask  
  -- format  
  -- dest_image  
  -- dest_x  
  -- dest_y  
  -- * X function declarations.
  --  

   function XOpenDisplay (arg1 : Interfaces.C.Strings.chars_ptr) return access Display  -- /usr/include/X11/Xlib.h:1483
   with Import => True, 
        Convention => C, 
        External_Name => "XOpenDisplay";

  -- display_name  
   procedure XrmInitialize  -- /usr/include/X11/Xlib.h:1487
   with Import => True, 
        Convention => C, 
        External_Name => "XrmInitialize";

   function XFetchBytes (arg1 : access Display; arg2 : access int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/X11/Xlib.h:1491
   with Import => True, 
        Convention => C, 
        External_Name => "XFetchBytes";

  -- display  
  -- nbytes_return  
   function XFetchBuffer
     (arg1 : access Display;
      arg2 : access int;
      arg3 : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/X11/Xlib.h:1495
   with Import => True, 
        Convention => C, 
        External_Name => "XFetchBuffer";

  -- display  
  -- nbytes_return  
  -- buffer  
   function XGetAtomName (arg1 : access Display; arg2 : X11.Atom) return Interfaces.C.Strings.chars_ptr  -- /usr/include/X11/Xlib.h:1500
   with Import => True, 
        Convention => C, 
        External_Name => "XGetAtomName";

  -- display  
  -- atom  
   function XGetAtomNames
     (arg1 : access Display;
      arg2 : access X11.Atom;
      arg3 : int;
      arg4 : System.Address) return int  -- /usr/include/X11/Xlib.h:1504
   with Import => True, 
        Convention => C, 
        External_Name => "XGetAtomNames";

  -- dpy  
  -- atoms  
  -- count  
  -- names_return  
   function XGetDefault
     (arg1 : access Display;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/include/X11/Xlib.h:1510
   with Import => True, 
        Convention => C, 
        External_Name => "XGetDefault";

  -- display  
  -- program  
  -- option  
   function XDisplayName (arg1 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/include/X11/Xlib.h:1515
   with Import => True, 
        Convention => C, 
        External_Name => "XDisplayName";

  -- string  
   function XKeysymToString (arg1 : X11.KeySym) return Interfaces.C.Strings.chars_ptr  -- /usr/include/X11/Xlib.h:1518
   with Import => True, 
        Convention => C, 
        External_Name => "XKeysymToString";

  -- keysym  
   function XSynchronize (arg1 : access Display; arg2 : int) return access function (arg1 : access Display) return int  -- /usr/include/X11/Xlib.h:1522
   with Import => True, 
        Convention => C, 
        External_Name => "XSynchronize";

  -- display  
  -- onoff  
  -- display  
   function XSetAfterFunction (arg1 : access Display; arg2 : access function (arg1 : access Display) return int) return access function (arg1 : access Display) return int  -- /usr/include/X11/Xlib.h:1528
   with Import => True, 
        Convention => C, 
        External_Name => "XSetAfterFunction";

  -- display  
  -- display  
  -- procedure  
  -- display  
   function XInternAtom
     (arg1 : access Display;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int) return X11.Atom  -- /usr/include/X11/Xlib.h:1536
   with Import => True, 
        Convention => C, 
        External_Name => "XInternAtom";

  -- display  
  -- atom_name  
  -- only_if_exists  
   function XInternAtoms
     (arg1 : access Display;
      arg2 : System.Address;
      arg3 : int;
      arg4 : int;
      arg5 : access X11.Atom) return int  -- /usr/include/X11/Xlib.h:1541
   with Import => True, 
        Convention => C, 
        External_Name => "XInternAtoms";

  -- dpy  
  -- names  
  -- count  
  -- onlyIfExists  
  -- atoms_return  
   function XCopyColormapAndFree (arg1 : access Display; arg2 : X11.Colormap) return X11.Colormap  -- /usr/include/X11/Xlib.h:1548
   with Import => True, 
        Convention => C, 
        External_Name => "XCopyColormapAndFree";

  -- display  
  -- colormap  
   function XCreateColormap
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : access Visual;
      arg4 : int) return X11.Colormap  -- /usr/include/X11/Xlib.h:1552
   with Import => True, 
        Convention => C, 
        External_Name => "XCreateColormap";

  -- display  
  -- w  
  -- visual  
  -- alloc  
   function XCreatePixmapCursor
     (arg1 : access Display;
      arg2 : X11.Pixmap;
      arg3 : X11.Pixmap;
      arg4 : access XColor;
      arg5 : access XColor;
      arg6 : unsigned;
      arg7 : unsigned) return X11.Cursor  -- /usr/include/X11/Xlib.h:1558
   with Import => True, 
        Convention => C, 
        External_Name => "XCreatePixmapCursor";

  -- display  
  -- source  
  -- mask  
  -- foreground_color  
  -- background_color  
  -- x  
  -- y  
   function XCreateGlyphCursor
     (arg1 : access Display;
      arg2 : X11.Font;
      arg3 : X11.Font;
      arg4 : unsigned;
      arg5 : unsigned;
      arg6 : access constant XColor;
      arg7 : access constant XColor) return X11.Cursor  -- /usr/include/X11/Xlib.h:1567
   with Import => True, 
        Convention => C, 
        External_Name => "XCreateGlyphCursor";

  -- display  
  -- source_font  
  -- mask_font  
  -- source_char  
  -- mask_char  
  -- foreground_color  
  -- background_color  
   function XCreateFontCursor (arg1 : access Display; arg2 : unsigned) return X11.Cursor  -- /usr/include/X11/Xlib.h:1576
   with Import => True, 
        Convention => C, 
        External_Name => "XCreateFontCursor";

  -- display  
  -- shape  
   function XLoadFont (arg1 : access Display; arg2 : Interfaces.C.Strings.chars_ptr) return X11.Font  -- /usr/include/X11/Xlib.h:1580
   with Import => True, 
        Convention => C, 
        External_Name => "XLoadFont";

  -- display  
  -- name  
   function XCreateGC
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : unsigned_long;
      arg4 : access XGCValues) return GC  -- /usr/include/X11/Xlib.h:1584
   with Import => True, 
        Convention => C, 
        External_Name => "XCreateGC";

  -- display  
  -- d  
  -- valuemask  
  -- values  
   function XGContextFromGC (arg1 : GC) return X11.GContext  -- /usr/include/X11/Xlib.h:1590
   with Import => True, 
        Convention => C, 
        External_Name => "XGContextFromGC";

  -- gc  
   procedure XFlushGC (arg1 : access Display; arg2 : GC)  -- /usr/include/X11/Xlib.h:1593
   with Import => True, 
        Convention => C, 
        External_Name => "XFlushGC";

  -- display  
  -- gc  
   function XCreatePixmap
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : unsigned;
      arg4 : unsigned;
      arg5 : unsigned) return X11.Pixmap  -- /usr/include/X11/Xlib.h:1597
   with Import => True, 
        Convention => C, 
        External_Name => "XCreatePixmap";

  -- display  
  -- d  
  -- width  
  -- height  
  -- depth  
   function XCreateBitmapFromData
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : unsigned;
      arg5 : unsigned) return X11.Pixmap  -- /usr/include/X11/Xlib.h:1604
   with Import => True, 
        Convention => C, 
        External_Name => "XCreateBitmapFromData";

  -- display  
  -- d  
  -- data  
  -- width  
  -- height  
   function XCreatePixmapFromBitmapData
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : unsigned;
      arg5 : unsigned;
      arg6 : unsigned_long;
      arg7 : unsigned_long;
      arg8 : unsigned) return X11.Pixmap  -- /usr/include/X11/Xlib.h:1611
   with Import => True, 
        Convention => C, 
        External_Name => "XCreatePixmapFromBitmapData";

  -- display  
  -- d  
  -- data  
  -- width  
  -- height  
  -- fg  
  -- bg  
  -- depth  
   function XCreateSimpleWindow
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : int;
      arg4 : int;
      arg5 : unsigned;
      arg6 : unsigned;
      arg7 : unsigned;
      arg8 : unsigned_long;
      arg9 : unsigned_long) return X11.Window  -- /usr/include/X11/Xlib.h:1621
   with Import => True, 
        Convention => C, 
        External_Name => "XCreateSimpleWindow";

  -- display  
  -- parent  
  -- x  
  -- y  
  -- width  
  -- height  
  -- border_width  
  -- border  
  -- background  
   function XGetSelectionOwner (arg1 : access Display; arg2 : X11.Atom) return X11.Window  -- /usr/include/X11/Xlib.h:1632
   with Import => True, 
        Convention => C, 
        External_Name => "XGetSelectionOwner";

  -- display  
  -- selection  
   function XCreateWindow
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : int;
      arg4 : int;
      arg5 : unsigned;
      arg6 : unsigned;
      arg7 : unsigned;
      arg8 : int;
      arg9 : unsigned;
      arg10 : access Visual;
      arg11 : unsigned_long;
      arg12 : access XSetWindowAttributes) return X11.Window  -- /usr/include/X11/Xlib.h:1636
   with Import => True, 
        Convention => C, 
        External_Name => "XCreateWindow";

  -- display  
  -- parent  
  -- x  
  -- y  
  -- width  
  -- height  
  -- border_width  
  -- depth  
  -- class  
  -- visual  
  -- valuemask  
  -- attributes  
   function XListInstalledColormaps
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : access int) return access X11.Colormap  -- /usr/include/X11/Xlib.h:1650
   with Import => True, 
        Convention => C, 
        External_Name => "XListInstalledColormaps";

  -- display  
  -- w  
  -- num_return  
   function XListFonts
     (arg1 : access Display;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int;
      arg4 : access int) return System.Address  -- /usr/include/X11/Xlib.h:1655
   with Import => True, 
        Convention => C, 
        External_Name => "XListFonts";

  -- display  
  -- pattern  
  -- maxnames  
  -- actual_count_return  
   function XListFontsWithInfo
     (arg1 : access Display;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int;
      arg4 : access int;
      arg5 : System.Address) return System.Address  -- /usr/include/X11/Xlib.h:1661
   with Import => True, 
        Convention => C, 
        External_Name => "XListFontsWithInfo";

  -- display  
  -- pattern  
  -- maxnames  
  -- count_return  
  -- info_return  
   function XGetFontPath (arg1 : access Display; arg2 : access int) return System.Address  -- /usr/include/X11/Xlib.h:1668
   with Import => True, 
        Convention => C, 
        External_Name => "XGetFontPath";

  -- display  
  -- npaths_return  
   function XListExtensions (arg1 : access Display; arg2 : access int) return System.Address  -- /usr/include/X11/Xlib.h:1672
   with Import => True, 
        Convention => C, 
        External_Name => "XListExtensions";

  -- display  
  -- nextensions_return  
   function XListProperties
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : access int) return access X11.Atom  -- /usr/include/X11/Xlib.h:1676
   with Import => True, 
        Convention => C, 
        External_Name => "XListProperties";

  -- display  
  -- w  
  -- num_prop_return  
   function XListHosts
     (arg1 : access Display;
      arg2 : access int;
      arg3 : access int) return access XHostAddress  -- /usr/include/X11/Xlib.h:1681
   with Import => True, 
        Convention => C, 
        External_Name => "XListHosts";

  -- display  
  -- nhosts_return  
  -- state_return  
   function XKeycodeToKeysym
     (arg1 : access Display;
      arg2 : X11.KeyCode;
      arg3 : int) return X11.KeySym  -- /usr/include/X11/Xlib.h:1687
   with Import => True, 
        Convention => C, 
        External_Name => "XKeycodeToKeysym";

  -- display  
  -- keycode  
  -- keycode  
  -- index  
   function c_XLookupKeysym (arg1 : access XKeyEvent; arg2 : int) return X11.KeySym  -- /usr/include/X11/Xlib.h:1696
   with Import => True, 
        Convention => C, 
        External_Name => "XLookupKeysym";

  -- key_event  
  -- index  
   function XGetKeyboardMapping
     (arg1 : access Display;
      arg2 : X11.KeyCode;
      arg3 : int;
      arg4 : access int) return access X11.KeySym  -- /usr/include/X11/Xlib.h:1700
   with Import => True, 
        Convention => C, 
        External_Name => "XGetKeyboardMapping";

  -- display  
  -- first_keycode  
  -- first_keycode  
  -- keycode_count  
  -- keysyms_per_keycode_return  
   function XStringToKeysym (arg1 : Interfaces.C.Strings.chars_ptr) return X11.KeySym  -- /usr/include/X11/Xlib.h:1710
   with Import => True, 
        Convention => C, 
        External_Name => "XStringToKeysym";

  -- string  
   function XMaxRequestSize (arg1 : access Display) return long  -- /usr/include/X11/Xlib.h:1713
   with Import => True, 
        Convention => C, 
        External_Name => "XMaxRequestSize";

  -- display  
   function XExtendedMaxRequestSize (arg1 : access Display) return long  -- /usr/include/X11/Xlib.h:1716
   with Import => True, 
        Convention => C, 
        External_Name => "XExtendedMaxRequestSize";

  -- display  
   function XResourceManagerString (arg1 : access Display) return Interfaces.C.Strings.chars_ptr  -- /usr/include/X11/Xlib.h:1719
   with Import => True, 
        Convention => C, 
        External_Name => "XResourceManagerString";

  -- display  
   function XScreenResourceString (arg1 : access Screen) return Interfaces.C.Strings.chars_ptr  -- /usr/include/X11/Xlib.h:1722
   with Import => True, 
        Convention => C, 
        External_Name => "XScreenResourceString";

  -- screen  
   function XDisplayMotionBufferSize (arg1 : access Display) return unsigned_long  -- /usr/include/X11/Xlib.h:1725
   with Import => True, 
        Convention => C, 
        External_Name => "XDisplayMotionBufferSize";

  -- display  
   function XVisualIDFromVisual (arg1 : access Visual) return X11.VisualID  -- /usr/include/X11/Xlib.h:1728
   with Import => True, 
        Convention => C, 
        External_Name => "XVisualIDFromVisual";

  -- visual  
  -- multithread routines  
   function XInitThreads return int  -- /usr/include/X11/Xlib.h:1734
   with Import => True, 
        Convention => C, 
        External_Name => "XInitThreads";

   procedure XLockDisplay (arg1 : access Display)  -- /usr/include/X11/Xlib.h:1738
   with Import => True, 
        Convention => C, 
        External_Name => "XLockDisplay";

  -- display  
   procedure XUnlockDisplay (arg1 : access Display)  -- /usr/include/X11/Xlib.h:1742
   with Import => True, 
        Convention => C, 
        External_Name => "XUnlockDisplay";

  -- display  
  -- routines for dealing with extensions  
   function XInitExtension (arg1 : access Display; arg2 : Interfaces.C.Strings.chars_ptr) return access XExtCodes  -- /usr/include/X11/Xlib.h:1748
   with Import => True, 
        Convention => C, 
        External_Name => "XInitExtension";

  -- display  
  -- name  
   function XAddExtension (arg1 : access Display) return access XExtCodes  -- /usr/include/X11/Xlib.h:1753
   with Import => True, 
        Convention => C, 
        External_Name => "XAddExtension";

  -- display  
   function XFindOnExtensionList (arg1 : System.Address; arg2 : int) return access XExtData  -- /usr/include/X11/Xlib.h:1756
   with Import => True, 
        Convention => C, 
        External_Name => "XFindOnExtensionList";

  -- structure  
  -- number  
   function XEHeadOfExtensionList (arg1 : XEDataObject) return System.Address  -- /usr/include/X11/Xlib.h:1760
   with Import => True, 
        Convention => C, 
        External_Name => "XEHeadOfExtensionList";

  -- object  
  -- these are routines for which there are also macros  
   function XRootWindow (arg1 : access Display; arg2 : int) return X11.Window  -- /usr/include/X11/Xlib.h:1765
   with Import => True, 
        Convention => C, 
        External_Name => "XRootWindow";

  -- display  
  -- screen_number  
   function XDefaultRootWindow (arg1 : access Display) return X11.Window  -- /usr/include/X11/Xlib.h:1769
   with Import => True, 
        Convention => C, 
        External_Name => "XDefaultRootWindow";

  -- display  
   function XRootWindowOfScreen (arg1 : access Screen) return X11.Window  -- /usr/include/X11/Xlib.h:1772
   with Import => True, 
        Convention => C, 
        External_Name => "XRootWindowOfScreen";

  -- screen  
   function XDefaultVisual (arg1 : access Display; arg2 : int) return access Visual  -- /usr/include/X11/Xlib.h:1775
   with Import => True, 
        Convention => C, 
        External_Name => "XDefaultVisual";

  -- display  
  -- screen_number  
   function XDefaultVisualOfScreen (arg1 : access Screen) return access Visual  -- /usr/include/X11/Xlib.h:1779
   with Import => True, 
        Convention => C, 
        External_Name => "XDefaultVisualOfScreen";

  -- screen  
   function XDefaultGC (arg1 : access Display; arg2 : int) return GC  -- /usr/include/X11/Xlib.h:1782
   with Import => True, 
        Convention => C, 
        External_Name => "XDefaultGC";

  -- display  
  -- screen_number  
   function XDefaultGCOfScreen (arg1 : access Screen) return GC  -- /usr/include/X11/Xlib.h:1786
   with Import => True, 
        Convention => C, 
        External_Name => "XDefaultGCOfScreen";

  -- screen  
   function XBlackPixel (arg1 : access Display; arg2 : int) return unsigned_long  -- /usr/include/X11/Xlib.h:1789
   with Import => True, 
        Convention => C, 
        External_Name => "XBlackPixel";

  -- display  
  -- screen_number  
   function XWhitePixel (arg1 : access Display; arg2 : int) return unsigned_long  -- /usr/include/X11/Xlib.h:1793
   with Import => True, 
        Convention => C, 
        External_Name => "XWhitePixel";

  -- display  
  -- screen_number  
   function XAllPlanes return unsigned_long  -- /usr/include/X11/Xlib.h:1797
   with Import => True, 
        Convention => C, 
        External_Name => "XAllPlanes";

   function XBlackPixelOfScreen (arg1 : access Screen) return unsigned_long  -- /usr/include/X11/Xlib.h:1800
   with Import => True, 
        Convention => C, 
        External_Name => "XBlackPixelOfScreen";

  -- screen  
   function XWhitePixelOfScreen (arg1 : access Screen) return unsigned_long  -- /usr/include/X11/Xlib.h:1803
   with Import => True, 
        Convention => C, 
        External_Name => "XWhitePixelOfScreen";

  -- screen  
   function XNextRequest (arg1 : access Display) return unsigned_long  -- /usr/include/X11/Xlib.h:1806
   with Import => True, 
        Convention => C, 
        External_Name => "XNextRequest";

  -- display  
   function XLastKnownRequestProcessed (arg1 : access Display) return unsigned_long  -- /usr/include/X11/Xlib.h:1809
   with Import => True, 
        Convention => C, 
        External_Name => "XLastKnownRequestProcessed";

  -- display  
   function XServerVendor (arg1 : access Display) return Interfaces.C.Strings.chars_ptr  -- /usr/include/X11/Xlib.h:1812
   with Import => True, 
        Convention => C, 
        External_Name => "XServerVendor";

  -- display  
   function XDisplayString (arg1 : access Display) return Interfaces.C.Strings.chars_ptr  -- /usr/include/X11/Xlib.h:1815
   with Import => True, 
        Convention => C, 
        External_Name => "XDisplayString";

  -- display  
   function XDefaultColormap (arg1 : access Display; arg2 : int) return X11.Colormap  -- /usr/include/X11/Xlib.h:1818
   with Import => True, 
        Convention => C, 
        External_Name => "XDefaultColormap";

  -- display  
  -- screen_number  
   function XDefaultColormapOfScreen (arg1 : access Screen) return X11.Colormap  -- /usr/include/X11/Xlib.h:1822
   with Import => True, 
        Convention => C, 
        External_Name => "XDefaultColormapOfScreen";

  -- screen  
   function XDisplayOfScreen (arg1 : access Screen) return access Display  -- /usr/include/X11/Xlib.h:1825
   with Import => True, 
        Convention => C, 
        External_Name => "XDisplayOfScreen";

  -- screen  
   function XScreenOfDisplay (arg1 : access Display; arg2 : int) return access Screen  -- /usr/include/X11/Xlib.h:1828
   with Import => True, 
        Convention => C, 
        External_Name => "XScreenOfDisplay";

  -- display  
  -- screen_number  
   function XDefaultScreenOfDisplay (arg1 : access Display) return access Screen  -- /usr/include/X11/Xlib.h:1832
   with Import => True, 
        Convention => C, 
        External_Name => "XDefaultScreenOfDisplay";

  -- display  
   function XEventMaskOfScreen (arg1 : access Screen) return long  -- /usr/include/X11/Xlib.h:1835
   with Import => True, 
        Convention => C, 
        External_Name => "XEventMaskOfScreen";

  -- screen  
   function XScreenNumberOfScreen (arg1 : access Screen) return int  -- /usr/include/X11/Xlib.h:1839
   with Import => True, 
        Convention => C, 
        External_Name => "XScreenNumberOfScreen";

  -- screen  
  -- WARNING, this type not in Xlib spec  
   type XErrorHandler is access function (arg1 : access Display; arg2 : access XErrorEvent) return int
   with Convention => C;  -- /usr/include/X11/Xlib.h:1843

  -- display  
  -- error_event  
   function XSetErrorHandler (arg1 : XErrorHandler) return XErrorHandler  -- /usr/include/X11/Xlib.h:1848
   with Import => True, 
        Convention => C, 
        External_Name => "XSetErrorHandler";

  -- handler  
  -- WARNING, this type not in Xlib spec  
   type XIOErrorHandler is access function (arg1 : access Display) return int
   with Convention => C;  -- /usr/include/X11/Xlib.h:1853

  -- display  
   function XSetIOErrorHandler (arg1 : XIOErrorHandler) return XIOErrorHandler  -- /usr/include/X11/Xlib.h:1857
   with Import => True, 
        Convention => C, 
        External_Name => "XSetIOErrorHandler";

  -- handler  
  -- WARNING, this type not in Xlib spec  
   type XIOErrorExitHandler is access procedure (arg1 : access Display; arg2 : System.Address)
   with Convention => C;  -- /usr/include/X11/Xlib.h:1861

  -- display  
  -- user_data  
   procedure XSetIOErrorExitHandler
     (arg1 : access Display;
      arg2 : XIOErrorExitHandler;
      arg3 : System.Address)  -- /usr/include/X11/Xlib.h:1866
   with Import => True, 
        Convention => C, 
        External_Name => "XSetIOErrorExitHandler";

  -- display  
  -- handler  
  -- user_data  
   function XListPixmapFormats (arg1 : access Display; arg2 : access int) return access XPixmapFormatValues  -- /usr/include/X11/Xlib.h:1872
   with Import => True, 
        Convention => C, 
        External_Name => "XListPixmapFormats";

  -- display  
  -- count_return  
   function XListDepths
     (arg1 : access Display;
      arg2 : int;
      arg3 : access int) return access int  -- /usr/include/X11/Xlib.h:1876
   with Import => True, 
        Convention => C, 
        External_Name => "XListDepths";

  -- display  
  -- screen_number  
  -- count_return  
  -- ICCCM routines for things that don't require special include files;  
  -- other declarations are given in Xutil.h                              
   function XReconfigureWMWindow
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : int;
      arg4 : unsigned;
      arg5 : access XWindowChanges) return int  -- /usr/include/X11/Xlib.h:1884
   with Import => True, 
        Convention => C, 
        External_Name => "XReconfigureWMWindow";

  -- display  
  -- w  
  -- screen_number  
  -- mask  
  -- changes  
   function XGetWMProtocols
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : System.Address;
      arg4 : access int) return int  -- /usr/include/X11/Xlib.h:1892
   with Import => True, 
        Convention => C, 
        External_Name => "XGetWMProtocols";

  -- display  
  -- w  
  -- protocols_return  
  -- count_return  
   function XSetWMProtocols
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : access X11.Atom;
      arg4 : int) return int  -- /usr/include/X11/Xlib.h:1898
   with Import => True, 
        Convention => C, 
        External_Name => "XSetWMProtocols";

  -- display  
  -- w  
  -- protocols  
  -- count  
   function XIconifyWindow
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : int) return int  -- /usr/include/X11/Xlib.h:1904
   with Import => True, 
        Convention => C, 
        External_Name => "XIconifyWindow";

  -- display  
  -- w  
  -- screen_number  
   function XWithdrawWindow
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : int) return int  -- /usr/include/X11/Xlib.h:1909
   with Import => True, 
        Convention => C, 
        External_Name => "XWithdrawWindow";

  -- display  
  -- w  
  -- screen_number  
   function XGetCommand
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : System.Address;
      arg4 : access int) return int  -- /usr/include/X11/Xlib.h:1914
   with Import => True, 
        Convention => C, 
        External_Name => "XGetCommand";

  -- display  
  -- w  
  -- argv_return  
  -- argc_return  
   function XGetWMColormapWindows
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : System.Address;
      arg4 : access int) return int  -- /usr/include/X11/Xlib.h:1920
   with Import => True, 
        Convention => C, 
        External_Name => "XGetWMColormapWindows";

  -- display  
  -- w  
  -- windows_return  
  -- count_return  
   function XSetWMColormapWindows
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : access X11.Window;
      arg4 : int) return int  -- /usr/include/X11/Xlib.h:1926
   with Import => True, 
        Convention => C, 
        External_Name => "XSetWMColormapWindows";

  -- display  
  -- w  
  -- colormap_windows  
  -- count  
   procedure XFreeStringList (arg1 : System.Address)  -- /usr/include/X11/Xlib.h:1932
   with Import => True, 
        Convention => C, 
        External_Name => "XFreeStringList";

  -- list  
   function XSetTransientForHint
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : X11.Window) return int  -- /usr/include/X11/Xlib.h:1935
   with Import => True, 
        Convention => C, 
        External_Name => "XSetTransientForHint";

  -- display  
  -- w  
  -- prop_window  
  -- The following are given in alphabetical order  
   function XActivateScreenSaver (arg1 : access Display) return int  -- /usr/include/X11/Xlib.h:1943
   with Import => True, 
        Convention => C, 
        External_Name => "XActivateScreenSaver";

  -- display  
   function XAddHost (arg1 : access Display; arg2 : access XHostAddress) return int  -- /usr/include/X11/Xlib.h:1947
   with Import => True, 
        Convention => C, 
        External_Name => "XAddHost";

  -- display  
  -- host  
   function XAddHosts
     (arg1 : access Display;
      arg2 : access XHostAddress;
      arg3 : int) return int  -- /usr/include/X11/Xlib.h:1952
   with Import => True, 
        Convention => C, 
        External_Name => "XAddHosts";

  -- display  
  -- hosts  
  -- num_hosts  
   function XAddToExtensionList (arg1 : System.Address; arg2 : access XExtData) return int  -- /usr/include/X11/Xlib.h:1958
   with Import => True, 
        Convention => C, 
        External_Name => "XAddToExtensionList";

  -- structure  
  -- ext_data  
   function XAddToSaveSet (arg1 : access Display; arg2 : X11.Window) return int  -- /usr/include/X11/Xlib.h:1963
   with Import => True, 
        Convention => C, 
        External_Name => "XAddToSaveSet";

  -- display  
  -- w  
   function XAllocColor
     (arg1 : access Display;
      arg2 : X11.Colormap;
      arg3 : access XColor) return int  -- /usr/include/X11/Xlib.h:1968
   with Import => True, 
        Convention => C, 
        External_Name => "XAllocColor";

  -- display  
  -- colormap  
  -- screen_in_out  
   function XAllocColorCells
     (arg1 : access Display;
      arg2 : X11.Colormap;
      arg3 : int;
      arg4 : access unsigned_long;
      arg5 : unsigned;
      arg6 : access unsigned_long;
      arg7 : unsigned) return int  -- /usr/include/X11/Xlib.h:1974
   with Import => True, 
        Convention => C, 
        External_Name => "XAllocColorCells";

  -- display  
  -- colormap  
  -- contig  
  -- plane_masks_return  
  -- nplanes  
  -- pixels_return  
  -- npixels  
   function XAllocColorPlanes
     (arg1 : access Display;
      arg2 : X11.Colormap;
      arg3 : int;
      arg4 : access unsigned_long;
      arg5 : int;
      arg6 : int;
      arg7 : int;
      arg8 : int;
      arg9 : access unsigned_long;
      arg10 : access unsigned_long;
      arg11 : access unsigned_long) return int  -- /usr/include/X11/Xlib.h:1984
   with Import => True, 
        Convention => C, 
        External_Name => "XAllocColorPlanes";

  -- display  
  -- colormap  
  -- contig  
  -- pixels_return  
  -- ncolors  
  -- nreds  
  -- ngreens  
  -- nblues  
  -- rmask_return  
  -- gmask_return  
  -- bmask_return  
   function XAllocNamedColor
     (arg1 : access Display;
      arg2 : X11.Colormap;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : access XColor;
      arg5 : access XColor) return int  -- /usr/include/X11/Xlib.h:1998
   with Import => True, 
        Convention => C, 
        External_Name => "XAllocNamedColor";

  -- display  
  -- colormap  
  -- color_name  
  -- screen_def_return  
  -- exact_def_return  
   function XAllowEvents
     (arg1 : access Display;
      arg2 : int;
      arg3 : X11.Time) return int  -- /usr/include/X11/Xlib.h:2006
   with Import => True, 
        Convention => C, 
        External_Name => "XAllowEvents";

  -- display  
  -- event_mode  
  -- time  
   function XAutoRepeatOff (arg1 : access Display) return int  -- /usr/include/X11/Xlib.h:2012
   with Import => True, 
        Convention => C, 
        External_Name => "XAutoRepeatOff";

  -- display  
   function XAutoRepeatOn (arg1 : access Display) return int  -- /usr/include/X11/Xlib.h:2016
   with Import => True, 
        Convention => C, 
        External_Name => "XAutoRepeatOn";

  -- display  
   function XBell (arg1 : access Display; arg2 : int) return int  -- /usr/include/X11/Xlib.h:2020
   with Import => True, 
        Convention => C, 
        External_Name => "XBell";

  -- display  
  -- percent  
   function XBitmapBitOrder (arg1 : access Display) return int  -- /usr/include/X11/Xlib.h:2025
   with Import => True, 
        Convention => C, 
        External_Name => "XBitmapBitOrder";

  -- display  
   function XBitmapPad (arg1 : access Display) return int  -- /usr/include/X11/Xlib.h:2029
   with Import => True, 
        Convention => C, 
        External_Name => "XBitmapPad";

  -- display  
   function XBitmapUnit (arg1 : access Display) return int  -- /usr/include/X11/Xlib.h:2033
   with Import => True, 
        Convention => C, 
        External_Name => "XBitmapUnit";

  -- display  
   function XCellsOfScreen (arg1 : access Screen) return int  -- /usr/include/X11/Xlib.h:2037
   with Import => True, 
        Convention => C, 
        External_Name => "XCellsOfScreen";

  -- screen  
   function XChangeActivePointerGrab
     (arg1 : access Display;
      arg2 : unsigned;
      arg3 : X11.Cursor;
      arg4 : X11.Time) return int  -- /usr/include/X11/Xlib.h:2041
   with Import => True, 
        Convention => C, 
        External_Name => "XChangeActivePointerGrab";

  -- display  
  -- event_mask  
  -- cursor  
  -- time  
   function XChangeGC
     (arg1 : access Display;
      arg2 : GC;
      arg3 : unsigned_long;
      arg4 : access XGCValues) return int  -- /usr/include/X11/Xlib.h:2048
   with Import => True, 
        Convention => C, 
        External_Name => "XChangeGC";

  -- display  
  -- gc  
  -- valuemask  
  -- values  
   function XChangeKeyboardControl
     (arg1 : access Display;
      arg2 : unsigned_long;
      arg3 : access XKeyboardControl) return int  -- /usr/include/X11/Xlib.h:2055
   with Import => True, 
        Convention => C, 
        External_Name => "XChangeKeyboardControl";

  -- display  
  -- value_mask  
  -- values  
   function XChangeKeyboardMapping
     (arg1 : access Display;
      arg2 : int;
      arg3 : int;
      arg4 : access X11.KeySym;
      arg5 : int) return int  -- /usr/include/X11/Xlib.h:2061
   with Import => True, 
        Convention => C, 
        External_Name => "XChangeKeyboardMapping";

  -- display  
  -- first_keycode  
  -- keysyms_per_keycode  
  -- keysyms  
  -- num_codes  
   function XChangePointerControl
     (arg1 : access Display;
      arg2 : int;
      arg3 : int;
      arg4 : int;
      arg5 : int;
      arg6 : int) return int  -- /usr/include/X11/Xlib.h:2069
   with Import => True, 
        Convention => C, 
        External_Name => "XChangePointerControl";

  -- display  
  -- do_accel  
  -- do_threshold  
  -- accel_numerator  
  -- accel_denominator  
  -- threshold  
   function XChangeProperty
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : X11.Atom;
      arg4 : X11.Atom;
      arg5 : int;
      arg6 : int;
      arg7 : access unsigned_char;
      arg8 : int) return int  -- /usr/include/X11/Xlib.h:2078
   with Import => True, 
        Convention => C, 
        External_Name => "XChangeProperty";

  -- display  
  -- w  
  -- property  
  -- type  
  -- format  
  -- mode  
  -- data  
  -- nelements  
   function XChangeSaveSet
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : int) return int  -- /usr/include/X11/Xlib.h:2089
   with Import => True, 
        Convention => C, 
        External_Name => "XChangeSaveSet";

  -- display  
  -- w  
  -- change_mode  
   function XChangeWindowAttributes
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : unsigned_long;
      arg4 : access XSetWindowAttributes) return int  -- /usr/include/X11/Xlib.h:2095
   with Import => True, 
        Convention => C, 
        External_Name => "XChangeWindowAttributes";

  -- display  
  -- w  
  -- valuemask  
  -- attributes  
   function XCheckIfEvent
     (arg1 : access Display;
      arg2 : access XEvent;
      arg3 : access function
        (arg1 : access Display;
         arg2 : access XEvent;
         arg3 : XPointer) return int;
      arg4 : XPointer) return int  -- /usr/include/X11/Xlib.h:2102
   with Import => True, 
        Convention => C, 
        External_Name => "XCheckIfEvent";

  -- display  
  -- event_return  
  -- display  
  -- event  
  -- arg  
  -- predicate  
  -- arg  
   function XCheckMaskEvent
     (arg1 : access Display;
      arg2 : long;
      arg3 : access XEvent) return int  -- /usr/include/X11/Xlib.h:2113
   with Import => True, 
        Convention => C, 
        External_Name => "XCheckMaskEvent";

  -- display  
  -- event_mask  
  -- event_return  
   function XCheckTypedEvent
     (arg1 : access Display;
      arg2 : int;
      arg3 : access XEvent) return int  -- /usr/include/X11/Xlib.h:2119
   with Import => True, 
        Convention => C, 
        External_Name => "XCheckTypedEvent";

  -- display  
  -- event_type  
  -- event_return  
   function XCheckTypedWindowEvent
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : int;
      arg4 : access XEvent) return int  -- /usr/include/X11/Xlib.h:2125
   with Import => True, 
        Convention => C, 
        External_Name => "XCheckTypedWindowEvent";

  -- display  
  -- w  
  -- event_type  
  -- event_return  
   function XCheckWindowEvent
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : long;
      arg4 : access XEvent) return int  -- /usr/include/X11/Xlib.h:2132
   with Import => True, 
        Convention => C, 
        External_Name => "XCheckWindowEvent";

  -- display  
  -- w  
  -- event_mask  
  -- event_return  
   function XCirculateSubwindows
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : int) return int  -- /usr/include/X11/Xlib.h:2139
   with Import => True, 
        Convention => C, 
        External_Name => "XCirculateSubwindows";

  -- display  
  -- w  
  -- direction  
   function XCirculateSubwindowsDown (arg1 : access Display; arg2 : X11.Window) return int  -- /usr/include/X11/Xlib.h:2145
   with Import => True, 
        Convention => C, 
        External_Name => "XCirculateSubwindowsDown";

  -- display  
  -- w  
   function XCirculateSubwindowsUp (arg1 : access Display; arg2 : X11.Window) return int  -- /usr/include/X11/Xlib.h:2150
   with Import => True, 
        Convention => C, 
        External_Name => "XCirculateSubwindowsUp";

  -- display  
  -- w  
   function XClearArea
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : int;
      arg4 : int;
      arg5 : unsigned;
      arg6 : unsigned;
      arg7 : int) return int  -- /usr/include/X11/Xlib.h:2155
   with Import => True, 
        Convention => C, 
        External_Name => "XClearArea";

  -- display  
  -- w  
  -- x  
  -- y  
  -- width  
  -- height  
  -- exposures  
   function XClearWindow (arg1 : access Display; arg2 : X11.Window) return int  -- /usr/include/X11/Xlib.h:2165
   with Import => True, 
        Convention => C, 
        External_Name => "XClearWindow";

  -- display  
  -- w  
   function XCloseDisplay (arg1 : access Display) return int  -- /usr/include/X11/Xlib.h:2170
   with Import => True, 
        Convention => C, 
        External_Name => "XCloseDisplay";

  -- display  
   function XConfigureWindow
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : unsigned;
      arg4 : access XWindowChanges) return int  -- /usr/include/X11/Xlib.h:2174
   with Import => True, 
        Convention => C, 
        External_Name => "XConfigureWindow";

  -- display  
  -- w  
  -- value_mask  
  -- values  
   function XConnectionNumber (arg1 : access Display) return int  -- /usr/include/X11/Xlib.h:2181
   with Import => True, 
        Convention => C, 
        External_Name => "XConnectionNumber";

  -- display  
   function XConvertSelection
     (arg1 : access Display;
      arg2 : X11.Atom;
      arg3 : X11.Atom;
      arg4 : X11.Atom;
      arg5 : X11.Window;
      arg6 : X11.Time) return int  -- /usr/include/X11/Xlib.h:2185
   with Import => True, 
        Convention => C, 
        External_Name => "XConvertSelection";

  -- display  
  -- selection  
  -- target  
  -- property  
  -- requestor  
  -- time  
   function XCopyArea
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : X11.Drawable;
      arg4 : GC;
      arg5 : int;
      arg6 : int;
      arg7 : unsigned;
      arg8 : unsigned;
      arg9 : int;
      arg10 : int) return int  -- /usr/include/X11/Xlib.h:2194
   with Import => True, 
        Convention => C, 
        External_Name => "XCopyArea";

  -- display  
  -- src  
  -- dest  
  -- gc  
  -- src_x  
  -- src_y  
  -- width  
  -- height  
  -- dest_x  
  -- dest_y  
   function XCopyGC
     (arg1 : access Display;
      arg2 : GC;
      arg3 : unsigned_long;
      arg4 : GC) return int  -- /usr/include/X11/Xlib.h:2207
   with Import => True, 
        Convention => C, 
        External_Name => "XCopyGC";

  -- display  
  -- src  
  -- valuemask  
  -- dest  
   function XCopyPlane
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : X11.Drawable;
      arg4 : GC;
      arg5 : int;
      arg6 : int;
      arg7 : unsigned;
      arg8 : unsigned;
      arg9 : int;
      arg10 : int;
      arg11 : unsigned_long) return int  -- /usr/include/X11/Xlib.h:2214
   with Import => True, 
        Convention => C, 
        External_Name => "XCopyPlane";

  -- display  
  -- src  
  -- dest  
  -- gc  
  -- src_x  
  -- src_y  
  -- width  
  -- height  
  -- dest_x  
  -- dest_y  
  -- plane  
   function XDefaultDepth (arg1 : access Display; arg2 : int) return int  -- /usr/include/X11/Xlib.h:2228
   with Import => True, 
        Convention => C, 
        External_Name => "XDefaultDepth";

  -- display  
  -- screen_number  
   function XDefaultDepthOfScreen (arg1 : access Screen) return int  -- /usr/include/X11/Xlib.h:2233
   with Import => True, 
        Convention => C, 
        External_Name => "XDefaultDepthOfScreen";

  -- screen  
   function XDefaultScreen (arg1 : access Display) return int  -- /usr/include/X11/Xlib.h:2237
   with Import => True, 
        Convention => C, 
        External_Name => "XDefaultScreen";

  -- display  
   function XDefineCursor
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : X11.Cursor) return int  -- /usr/include/X11/Xlib.h:2241
   with Import => True, 
        Convention => C, 
        External_Name => "XDefineCursor";

  -- display  
  -- w  
  -- cursor  
   function XDeleteProperty
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : X11.Atom) return int  -- /usr/include/X11/Xlib.h:2247
   with Import => True, 
        Convention => C, 
        External_Name => "XDeleteProperty";

  -- display  
  -- w  
  -- property  
   function XDestroyWindow (arg1 : access Display; arg2 : X11.Window) return int  -- /usr/include/X11/Xlib.h:2253
   with Import => True, 
        Convention => C, 
        External_Name => "XDestroyWindow";

  -- display  
  -- w  
   function XDestroySubwindows (arg1 : access Display; arg2 : X11.Window) return int  -- /usr/include/X11/Xlib.h:2258
   with Import => True, 
        Convention => C, 
        External_Name => "XDestroySubwindows";

  -- display  
  -- w  
   function XDoesBackingStore (arg1 : access Screen) return int  -- /usr/include/X11/Xlib.h:2263
   with Import => True, 
        Convention => C, 
        External_Name => "XDoesBackingStore";

  -- screen  
   function XDoesSaveUnders (arg1 : access Screen) return int  -- /usr/include/X11/Xlib.h:2267
   with Import => True, 
        Convention => C, 
        External_Name => "XDoesSaveUnders";

  -- screen  
   function XDisableAccessControl (arg1 : access Display) return int  -- /usr/include/X11/Xlib.h:2271
   with Import => True, 
        Convention => C, 
        External_Name => "XDisableAccessControl";

  -- display  
   function XDisplayCells (arg1 : access Display; arg2 : int) return int  -- /usr/include/X11/Xlib.h:2276
   with Import => True, 
        Convention => C, 
        External_Name => "XDisplayCells";

  -- display  
  -- screen_number  
   function XDisplayHeight (arg1 : access Display; arg2 : int) return int  -- /usr/include/X11/Xlib.h:2281
   with Import => True, 
        Convention => C, 
        External_Name => "XDisplayHeight";

  -- display  
  -- screen_number  
   function XDisplayHeightMM (arg1 : access Display; arg2 : int) return int  -- /usr/include/X11/Xlib.h:2286
   with Import => True, 
        Convention => C, 
        External_Name => "XDisplayHeightMM";

  -- display  
  -- screen_number  
   function XDisplayKeycodes
     (arg1 : access Display;
      arg2 : access int;
      arg3 : access int) return int  -- /usr/include/X11/Xlib.h:2291
   with Import => True, 
        Convention => C, 
        External_Name => "XDisplayKeycodes";

  -- display  
  -- min_keycodes_return  
  -- max_keycodes_return  
   function XDisplayPlanes (arg1 : access Display; arg2 : int) return int  -- /usr/include/X11/Xlib.h:2297
   with Import => True, 
        Convention => C, 
        External_Name => "XDisplayPlanes";

  -- display  
  -- screen_number  
   function XDisplayWidth (arg1 : access Display; arg2 : int) return int  -- /usr/include/X11/Xlib.h:2302
   with Import => True, 
        Convention => C, 
        External_Name => "XDisplayWidth";

  -- display  
  -- screen_number  
   function XDisplayWidthMM (arg1 : access Display; arg2 : int) return int  -- /usr/include/X11/Xlib.h:2307
   with Import => True, 
        Convention => C, 
        External_Name => "XDisplayWidthMM";

  -- display  
  -- screen_number  
   function XDrawArc
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : GC;
      arg4 : int;
      arg5 : int;
      arg6 : unsigned;
      arg7 : unsigned;
      arg8 : int;
      arg9 : int) return int  -- /usr/include/X11/Xlib.h:2312
   with Import => True, 
        Convention => C, 
        External_Name => "XDrawArc";

  -- display  
  -- d  
  -- gc  
  -- x  
  -- y  
  -- width  
  -- height  
  -- angle1  
  -- angle2  
   function XDrawArcs
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : GC;
      arg4 : access XArc;
      arg5 : int) return int  -- /usr/include/X11/Xlib.h:2324
   with Import => True, 
        Convention => C, 
        External_Name => "XDrawArcs";

  -- display  
  -- d  
  -- gc  
  -- arcs  
  -- narcs  
   function XDrawImageString
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : GC;
      arg4 : int;
      arg5 : int;
      arg6 : Interfaces.C.Strings.chars_ptr;
      arg7 : int) return int  -- /usr/include/X11/Xlib.h:2332
   with Import => True, 
        Convention => C, 
        External_Name => "XDrawImageString";

  -- display  
  -- d  
  -- gc  
  -- x  
  -- y  
  -- string  
  -- length  
   function XDrawImageString16
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : GC;
      arg4 : int;
      arg5 : int;
      arg6 : access constant XChar2b;
      arg7 : int) return int  -- /usr/include/X11/Xlib.h:2342
   with Import => True, 
        Convention => C, 
        External_Name => "XDrawImageString16";

  -- display  
  -- d  
  -- gc  
  -- x  
  -- y  
  -- string  
  -- length  
   function XDrawLine
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : GC;
      arg4 : int;
      arg5 : int;
      arg6 : int;
      arg7 : int) return int  -- /usr/include/X11/Xlib.h:2352
   with Import => True, 
        Convention => C, 
        External_Name => "XDrawLine";

  -- display  
  -- d  
  -- gc  
  -- x1  
  -- y1  
  -- x2  
  -- y2  
   function XDrawLines
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : GC;
      arg4 : access XPoint;
      arg5 : int;
      arg6 : int) return int  -- /usr/include/X11/Xlib.h:2362
   with Import => True, 
        Convention => C, 
        External_Name => "XDrawLines";

  -- display  
  -- d  
  -- gc  
  -- points  
  -- npoints  
  -- mode  
   function XDrawPoint
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : GC;
      arg4 : int;
      arg5 : int) return int  -- /usr/include/X11/Xlib.h:2371
   with Import => True, 
        Convention => C, 
        External_Name => "XDrawPoint";

  -- display  
  -- d  
  -- gc  
  -- x  
  -- y  
   function XDrawPoints
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : GC;
      arg4 : access XPoint;
      arg5 : int;
      arg6 : int) return int  -- /usr/include/X11/Xlib.h:2379
   with Import => True, 
        Convention => C, 
        External_Name => "XDrawPoints";

  -- display  
  -- d  
  -- gc  
  -- points  
  -- npoints  
  -- mode  
   function XDrawRectangle
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : GC;
      arg4 : int;
      arg5 : int;
      arg6 : unsigned;
      arg7 : unsigned) return int  -- /usr/include/X11/Xlib.h:2388
   with Import => True, 
        Convention => C, 
        External_Name => "XDrawRectangle";

  -- display  
  -- d  
  -- gc  
  -- x  
  -- y  
  -- width  
  -- height  
   function XDrawRectangles
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : GC;
      arg4 : access XRectangle;
      arg5 : int) return int  -- /usr/include/X11/Xlib.h:2398
   with Import => True, 
        Convention => C, 
        External_Name => "XDrawRectangles";

  -- display  
  -- d  
  -- gc  
  -- rectangles  
  -- nrectangles  
   function XDrawSegments
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : GC;
      arg4 : access XSegment;
      arg5 : int) return int  -- /usr/include/X11/Xlib.h:2406
   with Import => True, 
        Convention => C, 
        External_Name => "XDrawSegments";

  -- display  
  -- d  
  -- gc  
  -- segments  
  -- nsegments  
   function XDrawString
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : GC;
      arg4 : int;
      arg5 : int;
      arg6 : Interfaces.C.Strings.chars_ptr;
      arg7 : int) return int  -- /usr/include/X11/Xlib.h:2414
   with Import => True, 
        Convention => C, 
        External_Name => "XDrawString";

  -- display  
  -- d  
  -- gc  
  -- x  
  -- y  
  -- string  
  -- length  
   function XDrawString16
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : GC;
      arg4 : int;
      arg5 : int;
      arg6 : access constant XChar2b;
      arg7 : int) return int  -- /usr/include/X11/Xlib.h:2424
   with Import => True, 
        Convention => C, 
        External_Name => "XDrawString16";

  -- display  
  -- d  
  -- gc  
  -- x  
  -- y  
  -- string  
  -- length  
   function XDrawText
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : GC;
      arg4 : int;
      arg5 : int;
      arg6 : access XTextItem;
      arg7 : int) return int  -- /usr/include/X11/Xlib.h:2434
   with Import => True, 
        Convention => C, 
        External_Name => "XDrawText";

  -- display  
  -- d  
  -- gc  
  -- x  
  -- y  
  -- items  
  -- nitems  
   function XDrawText16
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : GC;
      arg4 : int;
      arg5 : int;
      arg6 : access XTextItem16;
      arg7 : int) return int  -- /usr/include/X11/Xlib.h:2444
   with Import => True, 
        Convention => C, 
        External_Name => "XDrawText16";

  -- display  
  -- d  
  -- gc  
  -- x  
  -- y  
  -- items  
  -- nitems  
   function XEnableAccessControl (arg1 : access Display) return int  -- /usr/include/X11/Xlib.h:2454
   with Import => True, 
        Convention => C, 
        External_Name => "XEnableAccessControl";

  -- display  
   function XEventsQueued (arg1 : access Display; arg2 : int) return int  -- /usr/include/X11/Xlib.h:2458
   with Import => True, 
        Convention => C, 
        External_Name => "XEventsQueued";

  -- display  
  -- mode  
   function XFetchName
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : System.Address) return int  -- /usr/include/X11/Xlib.h:2463
   with Import => True, 
        Convention => C, 
        External_Name => "XFetchName";

  -- display  
  -- w  
  -- window_name_return  
   function XFillArc
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : GC;
      arg4 : int;
      arg5 : int;
      arg6 : unsigned;
      arg7 : unsigned;
      arg8 : int;
      arg9 : int) return int  -- /usr/include/X11/Xlib.h:2469
   with Import => True, 
        Convention => C, 
        External_Name => "XFillArc";

  -- display  
  -- d  
  -- gc  
  -- x  
  -- y  
  -- width  
  -- height  
  -- angle1  
  -- angle2  
   function XFillArcs
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : GC;
      arg4 : access XArc;
      arg5 : int) return int  -- /usr/include/X11/Xlib.h:2481
   with Import => True, 
        Convention => C, 
        External_Name => "XFillArcs";

  -- display  
  -- d  
  -- gc  
  -- arcs  
  -- narcs  
   function XFillPolygon
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : GC;
      arg4 : access XPoint;
      arg5 : int;
      arg6 : int;
      arg7 : int) return int  -- /usr/include/X11/Xlib.h:2489
   with Import => True, 
        Convention => C, 
        External_Name => "XFillPolygon";

  -- display  
  -- d  
  -- gc  
  -- points  
  -- npoints  
  -- shape  
  -- mode  
   function XFillRectangle
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : GC;
      arg4 : int;
      arg5 : int;
      arg6 : unsigned;
      arg7 : unsigned) return int  -- /usr/include/X11/Xlib.h:2499
   with Import => True, 
        Convention => C, 
        External_Name => "XFillRectangle";

  -- display  
  -- d  
  -- gc  
  -- x  
  -- y  
  -- width  
  -- height  
   function XFillRectangles
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : GC;
      arg4 : access XRectangle;
      arg5 : int) return int  -- /usr/include/X11/Xlib.h:2509
   with Import => True, 
        Convention => C, 
        External_Name => "XFillRectangles";

  -- display  
  -- d  
  -- gc  
  -- rectangles  
  -- nrectangles  
   function XFlush (arg1 : access Display) return int  -- /usr/include/X11/Xlib.h:2517
   with Import => True, 
        Convention => C, 
        External_Name => "XFlush";

  -- display  
   function XForceScreenSaver (arg1 : access Display; arg2 : int) return int  -- /usr/include/X11/Xlib.h:2521
   with Import => True, 
        Convention => C, 
        External_Name => "XForceScreenSaver";

  -- display  
  -- mode  
   function XFree (arg1 : System.Address) return int  -- /usr/include/X11/Xlib.h:2526
   with Import => True, 
        Convention => C, 
        External_Name => "XFree";

  -- data  
   function XFreeColormap (arg1 : access Display; arg2 : X11.Colormap) return int  -- /usr/include/X11/Xlib.h:2530
   with Import => True, 
        Convention => C, 
        External_Name => "XFreeColormap";

  -- display  
  -- colormap  
   function XFreeColors
     (arg1 : access Display;
      arg2 : X11.Colormap;
      arg3 : access unsigned_long;
      arg4 : int;
      arg5 : unsigned_long) return int  -- /usr/include/X11/Xlib.h:2535
   with Import => True, 
        Convention => C, 
        External_Name => "XFreeColors";

  -- display  
  -- colormap  
  -- pixels  
  -- npixels  
  -- planes  
   function XFreeCursor (arg1 : access Display; arg2 : X11.Cursor) return int  -- /usr/include/X11/Xlib.h:2543
   with Import => True, 
        Convention => C, 
        External_Name => "XFreeCursor";

  -- display  
  -- cursor  
   function XFreeExtensionList (arg1 : System.Address) return int  -- /usr/include/X11/Xlib.h:2548
   with Import => True, 
        Convention => C, 
        External_Name => "XFreeExtensionList";

  -- list  
   function XFreeFont (arg1 : access Display; arg2 : access XFontStruct) return int  -- /usr/include/X11/Xlib.h:2552
   with Import => True, 
        Convention => C, 
        External_Name => "XFreeFont";

  -- display  
  -- font_struct  
   function XFreeFontInfo
     (arg1 : System.Address;
      arg2 : access XFontStruct;
      arg3 : int) return int  -- /usr/include/X11/Xlib.h:2557
   with Import => True, 
        Convention => C, 
        External_Name => "XFreeFontInfo";

  -- names  
  -- free_info  
  -- actual_count  
   function XFreeFontNames (arg1 : System.Address) return int  -- /usr/include/X11/Xlib.h:2563
   with Import => True, 
        Convention => C, 
        External_Name => "XFreeFontNames";

  -- list  
   function XFreeFontPath (arg1 : System.Address) return int  -- /usr/include/X11/Xlib.h:2567
   with Import => True, 
        Convention => C, 
        External_Name => "XFreeFontPath";

  -- list  
   function XFreeGC (arg1 : access Display; arg2 : GC) return int  -- /usr/include/X11/Xlib.h:2571
   with Import => True, 
        Convention => C, 
        External_Name => "XFreeGC";

  -- display  
  -- gc  
   function XFreeModifiermap (arg1 : access XModifierKeymap) return int  -- /usr/include/X11/Xlib.h:2576
   with Import => True, 
        Convention => C, 
        External_Name => "XFreeModifiermap";

  -- modmap  
   function XFreePixmap (arg1 : access Display; arg2 : X11.Pixmap) return int  -- /usr/include/X11/Xlib.h:2580
   with Import => True, 
        Convention => C, 
        External_Name => "XFreePixmap";

  -- display  
  -- pixmap  
   function XGeometry
     (arg1 : access Display;
      arg2 : int;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : unsigned;
      arg6 : unsigned;
      arg7 : unsigned;
      arg8 : int;
      arg9 : int;
      arg10 : access int;
      arg11 : access int;
      arg12 : access int;
      arg13 : access int) return int  -- /usr/include/X11/Xlib.h:2585
   with Import => True, 
        Convention => C, 
        External_Name => "XGeometry";

  -- display  
  -- screen  
  -- position  
  -- default_position  
  -- bwidth  
  -- fwidth  
  -- fheight  
  -- xadder  
  -- yadder  
  -- x_return  
  -- y_return  
  -- width_return  
  -- height_return  
   function XGetErrorDatabaseText
     (arg1 : access Display;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : Interfaces.C.Strings.chars_ptr;
      arg6 : int) return int  -- /usr/include/X11/Xlib.h:2601
   with Import => True, 
        Convention => C, 
        External_Name => "XGetErrorDatabaseText";

  -- display  
  -- name  
  -- message  
  -- default_string  
  -- buffer_return  
  -- length  
   function XGetErrorText
     (arg1 : access Display;
      arg2 : int;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : int) return int  -- /usr/include/X11/Xlib.h:2610
   with Import => True, 
        Convention => C, 
        External_Name => "XGetErrorText";

  -- display  
  -- code  
  -- buffer_return  
  -- length  
   function XGetFontProperty
     (arg1 : access XFontStruct;
      arg2 : X11.Atom;
      arg3 : access unsigned_long) return int  -- /usr/include/X11/Xlib.h:2617
   with Import => True, 
        Convention => C, 
        External_Name => "XGetFontProperty";

  -- font_struct  
  -- atom  
  -- value_return  
   function XGetGCValues
     (arg1 : access Display;
      arg2 : GC;
      arg3 : unsigned_long;
      arg4 : access XGCValues) return int  -- /usr/include/X11/Xlib.h:2623
   with Import => True, 
        Convention => C, 
        External_Name => "XGetGCValues";

  -- display  
  -- gc  
  -- valuemask  
  -- values_return  
   function XGetGeometry
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : access X11.Window;
      arg4 : access int;
      arg5 : access int;
      arg6 : access unsigned;
      arg7 : access unsigned;
      arg8 : access unsigned;
      arg9 : access unsigned) return int  -- /usr/include/X11/Xlib.h:2630
   with Import => True, 
        Convention => C, 
        External_Name => "XGetGeometry";

  -- display  
  -- d  
  -- root_return  
  -- x_return  
  -- y_return  
  -- width_return  
  -- height_return  
  -- border_width_return  
  -- depth_return  
   function XGetIconName
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : System.Address) return int  -- /usr/include/X11/Xlib.h:2642
   with Import => True, 
        Convention => C, 
        External_Name => "XGetIconName";

  -- display  
  -- w  
  -- icon_name_return  
   function XGetInputFocus
     (arg1 : access Display;
      arg2 : access X11.Window;
      arg3 : access int) return int  -- /usr/include/X11/Xlib.h:2648
   with Import => True, 
        Convention => C, 
        External_Name => "XGetInputFocus";

  -- display  
  -- focus_return  
  -- revert_to_return  
   function XGetKeyboardControl (arg1 : access Display; arg2 : access XKeyboardState) return int  -- /usr/include/X11/Xlib.h:2654
   with Import => True, 
        Convention => C, 
        External_Name => "XGetKeyboardControl";

  -- display  
  -- values_return  
   function XGetPointerControl
     (arg1 : access Display;
      arg2 : access int;
      arg3 : access int;
      arg4 : access int) return int  -- /usr/include/X11/Xlib.h:2659
   with Import => True, 
        Convention => C, 
        External_Name => "XGetPointerControl";

  -- display  
  -- accel_numerator_return  
  -- accel_denominator_return  
  -- threshold_return  
   function XGetPointerMapping
     (arg1 : access Display;
      arg2 : access unsigned_char;
      arg3 : int) return int  -- /usr/include/X11/Xlib.h:2666
   with Import => True, 
        Convention => C, 
        External_Name => "XGetPointerMapping";

  -- display  
  -- map_return  
  -- nmap  
   function XGetScreenSaver
     (arg1 : access Display;
      arg2 : access int;
      arg3 : access int;
      arg4 : access int;
      arg5 : access int) return int  -- /usr/include/X11/Xlib.h:2672
   with Import => True, 
        Convention => C, 
        External_Name => "XGetScreenSaver";

  -- display  
  -- timeout_return  
  -- interval_return  
  -- prefer_blanking_return  
  -- allow_exposures_return  
   function XGetTransientForHint
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : access X11.Window) return int  -- /usr/include/X11/Xlib.h:2680
   with Import => True, 
        Convention => C, 
        External_Name => "XGetTransientForHint";

  -- display  
  -- w  
  -- prop_window_return  
   function XGetWindowProperty
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : X11.Atom;
      arg4 : long;
      arg5 : long;
      arg6 : int;
      arg7 : X11.Atom;
      arg8 : access X11.Atom;
      arg9 : access int;
      arg10 : access unsigned_long;
      arg11 : access unsigned_long;
      arg12 : System.Address) return int  -- /usr/include/X11/Xlib.h:2686
   with Import => True, 
        Convention => C, 
        External_Name => "XGetWindowProperty";

  -- display  
  -- w  
  -- property  
  -- long_offset  
  -- long_length  
  -- delete  
  -- req_type  
  -- actual_type_return  
  -- actual_format_return  
  -- nitems_return  
  -- bytes_after_return  
  -- prop_return  
   function XGetWindowAttributes
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : access XWindowAttributes) return int  -- /usr/include/X11/Xlib.h:2701
   with Import => True, 
        Convention => C, 
        External_Name => "XGetWindowAttributes";

  -- display  
  -- w  
  -- window_attributes_return  
   function XGrabButton
     (arg1 : access Display;
      arg2 : unsigned;
      arg3 : unsigned;
      arg4 : X11.Window;
      arg5 : int;
      arg6 : unsigned;
      arg7 : int;
      arg8 : int;
      arg9 : X11.Window;
      arg10 : X11.Cursor) return int  -- /usr/include/X11/Xlib.h:2707
   with Import => True, 
        Convention => C, 
        External_Name => "XGrabButton";

  -- display  
  -- button  
  -- modifiers  
  -- grab_window  
  -- owner_events  
  -- event_mask  
  -- pointer_mode  
  -- keyboard_mode  
  -- confine_to  
  -- cursor  
   function XGrabKey
     (arg1 : access Display;
      arg2 : int;
      arg3 : unsigned;
      arg4 : X11.Window;
      arg5 : int;
      arg6 : int;
      arg7 : int) return int  -- /usr/include/X11/Xlib.h:2720
   with Import => True, 
        Convention => C, 
        External_Name => "XGrabKey";

  -- display  
  -- keycode  
  -- modifiers  
  -- grab_window  
  -- owner_events  
  -- pointer_mode  
  -- keyboard_mode  
   function XGrabKeyboard
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : int;
      arg4 : int;
      arg5 : int;
      arg6 : X11.Time) return int  -- /usr/include/X11/Xlib.h:2730
   with Import => True, 
        Convention => C, 
        External_Name => "XGrabKeyboard";

  -- display  
  -- grab_window  
  -- owner_events  
  -- pointer_mode  
  -- keyboard_mode  
  -- time  
   function XGrabPointer
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : int;
      arg4 : unsigned;
      arg5 : int;
      arg6 : int;
      arg7 : X11.Window;
      arg8 : X11.Cursor;
      arg9 : X11.Time) return int  -- /usr/include/X11/Xlib.h:2739
   with Import => True, 
        Convention => C, 
        External_Name => "XGrabPointer";

  -- display  
  -- grab_window  
  -- owner_events  
  -- event_mask  
  -- pointer_mode  
  -- keyboard_mode  
  -- confine_to  
  -- cursor  
  -- time  
   function XGrabServer (arg1 : access Display) return int  -- /usr/include/X11/Xlib.h:2751
   with Import => True, 
        Convention => C, 
        External_Name => "XGrabServer";

  -- display  
   function XHeightMMOfScreen (arg1 : access Screen) return int  -- /usr/include/X11/Xlib.h:2755
   with Import => True, 
        Convention => C, 
        External_Name => "XHeightMMOfScreen";

  -- screen  
   function XHeightOfScreen (arg1 : access Screen) return int  -- /usr/include/X11/Xlib.h:2759
   with Import => True, 
        Convention => C, 
        External_Name => "XHeightOfScreen";

  -- screen  
   function XIfEvent
     (arg1 : access Display;
      arg2 : access XEvent;
      arg3 : access function
        (arg1 : access Display;
         arg2 : access XEvent;
         arg3 : XPointer) return int;
      arg4 : XPointer) return int  -- /usr/include/X11/Xlib.h:2763
   with Import => True, 
        Convention => C, 
        External_Name => "XIfEvent";

  -- display  
  -- event_return  
  -- display  
  -- event  
  -- arg  
  -- predicate  
  -- arg  
   function XImageByteOrder (arg1 : access Display) return int  -- /usr/include/X11/Xlib.h:2774
   with Import => True, 
        Convention => C, 
        External_Name => "XImageByteOrder";

  -- display  
   function XInstallColormap (arg1 : access Display; arg2 : X11.Colormap) return int  -- /usr/include/X11/Xlib.h:2778
   with Import => True, 
        Convention => C, 
        External_Name => "XInstallColormap";

  -- display  
  -- colormap  
   function XKeysymToKeycode (arg1 : access Display; arg2 : X11.KeySym) return X11.KeyCode  -- /usr/include/X11/Xlib.h:2783
   with Import => True, 
        Convention => C, 
        External_Name => "XKeysymToKeycode";

  -- display  
  -- keysym  
   function XKillClient (arg1 : access Display; arg2 : X11.XID) return int  -- /usr/include/X11/Xlib.h:2788
   with Import => True, 
        Convention => C, 
        External_Name => "XKillClient";

  -- display  
  -- resource  
   function XLookupColor
     (arg1 : access Display;
      arg2 : X11.Colormap;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : access XColor;
      arg5 : access XColor) return int  -- /usr/include/X11/Xlib.h:2793
   with Import => True, 
        Convention => C, 
        External_Name => "XLookupColor";

  -- display  
  -- colormap  
  -- color_name  
  -- exact_def_return  
  -- screen_def_return  
   function XLowerWindow (arg1 : access Display; arg2 : X11.Window) return int  -- /usr/include/X11/Xlib.h:2801
   with Import => True, 
        Convention => C, 
        External_Name => "XLowerWindow";

  -- display  
  -- w  
   function XMapRaised (arg1 : access Display; arg2 : X11.Window) return int  -- /usr/include/X11/Xlib.h:2806
   with Import => True, 
        Convention => C, 
        External_Name => "XMapRaised";

  -- display  
  -- w  
   function XMapSubwindows (arg1 : access Display; arg2 : X11.Window) return int  -- /usr/include/X11/Xlib.h:2811
   with Import => True, 
        Convention => C, 
        External_Name => "XMapSubwindows";

  -- display  
  -- w  
   function XMapWindow (arg1 : access Display; arg2 : X11.Window) return int  -- /usr/include/X11/Xlib.h:2816
   with Import => True, 
        Convention => C, 
        External_Name => "XMapWindow";

  -- display  
  -- w  
   function XMaskEvent
     (arg1 : access Display;
      arg2 : long;
      arg3 : access XEvent) return int  -- /usr/include/X11/Xlib.h:2821
   with Import => True, 
        Convention => C, 
        External_Name => "XMaskEvent";

  -- display  
  -- event_mask  
  -- event_return  
   function XMaxCmapsOfScreen (arg1 : access Screen) return int  -- /usr/include/X11/Xlib.h:2827
   with Import => True, 
        Convention => C, 
        External_Name => "XMaxCmapsOfScreen";

  -- screen  
   function XMinCmapsOfScreen (arg1 : access Screen) return int  -- /usr/include/X11/Xlib.h:2831
   with Import => True, 
        Convention => C, 
        External_Name => "XMinCmapsOfScreen";

  -- screen  
   function XMoveResizeWindow
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : int;
      arg4 : int;
      arg5 : unsigned;
      arg6 : unsigned) return int  -- /usr/include/X11/Xlib.h:2835
   with Import => True, 
        Convention => C, 
        External_Name => "XMoveResizeWindow";

  -- display  
  -- w  
  -- x  
  -- y  
  -- width  
  -- height  
   function XMoveWindow
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : int;
      arg4 : int) return int  -- /usr/include/X11/Xlib.h:2844
   with Import => True, 
        Convention => C, 
        External_Name => "XMoveWindow";

  -- display  
  -- w  
  -- x  
  -- y  
   function XNextEvent (arg1 : access Display; arg2 : access XEvent) return int  -- /usr/include/X11/Xlib.h:2851
   with Import => True, 
        Convention => C, 
        External_Name => "XNextEvent";

  -- display  
  -- event_return  
   function XNoOp (arg1 : access Display) return int  -- /usr/include/X11/Xlib.h:2856
   with Import => True, 
        Convention => C, 
        External_Name => "XNoOp";

  -- display  
   function XParseColor
     (arg1 : access Display;
      arg2 : X11.Colormap;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : access XColor) return int  -- /usr/include/X11/Xlib.h:2860
   with Import => True, 
        Convention => C, 
        External_Name => "XParseColor";

  -- display  
  -- colormap  
  -- spec  
  -- exact_def_return  
   function XParseGeometry
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : access int;
      arg3 : access int;
      arg4 : access unsigned;
      arg5 : access unsigned) return int  -- /usr/include/X11/Xlib.h:2867
   with Import => True, 
        Convention => C, 
        External_Name => "XParseGeometry";

  -- parsestring  
  -- x_return  
  -- y_return  
  -- width_return  
  -- height_return  
   function XPeekEvent (arg1 : access Display; arg2 : access XEvent) return int  -- /usr/include/X11/Xlib.h:2875
   with Import => True, 
        Convention => C, 
        External_Name => "XPeekEvent";

  -- display  
  -- event_return  
   function XPeekIfEvent
     (arg1 : access Display;
      arg2 : access XEvent;
      arg3 : access function
        (arg1 : access Display;
         arg2 : access XEvent;
         arg3 : XPointer) return int;
      arg4 : XPointer) return int  -- /usr/include/X11/Xlib.h:2880
   with Import => True, 
        Convention => C, 
        External_Name => "XPeekIfEvent";

  -- display  
  -- event_return  
  -- display  
  -- event  
  -- arg  
  -- predicate  
  -- arg  
   function XPending (arg1 : access Display) return int  -- /usr/include/X11/Xlib.h:2891
   with Import => True, 
        Convention => C, 
        External_Name => "XPending";

  -- display  
   function XPlanesOfScreen (arg1 : access Screen) return int  -- /usr/include/X11/Xlib.h:2895
   with Import => True, 
        Convention => C, 
        External_Name => "XPlanesOfScreen";

  -- screen  
   function XProtocolRevision (arg1 : access Display) return int  -- /usr/include/X11/Xlib.h:2899
   with Import => True, 
        Convention => C, 
        External_Name => "XProtocolRevision";

  -- display  
   function XProtocolVersion (arg1 : access Display) return int  -- /usr/include/X11/Xlib.h:2903
   with Import => True, 
        Convention => C, 
        External_Name => "XProtocolVersion";

  -- display  
   function XPutBackEvent (arg1 : access Display; arg2 : access XEvent) return int  -- /usr/include/X11/Xlib.h:2908
   with Import => True, 
        Convention => C, 
        External_Name => "XPutBackEvent";

  -- display  
  -- event  
   function XPutImage
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : GC;
      arg4 : access XImage;
      arg5 : int;
      arg6 : int;
      arg7 : int;
      arg8 : int;
      arg9 : unsigned;
      arg10 : unsigned) return int  -- /usr/include/X11/Xlib.h:2913
   with Import => True, 
        Convention => C, 
        External_Name => "XPutImage";

  -- display  
  -- d  
  -- gc  
  -- image  
  -- src_x  
  -- src_y  
  -- dest_x  
  -- dest_y  
  -- width  
  -- height  
   function XQLength (arg1 : access Display) return int  -- /usr/include/X11/Xlib.h:2926
   with Import => True, 
        Convention => C, 
        External_Name => "XQLength";

  -- display  
   function XQueryBestCursor
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : unsigned;
      arg4 : unsigned;
      arg5 : access unsigned;
      arg6 : access unsigned) return int  -- /usr/include/X11/Xlib.h:2930
   with Import => True, 
        Convention => C, 
        External_Name => "XQueryBestCursor";

  -- display  
  -- d  
  -- width  
  -- height  
  -- width_return  
  -- height_return  
   function XQueryBestSize
     (arg1 : access Display;
      arg2 : int;
      arg3 : X11.Drawable;
      arg4 : unsigned;
      arg5 : unsigned;
      arg6 : access unsigned;
      arg7 : access unsigned) return int  -- /usr/include/X11/Xlib.h:2939
   with Import => True, 
        Convention => C, 
        External_Name => "XQueryBestSize";

  -- display  
  -- class  
  -- which_screen  
  -- width  
  -- height  
  -- width_return  
  -- height_return  
   function XQueryBestStipple
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : unsigned;
      arg4 : unsigned;
      arg5 : access unsigned;
      arg6 : access unsigned) return int  -- /usr/include/X11/Xlib.h:2949
   with Import => True, 
        Convention => C, 
        External_Name => "XQueryBestStipple";

  -- display  
  -- which_screen  
  -- width  
  -- height  
  -- width_return  
  -- height_return  
   function XQueryBestTile
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : unsigned;
      arg4 : unsigned;
      arg5 : access unsigned;
      arg6 : access unsigned) return int  -- /usr/include/X11/Xlib.h:2958
   with Import => True, 
        Convention => C, 
        External_Name => "XQueryBestTile";

  -- display  
  -- which_screen  
  -- width  
  -- height  
  -- width_return  
  -- height_return  
   function XQueryColor
     (arg1 : access Display;
      arg2 : X11.Colormap;
      arg3 : access XColor) return int  -- /usr/include/X11/Xlib.h:2967
   with Import => True, 
        Convention => C, 
        External_Name => "XQueryColor";

  -- display  
  -- colormap  
  -- def_in_out  
   function XQueryColors
     (arg1 : access Display;
      arg2 : X11.Colormap;
      arg3 : access XColor;
      arg4 : int) return int  -- /usr/include/X11/Xlib.h:2973
   with Import => True, 
        Convention => C, 
        External_Name => "XQueryColors";

  -- display  
  -- colormap  
  -- defs_in_out  
  -- ncolors  
   function XQueryExtension
     (arg1 : access Display;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : access int;
      arg4 : access int;
      arg5 : access int) return int  -- /usr/include/X11/Xlib.h:2980
   with Import => True, 
        Convention => C, 
        External_Name => "XQueryExtension";

  -- display  
  -- name  
  -- major_opcode_return  
  -- first_event_return  
  -- first_error_return  
   function XQueryKeymap (arg1 : access Display; arg2 : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/X11/Xlib.h:2988
   with Import => True, 
        Convention => C, 
        External_Name => "XQueryKeymap";

  -- display  
  -- keys_return  
   function XQueryPointer
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : access X11.Window;
      arg4 : access X11.Window;
      arg5 : access int;
      arg6 : access int;
      arg7 : access int;
      arg8 : access int;
      arg9 : access unsigned) return int  -- /usr/include/X11/Xlib.h:2993
   with Import => True, 
        Convention => C, 
        External_Name => "XQueryPointer";

  -- display  
  -- w  
  -- root_return  
  -- child_return  
  -- root_x_return  
  -- root_y_return  
  -- win_x_return  
  -- win_y_return  
  -- mask_return  
   function XQueryTextExtents
     (arg1 : access Display;
      arg2 : X11.XID;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : int;
      arg5 : access int;
      arg6 : access int;
      arg7 : access int;
      arg8 : access XCharStruct) return int  -- /usr/include/X11/Xlib.h:3005
   with Import => True, 
        Convention => C, 
        External_Name => "XQueryTextExtents";

  -- display  
  -- font_ID  
  -- string  
  -- nchars  
  -- direction_return  
  -- font_ascent_return  
  -- font_descent_return  
  -- overall_return  
   function XQueryTextExtents16
     (arg1 : access Display;
      arg2 : X11.XID;
      arg3 : access constant XChar2b;
      arg4 : int;
      arg5 : access int;
      arg6 : access int;
      arg7 : access int;
      arg8 : access XCharStruct) return int  -- /usr/include/X11/Xlib.h:3016
   with Import => True, 
        Convention => C, 
        External_Name => "XQueryTextExtents16";

  -- display  
  -- font_ID  
  -- string  
  -- nchars  
  -- direction_return  
  -- font_ascent_return  
  -- font_descent_return  
  -- overall_return  
   function XQueryTree
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : access X11.Window;
      arg4 : access X11.Window;
      arg5 : System.Address;
      arg6 : access unsigned) return int  -- /usr/include/X11/Xlib.h:3027
   with Import => True, 
        Convention => C, 
        External_Name => "XQueryTree";

  -- display  
  -- w  
  -- root_return  
  -- parent_return  
  -- children_return  
  -- nchildren_return  
   function XRaiseWindow (arg1 : access Display; arg2 : X11.Window) return int  -- /usr/include/X11/Xlib.h:3036
   with Import => True, 
        Convention => C, 
        External_Name => "XRaiseWindow";

  -- display  
  -- w  
   function XReadBitmapFile
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : access unsigned;
      arg5 : access unsigned;
      arg6 : access X11.Pixmap;
      arg7 : access int;
      arg8 : access int) return int  -- /usr/include/X11/Xlib.h:3041
   with Import => True, 
        Convention => C, 
        External_Name => "XReadBitmapFile";

  -- display  
  -- d  
  -- filename  
  -- width_return  
  -- height_return  
  -- bitmap_return  
  -- x_hot_return  
  -- y_hot_return  
   function XReadBitmapFileData
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : access unsigned;
      arg3 : access unsigned;
      arg4 : System.Address;
      arg5 : access int;
      arg6 : access int) return int  -- /usr/include/X11/Xlib.h:3052
   with Import => True, 
        Convention => C, 
        External_Name => "XReadBitmapFileData";

  -- filename  
  -- width_return  
  -- height_return  
  -- data_return  
  -- x_hot_return  
  -- y_hot_return  
   function XRebindKeysym
     (arg1 : access Display;
      arg2 : X11.KeySym;
      arg3 : access X11.KeySym;
      arg4 : int;
      arg5 : access unsigned_char;
      arg6 : int) return int  -- /usr/include/X11/Xlib.h:3061
   with Import => True, 
        Convention => C, 
        External_Name => "XRebindKeysym";

  -- display  
  -- keysym  
  -- list  
  -- mod_count  
  -- string  
  -- bytes_string  
   function XRecolorCursor
     (arg1 : access Display;
      arg2 : X11.Cursor;
      arg3 : access XColor;
      arg4 : access XColor) return int  -- /usr/include/X11/Xlib.h:3070
   with Import => True, 
        Convention => C, 
        External_Name => "XRecolorCursor";

  -- display  
  -- cursor  
  -- foreground_color  
  -- background_color  
   function XRefreshKeyboardMapping (arg1 : access XMappingEvent) return int  -- /usr/include/X11/Xlib.h:3077
   with Import => True, 
        Convention => C, 
        External_Name => "XRefreshKeyboardMapping";

  -- event_map  
   function XRemoveFromSaveSet (arg1 : access Display; arg2 : X11.Window) return int  -- /usr/include/X11/Xlib.h:3081
   with Import => True, 
        Convention => C, 
        External_Name => "XRemoveFromSaveSet";

  -- display  
  -- w  
   function XRemoveHost (arg1 : access Display; arg2 : access XHostAddress) return int  -- /usr/include/X11/Xlib.h:3086
   with Import => True, 
        Convention => C, 
        External_Name => "XRemoveHost";

  -- display  
  -- host  
   function XRemoveHosts
     (arg1 : access Display;
      arg2 : access XHostAddress;
      arg3 : int) return int  -- /usr/include/X11/Xlib.h:3091
   with Import => True, 
        Convention => C, 
        External_Name => "XRemoveHosts";

  -- display  
  -- hosts  
  -- num_hosts  
   function XReparentWindow
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : X11.Window;
      arg4 : int;
      arg5 : int) return int  -- /usr/include/X11/Xlib.h:3097
   with Import => True, 
        Convention => C, 
        External_Name => "XReparentWindow";

  -- display  
  -- w  
  -- parent  
  -- x  
  -- y  
   function XResetScreenSaver (arg1 : access Display) return int  -- /usr/include/X11/Xlib.h:3105
   with Import => True, 
        Convention => C, 
        External_Name => "XResetScreenSaver";

  -- display  
   function XResizeWindow
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : unsigned;
      arg4 : unsigned) return int  -- /usr/include/X11/Xlib.h:3109
   with Import => True, 
        Convention => C, 
        External_Name => "XResizeWindow";

  -- display  
  -- w  
  -- width  
  -- height  
   function XRestackWindows
     (arg1 : access Display;
      arg2 : access X11.Window;
      arg3 : int) return int  -- /usr/include/X11/Xlib.h:3116
   with Import => True, 
        Convention => C, 
        External_Name => "XRestackWindows";

  -- display  
  -- windows  
  -- nwindows  
   function XRotateBuffers (arg1 : access Display; arg2 : int) return int  -- /usr/include/X11/Xlib.h:3122
   with Import => True, 
        Convention => C, 
        External_Name => "XRotateBuffers";

  -- display  
  -- rotate  
   function XRotateWindowProperties
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : access X11.Atom;
      arg4 : int;
      arg5 : int) return int  -- /usr/include/X11/Xlib.h:3127
   with Import => True, 
        Convention => C, 
        External_Name => "XRotateWindowProperties";

  -- display  
  -- w  
  -- properties  
  -- num_prop  
  -- npositions  
   function XScreenCount (arg1 : access Display) return int  -- /usr/include/X11/Xlib.h:3135
   with Import => True, 
        Convention => C, 
        External_Name => "XScreenCount";

  -- display  
   function XSelectInput
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : long) return int  -- /usr/include/X11/Xlib.h:3139
   with Import => True, 
        Convention => C, 
        External_Name => "XSelectInput";

  -- display  
  -- w  
  -- event_mask  
   function XSendEvent
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : int;
      arg4 : long;
      arg5 : access XEvent) return int  -- /usr/include/X11/Xlib.h:3145
   with Import => True, 
        Convention => C, 
        External_Name => "XSendEvent";

  -- display  
  -- w  
  -- propagate  
  -- event_mask  
  -- event_send  
   function XSetAccessControl (arg1 : access Display; arg2 : int) return int  -- /usr/include/X11/Xlib.h:3153
   with Import => True, 
        Convention => C, 
        External_Name => "XSetAccessControl";

  -- display  
  -- mode  
   function XSetArcMode
     (arg1 : access Display;
      arg2 : GC;
      arg3 : int) return int  -- /usr/include/X11/Xlib.h:3158
   with Import => True, 
        Convention => C, 
        External_Name => "XSetArcMode";

  -- display  
  -- gc  
  -- arc_mode  
   function XSetBackground
     (arg1 : access Display;
      arg2 : GC;
      arg3 : unsigned_long) return int  -- /usr/include/X11/Xlib.h:3164
   with Import => True, 
        Convention => C, 
        External_Name => "XSetBackground";

  -- display  
  -- gc  
  -- background  
   function XSetClipMask
     (arg1 : access Display;
      arg2 : GC;
      arg3 : X11.Pixmap) return int  -- /usr/include/X11/Xlib.h:3170
   with Import => True, 
        Convention => C, 
        External_Name => "XSetClipMask";

  -- display  
  -- gc  
  -- pixmap  
   function XSetClipOrigin
     (arg1 : access Display;
      arg2 : GC;
      arg3 : int;
      arg4 : int) return int  -- /usr/include/X11/Xlib.h:3176
   with Import => True, 
        Convention => C, 
        External_Name => "XSetClipOrigin";

  -- display  
  -- gc  
  -- clip_x_origin  
  -- clip_y_origin  
   function XSetClipRectangles
     (arg1 : access Display;
      arg2 : GC;
      arg3 : int;
      arg4 : int;
      arg5 : access XRectangle;
      arg6 : int;
      arg7 : int) return int  -- /usr/include/X11/Xlib.h:3183
   with Import => True, 
        Convention => C, 
        External_Name => "XSetClipRectangles";

  -- display  
  -- gc  
  -- clip_x_origin  
  -- clip_y_origin  
  -- rectangles  
  -- n  
  -- ordering  
   function XSetCloseDownMode (arg1 : access Display; arg2 : int) return int  -- /usr/include/X11/Xlib.h:3193
   with Import => True, 
        Convention => C, 
        External_Name => "XSetCloseDownMode";

  -- display  
  -- close_mode  
   function XSetCommand
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : System.Address;
      arg4 : int) return int  -- /usr/include/X11/Xlib.h:3198
   with Import => True, 
        Convention => C, 
        External_Name => "XSetCommand";

  -- display  
  -- w  
  -- argv  
  -- argc  
   function XSetDashes
     (arg1 : access Display;
      arg2 : GC;
      arg3 : int;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : int) return int  -- /usr/include/X11/Xlib.h:3205
   with Import => True, 
        Convention => C, 
        External_Name => "XSetDashes";

  -- display  
  -- gc  
  -- dash_offset  
  -- dash_list  
  -- n  
   function XSetFillRule
     (arg1 : access Display;
      arg2 : GC;
      arg3 : int) return int  -- /usr/include/X11/Xlib.h:3213
   with Import => True, 
        Convention => C, 
        External_Name => "XSetFillRule";

  -- display  
  -- gc  
  -- fill_rule  
   function XSetFillStyle
     (arg1 : access Display;
      arg2 : GC;
      arg3 : int) return int  -- /usr/include/X11/Xlib.h:3219
   with Import => True, 
        Convention => C, 
        External_Name => "XSetFillStyle";

  -- display  
  -- gc  
  -- fill_style  
   function XSetFont
     (arg1 : access Display;
      arg2 : GC;
      arg3 : X11.Font) return int  -- /usr/include/X11/Xlib.h:3225
   with Import => True, 
        Convention => C, 
        External_Name => "XSetFont";

  -- display  
  -- gc  
  -- font  
   function XSetFontPath
     (arg1 : access Display;
      arg2 : System.Address;
      arg3 : int) return int  -- /usr/include/X11/Xlib.h:3231
   with Import => True, 
        Convention => C, 
        External_Name => "XSetFontPath";

  -- display  
  -- directories  
  -- ndirs  
   function XSetForeground
     (arg1 : access Display;
      arg2 : GC;
      arg3 : unsigned_long) return int  -- /usr/include/X11/Xlib.h:3237
   with Import => True, 
        Convention => C, 
        External_Name => "XSetForeground";

  -- display  
  -- gc  
  -- foreground  
   function XSetFunction
     (arg1 : access Display;
      arg2 : GC;
      arg3 : int) return int  -- /usr/include/X11/Xlib.h:3243
   with Import => True, 
        Convention => C, 
        External_Name => "XSetFunction";

  -- display  
  -- gc  
  -- function  
   function XSetGraphicsExposures
     (arg1 : access Display;
      arg2 : GC;
      arg3 : int) return int  -- /usr/include/X11/Xlib.h:3249
   with Import => True, 
        Convention => C, 
        External_Name => "XSetGraphicsExposures";

  -- display  
  -- gc  
  -- graphics_exposures  
   function XSetIconName
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/X11/Xlib.h:3255
   with Import => True, 
        Convention => C, 
        External_Name => "XSetIconName";

  -- display  
  -- w  
  -- icon_name  
   function XSetInputFocus
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : int;
      arg4 : X11.Time) return int  -- /usr/include/X11/Xlib.h:3261
   with Import => True, 
        Convention => C, 
        External_Name => "XSetInputFocus";

  -- display  
  -- focus  
  -- revert_to  
  -- time  
   function XSetLineAttributes
     (arg1 : access Display;
      arg2 : GC;
      arg3 : unsigned;
      arg4 : int;
      arg5 : int;
      arg6 : int) return int  -- /usr/include/X11/Xlib.h:3268
   with Import => True, 
        Convention => C, 
        External_Name => "XSetLineAttributes";

  -- display  
  -- gc  
  -- line_width  
  -- line_style  
  -- cap_style  
  -- join_style  
   function XSetModifierMapping (arg1 : access Display; arg2 : access XModifierKeymap) return int  -- /usr/include/X11/Xlib.h:3277
   with Import => True, 
        Convention => C, 
        External_Name => "XSetModifierMapping";

  -- display  
  -- modmap  
   function XSetPlaneMask
     (arg1 : access Display;
      arg2 : GC;
      arg3 : unsigned_long) return int  -- /usr/include/X11/Xlib.h:3282
   with Import => True, 
        Convention => C, 
        External_Name => "XSetPlaneMask";

  -- display  
  -- gc  
  -- plane_mask  
   function XSetPointerMapping
     (arg1 : access Display;
      arg2 : access unsigned_char;
      arg3 : int) return int  -- /usr/include/X11/Xlib.h:3288
   with Import => True, 
        Convention => C, 
        External_Name => "XSetPointerMapping";

  -- display  
  -- map  
  -- nmap  
   function XSetScreenSaver
     (arg1 : access Display;
      arg2 : int;
      arg3 : int;
      arg4 : int;
      arg5 : int) return int  -- /usr/include/X11/Xlib.h:3294
   with Import => True, 
        Convention => C, 
        External_Name => "XSetScreenSaver";

  -- display  
  -- timeout  
  -- interval  
  -- prefer_blanking  
  -- allow_exposures  
   function XSetSelectionOwner
     (arg1 : access Display;
      arg2 : X11.Atom;
      arg3 : X11.Window;
      arg4 : X11.Time) return int  -- /usr/include/X11/Xlib.h:3302
   with Import => True, 
        Convention => C, 
        External_Name => "XSetSelectionOwner";

  -- display  
  -- selection  
  -- owner  
  -- time  
   function XSetState
     (arg1 : access Display;
      arg2 : GC;
      arg3 : unsigned_long;
      arg4 : unsigned_long;
      arg5 : int;
      arg6 : unsigned_long) return int  -- /usr/include/X11/Xlib.h:3309
   with Import => True, 
        Convention => C, 
        External_Name => "XSetState";

  -- display  
  -- gc  
  -- foreground  
  -- background  
  -- function  
  -- plane_mask  
   function XSetStipple
     (arg1 : access Display;
      arg2 : GC;
      arg3 : X11.Pixmap) return int  -- /usr/include/X11/Xlib.h:3318
   with Import => True, 
        Convention => C, 
        External_Name => "XSetStipple";

  -- display  
  -- gc  
  -- stipple  
   function XSetSubwindowMode
     (arg1 : access Display;
      arg2 : GC;
      arg3 : int) return int  -- /usr/include/X11/Xlib.h:3324
   with Import => True, 
        Convention => C, 
        External_Name => "XSetSubwindowMode";

  -- display  
  -- gc  
  -- subwindow_mode  
   function XSetTSOrigin
     (arg1 : access Display;
      arg2 : GC;
      arg3 : int;
      arg4 : int) return int  -- /usr/include/X11/Xlib.h:3330
   with Import => True, 
        Convention => C, 
        External_Name => "XSetTSOrigin";

  -- display  
  -- gc  
  -- ts_x_origin  
  -- ts_y_origin  
   function XSetTile
     (arg1 : access Display;
      arg2 : GC;
      arg3 : X11.Pixmap) return int  -- /usr/include/X11/Xlib.h:3337
   with Import => True, 
        Convention => C, 
        External_Name => "XSetTile";

  -- display  
  -- gc  
  -- tile  
   function XSetWindowBackground
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : unsigned_long) return int  -- /usr/include/X11/Xlib.h:3343
   with Import => True, 
        Convention => C, 
        External_Name => "XSetWindowBackground";

  -- display  
  -- w  
  -- background_pixel  
   function XSetWindowBackgroundPixmap
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : X11.Pixmap) return int  -- /usr/include/X11/Xlib.h:3349
   with Import => True, 
        Convention => C, 
        External_Name => "XSetWindowBackgroundPixmap";

  -- display  
  -- w  
  -- background_pixmap  
   function XSetWindowBorder
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : unsigned_long) return int  -- /usr/include/X11/Xlib.h:3355
   with Import => True, 
        Convention => C, 
        External_Name => "XSetWindowBorder";

  -- display  
  -- w  
  -- border_pixel  
   function XSetWindowBorderPixmap
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : X11.Pixmap) return int  -- /usr/include/X11/Xlib.h:3361
   with Import => True, 
        Convention => C, 
        External_Name => "XSetWindowBorderPixmap";

  -- display  
  -- w  
  -- border_pixmap  
   function XSetWindowBorderWidth
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : unsigned) return int  -- /usr/include/X11/Xlib.h:3367
   with Import => True, 
        Convention => C, 
        External_Name => "XSetWindowBorderWidth";

  -- display  
  -- w  
  -- width  
   function XSetWindowColormap
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : X11.Colormap) return int  -- /usr/include/X11/Xlib.h:3373
   with Import => True, 
        Convention => C, 
        External_Name => "XSetWindowColormap";

  -- display  
  -- w  
  -- colormap  
   function XStoreBuffer
     (arg1 : access Display;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int;
      arg4 : int) return int  -- /usr/include/X11/Xlib.h:3379
   with Import => True, 
        Convention => C, 
        External_Name => "XStoreBuffer";

  -- display  
  -- bytes  
  -- nbytes  
  -- buffer  
   function XStoreBytes
     (arg1 : access Display;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int) return int  -- /usr/include/X11/Xlib.h:3386
   with Import => True, 
        Convention => C, 
        External_Name => "XStoreBytes";

  -- display  
  -- bytes  
  -- nbytes  
   function XStoreColor
     (arg1 : access Display;
      arg2 : X11.Colormap;
      arg3 : access XColor) return int  -- /usr/include/X11/Xlib.h:3392
   with Import => True, 
        Convention => C, 
        External_Name => "XStoreColor";

  -- display  
  -- colormap  
  -- color  
   function XStoreColors
     (arg1 : access Display;
      arg2 : X11.Colormap;
      arg3 : access XColor;
      arg4 : int) return int  -- /usr/include/X11/Xlib.h:3398
   with Import => True, 
        Convention => C, 
        External_Name => "XStoreColors";

  -- display  
  -- colormap  
  -- color  
  -- ncolors  
   function XStoreName
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/X11/Xlib.h:3405
   with Import => True, 
        Convention => C, 
        External_Name => "XStoreName";

  -- display  
  -- w  
  -- window_name  
   function XStoreNamedColor
     (arg1 : access Display;
      arg2 : X11.Colormap;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : unsigned_long;
      arg5 : int) return int  -- /usr/include/X11/Xlib.h:3411
   with Import => True, 
        Convention => C, 
        External_Name => "XStoreNamedColor";

  -- display  
  -- colormap  
  -- color  
  -- pixel  
  -- flags  
   function XSync (arg1 : access Display; arg2 : int) return int  -- /usr/include/X11/Xlib.h:3419
   with Import => True, 
        Convention => C, 
        External_Name => "XSync";

  -- display  
  -- discard  
   function XTextExtents
     (arg1 : access XFontStruct;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int;
      arg4 : access int;
      arg5 : access int;
      arg6 : access int;
      arg7 : access XCharStruct) return int  -- /usr/include/X11/Xlib.h:3424
   with Import => True, 
        Convention => C, 
        External_Name => "XTextExtents";

  -- font_struct  
  -- string  
  -- nchars  
  -- direction_return  
  -- font_ascent_return  
  -- font_descent_return  
  -- overall_return  
   function XTextExtents16
     (arg1 : access XFontStruct;
      arg2 : access constant XChar2b;
      arg3 : int;
      arg4 : access int;
      arg5 : access int;
      arg6 : access int;
      arg7 : access XCharStruct) return int  -- /usr/include/X11/Xlib.h:3434
   with Import => True, 
        Convention => C, 
        External_Name => "XTextExtents16";

  -- font_struct  
  -- string  
  -- nchars  
  -- direction_return  
  -- font_ascent_return  
  -- font_descent_return  
  -- overall_return  
   function XTextWidth
     (arg1 : access XFontStruct;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int) return int  -- /usr/include/X11/Xlib.h:3444
   with Import => True, 
        Convention => C, 
        External_Name => "XTextWidth";

  -- font_struct  
  -- string  
  -- count  
   function XTextWidth16
     (arg1 : access XFontStruct;
      arg2 : access constant XChar2b;
      arg3 : int) return int  -- /usr/include/X11/Xlib.h:3450
   with Import => True, 
        Convention => C, 
        External_Name => "XTextWidth16";

  -- font_struct  
  -- string  
  -- count  
   function XTranslateCoordinates
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : X11.Window;
      arg4 : int;
      arg5 : int;
      arg6 : access int;
      arg7 : access int;
      arg8 : access X11.Window) return int  -- /usr/include/X11/Xlib.h:3456
   with Import => True, 
        Convention => C, 
        External_Name => "XTranslateCoordinates";

  -- display  
  -- src_w  
  -- dest_w  
  -- src_x  
  -- src_y  
  -- dest_x_return  
  -- dest_y_return  
  -- child_return  
   function XUndefineCursor (arg1 : access Display; arg2 : X11.Window) return int  -- /usr/include/X11/Xlib.h:3467
   with Import => True, 
        Convention => C, 
        External_Name => "XUndefineCursor";

  -- display  
  -- w  
   function XUngrabButton
     (arg1 : access Display;
      arg2 : unsigned;
      arg3 : unsigned;
      arg4 : X11.Window) return int  -- /usr/include/X11/Xlib.h:3472
   with Import => True, 
        Convention => C, 
        External_Name => "XUngrabButton";

  -- display  
  -- button  
  -- modifiers  
  -- grab_window  
   function XUngrabKey
     (arg1 : access Display;
      arg2 : int;
      arg3 : unsigned;
      arg4 : X11.Window) return int  -- /usr/include/X11/Xlib.h:3479
   with Import => True, 
        Convention => C, 
        External_Name => "XUngrabKey";

  -- display  
  -- keycode  
  -- modifiers  
  -- grab_window  
   function XUngrabKeyboard (arg1 : access Display; arg2 : X11.Time) return int  -- /usr/include/X11/Xlib.h:3486
   with Import => True, 
        Convention => C, 
        External_Name => "XUngrabKeyboard";

  -- display  
  -- time  
   function XUngrabPointer (arg1 : access Display; arg2 : X11.Time) return int  -- /usr/include/X11/Xlib.h:3491
   with Import => True, 
        Convention => C, 
        External_Name => "XUngrabPointer";

  -- display  
  -- time  
   function XUngrabServer (arg1 : access Display) return int  -- /usr/include/X11/Xlib.h:3496
   with Import => True, 
        Convention => C, 
        External_Name => "XUngrabServer";

  -- display  
   function XUninstallColormap (arg1 : access Display; arg2 : X11.Colormap) return int  -- /usr/include/X11/Xlib.h:3500
   with Import => True, 
        Convention => C, 
        External_Name => "XUninstallColormap";

  -- display  
  -- colormap  
   function XUnloadFont (arg1 : access Display; arg2 : X11.Font) return int  -- /usr/include/X11/Xlib.h:3505
   with Import => True, 
        Convention => C, 
        External_Name => "XUnloadFont";

  -- display  
  -- font  
   function XUnmapSubwindows (arg1 : access Display; arg2 : X11.Window) return int  -- /usr/include/X11/Xlib.h:3510
   with Import => True, 
        Convention => C, 
        External_Name => "XUnmapSubwindows";

  -- display  
  -- w  
   function XUnmapWindow (arg1 : access Display; arg2 : X11.Window) return int  -- /usr/include/X11/Xlib.h:3515
   with Import => True, 
        Convention => C, 
        External_Name => "XUnmapWindow";

  -- display  
  -- w  
   function XVendorRelease (arg1 : access Display) return int  -- /usr/include/X11/Xlib.h:3520
   with Import => True, 
        Convention => C, 
        External_Name => "XVendorRelease";

  -- display  
   function XWarpPointer
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : X11.Window;
      arg4 : int;
      arg5 : int;
      arg6 : unsigned;
      arg7 : unsigned;
      arg8 : int;
      arg9 : int) return int  -- /usr/include/X11/Xlib.h:3524
   with Import => True, 
        Convention => C, 
        External_Name => "XWarpPointer";

  -- display  
  -- src_w  
  -- dest_w  
  -- src_x  
  -- src_y  
  -- src_width  
  -- src_height  
  -- dest_x  
  -- dest_y  
   function XWidthMMOfScreen (arg1 : access Screen) return int  -- /usr/include/X11/Xlib.h:3536
   with Import => True, 
        Convention => C, 
        External_Name => "XWidthMMOfScreen";

  -- screen  
   function XWidthOfScreen (arg1 : access Screen) return int  -- /usr/include/X11/Xlib.h:3540
   with Import => True, 
        Convention => C, 
        External_Name => "XWidthOfScreen";

  -- screen  
   function XWindowEvent
     (arg1 : access Display;
      arg2 : X11.Window;
      arg3 : long;
      arg4 : access XEvent) return int  -- /usr/include/X11/Xlib.h:3544
   with Import => True, 
        Convention => C, 
        External_Name => "XWindowEvent";

  -- display  
  -- w  
  -- event_mask  
  -- event_return  
   function XWriteBitmapFile
     (arg1 : access Display;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : X11.Pixmap;
      arg4 : unsigned;
      arg5 : unsigned;
      arg6 : int;
      arg7 : int) return int  -- /usr/include/X11/Xlib.h:3551
   with Import => True, 
        Convention => C, 
        External_Name => "XWriteBitmapFile";

  -- display  
  -- filename  
  -- bitmap  
  -- width  
  -- height  
  -- x_hot  
  -- y_hot  
   function XSupportsLocale return int  -- /usr/include/X11/Xlib.h:3561
   with Import => True, 
        Convention => C, 
        External_Name => "XSupportsLocale";

   function XSetLocaleModifiers (arg1 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/include/X11/Xlib.h:3563
   with Import => True, 
        Convention => C, 
        External_Name => "XSetLocaleModifiers";

  -- modifier_list  
   function XOpenOM
     (arg1 : access Display;
      arg2 : access u_XrmHashBucketRec;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr) return XOM  -- /usr/include/X11/Xlib.h:3567
   with Import => True, 
        Convention => C, 
        External_Name => "XOpenOM";

  -- display  
  -- rdb  
  -- res_name  
  -- res_class  
   function XCloseOM (arg1 : XOM) return int  -- /usr/include/X11/Xlib.h:3574
   with Import => True, 
        Convention => C, 
        External_Name => "XCloseOM";

  -- om  
   function XSetOMValues (arg1 : XOM  -- , ...
      ) return Interfaces.C.Strings.chars_ptr  -- /usr/include/X11/Xlib.h:3578
   with Import => True, 
        Convention => C, 
        External_Name => "XSetOMValues";

  -- om  
   function XGetOMValues (arg1 : XOM  -- , ...
      ) return Interfaces.C.Strings.chars_ptr  -- /usr/include/X11/Xlib.h:3583
   with Import => True, 
        Convention => C, 
        External_Name => "XGetOMValues";

  -- om  
   function XDisplayOfOM (arg1 : XOM) return access Display  -- /usr/include/X11/Xlib.h:3588
   with Import => True, 
        Convention => C, 
        External_Name => "XDisplayOfOM";

  -- om  
   function XLocaleOfOM (arg1 : XOM) return Interfaces.C.Strings.chars_ptr  -- /usr/include/X11/Xlib.h:3592
   with Import => True, 
        Convention => C, 
        External_Name => "XLocaleOfOM";

  -- om  
   function XCreateOC (arg1 : XOM  -- , ...
      ) return XOC  -- /usr/include/X11/Xlib.h:3596
   with Import => True, 
        Convention => C, 
        External_Name => "XCreateOC";

  -- om  
   procedure XDestroyOC (arg1 : XOC)  -- /usr/include/X11/Xlib.h:3601
   with Import => True, 
        Convention => C, 
        External_Name => "XDestroyOC";

  -- oc  
   function XOMOfOC (arg1 : XOC) return XOM  -- /usr/include/X11/Xlib.h:3605
   with Import => True, 
        Convention => C, 
        External_Name => "XOMOfOC";

  -- oc  
   function XSetOCValues (arg1 : XOC  -- , ...
      ) return Interfaces.C.Strings.chars_ptr  -- /usr/include/X11/Xlib.h:3609
   with Import => True, 
        Convention => C, 
        External_Name => "XSetOCValues";

  -- oc  
   function XGetOCValues (arg1 : XOC  -- , ...
      ) return Interfaces.C.Strings.chars_ptr  -- /usr/include/X11/Xlib.h:3614
   with Import => True, 
        Convention => C, 
        External_Name => "XGetOCValues";

  -- oc  
   function XCreateFontSet
     (arg1 : access Display;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : System.Address;
      arg4 : access int;
      arg5 : System.Address) return XFontSet  -- /usr/include/X11/Xlib.h:3619
   with Import => True, 
        Convention => C, 
        External_Name => "XCreateFontSet";

  -- display  
  -- base_font_name_list  
  -- missing_charset_list  
  -- missing_charset_count  
  -- def_string  
   procedure XFreeFontSet (arg1 : access Display; arg2 : XFontSet)  -- /usr/include/X11/Xlib.h:3627
   with Import => True, 
        Convention => C, 
        External_Name => "XFreeFontSet";

  -- display  
  -- font_set  
   function XFontsOfFontSet
     (arg1 : XFontSet;
      arg2 : System.Address;
      arg3 : System.Address) return int  -- /usr/include/X11/Xlib.h:3632
   with Import => True, 
        Convention => C, 
        External_Name => "XFontsOfFontSet";

  -- font_set  
  -- font_struct_list  
  -- font_name_list  
   function XBaseFontNameListOfFontSet (arg1 : XFontSet) return Interfaces.C.Strings.chars_ptr  -- /usr/include/X11/Xlib.h:3638
   with Import => True, 
        Convention => C, 
        External_Name => "XBaseFontNameListOfFontSet";

  -- font_set  
   function XLocaleOfFontSet (arg1 : XFontSet) return Interfaces.C.Strings.chars_ptr  -- /usr/include/X11/Xlib.h:3642
   with Import => True, 
        Convention => C, 
        External_Name => "XLocaleOfFontSet";

  -- font_set  
   function XContextDependentDrawing (arg1 : XFontSet) return int  -- /usr/include/X11/Xlib.h:3646
   with Import => True, 
        Convention => C, 
        External_Name => "XContextDependentDrawing";

  -- font_set  
   function XDirectionalDependentDrawing (arg1 : XFontSet) return int  -- /usr/include/X11/Xlib.h:3650
   with Import => True, 
        Convention => C, 
        External_Name => "XDirectionalDependentDrawing";

  -- font_set  
   function XContextualDrawing (arg1 : XFontSet) return int  -- /usr/include/X11/Xlib.h:3654
   with Import => True, 
        Convention => C, 
        External_Name => "XContextualDrawing";

  -- font_set  
   function XExtentsOfFontSet (arg1 : XFontSet) return access XFontSetExtents  -- /usr/include/X11/Xlib.h:3658
   with Import => True, 
        Convention => C, 
        External_Name => "XExtentsOfFontSet";

  -- font_set  
   function XmbTextEscapement
     (arg1 : XFontSet;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int) return int  -- /usr/include/X11/Xlib.h:3662
   with Import => True, 
        Convention => C, 
        External_Name => "XmbTextEscapement";

  -- font_set  
  -- text  
  -- bytes_text  
   function XwcTextEscapement
     (arg1 : XFontSet;
      arg2 : access wchar_t;
      arg3 : int) return int  -- /usr/include/X11/Xlib.h:3668
   with Import => True, 
        Convention => C, 
        External_Name => "XwcTextEscapement";

  -- font_set  
  -- text  
  -- num_wchars  
   function Xutf8TextEscapement
     (arg1 : XFontSet;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int) return int  -- /usr/include/X11/Xlib.h:3674
   with Import => True, 
        Convention => C, 
        External_Name => "Xutf8TextEscapement";

  -- font_set  
  -- text  
  -- bytes_text  
   function XmbTextExtents
     (arg1 : XFontSet;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int;
      arg4 : access XRectangle;
      arg5 : access XRectangle) return int  -- /usr/include/X11/Xlib.h:3680
   with Import => True, 
        Convention => C, 
        External_Name => "XmbTextExtents";

  -- font_set  
  -- text  
  -- bytes_text  
  -- overall_ink_return  
  -- overall_logical_return  
   function XwcTextExtents
     (arg1 : XFontSet;
      arg2 : access wchar_t;
      arg3 : int;
      arg4 : access XRectangle;
      arg5 : access XRectangle) return int  -- /usr/include/X11/Xlib.h:3688
   with Import => True, 
        Convention => C, 
        External_Name => "XwcTextExtents";

  -- font_set  
  -- text  
  -- num_wchars  
  -- overall_ink_return  
  -- overall_logical_return  
   function Xutf8TextExtents
     (arg1 : XFontSet;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int;
      arg4 : access XRectangle;
      arg5 : access XRectangle) return int  -- /usr/include/X11/Xlib.h:3696
   with Import => True, 
        Convention => C, 
        External_Name => "Xutf8TextExtents";

  -- font_set  
  -- text  
  -- bytes_text  
  -- overall_ink_return  
  -- overall_logical_return  
   function XmbTextPerCharExtents
     (arg1 : XFontSet;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int;
      arg4 : access XRectangle;
      arg5 : access XRectangle;
      arg6 : int;
      arg7 : access int;
      arg8 : access XRectangle;
      arg9 : access XRectangle) return int  -- /usr/include/X11/Xlib.h:3704
   with Import => True, 
        Convention => C, 
        External_Name => "XmbTextPerCharExtents";

  -- font_set  
  -- text  
  -- bytes_text  
  -- ink_extents_buffer  
  -- logical_extents_buffer  
  -- buffer_size  
  -- num_chars  
  -- overall_ink_return  
  -- overall_logical_return  
   function XwcTextPerCharExtents
     (arg1 : XFontSet;
      arg2 : access wchar_t;
      arg3 : int;
      arg4 : access XRectangle;
      arg5 : access XRectangle;
      arg6 : int;
      arg7 : access int;
      arg8 : access XRectangle;
      arg9 : access XRectangle) return int  -- /usr/include/X11/Xlib.h:3716
   with Import => True, 
        Convention => C, 
        External_Name => "XwcTextPerCharExtents";

  -- font_set  
  -- text  
  -- num_wchars  
  -- ink_extents_buffer  
  -- logical_extents_buffer  
  -- buffer_size  
  -- num_chars  
  -- overall_ink_return  
  -- overall_logical_return  
   function Xutf8TextPerCharExtents
     (arg1 : XFontSet;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int;
      arg4 : access XRectangle;
      arg5 : access XRectangle;
      arg6 : int;
      arg7 : access int;
      arg8 : access XRectangle;
      arg9 : access XRectangle) return int  -- /usr/include/X11/Xlib.h:3728
   with Import => True, 
        Convention => C, 
        External_Name => "Xutf8TextPerCharExtents";

  -- font_set  
  -- text  
  -- bytes_text  
  -- ink_extents_buffer  
  -- logical_extents_buffer  
  -- buffer_size  
  -- num_chars  
  -- overall_ink_return  
  -- overall_logical_return  
   procedure XmbDrawText
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : GC;
      arg4 : int;
      arg5 : int;
      arg6 : access XmbTextItem;
      arg7 : int)  -- /usr/include/X11/Xlib.h:3740
   with Import => True, 
        Convention => C, 
        External_Name => "XmbDrawText";

  -- display  
  -- d  
  -- gc  
  -- x  
  -- y  
  -- text_items  
  -- nitems  
   procedure XwcDrawText
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : GC;
      arg4 : int;
      arg5 : int;
      arg6 : access XwcTextItem;
      arg7 : int)  -- /usr/include/X11/Xlib.h:3750
   with Import => True, 
        Convention => C, 
        External_Name => "XwcDrawText";

  -- display  
  -- d  
  -- gc  
  -- x  
  -- y  
  -- text_items  
  -- nitems  
   procedure Xutf8DrawText
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : GC;
      arg4 : int;
      arg5 : int;
      arg6 : access XmbTextItem;
      arg7 : int)  -- /usr/include/X11/Xlib.h:3760
   with Import => True, 
        Convention => C, 
        External_Name => "Xutf8DrawText";

  -- display  
  -- d  
  -- gc  
  -- x  
  -- y  
  -- text_items  
  -- nitems  
   procedure XmbDrawString
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : XFontSet;
      arg4 : GC;
      arg5 : int;
      arg6 : int;
      arg7 : Interfaces.C.Strings.chars_ptr;
      arg8 : int)  -- /usr/include/X11/Xlib.h:3770
   with Import => True, 
        Convention => C, 
        External_Name => "XmbDrawString";

  -- display  
  -- d  
  -- font_set  
  -- gc  
  -- x  
  -- y  
  -- text  
  -- bytes_text  
   procedure XwcDrawString
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : XFontSet;
      arg4 : GC;
      arg5 : int;
      arg6 : int;
      arg7 : access wchar_t;
      arg8 : int)  -- /usr/include/X11/Xlib.h:3781
   with Import => True, 
        Convention => C, 
        External_Name => "XwcDrawString";

  -- display  
  -- d  
  -- font_set  
  -- gc  
  -- x  
  -- y  
  -- text  
  -- num_wchars  
   procedure Xutf8DrawString
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : XFontSet;
      arg4 : GC;
      arg5 : int;
      arg6 : int;
      arg7 : Interfaces.C.Strings.chars_ptr;
      arg8 : int)  -- /usr/include/X11/Xlib.h:3792
   with Import => True, 
        Convention => C, 
        External_Name => "Xutf8DrawString";

  -- display  
  -- d  
  -- font_set  
  -- gc  
  -- x  
  -- y  
  -- text  
  -- bytes_text  
   procedure XmbDrawImageString
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : XFontSet;
      arg4 : GC;
      arg5 : int;
      arg6 : int;
      arg7 : Interfaces.C.Strings.chars_ptr;
      arg8 : int)  -- /usr/include/X11/Xlib.h:3803
   with Import => True, 
        Convention => C, 
        External_Name => "XmbDrawImageString";

  -- display  
  -- d  
  -- font_set  
  -- gc  
  -- x  
  -- y  
  -- text  
  -- bytes_text  
   procedure XwcDrawImageString
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : XFontSet;
      arg4 : GC;
      arg5 : int;
      arg6 : int;
      arg7 : access wchar_t;
      arg8 : int)  -- /usr/include/X11/Xlib.h:3814
   with Import => True, 
        Convention => C, 
        External_Name => "XwcDrawImageString";

  -- display  
  -- d  
  -- font_set  
  -- gc  
  -- x  
  -- y  
  -- text  
  -- num_wchars  
   procedure Xutf8DrawImageString
     (arg1 : access Display;
      arg2 : X11.Drawable;
      arg3 : XFontSet;
      arg4 : GC;
      arg5 : int;
      arg6 : int;
      arg7 : Interfaces.C.Strings.chars_ptr;
      arg8 : int)  -- /usr/include/X11/Xlib.h:3825
   with Import => True, 
        Convention => C, 
        External_Name => "Xutf8DrawImageString";

  -- display  
  -- d  
  -- font_set  
  -- gc  
  -- x  
  -- y  
  -- text  
  -- bytes_text  
   function XOpenIM
     (arg1 : access Display;
      arg2 : access u_XrmHashBucketRec;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr) return XIM  -- /usr/include/X11/Xlib.h:3836
   with Import => True, 
        Convention => C, 
        External_Name => "XOpenIM";

  -- dpy  
  -- rdb  
  -- res_name  
  -- res_class  
   function XCloseIM (arg1 : XIM) return int  -- /usr/include/X11/Xlib.h:3843
   with Import => True, 
        Convention => C, 
        External_Name => "XCloseIM";

  -- im  
   function XGetIMValues (arg1 : XIM  -- , ...
      ) return Interfaces.C.Strings.chars_ptr  -- /usr/include/X11/Xlib.h:3847
   with Import => True, 
        Convention => C, 
        External_Name => "XGetIMValues";

  -- im  
   function XSetIMValues (arg1 : XIM  -- , ...
      ) return Interfaces.C.Strings.chars_ptr  -- /usr/include/X11/Xlib.h:3851
   with Import => True, 
        Convention => C, 
        External_Name => "XSetIMValues";

  -- im  
   function XDisplayOfIM (arg1 : XIM) return access Display  -- /usr/include/X11/Xlib.h:3855
   with Import => True, 
        Convention => C, 
        External_Name => "XDisplayOfIM";

  -- im  
   function XLocaleOfIM (arg1 : XIM) return Interfaces.C.Strings.chars_ptr  -- /usr/include/X11/Xlib.h:3859
   with Import => True, 
        Convention => C, 
        External_Name => "XLocaleOfIM";

  -- im 
   function XCreateIC (arg1 : XIM  -- , ...
      ) return XIC  -- /usr/include/X11/Xlib.h:3863
   with Import => True, 
        Convention => C, 
        External_Name => "XCreateIC";

  -- im  
   procedure XDestroyIC (arg1 : XIC)  -- /usr/include/X11/Xlib.h:3867
   with Import => True, 
        Convention => C, 
        External_Name => "XDestroyIC";

  -- ic  
   procedure XSetICFocus (arg1 : XIC)  -- /usr/include/X11/Xlib.h:3871
   with Import => True, 
        Convention => C, 
        External_Name => "XSetICFocus";

  -- ic  
   procedure XUnsetICFocus (arg1 : XIC)  -- /usr/include/X11/Xlib.h:3875
   with Import => True, 
        Convention => C, 
        External_Name => "XUnsetICFocus";

  -- ic  
   function XwcResetIC (arg1 : XIC) return access wchar_t  -- /usr/include/X11/Xlib.h:3879
   with Import => True, 
        Convention => C, 
        External_Name => "XwcResetIC";

  -- ic  
   function XmbResetIC (arg1 : XIC) return Interfaces.C.Strings.chars_ptr  -- /usr/include/X11/Xlib.h:3883
   with Import => True, 
        Convention => C, 
        External_Name => "XmbResetIC";

  -- ic  
   function Xutf8ResetIC (arg1 : XIC) return Interfaces.C.Strings.chars_ptr  -- /usr/include/X11/Xlib.h:3887
   with Import => True, 
        Convention => C, 
        External_Name => "Xutf8ResetIC";

  -- ic  
   function XSetICValues (arg1 : XIC  -- , ...
      ) return Interfaces.C.Strings.chars_ptr  -- /usr/include/X11/Xlib.h:3891
   with Import => True, 
        Convention => C, 
        External_Name => "XSetICValues";

  -- ic  
   function XGetICValues (arg1 : XIC  -- , ...
      ) return Interfaces.C.Strings.chars_ptr  -- /usr/include/X11/Xlib.h:3895
   with Import => True, 
        Convention => C, 
        External_Name => "XGetICValues";

  -- ic  
   function XIMOfIC (arg1 : XIC) return XIM  -- /usr/include/X11/Xlib.h:3899
   with Import => True, 
        Convention => C, 
        External_Name => "XIMOfIC";

  -- ic  
   function XFilterEvent (arg1 : access XEvent; arg2 : X11.Window) return int  -- /usr/include/X11/Xlib.h:3903
   with Import => True, 
        Convention => C, 
        External_Name => "XFilterEvent";

  -- event  
  -- window  
   function XmbLookupString
     (arg1 : XIC;
      arg2 : access XKeyPressedEvent;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : int;
      arg5 : access X11.KeySym;
      arg6 : access int) return int  -- /usr/include/X11/Xlib.h:3908
   with Import => True, 
        Convention => C, 
        External_Name => "XmbLookupString";

  -- ic  
  -- event  
  -- buffer_return  
  -- bytes_buffer  
  -- keysym_return  
  -- status_return  
   function XwcLookupString
     (arg1 : XIC;
      arg2 : access XKeyPressedEvent;
      arg3 : access wchar_t;
      arg4 : int;
      arg5 : access X11.KeySym;
      arg6 : access int) return int  -- /usr/include/X11/Xlib.h:3917
   with Import => True, 
        Convention => C, 
        External_Name => "XwcLookupString";

  -- ic  
  -- event  
  -- buffer_return  
  -- wchars_buffer  
  -- keysym_return  
  -- status_return  
   function Xutf8LookupString
     (arg1 : XIC;
      arg2 : access XKeyPressedEvent;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : int;
      arg5 : access X11.KeySym;
      arg6 : access int) return int  -- /usr/include/X11/Xlib.h:3926
   with Import => True, 
        Convention => C, 
        External_Name => "Xutf8LookupString";

  -- ic  
  -- event  
  -- buffer_return  
  -- bytes_buffer  
  -- keysym_return  
  -- status_return  
   function XVaCreateNestedList (arg1 : int  -- , ...
      ) return XVaNestedList  -- /usr/include/X11/Xlib.h:3935
   with Import => True, 
        Convention => C, 
        External_Name => "XVaCreateNestedList";

  --unused 
  -- internal connections for IMs  
   function XRegisterIMInstantiateCallback
     (arg1 : access Display;
      arg2 : access u_XrmHashBucketRec;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : XIDProc;
      arg6 : XPointer) return int  -- /usr/include/X11/Xlib.h:3941
   with Import => True, 
        Convention => C, 
        External_Name => "XRegisterIMInstantiateCallback";

  -- dpy  
  -- rdb  
  -- res_name  
  -- res_class  
  -- callback  
  -- client_data  
   function XUnregisterIMInstantiateCallback
     (arg1 : access Display;
      arg2 : access u_XrmHashBucketRec;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : XIDProc;
      arg6 : XPointer) return int  -- /usr/include/X11/Xlib.h:3950
   with Import => True, 
        Convention => C, 
        External_Name => "XUnregisterIMInstantiateCallback";

  -- dpy  
  -- rdb  
  -- res_name  
  -- res_class  
  -- callback  
  -- client_data  
   type XConnectionWatchProc is access procedure
        (arg1 : access Display;
         arg2 : XPointer;
         arg3 : int;
         arg4 : int;
         arg5 : System.Address)
   with Convention => C;  -- /usr/include/X11/Xlib.h:3959

  -- dpy  
  -- client_data  
  -- fd  
  -- opening  
  -- open or close flag  
  -- watch_data  
  -- open sets, close uses  
   function XInternalConnectionNumbers
     (arg1 : access Display;
      arg2 : System.Address;
      arg3 : access int) return int  -- /usr/include/X11/Xlib.h:3968
   with Import => True, 
        Convention => C, 
        External_Name => "XInternalConnectionNumbers";

  -- dpy  
  -- fd_return  
  -- count_return  
   procedure XProcessInternalConnection (arg1 : access Display; arg2 : int)  -- /usr/include/X11/Xlib.h:3974
   with Import => True, 
        Convention => C, 
        External_Name => "XProcessInternalConnection";

  -- dpy  
  -- fd  
   function XAddConnectionWatch
     (arg1 : access Display;
      arg2 : XConnectionWatchProc;
      arg3 : XPointer) return int  -- /usr/include/X11/Xlib.h:3979
   with Import => True, 
        Convention => C, 
        External_Name => "XAddConnectionWatch";

  -- dpy  
  -- callback  
  -- client_data  
   procedure XRemoveConnectionWatch
     (arg1 : access Display;
      arg2 : XConnectionWatchProc;
      arg3 : XPointer)  -- /usr/include/X11/Xlib.h:3985
   with Import => True, 
        Convention => C, 
        External_Name => "XRemoveConnectionWatch";

  -- dpy  
  -- callback  
  -- client_data  
   procedure XSetAuthorization
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : int;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : int)  -- /usr/include/X11/Xlib.h:3991
   with Import => True, 
        Convention => C, 
        External_Name => "XSetAuthorization";

  -- name  
  -- namelen  
  -- data  
  -- datalen  
   --  skipped func _Xmbtowc

  -- wstr  
  -- str  
  -- len  
   --  skipped func _Xwctomb

  -- str  
  -- wc  
   function XGetEventData (arg1 : access Display; arg2 : access XGenericEventCookie) return int  -- /usr/include/X11/Xlib.h:4009
   with Import => True, 
        Convention => C, 
        External_Name => "XGetEventData";

  -- dpy  
  -- cookie 
   procedure XFreeEventData (arg1 : access Display; arg2 : access XGenericEventCookie)  -- /usr/include/X11/Xlib.h:4014
   with Import => True,
        Convention => C, 
        External_Name => "XFreeEventData";

  -- dpy  
  -- cookie 
end Xlib;
