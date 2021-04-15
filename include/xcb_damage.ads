pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with xcb;
with bits_stdint_uintn_h;
with xproto;
with xcb_xfixes;
with System;

package xcb_damage is

   XCB_DAMAGE_MAJOR_VERSION : constant := 1;  --  /usr/include/xcb/damage.h:23
   XCB_DAMAGE_MINOR_VERSION : constant := 1;  --  /usr/include/xcb/damage.h:24

   XCB_DAMAGE_BAD_DAMAGE : constant := 0;  --  /usr/include/xcb/damage.h:47

   CONST_XCB_DAMAGE_QUERY_VERSION : constant := 0;  --  /usr/include/xcb/damage.h:66

   CONST_XCB_DAMAGE_CREATE : constant := 1;  --  /usr/include/xcb/damage.h:93

   CONST_XCB_DAMAGE_DESTROY : constant := 2;  --  /usr/include/xcb/damage.h:109

   CONST_XCB_DAMAGE_SUBTRACT : constant := 3;  --  /usr/include/xcb/damage.h:122

   CONST_XCB_DAMAGE_ADD : constant := 4;  --  /usr/include/xcb/damage.h:137

   XCB_DAMAGE_NOTIFY : constant := 0;  --  /usr/include/xcb/damage.h:151

   xcb_damage_id : aliased xcb.xcb_extension_t  -- /usr/include/xcb/damage.h:26
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_damage_id";

   subtype xcb_damage_damage_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/damage.h:28

   type xcb_damage_damage_iterator_t is record
      data : access xcb_damage_damage_t;  -- /usr/include/xcb/damage.h:34
      c_rem : aliased int;  -- /usr/include/xcb/damage.h:35
      index : aliased int;  -- /usr/include/xcb/damage.h:36
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/damage.h:33

   type xcb_damage_report_level_t is 
     (XCB_DAMAGE_REPORT_LEVEL_RAW_RECTANGLES,
      XCB_DAMAGE_REPORT_LEVEL_DELTA_RECTANGLES,
      XCB_DAMAGE_REPORT_LEVEL_BOUNDING_BOX,
      XCB_DAMAGE_REPORT_LEVEL_NON_EMPTY)
   with Convention => C;  -- /usr/include/xcb/damage.h:39

   type xcb_damage_bad_damage_error_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/damage.h:53
      error_code : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/damage.h:54
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/damage.h:55
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/damage.h:52

   type xcb_damage_query_version_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/damage.h:62
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/damage.h:61

   type xcb_damage_query_version_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/damage.h:72
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/damage.h:73
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/damage.h:74
      client_major_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/damage.h:75
      client_minor_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/damage.h:76
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/damage.h:71

   type xcb_damage_query_version_reply_t_array4341 is array (0 .. 15) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_damage_query_version_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/damage.h:83
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/damage.h:84
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/damage.h:85
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/damage.h:86
      major_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/damage.h:87
      minor_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/damage.h:88
      pad1 : aliased xcb_damage_query_version_reply_t_array4341;  -- /usr/include/xcb/damage.h:89
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/damage.h:82

   type xcb_damage_create_request_t_array1885 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_damage_create_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/damage.h:99
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/damage.h:100
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/damage.h:101
      damage : aliased xcb_damage_damage_t;  -- /usr/include/xcb/damage.h:102
      drawable : aliased xproto.xcb_drawable_t;  -- /usr/include/xcb/damage.h:103
      level : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/damage.h:104
      pad0 : aliased xcb_damage_create_request_t_array1885;  -- /usr/include/xcb/damage.h:105
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/damage.h:98

   type xcb_damage_destroy_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/damage.h:115
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/damage.h:116
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/damage.h:117
      damage : aliased xcb_damage_damage_t;  -- /usr/include/xcb/damage.h:118
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/damage.h:114

   type xcb_damage_subtract_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/damage.h:128
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/damage.h:129
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/damage.h:130
      damage : aliased xcb_damage_damage_t;  -- /usr/include/xcb/damage.h:131
      repair : aliased xcb_xfixes.xcb_xfixes_region_t;  -- /usr/include/xcb/damage.h:132
      parts : aliased xcb_xfixes.xcb_xfixes_region_t;  -- /usr/include/xcb/damage.h:133
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/damage.h:127

   type xcb_damage_add_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/damage.h:143
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/damage.h:144
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/damage.h:145
      drawable : aliased xproto.xcb_drawable_t;  -- /usr/include/xcb/damage.h:146
      region : aliased xcb_xfixes.xcb_xfixes_region_t;  -- /usr/include/xcb/damage.h:147
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/damage.h:142

   type xcb_damage_notify_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/damage.h:157
      level : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/damage.h:158
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/damage.h:159
      drawable : aliased xproto.xcb_drawable_t;  -- /usr/include/xcb/damage.h:160
      damage : aliased xcb_damage_damage_t;  -- /usr/include/xcb/damage.h:161
      timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/damage.h:162
      area : aliased xproto.xcb_rectangle_t;  -- /usr/include/xcb/damage.h:163
      geometry : aliased xproto.xcb_rectangle_t;  -- /usr/include/xcb/damage.h:164
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/damage.h:156

   procedure xcb_damage_damage_next (i : access xcb_damage_damage_iterator_t)  -- /usr/include/xcb/damage.h:176
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_damage_damage_next";

   function xcb_damage_damage_end (i : xcb_damage_damage_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/damage.h:188
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_damage_damage_end";

   function xcb_damage_query_version
     (c : access xcb.xcb_connection_t;
      client_major_version : bits_stdint_uintn_h.uint32_t;
      client_minor_version : bits_stdint_uintn_h.uint32_t) return xcb_damage_query_version_cookie_t  -- /usr/include/xcb/damage.h:199
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_damage_query_version";

   function xcb_damage_query_version_unchecked
     (c : access xcb.xcb_connection_t;
      client_major_version : bits_stdint_uintn_h.uint32_t;
      client_minor_version : bits_stdint_uintn_h.uint32_t) return xcb_damage_query_version_cookie_t  -- /usr/include/xcb/damage.h:215
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_damage_query_version_unchecked";

   function xcb_damage_query_version_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_damage_query_version_cookie_t;
      e : System.Address) return access xcb_damage_query_version_reply_t  -- /usr/include/xcb/damage.h:234
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_damage_query_version_reply";

   function xcb_damage_create_checked
     (c : access xcb.xcb_connection_t;
      damage : xcb_damage_damage_t;
      drawable : xproto.xcb_drawable_t;
      level : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/damage.h:250
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_damage_create_checked";

   function xcb_damage_create
     (c : access xcb.xcb_connection_t;
      damage : xcb_damage_damage_t;
      drawable : xproto.xcb_drawable_t;
      level : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/damage.h:264
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_damage_create";

   function xcb_damage_destroy_checked (c : access xcb.xcb_connection_t; damage : xcb_damage_damage_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/damage.h:281
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_damage_destroy_checked";

   function xcb_damage_destroy (c : access xcb.xcb_connection_t; damage : xcb_damage_damage_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/damage.h:293
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_damage_destroy";

   function xcb_damage_subtract_checked
     (c : access xcb.xcb_connection_t;
      damage : xcb_damage_damage_t;
      repair : xcb_xfixes.xcb_xfixes_region_t;
      parts : xcb_xfixes.xcb_xfixes_region_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/damage.h:308
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_damage_subtract_checked";

   function xcb_damage_subtract
     (c : access xcb.xcb_connection_t;
      damage : xcb_damage_damage_t;
      repair : xcb_xfixes.xcb_xfixes_region_t;
      parts : xcb_xfixes.xcb_xfixes_region_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/damage.h:322
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_damage_subtract";

   function xcb_damage_add_checked
     (c : access xcb.xcb_connection_t;
      drawable : xproto.xcb_drawable_t;
      region : xcb_xfixes.xcb_xfixes_region_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/damage.h:339
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_damage_add_checked";

   function xcb_damage_add
     (c : access xcb.xcb_connection_t;
      drawable : xproto.xcb_drawable_t;
      region : xcb_xfixes.xcb_xfixes_region_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/damage.h:352
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_damage_add";

end xcb_damage;
