pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with xcb;
with bits_stdint_uintn_h;
with xproto;
with bits_stdint_intn_h;
with System;
with Interfaces.C.Strings;

package xcb_glx is

   CONST_XCB_GLX_MAJOR_VERSION : constant := 1;  --  /usr/include/xcb/glx.h:22
   CONST_XCB_GLX_MINOR_VERSION : constant := 4;  --  /usr/include/xcb/glx.h:23

   CONST_XCB_GLX_GENERIC : constant := -1;  --  /usr/include/xcb/glx.h:138

   CONST_XCB_GLX_BAD_CONTEXT : constant := 0;  --  /usr/include/xcb/glx.h:154

   CONST_XCB_GLX_BAD_CONTEXT_STATE : constant := 1;  --  /usr/include/xcb/glx.h:159

   CONST_XCB_GLX_BAD_DRAWABLE : constant := 2;  --  /usr/include/xcb/glx.h:164

   CONST_XCB_GLX_BAD_PIXMAP : constant := 3;  --  /usr/include/xcb/glx.h:169

   CONST_XCB_GLX_BAD_CONTEXT_TAG : constant := 4;  --  /usr/include/xcb/glx.h:174

   CONST_XCB_GLX_BAD_CURRENT_WINDOW : constant := 5;  --  /usr/include/xcb/glx.h:179

   CONST_XCB_GLX_BAD_RENDER_REQUEST : constant := 6;  --  /usr/include/xcb/glx.h:184

   CONST_XCB_GLX_BAD_LARGE_REQUEST : constant := 7;  --  /usr/include/xcb/glx.h:189

   CONST_XCB_GLX_UNSUPPORTED_PRIVATE_REQUEST : constant := 8;  --  /usr/include/xcb/glx.h:194

   CONST_XCB_GLX_BAD_FB_CONFIG : constant := 9;  --  /usr/include/xcb/glx.h:199

   CONST_XCB_GLX_BAD_PBUFFER : constant := 10;  --  /usr/include/xcb/glx.h:204

   CONST_XCB_GLX_BAD_CURRENT_DRAWABLE : constant := 11;  --  /usr/include/xcb/glx.h:209

   CONST_XCB_GLX_BAD_WINDOW : constant := 12;  --  /usr/include/xcb/glx.h:214

   CONST_XCB_GLX_GLX_BAD_PROFILE_ARB : constant := 13;  --  /usr/include/xcb/glx.h:219

   CONST_XCB_GLX_PBUFFER_CLOBBER : constant := 0;  --  /usr/include/xcb/glx.h:224

   CONST_XCB_GLX_BUFFER_SWAP_COMPLETE : constant := 1;  --  /usr/include/xcb/glx.h:247

   CONST_XCB_GLX_RENDER : constant := 1;  --  /usr/include/xcb/glx.h:277

   CONST_XCB_GLX_RENDER_LARGE : constant := 2;  --  /usr/include/xcb/glx.h:290

   CONST_XCB_GLX_CREATE_CONTEXT : constant := 3;  --  /usr/include/xcb/glx.h:306

   CONST_XCB_GLX_DESTROY_CONTEXT : constant := 4;  --  /usr/include/xcb/glx.h:324

   CONST_XCB_GLX_MAKE_CURRENT : constant := 5;  --  /usr/include/xcb/glx.h:344

   CONST_XCB_GLX_IS_DIRECT : constant := 6;  --  /usr/include/xcb/glx.h:378

   CONST_XCB_GLX_QUERY_VERSION : constant := 7;  --  /usr/include/xcb/glx.h:410

   CONST_XCB_GLX_WAIT_GL : constant := 8;  --  /usr/include/xcb/glx.h:437

   CONST_XCB_GLX_WAIT_X : constant := 9;  --  /usr/include/xcb/glx.h:450

   CONST_XCB_GLX_COPY_CONTEXT : constant := 10;  --  /usr/include/xcb/glx.h:463

   CONST_XCB_GLX_SWAP_BUFFERS : constant := 11;  --  /usr/include/xcb/glx.h:503

   CONST_XCB_GLX_USE_X_FONT : constant := 12;  --  /usr/include/xcb/glx.h:517

   CONST_XCB_GLX_CREATE_GLX_PIXMAP : constant := 13;  --  /usr/include/xcb/glx.h:534

   CONST_XCB_GLX_GET_VISUAL_CONFIGS : constant := 14;  --  /usr/include/xcb/glx.h:557

   CONST_XCB_GLX_DESTROY_GLX_PIXMAP : constant := 15;  --  /usr/include/xcb/glx.h:583

   CONST_XCB_GLX_VENDOR_PRIVATE : constant := 16;  --  /usr/include/xcb/glx.h:596

   CONST_XCB_GLX_VENDOR_PRIVATE_WITH_REPLY : constant := 17;  --  /usr/include/xcb/glx.h:617

   CONST_XCB_GLX_QUERY_EXTENSIONS_STRING : constant := 18;  --  /usr/include/xcb/glx.h:650

   CONST_XCB_GLX_QUERY_SERVER_STRING : constant := 19;  --  /usr/include/xcb/glx.h:683

   CONST_XCB_GLX_CLIENT_INFO : constant := 20;  --  /usr/include/xcb/glx.h:710

   CONST_XCB_GLX_GET_FB_CONFIGS : constant := 21;  --  /usr/include/xcb/glx.h:732

   CONST_XCB_GLX_CREATE_PIXMAP : constant := 22;  --  /usr/include/xcb/glx.h:758

   CONST_XCB_GLX_DESTROY_PIXMAP : constant := 23;  --  /usr/include/xcb/glx.h:775

   CONST_XCB_GLX_CREATE_NEW_CONTEXT : constant := 24;  --  /usr/include/xcb/glx.h:788

   CONST_XCB_GLX_QUERY_CONTEXT : constant := 25;  --  /usr/include/xcb/glx.h:814

   CONST_XCB_GLX_MAKE_CONTEXT_CURRENT : constant := 26;  --  /usr/include/xcb/glx.h:846

   CONST_XCB_GLX_CREATE_PBUFFER : constant := 27;  --  /usr/include/xcb/glx.h:874

   CONST_XCB_GLX_DESTROY_PBUFFER : constant := 28;  --  /usr/include/xcb/glx.h:890

   CONST_XCB_GLX_GET_DRAWABLE_ATTRIBUTES : constant := 29;  --  /usr/include/xcb/glx.h:910

   CONST_XCB_GLX_CHANGE_DRAWABLE_ATTRIBUTES : constant := 30;  --  /usr/include/xcb/glx.h:935

   CONST_XCB_GLX_CREATE_WINDOW : constant := 31;  --  /usr/include/xcb/glx.h:949

   CONST_XCB_GLX_DELETE_WINDOW : constant := 32;  --  /usr/include/xcb/glx.h:966

   CONST_XCB_GLX_SET_CLIENT_INFO_ARB : constant := 33;  --  /usr/include/xcb/glx.h:979

   CONST_XCB_GLX_CREATE_CONTEXT_ATTRIBS_ARB : constant := 34;  --  /usr/include/xcb/glx.h:996

   CONST_XCB_GLX_SET_CLIENT_INFO_2ARB : constant := 35;  --  /usr/include/xcb/glx.h:1015

   CONST_XCB_GLX_NEW_LIST : constant := 101;  --  /usr/include/xcb/glx.h:1032

   CONST_XCB_GLX_END_LIST : constant := 102;  --  /usr/include/xcb/glx.h:1047

   CONST_XCB_GLX_DELETE_LISTS : constant := 103;  --  /usr/include/xcb/glx.h:1060

   CONST_XCB_GLX_GEN_LISTS : constant := 104;  --  /usr/include/xcb/glx.h:1082

   CONST_XCB_GLX_FEEDBACK_BUFFER : constant := 105;  --  /usr/include/xcb/glx.h:1107

   CONST_XCB_GLX_SELECT_BUFFER : constant := 106;  --  /usr/include/xcb/glx.h:1122

   CONST_XCB_GLX_RENDER_MODE : constant := 107;  --  /usr/include/xcb/glx.h:1143

   CONST_XCB_GLX_FINISH : constant := 108;  --  /usr/include/xcb/glx.h:1184

   CONST_XCB_GLX_PIXEL_STOREF : constant := 109;  --  /usr/include/xcb/glx.h:1207

   CONST_XCB_GLX_PIXEL_STOREI : constant := 110;  --  /usr/include/xcb/glx.h:1222

   CONST_XCB_GLX_READ_PIXELS : constant := 111;  --  /usr/include/xcb/glx.h:1244

   CONST_XCB_GLX_GET_BOOLEANV : constant := 112;  --  /usr/include/xcb/glx.h:1283

   CONST_XCB_GLX_GET_CLIP_PLANE : constant := 113;  --  /usr/include/xcb/glx.h:1318

   CONST_XCB_GLX_GET_DOUBLEV : constant := 114;  --  /usr/include/xcb/glx.h:1350

   CONST_XCB_GLX_GET_ERROR : constant := 115;  --  /usr/include/xcb/glx.h:1385

   CONST_XCB_GLX_GET_FLOATV : constant := 116;  --  /usr/include/xcb/glx.h:1416

   CONST_XCB_GLX_GET_INTEGERV : constant := 117;  --  /usr/include/xcb/glx.h:1451

   CONST_XCB_GLX_GET_LIGHTFV : constant := 118;  --  /usr/include/xcb/glx.h:1486

   CONST_XCB_GLX_GET_LIGHTIV : constant := 119;  --  /usr/include/xcb/glx.h:1522

   CONST_XCB_GLX_GET_MAPDV : constant := 120;  --  /usr/include/xcb/glx.h:1558

   CONST_XCB_GLX_GET_MAPFV : constant := 121;  --  /usr/include/xcb/glx.h:1594

   CONST_XCB_GLX_GET_MAPIV : constant := 122;  --  /usr/include/xcb/glx.h:1630

   CONST_XCB_GLX_GET_MATERIALFV : constant := 123;  --  /usr/include/xcb/glx.h:1666

   CONST_XCB_GLX_GET_MATERIALIV : constant := 124;  --  /usr/include/xcb/glx.h:1702

   CONST_XCB_GLX_GET_PIXEL_MAPFV : constant := 125;  --  /usr/include/xcb/glx.h:1738

   CONST_XCB_GLX_GET_PIXEL_MAPUIV : constant := 126;  --  /usr/include/xcb/glx.h:1773

   CONST_XCB_GLX_GET_PIXEL_MAPUSV : constant := 127;  --  /usr/include/xcb/glx.h:1808

   CONST_XCB_GLX_GET_POLYGON_STIPPLE : constant := 128;  --  /usr/include/xcb/glx.h:1843

   CONST_XCB_GLX_GET_STRING : constant := 129;  --  /usr/include/xcb/glx.h:1875

   CONST_XCB_GLX_GET_TEX_ENVFV : constant := 130;  --  /usr/include/xcb/glx.h:1909

   CONST_XCB_GLX_GET_TEX_ENVIV : constant := 131;  --  /usr/include/xcb/glx.h:1945

   CONST_XCB_GLX_GET_TEX_GENDV : constant := 132;  --  /usr/include/xcb/glx.h:1981

   CONST_XCB_GLX_GET_TEX_GENFV : constant := 133;  --  /usr/include/xcb/glx.h:2017

   CONST_XCB_GLX_GET_TEX_GENIV : constant := 134;  --  /usr/include/xcb/glx.h:2053

   CONST_XCB_GLX_GET_TEX_IMAGE : constant := 135;  --  /usr/include/xcb/glx.h:2089

   CONST_XCB_GLX_GET_TEX_PARAMETERFV : constant := 136;  --  /usr/include/xcb/glx.h:2129

   CONST_XCB_GLX_GET_TEX_PARAMETERIV : constant := 137;  --  /usr/include/xcb/glx.h:2165

   CONST_XCB_GLX_GET_TEX_LEVEL_PARAMETERFV : constant := 138;  --  /usr/include/xcb/glx.h:2201

   CONST_XCB_GLX_GET_TEX_LEVEL_PARAMETERIV : constant := 139;  --  /usr/include/xcb/glx.h:2238

   CONST_XCB_GLX_IS_ENABLED : constant := 140;  --  /usr/include/xcb/glx.h:2275

   CONST_XCB_GLX_IS_LIST : constant := 141;  --  /usr/include/xcb/glx.h:2307

   CONST_XCB_GLX_FLUSH : constant := 142;  --  /usr/include/xcb/glx.h:2332

   CONST_XCB_GLX_ARE_TEXTURES_RESIDENT : constant := 143;  --  /usr/include/xcb/glx.h:2352

   CONST_XCB_GLX_DELETE_TEXTURES : constant := 144;  --  /usr/include/xcb/glx.h:2378

   CONST_XCB_GLX_GEN_TEXTURES : constant := 145;  --  /usr/include/xcb/glx.h:2399

   CONST_XCB_GLX_IS_TEXTURE : constant := 146;  --  /usr/include/xcb/glx.h:2431

   CONST_XCB_GLX_GET_COLOR_TABLE : constant := 147;  --  /usr/include/xcb/glx.h:2463

   CONST_XCB_GLX_GET_COLOR_TABLE_PARAMETERFV : constant := 148;  --  /usr/include/xcb/glx.h:2500

   CONST_XCB_GLX_GET_COLOR_TABLE_PARAMETERIV : constant := 149;  --  /usr/include/xcb/glx.h:2536

   CONST_XCB_GLX_GET_CONVOLUTION_FILTER : constant := 150;  --  /usr/include/xcb/glx.h:2572

   CONST_XCB_GLX_GET_CONVOLUTION_PARAMETERFV : constant := 151;  --  /usr/include/xcb/glx.h:2610

   CONST_XCB_GLX_GET_CONVOLUTION_PARAMETERIV : constant := 152;  --  /usr/include/xcb/glx.h:2646

   CONST_XCB_GLX_GET_SEPARABLE_FILTER : constant := 153;  --  /usr/include/xcb/glx.h:2682

   CONST_XCB_GLX_GET_HISTOGRAM : constant := 154;  --  /usr/include/xcb/glx.h:2720

   CONST_XCB_GLX_GET_HISTOGRAM_PARAMETERFV : constant := 155;  --  /usr/include/xcb/glx.h:2758

   CONST_XCB_GLX_GET_HISTOGRAM_PARAMETERIV : constant := 156;  --  /usr/include/xcb/glx.h:2794

   CONST_XCB_GLX_GET_MINMAX : constant := 157;  --  /usr/include/xcb/glx.h:2830

   CONST_XCB_GLX_GET_MINMAX_PARAMETERFV : constant := 158;  --  /usr/include/xcb/glx.h:2866

   CONST_XCB_GLX_GET_MINMAX_PARAMETERIV : constant := 159;  --  /usr/include/xcb/glx.h:2902

   CONST_XCB_GLX_GET_COMPRESSED_TEX_IMAGE_ARB : constant := 160;  --  /usr/include/xcb/glx.h:2938

   CONST_XCB_GLX_DELETE_QUERIES_ARB : constant := 161;  --  /usr/include/xcb/glx.h:2966

   CONST_XCB_GLX_GEN_QUERIES_ARB : constant := 162;  --  /usr/include/xcb/glx.h:2987

   CONST_XCB_GLX_IS_QUERY_ARB : constant := 163;  --  /usr/include/xcb/glx.h:3019

   CONST_XCB_GLX_GET_QUERYIV_ARB : constant := 164;  --  /usr/include/xcb/glx.h:3051

   CONST_XCB_GLX_GET_QUERY_OBJECTIV_ARB : constant := 165;  --  /usr/include/xcb/glx.h:3087

   CONST_XCB_GLX_GET_QUERY_OBJECTUIV_ARB : constant := 166;  --  /usr/include/xcb/glx.h:3123

  -- * This file generated automatically from glx.xml by c_client.py.
  -- * Edit at your peril.
  --  

  --*
  -- * @defgroup XCB_Glx_API XCB Glx API
  -- * @brief Glx XCB Protocol Implementation.
  -- * @{
  -- * 

   xcb_glx_id : aliased xcb.xcb_extension_t  -- /usr/include/xcb/glx.h:25
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_id";

   subtype xcb_glx_pixmap_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:27

  --*
  -- * @brief xcb_glx_pixmap_iterator_t
  -- * 

   type xcb_glx_pixmap_iterator_t is record
      data : access xcb_glx_pixmap_t;  -- /usr/include/xcb/glx.h:33
      c_rem : aliased int;  -- /usr/include/xcb/glx.h:34
      index : aliased int;  -- /usr/include/xcb/glx.h:35
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:32

   subtype xcb_glx_context_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:38

  --*
  -- * @brief xcb_glx_context_iterator_t
  -- * 

   type xcb_glx_context_iterator_t is record
      data : access xcb_glx_context_t;  -- /usr/include/xcb/glx.h:44
      c_rem : aliased int;  -- /usr/include/xcb/glx.h:45
      index : aliased int;  -- /usr/include/xcb/glx.h:46
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:43

   subtype xcb_glx_pbuffer_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:49

  --*
  -- * @brief xcb_glx_pbuffer_iterator_t
  -- * 

   type xcb_glx_pbuffer_iterator_t is record
      data : access xcb_glx_pbuffer_t;  -- /usr/include/xcb/glx.h:55
      c_rem : aliased int;  -- /usr/include/xcb/glx.h:56
      index : aliased int;  -- /usr/include/xcb/glx.h:57
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:54

   subtype xcb_glx_window_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:60

  --*
  -- * @brief xcb_glx_window_iterator_t
  -- * 

   type xcb_glx_window_iterator_t is record
      data : access xcb_glx_window_t;  -- /usr/include/xcb/glx.h:66
      c_rem : aliased int;  -- /usr/include/xcb/glx.h:67
      index : aliased int;  -- /usr/include/xcb/glx.h:68
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:65

   subtype xcb_glx_fbconfig_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:71

  --*
  -- * @brief xcb_glx_fbconfig_iterator_t
  -- * 

   type xcb_glx_fbconfig_iterator_t is record
      data : access xcb_glx_fbconfig_t;  -- /usr/include/xcb/glx.h:77
      c_rem : aliased int;  -- /usr/include/xcb/glx.h:78
      index : aliased int;  -- /usr/include/xcb/glx.h:79
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:76

   subtype xcb_glx_drawable_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:82

  --*
  -- * @brief xcb_glx_drawable_iterator_t
  -- * 

   type xcb_glx_drawable_iterator_t is record
      data : access xcb_glx_drawable_t;  -- /usr/include/xcb/glx.h:88
      c_rem : aliased int;  -- /usr/include/xcb/glx.h:89
      index : aliased int;  -- /usr/include/xcb/glx.h:90
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:87

   subtype xcb_glx_float32_t is float;  -- /usr/include/xcb/glx.h:93

  --*
  -- * @brief xcb_glx_float32_iterator_t
  -- * 

   type xcb_glx_float32_iterator_t is record
      data : access xcb_glx_float32_t;  -- /usr/include/xcb/glx.h:99
      c_rem : aliased int;  -- /usr/include/xcb/glx.h:100
      index : aliased int;  -- /usr/include/xcb/glx.h:101
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:98

   subtype xcb_glx_float64_t is double;  -- /usr/include/xcb/glx.h:104

  --*
  -- * @brief xcb_glx_float64_iterator_t
  -- * 

   type xcb_glx_float64_iterator_t is record
      data : access xcb_glx_float64_t;  -- /usr/include/xcb/glx.h:110
      c_rem : aliased int;  -- /usr/include/xcb/glx.h:111
      index : aliased int;  -- /usr/include/xcb/glx.h:112
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:109

   subtype xcb_glx_bool32_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:115

  --*
  -- * @brief xcb_glx_bool32_iterator_t
  -- * 

   type xcb_glx_bool32_iterator_t is record
      data : access xcb_glx_bool32_t;  -- /usr/include/xcb/glx.h:121
      c_rem : aliased int;  -- /usr/include/xcb/glx.h:122
      index : aliased int;  -- /usr/include/xcb/glx.h:123
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:120

   subtype xcb_glx_context_tag_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:126

  --*
  -- * @brief xcb_glx_context_tag_iterator_t
  -- * 

   type xcb_glx_context_tag_iterator_t is record
      data : access xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:132
      c_rem : aliased int;  -- /usr/include/xcb/glx.h:133
      index : aliased int;  -- /usr/include/xcb/glx.h:134
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:131

  --* Opcode for xcb_glx_generic.  
  --*
  -- * @brief xcb_glx_generic_error_t
  -- * 

   type xcb_glx_generic_error_t_array4238 is array (0 .. 20) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_generic_error_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:144
      error_code : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:145
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:146
      bad_value : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:147
      minor_opcode : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:148
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:149
      pad0 : aliased xcb_glx_generic_error_t_array4238;  -- /usr/include/xcb/glx.h:150
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:143

  --* Opcode for xcb_glx_bad_context.  
   subtype xcb_glx_bad_context_error_t is xcb_glx_generic_error_t;  -- /usr/include/xcb/glx.h:156

  --* Opcode for xcb_glx_bad_context_state.  
   subtype xcb_glx_bad_context_state_error_t is xcb_glx_generic_error_t;  -- /usr/include/xcb/glx.h:161

  --* Opcode for xcb_glx_bad_drawable.  
   subtype xcb_glx_bad_drawable_error_t is xcb_glx_generic_error_t;  -- /usr/include/xcb/glx.h:166

  --* Opcode for xcb_glx_bad_pixmap.  
   subtype xcb_glx_bad_pixmap_error_t is xcb_glx_generic_error_t;  -- /usr/include/xcb/glx.h:171

  --* Opcode for xcb_glx_bad_context_tag.  
   subtype xcb_glx_bad_context_tag_error_t is xcb_glx_generic_error_t;  -- /usr/include/xcb/glx.h:176

  --* Opcode for xcb_glx_bad_current_window.  
   subtype xcb_glx_bad_current_window_error_t is xcb_glx_generic_error_t;  -- /usr/include/xcb/glx.h:181

  --* Opcode for xcb_glx_bad_render_request.  
   subtype xcb_glx_bad_render_request_error_t is xcb_glx_generic_error_t;  -- /usr/include/xcb/glx.h:186

  --* Opcode for xcb_glx_bad_large_request.  
   subtype xcb_glx_bad_large_request_error_t is xcb_glx_generic_error_t;  -- /usr/include/xcb/glx.h:191

  --* Opcode for xcb_glx_unsupported_private_request.  
   subtype xcb_glx_unsupported_private_request_error_t is xcb_glx_generic_error_t;  -- /usr/include/xcb/glx.h:196

  --* Opcode for xcb_glx_bad_fb_config.  
   subtype xcb_glx_bad_fb_config_error_t is xcb_glx_generic_error_t;  -- /usr/include/xcb/glx.h:201

  --* Opcode for xcb_glx_bad_pbuffer.  
   subtype xcb_glx_bad_pbuffer_error_t is xcb_glx_generic_error_t;  -- /usr/include/xcb/glx.h:206

  --* Opcode for xcb_glx_bad_current_drawable.  
   subtype xcb_glx_bad_current_drawable_error_t is xcb_glx_generic_error_t;  -- /usr/include/xcb/glx.h:211

  --* Opcode for xcb_glx_bad_window.  
   subtype xcb_glx_bad_window_error_t is xcb_glx_generic_error_t;  -- /usr/include/xcb/glx.h:216

  --* Opcode for xcb_glx_glx_bad_profile_arb.  
   subtype xcb_glx_glx_bad_profile_arb_error_t is xcb_glx_generic_error_t;  -- /usr/include/xcb/glx.h:221

  --* Opcode for xcb_glx_pbuffer_clobber.  
  --*
  -- * @brief xcb_glx_pbuffer_clobber_event_t
  -- * 

   type xcb_glx_pbuffer_clobber_event_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_pbuffer_clobber_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:230
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:231
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:232
      event_type : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:233
      draw_type : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:234
      drawable : aliased xcb_glx_drawable_t;  -- /usr/include/xcb/glx.h:235
      b_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:236
      aux_buffer : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:237
      x : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:238
      y : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:239
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:240
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:241
      count : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:242
      pad1 : aliased xcb_glx_pbuffer_clobber_event_t_array1791;  -- /usr/include/xcb/glx.h:243
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:229

  --* Opcode for xcb_glx_buffer_swap_complete.  
  --*
  -- * @brief xcb_glx_buffer_swap_complete_event_t
  -- * 

   type xcb_glx_buffer_swap_complete_event_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_buffer_swap_complete_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:253
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:254
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:255
      event_type : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:256
      pad1 : aliased xcb_glx_buffer_swap_complete_event_t_array1823;  -- /usr/include/xcb/glx.h:257
      drawable : aliased xcb_glx_drawable_t;  -- /usr/include/xcb/glx.h:258
      ust_hi : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:259
      ust_lo : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:260
      msc_hi : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:261
      msc_lo : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:262
      sbc : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:263
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:252

   subtype xcb_glx_pbcet_t is unsigned;
   XCB_GLX_PBCET_DAMAGED : constant unsigned := 32791;
   XCB_GLX_PBCET_SAVED : constant unsigned := 32792;  -- /usr/include/xcb/glx.h:266

   subtype xcb_glx_pbcdt_t is unsigned;
   XCB_GLX_PBCDT_WINDOW : constant unsigned := 32793;
   XCB_GLX_PBCDT_PBUFFER : constant unsigned := 32794;  -- /usr/include/xcb/glx.h:271

  --* Opcode for xcb_glx_render.  
  --*
  -- * @brief xcb_glx_render_request_t
  -- * 

   type xcb_glx_render_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:283
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:284
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:285
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:286
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:282

  --* Opcode for xcb_glx_render_large.  
  --*
  -- * @brief xcb_glx_render_large_request_t
  -- * 

   type xcb_glx_render_large_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:296
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:297
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:298
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:299
      request_num : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:300
      request_total : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:301
      data_len : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:302
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:295

  --* Opcode for xcb_glx_create_context.  
  --*
  -- * @brief xcb_glx_create_context_request_t
  -- * 

   type xcb_glx_create_context_request_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_create_context_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:312
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:313
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:314
      context : aliased xcb_glx_context_t;  -- /usr/include/xcb/glx.h:315
      visual : aliased xproto.xcb_visualid_t;  -- /usr/include/xcb/glx.h:316
      screen : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:317
      share_list : aliased xcb_glx_context_t;  -- /usr/include/xcb/glx.h:318
      is_direct : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:319
      pad0 : aliased xcb_glx_create_context_request_t_array1897;  -- /usr/include/xcb/glx.h:320
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:311

  --* Opcode for xcb_glx_destroy_context.  
  --*
  -- * @brief xcb_glx_destroy_context_request_t
  -- * 

   type xcb_glx_destroy_context_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:330
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:331
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:332
      context : aliased xcb_glx_context_t;  -- /usr/include/xcb/glx.h:333
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:329

  --*
  -- * @brief xcb_glx_make_current_cookie_t
  -- * 

   type xcb_glx_make_current_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:340
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:339

  --* Opcode for xcb_glx_make_current.  
  --*
  -- * @brief xcb_glx_make_current_request_t
  -- * 

   type xcb_glx_make_current_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:350
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:351
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:352
      drawable : aliased xcb_glx_drawable_t;  -- /usr/include/xcb/glx.h:353
      context : aliased xcb_glx_context_t;  -- /usr/include/xcb/glx.h:354
      old_context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:355
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:349

  --*
  -- * @brief xcb_glx_make_current_reply_t
  -- * 

   type xcb_glx_make_current_reply_t_array1992 is array (0 .. 19) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_make_current_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:362
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:363
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:364
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:365
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:366
      pad1 : aliased xcb_glx_make_current_reply_t_array1992;  -- /usr/include/xcb/glx.h:367
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:361

  --*
  -- * @brief xcb_glx_is_direct_cookie_t
  -- * 

   type xcb_glx_is_direct_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:374
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:373

  --* Opcode for xcb_glx_is_direct.  
  --*
  -- * @brief xcb_glx_is_direct_request_t
  -- * 

   type xcb_glx_is_direct_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:384
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:385
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:386
      context : aliased xcb_glx_context_t;  -- /usr/include/xcb/glx.h:387
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:383

  --*
  -- * @brief xcb_glx_is_direct_reply_t
  -- * 

   type xcb_glx_is_direct_reply_t_array4297 is array (0 .. 22) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_is_direct_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:394
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:395
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:396
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:397
      is_direct : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:398
      pad1 : aliased xcb_glx_is_direct_reply_t_array4297;  -- /usr/include/xcb/glx.h:399
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:393

  --*
  -- * @brief xcb_glx_query_version_cookie_t
  -- * 

   type xcb_glx_query_version_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:406
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:405

  --* Opcode for xcb_glx_query_version.  
  --*
  -- * @brief xcb_glx_query_version_request_t
  -- * 

   type xcb_glx_query_version_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:416
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:417
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:418
      major_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:419
      minor_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:420
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:415

  --*
  -- * @brief xcb_glx_query_version_reply_t
  -- * 

   type xcb_glx_query_version_reply_t_array4308 is array (0 .. 15) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_query_version_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:427
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:428
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:429
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:430
      major_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:431
      minor_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:432
      pad1 : aliased xcb_glx_query_version_reply_t_array4308;  -- /usr/include/xcb/glx.h:433
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:426

  --* Opcode for xcb_glx_wait_gl.  
  --*
  -- * @brief xcb_glx_wait_gl_request_t
  -- * 

   type xcb_glx_wait_gl_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:443
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:444
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:445
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:446
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:442

  --* Opcode for xcb_glx_wait_x.  
  --*
  -- * @brief xcb_glx_wait_x_request_t
  -- * 

   type xcb_glx_wait_x_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:456
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:457
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:458
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:459
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:455

  --* Opcode for xcb_glx_copy_context.  
  --*
  -- * @brief xcb_glx_copy_context_request_t
  -- * 

   type xcb_glx_copy_context_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:469
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:470
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:471
      src : aliased xcb_glx_context_t;  -- /usr/include/xcb/glx.h:472
      dest : aliased xcb_glx_context_t;  -- /usr/include/xcb/glx.h:473
      mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:474
      src_context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:475
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:468

   subtype xcb_glx_gc_t is unsigned;
   XCB_GLX_GC_GL_CURRENT_BIT : constant unsigned := 1;
   XCB_GLX_GC_GL_POINT_BIT : constant unsigned := 2;
   XCB_GLX_GC_GL_LINE_BIT : constant unsigned := 4;
   XCB_GLX_GC_GL_POLYGON_BIT : constant unsigned := 8;
   XCB_GLX_GC_GL_POLYGON_STIPPLE_BIT : constant unsigned := 16;
   XCB_GLX_GC_GL_PIXEL_MODE_BIT : constant unsigned := 32;
   XCB_GLX_GC_GL_LIGHTING_BIT : constant unsigned := 64;
   XCB_GLX_GC_GL_FOG_BIT : constant unsigned := 128;
   XCB_GLX_GC_GL_DEPTH_BUFFER_BIT : constant unsigned := 256;
   XCB_GLX_GC_GL_ACCUM_BUFFER_BIT : constant unsigned := 512;
   XCB_GLX_GC_GL_STENCIL_BUFFER_BIT : constant unsigned := 1024;
   XCB_GLX_GC_GL_VIEWPORT_BIT : constant unsigned := 2048;
   XCB_GLX_GC_GL_TRANSFORM_BIT : constant unsigned := 4096;
   XCB_GLX_GC_GL_ENABLE_BIT : constant unsigned := 8192;
   XCB_GLX_GC_GL_COLOR_BUFFER_BIT : constant unsigned := 16384;
   XCB_GLX_GC_GL_HINT_BIT : constant unsigned := 32768;
   XCB_GLX_GC_GL_EVAL_BIT : constant unsigned := 65536;
   XCB_GLX_GC_GL_LIST_BIT : constant unsigned := 131072;
   XCB_GLX_GC_GL_TEXTURE_BIT : constant unsigned := 262144;
   XCB_GLX_GC_GL_SCISSOR_BIT : constant unsigned := 524288;
   XCB_GLX_GC_GL_ALL_ATTRIB_BITS : constant unsigned := 16777215;  -- /usr/include/xcb/glx.h:478

  --* Opcode for xcb_glx_swap_buffers.  
  --*
  -- * @brief xcb_glx_swap_buffers_request_t
  -- * 

   type xcb_glx_swap_buffers_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:509
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:510
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:511
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:512
      drawable : aliased xcb_glx_drawable_t;  -- /usr/include/xcb/glx.h:513
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:508

  --* Opcode for xcb_glx_use_x_font.  
  --*
  -- * @brief xcb_glx_use_x_font_request_t
  -- * 

   type xcb_glx_use_x_font_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:523
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:524
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:525
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:526
      font : aliased xproto.xcb_font_t;  -- /usr/include/xcb/glx.h:527
      first : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:528
      count : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:529
      list_base : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:530
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:522

  --* Opcode for xcb_glx_create_glx_pixmap.  
  --*
  -- * @brief xcb_glx_create_glx_pixmap_request_t
  -- * 

   type xcb_glx_create_glx_pixmap_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:540
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:541
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:542
      screen : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:543
      visual : aliased xproto.xcb_visualid_t;  -- /usr/include/xcb/glx.h:544
      pixmap : aliased xproto.xcb_pixmap_t;  -- /usr/include/xcb/glx.h:545
      glx_pixmap : aliased xcb_glx_pixmap_t;  -- /usr/include/xcb/glx.h:546
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:539

  --*
  -- * @brief xcb_glx_get_visual_configs_cookie_t
  -- * 

   type xcb_glx_get_visual_configs_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:553
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:552

  --* Opcode for xcb_glx_get_visual_configs.  
  --*
  -- * @brief xcb_glx_get_visual_configs_request_t
  -- * 

   type xcb_glx_get_visual_configs_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:563
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:564
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:565
      screen : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:566
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:562

  --*
  -- * @brief xcb_glx_get_visual_configs_reply_t
  -- * 

   type xcb_glx_get_visual_configs_reply_t_array4308 is array (0 .. 15) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_visual_configs_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:573
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:574
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:575
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:576
      num_visuals : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:577
      num_properties : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:578
      pad1 : aliased xcb_glx_get_visual_configs_reply_t_array4308;  -- /usr/include/xcb/glx.h:579
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:572

  --* Opcode for xcb_glx_destroy_glx_pixmap.  
  --*
  -- * @brief xcb_glx_destroy_glx_pixmap_request_t
  -- * 

   type xcb_glx_destroy_glx_pixmap_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:589
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:590
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:591
      glx_pixmap : aliased xcb_glx_pixmap_t;  -- /usr/include/xcb/glx.h:592
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:588

  --* Opcode for xcb_glx_vendor_private.  
  --*
  -- * @brief xcb_glx_vendor_private_request_t
  -- * 

   type xcb_glx_vendor_private_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:602
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:603
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:604
      vendor_code : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:605
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:606
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:601

  --*
  -- * @brief xcb_glx_vendor_private_with_reply_cookie_t
  -- * 

   type xcb_glx_vendor_private_with_reply_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:613
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:612

  --* Opcode for xcb_glx_vendor_private_with_reply.  
  --*
  -- * @brief xcb_glx_vendor_private_with_reply_request_t
  -- * 

   type xcb_glx_vendor_private_with_reply_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:623
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:624
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:625
      vendor_code : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:626
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:627
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:622

  --*
  -- * @brief xcb_glx_vendor_private_with_reply_reply_t
  -- * 

   type xcb_glx_vendor_private_with_reply_reply_t_array2717 is array (0 .. 23) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_vendor_private_with_reply_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:634
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:635
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:636
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:637
      retval : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:638
      data1 : aliased xcb_glx_vendor_private_with_reply_reply_t_array2717;  -- /usr/include/xcb/glx.h:639
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:633

  --*
  -- * @brief xcb_glx_query_extensions_string_cookie_t
  -- * 

   type xcb_glx_query_extensions_string_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:646
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:645

  --* Opcode for xcb_glx_query_extensions_string.  
  --*
  -- * @brief xcb_glx_query_extensions_string_request_t
  -- * 

   type xcb_glx_query_extensions_string_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:656
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:657
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:658
      screen : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:659
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:655

  --*
  -- * @brief xcb_glx_query_extensions_string_reply_t
  -- * 

   type xcb_glx_query_extensions_string_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_query_extensions_string_reply_t_array4308 is array (0 .. 15) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_query_extensions_string_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:666
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:667
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:668
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:669
      pad1 : aliased xcb_glx_query_extensions_string_reply_t_array1791;  -- /usr/include/xcb/glx.h:670
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:671
      pad2 : aliased xcb_glx_query_extensions_string_reply_t_array4308;  -- /usr/include/xcb/glx.h:672
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:665

  --*
  -- * @brief xcb_glx_query_server_string_cookie_t
  -- * 

   type xcb_glx_query_server_string_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:679
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:678

  --* Opcode for xcb_glx_query_server_string.  
  --*
  -- * @brief xcb_glx_query_server_string_request_t
  -- * 

   type xcb_glx_query_server_string_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:689
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:690
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:691
      screen : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:692
      name : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:693
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:688

  --*
  -- * @brief xcb_glx_query_server_string_reply_t
  -- * 

   type xcb_glx_query_server_string_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_query_server_string_reply_t_array4308 is array (0 .. 15) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_query_server_string_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:700
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:701
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:702
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:703
      pad1 : aliased xcb_glx_query_server_string_reply_t_array1791;  -- /usr/include/xcb/glx.h:704
      str_len : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:705
      pad2 : aliased xcb_glx_query_server_string_reply_t_array4308;  -- /usr/include/xcb/glx.h:706
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:699

  --* Opcode for xcb_glx_client_info.  
  --*
  -- * @brief xcb_glx_client_info_request_t
  -- * 

   type xcb_glx_client_info_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:716
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:717
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:718
      major_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:719
      minor_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:720
      str_len : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:721
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:715

  --*
  -- * @brief xcb_glx_get_fb_configs_cookie_t
  -- * 

   type xcb_glx_get_fb_configs_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:728
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:727

  --* Opcode for xcb_glx_get_fb_configs.  
  --*
  -- * @brief xcb_glx_get_fb_configs_request_t
  -- * 

   type xcb_glx_get_fb_configs_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:738
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:739
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:740
      screen : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:741
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:737

  --*
  -- * @brief xcb_glx_get_fb_configs_reply_t
  -- * 

   type xcb_glx_get_fb_configs_reply_t_array4308 is array (0 .. 15) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_fb_configs_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:748
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:749
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:750
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:751
      num_FB_configs : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:752
      num_properties : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:753
      pad1 : aliased xcb_glx_get_fb_configs_reply_t_array4308;  -- /usr/include/xcb/glx.h:754
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:747

  --* Opcode for xcb_glx_create_pixmap.  
  --*
  -- * @brief xcb_glx_create_pixmap_request_t
  -- * 

   type xcb_glx_create_pixmap_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:764
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:765
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:766
      screen : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:767
      fbconfig : aliased xcb_glx_fbconfig_t;  -- /usr/include/xcb/glx.h:768
      pixmap : aliased xproto.xcb_pixmap_t;  -- /usr/include/xcb/glx.h:769
      glx_pixmap : aliased xcb_glx_pixmap_t;  -- /usr/include/xcb/glx.h:770
      num_attribs : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:771
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:763

  --* Opcode for xcb_glx_destroy_pixmap.  
  --*
  -- * @brief xcb_glx_destroy_pixmap_request_t
  -- * 

   type xcb_glx_destroy_pixmap_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:781
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:782
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:783
      glx_pixmap : aliased xcb_glx_pixmap_t;  -- /usr/include/xcb/glx.h:784
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:780

  --* Opcode for xcb_glx_create_new_context.  
  --*
  -- * @brief xcb_glx_create_new_context_request_t
  -- * 

   type xcb_glx_create_new_context_request_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_create_new_context_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:794
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:795
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:796
      context : aliased xcb_glx_context_t;  -- /usr/include/xcb/glx.h:797
      fbconfig : aliased xcb_glx_fbconfig_t;  -- /usr/include/xcb/glx.h:798
      screen : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:799
      render_type : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:800
      share_list : aliased xcb_glx_context_t;  -- /usr/include/xcb/glx.h:801
      is_direct : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:802
      pad0 : aliased xcb_glx_create_new_context_request_t_array1897;  -- /usr/include/xcb/glx.h:803
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:793

  --*
  -- * @brief xcb_glx_query_context_cookie_t
  -- * 

   type xcb_glx_query_context_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:810
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:809

  --* Opcode for xcb_glx_query_context.  
  --*
  -- * @brief xcb_glx_query_context_request_t
  -- * 

   type xcb_glx_query_context_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:820
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:821
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:822
      context : aliased xcb_glx_context_t;  -- /usr/include/xcb/glx.h:823
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:819

  --*
  -- * @brief xcb_glx_query_context_reply_t
  -- * 

   type xcb_glx_query_context_reply_t_array1992 is array (0 .. 19) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_query_context_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:830
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:831
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:832
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:833
      num_attribs : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:834
      pad1 : aliased xcb_glx_query_context_reply_t_array1992;  -- /usr/include/xcb/glx.h:835
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:829

  --*
  -- * @brief xcb_glx_make_context_current_cookie_t
  -- * 

   type xcb_glx_make_context_current_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:842
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:841

  --* Opcode for xcb_glx_make_context_current.  
  --*
  -- * @brief xcb_glx_make_context_current_request_t
  -- * 

   type xcb_glx_make_context_current_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:852
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:853
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:854
      old_context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:855
      drawable : aliased xcb_glx_drawable_t;  -- /usr/include/xcb/glx.h:856
      read_drawable : aliased xcb_glx_drawable_t;  -- /usr/include/xcb/glx.h:857
      context : aliased xcb_glx_context_t;  -- /usr/include/xcb/glx.h:858
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:851

  --*
  -- * @brief xcb_glx_make_context_current_reply_t
  -- * 

   type xcb_glx_make_context_current_reply_t_array1992 is array (0 .. 19) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_make_context_current_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:865
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:866
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:867
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:868
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:869
      pad1 : aliased xcb_glx_make_context_current_reply_t_array1992;  -- /usr/include/xcb/glx.h:870
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:864

  --* Opcode for xcb_glx_create_pbuffer.  
  --*
  -- * @brief xcb_glx_create_pbuffer_request_t
  -- * 

   type xcb_glx_create_pbuffer_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:880
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:881
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:882
      screen : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:883
      fbconfig : aliased xcb_glx_fbconfig_t;  -- /usr/include/xcb/glx.h:884
      pbuffer : aliased xcb_glx_pbuffer_t;  -- /usr/include/xcb/glx.h:885
      num_attribs : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:886
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:879

  --* Opcode for xcb_glx_destroy_pbuffer.  
  --*
  -- * @brief xcb_glx_destroy_pbuffer_request_t
  -- * 

   type xcb_glx_destroy_pbuffer_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:896
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:897
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:898
      pbuffer : aliased xcb_glx_pbuffer_t;  -- /usr/include/xcb/glx.h:899
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:895

  --*
  -- * @brief xcb_glx_get_drawable_attributes_cookie_t
  -- * 

   type xcb_glx_get_drawable_attributes_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:906
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:905

  --* Opcode for xcb_glx_get_drawable_attributes.  
  --*
  -- * @brief xcb_glx_get_drawable_attributes_request_t
  -- * 

   type xcb_glx_get_drawable_attributes_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:916
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:917
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:918
      drawable : aliased xcb_glx_drawable_t;  -- /usr/include/xcb/glx.h:919
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:915

  --*
  -- * @brief xcb_glx_get_drawable_attributes_reply_t
  -- * 

   type xcb_glx_get_drawable_attributes_reply_t_array1992 is array (0 .. 19) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_drawable_attributes_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:926
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:927
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:928
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:929
      num_attribs : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:930
      pad1 : aliased xcb_glx_get_drawable_attributes_reply_t_array1992;  -- /usr/include/xcb/glx.h:931
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:925

  --* Opcode for xcb_glx_change_drawable_attributes.  
  --*
  -- * @brief xcb_glx_change_drawable_attributes_request_t
  -- * 

   type xcb_glx_change_drawable_attributes_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:941
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:942
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:943
      drawable : aliased xcb_glx_drawable_t;  -- /usr/include/xcb/glx.h:944
      num_attribs : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:945
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:940

  --* Opcode for xcb_glx_create_window.  
  --*
  -- * @brief xcb_glx_create_window_request_t
  -- * 

   type xcb_glx_create_window_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:955
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:956
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:957
      screen : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:958
      fbconfig : aliased xcb_glx_fbconfig_t;  -- /usr/include/xcb/glx.h:959
      window : aliased xproto.xcb_window_t;  -- /usr/include/xcb/glx.h:960
      glx_window : aliased xcb_glx_window_t;  -- /usr/include/xcb/glx.h:961
      num_attribs : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:962
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:954

  --* Opcode for xcb_glx_delete_window.  
  --*
  -- * @brief xcb_glx_delete_window_request_t
  -- * 

   type xcb_glx_delete_window_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:972
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:973
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:974
      glxwindow : aliased xcb_glx_window_t;  -- /usr/include/xcb/glx.h:975
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:971

  --* Opcode for xcb_glx_set_client_info_arb.  
  --*
  -- * @brief xcb_glx_set_client_info_arb_request_t
  -- * 

   type xcb_glx_set_client_info_arb_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:985
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:986
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:987
      major_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:988
      minor_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:989
      num_versions : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:990
      gl_str_len : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:991
      glx_str_len : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:992
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:984

  --* Opcode for xcb_glx_create_context_attribs_arb.  
  --*
  -- * @brief xcb_glx_create_context_attribs_arb_request_t
  -- * 

   type xcb_glx_create_context_attribs_arb_request_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_create_context_attribs_arb_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1002
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1003
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1004
      context : aliased xcb_glx_context_t;  -- /usr/include/xcb/glx.h:1005
      fbconfig : aliased xcb_glx_fbconfig_t;  -- /usr/include/xcb/glx.h:1006
      screen : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1007
      share_list : aliased xcb_glx_context_t;  -- /usr/include/xcb/glx.h:1008
      is_direct : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1009
      pad0 : aliased xcb_glx_create_context_attribs_arb_request_t_array1897;  -- /usr/include/xcb/glx.h:1010
      num_attribs : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1011
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1001

  --* Opcode for xcb_glx_set_client_info_2arb.  
  --*
  -- * @brief xcb_glx_set_client_info_2arb_request_t
  -- * 

   type xcb_glx_set_client_info_2arb_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1021
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1022
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1023
      major_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1024
      minor_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1025
      num_versions : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1026
      gl_str_len : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1027
      glx_str_len : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1028
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1020

  --* Opcode for xcb_glx_new_list.  
  --*
  -- * @brief xcb_glx_new_list_request_t
  -- * 

   type xcb_glx_new_list_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1038
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1039
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1040
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1041
      list : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1042
      mode : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1043
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1037

  --* Opcode for xcb_glx_end_list.  
  --*
  -- * @brief xcb_glx_end_list_request_t
  -- * 

   type xcb_glx_end_list_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1053
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1054
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1055
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1056
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1052

  --* Opcode for xcb_glx_delete_lists.  
  --*
  -- * @brief xcb_glx_delete_lists_request_t
  -- * 

   type xcb_glx_delete_lists_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1066
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1067
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1068
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1069
      list : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1070
      c_range : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:1071
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1065

  --*
  -- * @brief xcb_glx_gen_lists_cookie_t
  -- * 

   type xcb_glx_gen_lists_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:1078
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1077

  --* Opcode for xcb_glx_gen_lists.  
  --*
  -- * @brief xcb_glx_gen_lists_request_t
  -- * 

   type xcb_glx_gen_lists_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1088
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1089
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1090
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1091
      c_range : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:1092
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1087

  --*
  -- * @brief xcb_glx_gen_lists_reply_t
  -- * 

   type xcb_glx_gen_lists_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1099
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1100
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1101
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1102
      ret_val : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1103
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1098

  --* Opcode for xcb_glx_feedback_buffer.  
  --*
  -- * @brief xcb_glx_feedback_buffer_request_t
  -- * 

   type xcb_glx_feedback_buffer_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1113
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1114
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1115
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1116
      size : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:1117
      c_type : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:1118
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1112

  --* Opcode for xcb_glx_select_buffer.  
  --*
  -- * @brief xcb_glx_select_buffer_request_t
  -- * 

   type xcb_glx_select_buffer_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1128
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1129
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1130
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1131
      size : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:1132
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1127

  --*
  -- * @brief xcb_glx_render_mode_cookie_t
  -- * 

   type xcb_glx_render_mode_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:1139
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1138

  --* Opcode for xcb_glx_render_mode.  
  --*
  -- * @brief xcb_glx_render_mode_request_t
  -- * 

   type xcb_glx_render_mode_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1149
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1150
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1151
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1152
      mode : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1153
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1148

  --*
  -- * @brief xcb_glx_render_mode_reply_t
  -- * 

   type xcb_glx_render_mode_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_render_mode_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1160
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1161
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1162
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1163
      ret_val : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1164
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1165
      new_mode : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1166
      pad1 : aliased xcb_glx_render_mode_reply_t_array2180;  -- /usr/include/xcb/glx.h:1167
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1159

   subtype xcb_glx_rm_t is unsigned;
   XCB_GLX_RM_GL_RENDER : constant unsigned := 7168;
   XCB_GLX_RM_GL_FEEDBACK : constant unsigned := 7169;
   XCB_GLX_RM_GL_SELECT : constant unsigned := 7170;  -- /usr/include/xcb/glx.h:1170

  --*
  -- * @brief xcb_glx_finish_cookie_t
  -- * 

   type xcb_glx_finish_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:1180
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1179

  --* Opcode for xcb_glx_finish.  
  --*
  -- * @brief xcb_glx_finish_request_t
  -- * 

   type xcb_glx_finish_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1190
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1191
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1192
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1193
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1189

  --*
  -- * @brief xcb_glx_finish_reply_t
  -- * 

   type xcb_glx_finish_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1200
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1201
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1202
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1203
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1199

  --* Opcode for xcb_glx_pixel_storef.  
  --*
  -- * @brief xcb_glx_pixel_storef_request_t
  -- * 

   type xcb_glx_pixel_storef_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1213
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1214
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1215
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1216
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1217
      datum : aliased xcb_glx_float32_t;  -- /usr/include/xcb/glx.h:1218
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1212

  --* Opcode for xcb_glx_pixel_storei.  
  --*
  -- * @brief xcb_glx_pixel_storei_request_t
  -- * 

   type xcb_glx_pixel_storei_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1228
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1229
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1230
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1231
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1232
      datum : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:1233
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1227

  --*
  -- * @brief xcb_glx_read_pixels_cookie_t
  -- * 

   type xcb_glx_read_pixels_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:1240
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1239

  --* Opcode for xcb_glx_read_pixels.  
  --*
  -- * @brief xcb_glx_read_pixels_request_t
  -- * 

   type xcb_glx_read_pixels_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1250
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1251
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1252
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1253
      x : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:1254
      y : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:1255
      width : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:1256
      height : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:1257
      format : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1258
      c_type : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1259
      swap_bytes : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1260
      lsb_first : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1261
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1249

  --*
  -- * @brief xcb_glx_read_pixels_reply_t
  -- * 

   type xcb_glx_read_pixels_reply_t_array2717 is array (0 .. 23) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_read_pixels_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1268
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1269
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1270
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1271
      pad1 : aliased xcb_glx_read_pixels_reply_t_array2717;  -- /usr/include/xcb/glx.h:1272
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1267

  --*
  -- * @brief xcb_glx_get_booleanv_cookie_t
  -- * 

   type xcb_glx_get_booleanv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:1279
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1278

  --* Opcode for xcb_glx_get_booleanv.  
  --*
  -- * @brief xcb_glx_get_booleanv_request_t
  -- * 

   type xcb_glx_get_booleanv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1289
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1290
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1291
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1292
      pname : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:1293
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1288

  --*
  -- * @brief xcb_glx_get_booleanv_reply_t
  -- * 

   type xcb_glx_get_booleanv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_booleanv_reply_t_array4515 is array (0 .. 14) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_booleanv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1300
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1301
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1302
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1303
      pad1 : aliased xcb_glx_get_booleanv_reply_t_array1791;  -- /usr/include/xcb/glx.h:1304
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1305
      datum : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1306
      pad2 : aliased xcb_glx_get_booleanv_reply_t_array4515;  -- /usr/include/xcb/glx.h:1307
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1299

  --*
  -- * @brief xcb_glx_get_clip_plane_cookie_t
  -- * 

   type xcb_glx_get_clip_plane_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:1314
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1313

  --* Opcode for xcb_glx_get_clip_plane.  
  --*
  -- * @brief xcb_glx_get_clip_plane_request_t
  -- * 

   type xcb_glx_get_clip_plane_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1324
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1325
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1326
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1327
      plane : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:1328
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1323

  --*
  -- * @brief xcb_glx_get_clip_plane_reply_t
  -- * 

   type xcb_glx_get_clip_plane_reply_t_array2717 is array (0 .. 23) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_clip_plane_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1335
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1336
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1337
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1338
      pad1 : aliased xcb_glx_get_clip_plane_reply_t_array2717;  -- /usr/include/xcb/glx.h:1339
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1334

  --*
  -- * @brief xcb_glx_get_doublev_cookie_t
  -- * 

   type xcb_glx_get_doublev_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:1346
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1345

  --* Opcode for xcb_glx_get_doublev.  
  --*
  -- * @brief xcb_glx_get_doublev_request_t
  -- * 

   type xcb_glx_get_doublev_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1356
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1357
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1358
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1359
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1360
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1355

  --*
  -- * @brief xcb_glx_get_doublev_reply_t
  -- * 

   type xcb_glx_get_doublev_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_doublev_reply_t_array2620 is array (0 .. 7) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_doublev_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1367
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1368
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1369
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1370
      pad1 : aliased xcb_glx_get_doublev_reply_t_array1791;  -- /usr/include/xcb/glx.h:1371
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1372
      datum : aliased xcb_glx_float64_t;  -- /usr/include/xcb/glx.h:1373
      pad2 : aliased xcb_glx_get_doublev_reply_t_array2620;  -- /usr/include/xcb/glx.h:1374
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1366

  --*
  -- * @brief xcb_glx_get_error_cookie_t
  -- * 

   type xcb_glx_get_error_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:1381
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1380

  --* Opcode for xcb_glx_get_error.  
  --*
  -- * @brief xcb_glx_get_error_request_t
  -- * 

   type xcb_glx_get_error_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1391
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1392
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1393
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1394
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1390

  --*
  -- * @brief xcb_glx_get_error_reply_t
  -- * 

   type xcb_glx_get_error_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1401
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1402
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1403
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1404
      error : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:1405
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1400

  --*
  -- * @brief xcb_glx_get_floatv_cookie_t
  -- * 

   type xcb_glx_get_floatv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:1412
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1411

  --* Opcode for xcb_glx_get_floatv.  
  --*
  -- * @brief xcb_glx_get_floatv_request_t
  -- * 

   type xcb_glx_get_floatv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1422
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1423
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1424
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1425
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1426
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1421

  --*
  -- * @brief xcb_glx_get_floatv_reply_t
  -- * 

   type xcb_glx_get_floatv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_floatv_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_floatv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1433
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1434
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1435
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1436
      pad1 : aliased xcb_glx_get_floatv_reply_t_array1791;  -- /usr/include/xcb/glx.h:1437
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1438
      datum : aliased xcb_glx_float32_t;  -- /usr/include/xcb/glx.h:1439
      pad2 : aliased xcb_glx_get_floatv_reply_t_array2180;  -- /usr/include/xcb/glx.h:1440
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1432

  --*
  -- * @brief xcb_glx_get_integerv_cookie_t
  -- * 

   type xcb_glx_get_integerv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:1447
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1446

  --* Opcode for xcb_glx_get_integerv.  
  --*
  -- * @brief xcb_glx_get_integerv_request_t
  -- * 

   type xcb_glx_get_integerv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1457
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1458
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1459
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1460
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1461
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1456

  --*
  -- * @brief xcb_glx_get_integerv_reply_t
  -- * 

   type xcb_glx_get_integerv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_integerv_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_integerv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1468
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1469
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1470
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1471
      pad1 : aliased xcb_glx_get_integerv_reply_t_array1791;  -- /usr/include/xcb/glx.h:1472
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1473
      datum : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:1474
      pad2 : aliased xcb_glx_get_integerv_reply_t_array2180;  -- /usr/include/xcb/glx.h:1475
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1467

  --*
  -- * @brief xcb_glx_get_lightfv_cookie_t
  -- * 

   type xcb_glx_get_lightfv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:1482
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1481

  --* Opcode for xcb_glx_get_lightfv.  
  --*
  -- * @brief xcb_glx_get_lightfv_request_t
  -- * 

   type xcb_glx_get_lightfv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1492
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1493
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1494
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1495
      light : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1496
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1497
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1491

  --*
  -- * @brief xcb_glx_get_lightfv_reply_t
  -- * 

   type xcb_glx_get_lightfv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_lightfv_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_lightfv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1504
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1505
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1506
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1507
      pad1 : aliased xcb_glx_get_lightfv_reply_t_array1791;  -- /usr/include/xcb/glx.h:1508
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1509
      datum : aliased xcb_glx_float32_t;  -- /usr/include/xcb/glx.h:1510
      pad2 : aliased xcb_glx_get_lightfv_reply_t_array2180;  -- /usr/include/xcb/glx.h:1511
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1503

  --*
  -- * @brief xcb_glx_get_lightiv_cookie_t
  -- * 

   type xcb_glx_get_lightiv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:1518
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1517

  --* Opcode for xcb_glx_get_lightiv.  
  --*
  -- * @brief xcb_glx_get_lightiv_request_t
  -- * 

   type xcb_glx_get_lightiv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1528
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1529
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1530
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1531
      light : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1532
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1533
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1527

  --*
  -- * @brief xcb_glx_get_lightiv_reply_t
  -- * 

   type xcb_glx_get_lightiv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_lightiv_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_lightiv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1540
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1541
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1542
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1543
      pad1 : aliased xcb_glx_get_lightiv_reply_t_array1791;  -- /usr/include/xcb/glx.h:1544
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1545
      datum : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:1546
      pad2 : aliased xcb_glx_get_lightiv_reply_t_array2180;  -- /usr/include/xcb/glx.h:1547
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1539

  --*
  -- * @brief xcb_glx_get_mapdv_cookie_t
  -- * 

   type xcb_glx_get_mapdv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:1554
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1553

  --* Opcode for xcb_glx_get_mapdv.  
  --*
  -- * @brief xcb_glx_get_mapdv_request_t
  -- * 

   type xcb_glx_get_mapdv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1564
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1565
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1566
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1567
      target : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1568
      query : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1569
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1563

  --*
  -- * @brief xcb_glx_get_mapdv_reply_t
  -- * 

   type xcb_glx_get_mapdv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_mapdv_reply_t_array2620 is array (0 .. 7) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_mapdv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1576
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1577
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1578
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1579
      pad1 : aliased xcb_glx_get_mapdv_reply_t_array1791;  -- /usr/include/xcb/glx.h:1580
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1581
      datum : aliased xcb_glx_float64_t;  -- /usr/include/xcb/glx.h:1582
      pad2 : aliased xcb_glx_get_mapdv_reply_t_array2620;  -- /usr/include/xcb/glx.h:1583
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1575

  --*
  -- * @brief xcb_glx_get_mapfv_cookie_t
  -- * 

   type xcb_glx_get_mapfv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:1590
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1589

  --* Opcode for xcb_glx_get_mapfv.  
  --*
  -- * @brief xcb_glx_get_mapfv_request_t
  -- * 

   type xcb_glx_get_mapfv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1600
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1601
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1602
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1603
      target : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1604
      query : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1605
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1599

  --*
  -- * @brief xcb_glx_get_mapfv_reply_t
  -- * 

   type xcb_glx_get_mapfv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_mapfv_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_mapfv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1612
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1613
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1614
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1615
      pad1 : aliased xcb_glx_get_mapfv_reply_t_array1791;  -- /usr/include/xcb/glx.h:1616
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1617
      datum : aliased xcb_glx_float32_t;  -- /usr/include/xcb/glx.h:1618
      pad2 : aliased xcb_glx_get_mapfv_reply_t_array2180;  -- /usr/include/xcb/glx.h:1619
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1611

  --*
  -- * @brief xcb_glx_get_mapiv_cookie_t
  -- * 

   type xcb_glx_get_mapiv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:1626
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1625

  --* Opcode for xcb_glx_get_mapiv.  
  --*
  -- * @brief xcb_glx_get_mapiv_request_t
  -- * 

   type xcb_glx_get_mapiv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1636
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1637
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1638
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1639
      target : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1640
      query : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1641
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1635

  --*
  -- * @brief xcb_glx_get_mapiv_reply_t
  -- * 

   type xcb_glx_get_mapiv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_mapiv_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_mapiv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1648
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1649
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1650
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1651
      pad1 : aliased xcb_glx_get_mapiv_reply_t_array1791;  -- /usr/include/xcb/glx.h:1652
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1653
      datum : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:1654
      pad2 : aliased xcb_glx_get_mapiv_reply_t_array2180;  -- /usr/include/xcb/glx.h:1655
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1647

  --*
  -- * @brief xcb_glx_get_materialfv_cookie_t
  -- * 

   type xcb_glx_get_materialfv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:1662
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1661

  --* Opcode for xcb_glx_get_materialfv.  
  --*
  -- * @brief xcb_glx_get_materialfv_request_t
  -- * 

   type xcb_glx_get_materialfv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1672
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1673
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1674
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1675
      face : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1676
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1677
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1671

  --*
  -- * @brief xcb_glx_get_materialfv_reply_t
  -- * 

   type xcb_glx_get_materialfv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_materialfv_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_materialfv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1684
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1685
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1686
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1687
      pad1 : aliased xcb_glx_get_materialfv_reply_t_array1791;  -- /usr/include/xcb/glx.h:1688
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1689
      datum : aliased xcb_glx_float32_t;  -- /usr/include/xcb/glx.h:1690
      pad2 : aliased xcb_glx_get_materialfv_reply_t_array2180;  -- /usr/include/xcb/glx.h:1691
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1683

  --*
  -- * @brief xcb_glx_get_materialiv_cookie_t
  -- * 

   type xcb_glx_get_materialiv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:1698
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1697

  --* Opcode for xcb_glx_get_materialiv.  
  --*
  -- * @brief xcb_glx_get_materialiv_request_t
  -- * 

   type xcb_glx_get_materialiv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1708
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1709
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1710
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1711
      face : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1712
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1713
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1707

  --*
  -- * @brief xcb_glx_get_materialiv_reply_t
  -- * 

   type xcb_glx_get_materialiv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_materialiv_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_materialiv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1720
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1721
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1722
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1723
      pad1 : aliased xcb_glx_get_materialiv_reply_t_array1791;  -- /usr/include/xcb/glx.h:1724
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1725
      datum : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:1726
      pad2 : aliased xcb_glx_get_materialiv_reply_t_array2180;  -- /usr/include/xcb/glx.h:1727
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1719

  --*
  -- * @brief xcb_glx_get_pixel_mapfv_cookie_t
  -- * 

   type xcb_glx_get_pixel_mapfv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:1734
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1733

  --* Opcode for xcb_glx_get_pixel_mapfv.  
  --*
  -- * @brief xcb_glx_get_pixel_mapfv_request_t
  -- * 

   type xcb_glx_get_pixel_mapfv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1744
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1745
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1746
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1747
      map : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1748
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1743

  --*
  -- * @brief xcb_glx_get_pixel_mapfv_reply_t
  -- * 

   type xcb_glx_get_pixel_mapfv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_pixel_mapfv_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_pixel_mapfv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1755
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1756
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1757
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1758
      pad1 : aliased xcb_glx_get_pixel_mapfv_reply_t_array1791;  -- /usr/include/xcb/glx.h:1759
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1760
      datum : aliased xcb_glx_float32_t;  -- /usr/include/xcb/glx.h:1761
      pad2 : aliased xcb_glx_get_pixel_mapfv_reply_t_array2180;  -- /usr/include/xcb/glx.h:1762
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1754

  --*
  -- * @brief xcb_glx_get_pixel_mapuiv_cookie_t
  -- * 

   type xcb_glx_get_pixel_mapuiv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:1769
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1768

  --* Opcode for xcb_glx_get_pixel_mapuiv.  
  --*
  -- * @brief xcb_glx_get_pixel_mapuiv_request_t
  -- * 

   type xcb_glx_get_pixel_mapuiv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1779
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1780
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1781
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1782
      map : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1783
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1778

  --*
  -- * @brief xcb_glx_get_pixel_mapuiv_reply_t
  -- * 

   type xcb_glx_get_pixel_mapuiv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_pixel_mapuiv_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_pixel_mapuiv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1790
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1791
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1792
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1793
      pad1 : aliased xcb_glx_get_pixel_mapuiv_reply_t_array1791;  -- /usr/include/xcb/glx.h:1794
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1795
      datum : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1796
      pad2 : aliased xcb_glx_get_pixel_mapuiv_reply_t_array2180;  -- /usr/include/xcb/glx.h:1797
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1789

  --*
  -- * @brief xcb_glx_get_pixel_mapusv_cookie_t
  -- * 

   type xcb_glx_get_pixel_mapusv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:1804
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1803

  --* Opcode for xcb_glx_get_pixel_mapusv.  
  --*
  -- * @brief xcb_glx_get_pixel_mapusv_request_t
  -- * 

   type xcb_glx_get_pixel_mapusv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1814
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1815
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1816
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1817
      map : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1818
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1813

  --*
  -- * @brief xcb_glx_get_pixel_mapusv_reply_t
  -- * 

   type xcb_glx_get_pixel_mapusv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_pixel_mapusv_reply_t_array4308 is array (0 .. 15) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_pixel_mapusv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1825
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1826
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1827
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1828
      pad1 : aliased xcb_glx_get_pixel_mapusv_reply_t_array1791;  -- /usr/include/xcb/glx.h:1829
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1830
      datum : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1831
      pad2 : aliased xcb_glx_get_pixel_mapusv_reply_t_array4308;  -- /usr/include/xcb/glx.h:1832
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1824

  --*
  -- * @brief xcb_glx_get_polygon_stipple_cookie_t
  -- * 

   type xcb_glx_get_polygon_stipple_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:1839
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1838

  --* Opcode for xcb_glx_get_polygon_stipple.  
  --*
  -- * @brief xcb_glx_get_polygon_stipple_request_t
  -- * 

   type xcb_glx_get_polygon_stipple_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1849
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1850
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1851
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1852
      lsb_first : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1853
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1848

  --*
  -- * @brief xcb_glx_get_polygon_stipple_reply_t
  -- * 

   type xcb_glx_get_polygon_stipple_reply_t_array2717 is array (0 .. 23) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_polygon_stipple_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1860
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1861
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1862
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1863
      pad1 : aliased xcb_glx_get_polygon_stipple_reply_t_array2717;  -- /usr/include/xcb/glx.h:1864
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1859

  --*
  -- * @brief xcb_glx_get_string_cookie_t
  -- * 

   type xcb_glx_get_string_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:1871
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1870

  --* Opcode for xcb_glx_get_string.  
  --*
  -- * @brief xcb_glx_get_string_request_t
  -- * 

   type xcb_glx_get_string_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1881
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1882
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1883
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1884
      name : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1885
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1880

  --*
  -- * @brief xcb_glx_get_string_reply_t
  -- * 

   type xcb_glx_get_string_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_string_reply_t_array4308 is array (0 .. 15) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_string_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1892
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1893
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1894
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1895
      pad1 : aliased xcb_glx_get_string_reply_t_array1791;  -- /usr/include/xcb/glx.h:1896
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1897
      pad2 : aliased xcb_glx_get_string_reply_t_array4308;  -- /usr/include/xcb/glx.h:1898
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1891

  --*
  -- * @brief xcb_glx_get_tex_envfv_cookie_t
  -- * 

   type xcb_glx_get_tex_envfv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:1905
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1904

  --* Opcode for xcb_glx_get_tex_envfv.  
  --*
  -- * @brief xcb_glx_get_tex_envfv_request_t
  -- * 

   type xcb_glx_get_tex_envfv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1915
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1916
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1917
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1918
      target : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1919
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1920
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1914

  --*
  -- * @brief xcb_glx_get_tex_envfv_reply_t
  -- * 

   type xcb_glx_get_tex_envfv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_tex_envfv_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_tex_envfv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1927
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1928
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1929
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1930
      pad1 : aliased xcb_glx_get_tex_envfv_reply_t_array1791;  -- /usr/include/xcb/glx.h:1931
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1932
      datum : aliased xcb_glx_float32_t;  -- /usr/include/xcb/glx.h:1933
      pad2 : aliased xcb_glx_get_tex_envfv_reply_t_array2180;  -- /usr/include/xcb/glx.h:1934
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1926

  --*
  -- * @brief xcb_glx_get_tex_enviv_cookie_t
  -- * 

   type xcb_glx_get_tex_enviv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:1941
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1940

  --* Opcode for xcb_glx_get_tex_enviv.  
  --*
  -- * @brief xcb_glx_get_tex_enviv_request_t
  -- * 

   type xcb_glx_get_tex_enviv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1951
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1952
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1953
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1954
      target : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1955
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1956
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1950

  --*
  -- * @brief xcb_glx_get_tex_enviv_reply_t
  -- * 

   type xcb_glx_get_tex_enviv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_tex_enviv_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_tex_enviv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1963
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1964
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1965
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1966
      pad1 : aliased xcb_glx_get_tex_enviv_reply_t_array1791;  -- /usr/include/xcb/glx.h:1967
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1968
      datum : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:1969
      pad2 : aliased xcb_glx_get_tex_enviv_reply_t_array2180;  -- /usr/include/xcb/glx.h:1970
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1962

  --*
  -- * @brief xcb_glx_get_tex_gendv_cookie_t
  -- * 

   type xcb_glx_get_tex_gendv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:1977
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1976

  --* Opcode for xcb_glx_get_tex_gendv.  
  --*
  -- * @brief xcb_glx_get_tex_gendv_request_t
  -- * 

   type xcb_glx_get_tex_gendv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1987
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1988
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:1989
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:1990
      coord : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1991
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:1992
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1986

  --*
  -- * @brief xcb_glx_get_tex_gendv_reply_t
  -- * 

   type xcb_glx_get_tex_gendv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_tex_gendv_reply_t_array2620 is array (0 .. 7) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_tex_gendv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:1999
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2000
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2001
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2002
      pad1 : aliased xcb_glx_get_tex_gendv_reply_t_array1791;  -- /usr/include/xcb/glx.h:2003
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2004
      datum : aliased xcb_glx_float64_t;  -- /usr/include/xcb/glx.h:2005
      pad2 : aliased xcb_glx_get_tex_gendv_reply_t_array2620;  -- /usr/include/xcb/glx.h:2006
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:1998

  --*
  -- * @brief xcb_glx_get_tex_genfv_cookie_t
  -- * 

   type xcb_glx_get_tex_genfv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:2013
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2012

  --* Opcode for xcb_glx_get_tex_genfv.  
  --*
  -- * @brief xcb_glx_get_tex_genfv_request_t
  -- * 

   type xcb_glx_get_tex_genfv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2023
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2024
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2025
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2026
      coord : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2027
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2028
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2022

  --*
  -- * @brief xcb_glx_get_tex_genfv_reply_t
  -- * 

   type xcb_glx_get_tex_genfv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_tex_genfv_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_tex_genfv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2035
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2036
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2037
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2038
      pad1 : aliased xcb_glx_get_tex_genfv_reply_t_array1791;  -- /usr/include/xcb/glx.h:2039
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2040
      datum : aliased xcb_glx_float32_t;  -- /usr/include/xcb/glx.h:2041
      pad2 : aliased xcb_glx_get_tex_genfv_reply_t_array2180;  -- /usr/include/xcb/glx.h:2042
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2034

  --*
  -- * @brief xcb_glx_get_tex_geniv_cookie_t
  -- * 

   type xcb_glx_get_tex_geniv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:2049
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2048

  --* Opcode for xcb_glx_get_tex_geniv.  
  --*
  -- * @brief xcb_glx_get_tex_geniv_request_t
  -- * 

   type xcb_glx_get_tex_geniv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2059
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2060
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2061
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2062
      coord : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2063
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2064
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2058

  --*
  -- * @brief xcb_glx_get_tex_geniv_reply_t
  -- * 

   type xcb_glx_get_tex_geniv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_tex_geniv_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_tex_geniv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2071
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2072
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2073
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2074
      pad1 : aliased xcb_glx_get_tex_geniv_reply_t_array1791;  -- /usr/include/xcb/glx.h:2075
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2076
      datum : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:2077
      pad2 : aliased xcb_glx_get_tex_geniv_reply_t_array2180;  -- /usr/include/xcb/glx.h:2078
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2070

  --*
  -- * @brief xcb_glx_get_tex_image_cookie_t
  -- * 

   type xcb_glx_get_tex_image_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:2085
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2084

  --* Opcode for xcb_glx_get_tex_image.  
  --*
  -- * @brief xcb_glx_get_tex_image_request_t
  -- * 

   type xcb_glx_get_tex_image_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2095
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2096
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2097
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2098
      target : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2099
      level : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:2100
      format : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2101
      c_type : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2102
      swap_bytes : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2103
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2094

  --*
  -- * @brief xcb_glx_get_tex_image_reply_t
  -- * 

   type xcb_glx_get_tex_image_reply_t_array2620 is array (0 .. 7) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_tex_image_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_tex_image_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2110
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2111
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2112
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2113
      pad1 : aliased xcb_glx_get_tex_image_reply_t_array2620;  -- /usr/include/xcb/glx.h:2114
      width : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:2115
      height : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:2116
      depth : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:2117
      pad2 : aliased xcb_glx_get_tex_image_reply_t_array1791;  -- /usr/include/xcb/glx.h:2118
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2109

  --*
  -- * @brief xcb_glx_get_tex_parameterfv_cookie_t
  -- * 

   type xcb_glx_get_tex_parameterfv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:2125
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2124

  --* Opcode for xcb_glx_get_tex_parameterfv.  
  --*
  -- * @brief xcb_glx_get_tex_parameterfv_request_t
  -- * 

   type xcb_glx_get_tex_parameterfv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2135
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2136
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2137
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2138
      target : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2139
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2140
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2134

  --*
  -- * @brief xcb_glx_get_tex_parameterfv_reply_t
  -- * 

   type xcb_glx_get_tex_parameterfv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_tex_parameterfv_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_tex_parameterfv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2147
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2148
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2149
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2150
      pad1 : aliased xcb_glx_get_tex_parameterfv_reply_t_array1791;  -- /usr/include/xcb/glx.h:2151
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2152
      datum : aliased xcb_glx_float32_t;  -- /usr/include/xcb/glx.h:2153
      pad2 : aliased xcb_glx_get_tex_parameterfv_reply_t_array2180;  -- /usr/include/xcb/glx.h:2154
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2146

  --*
  -- * @brief xcb_glx_get_tex_parameteriv_cookie_t
  -- * 

   type xcb_glx_get_tex_parameteriv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:2161
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2160

  --* Opcode for xcb_glx_get_tex_parameteriv.  
  --*
  -- * @brief xcb_glx_get_tex_parameteriv_request_t
  -- * 

   type xcb_glx_get_tex_parameteriv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2171
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2172
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2173
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2174
      target : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2175
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2176
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2170

  --*
  -- * @brief xcb_glx_get_tex_parameteriv_reply_t
  -- * 

   type xcb_glx_get_tex_parameteriv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_tex_parameteriv_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_tex_parameteriv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2183
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2184
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2185
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2186
      pad1 : aliased xcb_glx_get_tex_parameteriv_reply_t_array1791;  -- /usr/include/xcb/glx.h:2187
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2188
      datum : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:2189
      pad2 : aliased xcb_glx_get_tex_parameteriv_reply_t_array2180;  -- /usr/include/xcb/glx.h:2190
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2182

  --*
  -- * @brief xcb_glx_get_tex_level_parameterfv_cookie_t
  -- * 

   type xcb_glx_get_tex_level_parameterfv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:2197
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2196

  --* Opcode for xcb_glx_get_tex_level_parameterfv.  
  --*
  -- * @brief xcb_glx_get_tex_level_parameterfv_request_t
  -- * 

   type xcb_glx_get_tex_level_parameterfv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2207
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2208
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2209
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2210
      target : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2211
      level : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:2212
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2213
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2206

  --*
  -- * @brief xcb_glx_get_tex_level_parameterfv_reply_t
  -- * 

   type xcb_glx_get_tex_level_parameterfv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_tex_level_parameterfv_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_tex_level_parameterfv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2220
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2221
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2222
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2223
      pad1 : aliased xcb_glx_get_tex_level_parameterfv_reply_t_array1791;  -- /usr/include/xcb/glx.h:2224
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2225
      datum : aliased xcb_glx_float32_t;  -- /usr/include/xcb/glx.h:2226
      pad2 : aliased xcb_glx_get_tex_level_parameterfv_reply_t_array2180;  -- /usr/include/xcb/glx.h:2227
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2219

  --*
  -- * @brief xcb_glx_get_tex_level_parameteriv_cookie_t
  -- * 

   type xcb_glx_get_tex_level_parameteriv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:2234
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2233

  --* Opcode for xcb_glx_get_tex_level_parameteriv.  
  --*
  -- * @brief xcb_glx_get_tex_level_parameteriv_request_t
  -- * 

   type xcb_glx_get_tex_level_parameteriv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2244
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2245
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2246
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2247
      target : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2248
      level : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:2249
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2250
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2243

  --*
  -- * @brief xcb_glx_get_tex_level_parameteriv_reply_t
  -- * 

   type xcb_glx_get_tex_level_parameteriv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_tex_level_parameteriv_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_tex_level_parameteriv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2257
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2258
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2259
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2260
      pad1 : aliased xcb_glx_get_tex_level_parameteriv_reply_t_array1791;  -- /usr/include/xcb/glx.h:2261
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2262
      datum : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:2263
      pad2 : aliased xcb_glx_get_tex_level_parameteriv_reply_t_array2180;  -- /usr/include/xcb/glx.h:2264
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2256

  --*
  -- * @brief xcb_glx_is_enabled_cookie_t
  -- * 

   type xcb_glx_is_enabled_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:2271
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2270

  --* Opcode for xcb_glx_is_enabled.  
  --*
  -- * @brief xcb_glx_is_enabled_request_t
  -- * 

   type xcb_glx_is_enabled_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2281
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2282
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2283
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2284
      capability : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2285
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2280

  --*
  -- * @brief xcb_glx_is_enabled_reply_t
  -- * 

   type xcb_glx_is_enabled_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2292
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2293
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2294
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2295
      ret_val : aliased xcb_glx_bool32_t;  -- /usr/include/xcb/glx.h:2296
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2291

  --*
  -- * @brief xcb_glx_is_list_cookie_t
  -- * 

   type xcb_glx_is_list_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:2303
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2302

  --* Opcode for xcb_glx_is_list.  
  --*
  -- * @brief xcb_glx_is_list_request_t
  -- * 

   type xcb_glx_is_list_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2313
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2314
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2315
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2316
      list : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2317
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2312

  --*
  -- * @brief xcb_glx_is_list_reply_t
  -- * 

   type xcb_glx_is_list_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2324
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2325
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2326
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2327
      ret_val : aliased xcb_glx_bool32_t;  -- /usr/include/xcb/glx.h:2328
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2323

  --* Opcode for xcb_glx_flush.  
  --*
  -- * @brief xcb_glx_flush_request_t
  -- * 

   type xcb_glx_flush_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2338
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2339
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2340
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2341
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2337

  --*
  -- * @brief xcb_glx_are_textures_resident_cookie_t
  -- * 

   type xcb_glx_are_textures_resident_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:2348
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2347

  --* Opcode for xcb_glx_are_textures_resident.  
  --*
  -- * @brief xcb_glx_are_textures_resident_request_t
  -- * 

   type xcb_glx_are_textures_resident_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2358
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2359
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2360
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2361
      n : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:2362
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2357

  --*
  -- * @brief xcb_glx_are_textures_resident_reply_t
  -- * 

   type xcb_glx_are_textures_resident_reply_t_array1992 is array (0 .. 19) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_are_textures_resident_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2369
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2370
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2371
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2372
      ret_val : aliased xcb_glx_bool32_t;  -- /usr/include/xcb/glx.h:2373
      pad1 : aliased xcb_glx_are_textures_resident_reply_t_array1992;  -- /usr/include/xcb/glx.h:2374
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2368

  --* Opcode for xcb_glx_delete_textures.  
  --*
  -- * @brief xcb_glx_delete_textures_request_t
  -- * 

   type xcb_glx_delete_textures_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2384
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2385
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2386
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2387
      n : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:2388
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2383

  --*
  -- * @brief xcb_glx_gen_textures_cookie_t
  -- * 

   type xcb_glx_gen_textures_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:2395
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2394

  --* Opcode for xcb_glx_gen_textures.  
  --*
  -- * @brief xcb_glx_gen_textures_request_t
  -- * 

   type xcb_glx_gen_textures_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2405
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2406
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2407
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2408
      n : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:2409
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2404

  --*
  -- * @brief xcb_glx_gen_textures_reply_t
  -- * 

   type xcb_glx_gen_textures_reply_t_array2717 is array (0 .. 23) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_gen_textures_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2416
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2417
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2418
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2419
      pad1 : aliased xcb_glx_gen_textures_reply_t_array2717;  -- /usr/include/xcb/glx.h:2420
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2415

  --*
  -- * @brief xcb_glx_is_texture_cookie_t
  -- * 

   type xcb_glx_is_texture_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:2427
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2426

  --* Opcode for xcb_glx_is_texture.  
  --*
  -- * @brief xcb_glx_is_texture_request_t
  -- * 

   type xcb_glx_is_texture_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2437
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2438
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2439
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2440
      texture : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2441
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2436

  --*
  -- * @brief xcb_glx_is_texture_reply_t
  -- * 

   type xcb_glx_is_texture_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2448
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2449
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2450
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2451
      ret_val : aliased xcb_glx_bool32_t;  -- /usr/include/xcb/glx.h:2452
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2447

  --*
  -- * @brief xcb_glx_get_color_table_cookie_t
  -- * 

   type xcb_glx_get_color_table_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:2459
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2458

  --* Opcode for xcb_glx_get_color_table.  
  --*
  -- * @brief xcb_glx_get_color_table_request_t
  -- * 

   type xcb_glx_get_color_table_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2469
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2470
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2471
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2472
      target : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2473
      format : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2474
      c_type : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2475
      swap_bytes : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2476
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2468

  --*
  -- * @brief xcb_glx_get_color_table_reply_t
  -- * 

   type xcb_glx_get_color_table_reply_t_array2620 is array (0 .. 7) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_color_table_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_color_table_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2483
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2484
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2485
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2486
      pad1 : aliased xcb_glx_get_color_table_reply_t_array2620;  -- /usr/include/xcb/glx.h:2487
      width : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:2488
      pad2 : aliased xcb_glx_get_color_table_reply_t_array2180;  -- /usr/include/xcb/glx.h:2489
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2482

  --*
  -- * @brief xcb_glx_get_color_table_parameterfv_cookie_t
  -- * 

   type xcb_glx_get_color_table_parameterfv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:2496
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2495

  --* Opcode for xcb_glx_get_color_table_parameterfv.  
  --*
  -- * @brief xcb_glx_get_color_table_parameterfv_request_t
  -- * 

   type xcb_glx_get_color_table_parameterfv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2506
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2507
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2508
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2509
      target : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2510
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2511
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2505

  --*
  -- * @brief xcb_glx_get_color_table_parameterfv_reply_t
  -- * 

   type xcb_glx_get_color_table_parameterfv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_color_table_parameterfv_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_color_table_parameterfv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2518
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2519
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2520
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2521
      pad1 : aliased xcb_glx_get_color_table_parameterfv_reply_t_array1791;  -- /usr/include/xcb/glx.h:2522
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2523
      datum : aliased xcb_glx_float32_t;  -- /usr/include/xcb/glx.h:2524
      pad2 : aliased xcb_glx_get_color_table_parameterfv_reply_t_array2180;  -- /usr/include/xcb/glx.h:2525
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2517

  --*
  -- * @brief xcb_glx_get_color_table_parameteriv_cookie_t
  -- * 

   type xcb_glx_get_color_table_parameteriv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:2532
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2531

  --* Opcode for xcb_glx_get_color_table_parameteriv.  
  --*
  -- * @brief xcb_glx_get_color_table_parameteriv_request_t
  -- * 

   type xcb_glx_get_color_table_parameteriv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2542
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2543
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2544
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2545
      target : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2546
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2547
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2541

  --*
  -- * @brief xcb_glx_get_color_table_parameteriv_reply_t
  -- * 

   type xcb_glx_get_color_table_parameteriv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_color_table_parameteriv_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_color_table_parameteriv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2554
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2555
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2556
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2557
      pad1 : aliased xcb_glx_get_color_table_parameteriv_reply_t_array1791;  -- /usr/include/xcb/glx.h:2558
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2559
      datum : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:2560
      pad2 : aliased xcb_glx_get_color_table_parameteriv_reply_t_array2180;  -- /usr/include/xcb/glx.h:2561
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2553

  --*
  -- * @brief xcb_glx_get_convolution_filter_cookie_t
  -- * 

   type xcb_glx_get_convolution_filter_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:2568
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2567

  --* Opcode for xcb_glx_get_convolution_filter.  
  --*
  -- * @brief xcb_glx_get_convolution_filter_request_t
  -- * 

   type xcb_glx_get_convolution_filter_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2578
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2579
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2580
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2581
      target : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2582
      format : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2583
      c_type : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2584
      swap_bytes : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2585
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2577

  --*
  -- * @brief xcb_glx_get_convolution_filter_reply_t
  -- * 

   type xcb_glx_get_convolution_filter_reply_t_array2620 is array (0 .. 7) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_convolution_filter_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2592
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2593
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2594
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2595
      pad1 : aliased xcb_glx_get_convolution_filter_reply_t_array2620;  -- /usr/include/xcb/glx.h:2596
      width : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:2597
      height : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:2598
      pad2 : aliased xcb_glx_get_convolution_filter_reply_t_array2620;  -- /usr/include/xcb/glx.h:2599
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2591

  --*
  -- * @brief xcb_glx_get_convolution_parameterfv_cookie_t
  -- * 

   type xcb_glx_get_convolution_parameterfv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:2606
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2605

  --* Opcode for xcb_glx_get_convolution_parameterfv.  
  --*
  -- * @brief xcb_glx_get_convolution_parameterfv_request_t
  -- * 

   type xcb_glx_get_convolution_parameterfv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2616
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2617
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2618
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2619
      target : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2620
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2621
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2615

  --*
  -- * @brief xcb_glx_get_convolution_parameterfv_reply_t
  -- * 

   type xcb_glx_get_convolution_parameterfv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_convolution_parameterfv_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_convolution_parameterfv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2628
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2629
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2630
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2631
      pad1 : aliased xcb_glx_get_convolution_parameterfv_reply_t_array1791;  -- /usr/include/xcb/glx.h:2632
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2633
      datum : aliased xcb_glx_float32_t;  -- /usr/include/xcb/glx.h:2634
      pad2 : aliased xcb_glx_get_convolution_parameterfv_reply_t_array2180;  -- /usr/include/xcb/glx.h:2635
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2627

  --*
  -- * @brief xcb_glx_get_convolution_parameteriv_cookie_t
  -- * 

   type xcb_glx_get_convolution_parameteriv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:2642
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2641

  --* Opcode for xcb_glx_get_convolution_parameteriv.  
  --*
  -- * @brief xcb_glx_get_convolution_parameteriv_request_t
  -- * 

   type xcb_glx_get_convolution_parameteriv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2652
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2653
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2654
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2655
      target : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2656
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2657
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2651

  --*
  -- * @brief xcb_glx_get_convolution_parameteriv_reply_t
  -- * 

   type xcb_glx_get_convolution_parameteriv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_convolution_parameteriv_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_convolution_parameteriv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2664
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2665
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2666
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2667
      pad1 : aliased xcb_glx_get_convolution_parameteriv_reply_t_array1791;  -- /usr/include/xcb/glx.h:2668
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2669
      datum : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:2670
      pad2 : aliased xcb_glx_get_convolution_parameteriv_reply_t_array2180;  -- /usr/include/xcb/glx.h:2671
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2663

  --*
  -- * @brief xcb_glx_get_separable_filter_cookie_t
  -- * 

   type xcb_glx_get_separable_filter_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:2678
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2677

  --* Opcode for xcb_glx_get_separable_filter.  
  --*
  -- * @brief xcb_glx_get_separable_filter_request_t
  -- * 

   type xcb_glx_get_separable_filter_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2688
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2689
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2690
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2691
      target : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2692
      format : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2693
      c_type : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2694
      swap_bytes : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2695
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2687

  --*
  -- * @brief xcb_glx_get_separable_filter_reply_t
  -- * 

   type xcb_glx_get_separable_filter_reply_t_array2620 is array (0 .. 7) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_separable_filter_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2702
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2703
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2704
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2705
      pad1 : aliased xcb_glx_get_separable_filter_reply_t_array2620;  -- /usr/include/xcb/glx.h:2706
      row_w : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:2707
      col_h : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:2708
      pad2 : aliased xcb_glx_get_separable_filter_reply_t_array2620;  -- /usr/include/xcb/glx.h:2709
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2701

  --*
  -- * @brief xcb_glx_get_histogram_cookie_t
  -- * 

   type xcb_glx_get_histogram_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:2716
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2715

  --* Opcode for xcb_glx_get_histogram.  
  --*
  -- * @brief xcb_glx_get_histogram_request_t
  -- * 

   type xcb_glx_get_histogram_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2726
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2727
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2728
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2729
      target : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2730
      format : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2731
      c_type : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2732
      swap_bytes : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2733
      reset : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2734
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2725

  --*
  -- * @brief xcb_glx_get_histogram_reply_t
  -- * 

   type xcb_glx_get_histogram_reply_t_array2620 is array (0 .. 7) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_histogram_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_histogram_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2741
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2742
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2743
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2744
      pad1 : aliased xcb_glx_get_histogram_reply_t_array2620;  -- /usr/include/xcb/glx.h:2745
      width : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:2746
      pad2 : aliased xcb_glx_get_histogram_reply_t_array2180;  -- /usr/include/xcb/glx.h:2747
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2740

  --*
  -- * @brief xcb_glx_get_histogram_parameterfv_cookie_t
  -- * 

   type xcb_glx_get_histogram_parameterfv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:2754
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2753

  --* Opcode for xcb_glx_get_histogram_parameterfv.  
  --*
  -- * @brief xcb_glx_get_histogram_parameterfv_request_t
  -- * 

   type xcb_glx_get_histogram_parameterfv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2764
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2765
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2766
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2767
      target : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2768
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2769
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2763

  --*
  -- * @brief xcb_glx_get_histogram_parameterfv_reply_t
  -- * 

   type xcb_glx_get_histogram_parameterfv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_histogram_parameterfv_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_histogram_parameterfv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2776
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2777
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2778
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2779
      pad1 : aliased xcb_glx_get_histogram_parameterfv_reply_t_array1791;  -- /usr/include/xcb/glx.h:2780
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2781
      datum : aliased xcb_glx_float32_t;  -- /usr/include/xcb/glx.h:2782
      pad2 : aliased xcb_glx_get_histogram_parameterfv_reply_t_array2180;  -- /usr/include/xcb/glx.h:2783
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2775

  --*
  -- * @brief xcb_glx_get_histogram_parameteriv_cookie_t
  -- * 

   type xcb_glx_get_histogram_parameteriv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:2790
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2789

  --* Opcode for xcb_glx_get_histogram_parameteriv.  
  --*
  -- * @brief xcb_glx_get_histogram_parameteriv_request_t
  -- * 

   type xcb_glx_get_histogram_parameteriv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2800
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2801
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2802
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2803
      target : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2804
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2805
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2799

  --*
  -- * @brief xcb_glx_get_histogram_parameteriv_reply_t
  -- * 

   type xcb_glx_get_histogram_parameteriv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_histogram_parameteriv_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_histogram_parameteriv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2812
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2813
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2814
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2815
      pad1 : aliased xcb_glx_get_histogram_parameteriv_reply_t_array1791;  -- /usr/include/xcb/glx.h:2816
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2817
      datum : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:2818
      pad2 : aliased xcb_glx_get_histogram_parameteriv_reply_t_array2180;  -- /usr/include/xcb/glx.h:2819
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2811

  --*
  -- * @brief xcb_glx_get_minmax_cookie_t
  -- * 

   type xcb_glx_get_minmax_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:2826
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2825

  --* Opcode for xcb_glx_get_minmax.  
  --*
  -- * @brief xcb_glx_get_minmax_request_t
  -- * 

   type xcb_glx_get_minmax_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2836
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2837
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2838
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2839
      target : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2840
      format : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2841
      c_type : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2842
      swap_bytes : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2843
      reset : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2844
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2835

  --*
  -- * @brief xcb_glx_get_minmax_reply_t
  -- * 

   type xcb_glx_get_minmax_reply_t_array2717 is array (0 .. 23) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_minmax_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2851
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2852
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2853
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2854
      pad1 : aliased xcb_glx_get_minmax_reply_t_array2717;  -- /usr/include/xcb/glx.h:2855
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2850

  --*
  -- * @brief xcb_glx_get_minmax_parameterfv_cookie_t
  -- * 

   type xcb_glx_get_minmax_parameterfv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:2862
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2861

  --* Opcode for xcb_glx_get_minmax_parameterfv.  
  --*
  -- * @brief xcb_glx_get_minmax_parameterfv_request_t
  -- * 

   type xcb_glx_get_minmax_parameterfv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2872
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2873
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2874
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2875
      target : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2876
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2877
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2871

  --*
  -- * @brief xcb_glx_get_minmax_parameterfv_reply_t
  -- * 

   type xcb_glx_get_minmax_parameterfv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_minmax_parameterfv_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_minmax_parameterfv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2884
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2885
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2886
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2887
      pad1 : aliased xcb_glx_get_minmax_parameterfv_reply_t_array1791;  -- /usr/include/xcb/glx.h:2888
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2889
      datum : aliased xcb_glx_float32_t;  -- /usr/include/xcb/glx.h:2890
      pad2 : aliased xcb_glx_get_minmax_parameterfv_reply_t_array2180;  -- /usr/include/xcb/glx.h:2891
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2883

  --*
  -- * @brief xcb_glx_get_minmax_parameteriv_cookie_t
  -- * 

   type xcb_glx_get_minmax_parameteriv_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:2898
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2897

  --* Opcode for xcb_glx_get_minmax_parameteriv.  
  --*
  -- * @brief xcb_glx_get_minmax_parameteriv_request_t
  -- * 

   type xcb_glx_get_minmax_parameteriv_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2908
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2909
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2910
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2911
      target : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2912
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2913
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2907

  --*
  -- * @brief xcb_glx_get_minmax_parameteriv_reply_t
  -- * 

   type xcb_glx_get_minmax_parameteriv_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_minmax_parameteriv_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_minmax_parameteriv_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2920
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2921
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2922
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2923
      pad1 : aliased xcb_glx_get_minmax_parameteriv_reply_t_array1791;  -- /usr/include/xcb/glx.h:2924
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2925
      datum : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:2926
      pad2 : aliased xcb_glx_get_minmax_parameteriv_reply_t_array2180;  -- /usr/include/xcb/glx.h:2927
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2919

  --*
  -- * @brief xcb_glx_get_compressed_tex_image_arb_cookie_t
  -- * 

   type xcb_glx_get_compressed_tex_image_arb_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:2934
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2933

  --* Opcode for xcb_glx_get_compressed_tex_image_arb.  
  --*
  -- * @brief xcb_glx_get_compressed_tex_image_arb_request_t
  -- * 

   type xcb_glx_get_compressed_tex_image_arb_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2944
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2945
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2946
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2947
      target : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2948
      level : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:2949
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2943

  --*
  -- * @brief xcb_glx_get_compressed_tex_image_arb_reply_t
  -- * 

   type xcb_glx_get_compressed_tex_image_arb_reply_t_array2620 is array (0 .. 7) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_compressed_tex_image_arb_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_compressed_tex_image_arb_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2956
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2957
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2958
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:2959
      pad1 : aliased xcb_glx_get_compressed_tex_image_arb_reply_t_array2620;  -- /usr/include/xcb/glx.h:2960
      size : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:2961
      pad2 : aliased xcb_glx_get_compressed_tex_image_arb_reply_t_array2180;  -- /usr/include/xcb/glx.h:2962
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2955

  --* Opcode for xcb_glx_delete_queries_arb.  
  --*
  -- * @brief xcb_glx_delete_queries_arb_request_t
  -- * 

   type xcb_glx_delete_queries_arb_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2972
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2973
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2974
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2975
      n : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:2976
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2971

  --*
  -- * @brief xcb_glx_gen_queries_arb_cookie_t
  -- * 

   type xcb_glx_gen_queries_arb_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:2983
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2982

  --* Opcode for xcb_glx_gen_queries_arb.  
  --*
  -- * @brief xcb_glx_gen_queries_arb_request_t
  -- * 

   type xcb_glx_gen_queries_arb_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2993
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:2994
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:2995
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:2996
      n : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:2997
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:2992

  --*
  -- * @brief xcb_glx_gen_queries_arb_reply_t
  -- * 

   type xcb_glx_gen_queries_arb_reply_t_array2717 is array (0 .. 23) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_gen_queries_arb_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:3004
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:3005
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:3006
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:3007
      pad1 : aliased xcb_glx_gen_queries_arb_reply_t_array2717;  -- /usr/include/xcb/glx.h:3008
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:3003

  --*
  -- * @brief xcb_glx_is_query_arb_cookie_t
  -- * 

   type xcb_glx_is_query_arb_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:3015
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:3014

  --* Opcode for xcb_glx_is_query_arb.  
  --*
  -- * @brief xcb_glx_is_query_arb_request_t
  -- * 

   type xcb_glx_is_query_arb_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:3025
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:3026
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:3027
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:3028
      id : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:3029
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:3024

  --*
  -- * @brief xcb_glx_is_query_arb_reply_t
  -- * 

   type xcb_glx_is_query_arb_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:3036
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:3037
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:3038
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:3039
      ret_val : aliased xcb_glx_bool32_t;  -- /usr/include/xcb/glx.h:3040
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:3035

  --*
  -- * @brief xcb_glx_get_queryiv_arb_cookie_t
  -- * 

   type xcb_glx_get_queryiv_arb_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:3047
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:3046

  --* Opcode for xcb_glx_get_queryiv_arb.  
  --*
  -- * @brief xcb_glx_get_queryiv_arb_request_t
  -- * 

   type xcb_glx_get_queryiv_arb_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:3057
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:3058
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:3059
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:3060
      target : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:3061
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:3062
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:3056

  --*
  -- * @brief xcb_glx_get_queryiv_arb_reply_t
  -- * 

   type xcb_glx_get_queryiv_arb_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_queryiv_arb_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_queryiv_arb_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:3069
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:3070
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:3071
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:3072
      pad1 : aliased xcb_glx_get_queryiv_arb_reply_t_array1791;  -- /usr/include/xcb/glx.h:3073
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:3074
      datum : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:3075
      pad2 : aliased xcb_glx_get_queryiv_arb_reply_t_array2180;  -- /usr/include/xcb/glx.h:3076
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:3068

  --*
  -- * @brief xcb_glx_get_query_objectiv_arb_cookie_t
  -- * 

   type xcb_glx_get_query_objectiv_arb_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:3083
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:3082

  --* Opcode for xcb_glx_get_query_objectiv_arb.  
  --*
  -- * @brief xcb_glx_get_query_objectiv_arb_request_t
  -- * 

   type xcb_glx_get_query_objectiv_arb_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:3093
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:3094
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:3095
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:3096
      id : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:3097
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:3098
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:3092

  --*
  -- * @brief xcb_glx_get_query_objectiv_arb_reply_t
  -- * 

   type xcb_glx_get_query_objectiv_arb_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_query_objectiv_arb_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_query_objectiv_arb_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:3105
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:3106
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:3107
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:3108
      pad1 : aliased xcb_glx_get_query_objectiv_arb_reply_t_array1791;  -- /usr/include/xcb/glx.h:3109
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:3110
      datum : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/glx.h:3111
      pad2 : aliased xcb_glx_get_query_objectiv_arb_reply_t_array2180;  -- /usr/include/xcb/glx.h:3112
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:3104

  --*
  -- * @brief xcb_glx_get_query_objectuiv_arb_cookie_t
  -- * 

   type xcb_glx_get_query_objectuiv_arb_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/glx.h:3119
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:3118

  --* Opcode for xcb_glx_get_query_objectuiv_arb.  
  --*
  -- * @brief xcb_glx_get_query_objectuiv_arb_request_t
  -- * 

   type xcb_glx_get_query_objectuiv_arb_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:3129
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:3130
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:3131
      context_tag : aliased xcb_glx_context_tag_t;  -- /usr/include/xcb/glx.h:3132
      id : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:3133
      pname : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:3134
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:3128

  --*
  -- * @brief xcb_glx_get_query_objectuiv_arb_reply_t
  -- * 

   type xcb_glx_get_query_objectuiv_arb_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_query_objectuiv_arb_reply_t_array2180 is array (0 .. 11) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_glx_get_query_objectuiv_arb_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:3141
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/glx.h:3142
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/glx.h:3143
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:3144
      pad1 : aliased xcb_glx_get_query_objectuiv_arb_reply_t_array1791;  -- /usr/include/xcb/glx.h:3145
      n : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:3146
      datum : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/glx.h:3147
      pad2 : aliased xcb_glx_get_query_objectuiv_arb_reply_t_array2180;  -- /usr/include/xcb/glx.h:3148
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/glx.h:3140

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_glx_pixmap_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_glx_pixmap_t)
  --  

   procedure xcb_glx_pixmap_next (i : access xcb_glx_pixmap_iterator_t)  -- /usr/include/xcb/glx.h:3160
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_pixmap_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_glx_pixmap_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_glx_pixmap_end (i : xcb_glx_pixmap_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:3172
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_pixmap_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_glx_context_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_glx_context_t)
  --  

   procedure xcb_glx_context_next (i : access xcb_glx_context_iterator_t)  -- /usr/include/xcb/glx.h:3183
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_context_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_glx_context_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_glx_context_end (i : xcb_glx_context_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:3195
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_context_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_glx_pbuffer_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_glx_pbuffer_t)
  --  

   procedure xcb_glx_pbuffer_next (i : access xcb_glx_pbuffer_iterator_t)  -- /usr/include/xcb/glx.h:3206
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_pbuffer_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_glx_pbuffer_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_glx_pbuffer_end (i : xcb_glx_pbuffer_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:3218
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_pbuffer_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_glx_window_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_glx_window_t)
  --  

   procedure xcb_glx_window_next (i : access xcb_glx_window_iterator_t)  -- /usr/include/xcb/glx.h:3229
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_window_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_glx_window_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_glx_window_end (i : xcb_glx_window_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:3241
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_window_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_glx_fbconfig_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_glx_fbconfig_t)
  --  

   procedure xcb_glx_fbconfig_next (i : access xcb_glx_fbconfig_iterator_t)  -- /usr/include/xcb/glx.h:3252
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_fbconfig_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_glx_fbconfig_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_glx_fbconfig_end (i : xcb_glx_fbconfig_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:3264
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_fbconfig_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_glx_drawable_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_glx_drawable_t)
  --  

   procedure xcb_glx_drawable_next (i : access xcb_glx_drawable_iterator_t)  -- /usr/include/xcb/glx.h:3275
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_drawable_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_glx_drawable_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_glx_drawable_end (i : xcb_glx_drawable_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:3287
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_drawable_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_glx_float32_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_glx_float32_t)
  --  

   procedure xcb_glx_float32_next (i : access xcb_glx_float32_iterator_t)  -- /usr/include/xcb/glx.h:3298
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_float32_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_glx_float32_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_glx_float32_end (i : xcb_glx_float32_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:3310
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_float32_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_glx_float64_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_glx_float64_t)
  --  

   procedure xcb_glx_float64_next (i : access xcb_glx_float64_iterator_t)  -- /usr/include/xcb/glx.h:3321
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_float64_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_glx_float64_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_glx_float64_end (i : xcb_glx_float64_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:3333
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_float64_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_glx_bool32_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_glx_bool32_t)
  --  

   procedure xcb_glx_bool32_next (i : access xcb_glx_bool32_iterator_t)  -- /usr/include/xcb/glx.h:3344
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_bool32_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_glx_bool32_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_glx_bool32_end (i : xcb_glx_bool32_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:3356
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_bool32_end";

  --*
  -- * Get the next element of the iterator
  -- * @param i Pointer to a xcb_glx_context_tag_iterator_t
  -- *
  -- * Get the next element in the iterator. The member rem is
  -- * decreased by one. The member data points to the next
  -- * element. The member index is increased by sizeof(xcb_glx_context_tag_t)
  --  

   procedure xcb_glx_context_tag_next (i : access xcb_glx_context_tag_iterator_t)  -- /usr/include/xcb/glx.h:3367
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_context_tag_next";

  --*
  -- * Return the iterator pointing to the last element
  -- * @param i An xcb_glx_context_tag_iterator_t
  -- * @return  The iterator pointing to the last element
  -- *
  -- * Set the current element in the iterator to the last element.
  -- * The member rem is set to 0. The member data points to the
  -- * last element.
  --  

   function xcb_glx_context_tag_end (i : xcb_glx_context_tag_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:3379
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_context_tag_end";

   function xcb_glx_render_sizeof (u_buffer : System.Address; data_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/glx.h:3382
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_render_sizeof";

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

   function xcb_glx_render_checked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      data_len : bits_stdint_uintn_h.uint32_t;
      data : access bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:3397
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_render_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_render
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      data_len : bits_stdint_uintn_h.uint32_t;
      data : access bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:3411
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_render";

   function xcb_glx_render_data (R : access constant xcb_glx_render_request_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/glx.h:3417
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_render_data";

   function xcb_glx_render_data_length (R : access constant xcb_glx_render_request_t) return int  -- /usr/include/xcb/glx.h:3420
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_render_data_length";

   function xcb_glx_render_data_end (R : access constant xcb_glx_render_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:3423
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_render_data_end";

   function xcb_glx_render_large_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:3426
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_render_large_sizeof";

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

   function xcb_glx_render_large_checked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      request_num : bits_stdint_uintn_h.uint16_t;
      request_total : bits_stdint_uintn_h.uint16_t;
      data_len : bits_stdint_uintn_h.uint32_t;
      data : access bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:3440
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_render_large_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_render_large
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      request_num : bits_stdint_uintn_h.uint16_t;
      request_total : bits_stdint_uintn_h.uint16_t;
      data_len : bits_stdint_uintn_h.uint32_t;
      data : access bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:3456
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_render_large";

   function xcb_glx_render_large_data (R : access constant xcb_glx_render_large_request_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/glx.h:3464
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_render_large_data";

   function xcb_glx_render_large_data_length (R : access constant xcb_glx_render_large_request_t) return int  -- /usr/include/xcb/glx.h:3467
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_render_large_data_length";

   function xcb_glx_render_large_data_end (R : access constant xcb_glx_render_large_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:3470
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_render_large_data_end";

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

   function xcb_glx_create_context_checked
     (c : access xcb.xcb_connection_t;
      context : xcb_glx_context_t;
      visual : xproto.xcb_visualid_t;
      screen : bits_stdint_uintn_h.uint32_t;
      share_list : xcb_glx_context_t;
      is_direct : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:3484
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_context_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_create_context
     (c : access xcb.xcb_connection_t;
      context : xcb_glx_context_t;
      visual : xproto.xcb_visualid_t;
      screen : bits_stdint_uintn_h.uint32_t;
      share_list : xcb_glx_context_t;
      is_direct : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:3500
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_context";

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

   function xcb_glx_destroy_context_checked (c : access xcb.xcb_connection_t; context : xcb_glx_context_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:3519
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_destroy_context_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_destroy_context (c : access xcb.xcb_connection_t; context : xcb_glx_context_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:3531
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_destroy_context";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_make_current
     (c : access xcb.xcb_connection_t;
      drawable : xcb_glx_drawable_t;
      context : xcb_glx_context_t;
      old_context_tag : xcb_glx_context_tag_t) return xcb_glx_make_current_cookie_t  -- /usr/include/xcb/glx.h:3543
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_make_current";

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

   function xcb_glx_make_current_unchecked
     (c : access xcb.xcb_connection_t;
      drawable : xcb_glx_drawable_t;
      context : xcb_glx_context_t;
      old_context_tag : xcb_glx_context_tag_t) return xcb_glx_make_current_cookie_t  -- /usr/include/xcb/glx.h:3560
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_make_current_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_make_current_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_make_current_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_make_current_cookie_t;
      e : System.Address) return access xcb_glx_make_current_reply_t  -- /usr/include/xcb/glx.h:3580
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_make_current_reply";

  --*<  
  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_is_direct (c : access xcb.xcb_connection_t; context : xcb_glx_context_t) return xcb_glx_is_direct_cookie_t  -- /usr/include/xcb/glx.h:3593
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_is_direct";

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

   function xcb_glx_is_direct_unchecked (c : access xcb.xcb_connection_t; context : xcb_glx_context_t) return xcb_glx_is_direct_cookie_t  -- /usr/include/xcb/glx.h:3608
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_is_direct_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_is_direct_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_is_direct_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_is_direct_cookie_t;
      e : System.Address) return access xcb_glx_is_direct_reply_t  -- /usr/include/xcb/glx.h:3626
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_is_direct_reply";

  --*<  
  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_query_version
     (c : access xcb.xcb_connection_t;
      major_version : bits_stdint_uintn_h.uint32_t;
      minor_version : bits_stdint_uintn_h.uint32_t) return xcb_glx_query_version_cookie_t  -- /usr/include/xcb/glx.h:3639
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_query_version";

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

   function xcb_glx_query_version_unchecked
     (c : access xcb.xcb_connection_t;
      major_version : bits_stdint_uintn_h.uint32_t;
      minor_version : bits_stdint_uintn_h.uint32_t) return xcb_glx_query_version_cookie_t  -- /usr/include/xcb/glx.h:3655
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_query_version_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_query_version_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_query_version_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_query_version_cookie_t;
      e : System.Address) return access xcb_glx_query_version_reply_t  -- /usr/include/xcb/glx.h:3674
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_query_version_reply";

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

   function xcb_glx_wait_gl_checked (c : access xcb.xcb_connection_t; context_tag : xcb_glx_context_tag_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:3690
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_wait_gl_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_wait_gl (c : access xcb.xcb_connection_t; context_tag : xcb_glx_context_tag_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:3702
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_wait_gl";

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

   function xcb_glx_wait_x_checked (c : access xcb.xcb_connection_t; context_tag : xcb_glx_context_tag_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:3717
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_wait_x_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_wait_x (c : access xcb.xcb_connection_t; context_tag : xcb_glx_context_tag_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:3729
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_wait_x";

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

   function xcb_glx_copy_context_checked
     (c : access xcb.xcb_connection_t;
      src : xcb_glx_context_t;
      dest : xcb_glx_context_t;
      mask : bits_stdint_uintn_h.uint32_t;
      src_context_tag : xcb_glx_context_tag_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:3744
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_copy_context_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_copy_context
     (c : access xcb.xcb_connection_t;
      src : xcb_glx_context_t;
      dest : xcb_glx_context_t;
      mask : bits_stdint_uintn_h.uint32_t;
      src_context_tag : xcb_glx_context_tag_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:3759
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_copy_context";

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

   function xcb_glx_swap_buffers_checked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      drawable : xcb_glx_drawable_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:3777
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_swap_buffers_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_swap_buffers
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      drawable : xcb_glx_drawable_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:3790
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_swap_buffers";

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

   function xcb_glx_use_x_font_checked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      font : xproto.xcb_font_t;
      first : bits_stdint_uintn_h.uint32_t;
      count : bits_stdint_uintn_h.uint32_t;
      list_base : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:3806
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_use_x_font_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_use_x_font
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      font : xproto.xcb_font_t;
      first : bits_stdint_uintn_h.uint32_t;
      count : bits_stdint_uintn_h.uint32_t;
      list_base : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:3822
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_use_x_font";

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

   function xcb_glx_create_glx_pixmap_checked
     (c : access xcb.xcb_connection_t;
      screen : bits_stdint_uintn_h.uint32_t;
      visual : xproto.xcb_visualid_t;
      pixmap : xproto.xcb_pixmap_t;
      glx_pixmap : xcb_glx_pixmap_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:3841
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_glx_pixmap_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_create_glx_pixmap
     (c : access xcb.xcb_connection_t;
      screen : bits_stdint_uintn_h.uint32_t;
      visual : xproto.xcb_visualid_t;
      pixmap : xproto.xcb_pixmap_t;
      glx_pixmap : xcb_glx_pixmap_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:3856
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_glx_pixmap";

   function xcb_glx_get_visual_configs_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:3863
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_visual_configs_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_visual_configs (c : access xcb.xcb_connection_t; screen : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_visual_configs_cookie_t  -- /usr/include/xcb/glx.h:3874
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_visual_configs";

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

   function xcb_glx_get_visual_configs_unchecked (c : access xcb.xcb_connection_t; screen : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_visual_configs_cookie_t  -- /usr/include/xcb/glx.h:3889
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_visual_configs_unchecked";

   function xcb_glx_get_visual_configs_property_list (R : access constant xcb_glx_get_visual_configs_reply_t) return access bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/glx.h:3893
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_visual_configs_property_list";

   function xcb_glx_get_visual_configs_property_list_length (R : access constant xcb_glx_get_visual_configs_reply_t) return int  -- /usr/include/xcb/glx.h:3896
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_visual_configs_property_list_length";

   function xcb_glx_get_visual_configs_property_list_end (R : access constant xcb_glx_get_visual_configs_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:3899
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_visual_configs_property_list_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_visual_configs_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_visual_configs_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_visual_configs_cookie_t;
      e : System.Address) return access xcb_glx_get_visual_configs_reply_t  -- /usr/include/xcb/glx.h:3916
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_visual_configs_reply";

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

   function xcb_glx_destroy_glx_pixmap_checked (c : access xcb.xcb_connection_t; glx_pixmap : xcb_glx_pixmap_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:3932
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_destroy_glx_pixmap_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_destroy_glx_pixmap (c : access xcb.xcb_connection_t; glx_pixmap : xcb_glx_pixmap_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:3944
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_destroy_glx_pixmap";

   function xcb_glx_vendor_private_sizeof (u_buffer : System.Address; data_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/glx.h:3948
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_vendor_private_sizeof";

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

   function xcb_glx_vendor_private_checked
     (c : access xcb.xcb_connection_t;
      vendor_code : bits_stdint_uintn_h.uint32_t;
      context_tag : xcb_glx_context_tag_t;
      data_len : bits_stdint_uintn_h.uint32_t;
      data : access bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:3963
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_vendor_private_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_vendor_private
     (c : access xcb.xcb_connection_t;
      vendor_code : bits_stdint_uintn_h.uint32_t;
      context_tag : xcb_glx_context_tag_t;
      data_len : bits_stdint_uintn_h.uint32_t;
      data : access bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:3978
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_vendor_private";

   function xcb_glx_vendor_private_data (R : access constant xcb_glx_vendor_private_request_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/glx.h:3985
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_vendor_private_data";

   function xcb_glx_vendor_private_data_length (R : access constant xcb_glx_vendor_private_request_t) return int  -- /usr/include/xcb/glx.h:3988
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_vendor_private_data_length";

   function xcb_glx_vendor_private_data_end (R : access constant xcb_glx_vendor_private_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:3991
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_vendor_private_data_end";

   function xcb_glx_vendor_private_with_reply_sizeof (u_buffer : System.Address; data_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/glx.h:3994
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_vendor_private_with_reply_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_vendor_private_with_reply
     (c : access xcb.xcb_connection_t;
      vendor_code : bits_stdint_uintn_h.uint32_t;
      context_tag : xcb_glx_context_tag_t;
      data_len : bits_stdint_uintn_h.uint32_t;
      data : access bits_stdint_uintn_h.uint8_t) return xcb_glx_vendor_private_with_reply_cookie_t  -- /usr/include/xcb/glx.h:4006
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_vendor_private_with_reply";

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

   function xcb_glx_vendor_private_with_reply_unchecked
     (c : access xcb.xcb_connection_t;
      vendor_code : bits_stdint_uintn_h.uint32_t;
      context_tag : xcb_glx_context_tag_t;
      data_len : bits_stdint_uintn_h.uint32_t;
      data : access bits_stdint_uintn_h.uint8_t) return xcb_glx_vendor_private_with_reply_cookie_t  -- /usr/include/xcb/glx.h:4024
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_vendor_private_with_reply_unchecked";

   function xcb_glx_vendor_private_with_reply_data_2 (R : access constant xcb_glx_vendor_private_with_reply_reply_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/glx.h:4031
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_vendor_private_with_reply_data_2";

   function xcb_glx_vendor_private_with_reply_data_2_length (R : access constant xcb_glx_vendor_private_with_reply_reply_t) return int  -- /usr/include/xcb/glx.h:4034
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_vendor_private_with_reply_data_2_length";

   function xcb_glx_vendor_private_with_reply_data_2_end (R : access constant xcb_glx_vendor_private_with_reply_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:4037
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_vendor_private_with_reply_data_2_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_vendor_private_with_reply_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_vendor_private_with_reply_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_vendor_private_with_reply_cookie_t;
      e : System.Address) return access xcb_glx_vendor_private_with_reply_reply_t  -- /usr/include/xcb/glx.h:4054
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_vendor_private_with_reply_reply";

  --*<  
  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_query_extensions_string (c : access xcb.xcb_connection_t; screen : bits_stdint_uintn_h.uint32_t) return xcb_glx_query_extensions_string_cookie_t  -- /usr/include/xcb/glx.h:4067
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_query_extensions_string";

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

   function xcb_glx_query_extensions_string_unchecked (c : access xcb.xcb_connection_t; screen : bits_stdint_uintn_h.uint32_t) return xcb_glx_query_extensions_string_cookie_t  -- /usr/include/xcb/glx.h:4082
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_query_extensions_string_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_query_extensions_string_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_query_extensions_string_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_query_extensions_string_cookie_t;
      e : System.Address) return access xcb_glx_query_extensions_string_reply_t  -- /usr/include/xcb/glx.h:4100
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_query_extensions_string_reply";

  --*<  
   function xcb_glx_query_server_string_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:4105
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_query_server_string_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_query_server_string
     (c : access xcb.xcb_connection_t;
      screen : bits_stdint_uintn_h.uint32_t;
      name : bits_stdint_uintn_h.uint32_t) return xcb_glx_query_server_string_cookie_t  -- /usr/include/xcb/glx.h:4116
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_query_server_string";

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

   function xcb_glx_query_server_string_unchecked
     (c : access xcb.xcb_connection_t;
      screen : bits_stdint_uintn_h.uint32_t;
      name : bits_stdint_uintn_h.uint32_t) return xcb_glx_query_server_string_cookie_t  -- /usr/include/xcb/glx.h:4132
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_query_server_string_unchecked";

   function xcb_glx_query_server_string_string (R : access constant xcb_glx_query_server_string_reply_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/glx.h:4137
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_query_server_string_string";

   function xcb_glx_query_server_string_string_length (R : access constant xcb_glx_query_server_string_reply_t) return int  -- /usr/include/xcb/glx.h:4140
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_query_server_string_string_length";

   function xcb_glx_query_server_string_string_end (R : access constant xcb_glx_query_server_string_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:4143
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_query_server_string_string_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_query_server_string_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_query_server_string_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_query_server_string_cookie_t;
      e : System.Address) return access xcb_glx_query_server_string_reply_t  -- /usr/include/xcb/glx.h:4160
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_query_server_string_reply";

  --*<  
   function xcb_glx_client_info_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:4165
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_client_info_sizeof";

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

   function xcb_glx_client_info_checked
     (c : access xcb.xcb_connection_t;
      major_version : bits_stdint_uintn_h.uint32_t;
      minor_version : bits_stdint_uintn_h.uint32_t;
      str_len : bits_stdint_uintn_h.uint32_t;
      string : Interfaces.C.Strings.chars_ptr) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:4179
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_client_info_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_client_info
     (c : access xcb.xcb_connection_t;
      major_version : bits_stdint_uintn_h.uint32_t;
      minor_version : bits_stdint_uintn_h.uint32_t;
      str_len : bits_stdint_uintn_h.uint32_t;
      string : Interfaces.C.Strings.chars_ptr) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:4194
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_client_info";

   function xcb_glx_client_info_string (R : access constant xcb_glx_client_info_request_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/glx.h:4201
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_client_info_string";

   function xcb_glx_client_info_string_length (R : access constant xcb_glx_client_info_request_t) return int  -- /usr/include/xcb/glx.h:4204
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_client_info_string_length";

   function xcb_glx_client_info_string_end (R : access constant xcb_glx_client_info_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:4207
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_client_info_string_end";

   function xcb_glx_get_fb_configs_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:4210
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_fb_configs_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_fb_configs (c : access xcb.xcb_connection_t; screen : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_fb_configs_cookie_t  -- /usr/include/xcb/glx.h:4221
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_fb_configs";

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

   function xcb_glx_get_fb_configs_unchecked (c : access xcb.xcb_connection_t; screen : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_fb_configs_cookie_t  -- /usr/include/xcb/glx.h:4236
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_fb_configs_unchecked";

   function xcb_glx_get_fb_configs_property_list (R : access constant xcb_glx_get_fb_configs_reply_t) return access bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/glx.h:4240
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_fb_configs_property_list";

   function xcb_glx_get_fb_configs_property_list_length (R : access constant xcb_glx_get_fb_configs_reply_t) return int  -- /usr/include/xcb/glx.h:4243
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_fb_configs_property_list_length";

   function xcb_glx_get_fb_configs_property_list_end (R : access constant xcb_glx_get_fb_configs_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:4246
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_fb_configs_property_list_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_fb_configs_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_fb_configs_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_fb_configs_cookie_t;
      e : System.Address) return access xcb_glx_get_fb_configs_reply_t  -- /usr/include/xcb/glx.h:4263
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_fb_configs_reply";

  --*<  
   function xcb_glx_create_pixmap_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:4268
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_pixmap_sizeof";

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

   function xcb_glx_create_pixmap_checked
     (c : access xcb.xcb_connection_t;
      screen : bits_stdint_uintn_h.uint32_t;
      fbconfig : xcb_glx_fbconfig_t;
      pixmap : xproto.xcb_pixmap_t;
      glx_pixmap : xcb_glx_pixmap_t;
      num_attribs : bits_stdint_uintn_h.uint32_t;
      attribs : access bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:4282
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_pixmap_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_create_pixmap
     (c : access xcb.xcb_connection_t;
      screen : bits_stdint_uintn_h.uint32_t;
      fbconfig : xcb_glx_fbconfig_t;
      pixmap : xproto.xcb_pixmap_t;
      glx_pixmap : xcb_glx_pixmap_t;
      num_attribs : bits_stdint_uintn_h.uint32_t;
      attribs : access bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:4299
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_pixmap";

   function xcb_glx_create_pixmap_attribs (R : access constant xcb_glx_create_pixmap_request_t) return access bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/glx.h:4308
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_pixmap_attribs";

   function xcb_glx_create_pixmap_attribs_length (R : access constant xcb_glx_create_pixmap_request_t) return int  -- /usr/include/xcb/glx.h:4311
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_pixmap_attribs_length";

   function xcb_glx_create_pixmap_attribs_end (R : access constant xcb_glx_create_pixmap_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:4314
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_pixmap_attribs_end";

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

   function xcb_glx_destroy_pixmap_checked (c : access xcb.xcb_connection_t; glx_pixmap : xcb_glx_pixmap_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:4328
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_destroy_pixmap_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_destroy_pixmap (c : access xcb.xcb_connection_t; glx_pixmap : xcb_glx_pixmap_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:4340
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_destroy_pixmap";

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

   function xcb_glx_create_new_context_checked
     (c : access xcb.xcb_connection_t;
      context : xcb_glx_context_t;
      fbconfig : xcb_glx_fbconfig_t;
      screen : bits_stdint_uintn_h.uint32_t;
      render_type : bits_stdint_uintn_h.uint32_t;
      share_list : xcb_glx_context_t;
      is_direct : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:4355
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_new_context_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_create_new_context
     (c : access xcb.xcb_connection_t;
      context : xcb_glx_context_t;
      fbconfig : xcb_glx_fbconfig_t;
      screen : bits_stdint_uintn_h.uint32_t;
      render_type : bits_stdint_uintn_h.uint32_t;
      share_list : xcb_glx_context_t;
      is_direct : bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:4372
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_new_context";

   function xcb_glx_query_context_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:4381
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_query_context_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_query_context (c : access xcb.xcb_connection_t; context : xcb_glx_context_t) return xcb_glx_query_context_cookie_t  -- /usr/include/xcb/glx.h:4392
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_query_context";

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

   function xcb_glx_query_context_unchecked (c : access xcb.xcb_connection_t; context : xcb_glx_context_t) return xcb_glx_query_context_cookie_t  -- /usr/include/xcb/glx.h:4407
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_query_context_unchecked";

   function xcb_glx_query_context_attribs (R : access constant xcb_glx_query_context_reply_t) return access bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/glx.h:4411
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_query_context_attribs";

   function xcb_glx_query_context_attribs_length (R : access constant xcb_glx_query_context_reply_t) return int  -- /usr/include/xcb/glx.h:4414
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_query_context_attribs_length";

   function xcb_glx_query_context_attribs_end (R : access constant xcb_glx_query_context_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:4417
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_query_context_attribs_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_query_context_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_query_context_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_query_context_cookie_t;
      e : System.Address) return access xcb_glx_query_context_reply_t  -- /usr/include/xcb/glx.h:4434
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_query_context_reply";

  --*<  
  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_make_context_current
     (c : access xcb.xcb_connection_t;
      old_context_tag : xcb_glx_context_tag_t;
      drawable : xcb_glx_drawable_t;
      read_drawable : xcb_glx_drawable_t;
      context : xcb_glx_context_t) return xcb_glx_make_context_current_cookie_t  -- /usr/include/xcb/glx.h:4447
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_make_context_current";

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

   function xcb_glx_make_context_current_unchecked
     (c : access xcb.xcb_connection_t;
      old_context_tag : xcb_glx_context_tag_t;
      drawable : xcb_glx_drawable_t;
      read_drawable : xcb_glx_drawable_t;
      context : xcb_glx_context_t) return xcb_glx_make_context_current_cookie_t  -- /usr/include/xcb/glx.h:4465
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_make_context_current_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_make_context_current_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_make_context_current_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_make_context_current_cookie_t;
      e : System.Address) return access xcb_glx_make_context_current_reply_t  -- /usr/include/xcb/glx.h:4486
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_make_context_current_reply";

  --*<  
   function xcb_glx_create_pbuffer_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:4491
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_pbuffer_sizeof";

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

   function xcb_glx_create_pbuffer_checked
     (c : access xcb.xcb_connection_t;
      screen : bits_stdint_uintn_h.uint32_t;
      fbconfig : xcb_glx_fbconfig_t;
      pbuffer : xcb_glx_pbuffer_t;
      num_attribs : bits_stdint_uintn_h.uint32_t;
      attribs : access bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:4505
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_pbuffer_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_create_pbuffer
     (c : access xcb.xcb_connection_t;
      screen : bits_stdint_uintn_h.uint32_t;
      fbconfig : xcb_glx_fbconfig_t;
      pbuffer : xcb_glx_pbuffer_t;
      num_attribs : bits_stdint_uintn_h.uint32_t;
      attribs : access bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:4521
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_pbuffer";

   function xcb_glx_create_pbuffer_attribs (R : access constant xcb_glx_create_pbuffer_request_t) return access bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/glx.h:4529
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_pbuffer_attribs";

   function xcb_glx_create_pbuffer_attribs_length (R : access constant xcb_glx_create_pbuffer_request_t) return int  -- /usr/include/xcb/glx.h:4532
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_pbuffer_attribs_length";

   function xcb_glx_create_pbuffer_attribs_end (R : access constant xcb_glx_create_pbuffer_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:4535
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_pbuffer_attribs_end";

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

   function xcb_glx_destroy_pbuffer_checked (c : access xcb.xcb_connection_t; pbuffer : xcb_glx_pbuffer_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:4549
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_destroy_pbuffer_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_destroy_pbuffer (c : access xcb.xcb_connection_t; pbuffer : xcb_glx_pbuffer_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:4561
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_destroy_pbuffer";

   function xcb_glx_get_drawable_attributes_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:4565
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_drawable_attributes_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_drawable_attributes (c : access xcb.xcb_connection_t; drawable : xcb_glx_drawable_t) return xcb_glx_get_drawable_attributes_cookie_t  -- /usr/include/xcb/glx.h:4576
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_drawable_attributes";

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

   function xcb_glx_get_drawable_attributes_unchecked (c : access xcb.xcb_connection_t; drawable : xcb_glx_drawable_t) return xcb_glx_get_drawable_attributes_cookie_t  -- /usr/include/xcb/glx.h:4591
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_drawable_attributes_unchecked";

   function xcb_glx_get_drawable_attributes_attribs (R : access constant xcb_glx_get_drawable_attributes_reply_t) return access bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/glx.h:4595
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_drawable_attributes_attribs";

   function xcb_glx_get_drawable_attributes_attribs_length (R : access constant xcb_glx_get_drawable_attributes_reply_t) return int  -- /usr/include/xcb/glx.h:4598
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_drawable_attributes_attribs_length";

   function xcb_glx_get_drawable_attributes_attribs_end (R : access constant xcb_glx_get_drawable_attributes_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:4601
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_drawable_attributes_attribs_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_drawable_attributes_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_drawable_attributes_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_drawable_attributes_cookie_t;
      e : System.Address) return access xcb_glx_get_drawable_attributes_reply_t  -- /usr/include/xcb/glx.h:4618
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_drawable_attributes_reply";

  --*<  
   function xcb_glx_change_drawable_attributes_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:4623
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_change_drawable_attributes_sizeof";

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

   function xcb_glx_change_drawable_attributes_checked
     (c : access xcb.xcb_connection_t;
      drawable : xcb_glx_drawable_t;
      num_attribs : bits_stdint_uintn_h.uint32_t;
      attribs : access bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:4637
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_change_drawable_attributes_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_change_drawable_attributes
     (c : access xcb.xcb_connection_t;
      drawable : xcb_glx_drawable_t;
      num_attribs : bits_stdint_uintn_h.uint32_t;
      attribs : access bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:4651
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_change_drawable_attributes";

   function xcb_glx_change_drawable_attributes_attribs (R : access constant xcb_glx_change_drawable_attributes_request_t) return access bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/glx.h:4657
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_change_drawable_attributes_attribs";

   function xcb_glx_change_drawable_attributes_attribs_length (R : access constant xcb_glx_change_drawable_attributes_request_t) return int  -- /usr/include/xcb/glx.h:4660
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_change_drawable_attributes_attribs_length";

   function xcb_glx_change_drawable_attributes_attribs_end (R : access constant xcb_glx_change_drawable_attributes_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:4663
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_change_drawable_attributes_attribs_end";

   function xcb_glx_create_window_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:4666
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_window_sizeof";

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

   function xcb_glx_create_window_checked
     (c : access xcb.xcb_connection_t;
      screen : bits_stdint_uintn_h.uint32_t;
      fbconfig : xcb_glx_fbconfig_t;
      window : xproto.xcb_window_t;
      glx_window : xcb_glx_window_t;
      num_attribs : bits_stdint_uintn_h.uint32_t;
      attribs : access bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:4680
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_window_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_create_window
     (c : access xcb.xcb_connection_t;
      screen : bits_stdint_uintn_h.uint32_t;
      fbconfig : xcb_glx_fbconfig_t;
      window : xproto.xcb_window_t;
      glx_window : xcb_glx_window_t;
      num_attribs : bits_stdint_uintn_h.uint32_t;
      attribs : access bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:4697
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_window";

   function xcb_glx_create_window_attribs (R : access constant xcb_glx_create_window_request_t) return access bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/glx.h:4706
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_window_attribs";

   function xcb_glx_create_window_attribs_length (R : access constant xcb_glx_create_window_request_t) return int  -- /usr/include/xcb/glx.h:4709
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_window_attribs_length";

   function xcb_glx_create_window_attribs_end (R : access constant xcb_glx_create_window_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:4712
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_window_attribs_end";

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

   function xcb_glx_delete_window_checked (c : access xcb.xcb_connection_t; glxwindow : xcb_glx_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:4726
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_delete_window_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_delete_window (c : access xcb.xcb_connection_t; glxwindow : xcb_glx_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:4738
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_delete_window";

   function xcb_glx_set_client_info_arb_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:4742
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_set_client_info_arb_sizeof";

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

   function xcb_glx_set_client_info_arb_checked
     (c : access xcb.xcb_connection_t;
      major_version : bits_stdint_uintn_h.uint32_t;
      minor_version : bits_stdint_uintn_h.uint32_t;
      num_versions : bits_stdint_uintn_h.uint32_t;
      gl_str_len : bits_stdint_uintn_h.uint32_t;
      glx_str_len : bits_stdint_uintn_h.uint32_t;
      gl_versions : access bits_stdint_uintn_h.uint32_t;
      gl_extension_string : Interfaces.C.Strings.chars_ptr;
      glx_extension_string : Interfaces.C.Strings.chars_ptr) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:4756
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_set_client_info_arb_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_set_client_info_arb
     (c : access xcb.xcb_connection_t;
      major_version : bits_stdint_uintn_h.uint32_t;
      minor_version : bits_stdint_uintn_h.uint32_t;
      num_versions : bits_stdint_uintn_h.uint32_t;
      gl_str_len : bits_stdint_uintn_h.uint32_t;
      glx_str_len : bits_stdint_uintn_h.uint32_t;
      gl_versions : access bits_stdint_uintn_h.uint32_t;
      gl_extension_string : Interfaces.C.Strings.chars_ptr;
      glx_extension_string : Interfaces.C.Strings.chars_ptr) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:4775
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_set_client_info_arb";

   function xcb_glx_set_client_info_arb_gl_versions (R : access constant xcb_glx_set_client_info_arb_request_t) return access bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/glx.h:4786
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_set_client_info_arb_gl_versions";

   function xcb_glx_set_client_info_arb_gl_versions_length (R : access constant xcb_glx_set_client_info_arb_request_t) return int  -- /usr/include/xcb/glx.h:4789
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_set_client_info_arb_gl_versions_length";

   function xcb_glx_set_client_info_arb_gl_versions_end (R : access constant xcb_glx_set_client_info_arb_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:4792
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_set_client_info_arb_gl_versions_end";

   function xcb_glx_set_client_info_arb_gl_extension_string (R : access constant xcb_glx_set_client_info_arb_request_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/glx.h:4795
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_set_client_info_arb_gl_extension_string";

   function xcb_glx_set_client_info_arb_gl_extension_string_length (R : access constant xcb_glx_set_client_info_arb_request_t) return int  -- /usr/include/xcb/glx.h:4798
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_set_client_info_arb_gl_extension_string_length";

   function xcb_glx_set_client_info_arb_gl_extension_string_end (R : access constant xcb_glx_set_client_info_arb_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:4801
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_set_client_info_arb_gl_extension_string_end";

   function xcb_glx_set_client_info_arb_glx_extension_string (R : access constant xcb_glx_set_client_info_arb_request_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/glx.h:4804
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_set_client_info_arb_glx_extension_string";

   function xcb_glx_set_client_info_arb_glx_extension_string_length (R : access constant xcb_glx_set_client_info_arb_request_t) return int  -- /usr/include/xcb/glx.h:4807
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_set_client_info_arb_glx_extension_string_length";

   function xcb_glx_set_client_info_arb_glx_extension_string_end (R : access constant xcb_glx_set_client_info_arb_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:4810
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_set_client_info_arb_glx_extension_string_end";

   function xcb_glx_create_context_attribs_arb_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:4813
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_context_attribs_arb_sizeof";

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

   function xcb_glx_create_context_attribs_arb_checked
     (c : access xcb.xcb_connection_t;
      context : xcb_glx_context_t;
      fbconfig : xcb_glx_fbconfig_t;
      screen : bits_stdint_uintn_h.uint32_t;
      share_list : xcb_glx_context_t;
      is_direct : bits_stdint_uintn_h.uint8_t;
      num_attribs : bits_stdint_uintn_h.uint32_t;
      attribs : access bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:4827
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_context_attribs_arb_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_create_context_attribs_arb
     (c : access xcb.xcb_connection_t;
      context : xcb_glx_context_t;
      fbconfig : xcb_glx_fbconfig_t;
      screen : bits_stdint_uintn_h.uint32_t;
      share_list : xcb_glx_context_t;
      is_direct : bits_stdint_uintn_h.uint8_t;
      num_attribs : bits_stdint_uintn_h.uint32_t;
      attribs : access bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:4845
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_context_attribs_arb";

   function xcb_glx_create_context_attribs_arb_attribs (R : access constant xcb_glx_create_context_attribs_arb_request_t) return access bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/glx.h:4855
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_context_attribs_arb_attribs";

   function xcb_glx_create_context_attribs_arb_attribs_length (R : access constant xcb_glx_create_context_attribs_arb_request_t) return int  -- /usr/include/xcb/glx.h:4858
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_context_attribs_arb_attribs_length";

   function xcb_glx_create_context_attribs_arb_attribs_end (R : access constant xcb_glx_create_context_attribs_arb_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:4861
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_create_context_attribs_arb_attribs_end";

   function xcb_glx_set_client_info_2arb_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:4864
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_set_client_info_2arb_sizeof";

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

   function xcb_glx_set_client_info_2arb_checked
     (c : access xcb.xcb_connection_t;
      major_version : bits_stdint_uintn_h.uint32_t;
      minor_version : bits_stdint_uintn_h.uint32_t;
      num_versions : bits_stdint_uintn_h.uint32_t;
      gl_str_len : bits_stdint_uintn_h.uint32_t;
      glx_str_len : bits_stdint_uintn_h.uint32_t;
      gl_versions : access bits_stdint_uintn_h.uint32_t;
      gl_extension_string : Interfaces.C.Strings.chars_ptr;
      glx_extension_string : Interfaces.C.Strings.chars_ptr) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:4878
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_set_client_info_2arb_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_set_client_info_2arb
     (c : access xcb.xcb_connection_t;
      major_version : bits_stdint_uintn_h.uint32_t;
      minor_version : bits_stdint_uintn_h.uint32_t;
      num_versions : bits_stdint_uintn_h.uint32_t;
      gl_str_len : bits_stdint_uintn_h.uint32_t;
      glx_str_len : bits_stdint_uintn_h.uint32_t;
      gl_versions : access bits_stdint_uintn_h.uint32_t;
      gl_extension_string : Interfaces.C.Strings.chars_ptr;
      glx_extension_string : Interfaces.C.Strings.chars_ptr) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:4897
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_set_client_info_2arb";

   function xcb_glx_set_client_info_2arb_gl_versions (R : access constant xcb_glx_set_client_info_2arb_request_t) return access bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/glx.h:4908
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_set_client_info_2arb_gl_versions";

   function xcb_glx_set_client_info_2arb_gl_versions_length (R : access constant xcb_glx_set_client_info_2arb_request_t) return int  -- /usr/include/xcb/glx.h:4911
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_set_client_info_2arb_gl_versions_length";

   function xcb_glx_set_client_info_2arb_gl_versions_end (R : access constant xcb_glx_set_client_info_2arb_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:4914
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_set_client_info_2arb_gl_versions_end";

   function xcb_glx_set_client_info_2arb_gl_extension_string (R : access constant xcb_glx_set_client_info_2arb_request_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/glx.h:4917
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_set_client_info_2arb_gl_extension_string";

   function xcb_glx_set_client_info_2arb_gl_extension_string_length (R : access constant xcb_glx_set_client_info_2arb_request_t) return int  -- /usr/include/xcb/glx.h:4920
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_set_client_info_2arb_gl_extension_string_length";

   function xcb_glx_set_client_info_2arb_gl_extension_string_end (R : access constant xcb_glx_set_client_info_2arb_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:4923
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_set_client_info_2arb_gl_extension_string_end";

   function xcb_glx_set_client_info_2arb_glx_extension_string (R : access constant xcb_glx_set_client_info_2arb_request_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/glx.h:4926
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_set_client_info_2arb_glx_extension_string";

   function xcb_glx_set_client_info_2arb_glx_extension_string_length (R : access constant xcb_glx_set_client_info_2arb_request_t) return int  -- /usr/include/xcb/glx.h:4929
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_set_client_info_2arb_glx_extension_string_length";

   function xcb_glx_set_client_info_2arb_glx_extension_string_end (R : access constant xcb_glx_set_client_info_2arb_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:4932
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_set_client_info_2arb_glx_extension_string_end";

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

   function xcb_glx_new_list_checked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      list : bits_stdint_uintn_h.uint32_t;
      mode : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:4946
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_new_list_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_new_list
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      list : bits_stdint_uintn_h.uint32_t;
      mode : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:4960
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_new_list";

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

   function xcb_glx_end_list_checked (c : access xcb.xcb_connection_t; context_tag : xcb_glx_context_tag_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:4977
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_end_list_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_end_list (c : access xcb.xcb_connection_t; context_tag : xcb_glx_context_tag_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:4989
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_end_list";

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

   function xcb_glx_delete_lists_checked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      list : bits_stdint_uintn_h.uint32_t;
      c_range : bits_stdint_intn_h.int32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:5004
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_delete_lists_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_delete_lists
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      list : bits_stdint_uintn_h.uint32_t;
      c_range : bits_stdint_intn_h.int32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:5018
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_delete_lists";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_gen_lists
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      c_range : bits_stdint_intn_h.int32_t) return xcb_glx_gen_lists_cookie_t  -- /usr/include/xcb/glx.h:5032
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_gen_lists";

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

   function xcb_glx_gen_lists_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      c_range : bits_stdint_intn_h.int32_t) return xcb_glx_gen_lists_cookie_t  -- /usr/include/xcb/glx.h:5048
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_gen_lists_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_gen_lists_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_gen_lists_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_gen_lists_cookie_t;
      e : System.Address) return access xcb_glx_gen_lists_reply_t  -- /usr/include/xcb/glx.h:5067
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_gen_lists_reply";

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

   function xcb_glx_feedback_buffer_checked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      size : bits_stdint_intn_h.int32_t;
      c_type : bits_stdint_intn_h.int32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:5083
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_feedback_buffer_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_feedback_buffer
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      size : bits_stdint_intn_h.int32_t;
      c_type : bits_stdint_intn_h.int32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:5097
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_feedback_buffer";

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

   function xcb_glx_select_buffer_checked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      size : bits_stdint_intn_h.int32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:5114
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_select_buffer_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_select_buffer
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      size : bits_stdint_intn_h.int32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:5127
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_select_buffer";

   function xcb_glx_render_mode_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:5132
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_render_mode_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_render_mode
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      mode : bits_stdint_uintn_h.uint32_t) return xcb_glx_render_mode_cookie_t  -- /usr/include/xcb/glx.h:5143
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_render_mode";

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

   function xcb_glx_render_mode_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      mode : bits_stdint_uintn_h.uint32_t) return xcb_glx_render_mode_cookie_t  -- /usr/include/xcb/glx.h:5159
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_render_mode_unchecked";

   function xcb_glx_render_mode_data (R : access constant xcb_glx_render_mode_reply_t) return access bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/glx.h:5164
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_render_mode_data";

   function xcb_glx_render_mode_data_length (R : access constant xcb_glx_render_mode_reply_t) return int  -- /usr/include/xcb/glx.h:5167
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_render_mode_data_length";

   function xcb_glx_render_mode_data_end (R : access constant xcb_glx_render_mode_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:5170
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_render_mode_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_render_mode_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_render_mode_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_render_mode_cookie_t;
      e : System.Address) return access xcb_glx_render_mode_reply_t  -- /usr/include/xcb/glx.h:5187
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_render_mode_reply";

  --*<  
  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_finish (c : access xcb.xcb_connection_t; context_tag : xcb_glx_context_tag_t) return xcb_glx_finish_cookie_t  -- /usr/include/xcb/glx.h:5200
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_finish";

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

   function xcb_glx_finish_unchecked (c : access xcb.xcb_connection_t; context_tag : xcb_glx_context_tag_t) return xcb_glx_finish_cookie_t  -- /usr/include/xcb/glx.h:5215
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_finish_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_finish_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_finish_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_finish_cookie_t;
      e : System.Address) return access xcb_glx_finish_reply_t  -- /usr/include/xcb/glx.h:5233
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_finish_reply";

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

   function xcb_glx_pixel_storef_checked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      pname : bits_stdint_uintn_h.uint32_t;
      datum : xcb_glx_float32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:5249
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_pixel_storef_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_pixel_storef
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      pname : bits_stdint_uintn_h.uint32_t;
      datum : xcb_glx_float32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:5263
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_pixel_storef";

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

   function xcb_glx_pixel_storei_checked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      pname : bits_stdint_uintn_h.uint32_t;
      datum : bits_stdint_intn_h.int32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:5280
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_pixel_storei_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_pixel_storei
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      pname : bits_stdint_uintn_h.uint32_t;
      datum : bits_stdint_intn_h.int32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:5294
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_pixel_storei";

   function xcb_glx_read_pixels_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:5300
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_read_pixels_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_read_pixels
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      x : bits_stdint_intn_h.int32_t;
      y : bits_stdint_intn_h.int32_t;
      width : bits_stdint_intn_h.int32_t;
      height : bits_stdint_intn_h.int32_t;
      format : bits_stdint_uintn_h.uint32_t;
      c_type : bits_stdint_uintn_h.uint32_t;
      swap_bytes : bits_stdint_uintn_h.uint8_t;
      lsb_first : bits_stdint_uintn_h.uint8_t) return xcb_glx_read_pixels_cookie_t  -- /usr/include/xcb/glx.h:5311
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_read_pixels";

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

   function xcb_glx_read_pixels_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      x : bits_stdint_intn_h.int32_t;
      y : bits_stdint_intn_h.int32_t;
      width : bits_stdint_intn_h.int32_t;
      height : bits_stdint_intn_h.int32_t;
      format : bits_stdint_uintn_h.uint32_t;
      c_type : bits_stdint_uintn_h.uint32_t;
      swap_bytes : bits_stdint_uintn_h.uint8_t;
      lsb_first : bits_stdint_uintn_h.uint8_t) return xcb_glx_read_pixels_cookie_t  -- /usr/include/xcb/glx.h:5334
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_read_pixels_unchecked";

   function xcb_glx_read_pixels_data (R : access constant xcb_glx_read_pixels_reply_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/glx.h:5346
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_read_pixels_data";

   function xcb_glx_read_pixels_data_length (R : access constant xcb_glx_read_pixels_reply_t) return int  -- /usr/include/xcb/glx.h:5349
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_read_pixels_data_length";

   function xcb_glx_read_pixels_data_end (R : access constant xcb_glx_read_pixels_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:5352
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_read_pixels_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_read_pixels_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_read_pixels_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_read_pixels_cookie_t;
      e : System.Address) return access xcb_glx_read_pixels_reply_t  -- /usr/include/xcb/glx.h:5369
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_read_pixels_reply";

  --*<  
   function xcb_glx_get_booleanv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:5374
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_booleanv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_booleanv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      pname : bits_stdint_intn_h.int32_t) return xcb_glx_get_booleanv_cookie_t  -- /usr/include/xcb/glx.h:5385
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_booleanv";

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

   function xcb_glx_get_booleanv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      pname : bits_stdint_intn_h.int32_t) return xcb_glx_get_booleanv_cookie_t  -- /usr/include/xcb/glx.h:5401
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_booleanv_unchecked";

   function xcb_glx_get_booleanv_data (R : access constant xcb_glx_get_booleanv_reply_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/glx.h:5406
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_booleanv_data";

   function xcb_glx_get_booleanv_data_length (R : access constant xcb_glx_get_booleanv_reply_t) return int  -- /usr/include/xcb/glx.h:5409
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_booleanv_data_length";

   function xcb_glx_get_booleanv_data_end (R : access constant xcb_glx_get_booleanv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:5412
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_booleanv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_booleanv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_booleanv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_booleanv_cookie_t;
      e : System.Address) return access xcb_glx_get_booleanv_reply_t  -- /usr/include/xcb/glx.h:5429
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_booleanv_reply";

  --*<  
   function xcb_glx_get_clip_plane_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:5434
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_clip_plane_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_clip_plane
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      plane : bits_stdint_intn_h.int32_t) return xcb_glx_get_clip_plane_cookie_t  -- /usr/include/xcb/glx.h:5445
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_clip_plane";

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

   function xcb_glx_get_clip_plane_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      plane : bits_stdint_intn_h.int32_t) return xcb_glx_get_clip_plane_cookie_t  -- /usr/include/xcb/glx.h:5461
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_clip_plane_unchecked";

   function xcb_glx_get_clip_plane_data (R : access constant xcb_glx_get_clip_plane_reply_t) return access xcb_glx_float64_t  -- /usr/include/xcb/glx.h:5466
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_clip_plane_data";

   function xcb_glx_get_clip_plane_data_length (R : access constant xcb_glx_get_clip_plane_reply_t) return int  -- /usr/include/xcb/glx.h:5469
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_clip_plane_data_length";

   function xcb_glx_get_clip_plane_data_end (R : access constant xcb_glx_get_clip_plane_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:5472
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_clip_plane_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_clip_plane_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_clip_plane_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_clip_plane_cookie_t;
      e : System.Address) return access xcb_glx_get_clip_plane_reply_t  -- /usr/include/xcb/glx.h:5489
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_clip_plane_reply";

  --*<  
   function xcb_glx_get_doublev_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:5494
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_doublev_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_doublev
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_doublev_cookie_t  -- /usr/include/xcb/glx.h:5505
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_doublev";

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

   function xcb_glx_get_doublev_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_doublev_cookie_t  -- /usr/include/xcb/glx.h:5521
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_doublev_unchecked";

   function xcb_glx_get_doublev_data (R : access constant xcb_glx_get_doublev_reply_t) return access xcb_glx_float64_t  -- /usr/include/xcb/glx.h:5526
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_doublev_data";

   function xcb_glx_get_doublev_data_length (R : access constant xcb_glx_get_doublev_reply_t) return int  -- /usr/include/xcb/glx.h:5529
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_doublev_data_length";

   function xcb_glx_get_doublev_data_end (R : access constant xcb_glx_get_doublev_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:5532
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_doublev_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_doublev_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_doublev_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_doublev_cookie_t;
      e : System.Address) return access xcb_glx_get_doublev_reply_t  -- /usr/include/xcb/glx.h:5549
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_doublev_reply";

  --*<  
  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_error (c : access xcb.xcb_connection_t; context_tag : xcb_glx_context_tag_t) return xcb_glx_get_error_cookie_t  -- /usr/include/xcb/glx.h:5562
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_error";

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

   function xcb_glx_get_error_unchecked (c : access xcb.xcb_connection_t; context_tag : xcb_glx_context_tag_t) return xcb_glx_get_error_cookie_t  -- /usr/include/xcb/glx.h:5577
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_error_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_error_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_error_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_error_cookie_t;
      e : System.Address) return access xcb_glx_get_error_reply_t  -- /usr/include/xcb/glx.h:5595
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_error_reply";

  --*<  
   function xcb_glx_get_floatv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:5600
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_floatv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_floatv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_floatv_cookie_t  -- /usr/include/xcb/glx.h:5611
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_floatv";

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

   function xcb_glx_get_floatv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_floatv_cookie_t  -- /usr/include/xcb/glx.h:5627
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_floatv_unchecked";

   function xcb_glx_get_floatv_data (R : access constant xcb_glx_get_floatv_reply_t) return access xcb_glx_float32_t  -- /usr/include/xcb/glx.h:5632
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_floatv_data";

   function xcb_glx_get_floatv_data_length (R : access constant xcb_glx_get_floatv_reply_t) return int  -- /usr/include/xcb/glx.h:5635
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_floatv_data_length";

   function xcb_glx_get_floatv_data_end (R : access constant xcb_glx_get_floatv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:5638
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_floatv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_floatv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_floatv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_floatv_cookie_t;
      e : System.Address) return access xcb_glx_get_floatv_reply_t  -- /usr/include/xcb/glx.h:5655
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_floatv_reply";

  --*<  
   function xcb_glx_get_integerv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:5660
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_integerv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_integerv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_integerv_cookie_t  -- /usr/include/xcb/glx.h:5671
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_integerv";

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

   function xcb_glx_get_integerv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_integerv_cookie_t  -- /usr/include/xcb/glx.h:5687
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_integerv_unchecked";

   function xcb_glx_get_integerv_data (R : access constant xcb_glx_get_integerv_reply_t) return access bits_stdint_intn_h.int32_t  -- /usr/include/xcb/glx.h:5692
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_integerv_data";

   function xcb_glx_get_integerv_data_length (R : access constant xcb_glx_get_integerv_reply_t) return int  -- /usr/include/xcb/glx.h:5695
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_integerv_data_length";

   function xcb_glx_get_integerv_data_end (R : access constant xcb_glx_get_integerv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:5698
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_integerv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_integerv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_integerv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_integerv_cookie_t;
      e : System.Address) return access xcb_glx_get_integerv_reply_t  -- /usr/include/xcb/glx.h:5715
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_integerv_reply";

  --*<  
   function xcb_glx_get_lightfv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:5720
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_lightfv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_lightfv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      light : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_lightfv_cookie_t  -- /usr/include/xcb/glx.h:5731
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_lightfv";

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

   function xcb_glx_get_lightfv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      light : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_lightfv_cookie_t  -- /usr/include/xcb/glx.h:5748
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_lightfv_unchecked";

   function xcb_glx_get_lightfv_data (R : access constant xcb_glx_get_lightfv_reply_t) return access xcb_glx_float32_t  -- /usr/include/xcb/glx.h:5754
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_lightfv_data";

   function xcb_glx_get_lightfv_data_length (R : access constant xcb_glx_get_lightfv_reply_t) return int  -- /usr/include/xcb/glx.h:5757
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_lightfv_data_length";

   function xcb_glx_get_lightfv_data_end (R : access constant xcb_glx_get_lightfv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:5760
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_lightfv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_lightfv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_lightfv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_lightfv_cookie_t;
      e : System.Address) return access xcb_glx_get_lightfv_reply_t  -- /usr/include/xcb/glx.h:5777
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_lightfv_reply";

  --*<  
   function xcb_glx_get_lightiv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:5782
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_lightiv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_lightiv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      light : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_lightiv_cookie_t  -- /usr/include/xcb/glx.h:5793
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_lightiv";

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

   function xcb_glx_get_lightiv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      light : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_lightiv_cookie_t  -- /usr/include/xcb/glx.h:5810
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_lightiv_unchecked";

   function xcb_glx_get_lightiv_data (R : access constant xcb_glx_get_lightiv_reply_t) return access bits_stdint_intn_h.int32_t  -- /usr/include/xcb/glx.h:5816
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_lightiv_data";

   function xcb_glx_get_lightiv_data_length (R : access constant xcb_glx_get_lightiv_reply_t) return int  -- /usr/include/xcb/glx.h:5819
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_lightiv_data_length";

   function xcb_glx_get_lightiv_data_end (R : access constant xcb_glx_get_lightiv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:5822
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_lightiv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_lightiv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_lightiv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_lightiv_cookie_t;
      e : System.Address) return access xcb_glx_get_lightiv_reply_t  -- /usr/include/xcb/glx.h:5839
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_lightiv_reply";

  --*<  
   function xcb_glx_get_mapdv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:5844
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_mapdv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_mapdv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      query : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_mapdv_cookie_t  -- /usr/include/xcb/glx.h:5855
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_mapdv";

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

   function xcb_glx_get_mapdv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      query : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_mapdv_cookie_t  -- /usr/include/xcb/glx.h:5872
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_mapdv_unchecked";

   function xcb_glx_get_mapdv_data (R : access constant xcb_glx_get_mapdv_reply_t) return access xcb_glx_float64_t  -- /usr/include/xcb/glx.h:5878
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_mapdv_data";

   function xcb_glx_get_mapdv_data_length (R : access constant xcb_glx_get_mapdv_reply_t) return int  -- /usr/include/xcb/glx.h:5881
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_mapdv_data_length";

   function xcb_glx_get_mapdv_data_end (R : access constant xcb_glx_get_mapdv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:5884
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_mapdv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_mapdv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_mapdv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_mapdv_cookie_t;
      e : System.Address) return access xcb_glx_get_mapdv_reply_t  -- /usr/include/xcb/glx.h:5901
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_mapdv_reply";

  --*<  
   function xcb_glx_get_mapfv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:5906
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_mapfv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_mapfv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      query : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_mapfv_cookie_t  -- /usr/include/xcb/glx.h:5917
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_mapfv";

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

   function xcb_glx_get_mapfv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      query : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_mapfv_cookie_t  -- /usr/include/xcb/glx.h:5934
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_mapfv_unchecked";

   function xcb_glx_get_mapfv_data (R : access constant xcb_glx_get_mapfv_reply_t) return access xcb_glx_float32_t  -- /usr/include/xcb/glx.h:5940
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_mapfv_data";

   function xcb_glx_get_mapfv_data_length (R : access constant xcb_glx_get_mapfv_reply_t) return int  -- /usr/include/xcb/glx.h:5943
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_mapfv_data_length";

   function xcb_glx_get_mapfv_data_end (R : access constant xcb_glx_get_mapfv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:5946
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_mapfv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_mapfv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_mapfv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_mapfv_cookie_t;
      e : System.Address) return access xcb_glx_get_mapfv_reply_t  -- /usr/include/xcb/glx.h:5963
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_mapfv_reply";

  --*<  
   function xcb_glx_get_mapiv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:5968
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_mapiv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_mapiv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      query : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_mapiv_cookie_t  -- /usr/include/xcb/glx.h:5979
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_mapiv";

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

   function xcb_glx_get_mapiv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      query : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_mapiv_cookie_t  -- /usr/include/xcb/glx.h:5996
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_mapiv_unchecked";

   function xcb_glx_get_mapiv_data (R : access constant xcb_glx_get_mapiv_reply_t) return access bits_stdint_intn_h.int32_t  -- /usr/include/xcb/glx.h:6002
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_mapiv_data";

   function xcb_glx_get_mapiv_data_length (R : access constant xcb_glx_get_mapiv_reply_t) return int  -- /usr/include/xcb/glx.h:6005
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_mapiv_data_length";

   function xcb_glx_get_mapiv_data_end (R : access constant xcb_glx_get_mapiv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:6008
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_mapiv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_mapiv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_mapiv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_mapiv_cookie_t;
      e : System.Address) return access xcb_glx_get_mapiv_reply_t  -- /usr/include/xcb/glx.h:6025
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_mapiv_reply";

  --*<  
   function xcb_glx_get_materialfv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:6030
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_materialfv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_materialfv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      face : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_materialfv_cookie_t  -- /usr/include/xcb/glx.h:6041
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_materialfv";

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

   function xcb_glx_get_materialfv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      face : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_materialfv_cookie_t  -- /usr/include/xcb/glx.h:6058
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_materialfv_unchecked";

   function xcb_glx_get_materialfv_data (R : access constant xcb_glx_get_materialfv_reply_t) return access xcb_glx_float32_t  -- /usr/include/xcb/glx.h:6064
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_materialfv_data";

   function xcb_glx_get_materialfv_data_length (R : access constant xcb_glx_get_materialfv_reply_t) return int  -- /usr/include/xcb/glx.h:6067
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_materialfv_data_length";

   function xcb_glx_get_materialfv_data_end (R : access constant xcb_glx_get_materialfv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:6070
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_materialfv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_materialfv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_materialfv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_materialfv_cookie_t;
      e : System.Address) return access xcb_glx_get_materialfv_reply_t  -- /usr/include/xcb/glx.h:6087
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_materialfv_reply";

  --*<  
   function xcb_glx_get_materialiv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:6092
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_materialiv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_materialiv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      face : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_materialiv_cookie_t  -- /usr/include/xcb/glx.h:6103
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_materialiv";

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

   function xcb_glx_get_materialiv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      face : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_materialiv_cookie_t  -- /usr/include/xcb/glx.h:6120
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_materialiv_unchecked";

   function xcb_glx_get_materialiv_data (R : access constant xcb_glx_get_materialiv_reply_t) return access bits_stdint_intn_h.int32_t  -- /usr/include/xcb/glx.h:6126
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_materialiv_data";

   function xcb_glx_get_materialiv_data_length (R : access constant xcb_glx_get_materialiv_reply_t) return int  -- /usr/include/xcb/glx.h:6129
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_materialiv_data_length";

   function xcb_glx_get_materialiv_data_end (R : access constant xcb_glx_get_materialiv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:6132
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_materialiv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_materialiv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_materialiv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_materialiv_cookie_t;
      e : System.Address) return access xcb_glx_get_materialiv_reply_t  -- /usr/include/xcb/glx.h:6149
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_materialiv_reply";

  --*<  
   function xcb_glx_get_pixel_mapfv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:6154
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_pixel_mapfv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_pixel_mapfv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      map : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_pixel_mapfv_cookie_t  -- /usr/include/xcb/glx.h:6165
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_pixel_mapfv";

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

   function xcb_glx_get_pixel_mapfv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      map : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_pixel_mapfv_cookie_t  -- /usr/include/xcb/glx.h:6181
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_pixel_mapfv_unchecked";

   function xcb_glx_get_pixel_mapfv_data (R : access constant xcb_glx_get_pixel_mapfv_reply_t) return access xcb_glx_float32_t  -- /usr/include/xcb/glx.h:6186
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_pixel_mapfv_data";

   function xcb_glx_get_pixel_mapfv_data_length (R : access constant xcb_glx_get_pixel_mapfv_reply_t) return int  -- /usr/include/xcb/glx.h:6189
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_pixel_mapfv_data_length";

   function xcb_glx_get_pixel_mapfv_data_end (R : access constant xcb_glx_get_pixel_mapfv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:6192
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_pixel_mapfv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_pixel_mapfv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_pixel_mapfv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_pixel_mapfv_cookie_t;
      e : System.Address) return access xcb_glx_get_pixel_mapfv_reply_t  -- /usr/include/xcb/glx.h:6209
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_pixel_mapfv_reply";

  --*<  
   function xcb_glx_get_pixel_mapuiv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:6214
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_pixel_mapuiv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_pixel_mapuiv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      map : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_pixel_mapuiv_cookie_t  -- /usr/include/xcb/glx.h:6225
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_pixel_mapuiv";

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

   function xcb_glx_get_pixel_mapuiv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      map : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_pixel_mapuiv_cookie_t  -- /usr/include/xcb/glx.h:6241
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_pixel_mapuiv_unchecked";

   function xcb_glx_get_pixel_mapuiv_data (R : access constant xcb_glx_get_pixel_mapuiv_reply_t) return access bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/glx.h:6246
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_pixel_mapuiv_data";

   function xcb_glx_get_pixel_mapuiv_data_length (R : access constant xcb_glx_get_pixel_mapuiv_reply_t) return int  -- /usr/include/xcb/glx.h:6249
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_pixel_mapuiv_data_length";

   function xcb_glx_get_pixel_mapuiv_data_end (R : access constant xcb_glx_get_pixel_mapuiv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:6252
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_pixel_mapuiv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_pixel_mapuiv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_pixel_mapuiv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_pixel_mapuiv_cookie_t;
      e : System.Address) return access xcb_glx_get_pixel_mapuiv_reply_t  -- /usr/include/xcb/glx.h:6269
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_pixel_mapuiv_reply";

  --*<  
   function xcb_glx_get_pixel_mapusv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:6274
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_pixel_mapusv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_pixel_mapusv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      map : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_pixel_mapusv_cookie_t  -- /usr/include/xcb/glx.h:6285
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_pixel_mapusv";

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

   function xcb_glx_get_pixel_mapusv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      map : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_pixel_mapusv_cookie_t  -- /usr/include/xcb/glx.h:6301
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_pixel_mapusv_unchecked";

   function xcb_glx_get_pixel_mapusv_data (R : access constant xcb_glx_get_pixel_mapusv_reply_t) return access bits_stdint_uintn_h.uint16_t  -- /usr/include/xcb/glx.h:6306
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_pixel_mapusv_data";

   function xcb_glx_get_pixel_mapusv_data_length (R : access constant xcb_glx_get_pixel_mapusv_reply_t) return int  -- /usr/include/xcb/glx.h:6309
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_pixel_mapusv_data_length";

   function xcb_glx_get_pixel_mapusv_data_end (R : access constant xcb_glx_get_pixel_mapusv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:6312
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_pixel_mapusv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_pixel_mapusv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_pixel_mapusv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_pixel_mapusv_cookie_t;
      e : System.Address) return access xcb_glx_get_pixel_mapusv_reply_t  -- /usr/include/xcb/glx.h:6329
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_pixel_mapusv_reply";

  --*<  
   function xcb_glx_get_polygon_stipple_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:6334
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_polygon_stipple_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_polygon_stipple
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      lsb_first : bits_stdint_uintn_h.uint8_t) return xcb_glx_get_polygon_stipple_cookie_t  -- /usr/include/xcb/glx.h:6345
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_polygon_stipple";

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

   function xcb_glx_get_polygon_stipple_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      lsb_first : bits_stdint_uintn_h.uint8_t) return xcb_glx_get_polygon_stipple_cookie_t  -- /usr/include/xcb/glx.h:6361
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_polygon_stipple_unchecked";

   function xcb_glx_get_polygon_stipple_data (R : access constant xcb_glx_get_polygon_stipple_reply_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/glx.h:6366
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_polygon_stipple_data";

   function xcb_glx_get_polygon_stipple_data_length (R : access constant xcb_glx_get_polygon_stipple_reply_t) return int  -- /usr/include/xcb/glx.h:6369
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_polygon_stipple_data_length";

   function xcb_glx_get_polygon_stipple_data_end (R : access constant xcb_glx_get_polygon_stipple_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:6372
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_polygon_stipple_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_polygon_stipple_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_polygon_stipple_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_polygon_stipple_cookie_t;
      e : System.Address) return access xcb_glx_get_polygon_stipple_reply_t  -- /usr/include/xcb/glx.h:6389
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_polygon_stipple_reply";

  --*<  
   function xcb_glx_get_string_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:6394
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_string_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_string
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      name : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_string_cookie_t  -- /usr/include/xcb/glx.h:6405
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_string";

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

   function xcb_glx_get_string_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      name : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_string_cookie_t  -- /usr/include/xcb/glx.h:6421
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_string_unchecked";

   function xcb_glx_get_string_string (R : access constant xcb_glx_get_string_reply_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/glx.h:6426
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_string_string";

   function xcb_glx_get_string_string_length (R : access constant xcb_glx_get_string_reply_t) return int  -- /usr/include/xcb/glx.h:6429
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_string_string_length";

   function xcb_glx_get_string_string_end (R : access constant xcb_glx_get_string_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:6432
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_string_string_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_string_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_string_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_string_cookie_t;
      e : System.Address) return access xcb_glx_get_string_reply_t  -- /usr/include/xcb/glx.h:6449
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_string_reply";

  --*<  
   function xcb_glx_get_tex_envfv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:6454
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_envfv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_tex_envfv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_tex_envfv_cookie_t  -- /usr/include/xcb/glx.h:6465
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_envfv";

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

   function xcb_glx_get_tex_envfv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_tex_envfv_cookie_t  -- /usr/include/xcb/glx.h:6482
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_envfv_unchecked";

   function xcb_glx_get_tex_envfv_data (R : access constant xcb_glx_get_tex_envfv_reply_t) return access xcb_glx_float32_t  -- /usr/include/xcb/glx.h:6488
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_envfv_data";

   function xcb_glx_get_tex_envfv_data_length (R : access constant xcb_glx_get_tex_envfv_reply_t) return int  -- /usr/include/xcb/glx.h:6491
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_envfv_data_length";

   function xcb_glx_get_tex_envfv_data_end (R : access constant xcb_glx_get_tex_envfv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:6494
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_envfv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_tex_envfv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_tex_envfv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_tex_envfv_cookie_t;
      e : System.Address) return access xcb_glx_get_tex_envfv_reply_t  -- /usr/include/xcb/glx.h:6511
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_envfv_reply";

  --*<  
   function xcb_glx_get_tex_enviv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:6516
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_enviv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_tex_enviv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_tex_enviv_cookie_t  -- /usr/include/xcb/glx.h:6527
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_enviv";

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

   function xcb_glx_get_tex_enviv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_tex_enviv_cookie_t  -- /usr/include/xcb/glx.h:6544
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_enviv_unchecked";

   function xcb_glx_get_tex_enviv_data (R : access constant xcb_glx_get_tex_enviv_reply_t) return access bits_stdint_intn_h.int32_t  -- /usr/include/xcb/glx.h:6550
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_enviv_data";

   function xcb_glx_get_tex_enviv_data_length (R : access constant xcb_glx_get_tex_enviv_reply_t) return int  -- /usr/include/xcb/glx.h:6553
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_enviv_data_length";

   function xcb_glx_get_tex_enviv_data_end (R : access constant xcb_glx_get_tex_enviv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:6556
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_enviv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_tex_enviv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_tex_enviv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_tex_enviv_cookie_t;
      e : System.Address) return access xcb_glx_get_tex_enviv_reply_t  -- /usr/include/xcb/glx.h:6573
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_enviv_reply";

  --*<  
   function xcb_glx_get_tex_gendv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:6578
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_gendv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_tex_gendv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      coord : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_tex_gendv_cookie_t  -- /usr/include/xcb/glx.h:6589
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_gendv";

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

   function xcb_glx_get_tex_gendv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      coord : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_tex_gendv_cookie_t  -- /usr/include/xcb/glx.h:6606
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_gendv_unchecked";

   function xcb_glx_get_tex_gendv_data (R : access constant xcb_glx_get_tex_gendv_reply_t) return access xcb_glx_float64_t  -- /usr/include/xcb/glx.h:6612
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_gendv_data";

   function xcb_glx_get_tex_gendv_data_length (R : access constant xcb_glx_get_tex_gendv_reply_t) return int  -- /usr/include/xcb/glx.h:6615
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_gendv_data_length";

   function xcb_glx_get_tex_gendv_data_end (R : access constant xcb_glx_get_tex_gendv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:6618
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_gendv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_tex_gendv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_tex_gendv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_tex_gendv_cookie_t;
      e : System.Address) return access xcb_glx_get_tex_gendv_reply_t  -- /usr/include/xcb/glx.h:6635
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_gendv_reply";

  --*<  
   function xcb_glx_get_tex_genfv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:6640
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_genfv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_tex_genfv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      coord : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_tex_genfv_cookie_t  -- /usr/include/xcb/glx.h:6651
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_genfv";

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

   function xcb_glx_get_tex_genfv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      coord : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_tex_genfv_cookie_t  -- /usr/include/xcb/glx.h:6668
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_genfv_unchecked";

   function xcb_glx_get_tex_genfv_data (R : access constant xcb_glx_get_tex_genfv_reply_t) return access xcb_glx_float32_t  -- /usr/include/xcb/glx.h:6674
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_genfv_data";

   function xcb_glx_get_tex_genfv_data_length (R : access constant xcb_glx_get_tex_genfv_reply_t) return int  -- /usr/include/xcb/glx.h:6677
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_genfv_data_length";

   function xcb_glx_get_tex_genfv_data_end (R : access constant xcb_glx_get_tex_genfv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:6680
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_genfv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_tex_genfv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_tex_genfv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_tex_genfv_cookie_t;
      e : System.Address) return access xcb_glx_get_tex_genfv_reply_t  -- /usr/include/xcb/glx.h:6697
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_genfv_reply";

  --*<  
   function xcb_glx_get_tex_geniv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:6702
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_geniv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_tex_geniv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      coord : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_tex_geniv_cookie_t  -- /usr/include/xcb/glx.h:6713
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_geniv";

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

   function xcb_glx_get_tex_geniv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      coord : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_tex_geniv_cookie_t  -- /usr/include/xcb/glx.h:6730
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_geniv_unchecked";

   function xcb_glx_get_tex_geniv_data (R : access constant xcb_glx_get_tex_geniv_reply_t) return access bits_stdint_intn_h.int32_t  -- /usr/include/xcb/glx.h:6736
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_geniv_data";

   function xcb_glx_get_tex_geniv_data_length (R : access constant xcb_glx_get_tex_geniv_reply_t) return int  -- /usr/include/xcb/glx.h:6739
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_geniv_data_length";

   function xcb_glx_get_tex_geniv_data_end (R : access constant xcb_glx_get_tex_geniv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:6742
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_geniv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_tex_geniv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_tex_geniv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_tex_geniv_cookie_t;
      e : System.Address) return access xcb_glx_get_tex_geniv_reply_t  -- /usr/include/xcb/glx.h:6759
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_geniv_reply";

  --*<  
   function xcb_glx_get_tex_image_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:6764
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_image_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_tex_image
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      level : bits_stdint_intn_h.int32_t;
      format : bits_stdint_uintn_h.uint32_t;
      c_type : bits_stdint_uintn_h.uint32_t;
      swap_bytes : bits_stdint_uintn_h.uint8_t) return xcb_glx_get_tex_image_cookie_t  -- /usr/include/xcb/glx.h:6775
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_image";

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

   function xcb_glx_get_tex_image_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      level : bits_stdint_intn_h.int32_t;
      format : bits_stdint_uintn_h.uint32_t;
      c_type : bits_stdint_uintn_h.uint32_t;
      swap_bytes : bits_stdint_uintn_h.uint8_t) return xcb_glx_get_tex_image_cookie_t  -- /usr/include/xcb/glx.h:6795
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_image_unchecked";

   function xcb_glx_get_tex_image_data (R : access constant xcb_glx_get_tex_image_reply_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/glx.h:6804
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_image_data";

   function xcb_glx_get_tex_image_data_length (R : access constant xcb_glx_get_tex_image_reply_t) return int  -- /usr/include/xcb/glx.h:6807
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_image_data_length";

   function xcb_glx_get_tex_image_data_end (R : access constant xcb_glx_get_tex_image_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:6810
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_image_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_tex_image_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_tex_image_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_tex_image_cookie_t;
      e : System.Address) return access xcb_glx_get_tex_image_reply_t  -- /usr/include/xcb/glx.h:6827
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_image_reply";

  --*<  
   function xcb_glx_get_tex_parameterfv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:6832
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_parameterfv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_tex_parameterfv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_tex_parameterfv_cookie_t  -- /usr/include/xcb/glx.h:6843
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_parameterfv";

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

   function xcb_glx_get_tex_parameterfv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_tex_parameterfv_cookie_t  -- /usr/include/xcb/glx.h:6860
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_parameterfv_unchecked";

   function xcb_glx_get_tex_parameterfv_data (R : access constant xcb_glx_get_tex_parameterfv_reply_t) return access xcb_glx_float32_t  -- /usr/include/xcb/glx.h:6866
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_parameterfv_data";

   function xcb_glx_get_tex_parameterfv_data_length (R : access constant xcb_glx_get_tex_parameterfv_reply_t) return int  -- /usr/include/xcb/glx.h:6869
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_parameterfv_data_length";

   function xcb_glx_get_tex_parameterfv_data_end (R : access constant xcb_glx_get_tex_parameterfv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:6872
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_parameterfv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_tex_parameterfv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_tex_parameterfv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_tex_parameterfv_cookie_t;
      e : System.Address) return access xcb_glx_get_tex_parameterfv_reply_t  -- /usr/include/xcb/glx.h:6889
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_parameterfv_reply";

  --*<  
   function xcb_glx_get_tex_parameteriv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:6894
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_parameteriv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_tex_parameteriv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_tex_parameteriv_cookie_t  -- /usr/include/xcb/glx.h:6905
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_parameteriv";

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

   function xcb_glx_get_tex_parameteriv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_tex_parameteriv_cookie_t  -- /usr/include/xcb/glx.h:6922
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_parameteriv_unchecked";

   function xcb_glx_get_tex_parameteriv_data (R : access constant xcb_glx_get_tex_parameteriv_reply_t) return access bits_stdint_intn_h.int32_t  -- /usr/include/xcb/glx.h:6928
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_parameteriv_data";

   function xcb_glx_get_tex_parameteriv_data_length (R : access constant xcb_glx_get_tex_parameteriv_reply_t) return int  -- /usr/include/xcb/glx.h:6931
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_parameteriv_data_length";

   function xcb_glx_get_tex_parameteriv_data_end (R : access constant xcb_glx_get_tex_parameteriv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:6934
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_parameteriv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_tex_parameteriv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_tex_parameteriv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_tex_parameteriv_cookie_t;
      e : System.Address) return access xcb_glx_get_tex_parameteriv_reply_t  -- /usr/include/xcb/glx.h:6951
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_parameteriv_reply";

  --*<  
   function xcb_glx_get_tex_level_parameterfv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:6956
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_level_parameterfv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_tex_level_parameterfv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      level : bits_stdint_intn_h.int32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_tex_level_parameterfv_cookie_t  -- /usr/include/xcb/glx.h:6967
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_level_parameterfv";

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

   function xcb_glx_get_tex_level_parameterfv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      level : bits_stdint_intn_h.int32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_tex_level_parameterfv_cookie_t  -- /usr/include/xcb/glx.h:6985
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_level_parameterfv_unchecked";

   function xcb_glx_get_tex_level_parameterfv_data (R : access constant xcb_glx_get_tex_level_parameterfv_reply_t) return access xcb_glx_float32_t  -- /usr/include/xcb/glx.h:6992
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_level_parameterfv_data";

   function xcb_glx_get_tex_level_parameterfv_data_length (R : access constant xcb_glx_get_tex_level_parameterfv_reply_t) return int  -- /usr/include/xcb/glx.h:6995
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_level_parameterfv_data_length";

   function xcb_glx_get_tex_level_parameterfv_data_end (R : access constant xcb_glx_get_tex_level_parameterfv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:6998
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_level_parameterfv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_tex_level_parameterfv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_tex_level_parameterfv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_tex_level_parameterfv_cookie_t;
      e : System.Address) return access xcb_glx_get_tex_level_parameterfv_reply_t  -- /usr/include/xcb/glx.h:7015
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_level_parameterfv_reply";

  --*<  
   function xcb_glx_get_tex_level_parameteriv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:7020
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_level_parameteriv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_tex_level_parameteriv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      level : bits_stdint_intn_h.int32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_tex_level_parameteriv_cookie_t  -- /usr/include/xcb/glx.h:7031
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_level_parameteriv";

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

   function xcb_glx_get_tex_level_parameteriv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      level : bits_stdint_intn_h.int32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_tex_level_parameteriv_cookie_t  -- /usr/include/xcb/glx.h:7049
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_level_parameteriv_unchecked";

   function xcb_glx_get_tex_level_parameteriv_data (R : access constant xcb_glx_get_tex_level_parameteriv_reply_t) return access bits_stdint_intn_h.int32_t  -- /usr/include/xcb/glx.h:7056
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_level_parameteriv_data";

   function xcb_glx_get_tex_level_parameteriv_data_length (R : access constant xcb_glx_get_tex_level_parameteriv_reply_t) return int  -- /usr/include/xcb/glx.h:7059
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_level_parameteriv_data_length";

   function xcb_glx_get_tex_level_parameteriv_data_end (R : access constant xcb_glx_get_tex_level_parameteriv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:7062
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_level_parameteriv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_tex_level_parameteriv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_tex_level_parameteriv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_tex_level_parameteriv_cookie_t;
      e : System.Address) return access xcb_glx_get_tex_level_parameteriv_reply_t  -- /usr/include/xcb/glx.h:7079
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_tex_level_parameteriv_reply";

  --*<  
  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_is_enabled
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      capability : bits_stdint_uintn_h.uint32_t) return xcb_glx_is_enabled_cookie_t  -- /usr/include/xcb/glx.h:7092
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_is_enabled";

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

   function xcb_glx_is_enabled_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      capability : bits_stdint_uintn_h.uint32_t) return xcb_glx_is_enabled_cookie_t  -- /usr/include/xcb/glx.h:7108
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_is_enabled_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_is_enabled_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_is_enabled_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_is_enabled_cookie_t;
      e : System.Address) return access xcb_glx_is_enabled_reply_t  -- /usr/include/xcb/glx.h:7127
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_is_enabled_reply";

  --*<  
  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_is_list
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      list : bits_stdint_uintn_h.uint32_t) return xcb_glx_is_list_cookie_t  -- /usr/include/xcb/glx.h:7140
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_is_list";

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

   function xcb_glx_is_list_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      list : bits_stdint_uintn_h.uint32_t) return xcb_glx_is_list_cookie_t  -- /usr/include/xcb/glx.h:7156
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_is_list_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_is_list_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_is_list_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_is_list_cookie_t;
      e : System.Address) return access xcb_glx_is_list_reply_t  -- /usr/include/xcb/glx.h:7175
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_is_list_reply";

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

   function xcb_glx_flush_checked (c : access xcb.xcb_connection_t; context_tag : xcb_glx_context_tag_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:7191
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_flush_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_flush (c : access xcb.xcb_connection_t; context_tag : xcb_glx_context_tag_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:7203
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_flush";

   function xcb_glx_are_textures_resident_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:7207
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_are_textures_resident_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_are_textures_resident
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      n : bits_stdint_intn_h.int32_t;
      textures : access bits_stdint_uintn_h.uint32_t) return xcb_glx_are_textures_resident_cookie_t  -- /usr/include/xcb/glx.h:7218
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_are_textures_resident";

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

   function xcb_glx_are_textures_resident_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      n : bits_stdint_intn_h.int32_t;
      textures : access bits_stdint_uintn_h.uint32_t) return xcb_glx_are_textures_resident_cookie_t  -- /usr/include/xcb/glx.h:7235
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_are_textures_resident_unchecked";

   function xcb_glx_are_textures_resident_data (R : access constant xcb_glx_are_textures_resident_reply_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/glx.h:7241
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_are_textures_resident_data";

   function xcb_glx_are_textures_resident_data_length (R : access constant xcb_glx_are_textures_resident_reply_t) return int  -- /usr/include/xcb/glx.h:7244
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_are_textures_resident_data_length";

   function xcb_glx_are_textures_resident_data_end (R : access constant xcb_glx_are_textures_resident_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:7247
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_are_textures_resident_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_are_textures_resident_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_are_textures_resident_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_are_textures_resident_cookie_t;
      e : System.Address) return access xcb_glx_are_textures_resident_reply_t  -- /usr/include/xcb/glx.h:7264
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_are_textures_resident_reply";

  --*<  
   function xcb_glx_delete_textures_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:7269
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_delete_textures_sizeof";

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

   function xcb_glx_delete_textures_checked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      n : bits_stdint_intn_h.int32_t;
      textures : access bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:7283
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_delete_textures_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_delete_textures
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      n : bits_stdint_intn_h.int32_t;
      textures : access bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:7297
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_delete_textures";

   function xcb_glx_delete_textures_textures (R : access constant xcb_glx_delete_textures_request_t) return access bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/glx.h:7303
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_delete_textures_textures";

   function xcb_glx_delete_textures_textures_length (R : access constant xcb_glx_delete_textures_request_t) return int  -- /usr/include/xcb/glx.h:7306
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_delete_textures_textures_length";

   function xcb_glx_delete_textures_textures_end (R : access constant xcb_glx_delete_textures_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:7309
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_delete_textures_textures_end";

   function xcb_glx_gen_textures_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:7312
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_gen_textures_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_gen_textures
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      n : bits_stdint_intn_h.int32_t) return xcb_glx_gen_textures_cookie_t  -- /usr/include/xcb/glx.h:7323
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_gen_textures";

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

   function xcb_glx_gen_textures_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      n : bits_stdint_intn_h.int32_t) return xcb_glx_gen_textures_cookie_t  -- /usr/include/xcb/glx.h:7339
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_gen_textures_unchecked";

   function xcb_glx_gen_textures_data (R : access constant xcb_glx_gen_textures_reply_t) return access bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/glx.h:7344
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_gen_textures_data";

   function xcb_glx_gen_textures_data_length (R : access constant xcb_glx_gen_textures_reply_t) return int  -- /usr/include/xcb/glx.h:7347
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_gen_textures_data_length";

   function xcb_glx_gen_textures_data_end (R : access constant xcb_glx_gen_textures_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:7350
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_gen_textures_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_gen_textures_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_gen_textures_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_gen_textures_cookie_t;
      e : System.Address) return access xcb_glx_gen_textures_reply_t  -- /usr/include/xcb/glx.h:7367
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_gen_textures_reply";

  --*<  
  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_is_texture
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      texture : bits_stdint_uintn_h.uint32_t) return xcb_glx_is_texture_cookie_t  -- /usr/include/xcb/glx.h:7380
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_is_texture";

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

   function xcb_glx_is_texture_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      texture : bits_stdint_uintn_h.uint32_t) return xcb_glx_is_texture_cookie_t  -- /usr/include/xcb/glx.h:7396
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_is_texture_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_is_texture_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_is_texture_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_is_texture_cookie_t;
      e : System.Address) return access xcb_glx_is_texture_reply_t  -- /usr/include/xcb/glx.h:7415
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_is_texture_reply";

  --*<  
   function xcb_glx_get_color_table_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:7420
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_color_table_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_color_table
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      format : bits_stdint_uintn_h.uint32_t;
      c_type : bits_stdint_uintn_h.uint32_t;
      swap_bytes : bits_stdint_uintn_h.uint8_t) return xcb_glx_get_color_table_cookie_t  -- /usr/include/xcb/glx.h:7431
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_color_table";

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

   function xcb_glx_get_color_table_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      format : bits_stdint_uintn_h.uint32_t;
      c_type : bits_stdint_uintn_h.uint32_t;
      swap_bytes : bits_stdint_uintn_h.uint8_t) return xcb_glx_get_color_table_cookie_t  -- /usr/include/xcb/glx.h:7450
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_color_table_unchecked";

   function xcb_glx_get_color_table_data (R : access constant xcb_glx_get_color_table_reply_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/glx.h:7458
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_color_table_data";

   function xcb_glx_get_color_table_data_length (R : access constant xcb_glx_get_color_table_reply_t) return int  -- /usr/include/xcb/glx.h:7461
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_color_table_data_length";

   function xcb_glx_get_color_table_data_end (R : access constant xcb_glx_get_color_table_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:7464
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_color_table_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_color_table_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_color_table_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_color_table_cookie_t;
      e : System.Address) return access xcb_glx_get_color_table_reply_t  -- /usr/include/xcb/glx.h:7481
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_color_table_reply";

  --*<  
   function xcb_glx_get_color_table_parameterfv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:7486
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_color_table_parameterfv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_color_table_parameterfv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_color_table_parameterfv_cookie_t  -- /usr/include/xcb/glx.h:7497
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_color_table_parameterfv";

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

   function xcb_glx_get_color_table_parameterfv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_color_table_parameterfv_cookie_t  -- /usr/include/xcb/glx.h:7514
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_color_table_parameterfv_unchecked";

   function xcb_glx_get_color_table_parameterfv_data (R : access constant xcb_glx_get_color_table_parameterfv_reply_t) return access xcb_glx_float32_t  -- /usr/include/xcb/glx.h:7520
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_color_table_parameterfv_data";

   function xcb_glx_get_color_table_parameterfv_data_length (R : access constant xcb_glx_get_color_table_parameterfv_reply_t) return int  -- /usr/include/xcb/glx.h:7523
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_color_table_parameterfv_data_length";

   function xcb_glx_get_color_table_parameterfv_data_end (R : access constant xcb_glx_get_color_table_parameterfv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:7526
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_color_table_parameterfv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_color_table_parameterfv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_color_table_parameterfv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_color_table_parameterfv_cookie_t;
      e : System.Address) return access xcb_glx_get_color_table_parameterfv_reply_t  -- /usr/include/xcb/glx.h:7543
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_color_table_parameterfv_reply";

  --*<  
   function xcb_glx_get_color_table_parameteriv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:7548
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_color_table_parameteriv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_color_table_parameteriv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_color_table_parameteriv_cookie_t  -- /usr/include/xcb/glx.h:7559
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_color_table_parameteriv";

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

   function xcb_glx_get_color_table_parameteriv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_color_table_parameteriv_cookie_t  -- /usr/include/xcb/glx.h:7576
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_color_table_parameteriv_unchecked";

   function xcb_glx_get_color_table_parameteriv_data (R : access constant xcb_glx_get_color_table_parameteriv_reply_t) return access bits_stdint_intn_h.int32_t  -- /usr/include/xcb/glx.h:7582
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_color_table_parameteriv_data";

   function xcb_glx_get_color_table_parameteriv_data_length (R : access constant xcb_glx_get_color_table_parameteriv_reply_t) return int  -- /usr/include/xcb/glx.h:7585
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_color_table_parameteriv_data_length";

   function xcb_glx_get_color_table_parameteriv_data_end (R : access constant xcb_glx_get_color_table_parameteriv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:7588
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_color_table_parameteriv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_color_table_parameteriv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_color_table_parameteriv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_color_table_parameteriv_cookie_t;
      e : System.Address) return access xcb_glx_get_color_table_parameteriv_reply_t  -- /usr/include/xcb/glx.h:7605
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_color_table_parameteriv_reply";

  --*<  
   function xcb_glx_get_convolution_filter_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:7610
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_convolution_filter_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_convolution_filter
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      format : bits_stdint_uintn_h.uint32_t;
      c_type : bits_stdint_uintn_h.uint32_t;
      swap_bytes : bits_stdint_uintn_h.uint8_t) return xcb_glx_get_convolution_filter_cookie_t  -- /usr/include/xcb/glx.h:7621
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_convolution_filter";

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

   function xcb_glx_get_convolution_filter_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      format : bits_stdint_uintn_h.uint32_t;
      c_type : bits_stdint_uintn_h.uint32_t;
      swap_bytes : bits_stdint_uintn_h.uint8_t) return xcb_glx_get_convolution_filter_cookie_t  -- /usr/include/xcb/glx.h:7640
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_convolution_filter_unchecked";

   function xcb_glx_get_convolution_filter_data (R : access constant xcb_glx_get_convolution_filter_reply_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/glx.h:7648
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_convolution_filter_data";

   function xcb_glx_get_convolution_filter_data_length (R : access constant xcb_glx_get_convolution_filter_reply_t) return int  -- /usr/include/xcb/glx.h:7651
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_convolution_filter_data_length";

   function xcb_glx_get_convolution_filter_data_end (R : access constant xcb_glx_get_convolution_filter_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:7654
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_convolution_filter_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_convolution_filter_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_convolution_filter_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_convolution_filter_cookie_t;
      e : System.Address) return access xcb_glx_get_convolution_filter_reply_t  -- /usr/include/xcb/glx.h:7671
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_convolution_filter_reply";

  --*<  
   function xcb_glx_get_convolution_parameterfv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:7676
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_convolution_parameterfv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_convolution_parameterfv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_convolution_parameterfv_cookie_t  -- /usr/include/xcb/glx.h:7687
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_convolution_parameterfv";

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

   function xcb_glx_get_convolution_parameterfv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_convolution_parameterfv_cookie_t  -- /usr/include/xcb/glx.h:7704
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_convolution_parameterfv_unchecked";

   function xcb_glx_get_convolution_parameterfv_data (R : access constant xcb_glx_get_convolution_parameterfv_reply_t) return access xcb_glx_float32_t  -- /usr/include/xcb/glx.h:7710
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_convolution_parameterfv_data";

   function xcb_glx_get_convolution_parameterfv_data_length (R : access constant xcb_glx_get_convolution_parameterfv_reply_t) return int  -- /usr/include/xcb/glx.h:7713
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_convolution_parameterfv_data_length";

   function xcb_glx_get_convolution_parameterfv_data_end (R : access constant xcb_glx_get_convolution_parameterfv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:7716
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_convolution_parameterfv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_convolution_parameterfv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_convolution_parameterfv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_convolution_parameterfv_cookie_t;
      e : System.Address) return access xcb_glx_get_convolution_parameterfv_reply_t  -- /usr/include/xcb/glx.h:7733
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_convolution_parameterfv_reply";

  --*<  
   function xcb_glx_get_convolution_parameteriv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:7738
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_convolution_parameteriv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_convolution_parameteriv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_convolution_parameteriv_cookie_t  -- /usr/include/xcb/glx.h:7749
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_convolution_parameteriv";

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

   function xcb_glx_get_convolution_parameteriv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_convolution_parameteriv_cookie_t  -- /usr/include/xcb/glx.h:7766
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_convolution_parameteriv_unchecked";

   function xcb_glx_get_convolution_parameteriv_data (R : access constant xcb_glx_get_convolution_parameteriv_reply_t) return access bits_stdint_intn_h.int32_t  -- /usr/include/xcb/glx.h:7772
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_convolution_parameteriv_data";

   function xcb_glx_get_convolution_parameteriv_data_length (R : access constant xcb_glx_get_convolution_parameteriv_reply_t) return int  -- /usr/include/xcb/glx.h:7775
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_convolution_parameteriv_data_length";

   function xcb_glx_get_convolution_parameteriv_data_end (R : access constant xcb_glx_get_convolution_parameteriv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:7778
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_convolution_parameteriv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_convolution_parameteriv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_convolution_parameteriv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_convolution_parameteriv_cookie_t;
      e : System.Address) return access xcb_glx_get_convolution_parameteriv_reply_t  -- /usr/include/xcb/glx.h:7795
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_convolution_parameteriv_reply";

  --*<  
   function xcb_glx_get_separable_filter_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:7800
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_separable_filter_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_separable_filter
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      format : bits_stdint_uintn_h.uint32_t;
      c_type : bits_stdint_uintn_h.uint32_t;
      swap_bytes : bits_stdint_uintn_h.uint8_t) return xcb_glx_get_separable_filter_cookie_t  -- /usr/include/xcb/glx.h:7811
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_separable_filter";

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

   function xcb_glx_get_separable_filter_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      format : bits_stdint_uintn_h.uint32_t;
      c_type : bits_stdint_uintn_h.uint32_t;
      swap_bytes : bits_stdint_uintn_h.uint8_t) return xcb_glx_get_separable_filter_cookie_t  -- /usr/include/xcb/glx.h:7830
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_separable_filter_unchecked";

   function xcb_glx_get_separable_filter_rows_and_cols (R : access constant xcb_glx_get_separable_filter_reply_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/glx.h:7838
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_separable_filter_rows_and_cols";

   function xcb_glx_get_separable_filter_rows_and_cols_length (R : access constant xcb_glx_get_separable_filter_reply_t) return int  -- /usr/include/xcb/glx.h:7841
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_separable_filter_rows_and_cols_length";

   function xcb_glx_get_separable_filter_rows_and_cols_end (R : access constant xcb_glx_get_separable_filter_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:7844
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_separable_filter_rows_and_cols_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_separable_filter_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_separable_filter_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_separable_filter_cookie_t;
      e : System.Address) return access xcb_glx_get_separable_filter_reply_t  -- /usr/include/xcb/glx.h:7861
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_separable_filter_reply";

  --*<  
   function xcb_glx_get_histogram_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:7866
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_histogram_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_histogram
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      format : bits_stdint_uintn_h.uint32_t;
      c_type : bits_stdint_uintn_h.uint32_t;
      swap_bytes : bits_stdint_uintn_h.uint8_t;
      reset : bits_stdint_uintn_h.uint8_t) return xcb_glx_get_histogram_cookie_t  -- /usr/include/xcb/glx.h:7877
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_histogram";

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

   function xcb_glx_get_histogram_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      format : bits_stdint_uintn_h.uint32_t;
      c_type : bits_stdint_uintn_h.uint32_t;
      swap_bytes : bits_stdint_uintn_h.uint8_t;
      reset : bits_stdint_uintn_h.uint8_t) return xcb_glx_get_histogram_cookie_t  -- /usr/include/xcb/glx.h:7897
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_histogram_unchecked";

   function xcb_glx_get_histogram_data (R : access constant xcb_glx_get_histogram_reply_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/glx.h:7906
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_histogram_data";

   function xcb_glx_get_histogram_data_length (R : access constant xcb_glx_get_histogram_reply_t) return int  -- /usr/include/xcb/glx.h:7909
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_histogram_data_length";

   function xcb_glx_get_histogram_data_end (R : access constant xcb_glx_get_histogram_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:7912
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_histogram_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_histogram_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_histogram_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_histogram_cookie_t;
      e : System.Address) return access xcb_glx_get_histogram_reply_t  -- /usr/include/xcb/glx.h:7929
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_histogram_reply";

  --*<  
   function xcb_glx_get_histogram_parameterfv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:7934
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_histogram_parameterfv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_histogram_parameterfv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_histogram_parameterfv_cookie_t  -- /usr/include/xcb/glx.h:7945
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_histogram_parameterfv";

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

   function xcb_glx_get_histogram_parameterfv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_histogram_parameterfv_cookie_t  -- /usr/include/xcb/glx.h:7962
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_histogram_parameterfv_unchecked";

   function xcb_glx_get_histogram_parameterfv_data (R : access constant xcb_glx_get_histogram_parameterfv_reply_t) return access xcb_glx_float32_t  -- /usr/include/xcb/glx.h:7968
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_histogram_parameterfv_data";

   function xcb_glx_get_histogram_parameterfv_data_length (R : access constant xcb_glx_get_histogram_parameterfv_reply_t) return int  -- /usr/include/xcb/glx.h:7971
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_histogram_parameterfv_data_length";

   function xcb_glx_get_histogram_parameterfv_data_end (R : access constant xcb_glx_get_histogram_parameterfv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:7974
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_histogram_parameterfv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_histogram_parameterfv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_histogram_parameterfv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_histogram_parameterfv_cookie_t;
      e : System.Address) return access xcb_glx_get_histogram_parameterfv_reply_t  -- /usr/include/xcb/glx.h:7991
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_histogram_parameterfv_reply";

  --*<  
   function xcb_glx_get_histogram_parameteriv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:7996
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_histogram_parameteriv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_histogram_parameteriv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_histogram_parameteriv_cookie_t  -- /usr/include/xcb/glx.h:8007
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_histogram_parameteriv";

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

   function xcb_glx_get_histogram_parameteriv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_histogram_parameteriv_cookie_t  -- /usr/include/xcb/glx.h:8024
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_histogram_parameteriv_unchecked";

   function xcb_glx_get_histogram_parameteriv_data (R : access constant xcb_glx_get_histogram_parameteriv_reply_t) return access bits_stdint_intn_h.int32_t  -- /usr/include/xcb/glx.h:8030
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_histogram_parameteriv_data";

   function xcb_glx_get_histogram_parameteriv_data_length (R : access constant xcb_glx_get_histogram_parameteriv_reply_t) return int  -- /usr/include/xcb/glx.h:8033
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_histogram_parameteriv_data_length";

   function xcb_glx_get_histogram_parameteriv_data_end (R : access constant xcb_glx_get_histogram_parameteriv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:8036
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_histogram_parameteriv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_histogram_parameteriv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_histogram_parameteriv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_histogram_parameteriv_cookie_t;
      e : System.Address) return access xcb_glx_get_histogram_parameteriv_reply_t  -- /usr/include/xcb/glx.h:8053
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_histogram_parameteriv_reply";

  --*<  
   function xcb_glx_get_minmax_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:8058
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_minmax_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_minmax
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      format : bits_stdint_uintn_h.uint32_t;
      c_type : bits_stdint_uintn_h.uint32_t;
      swap_bytes : bits_stdint_uintn_h.uint8_t;
      reset : bits_stdint_uintn_h.uint8_t) return xcb_glx_get_minmax_cookie_t  -- /usr/include/xcb/glx.h:8069
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_minmax";

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

   function xcb_glx_get_minmax_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      format : bits_stdint_uintn_h.uint32_t;
      c_type : bits_stdint_uintn_h.uint32_t;
      swap_bytes : bits_stdint_uintn_h.uint8_t;
      reset : bits_stdint_uintn_h.uint8_t) return xcb_glx_get_minmax_cookie_t  -- /usr/include/xcb/glx.h:8089
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_minmax_unchecked";

   function xcb_glx_get_minmax_data (R : access constant xcb_glx_get_minmax_reply_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/glx.h:8098
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_minmax_data";

   function xcb_glx_get_minmax_data_length (R : access constant xcb_glx_get_minmax_reply_t) return int  -- /usr/include/xcb/glx.h:8101
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_minmax_data_length";

   function xcb_glx_get_minmax_data_end (R : access constant xcb_glx_get_minmax_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:8104
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_minmax_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_minmax_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_minmax_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_minmax_cookie_t;
      e : System.Address) return access xcb_glx_get_minmax_reply_t  -- /usr/include/xcb/glx.h:8121
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_minmax_reply";

  --*<  
   function xcb_glx_get_minmax_parameterfv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:8126
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_minmax_parameterfv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_minmax_parameterfv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_minmax_parameterfv_cookie_t  -- /usr/include/xcb/glx.h:8137
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_minmax_parameterfv";

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

   function xcb_glx_get_minmax_parameterfv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_minmax_parameterfv_cookie_t  -- /usr/include/xcb/glx.h:8154
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_minmax_parameterfv_unchecked";

   function xcb_glx_get_minmax_parameterfv_data (R : access constant xcb_glx_get_minmax_parameterfv_reply_t) return access xcb_glx_float32_t  -- /usr/include/xcb/glx.h:8160
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_minmax_parameterfv_data";

   function xcb_glx_get_minmax_parameterfv_data_length (R : access constant xcb_glx_get_minmax_parameterfv_reply_t) return int  -- /usr/include/xcb/glx.h:8163
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_minmax_parameterfv_data_length";

   function xcb_glx_get_minmax_parameterfv_data_end (R : access constant xcb_glx_get_minmax_parameterfv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:8166
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_minmax_parameterfv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_minmax_parameterfv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_minmax_parameterfv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_minmax_parameterfv_cookie_t;
      e : System.Address) return access xcb_glx_get_minmax_parameterfv_reply_t  -- /usr/include/xcb/glx.h:8183
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_minmax_parameterfv_reply";

  --*<  
   function xcb_glx_get_minmax_parameteriv_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:8188
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_minmax_parameteriv_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_minmax_parameteriv
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_minmax_parameteriv_cookie_t  -- /usr/include/xcb/glx.h:8199
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_minmax_parameteriv";

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

   function xcb_glx_get_minmax_parameteriv_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_minmax_parameteriv_cookie_t  -- /usr/include/xcb/glx.h:8216
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_minmax_parameteriv_unchecked";

   function xcb_glx_get_minmax_parameteriv_data (R : access constant xcb_glx_get_minmax_parameteriv_reply_t) return access bits_stdint_intn_h.int32_t  -- /usr/include/xcb/glx.h:8222
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_minmax_parameteriv_data";

   function xcb_glx_get_minmax_parameteriv_data_length (R : access constant xcb_glx_get_minmax_parameteriv_reply_t) return int  -- /usr/include/xcb/glx.h:8225
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_minmax_parameteriv_data_length";

   function xcb_glx_get_minmax_parameteriv_data_end (R : access constant xcb_glx_get_minmax_parameteriv_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:8228
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_minmax_parameteriv_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_minmax_parameteriv_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_minmax_parameteriv_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_minmax_parameteriv_cookie_t;
      e : System.Address) return access xcb_glx_get_minmax_parameteriv_reply_t  -- /usr/include/xcb/glx.h:8245
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_minmax_parameteriv_reply";

  --*<  
   function xcb_glx_get_compressed_tex_image_arb_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:8250
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_compressed_tex_image_arb_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_compressed_tex_image_arb
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      level : bits_stdint_intn_h.int32_t) return xcb_glx_get_compressed_tex_image_arb_cookie_t  -- /usr/include/xcb/glx.h:8261
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_compressed_tex_image_arb";

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

   function xcb_glx_get_compressed_tex_image_arb_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      level : bits_stdint_intn_h.int32_t) return xcb_glx_get_compressed_tex_image_arb_cookie_t  -- /usr/include/xcb/glx.h:8278
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_compressed_tex_image_arb_unchecked";

   function xcb_glx_get_compressed_tex_image_arb_data (R : access constant xcb_glx_get_compressed_tex_image_arb_reply_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/glx.h:8284
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_compressed_tex_image_arb_data";

   function xcb_glx_get_compressed_tex_image_arb_data_length (R : access constant xcb_glx_get_compressed_tex_image_arb_reply_t) return int  -- /usr/include/xcb/glx.h:8287
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_compressed_tex_image_arb_data_length";

   function xcb_glx_get_compressed_tex_image_arb_data_end (R : access constant xcb_glx_get_compressed_tex_image_arb_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:8290
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_compressed_tex_image_arb_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_compressed_tex_image_arb_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_compressed_tex_image_arb_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_compressed_tex_image_arb_cookie_t;
      e : System.Address) return access xcb_glx_get_compressed_tex_image_arb_reply_t  -- /usr/include/xcb/glx.h:8307
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_compressed_tex_image_arb_reply";

  --*<  
   function xcb_glx_delete_queries_arb_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:8312
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_delete_queries_arb_sizeof";

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

   function xcb_glx_delete_queries_arb_checked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      n : bits_stdint_intn_h.int32_t;
      ids : access bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:8326
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_delete_queries_arb_checked";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_delete_queries_arb
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      n : bits_stdint_intn_h.int32_t;
      ids : access bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/glx.h:8340
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_delete_queries_arb";

   function xcb_glx_delete_queries_arb_ids (R : access constant xcb_glx_delete_queries_arb_request_t) return access bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/glx.h:8346
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_delete_queries_arb_ids";

   function xcb_glx_delete_queries_arb_ids_length (R : access constant xcb_glx_delete_queries_arb_request_t) return int  -- /usr/include/xcb/glx.h:8349
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_delete_queries_arb_ids_length";

   function xcb_glx_delete_queries_arb_ids_end (R : access constant xcb_glx_delete_queries_arb_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:8352
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_delete_queries_arb_ids_end";

   function xcb_glx_gen_queries_arb_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:8355
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_gen_queries_arb_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_gen_queries_arb
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      n : bits_stdint_intn_h.int32_t) return xcb_glx_gen_queries_arb_cookie_t  -- /usr/include/xcb/glx.h:8366
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_gen_queries_arb";

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

   function xcb_glx_gen_queries_arb_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      n : bits_stdint_intn_h.int32_t) return xcb_glx_gen_queries_arb_cookie_t  -- /usr/include/xcb/glx.h:8382
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_gen_queries_arb_unchecked";

   function xcb_glx_gen_queries_arb_data (R : access constant xcb_glx_gen_queries_arb_reply_t) return access bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/glx.h:8387
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_gen_queries_arb_data";

   function xcb_glx_gen_queries_arb_data_length (R : access constant xcb_glx_gen_queries_arb_reply_t) return int  -- /usr/include/xcb/glx.h:8390
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_gen_queries_arb_data_length";

   function xcb_glx_gen_queries_arb_data_end (R : access constant xcb_glx_gen_queries_arb_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:8393
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_gen_queries_arb_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_gen_queries_arb_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_gen_queries_arb_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_gen_queries_arb_cookie_t;
      e : System.Address) return access xcb_glx_gen_queries_arb_reply_t  -- /usr/include/xcb/glx.h:8410
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_gen_queries_arb_reply";

  --*<  
  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_is_query_arb
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      id : bits_stdint_uintn_h.uint32_t) return xcb_glx_is_query_arb_cookie_t  -- /usr/include/xcb/glx.h:8423
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_is_query_arb";

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

   function xcb_glx_is_query_arb_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      id : bits_stdint_uintn_h.uint32_t) return xcb_glx_is_query_arb_cookie_t  -- /usr/include/xcb/glx.h:8439
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_is_query_arb_unchecked";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_is_query_arb_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_is_query_arb_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_is_query_arb_cookie_t;
      e : System.Address) return access xcb_glx_is_query_arb_reply_t  -- /usr/include/xcb/glx.h:8458
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_is_query_arb_reply";

  --*<  
   function xcb_glx_get_queryiv_arb_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:8463
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_queryiv_arb_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_queryiv_arb
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_queryiv_arb_cookie_t  -- /usr/include/xcb/glx.h:8474
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_queryiv_arb";

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

   function xcb_glx_get_queryiv_arb_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      target : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_queryiv_arb_cookie_t  -- /usr/include/xcb/glx.h:8491
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_queryiv_arb_unchecked";

   function xcb_glx_get_queryiv_arb_data (R : access constant xcb_glx_get_queryiv_arb_reply_t) return access bits_stdint_intn_h.int32_t  -- /usr/include/xcb/glx.h:8497
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_queryiv_arb_data";

   function xcb_glx_get_queryiv_arb_data_length (R : access constant xcb_glx_get_queryiv_arb_reply_t) return int  -- /usr/include/xcb/glx.h:8500
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_queryiv_arb_data_length";

   function xcb_glx_get_queryiv_arb_data_end (R : access constant xcb_glx_get_queryiv_arb_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:8503
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_queryiv_arb_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_queryiv_arb_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_queryiv_arb_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_queryiv_arb_cookie_t;
      e : System.Address) return access xcb_glx_get_queryiv_arb_reply_t  -- /usr/include/xcb/glx.h:8520
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_queryiv_arb_reply";

  --*<  
   function xcb_glx_get_query_objectiv_arb_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:8525
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_query_objectiv_arb_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_query_objectiv_arb
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      id : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_query_objectiv_arb_cookie_t  -- /usr/include/xcb/glx.h:8536
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_query_objectiv_arb";

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

   function xcb_glx_get_query_objectiv_arb_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      id : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_query_objectiv_arb_cookie_t  -- /usr/include/xcb/glx.h:8553
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_query_objectiv_arb_unchecked";

   function xcb_glx_get_query_objectiv_arb_data (R : access constant xcb_glx_get_query_objectiv_arb_reply_t) return access bits_stdint_intn_h.int32_t  -- /usr/include/xcb/glx.h:8559
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_query_objectiv_arb_data";

   function xcb_glx_get_query_objectiv_arb_data_length (R : access constant xcb_glx_get_query_objectiv_arb_reply_t) return int  -- /usr/include/xcb/glx.h:8562
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_query_objectiv_arb_data_length";

   function xcb_glx_get_query_objectiv_arb_data_end (R : access constant xcb_glx_get_query_objectiv_arb_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:8565
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_query_objectiv_arb_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_query_objectiv_arb_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_query_objectiv_arb_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_query_objectiv_arb_cookie_t;
      e : System.Address) return access xcb_glx_get_query_objectiv_arb_reply_t  -- /usr/include/xcb/glx.h:8582
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_query_objectiv_arb_reply";

  --*<  
   function xcb_glx_get_query_objectuiv_arb_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/glx.h:8587
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_query_objectuiv_arb_sizeof";

  --*
  -- *
  -- * @param c The connection
  -- * @return A cookie
  -- *
  -- * Delivers a request to the X server.
  -- *
  --  

   function xcb_glx_get_query_objectuiv_arb
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      id : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_query_objectuiv_arb_cookie_t  -- /usr/include/xcb/glx.h:8598
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_query_objectuiv_arb";

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

   function xcb_glx_get_query_objectuiv_arb_unchecked
     (c : access xcb.xcb_connection_t;
      context_tag : xcb_glx_context_tag_t;
      id : bits_stdint_uintn_h.uint32_t;
      pname : bits_stdint_uintn_h.uint32_t) return xcb_glx_get_query_objectuiv_arb_cookie_t  -- /usr/include/xcb/glx.h:8615
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_query_objectuiv_arb_unchecked";

   function xcb_glx_get_query_objectuiv_arb_data (R : access constant xcb_glx_get_query_objectuiv_arb_reply_t) return access bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/glx.h:8621
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_query_objectuiv_arb_data";

   function xcb_glx_get_query_objectuiv_arb_data_length (R : access constant xcb_glx_get_query_objectuiv_arb_reply_t) return int  -- /usr/include/xcb/glx.h:8624
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_query_objectuiv_arb_data_length";

   function xcb_glx_get_query_objectuiv_arb_data_end (R : access constant xcb_glx_get_query_objectuiv_arb_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/glx.h:8627
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_query_objectuiv_arb_data_end";

  --*
  -- * Return the reply
  -- * @param c      The connection
  -- * @param cookie The cookie
  -- * @param e      The xcb_generic_error_t supplied
  -- *
  -- * Returns the reply of the request asked by
  -- *
  -- * The parameter @p e supplied to this function must be NULL if
  -- * xcb_glx_get_query_objectuiv_arb_unchecked(). is used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * The returned value must be freed by the caller using free().
  --  

   function xcb_glx_get_query_objectuiv_arb_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_glx_get_query_objectuiv_arb_cookie_t;
      e : System.Address) return access xcb_glx_get_query_objectuiv_arb_reply_t  -- /usr/include/xcb/glx.h:8644
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_glx_get_query_objectuiv_arb_reply";

  --*<  
  --*
  -- * @}
  --  

end xcb_glx;
