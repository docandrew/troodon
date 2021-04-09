with xcb; use xcb;
with xcb_ewmh; use xcb_ewmh;

with Compositor;
with Render;

package Events is

    type eventPtr is access all xcb_generic_event_t;

    procedure eventLoop (connection : access xcb_connection_t;
                         rend       : render.Renderer;
                         mode       : Compositor.CompositeMode);

end Events;
