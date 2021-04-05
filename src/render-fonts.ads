with Freetype;

package Render.Fonts is

    FONT_SIZE : constant := 14;

    -- We reuse this object to store the current character glyph
    face      : Freetype.FT_Face;
    emojiFace : Freetype.FT_Face;
    --glyph : Freetype.FT_GlyphSlot;

    function loadGlyph (c : Character;           fontFace : Freetype.FT_Face) return Boolean;
    function loadGlyph (c : Wide_Wide_Character; fontFace : Freetype.FT_Face) return Boolean;
    procedure initFonts;

end Render.Fonts;