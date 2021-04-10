
with xcb; use xcb;
with xproto; use xproto;

with Render;

package Desktop is

    DesktopException : exception;


    ---------------------------------------------------------------------------
    -- getWindow
    -- Return the X11 window corresponding to the desktop, e.g. for drawing it.
    ---------------------------------------------------------------------------
    function getWindow return xproto.xcb_window_t;

    ---------------------------------------------------------------------------
    -- changeWallpaper
    -- Given a filename, set the wallpaper to be the image contained therein
    ---------------------------------------------------------------------------
    procedure changeWallpaper (c : access xcb_connection_t; filename : String);

    ---------------------------------------------------------------------------
    -- initDesktop
    -- Creates a window for the wallpaper and desktop icons. This will make the
    -- GLX context set up in Render current, so after this point it is safe to
    -- initialize shaders, etc.
    --
    -- @TODO create window for each randr screen
    ---------------------------------------------------------------------------
    procedure initDesktop (c    : access xcb_connection_t;
                           rend : Render.Renderer);

end Desktop;