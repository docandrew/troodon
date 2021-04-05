pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with xcb;
with bits_stdint_intn_h;
with bits_stdint_uintn_h;
with xproto;
with System;

package xcb_xinerama is

   XCB_XINERAMA_MAJOR_VERSION : constant := 1;  --  /usr/include/xcb/xinerama.h:22
   XCB_XINERAMA_MINOR_VERSION : constant := 1;  --  /usr/include/xcb/xinerama.h:23

   XCB_XINERAMA_QUERY_VERSION : constant := 0;  --  /usr/include/xcb/xinerama.h:54

   XCB_XINERAMA_GET_STATE : constant := 1;  --  /usr/include/xcb/xinerama.h:87

   XCB_XINERAMA_GET_SCREEN_COUNT : constant := 2;  --  /usr/include/xcb/xinerama.h:118

   XCB_XINERAMA_GET_SCREEN_SIZE : constant := 3;  --  /usr/include/xcb/xinerama.h:149

   XCB_XINERAMA_IS_ACTIVE : constant := 4;  --  /usr/include/xcb/xinerama.h:184

   XCB_XINERAMA_QUERY_SCREENS : constant := 5;  --  /usr/include/xcb/xinerama.h:214

   xcb_xinerama_id : aliased xcb.xcb_extension_t  -- /usr/include/xcb/xinerama.h:25
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xinerama_id";

   type xcb_xinerama_screen_info_t is record
      x_org : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xinerama.h:31
      y_org : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/xinerama.h:32
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xinerama.h:33
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xinerama.h:34
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xinerama.h:30

   type xcb_xinerama_screen_info_iterator_t is record
      data : access xcb_xinerama_screen_info_t;  -- /usr/include/xcb/xinerama.h:41
      c_rem : aliased int;  -- /usr/include/xcb/xinerama.h:42
      index : aliased int;  -- /usr/include/xcb/xinerama.h:43
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xinerama.h:40

   type xcb_xinerama_query_version_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xinerama.h:50
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xinerama.h:49

   type xcb_xinerama_query_version_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xinerama.h:60
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xinerama.h:61
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xinerama.h:62
      major : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xinerama.h:63
      minor : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xinerama.h:64
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xinerama.h:59

   type xcb_xinerama_query_version_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xinerama.h:71
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xinerama.h:72
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xinerama.h:73
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xinerama.h:74
      major : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xinerama.h:75
      minor : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xinerama.h:76
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xinerama.h:70

   type xcb_xinerama_get_state_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xinerama.h:83
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xinerama.h:82

   type xcb_xinerama_get_state_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xinerama.h:93
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xinerama.h:94
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xinerama.h:95
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/xinerama.h:96
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xinerama.h:92

   type xcb_xinerama_get_state_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xinerama.h:103
      state : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xinerama.h:104
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xinerama.h:105
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xinerama.h:106
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/xinerama.h:107
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xinerama.h:102

   type xcb_xinerama_get_screen_count_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xinerama.h:114
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xinerama.h:113

   type xcb_xinerama_get_screen_count_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xinerama.h:124
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xinerama.h:125
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xinerama.h:126
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/xinerama.h:127
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xinerama.h:123

   type xcb_xinerama_get_screen_count_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xinerama.h:134
      screen_count : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xinerama.h:135
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xinerama.h:136
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xinerama.h:137
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/xinerama.h:138
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xinerama.h:133

   type xcb_xinerama_get_screen_size_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xinerama.h:145
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xinerama.h:144

   type xcb_xinerama_get_screen_size_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xinerama.h:155
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xinerama.h:156
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xinerama.h:157
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/xinerama.h:158
      screen : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xinerama.h:159
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xinerama.h:154

   type xcb_xinerama_get_screen_size_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xinerama.h:166
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xinerama.h:167
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xinerama.h:168
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xinerama.h:169
      width : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xinerama.h:170
      height : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xinerama.h:171
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/xinerama.h:172
      screen : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xinerama.h:173
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xinerama.h:165

   type xcb_xinerama_is_active_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xinerama.h:180
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xinerama.h:179

   type xcb_xinerama_is_active_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xinerama.h:190
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xinerama.h:191
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xinerama.h:192
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xinerama.h:189

   type xcb_xinerama_is_active_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xinerama.h:199
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xinerama.h:200
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xinerama.h:201
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xinerama.h:202
      state : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xinerama.h:203
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xinerama.h:198

   type xcb_xinerama_query_screens_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xinerama.h:210
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xinerama.h:209

   type xcb_xinerama_query_screens_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xinerama.h:220
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xinerama.h:221
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xinerama.h:222
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xinerama.h:219

   type xcb_xinerama_query_screens_reply_t_array1992 is array (0 .. 19) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_xinerama_query_screens_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xinerama.h:229
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xinerama.h:230
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xinerama.h:231
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xinerama.h:232
      number : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xinerama.h:233
      pad1 : aliased xcb_xinerama_query_screens_reply_t_array1992;  -- /usr/include/xcb/xinerama.h:234
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xinerama.h:228

   procedure xcb_xinerama_screen_info_next (i : access xcb_xinerama_screen_info_iterator_t)  -- /usr/include/xcb/xinerama.h:246
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xinerama_screen_info_next";

   function xcb_xinerama_screen_info_end (i : xcb_xinerama_screen_info_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/xinerama.h:258
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xinerama_screen_info_end";

   function xcb_xinerama_query_version
     (c : access xcb.xcb_connection_t;
      major : bits_stdint_uintn_h.uint8_t;
      minor : bits_stdint_uintn_h.uint8_t) return xcb_xinerama_query_version_cookie_t  -- /usr/include/xcb/xinerama.h:269
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xinerama_query_version";

   function xcb_xinerama_query_version_unchecked
     (c : access xcb.xcb_connection_t;
      major : bits_stdint_uintn_h.uint8_t;
      minor : bits_stdint_uintn_h.uint8_t) return xcb_xinerama_query_version_cookie_t  -- /usr/include/xcb/xinerama.h:285
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xinerama_query_version_unchecked";

   function xcb_xinerama_query_version_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_xinerama_query_version_cookie_t;
      e : System.Address) return access xcb_xinerama_query_version_reply_t  -- /usr/include/xcb/xinerama.h:304
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xinerama_query_version_reply";

   function xcb_xinerama_get_state (c : access xcb.xcb_connection_t; window : xproto.xcb_window_t) return xcb_xinerama_get_state_cookie_t  -- /usr/include/xcb/xinerama.h:317
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xinerama_get_state";

   function xcb_xinerama_get_state_unchecked (c : access xcb.xcb_connection_t; window : xproto.xcb_window_t) return xcb_xinerama_get_state_cookie_t  -- /usr/include/xcb/xinerama.h:332
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xinerama_get_state_unchecked";

   function xcb_xinerama_get_state_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_xinerama_get_state_cookie_t;
      e : System.Address) return access xcb_xinerama_get_state_reply_t  -- /usr/include/xcb/xinerama.h:350
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xinerama_get_state_reply";

   function xcb_xinerama_get_screen_count (c : access xcb.xcb_connection_t; window : xproto.xcb_window_t) return xcb_xinerama_get_screen_count_cookie_t  -- /usr/include/xcb/xinerama.h:363
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xinerama_get_screen_count";

   function xcb_xinerama_get_screen_count_unchecked (c : access xcb.xcb_connection_t; window : xproto.xcb_window_t) return xcb_xinerama_get_screen_count_cookie_t  -- /usr/include/xcb/xinerama.h:378
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xinerama_get_screen_count_unchecked";

   function xcb_xinerama_get_screen_count_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_xinerama_get_screen_count_cookie_t;
      e : System.Address) return access xcb_xinerama_get_screen_count_reply_t  -- /usr/include/xcb/xinerama.h:396
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xinerama_get_screen_count_reply";

   function xcb_xinerama_get_screen_size
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      screen : bits_stdint_uintn_h.uint32_t) return xcb_xinerama_get_screen_size_cookie_t  -- /usr/include/xcb/xinerama.h:409
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xinerama_get_screen_size";

   function xcb_xinerama_get_screen_size_unchecked
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      screen : bits_stdint_uintn_h.uint32_t) return xcb_xinerama_get_screen_size_cookie_t  -- /usr/include/xcb/xinerama.h:425
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xinerama_get_screen_size_unchecked";

   function xcb_xinerama_get_screen_size_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_xinerama_get_screen_size_cookie_t;
      e : System.Address) return access xcb_xinerama_get_screen_size_reply_t  -- /usr/include/xcb/xinerama.h:444
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xinerama_get_screen_size_reply";

   function xcb_xinerama_is_active (c : access xcb.xcb_connection_t) return xcb_xinerama_is_active_cookie_t  -- /usr/include/xcb/xinerama.h:457
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xinerama_is_active";

   function xcb_xinerama_is_active_unchecked (c : access xcb.xcb_connection_t) return xcb_xinerama_is_active_cookie_t  -- /usr/include/xcb/xinerama.h:471
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xinerama_is_active_unchecked";

   function xcb_xinerama_is_active_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_xinerama_is_active_cookie_t;
      e : System.Address) return access xcb_xinerama_is_active_reply_t  -- /usr/include/xcb/xinerama.h:488
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xinerama_is_active_reply";

   function xcb_xinerama_query_screens_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/xinerama.h:493
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xinerama_query_screens_sizeof";

   function xcb_xinerama_query_screens (c : access xcb.xcb_connection_t) return xcb_xinerama_query_screens_cookie_t  -- /usr/include/xcb/xinerama.h:504
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xinerama_query_screens";

   function xcb_xinerama_query_screens_unchecked (c : access xcb.xcb_connection_t) return xcb_xinerama_query_screens_cookie_t  -- /usr/include/xcb/xinerama.h:518
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xinerama_query_screens_unchecked";

   function xcb_xinerama_query_screens_screen_info (R : access constant xcb_xinerama_query_screens_reply_t) return access xcb_xinerama_screen_info_t  -- /usr/include/xcb/xinerama.h:521
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xinerama_query_screens_screen_info";

   function xcb_xinerama_query_screens_screen_info_length (R : access constant xcb_xinerama_query_screens_reply_t) return int  -- /usr/include/xcb/xinerama.h:524
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xinerama_query_screens_screen_info_length";

   function xcb_xinerama_query_screens_screen_info_iterator (R : access constant xcb_xinerama_query_screens_reply_t) return xcb_xinerama_screen_info_iterator_t  -- /usr/include/xcb/xinerama.h:527
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xinerama_query_screens_screen_info_iterator";

   function xcb_xinerama_query_screens_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_xinerama_query_screens_cookie_t;
      e : System.Address) return access xcb_xinerama_query_screens_reply_t  -- /usr/include/xcb/xinerama.h:544
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_xinerama_query_screens_reply";

end xcb_xinerama;
