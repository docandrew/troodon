with Ada.Calendar;
with Ada.Text_IO;
with Ada.Streams.Stream_IO;
with Ada.Unchecked_Deallocation;
with Interfaces.C; use Interfaces.C;
with System;

with bits_types_h;
with xcb; use xcb;
with xproto; use xproto;
with GID;
with GL;
with GLext;
with GLX;
with X11;

with Render;
with Render.Shaders;
with Render.Util;
with Setup;
with Util;

package body Desktop is

    dtWindow    : xcb_window_t;
    dtGLXWindow : GLX.GLXWindow;
    dtDrawable  : GLX.GLXDrawable;

    type ByteArray is array (Integer range <>) of aliased Interfaces.Unsigned_8;
    type ByteArrayPtr is access ByteArray;
    procedure free is new Ada.Unchecked_Deallocation(ByteArray, ByteArrayPtr);
    wallpaper : ByteArrayPtr;
    wallpaperW : Natural;
    wallpaperH : Natural;

    -- Screen information (@TODO - screen(s) information)
    screenW : Natural;
    screenH : Natural;

    -- Framebuffer object we'll draw the wallpaper on.
    fbo : aliased GL.GLuint;

    -- Texture to hold the wallpaper
    tex : aliased GL.GLuint;

    ---------------------------------------------------------------------------
    -- getWindow
    ---------------------------------------------------------------------------
    function getWindow return xproto.xcb_window_t is
    begin
        return dtWindow;
    end getWindow;

    ---------------------------------------------------------------------------
    -- changeWallpaper
    ---------------------------------------------------------------------------
    procedure changeWallpaper (c    : access xcb_connection_t;
                               rend : Render.Renderer;
                               filename : String) is
        -- cookie : xcb_void_cookie_t;
        -- error  : access xcb_generic_error_t;

        file   : Ada.Streams.Stream_IO.File_Type;
        stream : Ada.Streams.Stream_IO.Stream_Access;

        image  : GID.Image_descriptor;

        -- Procedure to load byte array with image contents
        -- 
        procedure loadImage (image      : in out GID.Image_descriptor;
                             buffer     : in out ByteArrayPtr) is
            
            subtype Primary_color_range is Interfaces.Unsigned_8;
            
            ignore : Ada.Calendar.Day_Duration;
            width  : constant Positive := GID.Pixel_width (image);
            height : constant Positive := GID.Pixel_height (image);
            idx    : Natural;
            bpp    : constant := 3;    -- bytes per pixel

            -- Set draw location
            procedure Set_X_Y (x, y: Natural) is
            begin
                idx := bpp * (x + width * (height - 1 - y));
            end Set_X_Y;

            -- Set pixel color
            procedure Put_Pixel (red, green, blue : Primary_color_range;
                                 alpha : Primary_color_range) is
            begin
                --@note if we support other bpps here we need to change this line.
                buffer(idx..idx+2) := (red, green, blue);
                idx := idx + bpp;
            end Put_pixel;

            -- Feedback (ignored here)
            procedure Feedback (percents : Natural) is
            begin
                Ada.Text_IO.Put_Line ("Reading file: " & percents'Image & "%");
            end Feedback;

            -- Instantiation of GID template
            procedure GID_load_image is new GID.Load_image_contents 
                (Primary_color_range, Set_X_Y, Put_Pixel, Feedback, GID.nice);
        begin
            free (buffer);
            buffer := new ByteArray(0..(bpp * width * height - 1));

            GID_load_image (image, ignore);
        end loadImage;

    begin

        -- Get image header from GID, so we know how big to make our wallpaper pixmap
        Ada.Streams.Stream_IO.Open (File => file, 
                                    Mode => Ada.Streams.Stream_IO.In_File,
                                    Name => filename);

        stream := Ada.Streams.Stream_IO.Stream (file);

        GID.Load_image_header (image => image, from => stream.all);
        wallpaperW := GID.Pixel_width (image);
        wallpaperH := GID.Pixel_height (image);

        Ada.Text_IO.Put_Line ("Troodon: (Desktop) Loading wallpaper " & filename & "size:" & wallpaperW'Image & " x" & wallpaperH'Image);
        
        loadImage (image, wallpaper);

        Ada.Streams.Stream_IO.Close (file);

        draw (rend);
    end changeWallpaper;

    ---------------------------------------------------------------------------
    -- draw
    ---------------------------------------------------------------------------
    procedure draw (rend : Render.Renderer) is
        glxRet : Interfaces.C.int;
        orthoM : Render.Util.Mat4;

        -- Destination quad to render desktop to.
        dest   : Render.Util.Box;
    begin
        glxRet := GLX.glXMakeContextCurrent (dpy       => rend.display,
                                             draw      => dtDrawable,
                                             read      => dtDrawable,
                                             ctx       => rend.context);

        GLext.glUseProgram (Render.Shaders.winShaderProg);

        GL.glActiveTexture (GL.GL_TEXTURE0);
        GL.glGenTextures (1, tex'Access);
        GL.glBindTexture (GL.GL_TEXTURE_2D, tex);
        
        -- Load wallpaper bytes into our texture (and hence the framebuffer)
        -- @TODO perform scaling, tiling, etc. if the sizes don't match.
        GL.glTexImage2D (target          => GL.GL_TEXTURE_2D,
                         level           => 0,
                         internalFormat  => GL.GL_RGB,
                         width           => Interfaces.C.int(wallpaperW),
                         height          => Interfaces.C.int(wallpaperH),
                         border          => 0,
                         format          => GL.GL_RGB,
                         c_type          => GL.GL_UNSIGNED_BYTE,
                         pixels          => wallpaper(0)'Address);

        GL.glTexParameteri (target => GL.GL_TEXTURE_2D,
                            pname  => GL.GL_TEXTURE_MIN_FILTER,
                            param  => GL.GL_LINEAR);

        GL.glTexParameteri (target => GL.GL_TEXTURE_2D,
                            pname  => GL.GL_TEXTURE_MAG_FILTER,
                            param  => GL.GL_LINEAR);

        GL.glClearColor (red   => 0.7,
                         green => 0.0,
                         blue  => 0.7,
                         alpha => 1.0);

        GL.glClear (GL.GL_COLOR_BUFFER_BIT);

        -- Set up viewport, projection, uniforms
        GL.glViewport (x      => 0,
                       y      => 0,
                       width  => Interfaces.C.int(screenW),
                       height => Interfaces.C.int(screenH));

        orthoM := Render.Util.ortho (0.0, Float(screenW), Float(screenH), 0.0, -1.0, 1.0);

        GLext.glUniformMatrix4fv (location  => Render.Shaders.winUniformOrtho,
                                  count     => 1,
                                  transpose => GL.GL_TRUE,
                                  value     => orthoM(1)'Access);

        GLext.glUniform1f (location => Render.Shaders.winUniformAlpha,
                           v0       => 1.0);

        -- Set up attribs
        GLext.glGenBuffers (1, Render.Shaders.winVBO'Access);
        GLext.glEnableVertexAttribArray (GL.GLuint(Render.Shaders.winAttribCoord));
        GLext.glBindBuffer (target => GLext.GL_ARRAY_BUFFER,
                            buffer => Render.Shaders.winVBO);

        GLext.glVertexAttribPointer (index      => GL.GLuint(Render.Shaders.winAttribCoord),
                                     size       => 4,
                                     c_type     => GL.GL_FLOAT,
                                     normalized => GL.GL_FALSE,
                                     stride     => 0,
                                     pointer    => System.Null_Address);

        -- Quad coords
        dest := (
            1 => (0.0,            Float(screenH), 0.0, 1.0),   -- Bottom left
            2 => (0.0,            0.0,            0.0, 0.0),   -- Top left
            3 => (Float(screenW), Float(screenH), 1.0, 1.0),   -- Bottom right
            4 => (Float(screenW), 0.0,            1.0, 0.0)    -- Top right
        );

        GLext.glBufferData (target => GLext.GL_ARRAY_BUFFER,
                            size   => dest'Size / 8,
                            data   => dest'Address,
                            usage  => GLext.GL_DYNAMIC_DRAW);

        GL.glDrawArrays (mode  => GL.GL_TRIANGLE_STRIP,
                         first => 0,
                         count => Interfaces.C.int(dest'Last));

        GLX.glXSwapBuffers (rend.display, dtDrawable);

        GL.glDeleteTextures (1, tex'Access);
        GLext.glDisableVertexAttribArray (GL.GLuint(Render.Shaders.winAttribCoord));
        
        GLext.glUseProgram (0);

    end draw;

    ---------------------------------------------------------------------------
    -- initFramebuffer
    --
    -- To draw the wallpaper we perform a framebuffer blit. This sets that up.
    ---------------------------------------------------------------------------
    -- procedure initFramebuffer (c        : access xcb_connection_t; 
    --                            rend     : Render.Renderer) is
    -- begin
    --     -- Reserve storage ahead of time for this texture.
    --     -- GL.glTexImage2D (target         => GL.GL_TEXTURE_2D,
    --     --                  level          => 0,
    --     --                  internalFormat => GL.GL_RGB8,          -- alpha doesn't really make sense here.
    --     --                  width          => screenW,
    --     --                  height         => screenH,
    --     --                  border         => 0,
    --     --                  format         => GL.GL_RGB8,
    --     --                  c_type         => GL.GL_UNSIGNED_BYTE,
    --     --                  pixels         => System.Null_Address);


    -- end initFramebuffer;

    ---------------------------------------------------------------------------
    -- @TODO
    -- query randr for displays
    -- for each display, create a window of the size of that display
    -- eventually make a nice way to get wallpapers aligned
    ---------------------------------------------------------------------------
    procedure initDesktop (c    : access xcb_connection_t;
                           rend : Render.Renderer) is
        
        screen           : access xcb_screen_t;
        geom             : xcb_get_geometry_reply_t;
        cookie           : xcb_void_cookie_t;
        error            : access xcb_generic_error_t;
        desktopAttr      : aliased xcb_create_window_value_list_t;
        desktopValueMask : Interfaces.C.unsigned;

        wmType      : xcb_atom_t;
        glxRet      : Interfaces.C.int;

        junkpix     : xcb_pixmap_t;
        junkpixGLX  : GLX.GLXPixmap;
    begin
        screen := xcb_setup_roots_iterator (xcb_get_setup (c)).data;
        geom := Util.getWindowGeometry (c, screen.root);

        dtWindow := xcb_generate_id (c);

        Ada.Text_IO.Put_Line ("Troodon: (Desktop) Creating new window with id" & dtWindow'Image);

        desktopAttr.background_pixel := 0;
        desktopAttr.border_pixel := 0;
        desktopAttr.colormap := rend.colormap;
        desktopAttr.event_mask := XCB_EVENT_MASK_EXPOSURE or
                                  XCB_EVENT_MASK_BUTTON_PRESS or
                                  XCB_EVENT_MASK_BUTTON_RELEASE;
        
        desktopValueMask := XCB_CW_BACK_PIXEL or
                            XCB_CW_BORDER_PIXEL or
                            XCB_CW_COLORMAP or
                            XCB_CW_EVENT_MASK;

        -- Save screen info for later. In the event that additional monitors are detected,
        -- plugged in, etc. we'll want to update this.
        screenW := Natural(geom.width);
        screenH := Natural(geom.height);

        cookie :=
            xcb_create_window_aux (c              => c,
                                   depth          => 32,
                                   wid            => dtWindow,
                                   parent         => screen.root,
                                   x              => 0,
                                   y              => 0,
                                   width          => geom.width, 
                                   height         => geom.height,
                                   border_width   => 0,
                                   u_class        => xcb_window_class_t'Pos (XCB_WINDOW_CLASS_INPUT_OUTPUT),
                                   visual         => rend.visualID,
                                   value_mask     => desktopValueMask,
                                   value_list     => desktopAttr'Access);

        if setup.ewmh /= null then
            wmType := Setup.ewmh.u_NET_WM_WINDOW_TYPE_DESKTOP;
            Ada.Text_IO.Put_Line ("Troodon: (Desktop) Setting window type to desktop");
            cookie := xcb_change_property(c        => c,
                                          mode     => unsigned_char(xcb_prop_mode_t'Pos(XCB_PROP_MODE_REPLACE)),
                                          window   => dtWindow,
                                          property => setup.ewmh.u_NET_WM_WINDOW_TYPE,
                                          c_type   => XCB_ATOM_ATOM,
                                          format   => 8,
                                          data_len => xcb_atom_t'Size / 8,
                                          data     => wmType'Address);
        end if;

        Ada.Text_IO.Put_Line ("Troodon: (Desktop) Mapping window");

        cookie := xcb_map_window_checked (c, dtWindow);

        error := xcb_request_check (c, cookie);

        if error /= null then
            Ada.Text_IO.Put_Line ("Troodon: (Desktop) Unable to map desktop window, error:" & error.error_code'Image);
        end if;

        Ada.Text_IO.Put_Line ("Troodon: (Desktop) Creating OpenGL drawable");

        dtGLXWindow := GLX.glXCreateWindow (dpy        => rend.display,
                                            config     => rend.fbConfig,
                                            win        => Interfaces.C.unsigned_long(dtWindow),
                                            attribList => null);

        Ada.Text_IO.Put_Line ("Troodon: (Desktop) Created OpenGL drawable with id:" & dtGLXWindow'Image);
        
        dtDrawable  := GLX.GLXDrawable(dtWindow);
        
        -- The only _real_ reason to do this here is because we'd like to initShaders, and
        -- need a drawable and current context to do so.
        glxRet := GLX.glXMakeContextCurrent (dpy       => rend.display,
                                             draw      => dtDrawable,
                                             read      => dtDrawable,
                                             ctx       => rend.context);

        if glxRet = 0 then
            raise DesktopException with "Troodon: (Desktop) Failed to make GLX context current";
        end if;

    end initDesktop;

    ---------------------------------------------------------------------------
    -- teardownDesktop
    ---------------------------------------------------------------------------
    procedure teardownDesktop (c : access xcb_connection_t; rend : Render.Renderer) is
        cookie : xcb_void_cookie_t;
        error  : access xcb_generic_error_t;
    begin
        GLX.glXDestroyWindow (rend.display, GLX.GLXWindow(dtDrawable));
        
        cookie := xcb_destroy_window_checked (c, dtWindow);

        error := xcb_request_check (c, cookie);

        if error /= null then
            Ada.Text_IO.Put_Line ("Troodon: (Desktop) Error destroying desktop window, error:" & error.error_code'Image);
        end if;

    end teardownDesktop;
end Desktop;