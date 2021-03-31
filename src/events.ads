with xcb; use xcb;
with xcb_ewmh; use xcb_ewmh;

with render;
-- with setup;

package events is

    type eventPtr is access all xcb_generic_event_t;

    procedure eventLoop(connection : access xcb_connection_t; rend : render.Renderer);
    -- procedure handleMapRequest(connection : access xcb_connection_t; event : eventPtr; rend : setup.Renderer);
    -- procedure handleConfigureRequest(connection : access xcb_connection_t; event : eventPtr);
    -- procedure handleButtonPress(connection : access xcb_connection_t; event : eventPtr);
    -- procedure handleButtonRelease(connection : access xcb_connection_t; event : eventPtr);
    -- procedure handleMotionNotify(connection : access xcb_connection_t; event : eventPtr);

end events;
