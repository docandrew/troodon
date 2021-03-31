pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with bits_types_h;
with bits_types_struct_statx_timestamp_h;

package bits_types_struct_statx_h is

  -- Definition of the generic version of struct statx.
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

  -- Warning: The kernel may add additional fields to this struct in the
  --   future.  Only use this struct for calling the statx function, not
  --   for storing data.  (Expansion will be controlled by the mask
  --   argument of the statx function.)   

   type statx_array1116 is array (0 .. 0) of aliased bits_types_h.uu_uint16_t;
   type statx_array1119 is array (0 .. 13) of aliased bits_types_h.uu_uint64_t;
   type statx is record
      stx_mask : aliased bits_types_h.uu_uint32_t;  -- /usr/include/bits/types/struct_statx.h:32
      stx_blksize : aliased bits_types_h.uu_uint32_t;  -- /usr/include/bits/types/struct_statx.h:33
      stx_attributes : aliased bits_types_h.uu_uint64_t;  -- /usr/include/bits/types/struct_statx.h:34
      stx_nlink : aliased bits_types_h.uu_uint32_t;  -- /usr/include/bits/types/struct_statx.h:35
      stx_uid : aliased bits_types_h.uu_uint32_t;  -- /usr/include/bits/types/struct_statx.h:36
      stx_gid : aliased bits_types_h.uu_uint32_t;  -- /usr/include/bits/types/struct_statx.h:37
      stx_mode : aliased bits_types_h.uu_uint16_t;  -- /usr/include/bits/types/struct_statx.h:38
      uu_statx_pad1 : aliased statx_array1116;  -- /usr/include/bits/types/struct_statx.h:39
      stx_ino : aliased bits_types_h.uu_uint64_t;  -- /usr/include/bits/types/struct_statx.h:40
      stx_size : aliased bits_types_h.uu_uint64_t;  -- /usr/include/bits/types/struct_statx.h:41
      stx_blocks : aliased bits_types_h.uu_uint64_t;  -- /usr/include/bits/types/struct_statx.h:42
      stx_attributes_mask : aliased bits_types_h.uu_uint64_t;  -- /usr/include/bits/types/struct_statx.h:43
      stx_atime : aliased bits_types_struct_statx_timestamp_h.statx_timestamp;  -- /usr/include/bits/types/struct_statx.h:44
      stx_btime : aliased bits_types_struct_statx_timestamp_h.statx_timestamp;  -- /usr/include/bits/types/struct_statx.h:45
      stx_ctime : aliased bits_types_struct_statx_timestamp_h.statx_timestamp;  -- /usr/include/bits/types/struct_statx.h:46
      stx_mtime : aliased bits_types_struct_statx_timestamp_h.statx_timestamp;  -- /usr/include/bits/types/struct_statx.h:47
      stx_rdev_major : aliased bits_types_h.uu_uint32_t;  -- /usr/include/bits/types/struct_statx.h:48
      stx_rdev_minor : aliased bits_types_h.uu_uint32_t;  -- /usr/include/bits/types/struct_statx.h:49
      stx_dev_major : aliased bits_types_h.uu_uint32_t;  -- /usr/include/bits/types/struct_statx.h:50
      stx_dev_minor : aliased bits_types_h.uu_uint32_t;  -- /usr/include/bits/types/struct_statx.h:51
      uu_statx_pad2 : aliased statx_array1119;  -- /usr/include/bits/types/struct_statx.h:52
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/bits/types/struct_statx.h:30

end bits_types_struct_statx_h;
