pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
limited with bits_types_struct_statx_h;

package bits_statx_generic_h is

   STATX_TYPE : constant := 16#0001#;  --  /usr/include/bits/statx-generic.h:29
   STATX_MODE : constant := 16#0002#;  --  /usr/include/bits/statx-generic.h:30
   STATX_NLINK : constant := 16#0004#;  --  /usr/include/bits/statx-generic.h:31
   STATX_UID : constant := 16#0008#;  --  /usr/include/bits/statx-generic.h:32
   STATX_GID : constant := 16#0010#;  --  /usr/include/bits/statx-generic.h:33
   STATX_ATIME : constant := 16#0020#;  --  /usr/include/bits/statx-generic.h:34
   STATX_MTIME : constant := 16#0040#;  --  /usr/include/bits/statx-generic.h:35
   STATX_CTIME : constant := 16#0080#;  --  /usr/include/bits/statx-generic.h:36
   STATX_INO : constant := 16#0100#;  --  /usr/include/bits/statx-generic.h:37
   STATX_SIZE : constant := 16#0200#;  --  /usr/include/bits/statx-generic.h:38
   STATX_BLOCKS : constant := 16#0400#;  --  /usr/include/bits/statx-generic.h:39
   STATX_BASIC_STATS : constant := 16#07ff#;  --  /usr/include/bits/statx-generic.h:40
   STATX_ALL : constant := 16#0fff#;  --  /usr/include/bits/statx-generic.h:41
   STATX_BTIME : constant := 16#0800#;  --  /usr/include/bits/statx-generic.h:42
   STATX_MNT_ID : constant := 16#1000#;  --  /usr/include/bits/statx-generic.h:43
   STATX_u_RESERVED : constant := 16#80000000#;  --  /usr/include/bits/statx-generic.h:44

   STATX_ATTR_COMPRESSED : constant := 16#0004#;  --  /usr/include/bits/statx-generic.h:46
   STATX_ATTR_IMMUTABLE : constant := 16#0010#;  --  /usr/include/bits/statx-generic.h:47
   STATX_ATTR_APPEND : constant := 16#0020#;  --  /usr/include/bits/statx-generic.h:48
   STATX_ATTR_NODUMP : constant := 16#0040#;  --  /usr/include/bits/statx-generic.h:49
   STATX_ATTR_ENCRYPTED : constant := 16#0800#;  --  /usr/include/bits/statx-generic.h:50
   STATX_ATTR_AUTOMOUNT : constant := 16#1000#;  --  /usr/include/bits/statx-generic.h:51
   STATX_ATTR_MOUNT_ROOT : constant := 16#2000#;  --  /usr/include/bits/statx-generic.h:52
   STATX_ATTR_VERITY : constant := 16#100000#;  --  /usr/include/bits/statx-generic.h:53
   STATX_ATTR_DAX : constant := 16#200000#;  --  /usr/include/bits/statx-generic.h:54

  -- Generic statx-related definitions and declarations.
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

  -- This interface is based on <linux/stat.h> in Linux.   
  -- Fill *BUF with information about PATH in DIRFD.   
   function statx
     (uu_dirfd : int;
      uu_path : Interfaces.C.Strings.chars_ptr;
      uu_flags : int;
      uu_mask : unsigned;
      uu_buf : access bits_types_struct_statx_h.statx) return int  -- /usr/include/bits/statx-generic.h:60
   with Import => True, 
        Convention => C, 
        External_Name => "statx";

end bits_statx_generic_h;
