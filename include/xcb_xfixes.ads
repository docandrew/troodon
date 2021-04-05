pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with xcb;
with bits_stdint_uintn_h;
with xproto;
with bits_stdint_intn_h;
with xcb_shape;
with xcb_render;
with System;
with Interfaces.C.Strings;

package xcb_xfixes is

   CONST_XCB_XFIXES_MAJOR_VERSION : constant := 5;  --  /usr/include/xcb/xfixes.h:24
   CONST_XCB_XFIXES_MINOR_VERSION : constant := 0;  --  /usr/include/xcb/xfixes.h:25

   CONST_XCB_XFIXES_QUERY_VERSION : constant := 0;  --  /usr/include/xcb/xfixes.h:37

   CONST_XCB_XFIXES_CHANGE_SAVE_SET : constant := 1;  --  /usr/include/xcb/xfixes.h:79

   CONST_XCB_XFIXES_SELECTION_NOTIFY : constant := 0;  --  /usr/include/xcb/xfixes.h:108

   CONST_XCB_XFIXES_SELECT_SELECTION_INPUT : constant := 2;  --  /usr/include/xcb/xfixes.h:126

   CONST_XCB_XFIXES_CURSOR_NOTIFY : constant := 1;  --  /usr/include/xcb/xfixes.h:149

   CONST_XCB_XFIXES_SELECT_CURSOR_INPUT : constant := 3;  --  /usr/include/xcb/xfixes.h:166

   CONST_XCB_XFIXES_GET_CURSOR_IMAGE : constant := 4;  --  /usr/include/xcb/xfixes.h:187

   CONST_XCB_XFIXES_BAD_REGION : constant := 0;  --  /usr/include/xcb/xfixes.h:228

   CONST_XCB_XFIXES_CREATE_REGION : constant := 5;  --  /usr/include/xcb/xfixes.h:244

   CONST_XCB_XFIXES_CREATE_REGION_FROM_BITMAP : constant := 6;  --  /usr/include/xcb/xfixes.h:257

   CONST_XCB_XFIXES_CREATE_REGION_FROM_WINDOW : constant := 7;  --  /usr/include/xcb/xfixes.h:271

   CONST_XCB_XFIXES_CREATE_REGION_FROM_GC : constant := 8;  --  /usr/include/xcb/xfixes.h:287

   CONST_XCB_XFIXES_CREATE_REGION_FROM_PICTURE : constant := 9;  --  /usr/include/xcb/xfixes.h:301

   CONST_XCB_XFIXES_DESTROY_REGION : constant := 10;  --  /usr/include/xcb/xfixes.h:315

   CONST_XCB_XFIXES_SET_REGION : constant := 11;  --  /usr/include/xcb/xfixes.h:328

   CONST_XCB_XFIXES_COPY_REGION : constant := 12;  --  /usr/include/xcb/xfixes.h:341

   CONST_XCB_XFIXES_UNION_REGION : constant := 13;  --  /usr/include/xcb/xfixes.h:355

   CONST_XCB_XFIXES_INTERSECT_REGION : constant := 14;  --  /usr/include/xcb/xfixes.h:370

   CONST_XCB_XFIXES_SUBTRACT_REGION : constant := 15;  --  /usr/include/xcb/xfixes.h:385

   CONST_XCB_XFIXES_INVERT_REGION : constant := 16;  --  /usr/include/xcb/xfixes.h:400

   CONST_XCB_XFIXES_TRANSLATE_REGION : constant := 17;  --  /usr/include/xcb/xfixes.h:415

   CONST_XCB_XFIXES_REGION_EXTENTS : constant := 18;  --  /usr/include/xcb/xfixes.h:430

   CONST_XCB_XFIXES_FETCH_REGION : constant := 19;  --  /usr/include/xcb/xfixes.h:451

   CONST_XCB_XFIXES_SET_GC_CLIP_REGION : constant := 20;  --  /usr/include/xcb/xfixes.h:476

   CONST_XCB_XFIXES_SET_WINDOW_SHAPE_REGION : constant := 21;  --  /usr/include/xcb/xfixes.h:492

   CONST_XCB_XFIXES_SET_PICTURE_CLIP_REGION : constant := 22;  --  /usr/include/xcb/xfixes.h:510

   CONST_XCB_XFIXES_SET_CURSOR_NAME : constant := 23;  --  /usr/include/xcb/xfixes.h:526

   CONST_XCB_XFIXES_GET_CURSOR_NAME : constant := 24;  --  /usr/include/xcb/xfixes.h:548

   CONST_XCB_XFIXES_GET_CURSOR_IMAGE_AND_NAME : constant := 25;  --  /usr/include/xcb/xfixes.h:581

   CONST_XCB_XFIXES_CHANGE_CURSOR : constant := 26;  --  /usr/include/xcb/xfixes.h:613

   CONST_XCB_XFIXES_CHANGE_CURSOR_BY_NAME : constant := 27;  --  /usr/include/xcb/xfixes.h:627

   CONST_XCB_XFIXES_EXPAND_REGION : constant := 28;  --  /usr/include/xcb/xfixes.h:642

   CONST_XCB_XFIXES_IDE_CURSOR : constant := 29;  --  /usr/include/xcb/xfixes.h:660

   CONST_XCB_XFIXES_SHOW_CURSOR : constant := 30;  --  /usr/include/xcb/xfixes.h:673

   CONST_XCB_XFIXES_CREATE_POINTER_BARRIER : constant := 31;  --  /usr/include/xcb/xfixes.h:704

   CONST_XCB_XFIXES_DELETE_POINTER_BARRIER : constant := 32;  --  /usr/include/xcb/xfixes.h:725

   xcb_xfixes_id : aliased xcb.xcb_extension_t  -- /usr/include/xcb/xfixes.h:27
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_id";

   type xcb_xfixes_query_version_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xfixes.h:33
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:32

   type xcb_xfixes_query_version_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:43
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:44
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:45
      client_major_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xfixes.h:46
      client_minor_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xfixes.h:47
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:42

   type xcb_xfixes_query_version_reply_t_array4353 is array (0 .. 15) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_xfixes_query_version_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:54
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:55
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:56
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xfixes.h:57
      major_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xfixes.h:58
      minor_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xfixes.h:59
      pad1 : aliased xcb_xfixes_query_version_reply_t_array4353;  -- /usr/include/xcb/xfixes.h:60
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:53

   type xcb_xfixes_save_set_mode_t is 
     (XCB_XFIXES_SAVE_SET_MODE_INSERT,
      XCB_XFIXES_SAVE_SET_MODE_DELETE)
   with Convention => C;  -- /usr/include/xcb/xfixes.h:63

   type xcb_xfixes_save_set_target_t is 
     (XCB_XFIXES_SAVE_SET_TARGET_NEAREST,
      XCB_XFIXES_SAVE_SET_TARGET_ROOT)
   with Convention => C;  -- /usr/include/xcb/xfixes.h:68

   type xcb_xfixes_save_set_mapping_t is 
     (XCB_XFIXES_SAVE_SET_MAPPING_MAP,
      XCB_XFIXES_SAVE_SET_MAPPING_UNMAP)
   with Convention => C;  -- /usr/include/xcb/xfixes.h:73

   type xcb_xfixes_change_save_set_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:85
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:86
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:87
      mode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:88
      target : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:89
      map : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:90
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:91
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/xfixes.h:92
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:84

   type xcb_xfixes_selection_event_t is 
     (XCB_XFIXES_SELECTION_EVENT_SET_SELECTION_OWNER,
      XCB_XFIXES_SELECTION_EVENT_SELECTION_WINDOW_DESTROY,
      XCB_XFIXES_SELECTION_EVENT_SELECTION_CLIENT_CLOSE)
   with Convention => C;  -- /usr/include/xcb/xfixes.h:95

   subtype xcb_xfixes_selection_event_mask_t is unsigned;
   XCB_XFIXES_SELECTION_EVENT_MASK_SET_SELECTION_OWNER : constant unsigned := 1;
   XCB_XFIXES_SELECTION_EVENT_MASK_SELECTION_WINDOW_DESTROY : constant unsigned := 2;
   XCB_XFIXES_SELECTION_EVENT_MASK_SELECTION_CLIENT_CLOSE : constant unsigned := 4;  -- /usr/include/xcb/xfixes.h:101

   type xcb_xfixes_selection_notify_event_t_array2620 is array (0 .. 7) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_xfixes_selection_notify_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:114
      c_subtype : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:115
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:116
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/xfixes.h:117
      owner : aliased xproto.xcb_window_t;  -- /usr/include/xcb/xfixes.h:118
      selection : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xfixes.h:119
      timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/xfixes.h:120
      selection_timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/xfixes.h:121
      pad0 : aliased xcb_xfixes_selection_notify_event_t_array2620;  -- /usr/include/xcb/xfixes.h:122
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:113

   type xcb_xfixes_select_selection_input_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:132
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:133
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:134
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/xfixes.h:135
      selection : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xfixes.h:136
      event_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xfixes.h:137
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:131

   type xcb_xfixes_cursor_notify_t is 
     (XCB_XFIXES_CURSOR_NOTIFY_DISPLAY_CURSOR)
   with Convention => C;  -- /usr/include/xcb/xfixes.h:140

   subtype xcb_xfixes_cursor_notify_mask_t is unsigned;
   XCB_XFIXES_CURSOR_NOTIFY_MASK_DISPLAY_CURSOR : constant unsigned := 1;  -- /usr/include/xcb/xfixes.h:144

   type xcb_xfixes_cursor_notify_event_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_xfixes_cursor_notify_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:155
      c_subtype : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:156
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:157
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/xfixes.h:158
      cursor_serial : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xfixes.h:159
      timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/xfixes.h:160
      name : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xfixes.h:161
      pad0 : aliased xcb_xfixes_cursor_notify_event_t_array2180;  -- /usr/include/xcb/xfixes.h:162
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:154

   type xcb_xfixes_select_cursor_input_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:172
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:173
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:174
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/xfixes.h:175
      event_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xfixes.h:176
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:171

   type xcb_xfixes_get_cursor_image_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xfixes.h:183
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:182

   type xcb_xfixes_get_cursor_image_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:193
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:194
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:195
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:192

   type xcb_xfixes_get_cursor_image_reply_t_array2620 is array (0 .. 7) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_xfixes_get_cursor_image_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:202
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:203
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:204
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xfixes.h:205
      x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xfixes.h:206
      y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xfixes.h:207
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:208
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:209
      xhot : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:210
      yhot : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:211
      cursor_serial : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xfixes.h:212
      pad1 : aliased xcb_xfixes_get_cursor_image_reply_t_array2620;  -- /usr/include/xcb/xfixes.h:213
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:201

   subtype xcb_xfixes_region_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xfixes.h:216

   type xcb_xfixes_region_iterator_t is record
      data : access xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:222
      c_rem : aliased int;  -- /usr/include/xcb/xfixes.h:223
      index : aliased int;  -- /usr/include/xcb/xfixes.h:224
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:221

   type xcb_xfixes_bad_region_error_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:234
      error_code : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:235
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:236
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:233

   type xcb_xfixes_region_enum_t is 
     (XCB_XFIXES_REGION_NONE)
   with Convention => C;  -- /usr/include/xcb/xfixes.h:239

   type xcb_xfixes_create_region_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:250
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:251
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:252
      region : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:253
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:249

   type xcb_xfixes_create_region_from_bitmap_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:263
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:264
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:265
      region : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:266
      bitmap : aliased xproto.xcb_pixmap_t;  -- /usr/include/xcb/xfixes.h:267
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:262

   type xcb_xfixes_create_region_from_window_request_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_xfixes_create_region_from_window_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:277
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:278
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:279
      region : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:280
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/xfixes.h:281
      kind : aliased xcb_shape.xcb_shape_kind_t;  -- /usr/include/xcb/xfixes.h:282
      pad0 : aliased xcb_xfixes_create_region_from_window_request_t_array1897;  -- /usr/include/xcb/xfixes.h:283
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:276

   type xcb_xfixes_create_region_from_gc_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:293
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:294
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:295
      region : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:296
      gc : aliased xproto.xcb_gcontext_t;  -- /usr/include/xcb/xfixes.h:297
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:292

   type xcb_xfixes_create_region_from_picture_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:307
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:308
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:309
      region : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:310
      picture : aliased xcb_render.xcb_render_picture_t;  -- /usr/include/xcb/xfixes.h:311
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:306

   type xcb_xfixes_destroy_region_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:321
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:322
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:323
      region : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:324
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:320

   type xcb_xfixes_set_region_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:334
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:335
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:336
      region : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:337
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:333

   type xcb_xfixes_copy_region_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:347
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:348
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:349
      source : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:350
      destination : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:351
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:346

   type xcb_xfixes_union_region_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:361
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:362
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:363
      source1 : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:364
      source2 : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:365
      destination : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:366
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:360

   type xcb_xfixes_intersect_region_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:376
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:377
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:378
      source1 : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:379
      source2 : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:380
      destination : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:381
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:375

   type xcb_xfixes_subtract_region_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:391
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:392
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:393
      source1 : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:394
      source2 : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:395
      destination : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:396
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:390

   type xcb_xfixes_invert_region_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:406
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:407
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:408
      source : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:409
      bounds : aliased xproto.xcb_rectangle_t;  -- /usr/include/xcb/xfixes.h:410
      destination : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:411
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:405

   type xcb_xfixes_translate_region_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:421
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:422
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:423
      region : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:424
      dx : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xfixes.h:425
      dy : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xfixes.h:426
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:420

   type xcb_xfixes_region_extents_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:436
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:437
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:438
      source : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:439
      destination : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:440
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:435

   type xcb_xfixes_fetch_region_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xfixes.h:447
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:446

   type xcb_xfixes_fetch_region_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:457
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:458
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:459
      region : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:460
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:456

   type xcb_xfixes_fetch_region_reply_t_array4353 is array (0 .. 15) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_xfixes_fetch_region_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:467
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:468
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:469
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xfixes.h:470
      extents : aliased xproto.xcb_rectangle_t;  -- /usr/include/xcb/xfixes.h:471
      pad1 : aliased xcb_xfixes_fetch_region_reply_t_array4353;  -- /usr/include/xcb/xfixes.h:472
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:466

   type xcb_xfixes_set_gc_clip_region_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:482
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:483
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:484
      gc : aliased xproto.xcb_gcontext_t;  -- /usr/include/xcb/xfixes.h:485
      region : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:486
      x_origin : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xfixes.h:487
      y_origin : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xfixes.h:488
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:481

   type xcb_xfixes_set_window_shape_region_request_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_xfixes_set_window_shape_region_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:498
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:499
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:500
      dest : aliased xproto.xcb_window_t;  -- /usr/include/xcb/xfixes.h:501
      dest_kind : aliased xcb_shape.xcb_shape_kind_t;  -- /usr/include/xcb/xfixes.h:502
      pad0 : aliased xcb_xfixes_set_window_shape_region_request_t_array1897;  -- /usr/include/xcb/xfixes.h:503
      x_offset : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xfixes.h:504
      y_offset : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xfixes.h:505
      region : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:506
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:497

   type xcb_xfixes_set_picture_clip_region_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:516
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:517
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:518
      picture : aliased xcb_render.xcb_render_picture_t;  -- /usr/include/xcb/xfixes.h:519
      region : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:520
      x_origin : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xfixes.h:521
      y_origin : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xfixes.h:522
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:515

   type xcb_xfixes_set_cursor_name_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_xfixes_set_cursor_name_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:532
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:533
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:534
      cursor : aliased xproto.xcb_cursor_t;  -- /usr/include/xcb/xfixes.h:535
      nbytes : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:536
      pad0 : aliased xcb_xfixes_set_cursor_name_request_t_array1823;  -- /usr/include/xcb/xfixes.h:537
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:531

   type xcb_xfixes_get_cursor_name_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xfixes.h:544
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:543

   type xcb_xfixes_get_cursor_name_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:554
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:555
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:556
      cursor : aliased xproto.xcb_cursor_t;  -- /usr/include/xcb/xfixes.h:557
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:553

   type xcb_xfixes_get_cursor_name_reply_t_array2771 is array (0 .. 17) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_xfixes_get_cursor_name_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:564
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:565
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:566
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xfixes.h:567
      atom : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xfixes.h:568
      nbytes : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:569
      pad1 : aliased xcb_xfixes_get_cursor_name_reply_t_array2771;  -- /usr/include/xcb/xfixes.h:570
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:563

   type xcb_xfixes_get_cursor_image_and_name_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xfixes.h:577
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:576

   type xcb_xfixes_get_cursor_image_and_name_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:587
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:588
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:589
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:586

   type xcb_xfixes_get_cursor_image_and_name_reply_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_xfixes_get_cursor_image_and_name_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:596
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:597
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:598
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xfixes.h:599
      x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xfixes.h:600
      y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xfixes.h:601
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:602
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:603
      xhot : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:604
      yhot : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:605
      cursor_serial : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xfixes.h:606
      cursor_atom : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xfixes.h:607
      nbytes : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:608
      pad1 : aliased xcb_xfixes_get_cursor_image_and_name_reply_t_array1823;  -- /usr/include/xcb/xfixes.h:609
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:595

   type xcb_xfixes_change_cursor_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:619
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:620
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:621
      source : aliased xproto.xcb_cursor_t;  -- /usr/include/xcb/xfixes.h:622
      destination : aliased xproto.xcb_cursor_t;  -- /usr/include/xcb/xfixes.h:623
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:618

   type xcb_xfixes_change_cursor_by_name_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_xfixes_change_cursor_by_name_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:633
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:634
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:635
      src : aliased xproto.xcb_cursor_t;  -- /usr/include/xcb/xfixes.h:636
      nbytes : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:637
      pad0 : aliased xcb_xfixes_change_cursor_by_name_request_t_array1823;  -- /usr/include/xcb/xfixes.h:638
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:632

   type xcb_xfixes_expand_region_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:648
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:649
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:650
      source : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:651
      destination : aliased xcb_xfixes_region_t;  -- /usr/include/xcb/xfixes.h:652
      left : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:653
      right : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:654
      top : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:655
      bottom : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:656
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:647

   type xcb_xfixeside_cursor_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:666
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:667
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:668
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/xfixes.h:669
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:665

   type xcb_xfixes_show_cursor_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:679
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:680
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:681
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/xfixes.h:682
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:678

   subtype xcb_xfixes_barrier_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xfixes.h:685

   type xcb_xfixes_barrier_iterator_t is record
      data : access xcb_xfixes_barrier_t;  -- /usr/include/xcb/xfixes.h:691
      c_rem : aliased int;  -- /usr/include/xcb/xfixes.h:692
      index : aliased int;  -- /usr/include/xcb/xfixes.h:693
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:690

   subtype xcb_xfixes_barrier_directions_t is unsigned;
   XCB_XFIXES_BARRIER_DIRECTIONS_POSITIVE_X : constant unsigned := 1;
   XCB_XFIXES_BARRIER_DIRECTIONS_POSITIVE_Y : constant unsigned := 2;
   XCB_XFIXES_BARRIER_DIRECTIONS_NEGATIVE_X : constant unsigned := 4;
   XCB_XFIXES_BARRIER_DIRECTIONS_NEGATIVE_Y : constant unsigned := 8;  -- /usr/include/xcb/xfixes.h:696

   type xcb_xfixes_create_pointer_barrier_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_xfixes_create_pointer_barrier_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:710
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:711
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:712
      barrier : aliased xcb_xfixes_barrier_t;  -- /usr/include/xcb/xfixes.h:713
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/xfixes.h:714
      x1 : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:715
      y1 : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:716
      x2 : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:717
      y2 : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:718
      directions : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xfixes.h:719
      pad0 : aliased xcb_xfixes_create_pointer_barrier_request_t_array1823;  -- /usr/include/xcb/xfixes.h:720
      num_devices : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:721
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:709

   type xcb_xfixes_delete_pointer_barrier_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:731
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xfixes.h:732
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xfixes.h:733
      barrier : aliased xcb_xfixes_barrier_t;  -- /usr/include/xcb/xfixes.h:734
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xfixes.h:730

   function xcb_xfixes_query_version
     (c : access xcb.xcb_connection_t;
      client_major_version : bits_stdint_uintn_h.uint32_t;
      client_minor_version : bits_stdint_uintn_h.uint32_t) return xcb_xfixes_query_version_cookie_t  -- /usr/include/xcb/xfixes.h:746
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_query_version";

   function xcb_xfixes_query_version_unchecked
     (c : access xcb.xcb_connection_t;
      client_major_version : bits_stdint_uintn_h.uint32_t;
      client_minor_version : bits_stdint_uintn_h.uint32_t) return xcb_xfixes_query_version_cookie_t  -- /usr/include/xcb/xfixes.h:762
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_query_version_unchecked";

   function xcb_xfixes_query_version_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_xfixes_query_version_cookie_t;
      e : System.Address) return access xcb_xfixes_query_version_reply_t  -- /usr/include/xcb/xfixes.h:781
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_query_version_reply";

   function xcb_xfixes_change_save_set_checked
     (c : access xcb.xcb_connection_t;
      mode : bits_stdint_uintn_h.uint8_t;
      target : bits_stdint_uintn_h.uint8_t;
      map : bits_stdint_uintn_h.uint8_t;
      window : xproto.xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:797
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_change_save_set_checked";

   function xcb_xfixes_change_save_set
     (c : access xcb.xcb_connection_t;
      mode : bits_stdint_uintn_h.uint8_t;
      target : bits_stdint_uintn_h.uint8_t;
      map : bits_stdint_uintn_h.uint8_t;
      window : xproto.xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:812
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_change_save_set";

   function xcb_xfixes_select_selection_input_checked
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      selection : xproto.xcb_atom_t;
      event_mask : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:830
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_select_selection_input_checked";

   function xcb_xfixes_select_selection_input
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      selection : xproto.xcb_atom_t;
      event_mask : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:844
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_select_selection_input";

   function xcb_xfixes_select_cursor_input_checked
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      event_mask : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:861
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_select_cursor_input_checked";

   function xcb_xfixes_select_cursor_input
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      event_mask : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:874
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_select_cursor_input";

   function xcb_xfixes_get_cursor_image_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xfixes.h:879
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_get_cursor_image_sizeof";

   function xcb_xfixes_get_cursor_image (c : access xcb.xcb_connection_t) return xcb_xfixes_get_cursor_image_cookie_t  -- /usr/include/xcb/xfixes.h:890
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_get_cursor_image";

   function xcb_xfixes_get_cursor_image_unchecked (c : access xcb.xcb_connection_t) return xcb_xfixes_get_cursor_image_cookie_t  -- /usr/include/xcb/xfixes.h:904
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_get_cursor_image_unchecked";

   function xcb_xfixes_get_cursor_image_cursor_image (R : access constant xcb_xfixes_get_cursor_image_reply_t) return access bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/xfixes.h:907
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_get_cursor_image_cursor_image";

   function xcb_xfixes_get_cursor_image_cursor_image_length (R : access constant xcb_xfixes_get_cursor_image_reply_t) return int  -- /usr/include/xcb/xfixes.h:910
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_get_cursor_image_cursor_image_length";

   function xcb_xfixes_get_cursor_image_cursor_image_end (R : access constant xcb_xfixes_get_cursor_image_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xfixes.h:913
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_get_cursor_image_cursor_image_end";

   function xcb_xfixes_get_cursor_image_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_xfixes_get_cursor_image_cookie_t;
      e : System.Address) return access xcb_xfixes_get_cursor_image_reply_t  -- /usr/include/xcb/xfixes.h:930
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_get_cursor_image_reply";

   procedure xcb_xfixes_region_next (i : access xcb_xfixes_region_iterator_t)  -- /usr/include/xcb/xfixes.h:943
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_region_next";

   function xcb_xfixes_region_end (i : xcb_xfixes_region_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xfixes.h:955
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_region_end";

   function xcb_xfixes_create_region_sizeof (u_buffer : System.Address; rectangles_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/xfixes.h:958
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_create_region_sizeof";

   function xcb_xfixes_create_region_checked
     (c : access xcb.xcb_connection_t;
      region : xcb_xfixes_region_t;
      rectangles_len : bits_stdint_uintn_h.uint32_t;
      rectangles : access constant xproto.xcb_rectangle_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:973
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_create_region_checked";

   function xcb_xfixes_create_region
     (c : access xcb.xcb_connection_t;
      region : xcb_xfixes_region_t;
      rectangles_len : bits_stdint_uintn_h.uint32_t;
      rectangles : access constant xproto.xcb_rectangle_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:987
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_create_region";

   function xcb_xfixes_create_region_rectangles (R : access constant xcb_xfixes_create_region_request_t) return access xproto.xcb_rectangle_t  -- /usr/include/xcb/xfixes.h:993
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_create_region_rectangles";

   function xcb_xfixes_create_region_rectangles_length (R : access constant xcb_xfixes_create_region_request_t) return int  -- /usr/include/xcb/xfixes.h:996
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_create_region_rectangles_length";

   function xcb_xfixes_create_region_rectangles_iterator (R : access constant xcb_xfixes_create_region_request_t) return xproto.xcb_rectangle_iterator_t  -- /usr/include/xcb/xfixes.h:999
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_create_region_rectangles_iterator";

   function xcb_xfixes_create_region_from_bitmap_checked
     (c : access xcb.xcb_connection_t;
      region : xcb_xfixes_region_t;
      bitmap : xproto.xcb_pixmap_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1013
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_create_region_from_bitmap_checked";

   function xcb_xfixes_create_region_from_bitmap
     (c : access xcb.xcb_connection_t;
      region : xcb_xfixes_region_t;
      bitmap : xproto.xcb_pixmap_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1026
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_create_region_from_bitmap";

   function xcb_xfixes_create_region_from_window_checked
     (c : access xcb.xcb_connection_t;
      region : xcb_xfixes_region_t;
      window : xproto.xcb_window_t;
      kind : xcb_shape.xcb_shape_kind_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1042
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_create_region_from_window_checked";

   function xcb_xfixes_create_region_from_window
     (c : access xcb.xcb_connection_t;
      region : xcb_xfixes_region_t;
      window : xproto.xcb_window_t;
      kind : xcb_shape.xcb_shape_kind_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1056
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_create_region_from_window";

   function xcb_xfixes_create_region_from_gc_checked
     (c : access xcb.xcb_connection_t;
      region : xcb_xfixes_region_t;
      gc : xproto.xcb_gcontext_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1073
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_create_region_from_gc_checked";

   function xcb_xfixes_create_region_from_gc
     (c : access xcb.xcb_connection_t;
      region : xcb_xfixes_region_t;
      gc : xproto.xcb_gcontext_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1086
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_create_region_from_gc";

   function xcb_xfixes_create_region_from_picture_checked
     (c : access xcb.xcb_connection_t;
      region : xcb_xfixes_region_t;
      picture : xcb_render.xcb_render_picture_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1102
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_create_region_from_picture_checked";

   function xcb_xfixes_create_region_from_picture
     (c : access xcb.xcb_connection_t;
      region : xcb_xfixes_region_t;
      picture : xcb_render.xcb_render_picture_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1115
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_create_region_from_picture";

   function xcb_xfixes_destroy_region_checked (c : access xcb.xcb_connection_t; region : xcb_xfixes_region_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1131
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_destroy_region_checked";

   function xcb_xfixes_destroy_region (c : access xcb.xcb_connection_t; region : xcb_xfixes_region_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1143
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_destroy_region";

   function xcb_xfixes_set_region_sizeof (u_buffer : System.Address; rectangles_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/xfixes.h:1147
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_set_region_sizeof";

   function xcb_xfixes_set_region_checked
     (c : access xcb.xcb_connection_t;
      region : xcb_xfixes_region_t;
      rectangles_len : bits_stdint_uintn_h.uint32_t;
      rectangles : access constant xproto.xcb_rectangle_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1162
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_set_region_checked";

   function xcb_xfixes_set_region
     (c : access xcb.xcb_connection_t;
      region : xcb_xfixes_region_t;
      rectangles_len : bits_stdint_uintn_h.uint32_t;
      rectangles : access constant xproto.xcb_rectangle_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1176
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_set_region";

   function xcb_xfixes_set_region_rectangles (R : access constant xcb_xfixes_set_region_request_t) return access xproto.xcb_rectangle_t  -- /usr/include/xcb/xfixes.h:1182
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_set_region_rectangles";

   function xcb_xfixes_set_region_rectangles_length (R : access constant xcb_xfixes_set_region_request_t) return int  -- /usr/include/xcb/xfixes.h:1185
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_set_region_rectangles_length";

   function xcb_xfixes_set_region_rectangles_iterator (R : access constant xcb_xfixes_set_region_request_t) return xproto.xcb_rectangle_iterator_t  -- /usr/include/xcb/xfixes.h:1188
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_set_region_rectangles_iterator";

   function xcb_xfixes_copy_region_checked
     (c : access xcb.xcb_connection_t;
      source : xcb_xfixes_region_t;
      destination : xcb_xfixes_region_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1202
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_copy_region_checked";

   function xcb_xfixes_copy_region
     (c : access xcb.xcb_connection_t;
      source : xcb_xfixes_region_t;
      destination : xcb_xfixes_region_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1215
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_copy_region";

   function xcb_xfixes_union_region_checked
     (c : access xcb.xcb_connection_t;
      source1 : xcb_xfixes_region_t;
      source2 : xcb_xfixes_region_t;
      destination : xcb_xfixes_region_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1231
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_union_region_checked";

   function xcb_xfixes_union_region
     (c : access xcb.xcb_connection_t;
      source1 : xcb_xfixes_region_t;
      source2 : xcb_xfixes_region_t;
      destination : xcb_xfixes_region_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1245
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_union_region";

   function xcb_xfixes_intersect_region_checked
     (c : access xcb.xcb_connection_t;
      source1 : xcb_xfixes_region_t;
      source2 : xcb_xfixes_region_t;
      destination : xcb_xfixes_region_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1262
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_intersect_region_checked";

   function xcb_xfixes_intersect_region
     (c : access xcb.xcb_connection_t;
      source1 : xcb_xfixes_region_t;
      source2 : xcb_xfixes_region_t;
      destination : xcb_xfixes_region_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1276
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_intersect_region";

   function xcb_xfixes_subtract_region_checked
     (c : access xcb.xcb_connection_t;
      source1 : xcb_xfixes_region_t;
      source2 : xcb_xfixes_region_t;
      destination : xcb_xfixes_region_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1293
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_subtract_region_checked";

   function xcb_xfixes_subtract_region
     (c : access xcb.xcb_connection_t;
      source1 : xcb_xfixes_region_t;
      source2 : xcb_xfixes_region_t;
      destination : xcb_xfixes_region_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1307
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_subtract_region";

   function xcb_xfixes_invert_region_checked
     (c : access xcb.xcb_connection_t;
      source : xcb_xfixes_region_t;
      bounds : xproto.xcb_rectangle_t;
      destination : xcb_xfixes_region_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1324
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_invert_region_checked";

   function xcb_xfixes_invert_region
     (c : access xcb.xcb_connection_t;
      source : xcb_xfixes_region_t;
      bounds : xproto.xcb_rectangle_t;
      destination : xcb_xfixes_region_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1338
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_invert_region";

   function xcb_xfixes_translate_region_checked
     (c : access xcb.xcb_connection_t;
      region : xcb_xfixes_region_t;
      dx : bits_stdint_intn_h.int16_t;
      dy : bits_stdint_intn_h.int16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1355
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_translate_region_checked";

   function xcb_xfixes_translate_region
     (c : access xcb.xcb_connection_t;
      region : xcb_xfixes_region_t;
      dx : bits_stdint_intn_h.int16_t;
      dy : bits_stdint_intn_h.int16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1369
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_translate_region";

   function xcb_xfixes_region_extents_checked
     (c : access xcb.xcb_connection_t;
      source : xcb_xfixes_region_t;
      destination : xcb_xfixes_region_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1386
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_region_extents_checked";

   function xcb_xfixes_region_extents
     (c : access xcb.xcb_connection_t;
      source : xcb_xfixes_region_t;
      destination : xcb_xfixes_region_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1399
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_region_extents";

   function xcb_xfixes_fetch_region_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xfixes.h:1404
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_fetch_region_sizeof";

   function xcb_xfixes_fetch_region (c : access xcb.xcb_connection_t; region : xcb_xfixes_region_t) return xcb_xfixes_fetch_region_cookie_t  -- /usr/include/xcb/xfixes.h:1415
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_fetch_region";

   function xcb_xfixes_fetch_region_unchecked (c : access xcb.xcb_connection_t; region : xcb_xfixes_region_t) return xcb_xfixes_fetch_region_cookie_t  -- /usr/include/xcb/xfixes.h:1430
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_fetch_region_unchecked";

   function xcb_xfixes_fetch_region_rectangles (R : access constant xcb_xfixes_fetch_region_reply_t) return access xproto.xcb_rectangle_t  -- /usr/include/xcb/xfixes.h:1434
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_fetch_region_rectangles";

   function xcb_xfixes_fetch_region_rectangles_length (R : access constant xcb_xfixes_fetch_region_reply_t) return int  -- /usr/include/xcb/xfixes.h:1437
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_fetch_region_rectangles_length";

   function xcb_xfixes_fetch_region_rectangles_iterator (R : access constant xcb_xfixes_fetch_region_reply_t) return xproto.xcb_rectangle_iterator_t  -- /usr/include/xcb/xfixes.h:1440
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_fetch_region_rectangles_iterator";

   function xcb_xfixes_fetch_region_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_xfixes_fetch_region_cookie_t;
      e : System.Address) return access xcb_xfixes_fetch_region_reply_t  -- /usr/include/xcb/xfixes.h:1457
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_fetch_region_reply";

   function xcb_xfixes_set_gc_clip_region_checked
     (c : access xcb.xcb_connection_t;
      gc : xproto.xcb_gcontext_t;
      region : xcb_xfixes_region_t;
      x_origin : bits_stdint_intn_h.int16_t;
      y_origin : bits_stdint_intn_h.int16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1473
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_set_gc_clip_region_checked";

   function xcb_xfixes_set_gc_clip_region
     (c : access xcb.xcb_connection_t;
      gc : xproto.xcb_gcontext_t;
      region : xcb_xfixes_region_t;
      x_origin : bits_stdint_intn_h.int16_t;
      y_origin : bits_stdint_intn_h.int16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1488
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_set_gc_clip_region";

   function xcb_xfixes_set_window_shape_region_checked
     (c : access xcb.xcb_connection_t;
      dest : xproto.xcb_window_t;
      dest_kind : xcb_shape.xcb_shape_kind_t;
      x_offset : bits_stdint_intn_h.int16_t;
      y_offset : bits_stdint_intn_h.int16_t;
      region : xcb_xfixes_region_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1506
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_set_window_shape_region_checked";

   function xcb_xfixes_set_window_shape_region
     (c : access xcb.xcb_connection_t;
      dest : xproto.xcb_window_t;
      dest_kind : xcb_shape.xcb_shape_kind_t;
      x_offset : bits_stdint_intn_h.int16_t;
      y_offset : bits_stdint_intn_h.int16_t;
      region : xcb_xfixes_region_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1522
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_set_window_shape_region";

   function xcb_xfixes_set_picture_clip_region_checked
     (c : access xcb.xcb_connection_t;
      picture : xcb_render.xcb_render_picture_t;
      region : xcb_xfixes_region_t;
      x_origin : bits_stdint_intn_h.int16_t;
      y_origin : bits_stdint_intn_h.int16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1541
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_set_picture_clip_region_checked";

   function xcb_xfixes_set_picture_clip_region
     (c : access xcb.xcb_connection_t;
      picture : xcb_render.xcb_render_picture_t;
      region : xcb_xfixes_region_t;
      x_origin : bits_stdint_intn_h.int16_t;
      y_origin : bits_stdint_intn_h.int16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1556
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_set_picture_clip_region";

   function xcb_xfixes_set_cursor_name_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xfixes.h:1563
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_set_cursor_name_sizeof";

   function xcb_xfixes_set_cursor_name_checked
     (c : access xcb.xcb_connection_t;
      cursor : xproto.xcb_cursor_t;
      nbytes : bits_stdint_uintn_h.uint16_t;
      name : Interfaces.C.Strings.chars_ptr) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1577
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_set_cursor_name_checked";

   function xcb_xfixes_set_cursor_name
     (c : access xcb.xcb_connection_t;
      cursor : xproto.xcb_cursor_t;
      nbytes : bits_stdint_uintn_h.uint16_t;
      name : Interfaces.C.Strings.chars_ptr) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1591
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_set_cursor_name";

   function xcb_xfixes_set_cursor_name_name (R : access constant xcb_xfixes_set_cursor_name_request_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/xfixes.h:1597
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_set_cursor_name_name";

   function xcb_xfixes_set_cursor_name_name_length (R : access constant xcb_xfixes_set_cursor_name_request_t) return int  -- /usr/include/xcb/xfixes.h:1600
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_set_cursor_name_name_length";

   function xcb_xfixes_set_cursor_name_name_end (R : access constant xcb_xfixes_set_cursor_name_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xfixes.h:1603
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_set_cursor_name_name_end";

   function xcb_xfixes_get_cursor_name_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xfixes.h:1606
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_get_cursor_name_sizeof";

   function xcb_xfixes_get_cursor_name (c : access xcb.xcb_connection_t; cursor : xproto.xcb_cursor_t) return xcb_xfixes_get_cursor_name_cookie_t  -- /usr/include/xcb/xfixes.h:1617
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_get_cursor_name";

   function xcb_xfixes_get_cursor_name_unchecked (c : access xcb.xcb_connection_t; cursor : xproto.xcb_cursor_t) return xcb_xfixes_get_cursor_name_cookie_t  -- /usr/include/xcb/xfixes.h:1632
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_get_cursor_name_unchecked";

   function xcb_xfixes_get_cursor_name_name (R : access constant xcb_xfixes_get_cursor_name_reply_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/xfixes.h:1636
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_get_cursor_name_name";

   function xcb_xfixes_get_cursor_name_name_length (R : access constant xcb_xfixes_get_cursor_name_reply_t) return int  -- /usr/include/xcb/xfixes.h:1639
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_get_cursor_name_name_length";

   function xcb_xfixes_get_cursor_name_name_end (R : access constant xcb_xfixes_get_cursor_name_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xfixes.h:1642
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_get_cursor_name_name_end";

   function xcb_xfixes_get_cursor_name_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_xfixes_get_cursor_name_cookie_t;
      e : System.Address) return access xcb_xfixes_get_cursor_name_reply_t  -- /usr/include/xcb/xfixes.h:1659
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_get_cursor_name_reply";

   function xcb_xfixes_get_cursor_image_and_name_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xfixes.h:1664
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_get_cursor_image_and_name_sizeof";

   function xcb_xfixes_get_cursor_image_and_name (c : access xcb.xcb_connection_t) return xcb_xfixes_get_cursor_image_and_name_cookie_t  -- /usr/include/xcb/xfixes.h:1675
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_get_cursor_image_and_name";

   function xcb_xfixes_get_cursor_image_and_name_unchecked (c : access xcb.xcb_connection_t) return xcb_xfixes_get_cursor_image_and_name_cookie_t  -- /usr/include/xcb/xfixes.h:1689
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_get_cursor_image_and_name_unchecked";

   function xcb_xfixes_get_cursor_image_and_name_cursor_image (R : access constant xcb_xfixes_get_cursor_image_and_name_reply_t) return access bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/xfixes.h:1692
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_get_cursor_image_and_name_cursor_image";

   function xcb_xfixes_get_cursor_image_and_name_cursor_image_length (R : access constant xcb_xfixes_get_cursor_image_and_name_reply_t) return int  -- /usr/include/xcb/xfixes.h:1695
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_get_cursor_image_and_name_cursor_image_length";

   function xcb_xfixes_get_cursor_image_and_name_cursor_image_end (R : access constant xcb_xfixes_get_cursor_image_and_name_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xfixes.h:1698
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_get_cursor_image_and_name_cursor_image_end";

   function xcb_xfixes_get_cursor_image_and_name_name (R : access constant xcb_xfixes_get_cursor_image_and_name_reply_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/xfixes.h:1701
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_get_cursor_image_and_name_name";

   function xcb_xfixes_get_cursor_image_and_name_name_length (R : access constant xcb_xfixes_get_cursor_image_and_name_reply_t) return int  -- /usr/include/xcb/xfixes.h:1704
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_get_cursor_image_and_name_name_length";

   function xcb_xfixes_get_cursor_image_and_name_name_end (R : access constant xcb_xfixes_get_cursor_image_and_name_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xfixes.h:1707
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_get_cursor_image_and_name_name_end";

   function xcb_xfixes_get_cursor_image_and_name_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_xfixes_get_cursor_image_and_name_cookie_t;
      e : System.Address) return access xcb_xfixes_get_cursor_image_and_name_reply_t  -- /usr/include/xcb/xfixes.h:1724
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_get_cursor_image_and_name_reply";

   function xcb_xfixes_change_cursor_checked
     (c : access xcb.xcb_connection_t;
      source : xproto.xcb_cursor_t;
      destination : xproto.xcb_cursor_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1740
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_change_cursor_checked";

   function xcb_xfixes_change_cursor
     (c : access xcb.xcb_connection_t;
      source : xproto.xcb_cursor_t;
      destination : xproto.xcb_cursor_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1753
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_change_cursor";

   function xcb_xfixes_change_cursor_by_name_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xfixes.h:1758
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_change_cursor_by_name_sizeof";

   function xcb_xfixes_change_cursor_by_name_checked
     (c : access xcb.xcb_connection_t;
      src : xproto.xcb_cursor_t;
      nbytes : bits_stdint_uintn_h.uint16_t;
      name : Interfaces.C.Strings.chars_ptr) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1772
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_change_cursor_by_name_checked";

   function xcb_xfixes_change_cursor_by_name
     (c : access xcb.xcb_connection_t;
      src : xproto.xcb_cursor_t;
      nbytes : bits_stdint_uintn_h.uint16_t;
      name : Interfaces.C.Strings.chars_ptr) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1786
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_change_cursor_by_name";

   function xcb_xfixes_change_cursor_by_name_name (R : access constant xcb_xfixes_change_cursor_by_name_request_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/xfixes.h:1792
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_change_cursor_by_name_name";

   function xcb_xfixes_change_cursor_by_name_name_length (R : access constant xcb_xfixes_change_cursor_by_name_request_t) return int  -- /usr/include/xcb/xfixes.h:1795
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_change_cursor_by_name_name_length";

   function xcb_xfixes_change_cursor_by_name_name_end (R : access constant xcb_xfixes_change_cursor_by_name_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xfixes.h:1798
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_change_cursor_by_name_name_end";

   function xcb_xfixes_expand_region_checked
     (c : access xcb.xcb_connection_t;
      source : xcb_xfixes_region_t;
      destination : xcb_xfixes_region_t;
      left : bits_stdint_uintn_h.uint16_t;
      right : bits_stdint_uintn_h.uint16_t;
      top : bits_stdint_uintn_h.uint16_t;
      bottom : bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1812
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_expand_region_checked";

   function xcb_xfixes_expand_region
     (c : access xcb.xcb_connection_t;
      source : xcb_xfixes_region_t;
      destination : xcb_xfixes_region_t;
      left : bits_stdint_uintn_h.uint16_t;
      right : bits_stdint_uintn_h.uint16_t;
      top : bits_stdint_uintn_h.uint16_t;
      bottom : bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1829
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_expand_region";

   function xcb_xfixeside_cursor_checked (c : access xcb.xcb_connection_t; window : xproto.xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1849
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixeside_cursor_checked";

   function xcb_xfixeside_cursor (c : access xcb.xcb_connection_t; window : xproto.xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1861
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixeside_cursor";

   function xcb_xfixes_show_cursor_checked (c : access xcb.xcb_connection_t; window : xproto.xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1876
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_show_cursor_checked";

   function xcb_xfixes_show_cursor (c : access xcb.xcb_connection_t; window : xproto.xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1888
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_show_cursor";

   procedure xcb_xfixes_barrier_next (i : access xcb_xfixes_barrier_iterator_t)  -- /usr/include/xcb/xfixes.h:1900
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_barrier_next";

   function xcb_xfixes_barrier_end (i : xcb_xfixes_barrier_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xfixes.h:1912
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_barrier_end";

   function xcb_xfixes_create_pointer_barrier_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xfixes.h:1915
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_create_pointer_barrier_sizeof";

   function xcb_xfixes_create_pointer_barrier_checked
     (c : access xcb.xcb_connection_t;
      barrier : xcb_xfixes_barrier_t;
      window : xproto.xcb_window_t;
      x1 : bits_stdint_uintn_h.uint16_t;
      y1 : bits_stdint_uintn_h.uint16_t;
      x2 : bits_stdint_uintn_h.uint16_t;
      y2 : bits_stdint_uintn_h.uint16_t;
      directions : bits_stdint_uintn_h.uint32_t;
      num_devices : bits_stdint_uintn_h.uint16_t;
      devices : access bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1929
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_create_pointer_barrier_checked";

   function xcb_xfixes_create_pointer_barrier
     (c : access xcb.xcb_connection_t;
      barrier : xcb_xfixes_barrier_t;
      window : xproto.xcb_window_t;
      x1 : bits_stdint_uintn_h.uint16_t;
      y1 : bits_stdint_uintn_h.uint16_t;
      x2 : bits_stdint_uintn_h.uint16_t;
      y2 : bits_stdint_uintn_h.uint16_t;
      directions : bits_stdint_uintn_h.uint32_t;
      num_devices : bits_stdint_uintn_h.uint16_t;
      devices : access bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1949
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_create_pointer_barrier";

   function xcb_xfixes_create_pointer_barrier_devices (R : access constant xcb_xfixes_create_pointer_barrier_request_t) return access bits_stdint_uintn_h.uint16_t  -- /usr/include/xcb/xfixes.h:1961
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_create_pointer_barrier_devices";

   function xcb_xfixes_create_pointer_barrier_devices_length (R : access constant xcb_xfixes_create_pointer_barrier_request_t) return int  -- /usr/include/xcb/xfixes.h:1964
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_create_pointer_barrier_devices_length";

   function xcb_xfixes_create_pointer_barrier_devices_end (R : access constant xcb_xfixes_create_pointer_barrier_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xfixes.h:1967
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_create_pointer_barrier_devices_end";

   function xcb_xfixes_delete_pointer_barrier_checked (c : access xcb.xcb_connection_t; barrier : xcb_xfixes_barrier_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1981
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_delete_pointer_barrier_checked";

   function xcb_xfixes_delete_pointer_barrier (c : access xcb.xcb_connection_t; barrier : xcb_xfixes_barrier_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xfixes.h:1993
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xfixes_delete_pointer_barrier";

end xcb_xfixes;
