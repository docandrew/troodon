with Ada.Containers.Indefinite_Hashed_Maps;
with Ada.Containers;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Interfaces.C; use Interfaces.C;

with GLX;
with xcb;
with xproto; use xproto;

with Render;

-------------------------------------------------------------------------------
-- Frames in Troodon are the X Windows used for reparenting other application
-- windows and decorating them. This is an abstraction around the X Window type
-- with additional information, such as which application window is associated
-- with this frame (and vice versa), rendering information, and other state.
-------------------------------------------------------------------------------
package Frames is

    FrameException : exception;

    ---------------------------------------------------------------------------
    -- @field connection is the xcb connection in use
    -- @field frameID is the X11 window ID of this frame
    -- @field appWindow is the application window this frame is framing
    -- @field surface is the rendering surface used for this particular
    --   frame given a specific rendering backend.
    -- @field focused is True when the corresponding application has input
    --  focus and this Frame is raised to top.
    -- @field grabbed is True when this frame is set to grab inputs from its
    --  child app.
    ---------------------------------------------------------------------------
    type Frame is tagged record
        connection  : access xcb.xcb_connection_t;
        frameID     : xproto.xcb_window_t;
        appWindow   : xproto.xcb_window_t;
        surface     : Render.RenderingSurface;
        
        title       : Unbounded_String;
        width       : Natural;
        height      : Natural;

        focused     : Boolean;
        grabbed     : Boolean;
        dragging    : Boolean;
    end record;

    ---------------------------------------------------------------------------
    -- map
    -- Call xcb_window_map on the frame and its application, causing it to
    -- be displayed.
    ---------------------------------------------------------------------------
    procedure map (f : Frame);

    ---------------------------------------------------------------------------
    -- draw
    -- Draw the frame and associated decorations for this frame
    ---------------------------------------------------------------------------
    procedure draw (f : Frame);

    ---------------------------------------------------------------------------
    -- Create a new frame for an application window, and add that frame to the
    -- frame map.
    ---------------------------------------------------------------------------
    function frameWindow (connection : access xcb.xcb_connection_t;
                          window     : xproto.xcb_window_t;
                          rend       : render.Renderer) return Frame;

    ---------------------------------------------------------------------------
    -- deleteFrame
    -- Remove 
    ---------------------------------------------------------------------------
    procedure deleteFrame (f : Frame);

    ---------------------------------------------------------------------------
    -- unFrameWindow
    -- Destroy the frame of an application window, reparenting the window to the
    -- root window and removing it from the list of frames.
    ---------------------------------------------------------------------------
    procedure unFrameWindow (f : Frame);

    ---------------------------------------------------------------------------
    -- startDrag
    -- Set the Frame with a given FrameID to dragging.
    ---------------------------------------------------------------------------
    procedure startDrag (frameID : xproto.xcb_window_t);

    ---------------------------------------------------------------------------
    -- stopDrag
    -- Stop dragging any and all frames.
    ---------------------------------------------------------------------------
    procedure stopDrag;

    ---------------------------------------------------------------------------
    -- focus
    -- Focus the Frame with a given FrameID
    ---------------------------------------------------------------------------
    procedure focus (frameID : xproto.xcb_window_t);

    ---------------------------------------------------------------------------
    -- unfocusAll
    -- Make sure none of our frames are focused
    ---------------------------------------------------------------------------
    procedure unfocusAll;

    ---------------------------------------------------------------------------
    -- isFrame
    -- given a X11 window ID, if this ID is a window that corresponds to a
    -- Troodon frame, return True.
    ---------------------------------------------------------------------------
    function isFrame (frameID : xproto.xcb_window_t) return Boolean;

    ---------------------------------------------------------------------------
    -- getFrameFromList
    -- given a frameID that exists in the frames map, return it
    ---------------------------------------------------------------------------
    function getFrameFromList (frameID : xproto.xcb_window_t) return Frame;

    ---------------------------------------------------------------------------
    -- hasFrame
    -- given a window ID, if it has been framed already, return True.
    ---------------------------------------------------------------------------
    function hasFrame (windowID : xproto.xcb_window_t) return Boolean;

    ---------------------------------------------------------------------------
    -- getWindowFrame
    -- given a window ID, return its frame if we've already framed it.
    -- It is important to ensure that the window ID
    -- isn't already a frame, or it will be doubly-framed (see getFrameFromList)
    ---------------------------------------------------------------------------
    function getFrameOfWindow (windowID : xproto.xcb_window_t) return Frame;


    -- Map each application window to its frame.
    function hashFunc (Key : xproto.xcb_window_t) return Ada.Containers.Hash_Type;

    package FrameMap is new 
        Ada.Containers.Indefinite_Hashed_Maps (Key_Type        => xproto.xcb_window_t,
                                               Element_Type    => Frame,
                                               Hash            => hashFunc,
                                               Equivalent_Keys => Interfaces.C."=");

    -- Map of application window ID's to Frame objects
    allFrames : FrameMap.Map;
end frames;