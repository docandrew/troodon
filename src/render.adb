with Ada.Text_IO;
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with System; use System;

with fontconfig;
with fttypes;
with freetype;
with GL;
with GLX;
with Xlib;
with Xutil;
with xcb;
with xproto;

with setup;
with util;

package body render is

    ---------------------------------------------------------------------------
    -- initSoftwareRenderer
    -- We prefer a hardware-accelerated, eye-candy heavy rendering backend like
    -- OpenGL. However, in the event that this is unavailable, we can fall back
    -- to using a software renderer.
    ---------------------------------------------------------------------------
    function initSoftwareRenderer (connection : access xcb.xcb_connection_t) return Render.Renderer is
        -- @TODO load these from a config
        DEFAULT_FONT : constant String := "7x13";
        fontName     : constant chars_ptr := New_String(DEFAULT_FONT);
        TITLE_FG     : constant := 16#00BB_9911#;
        TITLE_BG     : constant := 16#0077_7777#;

        font    : xproto.xcb_font_t;
        cookie  : xcb.xcb_void_cookie_t;

        gcConfig : xproto.xcb_create_gc_value_list_t;

    begin
        Ada.Text_IO.Put_Line ("Troodon: Fallback to software rendering");

        -- Set up an X11 rendering context instead. Each window will use it's own
        -- graphics context, but we can load the font and common parameters used here.
        
        -- Load font for this GC
        font       := xcb.xcb_generate_id(connection);
        cookie     := xproto.xcb_open_font_checked(c        => connection,
                                                   fid      => font,
                                                   name_len => DEFAULT_FONT'Length,
                                                   name     => fontName);

        util.checkFatal(connection, cookie, "Unable to open selected font" & DEFAULT_FONT);

        -- Set up a graphics context configuration here w/ font
        -- We'll generate a new graphics context each time we create a window.
        gcConfig.foreground := TITLE_FG;
        gcConfig.background := TITLE_BG;
        gcConfig.font       := font;

        --checkFatal(connection, gcCookie, "drawTitleBar: Unable to create graphics context");

        return R : Renderer := (SOFTWARE, 
                                visualID => setup.getScreen(connection).root_visual,
                                gcConfig => gcConfig);
    end initSoftwareRenderer;

    ---------------------------------------------------------------------------
    -- initRendering
    -- Try to set up OpenGL rendering
    ---------------------------------------------------------------------------
    function initRendering(connection : not null access xcb.xcb_connection_t;
                           display    : not null access Xlib.Display) return Renderer
    is
        use GLX;
        glxRet        : int;
        visualID      : aliased int;
        fbConfig      : GLX.GLXFBConfig := null;
        fbConfigAddr  : System.Address; --access GLX.GLXFBConfig := null;
        fbConfigCount : aliased int;
        glxContext    : GLX.GLXContext;
        colormap      : xproto.xcb_colormap_t;
        cookie        : xcb.xcb_void_cookie_t;

        visualAttribs : GLX.IntArray(1..23) := (
            GLX_X_RENDERABLE,   1,
            GLX_DRAWABLE_TYPE,  GLX_WINDOW_BIT,
            GLX_RENDER_TYPE,    GLX_RGBA_BIT,
            GLX_X_VISUAL_TYPE,  GLX_TRUE_COLOR,
            GLX_RED_SIZE,       8,
            GLX_GREEN_SIZE,     8,
            GLX_BLUE_SIZE,      8,
            GLX_ALPHA_SIZE,     8,
            GLX_DEPTH_SIZE,     24,
            GLX_STENCIL_SIZE,   8,
            GLX_DOUBLEBUFFER,   1,
            0
        );

        -- Experiment to see if we can get glxContext before renderable surfaces
        -- are created.
        -- vis2          : access Xutil.XVisualInfo;
        -- visualAttribs2 : GLX.IntArray(1..5) := (
        --     GLX.GLX_RGBA,
        --     GLX.GLX_DEPTH_SIZE,
        --     24,
        --     GLX.GLX_DOUBLEBUFFER,
        --     0
        -- );
    begin
        -- Setup Frame Buffer Configuration
        fbConfigAddr := 
            GLX.glXChooseFBConfig (dpy        => display,
                                   screen     => Xlib.XDefaultScreen(display),
                                   attribList => visualAttribs,
                                   nitems     => fbConfigCount'Access);

        if fbConfigAddr = System.Null_Address or fbConfigCount = 0 then
            Ada.Text_IO.Put_Line("Troodon: Unable to get GLX framebuffer config");
            raise OpenGLException;
        end if;

        Ada.Text_IO.Put_Line("Troodon: Found" & fbConfigCount'Image & " matching GLX framebuffer configurations");

        -- pick the first FB config, get visual ID
        declare
            fbConfigs : GLX.GLXFBConfigArray (1..Integer(fbConfigCount)) with
                Import, Address => fbConfigAddr;
        begin
            fbConfig := fbConfigs(1);
        end;

        glxRet := GLX.glXGetFBConfigAttrib (dpy       => display,
                                            config    => fbConfig,
                                            attribute => GLX.GLX_VISUAL_ID,
                                            value     => visualID'Access);

        --Ada.Text_IO.Put_Line("glxRet:" & glxRet'Image);

        if glxRet = GLX.GLX_NO_EXTENSION or glxRet = GLX_BAD_ATTRIBUTE then
            Ada.Text_IO.Put_Line ("Troodon: queried GLX for Visual ID, but does not exist.");
            raise OpenGLException;
        end if;

        --------- Experiment
        -- Ada.Text_IO.Put_Line ("Choosing visual ID of display");
        -- vis2 := GLX.glxChooseVisual (display, 0, visualAttribs2);

        -- if vis2 = null then
        --     Ada.Text_IO.Put_Line (" No matching visual found matching our needs");
        -- end if;

        -- -- Create new OpenGL Context
        -- glxContext := GLX.glxCreateContext (dpy       => display,
        --                                     vis       => vis2,
        --                                     shareList => null,
        --                                     direct    => 1);

        --------- End Experiment

        Ada.Text_IO.Put_Line ("Troodon: Creating GLX Context");
        glxContext := GLX.glXCreateNewContext (dpy         => display,
                                               config      => fbConfig,
                                               renderType  => GLX.GLX_RGBA_TYPE,
                                               shareList   => null,
                                               direct      => 1);

        if glxContext = null then
            Ada.Text_IO.Put_Line ("Troodon: Failed to create new GLX Context");
            raise OpenGLException;
        end if;

        Ada.Text_IO.Put_Line ("Troodon: Created new GLX context");

        -- Create XIDs for colormap
        colormap := xcb.xcb_generate_id (connection);

        cookie := xproto.xcb_create_colormap_checked 
                                             (c      => connection,
                                              alloc  => xproto.xcb_colormap_alloc_t'Pos(xproto.XCB_COLORMAP_ALLOC_NONE),
                                              mid    => colormap,
                                              window => setup.getRootWindow (connection),
                                              visual => xproto.xcb_visualid_t (visualID));

        if xcb.xcb_request_check (connection, cookie) /= null then
            Ada.Text_IO.Put_Line( "Troodon: Unable to create colormap");
            raise OpenGLException;
        end if;

        Ada.Text_IO.Put_Line ("Troodon: Using OpenGL Renderer!");

        return R : Renderer := (OPENGL,
                                display  => display,
                                visualID => xproto.xcb_visualid_t(visualID),
                                context  => glxContext,
                                colormap => colormap,
                                fbConfig => fbConfig);
    exception
        when OpenGLException => return initSoftwareRenderer(connection);
    end initRendering;

    -- @TODO
    procedure teardownSoftwareRenderer(connection : access xcb.xcb_connection_t) is
        -- cookie : xcb.xcb_void_cookie_t;
    begin
        null;
    end teardownSoftwareRenderer;

    -- @TODO
    procedure teardownGLRenderer(connection : access xcb.xcb_connection_t) is
        -- cookie : xcb.xcb_void_cookie_t;
    begin
        null;
    end teardownGLRenderer;
end render;
