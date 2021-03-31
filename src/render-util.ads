with Interfaces; use Interfaces;

with GL;

-------------------------------------------------------------------------------
-- Helper geometry primitives and functions
-------------------------------------------------------------------------------
package Render.Util is
    type Point is record
        x : GL.GLfloat;
        y : GL.GLfloat;
        s : GL.GLfloat;
        t : GL.GLfloat;
    end record;

    type Box is array (Natural range 1..4) of Point with Convention => C;

    type Point2D is record
        x : GL.GLfloat;
        y : GL.GLfloat;
    end record;

    type Box2D is array (Natural range 1..4) of Point2D with Convention => C;

    -- Can pass these to GL functions with myvec(1)'Access
    type Vec2 is array (Natural range 1..2) of aliased GL.GLfloat with Convention => C;
    type Vec4 is array (Natural range 1..4) of aliased GL.GLfloat with Convention => C;

    -- Make sure you transpose these if not already in column-major form
    type Mat4 is array (Natural range 1..16) of aliased GL.GLfloat with Convention => C;

    type DecorationColor is record
        r : Float;
        g : Float;
        b : Float;
        a : Float;
    end record;

    ---------------------------------------------------------------------------
    -- rgbaToGLColor
    -- Convenience function for taking 32-bit RGBA and converting to
    -- floating-point GL color
    ---------------------------------------------------------------------------
    function rgbaToGLColor (rgb : Unsigned_32) return DecorationColor;

    ---------------------------------------------------------------------------
    -- Build orthographic projection matrix. Akin to glm::ortho
    ---------------------------------------------------------------------------
    function ortho (left    : GL.GLfloat;
                    right   : GL.GLfloat;
                    bottom  : GL.GLfloat;
                    top     : GL.GLfloat;
                    nearVal : GL.GLfloat;
                    farVal  : GL.GLfloat) return Mat4;
end Render.Util;