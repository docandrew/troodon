pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with bits_types_h;

package bits_types_struct_statx_timestamp_h is

  -- Definition of the generic version of struct statx_timestamp.
  --   Copyright (C) 2018-2021 Free Software Foundation, Inc.
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

   type statx_timestamp_array1112 is array (0 .. 0) of aliased bits_types_h.uu_int32_t;
   type statx_timestamp is record
      tv_sec : aliased bits_types_h.uu_int64_t;  -- /usr/include/bits/types/struct_statx_timestamp.h:28
      tv_nsec : aliased bits_types_h.uu_uint32_t;  -- /usr/include/bits/types/struct_statx_timestamp.h:29
      uu_statx_timestamp_pad1 : aliased statx_timestamp_array1112;  -- /usr/include/bits/types/struct_statx_timestamp.h:30
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/bits/types/struct_statx_timestamp.h:26

end bits_types_struct_statx_timestamp_h;
