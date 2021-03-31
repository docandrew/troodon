with GL;

package body Render.Util is

    function rgbaToGLColor (rgb : Unsigned_32) return DecorationColor is
    begin
        return dc : DecorationColor do
            dc.r := Float(rgb and 16#FF00_0000#) / Float(16#FF00_0000#);
            dc.g := Float(rgb and 16#00FF_0000#) / Float(16#00FF_0000#);
            dc.b := Float(rgb and 16#0000_FF00#) / Float(16#0000_FF00#);
            dc.a := Float(rgb and 16#0000_00FF#) / Float(16#0000_00FF#);
        end return;
    end rgbaToGLColor;
    
    -------------------------------------------------------------------
    -- @TODO This is a general function, we could speed it up if we 
    --  always end up passing 0 and 1 for all but the right/bottom
    --  coords
    -------------------------------------------------------------------
    function ortho (left    : GL.GLfloat;
                    right   : GL.GLfloat;
                    bottom  : GL.GLfloat;
                    top     : GL.GLfloat;
                    nearVal : GL.GLfloat;
                    farVal  : GL.GLfloat) return Mat4
    is
        tx : GL.GLfloat := -((right + left)     / (right - left));
        ty : GL.GLfloat := -((top + bottom)     / (top - bottom));
        tz : GL.GLfloat := -((farVal + nearVal) / (farVal - nearVal));
    begin
        return (
            2.0 / (right - left), 0.0,                  0.0,                     tx,
            0.0,                  2.0 / (top - bottom), 0.0,                     ty,
            0.0,                  0.0,                  -2.0/(farVal - nearVal), tz,
            0.0,                  0.0,                  0.0,                     1.0
        );
    end ortho;

end Render.Util;
