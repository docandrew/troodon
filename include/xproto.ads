pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with bits_stdint_uintn_h;
with bits_stdint_intn_h;
with xcb;
with System;
with Interfaces.C.Strings;

package xproto is

   -- Note: modded these to deconflict with function names
   CONST_XCB_KEY_PRESS : constant := 2;  --  /usr/include/xcb/xproto.h:540

   CONST_XCB_KEY_RELEASE : constant := 3;  --  /usr/include/xcb/xproto.h:563

   CONST_XCB_BUTTON_PRESS : constant := 4;  --  /usr/include/xcb/xproto.h:577

   CONST_XCB_BUTTON_RELEASE : constant := 5;  --  /usr/include/xcb/xproto.h:600

   CONST_XCB_MOTION_NOTIFY : constant := 6;  --  /usr/include/xcb/xproto.h:610

   CONST_XCB_ENTER_NOTIFY : constant := 7;  --  /usr/include/xcb/xproto.h:651

   CONST_XCB_LEAVE_NOTIFY : constant := 8;  --  /usr/include/xcb/xproto.h:674

   CONST_XCB_FOCUS_IN : constant := 9;  --  /usr/include/xcb/xproto.h:679

   CONST_XCB_FOCUS_OUT : constant := 10;  --  /usr/include/xcb/xproto.h:694

   CONST_XCB_KEYMAP_NOTIFY : constant := 11;  --  /usr/include/xcb/xproto.h:699

   CONST_XCB_EXPOSE : constant := 12;  --  /usr/include/xcb/xproto.h:710

   CONST_XCB_GRAPHICS_EXPOSURE : constant := 13;  --  /usr/include/xcb/xproto.h:729

   CONST_XCB_NO_EXPOSURE : constant := 14;  --  /usr/include/xcb/xproto.h:750

   CONST_XCB_VISIBILITY_NOTIFY : constant := 15;  --  /usr/include/xcb/xproto.h:772

   CONST_XCB_CREATE_NOTIFY : constant := 16;  --  /usr/include/xcb/xproto.h:787

   CONST_XCB_DESTROY_NOTIFY : constant := 17;  --  /usr/include/xcb/xproto.h:808

   CONST_XCB_UNMAP_NOTIFY : constant := 18;  --  /usr/include/xcb/xproto.h:822

   CONST_XCB_MAP_NOTIFY : constant := 19;  --  /usr/include/xcb/xproto.h:838

   CONST_XCB_MAP_REQUEST : constant := 20;  --  /usr/include/xcb/xproto.h:854

   CONST_XCB_REPARENT_NOTIFY : constant := 21;  --  /usr/include/xcb/xproto.h:868

   CONST_XCB_CONFIGURE_NOTIFY : constant := 22;  --  /usr/include/xcb/xproto.h:887

   CONST_XCB_CONFIGURE_REQUEST : constant := 23;  --  /usr/include/xcb/xproto.h:909

   CONST_XCB_GRAVITY_NOTIFY : constant := 24;  --  /usr/include/xcb/xproto.h:930

   CONST_XCB_RESIZE_REQUEST : constant := 25;  --  /usr/include/xcb/xproto.h:946

   CONST_XCB_CIRCULATE_NOTIFY : constant := 26;  --  /usr/include/xcb/xproto.h:970

   CONST_XCB_CIRCULATE_REQUEST : constant := 27;  --  /usr/include/xcb/xproto.h:987

   CONST_XCB_PROPERTY_NOTIFY : constant := 28;  --  /usr/include/xcb/xproto.h:997

   CONST_XCB_SELECTION_CLEAR : constant := 29;  --  /usr/include/xcb/xproto.h:1014

   CONST_XCB_SELECTION_REQUEST : constant := 30;  --  /usr/include/xcb/xproto.h:1106

   CONST_XCB_SELECTION_NOTIFY : constant := 31;  --  /usr/include/xcb/xproto.h:1124

   CONST_XCB_COLORMAP_NOTIFY : constant := 32;  --  /usr/include/xcb/xproto.h:1154

   CONST_XCB_CLIENT_MESSAGE : constant := 33;  --  /usr/include/xcb/xproto.h:1189

   CONST_XCB_MAPPING_NOTIFY : constant := 34;  --  /usr/include/xcb/xproto.h:1210

   CONST_XCB_GE_GENERIC : constant := 35;  --  /usr/include/xcb/xproto.h:1226

   CONST_XCB_REQUEST : constant := 1;  --  /usr/include/xcb/xproto.h:1242

   CONST_XCB_VALUE : constant := 2;  --  /usr/include/xcb/xproto.h:1258

   CONST_XCB_WINDOW : constant := 3;  --  /usr/include/xcb/xproto.h:1274

   CONST_XCB_PIXMAP : constant := 4;  --  /usr/include/xcb/xproto.h:1279

   CONST_XCB_ATOM : constant := 5;  --  /usr/include/xcb/xproto.h:1284

   CONST_XCB_CURSOR : constant := 6;  --  /usr/include/xcb/xproto.h:1289

   CONST_XCB_FONT : constant := 7;  --  /usr/include/xcb/xproto.h:1294

   CONST_XCB_MATCH : constant := 8;  --  /usr/include/xcb/xproto.h:1299

   CONST_XCB_DRAWABLE : constant := 9;  --  /usr/include/xcb/xproto.h:1304

   CONST_XCB_ACCESS : constant := 10;  --  /usr/include/xcb/xproto.h:1309

   CONST_XCB_ALLOC : constant := 11;  --  /usr/include/xcb/xproto.h:1314

   CONST_XCB_COLORMAP : constant := 12;  --  /usr/include/xcb/xproto.h:1319

   CONST_XCB_G_CONTEXT : constant := 13;  --  /usr/include/xcb/xproto.h:1324

   CONST_XCB_ID_CHOICE : constant := 14;  --  /usr/include/xcb/xproto.h:1329

   CONST_XCB_NAME : constant := 15;  --  /usr/include/xcb/xproto.h:1334

   CONST_XCB_LENGTH : constant := 16;  --  /usr/include/xcb/xproto.h:1339

   CONST_XCB_IMPLEMENTATION : constant := 17;  --  /usr/include/xcb/xproto.h:1344

   CONST_XCB_CREATE_WINDOW : constant := 1;  --  /usr/include/xcb/xproto.h:1497

   CONST_XCB_CHANGE_WINDOW_ATTRIBUTES : constant := 2;  --  /usr/include/xcb/xproto.h:1540

   CONST_XCB_GET_WINDOW_ATTRIBUTES : constant := 3;  --  /usr/include/xcb/xproto.h:1567

   CONST_XCB_DESTROY_WINDOW : constant := 4;  --  /usr/include/xcb/xproto.h:1605

   CONST_XCB_DESTROY_SUBWINDOWS : constant := 5;  --  /usr/include/xcb/xproto.h:1618

   CONST_XCB_CHANGE_SAVE_SET : constant := 6;  --  /usr/include/xcb/xproto.h:1636

   CONST_XCB_REPARENT_WINDOW : constant := 7;  --  /usr/include/xcb/xproto.h:1649

   CONST_XCB_MAP_WINDOW : constant := 8;  --  /usr/include/xcb/xproto.h:1665

   CONST_XCB_MAP_SUBWINDOWS : constant := 9;  --  /usr/include/xcb/xproto.h:1678

   CONST_XCB_UNMAP_WINDOW : constant := 10;  --  /usr/include/xcb/xproto.h:1691

   CONST_XCB_UNMAP_SUBWINDOWS : constant := 11;  --  /usr/include/xcb/xproto.h:1704

   CONST_XCB_CONFIGURE_WINDOW : constant := 12;  --  /usr/include/xcb/xproto.h:1748

   CONST_XCB_CIRCULATE_WINDOW : constant := 13;  --  /usr/include/xcb/xproto.h:1768

   CONST_XCB_GET_GEOMETRY : constant := 14;  --  /usr/include/xcb/xproto.h:1788

   CONST_XCB_QUERY_TREE : constant := 15;  --  /usr/include/xcb/xproto.h:1825

   CONST_XCB_INTERN_ATOM : constant := 16;  --  /usr/include/xcb/xproto.h:1859

   CONST_XCB_GET_ATOM_NAME : constant := 17;  --  /usr/include/xcb/xproto.h:1891

   CONST_XCB_CHANGE_PROPERTY : constant := 18;  --  /usr/include/xcb/xproto.h:1932

   CONST_XCB_DELETE_PROPERTY : constant := 19;  --  /usr/include/xcb/xproto.h:1950

   CONST_XCB_GET_PROPERTY : constant := 20;  --  /usr/include/xcb/xproto.h:1975

   CONST_XCB_LIST_PROPERTIES : constant := 21;  --  /usr/include/xcb/xproto.h:2013

   CONST_XCB_SET_SELECTION_OWNER : constant := 22;  --  /usr/include/xcb/xproto.h:2038

   CONST_XCB_GET_SELECTION_OWNER : constant := 23;  --  /usr/include/xcb/xproto.h:2060

   CONST_XCB_CONVERT_SELECTION : constant := 24;  --  /usr/include/xcb/xproto.h:2084

   CONST_XCB_SEND_EVENT : constant := 25;  --  /usr/include/xcb/xproto.h:2106

   CONST_XCB_GRAB_POINTER : constant := 26;  --  /usr/include/xcb/xproto.h:2151

   CONST_XCB_UNGRAB_POINTER : constant := 27;  --  /usr/include/xcb/xproto.h:2180

   CONST_XCB_GRAB_BUTTON : constant := 28;  --  /usr/include/xcb/xproto.h:2214

   CONST_XCB_UNGRAB_BUTTON : constant := 29;  --  /usr/include/xcb/xproto.h:2235

   CONST_XCB_CHANGE_ACTIVE_POINTER_GRAB : constant := 30;  --  /usr/include/xcb/xproto.h:2250

   CONST_XCB_GRAB_KEYBOARD : constant := 31;  --  /usr/include/xcb/xproto.h:2273

   CONST_XCB_UNGRAB_KEYBOARD : constant := 32;  --  /usr/include/xcb/xproto.h:2300

   CONST_XCB_GRAB_KEY : constant := 33;  --  /usr/include/xcb/xproto.h:2317

   CONST_XCB_UNGRAB_KEY : constant := 34;  --  /usr/include/xcb/xproto.h:2335

   CONST_XCB_ALLOW_EVENTS : constant := 35;  --  /usr/include/xcb/xproto.h:2426

   CONST_XCB_GRAB_SERVER : constant := 36;  --  /usr/include/xcb/xproto.h:2439

   CONST_XCB_UNGRAB_SERVER : constant := 37;  --  /usr/include/xcb/xproto.h:2451

   CONST_XCB_QUERY_POINTER : constant := 38;  --  /usr/include/xcb/xproto.h:2470

   CONST_XCB_GET_MOTION_EVENTS : constant := 39;  --  /usr/include/xcb/xproto.h:2526

   CONST_XCB_TRANSLATE_COORDINATES : constant := 40;  --  /usr/include/xcb/xproto.h:2560

   CONST_XCB_WARP_POINTER : constant := 41;  --  /usr/include/xcb/xproto.h:2589

   CONST_XCB_SET_INPUT_FOCUS : constant := 42;  --  /usr/include/xcb/xproto.h:2627

   CONST_XCB_GET_INPUT_FOCUS : constant := 43;  --  /usr/include/xcb/xproto.h:2648

   CONST_XCB_QUERY_KEYMAP : constant := 44;  --  /usr/include/xcb/xproto.h:2678

   CONST_XCB_OPEN_FONT : constant := 45;  --  /usr/include/xcb/xproto.h:2701

   CONST_XCB_CLOSE_FONT : constant := 46;  --  /usr/include/xcb/xproto.h:2716

   CONST_XCB_QUERY_FONT : constant := 47;  --  /usr/include/xcb/xproto.h:2779

   CONST_XCB_QUERY_TEXT_EXTENTS : constant := 48;  --  /usr/include/xcb/xproto.h:2824

   CONST_XCB_LIST_FONTS : constant := 49;  --  /usr/include/xcb/xproto.h:2877

   CONST_XCB_LIST_FONTS_WITH_INFO : constant := 50;  --  /usr/include/xcb/xproto.h:2910

   CONST_XCB_SET_FONT_PATH : constant := 51;  --  /usr/include/xcb/xproto.h:2949

   CONST_XCB_GET_FONT_PATH : constant := 52;  --  /usr/include/xcb/xproto.h:2970

   CONST_XCB_CREATE_PIXMAP : constant := 53;  --  /usr/include/xcb/xproto.h:2994

   CONST_XCB_FREE_PIXMAP : constant := 54;  --  /usr/include/xcb/xproto.h:3010

   CONST_XCB_CREATE_GC : constant := 55;  --  /usr/include/xcb/xproto.h:3261

   CONST_XCB_CHANGE_GC : constant := 56;  --  /usr/include/xcb/xproto.h:3305

   CONST_XCB_COPY_GC : constant := 57;  --  /usr/include/xcb/xproto.h:3319

   CONST_XCB_SET_DASHES : constant := 58;  --  /usr/include/xcb/xproto.h:3334

   CONST_XCB_SET_CLIP_RECTANGLES : constant := 59;  --  /usr/include/xcb/xproto.h:3356

   CONST_XCB_FREE_GC : constant := 60;  --  /usr/include/xcb/xproto.h:3371

   CONST_XCB_CLEAR_AREA : constant := 61;  --  /usr/include/xcb/xproto.h:3384

   CONST_XCB_COPY_AREA : constant := 62;  --  /usr/include/xcb/xproto.h:3401

   CONST_XCB_COPY_PLANE : constant := 63;  --  /usr/include/xcb/xproto.h:3422

   CONST_XCB_POLY_POINT : constant := 64;  --  /usr/include/xcb/xproto.h:3453

   CONST_XCB_POLY_LINE : constant := 65;  --  /usr/include/xcb/xproto.h:3467

   CONST_XCB_POLY_SEGMENT : constant := 66;  --  /usr/include/xcb/xproto.h:3500

   CONST_XCB_POLY_RECTANGLE : constant := 67;  --  /usr/include/xcb/xproto.h:3514

   CONST_XCB_POLY_ARC : constant := 68;  --  /usr/include/xcb/xproto.h:3528

   CONST_XCB_FILL_POLY : constant := 69;  --  /usr/include/xcb/xproto.h:3548

   CONST_XCB_POLY_FILL_RECTANGLE : constant := 70;  --  /usr/include/xcb/xproto.h:3565

   CONST_XCB_POLY_FILL_ARC : constant := 71;  --  /usr/include/xcb/xproto.h:3579

   CONST_XCB_PUT_IMAGE : constant := 72;  --  /usr/include/xcb/xproto.h:3599

   CONST_XCB_GET_IMAGE : constant := 73;  --  /usr/include/xcb/xproto.h:3627

   CONST_XCB_POLY_TEXT_8 : constant := 74;  --  /usr/include/xcb/xproto.h:3657

   CONST_XCB_POLY_TEXT_16 : constant := 75;  --  /usr/include/xcb/xproto.h:3673

   CONST_XCB_IMAGE_TEXT_8 : constant := 76;  --  /usr/include/xcb/xproto.h:3689

   CONST_XCB_IMAGE_TEXT_16 : constant := 77;  --  /usr/include/xcb/xproto.h:3705

   CONST_XCB_CREATE_COLORMAP : constant := 78;  --  /usr/include/xcb/xproto.h:3726

   CONST_XCB_FREE_COLORMAP : constant := 79;  --  /usr/include/xcb/xproto.h:3741

   CONST_XCB_COPY_COLORMAP_AND_FREE : constant := 80;  --  /usr/include/xcb/xproto.h:3754

   CONST_XCB_INSTALL_COLORMAP : constant := 81;  --  /usr/include/xcb/xproto.h:3768

   CONST_XCB_UNINSTALL_COLORMAP : constant := 82;  --  /usr/include/xcb/xproto.h:3781

   CONST_XCB_LIST_INSTALLED_COLORMAPS : constant := 83;  --  /usr/include/xcb/xproto.h:3801

   CONST_XCB_ALLOC_COLOR : constant := 84;  --  /usr/include/xcb/xproto.h:3833

   CONST_XCB_ALLOC_NAMED_COLOR : constant := 85;  --  /usr/include/xcb/xproto.h:3872

   CONST_XCB_ALLOC_COLOR_CELLS : constant := 86;  --  /usr/include/xcb/xproto.h:3911

   CONST_XCB_ALLOC_COLOR_PLANES : constant := 87;  --  /usr/include/xcb/xproto.h:3946

   CONST_XCB_FREE_COLORS : constant := 88;  --  /usr/include/xcb/xproto.h:3979

   CONST_XCB_STORE_COLORS : constant := 89;  --  /usr/include/xcb/xproto.h:4020

   CONST_XCB_STORE_NAMED_COLOR : constant := 90;  --  /usr/include/xcb/xproto.h:4033

   CONST_XCB_QUERY_COLORS : constant := 91;  --  /usr/include/xcb/xproto.h:4075

   CONST_XCB_LOOKUP_COLOR : constant := 92;  --  /usr/include/xcb/xproto.h:4107

   CONST_XCB_CREATE_CURSOR : constant := 93;  --  /usr/include/xcb/xproto.h:4142

   CONST_XCB_CREATE_GLYPH_CURSOR : constant := 94;  --  /usr/include/xcb/xproto.h:4169

   CONST_XCB_FREE_CURSOR : constant := 95;  --  /usr/include/xcb/xproto.h:4192

   CONST_XCB_RECOLOR_CURSOR : constant := 96;  --  /usr/include/xcb/xproto.h:4205

   CONST_XCB_QUERY_BEST_SIZE : constant := 97;  --  /usr/include/xcb/xproto.h:4237

   CONST_XCB_QUERY_EXTENSION : constant := 98;  --  /usr/include/xcb/xproto.h:4271

   CONST_XCB_LIST_EXTENSIONS : constant := 99;  --  /usr/include/xcb/xproto.h:4306

   CONST_XCB_CHANGE_KEYBOARD_MAPPING : constant := 100;  --  /usr/include/xcb/xproto.h:4329

   CONST_XCB_GET_KEYBOARD_MAPPING : constant := 101;  --  /usr/include/xcb/xproto.h:4351

   CONST_XCB_CHANGE_KEYBOARD_CONTROL : constant := 102;  --  /usr/include/xcb/xproto.h:4412

   CONST_XCB_GET_KEYBOARD_CONTROL : constant := 103;  --  /usr/include/xcb/xproto.h:4432

   CONST_XCB_BELL : constant := 104;  --  /usr/include/xcb/xproto.h:4461

   CONST_XCB_CHANGE_POINTER_CONTROL : constant := 105;  --  /usr/include/xcb/xproto.h:4473

   CONST_XCB_GET_POINTER_CONTROL : constant := 106;  --  /usr/include/xcb/xproto.h:4497

   CONST_XCB_SET_SCREEN_SAVER : constant := 107;  --  /usr/include/xcb/xproto.h:4535

   CONST_XCB_GET_SCREEN_SAVER : constant := 108;  --  /usr/include/xcb/xproto.h:4558

   CONST_XCB_CHANGE_HOSTS : constant := 109;  --  /usr/include/xcb/xproto.h:4598

   CONST_XCB_LIST_HOSTS : constant := 110;  --  /usr/include/xcb/xproto.h:4638

   CONST_XCB_SET_ACCESS_CONTROL : constant := 111;  --  /usr/include/xcb/xproto.h:4667

   CONST_XCB_SET_CLOSE_DOWN_MODE : constant := 112;  --  /usr/include/xcb/xproto.h:4685

   CONST_XCB_KILL_CLIENT : constant := 113;  --  /usr/include/xcb/xproto.h:4701

   CONST_XCB_ROTATE_PROPERTIES : constant := 114;  --  /usr/include/xcb/xproto.h:4714

   CONST_XCB_FORCE_SCREEN_SAVER : constant := 115;  --  /usr/include/xcb/xproto.h:4734

   CONST_XCB_SET_POINTER_MAPPING : constant := 116;  --  /usr/include/xcb/xproto.h:4759

   CONST_XCB_GET_POINTER_MAPPING : constant := 117;  --  /usr/include/xcb/xproto.h:4788

   CONST_XCB_SET_MODIFIER_MAPPING : constant := 118;  --  /usr/include/xcb/xproto.h:4829

   CONST_XCB_GET_MODIFIER_MAPPING : constant := 119;  --  /usr/include/xcb/xproto.h:4858

   CONST_XCB_NO_OPERATION : constant := 127;  --  /usr/include/xcb/xproto.h:4881

  -- * This file generated automatically from xproto.xml by c_client.py.
  -- * Edit at your peril.
  --  

  --*
  -- * @defgroup XCB__API XCB  API
  -- * @brief  XCB Protocol Implementation.
  -- * @{
  -- * 

  --*
  -- * @brief xcb_char2b_t
  -- * 

   type xcb_char2b_t is record
      byte1 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:25
      byte2 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:26
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:24

  --*
  -- * @brief xcb_char2b_iterator_t
  -- * 

   type xcb_char2b_iterator_t is record
      data : access xcb_char2b_t;  -- /usr/include/xcb/xproto.h:33
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:34
      index : aliased int;  -- /usr/include/xcb/xproto.h:35
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:32

   subtype xcb_window_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:38

  --*
  -- * @brief xcb_window_iterator_t
  -- * 

   type xcb_window_iterator_t is record
      data : access xcb_window_t;  -- /usr/include/xcb/xproto.h:44
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:45
      index : aliased int;  -- /usr/include/xcb/xproto.h:46
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:43

   subtype xcb_pixmap_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:49

  --*
  -- * @brief xcb_pixmap_iterator_t
  -- * 

   type xcb_pixmap_iterator_t is record
      data : access xcb_pixmap_t;  -- /usr/include/xcb/xproto.h:55
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:56
      index : aliased int;  -- /usr/include/xcb/xproto.h:57
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:54

   subtype xcb_cursor_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:60

  --*
  -- * @brief xcb_cursor_iterator_t
  -- * 

   type xcb_cursor_iterator_t is record
      data : access xcb_cursor_t;  -- /usr/include/xcb/xproto.h:66
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:67
      index : aliased int;  -- /usr/include/xcb/xproto.h:68
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:65

   subtype xcb_font_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:71

  --*
  -- * @brief xcb_font_iterator_t
  -- * 

   type xcb_font_iterator_t is record
      data : access xcb_font_t;  -- /usr/include/xcb/xproto.h:77
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:78
      index : aliased int;  -- /usr/include/xcb/xproto.h:79
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:76

   subtype xcb_gcontext_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:82

  --*
  -- * @brief xcb_gcontext_iterator_t
  -- * 

   type xcb_gcontext_iterator_t is record
      data : access xcb_gcontext_t;  -- /usr/include/xcb/xproto.h:88
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:89
      index : aliased int;  -- /usr/include/xcb/xproto.h:90
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:87

   subtype xcb_colormap_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:93

  --*
  -- * @brief xcb_colormap_iterator_t
  -- * 

   type xcb_colormap_iterator_t is record
      data : access xcb_colormap_t;  -- /usr/include/xcb/xproto.h:99
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:100
      index : aliased int;  -- /usr/include/xcb/xproto.h:101
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:98

   subtype xcb_atom_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:104

  --*
  -- * @brief xcb_atom_iterator_t
  -- * 

   type xcb_atom_iterator_t is record
      data : access xcb_atom_t;  -- /usr/include/xcb/xproto.h:110
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:111
      index : aliased int;  -- /usr/include/xcb/xproto.h:112
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:109

   subtype xcb_drawable_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:115

  --*
  -- * @brief xcb_drawable_iterator_t
  -- * 

   type xcb_drawable_iterator_t is record
      data : access xcb_drawable_t;  -- /usr/include/xcb/xproto.h:121
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:122
      index : aliased int;  -- /usr/include/xcb/xproto.h:123
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:120

   subtype xcb_fontable_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:126

  --*
  -- * @brief xcb_fontable_iterator_t
  -- * 

   type xcb_fontable_iterator_t is record
      data : access xcb_fontable_t;  -- /usr/include/xcb/xproto.h:132
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:133
      index : aliased int;  -- /usr/include/xcb/xproto.h:134
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:131

   subtype xcb_bool32_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:137

  --*
  -- * @brief xcb_bool32_iterator_t
  -- * 

   type xcb_bool32_iterator_t is record
      data : access xcb_bool32_t;  -- /usr/include/xcb/xproto.h:143
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:144
      index : aliased int;  -- /usr/include/xcb/xproto.h:145
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:142

   subtype xcb_visualid_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:148

  --*
  -- * @brief xcb_visualid_iterator_t
  -- * 

   type xcb_visualid_iterator_t is record
      data : access xcb_visualid_t;  -- /usr/include/xcb/xproto.h:154
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:155
      index : aliased int;  -- /usr/include/xcb/xproto.h:156
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:153

   subtype xcb_timestamp_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:159

  --*
  -- * @brief xcb_timestamp_iterator_t
  -- * 

   type xcb_timestamp_iterator_t is record
      data : access xcb_timestamp_t;  -- /usr/include/xcb/xproto.h:165
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:166
      index : aliased int;  -- /usr/include/xcb/xproto.h:167
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:164

   subtype xcb_keysym_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:170

  --*
  -- * @brief xcb_keysym_iterator_t
  -- * 

   type xcb_keysym_iterator_t is record
      data : access xcb_keysym_t;  -- /usr/include/xcb/xproto.h:176
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:177
      index : aliased int;  -- /usr/include/xcb/xproto.h:178
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:175

   subtype xcb_keycode_t is bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:181

  --*
  -- * @brief xcb_keycode_iterator_t
  -- * 

   type xcb_keycode_iterator_t is record
      data : access xcb_keycode_t;  -- /usr/include/xcb/xproto.h:187
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:188
      index : aliased int;  -- /usr/include/xcb/xproto.h:189
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:186

   subtype xcb_keycode32_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:192

  --*
  -- * @brief xcb_keycode32_iterator_t
  -- * 

   type xcb_keycode32_iterator_t is record
      data : access xcb_keycode32_t;  -- /usr/include/xcb/xproto.h:198
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:199
      index : aliased int;  -- /usr/include/xcb/xproto.h:200
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:197

   subtype xcb_button_t is bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:203

  --*
  -- * @brief xcb_button_iterator_t
  -- * 

   type xcb_button_iterator_t is record
      data : access xcb_button_t;  -- /usr/include/xcb/xproto.h:209
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:210
      index : aliased int;  -- /usr/include/xcb/xproto.h:211
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:208

  --*
  -- * @brief xcb_point_t
  -- * 

   type xcb_point_t is record
      x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:218
      y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:219
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:217

  --*
  -- * @brief xcb_point_iterator_t
  -- * 

   type xcb_point_iterator_t is record
      data : access xcb_point_t;  -- /usr/include/xcb/xproto.h:226
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:227
      index : aliased int;  -- /usr/include/xcb/xproto.h:228
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:225

  --*
  -- * @brief xcb_rectangle_t
  -- * 

   type xcb_rectangle_t is record
      x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:235
      y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:236
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:237
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:238
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:234

  --*
  -- * @brief xcb_rectangle_iterator_t
  -- * 

   type xcb_rectangle_iterator_t is record
      data : access xcb_rectangle_t;  -- /usr/include/xcb/xproto.h:245
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:246
      index : aliased int;  -- /usr/include/xcb/xproto.h:247
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:244

  --*
  -- * @brief xcb_arc_t
  -- * 

   type xcb_arc_t is record
      x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:254
      y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:255
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:256
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:257
      angle1 : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:258
      angle2 : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:259
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:253

  --*
  -- * @brief xcb_arc_iterator_t
  -- * 

   type xcb_arc_iterator_t is record
      data : access xcb_arc_t;  -- /usr/include/xcb/xproto.h:266
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:267
      index : aliased int;  -- /usr/include/xcb/xproto.h:268
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:265

  --*
  -- * @brief xcb_format_t
  -- * 

   type xcb_format_t_array1778 is array (0 .. 4) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_format_t is record
      depth : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:275
      bits_per_pixel : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:276
      scanline_pad : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:277
      pad0 : aliased xcb_format_t_array1778;  -- /usr/include/xcb/xproto.h:278
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:274

  --*
  -- * @brief xcb_format_iterator_t
  -- * 

   type xcb_format_iterator_t is record
      data : access xcb_format_t;  -- /usr/include/xcb/xproto.h:285
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:286
      index : aliased int;  -- /usr/include/xcb/xproto.h:287
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:284

   type xcb_visual_class_t is 
     (XCB_VISUAL_CLASS_STATIC_GRAY,
      XCB_VISUAL_CLASS_GRAY_SCALE,
      XCB_VISUAL_CLASS_STATIC_COLOR,
      XCB_VISUAL_CLASS_PSEUDO_COLOR,
      XCB_VISUAL_CLASS_TRUE_COLOR,
      XCB_VISUAL_CLASS_DIRECT_COLOR)
   with Convention => C;  -- /usr/include/xcb/xproto.h:290

  --*
  -- * @brief xcb_visualtype_t
  -- * 

   type xcb_visualtype_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_visualtype_t is record
      visual_id : aliased xcb_visualid_t;  -- /usr/include/xcb/xproto.h:303
      u_class : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:304
      bits_per_rgb_value : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:305
      colormap_entries : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:306
      red_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:307
      green_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:308
      blue_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:309
      pad0 : aliased xcb_visualtype_t_array1791;  -- /usr/include/xcb/xproto.h:310
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:302

  --*
  -- * @brief xcb_visualtype_iterator_t
  -- * 

   type xcb_visualtype_iterator_t is record
      data : access xcb_visualtype_t;  -- /usr/include/xcb/xproto.h:317
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:318
      index : aliased int;  -- /usr/include/xcb/xproto.h:319
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:316

  --*
  -- * @brief xcb_depth_t
  -- * 

   type xcb_depth_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_depth_t is record
      depth : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:326
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:327
      visuals_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:328
      pad1 : aliased xcb_depth_t_array1791;  -- /usr/include/xcb/xproto.h:329
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:325

  --*
  -- * @brief xcb_depth_iterator_t
  -- * 

   type xcb_depth_iterator_t is record
      data : access xcb_depth_t;  -- /usr/include/xcb/xproto.h:336
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:337
      index : aliased int;  -- /usr/include/xcb/xproto.h:338
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:335

   subtype xcb_event_mask_t is unsigned;
   XCB_EVENT_MASK_NO_EVENT : constant unsigned := 0;
   XCB_EVENT_MASK_KEY_PRESS : constant unsigned := 1;
   XCB_EVENT_MASK_KEY_RELEASE : constant unsigned := 2;
   XCB_EVENT_MASK_BUTTON_PRESS : constant unsigned := 4;
   XCB_EVENT_MASK_BUTTON_RELEASE : constant unsigned := 8;
   XCB_EVENT_MASK_ENTER_WINDOW : constant unsigned := 16;
   XCB_EVENT_MASK_LEAVE_WINDOW : constant unsigned := 32;
   XCB_EVENT_MASK_POINTER_MOTION : constant unsigned := 64;
   XCB_EVENT_MASK_POINTER_MOTION_HINT : constant unsigned := 128;
   XCB_EVENT_MASK_BUTTON_1_MOTION : constant unsigned := 256;
   XCB_EVENT_MASK_BUTTON_2_MOTION : constant unsigned := 512;
   XCB_EVENT_MASK_BUTTON_3_MOTION : constant unsigned := 1024;
   XCB_EVENT_MASK_BUTTON_4_MOTION : constant unsigned := 2048;
   XCB_EVENT_MASK_BUTTON_5_MOTION : constant unsigned := 4096;
   XCB_EVENT_MASK_BUTTON_MOTION : constant unsigned := 8192;
   XCB_EVENT_MASK_KEYMAP_STATE : constant unsigned := 16384;
   XCB_EVENT_MASK_EXPOSURE : constant unsigned := 32768;
   XCB_EVENT_MASK_VISIBILITY_CHANGE : constant unsigned := 65536;
   XCB_EVENT_MASK_STRUCTURE_NOTIFY : constant unsigned := 131072;
   XCB_EVENT_MASK_RESIZE_REDIRECT : constant unsigned := 262144;
   XCB_EVENT_MASK_SUBSTRUCTURE_NOTIFY : constant unsigned := 524288;
   XCB_EVENT_MASK_SUBSTRUCTURE_REDIRECT : constant unsigned := 1048576;
   XCB_EVENT_MASK_FOCUS_CHANGE : constant unsigned := 2097152;
   XCB_EVENT_MASK_PROPERTY_CHANGE : constant unsigned := 4194304;
   XCB_EVENT_MASK_COLOR_MAP_CHANGE : constant unsigned := 8388608;
   XCB_EVENT_MASK_OWNER_GRAB_BUTTON : constant unsigned := 16777216;  -- /usr/include/xcb/xproto.h:341

   type xcb_backing_store_t is 
     (XCB_BACKING_STORE_NOT_USEFUL,
      XCB_BACKING_STORE_WHEN_MAPPED,
      XCB_BACKING_STORE_ALWAYS)
   with Convention => C;  -- /usr/include/xcb/xproto.h:370

  --*
  -- * @brief xcb_screen_t
  -- * 

   type xcb_screen_t is record
      root : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:380
      default_colormap : aliased xcb_colormap_t;  -- /usr/include/xcb/xproto.h:381
      white_pixel : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:382
      black_pixel : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:383
      current_input_masks : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:384
      width_in_pixels : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:385
      height_in_pixels : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:386
      width_in_millimeters : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:387
      height_in_millimeters : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:388
      min_installed_maps : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:389
      max_installed_maps : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:390
      root_visual : aliased xcb_visualid_t;  -- /usr/include/xcb/xproto.h:391
      backing_stores : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:392
      save_unders : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:393
      root_depth : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:394
      allowed_depths_len : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:395
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:379

  --*
  -- * @brief xcb_screen_iterator_t
  -- * 

   type xcb_screen_iterator_t is record
      data : access xcb_screen_t;  -- /usr/include/xcb/xproto.h:402
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:403
      index : aliased int;  -- /usr/include/xcb/xproto.h:404
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:401

  --*
  -- * @brief xcb_setup_request_t
  -- * 

   type xcb_setup_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_setup_request_t is record
      byte_order : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:411
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:412
      protocol_major_version : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:413
      protocol_minor_version : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:414
      authorization_protocol_name_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:415
      authorization_protocol_data_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:416
      pad1 : aliased xcb_setup_request_t_array1823;  -- /usr/include/xcb/xproto.h:417
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:410

  --*
  -- * @brief xcb_setup_request_iterator_t
  -- * 

   type xcb_setup_request_iterator_t is record
      data : access xcb_setup_request_t;  -- /usr/include/xcb/xproto.h:424
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:425
      index : aliased int;  -- /usr/include/xcb/xproto.h:426
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:423

  --*
  -- * @brief xcb_setup_failed_t
  -- * 

   type xcb_setup_failed_t is record
      status : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:433
      reason_len : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:434
      protocol_major_version : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:435
      protocol_minor_version : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:436
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:437
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:432

  --*
  -- * @brief xcb_setup_failed_iterator_t
  -- * 

   type xcb_setup_failed_iterator_t is record
      data : access xcb_setup_failed_t;  -- /usr/include/xcb/xproto.h:444
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:445
      index : aliased int;  -- /usr/include/xcb/xproto.h:446
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:443

  --*
  -- * @brief xcb_setup_authenticate_t
  -- * 

   type xcb_setup_authenticate_t_array1778 is array (0 .. 4) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_setup_authenticate_t is record
      status : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:453
      pad0 : aliased xcb_setup_authenticate_t_array1778;  -- /usr/include/xcb/xproto.h:454
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:455
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:452

  --*
  -- * @brief xcb_setup_authenticate_iterator_t
  -- * 

   type xcb_setup_authenticate_iterator_t is record
      data : access xcb_setup_authenticate_t;  -- /usr/include/xcb/xproto.h:462
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:463
      index : aliased int;  -- /usr/include/xcb/xproto.h:464
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:461

   type xcb_image_order_t is 
     (XCB_IMAGE_ORDER_LSB_FIRST,
      XCB_IMAGE_ORDER_MSB_FIRST)
   with Convention => C;  -- /usr/include/xcb/xproto.h:467

  --*
  -- * @brief xcb_setup_t
  -- * 

   type xcb_setup_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_setup_t is record
      status : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:476
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:477
      protocol_major_version : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:478
      protocol_minor_version : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:479
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:480
      release_number : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:481
      resource_id_base : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:482
      resource_id_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:483
      motion_buffer_size : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:484
      vendor_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:485
      maximum_request_length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:486
      roots_len : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:487
      pixmap_formats_len : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:488
      image_byte_order : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:489
      bitmap_format_bit_order : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:490
      bitmap_format_scanline_unit : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:491
      bitmap_format_scanline_pad : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:492
      min_keycode : aliased xcb_keycode_t;  -- /usr/include/xcb/xproto.h:493
      max_keycode : aliased xcb_keycode_t;  -- /usr/include/xcb/xproto.h:494
      pad1 : aliased xcb_setup_t_array1791;  -- /usr/include/xcb/xproto.h:495
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:475

  --*
  -- * @brief xcb_setup_iterator_t
  -- * 

   type xcb_setup_iterator_t is record
      data : access xcb_setup_t;  -- /usr/include/xcb/xproto.h:502
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:503
      index : aliased int;  -- /usr/include/xcb/xproto.h:504
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:501

   subtype xcb_mod_mask_t is unsigned;
   XCB_MOD_MASK_SHIFT : constant unsigned := 1;
   XCB_MOD_MASK_LOCK : constant unsigned := 2;
   XCB_MOD_MASK_CONTROL : constant unsigned := 4;
   XCB_MOD_MASK_1 : constant unsigned := 8;
   XCB_MOD_MASK_2 : constant unsigned := 16;
   XCB_MOD_MASK_3 : constant unsigned := 32;
   XCB_MOD_MASK_4 : constant unsigned := 64;
   XCB_MOD_MASK_5 : constant unsigned := 128;
   XCB_MOD_MASK_ANY : constant unsigned := 32768;  -- /usr/include/xcb/xproto.h:507

   subtype xcb_key_but_mask_t is unsigned;
   XCB_KEY_BUT_MASK_SHIFT : constant unsigned := 1;
   XCB_KEY_BUT_MASK_LOCK : constant unsigned := 2;
   XCB_KEY_BUT_MASK_CONTROL : constant unsigned := 4;
   XCB_KEY_BUT_MASK_MOD_1 : constant unsigned := 8;
   XCB_KEY_BUT_MASK_MOD_2 : constant unsigned := 16;
   XCB_KEY_BUT_MASK_MOD_3 : constant unsigned := 32;
   XCB_KEY_BUT_MASK_MOD_4 : constant unsigned := 64;
   XCB_KEY_BUT_MASK_MOD_5 : constant unsigned := 128;
   XCB_KEY_BUT_MASK_BUTTON_1 : constant unsigned := 256;
   XCB_KEY_BUT_MASK_BUTTON_2 : constant unsigned := 512;
   XCB_KEY_BUT_MASK_BUTTON_3 : constant unsigned := 1024;
   XCB_KEY_BUT_MASK_BUTTON_4 : constant unsigned := 2048;
   XCB_KEY_BUT_MASK_BUTTON_5 : constant unsigned := 4096;  -- /usr/include/xcb/xproto.h:519

   type xcb_window_enum_t is 
     (XCB_WINDOW_NONE)
   with Convention => C;  -- /usr/include/xcb/xproto.h:535

  --* Opcode for xcb_key_press.  
  --*
  -- * @brief xcb_key_press_event_t
  -- * 

   type xcb_key_press_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:546
      detail : aliased xcb_keycode_t;  -- /usr/include/xcb/xproto.h:547
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:548
      time : aliased xcb_timestamp_t;  -- /usr/include/xcb/xproto.h:549
      root : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:550
      event : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:551
      child : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:552
      root_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:553
      root_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:554
      event_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:555
      event_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:556
      state : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:557
      same_screen : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:558
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:559
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:545

  --* Opcode for xcb_key_release.  
   subtype xcb_key_release_event_t is xcb_key_press_event_t;  -- /usr/include/xcb/xproto.h:565

   subtype xcb_button_mask_t is unsigned;
   XCB_BUTTON_MASK_1 : constant unsigned := 256;
   XCB_BUTTON_MASK_2 : constant unsigned := 512;
   XCB_BUTTON_MASK_3 : constant unsigned := 1024;
   XCB_BUTTON_MASK_4 : constant unsigned := 2048;
   XCB_BUTTON_MASK_5 : constant unsigned := 4096;
   XCB_BUTTON_MASK_ANY : constant unsigned := 32768;  -- /usr/include/xcb/xproto.h:567

  --* Opcode for xcb_button_press.  
  --*
  -- * @brief xcb_button_press_event_t
  -- * 

   type xcb_button_press_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:583
      detail : aliased xcb_button_t;  -- /usr/include/xcb/xproto.h:584
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:585
      time : aliased xcb_timestamp_t;  -- /usr/include/xcb/xproto.h:586
      root : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:587
      event : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:588
      child : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:589
      root_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:590
      root_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:591
      event_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:592
      event_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:593
      state : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:594
      same_screen : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:595
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:596
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:582

  --* Opcode for xcb_button_release.  
   subtype xcb_button_release_event_t is xcb_button_press_event_t;  -- /usr/include/xcb/xproto.h:602

   type xcb_motion_t is 
     (XCB_MOTION_NORMAL,
      XCB_MOTION_HINT)
   with Convention => C;  -- /usr/include/xcb/xproto.h:604

  --* Opcode for xcb_motion_notify.  
  --*
  -- * @brief xcb_motion_notify_event_t
  -- * 

   type xcb_motion_notify_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:616
      detail : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:617
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:618
      time : aliased xcb_timestamp_t;  -- /usr/include/xcb/xproto.h:619
      root : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:620
      event : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:621
      child : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:622
      root_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:623
      root_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:624
      event_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:625
      event_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:626
      state : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:627
      same_screen : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:628
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:629
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:615

   type xcb_notify_detail_t is 
     (XCB_NOTIFY_DETAIL_ANCESTOR,
      XCB_NOTIFY_DETAIL_VIRTUAL,
      XCB_NOTIFY_DETAIL_INFERIOR,
      XCB_NOTIFY_DETAIL_NONLINEAR,
      XCB_NOTIFY_DETAIL_NONLINEAR_VIRTUAL,
      XCB_NOTIFY_DETAIL_POINTER,
      XCB_NOTIFY_DETAIL_POINTER_ROOT,
      XCB_NOTIFY_DETAIL_NONE)
   with Convention => C;  -- /usr/include/xcb/xproto.h:632

   type xcb_notify_mode_t is 
     (XCB_NOTIFY_MODE_NORMAL,
      XCB_NOTIFY_MODE_GRAB,
      XCB_NOTIFY_MODE_UNGRAB,
      XCB_NOTIFY_MODE_WHILE_GRABBED)
   with Convention => C;  -- /usr/include/xcb/xproto.h:643

  --* Opcode for xcb_enter_notify.  
  --*
  -- * @brief xcb_enter_notify_event_t
  -- * 

   type xcb_enter_notify_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:657
      detail : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:658
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:659
      time : aliased xcb_timestamp_t;  -- /usr/include/xcb/xproto.h:660
      root : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:661
      event : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:662
      child : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:663
      root_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:664
      root_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:665
      event_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:666
      event_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:667
      state : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:668
      mode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:669
      same_screen_focus : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:670
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:656

  --* Opcode for xcb_leave_notify.  
   subtype xcb_leave_notify_event_t is xcb_enter_notify_event_t;  -- /usr/include/xcb/xproto.h:676

  --* Opcode for xcb_focus_in.  
  --*
  -- * @brief xcb_focus_in_event_t
  -- * 

   type xcb_focus_in_event_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_focus_in_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:685
      detail : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:686
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:687
      event : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:688
      mode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:689
      pad0 : aliased xcb_focus_in_event_t_array1897;  -- /usr/include/xcb/xproto.h:690
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:684

  --* Opcode for xcb_focus_out.  
   subtype xcb_focus_out_event_t is xcb_focus_in_event_t;  -- /usr/include/xcb/xproto.h:696

  --* Opcode for xcb_keymap_notify.  
  --*
  -- * @brief xcb_keymap_notify_event_t
  -- * 

   type xcb_keymap_notify_event_t_array1904 is array (0 .. 30) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_keymap_notify_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:705
      keys : aliased xcb_keymap_notify_event_t_array1904;  -- /usr/include/xcb/xproto.h:706
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:704

  --* Opcode for xcb_expose.  
  --*
  -- * @brief xcb_expose_event_t
  -- * 

   type xcb_expose_event_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_expose_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:716
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:717
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:718
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:719
      x : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:720
      y : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:721
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:722
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:723
      count : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:724
      pad1 : aliased xcb_expose_event_t_array1823;  -- /usr/include/xcb/xproto.h:725
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:715

  --* Opcode for xcb_graphics_exposure.  
  --*
  -- * @brief xcb_graphics_exposure_event_t
  -- * 

   type xcb_graphics_exposure_event_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_graphics_exposure_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:735
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:736
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:737
      drawable : aliased xcb_drawable_t;  -- /usr/include/xcb/xproto.h:738
      x : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:739
      y : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:740
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:741
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:742
      minor_opcode : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:743
      count : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:744
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:745
      pad1 : aliased xcb_graphics_exposure_event_t_array1897;  -- /usr/include/xcb/xproto.h:746
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:734

  --* Opcode for xcb_no_exposure.  
  --*
  -- * @brief xcb_no_exposure_event_t
  -- * 

   type xcb_no_exposure_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:756
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:757
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:758
      drawable : aliased xcb_drawable_t;  -- /usr/include/xcb/xproto.h:759
      minor_opcode : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:760
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:761
      pad1 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:762
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:755

   type xcb_visibility_t is 
     (XCB_VISIBILITY_UNOBSCURED,
      XCB_VISIBILITY_PARTIALLY_OBSCURED,
      XCB_VISIBILITY_FULLY_OBSCURED)
   with Convention => C;  -- /usr/include/xcb/xproto.h:765

  --* Opcode for xcb_visibility_notify.  
  --*
  -- * @brief xcb_visibility_notify_event_t
  -- * 

   type xcb_visibility_notify_event_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_visibility_notify_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:778
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:779
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:780
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:781
      state : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:782
      pad1 : aliased xcb_visibility_notify_event_t_array1897;  -- /usr/include/xcb/xproto.h:783
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:777

  --* Opcode for xcb_create_notify.  
  --*
  -- * @brief xcb_create_notify_event_t
  -- * 

   type xcb_create_notify_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:793
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:794
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:795
      parent : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:796
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:797
      x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:798
      y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:799
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:800
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:801
      border_width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:802
      override_redirect : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:803
      pad1 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:804
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:792

  --* Opcode for xcb_destroy_notify.  
  --*
  -- * @brief xcb_destroy_notify_event_t
  -- * 

   type xcb_destroy_notify_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:814
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:815
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:816
      event : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:817
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:818
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:813

  --* Opcode for xcb_unmap_notify.  
  --*
  -- * @brief xcb_unmap_notify_event_t
  -- * 

   type xcb_unmap_notify_event_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_unmap_notify_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:828
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:829
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:830
      event : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:831
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:832
      from_configure : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:833
      pad1 : aliased xcb_unmap_notify_event_t_array1897;  -- /usr/include/xcb/xproto.h:834
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:827

  --* Opcode for xcb_map_notify.  
  --*
  -- * @brief xcb_map_notify_event_t
  -- * 

   type xcb_map_notify_event_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_map_notify_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:844
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:845
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:846
      event : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:847
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:848
      override_redirect : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:849
      pad1 : aliased xcb_map_notify_event_t_array1897;  -- /usr/include/xcb/xproto.h:850
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:843

  --* Opcode for xcb_map_request.  
  --*
  -- * @brief xcb_map_request_event_t
  -- * 

   type xcb_map_request_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:860
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:861
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:862
      parent : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:863
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:864
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:859

  --* Opcode for xcb_reparent_notify.  
  --*
  -- * @brief xcb_reparent_notify_event_t
  -- * 

   type xcb_reparent_notify_event_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_reparent_notify_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:874
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:875
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:876
      event : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:877
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:878
      parent : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:879
      x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:880
      y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:881
      override_redirect : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:882
      pad1 : aliased xcb_reparent_notify_event_t_array1897;  -- /usr/include/xcb/xproto.h:883
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:873

  --* Opcode for xcb_configure_notify.  
  --*
  -- * @brief xcb_configure_notify_event_t
  -- * 

   type xcb_configure_notify_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:893
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:894
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:895
      event : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:896
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:897
      above_sibling : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:898
      x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:899
      y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:900
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:901
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:902
      border_width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:903
      override_redirect : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:904
      pad1 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:905
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:892

  --* Opcode for xcb_configure_request.  
  --*
  -- * @brief xcb_configure_request_event_t
  -- * 

   type xcb_configure_request_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:915
      stack_mode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:916
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:917
      parent : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:918
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:919
      sibling : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:920
      x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:921
      y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:922
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:923
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:924
      border_width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:925
      value_mask : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:926
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:914

  --* Opcode for xcb_gravity_notify.  
  --*
  -- * @brief xcb_gravity_notify_event_t
  -- * 

   type xcb_gravity_notify_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:936
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:937
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:938
      event : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:939
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:940
      x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:941
      y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:942
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:935

  --* Opcode for xcb_resize_request.  
  --*
  -- * @brief xcb_resize_request_event_t
  -- * 

   type xcb_resize_request_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:952
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:953
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:954
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:955
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:956
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:957
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:951

   type xcb_place_t is 
     (XCB_PLACE_ON_TOP,
      XCB_PLACE_ON_BOTTOM)
   with Convention => C;  -- /usr/include/xcb/xproto.h:960

  --*< The window is now on top of all siblings.  
  --*< The window is now below all siblings.  
  --* Opcode for xcb_circulate_notify.  
  --*
  -- * @brief xcb_circulate_notify_event_t
  -- * 

   type xcb_circulate_notify_event_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_circulate_notify_event_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_circulate_notify_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:976
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:977
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:978
      event : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:979
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:980
      pad1 : aliased xcb_circulate_notify_event_t_array1791;  -- /usr/include/xcb/xproto.h:981
      place : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:982
      pad2 : aliased xcb_circulate_notify_event_t_array1897;  -- /usr/include/xcb/xproto.h:983
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:975

  --* Opcode for xcb_circulate_request.  
   subtype xcb_circulate_request_event_t is xcb_circulate_notify_event_t;  -- /usr/include/xcb/xproto.h:989

   type xcb_property_t is 
     (XCB_PROPERTY_NEW_VALUE,
      XCB_PROPERTY_DELETE)
   with Convention => C;  -- /usr/include/xcb/xproto.h:991

  --* Opcode for xcb_property_notify.  
  --*
  -- * @brief xcb_property_notify_event_t
  -- * 

   type xcb_property_notify_event_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_property_notify_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1003
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1004
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1005
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1006
      atom : aliased xcb_atom_t;  -- /usr/include/xcb/xproto.h:1007
      time : aliased xcb_timestamp_t;  -- /usr/include/xcb/xproto.h:1008
      state : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1009
      pad1 : aliased xcb_property_notify_event_t_array1897;  -- /usr/include/xcb/xproto.h:1010
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1002

  --* Opcode for xcb_selection_clear.  
  --*
  -- * @brief xcb_selection_clear_event_t
  -- * 

   type xcb_selection_clear_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1020
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1021
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1022
      time : aliased xcb_timestamp_t;  -- /usr/include/xcb/xproto.h:1023
      owner : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1024
      selection : aliased xcb_atom_t;  -- /usr/include/xcb/xproto.h:1025
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1019

   type xcb_time_t is 
     (XCB_TIME_CURRENT_TIME)
   with Convention => C;  -- /usr/include/xcb/xproto.h:1028

   subtype xcb_atom_enum_t is unsigned;
   XCB_ATOM_NONE : constant unsigned := 0;
   XCB_ATOM_ANY : constant unsigned := 0;
   XCB_ATOM_PRIMARY : constant unsigned := 1;
   XCB_ATOM_SECONDARY : constant unsigned := 2;
   XCB_ATOM_ARC : constant unsigned := 3;
   XCB_ATOM_ATOM : constant unsigned := 4;
   XCB_ATOM_BITMAP : constant unsigned := 5;
   XCB_ATOM_CARDINAL : constant unsigned := 6;
   XCB_ATOM_COLORMAP : constant unsigned := 7;
   XCB_ATOM_CURSOR : constant unsigned := 8;
   XCB_ATOM_CUT_BUFFER0 : constant unsigned := 9;
   XCB_ATOM_CUT_BUFFER1 : constant unsigned := 10;
   XCB_ATOM_CUT_BUFFER2 : constant unsigned := 11;
   XCB_ATOM_CUT_BUFFER3 : constant unsigned := 12;
   XCB_ATOM_CUT_BUFFER4 : constant unsigned := 13;
   XCB_ATOM_CUT_BUFFER5 : constant unsigned := 14;
   XCB_ATOM_CUT_BUFFER6 : constant unsigned := 15;
   XCB_ATOM_CUT_BUFFER7 : constant unsigned := 16;
   XCB_ATOM_DRAWABLE : constant unsigned := 17;
   XCB_ATOM_FONT : constant unsigned := 18;
   XCB_ATOM_INTEGER : constant unsigned := 19;
   XCB_ATOM_PIXMAP : constant unsigned := 20;
   XCB_ATOM_POINT : constant unsigned := 21;
   XCB_ATOM_RECTANGLE : constant unsigned := 22;
   XCB_ATOM_RESOURCE_MANAGER : constant unsigned := 23;
   XCB_ATOM_RGB_COLOR_MAP : constant unsigned := 24;
   XCB_ATOM_RGB_BEST_MAP : constant unsigned := 25;
   XCB_ATOM_RGB_BLUE_MAP : constant unsigned := 26;
   XCB_ATOM_RGB_DEFAULT_MAP : constant unsigned := 27;
   XCB_ATOM_RGB_GRAY_MAP : constant unsigned := 28;
   XCB_ATOM_RGB_GREEN_MAP : constant unsigned := 29;
   XCB_ATOM_RGB_RED_MAP : constant unsigned := 30;
   XCB_ATOM_STRING : constant unsigned := 31;
   XCB_ATOM_VISUALID : constant unsigned := 32;
   XCB_ATOM_WINDOW : constant unsigned := 33;
   XCB_ATOM_WM_COMMAND : constant unsigned := 34;
   XCB_ATOM_WM_HINTS : constant unsigned := 35;
   XCB_ATOM_WM_CLIENT_MACHINE : constant unsigned := 36;
   XCB_ATOM_WM_ICON_NAME : constant unsigned := 37;
   XCB_ATOM_WM_ICON_SIZE : constant unsigned := 38;
   XCB_ATOM_WM_NAME : constant unsigned := 39;
   XCB_ATOM_WM_NORMAL_HINTS : constant unsigned := 40;
   XCB_ATOM_WM_SIZE_HINTS : constant unsigned := 41;
   XCB_ATOM_WM_ZOOM_HINTS : constant unsigned := 42;
   XCB_ATOM_MIN_SPACE : constant unsigned := 43;
   XCB_ATOM_NORM_SPACE : constant unsigned := 44;
   XCB_ATOM_MAX_SPACE : constant unsigned := 45;
   XCB_ATOM_END_SPACE : constant unsigned := 46;
   XCB_ATOM_SUPERSCRIPT_X : constant unsigned := 47;
   XCB_ATOM_SUPERSCRIPT_Y : constant unsigned := 48;
   XCB_ATOM_SUBSCRIPT_X : constant unsigned := 49;
   XCB_ATOM_SUBSCRIPT_Y : constant unsigned := 50;
   XCB_ATOM_UNDERLINE_POSITION : constant unsigned := 51;
   XCB_ATOM_UNDERLINE_THICKNESS : constant unsigned := 52;
   XCB_ATOM_STRIKEOUT_ASCENT : constant unsigned := 53;
   XCB_ATOM_STRIKEOUT_DESCENT : constant unsigned := 54;
   XCB_ATOM_ITALIC_ANGLE : constant unsigned := 55;
   XCB_ATOM_X_HEIGHT : constant unsigned := 56;
   XCB_ATOM_QUAD_WIDTH : constant unsigned := 57;
   XCB_ATOM_WEIGHT : constant unsigned := 58;
   XCB_ATOM_POINT_SIZE : constant unsigned := 59;
   XCB_ATOM_RESOLUTION : constant unsigned := 60;
   XCB_ATOM_COPYRIGHT : constant unsigned := 61;
   XCB_ATOM_NOTICE : constant unsigned := 62;
   XCB_ATOM_FONT_NAME : constant unsigned := 63;
   XCB_ATOM_FAMILY_NAME : constant unsigned := 64;
   XCB_ATOM_FULL_NAME : constant unsigned := 65;
   XCB_ATOM_CAP_HEIGHT : constant unsigned := 66;
   XCB_ATOM_WM_CLASS : constant unsigned := 67;
   XCB_ATOM_WM_TRANSIENT_FOR : constant unsigned := 68;  -- /usr/include/xcb/xproto.h:1032

  --* Opcode for xcb_selection_request.  
  --*
  -- * @brief xcb_selection_request_event_t
  -- * 

   type xcb_selection_request_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1112
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1113
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1114
      time : aliased xcb_timestamp_t;  -- /usr/include/xcb/xproto.h:1115
      owner : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1116
      requestor : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1117
      selection : aliased xcb_atom_t;  -- /usr/include/xcb/xproto.h:1118
      target : aliased xcb_atom_t;  -- /usr/include/xcb/xproto.h:1119
      property : aliased xcb_atom_t;  -- /usr/include/xcb/xproto.h:1120
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1111

  --* Opcode for xcb_selection_notify.  
  --*
  -- * @brief xcb_selection_notify_event_t
  -- * 

   type xcb_selection_notify_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1130
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1131
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1132
      time : aliased xcb_timestamp_t;  -- /usr/include/xcb/xproto.h:1133
      requestor : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1134
      selection : aliased xcb_atom_t;  -- /usr/include/xcb/xproto.h:1135
      target : aliased xcb_atom_t;  -- /usr/include/xcb/xproto.h:1136
      property : aliased xcb_atom_t;  -- /usr/include/xcb/xproto.h:1137
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1129

   type xcb_colormap_state_t is 
     (XCB_COLORMAP_STATE_UNINSTALLED,
      XCB_COLORMAP_STATE_INSTALLED)
   with Convention => C;  -- /usr/include/xcb/xproto.h:1140

  --*< The colormap was uninstalled.  
  --*< The colormap was installed.  
   type xcb_colormap_enum_t is 
     (XCB_COLORMAP_NONE)
   with Convention => C;  -- /usr/include/xcb/xproto.h:1149

  --* Opcode for xcb_colormap_notify.  
  --*
  -- * @brief xcb_colormap_notify_event_t
  -- * 

   type xcb_colormap_notify_event_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_colormap_notify_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1160
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1161
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1162
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1163
      colormap : aliased xcb_colormap_t;  -- /usr/include/xcb/xproto.h:1164
      u_new : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1165
      state : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1166
      pad1 : aliased xcb_colormap_notify_event_t_array1823;  -- /usr/include/xcb/xproto.h:1167
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1159

  --*
  -- * @brief xcb_client_message_data_t
  -- * 

   type xcb_client_message_data_t_array1992 is array (0 .. 19) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_client_message_data_t_array1995 is array (0 .. 9) of aliased bits_stdint_uintn_h.uint16_t;
   type xcb_client_message_data_t_array1657 is array (0 .. 4) of aliased bits_stdint_uintn_h.uint32_t;
   type xcb_client_message_data_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            data8 : aliased xcb_client_message_data_t_array1992;  -- /usr/include/xcb/xproto.h:1174
         when 1 =>
            data16 : aliased xcb_client_message_data_t_array1995;  -- /usr/include/xcb/xproto.h:1175
         when others =>
            data32 : aliased xcb_client_message_data_t_array1657;  -- /usr/include/xcb/xproto.h:1176
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- /usr/include/xcb/xproto.h:1173

  --*
  -- * @brief xcb_client_message_data_iterator_t
  -- * 

   type xcb_client_message_data_iterator_t is record
      data : access xcb_client_message_data_t;  -- /usr/include/xcb/xproto.h:1183
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:1184
      index : aliased int;  -- /usr/include/xcb/xproto.h:1185
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1182

  --* Opcode for xcb_client_message.  
  --*
  -- * @brief xcb_client_message_event_t
  -- * 

   type xcb_client_message_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1195
      format : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1196
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1197
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1198
      c_type : aliased xcb_atom_t;  -- /usr/include/xcb/xproto.h:1199
      data : aliased xcb_client_message_data_t;  -- /usr/include/xcb/xproto.h:1200
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1194

   type xcb_mapping_t is 
     (XCB_MAPPING_MODIFIER,
      XCB_MAPPING_KEYBOARD,
      XCB_MAPPING_POINTER)
   with Convention => C;  -- /usr/include/xcb/xproto.h:1203

  --* Opcode for xcb_mapping_notify.  
  --*
  -- * @brief xcb_mapping_notify_event_t
  -- * 

   type xcb_mapping_notify_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1216
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1217
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1218
      request : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1219
      first_keycode : aliased xcb_keycode_t;  -- /usr/include/xcb/xproto.h:1220
      count : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1221
      pad1 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1222
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1215

  --* Opcode for xcb_ge_generic.  
  --*
  -- * @brief xcb_ge_generic_event_t
  -- * 

   type xcb_ge_generic_event_t_array2015 is array (0 .. 21) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_ge_generic_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1232
      extension : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1233
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1234
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1235
      event_type : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1236
      pad0 : aliased xcb_ge_generic_event_t_array2015;  -- /usr/include/xcb/xproto.h:1237
      full_sequence : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1238
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1231

  --* Opcode for xcb_request.  
  --*
  -- * @brief xcb_request_error_t
  -- * 

   type xcb_request_error_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1248
      error_code : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1249
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1250
      bad_value : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1251
      minor_opcode : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1252
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1253
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1254
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1247

  --* Opcode for xcb_value.  
  --*
  -- * @brief xcb_value_error_t
  -- * 

   type xcb_value_error_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1264
      error_code : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1265
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1266
      bad_value : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1267
      minor_opcode : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1268
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1269
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1270
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1263

  --* Opcode for xcb_window.  
   subtype xcb_window_error_t is xcb_value_error_t;  -- /usr/include/xcb/xproto.h:1276

  --* Opcode for xcb_pixmap.  
   subtype xcb_pixmap_error_t is xcb_value_error_t;  -- /usr/include/xcb/xproto.h:1281

  --* Opcode for xcb_atom.  
   subtype xcb_atom_error_t is xcb_value_error_t;  -- /usr/include/xcb/xproto.h:1286

  --* Opcode for xcb_cursor.  
   subtype xcb_cursor_error_t is xcb_value_error_t;  -- /usr/include/xcb/xproto.h:1291

  --* Opcode for xcb_font.  
   subtype xcb_font_error_t is xcb_value_error_t;  -- /usr/include/xcb/xproto.h:1296

  --* Opcode for xcb_match.  
   subtype xcb_match_error_t is xcb_request_error_t;  -- /usr/include/xcb/xproto.h:1301

  --* Opcode for xcb_drawable.  
   subtype xcb_drawable_error_t is xcb_value_error_t;  -- /usr/include/xcb/xproto.h:1306

  --* Opcode for xcb_access.  
   subtype xcb_access_error_t is xcb_request_error_t;  -- /usr/include/xcb/xproto.h:1311

  --* Opcode for xcb_alloc.  
   subtype xcb_alloc_error_t is xcb_request_error_t;  -- /usr/include/xcb/xproto.h:1316

  --* Opcode for xcb_colormap.  
   subtype xcb_colormap_error_t is xcb_value_error_t;  -- /usr/include/xcb/xproto.h:1321

  --* Opcode for xcb_g_context.  
   subtype xcb_g_context_error_t is xcb_value_error_t;  -- /usr/include/xcb/xproto.h:1326

  --* Opcode for xcb_id_choice.  
   subtype xcb_id_choice_error_t is xcb_value_error_t;  -- /usr/include/xcb/xproto.h:1331

  --* Opcode for xcb_name.  
   subtype xcb_name_error_t is xcb_request_error_t;  -- /usr/include/xcb/xproto.h:1336

  --* Opcode for xcb_length.  
   subtype xcb_length_error_t is xcb_request_error_t;  -- /usr/include/xcb/xproto.h:1341

  --* Opcode for xcb_implementation.  
   subtype xcb_implementation_error_t is xcb_request_error_t;  -- /usr/include/xcb/xproto.h:1346

   type xcb_window_class_t is 
     (XCB_WINDOW_CLASS_COPY_FROM_PARENT,
      XCB_WINDOW_CLASS_INPUT_OUTPUT,
      XCB_WINDOW_CLASS_INPUT_ONLY)
   with Convention => C;  -- /usr/include/xcb/xproto.h:1348

   subtype xcb_cw_t is unsigned;
   XCB_CW_BACK_PIXMAP : constant unsigned := 1;
   XCB_CW_BACK_PIXEL : constant unsigned := 2;
   XCB_CW_BORDER_PIXMAP : constant unsigned := 4;
   XCB_CW_BORDER_PIXEL : constant unsigned := 8;
   XCB_CW_BIT_GRAVITY : constant unsigned := 16;
   XCB_CW_WIN_GRAVITY : constant unsigned := 32;
   XCB_CW_BACKING_STORE : constant unsigned := 64;
   XCB_CW_BACKING_PLANES : constant unsigned := 128;
   XCB_CW_BACKING_PIXEL : constant unsigned := 256;
   XCB_CW_OVERRIDE_REDIRECT : constant unsigned := 512;
   XCB_CW_SAVE_UNDER : constant unsigned := 1024;
   XCB_CW_EVENT_MASK : constant unsigned := 2048;
   XCB_CW_DONT_PROPAGATE : constant unsigned := 4096;
   XCB_CW_COLORMAP : constant unsigned := 8192;
   XCB_CW_CURSOR : constant unsigned := 16384;  -- /usr/include/xcb/xproto.h:1354

  --*< Overrides the default background-pixmap. The background pixmap and window must
  --have the same root and same depth. Any size pixmap can be used, although some
  --sizes may be faster than others.
  --If `XCB_BACK_PIXMAP_NONE` is specified, the window has no defined background.
  --The server may fill the contents with the previous screen contents or with
  --contents of its own choosing.
  --If `XCB_BACK_PIXMAP_PARENT_RELATIVE` is specified, the parent's background is
  --used, but the window must have the same depth as the parent (or a Match error
  --results).   The parent's background is tracked, and the current version is
  --used each time the window background is required.  

  --*< Overrides `BackPixmap`. A pixmap of undefined size filled with the specified
  --background pixel is used for the background. Range-checking is not performed,
  --the background pixel is truncated to the appropriate number of bits.  

  --*< Overrides the default border-pixmap. The border pixmap and window must have the
  --same root and the same depth. Any size pixmap can be used, although some sizes
  --may be faster than others.
  --The special value `XCB_COPY_FROM_PARENT` means the parent's border pixmap is
  --copied (subsequent changes to the parent's border attribute do not affect the
  --child), but the window must have the same depth as the parent.  

  --*< Overrides `BorderPixmap`. A pixmap of undefined size filled with the specified
  --border pixel is used for the border. Range checking is not performed on the
  --border-pixel value, it is truncated to the appropriate number of bits.  

  --*< Defines which region of the window should be retained if the window is resized.  
  --*< Defines how the window should be repositioned if the parent is resized (see
  --`ConfigureWindow`).  

  --*< A backing-store of `WhenMapped` advises the server that maintaining contents of
  --obscured regions when the window is mapped would be beneficial. A backing-store
  --of `Always` advises the server that maintaining contents even when the window
  --is unmapped would be beneficial. In this case, the server may generate an
  --exposure event when the window is created. A value of `NotUseful` advises the
  --server that maintaining contents is unnecessary, although a server may still
  --choose to maintain contents while the window is mapped. Note that if the server
  --maintains contents, then the server should maintain complete contents not just
  --the region within the parent boundaries, even if the window is larger than its
  --parent. While the server maintains contents, exposure events will not normally
  --be generated, but the server may stop maintaining contents at any time.  

  --*< The backing-planes indicates (with bits set to 1) which bit planes of the
  --window hold dynamic data that must be preserved in backing-stores and during
  --save-unders.  

  --*< The backing-pixel specifies what value to use in planes not covered by
  --backing-planes. The server is free to save only the specified bit planes in the
  --backing-store or save-under and regenerate the remaining planes with the
  --specified pixel value. Any bits beyond the specified depth of the window in
  --these values are simply ignored.  

  --*< The override-redirect specifies whether map and configure requests on this
  --window should override a SubstructureRedirect on the parent, typically to
  --inform a window manager not to tamper with the window.  

  --*< If 1, the server is advised that when this window is mapped, saving the
  --contents of windows it obscures would be beneficial.  

  --*< The event-mask defines which events the client is interested in for this window
  --(or for some event types, inferiors of the window).  

  --*< The do-not-propagate-mask defines which events should not be propagated to
  --ancestor windows when no client has the event type selected in this window.  

  --*< The colormap specifies the colormap that best reflects the true colors of the window. Servers
  --capable of supporting multiple hardware colormaps may use this information, and window man-
  --agers may use it for InstallColormap requests. The colormap must have the same visual type
  --and root as the window (or a Match error results). If CopyFromParent is specified, the parent's
  --colormap is copied (subsequent changes to the parent's colormap attribute do not affect the child).
  --However, the window must have the same visual type as the parent (or a Match error results),
  --and the parent must not have a colormap of None (or a Match error results). For an explanation
  --of None, see FreeColormap request. The colormap is copied by sharing the colormap object
  --between the child and the parent, not by making a complete copy of the colormap contents.  

  --*< If a cursor is specified, it will be used whenever the pointer is in the window. If None is speci-
  --fied, the parent's cursor will be used when the pointer is in the window, and any change in the
  --parent's cursor will cause an immediate change in the displayed cursor.  

   type xcb_back_pixmap_t is 
     (XCB_BACK_PIXMAP_NONE,
      XCB_BACK_PIXMAP_PARENT_RELATIVE)
   with Convention => C;  -- /usr/include/xcb/xproto.h:1455

   subtype xcb_gravity_t is unsigned;
   XCB_GRAVITY_BIT_FORGET : constant unsigned := 0;
   XCB_GRAVITY_WIN_UNMAP : constant unsigned := 0;
   XCB_GRAVITY_NORTH_WEST : constant unsigned := 1;
   XCB_GRAVITY_NORTH : constant unsigned := 2;
   XCB_GRAVITY_NORTH_EAST : constant unsigned := 3;
   XCB_GRAVITY_WEST : constant unsigned := 4;
   XCB_GRAVITY_CENTER : constant unsigned := 5;
   XCB_GRAVITY_EAST : constant unsigned := 6;
   XCB_GRAVITY_SOUTH_WEST : constant unsigned := 7;
   XCB_GRAVITY_SOUTH : constant unsigned := 8;
   XCB_GRAVITY_SOUTH_EAST : constant unsigned := 9;
   XCB_GRAVITY_STATIC : constant unsigned := 10;  -- /usr/include/xcb/xproto.h:1460

  --*
  -- * @brief xcb_create_window_value_list_t
  -- * 

   type xcb_create_window_value_list_t is record
      background_pixmap : aliased xcb_pixmap_t;  -- /usr/include/xcb/xproto.h:1479
      background_pixel : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1480
      border_pixmap : aliased xcb_pixmap_t;  -- /usr/include/xcb/xproto.h:1481
      border_pixel : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1482
      bit_gravity : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1483
      win_gravity : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1484
      backing_store : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1485
      backing_planes : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1486
      backing_pixel : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1487
      override_redirect : aliased xcb_bool32_t;  -- /usr/include/xcb/xproto.h:1488
      save_under : aliased xcb_bool32_t;  -- /usr/include/xcb/xproto.h:1489
      event_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1490
      do_not_propogate_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1491
      colormap : aliased xcb_colormap_t;  -- /usr/include/xcb/xproto.h:1492
      cursor : aliased xcb_cursor_t;  -- /usr/include/xcb/xproto.h:1493
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1478

  --* Opcode for xcb_create_window.  
  --*
  -- * @brief xcb_create_window_request_t
  -- * 

   type xcb_create_window_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1503
      depth : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1504
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1505
      wid : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1506
      parent : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1507
      x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:1508
      y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:1509
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1510
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1511
      border_width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1512
      u_class : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1513
      visual : aliased xcb_visualid_t;  -- /usr/include/xcb/xproto.h:1514
      value_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1515
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1502

  --*
  -- * @brief xcb_change_window_attributes_value_list_t
  -- * 

   type xcb_change_window_attributes_value_list_t is record
      background_pixmap : aliased xcb_pixmap_t;  -- /usr/include/xcb/xproto.h:1522
      background_pixel : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1523
      border_pixmap : aliased xcb_pixmap_t;  -- /usr/include/xcb/xproto.h:1524
      border_pixel : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1525
      bit_gravity : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1526
      win_gravity : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1527
      backing_store : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1528
      backing_planes : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1529
      backing_pixel : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1530
      override_redirect : aliased xcb_bool32_t;  -- /usr/include/xcb/xproto.h:1531
      save_under : aliased xcb_bool32_t;  -- /usr/include/xcb/xproto.h:1532
      event_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1533
      do_not_propogate_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1534
      colormap : aliased xcb_colormap_t;  -- /usr/include/xcb/xproto.h:1535
      cursor : aliased xcb_cursor_t;  -- /usr/include/xcb/xproto.h:1536
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1521

  --* Opcode for xcb_change_window_attributes.  
  --*
  -- * @brief xcb_change_window_attributes_request_t
  -- * 

   type xcb_change_window_attributes_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1546
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1547
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1548
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1549
      value_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1550
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1545

   type xcb_map_state_t is 
     (XCB_MAP_STATE_UNMAPPED,
      XCB_MAP_STATE_UNVIEWABLE,
      XCB_MAP_STATE_VIEWABLE)
   with Convention => C;  -- /usr/include/xcb/xproto.h:1553

  --*
  -- * @brief xcb_get_window_attributes_cookie_t
  -- * 

   type xcb_get_window_attributes_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:1563
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1562

  --* Opcode for xcb_get_window_attributes.  
  --*
  -- * @brief xcb_get_window_attributes_request_t
  -- * 

   type xcb_get_window_attributes_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1573
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1574
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1575
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1576
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1572

  --*
  -- * @brief xcb_get_window_attributes_reply_t
  -- * 

   type xcb_get_window_attributes_reply_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_get_window_attributes_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1583
      backing_store : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1584
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1585
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1586
      visual : aliased xcb_visualid_t;  -- /usr/include/xcb/xproto.h:1587
      u_class : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1588
      bit_gravity : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1589
      win_gravity : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1590
      backing_planes : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1591
      backing_pixel : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1592
      save_under : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1593
      map_is_installed : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1594
      map_state : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1595
      override_redirect : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1596
      colormap : aliased xcb_colormap_t;  -- /usr/include/xcb/xproto.h:1597
      all_event_masks : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1598
      your_event_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1599
      do_not_propagate_mask : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1600
      pad0 : aliased xcb_get_window_attributes_reply_t_array1823;  -- /usr/include/xcb/xproto.h:1601
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1582

  --* Opcode for xcb_destroy_window.  
  --*
  -- * @brief xcb_destroy_window_request_t
  -- * 

   type xcb_destroy_window_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1611
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1612
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1613
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1614
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1610

  --* Opcode for xcb_destroy_subwindows.  
  --*
  -- * @brief xcb_destroy_subwindows_request_t
  -- * 

   type xcb_destroy_subwindows_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1624
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1625
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1626
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1627
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1623

   type xcb_set_mode_t is 
     (XCB_SET_MODE_INSERT,
      XCB_SET_MODE_DELETE)
   with Convention => C;  -- /usr/include/xcb/xproto.h:1630

  --* Opcode for xcb_change_save_set.  
  --*
  -- * @brief xcb_change_save_set_request_t
  -- * 

   type xcb_change_save_set_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1642
      mode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1643
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1644
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1645
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1641

  --* Opcode for xcb_reparent_window.  
  --*
  -- * @brief xcb_reparent_window_request_t
  -- * 

   type xcb_reparent_window_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1655
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1656
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1657
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1658
      parent : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1659
      x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:1660
      y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:1661
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1654

  --* Opcode for xcb_map_window.  
  --*
  -- * @brief xcb_map_window_request_t
  -- * 

   type xcb_map_window_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1671
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1672
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1673
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1674
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1670

  --* Opcode for xcb_map_subwindows.  
  --*
  -- * @brief xcb_map_subwindows_request_t
  -- * 

   type xcb_map_subwindows_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1684
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1685
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1686
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1687
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1683

  --* Opcode for xcb_unmap_window.  
  --*
  -- * @brief xcb_unmap_window_request_t
  -- * 

   type xcb_unmap_window_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1697
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1698
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1699
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1700
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1696

  --* Opcode for xcb_unmap_subwindows.  
  --*
  -- * @brief xcb_unmap_subwindows_request_t
  -- * 

   type xcb_unmap_subwindows_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1710
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1711
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1712
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1713
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1709

   subtype xcb_config_window_t is unsigned;
   XCB_CONFIG_WINDOW_X : constant unsigned := 1;
   XCB_CONFIG_WINDOW_Y : constant unsigned := 2;
   XCB_CONFIG_WINDOW_WIDTH : constant unsigned := 4;
   XCB_CONFIG_WINDOW_HEIGHT : constant unsigned := 8;
   XCB_CONFIG_WINDOW_BORDER_WIDTH : constant unsigned := 16;
   XCB_CONFIG_WINDOW_SIBLING : constant unsigned := 32;
   XCB_CONFIG_WINDOW_STACK_MODE : constant unsigned := 64;  -- /usr/include/xcb/xproto.h:1716

   type xcb_stack_mode_t is 
     (XCB_STACK_MODE_ABOVE,
      XCB_STACK_MODE_BELOW,
      XCB_STACK_MODE_TOP_IF,
      XCB_STACK_MODE_BOTTOM_IF,
      XCB_STACK_MODE_OPPOSITE)
   with Convention => C;  -- /usr/include/xcb/xproto.h:1726

  --*
  -- * @brief xcb_configure_window_value_list_t
  -- * 

   type xcb_configure_window_value_list_t is record
      x : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/xproto.h:1738
      y : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/xproto.h:1739
      width : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1740
      height : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1741
      border_width : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1742
      sibling : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1743
      stack_mode : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1744
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1737

  --* Opcode for xcb_configure_window.  
  --*
  -- * @brief xcb_configure_window_request_t
  -- * 

   type xcb_configure_window_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_configure_window_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1754
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1755
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1756
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1757
      value_mask : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1758
      pad1 : aliased xcb_configure_window_request_t_array1823;  -- /usr/include/xcb/xproto.h:1759
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1753

   type xcb_circulate_t is 
     (XCB_CIRCULATE_RAISE_LOWEST,
      XCB_CIRCULATE_LOWER_HIGHEST)
   with Convention => C;  -- /usr/include/xcb/xproto.h:1762

  --* Opcode for xcb_circulate_window.  
  --*
  -- * @brief xcb_circulate_window_request_t
  -- * 

   type xcb_circulate_window_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1774
      direction : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1775
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1776
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1777
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1773

  --*
  -- * @brief xcb_get_geometry_cookie_t
  -- * 

   type xcb_get_geometry_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:1784
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1783

  --* Opcode for xcb_get_geometry.  
  --*
  -- * @brief xcb_get_geometry_request_t
  -- * 

   type xcb_get_geometry_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1794
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1795
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1796
      drawable : aliased xcb_drawable_t;  -- /usr/include/xcb/xproto.h:1797
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1793

  --*
  -- * @brief xcb_get_geometry_reply_t
  -- * 

   type xcb_get_geometry_reply_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_get_geometry_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1804
      depth : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1805
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1806
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1807
      root : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1808
      x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:1809
      y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:1810
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1811
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1812
      border_width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1813
      pad0 : aliased xcb_get_geometry_reply_t_array1823;  -- /usr/include/xcb/xproto.h:1814
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1803

  --*
  -- * @brief xcb_query_tree_cookie_t
  -- * 

   type xcb_query_tree_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:1821
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1820

  --* Opcode for xcb_query_tree.  
  --*
  -- * @brief xcb_query_tree_request_t
  -- * 

   type xcb_query_tree_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1831
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1832
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1833
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1834
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1830

  --*
  -- * @brief xcb_query_tree_reply_t
  -- * 

   type xcb_query_tree_reply_t_array2138 is array (0 .. 13) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_query_tree_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1841
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1842
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1843
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1844
      root : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1845
      parent : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1846
      children_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1847
      pad1 : aliased xcb_query_tree_reply_t_array2138;  -- /usr/include/xcb/xproto.h:1848
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1840

  --*
  -- * @brief xcb_intern_atom_cookie_t
  -- * 

   type xcb_intern_atom_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:1855
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1854

  --* Opcode for xcb_intern_atom.  
  --*
  -- * @brief xcb_intern_atom_request_t
  -- * 

   type xcb_intern_atom_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_intern_atom_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1865
      only_if_exists : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1866
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1867
      name_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1868
      pad0 : aliased xcb_intern_atom_request_t_array1823;  -- /usr/include/xcb/xproto.h:1869
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1864

  --*
  -- * @brief xcb_intern_atom_reply_t
  -- * 

   type xcb_intern_atom_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1876
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1877
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1878
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1879
      atom : aliased xcb_atom_t;  -- /usr/include/xcb/xproto.h:1880
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1875

  --*
  -- * @brief xcb_get_atom_name_cookie_t
  -- * 

   type xcb_get_atom_name_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:1887
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1886

  --* Opcode for xcb_get_atom_name.  
  --*
  -- * @brief xcb_get_atom_name_request_t
  -- * 

   type xcb_get_atom_name_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1897
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1898
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1899
      atom : aliased xcb_atom_t;  -- /usr/include/xcb/xproto.h:1900
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1896

  --*
  -- * @brief xcb_get_atom_name_reply_t
  -- * 

   type xcb_get_atom_name_reply_t_array2015 is array (0 .. 21) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_get_atom_name_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1907
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1908
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1909
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1910
      name_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1911
      pad1 : aliased xcb_get_atom_name_reply_t_array2015;  -- /usr/include/xcb/xproto.h:1912
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1906

   type xcb_prop_mode_t is 
     (XCB_PROP_MODE_REPLACE,
      XCB_PROP_MODE_PREPEND,
      XCB_PROP_MODE_APPEND)
   with Convention => C;  -- /usr/include/xcb/xproto.h:1915

  --*< Discard the previous property value and store the new data.  
  --*< Insert the new data before the beginning of existing data. The `format` must
  --match existing property value. If the property is undefined, it is treated as
  --defined with the correct type and format with zero-length data.  

  --*< Insert the new data after the beginning of existing data. The `format` must
  --match existing property value. If the property is undefined, it is treated as
  --defined with the correct type and format with zero-length data.  

  --* Opcode for xcb_change_property.  
  --*
  -- * @brief xcb_change_property_request_t
  -- * 

   type xcb_change_property_request_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_change_property_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1938
      mode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1939
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1940
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1941
      property : aliased xcb_atom_t;  -- /usr/include/xcb/xproto.h:1942
      c_type : aliased xcb_atom_t;  -- /usr/include/xcb/xproto.h:1943
      format : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1944
      pad0 : aliased xcb_change_property_request_t_array1897;  -- /usr/include/xcb/xproto.h:1945
      data_len : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1946
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1937

  --* Opcode for xcb_delete_property.  
  --*
  -- * @brief xcb_delete_property_request_t
  -- * 

   type xcb_delete_property_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1956
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1957
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1958
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1959
      property : aliased xcb_atom_t;  -- /usr/include/xcb/xproto.h:1960
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1955

   type xcb_get_property_type_t is 
     (XCB_GET_PROPERTY_TYPE_ANY)
   with Convention => C;  -- /usr/include/xcb/xproto.h:1963

  --*
  -- * @brief xcb_get_property_cookie_t
  -- * 

   type xcb_get_property_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:1971
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1970

  --* Opcode for xcb_get_property.  
  --*
  -- * @brief xcb_get_property_request_t
  -- * 

   type xcb_get_property_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1981
      u_delete : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1982
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1983
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:1984
      property : aliased xcb_atom_t;  -- /usr/include/xcb/xproto.h:1985
      c_type : aliased xcb_atom_t;  -- /usr/include/xcb/xproto.h:1986
      long_offset : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1987
      long_length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1988
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1980

  --*
  -- * @brief xcb_get_property_reply_t
  -- * 

   type xcb_get_property_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_get_property_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1995
      format : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:1996
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:1997
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:1998
      c_type : aliased xcb_atom_t;  -- /usr/include/xcb/xproto.h:1999
      bytes_after : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:2000
      value_len : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:2001
      pad0 : aliased xcb_get_property_reply_t_array2180;  -- /usr/include/xcb/xproto.h:2002
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:1994

  --*
  -- * @brief xcb_list_properties_cookie_t
  -- * 

   type xcb_list_properties_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:2009
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2008

  --* Opcode for xcb_list_properties.  
  --*
  -- * @brief xcb_list_properties_request_t
  -- * 

   type xcb_list_properties_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2019
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2020
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2021
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:2022
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2018

  --*
  -- * @brief xcb_list_properties_reply_t
  -- * 

   type xcb_list_properties_reply_t_array2015 is array (0 .. 21) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_list_properties_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2029
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2030
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2031
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:2032
      atoms_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2033
      pad1 : aliased xcb_list_properties_reply_t_array2015;  -- /usr/include/xcb/xproto.h:2034
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2028

  --* Opcode for xcb_set_selection_owner.  
  --*
  -- * @brief xcb_set_selection_owner_request_t
  -- * 

   type xcb_set_selection_owner_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2044
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2045
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2046
      owner : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:2047
      selection : aliased xcb_atom_t;  -- /usr/include/xcb/xproto.h:2048
      time : aliased xcb_timestamp_t;  -- /usr/include/xcb/xproto.h:2049
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2043

  --*
  -- * @brief xcb_get_selection_owner_cookie_t
  -- * 

   type xcb_get_selection_owner_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:2056
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2055

  --* Opcode for xcb_get_selection_owner.  
  --*
  -- * @brief xcb_get_selection_owner_request_t
  -- * 

   type xcb_get_selection_owner_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2066
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2067
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2068
      selection : aliased xcb_atom_t;  -- /usr/include/xcb/xproto.h:2069
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2065

  --*
  -- * @brief xcb_get_selection_owner_reply_t
  -- * 

   type xcb_get_selection_owner_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2076
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2077
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2078
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:2079
      owner : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:2080
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2075

  --* Opcode for xcb_convert_selection.  
  --*
  -- * @brief xcb_convert_selection_request_t
  -- * 

   type xcb_convert_selection_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2090
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2091
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2092
      requestor : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:2093
      selection : aliased xcb_atom_t;  -- /usr/include/xcb/xproto.h:2094
      target : aliased xcb_atom_t;  -- /usr/include/xcb/xproto.h:2095
      property : aliased xcb_atom_t;  -- /usr/include/xcb/xproto.h:2096
      time : aliased xcb_timestamp_t;  -- /usr/include/xcb/xproto.h:2097
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2089

   type xcb_send_event_dest_t is 
     (XCB_SEND_EVENT_DEST_POINTER_WINDOW,
      XCB_SEND_EVENT_DEST_ITEM_FOCUS)
   with Convention => C;  -- /usr/include/xcb/xproto.h:2100

  --* Opcode for xcb_send_event.  
  --*
  -- * @brief xcb_send_event_request_t
  -- * 

   subtype xcb_send_event_request_t_array1030 is Interfaces.C.char_array (0 .. 31);
   type xcb_send_event_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2112
      propagate : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2113
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2114
      destination : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:2115
      event_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:2116
      event : aliased xcb_send_event_request_t_array1030;  -- /usr/include/xcb/xproto.h:2117
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2111

   type xcb_grab_mode_t is 
     (XCB_GRAB_MODE_SYNC,
      XCB_GRAB_MODE_ASYNC)
   with Convention => C;  -- /usr/include/xcb/xproto.h:2120

  --*< The state of the keyboard appears to freeze: No further keyboard events are
  --generated by the server until the grabbing client issues a releasing
  --`AllowEvents` request or until the keyboard grab is released.  

  --*< Keyboard event processing continues normally.  
   type xcb_grab_status_t is 
     (XCB_GRAB_STATUS_SUCCESS,
      XCB_GRAB_STATUS_ALREADY_GRABBED,
      XCB_GRAB_STATUS_INVALID_TIME,
      XCB_GRAB_STATUS_NOT_VIEWABLE,
      XCB_GRAB_STATUS_FROZEN)
   with Convention => C;  -- /usr/include/xcb/xproto.h:2131

   type xcb_cursor_enum_t is 
     (XCB_CURSOR_NONE)
   with Convention => C;  -- /usr/include/xcb/xproto.h:2139

  --*
  -- * @brief xcb_grab_pointer_cookie_t
  -- * 

   type xcb_grab_pointer_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:2147
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2146

  --* Opcode for xcb_grab_pointer.  
  --*
  -- * @brief xcb_grab_pointer_request_t
  -- * 

   type xcb_grab_pointer_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2157
      owner_events : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2158
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2159
      grab_window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:2160
      event_mask : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2161
      pointer_mode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2162
      keyboard_mode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2163
      confine_to : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:2164
      cursor : aliased xcb_cursor_t;  -- /usr/include/xcb/xproto.h:2165
      time : aliased xcb_timestamp_t;  -- /usr/include/xcb/xproto.h:2166
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2156

  --*
  -- * @brief xcb_grab_pointer_reply_t
  -- * 

   type xcb_grab_pointer_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2173
      status : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2174
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2175
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:2176
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2172

  --* Opcode for xcb_ungrab_pointer.  
  --*
  -- * @brief xcb_ungrab_pointer_request_t
  -- * 

   type xcb_ungrab_pointer_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2186
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2187
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2188
      time : aliased xcb_timestamp_t;  -- /usr/include/xcb/xproto.h:2189
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2185

   type xcb_button_index_t is 
     (XCB_BUTTON_INDEX_ANY,
      XCB_BUTTON_INDEX_1,
      XCB_BUTTON_INDEX_2,
      XCB_BUTTON_INDEX_3,
      XCB_BUTTON_INDEX_4,
      XCB_BUTTON_INDEX_5)
   with Convention => C;  -- /usr/include/xcb/xproto.h:2192

  --*< Any of the following (or none):  
  --*< The left mouse button.  
  --*< The right mouse button.  
  --*< The middle mouse button.  
  --*< Scroll wheel. TODO: direction?  
  --*< Scroll wheel. TODO: direction?  
  --* Opcode for xcb_grab_button.  
  --*
  -- * @brief xcb_grab_button_request_t
  -- * 

   type xcb_grab_button_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2220
      owner_events : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2221
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2222
      grab_window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:2223
      event_mask : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2224
      pointer_mode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2225
      keyboard_mode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2226
      confine_to : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:2227
      cursor : aliased xcb_cursor_t;  -- /usr/include/xcb/xproto.h:2228
      button : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2229
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2230
      modifiers : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2231
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2219

  --* Opcode for xcb_ungrab_button.  
  --*
  -- * @brief xcb_ungrab_button_request_t
  -- * 

   type xcb_ungrab_button_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_ungrab_button_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2241
      button : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2242
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2243
      grab_window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:2244
      modifiers : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2245
      pad0 : aliased xcb_ungrab_button_request_t_array1823;  -- /usr/include/xcb/xproto.h:2246
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2240

  --* Opcode for xcb_change_active_pointer_grab.  
  --*
  -- * @brief xcb_change_active_pointer_grab_request_t
  -- * 

   type xcb_change_active_pointer_grab_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_change_active_pointer_grab_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2256
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2257
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2258
      cursor : aliased xcb_cursor_t;  -- /usr/include/xcb/xproto.h:2259
      time : aliased xcb_timestamp_t;  -- /usr/include/xcb/xproto.h:2260
      event_mask : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2261
      pad1 : aliased xcb_change_active_pointer_grab_request_t_array1823;  -- /usr/include/xcb/xproto.h:2262
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2255

  --*
  -- * @brief xcb_grab_keyboard_cookie_t
  -- * 

   type xcb_grab_keyboard_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:2269
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2268

  --* Opcode for xcb_grab_keyboard.  
  --*
  -- * @brief xcb_grab_keyboard_request_t
  -- * 

   type xcb_grab_keyboard_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_grab_keyboard_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2279
      owner_events : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2280
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2281
      grab_window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:2282
      time : aliased xcb_timestamp_t;  -- /usr/include/xcb/xproto.h:2283
      pointer_mode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2284
      keyboard_mode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2285
      pad0 : aliased xcb_grab_keyboard_request_t_array1823;  -- /usr/include/xcb/xproto.h:2286
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2278

  --*
  -- * @brief xcb_grab_keyboard_reply_t
  -- * 

   type xcb_grab_keyboard_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2293
      status : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2294
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2295
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:2296
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2292

  --* Opcode for xcb_ungrab_keyboard.  
  --*
  -- * @brief xcb_ungrab_keyboard_request_t
  -- * 

   type xcb_ungrab_keyboard_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2306
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2307
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2308
      time : aliased xcb_timestamp_t;  -- /usr/include/xcb/xproto.h:2309
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2305

   type xcb_grab_t is 
     (XCB_GRAB_ANY)
   with Convention => C;  -- /usr/include/xcb/xproto.h:2312

  --* Opcode for xcb_grab_key.  
  --*
  -- * @brief xcb_grab_key_request_t
  -- * 

   type xcb_grab_key_request_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_grab_key_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2323
      owner_events : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2324
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2325
      grab_window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:2326
      modifiers : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2327
      key : aliased xcb_keycode_t;  -- /usr/include/xcb/xproto.h:2328
      pointer_mode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2329
      keyboard_mode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2330
      pad0 : aliased xcb_grab_key_request_t_array1897;  -- /usr/include/xcb/xproto.h:2331
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2322

  --* Opcode for xcb_ungrab_key.  
  --*
  -- * @brief xcb_ungrab_key_request_t
  -- * 

   type xcb_ungrab_key_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_ungrab_key_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2341
      key : aliased xcb_keycode_t;  -- /usr/include/xcb/xproto.h:2342
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2343
      grab_window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:2344
      modifiers : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2345
      pad0 : aliased xcb_ungrab_key_request_t_array1823;  -- /usr/include/xcb/xproto.h:2346
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2340

   type xcb_allow_t is 
     (XCB_ALLOW_ASYNC_POINTER,
      XCB_ALLOW_SYNC_POINTER,
      XCB_ALLOW_REPLAY_POINTER,
      XCB_ALLOW_ASYNC_KEYBOARD,
      XCB_ALLOW_SYNC_KEYBOARD,
      XCB_ALLOW_REPLAY_KEYBOARD,
      XCB_ALLOW_ASYNC_BOTH,
      XCB_ALLOW_SYNC_BOTH)
   with Convention => C;  -- /usr/include/xcb/xproto.h:2349

  --*< For AsyncPointer, if the pointer is frozen by the client, pointer event
  --processing continues normally. If the pointer is frozen twice by the client on
  --behalf of two separate grabs, AsyncPointer thaws for both. AsyncPointer has no
  --effect if the pointer is not frozen by the client, but the pointer need not be
  --grabbed by the client.
  --TODO: rewrite this in more understandable terms.  

  --*< For SyncPointer, if the pointer is frozen and actively grabbed by the client,
  --pointer event processing continues normally until the next ButtonPress or
  --ButtonRelease event is reported to the client, at which time the pointer again
  --appears to freeze. However, if the reported event causes the pointer grab to be
  --released, then the pointer does not freeze. SyncPointer has no effect if the
  --pointer is not frozen by the client or if the pointer is not grabbed by the
  --client.  

  --*< For ReplayPointer, if the pointer is actively grabbed by the client and is
  --frozen as the result of an event having been sent to the client (either from
  --the activation of a GrabButton or from a previous AllowEvents with mode
  --SyncPointer but not from a GrabPointer), then the pointer grab is released and
  --that event is completely reprocessed, this time ignoring any passive grabs at
  --or above (towards the root) the grab-window of the grab just released. The
  --request has no effect if the pointer is not grabbed by the client or if the
  --pointer is not frozen as the result of an event.  

  --*< For AsyncKeyboard, if the keyboard is frozen by the client, keyboard event
  --processing continues normally. If the keyboard is frozen twice by the client on
  --behalf of two separate grabs, AsyncKeyboard thaws for both. AsyncKeyboard has
  --no effect if the keyboard is not frozen by the client, but the keyboard need
  --not be grabbed by the client.  

  --*< For SyncKeyboard, if the keyboard is frozen and actively grabbed by the client,
  --keyboard event processing continues normally until the next KeyPress or
  --KeyRelease event is reported to the client, at which time the keyboard again
  --appears to freeze. However, if the reported event causes the keyboard grab to
  --be released, then the keyboard does not freeze. SyncKeyboard has no effect if
  --the keyboard is not frozen by the client or if the keyboard is not grabbed by
  --the client.  

  --*< For ReplayKeyboard, if the keyboard is actively grabbed by the client and is
  --frozen as the result of an event having been sent to the client (either from
  --the activation of a GrabKey or from a previous AllowEvents with mode
  --SyncKeyboard but not from a GrabKeyboard), then the keyboard grab is released
  --and that event is completely reprocessed, this time ignoring any passive grabs
  --at or above (towards the root) the grab-window of the grab just released. The
  --request has no effect if the keyboard is not grabbed by the client or if the
  --keyboard is not frozen as the result of an event.  

  --*< For AsyncBoth, if the pointer and the keyboard are frozen by the client, event
  --processing for both devices continues normally. If a device is frozen twice by
  --the client on behalf of two separate grabs, AsyncBoth thaws for both. AsyncBoth
  --has no effect unless both pointer and keyboard are frozen by the client.  

  --*< For SyncBoth, if both pointer and keyboard are frozen by the client, event
  --processing (for both devices) continues normally until the next ButtonPress,
  --ButtonRelease, KeyPress, or KeyRelease event is reported to the client for a
  --grabbed device (button event for the pointer, key event for the keyboard), at
  --which time the devices again appear to freeze. However, if the reported event
  --causes the grab to be released, then the devices do not freeze (but if the
  --other device is still grabbed, then a subsequent event for it will still cause
  --both devices to freeze). SyncBoth has no effect unless both pointer and
  --keyboard are frozen by the client. If the pointer or keyboard is frozen twice
  --by the client on behalf of two separate grabs, SyncBoth thaws for both (but a
  --subsequent freeze for SyncBoth will only freeze each device once).  

  --* Opcode for xcb_allow_events.  
  --*
  -- * @brief xcb_allow_events_request_t
  -- * 

   type xcb_allow_events_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2432
      mode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2433
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2434
      time : aliased xcb_timestamp_t;  -- /usr/include/xcb/xproto.h:2435
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2431

  --* Opcode for xcb_grab_server.  
  --*
  -- * @brief xcb_grab_server_request_t
  -- * 

   type xcb_grab_server_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2445
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2446
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2447
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2444

  --* Opcode for xcb_ungrab_server.  
  --*
  -- * @brief xcb_ungrab_server_request_t
  -- * 

   type xcb_ungrab_server_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2457
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2458
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2459
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2456

  --*
  -- * @brief xcb_query_pointer_cookie_t
  -- * 

   type xcb_query_pointer_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:2466
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2465

  --* Opcode for xcb_query_pointer.  
  --*
  -- * @brief xcb_query_pointer_request_t
  -- * 

   type xcb_query_pointer_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2476
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2477
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2478
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:2479
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2475

  --*
  -- * @brief xcb_query_pointer_reply_t
  -- * 

   type xcb_query_pointer_reply_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_query_pointer_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2486
      same_screen : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2487
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2488
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:2489
      root : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:2490
      child : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:2491
      root_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:2492
      root_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:2493
      win_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:2494
      win_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:2495
      mask : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2496
      pad0 : aliased xcb_query_pointer_reply_t_array1823;  -- /usr/include/xcb/xproto.h:2497
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2485

  --*
  -- * @brief xcb_timecoord_t
  -- * 

   type xcb_timecoord_t is record
      time : aliased xcb_timestamp_t;  -- /usr/include/xcb/xproto.h:2504
      x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:2505
      y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:2506
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2503

  --*
  -- * @brief xcb_timecoord_iterator_t
  -- * 

   type xcb_timecoord_iterator_t is record
      data : access xcb_timecoord_t;  -- /usr/include/xcb/xproto.h:2513
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:2514
      index : aliased int;  -- /usr/include/xcb/xproto.h:2515
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2512

  --*
  -- * @brief xcb_get_motion_events_cookie_t
  -- * 

   type xcb_get_motion_events_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:2522
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2521

  --* Opcode for xcb_get_motion_events.  
  --*
  -- * @brief xcb_get_motion_events_request_t
  -- * 

   type xcb_get_motion_events_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2532
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2533
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2534
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:2535
      start : aliased xcb_timestamp_t;  -- /usr/include/xcb/xproto.h:2536
      stop : aliased xcb_timestamp_t;  -- /usr/include/xcb/xproto.h:2537
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2531

  --*
  -- * @brief xcb_get_motion_events_reply_t
  -- * 

   type xcb_get_motion_events_reply_t_array1992 is array (0 .. 19) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_get_motion_events_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2544
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2545
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2546
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:2547
      events_len : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:2548
      pad1 : aliased xcb_get_motion_events_reply_t_array1992;  -- /usr/include/xcb/xproto.h:2549
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2543

  --*
  -- * @brief xcb_translate_coordinates_cookie_t
  -- * 

   type xcb_translate_coordinates_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:2556
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2555

  --* Opcode for xcb_translate_coordinates.  
  --*
  -- * @brief xcb_translate_coordinates_request_t
  -- * 

   type xcb_translate_coordinates_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2566
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2567
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2568
      src_window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:2569
      dst_window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:2570
      src_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:2571
      src_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:2572
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2565

  --*
  -- * @brief xcb_translate_coordinates_reply_t
  -- * 

   type xcb_translate_coordinates_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2579
      same_screen : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2580
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2581
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:2582
      child : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:2583
      dst_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:2584
      dst_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:2585
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2578

  --* Opcode for xcb_warp_pointer.  
  --*
  -- * @brief xcb_warp_pointer_request_t
  -- * 

   type xcb_warp_pointer_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2595
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2596
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2597
      src_window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:2598
      dst_window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:2599
      src_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:2600
      src_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:2601
      src_width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2602
      src_height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2603
      dst_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:2604
      dst_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:2605
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2594

   type xcb_input_focus_t is 
     (XCB_INPUT_FOCUS_NONE,
      XCB_INPUT_FOCUS_POINTER_ROOT,
      XCB_INPUT_FOCUS_PARENT,
      XCB_INPUT_FOCUS_FOLLOW_KEYBOARD)
   with Convention => C;  -- /usr/include/xcb/xproto.h:2608

  --*< The focus reverts to `XCB_NONE`, so no window will have the input focus.  
  --*< The focus reverts to `XCB_POINTER_ROOT` respectively. When the focus reverts,
  --FocusIn and FocusOut events are generated, but the last-focus-change time is
  --not changed.  

  --*< The focus reverts to the parent (or closest viewable ancestor) and the new
  --revert_to value is `XCB_INPUT_FOCUS_NONE`.  

  --*< NOT YET DOCUMENTED. Only relevant for the xinput extension.  
  --* Opcode for xcb_set_input_focus.  
  --*
  -- * @brief xcb_set_input_focus_request_t
  -- * 

   type xcb_set_input_focus_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2633
      revert_to : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2634
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2635
      focus : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:2636
      time : aliased xcb_timestamp_t;  -- /usr/include/xcb/xproto.h:2637
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2632

  --*
  -- * @brief xcb_get_input_focus_cookie_t
  -- * 

   type xcb_get_input_focus_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:2644
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2643

  --* Opcode for xcb_get_input_focus.  
  --*
  -- * @brief xcb_get_input_focus_request_t
  -- * 

   type xcb_get_input_focus_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2654
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2655
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2656
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2653

  --*
  -- * @brief xcb_get_input_focus_reply_t
  -- * 

   type xcb_get_input_focus_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2663
      revert_to : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2664
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2665
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:2666
      focus : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:2667
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2662

  --*
  -- * @brief xcb_query_keymap_cookie_t
  -- * 

   type xcb_query_keymap_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:2674
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2673

  --* Opcode for xcb_query_keymap.  
  --*
  -- * @brief xcb_query_keymap_request_t
  -- * 

   type xcb_query_keymap_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2684
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2685
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2686
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2683

  --*
  -- * @brief xcb_query_keymap_reply_t
  -- * 

   type xcb_query_keymap_reply_t_array2340 is array (0 .. 31) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_query_keymap_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2693
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2694
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2695
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:2696
      keys : aliased xcb_query_keymap_reply_t_array2340;  -- /usr/include/xcb/xproto.h:2697
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2692

  --* Opcode for xcb_open_font.  
  --*
  -- * @brief xcb_open_font_request_t
  -- * 

   type xcb_open_font_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_open_font_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2707
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2708
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2709
      fid : aliased xcb_font_t;  -- /usr/include/xcb/xproto.h:2710
      name_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2711
      pad1 : aliased xcb_open_font_request_t_array1823;  -- /usr/include/xcb/xproto.h:2712
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2706

  --* Opcode for xcb_close_font.  
  --*
  -- * @brief xcb_close_font_request_t
  -- * 

   type xcb_close_font_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2722
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2723
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2724
      font : aliased xcb_font_t;  -- /usr/include/xcb/xproto.h:2725
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2721

   type xcb_font_draw_t is 
     (XCB_FONT_DRAW_LEFT_TO_RIGHT,
      XCB_FONT_DRAW_RIGHT_TO_LEFT)
   with Convention => C;  -- /usr/include/xcb/xproto.h:2728

  --*
  -- * @brief xcb_fontprop_t
  -- * 

   type xcb_fontprop_t is record
      name : aliased xcb_atom_t;  -- /usr/include/xcb/xproto.h:2737
      value : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:2738
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2736

  --*
  -- * @brief xcb_fontprop_iterator_t
  -- * 

   type xcb_fontprop_iterator_t is record
      data : access xcb_fontprop_t;  -- /usr/include/xcb/xproto.h:2745
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:2746
      index : aliased int;  -- /usr/include/xcb/xproto.h:2747
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2744

  --*
  -- * @brief xcb_charinfo_t
  -- * 

   type xcb_charinfo_t is record
      left_side_bearing : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:2754
      right_side_bearing : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:2755
      character_width : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:2756
      ascent : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:2757
      descent : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:2758
      attributes : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2759
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2753

  --*
  -- * @brief xcb_charinfo_iterator_t
  -- * 

   type xcb_charinfo_iterator_t is record
      data : access xcb_charinfo_t;  -- /usr/include/xcb/xproto.h:2766
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:2767
      index : aliased int;  -- /usr/include/xcb/xproto.h:2768
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2765

  --*
  -- * @brief xcb_query_font_cookie_t
  -- * 

   type xcb_query_font_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:2775
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2774

  --* Opcode for xcb_query_font.  
  --*
  -- * @brief xcb_query_font_request_t
  -- * 

   type xcb_query_font_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2785
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2786
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2787
      font : aliased xcb_fontable_t;  -- /usr/include/xcb/xproto.h:2788
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2784

  --*
  -- * @brief xcb_query_font_reply_t
  -- * 

   type xcb_query_font_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_query_font_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2795
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2796
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2797
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:2798
      min_bounds : aliased xcb_charinfo_t;  -- /usr/include/xcb/xproto.h:2799
      pad1 : aliased xcb_query_font_reply_t_array1791;  -- /usr/include/xcb/xproto.h:2800
      max_bounds : aliased xcb_charinfo_t;  -- /usr/include/xcb/xproto.h:2801
      pad2 : aliased xcb_query_font_reply_t_array1791;  -- /usr/include/xcb/xproto.h:2802
      min_char_or_byte2 : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2803
      max_char_or_byte2 : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2804
      default_char : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2805
      properties_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2806
      draw_direction : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2807
      min_byte1 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2808
      max_byte1 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2809
      all_chars_exist : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2810
      font_ascent : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:2811
      font_descent : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:2812
      char_infos_len : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:2813
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2794

  --*
  -- * @brief xcb_query_text_extents_cookie_t
  -- * 

   type xcb_query_text_extents_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:2820
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2819

  --* Opcode for xcb_query_text_extents.  
  --*
  -- * @brief xcb_query_text_extents_request_t
  -- * 

   type xcb_query_text_extents_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2830
      odd_length : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2831
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2832
      font : aliased xcb_fontable_t;  -- /usr/include/xcb/xproto.h:2833
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2829

  --*
  -- * @brief xcb_query_text_extents_reply_t
  -- * 

   type xcb_query_text_extents_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2840
      draw_direction : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2841
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2842
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:2843
      font_ascent : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:2844
      font_descent : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:2845
      overall_ascent : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:2846
      overall_descent : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:2847
      overall_width : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/xproto.h:2848
      overall_left : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/xproto.h:2849
      overall_right : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/xproto.h:2850
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2839

  --*
  -- * @brief xcb_str_t
  -- * 

   type xcb_str_t is record
      name_len : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2857
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2856

  --*
  -- * @brief xcb_str_iterator_t
  -- * 

   type xcb_str_iterator_t is record
      data : access xcb_str_t;  -- /usr/include/xcb/xproto.h:2864
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:2865
      index : aliased int;  -- /usr/include/xcb/xproto.h:2866
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2863

  --*
  -- * @brief xcb_list_fonts_cookie_t
  -- * 

   type xcb_list_fonts_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:2873
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2872

  --* Opcode for xcb_list_fonts.  
  --*
  -- * @brief xcb_list_fonts_request_t
  -- * 

   type xcb_list_fonts_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2883
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2884
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2885
      max_names : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2886
      pattern_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2887
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2882

  --*
  -- * @brief xcb_list_fonts_reply_t
  -- * 

   type xcb_list_fonts_reply_t_array2015 is array (0 .. 21) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_list_fonts_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2894
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2895
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2896
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:2897
      names_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2898
      pad1 : aliased xcb_list_fonts_reply_t_array2015;  -- /usr/include/xcb/xproto.h:2899
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2893

  --*
  -- * @brief xcb_list_fonts_with_info_cookie_t
  -- * 

   type xcb_list_fonts_with_info_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:2906
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2905

  --* Opcode for xcb_list_fonts_with_info.  
  --*
  -- * @brief xcb_list_fonts_with_info_request_t
  -- * 

   type xcb_list_fonts_with_info_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2916
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2917
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2918
      max_names : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2919
      pattern_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2920
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2915

  --*
  -- * @brief xcb_list_fonts_with_info_reply_t
  -- * 

   type xcb_list_fonts_with_info_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_list_fonts_with_info_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2927
      name_len : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2928
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2929
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:2930
      min_bounds : aliased xcb_charinfo_t;  -- /usr/include/xcb/xproto.h:2931
      pad0 : aliased xcb_list_fonts_with_info_reply_t_array1791;  -- /usr/include/xcb/xproto.h:2932
      max_bounds : aliased xcb_charinfo_t;  -- /usr/include/xcb/xproto.h:2933
      pad1 : aliased xcb_list_fonts_with_info_reply_t_array1791;  -- /usr/include/xcb/xproto.h:2934
      min_char_or_byte2 : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2935
      max_char_or_byte2 : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2936
      default_char : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2937
      properties_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2938
      draw_direction : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2939
      min_byte1 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2940
      max_byte1 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2941
      all_chars_exist : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2942
      font_ascent : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:2943
      font_descent : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:2944
      replies_hint : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:2945
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2926

  --* Opcode for xcb_set_font_path.  
  --*
  -- * @brief xcb_set_font_path_request_t
  -- * 

   type xcb_set_font_path_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_set_font_path_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2955
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2956
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2957
      font_qty : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2958
      pad1 : aliased xcb_set_font_path_request_t_array1823;  -- /usr/include/xcb/xproto.h:2959
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2954

  --*
  -- * @brief xcb_get_font_path_cookie_t
  -- * 

   type xcb_get_font_path_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:2966
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2965

  --* Opcode for xcb_get_font_path.  
  --*
  -- * @brief xcb_get_font_path_request_t
  -- * 

   type xcb_get_font_path_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2976
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2977
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2978
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2975

  --*
  -- * @brief xcb_get_font_path_reply_t
  -- * 

   type xcb_get_font_path_reply_t_array2015 is array (0 .. 21) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_get_font_path_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2985
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:2986
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2987
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:2988
      path_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:2989
      pad1 : aliased xcb_get_font_path_reply_t_array2015;  -- /usr/include/xcb/xproto.h:2990
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2984

  --* Opcode for xcb_create_pixmap.  
  --*
  -- * @brief xcb_create_pixmap_request_t
  -- * 

   type xcb_create_pixmap_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3000
      depth : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3001
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3002
      pid : aliased xcb_pixmap_t;  -- /usr/include/xcb/xproto.h:3003
      drawable : aliased xcb_drawable_t;  -- /usr/include/xcb/xproto.h:3004
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3005
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3006
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:2999

  --* Opcode for xcb_free_pixmap.  
  --*
  -- * @brief xcb_free_pixmap_request_t
  -- * 

   type xcb_free_pixmap_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3016
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3017
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3018
      pixmap : aliased xcb_pixmap_t;  -- /usr/include/xcb/xproto.h:3019
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3015

   subtype xcb_gc_t is unsigned;
   XCB_GC_FUNCTION : constant unsigned := 1;
   XCB_GC_PLANE_MASK : constant unsigned := 2;
   XCB_GC_FOREGROUND : constant unsigned := 4;
   XCB_GC_BACKGROUND : constant unsigned := 8;
   XCB_GC_LINE_WIDTH : constant unsigned := 16;
   XCB_GC_LINE_STYLE : constant unsigned := 32;
   XCB_GC_CAP_STYLE : constant unsigned := 64;
   XCB_GC_JOIN_STYLE : constant unsigned := 128;
   XCB_GC_FILL_STYLE : constant unsigned := 256;
   XCB_GC_FILL_RULE : constant unsigned := 512;
   XCB_GC_TILE : constant unsigned := 1024;
   XCB_GC_STIPPLE : constant unsigned := 2048;
   XCB_GC_TILE_STIPPLE_ORIGIN_X : constant unsigned := 4096;
   XCB_GC_TILE_STIPPLE_ORIGIN_Y : constant unsigned := 8192;
   XCB_GC_FONT : constant unsigned := 16384;
   XCB_GC_SUBWINDOW_MODE : constant unsigned := 32768;
   XCB_GC_GRAPHICS_EXPOSURES : constant unsigned := 65536;
   XCB_GC_CLIP_ORIGIN_X : constant unsigned := 131072;
   XCB_GC_CLIP_ORIGIN_Y : constant unsigned := 262144;
   XCB_GC_CLIP_MASK : constant unsigned := 524288;
   XCB_GC_DASH_OFFSET : constant unsigned := 1048576;
   XCB_GC_DASH_LIST : constant unsigned := 2097152;
   XCB_GC_ARC_MODE : constant unsigned := 4194304;  -- /usr/include/xcb/xproto.h:3022

  --*< TODO: Refer to GX  
  --*< In graphics operations, given a source and destination pixel, the result is
  --computed bitwise on corresponding bits of the pixels; that is, a Boolean
  --operation is performed in each bit plane. The plane-mask restricts the
  --operation to a subset of planes, so the result is:
  --        ((src FUNC dst) AND plane-mask) OR (dst AND (NOT plane-mask))  

  --*< Foreground colorpixel.  
  --*< Background colorpixel.  
  --*< The line-width is measured in pixels and can be greater than or equal to one, a wide line, or the
  --special value zero, a thin line.  

  --*< The line-style defines which sections of a line are drawn:
  --Solid                The full path of the line is drawn.
  --DoubleDash           The full path of the line is drawn, but the even dashes are filled differently
  --                     than the odd dashes (see fill-style), with Butt cap-style used where even and
  --                     odd dashes meet.
  --OnOffDash            Only the even dashes are drawn, and cap-style applies to all internal ends of
  --                     the individual dashes (except NotLast is treated as Butt).  

  --*< The cap-style defines how the endpoints of a path are drawn:
  --NotLast    The result is equivalent to Butt, except that for a line-width of zero the final
  --           endpoint is not drawn.
  --Butt       The result is square at the endpoint (perpendicular to the slope of the line)
  --           with no projection beyond.
  --Round      The result is a circular arc with its diameter equal to the line-width, centered
  --           on the endpoint; it is equivalent to Butt for line-width zero.
  --Projecting The result is square at the end, but the path continues beyond the endpoint for
  --           a distance equal to half the line-width; it is equivalent to Butt for line-width
  --           zero.  

  --*< The join-style defines how corners are drawn for wide lines:
  --Miter               The outer edges of the two lines extend to meet at an angle. However, if the
  --                    angle is less than 11 degrees, a Bevel join-style is used instead.
  --Round               The result is a circular arc with a diameter equal to the line-width, centered
  --                    on the joinpoint.
  --Bevel               The result is Butt endpoint styles, and then the triangular notch is filled.  

  --*< The fill-style defines the contents of the source for line, text, and fill requests. For all text and fill
  --requests (for example, PolyText8, PolyText16, PolyFillRectangle, FillPoly, and PolyFillArc)
  --as well as for line requests with line-style Solid, (for example, PolyLine, PolySegment,
  --PolyRectangle, PolyArc) and for the even dashes for line requests with line-style OnOffDash
  --or DoubleDash:
  --Solid                     Foreground
  --Tiled                     Tile
  --OpaqueStippled            A tile with the same width and height as stipple but with background
  --                          everywhere stipple has a zero and with foreground everywhere stipple
  --                          has a one
  --Stippled                  Foreground masked by stipple
  --For the odd dashes for line requests with line-style DoubleDash:
  --Solid                     Background
  --Tiled                     Same as for even dashes
  --OpaqueStippled            Same as for even dashes
  --Stippled                  Background masked by stipple  

  --*<   
  --*< The tile/stipple represents an infinite two-dimensional plane with the tile/stipple replicated in all
  --dimensions. When that plane is superimposed on the drawable for use in a graphics operation,
  --the upper-left corner of some instance of the tile/stipple is at the coordinates within the drawable
  --specified by the tile/stipple origin. The tile/stipple and clip origins are interpreted relative to the
  --origin of whatever destination drawable is specified in a graphics request.
  --The tile pixmap must have the same root and depth as the gcontext (or a Match error results).
  --The stipple pixmap must have depth one and must have the same root as the gcontext (or a
  --Match error results). For fill-style Stippled (but not fill-style
  --OpaqueStippled), the stipple pattern is tiled in a single plane and acts as an
  --additional clip mask to be ANDed with the clip-mask.
  --Any size pixmap can be used for tiling or stippling, although some sizes may be faster to use than
  --others.  

  --*< The tile/stipple represents an infinite two-dimensional plane with the tile/stipple replicated in all
  --dimensions. When that plane is superimposed on the drawable for use in a graphics operation,
  --the upper-left corner of some instance of the tile/stipple is at the coordinates within the drawable
  --specified by the tile/stipple origin. The tile/stipple and clip origins are interpreted relative to the
  --origin of whatever destination drawable is specified in a graphics request.
  --The tile pixmap must have the same root and depth as the gcontext (or a Match error results).
  --The stipple pixmap must have depth one and must have the same root as the gcontext (or a
  --Match error results). For fill-style Stippled (but not fill-style
  --OpaqueStippled), the stipple pattern is tiled in a single plane and acts as an
  --additional clip mask to be ANDed with the clip-mask.
  --Any size pixmap can be used for tiling or stippling, although some sizes may be faster to use than
  --others.  

  --*< TODO  
  --*< TODO  
  --*< Which font to use for the `ImageText8` and `ImageText16` requests.  
  --*< For ClipByChildren, both source and destination windows are additionally
  --clipped by all viewable InputOutput children. For IncludeInferiors, neither
  --source nor destination window is
  --clipped by inferiors. This will result in including subwindow contents in the source and drawing
  --through subwindow boundaries of the destination. The use of IncludeInferiors with a source or
  --destination window of one depth with mapped inferiors of differing depth is not illegal, but the
  --semantics is undefined by the core protocol.  

  --*< Whether ExposureEvents should be generated (1) or not (0).
  --The default is 1.  

  --*< TODO  
  --*< TODO  
  --*< The clip-mask restricts writes to the destination drawable. Only pixels where the clip-mask has
  --bits set to 1 are drawn. Pixels are not drawn outside the area covered by the clip-mask or where
  --the clip-mask has bits set to 0. The clip-mask affects all graphics requests, but it does not clip
  --sources. The clip-mask origin is interpreted relative to the origin of whatever destination drawable is specified in a graphics request. If a pixmap is specified as the clip-mask, it must have
  --depth 1 and have the same root as the gcontext (or a Match error results). If clip-mask is None,
  --then pixels are always drawn, regardless of the clip origin. The clip-mask can also be set with the
  --SetClipRectangles request.  

  --*< TODO  
  --*< TODO  
  --*< TODO  
   type xcb_gx_t is 
     (XCB_GX_CLEAR,
      XCB_GX_AND,
      XCB_GX_AND_REVERSE,
      XCB_GX_COPY,
      XCB_GX_AND_INVERTED,
      XCB_GX_NOOP,
      XCB_GX_XOR,
      XCB_GX_OR,
      XCB_GX_NOR,
      XCB_GX_EQUIV,
      XCB_GX_INVERT,
      XCB_GX_OR_REVERSE,
      XCB_GX_COPY_INVERTED,
      XCB_GX_OR_INVERTED,
      XCB_GX_NAND,
      XCB_GX_SET)
   with Convention => C;  -- /usr/include/xcb/xproto.h:3171

   type xcb_line_style_t is 
     (XCB_LINE_STYLE_SOLID,
      XCB_LINE_STYLE_ON_OFF_DASH,
      XCB_LINE_STYLE_DOUBLE_DASH)
   with Convention => C;  -- /usr/include/xcb/xproto.h:3190

   type xcb_cap_style_t is 
     (XCB_CAP_STYLE_NOT_LAST,
      XCB_CAP_STYLE_BUTT,
      XCB_CAP_STYLE_ROUND,
      XCB_CAP_STYLE_PROJECTING)
   with Convention => C;  -- /usr/include/xcb/xproto.h:3196

   type xcb_join_style_t is 
     (XCB_JOIN_STYLE_MITER,
      XCB_JOIN_STYLE_ROUND,
      XCB_JOIN_STYLE_BEVEL)
   with Convention => C;  -- /usr/include/xcb/xproto.h:3203

   type xcb_fill_style_t is 
     (XCB_FILL_STYLE_SOLID,
      XCB_FILL_STYLE_TILED,
      XCB_FILL_STYLE_STIPPLED,
      XCB_FILL_STYLE_OPAQUE_STIPPLED)
   with Convention => C;  -- /usr/include/xcb/xproto.h:3209

   type xcb_fill_rule_t is 
     (XCB_FILL_RULE_EVEN_ODD,
      XCB_FILL_RULE_WINDING)
   with Convention => C;  -- /usr/include/xcb/xproto.h:3216

   type xcb_subwindow_mode_t is 
     (XCB_SUBWINDOW_MODE_CLIP_BY_CHILDREN,
      XCB_SUBWINDOW_MODE_INCLUDE_INFERIORS)
   with Convention => C;  -- /usr/include/xcb/xproto.h:3221

   type xcb_arc_mode_t is 
     (XCB_ARC_MODE_CHORD,
      XCB_ARC_MODE_PIE_SLICE)
   with Convention => C;  -- /usr/include/xcb/xproto.h:3226

  --*
  -- * @brief xcb_create_gc_value_list_t
  -- * 

   type xcb_create_gc_value_list_t is record
      c_function : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3235
      plane_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3236
      foreground : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3237
      background : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3238
      line_width : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3239
      line_style : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3240
      cap_style : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3241
      join_style : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3242
      fill_style : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3243
      fill_rule : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3244
      tile : aliased xcb_pixmap_t;  -- /usr/include/xcb/xproto.h:3245
      stipple : aliased xcb_pixmap_t;  -- /usr/include/xcb/xproto.h:3246
      tile_stipple_x_origin : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/xproto.h:3247
      tile_stipple_y_origin : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/xproto.h:3248
      font : aliased xcb_font_t;  -- /usr/include/xcb/xproto.h:3249
      subwindow_mode : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3250
      graphics_exposures : aliased xcb_bool32_t;  -- /usr/include/xcb/xproto.h:3251
      clip_x_origin : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/xproto.h:3252
      clip_y_origin : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/xproto.h:3253
      clip_mask : aliased xcb_pixmap_t;  -- /usr/include/xcb/xproto.h:3254
      dash_offset : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3255
      dashes : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3256
      arc_mode : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3257
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3234

  --* Opcode for xcb_create_gc.  
  --*
  -- * @brief xcb_create_gc_request_t
  -- * 

   type xcb_create_gc_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3267
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3268
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3269
      cid : aliased xcb_gcontext_t;  -- /usr/include/xcb/xproto.h:3270
      drawable : aliased xcb_drawable_t;  -- /usr/include/xcb/xproto.h:3271
      value_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3272
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3266

  --*
  -- * @brief xcb_change_gc_value_list_t
  -- * 

   type xcb_change_gc_value_list_t is record
      c_function : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3279
      plane_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3280
      foreground : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3281
      background : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3282
      line_width : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3283
      line_style : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3284
      cap_style : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3285
      join_style : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3286
      fill_style : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3287
      fill_rule : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3288
      tile : aliased xcb_pixmap_t;  -- /usr/include/xcb/xproto.h:3289
      stipple : aliased xcb_pixmap_t;  -- /usr/include/xcb/xproto.h:3290
      tile_stipple_x_origin : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/xproto.h:3291
      tile_stipple_y_origin : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/xproto.h:3292
      font : aliased xcb_font_t;  -- /usr/include/xcb/xproto.h:3293
      subwindow_mode : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3294
      graphics_exposures : aliased xcb_bool32_t;  -- /usr/include/xcb/xproto.h:3295
      clip_x_origin : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/xproto.h:3296
      clip_y_origin : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/xproto.h:3297
      clip_mask : aliased xcb_pixmap_t;  -- /usr/include/xcb/xproto.h:3298
      dash_offset : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3299
      dashes : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3300
      arc_mode : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3301
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3278

  --* Opcode for xcb_change_gc.  
  --*
  -- * @brief xcb_change_gc_request_t
  -- * 

   type xcb_change_gc_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3311
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3312
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3313
      gc : aliased xcb_gcontext_t;  -- /usr/include/xcb/xproto.h:3314
      value_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3315
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3310

  --* Opcode for xcb_copy_gc.  
  --*
  -- * @brief xcb_copy_gc_request_t
  -- * 

   type xcb_copy_gc_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3325
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3326
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3327
      src_gc : aliased xcb_gcontext_t;  -- /usr/include/xcb/xproto.h:3328
      dst_gc : aliased xcb_gcontext_t;  -- /usr/include/xcb/xproto.h:3329
      value_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3330
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3324

  --* Opcode for xcb_set_dashes.  
  --*
  -- * @brief xcb_set_dashes_request_t
  -- * 

   type xcb_set_dashes_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3340
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3341
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3342
      gc : aliased xcb_gcontext_t;  -- /usr/include/xcb/xproto.h:3343
      dash_offset : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3344
      dashes_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3345
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3339

   type xcb_clip_ordering_t is 
     (XCB_CLIP_ORDERING_UNSORTED,
      XCB_CLIP_ORDERING_Y_SORTED,
      XCB_CLIP_ORDERING_YX_SORTED,
      XCB_CLIP_ORDERING_YX_BANDED)
   with Convention => C;  -- /usr/include/xcb/xproto.h:3348

  --* Opcode for xcb_set_clip_rectangles.  
  --*
  -- * @brief xcb_set_clip_rectangles_request_t
  -- * 

   type xcb_set_clip_rectangles_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3362
      ordering : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3363
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3364
      gc : aliased xcb_gcontext_t;  -- /usr/include/xcb/xproto.h:3365
      clip_x_origin : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:3366
      clip_y_origin : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:3367
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3361

  --* Opcode for xcb_free_gc.  
  --*
  -- * @brief xcb_free_gc_request_t
  -- * 

   type xcb_free_gc_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3377
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3378
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3379
      gc : aliased xcb_gcontext_t;  -- /usr/include/xcb/xproto.h:3380
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3376

  --* Opcode for xcb_clear_area.  
  --*
  -- * @brief xcb_clear_area_request_t
  -- * 

   type xcb_clear_area_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3390
      exposures : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3391
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3392
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:3393
      x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:3394
      y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:3395
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3396
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3397
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3389

  --* Opcode for xcb_copy_area.  
  --*
  -- * @brief xcb_copy_area_request_t
  -- * 

   type xcb_copy_area_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3407
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3408
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3409
      src_drawable : aliased xcb_drawable_t;  -- /usr/include/xcb/xproto.h:3410
      dst_drawable : aliased xcb_drawable_t;  -- /usr/include/xcb/xproto.h:3411
      gc : aliased xcb_gcontext_t;  -- /usr/include/xcb/xproto.h:3412
      src_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:3413
      src_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:3414
      dst_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:3415
      dst_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:3416
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3417
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3418
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3406

  --* Opcode for xcb_copy_plane.  
  --*
  -- * @brief xcb_copy_plane_request_t
  -- * 

   type xcb_copy_plane_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3428
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3429
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3430
      src_drawable : aliased xcb_drawable_t;  -- /usr/include/xcb/xproto.h:3431
      dst_drawable : aliased xcb_drawable_t;  -- /usr/include/xcb/xproto.h:3432
      gc : aliased xcb_gcontext_t;  -- /usr/include/xcb/xproto.h:3433
      src_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:3434
      src_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:3435
      dst_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:3436
      dst_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:3437
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3438
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3439
      bit_plane : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3440
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3427

   type xcb_coord_mode_t is 
     (XCB_COORD_MODE_ORIGIN,
      XCB_COORD_MODE_PREVIOUS)
   with Convention => C;  -- /usr/include/xcb/xproto.h:3443

  --*< Treats all coordinates as relative to the origin.  
  --*< Treats all coordinates after the first as relative to the previous coordinate.  
  --* Opcode for xcb_poly_point.  
  --*
  -- * @brief xcb_poly_point_request_t
  -- * 

   type xcb_poly_point_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3459
      coordinate_mode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3460
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3461
      drawable : aliased xcb_drawable_t;  -- /usr/include/xcb/xproto.h:3462
      gc : aliased xcb_gcontext_t;  -- /usr/include/xcb/xproto.h:3463
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3458

  --* Opcode for xcb_poly_line.  
  --*
  -- * @brief xcb_poly_line_request_t
  -- * 

   type xcb_poly_line_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3473
      coordinate_mode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3474
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3475
      drawable : aliased xcb_drawable_t;  -- /usr/include/xcb/xproto.h:3476
      gc : aliased xcb_gcontext_t;  -- /usr/include/xcb/xproto.h:3477
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3472

  --*
  -- * @brief xcb_segment_t
  -- * 

   type xcb_segment_t is record
      x1 : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:3484
      y1 : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:3485
      x2 : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:3486
      y2 : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:3487
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3483

  --*
  -- * @brief xcb_segment_iterator_t
  -- * 

   type xcb_segment_iterator_t is record
      data : access xcb_segment_t;  -- /usr/include/xcb/xproto.h:3494
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:3495
      index : aliased int;  -- /usr/include/xcb/xproto.h:3496
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3493

  --* Opcode for xcb_poly_segment.  
  --*
  -- * @brief xcb_poly_segment_request_t
  -- * 

   type xcb_poly_segment_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3506
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3507
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3508
      drawable : aliased xcb_drawable_t;  -- /usr/include/xcb/xproto.h:3509
      gc : aliased xcb_gcontext_t;  -- /usr/include/xcb/xproto.h:3510
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3505

  --* Opcode for xcb_poly_rectangle.  
  --*
  -- * @brief xcb_poly_rectangle_request_t
  -- * 

   type xcb_poly_rectangle_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3520
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3521
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3522
      drawable : aliased xcb_drawable_t;  -- /usr/include/xcb/xproto.h:3523
      gc : aliased xcb_gcontext_t;  -- /usr/include/xcb/xproto.h:3524
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3519

  --* Opcode for xcb_poly_arc.  
  --*
  -- * @brief xcb_poly_arc_request_t
  -- * 

   type xcb_poly_arc_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3534
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3535
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3536
      drawable : aliased xcb_drawable_t;  -- /usr/include/xcb/xproto.h:3537
      gc : aliased xcb_gcontext_t;  -- /usr/include/xcb/xproto.h:3538
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3533

   type xcb_poly_shape_t is 
     (XCB_POLY_SHAPE_COMPLEX,
      XCB_POLY_SHAPE_NONCONVEX,
      XCB_POLY_SHAPE_CONVEX)
   with Convention => C;  -- /usr/include/xcb/xproto.h:3541

  --* Opcode for xcb_fill_poly.  
  --*
  -- * @brief xcb_fill_poly_request_t
  -- * 

   type xcb_fill_poly_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_fill_poly_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3554
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3555
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3556
      drawable : aliased xcb_drawable_t;  -- /usr/include/xcb/xproto.h:3557
      gc : aliased xcb_gcontext_t;  -- /usr/include/xcb/xproto.h:3558
      shape : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3559
      coordinate_mode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3560
      pad1 : aliased xcb_fill_poly_request_t_array1823;  -- /usr/include/xcb/xproto.h:3561
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3553

  --* Opcode for xcb_poly_fill_rectangle.  
  --*
  -- * @brief xcb_poly_fill_rectangle_request_t
  -- * 

   type xcb_poly_fill_rectangle_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3571
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3572
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3573
      drawable : aliased xcb_drawable_t;  -- /usr/include/xcb/xproto.h:3574
      gc : aliased xcb_gcontext_t;  -- /usr/include/xcb/xproto.h:3575
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3570

  --* Opcode for xcb_poly_fill_arc.  
  --*
  -- * @brief xcb_poly_fill_arc_request_t
  -- * 

   type xcb_poly_fill_arc_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3585
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3586
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3587
      drawable : aliased xcb_drawable_t;  -- /usr/include/xcb/xproto.h:3588
      gc : aliased xcb_gcontext_t;  -- /usr/include/xcb/xproto.h:3589
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3584

   type xcb_image_format_t is 
     (XCB_IMAGE_FORMAT_XY_BITMAP,
      XCB_IMAGE_FORMAT_XY_PIXMAP,
      XCB_IMAGE_FORMAT_Z_PIXMAP)
   with Convention => C;  -- /usr/include/xcb/xproto.h:3592

  --* Opcode for xcb_put_image.  
  --*
  -- * @brief xcb_put_image_request_t
  -- * 

   type xcb_put_image_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_put_image_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3605
      format : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3606
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3607
      drawable : aliased xcb_drawable_t;  -- /usr/include/xcb/xproto.h:3608
      gc : aliased xcb_gcontext_t;  -- /usr/include/xcb/xproto.h:3609
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3610
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3611
      dst_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:3612
      dst_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:3613
      left_pad : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3614
      depth : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3615
      pad0 : aliased xcb_put_image_request_t_array1823;  -- /usr/include/xcb/xproto.h:3616
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3604

  --*
  -- * @brief xcb_get_image_cookie_t
  -- * 

   type xcb_get_image_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:3623
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3622

  --* Opcode for xcb_get_image.  
  --*
  -- * @brief xcb_get_image_request_t
  -- * 

   type xcb_get_image_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3633
      format : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3634
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3635
      drawable : aliased xcb_drawable_t;  -- /usr/include/xcb/xproto.h:3636
      x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:3637
      y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:3638
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3639
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3640
      plane_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3641
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3632

  --*
  -- * @brief xcb_get_image_reply_t
  -- * 

   type xcb_get_image_reply_t_array1992 is array (0 .. 19) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_get_image_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3648
      depth : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3649
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3650
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3651
      visual : aliased xcb_visualid_t;  -- /usr/include/xcb/xproto.h:3652
      pad0 : aliased xcb_get_image_reply_t_array1992;  -- /usr/include/xcb/xproto.h:3653
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3647

  --* Opcode for xcb_poly_text_8.  
  --*
  -- * @brief xcb_poly_text_8_request_t
  -- * 

   type xcb_poly_text_8_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3663
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3664
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3665
      drawable : aliased xcb_drawable_t;  -- /usr/include/xcb/xproto.h:3666
      gc : aliased xcb_gcontext_t;  -- /usr/include/xcb/xproto.h:3667
      x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:3668
      y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:3669
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3662

  --* Opcode for xcb_poly_text_16.  
  --*
  -- * @brief xcb_poly_text_16_request_t
  -- * 

   type xcb_poly_text_16_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3679
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3680
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3681
      drawable : aliased xcb_drawable_t;  -- /usr/include/xcb/xproto.h:3682
      gc : aliased xcb_gcontext_t;  -- /usr/include/xcb/xproto.h:3683
      x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:3684
      y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:3685
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3678

  --* Opcode for xcb_image_text_8.  
  --*
  -- * @brief xcb_image_text_8_request_t
  -- * 

   type xcb_image_text_8_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3695
      string_len : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3696
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3697
      drawable : aliased xcb_drawable_t;  -- /usr/include/xcb/xproto.h:3698
      gc : aliased xcb_gcontext_t;  -- /usr/include/xcb/xproto.h:3699
      x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:3700
      y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:3701
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3694

  --* Opcode for xcb_image_text_16.  
  --*
  -- * @brief xcb_image_text_16_request_t
  -- * 

   type xcb_image_text_16_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3711
      string_len : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3712
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3713
      drawable : aliased xcb_drawable_t;  -- /usr/include/xcb/xproto.h:3714
      gc : aliased xcb_gcontext_t;  -- /usr/include/xcb/xproto.h:3715
      x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:3716
      y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:3717
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3710

   type xcb_colormap_alloc_t is 
     (XCB_COLORMAP_ALLOC_NONE,
      XCB_COLORMAP_ALLOC_ALL)
   with Convention => C;  -- /usr/include/xcb/xproto.h:3720

  --* Opcode for xcb_create_colormap.  
  --*
  -- * @brief xcb_create_colormap_request_t
  -- * 

   type xcb_create_colormap_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3732
      alloc : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3733
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3734
      mid : aliased xcb_colormap_t;  -- /usr/include/xcb/xproto.h:3735
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:3736
      visual : aliased xcb_visualid_t;  -- /usr/include/xcb/xproto.h:3737
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3731

  --* Opcode for xcb_free_colormap.  
  --*
  -- * @brief xcb_free_colormap_request_t
  -- * 

   type xcb_free_colormap_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3747
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3748
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3749
      cmap : aliased xcb_colormap_t;  -- /usr/include/xcb/xproto.h:3750
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3746

  --* Opcode for xcb_copy_colormap_and_free.  
  --*
  -- * @brief xcb_copy_colormap_and_free_request_t
  -- * 

   type xcb_copy_colormap_and_free_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3760
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3761
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3762
      mid : aliased xcb_colormap_t;  -- /usr/include/xcb/xproto.h:3763
      src_cmap : aliased xcb_colormap_t;  -- /usr/include/xcb/xproto.h:3764
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3759

  --* Opcode for xcb_install_colormap.  
  --*
  -- * @brief xcb_install_colormap_request_t
  -- * 

   type xcb_install_colormap_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3774
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3775
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3776
      cmap : aliased xcb_colormap_t;  -- /usr/include/xcb/xproto.h:3777
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3773

  --* Opcode for xcb_uninstall_colormap.  
  --*
  -- * @brief xcb_uninstall_colormap_request_t
  -- * 

   type xcb_uninstall_colormap_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3787
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3788
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3789
      cmap : aliased xcb_colormap_t;  -- /usr/include/xcb/xproto.h:3790
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3786

  --*
  -- * @brief xcb_list_installed_colormaps_cookie_t
  -- * 

   type xcb_list_installed_colormaps_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:3797
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3796

  --* Opcode for xcb_list_installed_colormaps.  
  --*
  -- * @brief xcb_list_installed_colormaps_request_t
  -- * 

   type xcb_list_installed_colormaps_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3807
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3808
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3809
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:3810
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3806

  --*
  -- * @brief xcb_list_installed_colormaps_reply_t
  -- * 

   type xcb_list_installed_colormaps_reply_t_array2015 is array (0 .. 21) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_list_installed_colormaps_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3817
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3818
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3819
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3820
      cmaps_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3821
      pad1 : aliased xcb_list_installed_colormaps_reply_t_array2015;  -- /usr/include/xcb/xproto.h:3822
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3816

  --*
  -- * @brief xcb_alloc_color_cookie_t
  -- * 

   type xcb_alloc_color_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:3829
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3828

  --* Opcode for xcb_alloc_color.  
  --*
  -- * @brief xcb_alloc_color_request_t
  -- * 

   type xcb_alloc_color_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_alloc_color_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3839
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3840
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3841
      cmap : aliased xcb_colormap_t;  -- /usr/include/xcb/xproto.h:3842
      red : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3843
      green : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3844
      blue : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3845
      pad1 : aliased xcb_alloc_color_request_t_array1823;  -- /usr/include/xcb/xproto.h:3846
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3838

  --*
  -- * @brief xcb_alloc_color_reply_t
  -- * 

   type xcb_alloc_color_reply_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_alloc_color_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3853
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3854
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3855
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3856
      red : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3857
      green : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3858
      blue : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3859
      pad1 : aliased xcb_alloc_color_reply_t_array1823;  -- /usr/include/xcb/xproto.h:3860
      pixel : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3861
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3852

  --*
  -- * @brief xcb_alloc_named_color_cookie_t
  -- * 

   type xcb_alloc_named_color_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:3868
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3867

  --* Opcode for xcb_alloc_named_color.  
  --*
  -- * @brief xcb_alloc_named_color_request_t
  -- * 

   type xcb_alloc_named_color_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_alloc_named_color_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3878
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3879
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3880
      cmap : aliased xcb_colormap_t;  -- /usr/include/xcb/xproto.h:3881
      name_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3882
      pad1 : aliased xcb_alloc_named_color_request_t_array1823;  -- /usr/include/xcb/xproto.h:3883
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3877

  --*
  -- * @brief xcb_alloc_named_color_reply_t
  -- * 

   type xcb_alloc_named_color_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3890
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3891
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3892
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3893
      pixel : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3894
      exact_red : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3895
      exact_green : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3896
      exact_blue : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3897
      visual_red : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3898
      visual_green : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3899
      visual_blue : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3900
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3889

  --*
  -- * @brief xcb_alloc_color_cells_cookie_t
  -- * 

   type xcb_alloc_color_cells_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:3907
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3906

  --* Opcode for xcb_alloc_color_cells.  
  --*
  -- * @brief xcb_alloc_color_cells_request_t
  -- * 

   type xcb_alloc_color_cells_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3917
      contiguous : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3918
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3919
      cmap : aliased xcb_colormap_t;  -- /usr/include/xcb/xproto.h:3920
      colors : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3921
      planes : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3922
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3916

  --*
  -- * @brief xcb_alloc_color_cells_reply_t
  -- * 

   type xcb_alloc_color_cells_reply_t_array1992 is array (0 .. 19) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_alloc_color_cells_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3929
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3930
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3931
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3932
      pixels_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3933
      masks_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3934
      pad1 : aliased xcb_alloc_color_cells_reply_t_array1992;  -- /usr/include/xcb/xproto.h:3935
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3928

  --*
  -- * @brief xcb_alloc_color_planes_cookie_t
  -- * 

   type xcb_alloc_color_planes_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:3942
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3941

  --* Opcode for xcb_alloc_color_planes.  
  --*
  -- * @brief xcb_alloc_color_planes_request_t
  -- * 

   type xcb_alloc_color_planes_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3952
      contiguous : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3953
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3954
      cmap : aliased xcb_colormap_t;  -- /usr/include/xcb/xproto.h:3955
      colors : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3956
      reds : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3957
      greens : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3958
      blues : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3959
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3951

  --*
  -- * @brief xcb_alloc_color_planes_reply_t
  -- * 

   type xcb_alloc_color_planes_reply_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_alloc_color_planes_reply_t_array2620 is array (0 .. 7) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_alloc_color_planes_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3966
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3967
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3968
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3969
      pixels_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3970
      pad1 : aliased xcb_alloc_color_planes_reply_t_array1823;  -- /usr/include/xcb/xproto.h:3971
      red_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3972
      green_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3973
      blue_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3974
      pad2 : aliased xcb_alloc_color_planes_reply_t_array2620;  -- /usr/include/xcb/xproto.h:3975
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3965

  --* Opcode for xcb_free_colors.  
  --*
  -- * @brief xcb_free_colors_request_t
  -- * 

   type xcb_free_colors_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3985
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:3986
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:3987
      cmap : aliased xcb_colormap_t;  -- /usr/include/xcb/xproto.h:3988
      plane_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:3989
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:3984

   subtype xcb_color_flag_t is unsigned;
   XCB_COLOR_FLAG_RED : constant unsigned := 1;
   XCB_COLOR_FLAG_GREEN : constant unsigned := 2;
   XCB_COLOR_FLAG_BLUE : constant unsigned := 4;  -- /usr/include/xcb/xproto.h:3992

  --*
  -- * @brief xcb_coloritem_t
  -- * 

   type xcb_coloritem_t is record
      pixel : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:4002
      red : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4003
      green : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4004
      blue : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4005
      flags : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4006
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4007
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4001

  --*
  -- * @brief xcb_coloritem_iterator_t
  -- * 

   type xcb_coloritem_iterator_t is record
      data : access xcb_coloritem_t;  -- /usr/include/xcb/xproto.h:4014
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:4015
      index : aliased int;  -- /usr/include/xcb/xproto.h:4016
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4013

  --* Opcode for xcb_store_colors.  
  --*
  -- * @brief xcb_store_colors_request_t
  -- * 

   type xcb_store_colors_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4026
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4027
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4028
      cmap : aliased xcb_colormap_t;  -- /usr/include/xcb/xproto.h:4029
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4025

  --* Opcode for xcb_store_named_color.  
  --*
  -- * @brief xcb_store_named_color_request_t
  -- * 

   type xcb_store_named_color_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_store_named_color_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4039
      flags : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4040
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4041
      cmap : aliased xcb_colormap_t;  -- /usr/include/xcb/xproto.h:4042
      pixel : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:4043
      name_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4044
      pad0 : aliased xcb_store_named_color_request_t_array1823;  -- /usr/include/xcb/xproto.h:4045
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4038

  --*
  -- * @brief xcb_rgb_t
  -- * 

   type xcb_rgb_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_rgb_t is record
      red : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4052
      green : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4053
      blue : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4054
      pad0 : aliased xcb_rgb_t_array1823;  -- /usr/include/xcb/xproto.h:4055
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4051

  --*
  -- * @brief xcb_rgb_iterator_t
  -- * 

   type xcb_rgb_iterator_t is record
      data : access xcb_rgb_t;  -- /usr/include/xcb/xproto.h:4062
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:4063
      index : aliased int;  -- /usr/include/xcb/xproto.h:4064
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4061

  --*
  -- * @brief xcb_query_colors_cookie_t
  -- * 

   type xcb_query_colors_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:4071
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4070

  --* Opcode for xcb_query_colors.  
  --*
  -- * @brief xcb_query_colors_request_t
  -- * 

   type xcb_query_colors_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4081
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4082
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4083
      cmap : aliased xcb_colormap_t;  -- /usr/include/xcb/xproto.h:4084
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4080

  --*
  -- * @brief xcb_query_colors_reply_t
  -- * 

   type xcb_query_colors_reply_t_array2015 is array (0 .. 21) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_query_colors_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4091
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4092
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4093
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:4094
      colors_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4095
      pad1 : aliased xcb_query_colors_reply_t_array2015;  -- /usr/include/xcb/xproto.h:4096
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4090

  --*
  -- * @brief xcb_lookup_color_cookie_t
  -- * 

   type xcb_lookup_color_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:4103
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4102

  --* Opcode for xcb_lookup_color.  
  --*
  -- * @brief xcb_lookup_color_request_t
  -- * 

   type xcb_lookup_color_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_lookup_color_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4113
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4114
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4115
      cmap : aliased xcb_colormap_t;  -- /usr/include/xcb/xproto.h:4116
      name_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4117
      pad1 : aliased xcb_lookup_color_request_t_array1823;  -- /usr/include/xcb/xproto.h:4118
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4112

  --*
  -- * @brief xcb_lookup_color_reply_t
  -- * 

   type xcb_lookup_color_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4125
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4126
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4127
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:4128
      exact_red : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4129
      exact_green : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4130
      exact_blue : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4131
      visual_red : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4132
      visual_green : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4133
      visual_blue : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4134
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4124

   type xcb_pixmap_enum_t is 
     (XCB_PIXMAP_NONE)
   with Convention => C;  -- /usr/include/xcb/xproto.h:4137

  --* Opcode for xcb_create_cursor.  
  --*
  -- * @brief xcb_create_cursor_request_t
  -- * 

   type xcb_create_cursor_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4148
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4149
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4150
      cid : aliased xcb_cursor_t;  -- /usr/include/xcb/xproto.h:4151
      source : aliased xcb_pixmap_t;  -- /usr/include/xcb/xproto.h:4152
      mask : aliased xcb_pixmap_t;  -- /usr/include/xcb/xproto.h:4153
      fore_red : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4154
      fore_green : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4155
      fore_blue : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4156
      back_red : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4157
      back_green : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4158
      back_blue : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4159
      x : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4160
      y : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4161
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4147

   type xcb_font_enum_t is 
     (XCB_FONT_NONE)
   with Convention => C;  -- /usr/include/xcb/xproto.h:4164

  --* Opcode for xcb_create_glyph_cursor.  
  --*
  -- * @brief xcb_create_glyph_cursor_request_t
  -- * 

   type xcb_create_glyph_cursor_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4175
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4176
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4177
      cid : aliased xcb_cursor_t;  -- /usr/include/xcb/xproto.h:4178
      source_font : aliased xcb_font_t;  -- /usr/include/xcb/xproto.h:4179
      mask_font : aliased xcb_font_t;  -- /usr/include/xcb/xproto.h:4180
      source_char : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4181
      mask_char : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4182
      fore_red : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4183
      fore_green : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4184
      fore_blue : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4185
      back_red : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4186
      back_green : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4187
      back_blue : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4188
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4174

  --* Opcode for xcb_free_cursor.  
  --*
  -- * @brief xcb_free_cursor_request_t
  -- * 

   type xcb_free_cursor_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4198
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4199
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4200
      cursor : aliased xcb_cursor_t;  -- /usr/include/xcb/xproto.h:4201
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4197

  --* Opcode for xcb_recolor_cursor.  
  --*
  -- * @brief xcb_recolor_cursor_request_t
  -- * 

   type xcb_recolor_cursor_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4211
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4212
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4213
      cursor : aliased xcb_cursor_t;  -- /usr/include/xcb/xproto.h:4214
      fore_red : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4215
      fore_green : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4216
      fore_blue : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4217
      back_red : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4218
      back_green : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4219
      back_blue : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4220
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4210

   type xcb_query_shape_of_t is 
     (XCB_QUERY_SHAPE_OF_LARGEST_CURSOR,
      XCB_QUERY_SHAPE_OF_FASTEST_TILE,
      XCB_QUERY_SHAPE_OF_FASTEST_STIPPLE)
   with Convention => C;  -- /usr/include/xcb/xproto.h:4223

  --*
  -- * @brief xcb_query_best_size_cookie_t
  -- * 

   type xcb_query_best_size_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:4233
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4232

  --* Opcode for xcb_query_best_size.  
  --*
  -- * @brief xcb_query_best_size_request_t
  -- * 

   type xcb_query_best_size_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4243
      u_class : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4244
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4245
      drawable : aliased xcb_drawable_t;  -- /usr/include/xcb/xproto.h:4246
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4247
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4248
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4242

  --*
  -- * @brief xcb_query_best_size_reply_t
  -- * 

   type xcb_query_best_size_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4255
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4256
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4257
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:4258
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4259
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4260
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4254

  --*
  -- * @brief xcb_query_extension_cookie_t
  -- * 

   type xcb_query_extension_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:4267
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4266

  --* Opcode for xcb_query_extension.  
  --*
  -- * @brief xcb_query_extension_request_t
  -- * 

   type xcb_query_extension_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_query_extension_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4277
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4278
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4279
      name_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4280
      pad1 : aliased xcb_query_extension_request_t_array1823;  -- /usr/include/xcb/xproto.h:4281
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4276

  --*
  -- * @brief xcb_query_extension_reply_t
  -- * 

   type xcb_query_extension_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4288
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4289
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4290
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:4291
      present : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4292
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4293
      first_event : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4294
      first_error : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4295
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4287

  --*
  -- * @brief xcb_list_extensions_cookie_t
  -- * 

   type xcb_list_extensions_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:4302
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4301

  --* Opcode for xcb_list_extensions.  
  --*
  -- * @brief xcb_list_extensions_request_t
  -- * 

   type xcb_list_extensions_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4312
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4313
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4314
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4311

  --*
  -- * @brief xcb_list_extensions_reply_t
  -- * 

   type xcb_list_extensions_reply_t_array2717 is array (0 .. 23) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_list_extensions_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4321
      names_len : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4322
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4323
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:4324
      pad0 : aliased xcb_list_extensions_reply_t_array2717;  -- /usr/include/xcb/xproto.h:4325
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4320

  --* Opcode for xcb_change_keyboard_mapping.  
  --*
  -- * @brief xcb_change_keyboard_mapping_request_t
  -- * 

   type xcb_change_keyboard_mapping_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_change_keyboard_mapping_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4335
      keycode_count : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4336
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4337
      first_keycode : aliased xcb_keycode_t;  -- /usr/include/xcb/xproto.h:4338
      keysyms_per_keycode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4339
      pad0 : aliased xcb_change_keyboard_mapping_request_t_array1823;  -- /usr/include/xcb/xproto.h:4340
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4334

  --*
  -- * @brief xcb_get_keyboard_mapping_cookie_t
  -- * 

   type xcb_get_keyboard_mapping_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:4347
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4346

  --* Opcode for xcb_get_keyboard_mapping.  
  --*
  -- * @brief xcb_get_keyboard_mapping_request_t
  -- * 

   type xcb_get_keyboard_mapping_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4357
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4358
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4359
      first_keycode : aliased xcb_keycode_t;  -- /usr/include/xcb/xproto.h:4360
      count : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4361
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4356

  --*
  -- * @brief xcb_get_keyboard_mapping_reply_t
  -- * 

   type xcb_get_keyboard_mapping_reply_t_array2717 is array (0 .. 23) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_get_keyboard_mapping_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4368
      keysyms_per_keycode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4369
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4370
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:4371
      pad0 : aliased xcb_get_keyboard_mapping_reply_t_array2717;  -- /usr/include/xcb/xproto.h:4372
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4367

   subtype xcb_kb_t is unsigned;
   XCB_KB_KEY_CLICK_PERCENT : constant unsigned := 1;
   XCB_KB_BELL_PERCENT : constant unsigned := 2;
   XCB_KB_BELL_PITCH : constant unsigned := 4;
   XCB_KB_BELL_DURATION : constant unsigned := 8;
   XCB_KB_LED : constant unsigned := 16;
   XCB_KB_LED_MODE : constant unsigned := 32;
   XCB_KB_KEY : constant unsigned := 64;
   XCB_KB_AUTO_REPEAT_MODE : constant unsigned := 128;  -- /usr/include/xcb/xproto.h:4375

   type xcb_led_mode_t is 
     (XCB_LED_MODE_OFF,
      XCB_LED_MODE_ON)
   with Convention => C;  -- /usr/include/xcb/xproto.h:4386

   type xcb_auto_repeat_mode_t is 
     (XCB_AUTO_REPEAT_MODE_OFF,
      XCB_AUTO_REPEAT_MODE_ON,
      XCB_AUTO_REPEAT_MODE_DEFAULT)
   with Convention => C;  -- /usr/include/xcb/xproto.h:4391

  --*
  -- * @brief xcb_change_keyboard_control_value_list_t
  -- * 

   type xcb_change_keyboard_control_value_list_t is record
      key_click_percent : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/xproto.h:4401
      bell_percent : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/xproto.h:4402
      bell_pitch : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/xproto.h:4403
      bell_duration : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/xproto.h:4404
      led : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:4405
      led_mode : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:4406
      key : aliased xcb_keycode32_t;  -- /usr/include/xcb/xproto.h:4407
      auto_repeat_mode : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:4408
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4400

  --* Opcode for xcb_change_keyboard_control.  
  --*
  -- * @brief xcb_change_keyboard_control_request_t
  -- * 

   type xcb_change_keyboard_control_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4418
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4419
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4420
      value_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:4421
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4417

  --*
  -- * @brief xcb_get_keyboard_control_cookie_t
  -- * 

   type xcb_get_keyboard_control_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:4428
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4427

  --* Opcode for xcb_get_keyboard_control.  
  --*
  -- * @brief xcb_get_keyboard_control_request_t
  -- * 

   type xcb_get_keyboard_control_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4438
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4439
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4440
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4437

  --*
  -- * @brief xcb_get_keyboard_control_reply_t
  -- * 

   type xcb_get_keyboard_control_reply_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_get_keyboard_control_reply_t_array2340 is array (0 .. 31) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_get_keyboard_control_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4447
      global_auto_repeat : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4448
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4449
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:4450
      led_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:4451
      key_click_percent : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4452
      bell_percent : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4453
      bell_pitch : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4454
      bell_duration : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4455
      pad0 : aliased xcb_get_keyboard_control_reply_t_array1823;  -- /usr/include/xcb/xproto.h:4456
      auto_repeats : aliased xcb_get_keyboard_control_reply_t_array2340;  -- /usr/include/xcb/xproto.h:4457
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4446

  --* Opcode for xcb_bell.  
  --*
  -- * @brief xcb_bell_request_t
  -- * 

   type xcb_bell_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4467
      percent : aliased bits_stdint_intn_h.int8_t;  -- /usr/include/xcb/xproto.h:4468
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4469
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4466

  --* Opcode for xcb_change_pointer_control.  
  --*
  -- * @brief xcb_change_pointer_control_request_t
  -- * 

   type xcb_change_pointer_control_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4479
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4480
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4481
      acceleration_numerator : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:4482
      acceleration_denominator : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:4483
      threshold : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:4484
      do_acceleration : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4485
      do_threshold : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4486
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4478

  --*
  -- * @brief xcb_get_pointer_control_cookie_t
  -- * 

   type xcb_get_pointer_control_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:4493
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4492

  --* Opcode for xcb_get_pointer_control.  
  --*
  -- * @brief xcb_get_pointer_control_request_t
  -- * 

   type xcb_get_pointer_control_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4503
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4504
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4505
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4502

  --*
  -- * @brief xcb_get_pointer_control_reply_t
  -- * 

   type xcb_get_pointer_control_reply_t_array2771 is array (0 .. 17) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_get_pointer_control_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4512
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4513
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4514
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:4515
      acceleration_numerator : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4516
      acceleration_denominator : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4517
      threshold : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4518
      pad1 : aliased xcb_get_pointer_control_reply_t_array2771;  -- /usr/include/xcb/xproto.h:4519
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4511

   type xcb_blanking_t is 
     (XCB_BLANKING_NOT_PREFERRED,
      XCB_BLANKING_PREFERRED,
      XCB_BLANKING_DEFAULT)
   with Convention => C;  -- /usr/include/xcb/xproto.h:4522

   type xcb_exposures_t is 
     (XCB_EXPOSURES_NOT_ALLOWED,
      XCB_EXPOSURES_ALLOWED,
      XCB_EXPOSURES_DEFAULT)
   with Convention => C;  -- /usr/include/xcb/xproto.h:4528

  --* Opcode for xcb_set_screen_saver.  
  --*
  -- * @brief xcb_set_screen_saver_request_t
  -- * 

   type xcb_set_screen_saver_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4541
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4542
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4543
      timeout : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:4544
      interval : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:4545
      prefer_blanking : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4546
      allow_exposures : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4547
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4540

  --*
  -- * @brief xcb_get_screen_saver_cookie_t
  -- * 

   type xcb_get_screen_saver_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:4554
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4553

  --* Opcode for xcb_get_screen_saver.  
  --*
  -- * @brief xcb_get_screen_saver_request_t
  -- * 

   type xcb_get_screen_saver_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4564
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4565
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4566
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4563

  --*
  -- * @brief xcb_get_screen_saver_reply_t
  -- * 

   type xcb_get_screen_saver_reply_t_array2771 is array (0 .. 17) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_get_screen_saver_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4573
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4574
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4575
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:4576
      timeout : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4577
      interval : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4578
      prefer_blanking : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4579
      allow_exposures : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4580
      pad1 : aliased xcb_get_screen_saver_reply_t_array2771;  -- /usr/include/xcb/xproto.h:4581
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4572

   type xcb_host_mode_t is 
     (XCB_HOST_MODE_INSERT,
      XCB_HOST_MODE_DELETE)
   with Convention => C;  -- /usr/include/xcb/xproto.h:4584

   subtype xcb_family_t is unsigned;
   XCB_FAMILY_INTERNET : constant unsigned := 0;
   XCB_FAMILY_DECNET : constant unsigned := 1;
   XCB_FAMILY_CHAOS : constant unsigned := 2;
   XCB_FAMILY_SERVER_INTERPRETED : constant unsigned := 5;
   XCB_FAMILY_INTERNET_6 : constant unsigned := 6;  -- /usr/include/xcb/xproto.h:4589

  --* Opcode for xcb_change_hosts.  
  --*
  -- * @brief xcb_change_hosts_request_t
  -- * 

   type xcb_change_hosts_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4604
      mode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4605
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4606
      family : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4607
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4608
      address_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4609
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4603

  --*
  -- * @brief xcb_host_t
  -- * 

   type xcb_host_t is record
      family : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4616
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4617
      address_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4618
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4615

  --*
  -- * @brief xcb_host_iterator_t
  -- * 

   type xcb_host_iterator_t is record
      data : access xcb_host_t;  -- /usr/include/xcb/xproto.h:4625
      c_rem : aliased int;  -- /usr/include/xcb/xproto.h:4626
      index : aliased int;  -- /usr/include/xcb/xproto.h:4627
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4624

  --*
  -- * @brief xcb_list_hosts_cookie_t
  -- * 

   type xcb_list_hosts_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:4634
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4633

  --* Opcode for xcb_list_hosts.  
  --*
  -- * @brief xcb_list_hosts_request_t
  -- * 

   type xcb_list_hosts_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4644
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4645
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4646
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4643

  --*
  -- * @brief xcb_list_hosts_reply_t
  -- * 

   type xcb_list_hosts_reply_t_array2015 is array (0 .. 21) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_list_hosts_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4653
      mode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4654
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4655
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:4656
      hosts_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4657
      pad0 : aliased xcb_list_hosts_reply_t_array2015;  -- /usr/include/xcb/xproto.h:4658
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4652

   type xcb_access_control_t is 
     (XCB_ACCESS_CONTROL_DISABLE,
      XCB_ACCESS_CONTROL_ENABLE)
   with Convention => C;  -- /usr/include/xcb/xproto.h:4661

  --* Opcode for xcb_set_access_control.  
  --*
  -- * @brief xcb_set_access_control_request_t
  -- * 

   type xcb_set_access_control_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4673
      mode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4674
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4675
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4672

   type xcb_close_down_t is 
     (XCB_CLOSE_DOWN_DESTROY_ALL,
      XCB_CLOSE_DOWN_RETAIN_PERMANENT,
      XCB_CLOSE_DOWN_RETAIN_TEMPORARY)
   with Convention => C;  -- /usr/include/xcb/xproto.h:4678

  --* Opcode for xcb_set_close_down_mode.  
  --*
  -- * @brief xcb_set_close_down_mode_request_t
  -- * 

   type xcb_set_close_down_mode_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4691
      mode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4692
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4693
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4690

   type xcb_kill_t is 
     (XCB_KILL_ALL_TEMPORARY)
   with Convention => C;  -- /usr/include/xcb/xproto.h:4696

  --* Opcode for xcb_kill_client.  
  --*
  -- * @brief xcb_kill_client_request_t
  -- * 

   type xcb_kill_client_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4707
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4708
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4709
      resource : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:4710
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4706

  --* Opcode for xcb_rotate_properties.  
  --*
  -- * @brief xcb_rotate_properties_request_t
  -- * 

   type xcb_rotate_properties_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4720
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4721
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4722
      window : aliased xcb_window_t;  -- /usr/include/xcb/xproto.h:4723
      atoms_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4724
      c_delta : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xproto.h:4725
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4719

   type xcb_screen_saver_t is 
     (XCB_SCREEN_SAVER_RESET,
      XCB_SCREEN_SAVER_ACTIVE)
   with Convention => C;  -- /usr/include/xcb/xproto.h:4728

  --* Opcode for xcb_force_screen_saver.  
  --*
  -- * @brief xcb_force_screen_saver_request_t
  -- * 

   type xcb_force_screen_saver_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4740
      mode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4741
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4742
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4739

   type xcb_mapping_status_t is 
     (XCB_MAPPING_STATUS_SUCCESS,
      XCB_MAPPING_STATUS_BUSY,
      XCB_MAPPING_STATUS_FAILURE)
   with Convention => C;  -- /usr/include/xcb/xproto.h:4745

  --*
  -- * @brief xcb_set_pointer_mapping_cookie_t
  -- * 

   type xcb_set_pointer_mapping_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:4755
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4754

  --* Opcode for xcb_set_pointer_mapping.  
  --*
  -- * @brief xcb_set_pointer_mapping_request_t
  -- * 

   type xcb_set_pointer_mapping_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4765
      map_len : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4766
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4767
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4764

  --*
  -- * @brief xcb_set_pointer_mapping_reply_t
  -- * 

   type xcb_set_pointer_mapping_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4774
      status : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4775
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4776
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:4777
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4773

  --*
  -- * @brief xcb_get_pointer_mapping_cookie_t
  -- * 

   type xcb_get_pointer_mapping_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:4784
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4783

  --* Opcode for xcb_get_pointer_mapping.  
  --*
  -- * @brief xcb_get_pointer_mapping_request_t
  -- * 

   type xcb_get_pointer_mapping_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4794
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4795
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4796
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4793

  --*
  -- * @brief xcb_get_pointer_mapping_reply_t
  -- * 

   type xcb_get_pointer_mapping_reply_t_array2717 is array (0 .. 23) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_get_pointer_mapping_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4803
      map_len : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4804
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4805
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:4806
      pad0 : aliased xcb_get_pointer_mapping_reply_t_array2717;  -- /usr/include/xcb/xproto.h:4807
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4802

   type xcb_map_index_t is 
     (XCB_MAP_INDEX_SHIFT,
      XCB_MAP_INDEX_LOCK,
      XCB_MAP_INDEX_CONTROL,
      XCB_MAP_INDEX_1,
      XCB_MAP_INDEX_2,
      XCB_MAP_INDEX_3,
      XCB_MAP_INDEX_4,
      XCB_MAP_INDEX_5)
   with Convention => C;  -- /usr/include/xcb/xproto.h:4810

  --*
  -- * @brief xcb_set_modifier_mapping_cookie_t
  -- * 

   type xcb_set_modifier_mapping_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:4825
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4824

  --* Opcode for xcb_set_modifier_mapping.  
  --*
  -- * @brief xcb_set_modifier_mapping_request_t
  -- * 

   type xcb_set_modifier_mapping_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4835
      keycodes_per_modifier : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4836
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4837
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4834

  --*
  -- * @brief xcb_set_modifier_mapping_reply_t
  -- * 

   type xcb_set_modifier_mapping_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4844
      status : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4845
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4846
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:4847
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4843

  --*
  -- * @brief xcb_get_modifier_mapping_cookie_t
  -- * 

   type xcb_get_modifier_mapping_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xproto.h:4854
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4853

  --* Opcode for xcb_get_modifier_mapping.  
  --*
  -- * @brief xcb_get_modifier_mapping_request_t
  -- * 

   type xcb_get_modifier_mapping_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4864
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4865
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4866
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4863

  --*
  -- * @brief xcb_get_modifier_mapping_reply_t
  -- * 

   type xcb_get_modifier_mapping_reply_t_array2717 is array (0 .. 23) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_get_modifier_mapping_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4873
      keycodes_per_modifier : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4874
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4875
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xproto.h:4876
      pad0 : aliased xcb_get_modifier_mapping_reply_t_array2717;  -- /usr/include/xcb/xproto.h:4877
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4872

  --* Opcode for xcb_no_operation.  
  --*
  -- * @brief xcb_no_operation_request_t
  -- * 

   type xcb_no_operation_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4887
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xproto.h:4888
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xproto.h:4889
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xproto.h:4886

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_char2b_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_char2b_t)
  --  

   procedure xcb_char2b_next (i : access xcb_char2b_iterator_t)  -- /usr/include/xcb/xproto.h:4901
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_char2b_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_char2b_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_char2b_end (i : xcb_char2b_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:4913
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_char2b_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_window_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_window_t)
  --  

   procedure xcb_window_next (i : access xcb_window_iterator_t)  -- /usr/include/xcb/xproto.h:4924
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_window_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_window_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_window_end (i : xcb_window_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:4936
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_window_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_pixmap_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_pixmap_t)
  --  

   procedure xcb_pixmap_next (i : access xcb_pixmap_iterator_t)  -- /usr/include/xcb/xproto.h:4947
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_pixmap_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_pixmap_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_pixmap_end (i : xcb_pixmap_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:4959
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_pixmap_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_cursor_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_cursor_t)
  --  

   procedure xcb_cursor_next (i : access xcb_cursor_iterator_t)  -- /usr/include/xcb/xproto.h:4970
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_cursor_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_cursor_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_cursor_end (i : xcb_cursor_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:4982
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_cursor_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_font_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_font_t)
  --  

   procedure xcb_font_next (i : access xcb_font_iterator_t)  -- /usr/include/xcb/xproto.h:4993
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_font_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_font_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_font_end (i : xcb_font_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5005
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_font_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_gcontext_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_gcontext_t)
  --  

   procedure xcb_gcontext_next (i : access xcb_gcontext_iterator_t)  -- /usr/include/xcb/xproto.h:5016
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_gcontext_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_gcontext_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_gcontext_end (i : xcb_gcontext_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5028
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_gcontext_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_colormap_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_colormap_t)
  --  

   procedure xcb_colormap_next (i : access xcb_colormap_iterator_t)  -- /usr/include/xcb/xproto.h:5039
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_colormap_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_colormap_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_colormap_end (i : xcb_colormap_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5051
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_colormap_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_atom_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_atom_t)
  --  

   procedure xcb_atom_next (i : access xcb_atom_iterator_t)  -- /usr/include/xcb/xproto.h:5062
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_atom_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_atom_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_atom_end (i : xcb_atom_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5074
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_atom_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_drawable_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_drawable_t)
  --  

   procedure xcb_drawable_next (i : access xcb_drawable_iterator_t)  -- /usr/include/xcb/xproto.h:5085
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_drawable_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_drawable_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_drawable_end (i : xcb_drawable_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5097
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_drawable_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_fontable_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_fontable_t)
  --  

   procedure xcb_fontable_next (i : access xcb_fontable_iterator_t)  -- /usr/include/xcb/xproto.h:5108
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_fontable_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_fontable_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_fontable_end (i : xcb_fontable_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5120
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_fontable_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_bool32_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_bool32_t)
  --  

   procedure xcb_bool32_next (i : access xcb_bool32_iterator_t)  -- /usr/include/xcb/xproto.h:5131
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_bool32_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_bool32_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_bool32_end (i : xcb_bool32_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5143
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_bool32_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_visualid_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_visualid_t)
  --  

   procedure xcb_visualid_next (i : access xcb_visualid_iterator_t)  -- /usr/include/xcb/xproto.h:5154
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_visualid_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_visualid_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_visualid_end (i : xcb_visualid_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5166
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_visualid_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_timestamp_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_timestamp_t)
  --  

   procedure xcb_timestamp_next (i : access xcb_timestamp_iterator_t)  -- /usr/include/xcb/xproto.h:5177
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_timestamp_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_timestamp_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_timestamp_end (i : xcb_timestamp_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5189
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_timestamp_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_keysym_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_keysym_t)
  --  

   procedure xcb_keysym_next (i : access xcb_keysym_iterator_t)  -- /usr/include/xcb/xproto.h:5200
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_keysym_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_keysym_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_keysym_end (i : xcb_keysym_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5212
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_keysym_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_keycode_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_keycode_t)
  --  

   procedure xcb_keycode_next (i : access xcb_keycode_iterator_t)  -- /usr/include/xcb/xproto.h:5223
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_keycode_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_keycode_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_keycode_end (i : xcb_keycode_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5235
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_keycode_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_keycode32_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_keycode32_t)
  --  

   procedure xcb_keycode32_next (i : access xcb_keycode32_iterator_t)  -- /usr/include/xcb/xproto.h:5246
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_keycode32_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_keycode32_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_keycode32_end (i : xcb_keycode32_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5258
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_keycode32_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_button_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_button_t)
  --  

   procedure xcb_button_next (i : access xcb_button_iterator_t)  -- /usr/include/xcb/xproto.h:5269
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_button_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_button_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_button_end (i : xcb_button_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5281
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_button_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_point_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_point_t)
  --  

   procedure xcb_point_next (i : access xcb_point_iterator_t)  -- /usr/include/xcb/xproto.h:5292
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_point_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_point_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_point_end (i : xcb_point_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5304
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_point_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_rectangle_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_rectangle_t)
  --  

   procedure xcb_rectangle_next (i : access xcb_rectangle_iterator_t)  -- /usr/include/xcb/xproto.h:5315
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_rectangle_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_rectangle_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_rectangle_end (i : xcb_rectangle_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5327
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_rectangle_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_arc_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_arc_t)
  --  

   procedure xcb_arc_next (i : access xcb_arc_iterator_t)  -- /usr/include/xcb/xproto.h:5338
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_arc_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_arc_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_arc_end (i : xcb_arc_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5350
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_arc_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_format_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_format_t)
  --  

   procedure xcb_format_next (i : access xcb_format_iterator_t)  -- /usr/include/xcb/xproto.h:5361
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_format_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_format_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_format_end (i : xcb_format_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5373
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_format_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_visualtype_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_visualtype_t)
  --  

   procedure xcb_visualtype_next (i : access xcb_visualtype_iterator_t)  -- /usr/include/xcb/xproto.h:5384
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_visualtype_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_visualtype_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_visualtype_end (i : xcb_visualtype_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5396
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_visualtype_end";

   function xcb_depth_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:5399
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_depth_sizeof";

   function xcb_depth_visuals (R : access constant xcb_depth_t) return access xcb_visualtype_t  -- /usr/include/xcb/xproto.h:5402
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_depth_visuals";

   function xcb_depth_visuals_length (R : access constant xcb_depth_t) return int  -- /usr/include/xcb/xproto.h:5405
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_depth_visuals_length";

   function xcb_depth_visuals_iterator (R : access constant xcb_depth_t) return xcb_visualtype_iterator_t  -- /usr/include/xcb/xproto.h:5408
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_depth_visuals_iterator";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_depth_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_depth_t)
  --  

   procedure xcb_depth_next (i : access xcb_depth_iterator_t)  -- /usr/include/xcb/xproto.h:5419
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_depth_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_depth_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_depth_end (i : xcb_depth_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5431
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_depth_end";

   function xcb_screen_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:5434
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_screen_sizeof";

   function xcb_screen_allowed_depths_length (R : access constant xcb_screen_t) return int  -- /usr/include/xcb/xproto.h:5437
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_screen_allowed_depths_length";

   function xcb_screen_allowed_depths_iterator (R : access constant xcb_screen_t) return xcb_depth_iterator_t  -- /usr/include/xcb/xproto.h:5440
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_screen_allowed_depths_iterator";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_screen_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_screen_t)
  --  

   procedure xcb_screen_next (i : access xcb_screen_iterator_t)  -- /usr/include/xcb/xproto.h:5451
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_screen_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_screen_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_screen_end (i : xcb_screen_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5463
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_screen_end";

   function xcb_setup_request_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:5466
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_request_sizeof";

   function xcb_setup_request_authorization_protocol_name (R : access constant xcb_setup_request_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/xproto.h:5469
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_request_authorization_protocol_name";

   function xcb_setup_request_authorization_protocol_name_length (R : access constant xcb_setup_request_t) return int  -- /usr/include/xcb/xproto.h:5472
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_request_authorization_protocol_name_length";

   function xcb_setup_request_authorization_protocol_name_end (R : access constant xcb_setup_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5475
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_request_authorization_protocol_name_end";

   function xcb_setup_request_authorization_protocol_data (R : access constant xcb_setup_request_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/xproto.h:5478
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_request_authorization_protocol_data";

   function xcb_setup_request_authorization_protocol_data_length (R : access constant xcb_setup_request_t) return int  -- /usr/include/xcb/xproto.h:5481
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_request_authorization_protocol_data_length";

   function xcb_setup_request_authorization_protocol_data_end (R : access constant xcb_setup_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5484
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_request_authorization_protocol_data_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_setup_request_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_setup_request_t)
  --  

   procedure xcb_setup_request_next (i : access xcb_setup_request_iterator_t)  -- /usr/include/xcb/xproto.h:5495
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_request_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_setup_request_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_setup_request_end (i : xcb_setup_request_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5507
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_request_end";

   function xcb_setup_failed_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:5510
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_failed_sizeof";

   function xcb_setup_failed_reason (R : access constant xcb_setup_failed_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/xproto.h:5513
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_failed_reason";

   function xcb_setup_failed_reason_length (R : access constant xcb_setup_failed_t) return int  -- /usr/include/xcb/xproto.h:5516
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_failed_reason_length";

   function xcb_setup_failed_reason_end (R : access constant xcb_setup_failed_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5519
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_failed_reason_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_setup_failed_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_setup_failed_t)
  --  

   procedure xcb_setup_failed_next (i : access xcb_setup_failed_iterator_t)  -- /usr/include/xcb/xproto.h:5530
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_failed_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_setup_failed_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_setup_failed_end (i : xcb_setup_failed_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5542
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_failed_end";

   function xcb_setup_authenticate_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:5545
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_authenticate_sizeof";

   function xcb_setup_authenticate_reason (R : access constant xcb_setup_authenticate_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/xproto.h:5548
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_authenticate_reason";

   function xcb_setup_authenticate_reason_length (R : access constant xcb_setup_authenticate_t) return int  -- /usr/include/xcb/xproto.h:5551
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_authenticate_reason_length";

   function xcb_setup_authenticate_reason_end (R : access constant xcb_setup_authenticate_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5554
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_authenticate_reason_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_setup_authenticate_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_setup_authenticate_t)
  --  

   procedure xcb_setup_authenticate_next (i : access xcb_setup_authenticate_iterator_t)  -- /usr/include/xcb/xproto.h:5565
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_authenticate_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_setup_authenticate_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_setup_authenticate_end (i : xcb_setup_authenticate_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5577
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_authenticate_end";

   function xcb_setup_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:5580
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_sizeof";

   function xcb_setup_vendor (R : access constant xcb_setup_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/xproto.h:5583
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_vendor";

   function xcb_setup_vendor_length (R : access constant xcb_setup_t) return int  -- /usr/include/xcb/xproto.h:5586
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_vendor_length";

   function xcb_setup_vendor_end (R : access constant xcb_setup_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5589
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_vendor_end";

   function xcb_setup_pixmap_formats (R : access constant xcb_setup_t) return access xcb_format_t  -- /usr/include/xcb/xproto.h:5592
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_pixmap_formats";

   function xcb_setup_pixmap_formats_length (R : access constant xcb_setup_t) return int  -- /usr/include/xcb/xproto.h:5595
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_pixmap_formats_length";

   function xcb_setup_pixmap_formats_iterator (R : access constant xcb_setup_t) return xcb_format_iterator_t  -- /usr/include/xcb/xproto.h:5598
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_pixmap_formats_iterator";

   function xcb_setup_roots_length (R : access constant xcb_setup_t) return int  -- /usr/include/xcb/xproto.h:5601
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_roots_length";

   function xcb_setup_roots_iterator (R : access constant xcb_setup_t) return xcb_screen_iterator_t  -- /usr/include/xcb/xproto.h:5604
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_roots_iterator";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_setup_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_setup_t)
  --  

   procedure xcb_setup_next (i : access xcb_setup_iterator_t)  -- /usr/include/xcb/xproto.h:5615
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_setup_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_setup_end (i : xcb_setup_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5627
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_setup_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_client_message_data_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_client_message_data_t)
  --  

   procedure xcb_client_message_data_next (i : access xcb_client_message_data_iterator_t)  -- /usr/include/xcb/xproto.h:5638
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_client_message_data_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_client_message_data_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_client_message_data_end (i : xcb_client_message_data_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:5650
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_client_message_data_end";

   function xcb_create_window_value_list_serialize
     (u_buffer : System.Address;
      value_mask : bits_stdint_uintn_h.uint32_t;
      u_aux : access constant xcb_create_window_value_list_t) return int  -- /usr/include/xcb/xproto.h:5653
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_create_window_value_list_serialize";

   function xcb_create_window_value_list_unpack
     (u_buffer : System.Address;
      value_mask : bits_stdint_uintn_h.uint32_t;
      u_aux : access xcb_create_window_value_list_t) return int  -- /usr/include/xcb/xproto.h:5658
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_create_window_value_list_unpack";

   function xcb_create_window_value_list_sizeof (u_buffer : System.Address; value_mask : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/xproto.h:5663
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_create_window_value_list_sizeof";

   function xcb_create_window_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:5667
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_create_window_sizeof";

  --*
  -- * @brief Creates a window
  -- *
  -- * @param c The connection
  -- * @param depth Specifies the new window's depth (TODO: what unit?).
  -- * \n
  -- * The special value `XCB_COPY_FROM_PARENT` means the depth is taken from the
  -- * \a parent window.
  -- * @param wid The ID with which you will refer to the new window, created by
  -- * `xcb_generate_id`.
  -- * @param parent The parent window of the new window.
  -- * @param x The X coordinate of the new window.
  -- * @param y The Y coordinate of the new window.
  -- * @param width The width of the new window.
  -- * @param height The height of the new window.
  -- * @param border_width TODO:
  -- * \n
  -- * Must be zero if the `class` is `InputOnly` or a `xcb_match_error_t` occurs.
  -- * @param _class A bitmask of #xcb_window_class_t values.
  -- * @param _class \n
  -- * @param visual Specifies the id for the new window's visual.
  -- * \n
  -- * The special value `XCB_COPY_FROM_PARENT` means the visual is taken from the
  -- * \a parent window.
  -- * @param value_mask A bitmask of #xcb_cw_t values.
  -- * @return A cookie
  -- *
  -- * Creates an unmapped window as child of the specified \a parent window. A
  -- * CreateNotify event will be generated. The new window is placed on top in the
  -- * stacking order with respect to siblings.
  -- * 
  -- * The coordinate system has the X axis horizontal and the Y axis vertical with
  -- * the origin [0, 0] at the upper-left corner. Coordinates are integral, in terms
  -- * of pixels, and coincide with pixel centers. Each window and pixmap has its own
  -- * coordinate system. For a window, the origin is inside the border at the inside,
  -- * upper-left corner.
  -- * 
  -- * The created window is not yet displayed (mapped), call `xcb_map_window` to
  -- * display it.
  -- * 
  -- * The created window will initially use the same cursor as its parent.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_create_window_checked
     (c : access xcb.xcb_connection_t;
      depth : bits_stdint_uintn_h.uint8_t;
      wid : xcb_window_t;
      parent : xcb_window_t;
      x : bits_stdint_intn_h.int16_t;
      y : bits_stdint_intn_h.int16_t;
      width : bits_stdint_uintn_h.uint16_t;
      height : bits_stdint_uintn_h.uint16_t;
      border_width : bits_stdint_uintn_h.uint16_t;
      u_class : bits_stdint_uintn_h.uint16_t;
      visual : xcb_visualid_t;
      value_mask : bits_stdint_uintn_h.uint32_t;
      value_list : System.Address) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:5716
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_create_window_checked";

  --*
  -- * @brief Creates a window
  -- *
  -- * @param c The connection
  -- * @param depth Specifies the new window's depth (TODO: what unit?).
  -- * \n
  -- * The special value `XCB_COPY_FROM_PARENT` means the depth is taken from the
  -- * \a parent window.
  -- * @param wid The ID with which you will refer to the new window, created by
  -- * `xcb_generate_id`.
  -- * @param parent The parent window of the new window.
  -- * @param x The X coordinate of the new window.
  -- * @param y The Y coordinate of the new window.
  -- * @param width The width of the new window.
  -- * @param height The height of the new window.
  -- * @param border_width TODO:
  -- * \n
  -- * Must be zero if the `class` is `InputOnly` or a `xcb_match_error_t` occurs.
  -- * @param _class A bitmask of #xcb_window_class_t values.
  -- * @param _class \n
  -- * @param visual Specifies the id for the new window's visual.
  -- * \n
  -- * The special value `XCB_COPY_FROM_PARENT` means the visual is taken from the
  -- * \a parent window.
  -- * @param value_mask A bitmask of #xcb_cw_t values.
  -- * @return A cookie
  -- *
  -- * Creates an unmapped window as child of the specified \a parent window. A
  -- * CreateNotify event will be generated. The new window is placed on top in the
  -- * stacking order with respect to siblings.
  -- * 
  -- * The coordinate system has the X axis horizontal and the Y axis vertical with
  -- * the origin [0, 0] at the upper-left corner. Coordinates are integral, in terms
  -- * of pixels, and coincide with pixel centers. Each window and pixmap has its own
  -- * coordinate system. For a window, the origin is inside the border at the inside,
  -- * upper-left corner.
  -- * 
  -- * The created window is not yet displayed (mapped), call `xcb_map_window` to
  -- * display it.
  -- * 
  -- * The created window will initially use the same cursor as its parent.
  -- *
  --  

   function xcb_create_window
     (c : access xcb.xcb_connection_t;
      depth : bits_stdint_uintn_h.uint8_t;
      wid : xcb_window_t;
      parent : xcb_window_t;
      x : bits_stdint_intn_h.int16_t;
      y : bits_stdint_intn_h.int16_t;
      width : bits_stdint_uintn_h.uint16_t;
      height : bits_stdint_uintn_h.uint16_t;
      border_width : bits_stdint_uintn_h.uint16_t;
      u_class : bits_stdint_uintn_h.uint16_t;
      visual : xcb_visualid_t;
      value_mask : bits_stdint_uintn_h.uint32_t;
      value_list : System.Address) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:5774
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_create_window";

  --*
  -- * @brief Creates a window
  -- *
  -- * @param c The connection
  -- * @param depth Specifies the new window's depth (TODO: what unit?).
  -- * \n
  -- * The special value `XCB_COPY_FROM_PARENT` means the depth is taken from the
  -- * \a parent window.
  -- * @param wid The ID with which you will refer to the new window, created by
  -- * `xcb_generate_id`.
  -- * @param parent The parent window of the new window.
  -- * @param x The X coordinate of the new window.
  -- * @param y The Y coordinate of the new window.
  -- * @param width The width of the new window.
  -- * @param height The height of the new window.
  -- * @param border_width TODO:
  -- * \n
  -- * Must be zero if the `class` is `InputOnly` or a `xcb_match_error_t` occurs.
  -- * @param _class A bitmask of #xcb_window_class_t values.
  -- * @param _class \n
  -- * @param visual Specifies the id for the new window's visual.
  -- * \n
  -- * The special value `XCB_COPY_FROM_PARENT` means the visual is taken from the
  -- * \a parent window.
  -- * @param value_mask A bitmask of #xcb_cw_t values.
  -- * @return A cookie
  -- *
  -- * Creates an unmapped window as child of the specified \a parent window. A
  -- * CreateNotify event will be generated. The new window is placed on top in the
  -- * stacking order with respect to siblings.
  -- * 
  -- * The coordinate system has the X axis horizontal and the Y axis vertical with
  -- * the origin [0, 0] at the upper-left corner. Coordinates are integral, in terms
  -- * of pixels, and coincide with pixel centers. Each window and pixmap has its own
  -- * coordinate system. For a window, the origin is inside the border at the inside,
  -- * upper-left corner.
  -- * 
  -- * The created window is not yet displayed (mapped), call `xcb_map_window` to
  -- * display it.
  -- * 
  -- * The created window will initially use the same cursor as its parent.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_create_window_aux_checked
     (c : access xcb.xcb_connection_t;
      depth : bits_stdint_uintn_h.uint8_t;
      wid : xcb_window_t;
      parent : xcb_window_t;
      x : bits_stdint_intn_h.int16_t;
      y : bits_stdint_intn_h.int16_t;
      width : bits_stdint_uintn_h.uint16_t;
      height : bits_stdint_uintn_h.uint16_t;
      border_width : bits_stdint_uintn_h.uint16_t;
      u_class : bits_stdint_uintn_h.uint16_t;
      visual : xcb_visualid_t;
      value_mask : bits_stdint_uintn_h.uint32_t;
      value_list : access constant xcb_create_window_value_list_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:5835
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_create_window_aux_checked";

  --*
  -- * @brief Creates a window
  -- *
  -- * @param c The connection
  -- * @param depth Specifies the new window's depth (TODO: what unit?).
  -- * \n
  -- * The special value `XCB_COPY_FROM_PARENT` means the depth is taken from the
  -- * \a parent window.
  -- * @param wid The ID with which you will refer to the new window, created by
  -- * `xcb_generate_id`.
  -- * @param parent The parent window of the new window.
  -- * @param x The X coordinate of the new window.
  -- * @param y The Y coordinate of the new window.
  -- * @param width The width of the new window.
  -- * @param height The height of the new window.
  -- * @param border_width TODO:
  -- * \n
  -- * Must be zero if the `class` is `InputOnly` or a `xcb_match_error_t` occurs.
  -- * @param _class A bitmask of #xcb_window_class_t values.
  -- * @param _class \n
  -- * @param visual Specifies the id for the new window's visual.
  -- * \n
  -- * The special value `XCB_COPY_FROM_PARENT` means the visual is taken from the
  -- * \a parent window.
  -- * @param value_mask A bitmask of #xcb_cw_t values.
  -- * @return A cookie
  -- *
  -- * Creates an unmapped window as child of the specified \a parent window. A
  -- * CreateNotify event will be generated. The new window is placed on top in the
  -- * stacking order with respect to siblings.
  -- * 
  -- * The coordinate system has the X axis horizontal and the Y axis vertical with
  -- * the origin [0, 0] at the upper-left corner. Coordinates are integral, in terms
  -- * of pixels, and coincide with pixel centers. Each window and pixmap has its own
  -- * coordinate system. For a window, the origin is inside the border at the inside,
  -- * upper-left corner.
  -- * 
  -- * The created window is not yet displayed (mapped), call `xcb_map_window` to
  -- * display it.
  -- * 
  -- * The created window will initially use the same cursor as its parent.
  -- *
  --  

   function xcb_create_window_aux
     (c : access xcb.xcb_connection_t;
      depth : bits_stdint_uintn_h.uint8_t;
      wid : xcb_window_t;
      parent : xcb_window_t;
      x : bits_stdint_intn_h.int16_t;
      y : bits_stdint_intn_h.int16_t;
      width : bits_stdint_uintn_h.uint16_t;
      height : bits_stdint_uintn_h.uint16_t;
      border_width : bits_stdint_uintn_h.uint16_t;
      u_class : bits_stdint_uintn_h.uint16_t;
      visual : xcb_visualid_t;
      value_mask : bits_stdint_uintn_h.uint32_t;
      value_list : access constant xcb_create_window_value_list_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:5893
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_create_window_aux";

   function xcb_create_window_value_list (R : access constant xcb_create_window_request_t) return System.Address  -- /usr/include/xcb/xproto.h:5908
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_create_window_value_list";

   function xcb_change_window_attributes_value_list_serialize
     (u_buffer : System.Address;
      value_mask : bits_stdint_uintn_h.uint32_t;
      u_aux : access constant xcb_change_window_attributes_value_list_t) return int  -- /usr/include/xcb/xproto.h:5911
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_window_attributes_value_list_serialize";

   function xcb_change_window_attributes_value_list_unpack
     (u_buffer : System.Address;
      value_mask : bits_stdint_uintn_h.uint32_t;
      u_aux : access xcb_change_window_attributes_value_list_t) return int  -- /usr/include/xcb/xproto.h:5916
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_window_attributes_value_list_unpack";

   function xcb_change_window_attributes_value_list_sizeof (u_buffer : System.Address; value_mask : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/xproto.h:5921
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_window_attributes_value_list_sizeof";

   function xcb_change_window_attributes_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:5925
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_window_attributes_sizeof";

  --*
  -- * @brief change window attributes
  -- *
  -- * @param c The connection
  -- * @param window The window to change.
  -- * @param value_mask A bitmask of #xcb_cw_t values.
  -- * @param value_mask \n
  -- * @param value_list Values for each of the attributes specified in the bitmask \a value_mask. The
  -- * order has to correspond to the order of possible \a value_mask bits. See the
  -- * example.
  -- * @return A cookie
  -- *
  -- * Changes the attributes specified by \a value_mask for the specified \a window.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_change_window_attributes_checked
     (c : access xcb.xcb_connection_t;
      window : xcb_window_t;
      value_mask : bits_stdint_uintn_h.uint32_t;
      value_list : System.Address) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:5946
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_window_attributes_checked";

  --*
  -- * @brief change window attributes
  -- *
  -- * @param c The connection
  -- * @param window The window to change.
  -- * @param value_mask A bitmask of #xcb_cw_t values.
  -- * @param value_mask \n
  -- * @param value_list Values for each of the attributes specified in the bitmask \a value_mask. The
  -- * order has to correspond to the order of possible \a value_mask bits. See the
  -- * example.
  -- * @return A cookie
  -- *
  -- * Changes the attributes specified by \a value_mask for the specified \a window.
  -- *
  --  

   function xcb_change_window_attributes
     (c : access xcb.xcb_connection_t;
      window : xcb_window_t;
      value_mask : bits_stdint_uintn_h.uint32_t;
      value_list : System.Address) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:5967
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_window_attributes";

  --*
  -- * @brief change window attributes
  -- *
  -- * @param c The connection
  -- * @param window The window to change.
  -- * @param value_mask A bitmask of #xcb_cw_t values.
  -- * @param value_mask \n
  -- * @param value_list Values for each of the attributes specified in the bitmask \a value_mask. The
  -- * order has to correspond to the order of possible \a value_mask bits. See the
  -- * example.
  -- * @return A cookie
  -- *
  -- * Changes the attributes specified by \a value_mask for the specified \a window.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_change_window_attributes_aux_checked
     (c : access xcb.xcb_connection_t;
      window : xcb_window_t;
      value_mask : bits_stdint_uintn_h.uint32_t;
      value_list : access constant xcb_change_window_attributes_value_list_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:5991
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_window_attributes_aux_checked";

  --*
  -- * @brief change window attributes
  -- *
  -- * @param c The connection
  -- * @param window The window to change.
  -- * @param value_mask A bitmask of #xcb_cw_t values.
  -- * @param value_mask \n
  -- * @param value_list Values for each of the attributes specified in the bitmask \a value_mask. The
  -- * order has to correspond to the order of possible \a value_mask bits. See the
  -- * example.
  -- * @return A cookie
  -- *
  -- * Changes the attributes specified by \a value_mask for the specified \a window.
  -- *
  --  

   function xcb_change_window_attributes_aux
     (c : access xcb.xcb_connection_t;
      window : xcb_window_t;
      value_mask : bits_stdint_uintn_h.uint32_t;
      value_list : access constant xcb_change_window_attributes_value_list_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:6012
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_window_attributes_aux";

   function xcb_change_window_attributes_value_list (R : access constant xcb_change_window_attributes_request_t) return System.Address  -- /usr/include/xcb/xproto.h:6018
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_window_attributes_value_list";

  --*
  -- * @brief Gets window attributes
  -- *
  -- * @param c The connection
  -- * @param window The window to get the attributes from.
  -- * @return A cookie
  -- *
  -- * Gets the current attributes for the specified \a window.
  -- *
  --  

   function xcb_get_window_attributes (c : access xcb.xcb_connection_t; window : xcb_window_t) return xcb_get_window_attributes_cookie_t  -- /usr/include/xcb/xproto.h:6031
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_window_attributes";

  --*
  -- * @brief Gets window attributes
  -- *
  -- * @param c The connection
  -- * @param window The window to get the attributes from.
  -- * @return A cookie
  -- *
  -- * Gets the current attributes for the specified \a window.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_get_window_attributes_unchecked (c : access xcb.xcb_connection_t; window : xcb_window_t) return xcb_get_window_attributes_cookie_t  -- /usr/include/xcb/xproto.h:6048
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_window_attributes_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_get_window_attributes_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_get_window_attributes_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_get_window_attributes_cookie_t;
      e : System.Address) return access xcb_get_window_attributes_reply_t  -- /usr/include/xcb/xproto.h:6066
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_window_attributes_reply";

  --*<  
  --*
  -- * @brief Destroys a window
  -- *
  -- * @param c The connection
  -- * @param window The window to destroy.
  -- * @return A cookie
  -- *
  -- * Destroys the specified window and all of its subwindows. A DestroyNotify event
  -- * is generated for each destroyed window (a DestroyNotify event is first generated
  -- * for any given window's inferiors). If the window was mapped, it will be
  -- * automatically unmapped before destroying.
  -- * 
  -- * Calling DestroyWindow on the root window will do nothing.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_destroy_window_checked (c : access xcb.xcb_connection_t; window : xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:6089
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_destroy_window_checked";

  --*
  -- * @brief Destroys a window
  -- *
  -- * @param c The connection
  -- * @param window The window to destroy.
  -- * @return A cookie
  -- *
  -- * Destroys the specified window and all of its subwindows. A DestroyNotify event
  -- * is generated for each destroyed window (a DestroyNotify event is first generated
  -- * for any given window's inferiors). If the window was mapped, it will be
  -- * automatically unmapped before destroying.
  -- * 
  -- * Calling DestroyWindow on the root window will do nothing.
  -- *
  --  

   function xcb_destroy_window (c : access xcb.xcb_connection_t; window : xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:6108
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_destroy_window";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_destroy_subwindows_checked (c : access xcb.xcb_connection_t; window : xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:6123
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_destroy_subwindows_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_destroy_subwindows (c : access xcb.xcb_connection_t; window : xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:6135
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_destroy_subwindows";

  --*
  -- * @brief Changes a client's save set
  -- *
  -- * @param c The connection
  -- * @param mode A bitmask of #xcb_set_mode_t values.
  -- * @param mode Insert to add the specified window to the save set or Delete to delete it from the save set.
  -- * @param window The window to add or delete to/from your save set.
  -- * @return A cookie
  -- *
  -- * TODO: explain what the save set is for.
  -- * 
  -- * This function either adds or removes the specified window to the client's (your
  -- * application's) save set.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_change_save_set_checked
     (c : access xcb.xcb_connection_t;
      mode : bits_stdint_uintn_h.uint8_t;
      window : xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:6157
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_save_set_checked";

  --*
  -- * @brief Changes a client's save set
  -- *
  -- * @param c The connection
  -- * @param mode A bitmask of #xcb_set_mode_t values.
  -- * @param mode Insert to add the specified window to the save set or Delete to delete it from the save set.
  -- * @param window The window to add or delete to/from your save set.
  -- * @return A cookie
  -- *
  -- * TODO: explain what the save set is for.
  -- * 
  -- * This function either adds or removes the specified window to the client's (your
  -- * application's) save set.
  -- *
  --  

   function xcb_change_save_set
     (c : access xcb.xcb_connection_t;
      mode : bits_stdint_uintn_h.uint8_t;
      window : xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:6177
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_save_set";

  --*
  -- * @brief Reparents a window
  -- *
  -- * @param c The connection
  -- * @param window The window to reparent.
  -- * @param parent The new parent of the window.
  -- * @param x The X position of the window within its new parent.
  -- * @param y The Y position of the window within its new parent.
  -- * @return A cookie
  -- *
  -- * Makes the specified window a child of the specified parent window. If the
  -- * window is mapped, it will automatically be unmapped before reparenting and
  -- * re-mapped after reparenting. The window is placed in the stacking order on top
  -- * with respect to sibling windows.
  -- * 
  -- * After reparenting, a ReparentNotify event is generated.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_reparent_window_checked
     (c : access xcb.xcb_connection_t;
      window : xcb_window_t;
      parent : xcb_window_t;
      x : bits_stdint_intn_h.int16_t;
      y : bits_stdint_intn_h.int16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:6203
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_reparent_window_checked";

  --*
  -- * @brief Reparents a window
  -- *
  -- * @param c The connection
  -- * @param window The window to reparent.
  -- * @param parent The new parent of the window.
  -- * @param x The X position of the window within its new parent.
  -- * @param y The Y position of the window within its new parent.
  -- * @return A cookie
  -- *
  -- * Makes the specified window a child of the specified parent window. If the
  -- * window is mapped, it will automatically be unmapped before reparenting and
  -- * re-mapped after reparenting. The window is placed in the stacking order on top
  -- * with respect to sibling windows.
  -- * 
  -- * After reparenting, a ReparentNotify event is generated.
  -- *
  --  

   function xcb_reparent_window
     (c : access xcb.xcb_connection_t;
      window : xcb_window_t;
      parent : xcb_window_t;
      x : bits_stdint_intn_h.int16_t;
      y : bits_stdint_intn_h.int16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:6228
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_reparent_window";

  --*
  -- * @brief Makes a window visible
  -- *
  -- * @param c The connection
  -- * @param window The window to make visible.
  -- * @return A cookie
  -- *
  -- * Maps the specified window. This means making the window visible (as long as its
  -- * parent is visible).
  -- * 
  -- * This MapWindow request will be translated to a MapRequest request if a window
  -- * manager is running. The window manager then decides to either map the window or
  -- * not. Set the override-redirect window attribute to true if you want to bypass
  -- * this mechanism.
  -- * 
  -- * If the window manager decides to map the window (or if no window manager is
  -- * running), a MapNotify event is generated.
  -- * 
  -- * If the window becomes viewable and no earlier contents for it are remembered,
  -- * the X server tiles the window with its background. If the window's background
  -- * is undefined, the existing screen contents are not altered, and the X server
  -- * generates zero or more Expose events.
  -- * 
  -- * If the window type is InputOutput, an Expose event will be generated when the
  -- * window becomes visible. The normal response to an Expose event should be to
  -- * repaint the window.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_map_window_checked (c : access xcb.xcb_connection_t; window : xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:6266
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_map_window_checked";

  --*
  -- * @brief Makes a window visible
  -- *
  -- * @param c The connection
  -- * @param window The window to make visible.
  -- * @return A cookie
  -- *
  -- * Maps the specified window. This means making the window visible (as long as its
  -- * parent is visible).
  -- * 
  -- * This MapWindow request will be translated to a MapRequest request if a window
  -- * manager is running. The window manager then decides to either map the window or
  -- * not. Set the override-redirect window attribute to true if you want to bypass
  -- * this mechanism.
  -- * 
  -- * If the window manager decides to map the window (or if no window manager is
  -- * running), a MapNotify event is generated.
  -- * 
  -- * If the window becomes viewable and no earlier contents for it are remembered,
  -- * the X server tiles the window with its background. If the window's background
  -- * is undefined, the existing screen contents are not altered, and the X server
  -- * generates zero or more Expose events.
  -- * 
  -- * If the window type is InputOutput, an Expose event will be generated when the
  -- * window becomes visible. The normal response to an Expose event should be to
  -- * repaint the window.
  -- *
  --  

   function xcb_map_window (c : access xcb.xcb_connection_t; window : xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:6298
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_map_window";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_map_subwindows_checked (c : access xcb.xcb_connection_t; window : xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:6313
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_map_subwindows_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_map_subwindows (c : access xcb.xcb_connection_t; window : xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:6325
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_map_subwindows";

  --*
  -- * @brief Makes a window invisible
  -- *
  -- * @param c The connection
  -- * @param window The window to make invisible.
  -- * @return A cookie
  -- *
  -- * Unmaps the specified window. This means making the window invisible (and all
  -- * its child windows).
  -- * 
  -- * Unmapping a window leads to the `UnmapNotify` event being generated. Also,
  -- * `Expose` events are generated for formerly obscured windows.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_unmap_window_checked (c : access xcb.xcb_connection_t; window : xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:6346
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_unmap_window_checked";

  --*
  -- * @brief Makes a window invisible
  -- *
  -- * @param c The connection
  -- * @param window The window to make invisible.
  -- * @return A cookie
  -- *
  -- * Unmaps the specified window. This means making the window invisible (and all
  -- * its child windows).
  -- * 
  -- * Unmapping a window leads to the `UnmapNotify` event being generated. Also,
  -- * `Expose` events are generated for formerly obscured windows.
  -- *
  --  

   function xcb_unmap_window (c : access xcb.xcb_connection_t; window : xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:6364
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_unmap_window";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_unmap_subwindows_checked (c : access xcb.xcb_connection_t; window : xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:6379
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_unmap_subwindows_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_unmap_subwindows (c : access xcb.xcb_connection_t; window : xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:6391
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_unmap_subwindows";

   function xcb_configure_window_value_list_serialize
     (u_buffer : System.Address;
      value_mask : bits_stdint_uintn_h.uint16_t;
      u_aux : access constant xcb_configure_window_value_list_t) return int  -- /usr/include/xcb/xproto.h:6395
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_configure_window_value_list_serialize";

   function xcb_configure_window_value_list_unpack
     (u_buffer : System.Address;
      value_mask : bits_stdint_uintn_h.uint16_t;
      u_aux : access xcb_configure_window_value_list_t) return int  -- /usr/include/xcb/xproto.h:6400
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_configure_window_value_list_unpack";

   function xcb_configure_window_value_list_sizeof (u_buffer : System.Address; value_mask : bits_stdint_uintn_h.uint16_t) return int  -- /usr/include/xcb/xproto.h:6405
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_configure_window_value_list_sizeof";

   function xcb_configure_window_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:6409
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_configure_window_sizeof";

  --*
  -- * @brief Configures window attributes
  -- *
  -- * @param c The connection
  -- * @param window The window to configure.
  -- * @param value_mask Bitmask of attributes to change.
  -- * @param value_list New values, corresponding to the attributes in value_mask. The order has to
  -- * correspond to the order of possible \a value_mask bits. See the example.
  -- * @return A cookie
  -- *
  -- * Configures a window's size, position, border width and stacking order.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_configure_window_checked
     (c : access xcb.xcb_connection_t;
      window : xcb_window_t;
      value_mask : bits_stdint_uintn_h.uint16_t;
      value_list : System.Address) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:6428
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_configure_window_checked";

  --*
  -- * @brief Configures window attributes
  -- *
  -- * @param c The connection
  -- * @param window The window to configure.
  -- * @param value_mask Bitmask of attributes to change.
  -- * @param value_list New values, corresponding to the attributes in value_mask. The order has to
  -- * correspond to the order of possible \a value_mask bits. See the example.
  -- * @return A cookie
  -- *
  -- * Configures a window's size, position, border width and stacking order.
  -- *
  --  

   function xcb_configure_window
     (c : access xcb.xcb_connection_t;
      window : xcb_window_t;
      value_mask : bits_stdint_uintn_h.uint16_t;
      value_list : System.Address) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:6447
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_configure_window";

  --*
  -- * @brief Configures window attributes
  -- *
  -- * @param c The connection
  -- * @param window The window to configure.
  -- * @param value_mask Bitmask of attributes to change.
  -- * @param value_list New values, corresponding to the attributes in value_mask. The order has to
  -- * correspond to the order of possible \a value_mask bits. See the example.
  -- * @return A cookie
  -- *
  -- * Configures a window's size, position, border width and stacking order.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_configure_window_aux_checked
     (c : access xcb.xcb_connection_t;
      window : xcb_window_t;
      value_mask : bits_stdint_uintn_h.uint16_t;
      value_list : access constant xcb_configure_window_value_list_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:6469
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_configure_window_aux_checked";

  --*
  -- * @brief Configures window attributes
  -- *
  -- * @param c The connection
  -- * @param window The window to configure.
  -- * @param value_mask Bitmask of attributes to change.
  -- * @param value_list New values, corresponding to the attributes in value_mask. The order has to
  -- * correspond to the order of possible \a value_mask bits. See the example.
  -- * @return A cookie
  -- *
  -- * Configures a window's size, position, border width and stacking order.
  -- *
  --  

   function xcb_configure_window_aux
     (c : access xcb.xcb_connection_t;
      window : xcb_window_t;
      value_mask : bits_stdint_uintn_h.uint16_t;
      value_list : access constant xcb_configure_window_value_list_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:6488
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_configure_window_aux";

   function xcb_configure_window_value_list (R : access constant xcb_configure_window_request_t) return System.Address  -- /usr/include/xcb/xproto.h:6494
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_configure_window_value_list";

  --*
  -- * @brief Change window stacking order
  -- *
  -- * @param c The connection
  -- * @param direction A bitmask of #xcb_circulate_t values.
  -- * @param direction \n
  -- * @param window The window to raise/lower (depending on \a direction).
  -- * @return A cookie
  -- *
  -- * If \a direction is `XCB_CIRCULATE_RAISE_LOWEST`, the lowest mapped child (if
  -- * any) will be raised to the top of the stack.
  -- * 
  -- * If \a direction is `XCB_CIRCULATE_LOWER_HIGHEST`, the highest mapped child will
  -- * be lowered to the bottom of the stack.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_circulate_window_checked
     (c : access xcb.xcb_connection_t;
      direction : bits_stdint_uintn_h.uint8_t;
      window : xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:6516
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_circulate_window_checked";

  --*
  -- * @brief Change window stacking order
  -- *
  -- * @param c The connection
  -- * @param direction A bitmask of #xcb_circulate_t values.
  -- * @param direction \n
  -- * @param window The window to raise/lower (depending on \a direction).
  -- * @return A cookie
  -- *
  -- * If \a direction is `XCB_CIRCULATE_RAISE_LOWEST`, the lowest mapped child (if
  -- * any) will be raised to the top of the stack.
  -- * 
  -- * If \a direction is `XCB_CIRCULATE_LOWER_HIGHEST`, the highest mapped child will
  -- * be lowered to the bottom of the stack.
  -- *
  --  

   function xcb_circulate_window
     (c : access xcb.xcb_connection_t;
      direction : bits_stdint_uintn_h.uint8_t;
      window : xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:6537
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_circulate_window";

  --*
  -- * @brief Get current window geometry
  -- *
  -- * @param c The connection
  -- * @param drawable The drawable (`Window` or `Pixmap`) of which the geometry will be received.
  -- * @return A cookie
  -- *
  -- * Gets the current geometry of the specified drawable (either `Window` or `Pixmap`).
  -- *
  --  

   function xcb_get_geometry (c : access xcb.xcb_connection_t; drawable : xcb_drawable_t) return xcb_get_geometry_cookie_t  -- /usr/include/xcb/xproto.h:6552
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_geometry";

  --*
  -- * @brief Get current window geometry
  -- *
  -- * @param c The connection
  -- * @param drawable The drawable (`Window` or `Pixmap`) of which the geometry will be received.
  -- * @return A cookie
  -- *
  -- * Gets the current geometry of the specified drawable (either `Window` or `Pixmap`).
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_get_geometry_unchecked (c : access xcb.xcb_connection_t; drawable : xcb_drawable_t) return xcb_get_geometry_cookie_t  -- /usr/include/xcb/xproto.h:6569
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_geometry_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_get_geometry_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_get_geometry_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_get_geometry_cookie_t;
      e : System.Address) return access xcb_get_geometry_reply_t  -- /usr/include/xcb/xproto.h:6587
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_geometry_reply";

  --*<  
   function xcb_query_tree_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:6592
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_tree_sizeof";

  --*
  -- * @brief query the window tree
  -- *
  -- * @param c The connection
  -- * @param window The \a window to query.
  -- * @return A cookie
  -- *
  -- * Gets the root window ID, parent window ID and list of children windows for the
  -- * specified \a window. The children are listed in bottom-to-top stacking order.
  -- *
  --  

   function xcb_query_tree (c : access xcb.xcb_connection_t; window : xcb_window_t) return xcb_query_tree_cookie_t  -- /usr/include/xcb/xproto.h:6606
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_tree";

  --*
  -- * @brief query the window tree
  -- *
  -- * @param c The connection
  -- * @param window The \a window to query.
  -- * @return A cookie
  -- *
  -- * Gets the root window ID, parent window ID and list of children windows for the
  -- * specified \a window. The children are listed in bottom-to-top stacking order.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_query_tree_unchecked (c : access xcb.xcb_connection_t; window : xcb_window_t) return xcb_query_tree_cookie_t  -- /usr/include/xcb/xproto.h:6624
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_tree_unchecked";

   function xcb_query_tree_children (R : access constant xcb_query_tree_reply_t) return access xcb_window_t  -- /usr/include/xcb/xproto.h:6628
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_tree_children";

   function xcb_query_tree_children_length (R : access constant xcb_query_tree_reply_t) return int  -- /usr/include/xcb/xproto.h:6631
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_tree_children_length";

   function xcb_query_tree_children_end (R : access constant xcb_query_tree_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:6634
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_tree_children_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_query_tree_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_query_tree_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_query_tree_cookie_t;
      e : System.Address) return access xcb_query_tree_reply_t  -- /usr/include/xcb/xproto.h:6651
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_tree_reply";

  --*<  
   function xcb_intern_atom_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:6656
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_intern_atom_sizeof";

  --*
  -- * @brief Get atom identifier by name
  -- *
  -- * @param c The connection
  -- * @param only_if_exists Return a valid atom id only if the atom already exists.
  -- * @param name_len The length of the following \a name.
  -- * @param name The name of the atom.
  -- * @return A cookie
  -- *
  -- * Retrieves the identifier (xcb_atom_t TODO) for the atom with the specified
  -- * name. Atoms are used in protocols like EWMH, for example to store window titles
  -- * (`_NET_WM_NAME` atom) as property of a window.
  -- * 
  -- * If \a only_if_exists is 0, the atom will be created if it does not already exist.
  -- * If \a only_if_exists is 1, `XCB_ATOM_NONE` will be returned if the atom does
  -- * not yet exist.
  -- *
  --  

   function xcb_intern_atom
     (c : access xcb.xcb_connection_t;
      only_if_exists : bits_stdint_uintn_h.uint8_t;
      name_len : bits_stdint_uintn_h.uint16_t;
      name : Interfaces.C.Strings.chars_ptr) return xcb_intern_atom_cookie_t  -- /usr/include/xcb/xproto.h:6677
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_intern_atom";

  --*
  -- * @brief Get atom identifier by name
  -- *
  -- * @param c The connection
  -- * @param only_if_exists Return a valid atom id only if the atom already exists.
  -- * @param name_len The length of the following \a name.
  -- * @param name The name of the atom.
  -- * @return A cookie
  -- *
  -- * Retrieves the identifier (xcb_atom_t TODO) for the atom with the specified
  -- * name. Atoms are used in protocols like EWMH, for example to store window titles
  -- * (`_NET_WM_NAME` atom) as property of a window.
  -- * 
  -- * If \a only_if_exists is 0, the atom will be created if it does not already exist.
  -- * If \a only_if_exists is 1, `XCB_ATOM_NONE` will be returned if the atom does
  -- * not yet exist.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_intern_atom_unchecked
     (c : access xcb.xcb_connection_t;
      only_if_exists : bits_stdint_uintn_h.uint8_t;
      name_len : bits_stdint_uintn_h.uint16_t;
      name : Interfaces.C.Strings.chars_ptr) return xcb_intern_atom_cookie_t  -- /usr/include/xcb/xproto.h:6704
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_intern_atom_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_intern_atom_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_intern_atom_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_intern_atom_cookie_t;
      e : System.Address) return access xcb_intern_atom_reply_t  -- /usr/include/xcb/xproto.h:6724
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_intern_atom_reply";

  --*<  
   function xcb_get_atom_name_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:6729
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_atom_name_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_get_atom_name (c : access xcb.xcb_connection_t; atom : xcb_atom_t) return xcb_get_atom_name_cookie_t  -- /usr/include/xcb/xproto.h:6740
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_atom_name";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_get_atom_name_unchecked (c : access xcb.xcb_connection_t; atom : xcb_atom_t) return xcb_get_atom_name_cookie_t  -- /usr/include/xcb/xproto.h:6755
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_atom_name_unchecked";

   function xcb_get_atom_name_name (R : access constant xcb_get_atom_name_reply_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/xproto.h:6759
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_atom_name_name";

   function xcb_get_atom_name_name_length (R : access constant xcb_get_atom_name_reply_t) return int  -- /usr/include/xcb/xproto.h:6762
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_atom_name_name_length";

   function xcb_get_atom_name_name_end (R : access constant xcb_get_atom_name_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:6765
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_atom_name_name_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_get_atom_name_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_get_atom_name_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_get_atom_name_cookie_t;
      e : System.Address) return access xcb_get_atom_name_reply_t  -- /usr/include/xcb/xproto.h:6782
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_atom_name_reply";

  --*<  
   function xcb_change_property_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:6787
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_property_sizeof";

  --*
  -- * @brief Changes a window property
  -- *
  -- * @param c The connection
  -- * @param mode A bitmask of #xcb_prop_mode_t values.
  -- * @param mode \n
  -- * @param window The window whose property you want to change.
  -- * @param property The property you want to change (an atom).
  -- * @param type The type of the property you want to change (an atom).
  -- * @param format Specifies whether the data should be viewed as a list of 8-bit, 16-bit or
  -- * 32-bit quantities. Possible values are 8, 16 and 32. This information allows
  -- * the X server to correctly perform byte-swap operations as necessary.
  -- * @param data_len Specifies the number of elements (see \a format).
  -- * @param data The property data.
  -- * @return A cookie
  -- *
  -- * Sets or updates a property on the specified \a window. Properties are for
  -- * example the window title (`WM_NAME`) or its minimum size (`WM_NORMAL_HINTS`).
  -- * Protocols such as EWMH also use properties - for example EWMH defines the
  -- * window title, encoded as UTF-8 string, in the `_NET_WM_NAME` property.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_change_property_checked
     (c : access xcb.xcb_connection_t;
      mode : bits_stdint_uintn_h.uint8_t;
      window : xcb_window_t;
      property : xcb_atom_t;
      c_type : xcb_atom_t;
      format : bits_stdint_uintn_h.uint8_t;
      data_len : bits_stdint_uintn_h.uint32_t;
      data : System.Address) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:6815
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_property_checked";

  --*
  -- * @brief Changes a window property
  -- *
  -- * @param c The connection
  -- * @param mode A bitmask of #xcb_prop_mode_t values.
  -- * @param mode \n
  -- * @param window The window whose property you want to change.
  -- * @param property The property you want to change (an atom).
  -- * @param type The type of the property you want to change (an atom).
  -- * @param format Specifies whether the data should be viewed as a list of 8-bit, 16-bit or
  -- * 32-bit quantities. Possible values are 8, 16 and 32. This information allows
  -- * the X server to correctly perform byte-swap operations as necessary.
  -- * @param data_len Specifies the number of elements (see \a format).
  -- * @param data The property data.
  -- * @return A cookie
  -- *
  -- * Sets or updates a property on the specified \a window. Properties are for
  -- * example the window title (`WM_NAME`) or its minimum size (`WM_NORMAL_HINTS`).
  -- * Protocols such as EWMH also use properties - for example EWMH defines the
  -- * window title, encoded as UTF-8 string, in the `_NET_WM_NAME` property.
  -- *
  --  

   function xcb_change_property
     (c : access xcb.xcb_connection_t;
      mode : bits_stdint_uintn_h.uint8_t;
      window : xcb_window_t;
      property : xcb_atom_t;
      c_type : xcb_atom_t;
      format : bits_stdint_uintn_h.uint8_t;
      data_len : bits_stdint_uintn_h.uint32_t;
      data : System.Address) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:6847
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_property";

   function xcb_change_property_data (R : access constant xcb_change_property_request_t) return System.Address  -- /usr/include/xcb/xproto.h:6857
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_property_data";

   function xcb_change_property_data_length (R : access constant xcb_change_property_request_t) return int  -- /usr/include/xcb/xproto.h:6860
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_property_data_length";

   function xcb_change_property_data_end (R : access constant xcb_change_property_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:6863
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_property_data_end";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_delete_property_checked
     (c : access xcb.xcb_connection_t;
      window : xcb_window_t;
      property : xcb_atom_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:6877
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_delete_property_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_delete_property
     (c : access xcb.xcb_connection_t;
      window : xcb_window_t;
      property : xcb_atom_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:6890
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_delete_property";

   function xcb_get_property_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:6895
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_property_sizeof";

  --*
  -- * @brief Gets a window property
  -- *
  -- * @param c The connection
  -- * @param _delete Whether the property should actually be deleted. For deleting a property, the
  -- * specified \a type has to match the actual property type.
  -- * @param window The window whose property you want to get.
  -- * @param property The property you want to get (an atom).
  -- * @param type The type of the property you want to get (an atom).
  -- * @param long_offset Specifies the offset (in 32-bit multiples) in the specified property where the
  -- * data is to be retrieved.
  -- * @param long_length Specifies how many 32-bit multiples of data should be retrieved (e.g. if you
  -- * set \a long_length to 4, you will receive 16 bytes of data).
  -- * @return A cookie
  -- *
  -- * Gets the specified \a property from the specified \a window. Properties are for
  -- * example the window title (`WM_NAME`) or its minimum size (`WM_NORMAL_HINTS`).
  -- * Protocols such as EWMH also use properties - for example EWMH defines the
  -- * window title, encoded as UTF-8 string, in the `_NET_WM_NAME` property.
  -- * 
  -- * TODO: talk about \a type
  -- * 
  -- * TODO: talk about `delete`
  -- * 
  -- * TODO: talk about the offset/length thing. what's a valid use case?
  -- *
  --  

   function xcb_get_property
     (c : access xcb.xcb_connection_t;
      u_delete : bits_stdint_uintn_h.uint8_t;
      window : xcb_window_t;
      property : xcb_atom_t;
      c_type : xcb_atom_t;
      long_offset : bits_stdint_uintn_h.uint32_t;
      long_length : bits_stdint_uintn_h.uint32_t) return xcb_get_property_cookie_t  -- /usr/include/xcb/xproto.h:6925
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_property";

  --*
  -- * @brief Gets a window property
  -- *
  -- * @param c The connection
  -- * @param _delete Whether the property should actually be deleted. For deleting a property, the
  -- * specified \a type has to match the actual property type.
  -- * @param window The window whose property you want to get.
  -- * @param property The property you want to get (an atom).
  -- * @param type The type of the property you want to get (an atom).
  -- * @param long_offset Specifies the offset (in 32-bit multiples) in the specified property where the
  -- * data is to be retrieved.
  -- * @param long_length Specifies how many 32-bit multiples of data should be retrieved (e.g. if you
  -- * set \a long_length to 4, you will receive 16 bytes of data).
  -- * @return A cookie
  -- *
  -- * Gets the specified \a property from the specified \a window. Properties are for
  -- * example the window title (`WM_NAME`) or its minimum size (`WM_NORMAL_HINTS`).
  -- * Protocols such as EWMH also use properties - for example EWMH defines the
  -- * window title, encoded as UTF-8 string, in the `_NET_WM_NAME` property.
  -- * 
  -- * TODO: talk about \a type
  -- * 
  -- * TODO: talk about `delete`
  -- * 
  -- * TODO: talk about the offset/length thing. what's a valid use case?
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_get_property_unchecked
     (c : access xcb.xcb_connection_t;
      u_delete : bits_stdint_uintn_h.uint8_t;
      window : xcb_window_t;
      property : xcb_atom_t;
      c_type : xcb_atom_t;
      long_offset : bits_stdint_uintn_h.uint32_t;
      long_length : bits_stdint_uintn_h.uint32_t) return xcb_get_property_cookie_t  -- /usr/include/xcb/xproto.h:6964
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_property_unchecked";

   function xcb_get_property_value (R : access constant xcb_get_property_reply_t) return System.Address  -- /usr/include/xcb/xproto.h:6973
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_property_value";

   function xcb_get_property_value_length (R : access constant xcb_get_property_reply_t) return int  -- /usr/include/xcb/xproto.h:6976
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_property_value_length";

   function xcb_get_property_value_end (R : access constant xcb_get_property_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:6979
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_property_value_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_get_property_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_get_property_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_get_property_cookie_t;
      e : System.Address) return access xcb_get_property_reply_t  -- /usr/include/xcb/xproto.h:6996
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_property_reply";

  --*<  
   function xcb_list_properties_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:7001
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_properties_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_list_properties (c : access xcb.xcb_connection_t; window : xcb_window_t) return xcb_list_properties_cookie_t  -- /usr/include/xcb/xproto.h:7012
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_properties";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_list_properties_unchecked (c : access xcb.xcb_connection_t; window : xcb_window_t) return xcb_list_properties_cookie_t  -- /usr/include/xcb/xproto.h:7027
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_properties_unchecked";

   function xcb_list_properties_atoms (R : access constant xcb_list_properties_reply_t) return access xcb_atom_t  -- /usr/include/xcb/xproto.h:7031
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_properties_atoms";

   function xcb_list_properties_atoms_length (R : access constant xcb_list_properties_reply_t) return int  -- /usr/include/xcb/xproto.h:7034
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_properties_atoms_length";

   function xcb_list_properties_atoms_end (R : access constant xcb_list_properties_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:7037
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_properties_atoms_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_list_properties_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_list_properties_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_list_properties_cookie_t;
      e : System.Address) return access xcb_list_properties_reply_t  -- /usr/include/xcb/xproto.h:7054
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_properties_reply";

  --*<  
  --*
  -- * @brief Sets the owner of a selection
  -- *
  -- * @param c The connection
  -- * @param owner The new owner of the selection.
  -- * \n
  -- * The special value `XCB_NONE` means that the selection will have no owner.
  -- * @param selection The selection.
  -- * @param time Timestamp to avoid race conditions when running X over the network.
  -- * \n
  -- * The selection will not be changed if \a time is earlier than the current
  -- * last-change time of the \a selection or is later than the current X server time.
  -- * Otherwise, the last-change time is set to the specified time.
  -- * \n
  -- * The special value `XCB_CURRENT_TIME` will be replaced with the current server
  -- * time.
  -- * @return A cookie
  -- *
  -- * Makes `window` the owner of the selection \a selection and updates the
  -- * last-change time of the specified selection.
  -- * 
  -- * TODO: briefly explain what a selection is.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_set_selection_owner_checked
     (c : access xcb.xcb_connection_t;
      owner : xcb_window_t;
      selection : xcb_atom_t;
      time : xcb_timestamp_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:7086
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_selection_owner_checked";

  --*
  -- * @brief Sets the owner of a selection
  -- *
  -- * @param c The connection
  -- * @param owner The new owner of the selection.
  -- * \n
  -- * The special value `XCB_NONE` means that the selection will have no owner.
  -- * @param selection The selection.
  -- * @param time Timestamp to avoid race conditions when running X over the network.
  -- * \n
  -- * The selection will not be changed if \a time is earlier than the current
  -- * last-change time of the \a selection or is later than the current X server time.
  -- * Otherwise, the last-change time is set to the specified time.
  -- * \n
  -- * The special value `XCB_CURRENT_TIME` will be replaced with the current server
  -- * time.
  -- * @return A cookie
  -- *
  -- * Makes `window` the owner of the selection \a selection and updates the
  -- * last-change time of the specified selection.
  -- * 
  -- * TODO: briefly explain what a selection is.
  -- *
  --  

   function xcb_set_selection_owner
     (c : access xcb.xcb_connection_t;
      owner : xcb_window_t;
      selection : xcb_atom_t;
      time : xcb_timestamp_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:7116
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_selection_owner";

  --*
  -- * @brief Gets the owner of a selection
  -- *
  -- * @param c The connection
  -- * @param selection The selection.
  -- * @return A cookie
  -- *
  -- * Gets the owner of the specified selection.
  -- * 
  -- * TODO: briefly explain what a selection is.
  -- *
  --  

   function xcb_get_selection_owner (c : access xcb.xcb_connection_t; selection : xcb_atom_t) return xcb_get_selection_owner_cookie_t  -- /usr/include/xcb/xproto.h:7134
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_selection_owner";

  --*
  -- * @brief Gets the owner of a selection
  -- *
  -- * @param c The connection
  -- * @param selection The selection.
  -- * @return A cookie
  -- *
  -- * Gets the owner of the specified selection.
  -- * 
  -- * TODO: briefly explain what a selection is.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_get_selection_owner_unchecked (c : access xcb.xcb_connection_t; selection : xcb_atom_t) return xcb_get_selection_owner_cookie_t  -- /usr/include/xcb/xproto.h:7153
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_selection_owner_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_get_selection_owner_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_get_selection_owner_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_get_selection_owner_cookie_t;
      e : System.Address) return access xcb_get_selection_owner_reply_t  -- /usr/include/xcb/xproto.h:7171
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_selection_owner_reply";

  --*<  
  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_convert_selection_checked
     (c : access xcb.xcb_connection_t;
      requestor : xcb_window_t;
      selection : xcb_atom_t;
      target : xcb_atom_t;
      property : xcb_atom_t;
      time : xcb_timestamp_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:7187
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_convert_selection_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_convert_selection
     (c : access xcb.xcb_connection_t;
      requestor : xcb_window_t;
      selection : xcb_atom_t;
      target : xcb_atom_t;
      property : xcb_atom_t;
      time : xcb_timestamp_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:7203
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_convert_selection";

  --*
  -- * @brief send an event
  -- *
  -- * @param c The connection
  -- * @param propagate If \a propagate is true and no clients have selected any event on \a destination,
  -- * the destination is replaced with the closest ancestor of \a destination for
  -- * which some client has selected a type in \a event_mask and for which no
  -- * intervening window has that type in its do-not-propagate-mask. If no such
  -- * window exists or if the window is an ancestor of the focus window and
  -- * `InputFocus` was originally specified as the destination, the event is not sent
  -- * to any clients. Otherwise, the event is reported to every client selecting on
  -- * the final destination any of the types specified in \a event_mask.
  -- * @param destination The window to send this event to. Every client which selects any event within
  -- * \a event_mask on \a destination will get the event.
  -- * \n
  -- * The special value `XCB_SEND_EVENT_DEST_POINTER_WINDOW` refers to the window
  -- * that contains the mouse pointer.
  -- * \n
  -- * The special value `XCB_SEND_EVENT_DEST_ITEM_FOCUS` refers to the window which
  -- * has the keyboard focus.
  -- * @param event_mask Event_mask for determining which clients should receive the specified event.
  -- * See \a destination and \a propagate.
  -- * @param event The event to send to the specified \a destination.
  -- * @return A cookie
  -- *
  -- * Identifies the \a destination window, determines which clients should receive
  -- * the specified event and ignores any active grabs.
  -- * 
  -- * The \a event must be one of the core events or an event defined by an extension,
  -- * so that the X server can correctly byte-swap the contents as necessary. The
  -- * contents of \a event are otherwise unaltered and unchecked except for the
  -- * `send_event` field which is forced to 'true'.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_send_event_checked
     (c : access xcb.xcb_connection_t;
      propagate : bits_stdint_uintn_h.uint8_t;
      destination : xcb_window_t;
      event_mask : bits_stdint_uintn_h.uint32_t;
      event : Interfaces.C.Strings.chars_ptr) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:7248
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_send_event_checked";

  --*
  -- * @brief send an event
  -- *
  -- * @param c The connection
  -- * @param propagate If \a propagate is true and no clients have selected any event on \a destination,
  -- * the destination is replaced with the closest ancestor of \a destination for
  -- * which some client has selected a type in \a event_mask and for which no
  -- * intervening window has that type in its do-not-propagate-mask. If no such
  -- * window exists or if the window is an ancestor of the focus window and
  -- * `InputFocus` was originally specified as the destination, the event is not sent
  -- * to any clients. Otherwise, the event is reported to every client selecting on
  -- * the final destination any of the types specified in \a event_mask.
  -- * @param destination The window to send this event to. Every client which selects any event within
  -- * \a event_mask on \a destination will get the event.
  -- * \n
  -- * The special value `XCB_SEND_EVENT_DEST_POINTER_WINDOW` refers to the window
  -- * that contains the mouse pointer.
  -- * \n
  -- * The special value `XCB_SEND_EVENT_DEST_ITEM_FOCUS` refers to the window which
  -- * has the keyboard focus.
  -- * @param event_mask Event_mask for determining which clients should receive the specified event.
  -- * See \a destination and \a propagate.
  -- * @param event The event to send to the specified \a destination.
  -- * @return A cookie
  -- *
  -- * Identifies the \a destination window, determines which clients should receive
  -- * the specified event and ignores any active grabs.
  -- * 
  -- * The \a event must be one of the core events or an event defined by an extension,
  -- * so that the X server can correctly byte-swap the contents as necessary. The
  -- * contents of \a event are otherwise unaltered and unchecked except for the
  -- * `send_event` field which is forced to 'true'.
  -- *
  --  

   function xcb_send_event
     (c : access xcb.xcb_connection_t;
      propagate : bits_stdint_uintn_h.uint8_t;
      destination : xcb_window_t;
      event_mask : bits_stdint_uintn_h.uint32_t;
      event : Interfaces.C.Strings.chars_ptr) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:7289
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_send_event";

  --*
  -- * @brief Grab the pointer
  -- *
  -- * @param c The connection
  -- * @param owner_events If 1, the \a grab_window will still get the pointer events. If 0, events are not
  -- * reported to the \a grab_window.
  -- * @param grab_window Specifies the window on which the pointer should be grabbed.
  -- * @param event_mask Specifies which pointer events are reported to the client.
  -- * \n
  -- * TODO: which values?
  -- * @param pointer_mode A bitmask of #xcb_grab_mode_t values.
  -- * @param pointer_mode \n
  -- * @param keyboard_mode A bitmask of #xcb_grab_mode_t values.
  -- * @param keyboard_mode \n
  -- * @param confine_to Specifies the window to confine the pointer in (the user will not be able to
  -- * move the pointer out of that window).
  -- * \n
  -- * The special value `XCB_NONE` means don't confine the pointer.
  -- * @param cursor Specifies the cursor that should be displayed or `XCB_NONE` to not change the
  -- * cursor.
  -- * @param time The time argument allows you to avoid certain circumstances that come up if
  -- * applications take a long time to respond or if there are long network delays.
  -- * Consider a situation where you have two applications, both of which normally
  -- * grab the pointer when clicked on. If both applications specify the timestamp
  -- * from the event, the second application may wake up faster and successfully grab
  -- * the pointer before the first application. The first application then will get
  -- * an indication that the other application grabbed the pointer before its request
  -- * was processed.
  -- * \n
  -- * The special value `XCB_CURRENT_TIME` will be replaced with the current server
  -- * time.
  -- * @return A cookie
  -- *
  -- * Actively grabs control of the pointer. Further pointer events are reported only to the grabbing client. Overrides any active pointer grab by this client.
  -- *
  --  

   function xcb_grab_pointer
     (c : access xcb.xcb_connection_t;
      owner_events : bits_stdint_uintn_h.uint8_t;
      grab_window : xcb_window_t;
      event_mask : bits_stdint_uintn_h.uint16_t;
      pointer_mode : bits_stdint_uintn_h.uint8_t;
      keyboard_mode : bits_stdint_uintn_h.uint8_t;
      confine_to : xcb_window_t;
      cursor : xcb_cursor_t;
      time : xcb_timestamp_t) return xcb_grab_pointer_cookie_t  -- /usr/include/xcb/xproto.h:7332
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_grab_pointer";

  --*
  -- * @brief Grab the pointer
  -- *
  -- * @param c The connection
  -- * @param owner_events If 1, the \a grab_window will still get the pointer events. If 0, events are not
  -- * reported to the \a grab_window.
  -- * @param grab_window Specifies the window on which the pointer should be grabbed.
  -- * @param event_mask Specifies which pointer events are reported to the client.
  -- * \n
  -- * TODO: which values?
  -- * @param pointer_mode A bitmask of #xcb_grab_mode_t values.
  -- * @param pointer_mode \n
  -- * @param keyboard_mode A bitmask of #xcb_grab_mode_t values.
  -- * @param keyboard_mode \n
  -- * @param confine_to Specifies the window to confine the pointer in (the user will not be able to
  -- * move the pointer out of that window).
  -- * \n
  -- * The special value `XCB_NONE` means don't confine the pointer.
  -- * @param cursor Specifies the cursor that should be displayed or `XCB_NONE` to not change the
  -- * cursor.
  -- * @param time The time argument allows you to avoid certain circumstances that come up if
  -- * applications take a long time to respond or if there are long network delays.
  -- * Consider a situation where you have two applications, both of which normally
  -- * grab the pointer when clicked on. If both applications specify the timestamp
  -- * from the event, the second application may wake up faster and successfully grab
  -- * the pointer before the first application. The first application then will get
  -- * an indication that the other application grabbed the pointer before its request
  -- * was processed.
  -- * \n
  -- * The special value `XCB_CURRENT_TIME` will be replaced with the current server
  -- * time.
  -- * @return A cookie
  -- *
  -- * Actively grabs control of the pointer. Further pointer events are reported only to the grabbing client. Overrides any active pointer grab by this client.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_grab_pointer_unchecked
     (c : access xcb.xcb_connection_t;
      owner_events : bits_stdint_uintn_h.uint8_t;
      grab_window : xcb_window_t;
      event_mask : bits_stdint_uintn_h.uint16_t;
      pointer_mode : bits_stdint_uintn_h.uint8_t;
      keyboard_mode : bits_stdint_uintn_h.uint8_t;
      confine_to : xcb_window_t;
      cursor : xcb_cursor_t;
      time : xcb_timestamp_t) return xcb_grab_pointer_cookie_t  -- /usr/include/xcb/xproto.h:7382
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_grab_pointer_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_grab_pointer_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_grab_pointer_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_grab_pointer_cookie_t;
      e : System.Address) return access xcb_grab_pointer_reply_t  -- /usr/include/xcb/xproto.h:7407
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_grab_pointer_reply";

  --*<  
  --*
  -- * @brief release the pointer
  -- *
  -- * @param c The connection
  -- * @param time Timestamp to avoid race conditions when running X over the network.
  -- * \n
  -- * The pointer will not be released if \a time is earlier than the
  -- * last-pointer-grab time or later than the current X server time.
  -- * @return A cookie
  -- *
  -- * Releases the pointer and any queued events if you actively grabbed the pointer
  -- * before using `xcb_grab_pointer`, `xcb_grab_button` or within a normal button
  -- * press.
  -- * 
  -- * EnterNotify and LeaveNotify events are generated.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_ungrab_pointer_checked (c : access xcb.xcb_connection_t; time : xcb_timestamp_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:7432
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ungrab_pointer_checked";

  --*
  -- * @brief release the pointer
  -- *
  -- * @param c The connection
  -- * @param time Timestamp to avoid race conditions when running X over the network.
  -- * \n
  -- * The pointer will not be released if \a time is earlier than the
  -- * last-pointer-grab time or later than the current X server time.
  -- * @return A cookie
  -- *
  -- * Releases the pointer and any queued events if you actively grabbed the pointer
  -- * before using `xcb_grab_pointer`, `xcb_grab_button` or within a normal button
  -- * press.
  -- * 
  -- * EnterNotify and LeaveNotify events are generated.
  -- *
  --  

   function xcb_ungrab_pointer (c : access xcb.xcb_connection_t; time : xcb_timestamp_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:7453
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ungrab_pointer";

  --*
  -- * @brief Grab pointer button(s)
  -- *
  -- * @param c The connection
  -- * @param owner_events If 1, the \a grab_window will still get the pointer events. If 0, events are not
  -- * reported to the \a grab_window.
  -- * @param grab_window Specifies the window on which the pointer should be grabbed.
  -- * @param event_mask Specifies which pointer events are reported to the client.
  -- * \n
  -- * TODO: which values?
  -- * @param pointer_mode A bitmask of #xcb_grab_mode_t values.
  -- * @param pointer_mode \n
  -- * @param keyboard_mode A bitmask of #xcb_grab_mode_t values.
  -- * @param keyboard_mode \n
  -- * @param confine_to Specifies the window to confine the pointer in (the user will not be able to
  -- * move the pointer out of that window).
  -- * \n
  -- * The special value `XCB_NONE` means don't confine the pointer.
  -- * @param cursor Specifies the cursor that should be displayed or `XCB_NONE` to not change the
  -- * cursor.
  -- * @param button A bitmask of #xcb_button_index_t values.
  -- * @param button \n
  -- * @param modifiers The modifiers to grab.
  -- * \n
  -- * Using the special value `XCB_MOD_MASK_ANY` means grab the pointer with all
  -- * possible modifier combinations.
  -- * @return A cookie
  -- *
  -- * This request establishes a passive grab. The pointer is actively grabbed as
  -- * described in GrabPointer, the last-pointer-grab time is set to the time at
  -- * which the button was pressed (as transmitted in the ButtonPress event), and the
  -- * ButtonPress event is reported if all of the following conditions are true:
  -- * 
  -- * The pointer is not grabbed and the specified button is logically pressed when
  -- * the specified modifier keys are logically down, and no other buttons or
  -- * modifier keys are logically down.
  -- * 
  -- * The grab-window contains the pointer.
  -- * 
  -- * The confine-to window (if any) is viewable.
  -- * 
  -- * A passive grab on the same button/key combination does not exist on any
  -- * ancestor of grab-window.
  -- * 
  -- * The interpretation of the remaining arguments is the same as for GrabPointer.
  -- * The active grab is terminated automatically when the logical state of the
  -- * pointer has all buttons released, independent of the logical state of modifier
  -- * keys. Note that the logical state of a device (as seen by means of the
  -- * protocol) may lag the physical state if device event processing is frozen. This
  -- * request overrides all previous passive grabs by the same client on the same
  -- * button/key combinations on the same window. A modifier of AnyModifier is
  -- * equivalent to issuing the request for all possible modifier combinations
  -- * (including the combination of no modifiers). It is not required that all
  -- * specified modifiers have currently assigned keycodes. A button of AnyButton is
  -- * equivalent to issuing the request for all possible buttons. Otherwise, it is
  -- * not required that the button specified currently be assigned to a physical
  -- * button.
  -- * 
  -- * An Access error is generated if some other client has already issued a
  -- * GrabButton request with the same button/key combination on the same window.
  -- * When using AnyModifier or AnyButton, the request fails completely (no grabs are
  -- * established), and an Access error is generated if there is a conflicting grab
  -- * for any combination. The request has no effect on an active grab.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_grab_button_checked
     (c : access xcb.xcb_connection_t;
      owner_events : bits_stdint_uintn_h.uint8_t;
      grab_window : xcb_window_t;
      event_mask : bits_stdint_uintn_h.uint16_t;
      pointer_mode : bits_stdint_uintn_h.uint8_t;
      keyboard_mode : bits_stdint_uintn_h.uint8_t;
      confine_to : xcb_window_t;
      cursor : xcb_cursor_t;
      button : bits_stdint_uintn_h.uint8_t;
      modifiers : bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:7525
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_grab_button_checked";

  --*
  -- * @brief Grab pointer button(s)
  -- *
  -- * @param c The connection
  -- * @param owner_events If 1, the \a grab_window will still get the pointer events. If 0, events are not
  -- * reported to the \a grab_window.
  -- * @param grab_window Specifies the window on which the pointer should be grabbed.
  -- * @param event_mask Specifies which pointer events are reported to the client.
  -- * \n
  -- * TODO: which values?
  -- * @param pointer_mode A bitmask of #xcb_grab_mode_t values.
  -- * @param pointer_mode \n
  -- * @param keyboard_mode A bitmask of #xcb_grab_mode_t values.
  -- * @param keyboard_mode \n
  -- * @param confine_to Specifies the window to confine the pointer in (the user will not be able to
  -- * move the pointer out of that window).
  -- * \n
  -- * The special value `XCB_NONE` means don't confine the pointer.
  -- * @param cursor Specifies the cursor that should be displayed or `XCB_NONE` to not change the
  -- * cursor.
  -- * @param button A bitmask of #xcb_button_index_t values.
  -- * @param button \n
  -- * @param modifiers The modifiers to grab.
  -- * \n
  -- * Using the special value `XCB_MOD_MASK_ANY` means grab the pointer with all
  -- * possible modifier combinations.
  -- * @return A cookie
  -- *
  -- * This request establishes a passive grab. The pointer is actively grabbed as
  -- * described in GrabPointer, the last-pointer-grab time is set to the time at
  -- * which the button was pressed (as transmitted in the ButtonPress event), and the
  -- * ButtonPress event is reported if all of the following conditions are true:
  -- * 
  -- * The pointer is not grabbed and the specified button is logically pressed when
  -- * the specified modifier keys are logically down, and no other buttons or
  -- * modifier keys are logically down.
  -- * 
  -- * The grab-window contains the pointer.
  -- * 
  -- * The confine-to window (if any) is viewable.
  -- * 
  -- * A passive grab on the same button/key combination does not exist on any
  -- * ancestor of grab-window.
  -- * 
  -- * The interpretation of the remaining arguments is the same as for GrabPointer.
  -- * The active grab is terminated automatically when the logical state of the
  -- * pointer has all buttons released, independent of the logical state of modifier
  -- * keys. Note that the logical state of a device (as seen by means of the
  -- * protocol) may lag the physical state if device event processing is frozen. This
  -- * request overrides all previous passive grabs by the same client on the same
  -- * button/key combinations on the same window. A modifier of AnyModifier is
  -- * equivalent to issuing the request for all possible modifier combinations
  -- * (including the combination of no modifiers). It is not required that all
  -- * specified modifiers have currently assigned keycodes. A button of AnyButton is
  -- * equivalent to issuing the request for all possible buttons. Otherwise, it is
  -- * not required that the button specified currently be assigned to a physical
  -- * button.
  -- * 
  -- * An Access error is generated if some other client has already issued a
  -- * GrabButton request with the same button/key combination on the same window.
  -- * When using AnyModifier or AnyButton, the request fails completely (no grabs are
  -- * established), and an Access error is generated if there is a conflicting grab
  -- * for any combination. The request has no effect on an active grab.
  -- *
  --  

   function xcb_grab_button
     (c : access xcb.xcb_connection_t;
      owner_events : bits_stdint_uintn_h.uint8_t;
      grab_window : xcb_window_t;
      event_mask : bits_stdint_uintn_h.uint16_t;
      pointer_mode : bits_stdint_uintn_h.uint8_t;
      keyboard_mode : bits_stdint_uintn_h.uint8_t;
      confine_to : xcb_window_t;
      cursor : xcb_cursor_t;
      button : bits_stdint_uintn_h.uint8_t;
      modifiers : bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:7602
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_grab_button";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_ungrab_button_checked
     (c : access xcb.xcb_connection_t;
      button : bits_stdint_uintn_h.uint8_t;
      grab_window : xcb_window_t;
      modifiers : bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:7625
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ungrab_button_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_ungrab_button
     (c : access xcb.xcb_connection_t;
      button : bits_stdint_uintn_h.uint8_t;
      grab_window : xcb_window_t;
      modifiers : bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:7639
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ungrab_button";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_change_active_pointer_grab_checked
     (c : access xcb.xcb_connection_t;
      cursor : xcb_cursor_t;
      time : xcb_timestamp_t;
      event_mask : bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:7656
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_active_pointer_grab_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_change_active_pointer_grab
     (c : access xcb.xcb_connection_t;
      cursor : xcb_cursor_t;
      time : xcb_timestamp_t;
      event_mask : bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:7670
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_active_pointer_grab";

  --*
  -- * @brief Grab the keyboard
  -- *
  -- * @param c The connection
  -- * @param owner_events If 1, the \a grab_window will still get the pointer events. If 0, events are not
  -- * reported to the \a grab_window.
  -- * @param grab_window Specifies the window on which the pointer should be grabbed.
  -- * @param time Timestamp to avoid race conditions when running X over the network.
  -- * \n
  -- * The special value `XCB_CURRENT_TIME` will be replaced with the current server
  -- * time.
  -- * @param pointer_mode A bitmask of #xcb_grab_mode_t values.
  -- * @param pointer_mode \n
  -- * @param keyboard_mode A bitmask of #xcb_grab_mode_t values.
  -- * @param keyboard_mode \n
  -- * @return A cookie
  -- *
  -- * Actively grabs control of the keyboard and generates FocusIn and FocusOut
  -- * events. Further key events are reported only to the grabbing client.
  -- * 
  -- * Any active keyboard grab by this client is overridden. If the keyboard is
  -- * actively grabbed by some other client, `AlreadyGrabbed` is returned. If
  -- * \a grab_window is not viewable, `GrabNotViewable` is returned. If the keyboard
  -- * is frozen by an active grab of another client, `GrabFrozen` is returned. If the
  -- * specified \a time is earlier than the last-keyboard-grab time or later than the
  -- * current X server time, `GrabInvalidTime` is returned. Otherwise, the
  -- * last-keyboard-grab time is set to the specified time.
  -- *
  --  

   function xcb_grab_keyboard
     (c : access xcb.xcb_connection_t;
      owner_events : bits_stdint_uintn_h.uint8_t;
      grab_window : xcb_window_t;
      time : xcb_timestamp_t;
      pointer_mode : bits_stdint_uintn_h.uint8_t;
      keyboard_mode : bits_stdint_uintn_h.uint8_t) return xcb_grab_keyboard_cookie_t  -- /usr/include/xcb/xproto.h:7705
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_grab_keyboard";

  --*
  -- * @brief Grab the keyboard
  -- *
  -- * @param c The connection
  -- * @param owner_events If 1, the \a grab_window will still get the pointer events. If 0, events are not
  -- * reported to the \a grab_window.
  -- * @param grab_window Specifies the window on which the pointer should be grabbed.
  -- * @param time Timestamp to avoid race conditions when running X over the network.
  -- * \n
  -- * The special value `XCB_CURRENT_TIME` will be replaced with the current server
  -- * time.
  -- * @param pointer_mode A bitmask of #xcb_grab_mode_t values.
  -- * @param pointer_mode \n
  -- * @param keyboard_mode A bitmask of #xcb_grab_mode_t values.
  -- * @param keyboard_mode \n
  -- * @return A cookie
  -- *
  -- * Actively grabs control of the keyboard and generates FocusIn and FocusOut
  -- * events. Further key events are reported only to the grabbing client.
  -- * 
  -- * Any active keyboard grab by this client is overridden. If the keyboard is
  -- * actively grabbed by some other client, `AlreadyGrabbed` is returned. If
  -- * \a grab_window is not viewable, `GrabNotViewable` is returned. If the keyboard
  -- * is frozen by an active grab of another client, `GrabFrozen` is returned. If the
  -- * specified \a time is earlier than the last-keyboard-grab time or later than the
  -- * current X server time, `GrabInvalidTime` is returned. Otherwise, the
  -- * last-keyboard-grab time is set to the specified time.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_grab_keyboard_unchecked
     (c : access xcb.xcb_connection_t;
      owner_events : bits_stdint_uintn_h.uint8_t;
      grab_window : xcb_window_t;
      time : xcb_timestamp_t;
      pointer_mode : bits_stdint_uintn_h.uint8_t;
      keyboard_mode : bits_stdint_uintn_h.uint8_t) return xcb_grab_keyboard_cookie_t  -- /usr/include/xcb/xproto.h:7745
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_grab_keyboard_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_grab_keyboard_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_grab_keyboard_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_grab_keyboard_cookie_t;
      e : System.Address) return access xcb_grab_keyboard_reply_t  -- /usr/include/xcb/xproto.h:7767
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_grab_keyboard_reply";

  --*<  
  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_ungrab_keyboard_checked (c : access xcb.xcb_connection_t; time : xcb_timestamp_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:7783
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ungrab_keyboard_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_ungrab_keyboard (c : access xcb.xcb_connection_t; time : xcb_timestamp_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:7795
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ungrab_keyboard";

  --*
  -- * @brief Grab keyboard key(s)
  -- *
  -- * @param c The connection
  -- * @param owner_events If 1, the \a grab_window will still get the pointer events. If 0, events are not
  -- * reported to the \a grab_window.
  -- * @param grab_window Specifies the window on which the pointer should be grabbed.
  -- * @param modifiers The modifiers to grab.
  -- * \n
  -- * Using the special value `XCB_MOD_MASK_ANY` means grab the pointer with all
  -- * possible modifier combinations.
  -- * @param key The keycode of the key to grab.
  -- * \n
  -- * The special value `XCB_GRAB_ANY` means grab any key.
  -- * @param pointer_mode A bitmask of #xcb_grab_mode_t values.
  -- * @param pointer_mode \n
  -- * @param keyboard_mode A bitmask of #xcb_grab_mode_t values.
  -- * @param keyboard_mode \n
  -- * @return A cookie
  -- *
  -- * Establishes a passive grab on the keyboard. In the future, the keyboard is
  -- * actively grabbed (as for `GrabKeyboard`), the last-keyboard-grab time is set to
  -- * the time at which the key was pressed (as transmitted in the KeyPress event),
  -- * and the KeyPress event is reported if all of the following conditions are true:
  -- * 
  -- * The keyboard is not grabbed and the specified key (which can itself be a
  -- * modifier key) is logically pressed when the specified modifier keys are
  -- * logically down, and no other modifier keys are logically down.
  -- * 
  -- * Either the grab_window is an ancestor of (or is) the focus window, or the
  -- * grab_window is a descendant of the focus window and contains the pointer.
  -- * 
  -- * A passive grab on the same key combination does not exist on any ancestor of
  -- * grab_window.
  -- * 
  -- * The interpretation of the remaining arguments is as for XGrabKeyboard.  The active grab is terminated
  -- * automatically when the logical state of the keyboard has the specified key released (independent of the
  -- * logical state of the modifier keys), at which point a KeyRelease event is reported to the grabbing window.
  -- * 
  -- * Note that the logical state of a device (as seen by client applications) may lag the physical state if
  -- * device event processing is frozen.
  -- * 
  -- * A modifiers argument of AnyModifier is equivalent to issuing the request for all possible modifier combinations (including the combination of no modifiers).  It is not required that all modifiers specified
  -- * have currently assigned KeyCodes.  A keycode argument of AnyKey is equivalent to issuing the request for
  -- * all possible KeyCodes.  Otherwise, the specified keycode must be in the range specified by min_keycode
  -- * and max_keycode in the connection setup, or a BadValue error results.
  -- * 
  -- * If some other client has issued a XGrabKey with the same key combination on the same window, a BadAccess
  -- * error results.  When using AnyModifier or AnyKey, the request fails completely, and a BadAccess error
  -- * results (no grabs are established) if there is a conflicting grab for any combination.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_grab_key_checked
     (c : access xcb.xcb_connection_t;
      owner_events : bits_stdint_uintn_h.uint8_t;
      grab_window : xcb_window_t;
      modifiers : bits_stdint_uintn_h.uint16_t;
      key : xcb_keycode_t;
      pointer_mode : bits_stdint_uintn_h.uint8_t;
      keyboard_mode : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:7854
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_grab_key_checked";

  --*
  -- * @brief Grab keyboard key(s)
  -- *
  -- * @param c The connection
  -- * @param owner_events If 1, the \a grab_window will still get the pointer events. If 0, events are not
  -- * reported to the \a grab_window.
  -- * @param grab_window Specifies the window on which the pointer should be grabbed.
  -- * @param modifiers The modifiers to grab.
  -- * \n
  -- * Using the special value `XCB_MOD_MASK_ANY` means grab the pointer with all
  -- * possible modifier combinations.
  -- * @param key The keycode of the key to grab.
  -- * \n
  -- * The special value `XCB_GRAB_ANY` means grab any key.
  -- * @param pointer_mode A bitmask of #xcb_grab_mode_t values.
  -- * @param pointer_mode \n
  -- * @param keyboard_mode A bitmask of #xcb_grab_mode_t values.
  -- * @param keyboard_mode \n
  -- * @return A cookie
  -- *
  -- * Establishes a passive grab on the keyboard. In the future, the keyboard is
  -- * actively grabbed (as for `GrabKeyboard`), the last-keyboard-grab time is set to
  -- * the time at which the key was pressed (as transmitted in the KeyPress event),
  -- * and the KeyPress event is reported if all of the following conditions are true:
  -- * 
  -- * The keyboard is not grabbed and the specified key (which can itself be a
  -- * modifier key) is logically pressed when the specified modifier keys are
  -- * logically down, and no other modifier keys are logically down.
  -- * 
  -- * Either the grab_window is an ancestor of (or is) the focus window, or the
  -- * grab_window is a descendant of the focus window and contains the pointer.
  -- * 
  -- * A passive grab on the same key combination does not exist on any ancestor of
  -- * grab_window.
  -- * 
  -- * The interpretation of the remaining arguments is as for XGrabKeyboard.  The active grab is terminated
  -- * automatically when the logical state of the keyboard has the specified key released (independent of the
  -- * logical state of the modifier keys), at which point a KeyRelease event is reported to the grabbing window.
  -- * 
  -- * Note that the logical state of a device (as seen by client applications) may lag the physical state if
  -- * device event processing is frozen.
  -- * 
  -- * A modifiers argument of AnyModifier is equivalent to issuing the request for all possible modifier combinations (including the combination of no modifiers).  It is not required that all modifiers specified
  -- * have currently assigned KeyCodes.  A keycode argument of AnyKey is equivalent to issuing the request for
  -- * all possible KeyCodes.  Otherwise, the specified keycode must be in the range specified by min_keycode
  -- * and max_keycode in the connection setup, or a BadValue error results.
  -- * 
  -- * If some other client has issued a XGrabKey with the same key combination on the same window, a BadAccess
  -- * error results.  When using AnyModifier or AnyKey, the request fails completely, and a BadAccess error
  -- * results (no grabs are established) if there is a conflicting grab for any combination.
  -- *
  --  

   function xcb_grab_key
     (c : access xcb.xcb_connection_t;
      owner_events : bits_stdint_uintn_h.uint8_t;
      grab_window : xcb_window_t;
      modifiers : bits_stdint_uintn_h.uint16_t;
      key : xcb_keycode_t;
      pointer_mode : bits_stdint_uintn_h.uint8_t;
      keyboard_mode : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:7915
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_grab_key";

  --*
  -- * @brief release a key combination
  -- *
  -- * @param c The connection
  -- * @param key The keycode of the specified key combination.
  -- * \n
  -- * Using the special value `XCB_GRAB_ANY` means releasing all possible key codes.
  -- * @param grab_window The window on which the grabbed key combination will be released.
  -- * @param modifiers The modifiers of the specified key combination.
  -- * \n
  -- * Using the special value `XCB_MOD_MASK_ANY` means releasing the key combination
  -- * with every possible modifier combination.
  -- * @return A cookie
  -- *
  -- * Releases the key combination on \a grab_window if you grabbed it using
  -- * `xcb_grab_key` before.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_ungrab_key_checked
     (c : access xcb.xcb_connection_t;
      key : xcb_keycode_t;
      grab_window : xcb_window_t;
      modifiers : bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:7945
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ungrab_key_checked";

  --*
  -- * @brief release a key combination
  -- *
  -- * @param c The connection
  -- * @param key The keycode of the specified key combination.
  -- * \n
  -- * Using the special value `XCB_GRAB_ANY` means releasing all possible key codes.
  -- * @param grab_window The window on which the grabbed key combination will be released.
  -- * @param modifiers The modifiers of the specified key combination.
  -- * \n
  -- * Using the special value `XCB_MOD_MASK_ANY` means releasing the key combination
  -- * with every possible modifier combination.
  -- * @return A cookie
  -- *
  -- * Releases the key combination on \a grab_window if you grabbed it using
  -- * `xcb_grab_key` before.
  -- *
  --  

   function xcb_ungrab_key
     (c : access xcb.xcb_connection_t;
      key : xcb_keycode_t;
      grab_window : xcb_window_t;
      modifiers : bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:7969
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ungrab_key";

  --*
  -- * @brief release queued events
  -- *
  -- * @param c The connection
  -- * @param mode A bitmask of #xcb_allow_t values.
  -- * @param mode \n
  -- * @param time Timestamp to avoid race conditions when running X over the network.
  -- * \n
  -- * The special value `XCB_CURRENT_TIME` will be replaced with the current server
  -- * time.
  -- * @return A cookie
  -- *
  -- * Releases queued events if the client has caused a device (pointer/keyboard) to
  -- * freeze due to grabbing it actively. This request has no effect if \a time is
  -- * earlier than the last-grab time of the most recent active grab for this client
  -- * or if \a time is later than the current X server time.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_allow_events_checked
     (c : access xcb.xcb_connection_t;
      mode : bits_stdint_uintn_h.uint8_t;
      time : xcb_timestamp_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:7996
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_allow_events_checked";

  --*
  -- * @brief release queued events
  -- *
  -- * @param c The connection
  -- * @param mode A bitmask of #xcb_allow_t values.
  -- * @param mode \n
  -- * @param time Timestamp to avoid race conditions when running X over the network.
  -- * \n
  -- * The special value `XCB_CURRENT_TIME` will be replaced with the current server
  -- * time.
  -- * @return A cookie
  -- *
  -- * Releases queued events if the client has caused a device (pointer/keyboard) to
  -- * freeze due to grabbing it actively. This request has no effect if \a time is
  -- * earlier than the last-grab time of the most recent active grab for this client
  -- * or if \a time is later than the current X server time.
  -- *
  --  

   function xcb_allow_events
     (c : access xcb.xcb_connection_t;
      mode : bits_stdint_uintn_h.uint8_t;
      time : xcb_timestamp_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:8019
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_allow_events";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_grab_server_checked (c : access xcb.xcb_connection_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:8035
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_grab_server_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_grab_server (c : access xcb.xcb_connection_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:8046
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_grab_server";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_ungrab_server_checked (c : access xcb.xcb_connection_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:8060
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ungrab_server_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_ungrab_server (c : access xcb.xcb_connection_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:8071
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ungrab_server";

  --*
  -- * @brief get pointer coordinates
  -- *
  -- * @param c The connection
  -- * @param window A window to check if the pointer is on the same screen as \a window (see the
  -- * `same_screen` field in the reply).
  -- * @return A cookie
  -- *
  -- * Gets the root window the pointer is logically on and the pointer coordinates
  -- * relative to the root window's origin.
  -- *
  --  

   function xcb_query_pointer (c : access xcb.xcb_connection_t; window : xcb_window_t) return xcb_query_pointer_cookie_t  -- /usr/include/xcb/xproto.h:8086
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_pointer";

  --*
  -- * @brief get pointer coordinates
  -- *
  -- * @param c The connection
  -- * @param window A window to check if the pointer is on the same screen as \a window (see the
  -- * `same_screen` field in the reply).
  -- * @return A cookie
  -- *
  -- * Gets the root window the pointer is logically on and the pointer coordinates
  -- * relative to the root window's origin.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_query_pointer_unchecked (c : access xcb.xcb_connection_t; window : xcb_window_t) return xcb_query_pointer_cookie_t  -- /usr/include/xcb/xproto.h:8105
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_pointer_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_query_pointer_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_query_pointer_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_query_pointer_cookie_t;
      e : System.Address) return access xcb_query_pointer_reply_t  -- /usr/include/xcb/xproto.h:8123
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_pointer_reply";

  --*<  
  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_timecoord_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_timecoord_t)
  --  

   procedure xcb_timecoord_next (i : access xcb_timecoord_iterator_t)  -- /usr/include/xcb/xproto.h:8136
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_timecoord_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_timecoord_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_timecoord_end (i : xcb_timecoord_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:8148
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_timecoord_end";

   function xcb_get_motion_events_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:8151
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_motion_events_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_get_motion_events
     (c : access xcb.xcb_connection_t;
      window : xcb_window_t;
      start : xcb_timestamp_t;
      stop : xcb_timestamp_t) return xcb_get_motion_events_cookie_t  -- /usr/include/xcb/xproto.h:8162
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_motion_events";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_get_motion_events_unchecked
     (c : access xcb.xcb_connection_t;
      window : xcb_window_t;
      start : xcb_timestamp_t;
      stop : xcb_timestamp_t) return xcb_get_motion_events_cookie_t  -- /usr/include/xcb/xproto.h:8179
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_motion_events_unchecked";

   function xcb_get_motion_events_events (R : access constant xcb_get_motion_events_reply_t) return access xcb_timecoord_t  -- /usr/include/xcb/xproto.h:8185
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_motion_events_events";

   function xcb_get_motion_events_events_length (R : access constant xcb_get_motion_events_reply_t) return int  -- /usr/include/xcb/xproto.h:8188
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_motion_events_events_length";

   function xcb_get_motion_events_events_iterator (R : access constant xcb_get_motion_events_reply_t) return xcb_timecoord_iterator_t  -- /usr/include/xcb/xproto.h:8191
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_motion_events_events_iterator";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_get_motion_events_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_get_motion_events_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_get_motion_events_cookie_t;
      e : System.Address) return access xcb_get_motion_events_reply_t  -- /usr/include/xcb/xproto.h:8208
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_motion_events_reply";

  --*<  
  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_translate_coordinates
     (c : access xcb.xcb_connection_t;
      src_window : xcb_window_t;
      dst_window : xcb_window_t;
      src_x : bits_stdint_intn_h.int16_t;
      src_y : bits_stdint_intn_h.int16_t) return xcb_translate_coordinates_cookie_t  -- /usr/include/xcb/xproto.h:8221
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_translate_coordinates";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_translate_coordinates_unchecked
     (c : access xcb.xcb_connection_t;
      src_window : xcb_window_t;
      dst_window : xcb_window_t;
      src_x : bits_stdint_intn_h.int16_t;
      src_y : bits_stdint_intn_h.int16_t) return xcb_translate_coordinates_cookie_t  -- /usr/include/xcb/xproto.h:8239
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_translate_coordinates_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_translate_coordinates_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_translate_coordinates_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_translate_coordinates_cookie_t;
      e : System.Address) return access xcb_translate_coordinates_reply_t  -- /usr/include/xcb/xproto.h:8260
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_translate_coordinates_reply";

  --*<  
  --*
  -- * @brief move mouse pointer
  -- *
  -- * @param c The connection
  -- * @param src_window If \a src_window is not `XCB_NONE` (TODO), the move will only take place if the
  -- * pointer is inside \a src_window and within the rectangle specified by (\a src_x,
  -- * \a src_y, \a src_width, \a src_height). The rectangle coordinates are relative to
  -- * \a src_window.
  -- * @param dst_window If \a dst_window is not `XCB_NONE` (TODO), the pointer will be moved to the
  -- * offsets (\a dst_x, \a dst_y) relative to \a dst_window. If \a dst_window is
  -- * `XCB_NONE` (TODO), the pointer will be moved by the offsets (\a dst_x, \a dst_y)
  -- * relative to the current position of the pointer.
  -- * @return A cookie
  -- *
  -- * Moves the mouse pointer to the specified position.
  -- * 
  -- * If \a src_window is not `XCB_NONE` (TODO), the move will only take place if the
  -- * pointer is inside \a src_window and within the rectangle specified by (\a src_x,
  -- * \a src_y, \a src_width, \a src_height). The rectangle coordinates are relative to
  -- * \a src_window.
  -- * 
  -- * If \a dst_window is not `XCB_NONE` (TODO), the pointer will be moved to the
  -- * offsets (\a dst_x, \a dst_y) relative to \a dst_window. If \a dst_window is
  -- * `XCB_NONE` (TODO), the pointer will be moved by the offsets (\a dst_x, \a dst_y)
  -- * relative to the current position of the pointer.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_warp_pointer_checked
     (c : access xcb.xcb_connection_t;
      src_window : xcb_window_t;
      dst_window : xcb_window_t;
      src_x : bits_stdint_intn_h.int16_t;
      src_y : bits_stdint_intn_h.int16_t;
      src_width : bits_stdint_uintn_h.uint16_t;
      src_height : bits_stdint_uintn_h.uint16_t;
      dst_x : bits_stdint_intn_h.int16_t;
      dst_y : bits_stdint_intn_h.int16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:8295
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_warp_pointer_checked";

  --*
  -- * @brief move mouse pointer
  -- *
  -- * @param c The connection
  -- * @param src_window If \a src_window is not `XCB_NONE` (TODO), the move will only take place if the
  -- * pointer is inside \a src_window and within the rectangle specified by (\a src_x,
  -- * \a src_y, \a src_width, \a src_height). The rectangle coordinates are relative to
  -- * \a src_window.
  -- * @param dst_window If \a dst_window is not `XCB_NONE` (TODO), the pointer will be moved to the
  -- * offsets (\a dst_x, \a dst_y) relative to \a dst_window. If \a dst_window is
  -- * `XCB_NONE` (TODO), the pointer will be moved by the offsets (\a dst_x, \a dst_y)
  -- * relative to the current position of the pointer.
  -- * @return A cookie
  -- *
  -- * Moves the mouse pointer to the specified position.
  -- * 
  -- * If \a src_window is not `XCB_NONE` (TODO), the move will only take place if the
  -- * pointer is inside \a src_window and within the rectangle specified by (\a src_x,
  -- * \a src_y, \a src_width, \a src_height). The rectangle coordinates are relative to
  -- * \a src_window.
  -- * 
  -- * If \a dst_window is not `XCB_NONE` (TODO), the pointer will be moved to the
  -- * offsets (\a dst_x, \a dst_y) relative to \a dst_window. If \a dst_window is
  -- * `XCB_NONE` (TODO), the pointer will be moved by the offsets (\a dst_x, \a dst_y)
  -- * relative to the current position of the pointer.
  -- *
  --  

   function xcb_warp_pointer
     (c : access xcb.xcb_connection_t;
      src_window : xcb_window_t;
      dst_window : xcb_window_t;
      src_x : bits_stdint_intn_h.int16_t;
      src_y : bits_stdint_intn_h.int16_t;
      src_width : bits_stdint_uintn_h.uint16_t;
      src_height : bits_stdint_uintn_h.uint16_t;
      dst_x : bits_stdint_intn_h.int16_t;
      dst_y : bits_stdint_intn_h.int16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:8333
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_warp_pointer";

  --*
  -- * @brief Sets input focus
  -- *
  -- * @param c The connection
  -- * @param revert_to A bitmask of #xcb_input_focus_t values.
  -- * @param revert_to Specifies what happens when the \a focus window becomes unviewable (if \a focus
  -- * is neither `XCB_NONE` nor `XCB_POINTER_ROOT`).
  -- * @param focus The window to focus. All keyboard events will be reported to this window. The
  -- * window must be viewable (TODO), or a `xcb_match_error_t` occurs (TODO).
  -- * \n
  -- * If \a focus is `XCB_NONE` (TODO), all keyboard events are
  -- * discarded until a new focus window is set.
  -- * \n
  -- * If \a focus is `XCB_POINTER_ROOT` (TODO), focus is on the root window of the
  -- * screen on which the pointer is on currently.
  -- * @param time Timestamp to avoid race conditions when running X over the network.
  -- * \n
  -- * The special value `XCB_CURRENT_TIME` will be replaced with the current server
  -- * time.
  -- * @return A cookie
  -- *
  -- * Changes the input focus and the last-focus-change time. If the specified \a time
  -- * is earlier than the current last-focus-change time, the request is ignored (to
  -- * avoid race conditions when running X over the network).
  -- * 
  -- * A FocusIn and FocusOut event is generated when focus is changed.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_set_input_focus_checked
     (c : access xcb.xcb_connection_t;
      revert_to : bits_stdint_uintn_h.uint8_t;
      focus : xcb_window_t;
      time : xcb_timestamp_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:8375
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_input_focus_checked";

  --*
  -- * @brief Sets input focus
  -- *
  -- * @param c The connection
  -- * @param revert_to A bitmask of #xcb_input_focus_t values.
  -- * @param revert_to Specifies what happens when the \a focus window becomes unviewable (if \a focus
  -- * is neither `XCB_NONE` nor `XCB_POINTER_ROOT`).
  -- * @param focus The window to focus. All keyboard events will be reported to this window. The
  -- * window must be viewable (TODO), or a `xcb_match_error_t` occurs (TODO).
  -- * \n
  -- * If \a focus is `XCB_NONE` (TODO), all keyboard events are
  -- * discarded until a new focus window is set.
  -- * \n
  -- * If \a focus is `XCB_POINTER_ROOT` (TODO), focus is on the root window of the
  -- * screen on which the pointer is on currently.
  -- * @param time Timestamp to avoid race conditions when running X over the network.
  -- * \n
  -- * The special value `XCB_CURRENT_TIME` will be replaced with the current server
  -- * time.
  -- * @return A cookie
  -- *
  -- * Changes the input focus and the last-focus-change time. If the specified \a time
  -- * is earlier than the current last-focus-change time, the request is ignored (to
  -- * avoid race conditions when running X over the network).
  -- * 
  -- * A FocusIn and FocusOut event is generated when focus is changed.
  -- *
  --  

   function xcb_set_input_focus
     (c : access xcb.xcb_connection_t;
      revert_to : bits_stdint_uintn_h.uint8_t;
      focus : xcb_window_t;
      time : xcb_timestamp_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:8409
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_input_focus";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_get_input_focus (c : access xcb.xcb_connection_t) return xcb_get_input_focus_cookie_t  -- /usr/include/xcb/xproto.h:8423
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_input_focus";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_get_input_focus_unchecked (c : access xcb.xcb_connection_t) return xcb_get_input_focus_cookie_t  -- /usr/include/xcb/xproto.h:8437
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_input_focus_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_get_input_focus_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_get_input_focus_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_get_input_focus_cookie_t;
      e : System.Address) return access xcb_get_input_focus_reply_t  -- /usr/include/xcb/xproto.h:8454
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_input_focus_reply";

  --*<  
  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_query_keymap (c : access xcb.xcb_connection_t) return xcb_query_keymap_cookie_t  -- /usr/include/xcb/xproto.h:8467
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_keymap";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_query_keymap_unchecked (c : access xcb.xcb_connection_t) return xcb_query_keymap_cookie_t  -- /usr/include/xcb/xproto.h:8481
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_keymap_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_query_keymap_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_query_keymap_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_query_keymap_cookie_t;
      e : System.Address) return access xcb_query_keymap_reply_t  -- /usr/include/xcb/xproto.h:8498
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_keymap_reply";

  --*<  
   function xcb_open_font_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:8503
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_open_font_sizeof";

  --*
  -- * @brief opens a font
  -- *
  -- * @param c The connection
  -- * @param fid The ID with which you will refer to the font, created by `xcb_generate_id`.
  -- * @param name_len Length (in bytes) of \a name.
  -- * @param name A pattern describing an X core font.
  -- * @return A cookie
  -- *
  -- * Opens any X core font matching the given \a name (for example "-misc-fixed-*").
  -- * 
  -- * Note that X core fonts are deprecated (but still supported) in favor of
  -- * client-side rendering using Xft.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_open_font_checked
     (c : access xcb.xcb_connection_t;
      fid : xcb_font_t;
      name_len : bits_stdint_uintn_h.uint16_t;
      name : Interfaces.C.Strings.chars_ptr) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:8524
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_open_font_checked";

  --*
  -- * @brief opens a font
  -- *
  -- * @param c The connection
  -- * @param fid The ID with which you will refer to the font, created by `xcb_generate_id`.
  -- * @param name_len Length (in bytes) of \a name.
  -- * @param name A pattern describing an X core font.
  -- * @return A cookie
  -- *
  -- * Opens any X core font matching the given \a name (for example "-misc-fixed-*").
  -- * 
  -- * Note that X core fonts are deprecated (but still supported) in favor of
  -- * client-side rendering using Xft.
  -- *
  --  

   function xcb_open_font
     (c : access xcb.xcb_connection_t;
      fid : xcb_font_t;
      name_len : bits_stdint_uintn_h.uint16_t;
      name : Interfaces.C.Strings.chars_ptr) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:8545
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_open_font";

   function xcb_open_font_name (R : access constant xcb_open_font_request_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/xproto.h:8551
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_open_font_name";

   function xcb_open_font_name_length (R : access constant xcb_open_font_request_t) return int  -- /usr/include/xcb/xproto.h:8554
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_open_font_name_length";

   function xcb_open_font_name_end (R : access constant xcb_open_font_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:8557
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_open_font_name_end";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_close_font_checked (c : access xcb.xcb_connection_t; font : xcb_font_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:8571
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_close_font_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_close_font (c : access xcb.xcb_connection_t; font : xcb_font_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:8583
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_close_font";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_fontprop_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_fontprop_t)
  --  

   procedure xcb_fontprop_next (i : access xcb_fontprop_iterator_t)  -- /usr/include/xcb/xproto.h:8595
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_fontprop_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_fontprop_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_fontprop_end (i : xcb_fontprop_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:8607
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_fontprop_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_charinfo_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_charinfo_t)
  --  

   procedure xcb_charinfo_next (i : access xcb_charinfo_iterator_t)  -- /usr/include/xcb/xproto.h:8618
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_charinfo_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_charinfo_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_charinfo_end (i : xcb_charinfo_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:8630
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_charinfo_end";

   function xcb_query_font_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:8633
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_font_sizeof";

  --*
  -- * @brief query font metrics
  -- *
  -- * @param c The connection
  -- * @param font The fontable (Font or Graphics Context) to query.
  -- * @return A cookie
  -- *
  -- * Queries information associated with the font.
  -- *
  --  

   function xcb_query_font (c : access xcb.xcb_connection_t; font : xcb_fontable_t) return xcb_query_font_cookie_t  -- /usr/include/xcb/xproto.h:8646
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_font";

  --*
  -- * @brief query font metrics
  -- *
  -- * @param c The connection
  -- * @param font The fontable (Font or Graphics Context) to query.
  -- * @return A cookie
  -- *
  -- * Queries information associated with the font.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_query_font_unchecked (c : access xcb.xcb_connection_t; font : xcb_fontable_t) return xcb_query_font_cookie_t  -- /usr/include/xcb/xproto.h:8663
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_font_unchecked";

   function xcb_query_font_properties (R : access constant xcb_query_font_reply_t) return access xcb_fontprop_t  -- /usr/include/xcb/xproto.h:8667
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_font_properties";

   function xcb_query_font_properties_length (R : access constant xcb_query_font_reply_t) return int  -- /usr/include/xcb/xproto.h:8670
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_font_properties_length";

   function xcb_query_font_properties_iterator (R : access constant xcb_query_font_reply_t) return xcb_fontprop_iterator_t  -- /usr/include/xcb/xproto.h:8673
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_font_properties_iterator";

   function xcb_query_font_char_infos (R : access constant xcb_query_font_reply_t) return access xcb_charinfo_t  -- /usr/include/xcb/xproto.h:8676
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_font_char_infos";

   function xcb_query_font_char_infos_length (R : access constant xcb_query_font_reply_t) return int  -- /usr/include/xcb/xproto.h:8679
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_font_char_infos_length";

   function xcb_query_font_char_infos_iterator (R : access constant xcb_query_font_reply_t) return xcb_charinfo_iterator_t  -- /usr/include/xcb/xproto.h:8682
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_font_char_infos_iterator";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_query_font_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_query_font_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_query_font_cookie_t;
      e : System.Address) return access xcb_query_font_reply_t  -- /usr/include/xcb/xproto.h:8699
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_font_reply";

  --*<  
   function xcb_query_text_extents_sizeof (u_buffer : System.Address; string_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/xproto.h:8704
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_text_extents_sizeof";

  --*
  -- * @brief get text extents
  -- *
  -- * @param c The connection
  -- * @param font The \a font to calculate text extents in. You can also pass a graphics context.
  -- * @param string_len The number of characters in \a string.
  -- * @param string The text to get text extents for.
  -- * @return A cookie
  -- *
  -- * Query text extents from the X11 server. This request returns the bounding box
  -- * of the specified 16-bit character string in the specified \a font or the font
  -- * contained in the specified graphics context.
  -- * 
  -- * `font_ascent` is set to the maximum of the ascent metrics of all characters in
  -- * the string. `font_descent` is set to the maximum of the descent metrics.
  -- * `overall_width` is set to the sum of the character-width metrics of all
  -- * characters in the string. For each character in the string, let W be the sum of
  -- * the character-width metrics of all characters preceding it in the string. Let L
  -- * be the left-side-bearing metric of the character plus W. Let R be the
  -- * right-side-bearing metric of the character plus W. The lbearing member is set
  -- * to the minimum L of all characters in the string. The rbearing member is set to
  -- * the maximum R.
  -- * 
  -- * For fonts defined with linear indexing rather than 2-byte matrix indexing, each
  -- * `xcb_char2b_t` structure is interpreted as a 16-bit number with byte1 as the
  -- * most significant byte. If the font has no defined default character, undefined
  -- * characters in the string are taken to have all zero metrics.
  -- * 
  -- * Characters with all zero metrics are ignored. If the font has no defined
  -- * default_char, the undefined characters in the string are also ignored.
  -- *
  --  

   function xcb_query_text_extents
     (c : access xcb.xcb_connection_t;
      font : xcb_fontable_t;
      string_len : bits_stdint_uintn_h.uint32_t;
      string : access constant xcb_char2b_t) return xcb_query_text_extents_cookie_t  -- /usr/include/xcb/xproto.h:8740
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_text_extents";

  --*
  -- * @brief get text extents
  -- *
  -- * @param c The connection
  -- * @param font The \a font to calculate text extents in. You can also pass a graphics context.
  -- * @param string_len The number of characters in \a string.
  -- * @param string The text to get text extents for.
  -- * @return A cookie
  -- *
  -- * Query text extents from the X11 server. This request returns the bounding box
  -- * of the specified 16-bit character string in the specified \a font or the font
  -- * contained in the specified graphics context.
  -- * 
  -- * `font_ascent` is set to the maximum of the ascent metrics of all characters in
  -- * the string. `font_descent` is set to the maximum of the descent metrics.
  -- * `overall_width` is set to the sum of the character-width metrics of all
  -- * characters in the string. For each character in the string, let W be the sum of
  -- * the character-width metrics of all characters preceding it in the string. Let L
  -- * be the left-side-bearing metric of the character plus W. Let R be the
  -- * right-side-bearing metric of the character plus W. The lbearing member is set
  -- * to the minimum L of all characters in the string. The rbearing member is set to
  -- * the maximum R.
  -- * 
  -- * For fonts defined with linear indexing rather than 2-byte matrix indexing, each
  -- * `xcb_char2b_t` structure is interpreted as a 16-bit number with byte1 as the
  -- * most significant byte. If the font has no defined default character, undefined
  -- * characters in the string are taken to have all zero metrics.
  -- * 
  -- * Characters with all zero metrics are ignored. If the font has no defined
  -- * default_char, the undefined characters in the string are also ignored.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_query_text_extents_unchecked
     (c : access xcb.xcb_connection_t;
      font : xcb_fontable_t;
      string_len : bits_stdint_uintn_h.uint32_t;
      string : access constant xcb_char2b_t) return xcb_query_text_extents_cookie_t  -- /usr/include/xcb/xproto.h:8781
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_text_extents_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_query_text_extents_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_query_text_extents_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_query_text_extents_cookie_t;
      e : System.Address) return access xcb_query_text_extents_reply_t  -- /usr/include/xcb/xproto.h:8801
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_text_extents_reply";

  --*<  
   function xcb_str_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:8806
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_str_sizeof";

   function xcb_str_name (R : access constant xcb_str_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/xproto.h:8809
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_str_name";

   function xcb_str_name_length (R : access constant xcb_str_t) return int  -- /usr/include/xcb/xproto.h:8812
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_str_name_length";

   function xcb_str_name_end (R : access constant xcb_str_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:8815
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_str_name_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_str_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_str_t)
  --  

   procedure xcb_str_next (i : access xcb_str_iterator_t)  -- /usr/include/xcb/xproto.h:8826
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_str_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_str_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_str_end (i : xcb_str_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:8838
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_str_end";

   function xcb_list_fonts_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:8841
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_fonts_sizeof";

  --*
  -- * @brief get matching font names
  -- *
  -- * @param c The connection
  -- * @param max_names The maximum number of fonts to be returned.
  -- * @param pattern_len The length (in bytes) of \a pattern.
  -- * @param pattern A font pattern, for example "-misc-fixed-*".
  -- * \n
  -- * The asterisk (*) is a wildcard for any number of characters. The question mark
  -- * (?) is a wildcard for a single character. Use of uppercase or lowercase does
  -- * not matter.
  -- * @return A cookie
  -- *
  -- * Gets a list of available font names which match the given \a pattern.
  -- *
  --  

   function xcb_list_fonts
     (c : access xcb.xcb_connection_t;
      max_names : bits_stdint_uintn_h.uint16_t;
      pattern_len : bits_stdint_uintn_h.uint16_t;
      pattern : Interfaces.C.Strings.chars_ptr) return xcb_list_fonts_cookie_t  -- /usr/include/xcb/xproto.h:8860
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_fonts";

  --*
  -- * @brief get matching font names
  -- *
  -- * @param c The connection
  -- * @param max_names The maximum number of fonts to be returned.
  -- * @param pattern_len The length (in bytes) of \a pattern.
  -- * @param pattern A font pattern, for example "-misc-fixed-*".
  -- * \n
  -- * The asterisk (*) is a wildcard for any number of characters. The question mark
  -- * (?) is a wildcard for a single character. Use of uppercase or lowercase does
  -- * not matter.
  -- * @return A cookie
  -- *
  -- * Gets a list of available font names which match the given \a pattern.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_list_fonts_unchecked
     (c : access xcb.xcb_connection_t;
      max_names : bits_stdint_uintn_h.uint16_t;
      pattern_len : bits_stdint_uintn_h.uint16_t;
      pattern : Interfaces.C.Strings.chars_ptr) return xcb_list_fonts_cookie_t  -- /usr/include/xcb/xproto.h:8885
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_fonts_unchecked";

   function xcb_list_fonts_names_length (R : access constant xcb_list_fonts_reply_t) return int  -- /usr/include/xcb/xproto.h:8891
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_fonts_names_length";

   function xcb_list_fonts_names_iterator (R : access constant xcb_list_fonts_reply_t) return xcb_str_iterator_t  -- /usr/include/xcb/xproto.h:8894
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_fonts_names_iterator";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_list_fonts_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_list_fonts_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_list_fonts_cookie_t;
      e : System.Address) return access xcb_list_fonts_reply_t  -- /usr/include/xcb/xproto.h:8911
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_fonts_reply";

  --*<  
   function xcb_list_fonts_with_info_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:8916
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_fonts_with_info_sizeof";

  --*
  -- * @brief get matching font names and information
  -- *
  -- * @param c The connection
  -- * @param max_names The maximum number of fonts to be returned.
  -- * @param pattern_len The length (in bytes) of \a pattern.
  -- * @param pattern A font pattern, for example "-misc-fixed-*".
  -- * \n
  -- * The asterisk (*) is a wildcard for any number of characters. The question mark
  -- * (?) is a wildcard for a single character. Use of uppercase or lowercase does
  -- * not matter.
  -- * @return A cookie
  -- *
  -- * Gets a list of available font names which match the given \a pattern.
  -- *
  --  

   function xcb_list_fonts_with_info
     (c : access xcb.xcb_connection_t;
      max_names : bits_stdint_uintn_h.uint16_t;
      pattern_len : bits_stdint_uintn_h.uint16_t;
      pattern : Interfaces.C.Strings.chars_ptr) return xcb_list_fonts_with_info_cookie_t  -- /usr/include/xcb/xproto.h:8935
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_fonts_with_info";

  --*
  -- * @brief get matching font names and information
  -- *
  -- * @param c The connection
  -- * @param max_names The maximum number of fonts to be returned.
  -- * @param pattern_len The length (in bytes) of \a pattern.
  -- * @param pattern A font pattern, for example "-misc-fixed-*".
  -- * \n
  -- * The asterisk (*) is a wildcard for any number of characters. The question mark
  -- * (?) is a wildcard for a single character. Use of uppercase or lowercase does
  -- * not matter.
  -- * @return A cookie
  -- *
  -- * Gets a list of available font names which match the given \a pattern.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_list_fonts_with_info_unchecked
     (c : access xcb.xcb_connection_t;
      max_names : bits_stdint_uintn_h.uint16_t;
      pattern_len : bits_stdint_uintn_h.uint16_t;
      pattern : Interfaces.C.Strings.chars_ptr) return xcb_list_fonts_with_info_cookie_t  -- /usr/include/xcb/xproto.h:8960
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_fonts_with_info_unchecked";

   function xcb_list_fonts_with_info_properties (R : access constant xcb_list_fonts_with_info_reply_t) return access xcb_fontprop_t  -- /usr/include/xcb/xproto.h:8966
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_fonts_with_info_properties";

   function xcb_list_fonts_with_info_properties_length (R : access constant xcb_list_fonts_with_info_reply_t) return int  -- /usr/include/xcb/xproto.h:8969
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_fonts_with_info_properties_length";

   function xcb_list_fonts_with_info_properties_iterator (R : access constant xcb_list_fonts_with_info_reply_t) return xcb_fontprop_iterator_t  -- /usr/include/xcb/xproto.h:8972
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_fonts_with_info_properties_iterator";

   function xcb_list_fonts_with_info_name (R : access constant xcb_list_fonts_with_info_reply_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/xproto.h:8975
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_fonts_with_info_name";

   function xcb_list_fonts_with_info_name_length (R : access constant xcb_list_fonts_with_info_reply_t) return int  -- /usr/include/xcb/xproto.h:8978
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_fonts_with_info_name_length";

   function xcb_list_fonts_with_info_name_end (R : access constant xcb_list_fonts_with_info_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:8981
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_fonts_with_info_name_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_list_fonts_with_info_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_list_fonts_with_info_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_list_fonts_with_info_cookie_t;
      e : System.Address) return access xcb_list_fonts_with_info_reply_t  -- /usr/include/xcb/xproto.h:8998
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_fonts_with_info_reply";

  --*<  
   function xcb_set_font_path_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:9003
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_font_path_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_set_font_path_checked
     (c : access xcb.xcb_connection_t;
      font_qty : bits_stdint_uintn_h.uint16_t;
      font : access constant xcb_str_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9017
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_font_path_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_set_font_path
     (c : access xcb.xcb_connection_t;
      font_qty : bits_stdint_uintn_h.uint16_t;
      font : access constant xcb_str_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9030
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_font_path";

   function xcb_set_font_path_font_length (R : access constant xcb_set_font_path_request_t) return int  -- /usr/include/xcb/xproto.h:9035
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_font_path_font_length";

   function xcb_set_font_path_font_iterator (R : access constant xcb_set_font_path_request_t) return xcb_str_iterator_t  -- /usr/include/xcb/xproto.h:9038
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_font_path_font_iterator";

   function xcb_get_font_path_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:9041
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_font_path_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_get_font_path (c : access xcb.xcb_connection_t) return xcb_get_font_path_cookie_t  -- /usr/include/xcb/xproto.h:9052
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_font_path";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_get_font_path_unchecked (c : access xcb.xcb_connection_t) return xcb_get_font_path_cookie_t  -- /usr/include/xcb/xproto.h:9066
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_font_path_unchecked";

   function xcb_get_font_path_path_length (R : access constant xcb_get_font_path_reply_t) return int  -- /usr/include/xcb/xproto.h:9069
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_font_path_path_length";

   function xcb_get_font_path_path_iterator (R : access constant xcb_get_font_path_reply_t) return xcb_str_iterator_t  -- /usr/include/xcb/xproto.h:9072
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_font_path_path_iterator";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_get_font_path_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_get_font_path_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_get_font_path_cookie_t;
      e : System.Address) return access xcb_get_font_path_reply_t  -- /usr/include/xcb/xproto.h:9089
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_font_path_reply";

  --*<  
  --*
  -- * @brief Creates a pixmap
  -- *
  -- * @param c The connection
  -- * @param depth TODO
  -- * @param pid The ID with which you will refer to the new pixmap, created by
  -- * `xcb_generate_id`.
  -- * @param drawable Drawable to get the screen from.
  -- * @param width The width of the new pixmap.
  -- * @param height The height of the new pixmap.
  -- * @return A cookie
  -- *
  -- * Creates a pixmap. The pixmap can only be used on the same screen as \a drawable
  -- * is on and only with drawables of the same \a depth.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_create_pixmap_checked
     (c : access xcb.xcb_connection_t;
      depth : bits_stdint_uintn_h.uint8_t;
      pid : xcb_pixmap_t;
      drawable : xcb_drawable_t;
      width : bits_stdint_uintn_h.uint16_t;
      height : bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9113
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_create_pixmap_checked";

  --*
  -- * @brief Creates a pixmap
  -- *
  -- * @param c The connection
  -- * @param depth TODO
  -- * @param pid The ID with which you will refer to the new pixmap, created by
  -- * `xcb_generate_id`.
  -- * @param drawable Drawable to get the screen from.
  -- * @param width The width of the new pixmap.
  -- * @param height The height of the new pixmap.
  -- * @return A cookie
  -- *
  -- * Creates a pixmap. The pixmap can only be used on the same screen as \a drawable
  -- * is on and only with drawables of the same \a depth.
  -- *
  --  

   function xcb_create_pixmap
     (c : access xcb.xcb_connection_t;
      depth : bits_stdint_uintn_h.uint8_t;
      pid : xcb_pixmap_t;
      drawable : xcb_drawable_t;
      width : bits_stdint_uintn_h.uint16_t;
      height : bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9137
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_create_pixmap";

  --*
  -- * @brief Destroys a pixmap
  -- *
  -- * @param c The connection
  -- * @param pixmap The pixmap to destroy.
  -- * @return A cookie
  -- *
  -- * Deletes the association between the pixmap ID and the pixmap. The pixmap
  -- * storage will be freed when there are no more references to it.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_free_pixmap_checked (c : access xcb.xcb_connection_t; pixmap : xcb_pixmap_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9159
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_free_pixmap_checked";

  --*
  -- * @brief Destroys a pixmap
  -- *
  -- * @param c The connection
  -- * @param pixmap The pixmap to destroy.
  -- * @return A cookie
  -- *
  -- * Deletes the association between the pixmap ID and the pixmap. The pixmap
  -- * storage will be freed when there are no more references to it.
  -- *
  --  

   function xcb_free_pixmap (c : access xcb.xcb_connection_t; pixmap : xcb_pixmap_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9174
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_free_pixmap";

   function xcb_create_gc_value_list_serialize
     (u_buffer : System.Address;
      value_mask : bits_stdint_uintn_h.uint32_t;
      u_aux : access constant xcb_create_gc_value_list_t) return int  -- /usr/include/xcb/xproto.h:9178
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_create_gc_value_list_serialize";

   function xcb_create_gc_value_list_unpack
     (u_buffer : System.Address;
      value_mask : bits_stdint_uintn_h.uint32_t;
      u_aux : access xcb_create_gc_value_list_t) return int  -- /usr/include/xcb/xproto.h:9183
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_create_gc_value_list_unpack";

   function xcb_create_gc_value_list_sizeof (u_buffer : System.Address; value_mask : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/xproto.h:9188
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_create_gc_value_list_sizeof";

   function xcb_create_gc_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:9192
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_create_gc_sizeof";

  --*
  -- * @brief Creates a graphics context
  -- *
  -- * @param c The connection
  -- * @param cid The ID with which you will refer to the graphics context, created by
  -- * `xcb_generate_id`.
  -- * @param drawable Drawable to get the root/depth from.
  -- * @return A cookie
  -- *
  -- * Creates a graphics context. The graphics context can be used with any drawable
  -- * that has the same root and depth as the specified drawable.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_create_gc_checked
     (c : access xcb.xcb_connection_t;
      cid : xcb_gcontext_t;
      drawable : xcb_drawable_t;
      value_mask : bits_stdint_uintn_h.uint32_t;
      value_list : System.Address) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9211
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_create_gc_checked";

  --*
  -- * @brief Creates a graphics context
  -- *
  -- * @param c The connection
  -- * @param cid The ID with which you will refer to the graphics context, created by
  -- * `xcb_generate_id`.
  -- * @param drawable Drawable to get the root/depth from.
  -- * @return A cookie
  -- *
  -- * Creates a graphics context. The graphics context can be used with any drawable
  -- * that has the same root and depth as the specified drawable.
  -- *
  --  

   function xcb_create_gc
     (c : access xcb.xcb_connection_t;
      cid : xcb_gcontext_t;
      drawable : xcb_drawable_t;
      value_mask : bits_stdint_uintn_h.uint32_t;
      value_list : System.Address) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9231
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_create_gc";

  --*
  -- * @brief Creates a graphics context
  -- *
  -- * @param c The connection
  -- * @param cid The ID with which you will refer to the graphics context, created by
  -- * `xcb_generate_id`.
  -- * @param drawable Drawable to get the root/depth from.
  -- * @return A cookie
  -- *
  -- * Creates a graphics context. The graphics context can be used with any drawable
  -- * that has the same root and depth as the specified drawable.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_create_gc_aux_checked
     (c : access xcb.xcb_connection_t;
      cid : xcb_gcontext_t;
      drawable : xcb_drawable_t;
      value_mask : bits_stdint_uintn_h.uint32_t;
      value_list : access constant xcb_create_gc_value_list_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9254
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_create_gc_aux_checked";

  --*
  -- * @brief Creates a graphics context
  -- *
  -- * @param c The connection
  -- * @param cid The ID with which you will refer to the graphics context, created by
  -- * `xcb_generate_id`.
  -- * @param drawable Drawable to get the root/depth from.
  -- * @return A cookie
  -- *
  -- * Creates a graphics context. The graphics context can be used with any drawable
  -- * that has the same root and depth as the specified drawable.
  -- *
  --  

   function xcb_create_gc_aux
     (c : access xcb.xcb_connection_t;
      cid : xcb_gcontext_t;
      drawable : xcb_drawable_t;
      value_mask : bits_stdint_uintn_h.uint32_t;
      value_list : access constant xcb_create_gc_value_list_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9274
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_create_gc_aux";

   function xcb_create_gc_value_list (R : access constant xcb_create_gc_request_t) return System.Address  -- /usr/include/xcb/xproto.h:9281
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_create_gc_value_list";

   function xcb_change_gc_value_list_serialize
     (u_buffer : System.Address;
      value_mask : bits_stdint_uintn_h.uint32_t;
      u_aux : access constant xcb_change_gc_value_list_t) return int  -- /usr/include/xcb/xproto.h:9284
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_gc_value_list_serialize";

   function xcb_change_gc_value_list_unpack
     (u_buffer : System.Address;
      value_mask : bits_stdint_uintn_h.uint32_t;
      u_aux : access xcb_change_gc_value_list_t) return int  -- /usr/include/xcb/xproto.h:9289
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_gc_value_list_unpack";

   function xcb_change_gc_value_list_sizeof (u_buffer : System.Address; value_mask : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/xproto.h:9294
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_gc_value_list_sizeof";

   function xcb_change_gc_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:9298
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_gc_sizeof";

  --*
  -- * @brief change graphics context components
  -- *
  -- * @param c The connection
  -- * @param gc The graphics context to change.
  -- * @param value_mask A bitmask of #xcb_gc_t values.
  -- * @param value_mask \n
  -- * @param value_list Values for each of the components specified in the bitmask \a value_mask. The
  -- * order has to correspond to the order of possible \a value_mask bits. See the
  -- * example.
  -- * @return A cookie
  -- *
  -- * Changes the components specified by \a value_mask for the specified graphics context.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_change_gc_checked
     (c : access xcb.xcb_connection_t;
      gc : xcb_gcontext_t;
      value_mask : bits_stdint_uintn_h.uint32_t;
      value_list : System.Address) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9319
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_gc_checked";

  --*
  -- * @brief change graphics context components
  -- *
  -- * @param c The connection
  -- * @param gc The graphics context to change.
  -- * @param value_mask A bitmask of #xcb_gc_t values.
  -- * @param value_mask \n
  -- * @param value_list Values for each of the components specified in the bitmask \a value_mask. The
  -- * order has to correspond to the order of possible \a value_mask bits. See the
  -- * example.
  -- * @return A cookie
  -- *
  -- * Changes the components specified by \a value_mask for the specified graphics context.
  -- *
  --  

   function xcb_change_gc
     (c : access xcb.xcb_connection_t;
      gc : xcb_gcontext_t;
      value_mask : bits_stdint_uintn_h.uint32_t;
      value_list : System.Address) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9340
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_gc";

  --*
  -- * @brief change graphics context components
  -- *
  -- * @param c The connection
  -- * @param gc The graphics context to change.
  -- * @param value_mask A bitmask of #xcb_gc_t values.
  -- * @param value_mask \n
  -- * @param value_list Values for each of the components specified in the bitmask \a value_mask. The
  -- * order has to correspond to the order of possible \a value_mask bits. See the
  -- * example.
  -- * @return A cookie
  -- *
  -- * Changes the components specified by \a value_mask for the specified graphics context.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_change_gc_aux_checked
     (c : access xcb.xcb_connection_t;
      gc : xcb_gcontext_t;
      value_mask : bits_stdint_uintn_h.uint32_t;
      value_list : access constant xcb_change_gc_value_list_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9364
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_gc_aux_checked";

  --*
  -- * @brief change graphics context components
  -- *
  -- * @param c The connection
  -- * @param gc The graphics context to change.
  -- * @param value_mask A bitmask of #xcb_gc_t values.
  -- * @param value_mask \n
  -- * @param value_list Values for each of the components specified in the bitmask \a value_mask. The
  -- * order has to correspond to the order of possible \a value_mask bits. See the
  -- * example.
  -- * @return A cookie
  -- *
  -- * Changes the components specified by \a value_mask for the specified graphics context.
  -- *
  --  

   function xcb_change_gc_aux
     (c : access xcb.xcb_connection_t;
      gc : xcb_gcontext_t;
      value_mask : bits_stdint_uintn_h.uint32_t;
      value_list : access constant xcb_change_gc_value_list_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9385
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_gc_aux";

   function xcb_change_gc_value_list (R : access constant xcb_change_gc_request_t) return System.Address  -- /usr/include/xcb/xproto.h:9391
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_gc_value_list";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_copy_gc_checked
     (c : access xcb.xcb_connection_t;
      src_gc : xcb_gcontext_t;
      dst_gc : xcb_gcontext_t;
      value_mask : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9405
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_copy_gc_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_copy_gc
     (c : access xcb.xcb_connection_t;
      src_gc : xcb_gcontext_t;
      dst_gc : xcb_gcontext_t;
      value_mask : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9419
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_copy_gc";

   function xcb_set_dashes_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:9425
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_dashes_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_set_dashes_checked
     (c : access xcb.xcb_connection_t;
      gc : xcb_gcontext_t;
      dash_offset : bits_stdint_uintn_h.uint16_t;
      dashes_len : bits_stdint_uintn_h.uint16_t;
      dashes : access bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9439
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_dashes_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_set_dashes
     (c : access xcb.xcb_connection_t;
      gc : xcb_gcontext_t;
      dash_offset : bits_stdint_uintn_h.uint16_t;
      dashes_len : bits_stdint_uintn_h.uint16_t;
      dashes : access bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9454
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_dashes";

   function xcb_set_dashes_dashes (R : access constant xcb_set_dashes_request_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xproto.h:9461
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_dashes_dashes";

   function xcb_set_dashes_dashes_length (R : access constant xcb_set_dashes_request_t) return int  -- /usr/include/xcb/xproto.h:9464
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_dashes_dashes_length";

   function xcb_set_dashes_dashes_end (R : access constant xcb_set_dashes_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:9467
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_dashes_dashes_end";

   function xcb_set_clip_rectangles_sizeof (u_buffer : System.Address; rectangles_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/xproto.h:9470
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_clip_rectangles_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_set_clip_rectangles_checked
     (c : access xcb.xcb_connection_t;
      ordering : bits_stdint_uintn_h.uint8_t;
      gc : xcb_gcontext_t;
      clip_x_origin : bits_stdint_intn_h.int16_t;
      clip_y_origin : bits_stdint_intn_h.int16_t;
      rectangles_len : bits_stdint_uintn_h.uint32_t;
      rectangles : access constant xcb_rectangle_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9485
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_clip_rectangles_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_set_clip_rectangles
     (c : access xcb.xcb_connection_t;
      ordering : bits_stdint_uintn_h.uint8_t;
      gc : xcb_gcontext_t;
      clip_x_origin : bits_stdint_intn_h.int16_t;
      clip_y_origin : bits_stdint_intn_h.int16_t;
      rectangles_len : bits_stdint_uintn_h.uint32_t;
      rectangles : access constant xcb_rectangle_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9502
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_clip_rectangles";

   function xcb_set_clip_rectangles_rectangles (R : access constant xcb_set_clip_rectangles_request_t) return access xcb_rectangle_t  -- /usr/include/xcb/xproto.h:9511
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_clip_rectangles_rectangles";

   function xcb_set_clip_rectangles_rectangles_length (R : access constant xcb_set_clip_rectangles_request_t) return int  -- /usr/include/xcb/xproto.h:9514
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_clip_rectangles_rectangles_length";

   function xcb_set_clip_rectangles_rectangles_iterator (R : access constant xcb_set_clip_rectangles_request_t) return xcb_rectangle_iterator_t  -- /usr/include/xcb/xproto.h:9517
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_clip_rectangles_rectangles_iterator";

  --*
  -- * @brief Destroys a graphics context
  -- *
  -- * @param c The connection
  -- * @param gc The graphics context to destroy.
  -- * @return A cookie
  -- *
  -- * Destroys the specified \a gc and all associated storage.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_free_gc_checked (c : access xcb.xcb_connection_t; gc : xcb_gcontext_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9533
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_free_gc_checked";

  --*
  -- * @brief Destroys a graphics context
  -- *
  -- * @param c The connection
  -- * @param gc The graphics context to destroy.
  -- * @return A cookie
  -- *
  -- * Destroys the specified \a gc and all associated storage.
  -- *
  --  

   function xcb_free_gc (c : access xcb.xcb_connection_t; gc : xcb_gcontext_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9547
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_free_gc";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_clear_area_checked
     (c : access xcb.xcb_connection_t;
      exposures : bits_stdint_uintn_h.uint8_t;
      window : xcb_window_t;
      x : bits_stdint_intn_h.int16_t;
      y : bits_stdint_intn_h.int16_t;
      width : bits_stdint_uintn_h.uint16_t;
      height : bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9562
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_clear_area_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_clear_area
     (c : access xcb.xcb_connection_t;
      exposures : bits_stdint_uintn_h.uint8_t;
      window : xcb_window_t;
      x : bits_stdint_intn_h.int16_t;
      y : bits_stdint_intn_h.int16_t;
      width : bits_stdint_uintn_h.uint16_t;
      height : bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9579
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_clear_area";

  --*
  -- * @brief copy areas
  -- *
  -- * @param c The connection
  -- * @param src_drawable The source drawable (Window or Pixmap).
  -- * @param dst_drawable The destination drawable (Window or Pixmap).
  -- * @param gc The graphics context to use.
  -- * @param src_x The source X coordinate.
  -- * @param src_y The source Y coordinate.
  -- * @param dst_x The destination X coordinate.
  -- * @param dst_y The destination Y coordinate.
  -- * @param width The width of the area to copy (in pixels).
  -- * @param height The height of the area to copy (in pixels).
  -- * @return A cookie
  -- *
  -- * Copies the specified rectangle from \a src_drawable to \a dst_drawable.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_copy_area_checked
     (c : access xcb.xcb_connection_t;
      src_drawable : xcb_drawable_t;
      dst_drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      src_x : bits_stdint_intn_h.int16_t;
      src_y : bits_stdint_intn_h.int16_t;
      dst_x : bits_stdint_intn_h.int16_t;
      dst_y : bits_stdint_intn_h.int16_t;
      width : bits_stdint_uintn_h.uint16_t;
      height : bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9609
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_copy_area_checked";

  --*
  -- * @brief copy areas
  -- *
  -- * @param c The connection
  -- * @param src_drawable The source drawable (Window or Pixmap).
  -- * @param dst_drawable The destination drawable (Window or Pixmap).
  -- * @param gc The graphics context to use.
  -- * @param src_x The source X coordinate.
  -- * @param src_y The source Y coordinate.
  -- * @param dst_x The destination X coordinate.
  -- * @param dst_y The destination Y coordinate.
  -- * @param width The width of the area to copy (in pixels).
  -- * @param height The height of the area to copy (in pixels).
  -- * @return A cookie
  -- *
  -- * Copies the specified rectangle from \a src_drawable to \a dst_drawable.
  -- *
  --  

   function xcb_copy_area
     (c : access xcb.xcb_connection_t;
      src_drawable : xcb_drawable_t;
      dst_drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      src_x : bits_stdint_intn_h.int16_t;
      src_y : bits_stdint_intn_h.int16_t;
      dst_x : bits_stdint_intn_h.int16_t;
      dst_y : bits_stdint_intn_h.int16_t;
      width : bits_stdint_uintn_h.uint16_t;
      height : bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9639
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_copy_area";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_copy_plane_checked
     (c : access xcb.xcb_connection_t;
      src_drawable : xcb_drawable_t;
      dst_drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      src_x : bits_stdint_intn_h.int16_t;
      src_y : bits_stdint_intn_h.int16_t;
      dst_x : bits_stdint_intn_h.int16_t;
      dst_y : bits_stdint_intn_h.int16_t;
      width : bits_stdint_uintn_h.uint16_t;
      height : bits_stdint_uintn_h.uint16_t;
      bit_plane : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9662
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_copy_plane_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_copy_plane
     (c : access xcb.xcb_connection_t;
      src_drawable : xcb_drawable_t;
      dst_drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      src_x : bits_stdint_intn_h.int16_t;
      src_y : bits_stdint_intn_h.int16_t;
      dst_x : bits_stdint_intn_h.int16_t;
      dst_y : bits_stdint_intn_h.int16_t;
      width : bits_stdint_uintn_h.uint16_t;
      height : bits_stdint_uintn_h.uint16_t;
      bit_plane : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9683
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_copy_plane";

   function xcb_poly_point_sizeof (u_buffer : System.Address; points_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/xproto.h:9696
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_point_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_poly_point_checked
     (c : access xcb.xcb_connection_t;
      coordinate_mode : bits_stdint_uintn_h.uint8_t;
      drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      points_len : bits_stdint_uintn_h.uint32_t;
      points : access constant xcb_point_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9711
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_point_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_poly_point
     (c : access xcb.xcb_connection_t;
      coordinate_mode : bits_stdint_uintn_h.uint8_t;
      drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      points_len : bits_stdint_uintn_h.uint32_t;
      points : access constant xcb_point_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9727
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_point";

   function xcb_poly_point_points (R : access constant xcb_poly_point_request_t) return access xcb_point_t  -- /usr/include/xcb/xproto.h:9735
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_point_points";

   function xcb_poly_point_points_length (R : access constant xcb_poly_point_request_t) return int  -- /usr/include/xcb/xproto.h:9738
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_point_points_length";

   function xcb_poly_point_points_iterator (R : access constant xcb_poly_point_request_t) return xcb_point_iterator_t  -- /usr/include/xcb/xproto.h:9741
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_point_points_iterator";

   function xcb_poly_line_sizeof (u_buffer : System.Address; points_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/xproto.h:9744
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_line_sizeof";

  --*
  -- * @brief draw lines
  -- *
  -- * @param c The connection
  -- * @param coordinate_mode A bitmask of #xcb_coord_mode_t values.
  -- * @param coordinate_mode \n
  -- * @param drawable The drawable to draw the line(s) on.
  -- * @param gc The graphics context to use.
  -- * @param points_len The number of `xcb_point_t` structures in \a points.
  -- * @param points An array of points.
  -- * @return A cookie
  -- *
  -- * Draws \a points_len-1 lines between each pair of points (point[i], point[i+1])
  -- * in the \a points array. The lines are drawn in the order listed in the array.
  -- * They join correctly at all intermediate points, and if the first and last
  -- * points coincide, the first and last lines also join correctly. For any given
  -- * line, a pixel is not drawn more than once. If thin (zero line-width) lines
  -- * intersect, the intersecting pixels are drawn multiple times. If wide lines
  -- * intersect, the intersecting pixels are drawn only once, as though the entire
  -- * request were a single, filled shape.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_poly_line_checked
     (c : access xcb.xcb_connection_t;
      coordinate_mode : bits_stdint_uintn_h.uint8_t;
      drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      points_len : bits_stdint_uintn_h.uint32_t;
      points : access constant xcb_point_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9773
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_line_checked";

  --*
  -- * @brief draw lines
  -- *
  -- * @param c The connection
  -- * @param coordinate_mode A bitmask of #xcb_coord_mode_t values.
  -- * @param coordinate_mode \n
  -- * @param drawable The drawable to draw the line(s) on.
  -- * @param gc The graphics context to use.
  -- * @param points_len The number of `xcb_point_t` structures in \a points.
  -- * @param points An array of points.
  -- * @return A cookie
  -- *
  -- * Draws \a points_len-1 lines between each pair of points (point[i], point[i+1])
  -- * in the \a points array. The lines are drawn in the order listed in the array.
  -- * They join correctly at all intermediate points, and if the first and last
  -- * points coincide, the first and last lines also join correctly. For any given
  -- * line, a pixel is not drawn more than once. If thin (zero line-width) lines
  -- * intersect, the intersecting pixels are drawn multiple times. If wide lines
  -- * intersect, the intersecting pixels are drawn only once, as though the entire
  -- * request were a single, filled shape.
  -- *
  --  

   function xcb_poly_line
     (c : access xcb.xcb_connection_t;
      coordinate_mode : bits_stdint_uintn_h.uint8_t;
      drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      points_len : bits_stdint_uintn_h.uint32_t;
      points : access constant xcb_point_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9803
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_line";

   function xcb_poly_line_points (R : access constant xcb_poly_line_request_t) return access xcb_point_t  -- /usr/include/xcb/xproto.h:9811
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_line_points";

   function xcb_poly_line_points_length (R : access constant xcb_poly_line_request_t) return int  -- /usr/include/xcb/xproto.h:9814
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_line_points_length";

   function xcb_poly_line_points_iterator (R : access constant xcb_poly_line_request_t) return xcb_point_iterator_t  -- /usr/include/xcb/xproto.h:9817
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_line_points_iterator";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_segment_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_segment_t)
  --  

   procedure xcb_segment_next (i : access xcb_segment_iterator_t)  -- /usr/include/xcb/xproto.h:9828
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_segment_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_segment_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_segment_end (i : xcb_segment_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:9840
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_segment_end";

   function xcb_poly_segment_sizeof (u_buffer : System.Address; segments_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/xproto.h:9843
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_segment_sizeof";

  --*
  -- * @brief draw lines
  -- *
  -- * @param c The connection
  -- * @param drawable A drawable (Window or Pixmap) to draw on.
  -- * @param gc The graphics context to use.
  -- * \n
  -- * TODO: document which attributes of a gc are used
  -- * @param segments_len The number of `xcb_segment_t` structures in \a segments.
  -- * @param segments An array of `xcb_segment_t` structures.
  -- * @return A cookie
  -- *
  -- * Draws multiple, unconnected lines. For each segment, a line is drawn between
  -- * (x1, y1) and (x2, y2). The lines are drawn in the order listed in the array of
  -- * `xcb_segment_t` structures and does not perform joining at coincident
  -- * endpoints. For any given line, a pixel is not drawn more than once. If lines
  -- * intersect, the intersecting pixels are drawn multiple times.
  -- * 
  -- * TODO: include the xcb_segment_t data structure
  -- * 
  -- * TODO: an example
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_poly_segment_checked
     (c : access xcb.xcb_connection_t;
      drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      segments_len : bits_stdint_uintn_h.uint32_t;
      segments : access constant xcb_segment_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9873
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_segment_checked";

  --*
  -- * @brief draw lines
  -- *
  -- * @param c The connection
  -- * @param drawable A drawable (Window or Pixmap) to draw on.
  -- * @param gc The graphics context to use.
  -- * \n
  -- * TODO: document which attributes of a gc are used
  -- * @param segments_len The number of `xcb_segment_t` structures in \a segments.
  -- * @param segments An array of `xcb_segment_t` structures.
  -- * @return A cookie
  -- *
  -- * Draws multiple, unconnected lines. For each segment, a line is drawn between
  -- * (x1, y1) and (x2, y2). The lines are drawn in the order listed in the array of
  -- * `xcb_segment_t` structures and does not perform joining at coincident
  -- * endpoints. For any given line, a pixel is not drawn more than once. If lines
  -- * intersect, the intersecting pixels are drawn multiple times.
  -- * 
  -- * TODO: include the xcb_segment_t data structure
  -- * 
  -- * TODO: an example
  -- *
  --  

   function xcb_poly_segment
     (c : access xcb.xcb_connection_t;
      drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      segments_len : bits_stdint_uintn_h.uint32_t;
      segments : access constant xcb_segment_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9903
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_segment";

   function xcb_poly_segment_segments (R : access constant xcb_poly_segment_request_t) return access xcb_segment_t  -- /usr/include/xcb/xproto.h:9910
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_segment_segments";

   function xcb_poly_segment_segments_length (R : access constant xcb_poly_segment_request_t) return int  -- /usr/include/xcb/xproto.h:9913
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_segment_segments_length";

   function xcb_poly_segment_segments_iterator (R : access constant xcb_poly_segment_request_t) return xcb_segment_iterator_t  -- /usr/include/xcb/xproto.h:9916
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_segment_segments_iterator";

   function xcb_poly_rectangle_sizeof (u_buffer : System.Address; rectangles_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/xproto.h:9919
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_rectangle_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_poly_rectangle_checked
     (c : access xcb.xcb_connection_t;
      drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      rectangles_len : bits_stdint_uintn_h.uint32_t;
      rectangles : access constant xcb_rectangle_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9934
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_rectangle_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_poly_rectangle
     (c : access xcb.xcb_connection_t;
      drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      rectangles_len : bits_stdint_uintn_h.uint32_t;
      rectangles : access constant xcb_rectangle_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9949
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_rectangle";

   function xcb_poly_rectangle_rectangles (R : access constant xcb_poly_rectangle_request_t) return access xcb_rectangle_t  -- /usr/include/xcb/xproto.h:9956
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_rectangle_rectangles";

   function xcb_poly_rectangle_rectangles_length (R : access constant xcb_poly_rectangle_request_t) return int  -- /usr/include/xcb/xproto.h:9959
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_rectangle_rectangles_length";

   function xcb_poly_rectangle_rectangles_iterator (R : access constant xcb_poly_rectangle_request_t) return xcb_rectangle_iterator_t  -- /usr/include/xcb/xproto.h:9962
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_rectangle_rectangles_iterator";

   function xcb_poly_arc_sizeof (u_buffer : System.Address; arcs_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/xproto.h:9965
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_arc_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_poly_arc_checked
     (c : access xcb.xcb_connection_t;
      drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      arcs_len : bits_stdint_uintn_h.uint32_t;
      arcs : access constant xcb_arc_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9980
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_arc_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_poly_arc
     (c : access xcb.xcb_connection_t;
      drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      arcs_len : bits_stdint_uintn_h.uint32_t;
      arcs : access constant xcb_arc_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:9995
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_arc";

   function xcb_poly_arc_arcs (R : access constant xcb_poly_arc_request_t) return access xcb_arc_t  -- /usr/include/xcb/xproto.h:10002
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_arc_arcs";

   function xcb_poly_arc_arcs_length (R : access constant xcb_poly_arc_request_t) return int  -- /usr/include/xcb/xproto.h:10005
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_arc_arcs_length";

   function xcb_poly_arc_arcs_iterator (R : access constant xcb_poly_arc_request_t) return xcb_arc_iterator_t  -- /usr/include/xcb/xproto.h:10008
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_arc_arcs_iterator";

   function xcb_fill_poly_sizeof (u_buffer : System.Address; points_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/xproto.h:10011
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_fill_poly_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_fill_poly_checked
     (c : access xcb.xcb_connection_t;
      drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      shape : bits_stdint_uintn_h.uint8_t;
      coordinate_mode : bits_stdint_uintn_h.uint8_t;
      points_len : bits_stdint_uintn_h.uint32_t;
      points : access constant xcb_point_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:10026
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_fill_poly_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_fill_poly
     (c : access xcb.xcb_connection_t;
      drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      shape : bits_stdint_uintn_h.uint8_t;
      coordinate_mode : bits_stdint_uintn_h.uint8_t;
      points_len : bits_stdint_uintn_h.uint32_t;
      points : access constant xcb_point_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:10043
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_fill_poly";

   function xcb_fill_poly_points (R : access constant xcb_fill_poly_request_t) return access xcb_point_t  -- /usr/include/xcb/xproto.h:10052
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_fill_poly_points";

   function xcb_fill_poly_points_length (R : access constant xcb_fill_poly_request_t) return int  -- /usr/include/xcb/xproto.h:10055
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_fill_poly_points_length";

   function xcb_fill_poly_points_iterator (R : access constant xcb_fill_poly_request_t) return xcb_point_iterator_t  -- /usr/include/xcb/xproto.h:10058
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_fill_poly_points_iterator";

   function xcb_poly_fill_rectangle_sizeof (u_buffer : System.Address; rectangles_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/xproto.h:10061
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_fill_rectangle_sizeof";

  --*
  -- * @brief Fills rectangles
  -- *
  -- * @param c The connection
  -- * @param drawable The drawable (Window or Pixmap) to draw on.
  -- * @param gc The graphics context to use.
  -- * \n
  -- * The following graphics context components are used: function, plane-mask,
  -- * fill-style, subwindow-mode, clip-x-origin, clip-y-origin, and clip-mask.
  -- * \n
  -- * The following graphics context mode-dependent components are used:
  -- * foreground, background, tile, stipple, tile-stipple-x-origin, and
  -- * tile-stipple-y-origin.
  -- * @param rectangles_len The number of `xcb_rectangle_t` structures in \a rectangles.
  -- * @param rectangles The rectangles to fill.
  -- * @return A cookie
  -- *
  -- * Fills the specified rectangle(s) in the order listed in the array. For any
  -- * given rectangle, each pixel is not drawn more than once. If rectangles
  -- * intersect, the intersecting pixels are drawn multiple times.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_poly_fill_rectangle_checked
     (c : access xcb.xcb_connection_t;
      drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      rectangles_len : bits_stdint_uintn_h.uint32_t;
      rectangles : access constant xcb_rectangle_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:10090
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_fill_rectangle_checked";

  --*
  -- * @brief Fills rectangles
  -- *
  -- * @param c The connection
  -- * @param drawable The drawable (Window or Pixmap) to draw on.
  -- * @param gc The graphics context to use.
  -- * \n
  -- * The following graphics context components are used: function, plane-mask,
  -- * fill-style, subwindow-mode, clip-x-origin, clip-y-origin, and clip-mask.
  -- * \n
  -- * The following graphics context mode-dependent components are used:
  -- * foreground, background, tile, stipple, tile-stipple-x-origin, and
  -- * tile-stipple-y-origin.
  -- * @param rectangles_len The number of `xcb_rectangle_t` structures in \a rectangles.
  -- * @param rectangles The rectangles to fill.
  -- * @return A cookie
  -- *
  -- * Fills the specified rectangle(s) in the order listed in the array. For any
  -- * given rectangle, each pixel is not drawn more than once. If rectangles
  -- * intersect, the intersecting pixels are drawn multiple times.
  -- *
  --  

   function xcb_poly_fill_rectangle
     (c : access xcb.xcb_connection_t;
      drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      rectangles_len : bits_stdint_uintn_h.uint32_t;
      rectangles : access constant xcb_rectangle_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:10119
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_fill_rectangle";

   function xcb_poly_fill_rectangle_rectangles (R : access constant xcb_poly_fill_rectangle_request_t) return access xcb_rectangle_t  -- /usr/include/xcb/xproto.h:10126
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_fill_rectangle_rectangles";

   function xcb_poly_fill_rectangle_rectangles_length (R : access constant xcb_poly_fill_rectangle_request_t) return int  -- /usr/include/xcb/xproto.h:10129
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_fill_rectangle_rectangles_length";

   function xcb_poly_fill_rectangle_rectangles_iterator (R : access constant xcb_poly_fill_rectangle_request_t) return xcb_rectangle_iterator_t  -- /usr/include/xcb/xproto.h:10132
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_fill_rectangle_rectangles_iterator";

   function xcb_poly_fill_arc_sizeof (u_buffer : System.Address; arcs_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/xproto.h:10135
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_fill_arc_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_poly_fill_arc_checked
     (c : access xcb.xcb_connection_t;
      drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      arcs_len : bits_stdint_uintn_h.uint32_t;
      arcs : access constant xcb_arc_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:10150
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_fill_arc_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_poly_fill_arc
     (c : access xcb.xcb_connection_t;
      drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      arcs_len : bits_stdint_uintn_h.uint32_t;
      arcs : access constant xcb_arc_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:10165
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_fill_arc";

   function xcb_poly_fill_arc_arcs (R : access constant xcb_poly_fill_arc_request_t) return access xcb_arc_t  -- /usr/include/xcb/xproto.h:10172
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_fill_arc_arcs";

   function xcb_poly_fill_arc_arcs_length (R : access constant xcb_poly_fill_arc_request_t) return int  -- /usr/include/xcb/xproto.h:10175
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_fill_arc_arcs_length";

   function xcb_poly_fill_arc_arcs_iterator (R : access constant xcb_poly_fill_arc_request_t) return xcb_arc_iterator_t  -- /usr/include/xcb/xproto.h:10178
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_fill_arc_arcs_iterator";

   function xcb_put_image_sizeof (u_buffer : System.Address; data_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/xproto.h:10181
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_put_image_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_put_image_checked
     (c : access xcb.xcb_connection_t;
      format : bits_stdint_uintn_h.uint8_t;
      drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      width : bits_stdint_uintn_h.uint16_t;
      height : bits_stdint_uintn_h.uint16_t;
      dst_x : bits_stdint_intn_h.int16_t;
      dst_y : bits_stdint_intn_h.int16_t;
      left_pad : bits_stdint_uintn_h.uint8_t;
      depth : bits_stdint_uintn_h.uint8_t;
      data_len : bits_stdint_uintn_h.uint32_t;
      data : access bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:10196
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_put_image_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_put_image
     (c : access xcb.xcb_connection_t;
      format : bits_stdint_uintn_h.uint8_t;
      drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      width : bits_stdint_uintn_h.uint16_t;
      height : bits_stdint_uintn_h.uint16_t;
      dst_x : bits_stdint_intn_h.int16_t;
      dst_y : bits_stdint_intn_h.int16_t;
      left_pad : bits_stdint_uintn_h.uint8_t;
      depth : bits_stdint_uintn_h.uint8_t;
      data_len : bits_stdint_uintn_h.uint32_t;
      data : access bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:10218
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_put_image";

   function xcb_put_image_data (R : access constant xcb_put_image_request_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xproto.h:10232
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_put_image_data";

   function xcb_put_image_data_length (R : access constant xcb_put_image_request_t) return int  -- /usr/include/xcb/xproto.h:10235
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_put_image_data_length";

   function xcb_put_image_data_end (R : access constant xcb_put_image_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:10238
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_put_image_data_end";

   function xcb_get_image_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:10241
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_image_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_get_image
     (c : access xcb.xcb_connection_t;
      format : bits_stdint_uintn_h.uint8_t;
      drawable : xcb_drawable_t;
      x : bits_stdint_intn_h.int16_t;
      y : bits_stdint_intn_h.int16_t;
      width : bits_stdint_uintn_h.uint16_t;
      height : bits_stdint_uintn_h.uint16_t;
      plane_mask : bits_stdint_uintn_h.uint32_t) return xcb_get_image_cookie_t  -- /usr/include/xcb/xproto.h:10252
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_image";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_get_image_unchecked
     (c : access xcb.xcb_connection_t;
      format : bits_stdint_uintn_h.uint8_t;
      drawable : xcb_drawable_t;
      x : bits_stdint_intn_h.int16_t;
      y : bits_stdint_intn_h.int16_t;
      width : bits_stdint_uintn_h.uint16_t;
      height : bits_stdint_uintn_h.uint16_t;
      plane_mask : bits_stdint_uintn_h.uint32_t) return xcb_get_image_cookie_t  -- /usr/include/xcb/xproto.h:10273
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_image_unchecked";

   function xcb_get_image_data (R : access constant xcb_get_image_reply_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xproto.h:10283
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_image_data";

   function xcb_get_image_data_length (R : access constant xcb_get_image_reply_t) return int  -- /usr/include/xcb/xproto.h:10286
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_image_data_length";

   function xcb_get_image_data_end (R : access constant xcb_get_image_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:10289
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_image_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_get_image_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_get_image_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_get_image_cookie_t;
      e : System.Address) return access xcb_get_image_reply_t  -- /usr/include/xcb/xproto.h:10306
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_image_reply";

  --*<  
   function xcb_poly_text_8_sizeof (u_buffer : System.Address; items_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/xproto.h:10311
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_text_8_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_poly_text_8_checked
     (c : access xcb.xcb_connection_t;
      drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      x : bits_stdint_intn_h.int16_t;
      y : bits_stdint_intn_h.int16_t;
      items_len : bits_stdint_uintn_h.uint32_t;
      items : access bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:10326
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_text_8_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_poly_text_8
     (c : access xcb.xcb_connection_t;
      drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      x : bits_stdint_intn_h.int16_t;
      y : bits_stdint_intn_h.int16_t;
      items_len : bits_stdint_uintn_h.uint32_t;
      items : access bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:10343
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_text_8";

   function xcb_poly_text_8_items (R : access constant xcb_poly_text_8_request_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xproto.h:10352
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_text_8_items";

   function xcb_poly_text_8_items_length (R : access constant xcb_poly_text_8_request_t) return int  -- /usr/include/xcb/xproto.h:10355
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_text_8_items_length";

   function xcb_poly_text_8_items_end (R : access constant xcb_poly_text_8_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:10358
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_text_8_items_end";

   function xcb_poly_text_16_sizeof (u_buffer : System.Address; items_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/xproto.h:10361
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_text_16_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_poly_text_16_checked
     (c : access xcb.xcb_connection_t;
      drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      x : bits_stdint_intn_h.int16_t;
      y : bits_stdint_intn_h.int16_t;
      items_len : bits_stdint_uintn_h.uint32_t;
      items : access bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:10376
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_text_16_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_poly_text_16
     (c : access xcb.xcb_connection_t;
      drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      x : bits_stdint_intn_h.int16_t;
      y : bits_stdint_intn_h.int16_t;
      items_len : bits_stdint_uintn_h.uint32_t;
      items : access bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:10393
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_text_16";

   function xcb_poly_text_16_items (R : access constant xcb_poly_text_16_request_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xproto.h:10402
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_text_16_items";

   function xcb_poly_text_16_items_length (R : access constant xcb_poly_text_16_request_t) return int  -- /usr/include/xcb/xproto.h:10405
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_text_16_items_length";

   function xcb_poly_text_16_items_end (R : access constant xcb_poly_text_16_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:10408
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poly_text_16_items_end";

   function xcb_image_text_8_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:10411
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_image_text_8_sizeof";

  --*
  -- * @brief Draws text
  -- *
  -- * @param c The connection
  -- * @param string_len The length of the \a string. Note that this parameter limited by 255 due to
  -- * using 8 bits!
  -- * @param drawable The drawable (Window or Pixmap) to draw text on.
  -- * @param gc The graphics context to use.
  -- * \n
  -- * The following graphics context components are used: plane-mask, foreground,
  -- * background, font, subwindow-mode, clip-x-origin, clip-y-origin, and clip-mask.
  -- * @param x The x coordinate of the first character, relative to the origin of \a drawable.
  -- * @param y The y coordinate of the first character, relative to the origin of \a drawable.
  -- * @param string The string to draw. Only the first 255 characters are relevant due to the data
  -- * type of \a string_len.
  -- * @return A cookie
  -- *
  -- * Fills the destination rectangle with the background pixel from \a gc, then
  -- * paints the text with the foreground pixel from \a gc. The upper-left corner of
  -- * the filled rectangle is at [x, y - font-ascent]. The width is overall-width,
  -- * the height is font-ascent + font-descent. The overall-width, font-ascent and
  -- * font-descent are as returned by `xcb_query_text_extents` (TODO).
  -- * 
  -- * Note that using X core fonts is deprecated (but still supported) in favor of
  -- * client-side rendering using Xft.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_image_text_8_checked
     (c : access xcb.xcb_connection_t;
      string_len : bits_stdint_uintn_h.uint8_t;
      drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      x : bits_stdint_intn_h.int16_t;
      y : bits_stdint_intn_h.int16_t;
      string : Interfaces.C.Strings.chars_ptr) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:10444
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_image_text_8_checked";

  --*
  -- * @brief Draws text
  -- *
  -- * @param c The connection
  -- * @param string_len The length of the \a string. Note that this parameter limited by 255 due to
  -- * using 8 bits!
  -- * @param drawable The drawable (Window or Pixmap) to draw text on.
  -- * @param gc The graphics context to use.
  -- * \n
  -- * The following graphics context components are used: plane-mask, foreground,
  -- * background, font, subwindow-mode, clip-x-origin, clip-y-origin, and clip-mask.
  -- * @param x The x coordinate of the first character, relative to the origin of \a drawable.
  -- * @param y The y coordinate of the first character, relative to the origin of \a drawable.
  -- * @param string The string to draw. Only the first 255 characters are relevant due to the data
  -- * type of \a string_len.
  -- * @return A cookie
  -- *
  -- * Fills the destination rectangle with the background pixel from \a gc, then
  -- * paints the text with the foreground pixel from \a gc. The upper-left corner of
  -- * the filled rectangle is at [x, y - font-ascent]. The width is overall-width,
  -- * the height is font-ascent + font-descent. The overall-width, font-ascent and
  -- * font-descent are as returned by `xcb_query_text_extents` (TODO).
  -- * 
  -- * Note that using X core fonts is deprecated (but still supported) in favor of
  -- * client-side rendering using Xft.
  -- *
  --  

   function xcb_image_text_8
     (c : access xcb.xcb_connection_t;
      string_len : bits_stdint_uintn_h.uint8_t;
      drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      x : bits_stdint_intn_h.int16_t;
      y : bits_stdint_intn_h.int16_t;
      string : Interfaces.C.Strings.chars_ptr) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:10480
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_image_text_8";

   function xcb_image_text_8_string (R : access constant xcb_image_text_8_request_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/xproto.h:10489
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_image_text_8_string";

   function xcb_image_text_8_string_length (R : access constant xcb_image_text_8_request_t) return int  -- /usr/include/xcb/xproto.h:10492
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_image_text_8_string_length";

   function xcb_image_text_8_string_end (R : access constant xcb_image_text_8_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:10495
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_image_text_8_string_end";

   function xcb_image_text_16_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:10498
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_image_text_16_sizeof";

  --*
  -- * @brief Draws text
  -- *
  -- * @param c The connection
  -- * @param string_len The length of the \a string in characters. Note that this parameter limited by
  -- * 255 due to using 8 bits!
  -- * @param drawable The drawable (Window or Pixmap) to draw text on.
  -- * @param gc The graphics context to use.
  -- * \n
  -- * The following graphics context components are used: plane-mask, foreground,
  -- * background, font, subwindow-mode, clip-x-origin, clip-y-origin, and clip-mask.
  -- * @param x The x coordinate of the first character, relative to the origin of \a drawable.
  -- * @param y The y coordinate of the first character, relative to the origin of \a drawable.
  -- * @param string The string to draw. Only the first 255 characters are relevant due to the data
  -- * type of \a string_len. Every character uses 2 bytes (hence the 16 in this
  -- * request's name).
  -- * @return A cookie
  -- *
  -- * Fills the destination rectangle with the background pixel from \a gc, then
  -- * paints the text with the foreground pixel from \a gc. The upper-left corner of
  -- * the filled rectangle is at [x, y - font-ascent]. The width is overall-width,
  -- * the height is font-ascent + font-descent. The overall-width, font-ascent and
  -- * font-descent are as returned by `xcb_query_text_extents` (TODO).
  -- * 
  -- * Note that using X core fonts is deprecated (but still supported) in favor of
  -- * client-side rendering using Xft.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_image_text_16_checked
     (c : access xcb.xcb_connection_t;
      string_len : bits_stdint_uintn_h.uint8_t;
      drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      x : bits_stdint_intn_h.int16_t;
      y : bits_stdint_intn_h.int16_t;
      string : access constant xcb_char2b_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:10532
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_image_text_16_checked";

  --*
  -- * @brief Draws text
  -- *
  -- * @param c The connection
  -- * @param string_len The length of the \a string in characters. Note that this parameter limited by
  -- * 255 due to using 8 bits!
  -- * @param drawable The drawable (Window or Pixmap) to draw text on.
  -- * @param gc The graphics context to use.
  -- * \n
  -- * The following graphics context components are used: plane-mask, foreground,
  -- * background, font, subwindow-mode, clip-x-origin, clip-y-origin, and clip-mask.
  -- * @param x The x coordinate of the first character, relative to the origin of \a drawable.
  -- * @param y The y coordinate of the first character, relative to the origin of \a drawable.
  -- * @param string The string to draw. Only the first 255 characters are relevant due to the data
  -- * type of \a string_len. Every character uses 2 bytes (hence the 16 in this
  -- * request's name).
  -- * @return A cookie
  -- *
  -- * Fills the destination rectangle with the background pixel from \a gc, then
  -- * paints the text with the foreground pixel from \a gc. The upper-left corner of
  -- * the filled rectangle is at [x, y - font-ascent]. The width is overall-width,
  -- * the height is font-ascent + font-descent. The overall-width, font-ascent and
  -- * font-descent are as returned by `xcb_query_text_extents` (TODO).
  -- * 
  -- * Note that using X core fonts is deprecated (but still supported) in favor of
  -- * client-side rendering using Xft.
  -- *
  --  

   function xcb_image_text_16
     (c : access xcb.xcb_connection_t;
      string_len : bits_stdint_uintn_h.uint8_t;
      drawable : xcb_drawable_t;
      gc : xcb_gcontext_t;
      x : bits_stdint_intn_h.int16_t;
      y : bits_stdint_intn_h.int16_t;
      string : access constant xcb_char2b_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:10569
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_image_text_16";

   function xcb_image_text_16_string (R : access constant xcb_image_text_16_request_t) return access xcb_char2b_t  -- /usr/include/xcb/xproto.h:10578
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_image_text_16_string";

   function xcb_image_text_16_string_length (R : access constant xcb_image_text_16_request_t) return int  -- /usr/include/xcb/xproto.h:10581
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_image_text_16_string_length";

   function xcb_image_text_16_string_iterator (R : access constant xcb_image_text_16_request_t) return xcb_char2b_iterator_t  -- /usr/include/xcb/xproto.h:10584
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_image_text_16_string_iterator";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_create_colormap_checked
     (c : access xcb.xcb_connection_t;
      alloc : bits_stdint_uintn_h.uint8_t;
      mid : xcb_colormap_t;
      window : xcb_window_t;
      visual : xcb_visualid_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:10598
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_create_colormap_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_create_colormap
     (c : access xcb.xcb_connection_t;
      alloc : bits_stdint_uintn_h.uint8_t;
      mid : xcb_colormap_t;
      window : xcb_window_t;
      visual : xcb_visualid_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:10613
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_create_colormap";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_free_colormap_checked (c : access xcb.xcb_connection_t; cmap : xcb_colormap_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:10631
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_free_colormap_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_free_colormap (c : access xcb.xcb_connection_t; cmap : xcb_colormap_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:10643
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_free_colormap";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_copy_colormap_and_free_checked
     (c : access xcb.xcb_connection_t;
      mid : xcb_colormap_t;
      src_cmap : xcb_colormap_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:10658
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_copy_colormap_and_free_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_copy_colormap_and_free
     (c : access xcb.xcb_connection_t;
      mid : xcb_colormap_t;
      src_cmap : xcb_colormap_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:10671
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_copy_colormap_and_free";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_install_colormap_checked (c : access xcb.xcb_connection_t; cmap : xcb_colormap_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:10687
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_install_colormap_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_install_colormap (c : access xcb.xcb_connection_t; cmap : xcb_colormap_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:10699
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_install_colormap";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_uninstall_colormap_checked (c : access xcb.xcb_connection_t; cmap : xcb_colormap_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:10714
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_uninstall_colormap_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_uninstall_colormap (c : access xcb.xcb_connection_t; cmap : xcb_colormap_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:10726
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_uninstall_colormap";

   function xcb_list_installed_colormaps_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:10730
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_installed_colormaps_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_list_installed_colormaps (c : access xcb.xcb_connection_t; window : xcb_window_t) return xcb_list_installed_colormaps_cookie_t  -- /usr/include/xcb/xproto.h:10741
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_installed_colormaps";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_list_installed_colormaps_unchecked (c : access xcb.xcb_connection_t; window : xcb_window_t) return xcb_list_installed_colormaps_cookie_t  -- /usr/include/xcb/xproto.h:10756
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_installed_colormaps_unchecked";

   function xcb_list_installed_colormaps_cmaps (R : access constant xcb_list_installed_colormaps_reply_t) return access xcb_colormap_t  -- /usr/include/xcb/xproto.h:10760
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_installed_colormaps_cmaps";

   function xcb_list_installed_colormaps_cmaps_length (R : access constant xcb_list_installed_colormaps_reply_t) return int  -- /usr/include/xcb/xproto.h:10763
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_installed_colormaps_cmaps_length";

   function xcb_list_installed_colormaps_cmaps_end (R : access constant xcb_list_installed_colormaps_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:10766
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_installed_colormaps_cmaps_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_list_installed_colormaps_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_list_installed_colormaps_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_list_installed_colormaps_cookie_t;
      e : System.Address) return access xcb_list_installed_colormaps_reply_t  -- /usr/include/xcb/xproto.h:10783
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_installed_colormaps_reply";

  --*<  
  --*
  -- * @brief Allocate a color
  -- *
  -- * @param c The connection
  -- * @param cmap TODO
  -- * @param red The red value of your color.
  -- * @param green The green value of your color.
  -- * @param blue The blue value of your color.
  -- * @return A cookie
  -- *
  -- * Allocates a read-only colormap entry corresponding to the closest RGB value
  -- * supported by the hardware. If you are using TrueColor, you can take a shortcut
  -- * and directly calculate the color pixel value to avoid the round trip. But, for
  -- * example, on 16-bit color setups (VNC), you can easily get the closest supported
  -- * RGB value to the RGB value you are specifying.
  -- *
  --  

   function xcb_alloc_color
     (c : access xcb.xcb_connection_t;
      cmap : xcb_colormap_t;
      red : bits_stdint_uintn_h.uint16_t;
      green : bits_stdint_uintn_h.uint16_t;
      blue : bits_stdint_uintn_h.uint16_t) return xcb_alloc_color_cookie_t  -- /usr/include/xcb/xproto.h:10805
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_alloc_color";

  --*
  -- * @brief Allocate a color
  -- *
  -- * @param c The connection
  -- * @param cmap TODO
  -- * @param red The red value of your color.
  -- * @param green The green value of your color.
  -- * @param blue The blue value of your color.
  -- * @return A cookie
  -- *
  -- * Allocates a read-only colormap entry corresponding to the closest RGB value
  -- * supported by the hardware. If you are using TrueColor, you can take a shortcut
  -- * and directly calculate the color pixel value to avoid the round trip. But, for
  -- * example, on 16-bit color setups (VNC), you can easily get the closest supported
  -- * RGB value to the RGB value you are specifying.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_alloc_color_unchecked
     (c : access xcb.xcb_connection_t;
      cmap : xcb_colormap_t;
      red : bits_stdint_uintn_h.uint16_t;
      green : bits_stdint_uintn_h.uint16_t;
      blue : bits_stdint_uintn_h.uint16_t) return xcb_alloc_color_cookie_t  -- /usr/include/xcb/xproto.h:10832
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_alloc_color_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_alloc_color_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_alloc_color_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_alloc_color_cookie_t;
      e : System.Address) return access xcb_alloc_color_reply_t  -- /usr/include/xcb/xproto.h:10853
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_alloc_color_reply";

  --*<  
   function xcb_alloc_named_color_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:10858
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_alloc_named_color_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_alloc_named_color
     (c : access xcb.xcb_connection_t;
      cmap : xcb_colormap_t;
      name_len : bits_stdint_uintn_h.uint16_t;
      name : Interfaces.C.Strings.chars_ptr) return xcb_alloc_named_color_cookie_t  -- /usr/include/xcb/xproto.h:10869
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_alloc_named_color";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_alloc_named_color_unchecked
     (c : access xcb.xcb_connection_t;
      cmap : xcb_colormap_t;
      name_len : bits_stdint_uintn_h.uint16_t;
      name : Interfaces.C.Strings.chars_ptr) return xcb_alloc_named_color_cookie_t  -- /usr/include/xcb/xproto.h:10886
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_alloc_named_color_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_alloc_named_color_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_alloc_named_color_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_alloc_named_color_cookie_t;
      e : System.Address) return access xcb_alloc_named_color_reply_t  -- /usr/include/xcb/xproto.h:10906
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_alloc_named_color_reply";

  --*<  
   function xcb_alloc_color_cells_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:10911
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_alloc_color_cells_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_alloc_color_cells
     (c : access xcb.xcb_connection_t;
      contiguous : bits_stdint_uintn_h.uint8_t;
      cmap : xcb_colormap_t;
      colors : bits_stdint_uintn_h.uint16_t;
      planes : bits_stdint_uintn_h.uint16_t) return xcb_alloc_color_cells_cookie_t  -- /usr/include/xcb/xproto.h:10922
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_alloc_color_cells";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_alloc_color_cells_unchecked
     (c : access xcb.xcb_connection_t;
      contiguous : bits_stdint_uintn_h.uint8_t;
      cmap : xcb_colormap_t;
      colors : bits_stdint_uintn_h.uint16_t;
      planes : bits_stdint_uintn_h.uint16_t) return xcb_alloc_color_cells_cookie_t  -- /usr/include/xcb/xproto.h:10940
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_alloc_color_cells_unchecked";

   function xcb_alloc_color_cells_pixels (R : access constant xcb_alloc_color_cells_reply_t) return access bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/xproto.h:10947
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_alloc_color_cells_pixels";

   function xcb_alloc_color_cells_pixels_length (R : access constant xcb_alloc_color_cells_reply_t) return int  -- /usr/include/xcb/xproto.h:10950
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_alloc_color_cells_pixels_length";

   function xcb_alloc_color_cells_pixels_end (R : access constant xcb_alloc_color_cells_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:10953
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_alloc_color_cells_pixels_end";

   function xcb_alloc_color_cells_masks (R : access constant xcb_alloc_color_cells_reply_t) return access bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/xproto.h:10956
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_alloc_color_cells_masks";

   function xcb_alloc_color_cells_masks_length (R : access constant xcb_alloc_color_cells_reply_t) return int  -- /usr/include/xcb/xproto.h:10959
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_alloc_color_cells_masks_length";

   function xcb_alloc_color_cells_masks_end (R : access constant xcb_alloc_color_cells_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:10962
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_alloc_color_cells_masks_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_alloc_color_cells_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_alloc_color_cells_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_alloc_color_cells_cookie_t;
      e : System.Address) return access xcb_alloc_color_cells_reply_t  -- /usr/include/xcb/xproto.h:10979
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_alloc_color_cells_reply";

  --*<  
   function xcb_alloc_color_planes_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:10984
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_alloc_color_planes_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_alloc_color_planes
     (c : access xcb.xcb_connection_t;
      contiguous : bits_stdint_uintn_h.uint8_t;
      cmap : xcb_colormap_t;
      colors : bits_stdint_uintn_h.uint16_t;
      reds : bits_stdint_uintn_h.uint16_t;
      greens : bits_stdint_uintn_h.uint16_t;
      blues : bits_stdint_uintn_h.uint16_t) return xcb_alloc_color_planes_cookie_t  -- /usr/include/xcb/xproto.h:10995
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_alloc_color_planes";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_alloc_color_planes_unchecked
     (c : access xcb.xcb_connection_t;
      contiguous : bits_stdint_uintn_h.uint8_t;
      cmap : xcb_colormap_t;
      colors : bits_stdint_uintn_h.uint16_t;
      reds : bits_stdint_uintn_h.uint16_t;
      greens : bits_stdint_uintn_h.uint16_t;
      blues : bits_stdint_uintn_h.uint16_t) return xcb_alloc_color_planes_cookie_t  -- /usr/include/xcb/xproto.h:11015
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_alloc_color_planes_unchecked";

   function xcb_alloc_color_planes_pixels (R : access constant xcb_alloc_color_planes_reply_t) return access bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/xproto.h:11024
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_alloc_color_planes_pixels";

   function xcb_alloc_color_planes_pixels_length (R : access constant xcb_alloc_color_planes_reply_t) return int  -- /usr/include/xcb/xproto.h:11027
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_alloc_color_planes_pixels_length";

   function xcb_alloc_color_planes_pixels_end (R : access constant xcb_alloc_color_planes_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:11030
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_alloc_color_planes_pixels_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_alloc_color_planes_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_alloc_color_planes_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_alloc_color_planes_cookie_t;
      e : System.Address) return access xcb_alloc_color_planes_reply_t  -- /usr/include/xcb/xproto.h:11047
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_alloc_color_planes_reply";

  --*<  
   function xcb_free_colors_sizeof (u_buffer : System.Address; pixels_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/xproto.h:11052
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_free_colors_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_free_colors_checked
     (c : access xcb.xcb_connection_t;
      cmap : xcb_colormap_t;
      plane_mask : bits_stdint_uintn_h.uint32_t;
      pixels_len : bits_stdint_uintn_h.uint32_t;
      pixels : access bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:11067
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_free_colors_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_free_colors
     (c : access xcb.xcb_connection_t;
      cmap : xcb_colormap_t;
      plane_mask : bits_stdint_uintn_h.uint32_t;
      pixels_len : bits_stdint_uintn_h.uint32_t;
      pixels : access bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:11082
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_free_colors";

   function xcb_free_colors_pixels (R : access constant xcb_free_colors_request_t) return access bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/xproto.h:11089
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_free_colors_pixels";

   function xcb_free_colors_pixels_length (R : access constant xcb_free_colors_request_t) return int  -- /usr/include/xcb/xproto.h:11092
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_free_colors_pixels_length";

   function xcb_free_colors_pixels_end (R : access constant xcb_free_colors_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:11095
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_free_colors_pixels_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_coloritem_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_coloritem_t)
  --  

   procedure xcb_coloritem_next (i : access xcb_coloritem_iterator_t)  -- /usr/include/xcb/xproto.h:11106
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_coloritem_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_coloritem_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_coloritem_end (i : xcb_coloritem_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:11118
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_coloritem_end";

   function xcb_store_colors_sizeof (u_buffer : System.Address; items_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/xproto.h:11121
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_store_colors_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_store_colors_checked
     (c : access xcb.xcb_connection_t;
      cmap : xcb_colormap_t;
      items_len : bits_stdint_uintn_h.uint32_t;
      items : access constant xcb_coloritem_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:11136
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_store_colors_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_store_colors
     (c : access xcb.xcb_connection_t;
      cmap : xcb_colormap_t;
      items_len : bits_stdint_uintn_h.uint32_t;
      items : access constant xcb_coloritem_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:11150
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_store_colors";

   function xcb_store_colors_items (R : access constant xcb_store_colors_request_t) return access xcb_coloritem_t  -- /usr/include/xcb/xproto.h:11156
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_store_colors_items";

   function xcb_store_colors_items_length (R : access constant xcb_store_colors_request_t) return int  -- /usr/include/xcb/xproto.h:11159
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_store_colors_items_length";

   function xcb_store_colors_items_iterator (R : access constant xcb_store_colors_request_t) return xcb_coloritem_iterator_t  -- /usr/include/xcb/xproto.h:11162
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_store_colors_items_iterator";

   function xcb_store_named_color_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:11165
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_store_named_color_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_store_named_color_checked
     (c : access xcb.xcb_connection_t;
      flags : bits_stdint_uintn_h.uint8_t;
      cmap : xcb_colormap_t;
      pixel : bits_stdint_uintn_h.uint32_t;
      name_len : bits_stdint_uintn_h.uint16_t;
      name : Interfaces.C.Strings.chars_ptr) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:11179
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_store_named_color_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_store_named_color
     (c : access xcb.xcb_connection_t;
      flags : bits_stdint_uintn_h.uint8_t;
      cmap : xcb_colormap_t;
      pixel : bits_stdint_uintn_h.uint32_t;
      name_len : bits_stdint_uintn_h.uint16_t;
      name : Interfaces.C.Strings.chars_ptr) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:11195
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_store_named_color";

   function xcb_store_named_color_name (R : access constant xcb_store_named_color_request_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/xproto.h:11203
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_store_named_color_name";

   function xcb_store_named_color_name_length (R : access constant xcb_store_named_color_request_t) return int  -- /usr/include/xcb/xproto.h:11206
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_store_named_color_name_length";

   function xcb_store_named_color_name_end (R : access constant xcb_store_named_color_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:11209
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_store_named_color_name_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_rgb_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_rgb_t)
  --  

   procedure xcb_rgb_next (i : access xcb_rgb_iterator_t)  -- /usr/include/xcb/xproto.h:11220
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_rgb_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_rgb_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_rgb_end (i : xcb_rgb_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:11232
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_rgb_end";

   function xcb_query_colors_sizeof (u_buffer : System.Address; pixels_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/xproto.h:11235
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_colors_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_query_colors
     (c : access xcb.xcb_connection_t;
      cmap : xcb_colormap_t;
      pixels_len : bits_stdint_uintn_h.uint32_t;
      pixels : access bits_stdint_uintn_h.uint32_t) return xcb_query_colors_cookie_t  -- /usr/include/xcb/xproto.h:11247
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_colors";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_query_colors_unchecked
     (c : access xcb.xcb_connection_t;
      cmap : xcb_colormap_t;
      pixels_len : bits_stdint_uintn_h.uint32_t;
      pixels : access bits_stdint_uintn_h.uint32_t) return xcb_query_colors_cookie_t  -- /usr/include/xcb/xproto.h:11264
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_colors_unchecked";

   function xcb_query_colors_colors (R : access constant xcb_query_colors_reply_t) return access xcb_rgb_t  -- /usr/include/xcb/xproto.h:11270
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_colors_colors";

   function xcb_query_colors_colors_length (R : access constant xcb_query_colors_reply_t) return int  -- /usr/include/xcb/xproto.h:11273
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_colors_colors_length";

   function xcb_query_colors_colors_iterator (R : access constant xcb_query_colors_reply_t) return xcb_rgb_iterator_t  -- /usr/include/xcb/xproto.h:11276
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_colors_colors_iterator";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_query_colors_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_query_colors_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_query_colors_cookie_t;
      e : System.Address) return access xcb_query_colors_reply_t  -- /usr/include/xcb/xproto.h:11293
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_colors_reply";

  --*<  
   function xcb_lookup_color_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:11298
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_lookup_color_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_lookup_color
     (c : access xcb.xcb_connection_t;
      cmap : xcb_colormap_t;
      name_len : bits_stdint_uintn_h.uint16_t;
      name : Interfaces.C.Strings.chars_ptr) return xcb_lookup_color_cookie_t  -- /usr/include/xcb/xproto.h:11309
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_lookup_color";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_lookup_color_unchecked
     (c : access xcb.xcb_connection_t;
      cmap : xcb_colormap_t;
      name_len : bits_stdint_uintn_h.uint16_t;
      name : Interfaces.C.Strings.chars_ptr) return xcb_lookup_color_cookie_t  -- /usr/include/xcb/xproto.h:11326
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_lookup_color_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_lookup_color_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_lookup_color_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_lookup_color_cookie_t;
      e : System.Address) return access xcb_lookup_color_reply_t  -- /usr/include/xcb/xproto.h:11346
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_lookup_color_reply";

  --*<  
  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_create_cursor_checked
     (c : access xcb.xcb_connection_t;
      cid : xcb_cursor_t;
      source : xcb_pixmap_t;
      mask : xcb_pixmap_t;
      fore_red : bits_stdint_uintn_h.uint16_t;
      fore_green : bits_stdint_uintn_h.uint16_t;
      fore_blue : bits_stdint_uintn_h.uint16_t;
      back_red : bits_stdint_uintn_h.uint16_t;
      back_green : bits_stdint_uintn_h.uint16_t;
      back_blue : bits_stdint_uintn_h.uint16_t;
      x : bits_stdint_uintn_h.uint16_t;
      y : bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:11362
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_create_cursor_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_create_cursor
     (c : access xcb.xcb_connection_t;
      cid : xcb_cursor_t;
      source : xcb_pixmap_t;
      mask : xcb_pixmap_t;
      fore_red : bits_stdint_uintn_h.uint16_t;
      fore_green : bits_stdint_uintn_h.uint16_t;
      fore_blue : bits_stdint_uintn_h.uint16_t;
      back_red : bits_stdint_uintn_h.uint16_t;
      back_green : bits_stdint_uintn_h.uint16_t;
      back_blue : bits_stdint_uintn_h.uint16_t;
      x : bits_stdint_uintn_h.uint16_t;
      y : bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:11384
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_create_cursor";

  --*
  -- * @brief create cursor
  -- *
  -- * @param c The connection
  -- * @param cid The ID with which you will refer to the cursor, created by `xcb_generate_id`.
  -- * @param source_font In which font to look for the cursor glyph.
  -- * @param mask_font In which font to look for the mask glyph.
  -- * @param source_char The glyph of \a source_font to use.
  -- * @param mask_char The glyph of \a mask_font to use as a mask: Pixels which are set to 1 define
  -- * which source pixels are displayed. All pixels which are set to 0 are not
  -- * displayed.
  -- * @param fore_red The red value of the foreground color.
  -- * @param fore_green The green value of the foreground color.
  -- * @param fore_blue The blue value of the foreground color.
  -- * @param back_red The red value of the background color.
  -- * @param back_green The green value of the background color.
  -- * @param back_blue The blue value of the background color.
  -- * @return A cookie
  -- *
  -- * Creates a cursor from a font glyph. X provides a set of standard cursor shapes
  -- * in a special font named cursor. Applications are encouraged to use this
  -- * interface for their cursors because the font can be customized for the
  -- * individual display type.
  -- * 
  -- * All pixels which are set to 1 in the source will use the foreground color (as
  -- * specified by \a fore_red, \a fore_green and \a fore_blue). All pixels set to 0
  -- * will use the background color (as specified by \a back_red, \a back_green and
  -- * \a back_blue).
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_create_glyph_cursor_checked
     (c : access xcb.xcb_connection_t;
      cid : xcb_cursor_t;
      source_font : xcb_font_t;
      mask_font : xcb_font_t;
      source_char : bits_stdint_uintn_h.uint16_t;
      mask_char : bits_stdint_uintn_h.uint16_t;
      fore_red : bits_stdint_uintn_h.uint16_t;
      fore_green : bits_stdint_uintn_h.uint16_t;
      fore_blue : bits_stdint_uintn_h.uint16_t;
      back_red : bits_stdint_uintn_h.uint16_t;
      back_green : bits_stdint_uintn_h.uint16_t;
      back_blue : bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:11431
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_create_glyph_cursor_checked";

  --*
  -- * @brief create cursor
  -- *
  -- * @param c The connection
  -- * @param cid The ID with which you will refer to the cursor, created by `xcb_generate_id`.
  -- * @param source_font In which font to look for the cursor glyph.
  -- * @param mask_font In which font to look for the mask glyph.
  -- * @param source_char The glyph of \a source_font to use.
  -- * @param mask_char The glyph of \a mask_font to use as a mask: Pixels which are set to 1 define
  -- * which source pixels are displayed. All pixels which are set to 0 are not
  -- * displayed.
  -- * @param fore_red The red value of the foreground color.
  -- * @param fore_green The green value of the foreground color.
  -- * @param fore_blue The blue value of the foreground color.
  -- * @param back_red The red value of the background color.
  -- * @param back_green The green value of the background color.
  -- * @param back_blue The blue value of the background color.
  -- * @return A cookie
  -- *
  -- * Creates a cursor from a font glyph. X provides a set of standard cursor shapes
  -- * in a special font named cursor. Applications are encouraged to use this
  -- * interface for their cursors because the font can be customized for the
  -- * individual display type.
  -- * 
  -- * All pixels which are set to 1 in the source will use the foreground color (as
  -- * specified by \a fore_red, \a fore_green and \a fore_blue). All pixels set to 0
  -- * will use the background color (as specified by \a back_red, \a back_green and
  -- * \a back_blue).
  -- *
  --  

   function xcb_create_glyph_cursor
     (c : access xcb.xcb_connection_t;
      cid : xcb_cursor_t;
      source_font : xcb_font_t;
      mask_font : xcb_font_t;
      source_char : bits_stdint_uintn_h.uint16_t;
      mask_char : bits_stdint_uintn_h.uint16_t;
      fore_red : bits_stdint_uintn_h.uint16_t;
      fore_green : bits_stdint_uintn_h.uint16_t;
      fore_blue : bits_stdint_uintn_h.uint16_t;
      back_red : bits_stdint_uintn_h.uint16_t;
      back_green : bits_stdint_uintn_h.uint16_t;
      back_blue : bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:11475
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_create_glyph_cursor";

  --*
  -- * @brief Deletes a cursor
  -- *
  -- * @param c The connection
  -- * @param cursor The cursor to destroy.
  -- * @return A cookie
  -- *
  -- * Deletes the association between the cursor resource ID and the specified
  -- * cursor. The cursor is freed when no other resource references it.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_free_cursor_checked (c : access xcb.xcb_connection_t; cursor : xcb_cursor_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:11503
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_free_cursor_checked";

  --*
  -- * @brief Deletes a cursor
  -- *
  -- * @param c The connection
  -- * @param cursor The cursor to destroy.
  -- * @return A cookie
  -- *
  -- * Deletes the association between the cursor resource ID and the specified
  -- * cursor. The cursor is freed when no other resource references it.
  -- *
  --  

   function xcb_free_cursor (c : access xcb.xcb_connection_t; cursor : xcb_cursor_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:11518
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_free_cursor";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_recolor_cursor_checked
     (c : access xcb.xcb_connection_t;
      cursor : xcb_cursor_t;
      fore_red : bits_stdint_uintn_h.uint16_t;
      fore_green : bits_stdint_uintn_h.uint16_t;
      fore_blue : bits_stdint_uintn_h.uint16_t;
      back_red : bits_stdint_uintn_h.uint16_t;
      back_green : bits_stdint_uintn_h.uint16_t;
      back_blue : bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:11533
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_recolor_cursor_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_recolor_cursor
     (c : access xcb.xcb_connection_t;
      cursor : xcb_cursor_t;
      fore_red : bits_stdint_uintn_h.uint16_t;
      fore_green : bits_stdint_uintn_h.uint16_t;
      fore_blue : bits_stdint_uintn_h.uint16_t;
      back_red : bits_stdint_uintn_h.uint16_t;
      back_green : bits_stdint_uintn_h.uint16_t;
      back_blue : bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:11551
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_recolor_cursor";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_query_best_size
     (c : access xcb.xcb_connection_t;
      u_class : bits_stdint_uintn_h.uint8_t;
      drawable : xcb_drawable_t;
      width : bits_stdint_uintn_h.uint16_t;
      height : bits_stdint_uintn_h.uint16_t) return xcb_query_best_size_cookie_t  -- /usr/include/xcb/xproto.h:11569
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_best_size";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_query_best_size_unchecked
     (c : access xcb.xcb_connection_t;
      u_class : bits_stdint_uintn_h.uint8_t;
      drawable : xcb_drawable_t;
      width : bits_stdint_uintn_h.uint16_t;
      height : bits_stdint_uintn_h.uint16_t) return xcb_query_best_size_cookie_t  -- /usr/include/xcb/xproto.h:11587
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_best_size_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_query_best_size_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_query_best_size_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_query_best_size_cookie_t;
      e : System.Address) return access xcb_query_best_size_reply_t  -- /usr/include/xcb/xproto.h:11608
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_best_size_reply";

  --*<  
   function xcb_query_extension_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:11613
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_extension_sizeof";

  --*
  -- * @brief check if extension is present
  -- *
  -- * @param c The connection
  -- * @param name_len The length of \a name in bytes.
  -- * @param name The name of the extension to query, for example "RANDR". This is case
  -- * sensitive!
  -- * @return A cookie
  -- *
  -- * Determines if the specified extension is present on this X11 server.
  -- * 
  -- * Every extension has a unique `major_opcode` to identify requests, the minor
  -- * opcodes and request formats are extension-specific. If the extension provides
  -- * events and errors, the `first_event` and `first_error` fields in the reply are
  -- * set accordingly.
  -- * 
  -- * There should rarely be a need to use this request directly, XCB provides the
  -- * `xcb_get_extension_data` function instead.
  -- *
  --  

   function xcb_query_extension
     (c : access xcb.xcb_connection_t;
      name_len : bits_stdint_uintn_h.uint16_t;
      name : Interfaces.C.Strings.chars_ptr) return xcb_query_extension_cookie_t  -- /usr/include/xcb/xproto.h:11636
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_extension";

  --*
  -- * @brief check if extension is present
  -- *
  -- * @param c The connection
  -- * @param name_len The length of \a name in bytes.
  -- * @param name The name of the extension to query, for example "RANDR". This is case
  -- * sensitive!
  -- * @return A cookie
  -- *
  -- * Determines if the specified extension is present on this X11 server.
  -- * 
  -- * Every extension has a unique `major_opcode` to identify requests, the minor
  -- * opcodes and request formats are extension-specific. If the extension provides
  -- * events and errors, the `first_event` and `first_error` fields in the reply are
  -- * set accordingly.
  -- * 
  -- * There should rarely be a need to use this request directly, XCB provides the
  -- * `xcb_get_extension_data` function instead.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_query_extension_unchecked
     (c : access xcb.xcb_connection_t;
      name_len : bits_stdint_uintn_h.uint16_t;
      name : Interfaces.C.Strings.chars_ptr) return xcb_query_extension_cookie_t  -- /usr/include/xcb/xproto.h:11664
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_extension_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_query_extension_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_query_extension_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_query_extension_cookie_t;
      e : System.Address) return access xcb_query_extension_reply_t  -- /usr/include/xcb/xproto.h:11683
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_query_extension_reply";

  --*<  
   function xcb_list_extensions_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:11688
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_extensions_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_list_extensions (c : access xcb.xcb_connection_t) return xcb_list_extensions_cookie_t  -- /usr/include/xcb/xproto.h:11699
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_extensions";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_list_extensions_unchecked (c : access xcb.xcb_connection_t) return xcb_list_extensions_cookie_t  -- /usr/include/xcb/xproto.h:11713
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_extensions_unchecked";

   function xcb_list_extensions_names_length (R : access constant xcb_list_extensions_reply_t) return int  -- /usr/include/xcb/xproto.h:11716
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_extensions_names_length";

   function xcb_list_extensions_names_iterator (R : access constant xcb_list_extensions_reply_t) return xcb_str_iterator_t  -- /usr/include/xcb/xproto.h:11719
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_extensions_names_iterator";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_list_extensions_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_list_extensions_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_list_extensions_cookie_t;
      e : System.Address) return access xcb_list_extensions_reply_t  -- /usr/include/xcb/xproto.h:11736
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_extensions_reply";

  --*<  
   function xcb_change_keyboard_mapping_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:11741
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_keyboard_mapping_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_change_keyboard_mapping_checked
     (c : access xcb.xcb_connection_t;
      keycode_count : bits_stdint_uintn_h.uint8_t;
      first_keycode : xcb_keycode_t;
      keysyms_per_keycode : bits_stdint_uintn_h.uint8_t;
      keysyms : access xcb_keysym_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:11755
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_keyboard_mapping_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_change_keyboard_mapping
     (c : access xcb.xcb_connection_t;
      keycode_count : bits_stdint_uintn_h.uint8_t;
      first_keycode : xcb_keycode_t;
      keysyms_per_keycode : bits_stdint_uintn_h.uint8_t;
      keysyms : access xcb_keysym_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:11770
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_keyboard_mapping";

   function xcb_change_keyboard_mapping_keysyms (R : access constant xcb_change_keyboard_mapping_request_t) return access xcb_keysym_t  -- /usr/include/xcb/xproto.h:11777
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_keyboard_mapping_keysyms";

   function xcb_change_keyboard_mapping_keysyms_length (R : access constant xcb_change_keyboard_mapping_request_t) return int  -- /usr/include/xcb/xproto.h:11780
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_keyboard_mapping_keysyms_length";

   function xcb_change_keyboard_mapping_keysyms_end (R : access constant xcb_change_keyboard_mapping_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:11783
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_keyboard_mapping_keysyms_end";

   function xcb_get_keyboard_mapping_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:11786
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_keyboard_mapping_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_get_keyboard_mapping
     (c : access xcb.xcb_connection_t;
      first_keycode : xcb_keycode_t;
      count : bits_stdint_uintn_h.uint8_t) return xcb_get_keyboard_mapping_cookie_t  -- /usr/include/xcb/xproto.h:11797
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_keyboard_mapping";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_get_keyboard_mapping_unchecked
     (c : access xcb.xcb_connection_t;
      first_keycode : xcb_keycode_t;
      count : bits_stdint_uintn_h.uint8_t) return xcb_get_keyboard_mapping_cookie_t  -- /usr/include/xcb/xproto.h:11813
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_keyboard_mapping_unchecked";

   function xcb_get_keyboard_mapping_keysyms (R : access constant xcb_get_keyboard_mapping_reply_t) return access xcb_keysym_t  -- /usr/include/xcb/xproto.h:11818
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_keyboard_mapping_keysyms";

   function xcb_get_keyboard_mapping_keysyms_length (R : access constant xcb_get_keyboard_mapping_reply_t) return int  -- /usr/include/xcb/xproto.h:11821
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_keyboard_mapping_keysyms_length";

   function xcb_get_keyboard_mapping_keysyms_end (R : access constant xcb_get_keyboard_mapping_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:11824
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_keyboard_mapping_keysyms_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_get_keyboard_mapping_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_get_keyboard_mapping_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_get_keyboard_mapping_cookie_t;
      e : System.Address) return access xcb_get_keyboard_mapping_reply_t  -- /usr/include/xcb/xproto.h:11841
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_keyboard_mapping_reply";

  --*<  
   function xcb_change_keyboard_control_value_list_serialize
     (u_buffer : System.Address;
      value_mask : bits_stdint_uintn_h.uint32_t;
      u_aux : access constant xcb_change_keyboard_control_value_list_t) return int  -- /usr/include/xcb/xproto.h:11846
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_keyboard_control_value_list_serialize";

   function xcb_change_keyboard_control_value_list_unpack
     (u_buffer : System.Address;
      value_mask : bits_stdint_uintn_h.uint32_t;
      u_aux : access xcb_change_keyboard_control_value_list_t) return int  -- /usr/include/xcb/xproto.h:11851
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_keyboard_control_value_list_unpack";

   function xcb_change_keyboard_control_value_list_sizeof (u_buffer : System.Address; value_mask : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/xproto.h:11856
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_keyboard_control_value_list_sizeof";

   function xcb_change_keyboard_control_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:11860
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_keyboard_control_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_change_keyboard_control_checked
     (c : access xcb.xcb_connection_t;
      value_mask : bits_stdint_uintn_h.uint32_t;
      value_list : System.Address) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:11874
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_keyboard_control_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_change_keyboard_control
     (c : access xcb.xcb_connection_t;
      value_mask : bits_stdint_uintn_h.uint32_t;
      value_list : System.Address) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:11887
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_keyboard_control";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_change_keyboard_control_aux_checked
     (c : access xcb.xcb_connection_t;
      value_mask : bits_stdint_uintn_h.uint32_t;
      value_list : access constant xcb_change_keyboard_control_value_list_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:11903
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_keyboard_control_aux_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_change_keyboard_control_aux
     (c : access xcb.xcb_connection_t;
      value_mask : bits_stdint_uintn_h.uint32_t;
      value_list : access constant xcb_change_keyboard_control_value_list_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:11916
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_keyboard_control_aux";

   function xcb_change_keyboard_control_value_list (R : access constant xcb_change_keyboard_control_request_t) return System.Address  -- /usr/include/xcb/xproto.h:11921
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_keyboard_control_value_list";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_get_keyboard_control (c : access xcb.xcb_connection_t) return xcb_get_keyboard_control_cookie_t  -- /usr/include/xcb/xproto.h:11932
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_keyboard_control";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_get_keyboard_control_unchecked (c : access xcb.xcb_connection_t) return xcb_get_keyboard_control_cookie_t  -- /usr/include/xcb/xproto.h:11946
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_keyboard_control_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_get_keyboard_control_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_get_keyboard_control_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_get_keyboard_control_cookie_t;
      e : System.Address) return access xcb_get_keyboard_control_reply_t  -- /usr/include/xcb/xproto.h:11963
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_keyboard_control_reply";

  --*<  
  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_bell_checked (c : access xcb.xcb_connection_t; percent : bits_stdint_intn_h.int8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:11979
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_bell_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_bell (c : access xcb.xcb_connection_t; percent : bits_stdint_intn_h.int8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:11991
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_bell";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_change_pointer_control_checked
     (c : access xcb.xcb_connection_t;
      acceleration_numerator : bits_stdint_intn_h.int16_t;
      acceleration_denominator : bits_stdint_intn_h.int16_t;
      threshold : bits_stdint_intn_h.int16_t;
      do_acceleration : bits_stdint_uintn_h.uint8_t;
      do_threshold : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:12006
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_pointer_control_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_change_pointer_control
     (c : access xcb.xcb_connection_t;
      acceleration_numerator : bits_stdint_intn_h.int16_t;
      acceleration_denominator : bits_stdint_intn_h.int16_t;
      threshold : bits_stdint_intn_h.int16_t;
      do_acceleration : bits_stdint_uintn_h.uint8_t;
      do_threshold : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:12022
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_pointer_control";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_get_pointer_control (c : access xcb.xcb_connection_t) return xcb_get_pointer_control_cookie_t  -- /usr/include/xcb/xproto.h:12038
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_pointer_control";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_get_pointer_control_unchecked (c : access xcb.xcb_connection_t) return xcb_get_pointer_control_cookie_t  -- /usr/include/xcb/xproto.h:12052
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_pointer_control_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_get_pointer_control_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_get_pointer_control_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_get_pointer_control_cookie_t;
      e : System.Address) return access xcb_get_pointer_control_reply_t  -- /usr/include/xcb/xproto.h:12069
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_pointer_control_reply";

  --*<  
  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_set_screen_saver_checked
     (c : access xcb.xcb_connection_t;
      timeout : bits_stdint_intn_h.int16_t;
      interval : bits_stdint_intn_h.int16_t;
      prefer_blanking : bits_stdint_uintn_h.uint8_t;
      allow_exposures : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:12085
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_screen_saver_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_set_screen_saver
     (c : access xcb.xcb_connection_t;
      timeout : bits_stdint_intn_h.int16_t;
      interval : bits_stdint_intn_h.int16_t;
      prefer_blanking : bits_stdint_uintn_h.uint8_t;
      allow_exposures : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:12100
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_screen_saver";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_get_screen_saver (c : access xcb.xcb_connection_t) return xcb_get_screen_saver_cookie_t  -- /usr/include/xcb/xproto.h:12115
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_screen_saver";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_get_screen_saver_unchecked (c : access xcb.xcb_connection_t) return xcb_get_screen_saver_cookie_t  -- /usr/include/xcb/xproto.h:12129
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_screen_saver_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_get_screen_saver_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_get_screen_saver_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_get_screen_saver_cookie_t;
      e : System.Address) return access xcb_get_screen_saver_reply_t  -- /usr/include/xcb/xproto.h:12146
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_screen_saver_reply";

  --*<  
   function xcb_change_hosts_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:12151
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_hosts_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_change_hosts_checked
     (c : access xcb.xcb_connection_t;
      mode : bits_stdint_uintn_h.uint8_t;
      family : bits_stdint_uintn_h.uint8_t;
      address_len : bits_stdint_uintn_h.uint16_t;
      address : access bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:12165
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_hosts_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_change_hosts
     (c : access xcb.xcb_connection_t;
      mode : bits_stdint_uintn_h.uint8_t;
      family : bits_stdint_uintn_h.uint8_t;
      address_len : bits_stdint_uintn_h.uint16_t;
      address : access bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:12180
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_hosts";

   function xcb_change_hosts_address (R : access constant xcb_change_hosts_request_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xproto.h:12187
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_hosts_address";

   function xcb_change_hosts_address_length (R : access constant xcb_change_hosts_request_t) return int  -- /usr/include/xcb/xproto.h:12190
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_hosts_address_length";

   function xcb_change_hosts_address_end (R : access constant xcb_change_hosts_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:12193
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_change_hosts_address_end";

   function xcb_host_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:12196
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_host_sizeof";

   function xcb_host_address (R : access constant xcb_host_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xproto.h:12199
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_host_address";

   function xcb_host_address_length (R : access constant xcb_host_t) return int  -- /usr/include/xcb/xproto.h:12202
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_host_address_length";

   function xcb_host_address_end (R : access constant xcb_host_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:12205
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_host_address_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_host_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_host_t)
  --  

   procedure xcb_host_next (i : access xcb_host_iterator_t)  -- /usr/include/xcb/xproto.h:12216
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_host_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_host_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_host_end (i : xcb_host_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:12228
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_host_end";

   function xcb_list_hosts_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:12231
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_hosts_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_list_hosts (c : access xcb.xcb_connection_t) return xcb_list_hosts_cookie_t  -- /usr/include/xcb/xproto.h:12242
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_hosts";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_list_hosts_unchecked (c : access xcb.xcb_connection_t) return xcb_list_hosts_cookie_t  -- /usr/include/xcb/xproto.h:12256
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_hosts_unchecked";

   function xcb_list_hosts_hosts_length (R : access constant xcb_list_hosts_reply_t) return int  -- /usr/include/xcb/xproto.h:12259
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_hosts_hosts_length";

   function xcb_list_hosts_hosts_iterator (R : access constant xcb_list_hosts_reply_t) return xcb_host_iterator_t  -- /usr/include/xcb/xproto.h:12262
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_hosts_hosts_iterator";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_list_hosts_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_list_hosts_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_list_hosts_cookie_t;
      e : System.Address) return access xcb_list_hosts_reply_t  -- /usr/include/xcb/xproto.h:12279
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_list_hosts_reply";

  --*<  
  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_set_access_control_checked (c : access xcb.xcb_connection_t; mode : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:12295
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_access_control_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_set_access_control (c : access xcb.xcb_connection_t; mode : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:12307
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_access_control";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_set_close_down_mode_checked (c : access xcb.xcb_connection_t; mode : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:12322
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_close_down_mode_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_set_close_down_mode (c : access xcb.xcb_connection_t; mode : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:12334
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_close_down_mode";

  --*
  -- * @brief kills a client
  -- *
  -- * @param c The connection
  -- * @param resource Any resource belonging to the client (for example a Window), used to identify
  -- * the client connection.
  -- * \n
  -- * The special value of `XCB_KILL_ALL_TEMPORARY`, the resources of all clients
  -- * that have terminated in `RetainTemporary` (TODO) are destroyed.
  -- * @return A cookie
  -- *
  -- * Forces a close down of the client that created the specified \a resource.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_kill_client_checked (c : access xcb.xcb_connection_t; resource : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:12355
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_kill_client_checked";

  --*
  -- * @brief kills a client
  -- *
  -- * @param c The connection
  -- * @param resource Any resource belonging to the client (for example a Window), used to identify
  -- * the client connection.
  -- * \n
  -- * The special value of `XCB_KILL_ALL_TEMPORARY`, the resources of all clients
  -- * that have terminated in `RetainTemporary` (TODO) are destroyed.
  -- * @return A cookie
  -- *
  -- * Forces a close down of the client that created the specified \a resource.
  -- *
  --  

   function xcb_kill_client (c : access xcb.xcb_connection_t; resource : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:12373
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_kill_client";

   function xcb_rotate_properties_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:12377
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_rotate_properties_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_rotate_properties_checked
     (c : access xcb.xcb_connection_t;
      window : xcb_window_t;
      atoms_len : bits_stdint_uintn_h.uint16_t;
      c_delta : bits_stdint_intn_h.int16_t;
      atoms : access xcb_atom_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:12391
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_rotate_properties_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_rotate_properties
     (c : access xcb.xcb_connection_t;
      window : xcb_window_t;
      atoms_len : bits_stdint_uintn_h.uint16_t;
      c_delta : bits_stdint_intn_h.int16_t;
      atoms : access xcb_atom_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:12406
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_rotate_properties";

   function xcb_rotate_properties_atoms (R : access constant xcb_rotate_properties_request_t) return access xcb_atom_t  -- /usr/include/xcb/xproto.h:12413
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_rotate_properties_atoms";

   function xcb_rotate_properties_atoms_length (R : access constant xcb_rotate_properties_request_t) return int  -- /usr/include/xcb/xproto.h:12416
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_rotate_properties_atoms_length";

   function xcb_rotate_properties_atoms_end (R : access constant xcb_rotate_properties_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:12419
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_rotate_properties_atoms_end";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_force_screen_saver_checked (c : access xcb.xcb_connection_t; mode : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:12433
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_force_screen_saver_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_force_screen_saver (c : access xcb.xcb_connection_t; mode : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:12445
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_force_screen_saver";

   function xcb_set_pointer_mapping_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:12449
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_pointer_mapping_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_set_pointer_mapping
     (c : access xcb.xcb_connection_t;
      map_len : bits_stdint_uintn_h.uint8_t;
      map : access bits_stdint_uintn_h.uint8_t) return xcb_set_pointer_mapping_cookie_t  -- /usr/include/xcb/xproto.h:12460
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_pointer_mapping";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_set_pointer_mapping_unchecked
     (c : access xcb.xcb_connection_t;
      map_len : bits_stdint_uintn_h.uint8_t;
      map : access bits_stdint_uintn_h.uint8_t) return xcb_set_pointer_mapping_cookie_t  -- /usr/include/xcb/xproto.h:12476
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_pointer_mapping_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_set_pointer_mapping_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_set_pointer_mapping_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_set_pointer_mapping_cookie_t;
      e : System.Address) return access xcb_set_pointer_mapping_reply_t  -- /usr/include/xcb/xproto.h:12495
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_pointer_mapping_reply";

  --*<  
   function xcb_get_pointer_mapping_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:12500
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_pointer_mapping_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_get_pointer_mapping (c : access xcb.xcb_connection_t) return xcb_get_pointer_mapping_cookie_t  -- /usr/include/xcb/xproto.h:12511
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_pointer_mapping";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_get_pointer_mapping_unchecked (c : access xcb.xcb_connection_t) return xcb_get_pointer_mapping_cookie_t  -- /usr/include/xcb/xproto.h:12525
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_pointer_mapping_unchecked";

   function xcb_get_pointer_mapping_map (R : access constant xcb_get_pointer_mapping_reply_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xproto.h:12528
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_pointer_mapping_map";

   function xcb_get_pointer_mapping_map_length (R : access constant xcb_get_pointer_mapping_reply_t) return int  -- /usr/include/xcb/xproto.h:12531
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_pointer_mapping_map_length";

   function xcb_get_pointer_mapping_map_end (R : access constant xcb_get_pointer_mapping_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:12534
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_pointer_mapping_map_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_get_pointer_mapping_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_get_pointer_mapping_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_get_pointer_mapping_cookie_t;
      e : System.Address) return access xcb_get_pointer_mapping_reply_t  -- /usr/include/xcb/xproto.h:12551
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_pointer_mapping_reply";

  --*<  
   function xcb_set_modifier_mapping_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:12556
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_modifier_mapping_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_set_modifier_mapping
     (c : access xcb.xcb_connection_t;
      keycodes_per_modifier : bits_stdint_uintn_h.uint8_t;
      keycodes : access xcb_keycode_t) return xcb_set_modifier_mapping_cookie_t  -- /usr/include/xcb/xproto.h:12567
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_modifier_mapping";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_set_modifier_mapping_unchecked
     (c : access xcb.xcb_connection_t;
      keycodes_per_modifier : bits_stdint_uintn_h.uint8_t;
      keycodes : access xcb_keycode_t) return xcb_set_modifier_mapping_cookie_t  -- /usr/include/xcb/xproto.h:12583
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_modifier_mapping_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_set_modifier_mapping_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_set_modifier_mapping_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_set_modifier_mapping_cookie_t;
      e : System.Address) return access xcb_set_modifier_mapping_reply_t  -- /usr/include/xcb/xproto.h:12602
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_set_modifier_mapping_reply";

  --*<  
   function xcb_get_modifier_mapping_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xproto.h:12607
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_modifier_mapping_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_get_modifier_mapping (c : access xcb.xcb_connection_t) return xcb_get_modifier_mapping_cookie_t  -- /usr/include/xcb/xproto.h:12618
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_modifier_mapping";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will cause
  -- * a reply to be generated. Any returned error will be
  -- * placed in the event queue.
  --  

   function xcb_get_modifier_mapping_unchecked (c : access xcb.xcb_connection_t) return xcb_get_modifier_mapping_cookie_t  -- /usr/include/xcb/xproto.h:12632
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_modifier_mapping_unchecked";

   function xcb_get_modifier_mapping_keycodes (R : access constant xcb_get_modifier_mapping_reply_t) return access xcb_keycode_t  -- /usr/include/xcb/xproto.h:12635
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_modifier_mapping_keycodes";

   function xcb_get_modifier_mapping_keycodes_length (R : access constant xcb_get_modifier_mapping_reply_t) return int  -- /usr/include/xcb/xproto.h:12638
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_modifier_mapping_keycodes_length";

   function xcb_get_modifier_mapping_keycodes_end (R : access constant xcb_get_modifier_mapping_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xproto.h:12641
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_modifier_mapping_keycodes_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_get_modifier_mapping_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_get_modifier_mapping_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_get_modifier_mapping_cookie_t;
      e : System.Address) return access xcb_get_modifier_mapping_reply_t  -- /usr/include/xcb/xproto.h:12658
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_modifier_mapping_reply";

  --*<  
  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  -- * This form can be used only if the request will not cause
  -- * a reply to be generated. Any returned error will be
  -- * saved for handling by xcb_request_check().
  --  

   function xcb_no_operation_checked (c : access xcb.xcb_connection_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:12674
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_no_operation_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_no_operation (c : access xcb.xcb_connection_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xproto.h:12685
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_no_operation";

  --*
  -- * @}
  --  

end xproto;
