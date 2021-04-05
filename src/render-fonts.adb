with Ada.Characters.Conversions;
with Ada.Numerics; use Ada.Numerics;
with Ada.Wide_Wide_Text_IO;
with Ada.Text_IO;
with Ada.Unchecked_Conversion;
with Interfaces;
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

with Freetype;
with Freetype_Config_Integer_Types;
with FTtypes;

package body Render.Fonts is

    FreeTypeException : Exception;
    
    ft    : freetype.FT_Library;

    -- type Glyph is record
    --     textureID : Interfaces.C.unsigned;
    -- end record;

    ---------------------------------------------------------------------------
    -- Replacement for C macro FT_HAS_COLOR
    ---------------------------------------------------------------------------
    function hasColor(f : Freetype.FT_Face) return Boolean is
        use Interfaces;
    begin
        return (Unsigned_32(f.face_flags) and Unsigned_32(Freetype.FT_FACE_FLAG_COLOR)) /= 0;
    end hasColor;

    ---------------------------------------------------------------------------
    -- loadGlyph
    ---------------------------------------------------------------------------
    function loadGlyph (c : Wide_Wide_Character; fontFace : Freetype.FT_Face) return Boolean is
        use Interfaces;
        use Freetype_Config_Integer_Types;

        ftErr    : FTtypes.FT_Error;
        flags    : FT_Int32;
        glyphIdx : Interfaces.C.unsigned;

        function toUlong is new Ada.Unchecked_Conversion (Source => Wide_Wide_Character, Target => FTtypes.FT_ULong);
    begin
        if hasColor (fontFace) then
            -- Ada.Text_IO.Put (" loadGlyph: loading ");
            -- Ada.Text_IO.Put_Line (FTtypes.FT_ULong'Image (toUlong(c)));
            --Ada.Wide_Wide_Text_IO.Put_Line ("" & c);
            -- Ada.Text_IO.Put_Line (" loadGlyph: using color");
            flags := Freetype.FT_LOAD_COLOR;

            glyphIdx := Freetype.FT_Get_Char_Index (fontFace, toUlong (c));

            -- Ada.Text_IO.Put_Line (" Glyph Index:" & glyphIdx'Image);

            ftErr := Freetype.FT_Load_Glyph (fontFace, glyphIdx, flags);

            if ftErr /= 0 then
                Ada.Text_IO.Put_Line (" FT_Load_Glyph error:" & ftErr'Image);
                return false;
            end if;

            -- Ada.Text_IO.Put_Line (" Glyph format:" & fontFace.glyph.format'Image);
            -- Ada.Text_IO.Put_Line (" Glyph bitmap pixel_mode:" & fontFace.glyph.bitmap.pixel_mode'Image);
        else
            flags := Freetype.FT_LOAD_RENDER;

            if freetype.FT_Load_Char (face       => fontFace,
                                      char_code  => toUlong (c),
                                      load_flags => flags) /= 0 then
                return False;
            end if;
        end if;


        return True;
    end loadGlyph;

    ---------------------------------------------------------------------------
    -- loadGlyph
    ---------------------------------------------------------------------------
    function loadGlyph (c : Character; fontFace : Freetype.FT_Face) return Boolean is
    begin
        return loadGlyph (Ada.Characters.Conversions.To_Wide_Wide_Character (c), fontFace);
    end loadGlyph;

    ---------------------------------------------------------------------------
    -- initFonts
    -- @TODO use FontConfig to get a good match, or list available fonts
    ---------------------------------------------------------------------------
    procedure initFonts is
        ftErr          : FTtypes.FT_Error;
        emojiSizeDiff  : Interfaces.C.short := Interfaces.C.short'Last;
        emojiSizeIdx   : Interfaces.C.int;
    begin
        Ada.Text_IO.Put_Line ("Troodon: Loading FreeType2 Library");
        if freetype.FT_Init_FreeType (alibrary => ft'Address) /= 0 then
            raise FreeTypeException with "Unable to load FreeType2 Library";
        end if;

        Ada.Text_IO.Put_Line ("Troodon: Loading Font Face");
        if freetype.FT_New_Face (library      => ft,
                                 filepathname => Interfaces.C.Strings.New_String("/usr/share/fonts/truetype/NotoSans-Regular.ttf"),
                                 face_index   => 0,
                                 aface        => face'Address) /= 0 then
            raise FreeTypeException with "Unable to load regular font";
        end if;

        Ada.Text_IO.Put_Line ("Troodon: Setting Font Face Size");
        if freetype.FT_Set_Pixel_Sizes (face         => face,
                                        pixel_width  => 0,
                                        pixel_height => FONT_SIZE) /= 0 then
            raise FreeTypeException with "Unable to set font pixel size";
        end if;
        
        Ada.Text_IO.Put_Line ("Troodon: Loading Emoji Font Face");
        if freetype.FT_New_Face (library      => ft,
                                 filepathname => Interfaces.C.Strings.New_String ("/usr/share/fonts/truetype/NotoColorEmoji.ttf"),
                                 face_index   => 0,
                                 aface        => emojiFace'Address) /= 0 then
            raise FreeTypeException with "Unable to load emoji font";
        end if;

        if hasColor (emojiFace) then
            Ada.Text_IO.Put_Line (" Emoji has color bitmaps");
        end if;

        -- FT_Set_Pixel_Sizes doesn't work with emoji font, need to use this instead
        Ada.Text_IO.Put_Line ("Troodon: Setting Emoji Font Face Size");

        -- Determine available bitmap strikes closest to our FONT_FACE size.
        declare
            type SizesArr is array (Interfaces.C.int range 1..emojiFace.num_fixed_sizes) of Freetype.FT_Bitmap_Size
                with Convention => C;

            sizes : SizesArr with Address => emojiFace.available_sizes;
        begin
            Ada.Text_IO.Put_Line (" Number of bitmap sizes: " & emojiFace.num_fixed_sizes'Image);
            for i in sizes'Range loop
                Ada.Text_IO.Put_Line (" Found emoji font bitmap size: " & sizes(i).width'Image);
                if abs(FONT_SIZE - sizes(i).width) < emojiSizeDiff then
                    emojiSizeDiff := abs(FONT_SIZE - sizes(i).width);
                    emojiSizeIdx  := i - 1;
                end if;
            end loop;
        end;

        Ada.Text_IO.Put_Line (" Using size index: " & emojiSizeIdx'Image);

        ftErr := Freetype.FT_Select_Size (face         => emojiFace,
                                          strike_index => emojiSizeIdx);

        if ftErr /= 0 then
            raise FreeTypeException with "Unable to select emoji font size, FT error" & ftErr'Image;
        end if;
                                 
        -- Load ASCII chars into an array
        -- Ada.Text_IO.Put_Line ("Troodon: Loading Glyph");
        -- if freetype.FT_Load_Char (face      => face,
        --                           char_code => Character'Pos('J'),
        --                           load_flags => freetype.FT_LOAD_RENDER) /= 0 then
        --     raise FreeTypeException with "Unable to load character";
        -- end if;
        
        --glyph := face.glyph;
    end initFonts;
end Render.Fonts;
