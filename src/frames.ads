with Ada.Containers.Indefinite_Hashed_Maps;
with Ada.Containers;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Interfaces.C; use Interfaces.C;

with GLX;
with xcb;
with xproto; use xproto;

with render;

-------------------------------------------------------------------------------
-- Frames in Troodon are the X Windows used for reparenting other application
-- windows and decorating them. This is an abstraction around the X Window type
-- with additional information, such as which application window is associated
-- with this frame (and vice versa), rendering information, and other state.
-------------------------------------------------------------------------------
package frames is

    ---------------------------------------------------------------------------
    -- @field connection is the xcb connection in use
    -- @field frameID is the X11 window ID of this frame
    -- @field appWindow is the application window this frame is framing
    -- @field surface is the rendering surface used for this particular
    --   frame given a specific rendering backend.
    ---------------------------------------------------------------------------
    type Frame is tagged record
        connection  : access xcb.xcb_connection_t;
        frameID     : xproto.xcb_window_t;
        appWindow   : xproto.xcb_window_t;
        surface     : Render.RenderingSurface;
        
        title       : Unbounded_String;
        width       : Natural;
        height      : Natural;
    end record;

    ---------------------------------------------------------------------------
    -- map
    -- Call xcb_window_map on the frame and its application, causing it to
    -- be displayed.
    ---------------------------------------------------------------------------
    procedure map(f : Frame);

    ---------------------------------------------------------------------------
    -- drawTitleBar
    -- Draw the frame and associated decorations for this frame
    ---------------------------------------------------------------------------
    procedure drawTitleBar (f : Frame);

    ---------------------------------------------------------------------------
    -- Create a new frame for an application window, and add that frame to the
    -- frame map.
    ---------------------------------------------------------------------------
    function frameWindow(connection : access xcb.xcb_connection_t;
                         window     : xproto.xcb_window_t;
                         rend       : render.Renderer) return Frame;

    ---------------------------------------------------------------------------
    -- Destroy the frame of an application window, deleting any resources it
    -- was using and removing it from the list of frames.
    ---------------------------------------------------------------------------
    procedure unFrameWindow(f : Frame);

    ---------------------------------------------------------------------------
    -- exists
    -- If a frame with X11 ID frameID exists already in our map of frames,
    -- return True, otherwise False.
    ---------------------------------------------------------------------------
    -- function exists(connection : access xproto.xcb_connection_t;
    --                 frameID : xproto.xcb_window_t) return Boolean);


    ---------------------------------------------------------------------------
    -- isFrame
    -- given a X11 window ID, if this ID is a window that corresponds to a
    -- Troodon frame, return True.
    ---------------------------------------------------------------------------
    function isFrame(frameID : xproto.xcb_window_t) return Boolean;

    ---------------------------------------------------------------------------
    -- getFrameFromList
    -- given a frameID that exists in the frames map, return it
    ---------------------------------------------------------------------------
    function getFrameFromList(frameID : xproto.xcb_window_t) return Frame;

    ---------------------------------------------------------------------------
    -- hasFrame
    -- given a window ID, if it has been framed already, return True.
    ---------------------------------------------------------------------------
    function hasFrame(windowID : xproto.xcb_window_t) return Boolean;

    ---------------------------------------------------------------------------
    -- getWindowFrame
    -- given a window ID, return its frame if we've already framed it.
    -- It is important to ensure that the window ID
    -- isn't already a frame, or it will be doubly-framed (see getFrameFromList)
    ---------------------------------------------------------------------------
    function getFrameOfWindow(windowID : xproto.xcb_window_t) return Frame;

    -- Map each application window to its frame.
    function hashFunc(Key : xproto.xcb_window_t) return Ada.Containers.Hash_Type;

    -- function "="(Left : xproto.xcb_window_t;
    --              Right : xproto.xcb_window_t) return Boolean;

    package FrameMap is new 
        Ada.Containers.Indefinite_Hashed_Maps (Key_Type        => xproto.xcb_window_t,
                                               Element_Type    => Frame,
                                               Hash            => hashFunc,
                                               Equivalent_Keys => Interfaces.C."=");

    -- Map of application window ID's to Frame objects
    allFrames : FrameMap.Map;
    --allFrameIDs : FrameSet.Set;
end frames;