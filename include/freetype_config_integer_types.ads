pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package freetype_config_integer_types is

   --  unsupported macro: FT_SIZEOF_INT ( 32 / FT_CHAR_BIT )
   --  unsupported macro: FT_SIZEOF_LONG ( 64 / FT_CHAR_BIT )
   --  unsupported macro: FT_INT64 long
   --  unsupported macro: FT_UINT64 unsigned long
  --***************************************************************************
  -- *
  -- * config/integer-types.h
  -- *
  -- *   FreeType integer types definitions.
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

  -- There are systems (like the Texas Instruments 'C54x) where a `char`   
  -- has 16~bits.  ANSI~C says that `sizeof(char)` is always~1.  Since an  
  -- `int` has 16~bits also for this system, `sizeof(int)` gives~1 which   
  -- is probably unexpected.                                               
  --                                                                       
  -- `CHAR_BIT` (defined in `limits.h`) gives the number of bits in a      
  -- `char` type.                                                          
  -- The size of an `int` type.  
  -- The size of a `long` type.  A five-byte `long` (as used e.g. on the  
  -- DM642) is recognized but avoided.                                    
  --*************************************************************************
  --   *
  --   * @section:
  --   *   basic_types
  --   *
  --    

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_Int16
  --   *
  --   * @description:
  --   *   A typedef for a 16bit signed integer type.
  --    

   subtype FT_Int16 is short;  -- /usr/include/freetype2/freetype/config/integer-types.h:79

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_UInt16
  --   *
  --   * @description:
  --   *   A typedef for a 16bit unsigned integer type.
  --    

   subtype FT_UInt16 is unsigned_short;  -- /usr/include/freetype2/freetype/config/integer-types.h:90

  --  
  -- this #if 0 ... #endif clause is for documentation purposes  
  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_Int32
  --   *
  --   * @description:
  --   *   A typedef for a 32bit signed integer type.  The size depends on the
  --   *   configuration.
  --    

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_UInt32
  --   *
  --   *   A typedef for a 32bit unsigned integer type.  The size depends on the
  --   *   configuration.
  --    

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_Int64
  --   *
  --   *   A typedef for a 64bit signed integer type.  The size depends on the
  --   *   configuration.  Only defined if there is real 64bit support;
  --   *   otherwise, it gets emulated with a structure (if necessary).
  --    

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_UInt64
  --   *
  --   *   A typedef for a 64bit unsigned integer type.  The size depends on the
  --   *   configuration.  Only defined if there is real 64bit support;
  --   *   otherwise, it gets emulated with a structure (if necessary).
  --    

  --  
   subtype FT_Int32 is int;  -- /usr/include/freetype2/freetype/config/integer-types.h:150

   subtype FT_UInt32 is unsigned;  -- /usr/include/freetype2/freetype/config/integer-types.h:151

  -- look up an integer type that is at least 32~bits  
   subtype FT_Fast is int;  -- /usr/include/freetype2/freetype/config/integer-types.h:166

   subtype FT_UFast is unsigned;  -- /usr/include/freetype2/freetype/config/integer-types.h:167

  -- determine whether we have a 64-bit `int` type for platforms without  
  -- Autoconf                                                             
  -- `FT_LONG64` must be defined if a 64-bit type is available  
  --*************************************************************************
  --   *
  --   * A 64-bit data type may create compilation problems if you compile in
  --   * strict ANSI mode.  To avoid them, we disable other 64-bit data types if
  --   * `__STDC__` is defined.  You can however ignore this rule by defining the
  --   * `FT_CONFIG_OPTION_FORCE_INT64` configuration macro.
  --    

  -- this compiler provides the `__int64` type  
  -- XXXX: We should probably check the value of `__BORLANDC__` in order  
  --       to test the compiler version.                                  
  -- this compiler provides the `__int64` type  
  -- Watcom doesn't provide 64-bit data types  
  -- GCC provides the `long long` type  
   subtype FT_Int64 is long;  -- /usr/include/freetype2/freetype/config/integer-types.h:240

   subtype FT_UInt64 is unsigned_long;  -- /usr/include/freetype2/freetype/config/integer-types.h:241

end freetype_config_integer_types;
