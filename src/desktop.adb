with Ada.Text_IO;
with Interfaces.C; use Interfaces.C;

with xcb; use xcb;
with xproto; use xproto;
with GLX;

with Render;
with Setup;
with Util;

package body Desktop is

    dtWindow    : xcb_window_t;
    dtGLXWindow : GLX.GLXWindow;
    dtDrawable  : GLX.GLXDrawable;

    ---------------------------------------------------------------------------
    -- @TODO
    -- query randr for displays
    -- for each display, create a window of the size of that display
    -- eventually make a nice way to get wallpapers aligned
    ---------------------------------------------------------------------------
    procedure initDesktop (c    : access xcb_connection_t;
                           rend : Render.Renderer) is
        
        win         : xcb_window_t;
        screen      : access xcb_screen_t;
        geom        : xcb_get_geometry_reply_t;
        cookie      : xcb_void_cookie_t;
        desktopAttr : aliased xcb_create_window_value_list_t;

        wmType      : xcb_atom_t;
        glxRet      : Interfaces.C.int;
    begin
        screen := xcb_setup_roots_iterator (xcb_get_setup (c)).data;
        geom := Util.getWindowGeometry (c, screen.root);

        win := xcb_generate_id (c);

        Ada.Text_IO.Put_Line ("Troodon: (desktop) Creating new window with id" & win'Image);

        desktopAttr.event_mask := XCB_EVENT_MASK_EXPOSURE or
                                  XCB_EVENT_MASK_BUTTON_PRESS or
                                  XCB_EVENT_MASK_BUTTON_RELEASE;

        cookie :=
            xcb_create_window_aux (c              => c,
                                   depth          => XCB_COPY_FROM_PARENT,
                                   wid            => win,
                                   parent         => screen.root,
                                   x              => 0,
                                   y              => 0,
                                   width          => geom.width, 
                                   height         => geom.height,
                                   border_width   => 0,
                                   u_class        => xcb_window_class_t'Pos (XCB_WINDOW_CLASS_INPUT_OUTPUT),
                                   visual         => screen.root_visual,
                                   value_mask     => XCB_CW_EVENT_MASK,
                                   value_list     => desktopAttr'Access);

        if setup.ewmh /= null then
            wmType := Setup.ewmh.u_NET_WM_WINDOW_TYPE_DESKTOP;
            Ada.Text_IO.Put_Line ("Troodon: (Desktop) Setting window type to desktop");
            cookie := xcb_change_property(c        => c,
                                          mode     => unsigned_char(xcb_prop_mode_t'Pos(XCB_PROP_MODE_REPLACE)),
                                          window   => win,
                                          property => setup.ewmh.u_NET_WM_WINDOW_TYPE,
                                          c_type   => XCB_ATOM_ATOM,
                                          format   => 8,
                                          data_len => xcb_atom_t'Size / 8,
                                          data     => wmType'Address);
        end if;

        Ada.Text_IO.Put_Line ("Troodon: (Desktop) Creating OpenGL drawable");

        dtGLXWindow := GLX.glXCreateWindow (dpy        => rend.display,
                                            config     => rend.fbConfig,
                                            win        => Interfaces.C.unsigned_long(win),
                                            attribList => null);
        
        dtDrawable  := GLX.GLXDrawable(win);

        glxRet := GLX.glXMakeContextCurrent (dpy       => rend.display,
                                             draw      => dtDrawable,
                                             read      => dtDrawable,
                                             ctx       => rend.context);

        if glxRet = 0 then
            raise DesktopException with "Troodon: (Desktop) Failed to make GLX context current";
        end if;

    end initDesktop;
end Desktop;