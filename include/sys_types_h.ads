pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with bits_types_h;

package sys_types_h is

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

  -- *	POSIX Standard: 2.6 Primitive System Data Types	<sys/types.h>
  --  

   subtype u_char is bits_types_h.uu_u_char;  -- /usr/include/sys/types.h:33

   subtype u_short is bits_types_h.uu_u_short;  -- /usr/include/sys/types.h:34

   subtype u_int is bits_types_h.uu_u_int;  -- /usr/include/sys/types.h:35

   subtype u_long is bits_types_h.uu_u_long;  -- /usr/include/sys/types.h:36

   subtype quad_t is bits_types_h.uu_quad_t;  -- /usr/include/sys/types.h:37

   subtype u_quad_t is bits_types_h.uu_u_quad_t;  -- /usr/include/sys/types.h:38

   subtype fsid_t is bits_types_h.uu_fsid_t;  -- /usr/include/sys/types.h:39

   subtype loff_t is bits_types_h.uu_loff_t;  -- /usr/include/sys/types.h:42

   subtype ino_t is bits_types_h.uu_ino_t;  -- /usr/include/sys/types.h:47

   subtype ino64_t is bits_types_h.uu_ino64_t;  -- /usr/include/sys/types.h:54

   subtype dev_t is bits_types_h.uu_dev_t;  -- /usr/include/sys/types.h:59

   subtype gid_t is bits_types_h.uu_gid_t;  -- /usr/include/sys/types.h:64

   subtype mode_t is bits_types_h.uu_mode_t;  -- /usr/include/sys/types.h:69

   subtype nlink_t is bits_types_h.uu_nlink_t;  -- /usr/include/sys/types.h:74

   subtype uid_t is bits_types_h.uu_uid_t;  -- /usr/include/sys/types.h:79

   subtype off_t is bits_types_h.uu_off_t;  -- /usr/include/sys/types.h:85

   subtype off64_t is bits_types_h.uu_off64_t;  -- /usr/include/sys/types.h:92

   subtype pid_t is bits_types_h.uu_pid_t;  -- /usr/include/sys/types.h:97

   subtype id_t is bits_types_h.uu_id_t;  -- /usr/include/sys/types.h:103

   subtype ssize_t is bits_types_h.uu_ssize_t;  -- /usr/include/sys/types.h:108

   subtype daddr_t is bits_types_h.uu_daddr_t;  -- /usr/include/sys/types.h:114

   subtype caddr_t is bits_types_h.uu_caddr_t;  -- /usr/include/sys/types.h:115

   subtype key_t is bits_types_h.uu_key_t;  -- /usr/include/sys/types.h:121

   subtype useconds_t is bits_types_h.uu_useconds_t;  -- /usr/include/sys/types.h:134

   subtype suseconds_t is bits_types_h.uu_suseconds_t;  -- /usr/include/sys/types.h:138

  -- Old compatibility names for C types.   
   subtype ulong is unsigned_long;  -- /usr/include/sys/types.h:148

   subtype ushort is unsigned_short;  -- /usr/include/sys/types.h:149

   subtype uint is unsigned;  -- /usr/include/sys/types.h:150

  -- These size-specific names are used by some of the inet code.   
  -- These were defined by ISO C without the first `_'.   
   subtype u_int8_t is bits_types_h.uu_uint8_t;  -- /usr/include/sys/types.h:158

   subtype u_int16_t is bits_types_h.uu_uint16_t;  -- /usr/include/sys/types.h:159

   subtype u_int32_t is bits_types_h.uu_uint32_t;  -- /usr/include/sys/types.h:160

   subtype u_int64_t is bits_types_h.uu_uint64_t;  -- /usr/include/sys/types.h:161

   subtype register_t is long;  -- /usr/include/sys/types.h:164

  -- Some code from BIND tests this macro to see if the types above are
  --   defined.   

  -- In BSD <sys/types.h> is expected to define BYTE_ORDER.   
  -- It also defines `fd_set' and the FD_* macros for `select'.   
   subtype blksize_t is bits_types_h.uu_blksize_t;  -- /usr/include/sys/types.h:185

  -- Types from the Large File Support interface.   
  -- Type to count number of disk blocks.   
   subtype blkcnt_t is bits_types_h.uu_blkcnt_t;  -- /usr/include/sys/types.h:192

  -- Type to count file system blocks.   
   subtype fsblkcnt_t is bits_types_h.uu_fsblkcnt_t;  -- /usr/include/sys/types.h:196

  -- Type to count file system inodes.   
   subtype fsfilcnt_t is bits_types_h.uu_fsfilcnt_t;  -- /usr/include/sys/types.h:200

  -- Type to count number of disk blocks.   
  -- Type to count file system blocks.   
  -- Type to count file system inodes.   
  -- Type to count number of disk blocks.  
   subtype blkcnt64_t is bits_types_h.uu_blkcnt64_t;  -- /usr/include/sys/types.h:219

  -- Type to count file system blocks.   
   subtype fsblkcnt64_t is bits_types_h.uu_fsblkcnt64_t;  -- /usr/include/sys/types.h:220

  -- Type to count file system inodes.   
   subtype fsfilcnt64_t is bits_types_h.uu_fsfilcnt64_t;  -- /usr/include/sys/types.h:221

  -- Now add the thread types.   
end sys_types_h;
