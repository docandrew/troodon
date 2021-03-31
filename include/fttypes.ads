pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with freetype_config_integer_types;
with System;
with stddef_h;

package fttypes is

   --  arg-macro: function FT_MAKE_TAG (_x1, _x2, _x3, _x4)
   --    return FT_Tag) ( ( (FT_ULong)_x1 << 24 ) or ( (FT_ULong)_x2 << 16 ) or ( (FT_ULong)_x3 << 8 ) or (FT_ULong)_x4 ;
   --  arg-macro: function FT_IS_EMPTY (list)
   --    return  (list).head = 0 ;
   --  arg-macro: function FT_BOOL (x)
   --    return  (FT_Bool)( (x) /= 0 ) ;
   --  unsupported macro: FT_ERR_XCAT(x,y) x ## y
   --  arg-macro: procedure FT_ERR_CAT (x, y)
   --    FT_ERR_XCAT( x, y )
   --  arg-macro: procedure FT_ERR (e)
   --    FT_ERR_CAT( FT_ERR_PREFIX, e )
   --  arg-macro: function FT_ERROR_BASE (x)
   --    return  (x) and 16#FF# ;
   --  arg-macro: function FT_ERROR_MODULE (x)
   --    return  (x) and 16#FF00# ;
   --  arg-macro: function FT_ERR_EQ (x, e)
   --    return  FT_ERROR_BASE( x ) = FT_ERROR_BASE( FT_ERR( e ) ) ;
   --  arg-macro: function FT_ERR_NEQ (x, e)
   --    return  FT_ERROR_BASE( x ) /= FT_ERROR_BASE( FT_ERR( e ) ) ;
  --***************************************************************************
  -- *
  -- * fttypes.h
  -- *
  -- *   FreeType simple types definitions (specification only).
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
  --   * @section:
  --   *   basic_types
  --   *
  --   * @title:
  --   *   Basic Data Types
  --   *
  --   * @abstract:
  --   *   The basic data types defined by the library.
  --   *
  --   * @description:
  --   *   This section contains the basic data types defined by FreeType~2,
  --   *   ranging from simple scalar types to bitmap descriptors.  More
  --   *   font-specific structures are defined in a different section.
  --   *
  --   * @order:
  --   *   FT_Byte
  --   *   FT_Bytes
  --   *   FT_Char
  --   *   FT_Int
  --   *   FT_UInt
  --   *   FT_Int16
  --   *   FT_UInt16
  --   *   FT_Int32
  --   *   FT_UInt32
  --   *   FT_Int64
  --   *   FT_UInt64
  --   *   FT_Short
  --   *   FT_UShort
  --   *   FT_Long
  --   *   FT_ULong
  --   *   FT_Bool
  --   *   FT_Offset
  --   *   FT_PtrDist
  --   *   FT_String
  --   *   FT_Tag
  --   *   FT_Error
  --   *   FT_Fixed
  --   *   FT_Pointer
  --   *   FT_Pos
  --   *   FT_Vector
  --   *   FT_BBox
  --   *   FT_Matrix
  --   *   FT_FWord
  --   *   FT_UFWord
  --   *   FT_F2Dot14
  --   *   FT_UnitVector
  --   *   FT_F26Dot6
  --   *   FT_Data
  --   *
  --   *   FT_MAKE_TAG
  --   *
  --   *   FT_Generic
  --   *   FT_Generic_Finalizer
  --   *
  --   *   FT_Bitmap
  --   *   FT_Pixel_Mode
  --   *   FT_Palette_Mode
  --   *   FT_Glyph_Format
  --   *   FT_IMAGE_TAG
  --   *
  --    

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_Bool
  --   *
  --   * @description:
  --   *   A typedef of unsigned char, used for simple booleans.  As usual,
  --   *   values 1 and~0 represent true and false, respectively.
  --    

   subtype FT_Bool is unsigned_char;  -- /usr/include/freetype2/freetype/fttypes.h:108

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_FWord
  --   *
  --   * @description:
  --   *   A signed 16-bit integer used to store a distance in original font
  --   *   units.
  --    

  -- distance in FUnits  
   subtype FT_FWord is short;  -- /usr/include/freetype2/freetype/fttypes.h:120

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_UFWord
  --   *
  --   * @description:
  --   *   An unsigned 16-bit integer used to store a distance in original font
  --   *   units.
  --    

  -- unsigned distance  
   subtype FT_UFWord is unsigned_short;  -- /usr/include/freetype2/freetype/fttypes.h:132

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_Char
  --   *
  --   * @description:
  --   *   A simple typedef for the _signed_ char type.
  --    

   subtype FT_Char is signed_char;  -- /usr/include/freetype2/freetype/fttypes.h:143

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_Byte
  --   *
  --   * @description:
  --   *   A simple typedef for the _unsigned_ char type.
  --    

   subtype FT_Byte is unsigned_char;  -- /usr/include/freetype2/freetype/fttypes.h:154

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_Bytes
  --   *
  --   * @description:
  --   *   A typedef for constant memory areas.
  --    

   type FT_Bytes is access all FT_Byte;  -- /usr/include/freetype2/freetype/fttypes.h:165

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_Tag
  --   *
  --   * @description:
  --   *   A typedef for 32-bit tags (as used in the SFNT format).
  --    

   subtype FT_Tag is freetype_config_integer_types.FT_UInt32;  -- /usr/include/freetype2/freetype/fttypes.h:176

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_String
  --   *
  --   * @description:
  --   *   A simple typedef for the char type, usually used for strings.
  --    

   subtype FT_String is char;  -- /usr/include/freetype2/freetype/fttypes.h:187

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_Short
  --   *
  --   * @description:
  --   *   A typedef for signed short.
  --    

   subtype FT_Short is short;  -- /usr/include/freetype2/freetype/fttypes.h:198

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_UShort
  --   *
  --   * @description:
  --   *   A typedef for unsigned short.
  --    

   subtype FT_UShort is unsigned_short;  -- /usr/include/freetype2/freetype/fttypes.h:209

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_Int
  --   *
  --   * @description:
  --   *   A typedef for the int type.
  --    

   subtype FT_Int is int;  -- /usr/include/freetype2/freetype/fttypes.h:220

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_UInt
  --   *
  --   * @description:
  --   *   A typedef for the unsigned int type.
  --    

   subtype FT_UInt is unsigned;  -- /usr/include/freetype2/freetype/fttypes.h:231

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_Long
  --   *
  --   * @description:
  --   *   A typedef for signed long.
  --    

   subtype FT_Long is long;  -- /usr/include/freetype2/freetype/fttypes.h:242

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_ULong
  --   *
  --   * @description:
  --   *   A typedef for unsigned long.
  --    

   subtype FT_ULong is unsigned_long;  -- /usr/include/freetype2/freetype/fttypes.h:253

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_F2Dot14
  --   *
  --   * @description:
  --   *   A signed 2.14 fixed-point type used for unit vectors.
  --    

   subtype FT_F2Dot14 is short;  -- /usr/include/freetype2/freetype/fttypes.h:264

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_F26Dot6
  --   *
  --   * @description:
  --   *   A signed 26.6 fixed-point type used for vectorial pixel coordinates.
  --    

   subtype FT_F26Dot6 is long;  -- /usr/include/freetype2/freetype/fttypes.h:275

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_Fixed
  --   *
  --   * @description:
  --   *   This type is used to store 16.16 fixed-point values, like scaling
  --   *   values or matrix coefficients.
  --    

   subtype FT_Fixed is long;  -- /usr/include/freetype2/freetype/fttypes.h:287

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_Error
  --   *
  --   * @description:
  --   *   The FreeType error code type.  A value of~0 is always interpreted as a
  --   *   successful operation.
  --    

   subtype FT_Error is int;  -- /usr/include/freetype2/freetype/fttypes.h:299

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_Pointer
  --   *
  --   * @description:
  --   *   A simple typedef for a typeless pointer.
  --    

   type FT_Pointer is new System.Address;  -- /usr/include/freetype2/freetype/fttypes.h:310

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_Offset
  --   *
  --   * @description:
  --   *   This is equivalent to the ANSI~C `size_t` type, i.e., the largest
  --   *   _unsigned_ integer type used to express a file size or position, or a
  --   *   memory block size.
  --    

   subtype FT_Offset is stddef_h.size_t;  -- /usr/include/freetype2/freetype/fttypes.h:323

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_PtrDist
  --   *
  --   * @description:
  --   *   This is equivalent to the ANSI~C `ptrdiff_t` type, i.e., the largest
  --   *   _signed_ integer type used to express the distance between two
  --   *   pointers.
  --    

   -- Troodon: not needed
   --subtype FT_PtrDist is stddef_h.ptrdiff_t;  -- /usr/include/freetype2/freetype/fttypes.h:336

  --*************************************************************************
  --   *
  --   * @struct:
  --   *   FT_UnitVector
  --   *
  --   * @description:
  --   *   A simple structure used to store a 2D vector unit vector.  Uses
  --   *   FT_F2Dot14 types.
  --   *
  --   * @fields:
  --   *   x ::
  --   *     Horizontal coordinate.
  --   *
  --   *   y ::
  --   *     Vertical coordinate.
  --    

   type FT_UnitVector_u is record
      x : aliased FT_F2Dot14;  -- /usr/include/freetype2/freetype/fttypes.h:357
      y : aliased FT_F2Dot14;  -- /usr/include/freetype2/freetype/fttypes.h:358
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/freetype2/freetype/fttypes.h:355

   subtype FT_UnitVector is FT_UnitVector_u;  -- /usr/include/freetype2/freetype/fttypes.h:360

  --*************************************************************************
  --   *
  --   * @struct:
  --   *   FT_Matrix
  --   *
  --   * @description:
  --   *   A simple structure used to store a 2x2 matrix.  Coefficients are in
  --   *   16.16 fixed-point format.  The computation performed is:
  --   *
  --   *   ```
  --   *     x' = x*xx + y*xy
  --   *     y' = x*yx + y*yy
  --   *   ```
  --   *
  --   * @fields:
  --   *   xx ::
  --   *     Matrix coefficient.
  --   *
  --   *   xy ::
  --   *     Matrix coefficient.
  --   *
  --   *   yx ::
  --   *     Matrix coefficient.
  --   *
  --   *   yy ::
  --   *     Matrix coefficient.
  --    

   type FT_Matrix_u is record
      xx : aliased FT_Fixed;  -- /usr/include/freetype2/freetype/fttypes.h:392
      xy : aliased FT_Fixed;  -- /usr/include/freetype2/freetype/fttypes.h:392
      yx : aliased FT_Fixed;  -- /usr/include/freetype2/freetype/fttypes.h:393
      yy : aliased FT_Fixed;  -- /usr/include/freetype2/freetype/fttypes.h:393
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/freetype2/freetype/fttypes.h:390

   subtype FT_Matrix is FT_Matrix_u;  -- /usr/include/freetype2/freetype/fttypes.h:395

  --*************************************************************************
  --   *
  --   * @struct:
  --   *   FT_Data
  --   *
  --   * @description:
  --   *   Read-only binary data represented as a pointer and a length.
  --   *
  --   * @fields:
  --   *   pointer ::
  --   *     The data.
  --   *
  --   *   length ::
  --   *     The length of the data in bytes.
  --    

   type FT_Data_u is record
      pointer : access FT_Byte;  -- /usr/include/freetype2/freetype/fttypes.h:415
      length : aliased FT_Int;  -- /usr/include/freetype2/freetype/fttypes.h:416
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/freetype2/freetype/fttypes.h:413

   subtype FT_Data is FT_Data_u;  -- /usr/include/freetype2/freetype/fttypes.h:418

  --*************************************************************************
  --   *
  --   * @functype:
  --   *   FT_Generic_Finalizer
  --   *
  --   * @description:
  --   *   Describe a function used to destroy the 'client' data of any FreeType
  --   *   object.  See the description of the @FT_Generic type for details of
  --   *   usage.
  --   *
  --   * @input:
  --   *   The address of the FreeType object that is under finalization.  Its
  --   *   client data is accessed through its `generic` field.
  --    

   type FT_Generic_Finalizer is access procedure (arg1 : System.Address)
   with Convention => C;  -- /usr/include/freetype2/freetype/fttypes.h:435

  --*************************************************************************
  --   *
  --   * @struct:
  --   *   FT_Generic
  --   *
  --   * @description:
  --   *   Client applications often need to associate their own data to a
  --   *   variety of FreeType core objects.  For example, a text layout API
  --   *   might want to associate a glyph cache to a given size object.
  --   *
  --   *   Some FreeType object contains a `generic` field, of type `FT_Generic`,
  --   *   which usage is left to client applications and font servers.
  --   *
  --   *   It can be used to store a pointer to client-specific data, as well as
  --   *   the address of a 'finalizer' function, which will be called by
  --   *   FreeType when the object is destroyed (for example, the previous
  --   *   client example would put the address of the glyph cache destructor in
  --   *   the `finalizer` field).
  --   *
  --   * @fields:
  --   *   data ::
  --   *     A typeless pointer to any client-specified data. This field is
  --   *     completely ignored by the FreeType library.
  --   *
  --   *   finalizer ::
  --   *     A pointer to a 'generic finalizer' function, which will be called
  --   *     when the object is destroyed.  If this field is set to `NULL`, no
  --   *     code will be called.
  --    

   type FT_Generic_u is record
      data : System.Address;  -- /usr/include/freetype2/freetype/fttypes.h:469
      finalizer : FT_Generic_Finalizer;  -- /usr/include/freetype2/freetype/fttypes.h:470
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/freetype2/freetype/fttypes.h:467

   subtype FT_Generic is FT_Generic_u;  -- /usr/include/freetype2/freetype/fttypes.h:472

  --*************************************************************************
  --   *
  --   * @macro:
  --   *   FT_MAKE_TAG
  --   *
  --   * @description:
  --   *   This macro converts four-letter tags that are used to label TrueType
  --   *   tables into an unsigned long, to be used within FreeType.
  --   *
  --   * @note:
  --   *   The produced values **must** be 32-bit integers.  Don't redefine this
  --   *   macro.
  --    

  --*********************************************************************** 
  --*********************************************************************** 
  --                                                                        
  --                    L I S T   M A N A G E M E N T                       
  --                                                                        
  --*********************************************************************** 
  --*********************************************************************** 
  --*************************************************************************
  --   *
  --   * @section:
  --   *   list_processing
  --   *
  --    

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_ListNode
  --   *
  --   * @description:
  --   *    Many elements and objects in FreeType are listed through an @FT_List
  --   *    record (see @FT_ListRec).  As its name suggests, an FT_ListNode is a
  --   *    handle to a single list element.
  --    

   type FT_ListNodeRec_u;
   type FT_ListNode is access all FT_ListNodeRec_u;  -- /usr/include/freetype2/freetype/fttypes.h:523

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_List
  --   *
  --   * @description:
  --   *   A handle to a list record (see @FT_ListRec).
  --    

   type FT_ListRec_u;
   type FT_List is access all FT_ListRec_u;  -- /usr/include/freetype2/freetype/fttypes.h:534

  --*************************************************************************
  --   *
  --   * @struct:
  --   *   FT_ListNodeRec
  --   *
  --   * @description:
  --   *   A structure used to hold a single list element.
  --   *
  --   * @fields:
  --   *   prev ::
  --   *     The previous element in the list.  `NULL` if first.
  --   *
  --   *   next ::
  --   *     The next element in the list.  `NULL` if last.
  --   *
  --   *   data ::
  --   *     A typeless pointer to the listed object.
  --    

   type FT_ListNodeRec_u is record
      prev : FT_ListNode;  -- /usr/include/freetype2/freetype/fttypes.h:557
      next : FT_ListNode;  -- /usr/include/freetype2/freetype/fttypes.h:558
      data : System.Address;  -- /usr/include/freetype2/freetype/fttypes.h:559
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/freetype2/freetype/fttypes.h:555

   subtype FT_ListNodeRec is FT_ListNodeRec_u;  -- /usr/include/freetype2/freetype/fttypes.h:561

  --*************************************************************************
  --   *
  --   * @struct:
  --   *   FT_ListRec
  --   *
  --   * @description:
  --   *   A structure used to hold a simple doubly-linked list.  These are used
  --   *   in many parts of FreeType.
  --   *
  --   * @fields:
  --   *   head ::
  --   *     The head (first element) of doubly-linked list.
  --   *
  --   *   tail ::
  --   *     The tail (last element) of doubly-linked list.
  --    

   type FT_ListRec_u is record
      head : FT_ListNode;  -- /usr/include/freetype2/freetype/fttypes.h:582
      tail : FT_ListNode;  -- /usr/include/freetype2/freetype/fttypes.h:583
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/freetype2/freetype/fttypes.h:580

   subtype FT_ListRec is FT_ListRec_u;  -- /usr/include/freetype2/freetype/fttypes.h:585

  --  
  -- concatenate C tokens  
  -- see `ftmoderr.h` for descriptions of the following macros  
  -- END  
end fttypes;
