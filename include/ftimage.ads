pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;

package ftimage is

   --  unsupported macro: ft_pixel_mode_none FT_PIXEL_MODE_NONE
   --  unsupported macro: ft_pixel_mode_mono FT_PIXEL_MODE_MONO
   --  unsupported macro: ft_pixel_mode_grays FT_PIXEL_MODE_GRAY
   --  unsupported macro: ft_pixel_mode_pal2 FT_PIXEL_MODE_GRAY2
   --  unsupported macro: ft_pixel_mode_pal4 FT_PIXEL_MODE_GRAY4
   --  unsupported macro: FT_OUTLINE_CONTOURS_MAX SHRT_MAX
   --  unsupported macro: FT_OUTLINE_POINTS_MAX SHRT_MAX
   FT_OUTLINE_NONE : constant := 16#0#;  --  /usr/include/freetype2/freetype/ftimage.h:434
   FT_OUTLINE_OWNER : constant := 16#1#;  --  /usr/include/freetype2/freetype/ftimage.h:435
   FT_OUTLINE_EVEN_ODD_FILL : constant := 16#2#;  --  /usr/include/freetype2/freetype/ftimage.h:436
   FT_OUTLINE_REVERSE_FILL : constant := 16#4#;  --  /usr/include/freetype2/freetype/ftimage.h:437
   FT_OUTLINE_IGNORE_DROPOUTS : constant := 16#8#;  --  /usr/include/freetype2/freetype/ftimage.h:438
   FT_OUTLINE_SMART_DROPOUTS : constant := 16#10#;  --  /usr/include/freetype2/freetype/ftimage.h:439
   FT_OUTLINE_INCLUDE_STUBS : constant := 16#20#;  --  /usr/include/freetype2/freetype/ftimage.h:440
   FT_OUTLINE_OVERLAP : constant := 16#40#;  --  /usr/include/freetype2/freetype/ftimage.h:441

   FT_OUTLINE_HIGH_PRECISION : constant := 16#100#;  --  /usr/include/freetype2/freetype/ftimage.h:443
   FT_OUTLINE_SINGLE_PASS : constant := 16#200#;  --  /usr/include/freetype2/freetype/ftimage.h:444
   --  unsupported macro: ft_outline_none FT_OUTLINE_NONE
   --  unsupported macro: ft_outline_owner FT_OUTLINE_OWNER
   --  unsupported macro: ft_outline_even_odd_fill FT_OUTLINE_EVEN_ODD_FILL
   --  unsupported macro: ft_outline_reverse_fill FT_OUTLINE_REVERSE_FILL
   --  unsupported macro: ft_outline_ignore_dropouts FT_OUTLINE_IGNORE_DROPOUTS
   --  unsupported macro: ft_outline_high_precision FT_OUTLINE_HIGH_PRECISION
   --  unsupported macro: ft_outline_single_pass FT_OUTLINE_SINGLE_PASS
   --  arg-macro: function FT_CURVE_TAG (flag)
   --    return  flag and 16#03# ;

   FT_CURVE_TAG_ON : constant := 16#01#;  --  /usr/include/freetype2/freetype/ftimage.h:462
   FT_CURVE_TAG_CONIC : constant := 16#00#;  --  /usr/include/freetype2/freetype/ftimage.h:463
   FT_CURVE_TAG_CUBIC : constant := 16#02#;  --  /usr/include/freetype2/freetype/ftimage.h:464

   FT_CURVE_TAG_HAS_SCANMODE : constant := 16#04#;  --  /usr/include/freetype2/freetype/ftimage.h:466

   FT_CURVE_TAG_TOUCH_X : constant := 16#08#;  --  /usr/include/freetype2/freetype/ftimage.h:468
   FT_CURVE_TAG_TOUCH_Y : constant := 16#10#;  --  /usr/include/freetype2/freetype/ftimage.h:469
   --  unsupported macro: FT_CURVE_TAG_TOUCH_BOTH ( FT_CURVE_TAG_TOUCH_X | FT_CURVE_TAG_TOUCH_Y )
   --  unsupported macro: FT_Curve_Tag_On FT_CURVE_TAG_ON
   --  unsupported macro: FT_Curve_Tag_Conic FT_CURVE_TAG_CONIC
   --  unsupported macro: FT_Curve_Tag_Cubic FT_CURVE_TAG_CUBIC
   --  unsupported macro: FT_Curve_Tag_Touch_X FT_CURVE_TAG_TOUCH_X
   --  unsupported macro: FT_Curve_Tag_Touch_Y FT_CURVE_TAG_TOUCH_Y
   --  unsupported macro: FT_Outline_MoveTo_Func FT_Outline_MoveToFunc
   --  unsupported macro: FT_Outline_LineTo_Func FT_Outline_LineToFunc
   --  unsupported macro: FT_Outline_ConicTo_Func FT_Outline_ConicToFunc
   --  unsupported macro: FT_Outline_CubicTo_Func FT_Outline_CubicToFunc
   --  arg-macro: procedure FT_IMAGE_TAG (value, _x1, _x2, _x3, _x4)
   --    value := ( ( (unsigned long)_x1 << 24 ) or ( (unsigned long)_x2 << 16 ) or ( (unsigned long)_x3 << 8 ) or (unsigned long)_x4 )
   --  unsupported macro: ft_glyph_format_none FT_GLYPH_FORMAT_NONE
   --  unsupported macro: ft_glyph_format_composite FT_GLYPH_FORMAT_COMPOSITE
   --  unsupported macro: ft_glyph_format_bitmap FT_GLYPH_FORMAT_BITMAP
   --  unsupported macro: ft_glyph_format_outline FT_GLYPH_FORMAT_OUTLINE
   --  unsupported macro: ft_glyph_format_plotter FT_GLYPH_FORMAT_PLOTTER
   --  unsupported macro: FT_Raster_Span_Func FT_SpanFunc

   FT_RASTER_FLAG_DEFAULT : constant := 16#0#;  --  /usr/include/freetype2/freetype/ftimage.h:966
   FT_RASTER_FLAG_AA : constant := 16#1#;  --  /usr/include/freetype2/freetype/ftimage.h:967
   FT_RASTER_FLAG_DIRECT : constant := 16#2#;  --  /usr/include/freetype2/freetype/ftimage.h:968
   FT_RASTER_FLAG_CLIP : constant := 16#4#;  --  /usr/include/freetype2/freetype/ftimage.h:969
   --  unsupported macro: ft_raster_flag_default FT_RASTER_FLAG_DEFAULT
   --  unsupported macro: ft_raster_flag_aa FT_RASTER_FLAG_AA
   --  unsupported macro: ft_raster_flag_direct FT_RASTER_FLAG_DIRECT
   --  unsupported macro: ft_raster_flag_clip FT_RASTER_FLAG_CLIP
   --  unsupported macro: FT_Raster_New_Func FT_Raster_NewFunc
   --  unsupported macro: FT_Raster_Done_Func FT_Raster_DoneFunc
   --  unsupported macro: FT_Raster_Reset_Func FT_Raster_ResetFunc
   --  unsupported macro: FT_Raster_Set_Mode_Func FT_Raster_SetModeFunc
   --  unsupported macro: FT_Raster_Render_Func FT_Raster_RenderFunc

  --***************************************************************************
  -- *
  -- * ftimage.h
  -- *
  -- *   FreeType glyph image formats and default raster interface
  -- *   (specification).
  -- *
  -- * Copyright (C) 1996-2020 by
  -- * David Turner, Robert Wilhelm, and Werner Lemberg.
  -- *
  -- * This file is part of the FreeType project, and may only be used,
  -- * modified, and distributed under the terms of the FreeType project
  -- * license, LICENSE.TXT.  By continuing to use, modify, or distribute
  -- * this file you indicate that you have read the license and
  -- * understand and accept it fully.
  -- *
  --  

  --*************************************************************************
  --   *
  --   * Note: A 'raster' is simply a scan-line converter, used to render
  --   *       FT_Outlines into FT_Bitmaps.
  --   *
  --    

  -- STANDALONE_ is from ftgrays.c  
  --*************************************************************************
  --   *
  --   * @section:
  --   *   basic_types
  --   *
  --    

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_Pos
  --   *
  --   * @description:
  --   *   The type FT_Pos is used to store vectorial coordinates.  Depending on
  --   *   the context, these can represent distances in integer font units, or
  --   *   16.16, or 26.6 fixed-point pixel coordinates.
  --    

   subtype FT_Pos is long;  -- /usr/include/freetype2/freetype/ftimage.h:57

  --*************************************************************************
  --   *
  --   * @struct:
  --   *   FT_Vector
  --   *
  --   * @description:
  --   *   A simple structure used to store a 2D vector; coordinates are of the
  --   *   FT_Pos type.
  --   *
  --   * @fields:
  --   *   x ::
  --   *     The horizontal coordinate.
  --   *   y ::
  --   *     The vertical coordinate.
  --    

   type FT_Vector_u is record
      x : aliased FT_Pos;  -- /usr/include/freetype2/freetype/ftimage.h:77
      y : aliased FT_Pos;  -- /usr/include/freetype2/freetype/ftimage.h:78
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/freetype2/freetype/ftimage.h:75

   subtype FT_Vector is FT_Vector_u;  -- /usr/include/freetype2/freetype/ftimage.h:80

  --*************************************************************************
  --   *
  --   * @struct:
  --   *   FT_BBox
  --   *
  --   * @description:
  --   *   A structure used to hold an outline's bounding box, i.e., the
  --   *   coordinates of its extrema in the horizontal and vertical directions.
  --   *
  --   * @fields:
  --   *   xMin ::
  --   *     The horizontal minimum (left-most).
  --   *
  --   *   yMin ::
  --   *     The vertical minimum (bottom-most).
  --   *
  --   *   xMax ::
  --   *     The horizontal maximum (right-most).
  --   *
  --   *   yMax ::
  --   *     The vertical maximum (top-most).
  --   *
  --   * @note:
  --   *   The bounding box is specified with the coordinates of the lower left
  --   *   and the upper right corner.  In PostScript, those values are often
  --   *   called (llx,lly) and (urx,ury), respectively.
  --   *
  --   *   If `yMin` is negative, this value gives the glyph's descender.
  --   *   Otherwise, the glyph doesn't descend below the baseline.  Similarly,
  --   *   if `ymax` is positive, this value gives the glyph's ascender.
  --   *
  --   *   `xMin` gives the horizontal distance from the glyph's origin to the
  --   *   left edge of the glyph's bounding box.  If `xMin` is negative, the
  --   *   glyph extends to the left of the origin.
  --    

   type FT_BBox_u is record
      xMin : aliased FT_Pos;  -- /usr/include/freetype2/freetype/ftimage.h:120
      yMin : aliased FT_Pos;  -- /usr/include/freetype2/freetype/ftimage.h:120
      xMax : aliased FT_Pos;  -- /usr/include/freetype2/freetype/ftimage.h:121
      yMax : aliased FT_Pos;  -- /usr/include/freetype2/freetype/ftimage.h:121
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/freetype2/freetype/ftimage.h:118

   subtype FT_BBox is FT_BBox_u;  -- /usr/include/freetype2/freetype/ftimage.h:123

  --*************************************************************************
  --   *
  --   * @enum:
  --   *   FT_Pixel_Mode
  --   *
  --   * @description:
  --   *   An enumeration type used to describe the format of pixels in a given
  --   *   bitmap.  Note that additional formats may be added in the future.
  --   *
  --   * @values:
  --   *   FT_PIXEL_MODE_NONE ::
  --   *     Value~0 is reserved.
  --   *
  --   *   FT_PIXEL_MODE_MONO ::
  --   *     A monochrome bitmap, using 1~bit per pixel.  Note that pixels are
  --   *     stored in most-significant order (MSB), which means that the
  --   *     left-most pixel in a byte has value 128.
  --   *
  --   *   FT_PIXEL_MODE_GRAY ::
  --   *     An 8-bit bitmap, generally used to represent anti-aliased glyph
  --   *     images.  Each pixel is stored in one byte.  Note that the number of
  --   *     'gray' levels is stored in the `num_grays` field of the @FT_Bitmap
  --   *     structure (it generally is 256).
  --   *
  --   *   FT_PIXEL_MODE_GRAY2 ::
  --   *     A 2-bit per pixel bitmap, used to represent embedded anti-aliased
  --   *     bitmaps in font files according to the OpenType specification.  We
  --   *     haven't found a single font using this format, however.
  --   *
  --   *   FT_PIXEL_MODE_GRAY4 ::
  --   *     A 4-bit per pixel bitmap, representing embedded anti-aliased bitmaps
  --   *     in font files according to the OpenType specification.  We haven't
  --   *     found a single font using this format, however.
  --   *
  --   *   FT_PIXEL_MODE_LCD ::
  --   *     An 8-bit bitmap, representing RGB or BGR decimated glyph images used
  --   *     for display on LCD displays; the bitmap is three times wider than
  --   *     the original glyph image.  See also @FT_RENDER_MODE_LCD.
  --   *
  --   *   FT_PIXEL_MODE_LCD_V ::
  --   *     An 8-bit bitmap, representing RGB or BGR decimated glyph images used
  --   *     for display on rotated LCD displays; the bitmap is three times
  --   *     taller than the original glyph image.  See also
  --   *     @FT_RENDER_MODE_LCD_V.
  --   *
  --   *   FT_PIXEL_MODE_BGRA ::
  --   *     [Since 2.5] An image with four 8-bit channels per pixel,
  --   *     representing a color image (such as emoticons) with alpha channel.
  --   *     For each pixel, the format is BGRA, which means, the blue channel
  --   *     comes first in memory.  The color channels are pre-multiplied and in
  --   *     the sRGB colorspace.  For example, full red at half-translucent
  --   *     opacity will be represented as '00,00,80,80', not '00,00,FF,80'.
  --   *     See also @FT_LOAD_COLOR.
  --    

   type FT_Pixel_Mode_u is 
     (FT_PIXEL_MODE_NONE,
      FT_PIXEL_MODE_MONO,
      FT_PIXEL_MODE_GRAY,
      FT_PIXEL_MODE_GRAY2,
      FT_PIXEL_MODE_GRAY4,
      FT_PIXEL_MODE_LCD,
      FT_PIXEL_MODE_LCD_V,
      FT_PIXEL_MODE_BGRA,
      FT_PIXEL_MODE_MAX)
   with Convention => C;  -- /usr/include/freetype2/freetype/ftimage.h:180

  -- do not remove  
   subtype FT_Pixel_Mode is FT_Pixel_Mode_u;  -- /usr/include/freetype2/freetype/ftimage.h:193

  -- these constants are deprecated; use the corresponding `FT_Pixel_Mode`  
  -- values instead.                                                        
  --*************************************************************************
  --   *
  --   * @struct:
  --   *   FT_Bitmap
  --   *
  --   * @description:
  --   *   A structure used to describe a bitmap or pixmap to the raster.  Note
  --   *   that we now manage pixmaps of various depths through the `pixel_mode`
  --   *   field.
  --   *
  --   * @fields:
  --   *   rows ::
  --   *     The number of bitmap rows.
  --   *
  --   *   width ::
  --   *     The number of pixels in bitmap row.
  --   *
  --   *   pitch ::
  --   *     The pitch's absolute value is the number of bytes taken by one
  --   *     bitmap row, including padding.  However, the pitch is positive when
  --   *     the bitmap has a 'down' flow, and negative when it has an 'up' flow.
  --   *     In all cases, the pitch is an offset to add to a bitmap pointer in
  --   *     order to go down one row.
  --   *
  --   *     Note that 'padding' means the alignment of a bitmap to a byte
  --   *     border, and FreeType functions normally align to the smallest
  --   *     possible integer value.
  --   *
  --   *     For the B/W rasterizer, `pitch` is always an even number.
  --   *
  --   *     To change the pitch of a bitmap (say, to make it a multiple of 4),
  --   *     use @FT_Bitmap_Convert.  Alternatively, you might use callback
  --   *     functions to directly render to the application's surface; see the
  --   *     file `example2.cpp` in the tutorial for a demonstration.
  --   *
  --   *   buffer ::
  --   *     A typeless pointer to the bitmap buffer.  This value should be
  --   *     aligned on 32-bit boundaries in most cases.
  --   *
  --   *   num_grays ::
  --   *     This field is only used with @FT_PIXEL_MODE_GRAY; it gives the
  --   *     number of gray levels used in the bitmap.
  --   *
  --   *   pixel_mode ::
  --   *     The pixel mode, i.e., how pixel bits are stored.  See @FT_Pixel_Mode
  --   *     for possible values.
  --   *
  --   *   palette_mode ::
  --   *     This field is intended for paletted pixel modes; it indicates how
  --   *     the palette is stored.  Not used currently.
  --   *
  --   *   palette ::
  --   *     A typeless pointer to the bitmap palette; this field is intended for
  --   *     paletted pixel modes.  Not used currently.
  --    
  -- Troodon: changed buffer type to System.Address for interop w OpenGL
   type FT_Bitmap_u is record
      rows : aliased unsigned;  -- /usr/include/freetype2/freetype/ftimage.h:262
      width : aliased unsigned;  -- /usr/include/freetype2/freetype/ftimage.h:263
      pitch : aliased int;  -- /usr/include/freetype2/freetype/ftimage.h:264
      buffer : System.Address;  -- /usr/include/freetype2/freetype/ftimage.h:265
      num_grays : aliased unsigned_short;  -- /usr/include/freetype2/freetype/ftimage.h:266
      pixel_mode : aliased unsigned_char;  -- /usr/include/freetype2/freetype/ftimage.h:267
      palette_mode : aliased unsigned_char;  -- /usr/include/freetype2/freetype/ftimage.h:268
      palette : System.Address;  -- /usr/include/freetype2/freetype/ftimage.h:269
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/freetype2/freetype/ftimage.h:260

   subtype FT_Bitmap is FT_Bitmap_u;  -- /usr/include/freetype2/freetype/ftimage.h:271

  --*************************************************************************
  --   *
  --   * @section:
  --   *   outline_processing
  --   *
  --    

  --*************************************************************************
  --   *
  --   * @struct:
  --   *   FT_Outline
  --   *
  --   * @description:
  --   *   This structure is used to describe an outline to the scan-line
  --   *   converter.
  --   *
  --   * @fields:
  --   *   n_contours ::
  --   *     The number of contours in the outline.
  --   *
  --   *   n_points ::
  --   *     The number of points in the outline.
  --   *
  --   *   points ::
  --   *     A pointer to an array of `n_points` @FT_Vector elements, giving the
  --   *     outline's point coordinates.
  --   *
  --   *   tags ::
  --   *     A pointer to an array of `n_points` chars, giving each outline
  --   *     point's type.
  --   *
  --   *     If bit~0 is unset, the point is 'off' the curve, i.e., a Bezier
  --   *     control point, while it is 'on' if set.
  --   *
  --   *     Bit~1 is meaningful for 'off' points only.  If set, it indicates a
  --   *     third-order Bezier arc control point; and a second-order control
  --   *     point if unset.
  --   *
  --   *     If bit~2 is set, bits 5-7 contain the drop-out mode (as defined in
  --   *     the OpenType specification; the value is the same as the argument to
  --   *     the 'SCANMODE' instruction).
  --   *
  --   *     Bits 3 and~4 are reserved for internal purposes.
  --   *
  --   *   contours ::
  --   *     An array of `n_contours` shorts, giving the end point of each
  --   *     contour within the outline.  For example, the first contour is
  --   *     defined by the points '0' to `contours[0]`, the second one is
  --   *     defined by the points `contours[0]+1` to `contours[1]`, etc.
  --   *
  --   *   flags ::
  --   *     A set of bit flags used to characterize the outline and give hints
  --   *     to the scan-converter and hinter on how to convert/grid-fit it.  See
  --   *     @FT_OUTLINE_XXX.
  --   *
  --   * @note:
  --   *   The B/W rasterizer only checks bit~2 in the `tags` array for the first
  --   *   point of each contour.  The drop-out mode as given with
  --   *   @FT_OUTLINE_IGNORE_DROPOUTS, @FT_OUTLINE_SMART_DROPOUTS, and
  --   *   @FT_OUTLINE_INCLUDE_STUBS in `flags` is then overridden.
  --    

  -- number of contours in glyph         
   type FT_Outline_u is record
      n_contours : aliased short;  -- /usr/include/freetype2/freetype/ftimage.h:338
      n_points : aliased short;  -- /usr/include/freetype2/freetype/ftimage.h:339
      points : access FT_Vector;  -- /usr/include/freetype2/freetype/ftimage.h:341
      tags : Interfaces.C.Strings.chars_ptr;  -- /usr/include/freetype2/freetype/ftimage.h:342
      contours : access short;  -- /usr/include/freetype2/freetype/ftimage.h:343
      flags : aliased int;  -- /usr/include/freetype2/freetype/ftimage.h:345
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/freetype2/freetype/ftimage.h:336

  -- number of points in the glyph       
  -- the outline's points                
  -- the points flags                    
  -- the contour end points              
  -- outline masks                       
   subtype FT_Outline is FT_Outline_u;  -- /usr/include/freetype2/freetype/ftimage.h:347

  --  
  -- Following limits must be consistent with  
  -- FT_Outline.{n_contours,n_points}          
  --*************************************************************************
  --   *
  --   * @enum:
  --   *   FT_OUTLINE_XXX
  --   *
  --   * @description:
  --   *   A list of bit-field constants used for the flags in an outline's
  --   *   `flags` field.
  --   *
  --   * @values:
  --   *   FT_OUTLINE_NONE ::
  --   *     Value~0 is reserved.
  --   *
  --   *   FT_OUTLINE_OWNER ::
  --   *     If set, this flag indicates that the outline's field arrays (i.e.,
  --   *     `points`, `flags`, and `contours`) are 'owned' by the outline
  --   *     object, and should thus be freed when it is destroyed.
  --   *
  --   *   FT_OUTLINE_EVEN_ODD_FILL ::
  --   *     By default, outlines are filled using the non-zero winding rule.  If
  --   *     set to 1, the outline will be filled using the even-odd fill rule
  --   *     (only works with the smooth rasterizer).
  --   *
  --   *   FT_OUTLINE_REVERSE_FILL ::
  --   *     By default, outside contours of an outline are oriented in
  --   *     clock-wise direction, as defined in the TrueType specification.
  --   *     This flag is set if the outline uses the opposite direction
  --   *     (typically for Type~1 fonts).  This flag is ignored by the scan
  --   *     converter.
  --   *
  --   *   FT_OUTLINE_IGNORE_DROPOUTS ::
  --   *     By default, the scan converter will try to detect drop-outs in an
  --   *     outline and correct the glyph bitmap to ensure consistent shape
  --   *     continuity.  If set, this flag hints the scan-line converter to
  --   *     ignore such cases.  See below for more information.
  --   *
  --   *   FT_OUTLINE_SMART_DROPOUTS ::
  --   *     Select smart dropout control.  If unset, use simple dropout control.
  --   *     Ignored if @FT_OUTLINE_IGNORE_DROPOUTS is set.  See below for more
  --   *     information.
  --   *
  --   *   FT_OUTLINE_INCLUDE_STUBS ::
  --   *     If set, turn pixels on for 'stubs', otherwise exclude them.  Ignored
  --   *     if @FT_OUTLINE_IGNORE_DROPOUTS is set.  See below for more
  --   *     information.
  --   *
  --   *   FT_OUTLINE_OVERLAP ::
  --   *     This flag indicates that this outline contains overlapping contrours
  --   *     and the anti-aliased renderer should perform oversampling to
  --   *     mitigate possible artifacts.  This flag should _not_ be set for
  --   *     well designed glyphs without overlaps because it quadruples the
  --   *     rendering time.
  --   *
  --   *   FT_OUTLINE_HIGH_PRECISION ::
  --   *     This flag indicates that the scan-line converter should try to
  --   *     convert this outline to bitmaps with the highest possible quality.
  --   *     It is typically set for small character sizes.  Note that this is
  --   *     only a hint that might be completely ignored by a given
  --   *     scan-converter.
  --   *
  --   *   FT_OUTLINE_SINGLE_PASS ::
  --   *     This flag is set to force a given scan-converter to only use a
  --   *     single pass over the outline to render a bitmap glyph image.
  --   *     Normally, it is set for very large character sizes.  It is only a
  --   *     hint that might be completely ignored by a given scan-converter.
  --   *
  --   * @note:
  --   *   The flags @FT_OUTLINE_IGNORE_DROPOUTS, @FT_OUTLINE_SMART_DROPOUTS, and
  --   *   @FT_OUTLINE_INCLUDE_STUBS are ignored by the smooth rasterizer.
  --   *
  --   *   There exists a second mechanism to pass the drop-out mode to the B/W
  --   *   rasterizer; see the `tags` field in @FT_Outline.
  --   *
  --   *   Please refer to the description of the 'SCANTYPE' instruction in the
  --   *   OpenType specification (in file `ttinst1.doc`) how simple drop-outs,
  --   *   smart drop-outs, and stubs are defined.
  --    

  -- these constants are deprecated; use the corresponding  
  -- `FT_OUTLINE_XXX` values instead                        
  --  
  -- see the `tags` field in `FT_Outline` for a description of the values  
  -- values 0x20, 0x40, and 0x80 are reserved  
  -- these constants are deprecated; use the corresponding  
  -- `FT_CURVE_TAG_XXX` values instead                      
  --*************************************************************************
  --   *
  --   * @functype:
  --   *   FT_Outline_MoveToFunc
  --   *
  --   * @description:
  --   *   A function pointer type used to describe the signature of a 'move to'
  --   *   function during outline walking/decomposition.
  --   *
  --   *   A 'move to' is emitted to start a new contour in an outline.
  --   *
  --   * @input:
  --   *   to ::
  --   *     A pointer to the target point of the 'move to'.
  --   *
  --   *   user ::
  --   *     A typeless pointer, which is passed from the caller of the
  --   *     decomposition function.
  --   *
  --   * @return:
  --   *   Error code.  0~means success.
  --    

   type FT_Outline_MoveToFunc is access function (arg1 : access constant FT_Vector; arg2 : System.Address) return int
   with Convention => C;  -- /usr/include/freetype2/freetype/ftimage.h:508

  --*************************************************************************
  --   *
  --   * @functype:
  --   *   FT_Outline_LineToFunc
  --   *
  --   * @description:
  --   *   A function pointer type used to describe the signature of a 'line to'
  --   *   function during outline walking/decomposition.
  --   *
  --   *   A 'line to' is emitted to indicate a segment in the outline.
  --   *
  --   * @input:
  --   *   to ::
  --   *     A pointer to the target point of the 'line to'.
  --   *
  --   *   user ::
  --   *     A typeless pointer, which is passed from the caller of the
  --   *     decomposition function.
  --   *
  --   * @return:
  --   *   Error code.  0~means success.
  --    

   type FT_Outline_LineToFunc is access function (arg1 : access constant FT_Vector; arg2 : System.Address) return int
   with Convention => C;  -- /usr/include/freetype2/freetype/ftimage.h:537

  --*************************************************************************
  --   *
  --   * @functype:
  --   *   FT_Outline_ConicToFunc
  --   *
  --   * @description:
  --   *   A function pointer type used to describe the signature of a 'conic to'
  --   *   function during outline walking or decomposition.
  --   *
  --   *   A 'conic to' is emitted to indicate a second-order Bezier arc in the
  --   *   outline.
  --   *
  --   * @input:
  --   *   control ::
  --   *     An intermediate control point between the last position and the new
  --   *     target in `to`.
  --   *
  --   *   to ::
  --   *     A pointer to the target end point of the conic arc.
  --   *
  --   *   user ::
  --   *     A typeless pointer, which is passed from the caller of the
  --   *     decomposition function.
  --   *
  --   * @return:
  --   *   Error code.  0~means success.
  --    

   type FT_Outline_ConicToFunc is access function
        (arg1 : access constant FT_Vector;
         arg2 : access constant FT_Vector;
         arg3 : System.Address) return int
   with Convention => C;  -- /usr/include/freetype2/freetype/ftimage.h:571

  --*************************************************************************
  --   *
  --   * @functype:
  --   *   FT_Outline_CubicToFunc
  --   *
  --   * @description:
  --   *   A function pointer type used to describe the signature of a 'cubic to'
  --   *   function during outline walking or decomposition.
  --   *
  --   *   A 'cubic to' is emitted to indicate a third-order Bezier arc.
  --   *
  --   * @input:
  --   *   control1 ::
  --   *     A pointer to the first Bezier control point.
  --   *
  --   *   control2 ::
  --   *     A pointer to the second Bezier control point.
  --   *
  --   *   to ::
  --   *     A pointer to the target end point.
  --   *
  --   *   user ::
  --   *     A typeless pointer, which is passed from the caller of the
  --   *     decomposition function.
  --   *
  --   * @return:
  --   *   Error code.  0~means success.
  --    

   type FT_Outline_CubicToFunc is access function
        (arg1 : access constant FT_Vector;
         arg2 : access constant FT_Vector;
         arg3 : access constant FT_Vector;
         arg4 : System.Address) return int
   with Convention => C;  -- /usr/include/freetype2/freetype/ftimage.h:607

  --*************************************************************************
  --   *
  --   * @struct:
  --   *   FT_Outline_Funcs
  --   *
  --   * @description:
  --   *   A structure to hold various function pointers used during outline
  --   *   decomposition in order to emit segments, conic, and cubic Beziers.
  --   *
  --   * @fields:
  --   *   move_to ::
  --   *     The 'move to' emitter.
  --   *
  --   *   line_to ::
  --   *     The segment emitter.
  --   *
  --   *   conic_to ::
  --   *     The second-order Bezier arc emitter.
  --   *
  --   *   cubic_to ::
  --   *     The third-order Bezier arc emitter.
  --   *
  --   *   shift ::
  --   *     The shift that is applied to coordinates before they are sent to the
  --   *     emitter.
  --   *
  --   *   delta ::
  --   *     The delta that is applied to coordinates before they are sent to the
  --   *     emitter, but after the shift.
  --   *
  --   * @note:
  --   *   The point coordinates sent to the emitters are the transformed version
  --   *   of the original coordinates (this is important for high accuracy
  --   *   during scan-conversion).  The transformation is simple:
  --   *
  --   *   ```
  --   *     x' = (x << shift) - delta
  --   *     y' = (y << shift) - delta
  --   *   ```
  --   *
  --   *   Set the values of `shift` and `delta` to~0 to get the original point
  --   *   coordinates.
  --    

   type FT_Outline_Funcs_u is record
      move_to : FT_Outline_MoveToFunc;  -- /usr/include/freetype2/freetype/ftimage.h:660
      line_to : FT_Outline_LineToFunc;  -- /usr/include/freetype2/freetype/ftimage.h:661
      conic_to : FT_Outline_ConicToFunc;  -- /usr/include/freetype2/freetype/ftimage.h:662
      cubic_to : FT_Outline_CubicToFunc;  -- /usr/include/freetype2/freetype/ftimage.h:663
      shift : aliased int;  -- /usr/include/freetype2/freetype/ftimage.h:665
      c_delta : aliased FT_Pos;  -- /usr/include/freetype2/freetype/ftimage.h:666
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/freetype2/freetype/ftimage.h:658

   subtype FT_Outline_Funcs is FT_Outline_Funcs_u;  -- /usr/include/freetype2/freetype/ftimage.h:668

  --*************************************************************************
  --   *
  --   * @section:
  --   *   basic_types
  --   *
  --    

  --*************************************************************************
  --   *
  --   * @macro:
  --   *   FT_IMAGE_TAG
  --   *
  --   * @description:
  --   *   This macro converts four-letter tags to an unsigned long type.
  --   *
  --   * @note:
  --   *   Since many 16-bit compilers don't like 32-bit enumerations, you should
  --   *   redefine this macro in case of problems to something like this:
  --   *
  --   *   ```
  --   *     #define FT_IMAGE_TAG( value, _x1, _x2, _x3, _x4 )  value
  --   *   ```
  --   *
  --   *   to get a simple enumeration without assigning special numbers.
  --    

  --*************************************************************************
  --   *
  --   * @enum:
  --   *   FT_Glyph_Format
  --   *
  --   * @description:
  --   *   An enumeration type used to describe the format of a given glyph
  --   *   image.  Note that this version of FreeType only supports two image
  --   *   formats, even though future font drivers will be able to register
  --   *   their own format.
  --   *
  --   * @values:
  --   *   FT_GLYPH_FORMAT_NONE ::
  --   *     The value~0 is reserved.
  --   *
  --   *   FT_GLYPH_FORMAT_COMPOSITE ::
  --   *     The glyph image is a composite of several other images.  This format
  --   *     is _only_ used with @FT_LOAD_NO_RECURSE, and is used to report
  --   *     compound glyphs (like accented characters).
  --   *
  --   *   FT_GLYPH_FORMAT_BITMAP ::
  --   *     The glyph image is a bitmap, and can be described as an @FT_Bitmap.
  --   *     You generally need to access the `bitmap` field of the
  --   *     @FT_GlyphSlotRec structure to read it.
  --   *
  --   *   FT_GLYPH_FORMAT_OUTLINE ::
  --   *     The glyph image is a vectorial outline made of line segments and
  --   *     Bezier arcs; it can be described as an @FT_Outline; you generally
  --   *     want to access the `outline` field of the @FT_GlyphSlotRec structure
  --   *     to read it.
  --   *
  --   *   FT_GLYPH_FORMAT_PLOTTER ::
  --   *     The glyph image is a vectorial path with no inside and outside
  --   *     contours.  Some Type~1 fonts, like those in the Hershey family,
  --   *     contain glyphs in this format.  These are described as @FT_Outline,
  --   *     but FreeType isn't currently capable of rendering them correctly.
  --    

   subtype FT_Glyph_Format_u is unsigned;
   FT_GLYPH_FORMAT_NONE : constant unsigned := 0;
   FT_GLYPH_FORMAT_COMPOSITE : constant unsigned := 1668246896;
   FT_GLYPH_FORMAT_BITMAP : constant unsigned := 1651078259;
   FT_GLYPH_FORMAT_OUTLINE : constant unsigned := 1869968492;
   FT_GLYPH_FORMAT_PLOTTER : constant unsigned := 1886154612;  -- /usr/include/freetype2/freetype/ftimage.h:743

   subtype FT_Glyph_Format is FT_Glyph_Format_u;  -- /usr/include/freetype2/freetype/ftimage.h:752

  -- these constants are deprecated; use the corresponding  
  -- `FT_Glyph_Format` values instead.                      
  --*********************************************************************** 
  --*********************************************************************** 
  --*********************************************************************** 
  --****                                                               **** 
  --****            R A S T E R   D E F I N I T I O N S                **** 
  --****                                                               **** 
  --*********************************************************************** 
  --*********************************************************************** 
  --*********************************************************************** 
  --*************************************************************************
  --   *
  --   * A raster is a scan converter, in charge of rendering an outline into a
  --   * bitmap.  This section contains the public API for rasters.
  --   *
  --   * Note that in FreeType 2, all rasters are now encapsulated within
  --   * specific modules called 'renderers'.  See `ftrender.h` for more details
  --   * on renderers.
  --   *
  --    

  --*************************************************************************
  --   *
  --   * @section:
  --   *   raster
  --   *
  --   * @title:
  --   *   Scanline Converter
  --   *
  --   * @abstract:
  --   *   How vectorial outlines are converted into bitmaps and pixmaps.
  --   *
  --   * @description:
  --   *   This section contains technical definitions.
  --   *
  --   * @order:
  --   *   FT_Raster
  --   *   FT_Span
  --   *   FT_SpanFunc
  --   *
  --   *   FT_Raster_Params
  --   *   FT_RASTER_FLAG_XXX
  --   *
  --   *   FT_Raster_NewFunc
  --   *   FT_Raster_DoneFunc
  --   *   FT_Raster_ResetFunc
  --   *   FT_Raster_SetModeFunc
  --   *   FT_Raster_RenderFunc
  --   *   FT_Raster_Funcs
  --   *
  --    

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_Raster
  --   *
  --   * @description:
  --   *   An opaque handle (pointer) to a raster object.  Each object can be
  --   *   used independently to convert an outline into a bitmap or pixmap.
  --    

   type FT_RasterRec_u is null record;   -- incomplete struct

   type FT_Raster is access all FT_RasterRec_u;  -- /usr/include/freetype2/freetype/ftimage.h:828

  --*************************************************************************
  --   *
  --   * @struct:
  --   *   FT_Span
  --   *
  --   * @description:
  --   *   A structure used to model a single span of gray pixels when rendering
  --   *   an anti-aliased bitmap.
  --   *
  --   * @fields:
  --   *   x ::
  --   *     The span's horizontal start position.
  --   *
  --   *   len ::
  --   *     The span's length in pixels.
  --   *
  --   *   coverage ::
  --   *     The span color/coverage, ranging from 0 (background) to 255
  --   *     (foreground).
  --   *
  --   * @note:
  --   *   This structure is used by the span drawing callback type named
  --   *   @FT_SpanFunc that takes the y~coordinate of the span as a parameter.
  --   *
  --   *   The coverage value is always between 0 and 255.  If you want less gray
  --   *   values, the callback function has to reduce them.
  --    

   type FT_Span_u is record
      x : aliased short;  -- /usr/include/freetype2/freetype/ftimage.h:860
      len : aliased unsigned_short;  -- /usr/include/freetype2/freetype/ftimage.h:861
      coverage : aliased unsigned_char;  -- /usr/include/freetype2/freetype/ftimage.h:862
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/freetype2/freetype/ftimage.h:858

   subtype FT_Span is FT_Span_u;  -- /usr/include/freetype2/freetype/ftimage.h:864

  --*************************************************************************
  --   *
  --   * @functype:
  --   *   FT_SpanFunc
  --   *
  --   * @description:
  --   *   A function used as a call-back by the anti-aliased renderer in order
  --   *   to let client applications draw themselves the gray pixel spans on
  --   *   each scan line.
  --   *
  --   * @input:
  --   *   y ::
  --   *     The scanline's upward y~coordinate.
  --   *
  --   *   count ::
  --   *     The number of spans to draw on this scanline.
  --   *
  --   *   spans ::
  --   *     A table of `count` spans to draw on the scanline.
  --   *
  --   *   user ::
  --   *     User-supplied data that is passed to the callback.
  --   *
  --   * @note:
  --   *   This callback allows client applications to directly render the gray
  --   *   spans of the anti-aliased bitmap to any kind of surfaces.
  --   *
  --   *   This can be used to write anti-aliased outlines directly to a given
  --   *   background bitmap, and even perform translucency.
  --    

   type FT_SpanFunc is access procedure
        (arg1 : int;
         arg2 : int;
         arg3 : access constant FT_Span;
         arg4 : System.Address)
   with Convention => C;  -- /usr/include/freetype2/freetype/ftimage.h:898

  --*************************************************************************
  --   *
  --   * @functype:
  --   *   FT_Raster_BitTest_Func
  --   *
  --   * @description:
  --   *   Deprecated, unimplemented.
  --    

   type FT_Raster_BitTest_Func is access function
        (arg1 : int;
         arg2 : int;
         arg3 : System.Address) return int
   with Convention => C;  -- /usr/include/freetype2/freetype/ftimage.h:915

  --*************************************************************************
  --   *
  --   * @functype:
  --   *   FT_Raster_BitSet_Func
  --   *
  --   * @description:
  --   *   Deprecated, unimplemented.
  --    

   type FT_Raster_BitSet_Func is access procedure
        (arg1 : int;
         arg2 : int;
         arg3 : System.Address)
   with Convention => C;  -- /usr/include/freetype2/freetype/ftimage.h:929

  --*************************************************************************
  --   *
  --   * @enum:
  --   *   FT_RASTER_FLAG_XXX
  --   *
  --   * @description:
  --   *   A list of bit flag constants as used in the `flags` field of a
  --   *   @FT_Raster_Params structure.
  --   *
  --   * @values:
  --   *   FT_RASTER_FLAG_DEFAULT ::
  --   *     This value is 0.
  --   *
  --   *   FT_RASTER_FLAG_AA ::
  --   *     This flag is set to indicate that an anti-aliased glyph image should
  --   *     be generated.  Otherwise, it will be monochrome (1-bit).
  --   *
  --   *   FT_RASTER_FLAG_DIRECT ::
  --   *     This flag is set to indicate direct rendering.  In this mode, client
  --   *     applications must provide their own span callback.  This lets them
  --   *     directly draw or compose over an existing bitmap.  If this bit is
  --   *     _not_ set, the target pixmap's buffer _must_ be zeroed before
  --   *     rendering and the output will be clipped to its size.
  --   *
  --   *     Direct rendering is only possible with anti-aliased glyphs.
  --   *
  --   *   FT_RASTER_FLAG_CLIP ::
  --   *     This flag is only used in direct rendering mode.  If set, the output
  --   *     will be clipped to a box specified in the `clip_box` field of the
  --   *     @FT_Raster_Params structure.  Otherwise, the `clip_box` is
  --   *     effectively set to the bounding box and all spans are generated.
  --    

  -- these constants are deprecated; use the corresponding  
  -- `FT_RASTER_FLAG_XXX` values instead                    
  --*************************************************************************
  --   *
  --   * @struct:
  --   *   FT_Raster_Params
  --   *
  --   * @description:
  --   *   A structure to hold the parameters used by a raster's render function,
  --   *   passed as an argument to @FT_Outline_Render.
  --   *
  --   * @fields:
  --   *   target ::
  --   *     The target bitmap.
  --   *
  --   *   source ::
  --   *     A pointer to the source glyph image (e.g., an @FT_Outline).
  --   *
  --   *   flags ::
  --   *     The rendering flags.
  --   *
  --   *   gray_spans ::
  --   *     The gray span drawing callback.
  --   *
  --   *   black_spans ::
  --   *     Unused.
  --   *
  --   *   bit_test ::
  --   *     Unused.
  --   *
  --   *   bit_set ::
  --   *     Unused.
  --   *
  --   *   user ::
  --   *     User-supplied data that is passed to each drawing callback.
  --   *
  --   *   clip_box ::
  --   *     An optional span clipping box expressed in _integer_ pixels
  --   *     (not in 26.6 fixed-point units).
  --   *
  --   * @note:
  --   *   The @FT_RASTER_FLAG_AA bit flag must be set in the `flags` to
  --   *   generate an anti-aliased glyph bitmap, otherwise a monochrome bitmap
  --   *   is generated.  The `target` should have appropriate pixel mode and its
  --   *   dimensions define the clipping region.
  --   *
  --   *   If both @FT_RASTER_FLAG_AA and @FT_RASTER_FLAG_DIRECT bit flags
  --   *   are set in `flags`, the raster calls an @FT_SpanFunc callback
  --   *   `gray_spans` with `user` data as an argument ignoring `target`.  This
  --   *   allows direct composition over a pre-existing user surface to perform
  --   *   the span drawing and composition.  To optionally clip the spans, set
  --   *   the @FT_RASTER_FLAG_CLIP flag and `clip_box`.  The monochrome raster
  --   *   does not support the direct mode.
  --   *
  --   *   The gray-level rasterizer always uses 256 gray levels.  If you want
  --   *   fewer gray levels, you have to use @FT_RASTER_FLAG_DIRECT and reduce
  --   *   the levels in the callback function.
  --    

   type FT_Raster_Params_u is record
      target : access constant FT_Bitmap;  -- /usr/include/freetype2/freetype/ftimage.h:1037
      source : System.Address;  -- /usr/include/freetype2/freetype/ftimage.h:1038
      flags : aliased int;  -- /usr/include/freetype2/freetype/ftimage.h:1039
      gray_spans : FT_SpanFunc;  -- /usr/include/freetype2/freetype/ftimage.h:1040
      black_spans : FT_SpanFunc;  -- /usr/include/freetype2/freetype/ftimage.h:1041
      bit_test : FT_Raster_BitTest_Func;  -- /usr/include/freetype2/freetype/ftimage.h:1042
      bit_set : FT_Raster_BitSet_Func;  -- /usr/include/freetype2/freetype/ftimage.h:1043
      user : System.Address;  -- /usr/include/freetype2/freetype/ftimage.h:1044
      clip_box : aliased FT_BBox;  -- /usr/include/freetype2/freetype/ftimage.h:1045
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/freetype2/freetype/ftimage.h:1035

  -- unused  
  -- unused  
  -- unused  
   subtype FT_Raster_Params is FT_Raster_Params_u;  -- /usr/include/freetype2/freetype/ftimage.h:1047

  --*************************************************************************
  --   *
  --   * @functype:
  --   *   FT_Raster_NewFunc
  --   *
  --   * @description:
  --   *   A function used to create a new raster object.
  --   *
  --   * @input:
  --   *   memory ::
  --   *     A handle to the memory allocator.
  --   *
  --   * @output:
  --   *   raster ::
  --   *     A handle to the new raster object.
  --   *
  --   * @return:
  --   *   Error code.  0~means success.
  --   *
  --   * @note:
  --   *   The `memory` parameter is a typeless pointer in order to avoid
  --   *   un-wanted dependencies on the rest of the FreeType code.  In practice,
  --   *   it is an @FT_Memory object, i.e., a handle to the standard FreeType
  --   *   memory allocator.  However, this field can be completely ignored by a
  --   *   given raster implementation.
  --    

   type FT_Raster_NewFunc is access function (arg1 : System.Address; arg2 : System.Address) return int
   with Convention => C;  -- /usr/include/freetype2/freetype/ftimage.h:1077

  --*************************************************************************
  --   *
  --   * @functype:
  --   *   FT_Raster_DoneFunc
  --   *
  --   * @description:
  --   *   A function used to destroy a given raster object.
  --   *
  --   * @input:
  --   *   raster ::
  --   *     A handle to the raster object.
  --    

   type FT_Raster_DoneFunc is access procedure (arg1 : FT_Raster)
   with Convention => C;  -- /usr/include/freetype2/freetype/ftimage.h:1096

  --*************************************************************************
  --   *
  --   * @functype:
  --   *   FT_Raster_ResetFunc
  --   *
  --   * @description:
  --   *   FreeType used to provide an area of memory called the 'render pool'
  --   *   available to all registered rasterizers.  This was not thread safe,
  --   *   however, and now FreeType never allocates this pool.
  --   *
  --   *   This function is called after a new raster object is created.
  --   *
  --   * @input:
  --   *   raster ::
  --   *     A handle to the new raster object.
  --   *
  --   *   pool_base ::
  --   *     Previously, the address in memory of the render pool.  Set this to
  --   *     `NULL`.
  --   *
  --   *   pool_size ::
  --   *     Previously, the size in bytes of the render pool.  Set this to 0.
  --   *
  --   * @note:
  --   *   Rasterizers should rely on dynamic or stack allocation if they want to
  --   *   (a handle to the memory allocator is passed to the rasterizer
  --   *   constructor).
  --    

   type FT_Raster_ResetFunc is access procedure
        (arg1 : FT_Raster;
         arg2 : access unsigned_char;
         arg3 : unsigned_long)
   with Convention => C;  -- /usr/include/freetype2/freetype/ftimage.h:1130

  --*************************************************************************
  --   *
  --   * @functype:
  --   *   FT_Raster_SetModeFunc
  --   *
  --   * @description:
  --   *   This function is a generic facility to change modes or attributes in a
  --   *   given raster.  This can be used for debugging purposes, or simply to
  --   *   allow implementation-specific 'features' in a given raster module.
  --   *
  --   * @input:
  --   *   raster ::
  --   *     A handle to the new raster object.
  --   *
  --   *   mode ::
  --   *     A 4-byte tag used to name the mode or property.
  --   *
  --   *   args ::
  --   *     A pointer to the new mode/property to use.
  --    

   type FT_Raster_SetModeFunc is access function
        (arg1 : FT_Raster;
         arg2 : unsigned_long;
         arg3 : System.Address) return int
   with Convention => C;  -- /usr/include/freetype2/freetype/ftimage.h:1158

  --*************************************************************************
  --   *
  --   * @functype:
  --   *   FT_Raster_RenderFunc
  --   *
  --   * @description:
  --   *   Invoke a given raster to scan-convert a given glyph image into a
  --   *   target bitmap.
  --   *
  --   * @input:
  --   *   raster ::
  --   *     A handle to the raster object.
  --   *
  --   *   params ::
  --   *     A pointer to an @FT_Raster_Params structure used to store the
  --   *     rendering parameters.
  --   *
  --   * @return:
  --   *   Error code.  0~means success.
  --   *
  --   * @note:
  --   *   The exact format of the source image depends on the raster's glyph
  --   *   format defined in its @FT_Raster_Funcs structure.  It can be an
  --   *   @FT_Outline or anything else in order to support a large array of
  --   *   glyph formats.
  --   *
  --   *   Note also that the render function can fail and return a
  --   *   `FT_Err_Unimplemented_Feature` error code if the raster used does not
  --   *   support direct composition.
  --    

   type FT_Raster_RenderFunc is access function (arg1 : FT_Raster; arg2 : access constant FT_Raster_Params) return int
   with Convention => C;  -- /usr/include/freetype2/freetype/ftimage.h:1196

  --*************************************************************************
  --   *
  --   * @struct:
  --   *   FT_Raster_Funcs
  --   *
  --   * @description:
  --   *  A structure used to describe a given raster class to the library.
  --   *
  --   * @fields:
  --   *   glyph_format ::
  --   *     The supported glyph format for this raster.
  --   *
  --   *   raster_new ::
  --   *     The raster constructor.
  --   *
  --   *   raster_reset ::
  --   *     Used to reset the render pool within the raster.
  --   *
  --   *   raster_render ::
  --   *     A function to render a glyph into a given bitmap.
  --   *
  --   *   raster_done ::
  --   *     The raster destructor.
  --    

   type FT_Raster_Funcs_u is record
      glyph_format : aliased FT_Glyph_Format;  -- /usr/include/freetype2/freetype/ftimage.h:1228
      raster_new : FT_Raster_NewFunc;  -- /usr/include/freetype2/freetype/ftimage.h:1230
      raster_reset : FT_Raster_ResetFunc;  -- /usr/include/freetype2/freetype/ftimage.h:1231
      raster_set_mode : FT_Raster_SetModeFunc;  -- /usr/include/freetype2/freetype/ftimage.h:1232
      raster_render : FT_Raster_RenderFunc;  -- /usr/include/freetype2/freetype/ftimage.h:1233
      raster_done : FT_Raster_DoneFunc;  -- /usr/include/freetype2/freetype/ftimage.h:1234
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/freetype2/freetype/ftimage.h:1226

   subtype FT_Raster_Funcs is FT_Raster_Funcs_u;  -- /usr/include/freetype2/freetype/ftimage.h:1236

  --  
  -- END  
  -- Local Variables:  
  -- coding: utf-8     
  -- End:              
end ftimage;
