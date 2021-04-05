pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with xcb;
with bits_stdint_uintn_h;
with xproto;
with xcb_xfixes;
with System;

package xcb_composite is

   CONST_XCB_COMPOSITE_MAJOR_VERSION : constant := 0;  --  /usr/include/xcb/composite.h:23
   CONST_XCB_COMPOSITE_MINOR_VERSION : constant := 4;  --  /usr/include/xcb/composite.h:24

   CONST_XCB_COMPOSITE_QUERY_VERSION : constant := 0;  --  /usr/include/xcb/composite.h:41

   CONST_XCB_COMPOSITE_REDIRECT_WINDOW : constant := 1;  --  /usr/include/xcb/composite.h:68

   CONST_XCB_COMPOSITE_REDIRECT_SUBWINDOWS : constant := 2;  --  /usr/include/xcb/composite.h:83

   CONST_XCB_COMPOSITE_UNREDIRECT_WINDOW : constant := 3;  --  /usr/include/xcb/composite.h:98

   CONST_XCB_COMPOSITE_UNREDIRECT_SUBWINDOWS : constant := 4;  --  /usr/include/xcb/composite.h:113

   CONST_XCB_COMPOSITE_CREATE_REGION_FROM_BORDER_CLIP : constant := 5;  --  /usr/include/xcb/composite.h:128

   CONST_XCB_COMPOSITE_NAME_WINDOW_PIXMAP : constant := 6;  --  /usr/include/xcb/composite.h:142

   CONST_XCB_COMPOSITE_GET_OVERLAY_WINDOW : constant := 7;  --  /usr/include/xcb/composite.h:163

   CONST_XCB_COMPOSITE_RELEASE_OVERLAY_WINDOW : constant := 8;  --  /usr/include/xcb/composite.h:188

   xcb_composite_id : aliased xcb.xcb_extension_t  -- /usr/include/xcb/composite.h:26
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_composite_id";

   type xcb_composite_redirect_t is 
     (XCB_COMPOSITE_REDIRECT_AUTOMATIC,
      XCB_COMPOSITE_REDIRECT_MANUAL)
   with Convention => C;  -- /usr/include/xcb/composite.h:28

   type xcb_composite_query_version_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/composite.h:37
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/composite.h:36

   type xcb_composite_query_version_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/composite.h:47
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/composite.h:48
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/composite.h:49
      client_major_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/composite.h:50
      client_minor_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/composite.h:51
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/composite.h:46

   type xcb_composite_query_version_reply_t_array4353 is array (0 .. 15) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_composite_query_version_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/composite.h:58
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/composite.h:59
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/composite.h:60
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/composite.h:61
      major_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/composite.h:62
      minor_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/composite.h:63
      pad1 : aliased xcb_composite_query_version_reply_t_array4353;  -- /usr/include/xcb/composite.h:64
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/composite.h:57

   type xcb_composite_redirect_window_request_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_composite_redirect_window_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/composite.h:74
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/composite.h:75
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/composite.h:76
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/composite.h:77
      update : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/composite.h:78
      pad0 : aliased xcb_composite_redirect_window_request_t_array1897;  -- /usr/include/xcb/composite.h:79
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/composite.h:73

   type xcb_composite_redirect_subwindows_request_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_composite_redirect_subwindows_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/composite.h:89
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/composite.h:90
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/composite.h:91
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/composite.h:92
      update : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/composite.h:93
      pad0 : aliased xcb_composite_redirect_subwindows_request_t_array1897;  -- /usr/include/xcb/composite.h:94
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/composite.h:88

   type xcb_composite_unredirect_window_request_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_composite_unredirect_window_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/composite.h:104
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/composite.h:105
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/composite.h:106
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/composite.h:107
      update : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/composite.h:108
      pad0 : aliased xcb_composite_unredirect_window_request_t_array1897;  -- /usr/include/xcb/composite.h:109
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/composite.h:103

   type xcb_composite_unredirect_subwindows_request_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_composite_unredirect_subwindows_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/composite.h:119
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/composite.h:120
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/composite.h:121
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/composite.h:122
      update : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/composite.h:123
      pad0 : aliased xcb_composite_unredirect_subwindows_request_t_array1897;  -- /usr/include/xcb/composite.h:124
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/composite.h:118

   type xcb_composite_create_region_from_border_clip_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/composite.h:134
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/composite.h:135
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/composite.h:136
      region : aliased xcb_xfixes.xcb_xfixes_region_t;  -- /usr/include/xcb/composite.h:137
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/composite.h:138
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/composite.h:133

   type xcb_composite_name_window_pixmap_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/composite.h:148
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/composite.h:149
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/composite.h:150
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/composite.h:151
      pixmap : aliased xproto.xcb_pixmap_t;  -- /usr/include/xcb/composite.h:152
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/composite.h:147

   type xcb_composite_get_overlay_window_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/composite.h:159
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/composite.h:158

   type xcb_composite_get_overlay_window_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/composite.h:169
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/composite.h:170
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/composite.h:171
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/composite.h:172
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/composite.h:168

   type xcb_composite_get_overlay_window_reply_t_array1992 is array (0 .. 19) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_composite_get_overlay_window_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/composite.h:179
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/composite.h:180
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/composite.h:181
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/composite.h:182
      overlay_win : aliased xproto.xcb_window_t;  -- /usr/include/xcb/composite.h:183
      pad1 : aliased xcb_composite_get_overlay_window_reply_t_array1992;  -- /usr/include/xcb/composite.h:184
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/composite.h:178

   type xcb_composite_release_overlay_window_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/composite.h:194
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/composite.h:195
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/composite.h:196
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/composite.h:197
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/composite.h:193

   function xcb_composite_query_version
     (c : access xcb.xcb_connection_t;
      client_major_version : bits_stdint_uintn_h.uint32_t;
      client_minor_version : bits_stdint_uintn_h.uint32_t) return xcb_composite_query_version_cookie_t  -- /usr/include/xcb/composite.h:209
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_composite_query_version";

   function xcb_composite_query_version_unchecked
     (c : access xcb.xcb_connection_t;
      client_major_version : bits_stdint_uintn_h.uint32_t;
      client_minor_version : bits_stdint_uintn_h.uint32_t) return xcb_composite_query_version_cookie_t  -- /usr/include/xcb/composite.h:225
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_composite_query_version_unchecked";

   function xcb_composite_query_version_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_composite_query_version_cookie_t;
      e : System.Address) return access xcb_composite_query_version_reply_t  -- /usr/include/xcb/composite.h:244
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_composite_query_version_reply";

   function xcb_composite_redirect_window_checked
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      update : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/composite.h:260
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_composite_redirect_window_checked";

   function xcb_composite_redirect_window
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      update : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/composite.h:273
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_composite_redirect_window";

   function xcb_composite_redirect_subwindows_checked
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      update : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/composite.h:289
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_composite_redirect_subwindows_checked";

   function xcb_composite_redirect_subwindows
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      update : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/composite.h:302
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_composite_redirect_subwindows";

   function xcb_composite_unredirect_window_checked
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      update : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/composite.h:318
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_composite_unredirect_window_checked";

   function xcb_composite_unredirect_window
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      update : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/composite.h:331
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_composite_unredirect_window";

   function xcb_composite_unredirect_subwindows_checked
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      update : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/composite.h:347
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_composite_unredirect_subwindows_checked";

   function xcb_composite_unredirect_subwindows
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      update : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/composite.h:360
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_composite_unredirect_subwindows";

   function xcb_composite_create_region_from_border_clip_checked
     (c : access xcb.xcb_connection_t;
      region : xcb_xfixes.xcb_xfixes_region_t;
      window : xproto.xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/composite.h:376
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_composite_create_region_from_border_clip_checked";

   function xcb_composite_create_region_from_border_clip
     (c : access xcb.xcb_connection_t;
      region : xcb_xfixes.xcb_xfixes_region_t;
      window : xproto.xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/composite.h:389
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_composite_create_region_from_border_clip";

   function xcb_composite_name_window_pixmap_checked
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      pixmap : xproto.xcb_pixmap_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/composite.h:405
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_composite_name_window_pixmap_checked";

   function xcb_composite_name_window_pixmap
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      pixmap : xproto.xcb_pixmap_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/composite.h:418
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_composite_name_window_pixmap";

   function xcb_composite_get_overlay_window (c : access xcb.xcb_connection_t; window : xproto.xcb_window_t) return xcb_composite_get_overlay_window_cookie_t  -- /usr/include/xcb/composite.h:431
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_composite_get_overlay_window";

   function xcb_composite_get_overlay_window_unchecked (c : access xcb.xcb_connection_t; window : xproto.xcb_window_t) return xcb_composite_get_overlay_window_cookie_t  -- /usr/include/xcb/composite.h:446
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_composite_get_overlay_window_unchecked";

   function xcb_composite_get_overlay_window_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_composite_get_overlay_window_cookie_t;
      e : System.Address) return access xcb_composite_get_overlay_window_reply_t  -- /usr/include/xcb/composite.h:464
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_composite_get_overlay_window_reply";

   function xcb_composite_release_overlay_window_checked (c : access xcb.xcb_connection_t; window : xproto.xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/composite.h:480
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_composite_release_overlay_window_checked";

   function xcb_composite_release_overlay_window (c : access xcb.xcb_connection_t; window : xproto.xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/composite.h:492
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_composite_release_overlay_window";

end xcb_composite;
