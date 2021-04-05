with Freetype;
with Render.Fonts;

package Render.Text is
    ---------------------------------------------------------------------------
    -- Render a string to the current OpenGL context
    -- @param x X location of the text
    -- @param y 
    -- @param windowW Width of the X window in pixels
    -- @param windowH Height of the X window in pixels
    -- @param fontFace (optional) Freetype font to use
    --
    -- @TODO add color param, consider breaking this up into a separate 
    -- function for Emoji rendering
    ---------------------------------------------------------------------------
    procedure renderGLText (s        : String;
                            x        : in out Float;
                            y        : in out Float;
                            windowW  : Float;
                            windowH  : Float;
                            fontFace : Freetype.FT_Face := Render.Fonts.face);
end Render.Text;