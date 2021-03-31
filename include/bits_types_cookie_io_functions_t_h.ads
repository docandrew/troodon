pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;
with stddef_h;
with bits_types_h;

package bits_types_cookie_io_functions_t_h is

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

  -- Functions to do I/O and file management for a stream.   
  -- Read NBYTES bytes from COOKIE into a buffer pointed to by BUF.
  --   Return number of bytes read.   

   --  skipped function type cookie_read_function_t

  -- Write NBYTES bytes pointed to by BUF to COOKIE.  Write all NBYTES bytes
  --   unless there is an error.  Return number of bytes written.  If
  --   there is an error, return 0 and do not write anything.  If the file
  --   has been opened for append (__mode.__append set), then set the file
  --   pointer to the end of the file and then do the write; if not, just
  --   write at the current file pointer.   

   --  skipped function type cookie_write_function_t

  -- Move COOKIE's file position to *POS bytes from the
  --   beginning of the file (if W is SEEK_SET),
  --   the current position (if W is SEEK_CUR),
  --   or the end of the file (if W is SEEK_END).
  --   Set *POS to the new file position.
  --   Returns zero if successful, nonzero if not.   

   --  skipped function type cookie_seek_function_t

  -- Close COOKIE.   
   --  skipped function type cookie_close_function_t

  -- The structure with the cookie function pointers.
  --   The tag name of this struct is _IO_cookie_io_functions_t to
  --   preserve historic C++ mangled names for functions taking
  --   cookie_io_functions_t arguments.  That name should not be used in
  --   new code.   

  -- Read bytes.   
   type u_IO_cookie_io_functions_t is record
      read : access function
           (arg1 : System.Address;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : stddef_h.size_t) return bits_types_h.uu_ssize_t;  -- /usr/include/bits/types/cookie_io_functions_t.h:57
      write : access function
           (arg1 : System.Address;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : stddef_h.size_t) return bits_types_h.uu_ssize_t;  -- /usr/include/bits/types/cookie_io_functions_t.h:58
      seek : access function
           (arg1 : System.Address;
            arg2 : access bits_types_h.uu_off64_t;
            arg3 : int) return int;  -- /usr/include/bits/types/cookie_io_functions_t.h:59
      close : access function (arg1 : System.Address) return int;  -- /usr/include/bits/types/cookie_io_functions_t.h:60
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/bits/types/cookie_io_functions_t.h:55

  -- Write bytes.   
  -- Seek/tell file position.   
  -- Close file.   
   subtype cookie_io_functions_t is u_IO_cookie_io_functions_t;  -- /usr/include/bits/types/cookie_io_functions_t.h:61

end bits_types_cookie_io_functions_t_h;
