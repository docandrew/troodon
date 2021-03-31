pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

package ftsystem is

  --***************************************************************************
  -- *
  -- * ftsystem.h
  -- *
  -- *   FreeType low-level system interface definition (specification).
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
  --   *  system_interface
  --   *
  --   * @title:
  --   *  System Interface
  --   *
  --   * @abstract:
  --   *  How FreeType manages memory and i/o.
  --   *
  --   * @description:
  --   *  This section contains various definitions related to memory management
  --   *  and i/o access.  You need to understand this information if you want to
  --   *  use a custom memory manager or you own i/o streams.
  --   *
  --    

  --*************************************************************************
  --   *
  --   *                 M E M O R Y   M A N A G E M E N T
  --   *
  --    

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_Memory
  --   *
  --   * @description:
  --   *   A handle to a given memory manager object, defined with an
  --   *   @FT_MemoryRec structure.
  --   *
  --    

   type FT_MemoryRec_u;
   type FT_Memory is access all FT_MemoryRec_u;  -- /usr/include/freetype2/freetype/ftsystem.h:64

  --*************************************************************************
  --   *
  --   * @functype:
  --   *   FT_Alloc_Func
  --   *
  --   * @description:
  --   *   A function used to allocate `size` bytes from `memory`.
  --   *
  --   * @input:
  --   *   memory ::
  --   *     A handle to the source memory manager.
  --   *
  --   *   size ::
  --   *     The size in bytes to allocate.
  --   *
  --   * @return:
  --   *   Address of new memory block.  0~in case of failure.
  --   *
  --    

   type FT_Alloc_Func is access function (arg1 : FT_Memory; arg2 : long) return System.Address
   with Convention => C;  -- /usr/include/freetype2/freetype/ftsystem.h:87

  --*************************************************************************
  --   *
  --   * @functype:
  --   *   FT_Free_Func
  --   *
  --   * @description:
  --   *   A function used to release a given block of memory.
  --   *
  --   * @input:
  --   *   memory ::
  --   *     A handle to the source memory manager.
  --   *
  --   *   block ::
  --   *     The address of the target memory block.
  --   *
  --    

   type FT_Free_Func is access procedure (arg1 : FT_Memory; arg2 : System.Address)
   with Convention => C;  -- /usr/include/freetype2/freetype/ftsystem.h:108

  --*************************************************************************
  --   *
  --   * @functype:
  --   *   FT_Realloc_Func
  --   *
  --   * @description:
  --   *   A function used to re-allocate a given block of memory.
  --   *
  --   * @input:
  --   *   memory ::
  --   *     A handle to the source memory manager.
  --   *
  --   *   cur_size ::
  --   *     The block's current size in bytes.
  --   *
  --   *   new_size ::
  --   *     The block's requested new size.
  --   *
  --   *   block ::
  --   *     The block's current address.
  --   *
  --   * @return:
  --   *   New block address.  0~in case of memory shortage.
  --   *
  --   * @note:
  --   *   In case of error, the old block must still be available.
  --   *
  --    

   type FT_Realloc_Func is access function
        (arg1 : FT_Memory;
         arg2 : long;
         arg3 : long;
         arg4 : System.Address) return System.Address
   with Convention => C;  -- /usr/include/freetype2/freetype/ftsystem.h:141

  --*************************************************************************
  --   *
  --   * @struct:
  --   *   FT_MemoryRec
  --   *
  --   * @description:
  --   *   A structure used to describe a given memory manager to FreeType~2.
  --   *
  --   * @fields:
  --   *   user ::
  --   *     A generic typeless pointer for user data.
  --   *
  --   *   alloc ::
  --   *     A pointer type to an allocation function.
  --   *
  --   *   free ::
  --   *     A pointer type to an memory freeing function.
  --   *
  --   *   realloc ::
  --   *     A pointer type to a reallocation function.
  --   *
  --    

   type FT_MemoryRec_u is record
      user : System.Address;  -- /usr/include/freetype2/freetype/ftsystem.h:171
      alloc : FT_Alloc_Func;  -- /usr/include/freetype2/freetype/ftsystem.h:172
      free : FT_Free_Func;  -- /usr/include/freetype2/freetype/ftsystem.h:173
      realloc : FT_Realloc_Func;  -- /usr/include/freetype2/freetype/ftsystem.h:174
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/freetype2/freetype/ftsystem.h:169

  --*************************************************************************
  --   *
  --   *                      I / O   M A N A G E M E N T
  --   *
  --    

  --*************************************************************************
  --   *
  --   * @type:
  --   *   FT_Stream
  --   *
  --   * @description:
  --   *   A handle to an input stream.
  --   *
  --   * @also:
  --   *   See @FT_StreamRec for the publicly accessible fields of a given stream
  --   *   object.
  --   *
  --    

   type FT_StreamRec_u;
   type FT_Stream is access all FT_StreamRec_u;  -- /usr/include/freetype2/freetype/ftsystem.h:198

  --*************************************************************************
  --   *
  --   * @struct:
  --   *   FT_StreamDesc
  --   *
  --   * @description:
  --   *   A union type used to store either a long or a pointer.  This is used
  --   *   to store a file descriptor or a `FILE*` in an input stream.
  --   *
  --    

   type FT_StreamDesc_u (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            value : aliased long;  -- /usr/include/freetype2/freetype/ftsystem.h:213
         when others =>
            pointer : System.Address;  -- /usr/include/freetype2/freetype/ftsystem.h:214
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- /usr/include/freetype2/freetype/ftsystem.h:211

   subtype FT_StreamDesc is FT_StreamDesc_u;  -- /usr/include/freetype2/freetype/ftsystem.h:216

  --*************************************************************************
  --   *
  --   * @functype:
  --   *   FT_Stream_IoFunc
  --   *
  --   * @description:
  --   *   A function used to seek and read data from a given input stream.
  --   *
  --   * @input:
  --   *   stream ::
  --   *     A handle to the source stream.
  --   *
  --   *   offset ::
  --   *     The offset of read in stream (always from start).
  --   *
  --   *   buffer ::
  --   *     The address of the read buffer.
  --   *
  --   *   count ::
  --   *     The number of bytes to read from the stream.
  --   *
  --   * @return:
  --   *   The number of bytes effectively read by the stream.
  --   *
  --   * @note:
  --   *   This function might be called to perform a seek or skip operation with
  --   *   a `count` of~0.  A non-zero return value then indicates an error.
  --   *
  --    

   type FT_Stream_IoFunc is access function
        (arg1 : FT_Stream;
         arg2 : unsigned_long;
         arg3 : access unsigned_char;
         arg4 : unsigned_long) return unsigned_long
   with Convention => C;  -- /usr/include/freetype2/freetype/ftsystem.h:249

  --*************************************************************************
  --   *
  --   * @functype:
  --   *   FT_Stream_CloseFunc
  --   *
  --   * @description:
  --   *   A function used to close a given input stream.
  --   *
  --   * @input:
  --   *  stream ::
  --   *    A handle to the target stream.
  --   *
  --    

   type FT_Stream_CloseFunc is access procedure (arg1 : FT_Stream)
   with Convention => C;  -- /usr/include/freetype2/freetype/ftsystem.h:269

  --*************************************************************************
  --   *
  --   * @struct:
  --   *   FT_StreamRec
  --   *
  --   * @description:
  --   *   A structure used to describe an input stream.
  --   *
  --   * @input:
  --   *   base ::
  --   *     For memory-based streams, this is the address of the first stream
  --   *     byte in memory.  This field should always be set to `NULL` for
  --   *     disk-based streams.
  --   *
  --   *   size ::
  --   *     The stream size in bytes.
  --   *
  --   *     In case of compressed streams where the size is unknown before
  --   *     actually doing the decompression, the value is set to 0x7FFFFFFF.
  --   *     (Note that this size value can occur for normal streams also; it is
  --   *     thus just a hint.)
  --   *
  --   *   pos ::
  --   *     The current position within the stream.
  --   *
  --   *   descriptor ::
  --   *     This field is a union that can hold an integer or a pointer.  It is
  --   *     used by stream implementations to store file descriptors or `FILE*`
  --   *     pointers.
  --   *
  --   *   pathname ::
  --   *     This field is completely ignored by FreeType.  However, it is often
  --   *     useful during debugging to use it to store the stream's filename
  --   *     (where available).
  --   *
  --   *   read ::
  --   *     The stream's input function.
  --   *
  --   *   close ::
  --   *     The stream's close function.
  --   *
  --   *   memory ::
  --   *     The memory manager to use to preload frames.  This is set internally
  --   *     by FreeType and shouldn't be touched by stream implementations.
  --   *
  --   *   cursor ::
  --   *     This field is set and used internally by FreeType when parsing
  --   *     frames.  In particular, the `FT_GET_XXX` macros use this instead of
  --   *     the `pos` field.
  --   *
  --   *   limit ::
  --   *     This field is set and used internally by FreeType when parsing
  --   *     frames.
  --   *
  --    

   type FT_StreamRec_u is record
      base : access unsigned_char;  -- /usr/include/freetype2/freetype/ftsystem.h:329
      size : aliased unsigned_long;  -- /usr/include/freetype2/freetype/ftsystem.h:330
      pos : aliased unsigned_long;  -- /usr/include/freetype2/freetype/ftsystem.h:331
      descriptor : aliased FT_StreamDesc;  -- /usr/include/freetype2/freetype/ftsystem.h:333
      pathname : aliased FT_StreamDesc;  -- /usr/include/freetype2/freetype/ftsystem.h:334
      read : FT_Stream_IoFunc;  -- /usr/include/freetype2/freetype/ftsystem.h:335
      close : FT_Stream_CloseFunc;  -- /usr/include/freetype2/freetype/ftsystem.h:336
      memory : FT_Memory;  -- /usr/include/freetype2/freetype/ftsystem.h:338
      cursor : access unsigned_char;  -- /usr/include/freetype2/freetype/ftsystem.h:339
      limit : access unsigned_char;  -- /usr/include/freetype2/freetype/ftsystem.h:340
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/freetype2/freetype/ftsystem.h:327

   subtype FT_StreamRec is FT_StreamRec_u;  -- /usr/include/freetype2/freetype/ftsystem.h:342

  --  
  -- END  
end ftsystem;
