pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with Xlib;
with GLX;
with GL;
with System;
limited with Xutil;
with X11;
with Interfaces.C.Strings;
with glext;
with bits_stdint_intn_h;

package glxext is

   GLX_GLXEXT_VERSION : constant := 20190911;  --  /usr/include/GL/glxext.h:37

   GLX_ARB_context_flush_control : constant := 1;  --  /usr/include/GL/glxext.h:160
   GLX_CONTEXT_RELEASE_BEHAVIOR_ARB : constant := 16#2097#;  --  /usr/include/GL/glxext.h:161
   GLX_CONTEXT_RELEASE_BEHAVIOR_NONE_ARB : constant := 0;  --  /usr/include/GL/glxext.h:162
   GLX_CONTEXT_RELEASE_BEHAVIOR_FLUSH_ARB : constant := 16#2098#;  --  /usr/include/GL/glxext.h:163

   GLX_ARB_create_context : constant := 1;  --  /usr/include/GL/glxext.h:167
   GLX_CONTEXT_DEBUG_BIT_ARB : constant := 16#00000001#;  --  /usr/include/GL/glxext.h:168
   GLX_CONTEXT_FORWARD_COMPATIBLE_BIT_ARB : constant := 16#00000002#;  --  /usr/include/GL/glxext.h:169
   GLX_CONTEXT_MAJOR_VERSION_ARB : constant := 16#2091#;  --  /usr/include/GL/glxext.h:170
   GLX_CONTEXT_MINOR_VERSION_ARB : constant := 16#2092#;  --  /usr/include/GL/glxext.h:171
   GLX_CONTEXT_FLAGS_ARB : constant := 16#2094#;  --  /usr/include/GL/glxext.h:172

   GLX_ARB_create_context_no_error : constant := 1;  --  /usr/include/GL/glxext.h:180
   GLX_CONTEXT_OPENGL_NO_ERROR_ARB : constant := 16#31B3#;  --  /usr/include/GL/glxext.h:181

   GLX_ARB_create_context_profile : constant := 1;  --  /usr/include/GL/glxext.h:185
   GLX_CONTEXT_CORE_PROFILE_BIT_ARB : constant := 16#00000001#;  --  /usr/include/GL/glxext.h:186
   GLX_CONTEXT_COMPATIBILITY_PROFILE_BIT_ARB : constant := 16#00000002#;  --  /usr/include/GL/glxext.h:187
   GLX_CONTEXT_PROFILE_MASK_ARB : constant := 16#9126#;  --  /usr/include/GL/glxext.h:188

   GLX_ARB_create_context_robustness : constant := 1;  --  /usr/include/GL/glxext.h:192
   GLX_CONTEXT_ROBUST_ACCESS_BIT_ARB : constant := 16#00000004#;  --  /usr/include/GL/glxext.h:193
   GLX_LOSE_CONTEXT_ON_RESET_ARB : constant := 16#8252#;  --  /usr/include/GL/glxext.h:194
   GLX_CONTEXT_RESET_NOTIFICATION_STRATEGY_ARB : constant := 16#8256#;  --  /usr/include/GL/glxext.h:195
   GLX_NO_RESET_NOTIFICATION_ARB : constant := 16#8261#;  --  /usr/include/GL/glxext.h:196

   GLX_ARB_fbconfig_float : constant := 1;  --  /usr/include/GL/glxext.h:200
   GLX_RGBA_FLOAT_TYPE_ARB : constant := 16#20B9#;  --  /usr/include/GL/glxext.h:201
   GLX_RGBA_FLOAT_BIT_ARB : constant := 16#00000004#;  --  /usr/include/GL/glxext.h:202

   GLX_ARB_framebuffer_sRGB : constant := 1;  --  /usr/include/GL/glxext.h:206
   GLX_FRAMEBUFFER_SRGB_CAPABLE_ARB : constant := 16#20B2#;  --  /usr/include/GL/glxext.h:207

   GLX_ARB_multisample : constant := 1;  --  /usr/include/GL/glxext.h:219
   GLX_SAMPLE_BUFFERS_ARB : constant := 100000;  --  /usr/include/GL/glxext.h:220
   GLX_SAMPLES_ARB : constant := 100001;  --  /usr/include/GL/glxext.h:221

   GLX_ARB_robustness_application_isolation : constant := 1;  --  /usr/include/GL/glxext.h:225
   GLX_CONTEXT_RESET_ISOLATION_BIT_ARB : constant := 16#00000008#;  --  /usr/include/GL/glxext.h:226

   GLX_ARB_robustness_share_group_isolation : constant := 1;  --  /usr/include/GL/glxext.h:230

   GLX_ARB_vertex_buffer_object : constant := 1;  --  /usr/include/GL/glxext.h:234
   GLX_CONTEXT_ALLOW_BUFFER_BYTE_ORDER_MISMATCH_ARB : constant := 16#2095#;  --  /usr/include/GL/glxext.h:235

   GLX_3DFX_multisample : constant := 1;  --  /usr/include/GL/glxext.h:239
   GLX_SAMPLE_BUFFERS_3DFX : constant := 16#8050#;  --  /usr/include/GL/glxext.h:240
   GLX_SAMPLES_3DFX : constant := 16#8051#;  --  /usr/include/GL/glxext.h:241

   GLX_AMD_gpu_association : constant := 1;  --  /usr/include/GL/glxext.h:245
   GLX_GPU_VENDOR_AMD : constant := 16#1F00#;  --  /usr/include/GL/glxext.h:246
   GLX_GPU_RENDERER_STRING_AMD : constant := 16#1F01#;  --  /usr/include/GL/glxext.h:247
   GLX_GPU_OPENGL_VERSION_STRING_AMD : constant := 16#1F02#;  --  /usr/include/GL/glxext.h:248
   GLX_GPU_FASTEST_TARGET_GPUS_AMD : constant := 16#21A2#;  --  /usr/include/GL/glxext.h:249
   GLX_GPU_RAM_AMD : constant := 16#21A3#;  --  /usr/include/GL/glxext.h:250
   GLX_GPU_CLOCK_AMD : constant := 16#21A4#;  --  /usr/include/GL/glxext.h:251
   GLX_GPU_NUM_PIPES_AMD : constant := 16#21A5#;  --  /usr/include/GL/glxext.h:252
   GLX_GPU_NUM_SIMD_AMD : constant := 16#21A6#;  --  /usr/include/GL/glxext.h:253
   GLX_GPU_NUM_RB_AMD : constant := 16#21A7#;  --  /usr/include/GL/glxext.h:254
   GLX_GPU_NUM_SPI_AMD : constant := 16#21A8#;  --  /usr/include/GL/glxext.h:255

   GLX_EXT_buffer_age : constant := 1;  --  /usr/include/GL/glxext.h:279
   GLX_BACK_BUFFER_AGE_EXT : constant := 16#20F4#;  --  /usr/include/GL/glxext.h:280

   GLX_EXT_context_priority : constant := 1;  --  /usr/include/GL/glxext.h:284
   GLX_CONTEXT_PRIORITY_LEVEL_EXT : constant := 16#3100#;  --  /usr/include/GL/glxext.h:285
   GLX_CONTEXT_PRIORITY_HIGH_EXT : constant := 16#3101#;  --  /usr/include/GL/glxext.h:286
   GLX_CONTEXT_PRIORITY_MEDIUM_EXT : constant := 16#3102#;  --  /usr/include/GL/glxext.h:287
   GLX_CONTEXT_PRIORITY_LOW_EXT : constant := 16#3103#;  --  /usr/include/GL/glxext.h:288

   GLX_EXT_create_context_es2_profile : constant := 1;  --  /usr/include/GL/glxext.h:292
   GLX_CONTEXT_ES2_PROFILE_BIT_EXT : constant := 16#00000004#;  --  /usr/include/GL/glxext.h:293

   GLX_EXT_create_context_es_profile : constant := 1;  --  /usr/include/GL/glxext.h:297
   GLX_CONTEXT_ES_PROFILE_BIT_EXT : constant := 16#00000004#;  --  /usr/include/GL/glxext.h:298

   GLX_EXT_fbconfig_packed_float : constant := 1;  --  /usr/include/GL/glxext.h:302
   GLX_RGBA_UNSIGNED_FLOAT_TYPE_EXT : constant := 16#20B1#;  --  /usr/include/GL/glxext.h:303
   GLX_RGBA_UNSIGNED_FLOAT_BIT_EXT : constant := 16#00000008#;  --  /usr/include/GL/glxext.h:304

   GLX_EXT_framebuffer_sRGB : constant := 1;  --  /usr/include/GL/glxext.h:308
   GLX_FRAMEBUFFER_SRGB_CAPABLE_EXT : constant := 16#20B2#;  --  /usr/include/GL/glxext.h:309

   GLX_EXT_import_context : constant := 1;  --  /usr/include/GL/glxext.h:313
   GLX_SHARE_CONTEXT_EXT : constant := 16#800A#;  --  /usr/include/GL/glxext.h:314
   GLX_VISUAL_ID_EXT : constant := 16#800B#;  --  /usr/include/GL/glxext.h:315
   GLX_SCREEN_EXT : constant := 16#800C#;  --  /usr/include/GL/glxext.h:316

   GLX_EXT_libglvnd : constant := 1;  --  /usr/include/GL/glxext.h:332
   GLX_VENDOR_NAMES_EXT : constant := 16#20F6#;  --  /usr/include/GL/glxext.h:333

   GLX_EXT_no_config_context : constant := 1;  --  /usr/include/GL/glxext.h:337

   GLX_EXT_stereo_tree : constant := 1;  --  /usr/include/GL/glxext.h:341

   GLX_STEREO_TREE_EXT : constant := 16#20F5#;  --  /usr/include/GL/glxext.h:352
   GLX_STEREO_NOTIFY_MASK_EXT : constant := 16#00000001#;  --  /usr/include/GL/glxext.h:353
   GLX_STEREO_NOTIFY_EXT : constant := 16#00000000#;  --  /usr/include/GL/glxext.h:354

   GLX_EXT_swap_control : constant := 1;  --  /usr/include/GL/glxext.h:358
   GLX_SWAP_INTERVAL_EXT : constant := 16#20F1#;  --  /usr/include/GL/glxext.h:359
   GLX_MAX_SWAP_INTERVAL_EXT : constant := 16#20F2#;  --  /usr/include/GL/glxext.h:360

   GLX_EXT_swap_control_tear : constant := 1;  --  /usr/include/GL/glxext.h:368
   GLX_LATE_SWAPS_TEAR_EXT : constant := 16#20F3#;  --  /usr/include/GL/glxext.h:369

   GLX_EXT_texture_from_pixmap : constant := 1;  --  /usr/include/GL/glxext.h:373
   GLX_TEXTURE_1D_BIT_EXT : constant := 16#00000001#;  --  /usr/include/GL/glxext.h:374
   GLX_TEXTURE_2D_BIT_EXT : constant := 16#00000002#;  --  /usr/include/GL/glxext.h:375
   GLX_TEXTURE_RECTANGLE_BIT_EXT : constant := 16#00000004#;  --  /usr/include/GL/glxext.h:376
   GLX_BIND_TO_TEXTURE_RGB_EXT : constant := 16#20D0#;  --  /usr/include/GL/glxext.h:377
   GLX_BIND_TO_TEXTURE_RGBA_EXT : constant := 16#20D1#;  --  /usr/include/GL/glxext.h:378
   GLX_BIND_TO_MIPMAP_TEXTURE_EXT : constant := 16#20D2#;  --  /usr/include/GL/glxext.h:379
   GLX_BIND_TO_TEXTURE_TARGETS_EXT : constant := 16#20D3#;  --  /usr/include/GL/glxext.h:380
   GLX_Y_INVERTED_EXT : constant := 16#20D4#;  --  /usr/include/GL/glxext.h:381
   GLX_TEXTURE_FORMAT_EXT : constant := 16#20D5#;  --  /usr/include/GL/glxext.h:382
   GLX_TEXTURE_TARGET_EXT : constant := 16#20D6#;  --  /usr/include/GL/glxext.h:383
   GLX_MIPMAP_TEXTURE_EXT : constant := 16#20D7#;  --  /usr/include/GL/glxext.h:384
   GLX_TEXTURE_FORMAT_NONE_EXT : constant := 16#20D8#;  --  /usr/include/GL/glxext.h:385
   GLX_TEXTURE_FORMAT_RGB_EXT : constant := 16#20D9#;  --  /usr/include/GL/glxext.h:386
   GLX_TEXTURE_FORMAT_RGBA_EXT : constant := 16#20DA#;  --  /usr/include/GL/glxext.h:387
   GLX_TEXTURE_1D_EXT : constant := 16#20DB#;  --  /usr/include/GL/glxext.h:388
   GLX_TEXTURE_2D_EXT : constant := 16#20DC#;  --  /usr/include/GL/glxext.h:389
   GLX_TEXTURE_RECTANGLE_EXT : constant := 16#20DD#;  --  /usr/include/GL/glxext.h:390
   GLX_FRONT_LEFT_EXT : constant := 16#20DE#;  --  /usr/include/GL/glxext.h:391
   GLX_FRONT_RIGHT_EXT : constant := 16#20DF#;  --  /usr/include/GL/glxext.h:392
   GLX_BACK_LEFT_EXT : constant := 16#20E0#;  --  /usr/include/GL/glxext.h:393
   GLX_BACK_RIGHT_EXT : constant := 16#20E1#;  --  /usr/include/GL/glxext.h:394
   GLX_FRONT_EXT : constant := 16#20DE#;  --  /usr/include/GL/glxext.h:395
   GLX_BACK_EXT : constant := 16#20E0#;  --  /usr/include/GL/glxext.h:396
   GLX_AUX0_EXT : constant := 16#20E2#;  --  /usr/include/GL/glxext.h:397
   GLX_AUX1_EXT : constant := 16#20E3#;  --  /usr/include/GL/glxext.h:398
   GLX_AUX2_EXT : constant := 16#20E4#;  --  /usr/include/GL/glxext.h:399
   GLX_AUX3_EXT : constant := 16#20E5#;  --  /usr/include/GL/glxext.h:400
   GLX_AUX4_EXT : constant := 16#20E6#;  --  /usr/include/GL/glxext.h:401
   GLX_AUX5_EXT : constant := 16#20E7#;  --  /usr/include/GL/glxext.h:402
   GLX_AUX6_EXT : constant := 16#20E8#;  --  /usr/include/GL/glxext.h:403
   GLX_AUX7_EXT : constant := 16#20E9#;  --  /usr/include/GL/glxext.h:404
   GLX_AUX8_EXT : constant := 16#20EA#;  --  /usr/include/GL/glxext.h:405
   GLX_AUX9_EXT : constant := 16#20EB#;  --  /usr/include/GL/glxext.h:406

   GLX_EXT_visual_info : constant := 1;  --  /usr/include/GL/glxext.h:416
   GLX_X_VISUAL_TYPE_EXT : constant := 16#22#;  --  /usr/include/GL/glxext.h:417
   GLX_TRANSPARENT_TYPE_EXT : constant := 16#23#;  --  /usr/include/GL/glxext.h:418
   GLX_TRANSPARENT_INDEX_VALUE_EXT : constant := 16#24#;  --  /usr/include/GL/glxext.h:419
   GLX_TRANSPARENT_RED_VALUE_EXT : constant := 16#25#;  --  /usr/include/GL/glxext.h:420
   GLX_TRANSPARENT_GREEN_VALUE_EXT : constant := 16#26#;  --  /usr/include/GL/glxext.h:421
   GLX_TRANSPARENT_BLUE_VALUE_EXT : constant := 16#27#;  --  /usr/include/GL/glxext.h:422
   GLX_TRANSPARENT_ALPHA_VALUE_EXT : constant := 16#28#;  --  /usr/include/GL/glxext.h:423
   GLX_NONE_EXT : constant := 16#8000#;  --  /usr/include/GL/glxext.h:424
   GLX_TRUE_COLOR_EXT : constant := 16#8002#;  --  /usr/include/GL/glxext.h:425
   GLX_DIRECT_COLOR_EXT : constant := 16#8003#;  --  /usr/include/GL/glxext.h:426
   GLX_PSEUDO_COLOR_EXT : constant := 16#8004#;  --  /usr/include/GL/glxext.h:427
   GLX_STATIC_COLOR_EXT : constant := 16#8005#;  --  /usr/include/GL/glxext.h:428
   GLX_GRAY_SCALE_EXT : constant := 16#8006#;  --  /usr/include/GL/glxext.h:429
   GLX_STATIC_GRAY_EXT : constant := 16#8007#;  --  /usr/include/GL/glxext.h:430
   GLX_TRANSPARENT_RGB_EXT : constant := 16#8008#;  --  /usr/include/GL/glxext.h:431
   GLX_TRANSPARENT_INDEX_EXT : constant := 16#8009#;  --  /usr/include/GL/glxext.h:432

   GLX_EXT_visual_rating : constant := 1;  --  /usr/include/GL/glxext.h:436
   GLX_VISUAL_CAVEAT_EXT : constant := 16#20#;  --  /usr/include/GL/glxext.h:437
   GLX_SLOW_VISUAL_EXT : constant := 16#8001#;  --  /usr/include/GL/glxext.h:438
   GLX_NON_CONFORMANT_VISUAL_EXT : constant := 16#800D#;  --  /usr/include/GL/glxext.h:439

   GLX_INTEL_swap_event : constant := 1;  --  /usr/include/GL/glxext.h:443
   GLX_BUFFER_SWAP_COMPLETE_INTEL_MASK : constant := 16#04000000#;  --  /usr/include/GL/glxext.h:444
   GLX_EXCHANGE_COMPLETE_INTEL : constant := 16#8180#;  --  /usr/include/GL/glxext.h:445
   GLX_COPY_COMPLETE_INTEL : constant := 16#8181#;  --  /usr/include/GL/glxext.h:446
   GLX_FLIP_COMPLETE_INTEL : constant := 16#8182#;  --  /usr/include/GL/glxext.h:447

   GLX_MESA_agp_offset : constant := 1;  --  /usr/include/GL/glxext.h:451

   GLX_MESA_copy_sub_buffer : constant := 1;  --  /usr/include/GL/glxext.h:459

   GLX_MESA_pixmap_colormap : constant := 1;  --  /usr/include/GL/glxext.h:467

   GLX_MESA_query_renderer : constant := 1;  --  /usr/include/GL/glxext.h:475
   GLX_RENDERER_VENDOR_ID_MESA : constant := 16#8183#;  --  /usr/include/GL/glxext.h:476
   GLX_RENDERER_DEVICE_ID_MESA : constant := 16#8184#;  --  /usr/include/GL/glxext.h:477
   GLX_RENDERER_VERSION_MESA : constant := 16#8185#;  --  /usr/include/GL/glxext.h:478
   GLX_RENDERER_ACCELERATED_MESA : constant := 16#8186#;  --  /usr/include/GL/glxext.h:479
   GLX_RENDERER_VIDEO_MEMORY_MESA : constant := 16#8187#;  --  /usr/include/GL/glxext.h:480
   GLX_RENDERER_UNIFIED_MEMORY_ARCHITECTURE_MESA : constant := 16#8188#;  --  /usr/include/GL/glxext.h:481
   GLX_RENDERER_PREFERRED_PROFILE_MESA : constant := 16#8189#;  --  /usr/include/GL/glxext.h:482
   GLX_RENDERER_OPENGL_CORE_PROFILE_VERSION_MESA : constant := 16#818A#;  --  /usr/include/GL/glxext.h:483
   GLX_RENDERER_OPENGL_COMPATIBILITY_PROFILE_VERSION_MESA : constant := 16#818B#;  --  /usr/include/GL/glxext.h:484
   GLX_RENDERER_OPENGL_ES_PROFILE_VERSION_MESA : constant := 16#818C#;  --  /usr/include/GL/glxext.h:485
   GLX_RENDERER_OPENGL_ES2_PROFILE_VERSION_MESA : constant := 16#818D#;  --  /usr/include/GL/glxext.h:486

   GLX_MESA_release_buffers : constant := 1;  --  /usr/include/GL/glxext.h:500

   GLX_MESA_set_3dfx_mode : constant := 1;  --  /usr/include/GL/glxext.h:508
   GLX_3DFX_WINDOW_MODE_MESA : constant := 16#1#;  --  /usr/include/GL/glxext.h:509
   GLX_3DFX_FULLSCREEN_MODE_MESA : constant := 16#2#;  --  /usr/include/GL/glxext.h:510

   GLX_MESA_swap_control : constant := 1;  --  /usr/include/GL/glxext.h:518

   GLX_NV_copy_buffer : constant := 1;  --  /usr/include/GL/glxext.h:528

   GLX_NV_copy_image : constant := 1;  --  /usr/include/GL/glxext.h:538

   GLX_NV_delay_before_swap : constant := 1;  --  /usr/include/GL/glxext.h:546

   GLX_NV_float_buffer : constant := 1;  --  /usr/include/GL/glxext.h:554
   GLX_FLOAT_COMPONENTS_NV : constant := 16#20B0#;  --  /usr/include/GL/glxext.h:555

   GLX_NV_multigpu_context : constant := 1;  --  /usr/include/GL/glxext.h:559
   GLX_CONTEXT_MULTIGPU_ATTRIB_NV : constant := 16#20AA#;  --  /usr/include/GL/glxext.h:560
   GLX_CONTEXT_MULTIGPU_ATTRIB_SINGLE_NV : constant := 16#20AB#;  --  /usr/include/GL/glxext.h:561
   GLX_CONTEXT_MULTIGPU_ATTRIB_AFR_NV : constant := 16#20AC#;  --  /usr/include/GL/glxext.h:562
   GLX_CONTEXT_MULTIGPU_ATTRIB_MULTICAST_NV : constant := 16#20AD#;  --  /usr/include/GL/glxext.h:563
   GLX_CONTEXT_MULTIGPU_ATTRIB_MULTI_DISPLAY_MULTICAST_NV : constant := 16#20AE#;  --  /usr/include/GL/glxext.h:564

   GLX_NV_multisample_coverage : constant := 1;  --  /usr/include/GL/glxext.h:568
   GLX_COVERAGE_SAMPLES_NV : constant := 100001;  --  /usr/include/GL/glxext.h:569
   GLX_COLOR_SAMPLES_NV : constant := 16#20B3#;  --  /usr/include/GL/glxext.h:570

   GLX_NV_present_video : constant := 1;  --  /usr/include/GL/glxext.h:574
   GLX_NUM_VIDEO_SLOTS_NV : constant := 16#20F0#;  --  /usr/include/GL/glxext.h:575

   GLX_NV_robustness_video_memory_purge : constant := 1;  --  /usr/include/GL/glxext.h:585
   GLX_GENERATE_RESET_ON_VIDEO_MEMORY_PURGE_NV : constant := 16#20F7#;  --  /usr/include/GL/glxext.h:586

   GLX_NV_swap_group : constant := 1;  --  /usr/include/GL/glxext.h:590

   GLX_NV_video_capture : constant := 1;  --  /usr/include/GL/glxext.h:608

   GLX_DEVICE_ID_NV : constant := 16#20CD#;  --  /usr/include/GL/glxext.h:610
   GLX_UNIQUE_ID_NV : constant := 16#20CE#;  --  /usr/include/GL/glxext.h:611
   GLX_NUM_VIDEO_CAPTURE_SLOTS_NV : constant := 16#20CF#;  --  /usr/include/GL/glxext.h:612

   GLX_NV_video_out : constant := 1;  --  /usr/include/GL/glxext.h:628

   GLX_VIDEO_OUT_COLOR_NV : constant := 16#20C3#;  --  /usr/include/GL/glxext.h:630
   GLX_VIDEO_OUT_ALPHA_NV : constant := 16#20C4#;  --  /usr/include/GL/glxext.h:631
   GLX_VIDEO_OUT_DEPTH_NV : constant := 16#20C5#;  --  /usr/include/GL/glxext.h:632
   GLX_VIDEO_OUT_COLOR_AND_ALPHA_NV : constant := 16#20C6#;  --  /usr/include/GL/glxext.h:633
   GLX_VIDEO_OUT_COLOR_AND_DEPTH_NV : constant := 16#20C7#;  --  /usr/include/GL/glxext.h:634
   GLX_VIDEO_OUT_FRAME_NV : constant := 16#20C8#;  --  /usr/include/GL/glxext.h:635
   GLX_VIDEO_OUT_FIELD_1_NV : constant := 16#20C9#;  --  /usr/include/GL/glxext.h:636
   GLX_VIDEO_OUT_FIELD_2_NV : constant := 16#20CA#;  --  /usr/include/GL/glxext.h:637
   GLX_VIDEO_OUT_STACKED_FIELDS_1_2_NV : constant := 16#20CB#;  --  /usr/include/GL/glxext.h:638
   GLX_VIDEO_OUT_STACKED_FIELDS_2_1_NV : constant := 16#20CC#;  --  /usr/include/GL/glxext.h:639

   GLX_OML_swap_method : constant := 1;  --  /usr/include/GL/glxext.h:657
   GLX_SWAP_METHOD_OML : constant := 16#8060#;  --  /usr/include/GL/glxext.h:658
   GLX_SWAP_EXCHANGE_OML : constant := 16#8061#;  --  /usr/include/GL/glxext.h:659
   GLX_SWAP_COPY_OML : constant := 16#8062#;  --  /usr/include/GL/glxext.h:660
   GLX_SWAP_UNDEFINED_OML : constant := 16#8063#;  --  /usr/include/GL/glxext.h:661

   GLX_OML_sync_control : constant := 1;  --  /usr/include/GL/glxext.h:665

   GLX_SGIS_blended_overlay : constant := 1;  --  /usr/include/GL/glxext.h:718
   GLX_BLENDED_RGBA_SGIS : constant := 16#8025#;  --  /usr/include/GL/glxext.h:719

   GLX_SGIS_multisample : constant := 1;  --  /usr/include/GL/glxext.h:723
   GLX_SAMPLE_BUFFERS_SGIS : constant := 100000;  --  /usr/include/GL/glxext.h:724
   GLX_SAMPLES_SGIS : constant := 100001;  --  /usr/include/GL/glxext.h:725

   GLX_SGIS_shared_multisample : constant := 1;  --  /usr/include/GL/glxext.h:729
   GLX_MULTISAMPLE_SUB_RECT_WIDTH_SGIS : constant := 16#8026#;  --  /usr/include/GL/glxext.h:730
   GLX_MULTISAMPLE_SUB_RECT_HEIGHT_SGIS : constant := 16#8027#;  --  /usr/include/GL/glxext.h:731

   GLX_SGIX_dmbuffer : constant := 1;  --  /usr/include/GL/glxext.h:735

   GLX_SGIX_fbconfig : constant := 1;  --  /usr/include/GL/glxext.h:747

   GLX_WINDOW_BIT_SGIX : constant := 16#00000001#;  --  /usr/include/GL/glxext.h:749
   GLX_PIXMAP_BIT_SGIX : constant := 16#00000002#;  --  /usr/include/GL/glxext.h:750
   GLX_RGBA_BIT_SGIX : constant := 16#00000001#;  --  /usr/include/GL/glxext.h:751
   GLX_COLOR_INDEX_BIT_SGIX : constant := 16#00000002#;  --  /usr/include/GL/glxext.h:752
   GLX_DRAWABLE_TYPE_SGIX : constant := 16#8010#;  --  /usr/include/GL/glxext.h:753
   GLX_RENDER_TYPE_SGIX : constant := 16#8011#;  --  /usr/include/GL/glxext.h:754
   GLX_X_RENDERABLE_SGIX : constant := 16#8012#;  --  /usr/include/GL/glxext.h:755
   GLX_FBCONFIG_ID_SGIX : constant := 16#8013#;  --  /usr/include/GL/glxext.h:756
   GLX_RGBA_TYPE_SGIX : constant := 16#8014#;  --  /usr/include/GL/glxext.h:757
   GLX_COLOR_INDEX_TYPE_SGIX : constant := 16#8015#;  --  /usr/include/GL/glxext.h:758

   GLX_SGIX_hyperpipe : constant := 1;  --  /usr/include/GL/glxext.h:776

   GLX_HYPERPIPE_PIPE_NAME_LENGTH_SGIX : constant := 80;  --  /usr/include/GL/glxext.h:796
   GLX_BAD_HYPERPIPE_CONFIG_SGIX : constant := 91;  --  /usr/include/GL/glxext.h:797
   GLX_BAD_HYPERPIPE_SGIX : constant := 92;  --  /usr/include/GL/glxext.h:798
   GLX_HYPERPIPE_DISPLAY_PIPE_SGIX : constant := 16#00000001#;  --  /usr/include/GL/glxext.h:799
   GLX_HYPERPIPE_RENDER_PIPE_SGIX : constant := 16#00000002#;  --  /usr/include/GL/glxext.h:800
   GLX_PIPE_RECT_SGIX : constant := 16#00000001#;  --  /usr/include/GL/glxext.h:801
   GLX_PIPE_RECT_LIMITS_SGIX : constant := 16#00000002#;  --  /usr/include/GL/glxext.h:802
   GLX_HYPERPIPE_STEREO_SGIX : constant := 16#00000003#;  --  /usr/include/GL/glxext.h:803
   GLX_HYPERPIPE_PIXEL_AVERAGE_SGIX : constant := 16#00000004#;  --  /usr/include/GL/glxext.h:804
   GLX_HYPERPIPE_ID_SGIX : constant := 16#8030#;  --  /usr/include/GL/glxext.h:805

   GLX_SGIX_pbuffer : constant := 1;  --  /usr/include/GL/glxext.h:827
   GLX_PBUFFER_BIT_SGIX : constant := 16#00000004#;  --  /usr/include/GL/glxext.h:828
   GLX_BUFFER_CLOBBER_MASK_SGIX : constant := 16#08000000#;  --  /usr/include/GL/glxext.h:829
   GLX_FRONT_LEFT_BUFFER_BIT_SGIX : constant := 16#00000001#;  --  /usr/include/GL/glxext.h:830
   GLX_FRONT_RIGHT_BUFFER_BIT_SGIX : constant := 16#00000002#;  --  /usr/include/GL/glxext.h:831
   GLX_BACK_LEFT_BUFFER_BIT_SGIX : constant := 16#00000004#;  --  /usr/include/GL/glxext.h:832
   GLX_BACK_RIGHT_BUFFER_BIT_SGIX : constant := 16#00000008#;  --  /usr/include/GL/glxext.h:833
   GLX_AUX_BUFFERS_BIT_SGIX : constant := 16#00000010#;  --  /usr/include/GL/glxext.h:834
   GLX_DEPTH_BUFFER_BIT_SGIX : constant := 16#00000020#;  --  /usr/include/GL/glxext.h:835
   GLX_STENCIL_BUFFER_BIT_SGIX : constant := 16#00000040#;  --  /usr/include/GL/glxext.h:836
   GLX_ACCUM_BUFFER_BIT_SGIX : constant := 16#00000080#;  --  /usr/include/GL/glxext.h:837
   GLX_SAMPLE_BUFFERS_BIT_SGIX : constant := 16#00000100#;  --  /usr/include/GL/glxext.h:838
   GLX_MAX_PBUFFER_WIDTH_SGIX : constant := 16#8016#;  --  /usr/include/GL/glxext.h:839
   GLX_MAX_PBUFFER_HEIGHT_SGIX : constant := 16#8017#;  --  /usr/include/GL/glxext.h:840
   GLX_MAX_PBUFFER_PIXELS_SGIX : constant := 16#8018#;  --  /usr/include/GL/glxext.h:841
   GLX_OPTIMAL_PBUFFER_WIDTH_SGIX : constant := 16#8019#;  --  /usr/include/GL/glxext.h:842
   GLX_OPTIMAL_PBUFFER_HEIGHT_SGIX : constant := 16#801A#;  --  /usr/include/GL/glxext.h:843
   GLX_PRESERVED_CONTENTS_SGIX : constant := 16#801B#;  --  /usr/include/GL/glxext.h:844
   GLX_LARGEST_PBUFFER_SGIX : constant := 16#801C#;  --  /usr/include/GL/glxext.h:845
   GLX_WIDTH_SGIX : constant := 16#801D#;  --  /usr/include/GL/glxext.h:846
   GLX_HEIGHT_SGIX : constant := 16#801E#;  --  /usr/include/GL/glxext.h:847
   GLX_EVENT_MASK_SGIX : constant := 16#801F#;  --  /usr/include/GL/glxext.h:848
   GLX_DAMAGED_SGIX : constant := 16#8020#;  --  /usr/include/GL/glxext.h:849
   GLX_SAVED_SGIX : constant := 16#8021#;  --  /usr/include/GL/glxext.h:850
   GLX_WINDOW_SGIX : constant := 16#8022#;  --  /usr/include/GL/glxext.h:851
   GLX_PBUFFER_SGIX : constant := 16#8023#;  --  /usr/include/GL/glxext.h:852

   GLX_SGIX_swap_barrier : constant := 1;  --  /usr/include/GL/glxext.h:868

   GLX_SGIX_swap_group : constant := 1;  --  /usr/include/GL/glxext.h:878

   GLX_SGIX_video_resize : constant := 1;  --  /usr/include/GL/glxext.h:886
   GLX_SYNC_FRAME_SGIX : constant := 16#00000000#;  --  /usr/include/GL/glxext.h:887
   GLX_SYNC_SWAP_SGIX : constant := 16#00000001#;  --  /usr/include/GL/glxext.h:888

   GLX_SGIX_video_source : constant := 1;  --  /usr/include/GL/glxext.h:904

   GLX_SGIX_visual_select_group : constant := 1;  --  /usr/include/GL/glxext.h:917
   GLX_VISUAL_SELECT_GROUP_SGIX : constant := 16#8028#;  --  /usr/include/GL/glxext.h:918

   GLX_SGI_cushion : constant := 1;  --  /usr/include/GL/glxext.h:922

   GLX_SGI_make_current_read : constant := 1;  --  /usr/include/GL/glxext.h:930

   GLX_SGI_swap_control : constant := 1;  --  /usr/include/GL/glxext.h:940

   GLX_SGI_video_sync : constant := 1;  --  /usr/include/GL/glxext.h:948

   GLX_SUN_get_transparent_index : constant := 1;  --  /usr/include/GL/glxext.h:958

  --** Copyright (c) 2013-2018 The Khronos Group Inc.
  --**
  --** Permission is hereby granted, free of charge, to any person obtaining a
  --** copy of this software and/or associated documentation files (the
  --** "Materials"), to deal in the Materials without restriction, including
  --** without limitation the rights to use, copy, modify, merge, publish,
  --** distribute, sublicense, and/or sell copies of the Materials, and to
  --** permit persons to whom the Materials are furnished to do so, subject to
  --** the following conditions:
  --**
  --** The above copyright notice and this permission notice shall be included
  --** in all copies or substantial portions of the Materials.
  --**
  --** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  --** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  --** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
  --** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
  --** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
  --** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
  --** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
  -- 

  --** This header is generated from the Khronos OpenGL / OpenGL ES XML
  --** API Registry. The current version of the Registry, generator scripts
  --** used to make the header, and the header can be found at
  --**   https://github.com/KhronosGroup/OpenGL-Registry
  -- 

  -- Generated C header for:
  -- * API: glx
  -- * Versions considered: .*
  -- * Versions emitted: 1\.[3-9]
  -- * Default extensions included: glx
  -- * Additional extensions included: _nomatch_^
  -- * Extensions removed: _nomatch_^
  --  

   type PFNGLXCREATECONTEXTATTRIBSARBPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : glx.ads.GLXFBConfig;
         arg3 : glx.ads.GLXContext;
         arg4 : int;
         arg5 : access int) return glx.ads.GLXContext
   with Convention => C;  -- /usr/include/GL/glxext.h:173

   type PFNGLXGETGPUIDSAMDPROC is access function (arg1 : unsigned; arg2 : access unsigned) return unsigned
   with Convention => C;  -- /usr/include/GL/glxext.h:256

   type PFNGLXGETGPUINFOAMDPROC is access function
        (arg1 : unsigned;
         arg2 : int;
         arg3 : GL_gl_h.GLenum;
         arg4 : unsigned;
         arg5 : System.Address) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:257

   type PFNGLXGETCONTEXTGPUIDAMDPROC is access function (arg1 : glx.ads.GLXContext) return unsigned
   with Convention => C;  -- /usr/include/GL/glxext.h:258

   type PFNGLXCREATEASSOCIATEDCONTEXTAMDPROC is access function (arg1 : unsigned; arg2 : glx.ads.GLXContext) return glx.ads.GLXContext
   with Convention => C;  -- /usr/include/GL/glxext.h:259

   type PFNGLXCREATEASSOCIATEDCONTEXTATTRIBSAMDPROC is access function
        (arg1 : unsigned;
         arg2 : glx.ads.GLXContext;
         arg3 : access int) return glx.ads.GLXContext
   with Convention => C;  -- /usr/include/GL/glxext.h:260

   type PFNGLXDELETEASSOCIATEDCONTEXTAMDPROC is access function (arg1 : glx.ads.GLXContext) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:261

   type PFNGLXMAKEASSOCIATEDCONTEXTCURRENTAMDPROC is access function (arg1 : glx.ads.GLXContext) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:262

   type PFNGLXGETCURRENTASSOCIATEDCONTEXTAMDPROC is access function return glx.ads.GLXContext
   with Convention => C;  -- /usr/include/GL/glxext.h:263

   type PFNGLXBLITCONTEXTFRAMEBUFFERAMDPROC is access procedure
        (arg1 : glx.ads.GLXContext;
         arg2 : GL_gl_h.GLint;
         arg3 : GL_gl_h.GLint;
         arg4 : GL_gl_h.GLint;
         arg5 : GL_gl_h.GLint;
         arg6 : GL_gl_h.GLint;
         arg7 : GL_gl_h.GLint;
         arg8 : GL_gl_h.GLint;
         arg9 : GL_gl_h.GLint;
         arg10 : GL_gl_h.GLbitfield;
         arg11 : GL_gl_h.GLenum)
   with Convention => C;  -- /usr/include/GL/glxext.h:264

   type PFNGLXGETCURRENTDISPLAYEXTPROC is access function return access X11_Xlib_h.Display
   with Convention => C;  -- /usr/include/GL/glxext.h:317

   type PFNGLXQUERYCONTEXTINFOEXTPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : glx.ads.GLXContext;
         arg3 : int;
         arg4 : access int) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:318

   type PFNGLXGETCONTEXTIDEXTPROC is access function (arg1 : glx.ads.GLXContext) return glx.ads.GLXContextID
   with Convention => C;  -- /usr/include/GL/glxext.h:319

   type PFNGLXIMPORTCONTEXTEXTPROC is access function (arg1 : access X11_Xlib_h.Display; arg2 : glx.ads.GLXContextID) return glx.ads.GLXContext
   with Convention => C;  -- /usr/include/GL/glxext.h:320

   type PFNGLXFREECONTEXTEXTPROC is access procedure (arg1 : access X11_Xlib_h.Display; arg2 : glx.ads.GLXContext)
   with Convention => C;  -- /usr/include/GL/glxext.h:321

   --  skipped anonymous struct anon_107

   type GLXStereoNotifyEventEXT is record
      c_type : aliased int;  -- /usr/include/GL/glxext.h:343
      serial : aliased unsigned_long;  -- /usr/include/GL/glxext.h:344
      send_event : aliased int;  -- /usr/include/GL/glxext.h:345
      the_display : access X11_Xlib_h.Display;  -- /usr/include/GL/glxext.h:346
      extension : aliased int;  -- /usr/include/GL/glxext.h:347
      evtype : aliased int;  -- /usr/include/GL/glxext.h:348
      window : aliased glx.ads.GLXDrawable;  -- /usr/include/GL/glxext.h:349
      stereo_tree : aliased int;  -- /usr/include/GL/glxext.h:350
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/GL/glxext.h:351

   type PFNGLXSWAPINTERVALEXTPROC is access procedure
        (arg1 : access X11_Xlib_h.Display;
         arg2 : glx.ads.GLXDrawable;
         arg3 : int)
   with Convention => C;  -- /usr/include/GL/glxext.h:361

   type PFNGLXBINDTEXIMAGEEXTPROC is access procedure
        (arg1 : access X11_Xlib_h.Display;
         arg2 : glx.ads.GLXDrawable;
         arg3 : int;
         arg4 : access int)
   with Convention => C;  -- /usr/include/GL/glxext.h:407

   type PFNGLXRELEASETEXIMAGEEXTPROC is access procedure
        (arg1 : access X11_Xlib_h.Display;
         arg2 : glx.ads.GLXDrawable;
         arg3 : int)
   with Convention => C;  -- /usr/include/GL/glxext.h:408

   type PFNGLXGETAGPOFFSETMESAPROC is access function (arg1 : System.Address) return unsigned
   with Convention => C;  -- /usr/include/GL/glxext.h:452

   type PFNGLXCOPYSUBBUFFERMESAPROC is access procedure
        (arg1 : access X11_Xlib_h.Display;
         arg2 : glx.ads.GLXDrawable;
         arg3 : int;
         arg4 : int;
         arg5 : int;
         arg6 : int)
   with Convention => C;  -- /usr/include/GL/glxext.h:460

   type PFNGLXCREATEGLXPIXMAPMESAPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : access Xutil.XVisualInfo;
         arg3 : X11_X_h.Pixmap;
         arg4 : X11_X_h.Colormap) return glx.ads.GLXPixmap
   with Convention => C;  -- /usr/include/GL/glxext.h:468

   type PFNGLXQUERYCURRENTRENDERERINTEGERMESAPROC is access function (arg1 : int; arg2 : access unsigned) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:487

   type PFNGLXQUERYCURRENTRENDERERSTRINGMESAPROC is access function (arg1 : int) return Interfaces.C.Strings.chars_ptr
   with Convention => C;  -- /usr/include/GL/glxext.h:488

   type PFNGLXQUERYRENDERERINTEGERMESAPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : int;
         arg3 : int;
         arg4 : int;
         arg5 : access unsigned) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:489

   type PFNGLXQUERYRENDERERSTRINGMESAPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : int;
         arg3 : int;
         arg4 : int) return Interfaces.C.Strings.chars_ptr
   with Convention => C;  -- /usr/include/GL/glxext.h:490

   type PFNGLXRELEASEBUFFERSMESAPROC is access function (arg1 : access X11_Xlib_h.Display; arg2 : glx.ads.GLXDrawable) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:501

   type PFNGLXSET3DFXMODEMESAPROC is access function (arg1 : GL_gl_h.GLint) return GL_gl_h.GLboolean
   with Convention => C;  -- /usr/include/GL/glxext.h:511

   type PFNGLXGETSWAPINTERVALMESAPROC is access function return int
   with Convention => C;  -- /usr/include/GL/glxext.h:519

   type PFNGLXSWAPINTERVALMESAPROC is access function (arg1 : unsigned) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:520

   type PFNGLXCOPYBUFFERSUBDATANVPROC is access procedure
        (arg1 : access X11_Xlib_h.Display;
         arg2 : glx.ads.GLXContext;
         arg3 : glx.ads.GLXContext;
         arg4 : GL_gl_h.GLenum;
         arg5 : GL_gl_h.GLenum;
         arg6 : glext.GLintptr;
         arg7 : glext.GLintptr;
         arg8 : glext.GLsizeiptr)
   with Convention => C;  -- /usr/include/GL/glxext.h:529

   type PFNGLXNAMEDCOPYBUFFERSUBDATANVPROC is access procedure
        (arg1 : access X11_Xlib_h.Display;
         arg2 : glx.ads.GLXContext;
         arg3 : glx.ads.GLXContext;
         arg4 : GL_gl_h.GLuint;
         arg5 : GL_gl_h.GLuint;
         arg6 : glext.GLintptr;
         arg7 : glext.GLintptr;
         arg8 : glext.GLsizeiptr)
   with Convention => C;  -- /usr/include/GL/glxext.h:530

   type PFNGLXCOPYIMAGESUBDATANVPROC is access procedure
        (arg1 : access X11_Xlib_h.Display;
         arg2 : glx.ads.GLXContext;
         arg3 : GL_gl_h.GLuint;
         arg4 : GL_gl_h.GLenum;
         arg5 : GL_gl_h.GLint;
         arg6 : GL_gl_h.GLint;
         arg7 : GL_gl_h.GLint;
         arg8 : GL_gl_h.GLint;
         arg9 : glx.ads.GLXContext;
         arg10 : GL_gl_h.GLuint;
         arg11 : GL_gl_h.GLenum;
         arg12 : GL_gl_h.GLint;
         arg13 : GL_gl_h.GLint;
         arg14 : GL_gl_h.GLint;
         arg15 : GL_gl_h.GLint;
         arg16 : GL_gl_h.GLsizei;
         arg17 : GL_gl_h.GLsizei;
         arg18 : GL_gl_h.GLsizei)
   with Convention => C;  -- /usr/include/GL/glxext.h:539

   type PFNGLXDELAYBEFORESWAPNVPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : glx.ads.GLXDrawable;
         arg3 : GL_gl_h.GLfloat) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:547

   type PFNGLXENUMERATEVIDEODEVICESNVPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : int;
         arg3 : access int) return access unsigned
   with Convention => C;  -- /usr/include/GL/glxext.h:576

   type PFNGLXBINDVIDEODEVICENVPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : unsigned;
         arg3 : unsigned;
         arg4 : access int) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:577

   type PFNGLXJOINSWAPGROUPNVPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : glx.ads.GLXDrawable;
         arg3 : GL_gl_h.GLuint) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:591

   type PFNGLXBINDSWAPBARRIERNVPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : GL_gl_h.GLuint;
         arg3 : GL_gl_h.GLuint) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:592

   type PFNGLXQUERYSWAPGROUPNVPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : glx.ads.GLXDrawable;
         arg3 : access GL_gl_h.GLuint;
         arg4 : access GL_gl_h.GLuint) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:593

   type PFNGLXQUERYMAXSWAPGROUPSNVPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : int;
         arg3 : access GL_gl_h.GLuint;
         arg4 : access GL_gl_h.GLuint) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:594

   type PFNGLXQUERYFRAMECOUNTNVPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : int;
         arg3 : access GL_gl_h.GLuint) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:595

   type PFNGLXRESETFRAMECOUNTNVPROC is access function (arg1 : access X11_Xlib_h.Display; arg2 : int) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:596

   subtype GLXVideoCaptureDeviceNV is X11_X_h.XID;  -- /usr/include/GL/glxext.h:609

   type PFNGLXBINDVIDEOCAPTUREDEVICENVPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : unsigned;
         arg3 : GLXVideoCaptureDeviceNV) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:613

   type PFNGLXENUMERATEVIDEOCAPTUREDEVICESNVPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : int;
         arg3 : access int) return access GLXVideoCaptureDeviceNV
   with Convention => C;  -- /usr/include/GL/glxext.h:614

   type PFNGLXLOCKVIDEOCAPTUREDEVICENVPROC is access procedure (arg1 : access X11_Xlib_h.Display; arg2 : GLXVideoCaptureDeviceNV)
   with Convention => C;  -- /usr/include/GL/glxext.h:615

   type PFNGLXQUERYVIDEOCAPTUREDEVICENVPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : GLXVideoCaptureDeviceNV;
         arg3 : int;
         arg4 : access int) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:616

   type PFNGLXRELEASEVIDEOCAPTUREDEVICENVPROC is access procedure (arg1 : access X11_Xlib_h.Display; arg2 : GLXVideoCaptureDeviceNV)
   with Convention => C;  -- /usr/include/GL/glxext.h:617

   subtype GLXVideoDeviceNV is unsigned;  -- /usr/include/GL/glxext.h:629

   type PFNGLXGETVIDEODEVICENVPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : int;
         arg3 : int;
         arg4 : access GLXVideoDeviceNV) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:640

   type PFNGLXRELEASEVIDEODEVICENVPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : int;
         arg3 : GLXVideoDeviceNV) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:641

   type PFNGLXBINDVIDEOIMAGENVPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : GLXVideoDeviceNV;
         arg3 : glx.ads.GLXPbuffer;
         arg4 : int) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:642

   type PFNGLXRELEASEVIDEOIMAGENVPROC is access function (arg1 : access X11_Xlib_h.Display; arg2 : glx.ads.GLXPbuffer) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:643

   type PFNGLXSENDPBUFFERTOVIDEONVPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : glx.ads.GLXPbuffer;
         arg3 : int;
         arg4 : access unsigned_long;
         arg5 : GL_gl_h.GLboolean) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:644

   type PFNGLXGETVIDEOINFONVPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : int;
         arg3 : GLXVideoDeviceNV;
         arg4 : access unsigned_long;
         arg5 : access unsigned_long) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:645

  -- This code block is duplicated in glext.h, so must be protected  
  -- Define int32_t, int64_t, and uint64_t types for UST/MSC  
  -- (as used in the GLX_OML_sync_control extension).  
  -- Fallback if nothing above works  
   type PFNGLXGETSYNCVALUESOMLPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : glx.ads.GLXDrawable;
         arg3 : access bits_stdint_intn_h.int64_t;
         arg4 : access bits_stdint_intn_h.int64_t;
         arg5 : access bits_stdint_intn_h.int64_t) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:703

   type PFNGLXGETMSCRATEOMLPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : glx.ads.GLXDrawable;
         arg3 : access bits_stdint_intn_h.int32_t;
         arg4 : access bits_stdint_intn_h.int32_t) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:704

   type PFNGLXSWAPBUFFERSMSCOMLPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : glx.ads.GLXDrawable;
         arg3 : bits_stdint_intn_h.int64_t;
         arg4 : bits_stdint_intn_h.int64_t;
         arg5 : bits_stdint_intn_h.int64_t) return bits_stdint_intn_h.int64_t
   with Convention => C;  -- /usr/include/GL/glxext.h:705

   type PFNGLXWAITFORMSCOMLPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : glx.ads.GLXDrawable;
         arg3 : bits_stdint_intn_h.int64_t;
         arg4 : bits_stdint_intn_h.int64_t;
         arg5 : bits_stdint_intn_h.int64_t;
         arg6 : access bits_stdint_intn_h.int64_t;
         arg7 : access bits_stdint_intn_h.int64_t;
         arg8 : access bits_stdint_intn_h.int64_t) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:706

   type PFNGLXWAITFORSBCOMLPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : glx.ads.GLXDrawable;
         arg3 : bits_stdint_intn_h.int64_t;
         arg4 : access bits_stdint_intn_h.int64_t;
         arg5 : access bits_stdint_intn_h.int64_t;
         arg6 : access bits_stdint_intn_h.int64_t) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:707

   subtype GLXPbufferSGIX is X11_X_h.XID;  -- /usr/include/GL/glxext.h:736

   type GLXFBConfigSGIX is access all glx.ads.uu_GLXFBConfigRec;  -- /usr/include/GL/glxext.h:748

   type PFNGLXGETFBCONFIGATTRIBSGIXPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : GLXFBConfigSGIX;
         arg3 : int;
         arg4 : access int) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:759

   type PFNGLXCHOOSEFBCONFIGSGIXPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : int;
         arg3 : access int;
         arg4 : access int) return System.Address
   with Convention => C;  -- /usr/include/GL/glxext.h:760

   type PFNGLXCREATEGLXPIXMAPWITHCONFIGSGIXPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : GLXFBConfigSGIX;
         arg3 : X11_X_h.Pixmap) return glx.ads.GLXPixmap
   with Convention => C;  -- /usr/include/GL/glxext.h:761

   type PFNGLXCREATECONTEXTWITHCONFIGSGIXPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : GLXFBConfigSGIX;
         arg3 : int;
         arg4 : glx.ads.GLXContext;
         arg5 : int) return glx.ads.GLXContext
   with Convention => C;  -- /usr/include/GL/glxext.h:762

   type PFNGLXGETVISUALFROMFBCONFIGSGIXPROC is access function (arg1 : access X11_Xlib_h.Display; arg2 : GLXFBConfigSGIX) return access Xutil.XVisualInfo
   with Convention => C;  -- /usr/include/GL/glxext.h:763

   type PFNGLXGETFBCONFIGFROMVISUALSGIXPROC is access function (arg1 : access X11_Xlib_h.Display; arg2 : access Xutil.XVisualInfo) return GLXFBConfigSGIX
   with Convention => C;  -- /usr/include/GL/glxext.h:764

  -- Should be [GLX_HYPERPIPE_PIPE_NAME_LENGTH_SGIX]  
   --  skipped anonymous struct anon_109

   subtype GLXHyperpipeNetworkSGIX_array8453 is Interfaces.C.char_array (0 .. 79);
   type GLXHyperpipeNetworkSGIX is record
      pipeName : aliased GLXHyperpipeNetworkSGIX_array8453;  -- /usr/include/GL/glxext.h:778
      networkId : aliased int;  -- /usr/include/GL/glxext.h:779
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/GL/glxext.h:780

  -- Should be [GLX_HYPERPIPE_PIPE_NAME_LENGTH_SGIX]  
   --  skipped anonymous struct anon_110

   subtype GLXHyperpipeConfigSGIX_array8453 is Interfaces.C.char_array (0 .. 79);
   type GLXHyperpipeConfigSGIX is record
      pipeName : aliased GLXHyperpipeConfigSGIX_array8453;  -- /usr/include/GL/glxext.h:782
      channel : aliased int;  -- /usr/include/GL/glxext.h:783
      participationType : aliased unsigned;  -- /usr/include/GL/glxext.h:784
      timeSlice : aliased int;  -- /usr/include/GL/glxext.h:785
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/GL/glxext.h:786

  -- Should be [GLX_HYPERPIPE_PIPE_NAME_LENGTH_SGIX]  
   --  skipped anonymous struct anon_111

   subtype GLXPipeRect_array8453 is Interfaces.C.char_array (0 .. 79);
   type GLXPipeRect is record
      pipeName : aliased GLXPipeRect_array8453;  -- /usr/include/GL/glxext.h:788
      srcXOrigin : aliased int;  -- /usr/include/GL/glxext.h:789
      srcYOrigin : aliased int;  -- /usr/include/GL/glxext.h:789
      srcWidth : aliased int;  -- /usr/include/GL/glxext.h:789
      srcHeight : aliased int;  -- /usr/include/GL/glxext.h:789
      destXOrigin : aliased int;  -- /usr/include/GL/glxext.h:790
      destYOrigin : aliased int;  -- /usr/include/GL/glxext.h:790
      destWidth : aliased int;  -- /usr/include/GL/glxext.h:790
      destHeight : aliased int;  -- /usr/include/GL/glxext.h:790
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/GL/glxext.h:791

  -- Should be [GLX_HYPERPIPE_PIPE_NAME_LENGTH_SGIX]  
   --  skipped anonymous struct anon_112

   subtype GLXPipeRectLimits_array8453 is Interfaces.C.char_array (0 .. 79);
   type GLXPipeRectLimits is record
      pipeName : aliased GLXPipeRectLimits_array8453;  -- /usr/include/GL/glxext.h:793
      XOrigin : aliased int;  -- /usr/include/GL/glxext.h:794
      YOrigin : aliased int;  -- /usr/include/GL/glxext.h:794
      maxHeight : aliased int;  -- /usr/include/GL/glxext.h:794
      maxWidth : aliased int;  -- /usr/include/GL/glxext.h:794
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/GL/glxext.h:795

   type PFNGLXQUERYHYPERPIPENETWORKSGIXPROC is access function (arg1 : access X11_Xlib_h.Display; arg2 : access int) return access GLXHyperpipeNetworkSGIX
   with Convention => C;  -- /usr/include/GL/glxext.h:806

   type PFNGLXHYPERPIPECONFIGSGIXPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : int;
         arg3 : int;
         arg4 : access GLXHyperpipeConfigSGIX;
         arg5 : access int) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:807

   type PFNGLXQUERYHYPERPIPECONFIGSGIXPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : int;
         arg3 : access int) return access GLXHyperpipeConfigSGIX
   with Convention => C;  -- /usr/include/GL/glxext.h:808

   type PFNGLXDESTROYHYPERPIPECONFIGSGIXPROC is access function (arg1 : access X11_Xlib_h.Display; arg2 : int) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:809

   type PFNGLXBINDHYPERPIPESGIXPROC is access function (arg1 : access X11_Xlib_h.Display; arg2 : int) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:810

   type PFNGLXQUERYHYPERPIPEBESTATTRIBSGIXPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : int;
         arg3 : int;
         arg4 : int;
         arg5 : System.Address;
         arg6 : System.Address) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:811

   type PFNGLXHYPERPIPEATTRIBSGIXPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : int;
         arg3 : int;
         arg4 : int;
         arg5 : System.Address) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:812

   type PFNGLXQUERYHYPERPIPEATTRIBSGIXPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : int;
         arg3 : int;
         arg4 : int;
         arg5 : System.Address) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:813

   type PFNGLXCREATEGLXPBUFFERSGIXPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : GLXFBConfigSGIX;
         arg3 : unsigned;
         arg4 : unsigned;
         arg5 : access int) return GLXPbufferSGIX
   with Convention => C;  -- /usr/include/GL/glxext.h:853

   type PFNGLXDESTROYGLXPBUFFERSGIXPROC is access procedure (arg1 : access X11_Xlib_h.Display; arg2 : GLXPbufferSGIX)
   with Convention => C;  -- /usr/include/GL/glxext.h:854

   type PFNGLXQUERYGLXPBUFFERSGIXPROC is access procedure
        (arg1 : access X11_Xlib_h.Display;
         arg2 : GLXPbufferSGIX;
         arg3 : int;
         arg4 : access unsigned)
   with Convention => C;  -- /usr/include/GL/glxext.h:855

   type PFNGLXSELECTEVENTSGIXPROC is access procedure
        (arg1 : access X11_Xlib_h.Display;
         arg2 : glx.ads.GLXDrawable;
         arg3 : unsigned_long)
   with Convention => C;  -- /usr/include/GL/glxext.h:856

   type PFNGLXGETSELECTEDEVENTSGIXPROC is access procedure
        (arg1 : access X11_Xlib_h.Display;
         arg2 : glx.ads.GLXDrawable;
         arg3 : access unsigned_long)
   with Convention => C;  -- /usr/include/GL/glxext.h:857

   type PFNGLXBINDSWAPBARRIERSGIXPROC is access procedure
        (arg1 : access X11_Xlib_h.Display;
         arg2 : glx.ads.GLXDrawable;
         arg3 : int)
   with Convention => C;  -- /usr/include/GL/glxext.h:869

   type PFNGLXQUERYMAXSWAPBARRIERSSGIXPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : int;
         arg3 : access int) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:870

   type PFNGLXJOINSWAPGROUPSGIXPROC is access procedure
        (arg1 : access X11_Xlib_h.Display;
         arg2 : glx.ads.GLXDrawable;
         arg3 : glx.ads.GLXDrawable)
   with Convention => C;  -- /usr/include/GL/glxext.h:879

   type PFNGLXBINDCHANNELTOWINDOWSGIXPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : int;
         arg3 : int;
         arg4 : X11_X_h.Window) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:889

   type PFNGLXCHANNELRECTSGIXPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : int;
         arg3 : int;
         arg4 : int;
         arg5 : int;
         arg6 : int;
         arg7 : int) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:890

   type PFNGLXQUERYCHANNELRECTSGIXPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : int;
         arg3 : int;
         arg4 : access int;
         arg5 : access int;
         arg6 : access int;
         arg7 : access int) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:891

   type PFNGLXQUERYCHANNELDELTASSGIXPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : int;
         arg3 : int;
         arg4 : access int;
         arg5 : access int;
         arg6 : access int;
         arg7 : access int) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:892

   type PFNGLXCHANNELRECTSYNCSGIXPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : int;
         arg3 : int;
         arg4 : GL_gl_h.GLenum) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:893

   subtype GLXVideoSourceSGIX is X11_X_h.XID;  -- /usr/include/GL/glxext.h:905

   type PFNGLXCUSHIONSGIPROC is access procedure
        (arg1 : access X11_Xlib_h.Display;
         arg2 : X11_X_h.Window;
         arg3 : float)
   with Convention => C;  -- /usr/include/GL/glxext.h:923

   type PFNGLXMAKECURRENTREADSGIPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : glx.ads.GLXDrawable;
         arg3 : glx.ads.GLXDrawable;
         arg4 : glx.ads.GLXContext) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:931

   type PFNGLXGETCURRENTREADDRAWABLESGIPROC is access function return glx.ads.GLXDrawable
   with Convention => C;  -- /usr/include/GL/glxext.h:932

   type PFNGLXSWAPINTERVALSGIPROC is access function (arg1 : int) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:941

   type PFNGLXGETVIDEOSYNCSGIPROC is access function (arg1 : access unsigned) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:949

   type PFNGLXWAITVIDEOSYNCSGIPROC is access function
        (arg1 : int;
         arg2 : int;
         arg3 : access unsigned) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:950

   type PFNGLXGETTRANSPARENTINDEXSUNPROC is access function
        (arg1 : access X11_Xlib_h.Display;
         arg2 : X11_X_h.Window;
         arg3 : X11_X_h.Window;
         arg4 : access unsigned_long) return int
   with Convention => C;  -- /usr/include/GL/glxext.h:959

end glxext;
