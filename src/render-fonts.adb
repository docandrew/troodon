with Ada.Characters.Conversions;
with Ada.Numerics; use Ada.Numerics;
with Ada.Wide_Wide_Text_IO;
with Ada.Text_IO;
with Ada.Unchecked_Conversion;
with Interfaces;
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

with Fontconfig;
with Freetype;
with Freetype_Config_Integer_Types;
with FTtypes;

package body Render.Fonts is

    FontconfigException, FreetypeException : Exception;
    
    ft       : Freetype.FT_Library;
    fcConfig : access Fontconfig.FcConfig;

    ---------------------------------------------------------------------------
    -- Replacement for Freetype C macro FT_HAS_COLOR
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
    -- findFont
    -- Given a font name, return the full path to the file containing said font.
    ---------------------------------------------------------------------------
    function findFont (name : String) return String is
        use Fontconfig;

        type FCName is access Fontconfig.FcChar8;
        cName    : Interfaces.C.char_array := Interfaces.C.To_C (name);

        subResult   : Fontconfig.FcBool;
        getResult   : Fontconfig.FcResult;
        matchResult : aliased Fontconfig.FcResult;

        pattern  : access Fontconfig.FcPattern;
        font     : access Fontconfig.FcPattern;
        
        fontPath : aliased Interfaces.C.Strings.chars_ptr;

        FCFILE : Interfaces.C.Strings.chars_ptr := Interfaces.C.Strings.New_String (Fontconfig.FC_FILE);
    begin

        pattern := Fontconfig.FcNameParse (cName(0)'Access);

        -- Perform substitutions in the match pattern
        subResult := Fontconfig.FcConfigSubstitute (fcConfig, pattern, Fontconfig.FcMatchPattern);

        if subResult = Fontconfig.FcFalse then
            raise FontconfigException with "Troodon: (Fonts) Unable to perform pattern substitution";
        end if;

        -- Perform default substitutions in the match pattern
        -- (e.g. if no style is specified, set Medium, Roman, 12pt, etc.)
        Fontconfig.FcDefaultSubstitute (pattern);
        
        -- Return the best font matching our pattern
        font := Fontconfig.FcFontMatch (fcConfig, pattern, matchResult'Access);

        if font = null or matchResult = Fontconfig.FcResultNoMatch then
            raise FontconfigException with "Troodon: (Fonts) Unable to find a font matching " & name;
        end if;

        getResult := Fontconfig.FcPatternGetString (font, FCFILE, 0, fontPath'Address);

        if getResult /= Fontconfig.FcResultMatch then
            raise FontconfigException with "Troodon: (Fonts) Can't get file path from font pattern";
        end if;

        Interfaces.C.Strings.Free (FCFILE);

        declare
            retPath : String := Interfaces.C.Strings.Value (fontPath);
        begin
            Fontconfig.FcPatternDestroy (font);
            Fontconfig.FcPatternDestroy (pattern);
            Ada.Text_IO.Put_Line ("Troodon: (Fonts) Using font path :" & retPath);
            return retPath;
        end;
    end findFont;

    ---------------------------------------------------------------------------
    -- initFontconfig
    -- For now, we'll just load some reasonable font families. Later we'll
    -- allow reconfiguration
    ---------------------------------------------------------------------------
    procedure initFontconfig is
        init : Fontconfig.FcBool;
    begin
        if Fontconfig.FcInit = 0 then
            raise FontconfigException with ("Troodon: (Fonts) Error initializing Fontconfig library");
        end if;

        fcConfig := Fontconfig.FcInitLoadConfigAndFonts;
    end initFontconfig;

    ---------------------------------------------------------------------------
    -- teardownFontconfig
    ---------------------------------------------------------------------------
    procedure teardownFontconfig is
    begin
        Fontconfig.FcConfigDestroy (fcConfig);
        Fontconfig.FcFini;
    end teardownFontconfig;

    ---------------------------------------------------------------------------
    -- initFreetype
    ---------------------------------------------------------------------------
    procedure initFreetype is
        ftErr          : FTtypes.FT_Error;
        emojiSizeDiff  : Interfaces.C.short := Interfaces.C.short'Last;
        emojiSizeIdx   : Interfaces.C.int;
        
        normalFontPath : Interfaces.C.Strings.chars_ptr := Interfaces.C.Strings.New_String (findFont ("NotoSans"));
        emojiFontpath  : Interfaces.C.Strings.chars_ptr := Interfaces.C.Strings.New_String (findFont ("NotoColorEmoji"));
    begin
        Ada.Text_IO.Put_Line ("Troodon: Loading FreeType2 Library");
        if Freetype.FT_Init_FreeType (alibrary => ft'Address) /= 0 then
            raise FreeTypeException with "Unable to load FreeType2 Library";
        end if;

        Ada.Text_IO.Put_Line ("Troodon: Loading Font Face");
        if Freetype.FT_New_Face (library      => ft,
                                 filepathname => normalFontPath,
                                 face_index   => 0,
                                 aface        => face'Address) /= 0 then
            raise FreeTypeException with "Unable to load regular font";
        end if;

        Ada.Text_IO.Put_Line ("Troodon: Setting Font Face Size");
        if Freetype.FT_Set_Pixel_Sizes (face         => face,
                                        pixel_width  => 0,
                                        pixel_height => FONT_SIZE) /= 0 then
            raise FreeTypeException with "Unable to set font pixel size";
        end if;
        
        Ada.Text_IO.Put_Line ("Troodon: Loading Emoji Font Face");
        if Freetype.FT_New_Face (library      => ft,
                                 filepathname => emojiFontPath,
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

        Interfaces.C.Strings.Free (normalFontPath);
        Interfaces.C.Strings.Free (emojiFontPath);    
    end initFreetype;

    ---------------------------------------------------------------------------
    -- teardownFreetype
    ---------------------------------------------------------------------------
    procedure teardownFreetype is
        ftErr : FTTypes.FT_Error;
    begin
        ftErr := Freetype.FT_Done_Freetype (ft);

        if ftErr /= 0 then
            Ada.Text_IO.Put_Line ("Troodon: (Fonts) Failed to tear down Freetype library");
            --raise FreetypeException with "Troodon: (Fonts) Failed to tear down Freetype library";
        end if;
    end teardownFreetype;

    ---------------------------------------------------------------------------
    -- start
    ---------------------------------------------------------------------------
    procedure start is
    begin
        initFontconfig;
        initFreetype;
    end start;

    ---------------------------------------------------------------------------
    -- teardownFonts
    ---------------------------------------------------------------------------
    procedure stop is
    begin
        teardownFreetype;
        teardownFontconfig;
    end stop;

end Render.Fonts;
