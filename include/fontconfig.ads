pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
limited with bits_struct_stat_h;

package fontconfig is

   FC_MAJOR : constant := 2;  --  /usr/include/fontconfig/fontconfig.h:54
   FC_MINOR : constant := 13;  --  /usr/include/fontconfig/fontconfig.h:55
   FC_REVISION : constant := 1;  --  /usr/include/fontconfig/fontconfig.h:56
   --  unsupported macro: FC_VERSION ((FC_MAJOR * 10000) + (FC_MINOR * 100) + (FC_REVISION))

   FC_CACHE_VERSION_NUMBER : constant := 7;  --  /usr/include/fontconfig/fontconfig.h:70
   --  unsupported macro: FC_CACHE_VERSION _FC_STRINGIFY(FC_CACHE_VERSION_NUMBER)

   FcFalse : constant := 0;  --  /usr/include/fontconfig/fontconfig.h:75
   FcTrue : constant := 1;  --  /usr/include/fontconfig/fontconfig.h:76
   FcDontCare : constant := 2;  --  /usr/include/fontconfig/fontconfig.h:77

   FC_FAMILY : aliased constant String := "family" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:79
   FC_STYLE : aliased constant String := "style" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:80
   FC_SLANT : aliased constant String := "slant" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:81
   FC_WEIGHT : aliased constant String := "weight" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:82
   FC_SIZE : aliased constant String := "size" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:83
   FC_ASPECT : aliased constant String := "aspect" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:84
   FC_PIXEL_SIZE : aliased constant String := "pixelsize" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:85
   FC_SPACING : aliased constant String := "spacing" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:86
   FC_FOUNDRY : aliased constant String := "foundry" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:87
   FC_ANTIALIAS : aliased constant String := "antialias" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:88
   FC_HINTING : aliased constant String := "hinting" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:89
   FC_HINT_STYLE : aliased constant String := "hintstyle" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:90
   FC_VERTICAL_LAYOUT : aliased constant String := "verticallayout" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:91
   FC_AUTOHINT : aliased constant String := "autohint" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:92

   FC_GLOBAL_ADVANCE : aliased constant String := "globaladvance" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:94
   FC_WIDTH : aliased constant String := "width" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:95
   FC_FILE : aliased constant String := "file" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:96
   FC_INDEX : aliased constant String := "index" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:97
   FC_FT_FACE : aliased constant String := "ftface" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:98
   FC_RASTERIZER : aliased constant String := "rasterizer" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:99
   FC_OUTLINE : aliased constant String := "outline" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:100
   FC_SCALABLE : aliased constant String := "scalable" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:101
   FC_COLOR : aliased constant String := "color" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:102
   FC_VARIABLE : aliased constant String := "variable" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:103
   FC_SCALE : aliased constant String := "scale" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:104
   FC_SYMBOL : aliased constant String := "symbol" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:105
   FC_DPI : aliased constant String := "dpi" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:106
   FC_RGBA : aliased constant String := "rgba" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:107
   FC_MINSPACE : aliased constant String := "minspace" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:108
   FC_SOURCE : aliased constant String := "source" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:109
   FC_CHARSET : aliased constant String := "charset" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:110
   FC_LANG : aliased constant String := "lang" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:111
   FC_FONTVERSION : aliased constant String := "fontversion" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:112
   FC_FULLNAME : aliased constant String := "fullname" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:113
   FC_FAMILYLANG : aliased constant String := "familylang" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:114
   FC_STYLELANG : aliased constant String := "stylelang" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:115
   FC_FULLNAMELANG : aliased constant String := "fullnamelang" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:116
   FC_CAPABILITY : aliased constant String := "capability" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:117
   FC_FONTFORMAT : aliased constant String := "fontformat" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:118
   FC_EMBOLDEN : aliased constant String := "embolden" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:119
   FC_EMBEDDED_BITMAP : aliased constant String := "embeddedbitmap" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:120
   FC_DECORATIVE : aliased constant String := "decorative" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:121
   FC_LCD_FILTER : aliased constant String := "lcdfilter" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:122
   FC_FONT_FEATURES : aliased constant String := "fontfeatures" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:123
   FC_FONT_VARIATIONS : aliased constant String := "fontvariations" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:124
   FC_NAMELANG : aliased constant String := "namelang" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:125
   FC_PRGNAME : aliased constant String := "prgname" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:126
   FC_HASH : aliased constant String := "hash" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:127
   FC_POSTSCRIPT_NAME : aliased constant String := "postscriptname" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:128
   --  unsupported macro: FC_CACHE_SUFFIX ".cache-" FC_CACHE_VERSION
   --  unsupported macro: FC_DIR_CACHE_FILE "fonts.cache-" FC_CACHE_VERSION
   --  unsupported macro: FC_USER_CACHE_FILE ".fonts.cache-" FC_CACHE_VERSION

   FC_CHARWIDTH : aliased constant String := "charwidth" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:135
   --  unsupported macro: FC_CHAR_WIDTH FC_CHARWIDTH

   FC_CHAR_HEIGHT : aliased constant String := "charheight" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:137
   FC_MATRIX : aliased constant String := "matrix" & ASCII.NUL;  --  /usr/include/fontconfig/fontconfig.h:138

   FC_WEIGHT_THIN : constant := 0;  --  /usr/include/fontconfig/fontconfig.h:140
   FC_WEIGHT_EXTRALIGHT : constant := 40;  --  /usr/include/fontconfig/fontconfig.h:141
   --  unsupported macro: FC_WEIGHT_ULTRALIGHT FC_WEIGHT_EXTRALIGHT

   FC_WEIGHT_LIGHT : constant := 50;  --  /usr/include/fontconfig/fontconfig.h:143
   FC_WEIGHT_DEMILIGHT : constant := 55;  --  /usr/include/fontconfig/fontconfig.h:144
   --  unsupported macro: FC_WEIGHT_SEMILIGHT FC_WEIGHT_DEMILIGHT

   FC_WEIGHT_BOOK : constant := 75;  --  /usr/include/fontconfig/fontconfig.h:146
   FC_WEIGHT_REGULAR : constant := 80;  --  /usr/include/fontconfig/fontconfig.h:147
   --  unsupported macro: FC_WEIGHT_NORMAL FC_WEIGHT_REGULAR

   FC_WEIGHT_MEDIUM : constant := 100;  --  /usr/include/fontconfig/fontconfig.h:149
   FC_WEIGHT_DEMIBOLD : constant := 180;  --  /usr/include/fontconfig/fontconfig.h:150
   --  unsupported macro: FC_WEIGHT_SEMIBOLD FC_WEIGHT_DEMIBOLD

   FC_WEIGHT_BOLD : constant := 200;  --  /usr/include/fontconfig/fontconfig.h:152
   FC_WEIGHT_EXTRABOLD : constant := 205;  --  /usr/include/fontconfig/fontconfig.h:153
   --  unsupported macro: FC_WEIGHT_ULTRABOLD FC_WEIGHT_EXTRABOLD

   FC_WEIGHT_BLACK : constant := 210;  --  /usr/include/fontconfig/fontconfig.h:155
   --  unsupported macro: FC_WEIGHT_HEAVY FC_WEIGHT_BLACK

   FC_WEIGHT_EXTRABLACK : constant := 215;  --  /usr/include/fontconfig/fontconfig.h:157
   --  unsupported macro: FC_WEIGHT_ULTRABLACK FC_WEIGHT_EXTRABLACK

   FC_SLANT_ROMAN : constant := 0;  --  /usr/include/fontconfig/fontconfig.h:160
   FC_SLANT_ITALIC : constant := 100;  --  /usr/include/fontconfig/fontconfig.h:161
   FC_SLANT_OBLIQUE : constant := 110;  --  /usr/include/fontconfig/fontconfig.h:162

   FC_WIDTH_ULTRACONDENSED : constant := 50;  --  /usr/include/fontconfig/fontconfig.h:164
   FC_WIDTH_EXTRACONDENSED : constant := 63;  --  /usr/include/fontconfig/fontconfig.h:165
   FC_WIDTH_CONDENSED : constant := 75;  --  /usr/include/fontconfig/fontconfig.h:166
   FC_WIDTH_SEMICONDENSED : constant := 87;  --  /usr/include/fontconfig/fontconfig.h:167
   FC_WIDTH_NORMAL : constant := 100;  --  /usr/include/fontconfig/fontconfig.h:168
   FC_WIDTH_SEMIEXPANDED : constant := 113;  --  /usr/include/fontconfig/fontconfig.h:169
   FC_WIDTH_EXPANDED : constant := 125;  --  /usr/include/fontconfig/fontconfig.h:170
   FC_WIDTH_EXTRAEXPANDED : constant := 150;  --  /usr/include/fontconfig/fontconfig.h:171
   FC_WIDTH_ULTRAEXPANDED : constant := 200;  --  /usr/include/fontconfig/fontconfig.h:172

   FC_PROPORTIONAL : constant := 0;  --  /usr/include/fontconfig/fontconfig.h:174
   FC_DUAL : constant := 90;  --  /usr/include/fontconfig/fontconfig.h:175
   FC_MONO : constant := 100;  --  /usr/include/fontconfig/fontconfig.h:176
   FC_CHARCELL : constant := 110;  --  /usr/include/fontconfig/fontconfig.h:177

   FC_RGBA_UNKNOWN : constant := 0;  --  /usr/include/fontconfig/fontconfig.h:180
   FC_RGBA_RGB : constant := 1;  --  /usr/include/fontconfig/fontconfig.h:181
   FC_RGBA_BGR : constant := 2;  --  /usr/include/fontconfig/fontconfig.h:182
   FC_RGBA_VRGB : constant := 3;  --  /usr/include/fontconfig/fontconfig.h:183
   FC_RGBA_VBGR : constant := 4;  --  /usr/include/fontconfig/fontconfig.h:184
   FC_RGBA_NONE : constant := 5;  --  /usr/include/fontconfig/fontconfig.h:185

   FC_HINT_NONE : constant := 0;  --  /usr/include/fontconfig/fontconfig.h:188
   FC_HINT_SLIGHT : constant := 1;  --  /usr/include/fontconfig/fontconfig.h:189
   FC_HINT_MEDIUM : constant := 2;  --  /usr/include/fontconfig/fontconfig.h:190
   FC_HINT_FULL : constant := 3;  --  /usr/include/fontconfig/fontconfig.h:191

   FC_LCD_NONE : constant := 0;  --  /usr/include/fontconfig/fontconfig.h:194
   FC_LCD_DEFAULT : constant := 1;  --  /usr/include/fontconfig/fontconfig.h:195
   FC_LCD_LIGHT : constant := 2;  --  /usr/include/fontconfig/fontconfig.h:196
   FC_LCD_LEGACY : constant := 3;  --  /usr/include/fontconfig/fontconfig.h:197
   --  arg-macro: function FcMatrixInit (m)
   --    return (m).xx := (m).yy := 1, (m).xy := (m).yx := 0;

   FC_CHARSET_MAP_SIZE : constant := (256/32);  --  /usr/include/fontconfig/fontconfig.h:541
   --  unsupported macro: FC_CHARSET_DONE ((FcChar32) -1)
   --  arg-macro: function FcIsUpper (c)
   --    return (8#101# <= (c)  and then  (c) <= 8#132#);
   --  arg-macro: function FcIsLower (c)
   --    return (8#141# <= (c)  and then  (c) <= 8#172#);
   --  arg-macro: function FcToLower (c)
   --    return FcIsUpper(c) ? (c) - 8#101# + 8#141# : (c);

   FC_UTF8_MAX_LEN : constant := 6;  --  /usr/include/fontconfig/fontconfig.h:1060
   --  unsupported macro: FcConfigGetRescanInverval FcConfigGetRescanInverval_REPLACE_BY_FcConfigGetRescanInterval
   --  unsupported macro: FcConfigSetRescanInverval FcConfigSetRescanInverval_REPLACE_BY_FcConfigSetRescanInterval

  -- * fontconfig/fontconfig/fontconfig.h
  -- *
  -- * Copyright © 2001 Keith Packard
  -- *
  -- * Permission to use, copy, modify, distribute, and sell this software and its
  -- * documentation for any purpose is hereby granted without fee, provided that
  -- * the above copyright notice appear in all copies and that both that
  -- * copyright notice and this permission notice appear in supporting
  -- * documentation, and that the name of the author(s) not be used in
  -- * advertising or publicity pertaining to distribution of the software without
  -- * specific, written prior permission.  The authors make no
  -- * representations about the suitability of this software for any purpose.  It
  -- * is provided "as is" without express or implied warranty.
  -- *
  -- * THE AUTHOR(S) DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
  -- * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
  -- * EVENT SHALL THE AUTHOR(S) BE LIABLE FOR ANY SPECIAL, INDIRECT OR
  -- * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
  -- * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
  -- * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
  -- * PERFORMANCE OF THIS SOFTWARE.
  --  

   -- Troodon: changed type from unsigned_char to char for better interop with C intterface functions
   subtype FcChar8 is char;  -- /usr/include/fontconfig/fontconfig.h:43

   subtype FcChar16 is unsigned_short;  -- /usr/include/fontconfig/fontconfig.h:44

   subtype FcChar32 is unsigned;  -- /usr/include/fontconfig/fontconfig.h:45

   subtype FcBool is int;  -- /usr/include/fontconfig/fontconfig.h:46

  -- * Current Fontconfig version number.  This same number
  -- * must appear in the fontconfig configure.in file. Yes,
  -- * it'a a pain to synchronize version numbers like this.
  --  

  -- * Current font cache file format version
  -- * This is appended to the cache files so that multiple
  -- * versions of the library will peacefully coexist
  -- *
  -- * Change this value whenever the disk format for the cache file
  -- * changes in any non-compatible way.  Try to avoid such changes as
  -- * it means multiple copies of the font information.
  --  

  -- FC_GLOBAL_ADVANCE is deprecated. this is simply ignored on freetype 2.4.5 or later  
  -- Adjust outline rasterizer  
  -- sub-pixel order  
  -- hinting style  
  -- LCD filter  
   subtype u_FcType is int;
   FcTypeUnknown : constant int := -1;
   FcTypeVoid : constant int := 0;
   FcTypeInteger : constant int := 1;
   FcTypeDouble : constant int := 2;
   FcTypeString : constant int := 3;
   FcTypeBool : constant int := 4;
   FcTypeMatrix : constant int := 5;
   FcTypeCharSet : constant int := 6;
   FcTypeFTFace : constant int := 7;
   FcTypeLangSet : constant int := 8;
   FcTypeRange : constant int := 9;  -- /usr/include/fontconfig/fontconfig.h:199

   subtype FcType is u_FcType;  -- /usr/include/fontconfig/fontconfig.h:211

   type u_FcMatrix is record
      xx : aliased double;  -- /usr/include/fontconfig/fontconfig.h:214
      xy : aliased double;  -- /usr/include/fontconfig/fontconfig.h:214
      yx : aliased double;  -- /usr/include/fontconfig/fontconfig.h:214
      yy : aliased double;  -- /usr/include/fontconfig/fontconfig.h:214
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/fontconfig/fontconfig.h:213

   subtype FcMatrix is u_FcMatrix;  -- /usr/include/fontconfig/fontconfig.h:215

  -- * A data structure to represent the available glyphs in a font.
  -- * This is represented as a sparse boolean btree.
  --  

   type u_FcCharSet is null record;   -- incomplete struct

   subtype FcCharSet is u_FcCharSet;  -- /usr/include/fontconfig/fontconfig.h:225

   type u_FcObjectType is record
      object : Interfaces.C.Strings.chars_ptr;  -- /usr/include/fontconfig/fontconfig.h:228
      c_type : aliased FcType;  -- /usr/include/fontconfig/fontconfig.h:229
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/fontconfig/fontconfig.h:227

   subtype FcObjectType is u_FcObjectType;  -- /usr/include/fontconfig/fontconfig.h:230

   type u_FcConstant is record
      name : access FcChar8;  -- /usr/include/fontconfig/fontconfig.h:233
      object : Interfaces.C.Strings.chars_ptr;  -- /usr/include/fontconfig/fontconfig.h:234
      value : aliased int;  -- /usr/include/fontconfig/fontconfig.h:235
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/fontconfig/fontconfig.h:232

   subtype FcConstant is u_FcConstant;  -- /usr/include/fontconfig/fontconfig.h:236

   type u_FcResult is 
     (FcResultMatch,
      FcResultNoMatch,
      FcResultTypeMismatch,
      FcResultNoId,
      FcResultOutOfMemory)
   with Convention => C;  -- /usr/include/fontconfig/fontconfig.h:238

   subtype FcResult is u_FcResult;  -- /usr/include/fontconfig/fontconfig.h:241

   subtype u_FcValueBinding is unsigned;
   FcValueBindingWeak : constant unsigned := 0;
   FcValueBindingStrong : constant unsigned := 1;
   FcValueBindingSame : constant unsigned := 2;
   FcValueBindingEnd : constant unsigned := 2147483647;  -- /usr/include/fontconfig/fontconfig.h:243

  -- to make sure sizeof (FcValueBinding) == 4 even with -fshort-enums  
   subtype FcValueBinding is u_FcValueBinding;  -- /usr/include/fontconfig/fontconfig.h:247

   type u_FcPattern is null record;   -- incomplete struct

   subtype FcPattern is u_FcPattern;  -- /usr/include/fontconfig/fontconfig.h:249

   type u_FcPatternIter is record
      dummy1 : System.Address;  -- /usr/include/fontconfig/fontconfig.h:252
      dummy2 : System.Address;  -- /usr/include/fontconfig/fontconfig.h:253
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/fontconfig/fontconfig.h:251

   subtype FcPatternIter is u_FcPatternIter;  -- /usr/include/fontconfig/fontconfig.h:254

   type u_FcLangSet is null record;   -- incomplete struct

   subtype FcLangSet is u_FcLangSet;  -- /usr/include/fontconfig/fontconfig.h:256

   type u_FcRange is null record;   -- incomplete struct

   subtype FcRange is u_FcRange;  -- /usr/include/fontconfig/fontconfig.h:258

   type anon_16 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            s : access FcChar8;  -- /usr/include/fontconfig/fontconfig.h:263
         when 1 =>
            i : aliased int;  -- /usr/include/fontconfig/fontconfig.h:264
         when 2 =>
            b : aliased FcBool;  -- /usr/include/fontconfig/fontconfig.h:265
         when 3 =>
            d : aliased double;  -- /usr/include/fontconfig/fontconfig.h:266
         when 4 =>
            m : access constant FcMatrix;  -- /usr/include/fontconfig/fontconfig.h:267
         when 5 =>
            c : access constant FcCharSet;  -- /usr/include/fontconfig/fontconfig.h:268
         when 6 =>
            f : System.Address;  -- /usr/include/fontconfig/fontconfig.h:269
         when 7 =>
            l : access constant FcLangSet;  -- /usr/include/fontconfig/fontconfig.h:270
         when others =>
            r : access constant FcRange;  -- /usr/include/fontconfig/fontconfig.h:271
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type u_FcValue is record
      c_type : aliased FcType;  -- /usr/include/fontconfig/fontconfig.h:261
      u : aliased anon_16;  -- /usr/include/fontconfig/fontconfig.h:272
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/fontconfig/fontconfig.h:260

   subtype FcValue is u_FcValue;  -- /usr/include/fontconfig/fontconfig.h:273

   type u_FcFontSet is record
      nfont : aliased int;  -- /usr/include/fontconfig/fontconfig.h:276
      sfont : aliased int;  -- /usr/include/fontconfig/fontconfig.h:277
      fonts : System.Address;  -- /usr/include/fontconfig/fontconfig.h:278
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/fontconfig/fontconfig.h:275

   subtype FcFontSet is u_FcFontSet;  -- /usr/include/fontconfig/fontconfig.h:279

   type u_FcObjectSet is record
      nobject : aliased int;  -- /usr/include/fontconfig/fontconfig.h:282
      sobject : aliased int;  -- /usr/include/fontconfig/fontconfig.h:283
      objects : System.Address;  -- /usr/include/fontconfig/fontconfig.h:284
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/fontconfig/fontconfig.h:281

   subtype FcObjectSet is u_FcObjectSet;  -- /usr/include/fontconfig/fontconfig.h:285

   subtype u_FcMatchKind is unsigned;
   FcMatchPattern : constant unsigned := 0;
   FcMatchFont : constant unsigned := 1;
   FcMatchScan : constant unsigned := 2;
   FcMatchKindEnd : constant unsigned := 3;
   FcMatchKindBegin : constant unsigned := 0;  -- /usr/include/fontconfig/fontconfig.h:287

   subtype FcMatchKind is u_FcMatchKind;  -- /usr/include/fontconfig/fontconfig.h:291

   subtype u_FcLangResult is unsigned;
   FcLangEqual : constant unsigned := 0;
   FcLangDifferentCountry : constant unsigned := 1;
   FcLangDifferentTerritory : constant unsigned := 1;
   FcLangDifferentLang : constant unsigned := 2;  -- /usr/include/fontconfig/fontconfig.h:293

   subtype FcLangResult is u_FcLangResult;  -- /usr/include/fontconfig/fontconfig.h:298

   type u_FcSetName is 
     (FcSetSystem,
      FcSetApplication)
   with Convention => C;  -- /usr/include/fontconfig/fontconfig.h:300

   subtype FcSetName is u_FcSetName;  -- /usr/include/fontconfig/fontconfig.h:303

   type u_FcConfigFileInfoIter is record
      dummy1 : System.Address;  -- /usr/include/fontconfig/fontconfig.h:306
      dummy2 : System.Address;  -- /usr/include/fontconfig/fontconfig.h:307
      dummy3 : System.Address;  -- /usr/include/fontconfig/fontconfig.h:308
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/fontconfig/fontconfig.h:305

   subtype FcConfigFileInfoIter is u_FcConfigFileInfoIter;  -- /usr/include/fontconfig/fontconfig.h:309

   type u_FcAtomic is null record;   -- incomplete struct

   subtype FcAtomic is u_FcAtomic;  -- /usr/include/fontconfig/fontconfig.h:311

   type FcEndian is 
     (FcEndianBig,
      FcEndianLittle)
   with Convention => C;  -- /usr/include/fontconfig/fontconfig.h:321

   type u_FcConfig is null record;   -- incomplete struct

   subtype FcConfig is u_FcConfig;  -- /usr/include/fontconfig/fontconfig.h:323

   type u_FcGlobalCache is null record;   -- incomplete struct

   subtype FcFileCache is u_FcGlobalCache;  -- /usr/include/fontconfig/fontconfig.h:325

   type u_FcBlanks is null record;   -- incomplete struct

   subtype FcBlanks is u_FcBlanks;  -- /usr/include/fontconfig/fontconfig.h:327

   type u_FcStrList is null record;   -- incomplete struct

   subtype FcStrList is u_FcStrList;  -- /usr/include/fontconfig/fontconfig.h:329

   type u_FcStrSet is null record;   -- incomplete struct

   subtype FcStrSet is u_FcStrSet;  -- /usr/include/fontconfig/fontconfig.h:331

   type u_FcCache is null record;   -- incomplete struct

   subtype FcCache is u_FcCache;  -- /usr/include/fontconfig/fontconfig.h:333

  -- fcblanks.c  
   function FcBlanksCreate return access FcBlanks  -- /usr/include/fontconfig/fontconfig.h:339
   with Import => True, 
        Convention => C, 
        External_Name => "FcBlanksCreate";

   procedure FcBlanksDestroy (b : access FcBlanks)  -- /usr/include/fontconfig/fontconfig.h:342
   with Import => True, 
        Convention => C, 
        External_Name => "FcBlanksDestroy";

   function FcBlanksAdd (b : access FcBlanks; ucs4 : FcChar32) return FcBool  -- /usr/include/fontconfig/fontconfig.h:345
   with Import => True, 
        Convention => C, 
        External_Name => "FcBlanksAdd";

   function FcBlanksIsMember (b : access FcBlanks; ucs4 : FcChar32) return FcBool  -- /usr/include/fontconfig/fontconfig.h:348
   with Import => True, 
        Convention => C, 
        External_Name => "FcBlanksIsMember";

  -- fccache.c  
   function FcCacheDir (c : access constant FcCache) return access FcChar8  -- /usr/include/fontconfig/fontconfig.h:353
   with Import => True, 
        Convention => C, 
        External_Name => "FcCacheDir";

   function FcCacheCopySet (c : access constant FcCache) return access FcFontSet  -- /usr/include/fontconfig/fontconfig.h:356
   with Import => True, 
        Convention => C, 
        External_Name => "FcCacheCopySet";

   function FcCacheSubdir (c : access constant FcCache; i : int) return access FcChar8  -- /usr/include/fontconfig/fontconfig.h:359
   with Import => True, 
        Convention => C, 
        External_Name => "FcCacheSubdir";

   function FcCacheNumSubdir (c : access constant FcCache) return int  -- /usr/include/fontconfig/fontconfig.h:362
   with Import => True, 
        Convention => C, 
        External_Name => "FcCacheNumSubdir";

   function FcCacheNumFont (c : access constant FcCache) return int  -- /usr/include/fontconfig/fontconfig.h:365
   with Import => True, 
        Convention => C, 
        External_Name => "FcCacheNumFont";

   function FcDirCacheUnlink (dir : access FcChar8; config : access FcConfig) return FcBool  -- /usr/include/fontconfig/fontconfig.h:368
   with Import => True, 
        Convention => C, 
        External_Name => "FcDirCacheUnlink";

   function FcDirCacheValid (cache_file : access FcChar8) return FcBool  -- /usr/include/fontconfig/fontconfig.h:371
   with Import => True, 
        Convention => C, 
        External_Name => "FcDirCacheValid";

   function FcDirCacheClean (cache_dir : access FcChar8; verbose : FcBool) return FcBool  -- /usr/include/fontconfig/fontconfig.h:374
   with Import => True, 
        Convention => C, 
        External_Name => "FcDirCacheClean";

   procedure FcCacheCreateTagFile (config : access constant FcConfig)  -- /usr/include/fontconfig/fontconfig.h:377
   with Import => True, 
        Convention => C, 
        External_Name => "FcCacheCreateTagFile";

   function FcDirCacheCreateUUID
     (dir : access FcChar8;
      force : FcBool;
      config : access FcConfig) return FcBool  -- /usr/include/fontconfig/fontconfig.h:380
   with Import => True, 
        Convention => C, 
        External_Name => "FcDirCacheCreateUUID";

   function FcDirCacheDeleteUUID (dir : access FcChar8; config : access FcConfig) return FcBool  -- /usr/include/fontconfig/fontconfig.h:385
   with Import => True, 
        Convention => C, 
        External_Name => "FcDirCacheDeleteUUID";

  -- fccfg.c  
   function FcConfigHome return access FcChar8  -- /usr/include/fontconfig/fontconfig.h:390
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigHome";

   function FcConfigEnableHome (enable : FcBool) return FcBool  -- /usr/include/fontconfig/fontconfig.h:393
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigEnableHome";

   function FcConfigFilename (url : access FcChar8) return access FcChar8  -- /usr/include/fontconfig/fontconfig.h:396
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigFilename";

   function FcConfigCreate return access FcConfig  -- /usr/include/fontconfig/fontconfig.h:399
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigCreate";

   function FcConfigReference (config : access FcConfig) return access FcConfig  -- /usr/include/fontconfig/fontconfig.h:402
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigReference";

   procedure FcConfigDestroy (config : access FcConfig)  -- /usr/include/fontconfig/fontconfig.h:405
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigDestroy";

   function FcConfigSetCurrent (config : access FcConfig) return FcBool  -- /usr/include/fontconfig/fontconfig.h:408
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigSetCurrent";

   function FcConfigGetCurrent return access FcConfig  -- /usr/include/fontconfig/fontconfig.h:411
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigGetCurrent";

   function FcConfigUptoDate (config : access FcConfig) return FcBool  -- /usr/include/fontconfig/fontconfig.h:414
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigUptoDate";

   function FcConfigBuildFonts (config : access FcConfig) return FcBool  -- /usr/include/fontconfig/fontconfig.h:417
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigBuildFonts";

   function FcConfigGetFontDirs (config : access FcConfig) return access FcStrList  -- /usr/include/fontconfig/fontconfig.h:420
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigGetFontDirs";

   function FcConfigGetConfigDirs (config : access FcConfig) return access FcStrList  -- /usr/include/fontconfig/fontconfig.h:423
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigGetConfigDirs";

   function FcConfigGetConfigFiles (config : access FcConfig) return access FcStrList  -- /usr/include/fontconfig/fontconfig.h:426
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigGetConfigFiles";

   function FcConfigGetCache (config : access FcConfig) return access FcChar8  -- /usr/include/fontconfig/fontconfig.h:429
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigGetCache";

   function FcConfigGetBlanks (config : access FcConfig) return access FcBlanks  -- /usr/include/fontconfig/fontconfig.h:432
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigGetBlanks";

   function FcConfigGetCacheDirs (config : access constant FcConfig) return access FcStrList  -- /usr/include/fontconfig/fontconfig.h:435
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigGetCacheDirs";

   function FcConfigGetRescanInterval (config : access FcConfig) return int  -- /usr/include/fontconfig/fontconfig.h:438
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigGetRescanInterval";

   function FcConfigSetRescanInterval (config : access FcConfig; rescanInterval : int) return FcBool  -- /usr/include/fontconfig/fontconfig.h:441
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigSetRescanInterval";

   function FcConfigGetFonts (config : access FcConfig; set : FcSetName) return access FcFontSet  -- /usr/include/fontconfig/fontconfig.h:444
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigGetFonts";

   function FcConfigAppFontAddFile (config : access FcConfig; file : access FcChar8) return FcBool  -- /usr/include/fontconfig/fontconfig.h:448
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigAppFontAddFile";

   function FcConfigAppFontAddDir (config : access FcConfig; dir : access FcChar8) return FcBool  -- /usr/include/fontconfig/fontconfig.h:452
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigAppFontAddDir";

   procedure FcConfigAppFontClear (config : access FcConfig)  -- /usr/include/fontconfig/fontconfig.h:456
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigAppFontClear";

   function FcConfigSubstituteWithPat
     (config : access FcConfig;
      p : access FcPattern;
      p_pat : access FcPattern;
      kind : FcMatchKind) return FcBool  -- /usr/include/fontconfig/fontconfig.h:459
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigSubstituteWithPat";

   function FcConfigSubstitute
     (config : access FcConfig;
      p : access FcPattern;
      kind : FcMatchKind) return FcBool  -- /usr/include/fontconfig/fontconfig.h:465
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigSubstitute";

   function FcConfigGetSysRoot (config : access constant FcConfig) return access FcChar8  -- /usr/include/fontconfig/fontconfig.h:470
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigGetSysRoot";

   procedure FcConfigSetSysRoot (config : access FcConfig; sysroot : access FcChar8)  -- /usr/include/fontconfig/fontconfig.h:473
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigSetSysRoot";

   procedure FcConfigFileInfoIterInit (config : access FcConfig; iter : access FcConfigFileInfoIter)  -- /usr/include/fontconfig/fontconfig.h:477
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigFileInfoIterInit";

   function FcConfigFileInfoIterNext (config : access FcConfig; iter : access FcConfigFileInfoIter) return FcBool  -- /usr/include/fontconfig/fontconfig.h:481
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigFileInfoIterNext";

   function FcConfigFileInfoIterGet
     (config : access FcConfig;
      iter : access FcConfigFileInfoIter;
      name : System.Address;
      description : System.Address;
      enabled : access FcBool) return FcBool  -- /usr/include/fontconfig/fontconfig.h:485
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigFileInfoIterGet";

  -- fccharset.c  
   function FcCharSetCreate return access FcCharSet  -- /usr/include/fontconfig/fontconfig.h:493
   with Import => True, 
        Convention => C, 
        External_Name => "FcCharSetCreate";

  -- deprecated alias for FcCharSetCreate  
   function FcCharSetNew return access FcCharSet  -- /usr/include/fontconfig/fontconfig.h:497
   with Import => True, 
        Convention => C, 
        External_Name => "FcCharSetNew";

   procedure FcCharSetDestroy (fcs : access FcCharSet)  -- /usr/include/fontconfig/fontconfig.h:500
   with Import => True, 
        Convention => C, 
        External_Name => "FcCharSetDestroy";

   function FcCharSetAddChar (fcs : access FcCharSet; ucs4 : FcChar32) return FcBool  -- /usr/include/fontconfig/fontconfig.h:503
   with Import => True, 
        Convention => C, 
        External_Name => "FcCharSetAddChar";

   function FcCharSetDelChar (fcs : access FcCharSet; ucs4 : FcChar32) return FcBool  -- /usr/include/fontconfig/fontconfig.h:506
   with Import => True, 
        Convention => C, 
        External_Name => "FcCharSetDelChar";

   function FcCharSetCopy (src : access FcCharSet) return access FcCharSet  -- /usr/include/fontconfig/fontconfig.h:509
   with Import => True, 
        Convention => C, 
        External_Name => "FcCharSetCopy";

   function FcCharSetEqual (a : access constant FcCharSet; b : access constant FcCharSet) return FcBool  -- /usr/include/fontconfig/fontconfig.h:512
   with Import => True, 
        Convention => C, 
        External_Name => "FcCharSetEqual";

   function FcCharSetIntersect (a : access constant FcCharSet; b : access constant FcCharSet) return access FcCharSet  -- /usr/include/fontconfig/fontconfig.h:515
   with Import => True, 
        Convention => C, 
        External_Name => "FcCharSetIntersect";

   function FcCharSetUnion (a : access constant FcCharSet; b : access constant FcCharSet) return access FcCharSet  -- /usr/include/fontconfig/fontconfig.h:518
   with Import => True, 
        Convention => C, 
        External_Name => "FcCharSetUnion";

   function FcCharSetSubtract (a : access constant FcCharSet; b : access constant FcCharSet) return access FcCharSet  -- /usr/include/fontconfig/fontconfig.h:521
   with Import => True, 
        Convention => C, 
        External_Name => "FcCharSetSubtract";

   function FcCharSetMerge
     (a : access FcCharSet;
      b : access constant FcCharSet;
      changed : access FcBool) return FcBool  -- /usr/include/fontconfig/fontconfig.h:524
   with Import => True, 
        Convention => C, 
        External_Name => "FcCharSetMerge";

   function FcCharSetHasChar (fcs : access constant FcCharSet; ucs4 : FcChar32) return FcBool  -- /usr/include/fontconfig/fontconfig.h:527
   with Import => True, 
        Convention => C, 
        External_Name => "FcCharSetHasChar";

   function FcCharSetCount (a : access constant FcCharSet) return FcChar32  -- /usr/include/fontconfig/fontconfig.h:530
   with Import => True, 
        Convention => C, 
        External_Name => "FcCharSetCount";

   function FcCharSetIntersectCount (a : access constant FcCharSet; b : access constant FcCharSet) return FcChar32  -- /usr/include/fontconfig/fontconfig.h:533
   with Import => True, 
        Convention => C, 
        External_Name => "FcCharSetIntersectCount";

   function FcCharSetSubtractCount (a : access constant FcCharSet; b : access constant FcCharSet) return FcChar32  -- /usr/include/fontconfig/fontconfig.h:536
   with Import => True, 
        Convention => C, 
        External_Name => "FcCharSetSubtractCount";

   function FcCharSetIsSubset (a : access constant FcCharSet; b : access constant FcCharSet) return FcBool  -- /usr/include/fontconfig/fontconfig.h:539
   with Import => True, 
        Convention => C, 
        External_Name => "FcCharSetIsSubset";

   function FcCharSetFirstPage
     (a : access constant FcCharSet;
      map : access FcChar32;
      next : access FcChar32) return FcChar32  -- /usr/include/fontconfig/fontconfig.h:545
   with Import => True, 
        Convention => C, 
        External_Name => "FcCharSetFirstPage";

   function FcCharSetNextPage
     (a : access constant FcCharSet;
      map : access FcChar32;
      next : access FcChar32) return FcChar32  -- /usr/include/fontconfig/fontconfig.h:550
   with Import => True, 
        Convention => C, 
        External_Name => "FcCharSetNextPage";

  -- * old coverage API, rather hard to use correctly
  --  

   function FcCharSetCoverage
     (a : access constant FcCharSet;
      page : FcChar32;
      result : access FcChar32) return FcChar32  -- /usr/include/fontconfig/fontconfig.h:559
   with Import => True, 
        Convention => C, 
        External_Name => "FcCharSetCoverage";

  -- fcdbg.c  
   procedure FcValuePrint (v : FcValue)  -- /usr/include/fontconfig/fontconfig.h:563
   with Import => True, 
        Convention => C, 
        External_Name => "FcValuePrint";

   procedure FcPatternPrint (p : access constant FcPattern)  -- /usr/include/fontconfig/fontconfig.h:566
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternPrint";

   procedure FcFontSetPrint (s : access constant FcFontSet)  -- /usr/include/fontconfig/fontconfig.h:569
   with Import => True, 
        Convention => C, 
        External_Name => "FcFontSetPrint";

  -- fcdefault.c  
   function FcGetDefaultLangs return access FcStrSet  -- /usr/include/fontconfig/fontconfig.h:573
   with Import => True, 
        Convention => C, 
        External_Name => "FcGetDefaultLangs";

   procedure FcDefaultSubstitute (pattern : access FcPattern)  -- /usr/include/fontconfig/fontconfig.h:576
   with Import => True, 
        Convention => C, 
        External_Name => "FcDefaultSubstitute";

  -- fcdir.c  
   function FcFileIsDir (file : access FcChar8) return FcBool  -- /usr/include/fontconfig/fontconfig.h:580
   with Import => True, 
        Convention => C, 
        External_Name => "FcFileIsDir";

   function FcFileScan
     (set : access FcFontSet;
      dirs : access FcStrSet;
      cache : access FcFileCache;
      blanks : access FcBlanks;
      file : access FcChar8;
      force : FcBool) return FcBool  -- /usr/include/fontconfig/fontconfig.h:583
   with Import => True, 
        Convention => C, 
        External_Name => "FcFileScan";

   function FcDirScan
     (set : access FcFontSet;
      dirs : access FcStrSet;
      cache : access FcFileCache;
      blanks : access FcBlanks;
      dir : access FcChar8;
      force : FcBool) return FcBool  -- /usr/include/fontconfig/fontconfig.h:591
   with Import => True, 
        Convention => C, 
        External_Name => "FcDirScan";

   function FcDirSave
     (set : access FcFontSet;
      dirs : access FcStrSet;
      dir : access FcChar8) return FcBool  -- /usr/include/fontconfig/fontconfig.h:599
   with Import => True, 
        Convention => C, 
        External_Name => "FcDirSave";

   function FcDirCacheLoad
     (dir : access FcChar8;
      config : access FcConfig;
      cache_file : System.Address) return access FcCache  -- /usr/include/fontconfig/fontconfig.h:602
   with Import => True, 
        Convention => C, 
        External_Name => "FcDirCacheLoad";

   function FcDirCacheRescan (dir : access FcChar8; config : access FcConfig) return access FcCache  -- /usr/include/fontconfig/fontconfig.h:605
   with Import => True, 
        Convention => C, 
        External_Name => "FcDirCacheRescan";

   function FcDirCacheRead
     (dir : access FcChar8;
      force : FcBool;
      config : access FcConfig) return access FcCache  -- /usr/include/fontconfig/fontconfig.h:608
   with Import => True, 
        Convention => C, 
        External_Name => "FcDirCacheRead";

   function FcDirCacheLoadFile (cache_file : access FcChar8; file_stat : access bits_struct_stat_h.stat) return access FcCache  -- /usr/include/fontconfig/fontconfig.h:611
   with Import => True, 
        Convention => C, 
        External_Name => "FcDirCacheLoadFile";

   procedure FcDirCacheUnload (cache : access FcCache)  -- /usr/include/fontconfig/fontconfig.h:614
   with Import => True, 
        Convention => C, 
        External_Name => "FcDirCacheUnload";

  -- fcfreetype.c  
   function FcFreeTypeQuery
     (file : access FcChar8;
      id : unsigned;
      blanks : access FcBlanks;
      count : access int) return access FcPattern  -- /usr/include/fontconfig/fontconfig.h:618
   with Import => True, 
        Convention => C, 
        External_Name => "FcFreeTypeQuery";

   function FcFreeTypeQueryAll
     (file : access FcChar8;
      id : unsigned;
      blanks : access FcBlanks;
      count : access int;
      set : access FcFontSet) return unsigned  -- /usr/include/fontconfig/fontconfig.h:621
   with Import => True, 
        Convention => C, 
        External_Name => "FcFreeTypeQueryAll";

  -- fcfs.c  
   function FcFontSetCreate return access FcFontSet  -- /usr/include/fontconfig/fontconfig.h:626
   with Import => True, 
        Convention => C, 
        External_Name => "FcFontSetCreate";

   procedure FcFontSetDestroy (s : access FcFontSet)  -- /usr/include/fontconfig/fontconfig.h:629
   with Import => True, 
        Convention => C, 
        External_Name => "FcFontSetDestroy";

   function FcFontSetAdd (s : access FcFontSet; font : access FcPattern) return FcBool  -- /usr/include/fontconfig/fontconfig.h:632
   with Import => True, 
        Convention => C, 
        External_Name => "FcFontSetAdd";

  -- fcinit.c  
   function FcInitLoadConfig return access FcConfig  -- /usr/include/fontconfig/fontconfig.h:636
   with Import => True, 
        Convention => C, 
        External_Name => "FcInitLoadConfig";

   function FcInitLoadConfigAndFonts return access FcConfig  -- /usr/include/fontconfig/fontconfig.h:639
   with Import => True, 
        Convention => C, 
        External_Name => "FcInitLoadConfigAndFonts";

   function FcInit return FcBool  -- /usr/include/fontconfig/fontconfig.h:642
   with Import => True, 
        Convention => C, 
        External_Name => "FcInit";

   procedure FcFini  -- /usr/include/fontconfig/fontconfig.h:645
   with Import => True, 
        Convention => C, 
        External_Name => "FcFini";

   function FcGetVersion return int  -- /usr/include/fontconfig/fontconfig.h:648
   with Import => True, 
        Convention => C, 
        External_Name => "FcGetVersion";

   function FcInitReinitialize return FcBool  -- /usr/include/fontconfig/fontconfig.h:651
   with Import => True, 
        Convention => C, 
        External_Name => "FcInitReinitialize";

   function FcInitBringUptoDate return FcBool  -- /usr/include/fontconfig/fontconfig.h:654
   with Import => True, 
        Convention => C, 
        External_Name => "FcInitBringUptoDate";

  -- fclang.c  
   function FcGetLangs return access FcStrSet  -- /usr/include/fontconfig/fontconfig.h:658
   with Import => True, 
        Convention => C, 
        External_Name => "FcGetLangs";

   function FcLangNormalize (lang : access FcChar8) return access FcChar8  -- /usr/include/fontconfig/fontconfig.h:661
   with Import => True, 
        Convention => C, 
        External_Name => "FcLangNormalize";

   function FcLangGetCharSet (lang : access FcChar8) return access constant FcCharSet  -- /usr/include/fontconfig/fontconfig.h:664
   with Import => True, 
        Convention => C, 
        External_Name => "FcLangGetCharSet";

   function FcLangSetCreate return access FcLangSet  -- /usr/include/fontconfig/fontconfig.h:667
   with Import => True, 
        Convention => C, 
        External_Name => "FcLangSetCreate";

   procedure FcLangSetDestroy (ls : access FcLangSet)  -- /usr/include/fontconfig/fontconfig.h:670
   with Import => True, 
        Convention => C, 
        External_Name => "FcLangSetDestroy";

   function FcLangSetCopy (ls : access constant FcLangSet) return access FcLangSet  -- /usr/include/fontconfig/fontconfig.h:673
   with Import => True, 
        Convention => C, 
        External_Name => "FcLangSetCopy";

   function FcLangSetAdd (ls : access FcLangSet; lang : access FcChar8) return FcBool  -- /usr/include/fontconfig/fontconfig.h:676
   with Import => True, 
        Convention => C, 
        External_Name => "FcLangSetAdd";

   function FcLangSetDel (ls : access FcLangSet; lang : access FcChar8) return FcBool  -- /usr/include/fontconfig/fontconfig.h:679
   with Import => True, 
        Convention => C, 
        External_Name => "FcLangSetDel";

   function FcLangSetHasLang (ls : access constant FcLangSet; lang : access FcChar8) return FcLangResult  -- /usr/include/fontconfig/fontconfig.h:682
   with Import => True, 
        Convention => C, 
        External_Name => "FcLangSetHasLang";

   function FcLangSetCompare (lsa : access constant FcLangSet; lsb : access constant FcLangSet) return FcLangResult  -- /usr/include/fontconfig/fontconfig.h:685
   with Import => True, 
        Convention => C, 
        External_Name => "FcLangSetCompare";

   function FcLangSetContains (lsa : access constant FcLangSet; lsb : access constant FcLangSet) return FcBool  -- /usr/include/fontconfig/fontconfig.h:688
   with Import => True, 
        Convention => C, 
        External_Name => "FcLangSetContains";

   function FcLangSetEqual (lsa : access constant FcLangSet; lsb : access constant FcLangSet) return FcBool  -- /usr/include/fontconfig/fontconfig.h:691
   with Import => True, 
        Convention => C, 
        External_Name => "FcLangSetEqual";

   function FcLangSetHash (ls : access constant FcLangSet) return FcChar32  -- /usr/include/fontconfig/fontconfig.h:694
   with Import => True, 
        Convention => C, 
        External_Name => "FcLangSetHash";

   function FcLangSetGetLangs (ls : access constant FcLangSet) return access FcStrSet  -- /usr/include/fontconfig/fontconfig.h:697
   with Import => True, 
        Convention => C, 
        External_Name => "FcLangSetGetLangs";

   function FcLangSetUnion (a : access constant FcLangSet; b : access constant FcLangSet) return access FcLangSet  -- /usr/include/fontconfig/fontconfig.h:700
   with Import => True, 
        Convention => C, 
        External_Name => "FcLangSetUnion";

   function FcLangSetSubtract (a : access constant FcLangSet; b : access constant FcLangSet) return access FcLangSet  -- /usr/include/fontconfig/fontconfig.h:703
   with Import => True, 
        Convention => C, 
        External_Name => "FcLangSetSubtract";

  -- fclist.c  
   function FcObjectSetCreate return access FcObjectSet  -- /usr/include/fontconfig/fontconfig.h:707
   with Import => True, 
        Convention => C, 
        External_Name => "FcObjectSetCreate";

   function FcObjectSetAdd (os : access FcObjectSet; object : Interfaces.C.Strings.chars_ptr) return FcBool  -- /usr/include/fontconfig/fontconfig.h:710
   with Import => True, 
        Convention => C, 
        External_Name => "FcObjectSetAdd";

   procedure FcObjectSetDestroy (os : access FcObjectSet)  -- /usr/include/fontconfig/fontconfig.h:713
   with Import => True, 
        Convention => C, 
        External_Name => "FcObjectSetDestroy";

   function FcObjectSetVaBuild (first : Interfaces.C.Strings.chars_ptr; va : access System.Address) return access FcObjectSet  -- /usr/include/fontconfig/fontconfig.h:716
   with Import => True, 
        Convention => C, 
        External_Name => "FcObjectSetVaBuild";

   function FcObjectSetBuild (first : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return access FcObjectSet  -- /usr/include/fontconfig/fontconfig.h:719
   with Import => True, 
        Convention => C, 
        External_Name => "FcObjectSetBuild";

   function FcFontSetList
     (config : access FcConfig;
      sets : System.Address;
      nsets : int;
      p : access FcPattern;
      os : access FcObjectSet) return access FcFontSet  -- /usr/include/fontconfig/fontconfig.h:722
   with Import => True, 
        Convention => C, 
        External_Name => "FcFontSetList";

   function FcFontList
     (config : access FcConfig;
      p : access FcPattern;
      os : access FcObjectSet) return access FcFontSet  -- /usr/include/fontconfig/fontconfig.h:729
   with Import => True, 
        Convention => C, 
        External_Name => "FcFontList";

  -- fcatomic.c  
   function FcAtomicCreate (file : access FcChar8) return access FcAtomic  -- /usr/include/fontconfig/fontconfig.h:736
   with Import => True, 
        Convention => C, 
        External_Name => "FcAtomicCreate";

   function FcAtomicLock (atomic : access FcAtomic) return FcBool  -- /usr/include/fontconfig/fontconfig.h:739
   with Import => True, 
        Convention => C, 
        External_Name => "FcAtomicLock";

   function FcAtomicNewFile (atomic : access FcAtomic) return access FcChar8  -- /usr/include/fontconfig/fontconfig.h:742
   with Import => True, 
        Convention => C, 
        External_Name => "FcAtomicNewFile";

   function FcAtomicOrigFile (atomic : access FcAtomic) return access FcChar8  -- /usr/include/fontconfig/fontconfig.h:745
   with Import => True, 
        Convention => C, 
        External_Name => "FcAtomicOrigFile";

   function FcAtomicReplaceOrig (atomic : access FcAtomic) return FcBool  -- /usr/include/fontconfig/fontconfig.h:748
   with Import => True, 
        Convention => C, 
        External_Name => "FcAtomicReplaceOrig";

   procedure FcAtomicDeleteNew (atomic : access FcAtomic)  -- /usr/include/fontconfig/fontconfig.h:751
   with Import => True, 
        Convention => C, 
        External_Name => "FcAtomicDeleteNew";

   procedure FcAtomicUnlock (atomic : access FcAtomic)  -- /usr/include/fontconfig/fontconfig.h:754
   with Import => True, 
        Convention => C, 
        External_Name => "FcAtomicUnlock";

   procedure FcAtomicDestroy (atomic : access FcAtomic)  -- /usr/include/fontconfig/fontconfig.h:757
   with Import => True, 
        Convention => C, 
        External_Name => "FcAtomicDestroy";

  -- fcmatch.c  
   function FcFontSetMatch
     (config : access FcConfig;
      sets : System.Address;
      nsets : int;
      p : access FcPattern;
      result : access FcResult) return access FcPattern  -- /usr/include/fontconfig/fontconfig.h:761
   with Import => True, 
        Convention => C, 
        External_Name => "FcFontSetMatch";

   function FcFontMatch
     (config : access FcConfig;
      p : access FcPattern;
      result : access FcResult) return access FcPattern  -- /usr/include/fontconfig/fontconfig.h:768
   with Import => True, 
        Convention => C, 
        External_Name => "FcFontMatch";

   function FcFontRenderPrepare
     (config : access FcConfig;
      pat : access FcPattern;
      font : access FcPattern) return access FcPattern  -- /usr/include/fontconfig/fontconfig.h:773
   with Import => True, 
        Convention => C, 
        External_Name => "FcFontRenderPrepare";

   function FcFontSetSort
     (config : access FcConfig;
      sets : System.Address;
      nsets : int;
      p : access FcPattern;
      trim : FcBool;
      csp : System.Address;
      result : access FcResult) return access FcFontSet  -- /usr/include/fontconfig/fontconfig.h:778
   with Import => True, 
        Convention => C, 
        External_Name => "FcFontSetSort";

   function FcFontSort
     (config : access FcConfig;
      p : access FcPattern;
      trim : FcBool;
      csp : System.Address;
      result : access FcResult) return access FcFontSet  -- /usr/include/fontconfig/fontconfig.h:787
   with Import => True, 
        Convention => C, 
        External_Name => "FcFontSort";

   procedure FcFontSetSortDestroy (fs : access FcFontSet)  -- /usr/include/fontconfig/fontconfig.h:794
   with Import => True, 
        Convention => C, 
        External_Name => "FcFontSetSortDestroy";

  -- fcmatrix.c  
   function FcMatrixCopy (mat : access constant FcMatrix) return access FcMatrix  -- /usr/include/fontconfig/fontconfig.h:798
   with Import => True, 
        Convention => C, 
        External_Name => "FcMatrixCopy";

   function FcMatrixEqual (mat1 : access constant FcMatrix; mat2 : access constant FcMatrix) return FcBool  -- /usr/include/fontconfig/fontconfig.h:801
   with Import => True, 
        Convention => C, 
        External_Name => "FcMatrixEqual";

   procedure FcMatrixMultiply
     (result : access FcMatrix;
      a : access constant FcMatrix;
      b : access constant FcMatrix)  -- /usr/include/fontconfig/fontconfig.h:804
   with Import => True, 
        Convention => C, 
        External_Name => "FcMatrixMultiply";

   procedure FcMatrixRotate
     (m : access FcMatrix;
      c : double;
      s : double)  -- /usr/include/fontconfig/fontconfig.h:807
   with Import => True, 
        Convention => C, 
        External_Name => "FcMatrixRotate";

   procedure FcMatrixScale
     (m : access FcMatrix;
      sx : double;
      sy : double)  -- /usr/include/fontconfig/fontconfig.h:810
   with Import => True, 
        Convention => C, 
        External_Name => "FcMatrixScale";

   procedure FcMatrixShear
     (m : access FcMatrix;
      sh : double;
      sv : double)  -- /usr/include/fontconfig/fontconfig.h:813
   with Import => True, 
        Convention => C, 
        External_Name => "FcMatrixShear";

  -- fcname.c  
  -- Deprecated.  Does nothing.  Returns FcFalse.  
   function FcNameRegisterObjectTypes (types : access constant FcObjectType; ntype : int) return FcBool  -- /usr/include/fontconfig/fontconfig.h:819
   with Import => True, 
        Convention => C, 
        External_Name => "FcNameRegisterObjectTypes";

  -- Deprecated.  Does nothing.  Returns FcFalse.  
   function FcNameUnregisterObjectTypes (types : access constant FcObjectType; ntype : int) return FcBool  -- /usr/include/fontconfig/fontconfig.h:823
   with Import => True, 
        Convention => C, 
        External_Name => "FcNameUnregisterObjectTypes";

   function FcNameGetObjectType (object : Interfaces.C.Strings.chars_ptr) return access constant FcObjectType  -- /usr/include/fontconfig/fontconfig.h:826
   with Import => True, 
        Convention => C, 
        External_Name => "FcNameGetObjectType";

  -- Deprecated.  Does nothing.  Returns FcFalse.  
   function FcNameRegisterConstants (consts : access constant FcConstant; nconsts : int) return FcBool  -- /usr/include/fontconfig/fontconfig.h:830
   with Import => True, 
        Convention => C, 
        External_Name => "FcNameRegisterConstants";

  -- Deprecated.  Does nothing.  Returns FcFalse.  
   function FcNameUnregisterConstants (consts : access constant FcConstant; nconsts : int) return FcBool  -- /usr/include/fontconfig/fontconfig.h:834
   with Import => True, 
        Convention => C, 
        External_Name => "FcNameUnregisterConstants";

   function FcNameGetConstant (string : access FcChar8) return access constant FcConstant  -- /usr/include/fontconfig/fontconfig.h:837
   with Import => True, 
        Convention => C, 
        External_Name => "FcNameGetConstant";

   function FcNameConstant (string : access FcChar8; result : access int) return FcBool  -- /usr/include/fontconfig/fontconfig.h:840
   with Import => True, 
        Convention => C, 
        External_Name => "FcNameConstant";

   function FcNameParse (name : access FcChar8) return access FcPattern  -- /usr/include/fontconfig/fontconfig.h:843
   with Import => True, 
        Convention => C, 
        External_Name => "FcNameParse";

   function FcNameUnparse (pat : access FcPattern) return access FcChar8  -- /usr/include/fontconfig/fontconfig.h:846
   with Import => True, 
        Convention => C, 
        External_Name => "FcNameUnparse";

  -- fcpat.c  
   function FcPatternCreate return access FcPattern  -- /usr/include/fontconfig/fontconfig.h:850
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternCreate";

   function FcPatternDuplicate (p : access constant FcPattern) return access FcPattern  -- /usr/include/fontconfig/fontconfig.h:853
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternDuplicate";

   procedure FcPatternReference (p : access FcPattern)  -- /usr/include/fontconfig/fontconfig.h:856
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternReference";

   function FcPatternFilter (p : access FcPattern; os : access constant FcObjectSet) return access FcPattern  -- /usr/include/fontconfig/fontconfig.h:859
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternFilter";

   procedure FcValueDestroy (v : FcValue)  -- /usr/include/fontconfig/fontconfig.h:862
   with Import => True, 
        Convention => C, 
        External_Name => "FcValueDestroy";

   function FcValueEqual (va : FcValue; vb : FcValue) return FcBool  -- /usr/include/fontconfig/fontconfig.h:865
   with Import => True, 
        Convention => C, 
        External_Name => "FcValueEqual";

   function FcValueSave (v : FcValue) return FcValue  -- /usr/include/fontconfig/fontconfig.h:868
   with Import => True, 
        Convention => C, 
        External_Name => "FcValueSave";

   procedure FcPatternDestroy (p : access FcPattern)  -- /usr/include/fontconfig/fontconfig.h:871
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternDestroy";

   function FcPatternObjectCount (pat : access constant FcPattern) return int  -- /usr/include/fontconfig/fontconfig.h:874
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternObjectCount";

   function FcPatternEqual (pa : access constant FcPattern; pb : access constant FcPattern) return FcBool  -- /usr/include/fontconfig/fontconfig.h:877
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternEqual";

   function FcPatternEqualSubset
     (pa : access constant FcPattern;
      pb : access constant FcPattern;
      os : access constant FcObjectSet) return FcBool  -- /usr/include/fontconfig/fontconfig.h:880
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternEqualSubset";

   function FcPatternHash (p : access constant FcPattern) return FcChar32  -- /usr/include/fontconfig/fontconfig.h:883
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternHash";

   function FcPatternAdd
     (p : access FcPattern;
      object : Interfaces.C.Strings.chars_ptr;
      value : FcValue;
      append : FcBool) return FcBool  -- /usr/include/fontconfig/fontconfig.h:886
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternAdd";

   function FcPatternAddWeak
     (p : access FcPattern;
      object : Interfaces.C.Strings.chars_ptr;
      value : FcValue;
      append : FcBool) return FcBool  -- /usr/include/fontconfig/fontconfig.h:889
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternAddWeak";

   function FcPatternGet
     (p : access constant FcPattern;
      object : Interfaces.C.Strings.chars_ptr;
      id : int;
      v : access FcValue) return FcResult  -- /usr/include/fontconfig/fontconfig.h:892
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternGet";

   function FcPatternGetWithBinding
     (p : access constant FcPattern;
      object : Interfaces.C.Strings.chars_ptr;
      id : int;
      v : access FcValue;
      b : access FcValueBinding) return FcResult  -- /usr/include/fontconfig/fontconfig.h:895
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternGetWithBinding";

   function FcPatternDel (p : access FcPattern; object : Interfaces.C.Strings.chars_ptr) return FcBool  -- /usr/include/fontconfig/fontconfig.h:898
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternDel";

   function FcPatternRemove
     (p : access FcPattern;
      object : Interfaces.C.Strings.chars_ptr;
      id : int) return FcBool  -- /usr/include/fontconfig/fontconfig.h:901
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternRemove";

   function FcPatternAddInteger
     (p : access FcPattern;
      object : Interfaces.C.Strings.chars_ptr;
      i : int) return FcBool  -- /usr/include/fontconfig/fontconfig.h:904
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternAddInteger";

   function FcPatternAddDouble
     (p : access FcPattern;
      object : Interfaces.C.Strings.chars_ptr;
      d : double) return FcBool  -- /usr/include/fontconfig/fontconfig.h:907
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternAddDouble";

   function FcPatternAddString
     (p : access FcPattern;
      object : Interfaces.C.Strings.chars_ptr;
      s : access FcChar8) return FcBool  -- /usr/include/fontconfig/fontconfig.h:910
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternAddString";

   function FcPatternAddMatrix
     (p : access FcPattern;
      object : Interfaces.C.Strings.chars_ptr;
      s : access constant FcMatrix) return FcBool  -- /usr/include/fontconfig/fontconfig.h:913
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternAddMatrix";

   function FcPatternAddCharSet
     (p : access FcPattern;
      object : Interfaces.C.Strings.chars_ptr;
      c : access constant FcCharSet) return FcBool  -- /usr/include/fontconfig/fontconfig.h:916
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternAddCharSet";

   function FcPatternAddBool
     (p : access FcPattern;
      object : Interfaces.C.Strings.chars_ptr;
      b : FcBool) return FcBool  -- /usr/include/fontconfig/fontconfig.h:919
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternAddBool";

   function FcPatternAddLangSet
     (p : access FcPattern;
      object : Interfaces.C.Strings.chars_ptr;
      ls : access constant FcLangSet) return FcBool  -- /usr/include/fontconfig/fontconfig.h:922
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternAddLangSet";

   function FcPatternAddRange
     (p : access FcPattern;
      object : Interfaces.C.Strings.chars_ptr;
      r : access constant FcRange) return FcBool  -- /usr/include/fontconfig/fontconfig.h:925
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternAddRange";

   function FcPatternGetInteger
     (p : access constant FcPattern;
      object : Interfaces.C.Strings.chars_ptr;
      n : int;
      i : access int) return FcResult  -- /usr/include/fontconfig/fontconfig.h:928
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternGetInteger";

   function FcPatternGetDouble
     (p : access constant FcPattern;
      object : Interfaces.C.Strings.chars_ptr;
      n : int;
      d : access double) return FcResult  -- /usr/include/fontconfig/fontconfig.h:931
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternGetDouble";

   function FcPatternGetString
     (p : access constant FcPattern;
      object : Interfaces.C.Strings.chars_ptr;
      n : int;
      s : System.Address) return FcResult  -- /usr/include/fontconfig/fontconfig.h:934
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternGetString";

   function FcPatternGetMatrix
     (p : access constant FcPattern;
      object : Interfaces.C.Strings.chars_ptr;
      n : int;
      s : System.Address) return FcResult  -- /usr/include/fontconfig/fontconfig.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternGetMatrix";

   function FcPatternGetCharSet
     (p : access constant FcPattern;
      object : Interfaces.C.Strings.chars_ptr;
      n : int;
      c : System.Address) return FcResult  -- /usr/include/fontconfig/fontconfig.h:940
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternGetCharSet";

   function FcPatternGetBool
     (p : access constant FcPattern;
      object : Interfaces.C.Strings.chars_ptr;
      n : int;
      b : access FcBool) return FcResult  -- /usr/include/fontconfig/fontconfig.h:943
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternGetBool";

   function FcPatternGetLangSet
     (p : access constant FcPattern;
      object : Interfaces.C.Strings.chars_ptr;
      n : int;
      ls : System.Address) return FcResult  -- /usr/include/fontconfig/fontconfig.h:946
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternGetLangSet";

   function FcPatternGetRange
     (p : access constant FcPattern;
      object : Interfaces.C.Strings.chars_ptr;
      id : int;
      r : System.Address) return FcResult  -- /usr/include/fontconfig/fontconfig.h:949
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternGetRange";

   function FcPatternVaBuild (p : access FcPattern; va : access System.Address) return access FcPattern  -- /usr/include/fontconfig/fontconfig.h:952
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternVaBuild";

   function FcPatternBuild (p : access FcPattern  -- , ...
      ) return access FcPattern  -- /usr/include/fontconfig/fontconfig.h:955
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternBuild";

   function FcPatternFormat (pat : access FcPattern; format : access FcChar8) return access FcChar8  -- /usr/include/fontconfig/fontconfig.h:958
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternFormat";

  -- fcrange.c  
   function FcRangeCreateDouble (c_begin : double; c_end : double) return access FcRange  -- /usr/include/fontconfig/fontconfig.h:962
   with Import => True, 
        Convention => C, 
        External_Name => "FcRangeCreateDouble";

   function FcRangeCreateInteger (c_begin : FcChar32; c_end : FcChar32) return access FcRange  -- /usr/include/fontconfig/fontconfig.h:965
   with Import => True, 
        Convention => C, 
        External_Name => "FcRangeCreateInteger";

   procedure FcRangeDestroy (c_range : access FcRange)  -- /usr/include/fontconfig/fontconfig.h:968
   with Import => True, 
        Convention => C, 
        External_Name => "FcRangeDestroy";

   function FcRangeCopy (r : access constant FcRange) return access FcRange  -- /usr/include/fontconfig/fontconfig.h:971
   with Import => True, 
        Convention => C, 
        External_Name => "FcRangeCopy";

   function FcRangeGetDouble
     (c_range : access constant FcRange;
      c_begin : access double;
      c_end : access double) return FcBool  -- /usr/include/fontconfig/fontconfig.h:974
   with Import => True, 
        Convention => C, 
        External_Name => "FcRangeGetDouble";

   procedure FcPatternIterStart (pat : access constant FcPattern; iter : access FcPatternIter)  -- /usr/include/fontconfig/fontconfig.h:977
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternIterStart";

   function FcPatternIterNext (pat : access constant FcPattern; iter : access FcPatternIter) return FcBool  -- /usr/include/fontconfig/fontconfig.h:980
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternIterNext";

   function FcPatternIterEqual
     (p1 : access constant FcPattern;
      i1 : access FcPatternIter;
      p2 : access constant FcPattern;
      i2 : access FcPatternIter) return FcBool  -- /usr/include/fontconfig/fontconfig.h:983
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternIterEqual";

   function FcPatternFindIter
     (pat : access constant FcPattern;
      iter : access FcPatternIter;
      object : Interfaces.C.Strings.chars_ptr) return FcBool  -- /usr/include/fontconfig/fontconfig.h:987
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternFindIter";

   function FcPatternIterIsValid (pat : access constant FcPattern; iter : access FcPatternIter) return FcBool  -- /usr/include/fontconfig/fontconfig.h:990
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternIterIsValid";

   function FcPatternIterGetObject (pat : access constant FcPattern; iter : access FcPatternIter) return Interfaces.C.Strings.chars_ptr  -- /usr/include/fontconfig/fontconfig.h:993
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternIterGetObject";

   function FcPatternIterValueCount (pat : access constant FcPattern; iter : access FcPatternIter) return int  -- /usr/include/fontconfig/fontconfig.h:996
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternIterValueCount";

   function FcPatternIterGetValue
     (pat : access constant FcPattern;
      iter : access FcPatternIter;
      id : int;
      v : access FcValue;
      b : access FcValueBinding) return FcResult  -- /usr/include/fontconfig/fontconfig.h:999
   with Import => True, 
        Convention => C, 
        External_Name => "FcPatternIterGetValue";

  -- fcweight.c  
   function FcWeightFromOpenType (ot_weight : int) return int  -- /usr/include/fontconfig/fontconfig.h:1004
   with Import => True, 
        Convention => C, 
        External_Name => "FcWeightFromOpenType";

   function FcWeightFromOpenTypeDouble (ot_weight : double) return double  -- /usr/include/fontconfig/fontconfig.h:1007
   with Import => True, 
        Convention => C, 
        External_Name => "FcWeightFromOpenTypeDouble";

   function FcWeightToOpenType (fc_weight : int) return int  -- /usr/include/fontconfig/fontconfig.h:1010
   with Import => True, 
        Convention => C, 
        External_Name => "FcWeightToOpenType";

   function FcWeightToOpenTypeDouble (fc_weight : double) return double  -- /usr/include/fontconfig/fontconfig.h:1013
   with Import => True, 
        Convention => C, 
        External_Name => "FcWeightToOpenTypeDouble";

  -- fcstr.c  
   function FcStrCopy (s : access FcChar8) return access FcChar8  -- /usr/include/fontconfig/fontconfig.h:1018
   with Import => True, 
        Convention => C, 
        External_Name => "FcStrCopy";

   function FcStrCopyFilename (s : access FcChar8) return access FcChar8  -- /usr/include/fontconfig/fontconfig.h:1021
   with Import => True, 
        Convention => C, 
        External_Name => "FcStrCopyFilename";

   function FcStrPlus (s1 : access FcChar8; s2 : access FcChar8) return access FcChar8  -- /usr/include/fontconfig/fontconfig.h:1024
   with Import => True, 
        Convention => C, 
        External_Name => "FcStrPlus";

   procedure FcStrFree (s : access FcChar8)  -- /usr/include/fontconfig/fontconfig.h:1027
   with Import => True, 
        Convention => C, 
        External_Name => "FcStrFree";

  -- These are ASCII only, suitable only for pattern element names  
   function FcStrDowncase (s : access FcChar8) return access FcChar8  -- /usr/include/fontconfig/fontconfig.h:1035
   with Import => True, 
        Convention => C, 
        External_Name => "FcStrDowncase";

   function FcStrCmpIgnoreCase (s1 : access FcChar8; s2 : access FcChar8) return int  -- /usr/include/fontconfig/fontconfig.h:1038
   with Import => True, 
        Convention => C, 
        External_Name => "FcStrCmpIgnoreCase";

   function FcStrCmp (s1 : access FcChar8; s2 : access FcChar8) return int  -- /usr/include/fontconfig/fontconfig.h:1041
   with Import => True, 
        Convention => C, 
        External_Name => "FcStrCmp";

   function FcStrStrIgnoreCase (s1 : access FcChar8; s2 : access FcChar8) return access FcChar8  -- /usr/include/fontconfig/fontconfig.h:1044
   with Import => True, 
        Convention => C, 
        External_Name => "FcStrStrIgnoreCase";

   function FcStrStr (s1 : access FcChar8; s2 : access FcChar8) return access FcChar8  -- /usr/include/fontconfig/fontconfig.h:1047
   with Import => True, 
        Convention => C, 
        External_Name => "FcStrStr";

   function FcUtf8ToUcs4
     (src_orig : access FcChar8;
      dst : access FcChar32;
      len : int) return int  -- /usr/include/fontconfig/fontconfig.h:1050
   with Import => True, 
        Convention => C, 
        External_Name => "FcUtf8ToUcs4";

   function FcUtf8Len
     (string : access FcChar8;
      len : int;
      nchar : access int;
      wchar : access int) return FcBool  -- /usr/include/fontconfig/fontconfig.h:1055
   with Import => True, 
        Convention => C, 
        External_Name => "FcUtf8Len";

   function FcUcs4ToUtf8 (ucs4 : FcChar32; dest : access FcChar8) return int  -- /usr/include/fontconfig/fontconfig.h:1063
   with Import => True, 
        Convention => C, 
        External_Name => "FcUcs4ToUtf8";

   function FcUtf16ToUcs4
     (src_orig : access FcChar8;
      endian : FcEndian;
      dst : access FcChar32;
      len : int) return int  -- /usr/include/fontconfig/fontconfig.h:1067
   with Import => True, 
        Convention => C, 
        External_Name => "FcUtf16ToUcs4";

  -- in bytes  
   function FcUtf16Len
     (string : access FcChar8;
      endian : FcEndian;
      len : int;
      nchar : access int;
      wchar : access int) return FcBool  -- /usr/include/fontconfig/fontconfig.h:1073
   with Import => True, 
        Convention => C, 
        External_Name => "FcUtf16Len";

  -- in bytes  
   function FcStrDirname (file : access FcChar8) return access FcChar8  -- /usr/include/fontconfig/fontconfig.h:1080
   with Import => True, 
        Convention => C, 
        External_Name => "FcStrDirname";

   function FcStrBasename (file : access FcChar8) return access FcChar8  -- /usr/include/fontconfig/fontconfig.h:1083
   with Import => True, 
        Convention => C, 
        External_Name => "FcStrBasename";

   function FcStrSetCreate return access FcStrSet  -- /usr/include/fontconfig/fontconfig.h:1086
   with Import => True, 
        Convention => C, 
        External_Name => "FcStrSetCreate";

   function FcStrSetMember (set : access FcStrSet; s : access FcChar8) return FcBool  -- /usr/include/fontconfig/fontconfig.h:1089
   with Import => True, 
        Convention => C, 
        External_Name => "FcStrSetMember";

   function FcStrSetEqual (sa : access FcStrSet; sb : access FcStrSet) return FcBool  -- /usr/include/fontconfig/fontconfig.h:1092
   with Import => True, 
        Convention => C, 
        External_Name => "FcStrSetEqual";

   function FcStrSetAdd (set : access FcStrSet; s : access FcChar8) return FcBool  -- /usr/include/fontconfig/fontconfig.h:1095
   with Import => True, 
        Convention => C, 
        External_Name => "FcStrSetAdd";

   function FcStrSetAddFilename (set : access FcStrSet; s : access FcChar8) return FcBool  -- /usr/include/fontconfig/fontconfig.h:1098
   with Import => True, 
        Convention => C, 
        External_Name => "FcStrSetAddFilename";

   function FcStrSetDel (set : access FcStrSet; s : access FcChar8) return FcBool  -- /usr/include/fontconfig/fontconfig.h:1101
   with Import => True, 
        Convention => C, 
        External_Name => "FcStrSetDel";

   procedure FcStrSetDestroy (set : access FcStrSet)  -- /usr/include/fontconfig/fontconfig.h:1104
   with Import => True, 
        Convention => C, 
        External_Name => "FcStrSetDestroy";

   function FcStrListCreate (set : access FcStrSet) return access FcStrList  -- /usr/include/fontconfig/fontconfig.h:1107
   with Import => True, 
        Convention => C, 
        External_Name => "FcStrListCreate";

   procedure FcStrListFirst (list : access FcStrList)  -- /usr/include/fontconfig/fontconfig.h:1110
   with Import => True, 
        Convention => C, 
        External_Name => "FcStrListFirst";

   function FcStrListNext (list : access FcStrList) return access FcChar8  -- /usr/include/fontconfig/fontconfig.h:1113
   with Import => True, 
        Convention => C, 
        External_Name => "FcStrListNext";

   procedure FcStrListDone (list : access FcStrList)  -- /usr/include/fontconfig/fontconfig.h:1116
   with Import => True, 
        Convention => C, 
        External_Name => "FcStrListDone";

  -- fcxml.c  
   function FcConfigParseAndLoad
     (config : access FcConfig;
      file : access FcChar8;
      complain : FcBool) return FcBool  -- /usr/include/fontconfig/fontconfig.h:1120
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigParseAndLoad";

   function FcConfigParseAndLoadFromMemory
     (config : access FcConfig;
      buffer : access FcChar8;
      complain : FcBool) return FcBool  -- /usr/include/fontconfig/fontconfig.h:1123
   with Import => True, 
        Convention => C, 
        External_Name => "FcConfigParseAndLoadFromMemory";

  -- * Deprecated functions are placed here to help users fix their code without
  -- * digging through documentation
  --  

end fontconfig;
