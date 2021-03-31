pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;
with bits_types_h;
with stddef_h;

package bits_types_struct_FILE_h is

  -- Copyright (C) 1991-2021 Free Software Foundation, Inc.
  --   This file is part of the GNU C Library.
  --   The GNU C Library is free software; you can redistribute it and/or
  --   modify it under the terms of the GNU Lesser General Public
  --   License as published by the Free Software Foundation; either
  --   version 2.1 of the License, or (at your option) any later version.
  --   The GNU C Library is distributed in the hope that it will be useful,
  --   but WITHOUT ANY WARRANTY; without even the implied warranty of
  --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  --   Lesser General Public License for more details.
  --   You should have received a copy of the GNU Lesser General Public
  --   License along with the GNU C Library; if not, see
  --   <https://www.gnu.org/licenses/>.   

  -- Caution: The contents of this file are not part of the official
  --   stdio.h API.  However, much of it is part of the official *binary*
  --   interface, and therefore cannot be changed.   

   type u_IO_marker is null record;   -- incomplete struct

   type u_IO_codecvt is null record;   -- incomplete struct

   type u_IO_wide_data is null record;   -- incomplete struct

  -- During the build of glibc itself, _IO_lock_t will already have been
  --   defined by internal headers.   

   subtype u_IO_lock_t is System.Address;  -- /usr/include/bits/types/struct_FILE.h:43

  -- The tag name of this struct is _IO_FILE to preserve historic
  --   C++ mangled names for functions taking FILE* arguments.
  --   That name should not be used in new code.   

  -- High-order word is _IO_MAGIC; rest is flags.  
   type u_IO_FILE;
   subtype u_IO_FILE_array1135 is Interfaces.C.char_array (0 .. 0);
   subtype u_IO_FILE_array1140 is Interfaces.C.char_array (0 .. 19);
   type u_IO_FILE is record
      u_flags : aliased int;  -- /usr/include/bits/types/struct_FILE.h:51
      u_IO_read_ptr : Interfaces.C.Strings.chars_ptr;  -- /usr/include/bits/types/struct_FILE.h:54
      u_IO_read_end : Interfaces.C.Strings.chars_ptr;  -- /usr/include/bits/types/struct_FILE.h:55
      u_IO_read_base : Interfaces.C.Strings.chars_ptr;  -- /usr/include/bits/types/struct_FILE.h:56
      u_IO_write_base : Interfaces.C.Strings.chars_ptr;  -- /usr/include/bits/types/struct_FILE.h:57
      u_IO_write_ptr : Interfaces.C.Strings.chars_ptr;  -- /usr/include/bits/types/struct_FILE.h:58
      u_IO_write_end : Interfaces.C.Strings.chars_ptr;  -- /usr/include/bits/types/struct_FILE.h:59
      u_IO_buf_base : Interfaces.C.Strings.chars_ptr;  -- /usr/include/bits/types/struct_FILE.h:60
      u_IO_buf_end : Interfaces.C.Strings.chars_ptr;  -- /usr/include/bits/types/struct_FILE.h:61
      u_IO_save_base : Interfaces.C.Strings.chars_ptr;  -- /usr/include/bits/types/struct_FILE.h:64
      u_IO_backup_base : Interfaces.C.Strings.chars_ptr;  -- /usr/include/bits/types/struct_FILE.h:65
      u_IO_save_end : Interfaces.C.Strings.chars_ptr;  -- /usr/include/bits/types/struct_FILE.h:66
      u_markers : access u_IO_marker;  -- /usr/include/bits/types/struct_FILE.h:68
      u_chain : access u_IO_FILE;  -- /usr/include/bits/types/struct_FILE.h:70
      u_fileno : aliased int;  -- /usr/include/bits/types/struct_FILE.h:72
      u_flags2 : aliased int;  -- /usr/include/bits/types/struct_FILE.h:73
      u_old_offset : aliased bits_types_h.uu_off_t;  -- /usr/include/bits/types/struct_FILE.h:74
      u_cur_column : aliased unsigned_short;  -- /usr/include/bits/types/struct_FILE.h:77
      u_vtable_offset : aliased signed_char;  -- /usr/include/bits/types/struct_FILE.h:78
      u_shortbuf : aliased u_IO_FILE_array1135;  -- /usr/include/bits/types/struct_FILE.h:79
      u_lock : System.Address;  -- /usr/include/bits/types/struct_FILE.h:81
      u_offset : aliased bits_types_h.uu_off64_t;  -- /usr/include/bits/types/struct_FILE.h:89
      u_codecvt : access u_IO_codecvt;  -- /usr/include/bits/types/struct_FILE.h:91
      u_wide_data : access u_IO_wide_data;  -- /usr/include/bits/types/struct_FILE.h:92
      u_freeres_list : access u_IO_FILE;  -- /usr/include/bits/types/struct_FILE.h:93
      u_freeres_buf : System.Address;  -- /usr/include/bits/types/struct_FILE.h:94
      uu_pad5 : aliased stddef_h.size_t;  -- /usr/include/bits/types/struct_FILE.h:95
      u_mode : aliased int;  -- /usr/include/bits/types/struct_FILE.h:96
      u_unused2 : aliased u_IO_FILE_array1140;  -- /usr/include/bits/types/struct_FILE.h:98
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/bits/types/struct_FILE.h:49

  -- The following pointers correspond to the C++ streambuf protocol.  
  -- Current read pointer  
  -- End of get area.  
  -- Start of putback+get area.  
  -- Start of put area.  
  -- Current put pointer.  
  -- End of put area.  
  -- Start of reserve area.  
  -- End of reserve area.  
  -- The following fields are used to support backing up and undo.  
  -- Pointer to start of non-current get area.  
  -- Pointer to first valid character of backup area  
  -- Pointer to end of non-current get area.  
  -- This used to be _offset but it's too small.   
  -- 1+column number of pbase(); 0 is unknown.  
  -- Wide character stream stuff.   
  -- Make sure we don't get into trouble again.   
  -- These macros are used by bits/stdio.h and internal headers.   
  -- Many more flag bits are defined internally.   
end bits_types_struct_FILE_h;
