-- As input events occur, we just keep them here. Then as a window
-- is notified of something, if it's a Troodon app, we will wake it
-- up and it can pull whatever inputs it wants.
package Events.Inputs is

    type InputEvent is (MOUSEMOVEMENT, BUTTONDOWN, BUTTONUP, KEYDOWN, KEYUP, QUIT)

    type MouseMotionT is record

    end record;

    type EventStruct is record

        mouseMotion : MouseMotion
    end record;

end Events.Inputs;