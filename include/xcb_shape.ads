pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with xcb;
with bits_stdint_uintn_h;
with xproto;
with bits_stdint_intn_h;
with System;

package xcb_shape is

   CONST_XCB_SHAPE_MAJOR_VERSION : constant := 1;  --  /usr/include/xcb/shape.h:22
   CONST_XCB_SHAPE_MINOR_VERSION : constant := 1;  --  /usr/include/xcb/shape.h:23

   CONST_XCB_SHAPE_NOTIFY : constant := 0;  --  /usr/include/xcb/shape.h:64

   CONST_XCB_SHAPE_QUERY_VERSION : constant := 0;  --  /usr/include/xcb/shape.h:91

   CONST_XCB_SHAPE_RECTANGLES : constant := 1;  --  /usr/include/xcb/shape.h:115

   CONST_XCB_SHAPE_MASK : constant := 2;  --  /usr/include/xcb/shape.h:134

   CONST_XCB_SHAPE_COMBINE : constant := 3;  --  /usr/include/xcb/shape.h:153

   CONST_XCB_SHAPE_OFFSET : constant := 4;  --  /usr/include/xcb/shape.h:173

   CONST_XCB_SHAPE_QUERY_EXTENTS : constant := 5;  --  /usr/include/xcb/shape.h:197

   CONST_XCB_SHAPE_SELECT_INPUT : constant := 6;  --  /usr/include/xcb/shape.h:231

   CONST_XCB_SHAPE_INPUT_SELECTED : constant := 7;  --  /usr/include/xcb/shape.h:253

   CONST_XCB_SHAPE_GET_RECTANGLES : constant := 8;  --  /usr/include/xcb/shape.h:283

   xcb_shape_id : aliased xcb.xcb_extension_t  -- /usr/include/xcb/shape.h:25
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_id";

   subtype xcb_shape_op_t is bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:27

   type xcb_shape_op_iterator_t is record
      data : access xcb_shape_op_t;  -- /usr/include/xcb/shape.h:33
      c_rem : aliased int;  -- /usr/include/xcb/shape.h:34
      index : aliased int;  -- /usr/include/xcb/shape.h:35
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/shape.h:32

   subtype xcb_shape_kind_t is bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:38

   type xcb_shape_kind_iterator_t is record
      data : access xcb_shape_kind_t;  -- /usr/include/xcb/shape.h:44
      c_rem : aliased int;  -- /usr/include/xcb/shape.h:45
      index : aliased int;  -- /usr/include/xcb/shape.h:46
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/shape.h:43

   type xcb_shape_so_t is 
     (XCB_SHAPE_SO_SET,
      XCB_SHAPE_SO_UNION,
      XCB_SHAPE_SO_INTERSECT,
      XCB_SHAPE_SO_SUBTRACT,
      XCB_SHAPE_SO_INVERT)
   with Convention => C;  -- /usr/include/xcb/shape.h:49

   type xcb_shape_sk_t is 
     (XCB_SHAPE_SK_BOUNDING,
      XCB_SHAPE_SK_CLIP,
      XCB_SHAPE_SK_INPUT)
   with Convention => C;  -- /usr/include/xcb/shape.h:57

   type xcb_shape_notify_event_t_array5030 is array (0 .. 10) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_shape_notify_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:70
      shape_kind : aliased xcb_shape_kind_t;  -- /usr/include/xcb/shape.h:71
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/shape.h:72
      affected_window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/shape.h:73
      extents_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/shape.h:74
      extents_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/shape.h:75
      extents_width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/shape.h:76
      extents_height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/shape.h:77
      server_time : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/shape.h:78
      shaped : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:79
      pad0 : aliased xcb_shape_notify_event_t_array5030;  -- /usr/include/xcb/shape.h:80
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/shape.h:69

   type xcb_shape_query_version_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/shape.h:87
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/shape.h:86

   type xcb_shape_query_version_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:97
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:98
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/shape.h:99
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/shape.h:96

   type xcb_shape_query_version_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:106
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:107
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/shape.h:108
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/shape.h:109
      major_version : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/shape.h:110
      minor_version : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/shape.h:111
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/shape.h:105

   type xcb_shape_rectangles_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:121
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:122
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/shape.h:123
      operation : aliased xcb_shape_op_t;  -- /usr/include/xcb/shape.h:124
      destination_kind : aliased xcb_shape_kind_t;  -- /usr/include/xcb/shape.h:125
      ordering : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:126
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:127
      destination_window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/shape.h:128
      x_offset : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/shape.h:129
      y_offset : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/shape.h:130
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/shape.h:120

   type xcb_shape_mask_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_shape_mask_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:140
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:141
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/shape.h:142
      operation : aliased xcb_shape_op_t;  -- /usr/include/xcb/shape.h:143
      destination_kind : aliased xcb_shape_kind_t;  -- /usr/include/xcb/shape.h:144
      pad0 : aliased xcb_shape_mask_request_t_array1823;  -- /usr/include/xcb/shape.h:145
      destination_window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/shape.h:146
      x_offset : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/shape.h:147
      y_offset : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/shape.h:148
      source_bitmap : aliased xproto.xcb_pixmap_t;  -- /usr/include/xcb/shape.h:149
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/shape.h:139

   type xcb_shape_combine_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:159
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:160
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/shape.h:161
      operation : aliased xcb_shape_op_t;  -- /usr/include/xcb/shape.h:162
      destination_kind : aliased xcb_shape_kind_t;  -- /usr/include/xcb/shape.h:163
      source_kind : aliased xcb_shape_kind_t;  -- /usr/include/xcb/shape.h:164
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:165
      destination_window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/shape.h:166
      x_offset : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/shape.h:167
      y_offset : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/shape.h:168
      source_window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/shape.h:169
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/shape.h:158

   type xcb_shape_offset_request_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_shape_offset_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:179
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:180
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/shape.h:181
      destination_kind : aliased xcb_shape_kind_t;  -- /usr/include/xcb/shape.h:182
      pad0 : aliased xcb_shape_offset_request_t_array1897;  -- /usr/include/xcb/shape.h:183
      destination_window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/shape.h:184
      x_offset : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/shape.h:185
      y_offset : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/shape.h:186
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/shape.h:178

   type xcb_shape_query_extents_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/shape.h:193
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/shape.h:192

   type xcb_shape_query_extents_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:203
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:204
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/shape.h:205
      destination_window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/shape.h:206
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/shape.h:202

   type xcb_shape_query_extents_reply_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_shape_query_extents_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:213
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:214
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/shape.h:215
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/shape.h:216
      bounding_shaped : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:217
      clip_shaped : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:218
      pad1 : aliased xcb_shape_query_extents_reply_t_array1823;  -- /usr/include/xcb/shape.h:219
      bounding_shape_extents_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/shape.h:220
      bounding_shape_extents_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/shape.h:221
      bounding_shape_extents_width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/shape.h:222
      bounding_shape_extents_height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/shape.h:223
      clip_shape_extents_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/shape.h:224
      clip_shape_extents_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/shape.h:225
      clip_shape_extents_width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/shape.h:226
      clip_shape_extents_height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/shape.h:227
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/shape.h:212

   type xcb_shape_select_input_request_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_shape_select_input_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:237
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:238
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/shape.h:239
      destination_window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/shape.h:240
      enable : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:241
      pad0 : aliased xcb_shape_select_input_request_t_array1897;  -- /usr/include/xcb/shape.h:242
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/shape.h:236

   type xcb_shape_input_selected_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/shape.h:249
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/shape.h:248

   type xcb_shape_input_selected_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:259
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:260
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/shape.h:261
      destination_window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/shape.h:262
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/shape.h:258

   type xcb_shape_input_selected_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:269
      enabled : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:270
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/shape.h:271
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/shape.h:272
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/shape.h:268

   type xcb_shape_get_rectangles_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/shape.h:279
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/shape.h:278

   type xcb_shape_get_rectangles_request_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_shape_get_rectangles_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:289
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:290
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/shape.h:291
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/shape.h:292
      source_kind : aliased xcb_shape_kind_t;  -- /usr/include/xcb/shape.h:293
      pad0 : aliased xcb_shape_get_rectangles_request_t_array1897;  -- /usr/include/xcb/shape.h:294
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/shape.h:288

   type xcb_shape_get_rectangles_reply_t_array1992 is array (0 .. 19) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_shape_get_rectangles_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:301
      ordering : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/shape.h:302
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/shape.h:303
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/shape.h:304
      rectangles_len : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/shape.h:305
      pad0 : aliased xcb_shape_get_rectangles_reply_t_array1992;  -- /usr/include/xcb/shape.h:306
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/shape.h:300

   procedure xcb_shape_op_next (i : access xcb_shape_op_iterator_t)  -- /usr/include/xcb/shape.h:318
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_op_next";

   function xcb_shape_op_end (i : xcb_shape_op_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/shape.h:330
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_op_end";

   procedure xcb_shape_kind_next (i : access xcb_shape_kind_iterator_t)  -- /usr/include/xcb/shape.h:341
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_kind_next";

   function xcb_shape_kind_end (i : xcb_shape_kind_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/shape.h:353
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_kind_end";

   function xcb_shape_query_version (c : access xcb.xcb_connection_t) return xcb_shape_query_version_cookie_t  -- /usr/include/xcb/shape.h:364
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_query_version";

   function xcb_shape_query_version_unchecked (c : access xcb.xcb_connection_t) return xcb_shape_query_version_cookie_t  -- /usr/include/xcb/shape.h:378
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_query_version_unchecked";

   function xcb_shape_query_version_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_shape_query_version_cookie_t;
      e : System.Address) return access xcb_shape_query_version_reply_t  -- /usr/include/xcb/shape.h:395
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_query_version_reply";

   function xcb_shape_rectangles_sizeof (u_buffer : System.Address; rectangles_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/shape.h:400
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_rectangles_sizeof";

   function xcb_shape_rectangles_checked
     (c : access xcb.xcb_connection_t;
      operation : xcb_shape_op_t;
      destination_kind : xcb_shape_kind_t;
      ordering : bits_stdint_uintn_h.uint8_t;
      destination_window : xproto.xcb_window_t;
      x_offset : bits_stdint_intn_h.int16_t;
      y_offset : bits_stdint_intn_h.int16_t;
      rectangles_len : bits_stdint_uintn_h.uint32_t;
      rectangles : access constant xproto.xcb_rectangle_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/shape.h:415
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_rectangles_checked";

   function xcb_shape_rectangles
     (c : access xcb.xcb_connection_t;
      operation : xcb_shape_op_t;
      destination_kind : xcb_shape_kind_t;
      ordering : bits_stdint_uintn_h.uint8_t;
      destination_window : xproto.xcb_window_t;
      x_offset : bits_stdint_intn_h.int16_t;
      y_offset : bits_stdint_intn_h.int16_t;
      rectangles_len : bits_stdint_uintn_h.uint32_t;
      rectangles : access constant xproto.xcb_rectangle_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/shape.h:434
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_rectangles";

   function xcb_shape_rectangles_rectangles (R : access constant xcb_shape_rectangles_request_t) return access xproto.xcb_rectangle_t  -- /usr/include/xcb/shape.h:445
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_rectangles_rectangles";

   function xcb_shape_rectangles_rectangles_length (R : access constant xcb_shape_rectangles_request_t) return int  -- /usr/include/xcb/shape.h:448
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_rectangles_rectangles_length";

   function xcb_shape_rectangles_rectangles_iterator (R : access constant xcb_shape_rectangles_request_t) return xproto.xcb_rectangle_iterator_t  -- /usr/include/xcb/shape.h:451
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_rectangles_rectangles_iterator";

   function xcb_shape_mask_checked
     (c : access xcb.xcb_connection_t;
      operation : xcb_shape_op_t;
      destination_kind : xcb_shape_kind_t;
      destination_window : xproto.xcb_window_t;
      x_offset : bits_stdint_intn_h.int16_t;
      y_offset : bits_stdint_intn_h.int16_t;
      source_bitmap : xproto.xcb_pixmap_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/shape.h:465
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_mask_checked";

   function xcb_shape_mask
     (c : access xcb.xcb_connection_t;
      operation : xcb_shape_op_t;
      destination_kind : xcb_shape_kind_t;
      destination_window : xproto.xcb_window_t;
      x_offset : bits_stdint_intn_h.int16_t;
      y_offset : bits_stdint_intn_h.int16_t;
      source_bitmap : xproto.xcb_pixmap_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/shape.h:482
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_mask";

   function xcb_shape_combine_checked
     (c : access xcb.xcb_connection_t;
      operation : xcb_shape_op_t;
      destination_kind : xcb_shape_kind_t;
      source_kind : xcb_shape_kind_t;
      destination_window : xproto.xcb_window_t;
      x_offset : bits_stdint_intn_h.int16_t;
      y_offset : bits_stdint_intn_h.int16_t;
      source_window : xproto.xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/shape.h:502
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_combine_checked";

   function xcb_shape_combine
     (c : access xcb.xcb_connection_t;
      operation : xcb_shape_op_t;
      destination_kind : xcb_shape_kind_t;
      source_kind : xcb_shape_kind_t;
      destination_window : xproto.xcb_window_t;
      x_offset : bits_stdint_intn_h.int16_t;
      y_offset : bits_stdint_intn_h.int16_t;
      source_window : xproto.xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/shape.h:520
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_combine";

   function xcb_shape_offset_checked
     (c : access xcb.xcb_connection_t;
      destination_kind : xcb_shape_kind_t;
      destination_window : xproto.xcb_window_t;
      x_offset : bits_stdint_intn_h.int16_t;
      y_offset : bits_stdint_intn_h.int16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/shape.h:541
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_offset_checked";

   function xcb_shape_offset
     (c : access xcb.xcb_connection_t;
      destination_kind : xcb_shape_kind_t;
      destination_window : xproto.xcb_window_t;
      x_offset : bits_stdint_intn_h.int16_t;
      y_offset : bits_stdint_intn_h.int16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/shape.h:556
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_offset";

   function xcb_shape_query_extents (c : access xcb.xcb_connection_t; destination_window : xproto.xcb_window_t) return xcb_shape_query_extents_cookie_t  -- /usr/include/xcb/shape.h:571
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_query_extents";

   function xcb_shape_query_extents_unchecked (c : access xcb.xcb_connection_t; destination_window : xproto.xcb_window_t) return xcb_shape_query_extents_cookie_t  -- /usr/include/xcb/shape.h:586
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_query_extents_unchecked";

   function xcb_shape_query_extents_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_shape_query_extents_cookie_t;
      e : System.Address) return access xcb_shape_query_extents_reply_t  -- /usr/include/xcb/shape.h:604
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_query_extents_reply";

   function xcb_shape_select_input_checked
     (c : access xcb.xcb_connection_t;
      destination_window : xproto.xcb_window_t;
      enable : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/shape.h:620
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_select_input_checked";

   function xcb_shape_select_input
     (c : access xcb.xcb_connection_t;
      destination_window : xproto.xcb_window_t;
      enable : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/shape.h:633
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_select_input";

   function xcb_shape_input_selected (c : access xcb.xcb_connection_t; destination_window : xproto.xcb_window_t) return xcb_shape_input_selected_cookie_t  -- /usr/include/xcb/shape.h:646
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_input_selected";

   function xcb_shape_input_selected_unchecked (c : access xcb.xcb_connection_t; destination_window : xproto.xcb_window_t) return xcb_shape_input_selected_cookie_t  -- /usr/include/xcb/shape.h:661
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_input_selected_unchecked";

   function xcb_shape_input_selected_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_shape_input_selected_cookie_t;
      e : System.Address) return access xcb_shape_input_selected_reply_t  -- /usr/include/xcb/shape.h:679
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_input_selected_reply";

   function xcb_shape_get_rectangles_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/shape.h:684
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_get_rectangles_sizeof";

   function xcb_shape_get_rectangles
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      source_kind : xcb_shape_kind_t) return xcb_shape_get_rectangles_cookie_t  -- /usr/include/xcb/shape.h:695
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_get_rectangles";

   function xcb_shape_get_rectangles_unchecked
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      source_kind : xcb_shape_kind_t) return xcb_shape_get_rectangles_cookie_t  -- /usr/include/xcb/shape.h:711
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_get_rectangles_unchecked";

   function xcb_shape_get_rectangles_rectangles (R : access constant xcb_shape_get_rectangles_reply_t) return access xproto.xcb_rectangle_t  -- /usr/include/xcb/shape.h:716
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_get_rectangles_rectangles";

   function xcb_shape_get_rectangles_rectangles_length (R : access constant xcb_shape_get_rectangles_reply_t) return int  -- /usr/include/xcb/shape.h:719
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_get_rectangles_rectangles_length";

   function xcb_shape_get_rectangles_rectangles_iterator (R : access constant xcb_shape_get_rectangles_reply_t) return xproto.xcb_rectangle_iterator_t  -- /usr/include/xcb/shape.h:722
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_get_rectangles_rectangles_iterator";

   function xcb_shape_get_rectangles_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_shape_get_rectangles_cookie_t;
      e : System.Address) return access xcb_shape_get_rectangles_reply_t  -- /usr/include/xcb/shape.h:739
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_shape_get_rectangles_reply";

end xcb_shape;
