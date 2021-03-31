pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with bits_types_h;
with bits_types_struct_timespec_h;

package bits_struct_stat_h is

   --  unsupported macro: st_atime st_atim.tv_sec
   --  unsupported macro: st_mtime st_mtim.tv_sec
   --  unsupported macro: st_ctime st_ctim.tv_sec
  -- Definition for struct stat.
  --   Copyright (C) 2020-2021 Free Software Foundation, Inc.
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
  --   License along with the GNU C Library.  If not, see
  --   <https://www.gnu.org/licenses/>.   

  -- Device.   
   type stat_array1037 is array (0 .. 2) of aliased bits_types_h.uu_syscall_slong_t;
   type stat is record
      st_dev : aliased bits_types_h.uu_dev_t;  -- /usr/include/bits/struct_stat.h:28
      st_ino : aliased bits_types_h.uu_ino_t;  -- /usr/include/bits/struct_stat.h:33
      st_nlink : aliased bits_types_h.uu_nlink_t;  -- /usr/include/bits/struct_stat.h:41
      st_mode : aliased bits_types_h.uu_mode_t;  -- /usr/include/bits/struct_stat.h:42
      st_uid : aliased bits_types_h.uu_uid_t;  -- /usr/include/bits/struct_stat.h:44
      st_gid : aliased bits_types_h.uu_gid_t;  -- /usr/include/bits/struct_stat.h:45
      uu_pad0 : aliased int;  -- /usr/include/bits/struct_stat.h:47
      st_rdev : aliased bits_types_h.uu_dev_t;  -- /usr/include/bits/struct_stat.h:49
      st_size : aliased bits_types_h.uu_off_t;  -- /usr/include/bits/struct_stat.h:54
      st_blksize : aliased bits_types_h.uu_blksize_t;  -- /usr/include/bits/struct_stat.h:58
      st_blocks : aliased bits_types_h.uu_blkcnt_t;  -- /usr/include/bits/struct_stat.h:60
      st_atim : aliased bits_types_struct_timespec_h.timespec;  -- /usr/include/bits/struct_stat.h:71
      st_mtim : aliased bits_types_struct_timespec_h.timespec;  -- /usr/include/bits/struct_stat.h:72
      st_ctim : aliased bits_types_struct_timespec_h.timespec;  -- /usr/include/bits/struct_stat.h:73
      uu_glibc_reserved : aliased stat_array1037;  -- /usr/include/bits/struct_stat.h:86
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/bits/struct_stat.h:26

  -- File serial number.	 
  -- 32bit file serial number.	 
  -- File mode.   
  -- Link count.   
  -- Link count.   
  -- File mode.   
  -- User ID of the file's owner.	 
  -- Group ID of the file's group. 
  -- Device number, if device.   
  -- Size of file, in bytes.   
  -- Size of file, in bytes.   
  -- Optimal block size for I/O.   
  -- Number 512-byte blocks allocated.  
  -- Number 512-byte blocks allocated.  
  -- Nanosecond resolution timestamps are stored in a format
  --       equivalent to 'struct timespec'.  This is the type used
  --       whenever possible but the Unix namespace rules do not allow the
  --       identifier 'timespec' to appear in the <sys/stat.h> header.
  --       Therefore we have to handle the use of this header in strictly
  --       standard-compliant sources special.   

  -- Time of last access.   
  -- Time of last modification.   
  -- Time of last status change.   
  -- Time of last access.   
  -- Nscecs of last access.   
  -- Time of last modification.   
  -- Nsecs of last modification.   
  -- Time of last status change.   
  -- Nsecs of last status change.   
  -- File serial number.	 
  -- Note stat64 has the same shape as stat for x86-64.   
  -- Device.   
   type stat64_array1037 is array (0 .. 2) of aliased bits_types_h.uu_syscall_slong_t;
   type stat64 is record
      st_dev : aliased bits_types_h.uu_dev_t;  -- /usr/include/bits/struct_stat.h:101
      st_ino : aliased bits_types_h.uu_ino64_t;  -- /usr/include/bits/struct_stat.h:103
      st_nlink : aliased bits_types_h.uu_nlink_t;  -- /usr/include/bits/struct_stat.h:104
      st_mode : aliased bits_types_h.uu_mode_t;  -- /usr/include/bits/struct_stat.h:105
      st_uid : aliased bits_types_h.uu_uid_t;  -- /usr/include/bits/struct_stat.h:112
      st_gid : aliased bits_types_h.uu_gid_t;  -- /usr/include/bits/struct_stat.h:113
      uu_pad0 : aliased int;  -- /usr/include/bits/struct_stat.h:115
      st_rdev : aliased bits_types_h.uu_dev_t;  -- /usr/include/bits/struct_stat.h:116
      st_size : aliased bits_types_h.uu_off_t;  -- /usr/include/bits/struct_stat.h:117
      st_blksize : aliased bits_types_h.uu_blksize_t;  -- /usr/include/bits/struct_stat.h:123
      st_blocks : aliased bits_types_h.uu_blkcnt64_t;  -- /usr/include/bits/struct_stat.h:124
      st_atim : aliased bits_types_struct_timespec_h.timespec;  -- /usr/include/bits/struct_stat.h:132
      st_mtim : aliased bits_types_struct_timespec_h.timespec;  -- /usr/include/bits/struct_stat.h:133
      st_ctim : aliased bits_types_struct_timespec_h.timespec;  -- /usr/include/bits/struct_stat.h:134
      uu_glibc_reserved : aliased stat64_array1037;  -- /usr/include/bits/struct_stat.h:144
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/bits/struct_stat.h:99

  -- File serial number.   
  -- Link count.   
  -- File mode.   
  -- 32bit file serial number.	 
  -- File mode.   
  -- Link count.   
  -- User ID of the file's owner.	 
  -- Group ID of the file's group. 
  -- Device number, if device.   
  -- Size of file, in bytes.   
  -- Device number, if device.   
  -- Size of file, in bytes.   
  -- Optimal block size for I/O.   
  -- Nr. 512-byte blocks allocated.   
  -- Nanosecond resolution timestamps are stored in a format
  --       equivalent to 'struct timespec'.  This is the type used
  --       whenever possible but the Unix namespace rules do not allow the
  --       identifier 'timespec' to appear in the <sys/stat.h> header.
  --       Therefore we have to handle the use of this header in strictly
  --       standard-compliant sources special.   

  -- Time of last access.   
  -- Time of last modification.   
  -- Time of last status change.   
  -- Time of last access.   
  -- Nscecs of last access.   
  -- Time of last modification.   
  -- Nsecs of last modification.   
  -- Time of last status change.   
  -- Nsecs of last status change.   
  -- File serial number.		 
  -- Tell code we have these members.   
  -- Nanosecond resolution time values are supported.   
end bits_struct_stat_h;
