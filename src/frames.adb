with Ada.Containers.Indefinite_Hashed_Maps;
with Ada.Containers; use Ada.Containers;
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

package body Frames is

    package RUtil renames Render.Util;

    FRAME_BG             : constant := 16#1F2430_FF#;
    FRAME_BG_FOCUSED     : constant := 16#707A8C_FF#;
    FRAME_BORDER         : constant := 16#101521_FF#;
    FRAME_BORDER_FOCUSED : constant := 16#707A8C_FF#;

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

    FRAME_BG_GL                    : RUtil.DecorationColor := RUtil.rgbaToGLColor (FRAME_BG);
    FRAME_BG_GL_FOCUSED            : RUtil.DecorationColor := RUtil.rgbaToGLColor (FRAME_BG_FOCUSED);
    FRAME_BORDER_GL                : RUtil.DecorationColor := RUtil.rgbaToGLColor (FRAME_BORDER);
    FRAME_BORDER_GL_FOCUSED        : RUtil.DecorationColor := RUtil.rgbaToGLColor (FRAME_BORDER_FOCUSED);

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
    -- Call xcb_map_window on this frame's window and child if appropriate.
    -- Go ahead and give the newly-mapped window the focus as well.
    ---------------------------------------------------------------------------
    procedure map(f : Frame) is
        cookie : xcb.xcb_void_cookie_t;
    begin
        cookie := xcb_map_window (c      => f.connection, 
                                  window => f.frameID);

        cookie := xcb_map_window (c      => f.connection,
                                  window => f.appWindow);

        focus(f.frameID);
    end map;

    ---------------------------------------------------------------------------
    -- draw
    -- Render the decorations, buttons, etc. for this frame.
    ---------------------------------------------------------------------------
    procedure draw (f : Frame) is
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

            if f.focused then
                --Ada.Text_IO.Put_Line ("Drawing focused window");
                GL.glClearColor (red   => FRAME_BG_GL_FOCUSED.r,
                                 green => FRAME_BG_GL_FOCUSED.g,
                                 blue  => FRAME_BG_GL_FOCUSED.b,
                                 alpha => FRAME_BG_GL_FOCUSED.a);
            else
                --Ada.Text_IO.Put_Line ("Drawing un-focused window");
                GL.glClearColor (red   => FRAME_BG_GL.r,
                                 green => FRAME_BG_GL.g,
                                 blue  => FRAME_BG_GL.b,
                                 alpha => FRAME_BG_GL.a);
            end if;

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
    end draw;

    ---------------------------------------------------------------------------
    -- createOpenGLSurface
    ---------------------------------------------------------------------------
    function createOpenGLSurface (f    : Frame;
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
    function createSoftwareSurface (f    : Frame;
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
    function frameWindow (connection : access xcb.xcb_connection_t;
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
        appAttributes         : aliased xcb_change_window_attributes_value_list_t;

        frameValueMask : Interfaces.C.unsigned;
    begin
        -- Get information about app window
        geom   := Util.getWindowGeometry (connection, window);

        -- get the first screen
        screen := xcb_setup_roots_iterator (xcb_get_setup (connection)).data;

        -- Create new parent window for frame
        f.frameID := xcb_generate_id (connection);

        -- See what name the app is trying to use. Try these until we find one.
        if setup.ewmh /= null then
            title := Util.getStringProperty (connection, window, setup.ewmh.u_NET_WM_NAME);
        end if;

        if Length(title) = 0 then
            title := Util.getStringProperty (connection, window, XCB_ATOM_WM_NAME);
        end if;

        if Length(title) = 0 then
            title := Util.getStringProperty (connection, window, XCB_ATOM_WM_COMMAND);
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
           xcb_create_window_aux (c            => connection, 
                                  depth        => XCB_COPY_FROM_PARENT, 
                                  wid          => f.frameID,
                                  parent       => screen.root, 
                                  x            => geom.x,
                                  y            => geom.y,
                                  width        => unsigned_short(f.width),
                                  height       => unsigned_short(f.height),
                                  border_width => 0,   -- @TODO for development. We'll draw our own frames later.
                                  u_class      => xcb_window_class_t'Pos (XCB_WINDOW_CLASS_INPUT_OUTPUT), 
                                  visual       => rend.visualID,
                                  value_mask   => frameValueMask,
                                  value_list   => frameCreateAttributes'Access);


        -- we'll use the UTF-8 title if the app set one. we set the property on the frame
        -- so that we can just pull the property later for the title.
        if setup.ewmh /= null then
            cookie := xcb_change_property (c        => connection, 
                                           mode     => unsigned_char(xcb_prop_mode_t'Pos(XCB_PROP_MODE_REPLACE)),
                                           window   => f.frameID,
                                           property => setup.ewmh.u_NET_WM_NAME,
                                           c_type   => XCB_ATOM_STRING,
                                           format   => 8,
                                           data_len => unsigned(Length(title)),
                                           data     => To_String(title)'Address);
        else
            cookie := xcb_change_property (c        => connection,
                                           mode     => unsigned_char(xcb_prop_mode_t'Pos(XCB_PROP_MODE_REPLACE)),
                                           window   => f.frameID,
                                           property => XCB_ATOM_WM_NAME,
                                           c_type   => XCB_ATOM_STRING,
                                           format   => 8,
                                           data_len => unsigned(Length(title)),
                                           data     => To_String(title)'Address);
        end if;

        -- Grab button presses so we can raise window to the top.
        cookie := xcb_grab_button (c             => connection,
                                   owner_events  => 0,
                                   grab_window   => window, 
                                   event_mask    => unsigned_short(XCB_EVENT_MASK_BUTTON_PRESS), 
                                   pointer_mode  => unsigned_char(xcb_grab_mode_t'Pos(XCB_GRAB_MODE_SYNC)),
                                   keyboard_mode => unsigned_char(xcb_grab_mode_t'Pos(XCB_GRAB_MODE_ASYNC)),
                                   confine_to    => XCB_NONE,
                                   cursor        => XCB_NONE,
                                   button        => 1,
                                   modifiers     => unsigned_short(XCB_MOD_MASK_ANY));
        -- appAttributes.event_mask := XCB_EVENT_MASK_BUTTON_PRESS;
        -- cookie := xcb_change_window_attributes_aux (c           => connection,
        --                                             window      => window,
        --                                             value_mask  => XCB_CW_EVENT_MASK,
        --                                             value_list  => appAttributes'Access);

        cookie := xcb_reparent_window (c      => connection, 
                                       window => window,
                                       parent => f.frameID,
                                       x      => FRAME_BORDER_WIDTH,
                                       y      => FRAME_BORDER_WIDTH + TITLEBAR_HEIGHT);

        -- Must map window prior to glXMakeContextCurrent
        cookie := xcb_map_window (c => connection, window => f.frameID);
        cookie := xcb_map_window (c => connection, window => window);

        f.surface.renderer  := rend;
        f.connection        := connection;
        f.appWindow         := window;
        f.title             := title;
        f.focused           := False;
        f.grabbed           := True;

        -- If using OpenGL renderer, create GLX window here out of our mapped window
        if rend.kind = render.OPENGL then
            f.surface := createOpenGLSurface (f => f, rend => rend);
        else
            f.surface := createSoftwareSurface (f => f, rend => rend);
        end if;

        -- Add this new frame to our map
        allFrames.Include (window, f);
        result := xcb_flush (connection);

        Ada.Text_IO.Put_Line ("Framed window" & window'Image & " with parent" & f.frameID'Image);
        return f;
    end frameWindow;

    ---------------------------------------------------------------------------
    -- unFrameWindow
    ---------------------------------------------------------------------------
    procedure unFrameWindow (f : Frame) is
        cookie : xcb.xcb_void_cookie_t;
    begin
        Ada.Text_IO.Put_Line ("Unframe Window");
        -- @TODO cleanup the GLX context, etc.
        allFrames.Delete (f.appWindow);
    end unFrameWindow;

    ---------------------------------------------------------------------------
    -- Focus
    -- Set the focused property of the Frame with a given frameID to True, set
    -- all other frames to False. This is extra work but ensures correctness,
    -- in that only one frame will have the focus at a given time.
    --
    -- This ungrabs the inputs for the focused frame, and re-grabs inputs for
    -- the unfocused frames.
    ---------------------------------------------------------------------------
    procedure focus (frameID : xproto.xcb_window_t)
    is
        use FrameMap;
        use xcb;
        use xproto;

        cookie : xcb_void_cookie_t;
        ignore : Interfaces.C.int;

        -- Raise window to top of stack
        procedure raiseToTop (connection : access xcb_connection_t; win : xcb_window_t) is
            winAttr : aliased xcb_configure_window_value_list_t;
            cookie  : xcb_void_cookie_t;
            ignore  : Interfaces.C.int;
        begin
            winAttr.stack_mode := xcb_stack_mode_t'Pos (XCB_STACK_MODE_ABOVE);

            cookie := xcb_configure_window_aux (c          => connection, 
                                                window     => win,
                                                value_mask => unsigned_short (XCB_CONFIG_WINDOW_STACK_MODE),
                                                value_list => winAttr'Access);

        end raiseToTop;
    begin
        -- Unfocus all frames first. This ensures only one frame has the focus at a time.
        unfocusAll;

        for f of allFrames loop
            if f.frameID = frameID then 
                f.focused := True;

                -- Now that we focused it, we can ungrab the pointer to allow app to get events
                cookie := xcb_ungrab_button (c          => f.connection,
                                            button      => 1,
                                            grab_window => f.appWindow,
                                            modifiers   => unsigned_short(XCB_MOD_MASK_ANY));

                -- Send the last click to the app
                cookie := xcb_allow_events (c    => f.connection,
                                            mode => unsigned_char(xcb_allow_t'Pos(XCB_ALLOW_REPLAY_POINTER)),
                                            time => XCB_CURRENT_TIME);

                -- Give the app the input focus now.
                cookie := xcb_set_input_focus(c           => f.connection,
                                              revert_to   => xcb_input_focus_t'Pos(XCB_INPUT_FOCUS_POINTER_ROOT),
                                              focus       => f.appWindow,
                                              time        => XCB_CURRENT_TIME);

                f.grabbed := False;
                
                raiseToTop (f.connection, frameID);
                f.draw; -- might be able to skip this re-draw since raiseToTop should trigger
                        -- an expose event.

                ignore := xcb_flush (f.connection);

                return;
            end if;
        end loop;
    end focus;

    ---------------------------------------------------------------------------
    -- unfocusAll
    -- Remove the focus from all frames in our map, making them grab mouse
    -- inputs as well.
    ---------------------------------------------------------------------------
    procedure unfocusAll is
        use xcb;
        use xproto;

        cookie : xcb_void_cookie_t;
    begin
        for f of allFrames loop
            -- Skip if already unfocused to avoid re-draw
            if f.focused = True then
                f.focused := False;
                
                -- @TODO Might be able to skip this check too
                if f.grabbed = False then
                    cookie := xcb_grab_button (c             => f.connection,
                                            owner_events  => 0,
                                            grab_window   => f.appWindow,
                                            event_mask    => unsigned_short(XCB_EVENT_MASK_BUTTON_PRESS), 
                                            pointer_mode  => unsigned_char(xcb_grab_mode_t'Pos(XCB_GRAB_MODE_SYNC)),
                                            keyboard_mode => unsigned_char(xcb_grab_mode_t'Pos(XCB_GRAB_MODE_ASYNC)),
                                            confine_to    => XCB_NONE,
                                            cursor        => XCB_NONE,
                                            button        => 1,
                                            modifiers     => unsigned_short(XCB_MOD_MASK_ANY));
                    f.grabbed := True;
                end if;

                -- re-draw
                f.draw;
            end if;
        end loop;
    end unfocusAll;

    ---------------------------------------------------------------------------
    -- isFrame
    -- Linear search through the list of frames to see if this X11 window is a
    --  frame
    ---------------------------------------------------------------------------
    function isFrame (frameID : xproto.xcb_window_t) return Boolean
    is
        use FrameMap;
    begin
        for C in allFrames.Iterate loop
            if allFrames(C).frameID = frameID then 
                return True;
            end if;
        end loop;

        return False;
    end isFrame;

    ---------------------------------------------------------------------------
    -- getFrameFromList
    -- Linear search through the map of frames to get the Frame object
    --  corresponding to this X11 ID if it exists.
    -- NOTE: I believe this makes a _copy_ of the element, not sure.
    ---------------------------------------------------------------------------
    function getFrameFromList (frameID : xproto.xcb_window_t) return Frame
    is
        use FrameMap;
    begin
        for C in allFrames.Iterate loop
            if allFrames(C).frameID = frameID then 
                return allFrames(C);
            end if;
        end loop;

        raise Program_Error with "Attempted to retrieve non-existent Frame from list";
    end getFrameFromList;

    ---------------------------------------------------------------------------
    -- hasFrame
    -- Fast search through the map of frames to see if this X11 window already
    --  has a frame.
    ---------------------------------------------------------------------------
    function hasFrame (windowID : xproto.xcb_window_t) return Boolean
    is
    begin
        return allFrames.Contains (windowID);
    end hasFrame;

    ---------------------------------------------------------------------------
    -- getWindowFrame
    -- NOTE: I believe this makes a _copy_ of the element, not sure.
    ---------------------------------------------------------------------------
    function getFrameOfWindow (windowID : xproto.xcb_window_t) return Frame
    is
        use FrameMap;
    begin
        return allFrames(windowID);
    end getFrameOfWindow;

end frames;