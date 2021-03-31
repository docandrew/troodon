pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package fterrdef is

  --***************************************************************************
  -- *
  -- * fterrdef.h
  -- *
  -- *   FreeType error codes (specification).
  -- *
  -- * Copyright (C) 2002-2020 by
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
  --   *  error_code_values
  --   *
  --   * @title:
  --   *  Error Code Values
  --   *
  --   * @abstract:
  --   *  All possible error codes returned by FreeType functions.
  --   *
  --   * @description:
  --   *  The list below is taken verbatim from the file `fterrdef.h` (loaded
  --   *  automatically by including `FT_FREETYPE_H`).  The first argument of the
  --   *  `FT_ERROR_DEF_` macro is the error label; by default, the prefix
  --   *  `FT_Err_` gets added so that you get error names like
  --   *  `FT_Err_Cannot_Open_Resource`.  The second argument is the error code,
  --   *  and the last argument an error string, which is not used by FreeType.
  --   *
  --   *  Within your application you should **only** use error names and
  --   *  **never** its numeric values!  The latter might (and actually do)
  --   *  change in forthcoming FreeType versions.
  --   *
  --   *  Macro `FT_NOERRORDEF_` defines `FT_Err_Ok`, which is always zero.  See
  --   *  the 'Error Enumerations' subsection how to automatically generate a
  --   *  list of error strings.
  --   *
  --    

  --*************************************************************************
  --   *
  --   * @enum:
  --   *   FT_Err_XXX
  --   *
  --    

  -- generic errors  
  -- glyph/character errors  
  -- handle errors  
  -- driver errors  
  -- memory errors  
  -- stream errors  
  -- raster errors  
  -- cache errors  
  -- TrueType and SFNT errors  
  -- CFF, CID, and Type 1 errors  
  -- BDF errors  
  --  
  -- END  
end fterrdef;
