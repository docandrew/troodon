pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with X11;
limited with Xlib;
limited with Xutil;
with Interfaces.C.Strings;
with System;
with GL;
with bits_stdint_intn_h;

package glx is
   -- Troodon addition
   type IntArray is array (Integer range <>) of Interfaces.C.int
     with Convention => C, Component_Size => Interfaces.C.int'Size;

   GLX_VERSION_1_1 : constant := 1;  --  /usr/include/GL/glx.h:40
   GLX_VERSION_1_2 : constant := 1;  --  /usr/include/GL/glx.h:41
   GLX_VERSION_1_3 : constant := 1;  --  /usr/include/GL/glx.h:42
   GLX_VERSION_1_4 : constant := 1;  --  /usr/include/GL/glx.h:43

   GLX_EXTENSION_NAME : aliased constant String := "GLX" & ASCII.NUL;  --  /usr/include/GL/glx.h:45

   GLX_USE_GL : constant := 1;  --  /usr/include/GL/glx.h:52
   GLX_BUFFER_SIZE : constant := 2;  --  /usr/include/GL/glx.h:53
   GLX_LEVEL : constant := 3;  --  /usr/include/GL/glx.h:54
   GLX_RGBA : constant := 4;  --  /usr/include/GL/glx.h:55
   GLX_DOUBLEBUFFER : constant := 5;  --  /usr/include/GL/glx.h:56
   GLX_STEREO : constant := 6;  --  /usr/include/GL/glx.h:57
   GLX_AUX_BUFFERS : constant := 7;  --  /usr/include/GL/glx.h:58
   GLX_RED_SIZE : constant := 8;  --  /usr/include/GL/glx.h:59
   GLX_GREEN_SIZE : constant := 9;  --  /usr/include/GL/glx.h:60
   GLX_BLUE_SIZE : constant := 10;  --  /usr/include/GL/glx.h:61
   GLX_ALPHA_SIZE : constant := 11;  --  /usr/include/GL/glx.h:62
   GLX_DEPTH_SIZE : constant := 12;  --  /usr/include/GL/glx.h:63
   GLX_STENCIL_SIZE : constant := 13;  --  /usr/include/GL/glx.h:64
   GLX_ACCUM_RED_SIZE : constant := 14;  --  /usr/include/GL/glx.h:65
   GLX_ACCUM_GREEN_SIZE : constant := 15;  --  /usr/include/GL/glx.h:66
   GLX_ACCUM_BLUE_SIZE : constant := 16;  --  /usr/include/GL/glx.h:67
   GLX_ACCUM_ALPHA_SIZE : constant := 17;  --  /usr/include/GL/glx.h:68

   GLX_BAD_SCREEN : constant := 1;  --  /usr/include/GL/glx.h:74
   GLX_BAD_ATTRIBUTE : constant := 2;  --  /usr/include/GL/glx.h:75
   GLX_NO_EXTENSION : constant := 3;  --  /usr/include/GL/glx.h:76
   GLX_BAD_VISUAL : constant := 4;  --  /usr/include/GL/glx.h:77
   GLX_BAD_CONTEXT : constant := 5;  --  /usr/include/GL/glx.h:78
   GLX_BAD_VALUE : constant := 6;  --  /usr/include/GL/glx.h:79
   GLX_BAD_ENUM : constant := 7;  --  /usr/include/GL/glx.h:80

   GLX_VENDOR : constant := 1;  --  /usr/include/GL/glx.h:86
   GLX_VERSION : constant := 2;  --  /usr/include/GL/glx.h:87
   GLX_EXTENSIONS : constant := 3;  --  /usr/include/GL/glx.h:88

   GLX_CONFIG_CAVEAT : constant := 16#20#;  --  /usr/include/GL/glx.h:94
   GLX_DONT_CARE : constant := 16#FFFFFFFF#;  --  /usr/include/GL/glx.h:95
   GLX_X_VISUAL_TYPE : constant := 16#22#;  --  /usr/include/GL/glx.h:96
   GLX_TRANSPARENT_TYPE : constant := 16#23#;  --  /usr/include/GL/glx.h:97
   GLX_TRANSPARENT_INDEX_VALUE : constant := 16#24#;  --  /usr/include/GL/glx.h:98
   GLX_TRANSPARENT_RED_VALUE : constant := 16#25#;  --  /usr/include/GL/glx.h:99
   GLX_TRANSPARENT_GREEN_VALUE : constant := 16#26#;  --  /usr/include/GL/glx.h:100
   GLX_TRANSPARENT_BLUE_VALUE : constant := 16#27#;  --  /usr/include/GL/glx.h:101
   GLX_TRANSPARENT_ALPHA_VALUE : constant := 16#28#;  --  /usr/include/GL/glx.h:102
   GLX_WINDOW_BIT : constant := 16#00000001#;  --  /usr/include/GL/glx.h:103
   GLX_PIXMAP_BIT : constant := 16#00000002#;  --  /usr/include/GL/glx.h:104
   GLX_PBUFFER_BIT : constant := 16#00000004#;  --  /usr/include/GL/glx.h:105
   GLX_AUX_BUFFERS_BIT : constant := 16#00000010#;  --  /usr/include/GL/glx.h:106
   GLX_FRONT_LEFT_BUFFER_BIT : constant := 16#00000001#;  --  /usr/include/GL/glx.h:107
   GLX_FRONT_RIGHT_BUFFER_BIT : constant := 16#00000002#;  --  /usr/include/GL/glx.h:108
   GLX_BACK_LEFT_BUFFER_BIT : constant := 16#00000004#;  --  /usr/include/GL/glx.h:109
   GLX_BACK_RIGHT_BUFFER_BIT : constant := 16#00000008#;  --  /usr/include/GL/glx.h:110
   GLX_DEPTH_BUFFER_BIT : constant := 16#00000020#;  --  /usr/include/GL/glx.h:111
   GLX_STENCIL_BUFFER_BIT : constant := 16#00000040#;  --  /usr/include/GL/glx.h:112
   GLX_ACCUM_BUFFER_BIT : constant := 16#00000080#;  --  /usr/include/GL/glx.h:113
   GLX_NONE : constant := 16#8000#;  --  /usr/include/GL/glx.h:114
   GLX_SLOW_CONFIG : constant := 16#8001#;  --  /usr/include/GL/glx.h:115
   GLX_TRUE_COLOR : constant := 16#8002#;  --  /usr/include/GL/glx.h:116
   GLX_DIRECT_COLOR : constant := 16#8003#;  --  /usr/include/GL/glx.h:117
   GLX_PSEUDO_COLOR : constant := 16#8004#;  --  /usr/include/GL/glx.h:118
   GLX_STATIC_COLOR : constant := 16#8005#;  --  /usr/include/GL/glx.h:119
   GLX_GRAY_SCALE : constant := 16#8006#;  --  /usr/include/GL/glx.h:120
   GLX_STATIC_GRAY : constant := 16#8007#;  --  /usr/include/GL/glx.h:121
   GLX_TRANSPARENT_RGB : constant := 16#8008#;  --  /usr/include/GL/glx.h:122
   GLX_TRANSPARENT_INDEX : constant := 16#8009#;  --  /usr/include/GL/glx.h:123
   GLX_VISUAL_ID : constant := 16#800B#;  --  /usr/include/GL/glx.h:124
   GLX_SCREEN : constant := 16#800C#;  --  /usr/include/GL/glx.h:125
   GLX_NON_CONFORMANT_CONFIG : constant := 16#800D#;  --  /usr/include/GL/glx.h:126
   GLX_DRAWABLE_TYPE : constant := 16#8010#;  --  /usr/include/GL/glx.h:127
   GLX_RENDER_TYPE : constant := 16#8011#;  --  /usr/include/GL/glx.h:128
   GLX_X_RENDERABLE : constant := 16#8012#;  --  /usr/include/GL/glx.h:129
   GLX_FBCONFIG_ID : constant := 16#8013#;  --  /usr/include/GL/glx.h:130
   GLX_RGBA_TYPE : constant := 16#8014#;  --  /usr/include/GL/glx.h:131
   GLX_COLOR_INDEX_TYPE : constant := 16#8015#;  --  /usr/include/GL/glx.h:132
   GLX_MAX_PBUFFER_WIDTH : constant := 16#8016#;  --  /usr/include/GL/glx.h:133
   GLX_MAX_PBUFFER_HEIGHT : constant := 16#8017#;  --  /usr/include/GL/glx.h:134
   GLX_MAX_PBUFFER_PIXELS : constant := 16#8018#;  --  /usr/include/GL/glx.h:135
   GLX_PRESERVED_CONTENTS : constant := 16#801B#;  --  /usr/include/GL/glx.h:136
   GLX_LARGEST_PBUFFER : constant := 16#801C#;  --  /usr/include/GL/glx.h:137
   GLX_WIDTH : constant := 16#801D#;  --  /usr/include/GL/glx.h:138
   GLX_HEIGHT : constant := 16#801E#;  --  /usr/include/GL/glx.h:139
   GLX_EVENT_MASK : constant := 16#801F#;  --  /usr/include/GL/glx.h:140
   GLX_DAMAGED : constant := 16#8020#;  --  /usr/include/GL/glx.h:141
   GLX_SAVED : constant := 16#8021#;  --  /usr/include/GL/glx.h:142
   GLX_WINDOW : constant := 16#8022#;  --  /usr/include/GL/glx.h:143
   GLX_PBUFFER : constant := 16#8023#;  --  /usr/include/GL/glx.h:144
   GLX_PBUFFER_HEIGHT : constant := 16#8040#;  --  /usr/include/GL/glx.h:145
   GLX_PBUFFER_WIDTH : constant := 16#8041#;  --  /usr/include/GL/glx.h:146
   GLX_RGBA_BIT : constant := 16#00000001#;  --  /usr/include/GL/glx.h:147
   GLX_COLOR_INDEX_BIT : constant := 16#00000002#;  --  /usr/include/GL/glx.h:148
   GLX_PBUFFER_CLOBBER_MASK : constant := 16#08000000#;  --  /usr/include/GL/glx.h:149

   GLX_SAMPLE_BUFFERS : constant := 16#186a0#;  --  /usr/include/GL/glx.h:155
   GLX_SAMPLES : constant := 16#186a1#;  --  /usr/include/GL/glx.h:156

   GLX_PbufferClobber : constant := 0;  --  /usr/include/GL/glx.h:177
   GLX_BufferSwapComplete : constant := 1;  --  /usr/include/GL/glx.h:178

   GLX_ARB_get_proc_address : constant := 1;  --  /usr/include/GL/glx.h:310

   GLX_ARB_render_texture : constant := 1;  --  /usr/include/GL/glx.h:357

   GLX_MESA_swap_frame_usage : constant := 1;  --  /usr/include/GL/glx.h:370

  -- * Mesa 3-D graphics library
  -- * 
  -- * Copyright (C) 1999-2006  Brian Paul   All Rights Reserved.
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

  -- * Tokens for glXChooseVisual and glXGetConfig:
  --  

  -- * Error codes returned by glXGetConfig:
  --  

  -- * GLX 1.1 and later:
  --  

  -- * GLX 1.3 and later:
  --  

  -- * GLX 1.4 and later:
  --  

   type uu_GLXcontextRec is null record;   -- incomplete struct

   type GLXContext is access all uu_GLXcontextRec;  -- /usr/include/GL/glx.h:160

   subtype GLXPixmap is X11.XID;  -- /usr/include/GL/glx.h:161

   subtype GLXDrawable is X11.XID;  -- /usr/include/GL/glx.h:162

  -- GLX 1.3 and later  
   type uu_GLXFBConfigRec is null record;   -- incomplete struct

   -- Troodon edit
   type GLXFBConfig is access all uu_GLXFBConfigRec;  -- /usr/include/GL/glx.h:164
   type GLXFBConfigArray is array (Integer range <>) of GLXFBConfig;

   subtype GLXFBConfigID is X11.XID;  -- /usr/include/GL/glx.h:165

   subtype GLXContextID is X11.XID;  -- /usr/include/GL/glx.h:166

   subtype GLXWindow is X11.XID;  -- /usr/include/GL/glx.h:167

   subtype GLXPbuffer is X11.XID;  -- /usr/include/GL/glx.h:168

  --** Events.
  --** __GLX_NUMBER_EVENTS is set to 17 to account for the BufferClobberSGIX
  --**  event - this helps initialization if the server supports the pbuffer
  --**  extension and the client doesn't.
  -- 

   function glXChooseVisual
     (dpy : access Xlib.Display;
      screen : int;
      attribList : IntArray) return access Xutil.XVisualInfo  -- /usr/include/GL/glx.h:182
   with Import => True, 
        Convention => C, 
        External_Name => "glXChooseVisual";

   function glXCreateContext
     (dpy : access Xlib.Display;
      vis : access Xutil.XVisualInfo;
      shareList : GLXContext;
      direct : int) return GLXContext  -- /usr/include/GL/glx.h:185
   with Import => True, 
        Convention => C, 
        External_Name => "glXCreateContext";

   procedure glXDestroyContext (dpy : access Xlib.Display; ctx : GLXContext)  -- /usr/include/GL/glx.h:188
   with Import => True, 
        Convention => C, 
        External_Name => "glXDestroyContext";

   function glXMakeCurrent
     (dpy : access Xlib.Display;
      drawable : GLXDrawable;
      ctx : GLXContext) return int  -- /usr/include/GL/glx.h:190
   with Import => True, 
        Convention => C, 
        External_Name => "glXMakeCurrent";

   procedure glXCopyContext
     (dpy : access Xlib.Display;
      src : GLXContext;
      dst : GLXContext;
      mask : unsigned_long)  -- /usr/include/GL/glx.h:193
   with Import => True, 
        Convention => C, 
        External_Name => "glXCopyContext";

   procedure glXSwapBuffers (dpy : access Xlib.Display; drawable : GLXDrawable)  -- /usr/include/GL/glx.h:196
   with Import => True, 
        Convention => C, 
        External_Name => "glXSwapBuffers";

   function glXCreateGLXPixmap
     (dpy : access Xlib.Display;
      visual : access Xutil.XVisualInfo;
      the_pixmap : X11.Pixmap) return GLXPixmap  -- /usr/include/GL/glx.h:198
   with Import => True, 
        Convention => C, 
        External_Name => "glXCreateGLXPixmap";

   procedure glXDestroyGLXPixmap (dpy : access Xlib.Display; pixmap : GLXPixmap)  -- /usr/include/GL/glx.h:201
   with Import => True, 
        Convention => C, 
        External_Name => "glXDestroyGLXPixmap";

   function glXQueryExtension
     (dpy : access Xlib.Display;
      errorb : access int;
      event : access int) return int  -- /usr/include/GL/glx.h:203
   with Import => True, 
        Convention => C, 
        External_Name => "glXQueryExtension";

   function glXQueryVersion
     (dpy : access Xlib.Display;
      maj : access int;
      min : access int) return int  -- /usr/include/GL/glx.h:205
   with Import => True, 
        Convention => C, 
        External_Name => "glXQueryVersion";

   function glXIsDirect (dpy : access Xlib.Display; ctx : GLXContext) return int  -- /usr/include/GL/glx.h:207
   with Import => True, 
        Convention => C, 
        External_Name => "glXIsDirect";

   function glXGetConfig
     (dpy : access Xlib.Display;
      visual : access Xutil.XVisualInfo;
      attrib : int;
      value : access int) return int  -- /usr/include/GL/glx.h:209
   with Import => True, 
        Convention => C, 
        External_Name => "glXGetConfig";

   function glXGetCurrentContext return GLXContext  -- /usr/include/GL/glx.h:212
   with Import => True, 
        Convention => C, 
        External_Name => "glXGetCurrentContext";

   function glXGetCurrentDrawable return GLXDrawable  -- /usr/include/GL/glx.h:214
   with Import => True, 
        Convention => C, 
        External_Name => "glXGetCurrentDrawable";

   procedure glXWaitGL  -- /usr/include/GL/glx.h:216
   with Import => True, 
        Convention => C, 
        External_Name => "glXWaitGL";

   procedure glXWaitX  -- /usr/include/GL/glx.h:218
   with Import => True, 
        Convention => C, 
        External_Name => "glXWaitX";

   procedure glXUseXFont
     (the_font : X11.Font;
      first : int;
      count : int;
      list : int)  -- /usr/include/GL/glx.h:220
   with Import => True, 
        Convention => C, 
        External_Name => "glXUseXFont";

  -- GLX 1.1 and later  
   function glXQueryExtensionsString (dpy : access Xlib.Display; screen : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/GL/glx.h:225
   with Import => True, 
        Convention => C, 
        External_Name => "glXQueryExtensionsString";

   function glXQueryServerString
     (dpy : access Xlib.Display;
      screen : int;
      name : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/GL/glx.h:227
   with Import => True, 
        Convention => C, 
        External_Name => "glXQueryServerString";

   function glXGetClientString (dpy : access Xlib.Display; name : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/GL/glx.h:229
   with Import => True, 
        Convention => C, 
        External_Name => "glXGetClientString";

  -- GLX 1.2 and later  
   function glXGetCurrentDisplay return access Xlib.Display  -- /usr/include/GL/glx.h:233
   with Import => True, 
        Convention => C, 
        External_Name => "glXGetCurrentDisplay";

  -- GLX 1.3 and later  
   function glXChooseFBConfig
     (dpy : access Xlib.Display;
      screen : int;
      attribList : IntArray;
      nitems : access int) return System.Address  -- /usr/include/GL/glx.h:237
   with Import => True, 
        Convention => C, 
        External_Name => "glXChooseFBConfig";

   function glXGetFBConfigAttrib
     (dpy : access Xlib.Display;
      config : GLXFBConfig;
      attribute : int;
      value : access int) return int  -- /usr/include/GL/glx.h:240
   with Import => True, 
        Convention => C, 
        External_Name => "glXGetFBConfigAttrib";

   function glXGetFBConfigs
     (dpy : access Xlib.Display;
      screen : int;
      nelements : access int) return System.Address  -- /usr/include/GL/glx.h:243
   with Import => True, 
        Convention => C, 
        External_Name => "glXGetFBConfigs";

   function glXGetVisualFromFBConfig (dpy : access Xlib.Display; config : GLXFBConfig) return access Xutil.XVisualInfo  -- /usr/include/GL/glx.h:246
   with Import => True, 
        Convention => C, 
        External_Name => "glXGetVisualFromFBConfig";

   function glXCreateWindow
     (dpy : access Xlib.Display;
      config : GLXFBConfig;
      win : X11.Window;
      attribList : access int) return GLXWindow  -- /usr/include/GL/glx.h:249
   with Import => True, 
        Convention => C, 
        External_Name => "glXCreateWindow";

   procedure glXDestroyWindow (dpy : access Xlib.Display; window : GLXWindow)  -- /usr/include/GL/glx.h:252
   with Import => True, 
        Convention => C, 
        External_Name => "glXDestroyWindow";

   function glXCreatePixmap
     (dpy : access Xlib.Display;
      config : GLXFBConfig;
      the_pixmap : X11.Pixmap;
      attribList : access int) return GLXPixmap  -- /usr/include/GL/glx.h:254
   with Import => True, 
        Convention => C, 
        External_Name => "glXCreatePixmap";

   procedure glXDestroyPixmap (dpy : access Xlib.Display; pixmap : GLXPixmap)  -- /usr/include/GL/glx.h:257
   with Import => True, 
        Convention => C, 
        External_Name => "glXDestroyPixmap";

   function glXCreatePbuffer
     (dpy : access Xlib.Display;
      config : GLXFBConfig;
      attribList : access int) return GLXPbuffer  -- /usr/include/GL/glx.h:259
   with Import => True, 
        Convention => C, 
        External_Name => "glXCreatePbuffer";

   procedure glXDestroyPbuffer (dpy : access Xlib.Display; pbuf : GLXPbuffer)  -- /usr/include/GL/glx.h:262
   with Import => True, 
        Convention => C, 
        External_Name => "glXDestroyPbuffer";

   procedure glXQueryDrawable
     (dpy : access Xlib.Display;
      draw : GLXDrawable;
      attribute : int;
      value : access unsigned)  -- /usr/include/GL/glx.h:264
   with Import => True, 
        Convention => C, 
        External_Name => "glXQueryDrawable";

   function glXCreateNewContext
     (dpy : access Xlib.Display;
      config : GLXFBConfig;
      renderType : int;
      shareList : GLXContext;
      direct : int) return GLXContext  -- /usr/include/GL/glx.h:267
   with Import => True, 
        Convention => C, 
        External_Name => "glXCreateNewContext";

   function glXMakeContextCurrent
     (dpy : access Xlib.Display;
      draw : GLXDrawable;
      read : GLXDrawable;
      ctx : GLXContext) return int  -- /usr/include/GL/glx.h:271
   with Import => True, 
        Convention => C, 
        External_Name => "glXMakeContextCurrent";

   function glXGetCurrentReadDrawable return GLXDrawable  -- /usr/include/GL/glx.h:274
   with Import => True, 
        Convention => C, 
        External_Name => "glXGetCurrentReadDrawable";

   function glXQueryContext
     (dpy : access Xlib.Display;
      ctx : GLXContext;
      attribute : int;
      value : access int) return int  -- /usr/include/GL/glx.h:276
   with Import => True, 
        Convention => C, 
        External_Name => "glXQueryContext";

   procedure glXSelectEvent
     (dpy : access Xlib.Display;
      drawable : GLXDrawable;
      mask : unsigned_long)  -- /usr/include/GL/glx.h:279
   with Import => True, 
        Convention => C, 
        External_Name => "glXSelectEvent";

   procedure glXGetSelectedEvent
     (dpy : access Xlib.Display;
      drawable : GLXDrawable;
      mask : access unsigned_long)  -- /usr/include/GL/glx.h:282
   with Import => True, 
        Convention => C, 
        External_Name => "glXGetSelectedEvent";

  -- GLX 1.3 function pointer typedefs  
   type PFNGLXGETFBCONFIGSPROC is access function
        (arg1 : access Xlib.Display;
         arg2 : int;
         arg3 : access int) return System.Address
   with Convention => C;  -- /usr/include/GL/glx.h:286

   type PFNGLXCHOOSEFBCONFIGPROC is access function
        (arg1 : access Xlib.Display;
         arg2 : int;
         arg3 : access int;
         arg4 : access int) return System.Address
   with Convention => C;  -- /usr/include/GL/glx.h:287

   type PFNGLXGETFBCONFIGATTRIBPROC is access function
        (arg1 : access Xlib.Display;
         arg2 : GLXFBConfig;
         arg3 : int;
         arg4 : access int) return int
   with Convention => C;  -- /usr/include/GL/glx.h:288

   type PFNGLXGETVISUALFROMFBCONFIGPROC is access function (arg1 : access Xlib.Display; arg2 : GLXFBConfig) return access Xutil.XVisualInfo
   with Convention => C;  -- /usr/include/GL/glx.h:289

   type PFNGLXCREATEWINDOWPROC is access function
        (arg1 : access Xlib.Display;
         arg2 : GLXFBConfig;
         arg3 : X11.Window;
         arg4 : access int) return GLXWindow
   with Convention => C;  -- /usr/include/GL/glx.h:290

   type PFNGLXDESTROYWINDOWPROC is access procedure (arg1 : access Xlib.Display; arg2 : GLXWindow)
   with Convention => C;  -- /usr/include/GL/glx.h:291

   type PFNGLXCREATEPIXMAPPROC is access function
        (arg1 : access Xlib.Display;
         arg2 : GLXFBConfig;
         arg3 : X11.Pixmap;
         arg4 : access int) return GLXPixmap
   with Convention => C;  -- /usr/include/GL/glx.h:292

   type PFNGLXDESTROYPIXMAPPROC is access procedure (arg1 : access Xlib.Display; arg2 : GLXPixmap)
   with Convention => C;  -- /usr/include/GL/glx.h:293

   type PFNGLXCREATEPBUFFERPROC is access function
        (arg1 : access Xlib.Display;
         arg2 : GLXFBConfig;
         arg3 : access int) return GLXPbuffer
   with Convention => C;  -- /usr/include/GL/glx.h:294

   type PFNGLXDESTROYPBUFFERPROC is access procedure (arg1 : access Xlib.Display; arg2 : GLXPbuffer)
   with Convention => C;  -- /usr/include/GL/glx.h:295

   type PFNGLXQUERYDRAWABLEPROC is access procedure
        (arg1 : access Xlib.Display;
         arg2 : GLXDrawable;
         arg3 : int;
         arg4 : access unsigned)
   with Convention => C;  -- /usr/include/GL/glx.h:296

   type PFNGLXCREATENEWCONTEXTPROC is access function
        (arg1 : access Xlib.Display;
         arg2 : GLXFBConfig;
         arg3 : int;
         arg4 : GLXContext;
         arg5 : int) return GLXContext
   with Convention => C;  -- /usr/include/GL/glx.h:297

   type PFNGLXMAKECONTEXTCURRENTPROC is access function
        (arg1 : access Xlib.Display;
         arg2 : GLXDrawable;
         arg3 : GLXDrawable;
         arg4 : GLXContext) return int
   with Convention => C;  -- /usr/include/GL/glx.h:298

   type PFNGLXGETCURRENTREADDRAWABLEPROC is access function return GLXDrawable
   with Convention => C;  -- /usr/include/GL/glx.h:299

   type PFNGLXGETCURRENTDISPLAYPROC is access function return access Xlib.Display
   with Convention => C;  -- /usr/include/GL/glx.h:300

   type PFNGLXQUERYCONTEXTPROC is access function
        (arg1 : access Xlib.Display;
         arg2 : GLXContext;
         arg3 : int;
         arg4 : access int) return int
   with Convention => C;  -- /usr/include/GL/glx.h:301

   type PFNGLXSELECTEVENTPROC is access procedure
        (arg1 : access Xlib.Display;
         arg2 : GLXDrawable;
         arg3 : unsigned_long)
   with Convention => C;  -- /usr/include/GL/glx.h:302

   type PFNGLXGETSELECTEDEVENTPROC is access procedure
        (arg1 : access Xlib.Display;
         arg2 : GLXDrawable;
         arg3 : access unsigned_long)
   with Convention => C;  -- /usr/include/GL/glx.h:303

  -- * ARB 2. GLX_ARB_get_proc_address
  --  

   type uu_GLXextFuncPtr is access procedure
   with Convention => C;  -- /usr/include/GL/glx.h:312

   function glXGetProcAddressARB (arg1 : access GL.GLubyte) return uu_GLXextFuncPtr  -- /usr/include/GL/glx.h:313
   with Import => True, 
        Convention => C, 
        External_Name => "glXGetProcAddressARB";

  -- GLX 1.4 and later  
  --Troodon: change procname type and return type
   function glXGetProcAddress (procname : access Interfaces.C.char) return uu_GLXextFuncPtr  -- /usr/include/GL/glx.h:320
   --function glXGetProcAddress (procname : access GL.GLubyte) return access procedure  -- /usr/include/GL/glx.h:320
   with Import => True, 
        Convention => C, 
        External_Name => "glXGetProcAddress";

  -- GLX 1.4 function pointer typedefs  
   type PFNGLXGETPROCADDRESSPROC is access function (arg1 : access GL.GLubyte) return uu_GLXextFuncPtr
   with Convention => C;  -- /usr/include/GL/glx.h:323

  --*
  -- ** The following aren't in glxext.h yet.
  -- * 

  -- * ???. GLX_NV_vertex_array_range
  --  

   function glXAllocateMemoryNV
     (size : GL.GLsizei;
      readfreq : GL.GLfloat;
      writefreq : GL.GLfloat;
      priority : GL.GLfloat) return System.Address  -- /usr/include/GL/glx.h:344
   with Import => True, 
        Convention => C, 
        External_Name => "glXAllocateMemoryNV";

   procedure glXFreeMemoryNV (pointer : System.Address)  -- /usr/include/GL/glx.h:345
   with Import => True, 
        Convention => C, 
        External_Name => "glXFreeMemoryNV";

   type PFNGLXALLOCATEMEMORYNVPROC is access function
        (arg1 : GL.GLsizei;
         arg2 : GL.GLfloat;
         arg3 : GL.GLfloat;
         arg4 : GL.GLfloat) return System.Address
   with Convention => C;  -- /usr/include/GL/glx.h:346

   type PFNGLXFREEMEMORYNVPROC is access procedure (arg1 : System.Address)
   with Convention => C;  -- /usr/include/GL/glx.h:347

  -- * ARB ?. GLX_ARB_render_texture
  -- * XXX This was never finalized!
  --  

   function glXBindTexImageARB
     (dpy : access Xlib.Display;
      pbuffer : GLXPbuffer;
      buffer : int) return int  -- /usr/include/GL/glx.h:359
   with Import => True, 
        Convention => C, 
        External_Name => "glXBindTexImageARB";

   function glXReleaseTexImageARB
     (dpy : access Xlib.Display;
      pbuffer : GLXPbuffer;
      buffer : int) return int  -- /usr/include/GL/glx.h:360
   with Import => True, 
        Convention => C, 
        External_Name => "glXReleaseTexImageARB";

   function glXDrawableAttribARB
     (dpy : access Xlib.Display;
      draw : GLXDrawable;
      attribList : access int) return int  -- /usr/include/GL/glx.h:361
   with Import => True, 
        Convention => C, 
        External_Name => "glXDrawableAttribARB";

  -- * #?. GLX_MESA_swap_frame_usage
  --  

   function glXGetFrameUsageMESA
     (dpy : access Xlib.Display;
      drawable : GLXDrawable;
      usage : access float) return int  -- /usr/include/GL/glx.h:372
   with Import => True, 
        Convention => C, 
        External_Name => "glXGetFrameUsageMESA";

   function glXBeginFrameTrackingMESA (dpy : access Xlib.Display; drawable : GLXDrawable) return int  -- /usr/include/GL/glx.h:373
   with Import => True, 
        Convention => C, 
        External_Name => "glXBeginFrameTrackingMESA";

   function glXEndFrameTrackingMESA (dpy : access Xlib.Display; drawable : GLXDrawable) return int  -- /usr/include/GL/glx.h:374
   with Import => True, 
        Convention => C, 
        External_Name => "glXEndFrameTrackingMESA";

   function glXQueryFrameTrackingMESA
     (dpy : access Xlib.Display;
      drawable : GLXDrawable;
      swapCount : access bits_stdint_intn_h.int64_t;
      missedFrames : access bits_stdint_intn_h.int64_t;
      lastMissedUsage : access float) return int  -- /usr/include/GL/glx.h:375
   with Import => True, 
        Convention => C, 
        External_Name => "glXQueryFrameTrackingMESA";

   type PFNGLXGETFRAMEUSAGEMESAPROC is access function
        (arg1 : access Xlib.Display;
         arg2 : GLXDrawable;
         arg3 : access float) return int
   with Convention => C;  -- /usr/include/GL/glx.h:377

   type PFNGLXBEGINFRAMETRACKINGMESAPROC is access function (arg1 : access Xlib.Display; arg2 : GLXDrawable) return int
   with Convention => C;  -- /usr/include/GL/glx.h:378

   type PFNGLXENDFRAMETRACKINGMESAPROC is access function (arg1 : access Xlib.Display; arg2 : GLXDrawable) return int
   with Convention => C;  -- /usr/include/GL/glx.h:379

   type PFNGLXQUERYFRAMETRACKINGMESAPROC is access function
        (arg1 : access Xlib.Display;
         arg2 : GLXDrawable;
         arg3 : access bits_stdint_intn_h.int64_t;
         arg4 : access bits_stdint_intn_h.int64_t;
         arg5 : access float) return int
   with Convention => C;  -- /usr/include/GL/glx.h:380

  -- * #?. GLX_MESA_swap_control
  --  

  --** Should these go here, or in another header?  
  --** GLX Events
  -- 

  -- GLX_DAMAGED or GLX_SAVED  
   --  skipped anonymous struct anon_113

   type GLXPbufferClobberEvent is record
      event_type : aliased int;  -- /usr/include/GL/glx.h:406
      draw_type : aliased int;  -- /usr/include/GL/glx.h:407
      serial : aliased unsigned_long;  -- /usr/include/GL/glx.h:408
      send_event : aliased int;  -- /usr/include/GL/glx.h:409
      the_display : access Xlib.Display;  -- /usr/include/GL/glx.h:410
      drawable : aliased GLXDrawable;  -- /usr/include/GL/glx.h:411
      buffer_mask : aliased unsigned;  -- /usr/include/GL/glx.h:412
      aux_buffer : aliased unsigned;  -- /usr/include/GL/glx.h:413
      x : aliased int;  -- /usr/include/GL/glx.h:414
      y : aliased int;  -- /usr/include/GL/glx.h:414
      width : aliased int;  -- /usr/include/GL/glx.h:415
      height : aliased int;  -- /usr/include/GL/glx.h:415
      count : aliased int;  -- /usr/include/GL/glx.h:416
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/GL/glx.h:417

  -- GLX_WINDOW or GLX_PBUFFER  
  -- # of last request processed by server  
  -- true if this came for SendEvent request  
  -- display the event was read from  
  -- XID of Drawable  
  -- mask indicating which buffers are affected  
  -- which aux buffer was affected  
  -- if nonzero, at least this many more  
   --  skipped anonymous struct anon_114

   type GLXBufferSwapComplete is record
      c_type : aliased int;  -- /usr/include/GL/glx.h:420
      serial : aliased unsigned_long;  -- /usr/include/GL/glx.h:421
      send_event : aliased int;  -- /usr/include/GL/glx.h:422
      the_display : access Xlib.Display;  -- /usr/include/GL/glx.h:423
      the_drawable : aliased X11.Drawable;  -- /usr/include/GL/glx.h:424
      event_type : aliased int;  -- /usr/include/GL/glx.h:425
      ust : aliased bits_stdint_intn_h.int64_t;  -- /usr/include/GL/glx.h:426
      msc : aliased bits_stdint_intn_h.int64_t;  -- /usr/include/GL/glx.h:427
      sbc : aliased bits_stdint_intn_h.int64_t;  -- /usr/include/GL/glx.h:428
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/GL/glx.h:429

  -- # of last request processed by server  
  -- true if this came from a SendEvent request  
  -- Display the event was read from  
  -- drawable on which event was requested in event mask  
   type uu_GLXEvent_array1233 is array (0 .. 23) of aliased long;
   type uu_GLXEvent (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            glxpbufferclobber : aliased GLXPbufferClobberEvent;  -- /usr/include/GL/glx.h:432
         when 1 =>
            the_glxbufferswapcomplete : aliased GLXBufferSwapComplete;  -- /usr/include/GL/glx.h:433
         when others =>
            pad : aliased uu_GLXEvent_array1233;  -- /usr/include/GL/glx.h:434
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- /usr/include/GL/glx.h:431

   subtype GLXEvent is uu_GLXEvent;  -- /usr/include/GL/glx.h:435
end glx;
