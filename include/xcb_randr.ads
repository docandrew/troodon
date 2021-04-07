pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with xcb;
with bits_stdint_uintn_h;
with xproto;
with bits_stdint_intn_h;
with xcb_render;
with System;
with Interfaces.C.Strings;

package xcb_randr is

   XCB_RANDR_MAJOR_VERSION : constant := 1;  --  /usr/include/xcb/randr.h:23
   XCB_RANDR_MINOR_VERSION : constant := 6;  --  /usr/include/xcb/randr.h:24

   CONST_XCB_RANDR_BAD_OUTPUT : constant := 0;  --  /usr/include/xcb/randr.h:84

   CONST_XCB_RANDR_BAD_CRTC : constant := 1;  --  /usr/include/xcb/randr.h:96

   CONST_XCB_RANDR_BAD_MODE : constant := 2;  --  /usr/include/xcb/randr.h:108

   CONST_XCB_RANDR_BAD_PROVIDER : constant := 3;  --  /usr/include/xcb/randr.h:120

   CONST_XCB_RANDR_QUERY_VERSION : constant := 0;  --  /usr/include/xcb/randr.h:183

   CONST_XCB_RANDR_SET_SCREEN_CONFIG : constant := 2;  --  /usr/include/xcb/randr.h:224

   CONST_XCB_RANDR_SELECT_INPUT : constant := 4;  --  /usr/include/xcb/randr.h:269

   CONST_XCB_RANDR_GET_SCREEN_INFO : constant := 5;  --  /usr/include/xcb/randr.h:291

   CONST_XCB_RANDR_GET_SCREEN_SIZE_RANGE : constant := 6;  --  /usr/include/xcb/randr.h:330

   CONST_XCB_RANDR_SET_SCREEN_SIZE : constant := 7;  --  /usr/include/xcb/randr.h:358

   CONST_XCB_RANDR_GET_SCREEN_RESOURCES : constant := 8;  --  /usr/include/xcb/randr.h:427

   CONST_XCB_RANDR_GET_OUTPUT_INFO : constant := 9;  --  /usr/include/xcb/randr.h:470

   CONST_XCB_RANDR_LIST_OUTPUT_PROPERTIES : constant := 10;  --  /usr/include/xcb/randr.h:512

   CONST_XCB_RANDR_QUERY_OUTPUT_PROPERTY : constant := 11;  --  /usr/include/xcb/randr.h:544

   CONST_XCB_RANDR_CONFIGURE_OUTPUT_PROPERTY : constant := 12;  --  /usr/include/xcb/randr.h:572

   CONST_XCB_RANDR_CHANGE_OUTPUT_PROPERTY : constant := 13;  --  /usr/include/xcb/randr.h:589

   CONST_XCB_RANDR_DELETE_OUTPUT_PROPERTY : constant := 14;  --  /usr/include/xcb/randr.h:608

   CONST_XCB_RANDR_GET_OUTPUT_PROPERTY : constant := 15;  --  /usr/include/xcb/randr.h:629

   CONST_XCB_RANDR_CREATE_MODE : constant := 16;  --  /usr/include/xcb/randr.h:670

   CONST_XCB_RANDR_DESTROY_MODE : constant := 17;  --  /usr/include/xcb/randr.h:696

   CONST_XCB_RANDR_ADD_OUTPUT_MODE : constant := 18;  --  /usr/include/xcb/randr.h:709

   CONST_XCB_RANDR_DELETE_OUTPUT_MODE : constant := 19;  --  /usr/include/xcb/randr.h:723

   CONST_XCB_RANDR_GET_CRTC_INFO : constant := 20;  --  /usr/include/xcb/randr.h:744

   CONST_XCB_RANDR_SET_CRTC_CONFIG : constant := 21;  --  /usr/include/xcb/randr.h:785

   CONST_XCB_RANDR_GET_CRTC_GAMMA_SIZE : constant := 22;  --  /usr/include/xcb/randr.h:824

   CONST_XCB_RANDR_GET_CRTC_GAMMA : constant := 23;  --  /usr/include/xcb/randr.h:856

   CONST_XCB_RANDR_SET_CRTC_GAMMA : constant := 24;  --  /usr/include/xcb/randr.h:881

   CONST_XCB_RANDR_GET_SCREEN_RESOURCES_CURRENT : constant := 25;  --  /usr/include/xcb/randr.h:903

   CONST_XCB_RANDR_SET_CRTC_TRANSFORM : constant := 26;  --  /usr/include/xcb/randr.h:940

   CONST_XCB_RANDR_GET_CRTC_TRANSFORM : constant := 27;  --  /usr/include/xcb/randr.h:963

   CONST_XCB_RANDR_GET_PANNING : constant := 28;  --  /usr/include/xcb/randr.h:1002

   CONST_XCB_RANDR_SET_PANNING : constant := 29;  --  /usr/include/xcb/randr.h:1045

   CONST_XCB_RANDR_SET_OUTPUT_PRIMARY : constant := 30;  --  /usr/include/xcb/randr.h:1082

   CONST_XCB_RANDR_GET_OUTPUT_PRIMARY : constant := 31;  --  /usr/include/xcb/randr.h:1103

   CONST_XCB_RANDR_GET_PROVIDERS : constant := 32;  --  /usr/include/xcb/randr.h:1134

   CONST_XCB_RANDR_GET_PROVIDER_INFO : constant := 33;  --  /usr/include/xcb/randr.h:1174

   CONST_XCB_RANDR_SET_PROVIDER_OFFLOAD_SINK : constant := 34;  --  /usr/include/xcb/randr.h:1205

   CONST_XCB_RANDR_SET_PROVIDER_OUTPUT_SOURCE : constant := 35;  --  /usr/include/xcb/randr.h:1220

   CONST_XCB_RANDR_LIST_PROVIDER_PROPERTIES : constant := 36;  --  /usr/include/xcb/randr.h:1242

   CONST_XCB_RANDR_QUERY_PROVIDER_PROPERTY : constant := 37;  --  /usr/include/xcb/randr.h:1274

   CONST_XCB_RANDR_CONFIGURE_PROVIDER_PROPERTY : constant := 38;  --  /usr/include/xcb/randr.h:1302

   CONST_XCB_RANDR_CHANGE_PROVIDER_PROPERTY : constant := 39;  --  /usr/include/xcb/randr.h:1319

   CONST_XCB_RANDR_DELETE_PROVIDER_PROPERTY : constant := 40;  --  /usr/include/xcb/randr.h:1338

   CONST_XCB_RANDR_GET_PROVIDER_PROPERTY : constant := 41;  --  /usr/include/xcb/randr.h:1359

   CONST_XCB_RANDR_SCREEN_CHANGE_NOTIFY : constant := 0;  --  /usr/include/xcb/randr.h:1393

   CONST_XCB_RANDR_GET_MONITORS : constant := 42;  --  /usr/include/xcb/randr.h:1585

   CONST_XCB_RANDR_SET_MONITOR : constant := 43;  --  /usr/include/xcb/randr.h:1613

   CONST_XCB_RANDR_DELETE_MONITOR : constant := 44;  --  /usr/include/xcb/randr.h:1626

   CONST_XCB_RANDR_CREATE_LEASE : constant := 45;  --  /usr/include/xcb/randr.h:1647

   CONST_XCB_RANDR_FREE_LEASE : constant := 46;  --  /usr/include/xcb/randr.h:1674

   CONST_XCB_RANDR_NOTIFY : constant := 1;  --  /usr/include/xcb/randr.h:1730

   xcb_randr_id : aliased xcb.xcb_extension_t  -- /usr/include/xcb/randr.h:26
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_id";

   subtype xcb_randr_mode_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:28

   type xcb_randr_mode_iterator_t is record
      data : access xcb_randr_mode_t;  -- /usr/include/xcb/randr.h:34
      c_rem : aliased int;  -- /usr/include/xcb/randr.h:35
      index : aliased int;  -- /usr/include/xcb/randr.h:36
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:33

   subtype xcb_randr_crtc_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:39

   type xcb_randr_crtc_iterator_t is record
      data : access xcb_randr_crtc_t;  -- /usr/include/xcb/randr.h:45
      c_rem : aliased int;  -- /usr/include/xcb/randr.h:46
      index : aliased int;  -- /usr/include/xcb/randr.h:47
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:44

   subtype xcb_randr_output_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:50

   type xcb_randr_output_iterator_t is record
      data : access xcb_randr_output_t;  -- /usr/include/xcb/randr.h:56
      c_rem : aliased int;  -- /usr/include/xcb/randr.h:57
      index : aliased int;  -- /usr/include/xcb/randr.h:58
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:55

   subtype xcb_randr_provider_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:61

   type xcb_randr_provider_iterator_t is record
      data : access xcb_randr_provider_t;  -- /usr/include/xcb/randr.h:67
      c_rem : aliased int;  -- /usr/include/xcb/randr.h:68
      index : aliased int;  -- /usr/include/xcb/randr.h:69
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:66

   subtype xcb_randr_lease_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:72

   type xcb_randr_lease_iterator_t is record
      data : access xcb_randr_lease_t;  -- /usr/include/xcb/randr.h:78
      c_rem : aliased int;  -- /usr/include/xcb/randr.h:79
      index : aliased int;  -- /usr/include/xcb/randr.h:80
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:77

   type xcb_randr_bad_output_error_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:90
      error_code : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:91
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:92
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:89

   type xcb_randr_bad_crtc_error_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:102
      error_code : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:103
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:104
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:101

   type xcb_randr_bad_mode_error_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:114
      error_code : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:115
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:116
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:113

   type xcb_randr_bad_provider_error_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:126
      error_code : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:127
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:128
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:125

   subtype xcb_randr_rotation_t is unsigned;
   XCB_RANDR_ROTATION_ROTATE_0 : constant unsigned := 1;
   XCB_RANDR_ROTATION_ROTATE_90 : constant unsigned := 2;
   XCB_RANDR_ROTATION_ROTATE_180 : constant unsigned := 4;
   XCB_RANDR_ROTATION_ROTATE_270 : constant unsigned := 8;
   XCB_RANDR_ROTATION_REFLECT_X : constant unsigned := 16;
   XCB_RANDR_ROTATION_REFLECT_Y : constant unsigned := 32;  -- /usr/include/xcb/randr.h:131

   type xcb_randr_screen_size_t is record
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:144
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:145
      mwidth : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:146
      mheight : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:147
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:143

   type xcb_randr_screen_size_iterator_t is record
      data : access xcb_randr_screen_size_t;  -- /usr/include/xcb/randr.h:154
      c_rem : aliased int;  -- /usr/include/xcb/randr.h:155
      index : aliased int;  -- /usr/include/xcb/randr.h:156
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:153

   type xcb_randr_refresh_rates_t is record
      nRates : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:163
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:162

   type xcb_randr_refresh_rates_iterator_t is record
      data : access xcb_randr_refresh_rates_t;  -- /usr/include/xcb/randr.h:170
      c_rem : aliased int;  -- /usr/include/xcb/randr.h:171
      index : aliased int;  -- /usr/include/xcb/randr.h:172
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:169

   type xcb_randr_query_version_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/randr.h:179
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:178

   type xcb_randr_query_version_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:189
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:190
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:191
      major_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:192
      minor_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:193
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:188

   type xcb_randr_query_version_reply_t_array4353 is array (0 .. 15) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_query_version_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:200
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:201
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:202
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:203
      major_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:204
      minor_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:205
      pad1 : aliased xcb_randr_query_version_reply_t_array4353;  -- /usr/include/xcb/randr.h:206
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:199

   type xcb_randr_set_config_t is 
     (XCB_RANDR_SET_CONFIG_SUCCESS,
      XCB_RANDR_SET_CONFIG_INVALID_CONFIG_TIME,
      XCB_RANDR_SET_CONFIG_INVALID_TIME,
      XCB_RANDR_SET_CONFIG_FAILED)
   with Convention => C;  -- /usr/include/xcb/randr.h:209

   type xcb_randr_set_screen_config_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/randr.h:220
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:219

   type xcb_randr_set_screen_config_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_set_screen_config_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:230
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:231
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:232
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/randr.h:233
      timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:234
      config_timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:235
      sizeID : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:236
      rotation : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:237
      rate : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:238
      pad0 : aliased xcb_randr_set_screen_config_request_t_array1823;  -- /usr/include/xcb/randr.h:239
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:229

   type xcb_randr_set_screen_config_reply_t_array5087 is array (0 .. 9) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_set_screen_config_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:246
      status : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:247
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:248
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:249
      new_timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:250
      config_timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:251
      root : aliased xproto.xcb_window_t;  -- /usr/include/xcb/randr.h:252
      subpixel_order : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:253
      pad0 : aliased xcb_randr_set_screen_config_reply_t_array5087;  -- /usr/include/xcb/randr.h:254
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:245

   subtype xcb_randr_notify_mask_t is unsigned;
   XCB_RANDR_NOTIFY_MASK_SCREEN_CHANGE : constant unsigned := 1;
   XCB_RANDR_NOTIFY_MASK_CRTC_CHANGE : constant unsigned := 2;
   XCB_RANDR_NOTIFY_MASK_OUTPUT_CHANGE : constant unsigned := 4;
   XCB_RANDR_NOTIFY_MASK_OUTPUT_PROPERTY : constant unsigned := 8;
   XCB_RANDR_NOTIFY_MASK_PROVIDER_CHANGE : constant unsigned := 16;
   XCB_RANDR_NOTIFY_MASK_PROVIDER_PROPERTY : constant unsigned := 32;
   XCB_RANDR_NOTIFY_MASK_RESOURCE_CHANGE : constant unsigned := 64;
   XCB_RANDR_NOTIFY_MASK_LEASE : constant unsigned := 128;  -- /usr/include/xcb/randr.h:257

   type xcb_randr_select_input_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_select_input_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:275
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:276
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:277
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/randr.h:278
      enable : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:279
      pad0 : aliased xcb_randr_select_input_request_t_array1823;  -- /usr/include/xcb/randr.h:280
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:274

   type xcb_randr_get_screen_info_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/randr.h:287
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:286

   type xcb_randr_get_screen_info_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:297
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:298
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:299
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/randr.h:300
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:296

   type xcb_randr_get_screen_info_reply_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_get_screen_info_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:307
      rotations : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:308
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:309
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:310
      root : aliased xproto.xcb_window_t;  -- /usr/include/xcb/randr.h:311
      timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:312
      config_timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:313
      nSizes : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:314
      sizeID : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:315
      rotation : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:316
      rate : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:317
      nInfo : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:318
      pad0 : aliased xcb_randr_get_screen_info_reply_t_array1823;  -- /usr/include/xcb/randr.h:319
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:306

   type xcb_randr_get_screen_size_range_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/randr.h:326
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:325

   type xcb_randr_get_screen_size_range_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:336
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:337
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:338
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/randr.h:339
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:335

   type xcb_randr_get_screen_size_range_reply_t_array4353 is array (0 .. 15) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_get_screen_size_range_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:346
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:347
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:348
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:349
      min_width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:350
      min_height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:351
      max_width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:352
      max_height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:353
      pad1 : aliased xcb_randr_get_screen_size_range_reply_t_array4353;  -- /usr/include/xcb/randr.h:354
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:345

   type xcb_randr_set_screen_size_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:364
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:365
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:366
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/randr.h:367
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:368
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:369
      mm_width : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:370
      mm_height : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:371
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:363

   subtype xcb_randr_mode_flag_t is unsigned;
   XCB_RANDR_MODE_FLAG_HSYNC_POSITIVE : constant unsigned := 1;
   XCB_RANDR_MODE_FLAG_HSYNC_NEGATIVE : constant unsigned := 2;
   XCB_RANDR_MODE_FLAG_VSYNC_POSITIVE : constant unsigned := 4;
   XCB_RANDR_MODE_FLAG_VSYNC_NEGATIVE : constant unsigned := 8;
   XCB_RANDR_MODE_FLAG_INTERLACE : constant unsigned := 16;
   XCB_RANDR_MODE_FLAG_DOUBLE_SCAN : constant unsigned := 32;
   XCB_RANDR_MODE_FLAG_CSYNC : constant unsigned := 64;
   XCB_RANDR_MODE_FLAG_CSYNC_POSITIVE : constant unsigned := 128;
   XCB_RANDR_MODE_FLAG_CSYNC_NEGATIVE : constant unsigned := 256;
   XCB_RANDR_MODE_FLAG_HSKEW_PRESENT : constant unsigned := 512;
   XCB_RANDR_MODE_FLAG_BCAST : constant unsigned := 1024;
   XCB_RANDR_MODE_FLAG_PIXEL_MULTIPLEX : constant unsigned := 2048;
   XCB_RANDR_MODE_FLAG_DOUBLE_CLOCK : constant unsigned := 4096;
   XCB_RANDR_MODE_FLAG_HALVE_CLOCK : constant unsigned := 8192;  -- /usr/include/xcb/randr.h:374

   type xcb_randr_mode_info_t is record
      id : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:395
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:396
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:397
      dot_clock : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:398
      hsync_start : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:399
      hsync_end : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:400
      htotal : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:401
      hskew : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:402
      vsync_start : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:403
      vsync_end : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:404
      vtotal : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:405
      name_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:406
      mode_flags : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:407
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:394

   type xcb_randr_mode_info_iterator_t is record
      data : access xcb_randr_mode_info_t;  -- /usr/include/xcb/randr.h:414
      c_rem : aliased int;  -- /usr/include/xcb/randr.h:415
      index : aliased int;  -- /usr/include/xcb/randr.h:416
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:413

   type xcb_randr_get_screen_resources_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/randr.h:423
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:422

   type xcb_randr_get_screen_resources_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:433
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:434
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:435
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/randr.h:436
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:432

   type xcb_randr_get_screen_resources_reply_t_array2620 is array (0 .. 7) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_get_screen_resources_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:443
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:444
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:445
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:446
      timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:447
      config_timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:448
      num_crtcs : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:449
      num_outputs : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:450
      num_modes : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:451
      names_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:452
      pad1 : aliased xcb_randr_get_screen_resources_reply_t_array2620;  -- /usr/include/xcb/randr.h:453
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:442

   type xcb_randr_connection_t is 
     (XCB_RANDR_CONNECTION_CONNECTED,
      XCB_RANDR_CONNECTION_DISCONNECTED,
      XCB_RANDR_CONNECTION_UNKNOWN)
   with Convention => C;  -- /usr/include/xcb/randr.h:456

   type xcb_randr_get_output_info_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/randr.h:466
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:465

   type xcb_randr_get_output_info_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:476
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:477
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:478
      output : aliased xcb_randr_output_t;  -- /usr/include/xcb/randr.h:479
      config_timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:480
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:475

   type xcb_randr_get_output_info_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:487
      status : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:488
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:489
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:490
      timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:491
      crtc : aliased xcb_randr_crtc_t;  -- /usr/include/xcb/randr.h:492
      mm_width : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:493
      mm_height : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:494
      connection : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:495
      subpixel_order : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:496
      num_crtcs : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:497
      num_modes : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:498
      num_preferred : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:499
      num_clones : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:500
      name_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:501
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:486

   type xcb_randr_list_output_properties_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/randr.h:508
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:507

   type xcb_randr_list_output_properties_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:518
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:519
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:520
      output : aliased xcb_randr_output_t;  -- /usr/include/xcb/randr.h:521
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:517

   type xcb_randr_list_output_properties_reply_t_array2015 is array (0 .. 21) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_list_output_properties_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:528
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:529
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:530
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:531
      num_atoms : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:532
      pad1 : aliased xcb_randr_list_output_properties_reply_t_array2015;  -- /usr/include/xcb/randr.h:533
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:527

   type xcb_randr_query_output_property_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/randr.h:540
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:539

   type xcb_randr_query_output_property_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:550
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:551
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:552
      output : aliased xcb_randr_output_t;  -- /usr/include/xcb/randr.h:553
      property : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/randr.h:554
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:549

   type xcb_randr_query_output_property_reply_t_array5167 is array (0 .. 20) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_query_output_property_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:561
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:562
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:563
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:564
      pending : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:565
      c_range : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:566
      immutable : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:567
      pad1 : aliased xcb_randr_query_output_property_reply_t_array5167;  -- /usr/include/xcb/randr.h:568
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:560

   type xcb_randr_configure_output_property_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_configure_output_property_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:578
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:579
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:580
      output : aliased xcb_randr_output_t;  -- /usr/include/xcb/randr.h:581
      property : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/randr.h:582
      pending : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:583
      c_range : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:584
      pad0 : aliased xcb_randr_configure_output_property_request_t_array1823;  -- /usr/include/xcb/randr.h:585
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:577

   type xcb_randr_change_output_property_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_change_output_property_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:595
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:596
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:597
      output : aliased xcb_randr_output_t;  -- /usr/include/xcb/randr.h:598
      property : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/randr.h:599
      c_type : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/randr.h:600
      format : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:601
      mode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:602
      pad0 : aliased xcb_randr_change_output_property_request_t_array1823;  -- /usr/include/xcb/randr.h:603
      num_units : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:604
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:594

   type xcb_randr_delete_output_property_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:614
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:615
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:616
      output : aliased xcb_randr_output_t;  -- /usr/include/xcb/randr.h:617
      property : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/randr.h:618
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:613

   type xcb_randr_get_output_property_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/randr.h:625
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:624

   type xcb_randr_get_output_property_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_get_output_property_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:635
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:636
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:637
      output : aliased xcb_randr_output_t;  -- /usr/include/xcb/randr.h:638
      property : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/randr.h:639
      c_type : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/randr.h:640
      long_offset : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:641
      long_length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:642
      u_delete : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:643
      pending : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:644
      pad0 : aliased xcb_randr_get_output_property_request_t_array1823;  -- /usr/include/xcb/randr.h:645
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:634

   type xcb_randr_get_output_property_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_get_output_property_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:652
      format : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:653
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:654
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:655
      c_type : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/randr.h:656
      bytes_after : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:657
      num_items : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:658
      pad0 : aliased xcb_randr_get_output_property_reply_t_array2180;  -- /usr/include/xcb/randr.h:659
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:651

   type xcb_randr_create_mode_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/randr.h:666
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:665

   type xcb_randr_create_mode_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:676
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:677
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:678
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/randr.h:679
      mode_info : aliased xcb_randr_mode_info_t;  -- /usr/include/xcb/randr.h:680
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:675

   type xcb_randr_create_mode_reply_t_array1992 is array (0 .. 19) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_create_mode_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:687
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:688
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:689
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:690
      mode : aliased xcb_randr_mode_t;  -- /usr/include/xcb/randr.h:691
      pad1 : aliased xcb_randr_create_mode_reply_t_array1992;  -- /usr/include/xcb/randr.h:692
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:686

   type xcb_randr_destroy_mode_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:702
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:703
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:704
      mode : aliased xcb_randr_mode_t;  -- /usr/include/xcb/randr.h:705
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:701

   type xcb_randr_add_output_mode_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:715
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:716
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:717
      output : aliased xcb_randr_output_t;  -- /usr/include/xcb/randr.h:718
      mode : aliased xcb_randr_mode_t;  -- /usr/include/xcb/randr.h:719
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:714

   type xcb_randr_delete_output_mode_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:729
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:730
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:731
      output : aliased xcb_randr_output_t;  -- /usr/include/xcb/randr.h:732
      mode : aliased xcb_randr_mode_t;  -- /usr/include/xcb/randr.h:733
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:728

   type xcb_randr_get_crtc_info_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/randr.h:740
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:739

   type xcb_randr_get_crtc_info_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:750
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:751
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:752
      crtc : aliased xcb_randr_crtc_t;  -- /usr/include/xcb/randr.h:753
      config_timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:754
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:749

   type xcb_randr_get_crtc_info_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:761
      status : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:762
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:763
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:764
      timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:765
      x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/randr.h:766
      y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/randr.h:767
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:768
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:769
      mode : aliased xcb_randr_mode_t;  -- /usr/include/xcb/randr.h:770
      rotation : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:771
      rotations : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:772
      num_outputs : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:773
      num_possible_outputs : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:774
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:760

   type xcb_randr_set_crtc_config_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/randr.h:781
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:780

   type xcb_randr_set_crtc_config_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_set_crtc_config_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:791
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:792
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:793
      crtc : aliased xcb_randr_crtc_t;  -- /usr/include/xcb/randr.h:794
      timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:795
      config_timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:796
      x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/randr.h:797
      y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/randr.h:798
      mode : aliased xcb_randr_mode_t;  -- /usr/include/xcb/randr.h:799
      rotation : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:800
      pad0 : aliased xcb_randr_set_crtc_config_request_t_array1823;  -- /usr/include/xcb/randr.h:801
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:790

   type xcb_randr_set_crtc_config_reply_t_array1992 is array (0 .. 19) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_set_crtc_config_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:808
      status : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:809
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:810
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:811
      timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:812
      pad0 : aliased xcb_randr_set_crtc_config_reply_t_array1992;  -- /usr/include/xcb/randr.h:813
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:807

   type xcb_randr_get_crtc_gamma_size_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/randr.h:820
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:819

   type xcb_randr_get_crtc_gamma_size_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:830
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:831
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:832
      crtc : aliased xcb_randr_crtc_t;  -- /usr/include/xcb/randr.h:833
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:829

   type xcb_randr_get_crtc_gamma_size_reply_t_array2015 is array (0 .. 21) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_get_crtc_gamma_size_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:840
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:841
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:842
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:843
      size : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:844
      pad1 : aliased xcb_randr_get_crtc_gamma_size_reply_t_array2015;  -- /usr/include/xcb/randr.h:845
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:839

   type xcb_randr_get_crtc_gamma_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/randr.h:852
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:851

   type xcb_randr_get_crtc_gamma_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:862
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:863
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:864
      crtc : aliased xcb_randr_crtc_t;  -- /usr/include/xcb/randr.h:865
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:861

   type xcb_randr_get_crtc_gamma_reply_t_array2015 is array (0 .. 21) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_get_crtc_gamma_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:872
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:873
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:874
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:875
      size : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:876
      pad1 : aliased xcb_randr_get_crtc_gamma_reply_t_array2015;  -- /usr/include/xcb/randr.h:877
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:871

   type xcb_randr_set_crtc_gamma_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_set_crtc_gamma_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:887
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:888
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:889
      crtc : aliased xcb_randr_crtc_t;  -- /usr/include/xcb/randr.h:890
      size : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:891
      pad0 : aliased xcb_randr_set_crtc_gamma_request_t_array1823;  -- /usr/include/xcb/randr.h:892
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:886

   type xcb_randr_get_screen_resources_current_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/randr.h:899
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:898

   type xcb_randr_get_screen_resources_current_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:909
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:910
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:911
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/randr.h:912
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:908

   type xcb_randr_get_screen_resources_current_reply_t_array2620 is array (0 .. 7) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_get_screen_resources_current_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:919
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:920
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:921
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:922
      timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:923
      config_timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:924
      num_crtcs : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:925
      num_outputs : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:926
      num_modes : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:927
      names_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:928
      pad1 : aliased xcb_randr_get_screen_resources_current_reply_t_array2620;  -- /usr/include/xcb/randr.h:929
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:918

   subtype xcb_randr_transform_t is unsigned;
   XCB_RANDR_TRANSFORM_UNIT : constant unsigned := 1;
   XCB_RANDR_TRANSFORM_SCALE_UP : constant unsigned := 2;
   XCB_RANDR_TRANSFORM_SCALE_DOWN : constant unsigned := 4;
   XCB_RANDR_TRANSFORM_PROJECTIVE : constant unsigned := 8;  -- /usr/include/xcb/randr.h:932

   type xcb_randr_set_crtc_transform_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_set_crtc_transform_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:946
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:947
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:948
      crtc : aliased xcb_randr_crtc_t;  -- /usr/include/xcb/randr.h:949
      transform : aliased xcb_render.xcb_render_transform_t;  -- /usr/include/xcb/randr.h:950
      filter_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:951
      pad0 : aliased xcb_randr_set_crtc_transform_request_t_array1823;  -- /usr/include/xcb/randr.h:952
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:945

   type xcb_randr_get_crtc_transform_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/randr.h:959
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:958

   type xcb_randr_get_crtc_transform_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:969
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:970
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:971
      crtc : aliased xcb_randr_crtc_t;  -- /usr/include/xcb/randr.h:972
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:968

   type xcb_randr_get_crtc_transform_reply_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_get_crtc_transform_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_get_crtc_transform_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:979
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:980
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:981
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:982
      pending_transform : aliased xcb_render.xcb_render_transform_t;  -- /usr/include/xcb/randr.h:983
      has_transforms : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:984
      pad1 : aliased xcb_randr_get_crtc_transform_reply_t_array1897;  -- /usr/include/xcb/randr.h:985
      current_transform : aliased xcb_render.xcb_render_transform_t;  -- /usr/include/xcb/randr.h:986
      pad2 : aliased xcb_randr_get_crtc_transform_reply_t_array1791;  -- /usr/include/xcb/randr.h:987
      pending_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:988
      pending_nparams : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:989
      current_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:990
      current_nparams : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:991
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:978

   type xcb_randr_get_panning_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/randr.h:998
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:997

   type xcb_randr_get_panning_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1008
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1009
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1010
      crtc : aliased xcb_randr_crtc_t;  -- /usr/include/xcb/randr.h:1011
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1007

   type xcb_randr_get_panning_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1018
      status : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1019
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1020
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:1021
      timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:1022
      left : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1023
      top : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1024
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1025
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1026
      track_left : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1027
      track_top : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1028
      track_width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1029
      track_height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1030
      border_left : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/randr.h:1031
      border_top : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/randr.h:1032
      border_right : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/randr.h:1033
      border_bottom : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/randr.h:1034
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1017

   type xcb_randr_set_panning_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/randr.h:1041
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1040

   type xcb_randr_set_panning_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1051
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1052
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1053
      crtc : aliased xcb_randr_crtc_t;  -- /usr/include/xcb/randr.h:1054
      timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:1055
      left : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1056
      top : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1057
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1058
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1059
      track_left : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1060
      track_top : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1061
      track_width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1062
      track_height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1063
      border_left : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/randr.h:1064
      border_top : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/randr.h:1065
      border_right : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/randr.h:1066
      border_bottom : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/randr.h:1067
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1050

   type xcb_randr_set_panning_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1074
      status : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1075
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1076
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:1077
      timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:1078
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1073

   type xcb_randr_set_output_primary_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1088
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1089
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1090
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/randr.h:1091
      output : aliased xcb_randr_output_t;  -- /usr/include/xcb/randr.h:1092
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1087

   type xcb_randr_get_output_primary_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/randr.h:1099
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1098

   type xcb_randr_get_output_primary_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1109
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1110
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1111
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/randr.h:1112
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1108

   type xcb_randr_get_output_primary_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1119
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1120
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1121
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:1122
      output : aliased xcb_randr_output_t;  -- /usr/include/xcb/randr.h:1123
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1118

   type xcb_randr_get_providers_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/randr.h:1130
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1129

   type xcb_randr_get_providers_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1140
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1141
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1142
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/randr.h:1143
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1139

   type xcb_randr_get_providers_reply_t_array2771 is array (0 .. 17) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_get_providers_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1150
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1151
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1152
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:1153
      timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:1154
      num_providers : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1155
      pad1 : aliased xcb_randr_get_providers_reply_t_array2771;  -- /usr/include/xcb/randr.h:1156
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1149

   subtype xcb_randr_provider_capability_t is unsigned;
   XCB_RANDR_PROVIDER_CAPABILITY_SOURCE_OUTPUT : constant unsigned := 1;
   XCB_RANDR_PROVIDER_CAPABILITY_SINK_OUTPUT : constant unsigned := 2;
   XCB_RANDR_PROVIDER_CAPABILITY_SOURCE_OFFLOAD : constant unsigned := 4;
   XCB_RANDR_PROVIDER_CAPABILITY_SINK_OFFLOAD : constant unsigned := 8;  -- /usr/include/xcb/randr.h:1159

   type xcb_randr_get_provider_info_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/randr.h:1170
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1169

   type xcb_randr_get_provider_info_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1180
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1181
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1182
      provider : aliased xcb_randr_provider_t;  -- /usr/include/xcb/randr.h:1183
      config_timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:1184
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1179

   type xcb_randr_get_provider_info_reply_t_array2620 is array (0 .. 7) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_get_provider_info_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1191
      status : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1192
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1193
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:1194
      timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:1195
      capabilities : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:1196
      num_crtcs : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1197
      num_outputs : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1198
      num_associated_providers : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1199
      name_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1200
      pad0 : aliased xcb_randr_get_provider_info_reply_t_array2620;  -- /usr/include/xcb/randr.h:1201
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1190

   type xcb_randr_set_provider_offload_sink_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1211
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1212
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1213
      provider : aliased xcb_randr_provider_t;  -- /usr/include/xcb/randr.h:1214
      sink_provider : aliased xcb_randr_provider_t;  -- /usr/include/xcb/randr.h:1215
      config_timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:1216
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1210

   type xcb_randr_set_provider_output_source_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1226
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1227
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1228
      provider : aliased xcb_randr_provider_t;  -- /usr/include/xcb/randr.h:1229
      source_provider : aliased xcb_randr_provider_t;  -- /usr/include/xcb/randr.h:1230
      config_timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:1231
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1225

   type xcb_randr_list_provider_properties_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/randr.h:1238
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1237

   type xcb_randr_list_provider_properties_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1248
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1249
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1250
      provider : aliased xcb_randr_provider_t;  -- /usr/include/xcb/randr.h:1251
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1247

   type xcb_randr_list_provider_properties_reply_t_array2015 is array (0 .. 21) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_list_provider_properties_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1258
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1259
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1260
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:1261
      num_atoms : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1262
      pad1 : aliased xcb_randr_list_provider_properties_reply_t_array2015;  -- /usr/include/xcb/randr.h:1263
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1257

   type xcb_randr_query_provider_property_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/randr.h:1270
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1269

   type xcb_randr_query_provider_property_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1280
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1281
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1282
      provider : aliased xcb_randr_provider_t;  -- /usr/include/xcb/randr.h:1283
      property : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/randr.h:1284
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1279

   type xcb_randr_query_provider_property_reply_t_array5167 is array (0 .. 20) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_query_provider_property_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1291
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1292
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1293
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:1294
      pending : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1295
      c_range : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1296
      immutable : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1297
      pad1 : aliased xcb_randr_query_provider_property_reply_t_array5167;  -- /usr/include/xcb/randr.h:1298
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1290

   type xcb_randr_configure_provider_property_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_configure_provider_property_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1308
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1309
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1310
      provider : aliased xcb_randr_provider_t;  -- /usr/include/xcb/randr.h:1311
      property : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/randr.h:1312
      pending : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1313
      c_range : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1314
      pad0 : aliased xcb_randr_configure_provider_property_request_t_array1823;  -- /usr/include/xcb/randr.h:1315
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1307

   type xcb_randr_change_provider_property_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_change_provider_property_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1325
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1326
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1327
      provider : aliased xcb_randr_provider_t;  -- /usr/include/xcb/randr.h:1328
      property : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/randr.h:1329
      c_type : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/randr.h:1330
      format : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1331
      mode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1332
      pad0 : aliased xcb_randr_change_provider_property_request_t_array1823;  -- /usr/include/xcb/randr.h:1333
      num_items : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:1334
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1324

   type xcb_randr_delete_provider_property_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1344
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1345
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1346
      provider : aliased xcb_randr_provider_t;  -- /usr/include/xcb/randr.h:1347
      property : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/randr.h:1348
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1343

   type xcb_randr_get_provider_property_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/randr.h:1355
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1354

   type xcb_randr_get_provider_property_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_get_provider_property_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1365
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1366
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1367
      provider : aliased xcb_randr_provider_t;  -- /usr/include/xcb/randr.h:1368
      property : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/randr.h:1369
      c_type : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/randr.h:1370
      long_offset : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:1371
      long_length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:1372
      u_delete : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1373
      pending : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1374
      pad0 : aliased xcb_randr_get_provider_property_request_t_array1823;  -- /usr/include/xcb/randr.h:1375
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1364

   type xcb_randr_get_provider_property_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_get_provider_property_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1382
      format : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1383
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1384
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:1385
      c_type : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/randr.h:1386
      bytes_after : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:1387
      num_items : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:1388
      pad0 : aliased xcb_randr_get_provider_property_reply_t_array2180;  -- /usr/include/xcb/randr.h:1389
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1381

   type xcb_randr_screen_change_notify_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1399
      rotation : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1400
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1401
      timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:1402
      config_timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:1403
      root : aliased xproto.xcb_window_t;  -- /usr/include/xcb/randr.h:1404
      request_window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/randr.h:1405
      sizeID : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1406
      subpixel_order : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1407
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1408
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1409
      mwidth : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1410
      mheight : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1411
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1398

   type xcb_randr_notify_t is 
     (XCB_RANDR_NOTIFY_CRTC_CHANGE,
      XCB_RANDR_NOTIFY_OUTPUT_CHANGE,
      XCB_RANDR_NOTIFY_OUTPUT_PROPERTY,
      XCB_RANDR_NOTIFY_PROVIDER_CHANGE,
      XCB_RANDR_NOTIFY_PROVIDER_PROPERTY,
      XCB_RANDR_NOTIFY_RESOURCE_CHANGE,
      XCB_RANDR_NOTIFY_LEASE)
   with Convention => C;  -- /usr/include/xcb/randr.h:1414

   type xcb_randr_crtc_change_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_crtc_change_t is record
      timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:1428
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/randr.h:1429
      crtc : aliased xcb_randr_crtc_t;  -- /usr/include/xcb/randr.h:1430
      mode : aliased xcb_randr_mode_t;  -- /usr/include/xcb/randr.h:1431
      rotation : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1432
      pad0 : aliased xcb_randr_crtc_change_t_array1823;  -- /usr/include/xcb/randr.h:1433
      x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/randr.h:1434
      y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/randr.h:1435
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1436
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1437
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1427

   type xcb_randr_crtc_change_iterator_t is record
      data : access xcb_randr_crtc_change_t;  -- /usr/include/xcb/randr.h:1444
      c_rem : aliased int;  -- /usr/include/xcb/randr.h:1445
      index : aliased int;  -- /usr/include/xcb/randr.h:1446
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1443

   type xcb_randr_output_change_t is record
      timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:1453
      config_timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:1454
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/randr.h:1455
      output : aliased xcb_randr_output_t;  -- /usr/include/xcb/randr.h:1456
      crtc : aliased xcb_randr_crtc_t;  -- /usr/include/xcb/randr.h:1457
      mode : aliased xcb_randr_mode_t;  -- /usr/include/xcb/randr.h:1458
      rotation : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1459
      connection : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1460
      subpixel_order : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1461
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1452

   type xcb_randr_output_change_iterator_t is record
      data : access xcb_randr_output_change_t;  -- /usr/include/xcb/randr.h:1468
      c_rem : aliased int;  -- /usr/include/xcb/randr.h:1469
      index : aliased int;  -- /usr/include/xcb/randr.h:1470
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1467

   type xcb_randr_output_property_t_array5387 is array (0 .. 10) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_output_property_t is record
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/randr.h:1477
      output : aliased xcb_randr_output_t;  -- /usr/include/xcb/randr.h:1478
      atom : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/randr.h:1479
      timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:1480
      status : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1481
      pad0 : aliased xcb_randr_output_property_t_array5387;  -- /usr/include/xcb/randr.h:1482
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1476

   type xcb_randr_output_property_iterator_t is record
      data : access xcb_randr_output_property_t;  -- /usr/include/xcb/randr.h:1489
      c_rem : aliased int;  -- /usr/include/xcb/randr.h:1490
      index : aliased int;  -- /usr/include/xcb/randr.h:1491
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1488

   type xcb_randr_provider_change_t_array4353 is array (0 .. 15) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_provider_change_t is record
      timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:1498
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/randr.h:1499
      provider : aliased xcb_randr_provider_t;  -- /usr/include/xcb/randr.h:1500
      pad0 : aliased xcb_randr_provider_change_t_array4353;  -- /usr/include/xcb/randr.h:1501
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1497

   type xcb_randr_provider_change_iterator_t is record
      data : access xcb_randr_provider_change_t;  -- /usr/include/xcb/randr.h:1508
      c_rem : aliased int;  -- /usr/include/xcb/randr.h:1509
      index : aliased int;  -- /usr/include/xcb/randr.h:1510
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1507

   type xcb_randr_provider_property_t_array5387 is array (0 .. 10) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_provider_property_t is record
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/randr.h:1517
      provider : aliased xcb_randr_provider_t;  -- /usr/include/xcb/randr.h:1518
      atom : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/randr.h:1519
      timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:1520
      state : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1521
      pad0 : aliased xcb_randr_provider_property_t_array5387;  -- /usr/include/xcb/randr.h:1522
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1516

   type xcb_randr_provider_property_iterator_t is record
      data : access xcb_randr_provider_property_t;  -- /usr/include/xcb/randr.h:1529
      c_rem : aliased int;  -- /usr/include/xcb/randr.h:1530
      index : aliased int;  -- /usr/include/xcb/randr.h:1531
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1528

   type xcb_randr_resource_change_t_array1992 is array (0 .. 19) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_resource_change_t is record
      timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:1538
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/randr.h:1539
      pad0 : aliased xcb_randr_resource_change_t_array1992;  -- /usr/include/xcb/randr.h:1540
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1537

   type xcb_randr_resource_change_iterator_t is record
      data : access xcb_randr_resource_change_t;  -- /usr/include/xcb/randr.h:1547
      c_rem : aliased int;  -- /usr/include/xcb/randr.h:1548
      index : aliased int;  -- /usr/include/xcb/randr.h:1549
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1546

   type xcb_randr_monitor_info_t is record
      name : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/randr.h:1556
      primary : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1557
      automatic : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1558
      nOutput : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1559
      x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/randr.h:1560
      y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/randr.h:1561
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1562
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1563
      width_in_millimeters : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:1564
      height_in_millimeters : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:1565
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1555

   type xcb_randr_monitor_info_iterator_t is record
      data : access xcb_randr_monitor_info_t;  -- /usr/include/xcb/randr.h:1572
      c_rem : aliased int;  -- /usr/include/xcb/randr.h:1573
      index : aliased int;  -- /usr/include/xcb/randr.h:1574
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1571

   type xcb_randr_get_monitors_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/randr.h:1581
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1580

   type xcb_randr_get_monitors_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1591
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1592
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1593
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/randr.h:1594
      get_active : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1595
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1590

   type xcb_randr_get_monitors_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_get_monitors_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1602
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1603
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1604
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:1605
      timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:1606
      nMonitors : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:1607
      nOutputs : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:1608
      pad1 : aliased xcb_randr_get_monitors_reply_t_array2180;  -- /usr/include/xcb/randr.h:1609
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1601

   type xcb_randr_set_monitor_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1619
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1620
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1621
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/randr.h:1622
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1618

   type xcb_randr_delete_monitor_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1632
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1633
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1634
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/randr.h:1635
      name : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/randr.h:1636
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1631

   type xcb_randr_create_lease_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/randr.h:1643
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1642

   type xcb_randr_create_lease_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1653
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1654
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1655
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/randr.h:1656
      lid : aliased xcb_randr_lease_t;  -- /usr/include/xcb/randr.h:1657
      num_crtcs : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1658
      num_outputs : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1659
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1652

   type xcb_randr_create_lease_reply_t_array2717 is array (0 .. 23) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_create_lease_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1666
      nfd : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1667
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1668
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/randr.h:1669
      pad0 : aliased xcb_randr_create_lease_reply_t_array2717;  -- /usr/include/xcb/randr.h:1670
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1665

   type xcb_randr_free_lease_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1680
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1681
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1682
      lid : aliased xcb_randr_lease_t;  -- /usr/include/xcb/randr.h:1683
      c_terminate : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1684
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1679

   type xcb_randr_lease_notify_t_array5457 is array (0 .. 14) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_randr_lease_notify_t is record
      timestamp : aliased xproto.xcb_timestamp_t;  -- /usr/include/xcb/randr.h:1691
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/randr.h:1692
      lease : aliased xcb_randr_lease_t;  -- /usr/include/xcb/randr.h:1693
      created : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1694
      pad0 : aliased xcb_randr_lease_notify_t_array5457;  -- /usr/include/xcb/randr.h:1695
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1690

   type xcb_randr_lease_notify_iterator_t is record
      data : access xcb_randr_lease_notify_t;  -- /usr/include/xcb/randr.h:1702
      c_rem : aliased int;  -- /usr/include/xcb/randr.h:1703
      index : aliased int;  -- /usr/include/xcb/randr.h:1704
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1701

   type xcb_randr_notify_data_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            cc : aliased xcb_randr_crtc_change_t;  -- /usr/include/xcb/randr.h:1711
         when 1 =>
            oc : aliased xcb_randr_output_change_t;  -- /usr/include/xcb/randr.h:1712
         when 2 =>
            op : aliased xcb_randr_output_property_t;  -- /usr/include/xcb/randr.h:1713
         when 3 =>
            pc : aliased xcb_randr_provider_change_t;  -- /usr/include/xcb/randr.h:1714
         when 4 =>
            pp : aliased xcb_randr_provider_property_t;  -- /usr/include/xcb/randr.h:1715
         when 5 =>
            rc : aliased xcb_randr_resource_change_t;  -- /usr/include/xcb/randr.h:1716
         when others =>
            lc : aliased xcb_randr_lease_notify_t;  -- /usr/include/xcb/randr.h:1717
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- /usr/include/xcb/randr.h:1710

   type xcb_randr_notify_data_iterator_t is record
      data : access xcb_randr_notify_data_t;  -- /usr/include/xcb/randr.h:1724
      c_rem : aliased int;  -- /usr/include/xcb/randr.h:1725
      index : aliased int;  -- /usr/include/xcb/randr.h:1726
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1723

   type xcb_randr_notify_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1736
      subCode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/randr.h:1737
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/randr.h:1738
      u : aliased xcb_randr_notify_data_t;  -- /usr/include/xcb/randr.h:1739
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/randr.h:1735

   procedure xcb_randr_mode_next (i : access xcb_randr_mode_iterator_t)  -- /usr/include/xcb/randr.h:1751
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_mode_next";

   function xcb_randr_mode_end (i : xcb_randr_mode_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:1763
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_mode_end";

   procedure xcb_randr_crtc_next (i : access xcb_randr_crtc_iterator_t)  -- /usr/include/xcb/randr.h:1774
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_crtc_next";

   function xcb_randr_crtc_end (i : xcb_randr_crtc_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:1786
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_crtc_end";

   procedure xcb_randr_output_next (i : access xcb_randr_output_iterator_t)  -- /usr/include/xcb/randr.h:1797
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_output_next";

   function xcb_randr_output_end (i : xcb_randr_output_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:1809
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_output_end";

   procedure xcb_randr_provider_next (i : access xcb_randr_provider_iterator_t)  -- /usr/include/xcb/randr.h:1820
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_provider_next";

   function xcb_randr_provider_end (i : xcb_randr_provider_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:1832
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_provider_end";

   procedure xcb_randr_lease_next (i : access xcb_randr_lease_iterator_t)  -- /usr/include/xcb/randr.h:1843
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_lease_next";

   function xcb_randr_lease_end (i : xcb_randr_lease_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:1855
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_lease_end";

   procedure xcb_randr_screen_size_next (i : access xcb_randr_screen_size_iterator_t)  -- /usr/include/xcb/randr.h:1866
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_screen_size_next";

   function xcb_randr_screen_size_end (i : xcb_randr_screen_size_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:1878
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_screen_size_end";

   function xcb_randr_refresh_rates_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/randr.h:1881
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_refresh_rates_sizeof";

   function xcb_randr_refresh_rates_rates (R : access constant xcb_randr_refresh_rates_t) return access bits_stdint_uintn_h.uint16_t  -- /usr/include/xcb/randr.h:1884
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_refresh_rates_rates";

   function xcb_randr_refresh_rates_rates_length (R : access constant xcb_randr_refresh_rates_t) return int  -- /usr/include/xcb/randr.h:1887
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_refresh_rates_rates_length";

   function xcb_randr_refresh_rates_rates_end (R : access constant xcb_randr_refresh_rates_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:1890
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_refresh_rates_rates_end";

   procedure xcb_randr_refresh_rates_next (i : access xcb_randr_refresh_rates_iterator_t)  -- /usr/include/xcb/randr.h:1901
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_refresh_rates_next";

   function xcb_randr_refresh_rates_end (i : xcb_randr_refresh_rates_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:1913
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_refresh_rates_end";

   function xcb_randr_query_version
     (c : access xcb.xcb_connection_t;
      major_version : bits_stdint_uintn_h.uint32_t;
      minor_version : bits_stdint_uintn_h.uint32_t) return xcb_randr_query_version_cookie_t  -- /usr/include/xcb/randr.h:1924
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_query_version";

   function xcb_randr_query_version_unchecked
     (c : access xcb.xcb_connection_t;
      major_version : bits_stdint_uintn_h.uint32_t;
      minor_version : bits_stdint_uintn_h.uint32_t) return xcb_randr_query_version_cookie_t  -- /usr/include/xcb/randr.h:1940
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_query_version_unchecked";

   function xcb_randr_query_version_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_randr_query_version_cookie_t;
      e : System.Address) return access xcb_randr_query_version_reply_t  -- /usr/include/xcb/randr.h:1959
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_query_version_reply";

   function xcb_randr_set_screen_config
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      timestamp : xproto.xcb_timestamp_t;
      config_timestamp : xproto.xcb_timestamp_t;
      sizeID : bits_stdint_uintn_h.uint16_t;
      rotation : bits_stdint_uintn_h.uint16_t;
      rate : bits_stdint_uintn_h.uint16_t) return xcb_randr_set_screen_config_cookie_t  -- /usr/include/xcb/randr.h:1972
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_screen_config";

   function xcb_randr_set_screen_config_unchecked
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      timestamp : xproto.xcb_timestamp_t;
      config_timestamp : xproto.xcb_timestamp_t;
      sizeID : bits_stdint_uintn_h.uint16_t;
      rotation : bits_stdint_uintn_h.uint16_t;
      rate : bits_stdint_uintn_h.uint16_t) return xcb_randr_set_screen_config_cookie_t  -- /usr/include/xcb/randr.h:1992
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_screen_config_unchecked";

   function xcb_randr_set_screen_config_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_randr_set_screen_config_cookie_t;
      e : System.Address) return access xcb_randr_set_screen_config_reply_t  -- /usr/include/xcb/randr.h:2015
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_screen_config_reply";

   function xcb_randr_select_input_checked
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      enable : bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:2031
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_select_input_checked";

   function xcb_randr_select_input
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      enable : bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:2044
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_select_input";

   function xcb_randr_get_screen_info_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/randr.h:2049
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_info_sizeof";

   function xcb_randr_get_screen_info (c : access xcb.xcb_connection_t; window : xproto.xcb_window_t) return xcb_randr_get_screen_info_cookie_t  -- /usr/include/xcb/randr.h:2060
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_info";

   function xcb_randr_get_screen_info_unchecked (c : access xcb.xcb_connection_t; window : xproto.xcb_window_t) return xcb_randr_get_screen_info_cookie_t  -- /usr/include/xcb/randr.h:2075
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_info_unchecked";

   function xcb_randr_get_screen_info_sizes (R : access constant xcb_randr_get_screen_info_reply_t) return access xcb_randr_screen_size_t  -- /usr/include/xcb/randr.h:2079
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_info_sizes";

   function xcb_randr_get_screen_info_sizes_length (R : access constant xcb_randr_get_screen_info_reply_t) return int  -- /usr/include/xcb/randr.h:2082
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_info_sizes_length";

   function xcb_randr_get_screen_info_sizes_iterator (R : access constant xcb_randr_get_screen_info_reply_t) return xcb_randr_screen_size_iterator_t  -- /usr/include/xcb/randr.h:2085
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_info_sizes_iterator";

   function xcb_randr_get_screen_info_rates_length (R : access constant xcb_randr_get_screen_info_reply_t) return int  -- /usr/include/xcb/randr.h:2088
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_info_rates_length";

   function xcb_randr_get_screen_info_rates_iterator (R : access constant xcb_randr_get_screen_info_reply_t) return xcb_randr_refresh_rates_iterator_t  -- /usr/include/xcb/randr.h:2091
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_info_rates_iterator";

   function xcb_randr_get_screen_info_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_randr_get_screen_info_cookie_t;
      e : System.Address) return access xcb_randr_get_screen_info_reply_t  -- /usr/include/xcb/randr.h:2108
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_info_reply";

   function xcb_randr_get_screen_size_range (c : access xcb.xcb_connection_t; window : xproto.xcb_window_t) return xcb_randr_get_screen_size_range_cookie_t  -- /usr/include/xcb/randr.h:2121
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_size_range";

   function xcb_randr_get_screen_size_range_unchecked (c : access xcb.xcb_connection_t; window : xproto.xcb_window_t) return xcb_randr_get_screen_size_range_cookie_t  -- /usr/include/xcb/randr.h:2136
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_size_range_unchecked";

   function xcb_randr_get_screen_size_range_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_randr_get_screen_size_range_cookie_t;
      e : System.Address) return access xcb_randr_get_screen_size_range_reply_t  -- /usr/include/xcb/randr.h:2154
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_size_range_reply";

   function xcb_randr_set_screen_size_checked
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      width : bits_stdint_uintn_h.uint16_t;
      height : bits_stdint_uintn_h.uint16_t;
      mm_width : bits_stdint_uintn_h.uint32_t;
      mm_height : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:2170
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_screen_size_checked";

   function xcb_randr_set_screen_size
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      width : bits_stdint_uintn_h.uint16_t;
      height : bits_stdint_uintn_h.uint16_t;
      mm_width : bits_stdint_uintn_h.uint32_t;
      mm_height : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:2186
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_screen_size";

   procedure xcb_randr_mode_info_next (i : access xcb_randr_mode_info_iterator_t)  -- /usr/include/xcb/randr.h:2202
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_mode_info_next";

   function xcb_randr_mode_info_end (i : xcb_randr_mode_info_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:2214
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_mode_info_end";

   function xcb_randr_get_screen_resources_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/randr.h:2217
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_sizeof";

   function xcb_randr_get_screen_resources (c : access xcb.xcb_connection_t; window : xproto.xcb_window_t) return xcb_randr_get_screen_resources_cookie_t  -- /usr/include/xcb/randr.h:2228
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources";

   function xcb_randr_get_screen_resources_unchecked (c : access xcb.xcb_connection_t; window : xproto.xcb_window_t) return xcb_randr_get_screen_resources_cookie_t  -- /usr/include/xcb/randr.h:2243
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_unchecked";

   function xcb_randr_get_screen_resources_crtcs (R : access constant xcb_randr_get_screen_resources_reply_t) return access xcb_randr_crtc_t  -- /usr/include/xcb/randr.h:2247
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_crtcs";

   function xcb_randr_get_screen_resources_crtcs_length (R : access constant xcb_randr_get_screen_resources_reply_t) return int  -- /usr/include/xcb/randr.h:2250
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_crtcs_length";

   function xcb_randr_get_screen_resources_crtcs_end (R : access constant xcb_randr_get_screen_resources_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:2253
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_crtcs_end";

   function xcb_randr_get_screen_resources_outputs (R : access constant xcb_randr_get_screen_resources_reply_t) return access xcb_randr_output_t  -- /usr/include/xcb/randr.h:2256
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_outputs";

   function xcb_randr_get_screen_resources_outputs_length (R : access constant xcb_randr_get_screen_resources_reply_t) return int  -- /usr/include/xcb/randr.h:2259
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_outputs_length";

   function xcb_randr_get_screen_resources_outputs_end (R : access constant xcb_randr_get_screen_resources_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:2262
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_outputs_end";

   function xcb_randr_get_screen_resources_modes (R : access constant xcb_randr_get_screen_resources_reply_t) return access xcb_randr_mode_info_t  -- /usr/include/xcb/randr.h:2265
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_modes";

   function xcb_randr_get_screen_resources_modes_length (R : access constant xcb_randr_get_screen_resources_reply_t) return int  -- /usr/include/xcb/randr.h:2268
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_modes_length";

   function xcb_randr_get_screen_resources_modes_iterator (R : access constant xcb_randr_get_screen_resources_reply_t) return xcb_randr_mode_info_iterator_t  -- /usr/include/xcb/randr.h:2271
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_modes_iterator";

   function xcb_randr_get_screen_resources_names (R : access constant xcb_randr_get_screen_resources_reply_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/randr.h:2274
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_names";

   function xcb_randr_get_screen_resources_names_length (R : access constant xcb_randr_get_screen_resources_reply_t) return int  -- /usr/include/xcb/randr.h:2277
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_names_length";

   function xcb_randr_get_screen_resources_names_end (R : access constant xcb_randr_get_screen_resources_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:2280
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_names_end";

   function xcb_randr_get_screen_resources_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_randr_get_screen_resources_cookie_t;
      e : System.Address) return access xcb_randr_get_screen_resources_reply_t  -- /usr/include/xcb/randr.h:2297
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_reply";

   function xcb_randr_get_output_info_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/randr.h:2302
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_output_info_sizeof";

   function xcb_randr_get_output_info
     (c : access xcb.xcb_connection_t;
      output : xcb_randr_output_t;
      config_timestamp : xproto.xcb_timestamp_t) return xcb_randr_get_output_info_cookie_t  -- /usr/include/xcb/randr.h:2313
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_output_info";

   function xcb_randr_get_output_info_unchecked
     (c : access xcb.xcb_connection_t;
      output : xcb_randr_output_t;
      config_timestamp : xproto.xcb_timestamp_t) return xcb_randr_get_output_info_cookie_t  -- /usr/include/xcb/randr.h:2329
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_output_info_unchecked";

   function xcb_randr_get_output_info_crtcs (R : access constant xcb_randr_get_output_info_reply_t) return access xcb_randr_crtc_t  -- /usr/include/xcb/randr.h:2334
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_output_info_crtcs";

   function xcb_randr_get_output_info_crtcs_length (R : access constant xcb_randr_get_output_info_reply_t) return int  -- /usr/include/xcb/randr.h:2337
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_output_info_crtcs_length";

   function xcb_randr_get_output_info_crtcs_end (R : access constant xcb_randr_get_output_info_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:2340
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_output_info_crtcs_end";

   function xcb_randr_get_output_info_modes (R : access constant xcb_randr_get_output_info_reply_t) return access xcb_randr_mode_t  -- /usr/include/xcb/randr.h:2343
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_output_info_modes";

   function xcb_randr_get_output_info_modes_length (R : access constant xcb_randr_get_output_info_reply_t) return int  -- /usr/include/xcb/randr.h:2346
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_output_info_modes_length";

   function xcb_randr_get_output_info_modes_end (R : access constant xcb_randr_get_output_info_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:2349
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_output_info_modes_end";

   function xcb_randr_get_output_info_clones (R : access constant xcb_randr_get_output_info_reply_t) return access xcb_randr_output_t  -- /usr/include/xcb/randr.h:2352
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_output_info_clones";

   function xcb_randr_get_output_info_clones_length (R : access constant xcb_randr_get_output_info_reply_t) return int  -- /usr/include/xcb/randr.h:2355
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_output_info_clones_length";

   function xcb_randr_get_output_info_clones_end (R : access constant xcb_randr_get_output_info_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:2358
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_output_info_clones_end";

   function xcb_randr_get_output_info_name (R : access constant xcb_randr_get_output_info_reply_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/randr.h:2361
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_output_info_name";

   function xcb_randr_get_output_info_name_length (R : access constant xcb_randr_get_output_info_reply_t) return int  -- /usr/include/xcb/randr.h:2364
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_output_info_name_length";

   function xcb_randr_get_output_info_name_end (R : access constant xcb_randr_get_output_info_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:2367
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_output_info_name_end";

   function xcb_randr_get_output_info_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_randr_get_output_info_cookie_t;
      e : System.Address) return access xcb_randr_get_output_info_reply_t  -- /usr/include/xcb/randr.h:2384
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_output_info_reply";

   function xcb_randr_list_output_properties_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/randr.h:2389
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_list_output_properties_sizeof";

   function xcb_randr_list_output_properties (c : access xcb.xcb_connection_t; output : xcb_randr_output_t) return xcb_randr_list_output_properties_cookie_t  -- /usr/include/xcb/randr.h:2400
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_list_output_properties";

   function xcb_randr_list_output_properties_unchecked (c : access xcb.xcb_connection_t; output : xcb_randr_output_t) return xcb_randr_list_output_properties_cookie_t  -- /usr/include/xcb/randr.h:2415
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_list_output_properties_unchecked";

   function xcb_randr_list_output_properties_atoms (R : access constant xcb_randr_list_output_properties_reply_t) return access xproto.xcb_atom_t  -- /usr/include/xcb/randr.h:2419
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_list_output_properties_atoms";

   function xcb_randr_list_output_properties_atoms_length (R : access constant xcb_randr_list_output_properties_reply_t) return int  -- /usr/include/xcb/randr.h:2422
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_list_output_properties_atoms_length";

   function xcb_randr_list_output_properties_atoms_end (R : access constant xcb_randr_list_output_properties_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:2425
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_list_output_properties_atoms_end";

   function xcb_randr_list_output_properties_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_randr_list_output_properties_cookie_t;
      e : System.Address) return access xcb_randr_list_output_properties_reply_t  -- /usr/include/xcb/randr.h:2442
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_list_output_properties_reply";

   function xcb_randr_query_output_property_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/randr.h:2447
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_query_output_property_sizeof";

   function xcb_randr_query_output_property
     (c : access xcb.xcb_connection_t;
      output : xcb_randr_output_t;
      property : xproto.xcb_atom_t) return xcb_randr_query_output_property_cookie_t  -- /usr/include/xcb/randr.h:2458
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_query_output_property";

   function xcb_randr_query_output_property_unchecked
     (c : access xcb.xcb_connection_t;
      output : xcb_randr_output_t;
      property : xproto.xcb_atom_t) return xcb_randr_query_output_property_cookie_t  -- /usr/include/xcb/randr.h:2474
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_query_output_property_unchecked";

   function xcb_randr_query_output_property_valid_values (R : access constant xcb_randr_query_output_property_reply_t) return access bits_stdint_intn_h.int32_t  -- /usr/include/xcb/randr.h:2479
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_query_output_property_valid_values";

   function xcb_randr_query_output_property_valid_values_length (R : access constant xcb_randr_query_output_property_reply_t) return int  -- /usr/include/xcb/randr.h:2482
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_query_output_property_valid_values_length";

   function xcb_randr_query_output_property_valid_values_end (R : access constant xcb_randr_query_output_property_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:2485
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_query_output_property_valid_values_end";

   function xcb_randr_query_output_property_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_randr_query_output_property_cookie_t;
      e : System.Address) return access xcb_randr_query_output_property_reply_t  -- /usr/include/xcb/randr.h:2502
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_query_output_property_reply";

   function xcb_randr_configure_output_property_sizeof (u_buffer : System.Address; values_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/randr.h:2507
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_configure_output_property_sizeof";

   function xcb_randr_configure_output_property_checked
     (c : access xcb.xcb_connection_t;
      output : xcb_randr_output_t;
      property : xproto.xcb_atom_t;
      pending : bits_stdint_uintn_h.uint8_t;
      c_range : bits_stdint_uintn_h.uint8_t;
      values_len : bits_stdint_uintn_h.uint32_t;
      values : access bits_stdint_intn_h.int32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:2522
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_configure_output_property_checked";

   function xcb_randr_configure_output_property
     (c : access xcb.xcb_connection_t;
      output : xcb_randr_output_t;
      property : xproto.xcb_atom_t;
      pending : bits_stdint_uintn_h.uint8_t;
      c_range : bits_stdint_uintn_h.uint8_t;
      values_len : bits_stdint_uintn_h.uint32_t;
      values : access bits_stdint_intn_h.int32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:2539
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_configure_output_property";

   function xcb_randr_configure_output_property_values (R : access constant xcb_randr_configure_output_property_request_t) return access bits_stdint_intn_h.int32_t  -- /usr/include/xcb/randr.h:2548
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_configure_output_property_values";

   function xcb_randr_configure_output_property_values_length (R : access constant xcb_randr_configure_output_property_request_t) return int  -- /usr/include/xcb/randr.h:2551
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_configure_output_property_values_length";

   function xcb_randr_configure_output_property_values_end (R : access constant xcb_randr_configure_output_property_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:2554
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_configure_output_property_values_end";

   function xcb_randr_change_output_property_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/randr.h:2557
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_change_output_property_sizeof";

   function xcb_randr_change_output_property_checked
     (c : access xcb.xcb_connection_t;
      output : xcb_randr_output_t;
      property : xproto.xcb_atom_t;
      c_type : xproto.xcb_atom_t;
      format : bits_stdint_uintn_h.uint8_t;
      mode : bits_stdint_uintn_h.uint8_t;
      num_units : bits_stdint_uintn_h.uint32_t;
      data : System.Address) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:2571
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_change_output_property_checked";

   function xcb_randr_change_output_property
     (c : access xcb.xcb_connection_t;
      output : xcb_randr_output_t;
      property : xproto.xcb_atom_t;
      c_type : xproto.xcb_atom_t;
      format : bits_stdint_uintn_h.uint8_t;
      mode : bits_stdint_uintn_h.uint8_t;
      num_units : bits_stdint_uintn_h.uint32_t;
      data : System.Address) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:2589
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_change_output_property";

   function xcb_randr_change_output_property_data (R : access constant xcb_randr_change_output_property_request_t) return System.Address  -- /usr/include/xcb/randr.h:2599
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_change_output_property_data";

   function xcb_randr_change_output_property_data_length (R : access constant xcb_randr_change_output_property_request_t) return int  -- /usr/include/xcb/randr.h:2602
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_change_output_property_data_length";

   function xcb_randr_change_output_property_data_end (R : access constant xcb_randr_change_output_property_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:2605
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_change_output_property_data_end";

   function xcb_randr_delete_output_property_checked
     (c : access xcb.xcb_connection_t;
      output : xcb_randr_output_t;
      property : xproto.xcb_atom_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:2619
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_delete_output_property_checked";

   function xcb_randr_delete_output_property
     (c : access xcb.xcb_connection_t;
      output : xcb_randr_output_t;
      property : xproto.xcb_atom_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:2632
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_delete_output_property";

   function xcb_randr_get_output_property_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/randr.h:2637
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_output_property_sizeof";

   function xcb_randr_get_output_property
     (c : access xcb.xcb_connection_t;
      output : xcb_randr_output_t;
      property : xproto.xcb_atom_t;
      c_type : xproto.xcb_atom_t;
      long_offset : bits_stdint_uintn_h.uint32_t;
      long_length : bits_stdint_uintn_h.uint32_t;
      u_delete : bits_stdint_uintn_h.uint8_t;
      pending : bits_stdint_uintn_h.uint8_t) return xcb_randr_get_output_property_cookie_t  -- /usr/include/xcb/randr.h:2648
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_output_property";

   function xcb_randr_get_output_property_unchecked
     (c : access xcb.xcb_connection_t;
      output : xcb_randr_output_t;
      property : xproto.xcb_atom_t;
      c_type : xproto.xcb_atom_t;
      long_offset : bits_stdint_uintn_h.uint32_t;
      long_length : bits_stdint_uintn_h.uint32_t;
      u_delete : bits_stdint_uintn_h.uint8_t;
      pending : bits_stdint_uintn_h.uint8_t) return xcb_randr_get_output_property_cookie_t  -- /usr/include/xcb/randr.h:2669
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_output_property_unchecked";

   function xcb_randr_get_output_property_data (R : access constant xcb_randr_get_output_property_reply_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/randr.h:2679
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_output_property_data";

   function xcb_randr_get_output_property_data_length (R : access constant xcb_randr_get_output_property_reply_t) return int  -- /usr/include/xcb/randr.h:2682
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_output_property_data_length";

   function xcb_randr_get_output_property_data_end (R : access constant xcb_randr_get_output_property_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:2685
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_output_property_data_end";

   function xcb_randr_get_output_property_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_randr_get_output_property_cookie_t;
      e : System.Address) return access xcb_randr_get_output_property_reply_t  -- /usr/include/xcb/randr.h:2702
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_output_property_reply";

   function xcb_randr_create_mode_sizeof (u_buffer : System.Address; name_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/randr.h:2707
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_create_mode_sizeof";

   function xcb_randr_create_mode
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      mode_info : xcb_randr_mode_info_t;
      name_len : bits_stdint_uintn_h.uint32_t;
      name : Interfaces.C.Strings.chars_ptr) return xcb_randr_create_mode_cookie_t  -- /usr/include/xcb/randr.h:2719
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_create_mode";

   function xcb_randr_create_mode_unchecked
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      mode_info : xcb_randr_mode_info_t;
      name_len : bits_stdint_uintn_h.uint32_t;
      name : Interfaces.C.Strings.chars_ptr) return xcb_randr_create_mode_cookie_t  -- /usr/include/xcb/randr.h:2737
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_create_mode_unchecked";

   function xcb_randr_create_mode_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_randr_create_mode_cookie_t;
      e : System.Address) return access xcb_randr_create_mode_reply_t  -- /usr/include/xcb/randr.h:2758
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_create_mode_reply";

   function xcb_randr_destroy_mode_checked (c : access xcb.xcb_connection_t; mode : xcb_randr_mode_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:2774
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_destroy_mode_checked";

   function xcb_randr_destroy_mode (c : access xcb.xcb_connection_t; mode : xcb_randr_mode_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:2786
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_destroy_mode";

   function xcb_randr_add_output_mode_checked
     (c : access xcb.xcb_connection_t;
      output : xcb_randr_output_t;
      mode : xcb_randr_mode_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:2801
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_add_output_mode_checked";

   function xcb_randr_add_output_mode
     (c : access xcb.xcb_connection_t;
      output : xcb_randr_output_t;
      mode : xcb_randr_mode_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:2814
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_add_output_mode";

   function xcb_randr_delete_output_mode_checked
     (c : access xcb.xcb_connection_t;
      output : xcb_randr_output_t;
      mode : xcb_randr_mode_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:2830
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_delete_output_mode_checked";

   function xcb_randr_delete_output_mode
     (c : access xcb.xcb_connection_t;
      output : xcb_randr_output_t;
      mode : xcb_randr_mode_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:2843
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_delete_output_mode";

   function xcb_randr_get_crtc_info_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/randr.h:2848
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_info_sizeof";

   function xcb_randr_get_crtc_info
     (c : access xcb.xcb_connection_t;
      crtc : xcb_randr_crtc_t;
      config_timestamp : xproto.xcb_timestamp_t) return xcb_randr_get_crtc_info_cookie_t  -- /usr/include/xcb/randr.h:2859
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_info";

   function xcb_randr_get_crtc_info_unchecked
     (c : access xcb.xcb_connection_t;
      crtc : xcb_randr_crtc_t;
      config_timestamp : xproto.xcb_timestamp_t) return xcb_randr_get_crtc_info_cookie_t  -- /usr/include/xcb/randr.h:2875
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_info_unchecked";

   function xcb_randr_get_crtc_info_outputs (R : access constant xcb_randr_get_crtc_info_reply_t) return access xcb_randr_output_t  -- /usr/include/xcb/randr.h:2880
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_info_outputs";

   function xcb_randr_get_crtc_info_outputs_length (R : access constant xcb_randr_get_crtc_info_reply_t) return int  -- /usr/include/xcb/randr.h:2883
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_info_outputs_length";

   function xcb_randr_get_crtc_info_outputs_end (R : access constant xcb_randr_get_crtc_info_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:2886
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_info_outputs_end";

   function xcb_randr_get_crtc_info_possible (R : access constant xcb_randr_get_crtc_info_reply_t) return access xcb_randr_output_t  -- /usr/include/xcb/randr.h:2889
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_info_possible";

   function xcb_randr_get_crtc_info_possible_length (R : access constant xcb_randr_get_crtc_info_reply_t) return int  -- /usr/include/xcb/randr.h:2892
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_info_possible_length";

   function xcb_randr_get_crtc_info_possible_end (R : access constant xcb_randr_get_crtc_info_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:2895
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_info_possible_end";

   function xcb_randr_get_crtc_info_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_randr_get_crtc_info_cookie_t;
      e : System.Address) return access xcb_randr_get_crtc_info_reply_t  -- /usr/include/xcb/randr.h:2912
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_info_reply";

   function xcb_randr_set_crtc_config_sizeof (u_buffer : System.Address; outputs_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/randr.h:2917
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_crtc_config_sizeof";

   function xcb_randr_set_crtc_config
     (c : access xcb.xcb_connection_t;
      crtc : xcb_randr_crtc_t;
      timestamp : xproto.xcb_timestamp_t;
      config_timestamp : xproto.xcb_timestamp_t;
      x : bits_stdint_intn_h.int16_t;
      y : bits_stdint_intn_h.int16_t;
      mode : xcb_randr_mode_t;
      rotation : bits_stdint_uintn_h.uint16_t;
      outputs_len : bits_stdint_uintn_h.uint32_t;
      outputs : access xcb_randr_output_t) return xcb_randr_set_crtc_config_cookie_t  -- /usr/include/xcb/randr.h:2929
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_crtc_config";

   function xcb_randr_set_crtc_config_unchecked
     (c : access xcb.xcb_connection_t;
      crtc : xcb_randr_crtc_t;
      timestamp : xproto.xcb_timestamp_t;
      config_timestamp : xproto.xcb_timestamp_t;
      x : bits_stdint_intn_h.int16_t;
      y : bits_stdint_intn_h.int16_t;
      mode : xcb_randr_mode_t;
      rotation : bits_stdint_uintn_h.uint16_t;
      outputs_len : bits_stdint_uintn_h.uint32_t;
      outputs : access xcb_randr_output_t) return xcb_randr_set_crtc_config_cookie_t  -- /usr/include/xcb/randr.h:2952
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_crtc_config_unchecked";

   function xcb_randr_set_crtc_config_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_randr_set_crtc_config_cookie_t;
      e : System.Address) return access xcb_randr_set_crtc_config_reply_t  -- /usr/include/xcb/randr.h:2978
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_crtc_config_reply";

   function xcb_randr_get_crtc_gamma_size (c : access xcb.xcb_connection_t; crtc : xcb_randr_crtc_t) return xcb_randr_get_crtc_gamma_size_cookie_t  -- /usr/include/xcb/randr.h:2991
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_gamma_size";

   function xcb_randr_get_crtc_gamma_size_unchecked (c : access xcb.xcb_connection_t; crtc : xcb_randr_crtc_t) return xcb_randr_get_crtc_gamma_size_cookie_t  -- /usr/include/xcb/randr.h:3006
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_gamma_size_unchecked";

   function xcb_randr_get_crtc_gamma_size_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_randr_get_crtc_gamma_size_cookie_t;
      e : System.Address) return access xcb_randr_get_crtc_gamma_size_reply_t  -- /usr/include/xcb/randr.h:3024
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_gamma_size_reply";

   function xcb_randr_get_crtc_gamma_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/randr.h:3029
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_gamma_sizeof";

   function xcb_randr_get_crtc_gamma (c : access xcb.xcb_connection_t; crtc : xcb_randr_crtc_t) return xcb_randr_get_crtc_gamma_cookie_t  -- /usr/include/xcb/randr.h:3040
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_gamma";

   function xcb_randr_get_crtc_gamma_unchecked (c : access xcb.xcb_connection_t; crtc : xcb_randr_crtc_t) return xcb_randr_get_crtc_gamma_cookie_t  -- /usr/include/xcb/randr.h:3055
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_gamma_unchecked";

   function xcb_randr_get_crtc_gamma_red (R : access constant xcb_randr_get_crtc_gamma_reply_t) return access bits_stdint_uintn_h.uint16_t  -- /usr/include/xcb/randr.h:3059
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_gamma_red";

   function xcb_randr_get_crtc_gamma_red_length (R : access constant xcb_randr_get_crtc_gamma_reply_t) return int  -- /usr/include/xcb/randr.h:3062
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_gamma_red_length";

   function xcb_randr_get_crtc_gamma_red_end (R : access constant xcb_randr_get_crtc_gamma_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:3065
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_gamma_red_end";

   function xcb_randr_get_crtc_gamma_green (R : access constant xcb_randr_get_crtc_gamma_reply_t) return access bits_stdint_uintn_h.uint16_t  -- /usr/include/xcb/randr.h:3068
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_gamma_green";

   function xcb_randr_get_crtc_gamma_green_length (R : access constant xcb_randr_get_crtc_gamma_reply_t) return int  -- /usr/include/xcb/randr.h:3071
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_gamma_green_length";

   function xcb_randr_get_crtc_gamma_green_end (R : access constant xcb_randr_get_crtc_gamma_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:3074
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_gamma_green_end";

   function xcb_randr_get_crtc_gamma_blue (R : access constant xcb_randr_get_crtc_gamma_reply_t) return access bits_stdint_uintn_h.uint16_t  -- /usr/include/xcb/randr.h:3077
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_gamma_blue";

   function xcb_randr_get_crtc_gamma_blue_length (R : access constant xcb_randr_get_crtc_gamma_reply_t) return int  -- /usr/include/xcb/randr.h:3080
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_gamma_blue_length";

   function xcb_randr_get_crtc_gamma_blue_end (R : access constant xcb_randr_get_crtc_gamma_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:3083
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_gamma_blue_end";

   function xcb_randr_get_crtc_gamma_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_randr_get_crtc_gamma_cookie_t;
      e : System.Address) return access xcb_randr_get_crtc_gamma_reply_t  -- /usr/include/xcb/randr.h:3100
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_gamma_reply";

   function xcb_randr_set_crtc_gamma_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/randr.h:3105
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_crtc_gamma_sizeof";

   function xcb_randr_set_crtc_gamma_checked
     (c : access xcb.xcb_connection_t;
      crtc : xcb_randr_crtc_t;
      size : bits_stdint_uintn_h.uint16_t;
      red : access bits_stdint_uintn_h.uint16_t;
      green : access bits_stdint_uintn_h.uint16_t;
      blue : access bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:3119
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_crtc_gamma_checked";

   function xcb_randr_set_crtc_gamma
     (c : access xcb.xcb_connection_t;
      crtc : xcb_randr_crtc_t;
      size : bits_stdint_uintn_h.uint16_t;
      red : access bits_stdint_uintn_h.uint16_t;
      green : access bits_stdint_uintn_h.uint16_t;
      blue : access bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:3135
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_crtc_gamma";

   function xcb_randr_set_crtc_gamma_red (R : access constant xcb_randr_set_crtc_gamma_request_t) return access bits_stdint_uintn_h.uint16_t  -- /usr/include/xcb/randr.h:3143
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_crtc_gamma_red";

   function xcb_randr_set_crtc_gamma_red_length (R : access constant xcb_randr_set_crtc_gamma_request_t) return int  -- /usr/include/xcb/randr.h:3146
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_crtc_gamma_red_length";

   function xcb_randr_set_crtc_gamma_red_end (R : access constant xcb_randr_set_crtc_gamma_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:3149
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_crtc_gamma_red_end";

   function xcb_randr_set_crtc_gamma_green (R : access constant xcb_randr_set_crtc_gamma_request_t) return access bits_stdint_uintn_h.uint16_t  -- /usr/include/xcb/randr.h:3152
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_crtc_gamma_green";

   function xcb_randr_set_crtc_gamma_green_length (R : access constant xcb_randr_set_crtc_gamma_request_t) return int  -- /usr/include/xcb/randr.h:3155
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_crtc_gamma_green_length";

   function xcb_randr_set_crtc_gamma_green_end (R : access constant xcb_randr_set_crtc_gamma_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:3158
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_crtc_gamma_green_end";

   function xcb_randr_set_crtc_gamma_blue (R : access constant xcb_randr_set_crtc_gamma_request_t) return access bits_stdint_uintn_h.uint16_t  -- /usr/include/xcb/randr.h:3161
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_crtc_gamma_blue";

   function xcb_randr_set_crtc_gamma_blue_length (R : access constant xcb_randr_set_crtc_gamma_request_t) return int  -- /usr/include/xcb/randr.h:3164
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_crtc_gamma_blue_length";

   function xcb_randr_set_crtc_gamma_blue_end (R : access constant xcb_randr_set_crtc_gamma_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:3167
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_crtc_gamma_blue_end";

   function xcb_randr_get_screen_resources_current_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/randr.h:3170
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_current_sizeof";

   function xcb_randr_get_screen_resources_current (c : access xcb.xcb_connection_t; window : xproto.xcb_window_t) return xcb_randr_get_screen_resources_current_cookie_t  -- /usr/include/xcb/randr.h:3181
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_current";

   function xcb_randr_get_screen_resources_current_unchecked (c : access xcb.xcb_connection_t; window : xproto.xcb_window_t) return xcb_randr_get_screen_resources_current_cookie_t  -- /usr/include/xcb/randr.h:3196
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_current_unchecked";

   function xcb_randr_get_screen_resources_current_crtcs (R : access constant xcb_randr_get_screen_resources_current_reply_t) return access xcb_randr_crtc_t  -- /usr/include/xcb/randr.h:3200
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_current_crtcs";

   function xcb_randr_get_screen_resources_current_crtcs_length (R : access constant xcb_randr_get_screen_resources_current_reply_t) return int  -- /usr/include/xcb/randr.h:3203
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_current_crtcs_length";

   function xcb_randr_get_screen_resources_current_crtcs_end (R : access constant xcb_randr_get_screen_resources_current_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:3206
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_current_crtcs_end";

   function xcb_randr_get_screen_resources_current_outputs (R : access constant xcb_randr_get_screen_resources_current_reply_t) return access xcb_randr_output_t  -- /usr/include/xcb/randr.h:3209
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_current_outputs";

   function xcb_randr_get_screen_resources_current_outputs_length (R : access constant xcb_randr_get_screen_resources_current_reply_t) return int  -- /usr/include/xcb/randr.h:3212
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_current_outputs_length";

   function xcb_randr_get_screen_resources_current_outputs_end (R : access constant xcb_randr_get_screen_resources_current_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:3215
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_current_outputs_end";

   function xcb_randr_get_screen_resources_current_modes (R : access constant xcb_randr_get_screen_resources_current_reply_t) return access xcb_randr_mode_info_t  -- /usr/include/xcb/randr.h:3218
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_current_modes";

   function xcb_randr_get_screen_resources_current_modes_length (R : access constant xcb_randr_get_screen_resources_current_reply_t) return int  -- /usr/include/xcb/randr.h:3221
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_current_modes_length";

   function xcb_randr_get_screen_resources_current_modes_iterator (R : access constant xcb_randr_get_screen_resources_current_reply_t) return xcb_randr_mode_info_iterator_t  -- /usr/include/xcb/randr.h:3224
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_current_modes_iterator";

   function xcb_randr_get_screen_resources_current_names (R : access constant xcb_randr_get_screen_resources_current_reply_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/randr.h:3227
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_current_names";

   function xcb_randr_get_screen_resources_current_names_length (R : access constant xcb_randr_get_screen_resources_current_reply_t) return int  -- /usr/include/xcb/randr.h:3230
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_current_names_length";

   function xcb_randr_get_screen_resources_current_names_end (R : access constant xcb_randr_get_screen_resources_current_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:3233
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_current_names_end";

   function xcb_randr_get_screen_resources_current_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_randr_get_screen_resources_current_cookie_t;
      e : System.Address) return access xcb_randr_get_screen_resources_current_reply_t  -- /usr/include/xcb/randr.h:3250
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_screen_resources_current_reply";

   function xcb_randr_set_crtc_transform_sizeof (u_buffer : System.Address; filter_params_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/randr.h:3255
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_crtc_transform_sizeof";

   function xcb_randr_set_crtc_transform_checked
     (c : access xcb.xcb_connection_t;
      crtc : xcb_randr_crtc_t;
      transform : xcb_render.xcb_render_transform_t;
      filter_len : bits_stdint_uintn_h.uint16_t;
      filter_name : Interfaces.C.Strings.chars_ptr;
      filter_params_len : bits_stdint_uintn_h.uint32_t;
      filter_params : access xcb_render.xcb_render_fixed_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:3270
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_crtc_transform_checked";

   function xcb_randr_set_crtc_transform
     (c : access xcb.xcb_connection_t;
      crtc : xcb_randr_crtc_t;
      transform : xcb_render.xcb_render_transform_t;
      filter_len : bits_stdint_uintn_h.uint16_t;
      filter_name : Interfaces.C.Strings.chars_ptr;
      filter_params_len : bits_stdint_uintn_h.uint32_t;
      filter_params : access xcb_render.xcb_render_fixed_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:3287
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_crtc_transform";

   function xcb_randr_set_crtc_transform_filter_name (R : access constant xcb_randr_set_crtc_transform_request_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/randr.h:3296
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_crtc_transform_filter_name";

   function xcb_randr_set_crtc_transform_filter_name_length (R : access constant xcb_randr_set_crtc_transform_request_t) return int  -- /usr/include/xcb/randr.h:3299
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_crtc_transform_filter_name_length";

   function xcb_randr_set_crtc_transform_filter_name_end (R : access constant xcb_randr_set_crtc_transform_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:3302
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_crtc_transform_filter_name_end";

   function xcb_randr_set_crtc_transform_filter_params (R : access constant xcb_randr_set_crtc_transform_request_t) return access xcb_render.xcb_render_fixed_t  -- /usr/include/xcb/randr.h:3305
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_crtc_transform_filter_params";

   function xcb_randr_set_crtc_transform_filter_params_length (R : access constant xcb_randr_set_crtc_transform_request_t) return int  -- /usr/include/xcb/randr.h:3308
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_crtc_transform_filter_params_length";

   function xcb_randr_set_crtc_transform_filter_params_end (R : access constant xcb_randr_set_crtc_transform_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:3311
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_crtc_transform_filter_params_end";

   function xcb_randr_get_crtc_transform_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/randr.h:3314
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_transform_sizeof";

   function xcb_randr_get_crtc_transform (c : access xcb.xcb_connection_t; crtc : xcb_randr_crtc_t) return xcb_randr_get_crtc_transform_cookie_t  -- /usr/include/xcb/randr.h:3325
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_transform";

   function xcb_randr_get_crtc_transform_unchecked (c : access xcb.xcb_connection_t; crtc : xcb_randr_crtc_t) return xcb_randr_get_crtc_transform_cookie_t  -- /usr/include/xcb/randr.h:3340
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_transform_unchecked";

   function xcb_randr_get_crtc_transform_pending_filter_name (R : access constant xcb_randr_get_crtc_transform_reply_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/randr.h:3344
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_transform_pending_filter_name";

   function xcb_randr_get_crtc_transform_pending_filter_name_length (R : access constant xcb_randr_get_crtc_transform_reply_t) return int  -- /usr/include/xcb/randr.h:3347
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_transform_pending_filter_name_length";

   function xcb_randr_get_crtc_transform_pending_filter_name_end (R : access constant xcb_randr_get_crtc_transform_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:3350
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_transform_pending_filter_name_end";

   function xcb_randr_get_crtc_transform_pending_params (R : access constant xcb_randr_get_crtc_transform_reply_t) return access xcb_render.xcb_render_fixed_t  -- /usr/include/xcb/randr.h:3353
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_transform_pending_params";

   function xcb_randr_get_crtc_transform_pending_params_length (R : access constant xcb_randr_get_crtc_transform_reply_t) return int  -- /usr/include/xcb/randr.h:3356
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_transform_pending_params_length";

   function xcb_randr_get_crtc_transform_pending_params_end (R : access constant xcb_randr_get_crtc_transform_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:3359
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_transform_pending_params_end";

   function xcb_randr_get_crtc_transform_current_filter_name (R : access constant xcb_randr_get_crtc_transform_reply_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/randr.h:3362
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_transform_current_filter_name";

   function xcb_randr_get_crtc_transform_current_filter_name_length (R : access constant xcb_randr_get_crtc_transform_reply_t) return int  -- /usr/include/xcb/randr.h:3365
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_transform_current_filter_name_length";

   function xcb_randr_get_crtc_transform_current_filter_name_end (R : access constant xcb_randr_get_crtc_transform_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:3368
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_transform_current_filter_name_end";

   function xcb_randr_get_crtc_transform_current_params (R : access constant xcb_randr_get_crtc_transform_reply_t) return access xcb_render.xcb_render_fixed_t  -- /usr/include/xcb/randr.h:3371
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_transform_current_params";

   function xcb_randr_get_crtc_transform_current_params_length (R : access constant xcb_randr_get_crtc_transform_reply_t) return int  -- /usr/include/xcb/randr.h:3374
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_transform_current_params_length";

   function xcb_randr_get_crtc_transform_current_params_end (R : access constant xcb_randr_get_crtc_transform_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:3377
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_transform_current_params_end";

   function xcb_randr_get_crtc_transform_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_randr_get_crtc_transform_cookie_t;
      e : System.Address) return access xcb_randr_get_crtc_transform_reply_t  -- /usr/include/xcb/randr.h:3394
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_crtc_transform_reply";

   function xcb_randr_get_panning (c : access xcb.xcb_connection_t; crtc : xcb_randr_crtc_t) return xcb_randr_get_panning_cookie_t  -- /usr/include/xcb/randr.h:3407
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_panning";

   function xcb_randr_get_panning_unchecked (c : access xcb.xcb_connection_t; crtc : xcb_randr_crtc_t) return xcb_randr_get_panning_cookie_t  -- /usr/include/xcb/randr.h:3422
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_panning_unchecked";

   function xcb_randr_get_panning_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_randr_get_panning_cookie_t;
      e : System.Address) return access xcb_randr_get_panning_reply_t  -- /usr/include/xcb/randr.h:3440
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_panning_reply";

   function xcb_randr_set_panning
     (c : access xcb.xcb_connection_t;
      crtc : xcb_randr_crtc_t;
      timestamp : xproto.xcb_timestamp_t;
      left : bits_stdint_uintn_h.uint16_t;
      top : bits_stdint_uintn_h.uint16_t;
      width : bits_stdint_uintn_h.uint16_t;
      height : bits_stdint_uintn_h.uint16_t;
      track_left : bits_stdint_uintn_h.uint16_t;
      track_top : bits_stdint_uintn_h.uint16_t;
      track_width : bits_stdint_uintn_h.uint16_t;
      track_height : bits_stdint_uintn_h.uint16_t;
      border_left : bits_stdint_intn_h.int16_t;
      border_top : bits_stdint_intn_h.int16_t;
      border_right : bits_stdint_intn_h.int16_t;
      border_bottom : bits_stdint_intn_h.int16_t) return xcb_randr_set_panning_cookie_t  -- /usr/include/xcb/randr.h:3453
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_panning";

   function xcb_randr_set_panning_unchecked
     (c : access xcb.xcb_connection_t;
      crtc : xcb_randr_crtc_t;
      timestamp : xproto.xcb_timestamp_t;
      left : bits_stdint_uintn_h.uint16_t;
      top : bits_stdint_uintn_h.uint16_t;
      width : bits_stdint_uintn_h.uint16_t;
      height : bits_stdint_uintn_h.uint16_t;
      track_left : bits_stdint_uintn_h.uint16_t;
      track_top : bits_stdint_uintn_h.uint16_t;
      track_width : bits_stdint_uintn_h.uint16_t;
      track_height : bits_stdint_uintn_h.uint16_t;
      border_left : bits_stdint_intn_h.int16_t;
      border_top : bits_stdint_intn_h.int16_t;
      border_right : bits_stdint_intn_h.int16_t;
      border_bottom : bits_stdint_intn_h.int16_t) return xcb_randr_set_panning_cookie_t  -- /usr/include/xcb/randr.h:3481
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_panning_unchecked";

   function xcb_randr_set_panning_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_randr_set_panning_cookie_t;
      e : System.Address) return access xcb_randr_set_panning_reply_t  -- /usr/include/xcb/randr.h:3512
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_panning_reply";

   function xcb_randr_set_output_primary_checked
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      output : xcb_randr_output_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:3528
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_output_primary_checked";

   function xcb_randr_set_output_primary
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      output : xcb_randr_output_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:3541
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_output_primary";

   function xcb_randr_get_output_primary (c : access xcb.xcb_connection_t; window : xproto.xcb_window_t) return xcb_randr_get_output_primary_cookie_t  -- /usr/include/xcb/randr.h:3554
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_output_primary";

   function xcb_randr_get_output_primary_unchecked (c : access xcb.xcb_connection_t; window : xproto.xcb_window_t) return xcb_randr_get_output_primary_cookie_t  -- /usr/include/xcb/randr.h:3569
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_output_primary_unchecked";

   function xcb_randr_get_output_primary_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_randr_get_output_primary_cookie_t;
      e : System.Address) return access xcb_randr_get_output_primary_reply_t  -- /usr/include/xcb/randr.h:3587
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_output_primary_reply";

   function xcb_randr_get_providers_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/randr.h:3592
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_providers_sizeof";

   function xcb_randr_get_providers (c : access xcb.xcb_connection_t; window : xproto.xcb_window_t) return xcb_randr_get_providers_cookie_t  -- /usr/include/xcb/randr.h:3603
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_providers";

   function xcb_randr_get_providers_unchecked (c : access xcb.xcb_connection_t; window : xproto.xcb_window_t) return xcb_randr_get_providers_cookie_t  -- /usr/include/xcb/randr.h:3618
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_providers_unchecked";

   function xcb_randr_get_providers_providers (R : access constant xcb_randr_get_providers_reply_t) return access xcb_randr_provider_t  -- /usr/include/xcb/randr.h:3622
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_providers_providers";

   function xcb_randr_get_providers_providers_length (R : access constant xcb_randr_get_providers_reply_t) return int  -- /usr/include/xcb/randr.h:3625
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_providers_providers_length";

   function xcb_randr_get_providers_providers_end (R : access constant xcb_randr_get_providers_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:3628
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_providers_providers_end";

   function xcb_randr_get_providers_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_randr_get_providers_cookie_t;
      e : System.Address) return access xcb_randr_get_providers_reply_t  -- /usr/include/xcb/randr.h:3645
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_providers_reply";

   function xcb_randr_get_provider_info_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/randr.h:3650
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_provider_info_sizeof";

   function xcb_randr_get_provider_info
     (c : access xcb.xcb_connection_t;
      provider : xcb_randr_provider_t;
      config_timestamp : xproto.xcb_timestamp_t) return xcb_randr_get_provider_info_cookie_t  -- /usr/include/xcb/randr.h:3661
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_provider_info";

   function xcb_randr_get_provider_info_unchecked
     (c : access xcb.xcb_connection_t;
      provider : xcb_randr_provider_t;
      config_timestamp : xproto.xcb_timestamp_t) return xcb_randr_get_provider_info_cookie_t  -- /usr/include/xcb/randr.h:3677
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_provider_info_unchecked";

   function xcb_randr_get_provider_info_crtcs (R : access constant xcb_randr_get_provider_info_reply_t) return access xcb_randr_crtc_t  -- /usr/include/xcb/randr.h:3682
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_provider_info_crtcs";

   function xcb_randr_get_provider_info_crtcs_length (R : access constant xcb_randr_get_provider_info_reply_t) return int  -- /usr/include/xcb/randr.h:3685
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_provider_info_crtcs_length";

   function xcb_randr_get_provider_info_crtcs_end (R : access constant xcb_randr_get_provider_info_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:3688
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_provider_info_crtcs_end";

   function xcb_randr_get_provider_info_outputs (R : access constant xcb_randr_get_provider_info_reply_t) return access xcb_randr_output_t  -- /usr/include/xcb/randr.h:3691
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_provider_info_outputs";

   function xcb_randr_get_provider_info_outputs_length (R : access constant xcb_randr_get_provider_info_reply_t) return int  -- /usr/include/xcb/randr.h:3694
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_provider_info_outputs_length";

   function xcb_randr_get_provider_info_outputs_end (R : access constant xcb_randr_get_provider_info_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:3697
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_provider_info_outputs_end";

   function xcb_randr_get_provider_info_associated_providers (R : access constant xcb_randr_get_provider_info_reply_t) return access xcb_randr_provider_t  -- /usr/include/xcb/randr.h:3700
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_provider_info_associated_providers";

   function xcb_randr_get_provider_info_associated_providers_length (R : access constant xcb_randr_get_provider_info_reply_t) return int  -- /usr/include/xcb/randr.h:3703
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_provider_info_associated_providers_length";

   function xcb_randr_get_provider_info_associated_providers_end (R : access constant xcb_randr_get_provider_info_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:3706
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_provider_info_associated_providers_end";

   function xcb_randr_get_provider_info_associated_capability (R : access constant xcb_randr_get_provider_info_reply_t) return access bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/randr.h:3709
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_provider_info_associated_capability";

   function xcb_randr_get_provider_info_associated_capability_length (R : access constant xcb_randr_get_provider_info_reply_t) return int  -- /usr/include/xcb/randr.h:3712
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_provider_info_associated_capability_length";

   function xcb_randr_get_provider_info_associated_capability_end (R : access constant xcb_randr_get_provider_info_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:3715
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_provider_info_associated_capability_end";

   function xcb_randr_get_provider_info_name (R : access constant xcb_randr_get_provider_info_reply_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/randr.h:3718
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_provider_info_name";

   function xcb_randr_get_provider_info_name_length (R : access constant xcb_randr_get_provider_info_reply_t) return int  -- /usr/include/xcb/randr.h:3721
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_provider_info_name_length";

   function xcb_randr_get_provider_info_name_end (R : access constant xcb_randr_get_provider_info_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:3724
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_provider_info_name_end";

   function xcb_randr_get_provider_info_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_randr_get_provider_info_cookie_t;
      e : System.Address) return access xcb_randr_get_provider_info_reply_t  -- /usr/include/xcb/randr.h:3741
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_provider_info_reply";

   function xcb_randr_set_provider_offload_sink_checked
     (c : access xcb.xcb_connection_t;
      provider : xcb_randr_provider_t;
      sink_provider : xcb_randr_provider_t;
      config_timestamp : xproto.xcb_timestamp_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:3757
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_provider_offload_sink_checked";

   function xcb_randr_set_provider_offload_sink
     (c : access xcb.xcb_connection_t;
      provider : xcb_randr_provider_t;
      sink_provider : xcb_randr_provider_t;
      config_timestamp : xproto.xcb_timestamp_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:3771
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_provider_offload_sink";

   function xcb_randr_set_provider_output_source_checked
     (c : access xcb.xcb_connection_t;
      provider : xcb_randr_provider_t;
      source_provider : xcb_randr_provider_t;
      config_timestamp : xproto.xcb_timestamp_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:3788
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_provider_output_source_checked";

   function xcb_randr_set_provider_output_source
     (c : access xcb.xcb_connection_t;
      provider : xcb_randr_provider_t;
      source_provider : xcb_randr_provider_t;
      config_timestamp : xproto.xcb_timestamp_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:3802
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_provider_output_source";

   function xcb_randr_list_provider_properties_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/randr.h:3808
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_list_provider_properties_sizeof";

   function xcb_randr_list_provider_properties (c : access xcb.xcb_connection_t; provider : xcb_randr_provider_t) return xcb_randr_list_provider_properties_cookie_t  -- /usr/include/xcb/randr.h:3819
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_list_provider_properties";

   function xcb_randr_list_provider_properties_unchecked (c : access xcb.xcb_connection_t; provider : xcb_randr_provider_t) return xcb_randr_list_provider_properties_cookie_t  -- /usr/include/xcb/randr.h:3834
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_list_provider_properties_unchecked";

   function xcb_randr_list_provider_properties_atoms (R : access constant xcb_randr_list_provider_properties_reply_t) return access xproto.xcb_atom_t  -- /usr/include/xcb/randr.h:3838
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_list_provider_properties_atoms";

   function xcb_randr_list_provider_properties_atoms_length (R : access constant xcb_randr_list_provider_properties_reply_t) return int  -- /usr/include/xcb/randr.h:3841
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_list_provider_properties_atoms_length";

   function xcb_randr_list_provider_properties_atoms_end (R : access constant xcb_randr_list_provider_properties_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:3844
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_list_provider_properties_atoms_end";

   function xcb_randr_list_provider_properties_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_randr_list_provider_properties_cookie_t;
      e : System.Address) return access xcb_randr_list_provider_properties_reply_t  -- /usr/include/xcb/randr.h:3861
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_list_provider_properties_reply";

   function xcb_randr_query_provider_property_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/randr.h:3866
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_query_provider_property_sizeof";

   function xcb_randr_query_provider_property
     (c : access xcb.xcb_connection_t;
      provider : xcb_randr_provider_t;
      property : xproto.xcb_atom_t) return xcb_randr_query_provider_property_cookie_t  -- /usr/include/xcb/randr.h:3877
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_query_provider_property";

   function xcb_randr_query_provider_property_unchecked
     (c : access xcb.xcb_connection_t;
      provider : xcb_randr_provider_t;
      property : xproto.xcb_atom_t) return xcb_randr_query_provider_property_cookie_t  -- /usr/include/xcb/randr.h:3893
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_query_provider_property_unchecked";

   function xcb_randr_query_provider_property_valid_values (R : access constant xcb_randr_query_provider_property_reply_t) return access bits_stdint_intn_h.int32_t  -- /usr/include/xcb/randr.h:3898
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_query_provider_property_valid_values";

   function xcb_randr_query_provider_property_valid_values_length (R : access constant xcb_randr_query_provider_property_reply_t) return int  -- /usr/include/xcb/randr.h:3901
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_query_provider_property_valid_values_length";

   function xcb_randr_query_provider_property_valid_values_end (R : access constant xcb_randr_query_provider_property_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:3904
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_query_provider_property_valid_values_end";

   function xcb_randr_query_provider_property_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_randr_query_provider_property_cookie_t;
      e : System.Address) return access xcb_randr_query_provider_property_reply_t  -- /usr/include/xcb/randr.h:3921
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_query_provider_property_reply";

   function xcb_randr_configure_provider_property_sizeof (u_buffer : System.Address; values_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/randr.h:3926
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_configure_provider_property_sizeof";

   function xcb_randr_configure_provider_property_checked
     (c : access xcb.xcb_connection_t;
      provider : xcb_randr_provider_t;
      property : xproto.xcb_atom_t;
      pending : bits_stdint_uintn_h.uint8_t;
      c_range : bits_stdint_uintn_h.uint8_t;
      values_len : bits_stdint_uintn_h.uint32_t;
      values : access bits_stdint_intn_h.int32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:3941
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_configure_provider_property_checked";

   function xcb_randr_configure_provider_property
     (c : access xcb.xcb_connection_t;
      provider : xcb_randr_provider_t;
      property : xproto.xcb_atom_t;
      pending : bits_stdint_uintn_h.uint8_t;
      c_range : bits_stdint_uintn_h.uint8_t;
      values_len : bits_stdint_uintn_h.uint32_t;
      values : access bits_stdint_intn_h.int32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:3958
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_configure_provider_property";

   function xcb_randr_configure_provider_property_values (R : access constant xcb_randr_configure_provider_property_request_t) return access bits_stdint_intn_h.int32_t  -- /usr/include/xcb/randr.h:3967
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_configure_provider_property_values";

   function xcb_randr_configure_provider_property_values_length (R : access constant xcb_randr_configure_provider_property_request_t) return int  -- /usr/include/xcb/randr.h:3970
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_configure_provider_property_values_length";

   function xcb_randr_configure_provider_property_values_end (R : access constant xcb_randr_configure_provider_property_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:3973
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_configure_provider_property_values_end";

   function xcb_randr_change_provider_property_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/randr.h:3976
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_change_provider_property_sizeof";

   function xcb_randr_change_provider_property_checked
     (c : access xcb.xcb_connection_t;
      provider : xcb_randr_provider_t;
      property : xproto.xcb_atom_t;
      c_type : xproto.xcb_atom_t;
      format : bits_stdint_uintn_h.uint8_t;
      mode : bits_stdint_uintn_h.uint8_t;
      num_items : bits_stdint_uintn_h.uint32_t;
      data : System.Address) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:3990
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_change_provider_property_checked";

   function xcb_randr_change_provider_property
     (c : access xcb.xcb_connection_t;
      provider : xcb_randr_provider_t;
      property : xproto.xcb_atom_t;
      c_type : xproto.xcb_atom_t;
      format : bits_stdint_uintn_h.uint8_t;
      mode : bits_stdint_uintn_h.uint8_t;
      num_items : bits_stdint_uintn_h.uint32_t;
      data : System.Address) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:4008
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_change_provider_property";

   function xcb_randr_change_provider_property_data (R : access constant xcb_randr_change_provider_property_request_t) return System.Address  -- /usr/include/xcb/randr.h:4018
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_change_provider_property_data";

   function xcb_randr_change_provider_property_data_length (R : access constant xcb_randr_change_provider_property_request_t) return int  -- /usr/include/xcb/randr.h:4021
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_change_provider_property_data_length";

   function xcb_randr_change_provider_property_data_end (R : access constant xcb_randr_change_provider_property_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:4024
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_change_provider_property_data_end";

   function xcb_randr_delete_provider_property_checked
     (c : access xcb.xcb_connection_t;
      provider : xcb_randr_provider_t;
      property : xproto.xcb_atom_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:4038
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_delete_provider_property_checked";

   function xcb_randr_delete_provider_property
     (c : access xcb.xcb_connection_t;
      provider : xcb_randr_provider_t;
      property : xproto.xcb_atom_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:4051
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_delete_provider_property";

   function xcb_randr_get_provider_property_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/randr.h:4056
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_provider_property_sizeof";

   function xcb_randr_get_provider_property
     (c : access xcb.xcb_connection_t;
      provider : xcb_randr_provider_t;
      property : xproto.xcb_atom_t;
      c_type : xproto.xcb_atom_t;
      long_offset : bits_stdint_uintn_h.uint32_t;
      long_length : bits_stdint_uintn_h.uint32_t;
      u_delete : bits_stdint_uintn_h.uint8_t;
      pending : bits_stdint_uintn_h.uint8_t) return xcb_randr_get_provider_property_cookie_t  -- /usr/include/xcb/randr.h:4067
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_provider_property";

   function xcb_randr_get_provider_property_unchecked
     (c : access xcb.xcb_connection_t;
      provider : xcb_randr_provider_t;
      property : xproto.xcb_atom_t;
      c_type : xproto.xcb_atom_t;
      long_offset : bits_stdint_uintn_h.uint32_t;
      long_length : bits_stdint_uintn_h.uint32_t;
      u_delete : bits_stdint_uintn_h.uint8_t;
      pending : bits_stdint_uintn_h.uint8_t) return xcb_randr_get_provider_property_cookie_t  -- /usr/include/xcb/randr.h:4088
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_provider_property_unchecked";

   function xcb_randr_get_provider_property_data (R : access constant xcb_randr_get_provider_property_reply_t) return System.Address  -- /usr/include/xcb/randr.h:4098
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_provider_property_data";

   function xcb_randr_get_provider_property_data_length (R : access constant xcb_randr_get_provider_property_reply_t) return int  -- /usr/include/xcb/randr.h:4101
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_provider_property_data_length";

   function xcb_randr_get_provider_property_data_end (R : access constant xcb_randr_get_provider_property_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:4104
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_provider_property_data_end";

   function xcb_randr_get_provider_property_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_randr_get_provider_property_cookie_t;
      e : System.Address) return access xcb_randr_get_provider_property_reply_t  -- /usr/include/xcb/randr.h:4121
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_provider_property_reply";

   procedure xcb_randr_crtc_change_next (i : access xcb_randr_crtc_change_iterator_t)  -- /usr/include/xcb/randr.h:4134
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_crtc_change_next";

   function xcb_randr_crtc_change_end (i : xcb_randr_crtc_change_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:4146
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_crtc_change_end";

   procedure xcb_randr_output_change_next (i : access xcb_randr_output_change_iterator_t)  -- /usr/include/xcb/randr.h:4157
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_output_change_next";

   function xcb_randr_output_change_end (i : xcb_randr_output_change_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:4169
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_output_change_end";

   procedure xcb_randr_output_property_next (i : access xcb_randr_output_property_iterator_t)  -- /usr/include/xcb/randr.h:4180
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_output_property_next";

   function xcb_randr_output_property_end (i : xcb_randr_output_property_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:4192
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_output_property_end";

   procedure xcb_randr_provider_change_next (i : access xcb_randr_provider_change_iterator_t)  -- /usr/include/xcb/randr.h:4203
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_provider_change_next";

   function xcb_randr_provider_change_end (i : xcb_randr_provider_change_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:4215
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_provider_change_end";

   procedure xcb_randr_provider_property_next (i : access xcb_randr_provider_property_iterator_t)  -- /usr/include/xcb/randr.h:4226
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_provider_property_next";

   function xcb_randr_provider_property_end (i : xcb_randr_provider_property_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:4238
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_provider_property_end";

   procedure xcb_randr_resource_change_next (i : access xcb_randr_resource_change_iterator_t)  -- /usr/include/xcb/randr.h:4249
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_resource_change_next";

   function xcb_randr_resource_change_end (i : xcb_randr_resource_change_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:4261
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_resource_change_end";

   function xcb_randr_monitor_info_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/randr.h:4264
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_monitor_info_sizeof";

   function xcb_randr_monitor_info_outputs (R : access constant xcb_randr_monitor_info_t) return access xcb_randr_output_t  -- /usr/include/xcb/randr.h:4267
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_monitor_info_outputs";

   function xcb_randr_monitor_info_outputs_length (R : access constant xcb_randr_monitor_info_t) return int  -- /usr/include/xcb/randr.h:4270
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_monitor_info_outputs_length";

   function xcb_randr_monitor_info_outputs_end (R : access constant xcb_randr_monitor_info_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:4273
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_monitor_info_outputs_end";

   procedure xcb_randr_monitor_info_next (i : access xcb_randr_monitor_info_iterator_t)  -- /usr/include/xcb/randr.h:4284
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_monitor_info_next";

   function xcb_randr_monitor_info_end (i : xcb_randr_monitor_info_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:4296
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_monitor_info_end";

   function xcb_randr_get_monitors_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/randr.h:4299
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_monitors_sizeof";

   function xcb_randr_get_monitors
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      get_active : bits_stdint_uintn_h.uint8_t) return xcb_randr_get_monitors_cookie_t  -- /usr/include/xcb/randr.h:4310
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_monitors";

   function xcb_randr_get_monitors_unchecked
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      get_active : bits_stdint_uintn_h.uint8_t) return xcb_randr_get_monitors_cookie_t  -- /usr/include/xcb/randr.h:4326
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_monitors_unchecked";

   function xcb_randr_get_monitors_monitors_length (R : access constant xcb_randr_get_monitors_reply_t) return int  -- /usr/include/xcb/randr.h:4331
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_monitors_monitors_length";

   function xcb_randr_get_monitors_monitors_iterator (R : access constant xcb_randr_get_monitors_reply_t) return xcb_randr_monitor_info_iterator_t  -- /usr/include/xcb/randr.h:4334
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_monitors_monitors_iterator";

   function xcb_randr_get_monitors_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_randr_get_monitors_cookie_t;
      e : System.Address) return access xcb_randr_get_monitors_reply_t  -- /usr/include/xcb/randr.h:4351
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_get_monitors_reply";

   function xcb_randr_set_monitor_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/randr.h:4356
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_monitor_sizeof";

   function xcb_randr_set_monitor_checked
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      monitorinfo : access xcb_randr_monitor_info_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:4370
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_monitor_checked";

   function xcb_randr_set_monitor
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      monitorinfo : access xcb_randr_monitor_info_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:4383
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_monitor";

   function xcb_randr_set_monitor_monitorinfo (R : access constant xcb_randr_set_monitor_request_t) return access xcb_randr_monitor_info_t  -- /usr/include/xcb/randr.h:4388
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_set_monitor_monitorinfo";

   function xcb_randr_delete_monitor_checked
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      name : xproto.xcb_atom_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:4402
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_delete_monitor_checked";

   function xcb_randr_delete_monitor
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      name : xproto.xcb_atom_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:4415
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_delete_monitor";

   function xcb_randr_create_lease_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/randr.h:4420
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_create_lease_sizeof";

   function xcb_randr_create_lease
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      lid : xcb_randr_lease_t;
      num_crtcs : bits_stdint_uintn_h.uint16_t;
      num_outputs : bits_stdint_uintn_h.uint16_t;
      crtcs : access xcb_randr_crtc_t;
      outputs : access xcb_randr_output_t) return xcb_randr_create_lease_cookie_t  -- /usr/include/xcb/randr.h:4431
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_create_lease";

   function xcb_randr_create_lease_unchecked
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      lid : xcb_randr_lease_t;
      num_crtcs : bits_stdint_uintn_h.uint16_t;
      num_outputs : bits_stdint_uintn_h.uint16_t;
      crtcs : access xcb_randr_crtc_t;
      outputs : access xcb_randr_output_t) return xcb_randr_create_lease_cookie_t  -- /usr/include/xcb/randr.h:4451
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_create_lease_unchecked";

   function xcb_randr_create_lease_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_randr_create_lease_cookie_t;
      e : System.Address) return access xcb_randr_create_lease_reply_t  -- /usr/include/xcb/randr.h:4474
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_create_lease_reply";

   function xcb_randr_create_lease_reply_fds (c : access xcb.xcb_connection_t; reply : access xcb_randr_create_lease_reply_t) return access int  -- /usr/include/xcb/randr.h:4488
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_create_lease_reply_fds";

   function xcb_randr_free_lease_checked
     (c : access xcb.xcb_connection_t;
      lid : xcb_randr_lease_t;
      c_terminate : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:4503
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_free_lease_checked";

   function xcb_randr_free_lease
     (c : access xcb.xcb_connection_t;
      lid : xcb_randr_lease_t;
      c_terminate : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/randr.h:4516
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_free_lease";

   procedure xcb_randr_lease_notify_next (i : access xcb_randr_lease_notify_iterator_t)  -- /usr/include/xcb/randr.h:4529
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_lease_notify_next";

   function xcb_randr_lease_notify_end (i : xcb_randr_lease_notify_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:4541
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_lease_notify_end";

   procedure xcb_randr_notify_data_next (i : access xcb_randr_notify_data_iterator_t)  -- /usr/include/xcb/randr.h:4552
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_notify_data_next";

   function xcb_randr_notify_data_end (i : xcb_randr_notify_data_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/randr.h:4564
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_randr_notify_data_end";

end xcb_randr;
