with Ada.Text_IO;
with Ada.Unchecked_Deallocation;
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
with xcb_render;
with xproto;

with setup;
with util;

package body render is

    ---------------------------------------------------------------------------
    -- initSoftwareRenderer
    -- We prefer a hardware-accelerated, eye-candy heavy rendering backend like
    -- OpenGL. However, in the event that this is unavailable, we can fall back
    -- to using a software renderer.
    -- @TODO probably just get rid of software rendering entirely. Let Mesa
    -- do that part.
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
    -- printFBConfig
    -- dump information about a particular GLX Framebuffer configuration
    ---------------------------------------------------------------------------
    procedure printFBConfig (display : not null access Xlib.Display;
                             fb : GLX.GLXFBConfig) is
            -- GLX framebuffer attributes
            glxRet : int;
            vtype  : aliased int;
            depth  : aliased int;
            size   : aliased int;
            dbuf   : aliased int;
            bitsR  : aliased int;
            bitsG  : aliased int;
            bitsB  : aliased int;
            bitsA  : aliased int;
            vid    : aliased int;
            trans  : aliased int;
        begin
            glxRet := GLX.glXGetFBConfigAttrib (display, fb, GLX.GLX_VISUAL_ID,         vid'Access);
            glxRet := GLX.glXGetFBConfigAttrib (display, fb, GLX.GLX_X_VISUAL_TYPE,     vtype'Access);
            glxRet := GLX.glXGetFBConfigAttrib (display, fb, GLX.GLX_DEPTH_SIZE,        depth'Access);
            glxRet := GLX.glXGetFBConfigAttrib (display, fb, GLX.GLX_BUFFER_SIZE,       size'Access);
            glxRet := GLX.glXGetFBConfigAttrib (display, fb, GLX.GLX_DOUBLEBUFFER,      dbuf'Access);
            glxRet := GLX.glXGetFBConfigAttrib (display, fb, GLX.GLX_RED_SIZE,          bitsR'Access);
            glxRet := GLX.glXGetFBConfigAttrib (display, fb, GLX.GLX_GREEN_SIZE,        bitsG'Access);
            glxRet := GLX.glXGetFBConfigAttrib (display, fb, GLX.GLX_BLUE_SIZE,         bitsB'Access);
            glxRet := GLX.glXGetFBConfigAttrib (display, fb, GLX.GLX_ALPHA_SIZE,        bitsA'Access);
            glxRet := GLX.glXGetFBConfigAttrib (display, fb, GLX.GLX_TRANSPARENT_TYPE,  trans'Access);
            
            Ada.Text_IO.Put_Line ("Troodon: (Render) GLX Framebuffer Configuration:");
            Ada.Text_IO.Put_Line (" Visual ID.......:" & vid'Image);
            Ada.Text_IO.Put_Line (" Visual Type.....: " & (if vtype = GLX.GLX_TRUE_COLOR then "True Color" else "Not True Color"));
            Ada.Text_IO.Put_Line (" Depth Size......:" & depth'Image);
            Ada.Text_IO.Put_Line (" Buffer Size.....:" & size'Image);
            Ada.Text_IO.Put_Line (" Double Buffer...: " & (if dbuf = 1 then "Yes" else "No"));
            Ada.Text_IO.Put_Line (" Red Bits........:" & bitsR'Image);
            Ada.Text_IO.Put_Line (" Green Bits......:" & bitsG'Image);
            Ada.Text_IO.Put_Line (" Blue Bits.......:" & bitsB'Image);
            Ada.Text_IO.Put_Line (" Alpha Bits......:" & bitsA'Image);
            Ada.Text_IO.Put_Line (" Transparency....: " & 
                (if    trans = GLX.GLX_NONE then "None" 
                 elsif trans = GLX.GLX_TRANSPARENT_INDEX then "Index" 
                 elsif trans = GLX.GLX_TRANSPARENT_RGB then "RGB"
                 else "Unknown"));
    end printFBConfig;

    ---------------------------------------------------------------------------
    -- getFBConfig
    -- Query the X Server for an acceptable framebuffer configuration.
    ---------------------------------------------------------------------------
    procedure getFBConfig (connection : not null access xcb.xcb_connection_t;
                           display    : not null access Xlib.Display;
                           fbConfig   : out GLX.GLXFBConfig;
                           visualID   : out xproto.xcb_visualid_t)
    is
        use GLX;

        fbConfigsAddr : System.Address;
        fbConfigCount : aliased int;

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
    
    begin
        -- Find a list of suitable framebuffer configurations
        fbConfigsAddr := GLX.glXChooseFBConfig (dpy       => display,
                                                screen     => Xlib.XDefaultScreen(display),
                                                attribList => visualAttribs,
                                                nitems     => fbConfigCount'Access);

        if fbConfigsAddr = System.Null_Address or fbConfigCount = 0 then
            raise OpenGLException with "Troodon: (Render) Unable to get GLX framebuffer config";
        end if;

        Ada.Text_IO.Put_Line("Troodon: (Render) Found" & fbConfigCount'Image & " potential GLX framebuffer configurations");

        -- Apparently the trick here to supporting transparency is to ask for an
        -- alpha channel as well as make sure that there is an alpha mask in
        -- the XRenderPictFormat.
        -- h/t datenwolf
        -- https://stackoverflow.com/questions/4052940/how-to-make-an-opengl-rendering-context-with-transparent-background
        --
        -- This code here is analogous to XRenderFindVisualFormat
        findVisualFormat: declare
            use xcb_render;

            fbConfigs : GLX.GLXFBConfigArray (1..Integer(fbConfigCount)) with
                Import, Address => fbConfigsAddr;

            type PictFormatReply is access all xcb_render_query_pict_formats_reply_t;

            visual  : access XUtil.XVisualInfo;
            cookie  : xcb_render_query_pict_formats_cookie_t;
            formats : PictFormatReply;
            screens : aliased xcb_render_pictscreen_iterator_t;
            depths  : aliased xcb_render_pictdepth_iterator_t;
            visuals : aliased xcb_render_pictvisual_iterator_t;
            doofers : aliased xcb_render_pictforminfo_iterator_t;

            procedure free is new Ada.Unchecked_Deallocation (Object => xcb_render_query_pict_formats_reply_t,
                                                              Name   => PictFormatReply);
        begin

            -- Get formats 
            cookie := xcb_render_query_pict_formats (connection);
            formats := xcb_render_query_pict_formats_reply (connection, cookie, System.Null_Address);

            for fb of fbConfigs loop
                visual := GLX.glXGetVisualFromFBConfig (display, fb);

                -- If we use a different visual, glXSwapBuffers fails
                -- EXPERIMENT
                -- visualID := xproto.xcb_visualid_t(visual.the_visualid);
                -- fbConfig := fb;
                -- return;
                -- END EXPERIMENT

                if visual /= null then
                    screens := xcb_render_query_pict_formats_screens_iterator (formats);

                    while screens.c_rem >= 0 loop
                        depths := xcb_render_pictscreen_depths_iterator (screens.data);

                        while depths.c_rem >= 0 loop
                            visuals := xcb_render_pictdepth_visuals_iterator (depths.data);

                            while visuals.c_rem >= 0 loop
                                if visuals.data.visual = xproto.xcb_visualid_t(visual.the_visualid) then
                                    doofers := xcb_render_query_pict_formats_formats_iterator (formats);

                                    while doofers.c_rem >= 0 loop
                                        if doofers.data.id = visuals.data.format and 
                                           doofers.data.direct.alpha_mask > 0 then
                                            -- we found it!
                                            Ada.Text_IO.Put_Line ("Troodon: (Render) Found picture format" & 
                                                doofers.data.id'Image & " matching visual ID" & visuals.data.visual'Image);
                                            
                                            visualID := xproto.xcb_visualid_t(visual.the_visualid);
                                            fbConfig := fb;
                                            
                                            free (formats);

                                            return;
                                        end if;

                                        xcb_render_pictforminfo_next (doofers'Access);
                                    end loop;
                                end if;

                                xcb_render_pictvisual_next (visuals'Access);
                            end loop;

                            xcb_render_pictdepth_next (depths'Access);
                        end loop;

                        xcb_render_pictscreen_next (screens'Access);
                    end loop;
                end if;
            end loop;

        free (formats);
        end findVisualFormat;

        raise OpenGLException with "Troodon: (Render) Unable to find a suitable framebuffer configuration and/or visual.";
    end getFBConfig;

    ---------------------------------------------------------------------------
    -- initRendering
    -- Try to set up OpenGL rendering
    ---------------------------------------------------------------------------
    function initRendering(connection : not null access xcb.xcb_connection_t;
                           display    : not null access Xlib.Display) return Renderer
    is
        use GLX;

        glxContext    : GLX.GLXContext;
        colormap      : xproto.xcb_colormap_t;
        cookie        : xcb.xcb_void_cookie_t;

        fb            : GLX.GLXFBConfig;
        visualID      : xproto.xcb_visualid_t;

    begin

        
        getFBConfig (connection, display, fb, visualID);
        printFBConfig (display, fb);
        
        Ada.Text_IO.Put_Line ("Troodon: (Render) Using Visual ID" & visualID'Image);
        Ada.Text_IO.Put_Line ("Troodon: (Render) Creating GLX Context");

        glxContext := GLX.glXCreateNewContext (dpy         => display,
                                               config      => fb,
                                               renderType  => GLX.GLX_RGBA_TYPE,
                                               shareList   => null,
                                               direct      => 1);

        if glxContext = null then
            raise OpenGLException with "Troodon: Failed to create new GLX Context";
        end if;

        Ada.Text_IO.Put_Line ("Troodon: (Render) Created new GLX context");

        -- Create XIDs for colormap
        colormap := xcb.xcb_generate_id (connection);

        cookie := xproto.xcb_create_colormap_checked 
                                             (c      => connection,
                                              alloc  => xproto.xcb_colormap_alloc_t'Pos(xproto.XCB_COLORMAP_ALLOC_NONE),
                                              mid    => colormap,
                                              window => setup.getRootWindow (connection),
                                              visual => visualID);

        if xcb.xcb_request_check (connection, cookie) /= null then
            Ada.Text_IO.Put_Line( "Troodon: Unable to create colormap");
            raise OpenGLException;
        end if;


        Ada.Text_IO.Put_Line ("Troodon: Using OpenGL Renderer!");

        return R : Renderer := (OPENGL,
                                display  => display,
                                visualID => visualID,
                                context  => glxContext,
                                colormap => colormap,
                                fbConfig => fb);
    exception
        when OpenGLException => return initSoftwareRenderer(connection);
    end initRendering;

    -- @TODO
    procedure teardownSoftwareRenderer (connection : access xcb.xcb_connection_t;
                                        rend : Render.Renderer) is
        -- cookie : xcb.xcb_void_cookie_t;
    begin
        null;
    end teardownSoftwareRenderer;

    ---------------------------------------------------------------------------
    -- teardownGLRenderer
    ---------------------------------------------------------------------------
    procedure teardownGLRenderer (connection : access xcb.xcb_connection_t;
                                  rend : Render.Renderer) is
    begin
        GLX.glXDestroyContext (rend.Display, rend.context);
    end teardownGLRenderer;

    ---------------------------------------------------------------------------
    --
    ---------------------------------------------------------------------------
    procedure teardownRendering (connection : access xcb.xcb_connection_t;
                                 rend : Render.Renderer) is
    begin
        case rend.kind is
            when Render.SOFTWARE =>
                teardownSoftwareRenderer (connection, rend);
            when Render.OpenGL =>
                teardownGLRenderer (connection, rend);
            when others =>
                null;
        end case;
    end teardownRendering;

end Render;
