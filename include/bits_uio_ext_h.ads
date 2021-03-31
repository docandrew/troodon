pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with sys_types_h;
limited with bits_types_struct_iovec_h;

package bits_uio_ext_h is

   RWF_HIPRI : constant := 16#00000001#;  --  /usr/include/bits/uio-ext.h:45
   RWF_DSYNC : constant := 16#00000002#;  --  /usr/include/bits/uio-ext.h:46
   RWF_SYNC : constant := 16#00000004#;  --  /usr/include/bits/uio-ext.h:47
   RWF_NOWAIT : constant := 16#00000008#;  --  /usr/include/bits/uio-ext.h:48
   RWF_APPEND : constant := 16#00000010#;  --  /usr/include/bits/uio-ext.h:49

  -- Operating system-specific extensions to sys/uio.h - Linux version.
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

  -- Read from another process' address space.   
   function process_vm_readv
     (uu_pid : sys_types_h.pid_t;
      uu_lvec : access constant bits_types_struct_iovec_h.iovec;
      uu_liovcnt : unsigned_long;
      uu_rvec : access constant bits_types_struct_iovec_h.iovec;
      uu_riovcnt : unsigned_long;
      uu_flags : unsigned_long) return sys_types_h.ssize_t  -- /usr/include/bits/uio-ext.h:29
   with Import => True, 
        Convention => C, 
        External_Name => "process_vm_readv";

  -- Write to another process' address space.   
   function process_vm_writev
     (uu_pid : sys_types_h.pid_t;
      uu_lvec : access constant bits_types_struct_iovec_h.iovec;
      uu_liovcnt : unsigned_long;
      uu_rvec : access constant bits_types_struct_iovec_h.iovec;
      uu_riovcnt : unsigned_long;
      uu_flags : unsigned_long) return sys_types_h.ssize_t  -- /usr/include/bits/uio-ext.h:37
   with Import => True, 
        Convention => C, 
        External_Name => "process_vm_writev";

  -- Flags for preadv2/pwritev2.   
end bits_uio_ext_h;
