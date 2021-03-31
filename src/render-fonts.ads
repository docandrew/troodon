with Freetype;

package Render.Fonts is
    
    -- We reuse this object to store the current character glyph
    face  : freetype.FT_Face;
    --glyph : Freetype.FT_GlyphSlot;

    function loadGlyph (c : Character) return Boolean;
    procedure initFonts;

end Render.Fonts;