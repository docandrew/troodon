pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with stddef_h;

package bits_types_struct_iovec_h is

  -- Define struct iovec.
  --   Copyright (C) 1996-2021 Free Software Foundation, Inc.
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

  -- Structure for scatter/gather I/O.   
  -- Pointer to data.   
   type iovec is record
      iov_base : System.Address;  -- /usr/include/bits/types/struct_iovec.h:28
      iov_len : aliased stddef_h.size_t;  -- /usr/include/bits/types/struct_iovec.h:29
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/bits/types/struct_iovec.h:26

  -- Length of data.   
end bits_types_struct_iovec_h;
