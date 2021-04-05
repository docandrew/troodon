pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with xcb;
with bits_stdint_uintn_h;
with bits_stdint_intn_h;
with xproto;
with System;
with Interfaces.C.Strings;

package xcb_render is

   CONST_XCB_RENDER_MAJOR_VERSION : constant := 0;  --  /usr/include/xcb/render.h:22
   CONST_XCB_RENDER_MINOR_VERSION : constant := 11;  --  /usr/include/xcb/render.h:23

   CONST_XCB_RENDER_PICT_FORMAT : constant := 0;  --  /usr/include/xcb/render.h:190

   CONST_XCB_RENDER_PICTURE : constant := 1;  --  /usr/include/xcb/render.h:202

   CONST_XCB_RENDER_PICT_OP : constant := 2;  --  /usr/include/xcb/render.h:214

   CONST_XCB_RENDER_GLYPH_SET : constant := 3;  --  /usr/include/xcb/render.h:226

   CONST_XCB_RENDER_GLYPH : constant := 4;  --  /usr/include/xcb/render.h:238

   CONST_XCB_RENDER_QUERY_VERSION : constant := 0;  --  /usr/include/xcb/render.h:485

   CONST_XCB_RENDER_QUERY_PICT_FORMATS : constant := 1;  --  /usr/include/xcb/render.h:519

   CONST_XCB_RENDER_QUERY_PICT_INDEX_VALUES : constant := 2;  --  /usr/include/xcb/render.h:554

   CONST_XCB_RENDER_CREATE_PICTURE : constant := 4;  --  /usr/include/xcb/render.h:598

   CONST_XCB_RENDER_CHANGE_PICTURE : constant := 5;  --  /usr/include/xcb/render.h:633

   CONST_XCB_RENDER_SET_PICTURE_CLIP_RECTANGLES : constant := 6;  --  /usr/include/xcb/render.h:647

   CONST_XCB_RENDER_FREE_PICTURE : constant := 7;  --  /usr/include/xcb/render.h:662

   CONST_XCB_RENDER_COMPOSITE : constant := 8;  --  /usr/include/xcb/render.h:675

   CONST_XCB_RENDER_TRAPEZOIDS : constant := 10;  --  /usr/include/xcb/render.h:700

   CONST_XCB_RENDER_TRIANGLES : constant := 11;  --  /usr/include/xcb/render.h:719

   CONST_XCB_RENDER_TRI_STRIP : constant := 12;  --  /usr/include/xcb/render.h:738

   CONST_XCB_RENDER_TRI_FAN : constant := 13;  --  /usr/include/xcb/render.h:757

   CONST_XCB_RENDER_CREATE_GLYPH_SET : constant := 17;  --  /usr/include/xcb/render.h:776

   CONST_XCB_RENDER_REFERENCE_GLYPH_SET : constant := 18;  --  /usr/include/xcb/render.h:790

   CONST_XCB_RENDER_FREE_GLYPH_SET : constant := 19;  --  /usr/include/xcb/render.h:804

   CONST_XCB_RENDER_ADD_GLYPHS : constant := 20;  --  /usr/include/xcb/render.h:817

   CONST_XCB_RENDER_FREE_GLYPHS : constant := 22;  --  /usr/include/xcb/render.h:831

   CONST_XCB_RENDER_COMPOSITE_GLYPHS_8 : constant := 23;  --  /usr/include/xcb/render.h:844

   CONST_XCB_RENDER_COMPOSITE_GLYPHS_16 : constant := 24;  --  /usr/include/xcb/render.h:864

   CONST_XCB_RENDER_COMPOSITE_GLYPHS_32 : constant := 25;  --  /usr/include/xcb/render.h:884

   CONST_XCB_RENDER_FILL_RECTANGLES : constant := 26;  --  /usr/include/xcb/render.h:904

   CONST_XCB_RENDER_CREATE_CURSOR : constant := 27;  --  /usr/include/xcb/render.h:920

   CONST_XCB_RENDER_SET_PICTURE_TRANSFORM : constant := 28;  --  /usr/include/xcb/render.h:960

   CONST_XCB_RENDER_QUERY_FILTERS : constant := 29;  --  /usr/include/xcb/render.h:981

   CONST_XCB_RENDER_SET_PICTURE_FILTER : constant := 30;  --  /usr/include/xcb/render.h:1007

   CONST_XCB_RENDER_CREATE_ANIM_CURSOR : constant := 31;  --  /usr/include/xcb/render.h:1039

   CONST_XCB_RENDER_ADD_TRAPS : constant := 32;  --  /usr/include/xcb/render.h:1087

   CONST_XCB_RENDER_CREATE_SOLID_FILL : constant := 33;  --  /usr/include/xcb/render.h:1102

   CONST_XCB_RENDER_CREATE_LINEAR_GRADIENT : constant := 34;  --  /usr/include/xcb/render.h:1116

   CONST_XCB_RENDER_CREATE_RADIAL_GRADIENT : constant := 35;  --  /usr/include/xcb/render.h:1132

   CONST_XCB_RENDER_CREATE_CONICAL_GRADIENT : constant := 36;  --  /usr/include/xcb/render.h:1150

   xcb_render_id : aliased xcb.xcb_extension_t  -- /usr/include/xcb/render.h:25
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_id";

   type xcb_render_pict_type_t is 
     (XCB_RENDER_PICT_TYPE_INDEXED,
      XCB_RENDER_PICT_TYPE_DIRECT)
   with Convention => C;  -- /usr/include/xcb/render.h:27

   type xcb_render_picture_enum_t is 
     (XCB_RENDER_PICTURE_NONE)
   with Convention => C;  -- /usr/include/xcb/render.h:32

   subtype xcb_render_pict_op_t is unsigned;
   XCB_RENDER_PICT_OP_CLEAR : constant unsigned := 0;
   XCB_RENDER_PICT_OP_SRC : constant unsigned := 1;
   XCB_RENDER_PICT_OP_DST : constant unsigned := 2;
   XCB_RENDER_PICT_OP_OVER : constant unsigned := 3;
   XCB_RENDER_PICT_OP_OVER_REVERSE : constant unsigned := 4;
   XCB_RENDER_PICT_OP_IN : constant unsigned := 5;
   XCB_RENDER_PICT_OP_IN_REVERSE : constant unsigned := 6;
   XCB_RENDER_PICT_OP_OUT : constant unsigned := 7;
   XCB_RENDER_PICT_OP_OUT_REVERSE : constant unsigned := 8;
   XCB_RENDER_PICT_OP_ATOP : constant unsigned := 9;
   XCB_RENDER_PICT_OP_ATOP_REVERSE : constant unsigned := 10;
   XCB_RENDER_PICT_OP_XOR : constant unsigned := 11;
   XCB_RENDER_PICT_OP_ADD : constant unsigned := 12;
   XCB_RENDER_PICT_OP_SATURATE : constant unsigned := 13;
   XCB_RENDER_PICT_OP_DISJOINT_CLEAR : constant unsigned := 16;
   XCB_RENDER_PICT_OP_DISJOINT_SRC : constant unsigned := 17;
   XCB_RENDER_PICT_OP_DISJOINT_DST : constant unsigned := 18;
   XCB_RENDER_PICT_OP_DISJOINT_OVER : constant unsigned := 19;
   XCB_RENDER_PICT_OP_DISJOINT_OVER_REVERSE : constant unsigned := 20;
   XCB_RENDER_PICT_OP_DISJOINT_IN : constant unsigned := 21;
   XCB_RENDER_PICT_OP_DISJOINT_IN_REVERSE : constant unsigned := 22;
   XCB_RENDER_PICT_OP_DISJOINT_OUT : constant unsigned := 23;
   XCB_RENDER_PICT_OP_DISJOINT_OUT_REVERSE : constant unsigned := 24;
   XCB_RENDER_PICT_OP_DISJOINT_ATOP : constant unsigned := 25;
   XCB_RENDER_PICT_OP_DISJOINT_ATOP_REVERSE : constant unsigned := 26;
   XCB_RENDER_PICT_OP_DISJOINT_XOR : constant unsigned := 27;
   XCB_RENDER_PICT_OP_CONJOINT_CLEAR : constant unsigned := 32;
   XCB_RENDER_PICT_OP_CONJOINT_SRC : constant unsigned := 33;
   XCB_RENDER_PICT_OP_CONJOINT_DST : constant unsigned := 34;
   XCB_RENDER_PICT_OP_CONJOINT_OVER : constant unsigned := 35;
   XCB_RENDER_PICT_OP_CONJOINT_OVER_REVERSE : constant unsigned := 36;
   XCB_RENDER_PICT_OP_CONJOINT_IN : constant unsigned := 37;
   XCB_RENDER_PICT_OP_CONJOINT_IN_REVERSE : constant unsigned := 38;
   XCB_RENDER_PICT_OP_CONJOINT_OUT : constant unsigned := 39;
   XCB_RENDER_PICT_OP_CONJOINT_OUT_REVERSE : constant unsigned := 40;
   XCB_RENDER_PICT_OP_CONJOINT_ATOP : constant unsigned := 41;
   XCB_RENDER_PICT_OP_CONJOINT_ATOP_REVERSE : constant unsigned := 42;
   XCB_RENDER_PICT_OP_CONJOINT_XOR : constant unsigned := 43;
   XCB_RENDER_PICT_OP_MULTIPLY : constant unsigned := 48;
   XCB_RENDER_PICT_OP_SCREEN : constant unsigned := 49;
   XCB_RENDER_PICT_OP_OVERLAY : constant unsigned := 50;
   XCB_RENDER_PICT_OP_DARKEN : constant unsigned := 51;
   XCB_RENDER_PICT_OP_LIGHTEN : constant unsigned := 52;
   XCB_RENDER_PICT_OP_COLOR_DODGE : constant unsigned := 53;
   XCB_RENDER_PICT_OP_COLOR_BURN : constant unsigned := 54;
   XCB_RENDER_PICT_OP_HARD_LIGHT : constant unsigned := 55;
   XCB_RENDER_PICT_OP_SOFT_LIGHT : constant unsigned := 56;
   XCB_RENDER_PICT_OP_DIFFERENCE : constant unsigned := 57;
   XCB_RENDER_PICT_OP_EXCLUSION : constant unsigned := 58;
   XCB_RENDER_PICT_OP_HSL_HUE : constant unsigned := 59;
   XCB_RENDER_PICT_OP_HSL_SATURATION : constant unsigned := 60;
   XCB_RENDER_PICT_OP_HSL_COLOR : constant unsigned := 61;
   XCB_RENDER_PICT_OP_HSL_LUMINOSITY : constant unsigned := 62;  -- /usr/include/xcb/render.h:36

   type xcb_render_poly_edge_t is 
     (XCB_RENDER_POLY_EDGE_SHARP,
      XCB_RENDER_POLY_EDGE_SMOOTH)
   with Convention => C;  -- /usr/include/xcb/render.h:92

   type xcb_render_poly_mode_t is 
     (XCB_RENDER_POLY_MODE_PRECISE,
      XCB_RENDER_POLY_MODE_IMPRECISE)
   with Convention => C;  -- /usr/include/xcb/render.h:97

   subtype xcb_render_cp_t is unsigned;
   XCB_RENDER_CP_REPEAT : constant unsigned := 1;
   XCB_RENDER_CP_ALPHA_MAP : constant unsigned := 2;
   XCB_RENDER_CP_ALPHA_X_ORIGIN : constant unsigned := 4;
   XCB_RENDER_CP_ALPHA_Y_ORIGIN : constant unsigned := 8;
   XCB_RENDER_CP_CLIP_X_ORIGIN : constant unsigned := 16;
   XCB_RENDER_CP_CLIP_Y_ORIGIN : constant unsigned := 32;
   XCB_RENDER_CP_CLIP_MASK : constant unsigned := 64;
   XCB_RENDER_CP_GRAPHICS_EXPOSURE : constant unsigned := 128;
   XCB_RENDER_CP_SUBWINDOW_MODE : constant unsigned := 256;
   XCB_RENDER_CP_POLY_EDGE : constant unsigned := 512;
   XCB_RENDER_CP_POLY_MODE : constant unsigned := 1024;
   XCB_RENDER_CP_DITHER : constant unsigned := 2048;
   XCB_RENDER_CP_COMPONENT_ALPHA : constant unsigned := 4096;  -- /usr/include/xcb/render.h:102

   type xcb_render_sub_pixel_t is 
     (XCB_RENDER_SUB_PIXEL_UNKNOWN,
      XCB_RENDER_SUB_PIXEL_HORIZONTAL_RGB,
      XCB_RENDER_SUB_PIXEL_HORIZONTAL_BGR,
      XCB_RENDER_SUB_PIXEL_VERTICAL_RGB,
      XCB_RENDER_SUB_PIXEL_VERTICAL_BGR,
      XCB_RENDER_SUB_PIXEL_NONE)
   with Convention => C;  -- /usr/include/xcb/render.h:118

   type xcb_render_repeat_t is 
     (XCB_RENDER_REPEAT_NONE,
      XCB_RENDER_REPEAT_NORMAL,
      XCB_RENDER_REPEAT_PAD,
      XCB_RENDER_REPEAT_REFLECT)
   with Convention => C;  -- /usr/include/xcb/render.h:127

   subtype xcb_render_glyph_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:134

   type xcb_render_glyph_iterator_t is record
      data : access xcb_render_glyph_t;  -- /usr/include/xcb/render.h:140
      c_rem : aliased int;  -- /usr/include/xcb/render.h:141
      index : aliased int;  -- /usr/include/xcb/render.h:142
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:139

   subtype xcb_render_glyphset_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:145

   type xcb_render_glyphset_iterator_t is record
      data : access xcb_render_glyphset_t;  -- /usr/include/xcb/render.h:151
      c_rem : aliased int;  -- /usr/include/xcb/render.h:152
      index : aliased int;  -- /usr/include/xcb/render.h:153
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:150

   subtype xcb_render_picture_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:156

   type xcb_render_picture_iterator_t is record
      data : access xcb_render_picture_t;  -- /usr/include/xcb/render.h:162
      c_rem : aliased int;  -- /usr/include/xcb/render.h:163
      index : aliased int;  -- /usr/include/xcb/render.h:164
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:161

   subtype xcb_render_pictformat_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:167

   type xcb_render_pictformat_iterator_t is record
      data : access xcb_render_pictformat_t;  -- /usr/include/xcb/render.h:173
      c_rem : aliased int;  -- /usr/include/xcb/render.h:174
      index : aliased int;  -- /usr/include/xcb/render.h:175
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:172

   subtype xcb_render_fixed_t is bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/render.h:178

   type xcb_render_fixed_iterator_t is record
      data : access xcb_render_fixed_t;  -- /usr/include/xcb/render.h:184
      c_rem : aliased int;  -- /usr/include/xcb/render.h:185
      index : aliased int;  -- /usr/include/xcb/render.h:186
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:183

   type xcb_render_pict_format_error_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:196
      error_code : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:197
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:198
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:195

   type xcb_render_picture_error_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:208
      error_code : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:209
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:210
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:207

   type xcb_render_pict_op_error_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:220
      error_code : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:221
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:222
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:219

   type xcb_render_glyph_set_error_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:232
      error_code : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:233
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:234
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:231

   type xcb_render_glyph_error_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:244
      error_code : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:245
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:246
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:243

   type xcb_render_directformat_t is record
      red_shift : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:253
      red_mask : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:254
      green_shift : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:255
      green_mask : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:256
      blue_shift : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:257
      blue_mask : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:258
      alpha_shift : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:259
      alpha_mask : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:260
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:252

   type xcb_render_directformat_iterator_t is record
      data : access xcb_render_directformat_t;  -- /usr/include/xcb/render.h:267
      c_rem : aliased int;  -- /usr/include/xcb/render.h:268
      index : aliased int;  -- /usr/include/xcb/render.h:269
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:266

   type xcb_render_pictforminfo_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_render_pictforminfo_t is record
      id : aliased xcb_render_pictformat_t;  -- /usr/include/xcb/render.h:276
      c_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:277
      depth : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:278
      pad0 : aliased xcb_render_pictforminfo_t_array1823;  -- /usr/include/xcb/render.h:279
      direct : aliased xcb_render_directformat_t;  -- /usr/include/xcb/render.h:280
      colormap : aliased xproto.xcb_colormap_t;  -- /usr/include/xcb/render.h:281
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:275

   type xcb_render_pictforminfo_iterator_t is record
      data : access xcb_render_pictforminfo_t;  -- /usr/include/xcb/render.h:288
      c_rem : aliased int;  -- /usr/include/xcb/render.h:289
      index : aliased int;  -- /usr/include/xcb/render.h:290
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:287

   type xcb_render_pictvisual_t is record
      visual : aliased xproto.xcb_visualid_t;  -- /usr/include/xcb/render.h:297
      format : aliased xcb_render_pictformat_t;  -- /usr/include/xcb/render.h:298
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:296

   type xcb_render_pictvisual_iterator_t is record
      data : access xcb_render_pictvisual_t;  -- /usr/include/xcb/render.h:305
      c_rem : aliased int;  -- /usr/include/xcb/render.h:306
      index : aliased int;  -- /usr/include/xcb/render.h:307
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:304

   type xcb_render_pictdepth_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_render_pictdepth_t is record
      depth : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:314
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:315
      num_visuals : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:316
      pad1 : aliased xcb_render_pictdepth_t_array1791;  -- /usr/include/xcb/render.h:317
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:313

   type xcb_render_pictdepth_iterator_t is record
      data : access xcb_render_pictdepth_t;  -- /usr/include/xcb/render.h:324
      c_rem : aliased int;  -- /usr/include/xcb/render.h:325
      index : aliased int;  -- /usr/include/xcb/render.h:326
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:323

   type xcb_render_pictscreen_t is record
      num_depths : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:333
      fallback : aliased xcb_render_pictformat_t;  -- /usr/include/xcb/render.h:334
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:332

   type xcb_render_pictscreen_iterator_t is record
      data : access xcb_render_pictscreen_t;  -- /usr/include/xcb/render.h:341
      c_rem : aliased int;  -- /usr/include/xcb/render.h:342
      index : aliased int;  -- /usr/include/xcb/render.h:343
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:340

   type xcb_render_indexvalue_t is record
      pixel : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:350
      red : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:351
      green : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:352
      blue : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:353
      alpha : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:354
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:349

   type xcb_render_indexvalue_iterator_t is record
      data : access xcb_render_indexvalue_t;  -- /usr/include/xcb/render.h:361
      c_rem : aliased int;  -- /usr/include/xcb/render.h:362
      index : aliased int;  -- /usr/include/xcb/render.h:363
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:360

   type xcb_render_color_t is record
      red : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:370
      green : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:371
      blue : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:372
      alpha : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:373
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:369

   type xcb_render_color_iterator_t is record
      data : access xcb_render_color_t;  -- /usr/include/xcb/render.h:380
      c_rem : aliased int;  -- /usr/include/xcb/render.h:381
      index : aliased int;  -- /usr/include/xcb/render.h:382
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:379

   type xcb_render_pointfix_t is record
      x : aliased xcb_render_fixed_t;  -- /usr/include/xcb/render.h:389
      y : aliased xcb_render_fixed_t;  -- /usr/include/xcb/render.h:390
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:388

   type xcb_render_pointfix_iterator_t is record
      data : access xcb_render_pointfix_t;  -- /usr/include/xcb/render.h:397
      c_rem : aliased int;  -- /usr/include/xcb/render.h:398
      index : aliased int;  -- /usr/include/xcb/render.h:399
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:396

   type xcb_render_linefix_t is record
      p1 : aliased xcb_render_pointfix_t;  -- /usr/include/xcb/render.h:406
      p2 : aliased xcb_render_pointfix_t;  -- /usr/include/xcb/render.h:407
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:405

   type xcb_render_linefix_iterator_t is record
      data : access xcb_render_linefix_t;  -- /usr/include/xcb/render.h:414
      c_rem : aliased int;  -- /usr/include/xcb/render.h:415
      index : aliased int;  -- /usr/include/xcb/render.h:416
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:413

   type xcb_render_triangle_t is record
      p1 : aliased xcb_render_pointfix_t;  -- /usr/include/xcb/render.h:423
      p2 : aliased xcb_render_pointfix_t;  -- /usr/include/xcb/render.h:424
      p3 : aliased xcb_render_pointfix_t;  -- /usr/include/xcb/render.h:425
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:422

   type xcb_render_triangle_iterator_t is record
      data : access xcb_render_triangle_t;  -- /usr/include/xcb/render.h:432
      c_rem : aliased int;  -- /usr/include/xcb/render.h:433
      index : aliased int;  -- /usr/include/xcb/render.h:434
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:431

   type xcb_render_trapezoid_t is record
      top : aliased xcb_render_fixed_t;  -- /usr/include/xcb/render.h:441
      bottom : aliased xcb_render_fixed_t;  -- /usr/include/xcb/render.h:442
      left : aliased xcb_render_linefix_t;  -- /usr/include/xcb/render.h:443
      right : aliased xcb_render_linefix_t;  -- /usr/include/xcb/render.h:444
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:440

   type xcb_render_trapezoid_iterator_t is record
      data : access xcb_render_trapezoid_t;  -- /usr/include/xcb/render.h:451
      c_rem : aliased int;  -- /usr/include/xcb/render.h:452
      index : aliased int;  -- /usr/include/xcb/render.h:453
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:450

   type xcb_render_glyphinfo_t is record
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:460
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:461
      x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/render.h:462
      y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/render.h:463
      x_off : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/render.h:464
      y_off : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/render.h:465
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:459

   type xcb_render_glyphinfo_iterator_t is record
      data : access xcb_render_glyphinfo_t;  -- /usr/include/xcb/render.h:472
      c_rem : aliased int;  -- /usr/include/xcb/render.h:473
      index : aliased int;  -- /usr/include/xcb/render.h:474
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:471

   type xcb_render_query_version_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/render.h:481
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:480

   type xcb_render_query_version_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:491
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:492
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:493
      client_major_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:494
      client_minor_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:495
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:490

   type xcb_render_query_version_reply_t_array4353 is array (0 .. 15) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_render_query_version_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:502
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:503
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:504
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:505
      major_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:506
      minor_version : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:507
      pad1 : aliased xcb_render_query_version_reply_t_array4353;  -- /usr/include/xcb/render.h:508
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:501

   type xcb_render_query_pict_formats_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/render.h:515
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:514

   type xcb_render_query_pict_formats_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:525
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:526
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:527
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:524

   type xcb_render_query_pict_formats_reply_t_array1791 is array (0 .. 3) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_render_query_pict_formats_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:534
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:535
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:536
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:537
      num_formats : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:538
      num_screens : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:539
      num_depths : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:540
      num_visuals : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:541
      num_subpixel : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:542
      pad1 : aliased xcb_render_query_pict_formats_reply_t_array1791;  -- /usr/include/xcb/render.h:543
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:533

   type xcb_render_query_pict_index_values_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/render.h:550
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:549

   type xcb_render_query_pict_index_values_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:560
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:561
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:562
      format : aliased xcb_render_pictformat_t;  -- /usr/include/xcb/render.h:563
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:559

   type xcb_render_query_pict_index_values_reply_t_array1992 is array (0 .. 19) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_render_query_pict_index_values_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:570
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:571
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:572
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:573
      num_values : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:574
      pad1 : aliased xcb_render_query_pict_index_values_reply_t_array1992;  -- /usr/include/xcb/render.h:575
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:569

   type xcb_render_create_picture_value_list_t is record
      repeat : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:582
      alphamap : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:583
      alphaxorigin : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/render.h:584
      alphayorigin : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/render.h:585
      clipxorigin : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/render.h:586
      clipyorigin : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/render.h:587
      clipmask : aliased xproto.xcb_pixmap_t;  -- /usr/include/xcb/render.h:588
      graphicsexposure : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:589
      subwindowmode : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:590
      polyedge : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:591
      polymode : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:592
      dither : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/render.h:593
      componentalpha : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:594
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:581

   type xcb_render_create_picture_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:604
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:605
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:606
      pid : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:607
      drawable : aliased xproto.xcb_drawable_t;  -- /usr/include/xcb/render.h:608
      format : aliased xcb_render_pictformat_t;  -- /usr/include/xcb/render.h:609
      value_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:610
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:603

   type xcb_render_change_picture_value_list_t is record
      repeat : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:617
      alphamap : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:618
      alphaxorigin : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/render.h:619
      alphayorigin : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/render.h:620
      clipxorigin : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/render.h:621
      clipyorigin : aliased bits_stdint_intn_h.int32_t;  -- /usr/include/xcb/render.h:622
      clipmask : aliased xproto.xcb_pixmap_t;  -- /usr/include/xcb/render.h:623
      graphicsexposure : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:624
      subwindowmode : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:625
      polyedge : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:626
      polymode : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:627
      dither : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/render.h:628
      componentalpha : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:629
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:616

   type xcb_render_change_picture_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:639
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:640
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:641
      picture : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:642
      value_mask : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:643
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:638

   type xcb_render_set_picture_clip_rectangles_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:653
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:654
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:655
      picture : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:656
      clip_x_origin : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/render.h:657
      clip_y_origin : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/render.h:658
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:652

   type xcb_render_free_picture_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:668
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:669
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:670
      picture : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:671
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:667

   type xcb_render_composite_request_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_render_composite_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:681
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:682
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:683
      op : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:684
      pad0 : aliased xcb_render_composite_request_t_array1897;  -- /usr/include/xcb/render.h:685
      src : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:686
      mask : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:687
      dst : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:688
      src_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/render.h:689
      src_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/render.h:690
      mask_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/render.h:691
      mask_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/render.h:692
      dst_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/render.h:693
      dst_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/render.h:694
      width : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:695
      height : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:696
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:680

   type xcb_render_trapezoids_request_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_render_trapezoids_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:706
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:707
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:708
      op : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:709
      pad0 : aliased xcb_render_trapezoids_request_t_array1897;  -- /usr/include/xcb/render.h:710
      src : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:711
      dst : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:712
      mask_format : aliased xcb_render_pictformat_t;  -- /usr/include/xcb/render.h:713
      src_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/render.h:714
      src_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/render.h:715
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:705

   type xcb_render_triangles_request_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_render_triangles_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:725
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:726
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:727
      op : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:728
      pad0 : aliased xcb_render_triangles_request_t_array1897;  -- /usr/include/xcb/render.h:729
      src : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:730
      dst : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:731
      mask_format : aliased xcb_render_pictformat_t;  -- /usr/include/xcb/render.h:732
      src_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/render.h:733
      src_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/render.h:734
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:724

   type xcb_render_tri_strip_request_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_render_tri_strip_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:744
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:745
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:746
      op : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:747
      pad0 : aliased xcb_render_tri_strip_request_t_array1897;  -- /usr/include/xcb/render.h:748
      src : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:749
      dst : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:750
      mask_format : aliased xcb_render_pictformat_t;  -- /usr/include/xcb/render.h:751
      src_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/render.h:752
      src_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/render.h:753
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:743

   type xcb_render_tri_fan_request_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_render_tri_fan_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:763
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:764
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:765
      op : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:766
      pad0 : aliased xcb_render_tri_fan_request_t_array1897;  -- /usr/include/xcb/render.h:767
      src : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:768
      dst : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:769
      mask_format : aliased xcb_render_pictformat_t;  -- /usr/include/xcb/render.h:770
      src_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/render.h:771
      src_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/render.h:772
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:762

   type xcb_render_create_glyph_set_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:782
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:783
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:784
      gsid : aliased xcb_render_glyphset_t;  -- /usr/include/xcb/render.h:785
      format : aliased xcb_render_pictformat_t;  -- /usr/include/xcb/render.h:786
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:781

   type xcb_render_reference_glyph_set_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:796
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:797
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:798
      gsid : aliased xcb_render_glyphset_t;  -- /usr/include/xcb/render.h:799
      existing : aliased xcb_render_glyphset_t;  -- /usr/include/xcb/render.h:800
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:795

   type xcb_render_free_glyph_set_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:810
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:811
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:812
      glyphset : aliased xcb_render_glyphset_t;  -- /usr/include/xcb/render.h:813
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:809

   type xcb_render_add_glyphs_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:823
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:824
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:825
      glyphset : aliased xcb_render_glyphset_t;  -- /usr/include/xcb/render.h:826
      glyphs_len : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:827
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:822

   type xcb_render_free_glyphs_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:837
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:838
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:839
      glyphset : aliased xcb_render_glyphset_t;  -- /usr/include/xcb/render.h:840
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:836

   type xcb_render_composite_glyphs_8_request_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_render_composite_glyphs_8_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:850
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:851
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:852
      op : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:853
      pad0 : aliased xcb_render_composite_glyphs_8_request_t_array1897;  -- /usr/include/xcb/render.h:854
      src : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:855
      dst : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:856
      mask_format : aliased xcb_render_pictformat_t;  -- /usr/include/xcb/render.h:857
      glyphset : aliased xcb_render_glyphset_t;  -- /usr/include/xcb/render.h:858
      src_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/render.h:859
      src_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/render.h:860
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:849

   type xcb_render_composite_glyphs_16_request_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_render_composite_glyphs_16_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:870
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:871
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:872
      op : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:873
      pad0 : aliased xcb_render_composite_glyphs_16_request_t_array1897;  -- /usr/include/xcb/render.h:874
      src : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:875
      dst : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:876
      mask_format : aliased xcb_render_pictformat_t;  -- /usr/include/xcb/render.h:877
      glyphset : aliased xcb_render_glyphset_t;  -- /usr/include/xcb/render.h:878
      src_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/render.h:879
      src_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/render.h:880
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:869

   type xcb_render_composite_glyphs_32_request_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_render_composite_glyphs_32_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:890
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:891
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:892
      op : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:893
      pad0 : aliased xcb_render_composite_glyphs_32_request_t_array1897;  -- /usr/include/xcb/render.h:894
      src : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:895
      dst : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:896
      mask_format : aliased xcb_render_pictformat_t;  -- /usr/include/xcb/render.h:897
      glyphset : aliased xcb_render_glyphset_t;  -- /usr/include/xcb/render.h:898
      src_x : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/render.h:899
      src_y : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/render.h:900
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:889

   type xcb_render_fill_rectangles_request_t_array1897 is array (0 .. 2) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_render_fill_rectangles_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:910
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:911
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:912
      op : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:913
      pad0 : aliased xcb_render_fill_rectangles_request_t_array1897;  -- /usr/include/xcb/render.h:914
      dst : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:915
      color : aliased xcb_render_color_t;  -- /usr/include/xcb/render.h:916
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:909

   type xcb_render_create_cursor_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:926
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:927
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:928
      cid : aliased xproto.xcb_cursor_t;  -- /usr/include/xcb/render.h:929
      source : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:930
      x : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:931
      y : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:932
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:925

   type xcb_render_transform_t is record
      matrix11 : aliased xcb_render_fixed_t;  -- /usr/include/xcb/render.h:939
      matrix12 : aliased xcb_render_fixed_t;  -- /usr/include/xcb/render.h:940
      matrix13 : aliased xcb_render_fixed_t;  -- /usr/include/xcb/render.h:941
      matrix21 : aliased xcb_render_fixed_t;  -- /usr/include/xcb/render.h:942
      matrix22 : aliased xcb_render_fixed_t;  -- /usr/include/xcb/render.h:943
      matrix23 : aliased xcb_render_fixed_t;  -- /usr/include/xcb/render.h:944
      matrix31 : aliased xcb_render_fixed_t;  -- /usr/include/xcb/render.h:945
      matrix32 : aliased xcb_render_fixed_t;  -- /usr/include/xcb/render.h:946
      matrix33 : aliased xcb_render_fixed_t;  -- /usr/include/xcb/render.h:947
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:938

   type xcb_render_transform_iterator_t is record
      data : access xcb_render_transform_t;  -- /usr/include/xcb/render.h:954
      c_rem : aliased int;  -- /usr/include/xcb/render.h:955
      index : aliased int;  -- /usr/include/xcb/render.h:956
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:953

   type xcb_render_set_picture_transform_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:966
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:967
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:968
      picture : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:969
      transform : aliased xcb_render_transform_t;  -- /usr/include/xcb/render.h:970
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:965

   type xcb_render_query_filters_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/render.h:977
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:976

   type xcb_render_query_filters_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:987
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:988
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:989
      drawable : aliased xproto.xcb_drawable_t;  -- /usr/include/xcb/render.h:990
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:986

   type xcb_render_query_filters_reply_t_array4353 is array (0 .. 15) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_render_query_filters_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:997
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:998
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:999
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:1000
      num_aliases : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:1001
      num_filters : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:1002
      pad1 : aliased xcb_render_query_filters_reply_t_array4353;  -- /usr/include/xcb/render.h:1003
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:996

   type xcb_render_set_picture_filter_request_t_array1823 is array (0 .. 1) of aliased bits_stdint_uintn_h.uint8_t;
   type xcb_render_set_picture_filter_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:1013
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:1014
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:1015
      picture : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:1016
      filter_len : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:1017
      pad0 : aliased xcb_render_set_picture_filter_request_t_array1823;  -- /usr/include/xcb/render.h:1018
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:1012

   type xcb_render_animcursorelt_t is record
      cursor : aliased xproto.xcb_cursor_t;  -- /usr/include/xcb/render.h:1025
      c_delay : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:1026
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:1024

   type xcb_render_animcursorelt_iterator_t is record
      data : access xcb_render_animcursorelt_t;  -- /usr/include/xcb/render.h:1033
      c_rem : aliased int;  -- /usr/include/xcb/render.h:1034
      index : aliased int;  -- /usr/include/xcb/render.h:1035
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:1032

   type xcb_render_create_anim_cursor_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:1045
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:1046
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:1047
      cid : aliased xproto.xcb_cursor_t;  -- /usr/include/xcb/render.h:1048
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:1044

   type xcb_render_spanfix_t is record
      l : aliased xcb_render_fixed_t;  -- /usr/include/xcb/render.h:1055
      r : aliased xcb_render_fixed_t;  -- /usr/include/xcb/render.h:1056
      y : aliased xcb_render_fixed_t;  -- /usr/include/xcb/render.h:1057
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:1054

   type xcb_render_spanfix_iterator_t is record
      data : access xcb_render_spanfix_t;  -- /usr/include/xcb/render.h:1064
      c_rem : aliased int;  -- /usr/include/xcb/render.h:1065
      index : aliased int;  -- /usr/include/xcb/render.h:1066
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:1063

   type xcb_render_trap_t is record
      top : aliased xcb_render_spanfix_t;  -- /usr/include/xcb/render.h:1073
      bot : aliased xcb_render_spanfix_t;  -- /usr/include/xcb/render.h:1074
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:1072

   type xcb_render_trap_iterator_t is record
      data : access xcb_render_trap_t;  -- /usr/include/xcb/render.h:1081
      c_rem : aliased int;  -- /usr/include/xcb/render.h:1082
      index : aliased int;  -- /usr/include/xcb/render.h:1083
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:1080

   type xcb_render_add_traps_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:1093
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:1094
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:1095
      picture : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:1096
      x_off : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/render.h:1097
      y_off : aliased bits_stdint_intn_h.int16_t;  -- /usr/include/xcb/render.h:1098
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:1092

   type xcb_render_create_solid_fill_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:1108
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:1109
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:1110
      picture : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:1111
      color : aliased xcb_render_color_t;  -- /usr/include/xcb/render.h:1112
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:1107

   type xcb_render_create_linear_gradient_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:1122
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:1123
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:1124
      picture : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:1125
      p1 : aliased xcb_render_pointfix_t;  -- /usr/include/xcb/render.h:1126
      p2 : aliased xcb_render_pointfix_t;  -- /usr/include/xcb/render.h:1127
      num_stops : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:1128
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:1121

   type xcb_render_create_radial_gradient_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:1138
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:1139
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:1140
      picture : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:1141
      inner : aliased xcb_render_pointfix_t;  -- /usr/include/xcb/render.h:1142
      outer : aliased xcb_render_pointfix_t;  -- /usr/include/xcb/render.h:1143
      inner_radius : aliased xcb_render_fixed_t;  -- /usr/include/xcb/render.h:1144
      outer_radius : aliased xcb_render_fixed_t;  -- /usr/include/xcb/render.h:1145
      num_stops : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:1146
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:1137

   type xcb_render_create_conical_gradient_request_t is record
      major_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:1156
      minor_opcode : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/render.h:1157
      length : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/render.h:1158
      picture : aliased xcb_render_picture_t;  -- /usr/include/xcb/render.h:1159
      center : aliased xcb_render_pointfix_t;  -- /usr/include/xcb/render.h:1160
      angle : aliased xcb_render_fixed_t;  -- /usr/include/xcb/render.h:1161
      num_stops : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/render.h:1162
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/render.h:1155

   procedure xcb_render_glyph_next (i : access xcb_render_glyph_iterator_t)  -- /usr/include/xcb/render.h:1174
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_glyph_next";

   function xcb_render_glyph_end (i : xcb_render_glyph_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:1186
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_glyph_end";

   procedure xcb_render_glyphset_next (i : access xcb_render_glyphset_iterator_t)  -- /usr/include/xcb/render.h:1197
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_glyphset_next";

   function xcb_render_glyphset_end (i : xcb_render_glyphset_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:1209
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_glyphset_end";

   procedure xcb_render_picture_next (i : access xcb_render_picture_iterator_t)  -- /usr/include/xcb/render.h:1220
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_picture_next";

   function xcb_render_picture_end (i : xcb_render_picture_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:1232
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_picture_end";

   procedure xcb_render_pictformat_next (i : access xcb_render_pictformat_iterator_t)  -- /usr/include/xcb/render.h:1243
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_pictformat_next";

   function xcb_render_pictformat_end (i : xcb_render_pictformat_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:1255
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_pictformat_end";

   procedure xcb_render_fixed_next (i : access xcb_render_fixed_iterator_t)  -- /usr/include/xcb/render.h:1266
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_fixed_next";

   function xcb_render_fixed_end (i : xcb_render_fixed_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:1278
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_fixed_end";

   procedure xcb_render_directformat_next (i : access xcb_render_directformat_iterator_t)  -- /usr/include/xcb/render.h:1289
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_directformat_next";

   function xcb_render_directformat_end (i : xcb_render_directformat_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:1301
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_directformat_end";

   procedure xcb_render_pictforminfo_next (i : access xcb_render_pictforminfo_iterator_t)  -- /usr/include/xcb/render.h:1312
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_pictforminfo_next";

   function xcb_render_pictforminfo_end (i : xcb_render_pictforminfo_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:1324
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_pictforminfo_end";

   procedure xcb_render_pictvisual_next (i : access xcb_render_pictvisual_iterator_t)  -- /usr/include/xcb/render.h:1335
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_pictvisual_next";

   function xcb_render_pictvisual_end (i : xcb_render_pictvisual_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:1347
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_pictvisual_end";

   function xcb_render_pictdepth_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/render.h:1350
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_pictdepth_sizeof";

   function xcb_render_pictdepth_visuals (R : access constant xcb_render_pictdepth_t) return access xcb_render_pictvisual_t  -- /usr/include/xcb/render.h:1353
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_pictdepth_visuals";

   function xcb_render_pictdepth_visuals_length (R : access constant xcb_render_pictdepth_t) return int  -- /usr/include/xcb/render.h:1356
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_pictdepth_visuals_length";

   function xcb_render_pictdepth_visuals_iterator (R : access constant xcb_render_pictdepth_t) return xcb_render_pictvisual_iterator_t  -- /usr/include/xcb/render.h:1359
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_pictdepth_visuals_iterator";

   procedure xcb_render_pictdepth_next (i : access xcb_render_pictdepth_iterator_t)  -- /usr/include/xcb/render.h:1370
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_pictdepth_next";

   function xcb_render_pictdepth_end (i : xcb_render_pictdepth_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:1382
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_pictdepth_end";

   function xcb_render_pictscreen_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/render.h:1385
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_pictscreen_sizeof";

   function xcb_render_pictscreen_depths_length (R : access constant xcb_render_pictscreen_t) return int  -- /usr/include/xcb/render.h:1388
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_pictscreen_depths_length";

   function xcb_render_pictscreen_depths_iterator (R : access constant xcb_render_pictscreen_t) return xcb_render_pictdepth_iterator_t  -- /usr/include/xcb/render.h:1391
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_pictscreen_depths_iterator";

   procedure xcb_render_pictscreen_next (i : access xcb_render_pictscreen_iterator_t)  -- /usr/include/xcb/render.h:1402
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_pictscreen_next";

   function xcb_render_pictscreen_end (i : xcb_render_pictscreen_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:1414
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_pictscreen_end";

   procedure xcb_render_indexvalue_next (i : access xcb_render_indexvalue_iterator_t)  -- /usr/include/xcb/render.h:1425
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_indexvalue_next";

   function xcb_render_indexvalue_end (i : xcb_render_indexvalue_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:1437
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_indexvalue_end";

   procedure xcb_render_color_next (i : access xcb_render_color_iterator_t)  -- /usr/include/xcb/render.h:1448
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_color_next";

   function xcb_render_color_end (i : xcb_render_color_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:1460
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_color_end";

   procedure xcb_render_pointfix_next (i : access xcb_render_pointfix_iterator_t)  -- /usr/include/xcb/render.h:1471
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_pointfix_next";

   function xcb_render_pointfix_end (i : xcb_render_pointfix_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:1483
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_pointfix_end";

   procedure xcb_render_linefix_next (i : access xcb_render_linefix_iterator_t)  -- /usr/include/xcb/render.h:1494
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_linefix_next";

   function xcb_render_linefix_end (i : xcb_render_linefix_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:1506
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_linefix_end";

   procedure xcb_render_triangle_next (i : access xcb_render_triangle_iterator_t)  -- /usr/include/xcb/render.h:1517
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_triangle_next";

   function xcb_render_triangle_end (i : xcb_render_triangle_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:1529
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_triangle_end";

   procedure xcb_render_trapezoid_next (i : access xcb_render_trapezoid_iterator_t)  -- /usr/include/xcb/render.h:1540
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_trapezoid_next";

   function xcb_render_trapezoid_end (i : xcb_render_trapezoid_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:1552
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_trapezoid_end";

   procedure xcb_render_glyphinfo_next (i : access xcb_render_glyphinfo_iterator_t)  -- /usr/include/xcb/render.h:1563
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_glyphinfo_next";

   function xcb_render_glyphinfo_end (i : xcb_render_glyphinfo_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:1575
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_glyphinfo_end";

   function xcb_render_query_version
     (c : access xcb.xcb_connection_t;
      client_major_version : bits_stdint_uintn_h.uint32_t;
      client_minor_version : bits_stdint_uintn_h.uint32_t) return xcb_render_query_version_cookie_t  -- /usr/include/xcb/render.h:1586
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_version";

   function xcb_render_query_version_unchecked
     (c : access xcb.xcb_connection_t;
      client_major_version : bits_stdint_uintn_h.uint32_t;
      client_minor_version : bits_stdint_uintn_h.uint32_t) return xcb_render_query_version_cookie_t  -- /usr/include/xcb/render.h:1602
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_version_unchecked";

   function xcb_render_query_version_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_render_query_version_cookie_t;
      e : System.Address) return access xcb_render_query_version_reply_t  -- /usr/include/xcb/render.h:1621
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_version_reply";

   function xcb_render_query_pict_formats_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/render.h:1626
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_pict_formats_sizeof";

   function xcb_render_query_pict_formats (c : access xcb.xcb_connection_t) return xcb_render_query_pict_formats_cookie_t  -- /usr/include/xcb/render.h:1637
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_pict_formats";

   function xcb_render_query_pict_formats_unchecked (c : access xcb.xcb_connection_t) return xcb_render_query_pict_formats_cookie_t  -- /usr/include/xcb/render.h:1651
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_pict_formats_unchecked";

   function xcb_render_query_pict_formats_formats (R : access constant xcb_render_query_pict_formats_reply_t) return access xcb_render_pictforminfo_t  -- /usr/include/xcb/render.h:1654
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_pict_formats_formats";

   function xcb_render_query_pict_formats_formats_length (R : access constant xcb_render_query_pict_formats_reply_t) return int  -- /usr/include/xcb/render.h:1657
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_pict_formats_formats_length";

   function xcb_render_query_pict_formats_formats_iterator (R : access constant xcb_render_query_pict_formats_reply_t) return xcb_render_pictforminfo_iterator_t  -- /usr/include/xcb/render.h:1660
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_pict_formats_formats_iterator";

   function xcb_render_query_pict_formats_screens_length (R : access constant xcb_render_query_pict_formats_reply_t) return int  -- /usr/include/xcb/render.h:1663
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_pict_formats_screens_length";

   function xcb_render_query_pict_formats_screens_iterator (R : access constant xcb_render_query_pict_formats_reply_t) return xcb_render_pictscreen_iterator_t  -- /usr/include/xcb/render.h:1666
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_pict_formats_screens_iterator";

   function xcb_render_query_pict_formats_subpixels (R : access constant xcb_render_query_pict_formats_reply_t) return access bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/render.h:1669
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_pict_formats_subpixels";

   function xcb_render_query_pict_formats_subpixels_length (R : access constant xcb_render_query_pict_formats_reply_t) return int  -- /usr/include/xcb/render.h:1672
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_pict_formats_subpixels_length";

   function xcb_render_query_pict_formats_subpixels_end (R : access constant xcb_render_query_pict_formats_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:1675
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_pict_formats_subpixels_end";

   function xcb_render_query_pict_formats_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_render_query_pict_formats_cookie_t;
      e : System.Address) return access xcb_render_query_pict_formats_reply_t  -- /usr/include/xcb/render.h:1692
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_pict_formats_reply";

   function xcb_render_query_pict_index_values_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/render.h:1697
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_pict_index_values_sizeof";

   function xcb_render_query_pict_index_values (c : access xcb.xcb_connection_t; format : xcb_render_pictformat_t) return xcb_render_query_pict_index_values_cookie_t  -- /usr/include/xcb/render.h:1708
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_pict_index_values";

   function xcb_render_query_pict_index_values_unchecked (c : access xcb.xcb_connection_t; format : xcb_render_pictformat_t) return xcb_render_query_pict_index_values_cookie_t  -- /usr/include/xcb/render.h:1723
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_pict_index_values_unchecked";

   function xcb_render_query_pict_index_values_values (R : access constant xcb_render_query_pict_index_values_reply_t) return access xcb_render_indexvalue_t  -- /usr/include/xcb/render.h:1727
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_pict_index_values_values";

   function xcb_render_query_pict_index_values_values_length (R : access constant xcb_render_query_pict_index_values_reply_t) return int  -- /usr/include/xcb/render.h:1730
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_pict_index_values_values_length";

   function xcb_render_query_pict_index_values_values_iterator (R : access constant xcb_render_query_pict_index_values_reply_t) return xcb_render_indexvalue_iterator_t  -- /usr/include/xcb/render.h:1733
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_pict_index_values_values_iterator";

   function xcb_render_query_pict_index_values_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_render_query_pict_index_values_cookie_t;
      e : System.Address) return access xcb_render_query_pict_index_values_reply_t  -- /usr/include/xcb/render.h:1750
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_pict_index_values_reply";

   function xcb_render_create_picture_value_list_serialize
     (u_buffer : System.Address;
      value_mask : bits_stdint_uintn_h.uint32_t;
      u_aux : access constant xcb_render_create_picture_value_list_t) return int  -- /usr/include/xcb/render.h:1755
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_picture_value_list_serialize";

   function xcb_render_create_picture_value_list_unpack
     (u_buffer : System.Address;
      value_mask : bits_stdint_uintn_h.uint32_t;
      u_aux : access xcb_render_create_picture_value_list_t) return int  -- /usr/include/xcb/render.h:1760
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_picture_value_list_unpack";

   function xcb_render_create_picture_value_list_sizeof (u_buffer : System.Address; value_mask : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/render.h:1765
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_picture_value_list_sizeof";

   function xcb_render_create_picture_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/render.h:1769
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_picture_sizeof";

   function xcb_render_create_picture_checked
     (c : access xcb.xcb_connection_t;
      pid : xcb_render_picture_t;
      drawable : xproto.xcb_drawable_t;
      format : xcb_render_pictformat_t;
      value_mask : bits_stdint_uintn_h.uint32_t;
      value_list : System.Address) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:1783
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_picture_checked";

   function xcb_render_create_picture
     (c : access xcb.xcb_connection_t;
      pid : xcb_render_picture_t;
      drawable : xproto.xcb_drawable_t;
      format : xcb_render_pictformat_t;
      value_mask : bits_stdint_uintn_h.uint32_t;
      value_list : System.Address) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:1799
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_picture";

   function xcb_render_create_picture_aux_checked
     (c : access xcb.xcb_connection_t;
      pid : xcb_render_picture_t;
      drawable : xproto.xcb_drawable_t;
      format : xcb_render_pictformat_t;
      value_mask : bits_stdint_uintn_h.uint32_t;
      value_list : access constant xcb_render_create_picture_value_list_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:1818
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_picture_aux_checked";

   function xcb_render_create_picture_aux
     (c : access xcb.xcb_connection_t;
      pid : xcb_render_picture_t;
      drawable : xproto.xcb_drawable_t;
      format : xcb_render_pictformat_t;
      value_mask : bits_stdint_uintn_h.uint32_t;
      value_list : access constant xcb_render_create_picture_value_list_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:1834
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_picture_aux";

   function xcb_render_create_picture_value_list (R : access constant xcb_render_create_picture_request_t) return System.Address  -- /usr/include/xcb/render.h:1842
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_picture_value_list";

   function xcb_render_change_picture_value_list_serialize
     (u_buffer : System.Address;
      value_mask : bits_stdint_uintn_h.uint32_t;
      u_aux : access constant xcb_render_change_picture_value_list_t) return int  -- /usr/include/xcb/render.h:1845
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_change_picture_value_list_serialize";

   function xcb_render_change_picture_value_list_unpack
     (u_buffer : System.Address;
      value_mask : bits_stdint_uintn_h.uint32_t;
      u_aux : access xcb_render_change_picture_value_list_t) return int  -- /usr/include/xcb/render.h:1850
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_change_picture_value_list_unpack";

   function xcb_render_change_picture_value_list_sizeof (u_buffer : System.Address; value_mask : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/render.h:1855
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_change_picture_value_list_sizeof";

   function xcb_render_change_picture_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/render.h:1859
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_change_picture_sizeof";

   function xcb_render_change_picture_checked
     (c : access xcb.xcb_connection_t;
      picture : xcb_render_picture_t;
      value_mask : bits_stdint_uintn_h.uint32_t;
      value_list : System.Address) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:1873
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_change_picture_checked";

   function xcb_render_change_picture
     (c : access xcb.xcb_connection_t;
      picture : xcb_render_picture_t;
      value_mask : bits_stdint_uintn_h.uint32_t;
      value_list : System.Address) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:1887
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_change_picture";

   function xcb_render_change_picture_aux_checked
     (c : access xcb.xcb_connection_t;
      picture : xcb_render_picture_t;
      value_mask : bits_stdint_uintn_h.uint32_t;
      value_list : access constant xcb_render_change_picture_value_list_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:1904
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_change_picture_aux_checked";

   function xcb_render_change_picture_aux
     (c : access xcb.xcb_connection_t;
      picture : xcb_render_picture_t;
      value_mask : bits_stdint_uintn_h.uint32_t;
      value_list : access constant xcb_render_change_picture_value_list_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:1918
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_change_picture_aux";

   function xcb_render_change_picture_value_list (R : access constant xcb_render_change_picture_request_t) return System.Address  -- /usr/include/xcb/render.h:1924
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_change_picture_value_list";

   function xcb_render_set_picture_clip_rectangles_sizeof (u_buffer : System.Address; rectangles_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/render.h:1927
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_set_picture_clip_rectangles_sizeof";

   function xcb_render_set_picture_clip_rectangles_checked
     (c : access xcb.xcb_connection_t;
      picture : xcb_render_picture_t;
      clip_x_origin : bits_stdint_intn_h.int16_t;
      clip_y_origin : bits_stdint_intn_h.int16_t;
      rectangles_len : bits_stdint_uintn_h.uint32_t;
      rectangles : access constant xproto.xcb_rectangle_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:1942
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_set_picture_clip_rectangles_checked";

   function xcb_render_set_picture_clip_rectangles
     (c : access xcb.xcb_connection_t;
      picture : xcb_render_picture_t;
      clip_x_origin : bits_stdint_intn_h.int16_t;
      clip_y_origin : bits_stdint_intn_h.int16_t;
      rectangles_len : bits_stdint_uintn_h.uint32_t;
      rectangles : access constant xproto.xcb_rectangle_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:1958
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_set_picture_clip_rectangles";

   function xcb_render_set_picture_clip_rectangles_rectangles (R : access constant xcb_render_set_picture_clip_rectangles_request_t) return access xproto.xcb_rectangle_t  -- /usr/include/xcb/render.h:1966
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_set_picture_clip_rectangles_rectangles";

   function xcb_render_set_picture_clip_rectangles_rectangles_length (R : access constant xcb_render_set_picture_clip_rectangles_request_t) return int  -- /usr/include/xcb/render.h:1969
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_set_picture_clip_rectangles_rectangles_length";

   function xcb_render_set_picture_clip_rectangles_rectangles_iterator (R : access constant xcb_render_set_picture_clip_rectangles_request_t) return xproto.xcb_rectangle_iterator_t  -- /usr/include/xcb/render.h:1972
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_set_picture_clip_rectangles_rectangles_iterator";

   function xcb_render_free_picture_checked (c : access xcb.xcb_connection_t; picture : xcb_render_picture_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:1986
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_free_picture_checked";

   function xcb_render_free_picture (c : access xcb.xcb_connection_t; picture : xcb_render_picture_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:1998
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_free_picture";

   function xcb_render_composite_checked
     (c : access xcb.xcb_connection_t;
      op : bits_stdint_uintn_h.uint8_t;
      src : xcb_render_picture_t;
      mask : xcb_render_picture_t;
      dst : xcb_render_picture_t;
      src_x : bits_stdint_intn_h.int16_t;
      src_y : bits_stdint_intn_h.int16_t;
      mask_x : bits_stdint_intn_h.int16_t;
      mask_y : bits_stdint_intn_h.int16_t;
      dst_x : bits_stdint_intn_h.int16_t;
      dst_y : bits_stdint_intn_h.int16_t;
      width : bits_stdint_uintn_h.uint16_t;
      height : bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2013
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_composite_checked";

   function xcb_render_composite
     (c : access xcb.xcb_connection_t;
      op : bits_stdint_uintn_h.uint8_t;
      src : xcb_render_picture_t;
      mask : xcb_render_picture_t;
      dst : xcb_render_picture_t;
      src_x : bits_stdint_intn_h.int16_t;
      src_y : bits_stdint_intn_h.int16_t;
      mask_x : bits_stdint_intn_h.int16_t;
      mask_y : bits_stdint_intn_h.int16_t;
      dst_x : bits_stdint_intn_h.int16_t;
      dst_y : bits_stdint_intn_h.int16_t;
      width : bits_stdint_uintn_h.uint16_t;
      height : bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2036
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_composite";

   function xcb_render_trapezoids_sizeof (u_buffer : System.Address; traps_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/render.h:2051
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_trapezoids_sizeof";

   function xcb_render_trapezoids_checked
     (c : access xcb.xcb_connection_t;
      op : bits_stdint_uintn_h.uint8_t;
      src : xcb_render_picture_t;
      dst : xcb_render_picture_t;
      mask_format : xcb_render_pictformat_t;
      src_x : bits_stdint_intn_h.int16_t;
      src_y : bits_stdint_intn_h.int16_t;
      traps_len : bits_stdint_uintn_h.uint32_t;
      traps : access constant xcb_render_trapezoid_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2066
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_trapezoids_checked";

   function xcb_render_trapezoids
     (c : access xcb.xcb_connection_t;
      op : bits_stdint_uintn_h.uint8_t;
      src : xcb_render_picture_t;
      dst : xcb_render_picture_t;
      mask_format : xcb_render_pictformat_t;
      src_x : bits_stdint_intn_h.int16_t;
      src_y : bits_stdint_intn_h.int16_t;
      traps_len : bits_stdint_uintn_h.uint32_t;
      traps : access constant xcb_render_trapezoid_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2085
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_trapezoids";

   function xcb_render_trapezoids_traps (R : access constant xcb_render_trapezoids_request_t) return access xcb_render_trapezoid_t  -- /usr/include/xcb/render.h:2096
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_trapezoids_traps";

   function xcb_render_trapezoids_traps_length (R : access constant xcb_render_trapezoids_request_t) return int  -- /usr/include/xcb/render.h:2099
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_trapezoids_traps_length";

   function xcb_render_trapezoids_traps_iterator (R : access constant xcb_render_trapezoids_request_t) return xcb_render_trapezoid_iterator_t  -- /usr/include/xcb/render.h:2102
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_trapezoids_traps_iterator";

   function xcb_render_triangles_sizeof (u_buffer : System.Address; triangles_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/render.h:2105
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_triangles_sizeof";

   function xcb_render_triangles_checked
     (c : access xcb.xcb_connection_t;
      op : bits_stdint_uintn_h.uint8_t;
      src : xcb_render_picture_t;
      dst : xcb_render_picture_t;
      mask_format : xcb_render_pictformat_t;
      src_x : bits_stdint_intn_h.int16_t;
      src_y : bits_stdint_intn_h.int16_t;
      triangles_len : bits_stdint_uintn_h.uint32_t;
      triangles : access constant xcb_render_triangle_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2120
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_triangles_checked";

   function xcb_render_triangles
     (c : access xcb.xcb_connection_t;
      op : bits_stdint_uintn_h.uint8_t;
      src : xcb_render_picture_t;
      dst : xcb_render_picture_t;
      mask_format : xcb_render_pictformat_t;
      src_x : bits_stdint_intn_h.int16_t;
      src_y : bits_stdint_intn_h.int16_t;
      triangles_len : bits_stdint_uintn_h.uint32_t;
      triangles : access constant xcb_render_triangle_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2139
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_triangles";

   function xcb_render_triangles_triangles (R : access constant xcb_render_triangles_request_t) return access xcb_render_triangle_t  -- /usr/include/xcb/render.h:2150
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_triangles_triangles";

   function xcb_render_triangles_triangles_length (R : access constant xcb_render_triangles_request_t) return int  -- /usr/include/xcb/render.h:2153
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_triangles_triangles_length";

   function xcb_render_triangles_triangles_iterator (R : access constant xcb_render_triangles_request_t) return xcb_render_triangle_iterator_t  -- /usr/include/xcb/render.h:2156
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_triangles_triangles_iterator";

   function xcb_render_tri_strip_sizeof (u_buffer : System.Address; points_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/render.h:2159
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_tri_strip_sizeof";

   function xcb_render_tri_strip_checked
     (c : access xcb.xcb_connection_t;
      op : bits_stdint_uintn_h.uint8_t;
      src : xcb_render_picture_t;
      dst : xcb_render_picture_t;
      mask_format : xcb_render_pictformat_t;
      src_x : bits_stdint_intn_h.int16_t;
      src_y : bits_stdint_intn_h.int16_t;
      points_len : bits_stdint_uintn_h.uint32_t;
      points : access constant xcb_render_pointfix_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2174
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_tri_strip_checked";

   function xcb_render_tri_strip
     (c : access xcb.xcb_connection_t;
      op : bits_stdint_uintn_h.uint8_t;
      src : xcb_render_picture_t;
      dst : xcb_render_picture_t;
      mask_format : xcb_render_pictformat_t;
      src_x : bits_stdint_intn_h.int16_t;
      src_y : bits_stdint_intn_h.int16_t;
      points_len : bits_stdint_uintn_h.uint32_t;
      points : access constant xcb_render_pointfix_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2193
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_tri_strip";

   function xcb_render_tri_strip_points (R : access constant xcb_render_tri_strip_request_t) return access xcb_render_pointfix_t  -- /usr/include/xcb/render.h:2204
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_tri_strip_points";

   function xcb_render_tri_strip_points_length (R : access constant xcb_render_tri_strip_request_t) return int  -- /usr/include/xcb/render.h:2207
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_tri_strip_points_length";

   function xcb_render_tri_strip_points_iterator (R : access constant xcb_render_tri_strip_request_t) return xcb_render_pointfix_iterator_t  -- /usr/include/xcb/render.h:2210
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_tri_strip_points_iterator";

   function xcb_render_tri_fan_sizeof (u_buffer : System.Address; points_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/render.h:2213
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_tri_fan_sizeof";

   function xcb_render_tri_fan_checked
     (c : access xcb.xcb_connection_t;
      op : bits_stdint_uintn_h.uint8_t;
      src : xcb_render_picture_t;
      dst : xcb_render_picture_t;
      mask_format : xcb_render_pictformat_t;
      src_x : bits_stdint_intn_h.int16_t;
      src_y : bits_stdint_intn_h.int16_t;
      points_len : bits_stdint_uintn_h.uint32_t;
      points : access constant xcb_render_pointfix_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2228
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_tri_fan_checked";

   function xcb_render_tri_fan
     (c : access xcb.xcb_connection_t;
      op : bits_stdint_uintn_h.uint8_t;
      src : xcb_render_picture_t;
      dst : xcb_render_picture_t;
      mask_format : xcb_render_pictformat_t;
      src_x : bits_stdint_intn_h.int16_t;
      src_y : bits_stdint_intn_h.int16_t;
      points_len : bits_stdint_uintn_h.uint32_t;
      points : access constant xcb_render_pointfix_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2247
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_tri_fan";

   function xcb_render_tri_fan_points (R : access constant xcb_render_tri_fan_request_t) return access xcb_render_pointfix_t  -- /usr/include/xcb/render.h:2258
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_tri_fan_points";

   function xcb_render_tri_fan_points_length (R : access constant xcb_render_tri_fan_request_t) return int  -- /usr/include/xcb/render.h:2261
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_tri_fan_points_length";

   function xcb_render_tri_fan_points_iterator (R : access constant xcb_render_tri_fan_request_t) return xcb_render_pointfix_iterator_t  -- /usr/include/xcb/render.h:2264
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_tri_fan_points_iterator";

   function xcb_render_create_glyph_set_checked
     (c : access xcb.xcb_connection_t;
      gsid : xcb_render_glyphset_t;
      format : xcb_render_pictformat_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2278
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_glyph_set_checked";

   function xcb_render_create_glyph_set
     (c : access xcb.xcb_connection_t;
      gsid : xcb_render_glyphset_t;
      format : xcb_render_pictformat_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2291
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_glyph_set";

   function xcb_render_reference_glyph_set_checked
     (c : access xcb.xcb_connection_t;
      gsid : xcb_render_glyphset_t;
      existing : xcb_render_glyphset_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2307
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_reference_glyph_set_checked";

   function xcb_render_reference_glyph_set
     (c : access xcb.xcb_connection_t;
      gsid : xcb_render_glyphset_t;
      existing : xcb_render_glyphset_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2320
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_reference_glyph_set";

   function xcb_render_free_glyph_set_checked (c : access xcb.xcb_connection_t; glyphset : xcb_render_glyphset_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2336
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_free_glyph_set_checked";

   function xcb_render_free_glyph_set (c : access xcb.xcb_connection_t; glyphset : xcb_render_glyphset_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2348
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_free_glyph_set";

   function xcb_render_add_glyphs_sizeof (u_buffer : System.Address; data_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/render.h:2352
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_add_glyphs_sizeof";

   function xcb_render_add_glyphs_checked
     (c : access xcb.xcb_connection_t;
      glyphset : xcb_render_glyphset_t;
      glyphs_len : bits_stdint_uintn_h.uint32_t;
      glyphids : access bits_stdint_uintn_h.uint32_t;
      glyphs : access constant xcb_render_glyphinfo_t;
      data_len : bits_stdint_uintn_h.uint32_t;
      data : access bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2367
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_add_glyphs_checked";

   function xcb_render_add_glyphs
     (c : access xcb.xcb_connection_t;
      glyphset : xcb_render_glyphset_t;
      glyphs_len : bits_stdint_uintn_h.uint32_t;
      glyphids : access bits_stdint_uintn_h.uint32_t;
      glyphs : access constant xcb_render_glyphinfo_t;
      data_len : bits_stdint_uintn_h.uint32_t;
      data : access bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2384
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_add_glyphs";

   function xcb_render_add_glyphs_glyphids (R : access constant xcb_render_add_glyphs_request_t) return access bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/render.h:2393
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_add_glyphs_glyphids";

   function xcb_render_add_glyphs_glyphids_length (R : access constant xcb_render_add_glyphs_request_t) return int  -- /usr/include/xcb/render.h:2396
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_add_glyphs_glyphids_length";

   function xcb_render_add_glyphs_glyphids_end (R : access constant xcb_render_add_glyphs_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:2399
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_add_glyphs_glyphids_end";

   function xcb_render_add_glyphs_glyphs (R : access constant xcb_render_add_glyphs_request_t) return access xcb_render_glyphinfo_t  -- /usr/include/xcb/render.h:2402
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_add_glyphs_glyphs";

   function xcb_render_add_glyphs_glyphs_length (R : access constant xcb_render_add_glyphs_request_t) return int  -- /usr/include/xcb/render.h:2405
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_add_glyphs_glyphs_length";

   function xcb_render_add_glyphs_glyphs_iterator (R : access constant xcb_render_add_glyphs_request_t) return xcb_render_glyphinfo_iterator_t  -- /usr/include/xcb/render.h:2408
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_add_glyphs_glyphs_iterator";

   function xcb_render_add_glyphs_data (R : access constant xcb_render_add_glyphs_request_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/render.h:2411
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_add_glyphs_data";

   function xcb_render_add_glyphs_data_length (R : access constant xcb_render_add_glyphs_request_t) return int  -- /usr/include/xcb/render.h:2414
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_add_glyphs_data_length";

   function xcb_render_add_glyphs_data_end (R : access constant xcb_render_add_glyphs_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:2417
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_add_glyphs_data_end";

   function xcb_render_free_glyphs_sizeof (u_buffer : System.Address; glyphs_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/render.h:2420
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_free_glyphs_sizeof";

   function xcb_render_free_glyphs_checked
     (c : access xcb.xcb_connection_t;
      glyphset : xcb_render_glyphset_t;
      glyphs_len : bits_stdint_uintn_h.uint32_t;
      glyphs : access xcb_render_glyph_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2435
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_free_glyphs_checked";

   function xcb_render_free_glyphs
     (c : access xcb.xcb_connection_t;
      glyphset : xcb_render_glyphset_t;
      glyphs_len : bits_stdint_uintn_h.uint32_t;
      glyphs : access xcb_render_glyph_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2449
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_free_glyphs";

   function xcb_render_free_glyphs_glyphs (R : access constant xcb_render_free_glyphs_request_t) return access xcb_render_glyph_t  -- /usr/include/xcb/render.h:2455
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_free_glyphs_glyphs";

   function xcb_render_free_glyphs_glyphs_length (R : access constant xcb_render_free_glyphs_request_t) return int  -- /usr/include/xcb/render.h:2458
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_free_glyphs_glyphs_length";

   function xcb_render_free_glyphs_glyphs_end (R : access constant xcb_render_free_glyphs_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:2461
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_free_glyphs_glyphs_end";

   function xcb_render_composite_glyphs_8_sizeof (u_buffer : System.Address; glyphcmds_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/render.h:2464
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_composite_glyphs_8_sizeof";

   function xcb_render_composite_glyphs_8_checked
     (c : access xcb.xcb_connection_t;
      op : bits_stdint_uintn_h.uint8_t;
      src : xcb_render_picture_t;
      dst : xcb_render_picture_t;
      mask_format : xcb_render_pictformat_t;
      glyphset : xcb_render_glyphset_t;
      src_x : bits_stdint_intn_h.int16_t;
      src_y : bits_stdint_intn_h.int16_t;
      glyphcmds_len : bits_stdint_uintn_h.uint32_t;
      glyphcmds : access bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2479
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_composite_glyphs_8_checked";

   function xcb_render_composite_glyphs_8
     (c : access xcb.xcb_connection_t;
      op : bits_stdint_uintn_h.uint8_t;
      src : xcb_render_picture_t;
      dst : xcb_render_picture_t;
      mask_format : xcb_render_pictformat_t;
      glyphset : xcb_render_glyphset_t;
      src_x : bits_stdint_intn_h.int16_t;
      src_y : bits_stdint_intn_h.int16_t;
      glyphcmds_len : bits_stdint_uintn_h.uint32_t;
      glyphcmds : access bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2499
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_composite_glyphs_8";

   function xcb_render_composite_glyphs_8_glyphcmds (R : access constant xcb_render_composite_glyphs_8_request_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/render.h:2511
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_composite_glyphs_8_glyphcmds";

   function xcb_render_composite_glyphs_8_glyphcmds_length (R : access constant xcb_render_composite_glyphs_8_request_t) return int  -- /usr/include/xcb/render.h:2514
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_composite_glyphs_8_glyphcmds_length";

   function xcb_render_composite_glyphs_8_glyphcmds_end (R : access constant xcb_render_composite_glyphs_8_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:2517
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_composite_glyphs_8_glyphcmds_end";

   function xcb_render_composite_glyphs_16_sizeof (u_buffer : System.Address; glyphcmds_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/render.h:2520
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_composite_glyphs_16_sizeof";

   function xcb_render_composite_glyphs_16_checked
     (c : access xcb.xcb_connection_t;
      op : bits_stdint_uintn_h.uint8_t;
      src : xcb_render_picture_t;
      dst : xcb_render_picture_t;
      mask_format : xcb_render_pictformat_t;
      glyphset : xcb_render_glyphset_t;
      src_x : bits_stdint_intn_h.int16_t;
      src_y : bits_stdint_intn_h.int16_t;
      glyphcmds_len : bits_stdint_uintn_h.uint32_t;
      glyphcmds : access bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2535
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_composite_glyphs_16_checked";

   function xcb_render_composite_glyphs_16
     (c : access xcb.xcb_connection_t;
      op : bits_stdint_uintn_h.uint8_t;
      src : xcb_render_picture_t;
      dst : xcb_render_picture_t;
      mask_format : xcb_render_pictformat_t;
      glyphset : xcb_render_glyphset_t;
      src_x : bits_stdint_intn_h.int16_t;
      src_y : bits_stdint_intn_h.int16_t;
      glyphcmds_len : bits_stdint_uintn_h.uint32_t;
      glyphcmds : access bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2555
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_composite_glyphs_16";

   function xcb_render_composite_glyphs_16_glyphcmds (R : access constant xcb_render_composite_glyphs_16_request_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/render.h:2567
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_composite_glyphs_16_glyphcmds";

   function xcb_render_composite_glyphs_16_glyphcmds_length (R : access constant xcb_render_composite_glyphs_16_request_t) return int  -- /usr/include/xcb/render.h:2570
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_composite_glyphs_16_glyphcmds_length";

   function xcb_render_composite_glyphs_16_glyphcmds_end (R : access constant xcb_render_composite_glyphs_16_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:2573
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_composite_glyphs_16_glyphcmds_end";

   function xcb_render_composite_glyphs_32_sizeof (u_buffer : System.Address; glyphcmds_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/render.h:2576
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_composite_glyphs_32_sizeof";

   function xcb_render_composite_glyphs_32_checked
     (c : access xcb.xcb_connection_t;
      op : bits_stdint_uintn_h.uint8_t;
      src : xcb_render_picture_t;
      dst : xcb_render_picture_t;
      mask_format : xcb_render_pictformat_t;
      glyphset : xcb_render_glyphset_t;
      src_x : bits_stdint_intn_h.int16_t;
      src_y : bits_stdint_intn_h.int16_t;
      glyphcmds_len : bits_stdint_uintn_h.uint32_t;
      glyphcmds : access bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2591
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_composite_glyphs_32_checked";

   function xcb_render_composite_glyphs_32
     (c : access xcb.xcb_connection_t;
      op : bits_stdint_uintn_h.uint8_t;
      src : xcb_render_picture_t;
      dst : xcb_render_picture_t;
      mask_format : xcb_render_pictformat_t;
      glyphset : xcb_render_glyphset_t;
      src_x : bits_stdint_intn_h.int16_t;
      src_y : bits_stdint_intn_h.int16_t;
      glyphcmds_len : bits_stdint_uintn_h.uint32_t;
      glyphcmds : access bits_stdint_uintn_h.uint8_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2611
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_composite_glyphs_32";

   function xcb_render_composite_glyphs_32_glyphcmds (R : access constant xcb_render_composite_glyphs_32_request_t) return access bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/render.h:2623
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_composite_glyphs_32_glyphcmds";

   function xcb_render_composite_glyphs_32_glyphcmds_length (R : access constant xcb_render_composite_glyphs_32_request_t) return int  -- /usr/include/xcb/render.h:2626
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_composite_glyphs_32_glyphcmds_length";

   function xcb_render_composite_glyphs_32_glyphcmds_end (R : access constant xcb_render_composite_glyphs_32_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:2629
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_composite_glyphs_32_glyphcmds_end";

   function xcb_render_fill_rectangles_sizeof (u_buffer : System.Address; rects_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/render.h:2632
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_fill_rectangles_sizeof";

   function xcb_render_fill_rectangles_checked
     (c : access xcb.xcb_connection_t;
      op : bits_stdint_uintn_h.uint8_t;
      dst : xcb_render_picture_t;
      color : xcb_render_color_t;
      rects_len : bits_stdint_uintn_h.uint32_t;
      rects : access constant xproto.xcb_rectangle_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2647
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_fill_rectangles_checked";

   function xcb_render_fill_rectangles
     (c : access xcb.xcb_connection_t;
      op : bits_stdint_uintn_h.uint8_t;
      dst : xcb_render_picture_t;
      color : xcb_render_color_t;
      rects_len : bits_stdint_uintn_h.uint32_t;
      rects : access constant xproto.xcb_rectangle_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2663
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_fill_rectangles";

   function xcb_render_fill_rectangles_rects (R : access constant xcb_render_fill_rectangles_request_t) return access xproto.xcb_rectangle_t  -- /usr/include/xcb/render.h:2671
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_fill_rectangles_rects";

   function xcb_render_fill_rectangles_rects_length (R : access constant xcb_render_fill_rectangles_request_t) return int  -- /usr/include/xcb/render.h:2674
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_fill_rectangles_rects_length";

   function xcb_render_fill_rectangles_rects_iterator (R : access constant xcb_render_fill_rectangles_request_t) return xproto.xcb_rectangle_iterator_t  -- /usr/include/xcb/render.h:2677
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_fill_rectangles_rects_iterator";

   function xcb_render_create_cursor_checked
     (c : access xcb.xcb_connection_t;
      cid : xproto.xcb_cursor_t;
      source : xcb_render_picture_t;
      x : bits_stdint_uintn_h.uint16_t;
      y : bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2691
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_cursor_checked";

   function xcb_render_create_cursor
     (c : access xcb.xcb_connection_t;
      cid : xproto.xcb_cursor_t;
      source : xcb_render_picture_t;
      x : bits_stdint_uintn_h.uint16_t;
      y : bits_stdint_uintn_h.uint16_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2706
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_cursor";

   procedure xcb_render_transform_next (i : access xcb_render_transform_iterator_t)  -- /usr/include/xcb/render.h:2721
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_transform_next";

   function xcb_render_transform_end (i : xcb_render_transform_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:2733
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_transform_end";

   function xcb_render_set_picture_transform_checked
     (c : access xcb.xcb_connection_t;
      picture : xcb_render_picture_t;
      transform : xcb_render_transform_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2747
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_set_picture_transform_checked";

   function xcb_render_set_picture_transform
     (c : access xcb.xcb_connection_t;
      picture : xcb_render_picture_t;
      transform : xcb_render_transform_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2760
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_set_picture_transform";

   function xcb_render_query_filters_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/render.h:2765
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_filters_sizeof";

   function xcb_render_query_filters (c : access xcb.xcb_connection_t; drawable : xproto.xcb_drawable_t) return xcb_render_query_filters_cookie_t  -- /usr/include/xcb/render.h:2776
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_filters";

   function xcb_render_query_filters_unchecked (c : access xcb.xcb_connection_t; drawable : xproto.xcb_drawable_t) return xcb_render_query_filters_cookie_t  -- /usr/include/xcb/render.h:2791
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_filters_unchecked";

   function xcb_render_query_filters_aliases (R : access constant xcb_render_query_filters_reply_t) return access bits_stdint_uintn_h.uint16_t  -- /usr/include/xcb/render.h:2795
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_filters_aliases";

   function xcb_render_query_filters_aliases_length (R : access constant xcb_render_query_filters_reply_t) return int  -- /usr/include/xcb/render.h:2798
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_filters_aliases_length";

   function xcb_render_query_filters_aliases_end (R : access constant xcb_render_query_filters_reply_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:2801
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_filters_aliases_end";

   function xcb_render_query_filters_filters_length (R : access constant xcb_render_query_filters_reply_t) return int  -- /usr/include/xcb/render.h:2804
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_filters_filters_length";

   function xcb_render_query_filters_filters_iterator (R : access constant xcb_render_query_filters_reply_t) return xproto.xcb_str_iterator_t  -- /usr/include/xcb/render.h:2807
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_filters_filters_iterator";

   function xcb_render_query_filters_reply
     (c : access xcb.xcb_connection_t;
      cookie : xcb_render_query_filters_cookie_t;
      e : System.Address) return access xcb_render_query_filters_reply_t  -- /usr/include/xcb/render.h:2824
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_query_filters_reply";

   function xcb_render_set_picture_filter_sizeof (u_buffer : System.Address; values_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/render.h:2829
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_set_picture_filter_sizeof";

   function xcb_render_set_picture_filter_checked
     (c : access xcb.xcb_connection_t;
      picture : xcb_render_picture_t;
      filter_len : bits_stdint_uintn_h.uint16_t;
      filter : Interfaces.C.Strings.chars_ptr;
      values_len : bits_stdint_uintn_h.uint32_t;
      values : access xcb_render_fixed_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2844
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_set_picture_filter_checked";

   function xcb_render_set_picture_filter
     (c : access xcb.xcb_connection_t;
      picture : xcb_render_picture_t;
      filter_len : bits_stdint_uintn_h.uint16_t;
      filter : Interfaces.C.Strings.chars_ptr;
      values_len : bits_stdint_uintn_h.uint32_t;
      values : access xcb_render_fixed_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2860
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_set_picture_filter";

   function xcb_render_set_picture_filter_filter (R : access constant xcb_render_set_picture_filter_request_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/render.h:2868
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_set_picture_filter_filter";

   function xcb_render_set_picture_filter_filter_length (R : access constant xcb_render_set_picture_filter_request_t) return int  -- /usr/include/xcb/render.h:2871
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_set_picture_filter_filter_length";

   function xcb_render_set_picture_filter_filter_end (R : access constant xcb_render_set_picture_filter_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:2874
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_set_picture_filter_filter_end";

   function xcb_render_set_picture_filter_values (R : access constant xcb_render_set_picture_filter_request_t) return access xcb_render_fixed_t  -- /usr/include/xcb/render.h:2877
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_set_picture_filter_values";

   function xcb_render_set_picture_filter_values_length (R : access constant xcb_render_set_picture_filter_request_t) return int  -- /usr/include/xcb/render.h:2880
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_set_picture_filter_values_length";

   function xcb_render_set_picture_filter_values_end (R : access constant xcb_render_set_picture_filter_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:2883
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_set_picture_filter_values_end";

   procedure xcb_render_animcursorelt_next (i : access xcb_render_animcursorelt_iterator_t)  -- /usr/include/xcb/render.h:2894
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_animcursorelt_next";

   function xcb_render_animcursorelt_end (i : xcb_render_animcursorelt_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:2906
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_animcursorelt_end";

   function xcb_render_create_anim_cursor_sizeof (u_buffer : System.Address; cursors_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/render.h:2909
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_anim_cursor_sizeof";

   function xcb_render_create_anim_cursor_checked
     (c : access xcb.xcb_connection_t;
      cid : xproto.xcb_cursor_t;
      cursors_len : bits_stdint_uintn_h.uint32_t;
      cursors : access constant xcb_render_animcursorelt_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2924
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_anim_cursor_checked";

   function xcb_render_create_anim_cursor
     (c : access xcb.xcb_connection_t;
      cid : xproto.xcb_cursor_t;
      cursors_len : bits_stdint_uintn_h.uint32_t;
      cursors : access constant xcb_render_animcursorelt_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:2938
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_anim_cursor";

   function xcb_render_create_anim_cursor_cursors (R : access constant xcb_render_create_anim_cursor_request_t) return access xcb_render_animcursorelt_t  -- /usr/include/xcb/render.h:2944
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_anim_cursor_cursors";

   function xcb_render_create_anim_cursor_cursors_length (R : access constant xcb_render_create_anim_cursor_request_t) return int  -- /usr/include/xcb/render.h:2947
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_anim_cursor_cursors_length";

   function xcb_render_create_anim_cursor_cursors_iterator (R : access constant xcb_render_create_anim_cursor_request_t) return xcb_render_animcursorelt_iterator_t  -- /usr/include/xcb/render.h:2950
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_anim_cursor_cursors_iterator";

   procedure xcb_render_spanfix_next (i : access xcb_render_spanfix_iterator_t)  -- /usr/include/xcb/render.h:2961
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_spanfix_next";

   function xcb_render_spanfix_end (i : xcb_render_spanfix_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:2973
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_spanfix_end";

   procedure xcb_render_trap_next (i : access xcb_render_trap_iterator_t)  -- /usr/include/xcb/render.h:2984
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_trap_next";

   function xcb_render_trap_end (i : xcb_render_trap_iterator_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:2996
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_trap_end";

   function xcb_render_add_traps_sizeof (u_buffer : System.Address; traps_len : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/xcb/render.h:2999
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_add_traps_sizeof";

   function xcb_render_add_traps_checked
     (c : access xcb.xcb_connection_t;
      picture : xcb_render_picture_t;
      x_off : bits_stdint_intn_h.int16_t;
      y_off : bits_stdint_intn_h.int16_t;
      traps_len : bits_stdint_uintn_h.uint32_t;
      traps : access constant xcb_render_trap_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:3014
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_add_traps_checked";

   function xcb_render_add_traps
     (c : access xcb.xcb_connection_t;
      picture : xcb_render_picture_t;
      x_off : bits_stdint_intn_h.int16_t;
      y_off : bits_stdint_intn_h.int16_t;
      traps_len : bits_stdint_uintn_h.uint32_t;
      traps : access constant xcb_render_trap_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:3030
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_add_traps";

   function xcb_render_add_traps_traps (R : access constant xcb_render_add_traps_request_t) return access xcb_render_trap_t  -- /usr/include/xcb/render.h:3038
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_add_traps_traps";

   function xcb_render_add_traps_traps_length (R : access constant xcb_render_add_traps_request_t) return int  -- /usr/include/xcb/render.h:3041
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_add_traps_traps_length";

   function xcb_render_add_traps_traps_iterator (R : access constant xcb_render_add_traps_request_t) return xcb_render_trap_iterator_t  -- /usr/include/xcb/render.h:3044
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_add_traps_traps_iterator";

   function xcb_render_create_solid_fill_checked
     (c : access xcb.xcb_connection_t;
      picture : xcb_render_picture_t;
      color : xcb_render_color_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:3058
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_solid_fill_checked";

   function xcb_render_create_solid_fill
     (c : access xcb.xcb_connection_t;
      picture : xcb_render_picture_t;
      color : xcb_render_color_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:3071
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_solid_fill";

   function xcb_render_create_linear_gradient_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/render.h:3076
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_linear_gradient_sizeof";

   function xcb_render_create_linear_gradient_checked
     (c : access xcb.xcb_connection_t;
      picture : xcb_render_picture_t;
      p1 : xcb_render_pointfix_t;
      p2 : xcb_render_pointfix_t;
      num_stops : bits_stdint_uintn_h.uint32_t;
      stops : access xcb_render_fixed_t;
      colors : access constant xcb_render_color_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:3090
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_linear_gradient_checked";

   function xcb_render_create_linear_gradient
     (c : access xcb.xcb_connection_t;
      picture : xcb_render_picture_t;
      p1 : xcb_render_pointfix_t;
      p2 : xcb_render_pointfix_t;
      num_stops : bits_stdint_uintn_h.uint32_t;
      stops : access xcb_render_fixed_t;
      colors : access constant xcb_render_color_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:3107
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_linear_gradient";

   function xcb_render_create_linear_gradient_stops (R : access constant xcb_render_create_linear_gradient_request_t) return access xcb_render_fixed_t  -- /usr/include/xcb/render.h:3116
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_linear_gradient_stops";

   function xcb_render_create_linear_gradient_stops_length (R : access constant xcb_render_create_linear_gradient_request_t) return int  -- /usr/include/xcb/render.h:3119
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_linear_gradient_stops_length";

   function xcb_render_create_linear_gradient_stops_end (R : access constant xcb_render_create_linear_gradient_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:3122
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_linear_gradient_stops_end";

   function xcb_render_create_linear_gradient_colors (R : access constant xcb_render_create_linear_gradient_request_t) return access xcb_render_color_t  -- /usr/include/xcb/render.h:3125
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_linear_gradient_colors";

   function xcb_render_create_linear_gradient_colors_length (R : access constant xcb_render_create_linear_gradient_request_t) return int  -- /usr/include/xcb/render.h:3128
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_linear_gradient_colors_length";

   function xcb_render_create_linear_gradient_colors_iterator (R : access constant xcb_render_create_linear_gradient_request_t) return xcb_render_color_iterator_t  -- /usr/include/xcb/render.h:3131
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_linear_gradient_colors_iterator";

   function xcb_render_create_radial_gradient_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/render.h:3134
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_radial_gradient_sizeof";

   function xcb_render_create_radial_gradient_checked
     (c : access xcb.xcb_connection_t;
      picture : xcb_render_picture_t;
      inner : xcb_render_pointfix_t;
      outer : xcb_render_pointfix_t;
      inner_radius : xcb_render_fixed_t;
      outer_radius : xcb_render_fixed_t;
      num_stops : bits_stdint_uintn_h.uint32_t;
      stops : access xcb_render_fixed_t;
      colors : access constant xcb_render_color_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:3148
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_radial_gradient_checked";

   function xcb_render_create_radial_gradient
     (c : access xcb.xcb_connection_t;
      picture : xcb_render_picture_t;
      inner : xcb_render_pointfix_t;
      outer : xcb_render_pointfix_t;
      inner_radius : xcb_render_fixed_t;
      outer_radius : xcb_render_fixed_t;
      num_stops : bits_stdint_uintn_h.uint32_t;
      stops : access xcb_render_fixed_t;
      colors : access constant xcb_render_color_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:3167
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_radial_gradient";

   function xcb_render_create_radial_gradient_stops (R : access constant xcb_render_create_radial_gradient_request_t) return access xcb_render_fixed_t  -- /usr/include/xcb/render.h:3178
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_radial_gradient_stops";

   function xcb_render_create_radial_gradient_stops_length (R : access constant xcb_render_create_radial_gradient_request_t) return int  -- /usr/include/xcb/render.h:3181
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_radial_gradient_stops_length";

   function xcb_render_create_radial_gradient_stops_end (R : access constant xcb_render_create_radial_gradient_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:3184
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_radial_gradient_stops_end";

   function xcb_render_create_radial_gradient_colors (R : access constant xcb_render_create_radial_gradient_request_t) return access xcb_render_color_t  -- /usr/include/xcb/render.h:3187
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_radial_gradient_colors";

   function xcb_render_create_radial_gradient_colors_length (R : access constant xcb_render_create_radial_gradient_request_t) return int  -- /usr/include/xcb/render.h:3190
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_radial_gradient_colors_length";

   function xcb_render_create_radial_gradient_colors_iterator (R : access constant xcb_render_create_radial_gradient_request_t) return xcb_render_color_iterator_t  -- /usr/include/xcb/render.h:3193
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_radial_gradient_colors_iterator";

   function xcb_render_create_conical_gradient_sizeof (u_buffer : System.Address) return int  -- /usr/include/xcb/render.h:3196
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_conical_gradient_sizeof";

   function xcb_render_create_conical_gradient_checked
     (c : access xcb.xcb_connection_t;
      picture : xcb_render_picture_t;
      center : xcb_render_pointfix_t;
      angle : xcb_render_fixed_t;
      num_stops : bits_stdint_uintn_h.uint32_t;
      stops : access xcb_render_fixed_t;
      colors : access constant xcb_render_color_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:3210
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_conical_gradient_checked";

   function xcb_render_create_conical_gradient
     (c : access xcb.xcb_connection_t;
      picture : xcb_render_picture_t;
      center : xcb_render_pointfix_t;
      angle : xcb_render_fixed_t;
      num_stops : bits_stdint_uintn_h.uint32_t;
      stops : access xcb_render_fixed_t;
      colors : access constant xcb_render_color_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/render.h:3227
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_conical_gradient";

   function xcb_render_create_conical_gradient_stops (R : access constant xcb_render_create_conical_gradient_request_t) return access xcb_render_fixed_t  -- /usr/include/xcb/render.h:3236
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_conical_gradient_stops";

   function xcb_render_create_conical_gradient_stops_length (R : access constant xcb_render_create_conical_gradient_request_t) return int  -- /usr/include/xcb/render.h:3239
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_conical_gradient_stops_length";

   function xcb_render_create_conical_gradient_stops_end (R : access constant xcb_render_create_conical_gradient_request_t) return xcb.xcb_generic_iterator_t  -- /usr/include/xcb/render.h:3242
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_conical_gradient_stops_end";

   function xcb_render_create_conical_gradient_colors (R : access constant xcb_render_create_conical_gradient_request_t) return access xcb_render_color_t  -- /usr/include/xcb/render.h:3245
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_conical_gradient_colors";

   function xcb_render_create_conical_gradient_colors_length (R : access constant xcb_render_create_conical_gradient_request_t) return int  -- /usr/include/xcb/render.h:3248
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_conical_gradient_colors_length";

   function xcb_render_create_conical_gradient_colors_iterator (R : access constant xcb_render_create_conical_gradient_request_t) return xcb_render_color_iterator_t  -- /usr/include/xcb/render.h:3251
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_render_create_conical_gradient_colors_iterator";

end xcb_render;
