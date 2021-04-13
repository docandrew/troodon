pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with System;
limited with glext;

package gl is

   --  unsupported macro: GLAPI __attribute__((visibility("default")))
   --  unsupported macro: APIENTRY GLAPIENTRY
   --  unsupported macro: APIENTRYP APIENTRY *
   --  unsupported macro: GLAPIENTRYP GLAPIENTRY *
   GL_VERSION_1_1 : constant := 1;  --  gl.h:107
   GL_VERSION_1_2 : constant := 1;  --  gl.h:108
   GL_VERSION_1_3 : constant := 1;  --  gl.h:109
   GL_ARB_imaging : constant := 1;  --  gl.h:110

   GL_FALSE : constant := 0;  --  gl.h:139
   GL_TRUE : constant := 1;  --  gl.h:140

   GL_BYTE : constant := 16#1400#;  --  gl.h:143
   GL_UNSIGNED_BYTE : constant := 16#1401#;  --  gl.h:144
   GL_SHORT : constant := 16#1402#;  --  gl.h:145
   GL_UNSIGNED_SHORT : constant := 16#1403#;  --  gl.h:146
   GL_INT : constant := 16#1404#;  --  gl.h:147
   GL_UNSIGNED_INT : constant := 16#1405#;  --  gl.h:148
   GL_FLOAT : constant := 16#1406#;  --  gl.h:149
   GL_2_BYTES : constant := 16#1407#;  --  gl.h:150
   GL_3_BYTES : constant := 16#1408#;  --  gl.h:151
   GL_4_BYTES : constant := 16#1409#;  --  gl.h:152
   GL_DOUBLE : constant := 16#140A#;  --  gl.h:153

   GL_POINTS : constant := 16#0000#;  --  gl.h:156
   GL_LINES : constant := 16#0001#;  --  gl.h:157
   GL_LINE_LOOP : constant := 16#0002#;  --  gl.h:158
   GL_LINE_STRIP : constant := 16#0003#;  --  gl.h:159
   GL_TRIANGLES : constant := 16#0004#;  --  gl.h:160
   GL_TRIANGLE_STRIP : constant := 16#0005#;  --  gl.h:161
   GL_TRIANGLE_FAN : constant := 16#0006#;  --  gl.h:162
   GL_QUADS : constant := 16#0007#;  --  gl.h:163
   GL_QUAD_STRIP : constant := 16#0008#;  --  gl.h:164
   GL_POLYGON : constant := 16#0009#;  --  gl.h:165

   GL_VERTEX_ARRAY : constant := 16#8074#;  --  gl.h:168
   GL_NORMAL_ARRAY : constant := 16#8075#;  --  gl.h:169
   GL_COLOR_ARRAY : constant := 16#8076#;  --  gl.h:170
   GL_INDEX_ARRAY : constant := 16#8077#;  --  gl.h:171
   GL_TEXTURE_COORD_ARRAY : constant := 16#8078#;  --  gl.h:172
   GL_EDGE_FLAG_ARRAY : constant := 16#8079#;  --  gl.h:173
   GL_VERTEX_ARRAY_SIZE : constant := 16#807A#;  --  gl.h:174
   GL_VERTEX_ARRAY_TYPE : constant := 16#807B#;  --  gl.h:175
   GL_VERTEX_ARRAY_STRIDE : constant := 16#807C#;  --  gl.h:176
   GL_NORMAL_ARRAY_TYPE : constant := 16#807E#;  --  gl.h:177
   GL_NORMAL_ARRAY_STRIDE : constant := 16#807F#;  --  gl.h:178
   GL_COLOR_ARRAY_SIZE : constant := 16#8081#;  --  gl.h:179
   GL_COLOR_ARRAY_TYPE : constant := 16#8082#;  --  gl.h:180
   GL_COLOR_ARRAY_STRIDE : constant := 16#8083#;  --  gl.h:181
   GL_INDEX_ARRAY_TYPE : constant := 16#8085#;  --  gl.h:182
   GL_INDEX_ARRAY_STRIDE : constant := 16#8086#;  --  gl.h:183
   GL_TEXTURE_COORD_ARRAY_SIZE : constant := 16#8088#;  --  gl.h:184
   GL_TEXTURE_COORD_ARRAY_TYPE : constant := 16#8089#;  --  gl.h:185
   GL_TEXTURE_COORD_ARRAY_STRIDE : constant := 16#808A#;  --  gl.h:186
   GL_EDGE_FLAG_ARRAY_STRIDE : constant := 16#808C#;  --  gl.h:187
   GL_VERTEX_ARRAY_POINTER : constant := 16#808E#;  --  gl.h:188
   GL_NORMAL_ARRAY_POINTER : constant := 16#808F#;  --  gl.h:189
   GL_COLOR_ARRAY_POINTER : constant := 16#8090#;  --  gl.h:190
   GL_INDEX_ARRAY_POINTER : constant := 16#8091#;  --  gl.h:191
   GL_TEXTURE_COORD_ARRAY_POINTER : constant := 16#8092#;  --  gl.h:192
   GL_EDGE_FLAG_ARRAY_POINTER : constant := 16#8093#;  --  gl.h:193
   GL_V2F : constant := 16#2A20#;  --  gl.h:194
   GL_V3F : constant := 16#2A21#;  --  gl.h:195
   GL_C4UB_V2F : constant := 16#2A22#;  --  gl.h:196
   GL_C4UB_V3F : constant := 16#2A23#;  --  gl.h:197
   GL_C3F_V3F : constant := 16#2A24#;  --  gl.h:198
   GL_N3F_V3F : constant := 16#2A25#;  --  gl.h:199
   GL_C4F_N3F_V3F : constant := 16#2A26#;  --  gl.h:200
   GL_T2F_V3F : constant := 16#2A27#;  --  gl.h:201
   GL_T4F_V4F : constant := 16#2A28#;  --  gl.h:202
   GL_T2F_C4UB_V3F : constant := 16#2A29#;  --  gl.h:203
   GL_T2F_C3F_V3F : constant := 16#2A2A#;  --  gl.h:204
   GL_T2F_N3F_V3F : constant := 16#2A2B#;  --  gl.h:205
   GL_T2F_C4F_N3F_V3F : constant := 16#2A2C#;  --  gl.h:206
   GL_T4F_C4F_N3F_V4F : constant := 16#2A2D#;  --  gl.h:207

   GL_MATRIX_MODE : constant := 16#0BA0#;  --  gl.h:210
   GL_MODELVIEW : constant := 16#1700#;  --  gl.h:211
   GL_PROJECTION : constant := 16#1701#;  --  gl.h:212
   GL_TEXTURE : constant := 16#1702#;  --  gl.h:213

   GL_POINT_SMOOTH : constant := 16#0B10#;  --  gl.h:216
   GL_POINT_SIZE : constant := 16#0B11#;  --  gl.h:217
   GL_POINT_SIZE_GRANULARITY : constant := 16#0B13#;  --  gl.h:218
   GL_POINT_SIZE_RANGE : constant := 16#0B12#;  --  gl.h:219

   GL_LINE_SMOOTH : constant := 16#0B20#;  --  gl.h:222
   GL_LINE_STIPPLE : constant := 16#0B24#;  --  gl.h:223
   GL_LINE_STIPPLE_PATTERN : constant := 16#0B25#;  --  gl.h:224
   GL_LINE_STIPPLE_REPEAT : constant := 16#0B26#;  --  gl.h:225
   GL_LINE_WIDTH : constant := 16#0B21#;  --  gl.h:226
   GL_LINE_WIDTH_GRANULARITY : constant := 16#0B23#;  --  gl.h:227
   GL_LINE_WIDTH_RANGE : constant := 16#0B22#;  --  gl.h:228

   GL_POINT : constant := 16#1B00#;  --  gl.h:231
   GL_LINE : constant := 16#1B01#;  --  gl.h:232
   GL_FILL : constant := 16#1B02#;  --  gl.h:233
   GL_CW : constant := 16#0900#;  --  gl.h:234
   GL_CCW : constant := 16#0901#;  --  gl.h:235
   GL_FRONT : constant := 16#0404#;  --  gl.h:236
   GL_BACK : constant := 16#0405#;  --  gl.h:237
   GL_POLYGON_MODE : constant := 16#0B40#;  --  gl.h:238
   GL_POLYGON_SMOOTH : constant := 16#0B41#;  --  gl.h:239
   GL_POLYGON_STIPPLE : constant := 16#0B42#;  --  gl.h:240
   GL_EDGE_FLAG : constant := 16#0B43#;  --  gl.h:241
   GL_CULL_FACE : constant := 16#0B44#;  --  gl.h:242
   GL_CULL_FACE_MODE : constant := 16#0B45#;  --  gl.h:243
   GL_FRONT_FACE : constant := 16#0B46#;  --  gl.h:244
   GL_POLYGON_OFFSET_FACTOR : constant := 16#8038#;  --  gl.h:245
   GL_POLYGON_OFFSET_UNITS : constant := 16#2A00#;  --  gl.h:246
   GL_POLYGON_OFFSET_POINT : constant := 16#2A01#;  --  gl.h:247
   GL_POLYGON_OFFSET_LINE : constant := 16#2A02#;  --  gl.h:248
   GL_POLYGON_OFFSET_FILL : constant := 16#8037#;  --  gl.h:249

   GL_COMPILE : constant := 16#1300#;  --  gl.h:252
   GL_COMPILE_AND_EXECUTE : constant := 16#1301#;  --  gl.h:253
   GL_LIST_BASE : constant := 16#0B32#;  --  gl.h:254
   GL_LIST_INDEX : constant := 16#0B33#;  --  gl.h:255
   GL_LIST_MODE : constant := 16#0B30#;  --  gl.h:256

   GL_NEVER : constant := 16#0200#;  --  gl.h:259
   GL_LESS : constant := 16#0201#;  --  gl.h:260
   GL_EQUAL : constant := 16#0202#;  --  gl.h:261
   GL_LEQUAL : constant := 16#0203#;  --  gl.h:262
   GL_GREATER : constant := 16#0204#;  --  gl.h:263
   GL_NOTEQUAL : constant := 16#0205#;  --  gl.h:264
   GL_GEQUAL : constant := 16#0206#;  --  gl.h:265
   GL_ALWAYS : constant := 16#0207#;  --  gl.h:266
   GL_DEPTH_TEST : constant := 16#0B71#;  --  gl.h:267
   GL_DEPTH_BITS : constant := 16#0D56#;  --  gl.h:268
   GL_DEPTH_CLEAR_VALUE : constant := 16#0B73#;  --  gl.h:269
   GL_DEPTH_FUNC : constant := 16#0B74#;  --  gl.h:270
   GL_DEPTH_RANGE : constant := 16#0B70#;  --  gl.h:271
   GL_DEPTH_WRITEMASK : constant := 16#0B72#;  --  gl.h:272
   GL_DEPTH_COMPONENT : constant := 16#1902#;  --  gl.h:273

   GL_LIGHTING : constant := 16#0B50#;  --  gl.h:276
   GL_LIGHT0 : constant := 16#4000#;  --  gl.h:277
   GL_LIGHT1 : constant := 16#4001#;  --  gl.h:278
   GL_LIGHT2 : constant := 16#4002#;  --  gl.h:279
   GL_LIGHT3 : constant := 16#4003#;  --  gl.h:280
   GL_LIGHT4 : constant := 16#4004#;  --  gl.h:281
   GL_LIGHT5 : constant := 16#4005#;  --  gl.h:282
   GL_LIGHT6 : constant := 16#4006#;  --  gl.h:283
   GL_LIGHT7 : constant := 16#4007#;  --  gl.h:284
   GL_SPOT_EXPONENT : constant := 16#1205#;  --  gl.h:285
   GL_SPOT_CUTOFF : constant := 16#1206#;  --  gl.h:286
   GL_CONSTANT_ATTENUATION : constant := 16#1207#;  --  gl.h:287
   GL_LINEAR_ATTENUATION : constant := 16#1208#;  --  gl.h:288
   GL_QUADRATIC_ATTENUATION : constant := 16#1209#;  --  gl.h:289
   GL_AMBIENT : constant := 16#1200#;  --  gl.h:290
   GL_DIFFUSE : constant := 16#1201#;  --  gl.h:291
   GL_SPECULAR : constant := 16#1202#;  --  gl.h:292
   GL_SHININESS : constant := 16#1601#;  --  gl.h:293
   GL_EMISSION : constant := 16#1600#;  --  gl.h:294
   GL_POSITION : constant := 16#1203#;  --  gl.h:295
   GL_SPOT_DIRECTION : constant := 16#1204#;  --  gl.h:296
   GL_AMBIENT_AND_DIFFUSE : constant := 16#1602#;  --  gl.h:297
   GL_COLOR_INDEXES : constant := 16#1603#;  --  gl.h:298
   GL_LIGHT_MODEL_TWO_SIDE : constant := 16#0B52#;  --  gl.h:299
   GL_LIGHT_MODEL_LOCAL_VIEWER : constant := 16#0B51#;  --  gl.h:300
   GL_LIGHT_MODEL_AMBIENT : constant := 16#0B53#;  --  gl.h:301
   GL_FRONT_AND_BACK : constant := 16#0408#;  --  gl.h:302
   GL_SHADE_MODEL : constant := 16#0B54#;  --  gl.h:303
   GL_FLAT : constant := 16#1D00#;  --  gl.h:304
   GL_SMOOTH : constant := 16#1D01#;  --  gl.h:305
   GL_COLOR_MATERIAL : constant := 16#0B57#;  --  gl.h:306
   GL_COLOR_MATERIAL_FACE : constant := 16#0B55#;  --  gl.h:307
   GL_COLOR_MATERIAL_PARAMETER : constant := 16#0B56#;  --  gl.h:308
   GL_NORMALIZE : constant := 16#0BA1#;  --  gl.h:309

   GL_CLIP_PLANE0 : constant := 16#3000#;  --  gl.h:312
   GL_CLIP_PLANE1 : constant := 16#3001#;  --  gl.h:313
   GL_CLIP_PLANE2 : constant := 16#3002#;  --  gl.h:314
   GL_CLIP_PLANE3 : constant := 16#3003#;  --  gl.h:315
   GL_CLIP_PLANE4 : constant := 16#3004#;  --  gl.h:316
   GL_CLIP_PLANE5 : constant := 16#3005#;  --  gl.h:317

   GL_ACCUM_RED_BITS : constant := 16#0D58#;  --  gl.h:320
   GL_ACCUM_GREEN_BITS : constant := 16#0D59#;  --  gl.h:321
   GL_ACCUM_BLUE_BITS : constant := 16#0D5A#;  --  gl.h:322
   GL_ACCUM_ALPHA_BITS : constant := 16#0D5B#;  --  gl.h:323
   GL_ACCUM_CLEAR_VALUE : constant := 16#0B80#;  --  gl.h:324
   GL_ACCUM : constant := 16#0100#;  --  gl.h:325
   GL_ADD : constant := 16#0104#;  --  gl.h:326
   GL_LOAD : constant := 16#0101#;  --  gl.h:327
   GL_MULT : constant := 16#0103#;  --  gl.h:328
   GL_RETURN : constant := 16#0102#;  --  gl.h:329

   GL_ALPHA_TEST : constant := 16#0BC0#;  --  gl.h:332
   GL_ALPHA_TEST_REF : constant := 16#0BC2#;  --  gl.h:333
   GL_ALPHA_TEST_FUNC : constant := 16#0BC1#;  --  gl.h:334

   GL_BLEND : constant := 16#0BE2#;  --  gl.h:337
   GL_BLEND_SRC : constant := 16#0BE1#;  --  gl.h:338
   GL_BLEND_DST : constant := 16#0BE0#;  --  gl.h:339
   GL_ZERO : constant := 0;  --  gl.h:340
   GL_ONE : constant := 1;  --  gl.h:341
   GL_SRC_COLOR : constant := 16#0300#;  --  gl.h:342
   GL_ONE_MINUS_SRC_COLOR : constant := 16#0301#;  --  gl.h:343
   GL_SRC_ALPHA : constant := 16#0302#;  --  gl.h:344
   GL_ONE_MINUS_SRC_ALPHA : constant := 16#0303#;  --  gl.h:345
   GL_DST_ALPHA : constant := 16#0304#;  --  gl.h:346
   GL_ONE_MINUS_DST_ALPHA : constant := 16#0305#;  --  gl.h:347
   GL_DST_COLOR : constant := 16#0306#;  --  gl.h:348
   GL_ONE_MINUS_DST_COLOR : constant := 16#0307#;  --  gl.h:349
   GL_SRC_ALPHA_SATURATE : constant := 16#0308#;  --  gl.h:350

   GL_FEEDBACK : constant := 16#1C01#;  --  gl.h:353
   GL_RENDER : constant := 16#1C00#;  --  gl.h:354
   GL_SELECT : constant := 16#1C02#;  --  gl.h:355

   GL_2D : constant := 16#0600#;  --  gl.h:358
   GL_3D : constant := 16#0601#;  --  gl.h:359
   GL_3D_COLOR : constant := 16#0602#;  --  gl.h:360
   GL_3D_COLOR_TEXTURE : constant := 16#0603#;  --  gl.h:361
   GL_4D_COLOR_TEXTURE : constant := 16#0604#;  --  gl.h:362
   GL_POINT_TOKEN : constant := 16#0701#;  --  gl.h:363
   GL_LINE_TOKEN : constant := 16#0702#;  --  gl.h:364
   GL_LINE_RESET_TOKEN : constant := 16#0707#;  --  gl.h:365
   GL_POLYGON_TOKEN : constant := 16#0703#;  --  gl.h:366
   GL_BITMAP_TOKEN : constant := 16#0704#;  --  gl.h:367
   GL_DRAW_PIXEL_TOKEN : constant := 16#0705#;  --  gl.h:368
   GL_COPY_PIXEL_TOKEN : constant := 16#0706#;  --  gl.h:369
   GL_PASS_THROUGH_TOKEN : constant := 16#0700#;  --  gl.h:370
   GL_FEEDBACK_BUFFER_POINTER : constant := 16#0DF0#;  --  gl.h:371
   GL_FEEDBACK_BUFFER_SIZE : constant := 16#0DF1#;  --  gl.h:372
   GL_FEEDBACK_BUFFER_TYPE : constant := 16#0DF2#;  --  gl.h:373

   GL_SELECTION_BUFFER_POINTER : constant := 16#0DF3#;  --  gl.h:376
   GL_SELECTION_BUFFER_SIZE : constant := 16#0DF4#;  --  gl.h:377

   GL_FOG : constant := 16#0B60#;  --  gl.h:380
   GL_FOG_MODE : constant := 16#0B65#;  --  gl.h:381
   GL_FOG_DENSITY : constant := 16#0B62#;  --  gl.h:382
   GL_FOG_COLOR : constant := 16#0B66#;  --  gl.h:383
   GL_FOG_INDEX : constant := 16#0B61#;  --  gl.h:384
   GL_FOG_START : constant := 16#0B63#;  --  gl.h:385
   GL_FOG_END : constant := 16#0B64#;  --  gl.h:386
   GL_LINEAR : constant := 16#2601#;  --  gl.h:387
   GL_EXP : constant := 16#0800#;  --  gl.h:388
   GL_EXP2 : constant := 16#0801#;  --  gl.h:389

   GL_LOGIC_OP : constant := 16#0BF1#;  --  gl.h:392
   GL_INDEX_LOGIC_OP : constant := 16#0BF1#;  --  gl.h:393
   GL_COLOR_LOGIC_OP : constant := 16#0BF2#;  --  gl.h:394
   GL_LOGIC_OP_MODE : constant := 16#0BF0#;  --  gl.h:395
   GL_CLEAR : constant := 16#1500#;  --  gl.h:396
   GL_SET : constant := 16#150F#;  --  gl.h:397
   GL_COPY : constant := 16#1503#;  --  gl.h:398
   GL_COPY_INVERTED : constant := 16#150C#;  --  gl.h:399
   GL_NOOP : constant := 16#1505#;  --  gl.h:400
   GL_INVERT : constant := 16#150A#;  --  gl.h:401
   GL_AND : constant := 16#1501#;  --  gl.h:402
   GL_NAND : constant := 16#150E#;  --  gl.h:403
   GL_OR : constant := 16#1507#;  --  gl.h:404
   GL_NOR : constant := 16#1508#;  --  gl.h:405
   GL_XOR : constant := 16#1506#;  --  gl.h:406
   GL_EQUIV : constant := 16#1509#;  --  gl.h:407
   GL_AND_REVERSE : constant := 16#1502#;  --  gl.h:408
   GL_AND_INVERTED : constant := 16#1504#;  --  gl.h:409
   GL_OR_REVERSE : constant := 16#150B#;  --  gl.h:410
   GL_OR_INVERTED : constant := 16#150D#;  --  gl.h:411

   GL_STENCIL_BITS : constant := 16#0D57#;  --  gl.h:414
   GL_STENCIL_TEST : constant := 16#0B90#;  --  gl.h:415
   GL_STENCIL_CLEAR_VALUE : constant := 16#0B91#;  --  gl.h:416
   GL_STENCIL_FUNC : constant := 16#0B92#;  --  gl.h:417
   GL_STENCIL_VALUE_MASK : constant := 16#0B93#;  --  gl.h:418
   GL_STENCIL_FAIL : constant := 16#0B94#;  --  gl.h:419
   GL_STENCIL_PASS_DEPTH_FAIL : constant := 16#0B95#;  --  gl.h:420
   GL_STENCIL_PASS_DEPTH_PASS : constant := 16#0B96#;  --  gl.h:421
   GL_STENCIL_REF : constant := 16#0B97#;  --  gl.h:422
   GL_STENCIL_WRITEMASK : constant := 16#0B98#;  --  gl.h:423
   GL_STENCIL_INDEX : constant := 16#1901#;  --  gl.h:424
   GL_KEEP : constant := 16#1E00#;  --  gl.h:425
   GL_REPLACE : constant := 16#1E01#;  --  gl.h:426
   GL_INCR : constant := 16#1E02#;  --  gl.h:427
   GL_DECR : constant := 16#1E03#;  --  gl.h:428

   GL_NONE : constant := 0;  --  gl.h:431
   GL_LEFT : constant := 16#0406#;  --  gl.h:432
   GL_RIGHT : constant := 16#0407#;  --  gl.h:433

   GL_FRONT_LEFT : constant := 16#0400#;  --  gl.h:437
   GL_FRONT_RIGHT : constant := 16#0401#;  --  gl.h:438
   GL_BACK_LEFT : constant := 16#0402#;  --  gl.h:439
   GL_BACK_RIGHT : constant := 16#0403#;  --  gl.h:440
   GL_AUX0 : constant := 16#0409#;  --  gl.h:441
   GL_AUX1 : constant := 16#040A#;  --  gl.h:442
   GL_AUX2 : constant := 16#040B#;  --  gl.h:443
   GL_AUX3 : constant := 16#040C#;  --  gl.h:444
   GL_COLOR_INDEX : constant := 16#1900#;  --  gl.h:445
   GL_RED : constant := 16#1903#;  --  gl.h:446
   GL_GREEN : constant := 16#1904#;  --  gl.h:447
   GL_BLUE : constant := 16#1905#;  --  gl.h:448
   GL_ALPHA : constant := 16#1906#;  --  gl.h:449
   GL_LUMINANCE : constant := 16#1909#;  --  gl.h:450
   GL_LUMINANCE_ALPHA : constant := 16#190A#;  --  gl.h:451
   GL_ALPHA_BITS : constant := 16#0D55#;  --  gl.h:452
   GL_RED_BITS : constant := 16#0D52#;  --  gl.h:453
   GL_GREEN_BITS : constant := 16#0D53#;  --  gl.h:454
   GL_BLUE_BITS : constant := 16#0D54#;  --  gl.h:455
   GL_INDEX_BITS : constant := 16#0D51#;  --  gl.h:456
   GL_SUBPIXEL_BITS : constant := 16#0D50#;  --  gl.h:457
   GL_AUX_BUFFERS : constant := 16#0C00#;  --  gl.h:458
   GL_READ_BUFFER : constant := 16#0C02#;  --  gl.h:459
   GL_DRAW_BUFFER : constant := 16#0C01#;  --  gl.h:460
   GL_DOUBLEBUFFER : constant := 16#0C32#;  --  gl.h:461
   GL_STEREO : constant := 16#0C33#;  --  gl.h:462
   GL_BITMAP : constant := 16#1A00#;  --  gl.h:463
   GL_COLOR : constant := 16#1800#;  --  gl.h:464
   GL_DEPTH : constant := 16#1801#;  --  gl.h:465
   GL_STENCIL : constant := 16#1802#;  --  gl.h:466
   GL_DITHER : constant := 16#0BD0#;  --  gl.h:467
   GL_RGB : constant := 16#1907#;  --  gl.h:468
   GL_RGBA : constant := 16#1908#;  --  gl.h:469

   GL_MAX_LIST_NESTING : constant := 16#0B31#;  --  gl.h:472
   GL_MAX_EVAL_ORDER : constant := 16#0D30#;  --  gl.h:473
   GL_MAX_LIGHTS : constant := 16#0D31#;  --  gl.h:474
   GL_MAX_CLIP_PLANES : constant := 16#0D32#;  --  gl.h:475
   GL_MAX_TEXTURE_SIZE : constant := 16#0D33#;  --  gl.h:476
   GL_MAX_PIXEL_MAP_TABLE : constant := 16#0D34#;  --  gl.h:477
   GL_MAX_ATTRIB_STACK_DEPTH : constant := 16#0D35#;  --  gl.h:478
   GL_MAX_MODELVIEW_STACK_DEPTH : constant := 16#0D36#;  --  gl.h:479
   GL_MAX_NAME_STACK_DEPTH : constant := 16#0D37#;  --  gl.h:480
   GL_MAX_PROJECTION_STACK_DEPTH : constant := 16#0D38#;  --  gl.h:481
   GL_MAX_TEXTURE_STACK_DEPTH : constant := 16#0D39#;  --  gl.h:482
   GL_MAX_VIEWPORT_DIMS : constant := 16#0D3A#;  --  gl.h:483
   GL_MAX_CLIENT_ATTRIB_STACK_DEPTH : constant := 16#0D3B#;  --  gl.h:484

   GL_ATTRIB_STACK_DEPTH : constant := 16#0BB0#;  --  gl.h:487
   GL_CLIENT_ATTRIB_STACK_DEPTH : constant := 16#0BB1#;  --  gl.h:488
   GL_COLOR_CLEAR_VALUE : constant := 16#0C22#;  --  gl.h:489
   GL_COLOR_WRITEMASK : constant := 16#0C23#;  --  gl.h:490
   GL_CURRENT_INDEX : constant := 16#0B01#;  --  gl.h:491
   GL_CURRENT_COLOR : constant := 16#0B00#;  --  gl.h:492
   GL_CURRENT_NORMAL : constant := 16#0B02#;  --  gl.h:493
   GL_CURRENT_RASTER_COLOR : constant := 16#0B04#;  --  gl.h:494
   GL_CURRENT_RASTER_DISTANCE : constant := 16#0B09#;  --  gl.h:495
   GL_CURRENT_RASTER_INDEX : constant := 16#0B05#;  --  gl.h:496
   GL_CURRENT_RASTER_POSITION : constant := 16#0B07#;  --  gl.h:497
   GL_CURRENT_RASTER_TEXTURE_COORDS : constant := 16#0B06#;  --  gl.h:498
   GL_CURRENT_RASTER_POSITION_VALID : constant := 16#0B08#;  --  gl.h:499
   GL_CURRENT_TEXTURE_COORDS : constant := 16#0B03#;  --  gl.h:500
   GL_INDEX_CLEAR_VALUE : constant := 16#0C20#;  --  gl.h:501
   GL_INDEX_MODE : constant := 16#0C30#;  --  gl.h:502
   GL_INDEX_WRITEMASK : constant := 16#0C21#;  --  gl.h:503
   GL_MODELVIEW_MATRIX : constant := 16#0BA6#;  --  gl.h:504
   GL_MODELVIEW_STACK_DEPTH : constant := 16#0BA3#;  --  gl.h:505
   GL_NAME_STACK_DEPTH : constant := 16#0D70#;  --  gl.h:506
   GL_PROJECTION_MATRIX : constant := 16#0BA7#;  --  gl.h:507
   GL_PROJECTION_STACK_DEPTH : constant := 16#0BA4#;  --  gl.h:508
   GL_RENDER_MODE : constant := 16#0C40#;  --  gl.h:509
   GL_RGBA_MODE : constant := 16#0C31#;  --  gl.h:510
   GL_TEXTURE_MATRIX : constant := 16#0BA8#;  --  gl.h:511
   GL_TEXTURE_STACK_DEPTH : constant := 16#0BA5#;  --  gl.h:512
   GL_VIEWPORT : constant := 16#0BA2#;  --  gl.h:513

   GL_AUTO_NORMAL : constant := 16#0D80#;  --  gl.h:516
   GL_MAP1_COLOR_4 : constant := 16#0D90#;  --  gl.h:517
   GL_MAP1_INDEX : constant := 16#0D91#;  --  gl.h:518
   GL_MAP1_NORMAL : constant := 16#0D92#;  --  gl.h:519
   GL_MAP1_TEXTURE_COORD_1 : constant := 16#0D93#;  --  gl.h:520
   GL_MAP1_TEXTURE_COORD_2 : constant := 16#0D94#;  --  gl.h:521
   GL_MAP1_TEXTURE_COORD_3 : constant := 16#0D95#;  --  gl.h:522
   GL_MAP1_TEXTURE_COORD_4 : constant := 16#0D96#;  --  gl.h:523
   GL_MAP1_VERTEX_3 : constant := 16#0D97#;  --  gl.h:524
   GL_MAP1_VERTEX_4 : constant := 16#0D98#;  --  gl.h:525
   GL_MAP2_COLOR_4 : constant := 16#0DB0#;  --  gl.h:526
   GL_MAP2_INDEX : constant := 16#0DB1#;  --  gl.h:527
   GL_MAP2_NORMAL : constant := 16#0DB2#;  --  gl.h:528
   GL_MAP2_TEXTURE_COORD_1 : constant := 16#0DB3#;  --  gl.h:529
   GL_MAP2_TEXTURE_COORD_2 : constant := 16#0DB4#;  --  gl.h:530
   GL_MAP2_TEXTURE_COORD_3 : constant := 16#0DB5#;  --  gl.h:531
   GL_MAP2_TEXTURE_COORD_4 : constant := 16#0DB6#;  --  gl.h:532
   GL_MAP2_VERTEX_3 : constant := 16#0DB7#;  --  gl.h:533
   GL_MAP2_VERTEX_4 : constant := 16#0DB8#;  --  gl.h:534
   GL_MAP1_GRID_DOMAIN : constant := 16#0DD0#;  --  gl.h:535
   GL_MAP1_GRID_SEGMENTS : constant := 16#0DD1#;  --  gl.h:536
   GL_MAP2_GRID_DOMAIN : constant := 16#0DD2#;  --  gl.h:537
   GL_MAP2_GRID_SEGMENTS : constant := 16#0DD3#;  --  gl.h:538
   GL_COEFF : constant := 16#0A00#;  --  gl.h:539
   GL_ORDER : constant := 16#0A01#;  --  gl.h:540
   GL_DOMAIN : constant := 16#0A02#;  --  gl.h:541

   GL_PERSPECTIVE_CORRECTION_HINT : constant := 16#0C50#;  --  gl.h:544
   GL_POINT_SMOOTH_HINT : constant := 16#0C51#;  --  gl.h:545
   GL_LINE_SMOOTH_HINT : constant := 16#0C52#;  --  gl.h:546
   GL_POLYGON_SMOOTH_HINT : constant := 16#0C53#;  --  gl.h:547
   GL_FOG_HINT : constant := 16#0C54#;  --  gl.h:548
   GL_DONT_CARE : constant := 16#1100#;  --  gl.h:549
   GL_FASTEST : constant := 16#1101#;  --  gl.h:550
   GL_NICEST : constant := 16#1102#;  --  gl.h:551

   GL_SCISSOR_BOX : constant := 16#0C10#;  --  gl.h:554
   GL_SCISSOR_TEST : constant := 16#0C11#;  --  gl.h:555

   GL_MAP_COLOR : constant := 16#0D10#;  --  gl.h:558
   GL_MAP_STENCIL : constant := 16#0D11#;  --  gl.h:559
   GL_INDEX_SHIFT : constant := 16#0D12#;  --  gl.h:560
   GL_INDEX_OFFSET : constant := 16#0D13#;  --  gl.h:561
   GL_RED_SCALE : constant := 16#0D14#;  --  gl.h:562
   GL_RED_BIAS : constant := 16#0D15#;  --  gl.h:563
   GL_GREEN_SCALE : constant := 16#0D18#;  --  gl.h:564
   GL_GREEN_BIAS : constant := 16#0D19#;  --  gl.h:565
   GL_BLUE_SCALE : constant := 16#0D1A#;  --  gl.h:566
   GL_BLUE_BIAS : constant := 16#0D1B#;  --  gl.h:567
   GL_ALPHA_SCALE : constant := 16#0D1C#;  --  gl.h:568
   GL_ALPHA_BIAS : constant := 16#0D1D#;  --  gl.h:569
   GL_DEPTH_SCALE : constant := 16#0D1E#;  --  gl.h:570
   GL_DEPTH_BIAS : constant := 16#0D1F#;  --  gl.h:571
   GL_PIXEL_MAP_S_TO_S_SIZE : constant := 16#0CB1#;  --  gl.h:572
   GL_PIXEL_MAP_I_TO_I_SIZE : constant := 16#0CB0#;  --  gl.h:573
   GL_PIXEL_MAP_I_TO_R_SIZE : constant := 16#0CB2#;  --  gl.h:574
   GL_PIXEL_MAP_I_TO_G_SIZE : constant := 16#0CB3#;  --  gl.h:575
   GL_PIXEL_MAP_I_TO_B_SIZE : constant := 16#0CB4#;  --  gl.h:576
   GL_PIXEL_MAP_I_TO_A_SIZE : constant := 16#0CB5#;  --  gl.h:577
   GL_PIXEL_MAP_R_TO_R_SIZE : constant := 16#0CB6#;  --  gl.h:578
   GL_PIXEL_MAP_G_TO_G_SIZE : constant := 16#0CB7#;  --  gl.h:579
   GL_PIXEL_MAP_B_TO_B_SIZE : constant := 16#0CB8#;  --  gl.h:580
   GL_PIXEL_MAP_A_TO_A_SIZE : constant := 16#0CB9#;  --  gl.h:581
   GL_PIXEL_MAP_S_TO_S : constant := 16#0C71#;  --  gl.h:582
   GL_PIXEL_MAP_I_TO_I : constant := 16#0C70#;  --  gl.h:583
   GL_PIXEL_MAP_I_TO_R : constant := 16#0C72#;  --  gl.h:584
   GL_PIXEL_MAP_I_TO_G : constant := 16#0C73#;  --  gl.h:585
   GL_PIXEL_MAP_I_TO_B : constant := 16#0C74#;  --  gl.h:586
   GL_PIXEL_MAP_I_TO_A : constant := 16#0C75#;  --  gl.h:587
   GL_PIXEL_MAP_R_TO_R : constant := 16#0C76#;  --  gl.h:588
   GL_PIXEL_MAP_G_TO_G : constant := 16#0C77#;  --  gl.h:589
   GL_PIXEL_MAP_B_TO_B : constant := 16#0C78#;  --  gl.h:590
   GL_PIXEL_MAP_A_TO_A : constant := 16#0C79#;  --  gl.h:591
   GL_PACK_ALIGNMENT : constant := 16#0D05#;  --  gl.h:592
   GL_PACK_LSB_FIRST : constant := 16#0D01#;  --  gl.h:593
   GL_PACK_ROW_LENGTH : constant := 16#0D02#;  --  gl.h:594
   GL_PACK_SKIP_PIXELS : constant := 16#0D04#;  --  gl.h:595
   GL_PACK_SKIP_ROWS : constant := 16#0D03#;  --  gl.h:596
   GL_PACK_SWAP_BYTES : constant := 16#0D00#;  --  gl.h:597
   GL_UNPACK_ALIGNMENT : constant := 16#0CF5#;  --  gl.h:598
   GL_UNPACK_LSB_FIRST : constant := 16#0CF1#;  --  gl.h:599
   GL_UNPACK_ROW_LENGTH : constant := 16#0CF2#;  --  gl.h:600
   GL_UNPACK_SKIP_PIXELS : constant := 16#0CF4#;  --  gl.h:601
   GL_UNPACK_SKIP_ROWS : constant := 16#0CF3#;  --  gl.h:602
   GL_UNPACK_SWAP_BYTES : constant := 16#0CF0#;  --  gl.h:603
   GL_ZOOM_X : constant := 16#0D16#;  --  gl.h:604
   GL_ZOOM_Y : constant := 16#0D17#;  --  gl.h:605

   GL_TEXTURE_ENV : constant := 16#2300#;  --  gl.h:608
   GL_TEXTURE_ENV_MODE : constant := 16#2200#;  --  gl.h:609
   GL_TEXTURE_1D : constant := 16#0DE0#;  --  gl.h:610
   GL_TEXTURE_2D : constant := 16#0DE1#;  --  gl.h:611
   GL_TEXTURE_WRAP_S : constant := 16#2802#;  --  gl.h:612
   GL_TEXTURE_WRAP_T : constant := 16#2803#;  --  gl.h:613
   GL_TEXTURE_MAG_FILTER : constant := 16#2800#;  --  gl.h:614
   GL_TEXTURE_MIN_FILTER : constant := 16#2801#;  --  gl.h:615
   GL_TEXTURE_ENV_COLOR : constant := 16#2201#;  --  gl.h:616
   GL_TEXTURE_GEN_S : constant := 16#0C60#;  --  gl.h:617
   GL_TEXTURE_GEN_T : constant := 16#0C61#;  --  gl.h:618
   GL_TEXTURE_GEN_R : constant := 16#0C62#;  --  gl.h:619
   GL_TEXTURE_GEN_Q : constant := 16#0C63#;  --  gl.h:620
   GL_TEXTURE_GEN_MODE : constant := 16#2500#;  --  gl.h:621
   GL_TEXTURE_BORDER_COLOR : constant := 16#1004#;  --  gl.h:622
   GL_TEXTURE_WIDTH : constant := 16#1000#;  --  gl.h:623
   GL_TEXTURE_HEIGHT : constant := 16#1001#;  --  gl.h:624
   GL_TEXTURE_BORDER : constant := 16#1005#;  --  gl.h:625
   GL_TEXTURE_COMPONENTS : constant := 16#1003#;  --  gl.h:626
   GL_TEXTURE_RED_SIZE : constant := 16#805C#;  --  gl.h:627
   GL_TEXTURE_GREEN_SIZE : constant := 16#805D#;  --  gl.h:628
   GL_TEXTURE_BLUE_SIZE : constant := 16#805E#;  --  gl.h:629
   GL_TEXTURE_ALPHA_SIZE : constant := 16#805F#;  --  gl.h:630
   GL_TEXTURE_LUMINANCE_SIZE : constant := 16#8060#;  --  gl.h:631
   GL_TEXTURE_INTENSITY_SIZE : constant := 16#8061#;  --  gl.h:632
   GL_NEAREST_MIPMAP_NEAREST : constant := 16#2700#;  --  gl.h:633
   GL_NEAREST_MIPMAP_LINEAR : constant := 16#2702#;  --  gl.h:634
   GL_LINEAR_MIPMAP_NEAREST : constant := 16#2701#;  --  gl.h:635
   GL_LINEAR_MIPMAP_LINEAR : constant := 16#2703#;  --  gl.h:636
   GL_OBJECT_LINEAR : constant := 16#2401#;  --  gl.h:637
   GL_OBJECT_PLANE : constant := 16#2501#;  --  gl.h:638
   GL_EYE_LINEAR : constant := 16#2400#;  --  gl.h:639
   GL_EYE_PLANE : constant := 16#2502#;  --  gl.h:640
   GL_SPHERE_MAP : constant := 16#2402#;  --  gl.h:641
   GL_DECAL : constant := 16#2101#;  --  gl.h:642
   GL_MODULATE : constant := 16#2100#;  --  gl.h:643
   GL_NEAREST : constant := 16#2600#;  --  gl.h:644
   GL_REPEAT : constant := 16#2901#;  --  gl.h:645
   GL_CLAMP : constant := 16#2900#;  --  gl.h:646
   GL_S : constant := 16#2000#;  --  gl.h:647
   GL_T : constant := 16#2001#;  --  gl.h:648
   GL_R : constant := 16#2002#;  --  gl.h:649
   GL_Q : constant := 16#2003#;  --  gl.h:650

   GL_VENDOR : constant := 16#1F00#;  --  gl.h:653
   GL_RENDERER : constant := 16#1F01#;  --  gl.h:654
   GL_VERSION : constant := 16#1F02#;  --  gl.h:655
   GL_EXTENSIONS : constant := 16#1F03#;  --  gl.h:656

   GL_NO_ERROR : constant := 0;  --  gl.h:659
   GL_INVALID_ENUM : constant := 16#0500#;  --  gl.h:660
   GL_INVALID_VALUE : constant := 16#0501#;  --  gl.h:661
   GL_INVALID_OPERATION : constant := 16#0502#;  --  gl.h:662
   GL_STACK_OVERFLOW : constant := 16#0503#;  --  gl.h:663
   GL_STACK_UNDERFLOW : constant := 16#0504#;  --  gl.h:664
   GL_OUT_OF_MEMORY : constant := 16#0505#;  --  gl.h:665

   GL_CURRENT_BIT : constant := 16#00000001#;  --  gl.h:668
   GL_POINT_BIT : constant := 16#00000002#;  --  gl.h:669
   GL_LINE_BIT : constant := 16#00000004#;  --  gl.h:670
   GL_POLYGON_BIT : constant := 16#00000008#;  --  gl.h:671
   GL_POLYGON_STIPPLE_BIT : constant := 16#00000010#;  --  gl.h:672
   GL_PIXEL_MODE_BIT : constant := 16#00000020#;  --  gl.h:673
   GL_LIGHTING_BIT : constant := 16#00000040#;  --  gl.h:674
   GL_FOG_BIT : constant := 16#00000080#;  --  gl.h:675
   GL_DEPTH_BUFFER_BIT : constant := 16#00000100#;  --  gl.h:676
   GL_ACCUM_BUFFER_BIT : constant := 16#00000200#;  --  gl.h:677
   GL_STENCIL_BUFFER_BIT : constant := 16#00000400#;  --  gl.h:678
   GL_VIEWPORT_BIT : constant := 16#00000800#;  --  gl.h:679
   GL_TRANSFORM_BIT : constant := 16#00001000#;  --  gl.h:680
   GL_ENABLE_BIT : constant := 16#00002000#;  --  gl.h:681
   GL_COLOR_BUFFER_BIT : constant := 16#00004000#;  --  gl.h:682
   GL_HINT_BIT : constant := 16#00008000#;  --  gl.h:683
   GL_EVAL_BIT : constant := 16#00010000#;  --  gl.h:684
   GL_LIST_BIT : constant := 16#00020000#;  --  gl.h:685
   GL_TEXTURE_BIT : constant := 16#00040000#;  --  gl.h:686
   GL_SCISSOR_BIT : constant := 16#00080000#;  --  gl.h:687
   GL_ALL_ATTRIB_BITS : constant := 16#FFFFFFFF#;  --  gl.h:688

   GL_PROXY_TEXTURE_1D : constant := 16#8063#;  --  gl.h:692
   GL_PROXY_TEXTURE_2D : constant := 16#8064#;  --  gl.h:693
   GL_TEXTURE_PRIORITY : constant := 16#8066#;  --  gl.h:694
   GL_TEXTURE_RESIDENT : constant := 16#8067#;  --  gl.h:695
   GL_TEXTURE_BINDING_1D : constant := 16#8068#;  --  gl.h:696
   GL_TEXTURE_BINDING_2D : constant := 16#8069#;  --  gl.h:697
   GL_TEXTURE_INTERNAL_FORMAT : constant := 16#1003#;  --  gl.h:698
   GL_ALPHA4 : constant := 16#803B#;  --  gl.h:699
   GL_ALPHA8 : constant := 16#803C#;  --  gl.h:700
   GL_ALPHA12 : constant := 16#803D#;  --  gl.h:701
   GL_ALPHA16 : constant := 16#803E#;  --  gl.h:702
   GL_LUMINANCE4 : constant := 16#803F#;  --  gl.h:703
   GL_LUMINANCE8 : constant := 16#8040#;  --  gl.h:704
   GL_LUMINANCE12 : constant := 16#8041#;  --  gl.h:705
   GL_LUMINANCE16 : constant := 16#8042#;  --  gl.h:706
   GL_LUMINANCE4_ALPHA4 : constant := 16#8043#;  --  gl.h:707
   GL_LUMINANCE6_ALPHA2 : constant := 16#8044#;  --  gl.h:708
   GL_LUMINANCE8_ALPHA8 : constant := 16#8045#;  --  gl.h:709
   GL_LUMINANCE12_ALPHA4 : constant := 16#8046#;  --  gl.h:710
   GL_LUMINANCE12_ALPHA12 : constant := 16#8047#;  --  gl.h:711
   GL_LUMINANCE16_ALPHA16 : constant := 16#8048#;  --  gl.h:712
   GL_INTENSITY : constant := 16#8049#;  --  gl.h:713
   GL_INTENSITY4 : constant := 16#804A#;  --  gl.h:714
   GL_INTENSITY8 : constant := 16#804B#;  --  gl.h:715
   GL_INTENSITY12 : constant := 16#804C#;  --  gl.h:716
   GL_INTENSITY16 : constant := 16#804D#;  --  gl.h:717
   GL_R3_G3_B2 : constant := 16#2A10#;  --  gl.h:718
   GL_RGB4 : constant := 16#804F#;  --  gl.h:719
   GL_RGB5 : constant := 16#8050#;  --  gl.h:720
   GL_RGB8 : constant := 16#8051#;  --  gl.h:721
   GL_RGB10 : constant := 16#8052#;  --  gl.h:722
   GL_RGB12 : constant := 16#8053#;  --  gl.h:723
   GL_RGB16 : constant := 16#8054#;  --  gl.h:724
   GL_RGBA2 : constant := 16#8055#;  --  gl.h:725
   GL_RGBA4 : constant := 16#8056#;  --  gl.h:726
   GL_RGB5_A1 : constant := 16#8057#;  --  gl.h:727
   GL_RGBA8 : constant := 16#8058#;  --  gl.h:728
   GL_RGB10_A2 : constant := 16#8059#;  --  gl.h:729
   GL_RGBA12 : constant := 16#805A#;  --  gl.h:730
   GL_RGBA16 : constant := 16#805B#;  --  gl.h:731
   GL_CLIENT_PIXEL_STORE_BIT : constant := 16#00000001#;  --  gl.h:732
   GL_CLIENT_VERTEX_ARRAY_BIT : constant := 16#00000002#;  --  gl.h:733
   GL_ALL_CLIENT_ATTRIB_BITS : constant := 16#FFFFFFFF#;  --  gl.h:734
   GL_CLIENT_ALL_ATTRIB_BITS : constant := 16#FFFFFFFF#;  --  gl.h:735

   GL_RESCALE_NORMAL : constant := 16#803A#;  --  gl.h:1446
   GL_CLAMP_TO_EDGE : constant := 16#812F#;  --  gl.h:1447
   GL_MAX_ELEMENTS_VERTICES : constant := 16#80E8#;  --  gl.h:1448
   GL_MAX_ELEMENTS_INDICES : constant := 16#80E9#;  --  gl.h:1449
   GL_BGR : constant := 16#80E0#;  --  gl.h:1450
   GL_BGRA : constant := 16#80E1#;  --  gl.h:1451
   GL_UNSIGNED_BYTE_3_3_2 : constant := 16#8032#;  --  gl.h:1452
   GL_UNSIGNED_BYTE_2_3_3_REV : constant := 16#8362#;  --  gl.h:1453
   GL_UNSIGNED_SHORT_5_6_5 : constant := 16#8363#;  --  gl.h:1454
   GL_UNSIGNED_SHORT_5_6_5_REV : constant := 16#8364#;  --  gl.h:1455
   GL_UNSIGNED_SHORT_4_4_4_4 : constant := 16#8033#;  --  gl.h:1456
   GL_UNSIGNED_SHORT_4_4_4_4_REV : constant := 16#8365#;  --  gl.h:1457
   GL_UNSIGNED_SHORT_5_5_5_1 : constant := 16#8034#;  --  gl.h:1458
   GL_UNSIGNED_SHORT_1_5_5_5_REV : constant := 16#8366#;  --  gl.h:1459
   GL_UNSIGNED_INT_8_8_8_8 : constant := 16#8035#;  --  gl.h:1460
   GL_UNSIGNED_INT_8_8_8_8_REV : constant := 16#8367#;  --  gl.h:1461
   GL_UNSIGNED_INT_10_10_10_2 : constant := 16#8036#;  --  gl.h:1462
   GL_UNSIGNED_INT_2_10_10_10_REV : constant := 16#8368#;  --  gl.h:1463
   GL_LIGHT_MODEL_COLOR_CONTROL : constant := 16#81F8#;  --  gl.h:1464
   GL_SINGLE_COLOR : constant := 16#81F9#;  --  gl.h:1465
   GL_SEPARATE_SPECULAR_COLOR : constant := 16#81FA#;  --  gl.h:1466
   GL_TEXTURE_MIN_LOD : constant := 16#813A#;  --  gl.h:1467
   GL_TEXTURE_MAX_LOD : constant := 16#813B#;  --  gl.h:1468
   GL_TEXTURE_BASE_LEVEL : constant := 16#813C#;  --  gl.h:1469
   GL_TEXTURE_MAX_LEVEL : constant := 16#813D#;  --  gl.h:1470
   GL_SMOOTH_POINT_SIZE_RANGE : constant := 16#0B12#;  --  gl.h:1471
   GL_SMOOTH_POINT_SIZE_GRANULARITY : constant := 16#0B13#;  --  gl.h:1472
   GL_SMOOTH_LINE_WIDTH_RANGE : constant := 16#0B22#;  --  gl.h:1473
   GL_SMOOTH_LINE_WIDTH_GRANULARITY : constant := 16#0B23#;  --  gl.h:1474
   GL_ALIASED_POINT_SIZE_RANGE : constant := 16#846D#;  --  gl.h:1475
   GL_ALIASED_LINE_WIDTH_RANGE : constant := 16#846E#;  --  gl.h:1476
   GL_PACK_SKIP_IMAGES : constant := 16#806B#;  --  gl.h:1477
   GL_PACK_IMAGE_HEIGHT : constant := 16#806C#;  --  gl.h:1478
   GL_UNPACK_SKIP_IMAGES : constant := 16#806D#;  --  gl.h:1479
   GL_UNPACK_IMAGE_HEIGHT : constant := 16#806E#;  --  gl.h:1480
   GL_TEXTURE_3D : constant := 16#806F#;  --  gl.h:1481
   GL_PROXY_TEXTURE_3D : constant := 16#8070#;  --  gl.h:1482
   GL_TEXTURE_DEPTH : constant := 16#8071#;  --  gl.h:1483
   GL_TEXTURE_WRAP_R : constant := 16#8072#;  --  gl.h:1484
   GL_MAX_3D_TEXTURE_SIZE : constant := 16#8073#;  --  gl.h:1485
   GL_TEXTURE_BINDING_3D : constant := 16#806A#;  --  gl.h:1486

   GL_COLOR_TABLE : constant := 16#80D0#;  --  gl.h:1525
   GL_POST_CONVOLUTION_COLOR_TABLE : constant := 16#80D1#;  --  gl.h:1526
   GL_POST_COLOR_MATRIX_COLOR_TABLE : constant := 16#80D2#;  --  gl.h:1527
   GL_PROXY_COLOR_TABLE : constant := 16#80D3#;  --  gl.h:1528
   GL_PROXY_POST_CONVOLUTION_COLOR_TABLE : constant := 16#80D4#;  --  gl.h:1529
   GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE : constant := 16#80D5#;  --  gl.h:1530
   GL_COLOR_TABLE_SCALE : constant := 16#80D6#;  --  gl.h:1531
   GL_COLOR_TABLE_BIAS : constant := 16#80D7#;  --  gl.h:1532
   GL_COLOR_TABLE_FORMAT : constant := 16#80D8#;  --  gl.h:1533
   GL_COLOR_TABLE_WIDTH : constant := 16#80D9#;  --  gl.h:1534
   GL_COLOR_TABLE_RED_SIZE : constant := 16#80DA#;  --  gl.h:1535
   GL_COLOR_TABLE_GREEN_SIZE : constant := 16#80DB#;  --  gl.h:1536
   GL_COLOR_TABLE_BLUE_SIZE : constant := 16#80DC#;  --  gl.h:1537
   GL_COLOR_TABLE_ALPHA_SIZE : constant := 16#80DD#;  --  gl.h:1538
   GL_COLOR_TABLE_LUMINANCE_SIZE : constant := 16#80DE#;  --  gl.h:1539
   GL_COLOR_TABLE_INTENSITY_SIZE : constant := 16#80DF#;  --  gl.h:1540
   GL_CONVOLUTION_1D : constant := 16#8010#;  --  gl.h:1541
   GL_CONVOLUTION_2D : constant := 16#8011#;  --  gl.h:1542
   GL_SEPARABLE_2D : constant := 16#8012#;  --  gl.h:1543
   GL_CONVOLUTION_BORDER_MODE : constant := 16#8013#;  --  gl.h:1544
   GL_CONVOLUTION_FILTER_SCALE : constant := 16#8014#;  --  gl.h:1545
   GL_CONVOLUTION_FILTER_BIAS : constant := 16#8015#;  --  gl.h:1546
   GL_REDUCE : constant := 16#8016#;  --  gl.h:1547
   GL_CONVOLUTION_FORMAT : constant := 16#8017#;  --  gl.h:1548
   GL_CONVOLUTION_WIDTH : constant := 16#8018#;  --  gl.h:1549
   GL_CONVOLUTION_HEIGHT : constant := 16#8019#;  --  gl.h:1550
   GL_MAX_CONVOLUTION_WIDTH : constant := 16#801A#;  --  gl.h:1551
   GL_MAX_CONVOLUTION_HEIGHT : constant := 16#801B#;  --  gl.h:1552
   GL_POST_CONVOLUTION_RED_SCALE : constant := 16#801C#;  --  gl.h:1553
   GL_POST_CONVOLUTION_GREEN_SCALE : constant := 16#801D#;  --  gl.h:1554
   GL_POST_CONVOLUTION_BLUE_SCALE : constant := 16#801E#;  --  gl.h:1555
   GL_POST_CONVOLUTION_ALPHA_SCALE : constant := 16#801F#;  --  gl.h:1556
   GL_POST_CONVOLUTION_RED_BIAS : constant := 16#8020#;  --  gl.h:1557
   GL_POST_CONVOLUTION_GREEN_BIAS : constant := 16#8021#;  --  gl.h:1558
   GL_POST_CONVOLUTION_BLUE_BIAS : constant := 16#8022#;  --  gl.h:1559
   GL_POST_CONVOLUTION_ALPHA_BIAS : constant := 16#8023#;  --  gl.h:1560
   GL_CONSTANT_BORDER : constant := 16#8151#;  --  gl.h:1561
   GL_REPLICATE_BORDER : constant := 16#8153#;  --  gl.h:1562
   GL_CONVOLUTION_BORDER_COLOR : constant := 16#8154#;  --  gl.h:1563
   GL_COLOR_MATRIX : constant := 16#80B1#;  --  gl.h:1564
   GL_COLOR_MATRIX_STACK_DEPTH : constant := 16#80B2#;  --  gl.h:1565
   GL_MAX_COLOR_MATRIX_STACK_DEPTH : constant := 16#80B3#;  --  gl.h:1566
   GL_POST_COLOR_MATRIX_RED_SCALE : constant := 16#80B4#;  --  gl.h:1567
   GL_POST_COLOR_MATRIX_GREEN_SCALE : constant := 16#80B5#;  --  gl.h:1568
   GL_POST_COLOR_MATRIX_BLUE_SCALE : constant := 16#80B6#;  --  gl.h:1569
   GL_POST_COLOR_MATRIX_ALPHA_SCALE : constant := 16#80B7#;  --  gl.h:1570
   GL_POST_COLOR_MATRIX_RED_BIAS : constant := 16#80B8#;  --  gl.h:1571
   GL_POST_COLOR_MATRIX_GREEN_BIAS : constant := 16#80B9#;  --  gl.h:1572
   GL_POST_COLOR_MATRIX_BLUE_BIAS : constant := 16#80BA#;  --  gl.h:1573
   GL_POST_COLOR_MATRIX_ALPHA_BIAS : constant := 16#80BB#;  --  gl.h:1574
   GL_HISTOGRAM : constant := 16#8024#;  --  gl.h:1575
   GL_PROXY_HISTOGRAM : constant := 16#8025#;  --  gl.h:1576
   GL_HISTOGRAM_WIDTH : constant := 16#8026#;  --  gl.h:1577
   GL_HISTOGRAM_FORMAT : constant := 16#8027#;  --  gl.h:1578
   GL_HISTOGRAM_RED_SIZE : constant := 16#8028#;  --  gl.h:1579
   GL_HISTOGRAM_GREEN_SIZE : constant := 16#8029#;  --  gl.h:1580
   GL_HISTOGRAM_BLUE_SIZE : constant := 16#802A#;  --  gl.h:1581
   GL_HISTOGRAM_ALPHA_SIZE : constant := 16#802B#;  --  gl.h:1582
   GL_HISTOGRAM_LUMINANCE_SIZE : constant := 16#802C#;  --  gl.h:1583
   GL_HISTOGRAM_SINK : constant := 16#802D#;  --  gl.h:1584
   GL_MINMAX : constant := 16#802E#;  --  gl.h:1585
   GL_MINMAX_FORMAT : constant := 16#802F#;  --  gl.h:1586
   GL_MINMAX_SINK : constant := 16#8030#;  --  gl.h:1587
   GL_TABLE_TOO_LARGE : constant := 16#8031#;  --  gl.h:1588

   GL_TEXTURE0 : constant := 16#84C0#;  --  gl.h:1714
   GL_TEXTURE1 : constant := 16#84C1#;  --  gl.h:1715
   GL_TEXTURE2 : constant := 16#84C2#;  --  gl.h:1716
   GL_TEXTURE3 : constant := 16#84C3#;  --  gl.h:1717
   GL_TEXTURE4 : constant := 16#84C4#;  --  gl.h:1718
   GL_TEXTURE5 : constant := 16#84C5#;  --  gl.h:1719
   GL_TEXTURE6 : constant := 16#84C6#;  --  gl.h:1720
   GL_TEXTURE7 : constant := 16#84C7#;  --  gl.h:1721
   GL_TEXTURE8 : constant := 16#84C8#;  --  gl.h:1722
   GL_TEXTURE9 : constant := 16#84C9#;  --  gl.h:1723
   GL_TEXTURE10 : constant := 16#84CA#;  --  gl.h:1724
   GL_TEXTURE11 : constant := 16#84CB#;  --  gl.h:1725
   GL_TEXTURE12 : constant := 16#84CC#;  --  gl.h:1726
   GL_TEXTURE13 : constant := 16#84CD#;  --  gl.h:1727
   GL_TEXTURE14 : constant := 16#84CE#;  --  gl.h:1728
   GL_TEXTURE15 : constant := 16#84CF#;  --  gl.h:1729
   GL_TEXTURE16 : constant := 16#84D0#;  --  gl.h:1730
   GL_TEXTURE17 : constant := 16#84D1#;  --  gl.h:1731
   GL_TEXTURE18 : constant := 16#84D2#;  --  gl.h:1732
   GL_TEXTURE19 : constant := 16#84D3#;  --  gl.h:1733
   GL_TEXTURE20 : constant := 16#84D4#;  --  gl.h:1734
   GL_TEXTURE21 : constant := 16#84D5#;  --  gl.h:1735
   GL_TEXTURE22 : constant := 16#84D6#;  --  gl.h:1736
   GL_TEXTURE23 : constant := 16#84D7#;  --  gl.h:1737
   GL_TEXTURE24 : constant := 16#84D8#;  --  gl.h:1738
   GL_TEXTURE25 : constant := 16#84D9#;  --  gl.h:1739
   GL_TEXTURE26 : constant := 16#84DA#;  --  gl.h:1740
   GL_TEXTURE27 : constant := 16#84DB#;  --  gl.h:1741
   GL_TEXTURE28 : constant := 16#84DC#;  --  gl.h:1742
   GL_TEXTURE29 : constant := 16#84DD#;  --  gl.h:1743
   GL_TEXTURE30 : constant := 16#84DE#;  --  gl.h:1744
   GL_TEXTURE31 : constant := 16#84DF#;  --  gl.h:1745
   GL_ACTIVE_TEXTURE : constant := 16#84E0#;  --  gl.h:1746
   GL_CLIENT_ACTIVE_TEXTURE : constant := 16#84E1#;  --  gl.h:1747
   GL_MAX_TEXTURE_UNITS : constant := 16#84E2#;  --  gl.h:1748

   GL_NORMAL_MAP : constant := 16#8511#;  --  gl.h:1750
   GL_REFLECTION_MAP : constant := 16#8512#;  --  gl.h:1751
   GL_TEXTURE_CUBE_MAP : constant := 16#8513#;  --  gl.h:1752
   GL_TEXTURE_BINDING_CUBE_MAP : constant := 16#8514#;  --  gl.h:1753
   GL_TEXTURE_CUBE_MAP_POSITIVE_X : constant := 16#8515#;  --  gl.h:1754
   GL_TEXTURE_CUBE_MAP_NEGATIVE_X : constant := 16#8516#;  --  gl.h:1755
   GL_TEXTURE_CUBE_MAP_POSITIVE_Y : constant := 16#8517#;  --  gl.h:1756
   GL_TEXTURE_CUBE_MAP_NEGATIVE_Y : constant := 16#8518#;  --  gl.h:1757
   GL_TEXTURE_CUBE_MAP_POSITIVE_Z : constant := 16#8519#;  --  gl.h:1758
   GL_TEXTURE_CUBE_MAP_NEGATIVE_Z : constant := 16#851A#;  --  gl.h:1759
   GL_PROXY_TEXTURE_CUBE_MAP : constant := 16#851B#;  --  gl.h:1760
   GL_MAX_CUBE_MAP_TEXTURE_SIZE : constant := 16#851C#;  --  gl.h:1761

   GL_COMPRESSED_ALPHA : constant := 16#84E9#;  --  gl.h:1763
   GL_COMPRESSED_LUMINANCE : constant := 16#84EA#;  --  gl.h:1764
   GL_COMPRESSED_LUMINANCE_ALPHA : constant := 16#84EB#;  --  gl.h:1765
   GL_COMPRESSED_INTENSITY : constant := 16#84EC#;  --  gl.h:1766
   GL_COMPRESSED_RGB : constant := 16#84ED#;  --  gl.h:1767
   GL_COMPRESSED_RGBA : constant := 16#84EE#;  --  gl.h:1768
   GL_TEXTURE_COMPRESSION_HINT : constant := 16#84EF#;  --  gl.h:1769
   GL_TEXTURE_COMPRESSED_IMAGE_SIZE : constant := 16#86A0#;  --  gl.h:1770
   GL_TEXTURE_COMPRESSED : constant := 16#86A1#;  --  gl.h:1771
   GL_NUM_COMPRESSED_TEXTURE_FORMATS : constant := 16#86A2#;  --  gl.h:1772
   GL_COMPRESSED_TEXTURE_FORMATS : constant := 16#86A3#;  --  gl.h:1773

   GL_MULTISAMPLE : constant := 16#809D#;  --  gl.h:1775
   GL_SAMPLE_ALPHA_TO_COVERAGE : constant := 16#809E#;  --  gl.h:1776
   GL_SAMPLE_ALPHA_TO_ONE : constant := 16#809F#;  --  gl.h:1777
   GL_SAMPLE_COVERAGE : constant := 16#80A0#;  --  gl.h:1778
   GL_SAMPLE_BUFFERS : constant := 16#80A8#;  --  gl.h:1779
   GL_SAMPLES : constant := 16#80A9#;  --  gl.h:1780
   GL_SAMPLE_COVERAGE_VALUE : constant := 16#80AA#;  --  gl.h:1781
   GL_SAMPLE_COVERAGE_INVERT : constant := 16#80AB#;  --  gl.h:1782
   GL_MULTISAMPLE_BIT : constant := 16#20000000#;  --  gl.h:1783

   GL_TRANSPOSE_MODELVIEW_MATRIX : constant := 16#84E3#;  --  gl.h:1785
   GL_TRANSPOSE_PROJECTION_MATRIX : constant := 16#84E4#;  --  gl.h:1786
   GL_TRANSPOSE_TEXTURE_MATRIX : constant := 16#84E5#;  --  gl.h:1787
   GL_TRANSPOSE_COLOR_MATRIX : constant := 16#84E6#;  --  gl.h:1788

   GL_COMBINE : constant := 16#8570#;  --  gl.h:1790
   GL_COMBINE_RGB : constant := 16#8571#;  --  gl.h:1791
   GL_COMBINE_ALPHA : constant := 16#8572#;  --  gl.h:1792
   GL_SOURCE0_RGB : constant := 16#8580#;  --  gl.h:1793
   GL_SOURCE1_RGB : constant := 16#8581#;  --  gl.h:1794
   GL_SOURCE2_RGB : constant := 16#8582#;  --  gl.h:1795
   GL_SOURCE0_ALPHA : constant := 16#8588#;  --  gl.h:1796
   GL_SOURCE1_ALPHA : constant := 16#8589#;  --  gl.h:1797
   GL_SOURCE2_ALPHA : constant := 16#858A#;  --  gl.h:1798
   GL_OPERAND0_RGB : constant := 16#8590#;  --  gl.h:1799
   GL_OPERAND1_RGB : constant := 16#8591#;  --  gl.h:1800
   GL_OPERAND2_RGB : constant := 16#8592#;  --  gl.h:1801
   GL_OPERAND0_ALPHA : constant := 16#8598#;  --  gl.h:1802
   GL_OPERAND1_ALPHA : constant := 16#8599#;  --  gl.h:1803
   GL_OPERAND2_ALPHA : constant := 16#859A#;  --  gl.h:1804
   GL_RGB_SCALE : constant := 16#8573#;  --  gl.h:1805
   GL_ADD_SIGNED : constant := 16#8574#;  --  gl.h:1806
   GL_INTERPOLATE : constant := 16#8575#;  --  gl.h:1807
   GL_SUBTRACT : constant := 16#84E7#;  --  gl.h:1808
   GL_CONSTANT : constant := 16#8576#;  --  gl.h:1809
   GL_PRIMARY_COLOR : constant := 16#8577#;  --  gl.h:1810
   GL_PREVIOUS : constant := 16#8578#;  --  gl.h:1811

   GL_DOT3_RGB : constant := 16#86AE#;  --  gl.h:1813
   GL_DOT3_RGBA : constant := 16#86AF#;  --  gl.h:1814

   GL_CLAMP_TO_BORDER : constant := 16#812D#;  --  gl.h:1816

   GL_ARB_multitexture : constant := 1;  --  gl.h:1928

   GL_TEXTURE0_ARB : constant := 16#84C0#;  --  gl.h:1930
   GL_TEXTURE1_ARB : constant := 16#84C1#;  --  gl.h:1931
   GL_TEXTURE2_ARB : constant := 16#84C2#;  --  gl.h:1932
   GL_TEXTURE3_ARB : constant := 16#84C3#;  --  gl.h:1933
   GL_TEXTURE4_ARB : constant := 16#84C4#;  --  gl.h:1934
   GL_TEXTURE5_ARB : constant := 16#84C5#;  --  gl.h:1935
   GL_TEXTURE6_ARB : constant := 16#84C6#;  --  gl.h:1936
   GL_TEXTURE7_ARB : constant := 16#84C7#;  --  gl.h:1937
   GL_TEXTURE8_ARB : constant := 16#84C8#;  --  gl.h:1938
   GL_TEXTURE9_ARB : constant := 16#84C9#;  --  gl.h:1939
   GL_TEXTURE10_ARB : constant := 16#84CA#;  --  gl.h:1940
   GL_TEXTURE11_ARB : constant := 16#84CB#;  --  gl.h:1941
   GL_TEXTURE12_ARB : constant := 16#84CC#;  --  gl.h:1942
   GL_TEXTURE13_ARB : constant := 16#84CD#;  --  gl.h:1943
   GL_TEXTURE14_ARB : constant := 16#84CE#;  --  gl.h:1944
   GL_TEXTURE15_ARB : constant := 16#84CF#;  --  gl.h:1945
   GL_TEXTURE16_ARB : constant := 16#84D0#;  --  gl.h:1946
   GL_TEXTURE17_ARB : constant := 16#84D1#;  --  gl.h:1947
   GL_TEXTURE18_ARB : constant := 16#84D2#;  --  gl.h:1948
   GL_TEXTURE19_ARB : constant := 16#84D3#;  --  gl.h:1949
   GL_TEXTURE20_ARB : constant := 16#84D4#;  --  gl.h:1950
   GL_TEXTURE21_ARB : constant := 16#84D5#;  --  gl.h:1951
   GL_TEXTURE22_ARB : constant := 16#84D6#;  --  gl.h:1952
   GL_TEXTURE23_ARB : constant := 16#84D7#;  --  gl.h:1953
   GL_TEXTURE24_ARB : constant := 16#84D8#;  --  gl.h:1954
   GL_TEXTURE25_ARB : constant := 16#84D9#;  --  gl.h:1955
   GL_TEXTURE26_ARB : constant := 16#84DA#;  --  gl.h:1956
   GL_TEXTURE27_ARB : constant := 16#84DB#;  --  gl.h:1957
   GL_TEXTURE28_ARB : constant := 16#84DC#;  --  gl.h:1958
   GL_TEXTURE29_ARB : constant := 16#84DD#;  --  gl.h:1959
   GL_TEXTURE30_ARB : constant := 16#84DE#;  --  gl.h:1960
   GL_TEXTURE31_ARB : constant := 16#84DF#;  --  gl.h:1961
   GL_ACTIVE_TEXTURE_ARB : constant := 16#84E0#;  --  gl.h:1962
   GL_CLIENT_ACTIVE_TEXTURE_ARB : constant := 16#84E1#;  --  gl.h:1963
   GL_MAX_TEXTURE_UNITS_ARB : constant := 16#84E2#;  --  gl.h:1964

   GL_MESA_packed_depth_stencil : constant := 1;  --  gl.h:2061

   GL_DEPTH_STENCIL_MESA : constant := 16#8750#;  --  gl.h:2063
   GL_UNSIGNED_INT_24_8_MESA : constant := 16#8751#;  --  gl.h:2064
   GL_UNSIGNED_INT_8_24_REV_MESA : constant := 16#8752#;  --  gl.h:2065
   GL_UNSIGNED_SHORT_15_1_MESA : constant := 16#8753#;  --  gl.h:2066
   GL_UNSIGNED_SHORT_1_15_REV_MESA : constant := 16#8754#;  --  gl.h:2067

   GL_ATI_blend_equation_separate : constant := 1;  --  gl.h:2073

   GL_ALPHA_BLEND_EQUATION_ATI : constant := 16#883D#;  --  gl.h:2075

   GL_OES_EGL_image : constant := 1;  --  gl.h:2089

  -- * Mesa 3-D graphics library
  -- *
  -- * Copyright (C) 1999-2006  Brian Paul   All Rights Reserved.
  -- * Copyright (C) 2009  VMware, Inc.  All Rights Reserved.
  -- *
  -- * Permission is hereby granted, free of charge, to any person obtaining a
  -- * copy of this software and associated documentation files (the "Software"),
  -- * to deal in the Software without restriction, including without limitation
  -- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
  -- * and/or sell copies of the Software, and to permit persons to whom the
  -- * Software is furnished to do so, subject to the following conditions:
  -- *
  -- * The above copyright notice and this permission notice shall be included
  -- * in all copies or substantial portions of the Software.
  -- *
  -- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
  -- * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  -- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
  -- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
  -- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
  -- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  -- * OTHER DEALINGS IN THE SOFTWARE.
  --  

  --*********************************************************************
  -- * Begin system-specific stuff.
  --  

  -- * WINDOWS: Include windows.h here to define APIENTRY.
  -- * It is also useful when applications include this file by
  -- * including only glut.h, since glut.h depends on windows.h.
  -- * Applications needing to include windows.h with parms other
  -- * than "WIN32_LEAN_AND_MEAN" may include windows.h before
  -- * glut.h or gl.h.
  --  

  -- "P" suffix to be used for a pointer to a function  
  -- * End system-specific stuff.
  -- ********************************************************************* 

  -- * Datatypes
  --  

   subtype GLenum is unsigned;  -- gl.h:116

   subtype GLboolean is unsigned_char;  -- gl.h:117

   subtype GLbitfield is unsigned;  -- gl.h:118

   subtype GLvoid is System.Address;  -- gl.h:119

  -- 1-byte signed  
   subtype GLbyte is signed_char;  -- gl.h:120

  -- 2-byte signed  
   subtype GLshort is short;  -- gl.h:121

  -- 4-byte signed  
   subtype GLint is int;  -- gl.h:122

  -- 1-byte unsigned  
   subtype GLubyte is unsigned_char;  -- gl.h:123

  -- 2-byte unsigned  
   subtype GLushort is unsigned_short;  -- gl.h:124

  -- 4-byte unsigned  
   subtype GLuint is unsigned;  -- gl.h:125

  -- 4-byte signed  
   subtype GLsizei is int;  -- gl.h:126

  -- single precision float  
   subtype GLfloat is float;  -- gl.h:127

  -- single precision float in [0,1]  
   subtype GLclampf is float;  -- gl.h:128

  -- double precision float  
   subtype GLdouble is double;  -- gl.h:129

  -- double precision float in [0,1]  
   subtype GLclampd is double;  -- gl.h:130

  -- * Constants
  --  

  -- Boolean values  
  -- Data types  
  -- Primitives  
  -- Vertex Arrays  
  -- Matrix Mode  
  -- Points  
  -- Lines  
  -- Polygons  
  -- Display Lists  
  -- Depth buffer  
  -- Lighting  
  -- User clipping planes  
  -- Accumulation buffer  
  -- Alpha testing  
  -- Blending  
  -- Render Mode  
  -- Feedback  
  -- Selection  
  -- Fog  
  -- Logic Ops  
  -- Stencil  
  -- Buffers, Pixel Drawing/Reading  
  --GL_FRONT					0x0404  
  --GL_BACK					0x0405  
  --GL_FRONT_AND_BACK				0x0408  
  -- Implementation limits  
  -- Gets  
  -- Evaluators  
  -- Hints  
  -- Scissor box  
  -- Pixel Mode / Transfer  
  -- Texture mapping  
  -- Utility  
  -- Errors  
  -- glPush/PopAttrib bits  
  -- OpenGL 1.1  
  -- * Miscellaneous
  --  

   procedure glClearIndex (c : GLfloat)  -- gl.h:743
   with Import => True, 
        Convention => C, 
        External_Name => "glClearIndex";

   procedure glClearColor
     (red : GLclampf;
      green : GLclampf;
      blue : GLclampf;
      alpha : GLclampf)  -- gl.h:745
   with Import => True, 
        Convention => C, 
        External_Name => "glClearColor";

   procedure glClear (mask : GLbitfield)  -- gl.h:747
   with Import => True, 
        Convention => C, 
        External_Name => "glClear";

   procedure glIndexMask (mask : GLuint)  -- gl.h:749
   with Import => True, 
        Convention => C, 
        External_Name => "glIndexMask";

   procedure glColorMask
     (red : GLboolean;
      green : GLboolean;
      blue : GLboolean;
      alpha : GLboolean)  -- gl.h:751
   with Import => True, 
        Convention => C, 
        External_Name => "glColorMask";

   procedure glAlphaFunc (func : GLenum; ref : GLclampf)  -- gl.h:753
   with Import => True, 
        Convention => C, 
        External_Name => "glAlphaFunc";

   procedure glBlendFunc (sfactor : GLenum; dfactor : GLenum)  -- gl.h:755
   with Import => True, 
        Convention => C, 
        External_Name => "glBlendFunc";

   procedure glLogicOp (opcode : GLenum)  -- gl.h:757
   with Import => True, 
        Convention => C, 
        External_Name => "glLogicOp";

   procedure glCullFace (mode : GLenum)  -- gl.h:759
   with Import => True, 
        Convention => C, 
        External_Name => "glCullFace";

   procedure glFrontFace (mode : GLenum)  -- gl.h:761
   with Import => True, 
        Convention => C, 
        External_Name => "glFrontFace";

   procedure glPointSize (size : GLfloat)  -- gl.h:763
   with Import => True, 
        Convention => C, 
        External_Name => "glPointSize";

   procedure glLineWidth (width : GLfloat)  -- gl.h:765
   with Import => True, 
        Convention => C, 
        External_Name => "glLineWidth";

   procedure glLineStipple (factor : GLint; pattern : GLushort)  -- gl.h:767
   with Import => True, 
        Convention => C, 
        External_Name => "glLineStipple";

   procedure glPolygonMode (face : GLenum; mode : GLenum)  -- gl.h:769
   with Import => True, 
        Convention => C, 
        External_Name => "glPolygonMode";

   procedure glPolygonOffset (factor : GLfloat; units : GLfloat)  -- gl.h:771
   with Import => True, 
        Convention => C, 
        External_Name => "glPolygonOffset";

   procedure glPolygonStipple (mask : access GLubyte)  -- gl.h:773
   with Import => True, 
        Convention => C, 
        External_Name => "glPolygonStipple";

   procedure glGetPolygonStipple (mask : access GLubyte)  -- gl.h:775
   with Import => True, 
        Convention => C, 
        External_Name => "glGetPolygonStipple";

   procedure glEdgeFlag (flag : GLboolean)  -- gl.h:777
   with Import => True, 
        Convention => C, 
        External_Name => "glEdgeFlag";

   procedure glEdgeFlagv (flag : access GLboolean)  -- gl.h:779
   with Import => True, 
        Convention => C, 
        External_Name => "glEdgeFlagv";

   procedure glScissor
     (x : GLint;
      y : GLint;
      width : GLsizei;
      height : GLsizei)  -- gl.h:781
   with Import => True, 
        Convention => C, 
        External_Name => "glScissor";

   procedure glClipPlane (plane : GLenum; equation : access GLdouble)  -- gl.h:783
   with Import => True, 
        Convention => C, 
        External_Name => "glClipPlane";

   procedure glGetClipPlane (plane : GLenum; equation : access GLdouble)  -- gl.h:785
   with Import => True, 
        Convention => C, 
        External_Name => "glGetClipPlane";

   procedure glDrawBuffer (mode : GLenum)  -- gl.h:787
   with Import => True, 
        Convention => C, 
        External_Name => "glDrawBuffer";

   procedure glReadBuffer (mode : GLenum)  -- gl.h:789
   with Import => True, 
        Convention => C, 
        External_Name => "glReadBuffer";

   procedure glEnable (cap : GLenum)  -- gl.h:791
   with Import => True, 
        Convention => C, 
        External_Name => "glEnable";

   procedure glDisable (cap : GLenum)  -- gl.h:793
   with Import => True, 
        Convention => C, 
        External_Name => "glDisable";

   function glIsEnabled (cap : GLenum) return GLboolean  -- gl.h:795
   with Import => True, 
        Convention => C, 
        External_Name => "glIsEnabled";

  -- 1.1  
   procedure glEnableClientState (cap : GLenum)  -- gl.h:798
   with Import => True, 
        Convention => C, 
        External_Name => "glEnableClientState";

  -- 1.1  
   procedure glDisableClientState (cap : GLenum)  -- gl.h:800
   with Import => True, 
        Convention => C, 
        External_Name => "glDisableClientState";

   procedure glGetBooleanv (pname : GLenum; params : access GLboolean)  -- gl.h:803
   with Import => True, 
        Convention => C, 
        External_Name => "glGetBooleanv";

   procedure glGetDoublev (pname : GLenum; params : access GLdouble)  -- gl.h:805
   with Import => True, 
        Convention => C, 
        External_Name => "glGetDoublev";

   procedure glGetFloatv (pname : GLenum; params : access GLfloat)  -- gl.h:807
   with Import => True, 
        Convention => C, 
        External_Name => "glGetFloatv";

   procedure glGetIntegerv (pname : GLenum; params : access GLint)  -- gl.h:809
   with Import => True, 
        Convention => C, 
        External_Name => "glGetIntegerv";

   procedure glPushAttrib (mask : GLbitfield)  -- gl.h:812
   with Import => True, 
        Convention => C, 
        External_Name => "glPushAttrib";

   procedure glPopAttrib  -- gl.h:814
   with Import => True, 
        Convention => C, 
        External_Name => "glPopAttrib";

  -- 1.1  
   procedure glPushClientAttrib (mask : GLbitfield)  -- gl.h:817
   with Import => True, 
        Convention => C, 
        External_Name => "glPushClientAttrib";

  -- 1.1  
   procedure glPopClientAttrib  -- gl.h:819
   with Import => True, 
        Convention => C, 
        External_Name => "glPopClientAttrib";

   function glRenderMode (mode : GLenum) return GLint  -- gl.h:822
   with Import => True, 
        Convention => C, 
        External_Name => "glRenderMode";

   function glGetError return GLenum  -- gl.h:824
   with Import => True, 
        Convention => C, 
        External_Name => "glGetError";

   -- Troodon: changed return type from access GLubyte
   function glGetString (name : GLenum) return Interfaces.C.Strings.chars_ptr  -- gl.h:826
   with Import => True, 
        Convention => C, 
        External_Name => "glGetString";

   procedure glFinish  -- gl.h:828
   with Import => True, 
        Convention => C, 
        External_Name => "glFinish";

   procedure glFlush  -- gl.h:830
   with Import => True, 
        Convention => C, 
        External_Name => "glFlush";

   procedure glHint (target : GLenum; mode : GLenum)  -- gl.h:832
   with Import => True, 
        Convention => C, 
        External_Name => "glHint";

  -- * Depth Buffer
  --  

   procedure glClearDepth (depth : GLclampd)  -- gl.h:839
   with Import => True, 
        Convention => C, 
        External_Name => "glClearDepth";

   procedure glDepthFunc (func : GLenum)  -- gl.h:841
   with Import => True, 
        Convention => C, 
        External_Name => "glDepthFunc";

   procedure glDepthMask (flag : GLboolean)  -- gl.h:843
   with Import => True, 
        Convention => C, 
        External_Name => "glDepthMask";

   procedure glDepthRange (near_val : GLclampd; far_val : GLclampd)  -- gl.h:845
   with Import => True, 
        Convention => C, 
        External_Name => "glDepthRange";

  -- * Accumulation Buffer
  --  

   procedure glClearAccum
     (red : GLfloat;
      green : GLfloat;
      blue : GLfloat;
      alpha : GLfloat)  -- gl.h:852
   with Import => True, 
        Convention => C, 
        External_Name => "glClearAccum";

   procedure glAccum (op : GLenum; value : GLfloat)  -- gl.h:854
   with Import => True, 
        Convention => C, 
        External_Name => "glAccum";

  -- * Transformation
  --  

   procedure glMatrixMode (mode : GLenum)  -- gl.h:861
   with Import => True, 
        Convention => C, 
        External_Name => "glMatrixMode";

   procedure glOrtho
     (left : GLdouble;
      right : GLdouble;
      bottom : GLdouble;
      top : GLdouble;
      near_val : GLdouble;
      far_val : GLdouble)  -- gl.h:863
   with Import => True, 
        Convention => C, 
        External_Name => "glOrtho";

   procedure glFrustum
     (left : GLdouble;
      right : GLdouble;
      bottom : GLdouble;
      top : GLdouble;
      near_val : GLdouble;
      far_val : GLdouble)  -- gl.h:867
   with Import => True, 
        Convention => C, 
        External_Name => "glFrustum";

   procedure glViewport
     (x : GLint;
      y : GLint;
      width : GLsizei;
      height : GLsizei)  -- gl.h:871
   with Import => True, 
        Convention => C, 
        External_Name => "glViewport";

   procedure glPushMatrix  -- gl.h:874
   with Import => True, 
        Convention => C, 
        External_Name => "glPushMatrix";

   procedure glPopMatrix  -- gl.h:876
   with Import => True, 
        Convention => C, 
        External_Name => "glPopMatrix";

   procedure glLoadIdentity  -- gl.h:878
   with Import => True, 
        Convention => C, 
        External_Name => "glLoadIdentity";

   procedure glLoadMatrixd (m : access GLdouble)  -- gl.h:880
   with Import => True, 
        Convention => C, 
        External_Name => "glLoadMatrixd";

   procedure glLoadMatrixf (m : access GLfloat)  -- gl.h:881
   with Import => True, 
        Convention => C, 
        External_Name => "glLoadMatrixf";

   procedure glMultMatrixd (m : access GLdouble)  -- gl.h:883
   with Import => True, 
        Convention => C, 
        External_Name => "glMultMatrixd";

   procedure glMultMatrixf (m : access GLfloat)  -- gl.h:884
   with Import => True, 
        Convention => C, 
        External_Name => "glMultMatrixf";

   procedure glRotated
     (angle : GLdouble;
      x : GLdouble;
      y : GLdouble;
      z : GLdouble)  -- gl.h:886
   with Import => True, 
        Convention => C, 
        External_Name => "glRotated";

   procedure glRotatef
     (angle : GLfloat;
      x : GLfloat;
      y : GLfloat;
      z : GLfloat)  -- gl.h:888
   with Import => True, 
        Convention => C, 
        External_Name => "glRotatef";

   procedure glScaled
     (x : GLdouble;
      y : GLdouble;
      z : GLdouble)  -- gl.h:891
   with Import => True, 
        Convention => C, 
        External_Name => "glScaled";

   procedure glScalef
     (x : GLfloat;
      y : GLfloat;
      z : GLfloat)  -- gl.h:892
   with Import => True, 
        Convention => C, 
        External_Name => "glScalef";

   procedure glTranslated
     (x : GLdouble;
      y : GLdouble;
      z : GLdouble)  -- gl.h:894
   with Import => True, 
        Convention => C, 
        External_Name => "glTranslated";

   procedure glTranslatef
     (x : GLfloat;
      y : GLfloat;
      z : GLfloat)  -- gl.h:895
   with Import => True, 
        Convention => C, 
        External_Name => "glTranslatef";

  -- * Display Lists
  --  

   function glIsList (list : GLuint) return GLboolean  -- gl.h:902
   with Import => True, 
        Convention => C, 
        External_Name => "glIsList";

   procedure glDeleteLists (list : GLuint; c_range : GLsizei)  -- gl.h:904
   with Import => True, 
        Convention => C, 
        External_Name => "glDeleteLists";

   function glGenLists (c_range : GLsizei) return GLuint  -- gl.h:906
   with Import => True, 
        Convention => C, 
        External_Name => "glGenLists";

   procedure glNewList (list : GLuint; mode : GLenum)  -- gl.h:908
   with Import => True, 
        Convention => C, 
        External_Name => "glNewList";

   procedure glEndList  -- gl.h:910
   with Import => True, 
        Convention => C, 
        External_Name => "glEndList";

   procedure glCallList (list : GLuint)  -- gl.h:912
   with Import => True, 
        Convention => C, 
        External_Name => "glCallList";

   procedure glCallLists
     (n : GLsizei;
      c_type : GLenum;
      lists : System.Address)  -- gl.h:914
   with Import => True, 
        Convention => C, 
        External_Name => "glCallLists";

   procedure glListBase (base : GLuint)  -- gl.h:917
   with Import => True, 
        Convention => C, 
        External_Name => "glListBase";

  -- * Drawing Functions
  --  

   procedure glBegin (mode : GLenum)  -- gl.h:924
   with Import => True, 
        Convention => C, 
        External_Name => "glBegin";

   procedure glEnd  -- gl.h:926
   with Import => True, 
        Convention => C, 
        External_Name => "glEnd";

   procedure glVertex2d (x : GLdouble; y : GLdouble)  -- gl.h:929
   with Import => True, 
        Convention => C, 
        External_Name => "glVertex2d";

   procedure glVertex2f (x : GLfloat; y : GLfloat)  -- gl.h:930
   with Import => True, 
        Convention => C, 
        External_Name => "glVertex2f";

   procedure glVertex2i (x : GLint; y : GLint)  -- gl.h:931
   with Import => True, 
        Convention => C, 
        External_Name => "glVertex2i";

   procedure glVertex2s (x : GLshort; y : GLshort)  -- gl.h:932
   with Import => True, 
        Convention => C, 
        External_Name => "glVertex2s";

   procedure glVertex3d
     (x : GLdouble;
      y : GLdouble;
      z : GLdouble)  -- gl.h:934
   with Import => True, 
        Convention => C, 
        External_Name => "glVertex3d";

   procedure glVertex3f
     (x : GLfloat;
      y : GLfloat;
      z : GLfloat)  -- gl.h:935
   with Import => True, 
        Convention => C, 
        External_Name => "glVertex3f";

   procedure glVertex3i
     (x : GLint;
      y : GLint;
      z : GLint)  -- gl.h:936
   with Import => True, 
        Convention => C, 
        External_Name => "glVertex3i";

   procedure glVertex3s
     (x : GLshort;
      y : GLshort;
      z : GLshort)  -- gl.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "glVertex3s";

   procedure glVertex4d
     (x : GLdouble;
      y : GLdouble;
      z : GLdouble;
      w : GLdouble)  -- gl.h:939
   with Import => True, 
        Convention => C, 
        External_Name => "glVertex4d";

   procedure glVertex4f
     (x : GLfloat;
      y : GLfloat;
      z : GLfloat;
      w : GLfloat)  -- gl.h:940
   with Import => True, 
        Convention => C, 
        External_Name => "glVertex4f";

   procedure glVertex4i
     (x : GLint;
      y : GLint;
      z : GLint;
      w : GLint)  -- gl.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "glVertex4i";

   procedure glVertex4s
     (x : GLshort;
      y : GLshort;
      z : GLshort;
      w : GLshort)  -- gl.h:942
   with Import => True, 
        Convention => C, 
        External_Name => "glVertex4s";

   procedure glVertex2dv (v : access GLdouble)  -- gl.h:944
   with Import => True, 
        Convention => C, 
        External_Name => "glVertex2dv";

   procedure glVertex2fv (v : access GLfloat)  -- gl.h:945
   with Import => True, 
        Convention => C, 
        External_Name => "glVertex2fv";

   procedure glVertex2iv (v : access GLint)  -- gl.h:946
   with Import => True, 
        Convention => C, 
        External_Name => "glVertex2iv";

   procedure glVertex2sv (v : access GLshort)  -- gl.h:947
   with Import => True, 
        Convention => C, 
        External_Name => "glVertex2sv";

   procedure glVertex3dv (v : access GLdouble)  -- gl.h:949
   with Import => True, 
        Convention => C, 
        External_Name => "glVertex3dv";

   procedure glVertex3fv (v : access GLfloat)  -- gl.h:950
   with Import => True, 
        Convention => C, 
        External_Name => "glVertex3fv";

   procedure glVertex3iv (v : access GLint)  -- gl.h:951
   with Import => True, 
        Convention => C, 
        External_Name => "glVertex3iv";

   procedure glVertex3sv (v : access GLshort)  -- gl.h:952
   with Import => True, 
        Convention => C, 
        External_Name => "glVertex3sv";

   procedure glVertex4dv (v : access GLdouble)  -- gl.h:954
   with Import => True, 
        Convention => C, 
        External_Name => "glVertex4dv";

   procedure glVertex4fv (v : access GLfloat)  -- gl.h:955
   with Import => True, 
        Convention => C, 
        External_Name => "glVertex4fv";

   procedure glVertex4iv (v : access GLint)  -- gl.h:956
   with Import => True, 
        Convention => C, 
        External_Name => "glVertex4iv";

   procedure glVertex4sv (v : access GLshort)  -- gl.h:957
   with Import => True, 
        Convention => C, 
        External_Name => "glVertex4sv";

   procedure glNormal3b
     (nx : GLbyte;
      ny : GLbyte;
      nz : GLbyte)  -- gl.h:960
   with Import => True, 
        Convention => C, 
        External_Name => "glNormal3b";

   procedure glNormal3d
     (nx : GLdouble;
      ny : GLdouble;
      nz : GLdouble)  -- gl.h:961
   with Import => True, 
        Convention => C, 
        External_Name => "glNormal3d";

   procedure glNormal3f
     (nx : GLfloat;
      ny : GLfloat;
      nz : GLfloat)  -- gl.h:962
   with Import => True, 
        Convention => C, 
        External_Name => "glNormal3f";

   procedure glNormal3i
     (nx : GLint;
      ny : GLint;
      nz : GLint)  -- gl.h:963
   with Import => True, 
        Convention => C, 
        External_Name => "glNormal3i";

   procedure glNormal3s
     (nx : GLshort;
      ny : GLshort;
      nz : GLshort)  -- gl.h:964
   with Import => True, 
        Convention => C, 
        External_Name => "glNormal3s";

   procedure glNormal3bv (v : access GLbyte)  -- gl.h:966
   with Import => True, 
        Convention => C, 
        External_Name => "glNormal3bv";

   procedure glNormal3dv (v : access GLdouble)  -- gl.h:967
   with Import => True, 
        Convention => C, 
        External_Name => "glNormal3dv";

   procedure glNormal3fv (v : access GLfloat)  -- gl.h:968
   with Import => True, 
        Convention => C, 
        External_Name => "glNormal3fv";

   procedure glNormal3iv (v : access GLint)  -- gl.h:969
   with Import => True, 
        Convention => C, 
        External_Name => "glNormal3iv";

   procedure glNormal3sv (v : access GLshort)  -- gl.h:970
   with Import => True, 
        Convention => C, 
        External_Name => "glNormal3sv";

   procedure glIndexd (c : GLdouble)  -- gl.h:973
   with Import => True, 
        Convention => C, 
        External_Name => "glIndexd";

   procedure glIndexf (c : GLfloat)  -- gl.h:974
   with Import => True, 
        Convention => C, 
        External_Name => "glIndexf";

   procedure glIndexi (c : GLint)  -- gl.h:975
   with Import => True, 
        Convention => C, 
        External_Name => "glIndexi";

   procedure glIndexs (c : GLshort)  -- gl.h:976
   with Import => True, 
        Convention => C, 
        External_Name => "glIndexs";

  -- 1.1  
   procedure glIndexub (c : GLubyte)  -- gl.h:977
   with Import => True, 
        Convention => C, 
        External_Name => "glIndexub";

   procedure glIndexdv (c : access GLdouble)  -- gl.h:979
   with Import => True, 
        Convention => C, 
        External_Name => "glIndexdv";

   procedure glIndexfv (c : access GLfloat)  -- gl.h:980
   with Import => True, 
        Convention => C, 
        External_Name => "glIndexfv";

   procedure glIndexiv (c : access GLint)  -- gl.h:981
   with Import => True, 
        Convention => C, 
        External_Name => "glIndexiv";

   procedure glIndexsv (c : access GLshort)  -- gl.h:982
   with Import => True, 
        Convention => C, 
        External_Name => "glIndexsv";

  -- 1.1  
   procedure glIndexubv (c : access GLubyte)  -- gl.h:983
   with Import => True, 
        Convention => C, 
        External_Name => "glIndexubv";

   procedure glColor3b
     (red : GLbyte;
      green : GLbyte;
      blue : GLbyte)  -- gl.h:985
   with Import => True, 
        Convention => C, 
        External_Name => "glColor3b";

   procedure glColor3d
     (red : GLdouble;
      green : GLdouble;
      blue : GLdouble)  -- gl.h:986
   with Import => True, 
        Convention => C, 
        External_Name => "glColor3d";

   procedure glColor3f
     (red : GLfloat;
      green : GLfloat;
      blue : GLfloat)  -- gl.h:987
   with Import => True, 
        Convention => C, 
        External_Name => "glColor3f";

   procedure glColor3i
     (red : GLint;
      green : GLint;
      blue : GLint)  -- gl.h:988
   with Import => True, 
        Convention => C, 
        External_Name => "glColor3i";

   procedure glColor3s
     (red : GLshort;
      green : GLshort;
      blue : GLshort)  -- gl.h:989
   with Import => True, 
        Convention => C, 
        External_Name => "glColor3s";

   procedure glColor3ub
     (red : GLubyte;
      green : GLubyte;
      blue : GLubyte)  -- gl.h:990
   with Import => True, 
        Convention => C, 
        External_Name => "glColor3ub";

   procedure glColor3ui
     (red : GLuint;
      green : GLuint;
      blue : GLuint)  -- gl.h:991
   with Import => True, 
        Convention => C, 
        External_Name => "glColor3ui";

   procedure glColor3us
     (red : GLushort;
      green : GLushort;
      blue : GLushort)  -- gl.h:992
   with Import => True, 
        Convention => C, 
        External_Name => "glColor3us";

   procedure glColor4b
     (red : GLbyte;
      green : GLbyte;
      blue : GLbyte;
      alpha : GLbyte)  -- gl.h:994
   with Import => True, 
        Convention => C, 
        External_Name => "glColor4b";

   procedure glColor4d
     (red : GLdouble;
      green : GLdouble;
      blue : GLdouble;
      alpha : GLdouble)  -- gl.h:996
   with Import => True, 
        Convention => C, 
        External_Name => "glColor4d";

   procedure glColor4f
     (red : GLfloat;
      green : GLfloat;
      blue : GLfloat;
      alpha : GLfloat)  -- gl.h:998
   with Import => True, 
        Convention => C, 
        External_Name => "glColor4f";

   procedure glColor4i
     (red : GLint;
      green : GLint;
      blue : GLint;
      alpha : GLint)  -- gl.h:1000
   with Import => True, 
        Convention => C, 
        External_Name => "glColor4i";

   procedure glColor4s
     (red : GLshort;
      green : GLshort;
      blue : GLshort;
      alpha : GLshort)  -- gl.h:1002
   with Import => True, 
        Convention => C, 
        External_Name => "glColor4s";

   procedure glColor4ub
     (red : GLubyte;
      green : GLubyte;
      blue : GLubyte;
      alpha : GLubyte)  -- gl.h:1004
   with Import => True, 
        Convention => C, 
        External_Name => "glColor4ub";

   procedure glColor4ui
     (red : GLuint;
      green : GLuint;
      blue : GLuint;
      alpha : GLuint)  -- gl.h:1006
   with Import => True, 
        Convention => C, 
        External_Name => "glColor4ui";

   procedure glColor4us
     (red : GLushort;
      green : GLushort;
      blue : GLushort;
      alpha : GLushort)  -- gl.h:1008
   with Import => True, 
        Convention => C, 
        External_Name => "glColor4us";

   procedure glColor3bv (v : access GLbyte)  -- gl.h:1012
   with Import => True, 
        Convention => C, 
        External_Name => "glColor3bv";

   procedure glColor3dv (v : access GLdouble)  -- gl.h:1013
   with Import => True, 
        Convention => C, 
        External_Name => "glColor3dv";

   procedure glColor3fv (v : access GLfloat)  -- gl.h:1014
   with Import => True, 
        Convention => C, 
        External_Name => "glColor3fv";

   procedure glColor3iv (v : access GLint)  -- gl.h:1015
   with Import => True, 
        Convention => C, 
        External_Name => "glColor3iv";

   procedure glColor3sv (v : access GLshort)  -- gl.h:1016
   with Import => True, 
        Convention => C, 
        External_Name => "glColor3sv";

   procedure glColor3ubv (v : access GLubyte)  -- gl.h:1017
   with Import => True, 
        Convention => C, 
        External_Name => "glColor3ubv";

   procedure glColor3uiv (v : access GLuint)  -- gl.h:1018
   with Import => True, 
        Convention => C, 
        External_Name => "glColor3uiv";

   procedure glColor3usv (v : access GLushort)  -- gl.h:1019
   with Import => True, 
        Convention => C, 
        External_Name => "glColor3usv";

   procedure glColor4bv (v : access GLbyte)  -- gl.h:1021
   with Import => True, 
        Convention => C, 
        External_Name => "glColor4bv";

   procedure glColor4dv (v : access GLdouble)  -- gl.h:1022
   with Import => True, 
        Convention => C, 
        External_Name => "glColor4dv";

   procedure glColor4fv (v : access GLfloat)  -- gl.h:1023
   with Import => True, 
        Convention => C, 
        External_Name => "glColor4fv";

   procedure glColor4iv (v : access GLint)  -- gl.h:1024
   with Import => True, 
        Convention => C, 
        External_Name => "glColor4iv";

   procedure glColor4sv (v : access GLshort)  -- gl.h:1025
   with Import => True, 
        Convention => C, 
        External_Name => "glColor4sv";

   procedure glColor4ubv (v : access GLubyte)  -- gl.h:1026
   with Import => True, 
        Convention => C, 
        External_Name => "glColor4ubv";

   procedure glColor4uiv (v : access GLuint)  -- gl.h:1027
   with Import => True, 
        Convention => C, 
        External_Name => "glColor4uiv";

   procedure glColor4usv (v : access GLushort)  -- gl.h:1028
   with Import => True, 
        Convention => C, 
        External_Name => "glColor4usv";

   procedure glTexCoord1d (s : GLdouble)  -- gl.h:1031
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord1d";

   procedure glTexCoord1f (s : GLfloat)  -- gl.h:1032
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord1f";

   procedure glTexCoord1i (s : GLint)  -- gl.h:1033
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord1i";

   procedure glTexCoord1s (s : GLshort)  -- gl.h:1034
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord1s";

   procedure glTexCoord2d (s : GLdouble; t : GLdouble)  -- gl.h:1036
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord2d";

   procedure glTexCoord2f (s : GLfloat; t : GLfloat)  -- gl.h:1037
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord2f";

   procedure glTexCoord2i (s : GLint; t : GLint)  -- gl.h:1038
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord2i";

   procedure glTexCoord2s (s : GLshort; t : GLshort)  -- gl.h:1039
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord2s";

   procedure glTexCoord3d
     (s : GLdouble;
      t : GLdouble;
      r : GLdouble)  -- gl.h:1041
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord3d";

   procedure glTexCoord3f
     (s : GLfloat;
      t : GLfloat;
      r : GLfloat)  -- gl.h:1042
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord3f";

   procedure glTexCoord3i
     (s : GLint;
      t : GLint;
      r : GLint)  -- gl.h:1043
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord3i";

   procedure glTexCoord3s
     (s : GLshort;
      t : GLshort;
      r : GLshort)  -- gl.h:1044
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord3s";

   procedure glTexCoord4d
     (s : GLdouble;
      t : GLdouble;
      r : GLdouble;
      q : GLdouble)  -- gl.h:1046
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord4d";

   procedure glTexCoord4f
     (s : GLfloat;
      t : GLfloat;
      r : GLfloat;
      q : GLfloat)  -- gl.h:1047
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord4f";

   procedure glTexCoord4i
     (s : GLint;
      t : GLint;
      r : GLint;
      q : GLint)  -- gl.h:1048
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord4i";

   procedure glTexCoord4s
     (s : GLshort;
      t : GLshort;
      r : GLshort;
      q : GLshort)  -- gl.h:1049
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord4s";

   procedure glTexCoord1dv (v : access GLdouble)  -- gl.h:1051
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord1dv";

   procedure glTexCoord1fv (v : access GLfloat)  -- gl.h:1052
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord1fv";

   procedure glTexCoord1iv (v : access GLint)  -- gl.h:1053
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord1iv";

   procedure glTexCoord1sv (v : access GLshort)  -- gl.h:1054
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord1sv";

   procedure glTexCoord2dv (v : access GLdouble)  -- gl.h:1056
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord2dv";

   procedure glTexCoord2fv (v : access GLfloat)  -- gl.h:1057
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord2fv";

   procedure glTexCoord2iv (v : access GLint)  -- gl.h:1058
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord2iv";

   procedure glTexCoord2sv (v : access GLshort)  -- gl.h:1059
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord2sv";

   procedure glTexCoord3dv (v : access GLdouble)  -- gl.h:1061
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord3dv";

   procedure glTexCoord3fv (v : access GLfloat)  -- gl.h:1062
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord3fv";

   procedure glTexCoord3iv (v : access GLint)  -- gl.h:1063
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord3iv";

   procedure glTexCoord3sv (v : access GLshort)  -- gl.h:1064
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord3sv";

   procedure glTexCoord4dv (v : access GLdouble)  -- gl.h:1066
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord4dv";

   procedure glTexCoord4fv (v : access GLfloat)  -- gl.h:1067
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord4fv";

   procedure glTexCoord4iv (v : access GLint)  -- gl.h:1068
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord4iv";

   procedure glTexCoord4sv (v : access GLshort)  -- gl.h:1069
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoord4sv";

   procedure glRasterPos2d (x : GLdouble; y : GLdouble)  -- gl.h:1072
   with Import => True, 
        Convention => C, 
        External_Name => "glRasterPos2d";

   procedure glRasterPos2f (x : GLfloat; y : GLfloat)  -- gl.h:1073
   with Import => True, 
        Convention => C, 
        External_Name => "glRasterPos2f";

   procedure glRasterPos2i (x : GLint; y : GLint)  -- gl.h:1074
   with Import => True, 
        Convention => C, 
        External_Name => "glRasterPos2i";

   procedure glRasterPos2s (x : GLshort; y : GLshort)  -- gl.h:1075
   with Import => True, 
        Convention => C, 
        External_Name => "glRasterPos2s";

   procedure glRasterPos3d
     (x : GLdouble;
      y : GLdouble;
      z : GLdouble)  -- gl.h:1077
   with Import => True, 
        Convention => C, 
        External_Name => "glRasterPos3d";

   procedure glRasterPos3f
     (x : GLfloat;
      y : GLfloat;
      z : GLfloat)  -- gl.h:1078
   with Import => True, 
        Convention => C, 
        External_Name => "glRasterPos3f";

   procedure glRasterPos3i
     (x : GLint;
      y : GLint;
      z : GLint)  -- gl.h:1079
   with Import => True, 
        Convention => C, 
        External_Name => "glRasterPos3i";

   procedure glRasterPos3s
     (x : GLshort;
      y : GLshort;
      z : GLshort)  -- gl.h:1080
   with Import => True, 
        Convention => C, 
        External_Name => "glRasterPos3s";

   procedure glRasterPos4d
     (x : GLdouble;
      y : GLdouble;
      z : GLdouble;
      w : GLdouble)  -- gl.h:1082
   with Import => True, 
        Convention => C, 
        External_Name => "glRasterPos4d";

   procedure glRasterPos4f
     (x : GLfloat;
      y : GLfloat;
      z : GLfloat;
      w : GLfloat)  -- gl.h:1083
   with Import => True, 
        Convention => C, 
        External_Name => "glRasterPos4f";

   procedure glRasterPos4i
     (x : GLint;
      y : GLint;
      z : GLint;
      w : GLint)  -- gl.h:1084
   with Import => True, 
        Convention => C, 
        External_Name => "glRasterPos4i";

   procedure glRasterPos4s
     (x : GLshort;
      y : GLshort;
      z : GLshort;
      w : GLshort)  -- gl.h:1085
   with Import => True, 
        Convention => C, 
        External_Name => "glRasterPos4s";

   procedure glRasterPos2dv (v : access GLdouble)  -- gl.h:1087
   with Import => True, 
        Convention => C, 
        External_Name => "glRasterPos2dv";

   procedure glRasterPos2fv (v : access GLfloat)  -- gl.h:1088
   with Import => True, 
        Convention => C, 
        External_Name => "glRasterPos2fv";

   procedure glRasterPos2iv (v : access GLint)  -- gl.h:1089
   with Import => True, 
        Convention => C, 
        External_Name => "glRasterPos2iv";

   procedure glRasterPos2sv (v : access GLshort)  -- gl.h:1090
   with Import => True, 
        Convention => C, 
        External_Name => "glRasterPos2sv";

   procedure glRasterPos3dv (v : access GLdouble)  -- gl.h:1092
   with Import => True, 
        Convention => C, 
        External_Name => "glRasterPos3dv";

   procedure glRasterPos3fv (v : access GLfloat)  -- gl.h:1093
   with Import => True, 
        Convention => C, 
        External_Name => "glRasterPos3fv";

   procedure glRasterPos3iv (v : access GLint)  -- gl.h:1094
   with Import => True, 
        Convention => C, 
        External_Name => "glRasterPos3iv";

   procedure glRasterPos3sv (v : access GLshort)  -- gl.h:1095
   with Import => True, 
        Convention => C, 
        External_Name => "glRasterPos3sv";

   procedure glRasterPos4dv (v : access GLdouble)  -- gl.h:1097
   with Import => True, 
        Convention => C, 
        External_Name => "glRasterPos4dv";

   procedure glRasterPos4fv (v : access GLfloat)  -- gl.h:1098
   with Import => True, 
        Convention => C, 
        External_Name => "glRasterPos4fv";

   procedure glRasterPos4iv (v : access GLint)  -- gl.h:1099
   with Import => True, 
        Convention => C, 
        External_Name => "glRasterPos4iv";

   procedure glRasterPos4sv (v : access GLshort)  -- gl.h:1100
   with Import => True, 
        Convention => C, 
        External_Name => "glRasterPos4sv";

   procedure glRectd
     (x1 : GLdouble;
      y1 : GLdouble;
      x2 : GLdouble;
      y2 : GLdouble)  -- gl.h:1103
   with Import => True, 
        Convention => C, 
        External_Name => "glRectd";

   procedure glRectf
     (x1 : GLfloat;
      y1 : GLfloat;
      x2 : GLfloat;
      y2 : GLfloat)  -- gl.h:1104
   with Import => True, 
        Convention => C, 
        External_Name => "glRectf";

   procedure glRecti
     (x1 : GLint;
      y1 : GLint;
      x2 : GLint;
      y2 : GLint)  -- gl.h:1105
   with Import => True, 
        Convention => C, 
        External_Name => "glRecti";

   procedure glRects
     (x1 : GLshort;
      y1 : GLshort;
      x2 : GLshort;
      y2 : GLshort)  -- gl.h:1106
   with Import => True, 
        Convention => C, 
        External_Name => "glRects";

   procedure glRectdv (v1 : access GLdouble; v2 : access GLdouble)  -- gl.h:1109
   with Import => True, 
        Convention => C, 
        External_Name => "glRectdv";

   procedure glRectfv (v1 : access GLfloat; v2 : access GLfloat)  -- gl.h:1110
   with Import => True, 
        Convention => C, 
        External_Name => "glRectfv";

   procedure glRectiv (v1 : access GLint; v2 : access GLint)  -- gl.h:1111
   with Import => True, 
        Convention => C, 
        External_Name => "glRectiv";

   procedure glRectsv (v1 : access GLshort; v2 : access GLshort)  -- gl.h:1112
   with Import => True, 
        Convention => C, 
        External_Name => "glRectsv";

  -- * Vertex Arrays  (1.1)
  --  

   procedure glVertexPointer
     (size : GLint;
      c_type : GLenum;
      stride : GLsizei;
      ptr : System.Address)  -- gl.h:1119
   with Import => True, 
        Convention => C, 
        External_Name => "glVertexPointer";

   procedure glNormalPointer
     (c_type : GLenum;
      stride : GLsizei;
      ptr : System.Address)  -- gl.h:1122
   with Import => True, 
        Convention => C, 
        External_Name => "glNormalPointer";

   procedure glColorPointer
     (size : GLint;
      c_type : GLenum;
      stride : GLsizei;
      ptr : System.Address)  -- gl.h:1125
   with Import => True, 
        Convention => C, 
        External_Name => "glColorPointer";

   procedure glIndexPointer
     (c_type : GLenum;
      stride : GLsizei;
      ptr : System.Address)  -- gl.h:1128
   with Import => True, 
        Convention => C, 
        External_Name => "glIndexPointer";

   procedure glTexCoordPointer
     (size : GLint;
      c_type : GLenum;
      stride : GLsizei;
      ptr : System.Address)  -- gl.h:1131
   with Import => True, 
        Convention => C, 
        External_Name => "glTexCoordPointer";

   procedure glEdgeFlagPointer (stride : GLsizei; ptr : System.Address)  -- gl.h:1134
   with Import => True, 
        Convention => C, 
        External_Name => "glEdgeFlagPointer";

   procedure glGetPointerv (pname : GLenum; params : System.Address)  -- gl.h:1136
   with Import => True, 
        Convention => C, 
        External_Name => "glGetPointerv";

   procedure glArrayElement (i : GLint)  -- gl.h:1138
   with Import => True, 
        Convention => C, 
        External_Name => "glArrayElement";

   procedure glDrawArrays
     (mode : GLenum;
      first : GLint;
      count : GLsizei)  -- gl.h:1140
   with Import => True, 
        Convention => C, 
        External_Name => "glDrawArrays";

   procedure glDrawElements
     (mode : GLenum;
      count : GLsizei;
      c_type : GLenum;
      indices : System.Address)  -- gl.h:1142
   with Import => True, 
        Convention => C, 
        External_Name => "glDrawElements";

   procedure glInterleavedArrays
     (format : GLenum;
      stride : GLsizei;
      pointer : System.Address)  -- gl.h:1145
   with Import => True, 
        Convention => C, 
        External_Name => "glInterleavedArrays";

  -- * Lighting
  --  

   procedure glShadeModel (mode : GLenum)  -- gl.h:1152
   with Import => True, 
        Convention => C, 
        External_Name => "glShadeModel";

   procedure glLightf
     (light : GLenum;
      pname : GLenum;
      param : GLfloat)  -- gl.h:1154
   with Import => True, 
        Convention => C, 
        External_Name => "glLightf";

   procedure glLighti
     (light : GLenum;
      pname : GLenum;
      param : GLint)  -- gl.h:1155
   with Import => True, 
        Convention => C, 
        External_Name => "glLighti";

   procedure glLightfv
     (light : GLenum;
      pname : GLenum;
      params : access GLfloat)  -- gl.h:1156
   with Import => True, 
        Convention => C, 
        External_Name => "glLightfv";

   procedure glLightiv
     (light : GLenum;
      pname : GLenum;
      params : access GLint)  -- gl.h:1158
   with Import => True, 
        Convention => C, 
        External_Name => "glLightiv";

   procedure glGetLightfv
     (light : GLenum;
      pname : GLenum;
      params : access GLfloat)  -- gl.h:1161
   with Import => True, 
        Convention => C, 
        External_Name => "glGetLightfv";

   procedure glGetLightiv
     (light : GLenum;
      pname : GLenum;
      params : access GLint)  -- gl.h:1163
   with Import => True, 
        Convention => C, 
        External_Name => "glGetLightiv";

   procedure glLightModelf (pname : GLenum; param : GLfloat)  -- gl.h:1166
   with Import => True, 
        Convention => C, 
        External_Name => "glLightModelf";

   procedure glLightModeli (pname : GLenum; param : GLint)  -- gl.h:1167
   with Import => True, 
        Convention => C, 
        External_Name => "glLightModeli";

   procedure glLightModelfv (pname : GLenum; params : access GLfloat)  -- gl.h:1168
   with Import => True, 
        Convention => C, 
        External_Name => "glLightModelfv";

   procedure glLightModeliv (pname : GLenum; params : access GLint)  -- gl.h:1169
   with Import => True, 
        Convention => C, 
        External_Name => "glLightModeliv";

   procedure glMaterialf
     (face : GLenum;
      pname : GLenum;
      param : GLfloat)  -- gl.h:1171
   with Import => True, 
        Convention => C, 
        External_Name => "glMaterialf";

   procedure glMateriali
     (face : GLenum;
      pname : GLenum;
      param : GLint)  -- gl.h:1172
   with Import => True, 
        Convention => C, 
        External_Name => "glMateriali";

   procedure glMaterialfv
     (face : GLenum;
      pname : GLenum;
      params : access GLfloat)  -- gl.h:1173
   with Import => True, 
        Convention => C, 
        External_Name => "glMaterialfv";

   procedure glMaterialiv
     (face : GLenum;
      pname : GLenum;
      params : access GLint)  -- gl.h:1174
   with Import => True, 
        Convention => C, 
        External_Name => "glMaterialiv";

   procedure glGetMaterialfv
     (face : GLenum;
      pname : GLenum;
      params : access GLfloat)  -- gl.h:1176
   with Import => True, 
        Convention => C, 
        External_Name => "glGetMaterialfv";

   procedure glGetMaterialiv
     (face : GLenum;
      pname : GLenum;
      params : access GLint)  -- gl.h:1177
   with Import => True, 
        Convention => C, 
        External_Name => "glGetMaterialiv";

   procedure glColorMaterial (face : GLenum; mode : GLenum)  -- gl.h:1179
   with Import => True, 
        Convention => C, 
        External_Name => "glColorMaterial";

  -- * Raster functions
  --  

   procedure glPixelZoom (xfactor : GLfloat; yfactor : GLfloat)  -- gl.h:1186
   with Import => True, 
        Convention => C, 
        External_Name => "glPixelZoom";

   procedure glPixelStoref (pname : GLenum; param : GLfloat)  -- gl.h:1188
   with Import => True, 
        Convention => C, 
        External_Name => "glPixelStoref";

   procedure glPixelStorei (pname : GLenum; param : GLint)  -- gl.h:1189
   with Import => True, 
        Convention => C, 
        External_Name => "glPixelStorei";

   procedure glPixelTransferf (pname : GLenum; param : GLfloat)  -- gl.h:1191
   with Import => True, 
        Convention => C, 
        External_Name => "glPixelTransferf";

   procedure glPixelTransferi (pname : GLenum; param : GLint)  -- gl.h:1192
   with Import => True, 
        Convention => C, 
        External_Name => "glPixelTransferi";

   procedure glPixelMapfv
     (map : GLenum;
      mapsize : GLsizei;
      values : access GLfloat)  -- gl.h:1194
   with Import => True, 
        Convention => C, 
        External_Name => "glPixelMapfv";

   procedure glPixelMapuiv
     (map : GLenum;
      mapsize : GLsizei;
      values : access GLuint)  -- gl.h:1196
   with Import => True, 
        Convention => C, 
        External_Name => "glPixelMapuiv";

   procedure glPixelMapusv
     (map : GLenum;
      mapsize : GLsizei;
      values : access GLushort)  -- gl.h:1198
   with Import => True, 
        Convention => C, 
        External_Name => "glPixelMapusv";

   procedure glGetPixelMapfv (map : GLenum; values : access GLfloat)  -- gl.h:1201
   with Import => True, 
        Convention => C, 
        External_Name => "glGetPixelMapfv";

   procedure glGetPixelMapuiv (map : GLenum; values : access GLuint)  -- gl.h:1202
   with Import => True, 
        Convention => C, 
        External_Name => "glGetPixelMapuiv";

   procedure glGetPixelMapusv (map : GLenum; values : access GLushort)  -- gl.h:1203
   with Import => True, 
        Convention => C, 
        External_Name => "glGetPixelMapusv";

   procedure glBitmap
     (width : GLsizei;
      height : GLsizei;
      xorig : GLfloat;
      yorig : GLfloat;
      xmove : GLfloat;
      ymove : GLfloat;
      bitmap : access GLubyte)  -- gl.h:1205
   with Import => True, 
        Convention => C, 
        External_Name => "glBitmap";

   procedure glReadPixels
     (x : GLint;
      y : GLint;
      width : GLsizei;
      height : GLsizei;
      format : GLenum;
      c_type : GLenum;
      pixels : System.Address)  -- gl.h:1210
   with Import => True, 
        Convention => C, 
        External_Name => "glReadPixels";

   procedure glDrawPixels
     (width : GLsizei;
      height : GLsizei;
      format : GLenum;
      c_type : GLenum;
      pixels : System.Address)  -- gl.h:1215
   with Import => True, 
        Convention => C, 
        External_Name => "glDrawPixels";

   procedure glCopyPixels
     (x : GLint;
      y : GLint;
      width : GLsizei;
      height : GLsizei;
      c_type : GLenum)  -- gl.h:1219
   with Import => True, 
        Convention => C, 
        External_Name => "glCopyPixels";

  -- * Stenciling
  --  

   procedure glStencilFunc
     (func : GLenum;
      ref : GLint;
      mask : GLuint)  -- gl.h:1227
   with Import => True, 
        Convention => C, 
        External_Name => "glStencilFunc";

   procedure glStencilMask (mask : GLuint)  -- gl.h:1229
   with Import => True, 
        Convention => C, 
        External_Name => "glStencilMask";

   procedure glStencilOp
     (fail : GLenum;
      zfail : GLenum;
      zpass : GLenum)  -- gl.h:1231
   with Import => True, 
        Convention => C, 
        External_Name => "glStencilOp";

   procedure glClearStencil (s : GLint)  -- gl.h:1233
   with Import => True, 
        Convention => C, 
        External_Name => "glClearStencil";

  -- * Texture mapping
  --  

   procedure glTexGend
     (coord : GLenum;
      pname : GLenum;
      param : GLdouble)  -- gl.h:1241
   with Import => True, 
        Convention => C, 
        External_Name => "glTexGend";

   procedure glTexGenf
     (coord : GLenum;
      pname : GLenum;
      param : GLfloat)  -- gl.h:1242
   with Import => True, 
        Convention => C, 
        External_Name => "glTexGenf";

   procedure glTexGeni
     (coord : GLenum;
      pname : GLenum;
      param : GLint)  -- gl.h:1243
   with Import => True, 
        Convention => C, 
        External_Name => "glTexGeni";

   procedure glTexGendv
     (coord : GLenum;
      pname : GLenum;
      params : access GLdouble)  -- gl.h:1245
   with Import => True, 
        Convention => C, 
        External_Name => "glTexGendv";

   procedure glTexGenfv
     (coord : GLenum;
      pname : GLenum;
      params : access GLfloat)  -- gl.h:1246
   with Import => True, 
        Convention => C, 
        External_Name => "glTexGenfv";

   procedure glTexGeniv
     (coord : GLenum;
      pname : GLenum;
      params : access GLint)  -- gl.h:1247
   with Import => True, 
        Convention => C, 
        External_Name => "glTexGeniv";

   procedure glGetTexGendv
     (coord : GLenum;
      pname : GLenum;
      params : access GLdouble)  -- gl.h:1249
   with Import => True, 
        Convention => C, 
        External_Name => "glGetTexGendv";

   procedure glGetTexGenfv
     (coord : GLenum;
      pname : GLenum;
      params : access GLfloat)  -- gl.h:1250
   with Import => True, 
        Convention => C, 
        External_Name => "glGetTexGenfv";

   procedure glGetTexGeniv
     (coord : GLenum;
      pname : GLenum;
      params : access GLint)  -- gl.h:1251
   with Import => True, 
        Convention => C, 
        External_Name => "glGetTexGeniv";

   procedure glTexEnvf
     (target : GLenum;
      pname : GLenum;
      param : GLfloat)  -- gl.h:1254
   with Import => True, 
        Convention => C, 
        External_Name => "glTexEnvf";

   procedure glTexEnvi
     (target : GLenum;
      pname : GLenum;
      param : GLint)  -- gl.h:1255
   with Import => True, 
        Convention => C, 
        External_Name => "glTexEnvi";

   procedure glTexEnvfv
     (target : GLenum;
      pname : GLenum;
      params : access GLfloat)  -- gl.h:1257
   with Import => True, 
        Convention => C, 
        External_Name => "glTexEnvfv";

   procedure glTexEnviv
     (target : GLenum;
      pname : GLenum;
      params : access GLint)  -- gl.h:1258
   with Import => True, 
        Convention => C, 
        External_Name => "glTexEnviv";

   procedure glGetTexEnvfv
     (target : GLenum;
      pname : GLenum;
      params : access GLfloat)  -- gl.h:1260
   with Import => True, 
        Convention => C, 
        External_Name => "glGetTexEnvfv";

   procedure glGetTexEnviv
     (target : GLenum;
      pname : GLenum;
      params : access GLint)  -- gl.h:1261
   with Import => True, 
        Convention => C, 
        External_Name => "glGetTexEnviv";

   procedure glTexParameterf
     (target : GLenum;
      pname : GLenum;
      param : GLfloat)  -- gl.h:1264
   with Import => True, 
        Convention => C, 
        External_Name => "glTexParameterf";

   procedure glTexParameteri
     (target : GLenum;
      pname : GLenum;
      param : GLint)  -- gl.h:1265
   with Import => True, 
        Convention => C, 
        External_Name => "glTexParameteri";

   procedure glTexParameterfv
     (target : GLenum;
      pname : GLenum;
      params : access GLfloat)  -- gl.h:1267
   with Import => True, 
        Convention => C, 
        External_Name => "glTexParameterfv";

   procedure glTexParameteriv
     (target : GLenum;
      pname : GLenum;
      params : access GLint)  -- gl.h:1269
   with Import => True, 
        Convention => C, 
        External_Name => "glTexParameteriv";

   procedure glGetTexParameterfv
     (target : GLenum;
      pname : GLenum;
      params : access GLfloat)  -- gl.h:1272
   with Import => True, 
        Convention => C, 
        External_Name => "glGetTexParameterfv";

   procedure glGetTexParameteriv
     (target : GLenum;
      pname : GLenum;
      params : access GLint)  -- gl.h:1274
   with Import => True, 
        Convention => C, 
        External_Name => "glGetTexParameteriv";

   procedure glGetTexLevelParameterfv
     (target : GLenum;
      level : GLint;
      pname : GLenum;
      params : access GLfloat)  -- gl.h:1277
   with Import => True, 
        Convention => C, 
        External_Name => "glGetTexLevelParameterfv";

   procedure glGetTexLevelParameteriv
     (target : GLenum;
      level : GLint;
      pname : GLenum;
      params : access GLint)  -- gl.h:1279
   with Import => True, 
        Convention => C, 
        External_Name => "glGetTexLevelParameteriv";

   procedure glTexImage1D
     (target : GLenum;
      level : GLint;
      internalFormat : GLint;
      width : GLsizei;
      border : GLint;
      format : GLenum;
      c_type : GLenum;
      pixels : System.Address)  -- gl.h:1283
   with Import => True, 
        Convention => C, 
        External_Name => "glTexImage1D";

   procedure glTexImage2D
     (target : GLenum;
      level : GLint;
      internalFormat : GLint;
      width : GLsizei;
      height : GLsizei;
      border : GLint;
      format : GLenum;
      c_type : GLenum;
      pixels : System.Address)  -- gl.h:1289
   with Import => True, 
        Convention => C, 
        External_Name => "glTexImage2D";

   procedure glGetTexImage
     (target : GLenum;
      level : GLint;
      format : GLenum;
      c_type : GLenum;
      pixels : System.Address)  -- gl.h:1295
   with Import => True, 
        Convention => C, 
        External_Name => "glGetTexImage";

  -- 1.1 functions  
   procedure glGenTextures (n : GLsizei; textures : access GLuint)  -- gl.h:1302
   with Import => True, 
        Convention => C, 
        External_Name => "glGenTextures";

   procedure glDeleteTextures (n : GLsizei; textures : access GLuint)  -- gl.h:1304
   with Import => True, 
        Convention => C, 
        External_Name => "glDeleteTextures";

   procedure glBindTexture (target : GLenum; texture : GLuint)  -- gl.h:1306
   with Import => True, 
        Convention => C, 
        External_Name => "glBindTexture";

   procedure glPrioritizeTextures
     (n : GLsizei;
      textures : access GLuint;
      priorities : access GLclampf)  -- gl.h:1308
   with Import => True, 
        Convention => C, 
        External_Name => "glPrioritizeTextures";

   function glAreTexturesResident
     (n : GLsizei;
      textures : access GLuint;
      residences : access GLboolean) return GLboolean  -- gl.h:1312
   with Import => True, 
        Convention => C, 
        External_Name => "glAreTexturesResident";

   function glIsTexture (texture : GLuint) return GLboolean  -- gl.h:1316
   with Import => True, 
        Convention => C, 
        External_Name => "glIsTexture";

   procedure glTexSubImage1D
     (target : GLenum;
      level : GLint;
      xoffset : GLint;
      width : GLsizei;
      format : GLenum;
      c_type : GLenum;
      pixels : System.Address)  -- gl.h:1319
   with Import => True, 
        Convention => C, 
        External_Name => "glTexSubImage1D";

   procedure glTexSubImage2D
     (target : GLenum;
      level : GLint;
      xoffset : GLint;
      yoffset : GLint;
      width : GLsizei;
      height : GLsizei;
      format : GLenum;
      c_type : GLenum;
      pixels : System.Address)  -- gl.h:1325
   with Import => True, 
        Convention => C, 
        External_Name => "glTexSubImage2D";

   procedure glCopyTexImage1D
     (target : GLenum;
      level : GLint;
      internalformat : GLenum;
      x : GLint;
      y : GLint;
      width : GLsizei;
      border : GLint)  -- gl.h:1332
   with Import => True, 
        Convention => C, 
        External_Name => "glCopyTexImage1D";

   procedure glCopyTexImage2D
     (target : GLenum;
      level : GLint;
      internalformat : GLenum;
      x : GLint;
      y : GLint;
      width : GLsizei;
      height : GLsizei;
      border : GLint)  -- gl.h:1338
   with Import => True, 
        Convention => C, 
        External_Name => "glCopyTexImage2D";

   procedure glCopyTexSubImage1D
     (target : GLenum;
      level : GLint;
      xoffset : GLint;
      x : GLint;
      y : GLint;
      width : GLsizei)  -- gl.h:1345
   with Import => True, 
        Convention => C, 
        External_Name => "glCopyTexSubImage1D";

   procedure glCopyTexSubImage2D
     (target : GLenum;
      level : GLint;
      xoffset : GLint;
      yoffset : GLint;
      x : GLint;
      y : GLint;
      width : GLsizei;
      height : GLsizei)  -- gl.h:1350
   with Import => True, 
        Convention => C, 
        External_Name => "glCopyTexSubImage2D";

  -- * Evaluators
  --  

   procedure glMap1d
     (target : GLenum;
      u1 : GLdouble;
      u2 : GLdouble;
      stride : GLint;
      order : GLint;
      points : access GLdouble)  -- gl.h:1360
   with Import => True, 
        Convention => C, 
        External_Name => "glMap1d";

   procedure glMap1f
     (target : GLenum;
      u1 : GLfloat;
      u2 : GLfloat;
      stride : GLint;
      order : GLint;
      points : access GLfloat)  -- gl.h:1363
   with Import => True, 
        Convention => C, 
        External_Name => "glMap1f";

   procedure glMap2d
     (target : GLenum;
      u1 : GLdouble;
      u2 : GLdouble;
      ustride : GLint;
      uorder : GLint;
      v1 : GLdouble;
      v2 : GLdouble;
      vstride : GLint;
      vorder : GLint;
      points : access GLdouble)  -- gl.h:1367
   with Import => True, 
        Convention => C, 
        External_Name => "glMap2d";

   procedure glMap2f
     (target : GLenum;
      u1 : GLfloat;
      u2 : GLfloat;
      ustride : GLint;
      uorder : GLint;
      v1 : GLfloat;
      v2 : GLfloat;
      vstride : GLint;
      vorder : GLint;
      points : access GLfloat)  -- gl.h:1371
   with Import => True, 
        Convention => C, 
        External_Name => "glMap2f";

   procedure glGetMapdv
     (target : GLenum;
      query : GLenum;
      v : access GLdouble)  -- gl.h:1376
   with Import => True, 
        Convention => C, 
        External_Name => "glGetMapdv";

   procedure glGetMapfv
     (target : GLenum;
      query : GLenum;
      v : access GLfloat)  -- gl.h:1377
   with Import => True, 
        Convention => C, 
        External_Name => "glGetMapfv";

   procedure glGetMapiv
     (target : GLenum;
      query : GLenum;
      v : access GLint)  -- gl.h:1378
   with Import => True, 
        Convention => C, 
        External_Name => "glGetMapiv";

   procedure glEvalCoord1d (u : GLdouble)  -- gl.h:1380
   with Import => True, 
        Convention => C, 
        External_Name => "glEvalCoord1d";

   procedure glEvalCoord1f (u : GLfloat)  -- gl.h:1381
   with Import => True, 
        Convention => C, 
        External_Name => "glEvalCoord1f";

   procedure glEvalCoord1dv (u : access GLdouble)  -- gl.h:1383
   with Import => True, 
        Convention => C, 
        External_Name => "glEvalCoord1dv";

   procedure glEvalCoord1fv (u : access GLfloat)  -- gl.h:1384
   with Import => True, 
        Convention => C, 
        External_Name => "glEvalCoord1fv";

   procedure glEvalCoord2d (u : GLdouble; v : GLdouble)  -- gl.h:1386
   with Import => True, 
        Convention => C, 
        External_Name => "glEvalCoord2d";

   procedure glEvalCoord2f (u : GLfloat; v : GLfloat)  -- gl.h:1387
   with Import => True, 
        Convention => C, 
        External_Name => "glEvalCoord2f";

   procedure glEvalCoord2dv (u : access GLdouble)  -- gl.h:1389
   with Import => True, 
        Convention => C, 
        External_Name => "glEvalCoord2dv";

   procedure glEvalCoord2fv (u : access GLfloat)  -- gl.h:1390
   with Import => True, 
        Convention => C, 
        External_Name => "glEvalCoord2fv";

   procedure glMapGrid1d
     (un : GLint;
      u1 : GLdouble;
      u2 : GLdouble)  -- gl.h:1392
   with Import => True, 
        Convention => C, 
        External_Name => "glMapGrid1d";

   procedure glMapGrid1f
     (un : GLint;
      u1 : GLfloat;
      u2 : GLfloat)  -- gl.h:1393
   with Import => True, 
        Convention => C, 
        External_Name => "glMapGrid1f";

   procedure glMapGrid2d
     (un : GLint;
      u1 : GLdouble;
      u2 : GLdouble;
      vn : GLint;
      v1 : GLdouble;
      v2 : GLdouble)  -- gl.h:1395
   with Import => True, 
        Convention => C, 
        External_Name => "glMapGrid2d";

   procedure glMapGrid2f
     (un : GLint;
      u1 : GLfloat;
      u2 : GLfloat;
      vn : GLint;
      v1 : GLfloat;
      v2 : GLfloat)  -- gl.h:1397
   with Import => True, 
        Convention => C, 
        External_Name => "glMapGrid2f";

   procedure glEvalPoint1 (i : GLint)  -- gl.h:1400
   with Import => True, 
        Convention => C, 
        External_Name => "glEvalPoint1";

   procedure glEvalPoint2 (i : GLint; j : GLint)  -- gl.h:1402
   with Import => True, 
        Convention => C, 
        External_Name => "glEvalPoint2";

   procedure glEvalMesh1
     (mode : GLenum;
      i1 : GLint;
      i2 : GLint)  -- gl.h:1404
   with Import => True, 
        Convention => C, 
        External_Name => "glEvalMesh1";

   procedure glEvalMesh2
     (mode : GLenum;
      i1 : GLint;
      i2 : GLint;
      j1 : GLint;
      j2 : GLint)  -- gl.h:1406
   with Import => True, 
        Convention => C, 
        External_Name => "glEvalMesh2";

  -- * Fog
  --  

   procedure glFogf (pname : GLenum; param : GLfloat)  -- gl.h:1413
   with Import => True, 
        Convention => C, 
        External_Name => "glFogf";

   procedure glFogi (pname : GLenum; param : GLint)  -- gl.h:1415
   with Import => True, 
        Convention => C, 
        External_Name => "glFogi";

   procedure glFogfv (pname : GLenum; params : access GLfloat)  -- gl.h:1417
   with Import => True, 
        Convention => C, 
        External_Name => "glFogfv";

   procedure glFogiv (pname : GLenum; params : access GLint)  -- gl.h:1419
   with Import => True, 
        Convention => C, 
        External_Name => "glFogiv";

  -- * Selection and Feedback
  --  

   procedure glFeedbackBuffer
     (size : GLsizei;
      c_type : GLenum;
      buffer : access GLfloat)  -- gl.h:1426
   with Import => True, 
        Convention => C, 
        External_Name => "glFeedbackBuffer";

   procedure glPassThrough (token : GLfloat)  -- gl.h:1428
   with Import => True, 
        Convention => C, 
        External_Name => "glPassThrough";

   procedure glSelectBuffer (size : GLsizei; buffer : access GLuint)  -- gl.h:1430
   with Import => True, 
        Convention => C, 
        External_Name => "glSelectBuffer";

   procedure glInitNames  -- gl.h:1432
   with Import => True, 
        Convention => C, 
        External_Name => "glInitNames";

   procedure glLoadName (name : GLuint)  -- gl.h:1434
   with Import => True, 
        Convention => C, 
        External_Name => "glLoadName";

   procedure glPushName (name : GLuint)  -- gl.h:1436
   with Import => True, 
        Convention => C, 
        External_Name => "glPushName";

   procedure glPopName  -- gl.h:1438
   with Import => True, 
        Convention => C, 
        External_Name => "glPopName";

  -- * OpenGL 1.2
  --  

   procedure glDrawRangeElements
     (mode : GLenum;
      start : GLuint;
      c_end : GLuint;
      count : GLsizei;
      c_type : GLenum;
      indices : System.Address)  -- gl.h:1488
   with Import => True, 
        Convention => C, 
        External_Name => "glDrawRangeElements";

   procedure glTexImage3D
     (target : GLenum;
      level : GLint;
      internalFormat : GLint;
      width : GLsizei;
      height : GLsizei;
      depth : GLsizei;
      border : GLint;
      format : GLenum;
      c_type : GLenum;
      pixels : System.Address)  -- gl.h:1491
   with Import => True, 
        Convention => C, 
        External_Name => "glTexImage3D";

   procedure glTexSubImage3D
     (target : GLenum;
      level : GLint;
      xoffset : GLint;
      yoffset : GLint;
      zoffset : GLint;
      width : GLsizei;
      height : GLsizei;
      depth : GLsizei;
      format : GLenum;
      c_type : GLenum;
      pixels : System.Address)  -- gl.h:1498
   with Import => True, 
        Convention => C, 
        External_Name => "glTexSubImage3D";

   procedure glCopyTexSubImage3D
     (target : GLenum;
      level : GLint;
      xoffset : GLint;
      yoffset : GLint;
      zoffset : GLint;
      x : GLint;
      y : GLint;
      width : GLsizei;
      height : GLsizei)  -- gl.h:1505
   with Import => True, 
        Convention => C, 
        External_Name => "glCopyTexSubImage3D";

   type PFNGLDRAWRANGEELEMENTSPROC is access procedure
        (arg1 : GLenum;
         arg2 : GLuint;
         arg3 : GLuint;
         arg4 : GLsizei;
         arg5 : GLenum;
         arg6 : System.Address)
   with Convention => C;  -- gl.h:1511

   type PFNGLTEXIMAGE3DPROC is access procedure
        (arg1 : GLenum;
         arg2 : GLint;
         arg3 : GLint;
         arg4 : GLsizei;
         arg5 : GLsizei;
         arg6 : GLsizei;
         arg7 : GLint;
         arg8 : GLenum;
         arg9 : GLenum;
         arg10 : System.Address)
   with Convention => C;  -- gl.h:1512

   type PFNGLTEXSUBIMAGE3DPROC is access procedure
        (arg1 : GLenum;
         arg2 : GLint;
         arg3 : GLint;
         arg4 : GLint;
         arg5 : GLint;
         arg6 : GLsizei;
         arg7 : GLsizei;
         arg8 : GLsizei;
         arg9 : GLenum;
         arg10 : GLenum;
         arg11 : System.Address)
   with Convention => C;  -- gl.h:1513

   type PFNGLCOPYTEXSUBIMAGE3DPROC is access procedure
        (arg1 : GLenum;
         arg2 : GLint;
         arg3 : GLint;
         arg4 : GLint;
         arg5 : GLint;
         arg6 : GLint;
         arg7 : GLint;
         arg8 : GLsizei;
         arg9 : GLsizei)
   with Convention => C;  -- gl.h:1514

  -- * GL_ARB_imaging
  --  

   procedure glColorTable
     (target : GLenum;
      internalformat : GLenum;
      width : GLsizei;
      format : GLenum;
      c_type : GLenum;
      table : System.Address)  -- gl.h:1598
   with Import => True, 
        Convention => C, 
        External_Name => "glColorTable";

   procedure glColorSubTable
     (target : GLenum;
      start : GLsizei;
      count : GLsizei;
      format : GLenum;
      c_type : GLenum;
      data : System.Address)  -- gl.h:1602
   with Import => True, 
        Convention => C, 
        External_Name => "glColorSubTable";

   procedure glColorTableParameteriv
     (target : GLenum;
      pname : GLenum;
      params : access GLint)  -- gl.h:1607
   with Import => True, 
        Convention => C, 
        External_Name => "glColorTableParameteriv";

   procedure glColorTableParameterfv
     (target : GLenum;
      pname : GLenum;
      params : access GLfloat)  -- gl.h:1610
   with Import => True, 
        Convention => C, 
        External_Name => "glColorTableParameterfv";

   procedure glCopyColorSubTable
     (target : GLenum;
      start : GLsizei;
      x : GLint;
      y : GLint;
      width : GLsizei)  -- gl.h:1613
   with Import => True, 
        Convention => C, 
        External_Name => "glCopyColorSubTable";

   procedure glCopyColorTable
     (target : GLenum;
      internalformat : GLenum;
      x : GLint;
      y : GLint;
      width : GLsizei)  -- gl.h:1616
   with Import => True, 
        Convention => C, 
        External_Name => "glCopyColorTable";

   procedure glGetColorTable
     (target : GLenum;
      format : GLenum;
      c_type : GLenum;
      table : System.Address)  -- gl.h:1619
   with Import => True, 
        Convention => C, 
        External_Name => "glGetColorTable";

   procedure glGetColorTableParameterfv
     (target : GLenum;
      pname : GLenum;
      params : access GLfloat)  -- gl.h:1622
   with Import => True, 
        Convention => C, 
        External_Name => "glGetColorTableParameterfv";

   procedure glGetColorTableParameteriv
     (target : GLenum;
      pname : GLenum;
      params : access GLint)  -- gl.h:1625
   with Import => True, 
        Convention => C, 
        External_Name => "glGetColorTableParameteriv";

   procedure glBlendEquation (mode : GLenum)  -- gl.h:1628
   with Import => True, 
        Convention => C, 
        External_Name => "glBlendEquation";

   procedure glBlendColor
     (red : GLclampf;
      green : GLclampf;
      blue : GLclampf;
      alpha : GLclampf)  -- gl.h:1630
   with Import => True, 
        Convention => C, 
        External_Name => "glBlendColor";

   procedure glHistogram
     (target : GLenum;
      width : GLsizei;
      internalformat : GLenum;
      sink : GLboolean)  -- gl.h:1633
   with Import => True, 
        Convention => C, 
        External_Name => "glHistogram";

   procedure glResetHistogram (target : GLenum)  -- gl.h:1636
   with Import => True, 
        Convention => C, 
        External_Name => "glResetHistogram";

   procedure glGetHistogram
     (target : GLenum;
      reset : GLboolean;
      format : GLenum;
      c_type : GLenum;
      values : System.Address)  -- gl.h:1638
   with Import => True, 
        Convention => C, 
        External_Name => "glGetHistogram";

   procedure glGetHistogramParameterfv
     (target : GLenum;
      pname : GLenum;
      params : access GLfloat)  -- gl.h:1642
   with Import => True, 
        Convention => C, 
        External_Name => "glGetHistogramParameterfv";

   procedure glGetHistogramParameteriv
     (target : GLenum;
      pname : GLenum;
      params : access GLint)  -- gl.h:1645
   with Import => True, 
        Convention => C, 
        External_Name => "glGetHistogramParameteriv";

   procedure glMinmax
     (target : GLenum;
      internalformat : GLenum;
      sink : GLboolean)  -- gl.h:1648
   with Import => True, 
        Convention => C, 
        External_Name => "glMinmax";

   procedure glResetMinmax (target : GLenum)  -- gl.h:1651
   with Import => True, 
        Convention => C, 
        External_Name => "glResetMinmax";

   procedure glGetMinmax
     (target : GLenum;
      reset : GLboolean;
      format : GLenum;
      types : GLenum;
      values : System.Address)  -- gl.h:1653
   with Import => True, 
        Convention => C, 
        External_Name => "glGetMinmax";

   procedure glGetMinmaxParameterfv
     (target : GLenum;
      pname : GLenum;
      params : access GLfloat)  -- gl.h:1657
   with Import => True, 
        Convention => C, 
        External_Name => "glGetMinmaxParameterfv";

   procedure glGetMinmaxParameteriv
     (target : GLenum;
      pname : GLenum;
      params : access GLint)  -- gl.h:1660
   with Import => True, 
        Convention => C, 
        External_Name => "glGetMinmaxParameteriv";

   procedure glConvolutionFilter1D
     (target : GLenum;
      internalformat : GLenum;
      width : GLsizei;
      format : GLenum;
      c_type : GLenum;
      image : System.Address)  -- gl.h:1663
   with Import => True, 
        Convention => C, 
        External_Name => "glConvolutionFilter1D";

   procedure glConvolutionFilter2D
     (target : GLenum;
      internalformat : GLenum;
      width : GLsizei;
      height : GLsizei;
      format : GLenum;
      c_type : GLenum;
      image : System.Address)  -- gl.h:1667
   with Import => True, 
        Convention => C, 
        External_Name => "glConvolutionFilter2D";

   procedure glConvolutionParameterf
     (target : GLenum;
      pname : GLenum;
      params : GLfloat)  -- gl.h:1671
   with Import => True, 
        Convention => C, 
        External_Name => "glConvolutionParameterf";

   procedure glConvolutionParameterfv
     (target : GLenum;
      pname : GLenum;
      params : access GLfloat)  -- gl.h:1674
   with Import => True, 
        Convention => C, 
        External_Name => "glConvolutionParameterfv";

   procedure glConvolutionParameteri
     (target : GLenum;
      pname : GLenum;
      params : GLint)  -- gl.h:1677
   with Import => True, 
        Convention => C, 
        External_Name => "glConvolutionParameteri";

   procedure glConvolutionParameteriv
     (target : GLenum;
      pname : GLenum;
      params : access GLint)  -- gl.h:1680
   with Import => True, 
        Convention => C, 
        External_Name => "glConvolutionParameteriv";

   procedure glCopyConvolutionFilter1D
     (target : GLenum;
      internalformat : GLenum;
      x : GLint;
      y : GLint;
      width : GLsizei)  -- gl.h:1683
   with Import => True, 
        Convention => C, 
        External_Name => "glCopyConvolutionFilter1D";

   procedure glCopyConvolutionFilter2D
     (target : GLenum;
      internalformat : GLenum;
      x : GLint;
      y : GLint;
      width : GLsizei;
      height : GLsizei)  -- gl.h:1686
   with Import => True, 
        Convention => C, 
        External_Name => "glCopyConvolutionFilter2D";

   procedure glGetConvolutionFilter
     (target : GLenum;
      format : GLenum;
      c_type : GLenum;
      image : System.Address)  -- gl.h:1690
   with Import => True, 
        Convention => C, 
        External_Name => "glGetConvolutionFilter";

   procedure glGetConvolutionParameterfv
     (target : GLenum;
      pname : GLenum;
      params : access GLfloat)  -- gl.h:1693
   with Import => True, 
        Convention => C, 
        External_Name => "glGetConvolutionParameterfv";

   procedure glGetConvolutionParameteriv
     (target : GLenum;
      pname : GLenum;
      params : access GLint)  -- gl.h:1696
   with Import => True, 
        Convention => C, 
        External_Name => "glGetConvolutionParameteriv";

   procedure glSeparableFilter2D
     (target : GLenum;
      internalformat : GLenum;
      width : GLsizei;
      height : GLsizei;
      format : GLenum;
      c_type : GLenum;
      row : System.Address;
      column : System.Address)  -- gl.h:1699
   with Import => True, 
        Convention => C, 
        External_Name => "glSeparableFilter2D";

   procedure glGetSeparableFilter
     (target : GLenum;
      format : GLenum;
      c_type : GLenum;
      row : System.Address;
      column : System.Address;
      span : System.Address)  -- gl.h:1703
   with Import => True, 
        Convention => C, 
        External_Name => "glGetSeparableFilter";

  -- * OpenGL 1.3
  --  

  -- multitexture  
  -- texture_cube_map  
  -- texture_compression  
  -- multisample  
  -- transpose_matrix  
  -- texture_env_combine  
  -- texture_env_dot3  
  -- texture_border_clamp  
   procedure glActiveTexture (texture : GLenum)  -- gl.h:1818
   with Import => True, 
        Convention => C, 
        External_Name => "glActiveTexture";

   procedure glClientActiveTexture (texture : GLenum)  -- gl.h:1820
   with Import => True, 
        Convention => C, 
        External_Name => "glClientActiveTexture";

   procedure glCompressedTexImage1D
     (target : GLenum;
      level : GLint;
      internalformat : GLenum;
      width : GLsizei;
      border : GLint;
      imageSize : GLsizei;
      data : System.Address)  -- gl.h:1822
   with Import => True, 
        Convention => C, 
        External_Name => "glCompressedTexImage1D";

   procedure glCompressedTexImage2D
     (target : GLenum;
      level : GLint;
      internalformat : GLenum;
      width : GLsizei;
      height : GLsizei;
      border : GLint;
      imageSize : GLsizei;
      data : System.Address)  -- gl.h:1824
   with Import => True, 
        Convention => C, 
        External_Name => "glCompressedTexImage2D";

   procedure glCompressedTexImage3D
     (target : GLenum;
      level : GLint;
      internalformat : GLenum;
      width : GLsizei;
      height : GLsizei;
      depth : GLsizei;
      border : GLint;
      imageSize : GLsizei;
      data : System.Address)  -- gl.h:1826
   with Import => True, 
        Convention => C, 
        External_Name => "glCompressedTexImage3D";

   procedure glCompressedTexSubImage1D
     (target : GLenum;
      level : GLint;
      xoffset : GLint;
      width : GLsizei;
      format : GLenum;
      imageSize : GLsizei;
      data : System.Address)  -- gl.h:1828
   with Import => True, 
        Convention => C, 
        External_Name => "glCompressedTexSubImage1D";

   procedure glCompressedTexSubImage2D
     (target : GLenum;
      level : GLint;
      xoffset : GLint;
      yoffset : GLint;
      width : GLsizei;
      height : GLsizei;
      format : GLenum;
      imageSize : GLsizei;
      data : System.Address)  -- gl.h:1830
   with Import => True, 
        Convention => C, 
        External_Name => "glCompressedTexSubImage2D";

   procedure glCompressedTexSubImage3D
     (target : GLenum;
      level : GLint;
      xoffset : GLint;
      yoffset : GLint;
      zoffset : GLint;
      width : GLsizei;
      height : GLsizei;
      depth : GLsizei;
      format : GLenum;
      imageSize : GLsizei;
      data : System.Address)  -- gl.h:1832
   with Import => True, 
        Convention => C, 
        External_Name => "glCompressedTexSubImage3D";

   procedure glGetCompressedTexImage
     (target : GLenum;
      lod : GLint;
      img : System.Address)  -- gl.h:1834
   with Import => True, 
        Convention => C, 
        External_Name => "glGetCompressedTexImage";

   procedure glMultiTexCoord1d (target : GLenum; s : GLdouble)  -- gl.h:1836
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord1d";

   procedure glMultiTexCoord1dv (target : GLenum; v : access GLdouble)  -- gl.h:1838
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord1dv";

   procedure glMultiTexCoord1f (target : GLenum; s : GLfloat)  -- gl.h:1840
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord1f";

   procedure glMultiTexCoord1fv (target : GLenum; v : access GLfloat)  -- gl.h:1842
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord1fv";

   procedure glMultiTexCoord1i (target : GLenum; s : GLint)  -- gl.h:1844
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord1i";

   procedure glMultiTexCoord1iv (target : GLenum; v : access GLint)  -- gl.h:1846
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord1iv";

   procedure glMultiTexCoord1s (target : GLenum; s : GLshort)  -- gl.h:1848
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord1s";

   procedure glMultiTexCoord1sv (target : GLenum; v : access GLshort)  -- gl.h:1850
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord1sv";

   procedure glMultiTexCoord2d
     (target : GLenum;
      s : GLdouble;
      t : GLdouble)  -- gl.h:1852
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord2d";

   procedure glMultiTexCoord2dv (target : GLenum; v : access GLdouble)  -- gl.h:1854
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord2dv";

   procedure glMultiTexCoord2f
     (target : GLenum;
      s : GLfloat;
      t : GLfloat)  -- gl.h:1856
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord2f";

   procedure glMultiTexCoord2fv (target : GLenum; v : access GLfloat)  -- gl.h:1858
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord2fv";

   procedure glMultiTexCoord2i
     (target : GLenum;
      s : GLint;
      t : GLint)  -- gl.h:1860
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord2i";

   procedure glMultiTexCoord2iv (target : GLenum; v : access GLint)  -- gl.h:1862
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord2iv";

   procedure glMultiTexCoord2s
     (target : GLenum;
      s : GLshort;
      t : GLshort)  -- gl.h:1864
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord2s";

   procedure glMultiTexCoord2sv (target : GLenum; v : access GLshort)  -- gl.h:1866
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord2sv";

   procedure glMultiTexCoord3d
     (target : GLenum;
      s : GLdouble;
      t : GLdouble;
      r : GLdouble)  -- gl.h:1868
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord3d";

   procedure glMultiTexCoord3dv (target : GLenum; v : access GLdouble)  -- gl.h:1870
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord3dv";

   procedure glMultiTexCoord3f
     (target : GLenum;
      s : GLfloat;
      t : GLfloat;
      r : GLfloat)  -- gl.h:1872
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord3f";

   procedure glMultiTexCoord3fv (target : GLenum; v : access GLfloat)  -- gl.h:1874
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord3fv";

   procedure glMultiTexCoord3i
     (target : GLenum;
      s : GLint;
      t : GLint;
      r : GLint)  -- gl.h:1876
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord3i";

   procedure glMultiTexCoord3iv (target : GLenum; v : access GLint)  -- gl.h:1878
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord3iv";

   procedure glMultiTexCoord3s
     (target : GLenum;
      s : GLshort;
      t : GLshort;
      r : GLshort)  -- gl.h:1880
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord3s";

   procedure glMultiTexCoord3sv (target : GLenum; v : access GLshort)  -- gl.h:1882
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord3sv";

   procedure glMultiTexCoord4d
     (target : GLenum;
      s : GLdouble;
      t : GLdouble;
      r : GLdouble;
      q : GLdouble)  -- gl.h:1884
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord4d";

   procedure glMultiTexCoord4dv (target : GLenum; v : access GLdouble)  -- gl.h:1886
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord4dv";

   procedure glMultiTexCoord4f
     (target : GLenum;
      s : GLfloat;
      t : GLfloat;
      r : GLfloat;
      q : GLfloat)  -- gl.h:1888
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord4f";

   procedure glMultiTexCoord4fv (target : GLenum; v : access GLfloat)  -- gl.h:1890
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord4fv";

   procedure glMultiTexCoord4i
     (target : GLenum;
      s : GLint;
      t : GLint;
      r : GLint;
      q : GLint)  -- gl.h:1892
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord4i";

   procedure glMultiTexCoord4iv (target : GLenum; v : access GLint)  -- gl.h:1894
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord4iv";

   procedure glMultiTexCoord4s
     (target : GLenum;
      s : GLshort;
      t : GLshort;
      r : GLshort;
      q : GLshort)  -- gl.h:1896
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord4s";

   procedure glMultiTexCoord4sv (target : GLenum; v : access GLshort)  -- gl.h:1898
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord4sv";

   procedure glLoadTransposeMatrixd (m : access GLdouble)  -- gl.h:1901
   with Import => True, 
        Convention => C, 
        External_Name => "glLoadTransposeMatrixd";

   procedure glLoadTransposeMatrixf (m : access GLfloat)  -- gl.h:1903
   with Import => True, 
        Convention => C, 
        External_Name => "glLoadTransposeMatrixf";

   procedure glMultTransposeMatrixd (m : access GLdouble)  -- gl.h:1905
   with Import => True, 
        Convention => C, 
        External_Name => "glMultTransposeMatrixd";

   procedure glMultTransposeMatrixf (m : access GLfloat)  -- gl.h:1907
   with Import => True, 
        Convention => C, 
        External_Name => "glMultTransposeMatrixf";

   procedure glSampleCoverage (value : GLclampf; invert : GLboolean)  -- gl.h:1909
   with Import => True, 
        Convention => C, 
        External_Name => "glSampleCoverage";

   type PFNGLACTIVETEXTUREPROC is access procedure (arg1 : GLenum)
   with Convention => C;  -- gl.h:1912

   type PFNGLSAMPLECOVERAGEPROC is access procedure (arg1 : GLclampf; arg2 : GLboolean)
   with Convention => C;  -- gl.h:1913

   type PFNGLCOMPRESSEDTEXIMAGE3DPROC is access procedure
        (arg1 : GLenum;
         arg2 : GLint;
         arg3 : GLenum;
         arg4 : GLsizei;
         arg5 : GLsizei;
         arg6 : GLsizei;
         arg7 : GLint;
         arg8 : GLsizei;
         arg9 : System.Address)
   with Convention => C;  -- gl.h:1914

   type PFNGLCOMPRESSEDTEXIMAGE2DPROC is access procedure
        (arg1 : GLenum;
         arg2 : GLint;
         arg3 : GLenum;
         arg4 : GLsizei;
         arg5 : GLsizei;
         arg6 : GLint;
         arg7 : GLsizei;
         arg8 : System.Address)
   with Convention => C;  -- gl.h:1915

   type PFNGLCOMPRESSEDTEXIMAGE1DPROC is access procedure
        (arg1 : GLenum;
         arg2 : GLint;
         arg3 : GLenum;
         arg4 : GLsizei;
         arg5 : GLint;
         arg6 : GLsizei;
         arg7 : System.Address)
   with Convention => C;  -- gl.h:1916

   type PFNGLCOMPRESSEDTEXSUBIMAGE3DPROC is access procedure
        (arg1 : GLenum;
         arg2 : GLint;
         arg3 : GLint;
         arg4 : GLint;
         arg5 : GLint;
         arg6 : GLsizei;
         arg7 : GLsizei;
         arg8 : GLsizei;
         arg9 : GLenum;
         arg10 : GLsizei;
         arg11 : System.Address)
   with Convention => C;  -- gl.h:1917

   type PFNGLCOMPRESSEDTEXSUBIMAGE2DPROC is access procedure
        (arg1 : GLenum;
         arg2 : GLint;
         arg3 : GLint;
         arg4 : GLint;
         arg5 : GLsizei;
         arg6 : GLsizei;
         arg7 : GLenum;
         arg8 : GLsizei;
         arg9 : System.Address)
   with Convention => C;  -- gl.h:1918

   type PFNGLCOMPRESSEDTEXSUBIMAGE1DPROC is access procedure
        (arg1 : GLenum;
         arg2 : GLint;
         arg3 : GLint;
         arg4 : GLsizei;
         arg5 : GLenum;
         arg6 : GLsizei;
         arg7 : System.Address)
   with Convention => C;  -- gl.h:1919

   type PFNGLGETCOMPRESSEDTEXIMAGEPROC is access procedure
        (arg1 : GLenum;
         arg2 : GLint;
         arg3 : System.Address)
   with Convention => C;  -- gl.h:1920

  -- * GL_ARB_multitexture (ARB extension 1 and OpenGL 1.2.1)
  --  

   procedure glActiveTextureARB (texture : GLenum)  -- gl.h:1966
   with Import => True, 
        Convention => C, 
        External_Name => "glActiveTextureARB";

   procedure glClientActiveTextureARB (texture : GLenum)  -- gl.h:1967
   with Import => True, 
        Convention => C, 
        External_Name => "glClientActiveTextureARB";

   procedure glMultiTexCoord1dARB (target : GLenum; s : GLdouble)  -- gl.h:1968
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord1dARB";

   procedure glMultiTexCoord1dvARB (target : GLenum; v : access GLdouble)  -- gl.h:1969
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord1dvARB";

   procedure glMultiTexCoord1fARB (target : GLenum; s : GLfloat)  -- gl.h:1970
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord1fARB";

   procedure glMultiTexCoord1fvARB (target : GLenum; v : access GLfloat)  -- gl.h:1971
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord1fvARB";

   procedure glMultiTexCoord1iARB (target : GLenum; s : GLint)  -- gl.h:1972
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord1iARB";

   procedure glMultiTexCoord1ivARB (target : GLenum; v : access GLint)  -- gl.h:1973
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord1ivARB";

   procedure glMultiTexCoord1sARB (target : GLenum; s : GLshort)  -- gl.h:1974
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord1sARB";

   procedure glMultiTexCoord1svARB (target : GLenum; v : access GLshort)  -- gl.h:1975
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord1svARB";

   procedure glMultiTexCoord2dARB
     (target : GLenum;
      s : GLdouble;
      t : GLdouble)  -- gl.h:1976
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord2dARB";

   procedure glMultiTexCoord2dvARB (target : GLenum; v : access GLdouble)  -- gl.h:1977
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord2dvARB";

   procedure glMultiTexCoord2fARB
     (target : GLenum;
      s : GLfloat;
      t : GLfloat)  -- gl.h:1978
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord2fARB";

   procedure glMultiTexCoord2fvARB (target : GLenum; v : access GLfloat)  -- gl.h:1979
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord2fvARB";

   procedure glMultiTexCoord2iARB
     (target : GLenum;
      s : GLint;
      t : GLint)  -- gl.h:1980
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord2iARB";

   procedure glMultiTexCoord2ivARB (target : GLenum; v : access GLint)  -- gl.h:1981
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord2ivARB";

   procedure glMultiTexCoord2sARB
     (target : GLenum;
      s : GLshort;
      t : GLshort)  -- gl.h:1982
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord2sARB";

   procedure glMultiTexCoord2svARB (target : GLenum; v : access GLshort)  -- gl.h:1983
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord2svARB";

   procedure glMultiTexCoord3dARB
     (target : GLenum;
      s : GLdouble;
      t : GLdouble;
      r : GLdouble)  -- gl.h:1984
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord3dARB";

   procedure glMultiTexCoord3dvARB (target : GLenum; v : access GLdouble)  -- gl.h:1985
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord3dvARB";

   procedure glMultiTexCoord3fARB
     (target : GLenum;
      s : GLfloat;
      t : GLfloat;
      r : GLfloat)  -- gl.h:1986
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord3fARB";

   procedure glMultiTexCoord3fvARB (target : GLenum; v : access GLfloat)  -- gl.h:1987
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord3fvARB";

   procedure glMultiTexCoord3iARB
     (target : GLenum;
      s : GLint;
      t : GLint;
      r : GLint)  -- gl.h:1988
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord3iARB";

   procedure glMultiTexCoord3ivARB (target : GLenum; v : access GLint)  -- gl.h:1989
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord3ivARB";

   procedure glMultiTexCoord3sARB
     (target : GLenum;
      s : GLshort;
      t : GLshort;
      r : GLshort)  -- gl.h:1990
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord3sARB";

   procedure glMultiTexCoord3svARB (target : GLenum; v : access GLshort)  -- gl.h:1991
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord3svARB";

   procedure glMultiTexCoord4dARB
     (target : GLenum;
      s : GLdouble;
      t : GLdouble;
      r : GLdouble;
      q : GLdouble)  -- gl.h:1992
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord4dARB";

   procedure glMultiTexCoord4dvARB (target : GLenum; v : access GLdouble)  -- gl.h:1993
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord4dvARB";

   procedure glMultiTexCoord4fARB
     (target : GLenum;
      s : GLfloat;
      t : GLfloat;
      r : GLfloat;
      q : GLfloat)  -- gl.h:1994
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord4fARB";

   procedure glMultiTexCoord4fvARB (target : GLenum; v : access GLfloat)  -- gl.h:1995
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord4fvARB";

   procedure glMultiTexCoord4iARB
     (target : GLenum;
      s : GLint;
      t : GLint;
      r : GLint;
      q : GLint)  -- gl.h:1996
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord4iARB";

   procedure glMultiTexCoord4ivARB (target : GLenum; v : access GLint)  -- gl.h:1997
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord4ivARB";

   procedure glMultiTexCoord4sARB
     (target : GLenum;
      s : GLshort;
      t : GLshort;
      r : GLshort;
      q : GLshort)  -- gl.h:1998
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord4sARB";

   procedure glMultiTexCoord4svARB (target : GLenum; v : access GLshort)  -- gl.h:1999
   with Import => True, 
        Convention => C, 
        External_Name => "glMultiTexCoord4svARB";

   type PFNGLACTIVETEXTUREARBPROC is access procedure (arg1 : GLenum)
   with Convention => C;  -- gl.h:2001

   type PFNGLCLIENTACTIVETEXTUREARBPROC is access procedure (arg1 : GLenum)
   with Convention => C;  -- gl.h:2002

   type PFNGLMULTITEXCOORD1DARBPROC is access procedure (arg1 : GLenum; arg2 : GLdouble)
   with Convention => C;  -- gl.h:2003

   type PFNGLMULTITEXCOORD1DVARBPROC is access procedure (arg1 : GLenum; arg2 : access GLdouble)
   with Convention => C;  -- gl.h:2004

   type PFNGLMULTITEXCOORD1FARBPROC is access procedure (arg1 : GLenum; arg2 : GLfloat)
   with Convention => C;  -- gl.h:2005

   type PFNGLMULTITEXCOORD1FVARBPROC is access procedure (arg1 : GLenum; arg2 : access GLfloat)
   with Convention => C;  -- gl.h:2006

   type PFNGLMULTITEXCOORD1IARBPROC is access procedure (arg1 : GLenum; arg2 : GLint)
   with Convention => C;  -- gl.h:2007

   type PFNGLMULTITEXCOORD1IVARBPROC is access procedure (arg1 : GLenum; arg2 : access GLint)
   with Convention => C;  -- gl.h:2008

   type PFNGLMULTITEXCOORD1SARBPROC is access procedure (arg1 : GLenum; arg2 : GLshort)
   with Convention => C;  -- gl.h:2009

   type PFNGLMULTITEXCOORD1SVARBPROC is access procedure (arg1 : GLenum; arg2 : access GLshort)
   with Convention => C;  -- gl.h:2010

   type PFNGLMULTITEXCOORD2DARBPROC is access procedure
        (arg1 : GLenum;
         arg2 : GLdouble;
         arg3 : GLdouble)
   with Convention => C;  -- gl.h:2011

   type PFNGLMULTITEXCOORD2DVARBPROC is access procedure (arg1 : GLenum; arg2 : access GLdouble)
   with Convention => C;  -- gl.h:2012

   type PFNGLMULTITEXCOORD2FARBPROC is access procedure
        (arg1 : GLenum;
         arg2 : GLfloat;
         arg3 : GLfloat)
   with Convention => C;  -- gl.h:2013

   type PFNGLMULTITEXCOORD2FVARBPROC is access procedure (arg1 : GLenum; arg2 : access GLfloat)
   with Convention => C;  -- gl.h:2014

   type PFNGLMULTITEXCOORD2IARBPROC is access procedure
        (arg1 : GLenum;
         arg2 : GLint;
         arg3 : GLint)
   with Convention => C;  -- gl.h:2015

   type PFNGLMULTITEXCOORD2IVARBPROC is access procedure (arg1 : GLenum; arg2 : access GLint)
   with Convention => C;  -- gl.h:2016

   type PFNGLMULTITEXCOORD2SARBPROC is access procedure
        (arg1 : GLenum;
         arg2 : GLshort;
         arg3 : GLshort)
   with Convention => C;  -- gl.h:2017

   type PFNGLMULTITEXCOORD2SVARBPROC is access procedure (arg1 : GLenum; arg2 : access GLshort)
   with Convention => C;  -- gl.h:2018

   type PFNGLMULTITEXCOORD3DARBPROC is access procedure
        (arg1 : GLenum;
         arg2 : GLdouble;
         arg3 : GLdouble;
         arg4 : GLdouble)
   with Convention => C;  -- gl.h:2019

   type PFNGLMULTITEXCOORD3DVARBPROC is access procedure (arg1 : GLenum; arg2 : access GLdouble)
   with Convention => C;  -- gl.h:2020

   type PFNGLMULTITEXCOORD3FARBPROC is access procedure
        (arg1 : GLenum;
         arg2 : GLfloat;
         arg3 : GLfloat;
         arg4 : GLfloat)
   with Convention => C;  -- gl.h:2021

   type PFNGLMULTITEXCOORD3FVARBPROC is access procedure (arg1 : GLenum; arg2 : access GLfloat)
   with Convention => C;  -- gl.h:2022

   type PFNGLMULTITEXCOORD3IARBPROC is access procedure
        (arg1 : GLenum;
         arg2 : GLint;
         arg3 : GLint;
         arg4 : GLint)
   with Convention => C;  -- gl.h:2023

   type PFNGLMULTITEXCOORD3IVARBPROC is access procedure (arg1 : GLenum; arg2 : access GLint)
   with Convention => C;  -- gl.h:2024

   type PFNGLMULTITEXCOORD3SARBPROC is access procedure
        (arg1 : GLenum;
         arg2 : GLshort;
         arg3 : GLshort;
         arg4 : GLshort)
   with Convention => C;  -- gl.h:2025

   type PFNGLMULTITEXCOORD3SVARBPROC is access procedure (arg1 : GLenum; arg2 : access GLshort)
   with Convention => C;  -- gl.h:2026

   type PFNGLMULTITEXCOORD4DARBPROC is access procedure
        (arg1 : GLenum;
         arg2 : GLdouble;
         arg3 : GLdouble;
         arg4 : GLdouble;
         arg5 : GLdouble)
   with Convention => C;  -- gl.h:2027

   type PFNGLMULTITEXCOORD4DVARBPROC is access procedure (arg1 : GLenum; arg2 : access GLdouble)
   with Convention => C;  -- gl.h:2028

   type PFNGLMULTITEXCOORD4FARBPROC is access procedure
        (arg1 : GLenum;
         arg2 : GLfloat;
         arg3 : GLfloat;
         arg4 : GLfloat;
         arg5 : GLfloat)
   with Convention => C;  -- gl.h:2029

   type PFNGLMULTITEXCOORD4FVARBPROC is access procedure (arg1 : GLenum; arg2 : access GLfloat)
   with Convention => C;  -- gl.h:2030

   type PFNGLMULTITEXCOORD4IARBPROC is access procedure
        (arg1 : GLenum;
         arg2 : GLint;
         arg3 : GLint;
         arg4 : GLint;
         arg5 : GLint)
   with Convention => C;  -- gl.h:2031

   type PFNGLMULTITEXCOORD4IVARBPROC is access procedure (arg1 : GLenum; arg2 : access GLint)
   with Convention => C;  -- gl.h:2032

   type PFNGLMULTITEXCOORD4SARBPROC is access procedure
        (arg1 : GLenum;
         arg2 : GLshort;
         arg3 : GLshort;
         arg4 : GLshort;
         arg5 : GLshort)
   with Convention => C;  -- gl.h:2033

   type PFNGLMULTITEXCOORD4SVARBPROC is access procedure (arg1 : GLenum; arg2 : access GLshort)
   with Convention => C;  -- gl.h:2034

  -- * Define this token if you want "old-style" header file behaviour (extensions
  -- * defined in gl.h).  Otherwise, extensions will be included from glext.h.
  --  

  -- All extensions that used to be here are now found in glext.h  
  -- * ???. GL_MESA_packed_depth_stencil
  -- * XXX obsolete
  --  

   procedure glBlendEquationSeparateATI (modeRGB : GLenum; modeA : GLenum)  -- gl.h:2077
   with Import => True, 
        Convention => C, 
        External_Name => "glBlendEquationSeparateATI";

   type PFNGLBLENDEQUATIONSEPARATEATIPROC is access procedure (arg1 : GLenum; arg2 : GLenum)
   with Convention => C;  -- gl.h:2078

  -- GL_OES_EGL_image  
   type PFNGLEGLIMAGETARGETTEXTURE2DOESPROC is access procedure (arg1 : GLenum; arg2 : glext.GLeglImageOES)
   with Convention => C;  -- gl.h:2094

   type PFNGLEGLIMAGETARGETRENDERBUFFERSTORAGEOESPROC is access procedure (arg1 : GLenum; arg2 : glext.GLeglImageOES)
   with Convention => C;  -- gl.h:2095

end gl;
