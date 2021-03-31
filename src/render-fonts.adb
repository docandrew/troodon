with Ada.Text_IO;
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

with freetype;
with fttypes;

package body Render.Fonts is

    FreeTypeException : Exception;
    
    ft    : freetype.FT_Library;

    FONT_SIZE : constant := 14;
    -- type Glyph is record
    --     textureID : Interfaces.C.unsigned;
    -- end record;

    function loadGlyph (c : Character) return Boolean is
    begin
        if freetype.FT_Load_Char (face       => face,
                                  char_code  => Character'Pos(c),
                                  load_flags => freetype.FT_LOAD_RENDER) /= 0 then
            return False;
        end if;

        return True;
    end loadGlyph;

    -- @TODO use FontConfig to get a good match, or list available fonts
    procedure initFonts is
        ftErr : fttypes.FT_Error;
    begin
        Ada.Text_IO.Put_Line ("Troodon: Loading FreeType2 Library");
        
        if freetype.FT_Init_FreeType (alibrary => ft'Address) /= 0 then
            raise FreeTypeException with "Unable to load FreeType2 Library";
        end if;
        
        Ada.Text_IO.Put_Line ("Troodon: Loading Font Face");
        if freetype.FT_New_Face (library      => ft,
                                 filepathname => Interfaces.C.Strings.New_String("/usr/share/fonts/truetype/arial.ttf"),
                                 face_index   => 0,
                                 aface        => face'Address) /= 0 then
            raise FreeTypeException with "Unable to load font";
        end if;

        Ada.Text_IO.Put_Line ("Troodon: Setting Font Face Size");
        if freetype.FT_Set_Pixel_Sizes (face         => face,
                                        pixel_width  => 0,
                                        pixel_height => FONT_SIZE) /= 0 then
            raise FreeTypeException with "Unable to set font pixel size";
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
