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
with GLX;
with X11;

with Render;
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

    -- wallpaper   : xcb_pixmap_t := 0;
    -- wallpaperGC : xcb_gcontext_t;

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
    procedure changeWallpaper (c : access xcb_connection_t; filename : String) is
        cookie : xcb_void_cookie_t;
        error  : access xcb_generic_error_t;

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
                null;
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
        -- Generate a new pixmap and graphics context for it, freeing the old
        -- one first, if necessary
        -- if wallpaper /= 0 then
        --     cookie := xcb_free_pixmap (c, wallpaper);
        --     cookie := xcb_free_gc (c, wallpaperGC);
        -- end if;

        -- wallpaper   := xcb_generate_id (c);
        -- wallpaperGC := xcb_generate_id (c);

        -- Ada.Text_IO.Put_Line ("Troodon: (Desktop) Creating new pixmap for wallpaper");
        -- cookie := xcb_create_pixmap_checked (c        => c,
        --                                      depth    => 24,
        --                                      pid      => wallpaper,
        --                                      drawable => dtWindow,
        --                                      width    => unsigned_short(GID.Pixel_width (image)),
        --                                      height   => unsigned_short(GID.Pixel_height (image)));

        -- error := xcb_request_check (c, cookie);
        -- if error /= null then
        --     Ada.Text_IO.Put_Line ("Troodon: (Desktop) Error creating pixmap: " & error.error_code'Image);
        -- end if;

        -- Ada.Text_IO.Put_Line ("Troodon: (Desktop) Creating new gc for wallpaper");
        -- cookie := xcb_create_gc_checked (c          => c,
        --                                  cid        => wallpaperGC,
        --                                  drawable   => xcb_drawable_t(wallpaper),
        --                                  value_mask => 0,
        --                                  value_list => System.Null_Address);

        -- error := xcb_request_check (c, cookie);
        -- if error /= null then
        --     Ada.Text_IO.Put_Line ("Troodon: (Desktop) Error creating gc: " & error.error_code'Image);
        -- end if;

        -- Load image into the pixmap we just created

            -- -- Blit the bytes into our pixmap. 
            -- -- @Note that for huge wallpapers we would need to split this up into multiple calls.
            -- -- Consider using SHM here.
            -- cookie := xcb_put_image_checked (c          => c,
            --                                  format     => xcb_image_format_t'Pos(XCB_IMAGE_FORMAT_Z_PIXMAP),
            --                                  drawable   => wallpaper,
            --                                  gc         => wallpaperGC,
            --                                  width      => unsigned_short(GID.Pixel_width (image)),
            --                                  height     => unsigned_short(GID.Pixel_height (image)),
            --                                  dst_x      => 0,
            --                                  dst_y      => 0,
            --                                  left_pad   => 0,
            --                                  depth      => 24,
            --                                  data_len   => bytes'Length,
            --                                  data       => bytes(0)'Access);

            -- error := xcb_request_check (c, cookie);
            -- if error /= null then
            --     Ada.Text_IO.Put_Line ("Troodon: (Desktop) Error in xcb_put_image: " & error.error_code'Image);
            -- end if;


        -- Copy it to the window for now, later we'll want to use the GLX context probably.
        -- Also will need to consider transformations depending on actual wallpaper size.
        -- cookie := xcb_copy_area_checked (c              => c,
        --                                  src_drawable   => wallpaper,
        --                                  dst_drawable   => dtWindow,
        --                                  gc             => wallpaperGC,
        --                                  src_x          => 0,
        --                                  src_y          => 0,
        --                                  dst_x          => 0,
        --                                  dst_y          => 0,
        --                                  width          => unsigned_short(GID.Pixel_width (image)),
        --                                  height         => unsigned_short(GID.Pixel_height (image)));
        
        -- error := xcb_request_check (c, cookie);
        -- if error /= null then
        --     Ada.Text_IO.Put_Line ("Troodon: (Desktop) Error copying wallpaper to desktop window: " & error.error_code'Image);
        -- end if;
    end changeWallpaper;

    ---------------------------------------------------------------------------
    -- draw LEFT OFF HERE
    ---------------------------------------------------------------------------
    procedure draw is
    begin
        -- create texture from wallpaper bytes
        -- use win shader program w/ screen dimensions ortho
        -- glx swap buffers
        null;

    end draw;

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

        Ada.Text_IO.Put_Line ("Troodon: (Desktop) Creating OpenGL drawable");

        -- Dirty hack real quick to get us a drawable but use the X11 context for now
        -- EXPERIMENT
        -- junkpix := xcb_generate_id (c);
        -- cookie := xcb_create_pixmap (c          => c,
        --                              depth      => 32, 
        --                              pid        => junkpix, 
        --                              drawable   => dtWindow, 
        --                              width      => 16, 
        --                              height     => 16);
        -- junkpixGLX := GLX.glXCreatePixmap (dpy => rend.display,
        --                                    config => rend.fbConfig,
        --                                    the_pixmap => X11.Pixmap(junkpix),
        --                                    attribList => null);

        dtGLXWindow := GLX.glXCreateWindow (dpy        => rend.display,
                                            config     => rend.fbConfig,
                                            win        => Interfaces.C.unsigned_long(dtWindow),
                                            attribList => null);

        Ada.Text_IO.Put_Line ("Troodon: (Desktop) Created OpenGL drawable with id:" & dtGLXWindow'Image);
        
        dtDrawable  := GLX.GLXDrawable(dtGLXWindow);
        
        glxRet := GLX.glXMakeContextCurrent (dpy       => rend.display,
                                             draw      => dtDrawable,
                                             read      => dtDrawable,
                                             ctx       => rend.context);

        if glxRet = 0 then
            raise DesktopException with "Troodon: (Desktop) Failed to make GLX context current";
        end if;

    end initDesktop;
end Desktop;