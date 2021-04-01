with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;
with Interfaces; use Interfaces;
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;

with Freetype;
with GL;
with GLext;
with GLX;
with xcb;
with xproto;

with Render.Fonts;
with Render.Shaders;
with Render.Text;
with Render.Util;
with Render.Widgets;
with Setup;
with Util;

package body frames is

    package RUtil renames Render.Util;

    FRAME_BG            : constant := 16#1F2430_FF#;
    FRAME_BORDER        : constant := 16#101521_FF#;

    FRAME_BORDER_WIDTH  : constant := 4;
    BUTTON_RADIUS       : constant := 10;
    BUTTON_GAP          : constant := 4;
    TITLEBAR_HEIGHT     : constant := 2 * BUTTON_RADIUS + 2 * BUTTON_GAP;

    BUTTON_CLOSE_COLOR_ACTIVE      : RUtil.DecorationColor := RUtil.rgbaToGLColor (16#F28779_FF#);
    BUTTON_CLOSE_COLOR_INACTIVE    : RUtil.DecorationColor := RUtil.rgbaToGLColor (16#707A8C_FF#);
    
    BUTTON_MAXIMIZE_COLOR_ACTIVE   : RUtil.DecorationColor := RUtil.rgbaToGLColor (16#BAE67E_FF#);
    BUTTON_MAXIMIZE_COLOR_INACTIVE : RUtil.DecorationColor := RUtil.rgbaToGLColor (16#707A7C_FF#);
    
    BUTTON_MINIMIZE_COLOR_ACTIVE   : RUtil.DecorationColor := RUtil.rgbaToGLColor (16#FFD580_FF#);
    BUTTON_MINIMIZE_COLOR_INACTIVE : RUtil.DecorationColor := RUtil.rgbaToGLColor (16#707A7C_FF#);

    FRAME_BG_GL     : RUtil.DecorationColor := RUtil.rgbaToGLColor (FRAME_BG);
    FRAME_BORDER_GL : RUtil.DecorationColor := RUtil.rgbaToGLColor (FRAME_BORDER);

    ---------------------------------------------------------------------------
    -- hashFunc
    ---------------------------------------------------------------------------
    function hashFunc(Key : xproto.xcb_window_t) return Ada.Containers.Hash_Type is
        use Ada.Containers;
        -- Knuth's multiplicative method
        tauPrime : constant := 2654435769;
    begin
        return Hash_Type(Key * tauPrime);
    end hashFunc;

    ---------------------------------------------------------------------------
    -- map
    -- Call xcb_map_window on this frame's window and child if appropriate
    ---------------------------------------------------------------------------
    procedure map(f : Frame) is
        cookie : xcb.xcb_void_cookie_t;
    begin
        cookie := xcb_map_window (c      => f.connection, 
                                  window => f.frameID);

        cookie := xcb_map_window (c      => f.connection,
                                  window => f.appWindow);
    end map;

    ---------------------------------------------------------------------------
    -- drawTitleBar
    -- @TODO generalize this to "drawFrame" or something
    -- @TODO see if there's a better way of loading the font in advance
    -- @TODO consider blitting this to a pixmap ahead of time to avoid font
    --  rendering overhead.
    ---------------------------------------------------------------------------
    procedure drawTitleBar (f : Frame) is
        use render;

        cookie : xcb.xcb_void_cookie_t;
        rend   : Render.Renderer := f.surface.renderer;
        title  : String := To_String(f.title);
        result : Interfaces.C.int;

        type Color is array (Natural range 1..4) of aliased GL.GLfloat with Convention => C;
        textColor : aliased Color := (0.0, 0.0, 0.0, 1.0);

        -- OpenGL info
        -- tex : aliased GL.GLuint;

        -- top-left coord of window label
        x : Float := 20.0;
        y : Float := 20.0;

        -- window dimensions
        w : Float;
        h : Float;

        glErr : GL.GLenum;
    begin
        -- Ada.Text_IO.Put_Line("Enter drawTitleBar");

        if f.surface.kind = render.SOFTWARE then
            cookie := xcb_image_text_8_checked(c          => f.connection,
                                               string_len => title'Length,
                                               drawable   => f.frameID,
                                               gc         => f.surface.gc,
                                               x          => 20,
                                               y          => 10,
                                               string     => Interfaces.C.Strings.New_String(title));

            util.checkFatal(f.connection, cookie, "drawTitleBar: Unable to draw text");
        else

            result := GLX.glXMakeContextCurrent (dpy  => rend.display,
                                                 draw => f.surface.drawable,
                                                 read => f.surface.drawable,
                                                 ctx  => rend.context);

            if result = 0 then
                Ada.Text_IO.Put_Line("Troodon: failed to make context current in drawTitleBar");
            end if;

            -- If we haven't loaded the shader program, do that now.
            -- We can't do this until we have a current context, which we don't have until we
            --  have a drawable window.
            if Render.Shaders.textShaderProg = 0 then
                Render.Shaders.initShaders;
            end if;

            -- if title = "xterm" then
            GL.glClearColor (red   => FRAME_BG_GL.r,
                             green => FRAME_BG_GL.g,
                             blue  => FRAME_BG_GL.b,
                             alpha => FRAME_BG_GL.a);
            -- elsif title = "xeyes" then
            --     GL.glClearColor (0.2, 0.2, 0.9, 1.0);
            -- else
            --     GL.glClearColor (0.9, 0.2, 0.2, 1.0);
            -- end if;

            GL.glClear (GL.GL_COLOR_BUFFER_BIT);

            -- glErr := GL.glGetError;
            -- Ada.Text_IO.Put_Line ("glClear GL error? " & glErr'Image);

            -- Enable blending
            GL.glEnable (cap => GL.GL_BLEND);

            GL.glBlendFunc (sfactor => GL.GL_SRC_ALPHA,
                            dfactor => GL.GL_ONE_MINUS_SRC_ALPHA);
            
            -- glErr := GL.glGetError;
            -- Ada.Text_IO.Put_Line ("glBlendFunc error? " & glErr'Image);

            w := Float(f.width);
            h := Float(f.height);

            -- Ada.Text_IO.Put_Line ("Window Width: " & f.width'Image);
            -- Ada.Text_IO.Put_Line ("Window Height: " & f.height'Image);
            -- Ada.Text_IO.Put_Line ("Scaling factor :" & sx'Image & ", " & sy'Image);
            Render.Text.renderGLText (title, x, y, w, h);

            -- Close button
            Render.Widgets.drawCircle (x        => w - Float(BUTTON_RADIUS + BUTTON_GAP),
                                       y        => Float(BUTTON_RADIUS + BUTTON_GAP),
                                       radius   => Float(BUTTON_RADIUS),
                                       r        => BUTTON_CLOSE_COLOR_ACTIVE.r,
                                       g        => BUTTON_CLOSE_COLOR_ACTIVE.g,
                                       b        => BUTTON_CLOSE_COLOR_ACTIVE.b,
                                       a        => BUTTON_CLOSE_COLOR_ACTIVE.a,
                                       windowW  => w,
                                       windowH  => h);

            -- Maximize button
            Render.Widgets.drawCircle (x        => w - Float(3 * BUTTON_RADIUS + 2 * BUTTON_GAP),
                                       y        => Float(BUTTON_RADIUS + BUTTON_GAP),
                                       radius   => Float(BUTTON_RADIUS),
                                       r        => BUTTON_MAXIMIZE_COLOR_ACTIVE.r,
                                       g        => BUTTON_MAXIMIZE_COLOR_ACTIVE.g,
                                       b        => BUTTON_MAXIMIZE_COLOR_ACTIVE.b,
                                       a        => BUTTON_MAXIMIZE_COLOR_ACTIVE.a,
                                       windowW  => w,
                                       windowH  => h);

            -- Minimize button
            Render.Widgets.drawCircle (x        => w - Float(5 * BUTTON_RADIUS + 3 * BUTTON_GAP),
                                       y        => Float(BUTTON_RADIUS + BUTTON_GAP),
                                       radius   => Float(BUTTON_RADIUS),
                                       r        => BUTTON_MINIMIZE_COLOR_ACTIVE.r,
                                       g        => BUTTON_MINIMIZE_COLOR_ACTIVE.g,
                                       b        => BUTTON_MINIMIZE_COLOR_ACTIVE.b,
                                       a        => BUTTON_MINIMIZE_COLOR_ACTIVE.a,
                                       windowW  => w,
                                       windowH  => h);

            GLX.glxSwapBuffers(rend.display, f.surface.drawable);
        end if;

        -- Ada.Text_IO.Put_Line("Exit drawTitleBar");
    end drawTitleBar;

    ---------------------------------------------------------------------------
    -- createOpenGLSurface
    ---------------------------------------------------------------------------
    function createOpenGLSurface(f : Frame;
                                 rend : render.Renderer) return render.RenderingSurface
    is
        glxWindow : GLX.GLXWindow;
        drawable  : GLX.GLXDrawable;
    begin
        Ada.Text_IO.Put_Line("Troodon: Creating OpenGL Frame");

        glxWindow := GLX.glXCreateWindow(dpy        => rend.display,
                                         config     => rend.fbConfig,
                                         win        => Interfaces.C.unsigned_long(f.frameID),
                                         attribList => null);   

        drawable := GLX.GLXDrawable(glxWindow);

        return R : render.RenderingSurface := (render.OPENGL, 
                                               drawable => drawable,
                                               renderer => rend);
    end createOpenGLSurface;

    ---------------------------------------------------------------------------
    -- createSoftwareSurface
    ---------------------------------------------------------------------------
    function createSoftwareSurface(f : Frame;
                                   rend : render.Renderer) return render.RenderingSurface
    is
        use xcb;
        use xproto;

        gc : Interfaces.C.Unsigned;
        mask : Interfaces.C.Unsigned := xproto.XCB_GC_BACKGROUND or 
                                        xproto.XCB_GC_FOREGROUND or
                                        xproto.XCB_GC_FONT;
        cookie : xcb_void_cookie_t;
    begin
        -- Create X11 GC
        gc := xcb_generate_id(f.connection);

        cookie := xcb_create_gc_aux_checked (c          => f.connection,
                                             cid        => gc,
                                             drawable   => f.frameID,
                                             value_mask => mask,
                                             value_list => rend.gcConfig'Access);
        
        util.checkFatal(f.connection, cookie, "drawTitleBar: Unable to create graphics context");

        return R : render.RenderingSurface := (render.SOFTWARE, 
                                               gc => gc,
                                               renderer => rend);
    end createSoftwareSurface;

    ---------------------------------------------------------------------------
    -- frameWindow
    ---------------------------------------------------------------------------
    function frameWindow(connection : access xcb.xcb_connection_t;
                         window     : xproto.xcb_window_t;
                         rend       : render.Renderer) return Frame is
        use xcb;
        use xproto;
        use render;

        geom    : xcb_get_geometry_reply_t;
        screen  : access xcb_screen_t;
        cookie  : xcb_void_cookie_t;
        result  : Interfaces.C.int;
        title   : Ada.Strings.Unbounded.Unbounded_String;
        --frameID : xcb_window_t;
        f     : Frame;

        frameCreateAttributes : aliased xcb_create_window_value_list_t;
        frameValueMask : Interfaces.C.unsigned;
    begin
        -- Get information about app window
        geom   := util.getWindowGeometry(connection, window);

        -- get the first screen
        screen := xcb_setup_roots_iterator (xcb_get_setup (connection)).data;

        -- Create new parent window for frame
        f.frameID := xcb_generate_id (connection);

        -- See what name the app is trying to use. Try these until we find one.
        if setup.ewmh /= null then
            title := util.getStringProperty(connection, window, setup.ewmh.u_NET_WM_NAME);
        end if;

        if Length(title) = 0 then
            title := util.getStringProperty(connection, window, XCB_ATOM_WM_NAME);
        end if;

        if Length(title) = 0 then
            title := util.getStringProperty(connection, window, XCB_ATOM_WM_COMMAND);
        end if;

        -- Setup frame attributes here. If we're using OpenGL then the background pixel
        -- won't matter.        
        frameCreateAttributes.background_pixel := FRAME_BG;
        frameCreateAttributes.border_pixel := FRAME_BORDER;
        frameCreateAttributes.event_mask :=
           XCB_EVENT_MASK_EXPOSURE or               -- window needs to be redrawn
           XCB_EVENT_MASK_STRUCTURE_NOTIFY or       -- frame is destroyed
           XCB_EVENT_MASK_SUBSTRUCTURE_REDIRECT or  -- app resizes itself
           XCB_EVENT_MASK_SUBSTRUCTURE_NOTIFY or    -- subwindows get notifications
           XCB_EVENT_MASK_BUTTON_PRESS or           -- if we get clicked or dragged,
           XCB_EVENT_MASK_BUTTON_RELEASE or         -- we need to know.
           XCB_EVENT_MASK_POINTER_MOTION or         -- for dragging
           XCB_EVENT_MASK_ENTER_WINDOW or           -- so we can change cursor for resize...
           XCB_EVENT_MASK_LEAVE_WINDOW;             -- ...and change it back.
        
        frameValueMask := XCB_CW_BACK_PIXEL or XCB_CW_BORDER_PIXEL or XCB_CW_EVENT_MASK;

        f.width  := Natural(geom.width) + 2 * FRAME_BORDER_WIDTH;
        f.height := Natural(geom.height + 2 * FRAME_BORDER_WIDTH + TITLEBAR_HEIGHT);

        -- Create actual frame window
        cookie :=
           xcb_create_window_aux(c              => connection, 
                                 depth          => XCB_COPY_FROM_PARENT, 
                                 wid            => f.frameID,
                                 parent         => screen.root, 
                                 x              => geom.x,
                                 y              => geom.y,
                                 width          => unsigned_short(f.width),
                                 height         => unsigned_short(f.height),
                                 border_width   => 0,   -- @TODO for development. We'll draw our own frames later.
                                 u_class        => xcb_window_class_t'Pos (XCB_WINDOW_CLASS_INPUT_OUTPUT), 
                                 visual         => rend.visualID,
                                 value_mask     => frameValueMask,
                                 value_list     => frameCreateAttributes'Access);


        -- we'll use the UTF-8 title if the app set one. we set the property on the frame
        -- so that we can just pull the property later for the title.
        if setup.ewmh /= null then
            cookie := xcb_change_property(connection, 
                                unsigned_char(xcb_prop_mode_t'Pos(XCB_PROP_MODE_REPLACE)),
                                f.frameID,
                                setup.ewmh.u_NET_WM_NAME,
                                XCB_ATOM_STRING,
                                8,
                                unsigned(Length(title)),
                                To_String(title)'Address);
        else
            cookie := xcb_change_property(connection,
                                unsigned_char(xcb_prop_mode_t'Pos(XCB_PROP_MODE_REPLACE)),
                                f.frameID,
                                XCB_ATOM_WM_NAME,
                                XCB_ATOM_STRING,
                                8,
                                unsigned(Length(title)),
                                To_String(title)'Address);
        end if;

        cookie := xcb_reparent_window (c      => connection, 
                                       window => window,
                                       parent => f.frameID,
                                       x      => FRAME_BORDER_WIDTH,
                                       y      => FRAME_BORDER_WIDTH + TITLEBAR_HEIGHT);

        -- Must map window prior to glXMakeContextCurrent
        cookie := xcb_map_window (c => connection, window => f.frameID);
        cookie := xcb_map_window (c => connection, window => window);

        f.surface.renderer := rend;
        f.connection := connection;
        f.appWindow := window;
        f.title := title;

        -- If using OpenGL renderer, create GLX window here out of our mapped window
        if rend.kind = render.OPENGL then
            f.surface := createOpenGLSurface(f => f, rend => rend);
        else
            f.surface := createSoftwareSurface(f => f, rend => rend);
        end if;

        -- Add this new frame to our map
        allFrames.Include(window, f);
        result := xcb_flush (connection);

        Ada.Text_IO.Put_Line ("Framed window" & window'Image & " with parent" & f.frameID'Image);
        return f;
    end frameWindow;

    ---------------------------------------------------------------------------
    -- unFrameWindow
    ---------------------------------------------------------------------------
    procedure unFrameWindow(f : Frame) is
        cookie : xcb.xcb_void_cookie_t;
    begin
        Ada.Text_IO.Put_Line("Unframe Window");
        -- @TODO cleanup the GLX context, etc.
        allFrames.Delete(f.appWindow);
    end unFrameWindow;

    ---------------------------------------------------------------------------
    -- isFrame
    -- Linear search through the list of frames to see if this X11 window is a
    --  frame
    ---------------------------------------------------------------------------
    function isFrame(frameID : xproto.xcb_window_t) return Boolean
    is
        use FrameMap;
        f : Frame;
    begin
        for C in allFrames.Iterate loop
            f := Element (C);
            if f.frameID = frameID then return True; end if;
        end loop;

        return False;
    end isFrame;

    ---------------------------------------------------------------------------
    -- getFrameFromList
    -- Linear search through the map of frames to get the Frame object
    --  corresponding to this X11 ID if it exists.
    ---------------------------------------------------------------------------
    function getFrameFromList(frameID : xproto.xcb_window_t) return Frame
    is
        use FrameMap;
        f : Frame;
    begin
        for C in allFrames.Iterate loop
            f := Element (C);
            if f.frameID = frameID then return f; end if;
        end loop;

        raise Program_Error with "Attempted to retrieve non-existent Frame from list";
    end getFrameFromList;

    ---------------------------------------------------------------------------
    -- hasFrame
    -- Fast search through the map of frames to see if this X11 window already
    --  has a frame.
    ---------------------------------------------------------------------------
    function hasFrame(windowID : xproto.xcb_window_t) return Boolean
    is
    begin
        return allFrames.Contains(windowID);
    end hasFrame;

    ---------------------------------------------------------------------------
    -- getWindowFrame
    ---------------------------------------------------------------------------
    function getFrameOfWindow(windowID : xproto.xcb_window_t) return Frame
    is
    begin
        return allFrames(windowID);
    end getFrameOfWindow;

end frames;