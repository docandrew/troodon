package Render.Text is
    -- Render a string to the current OpenGL context
    -- @param x X location of the text
    -- @param y 
    -- @param windowW Width of the X window in pixels
    -- @param windowH Height of the X window in pixels
    procedure renderGLText (s       : String; 
                            x       : in out Float;
                            y       : in out Float;
                            windowW : Float;
                            windowH : Float);
end Render.Text;