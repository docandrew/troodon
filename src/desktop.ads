
with xcb; use xcb;
with xproto; use xproto;

with Render;

package Desktop is

    DesktopException : exception;

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