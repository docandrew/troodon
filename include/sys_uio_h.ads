pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with bits_types_struct_iovec_h;
with sys_types_h;
with bits_types_h;

package sys_uio_h is

   --  unsupported macro: UIO_MAXIOV __IOV_MAX
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

  -- Read data from file descriptor FD, and put the result in the
  --   buffers described by IOVEC, which is a vector of COUNT 'struct iovec's.
  --   The buffers are filled in the order specified.
  --   Operates just like 'read' (see <unistd.h>) except that data are
  --   put in IOVEC instead of a contiguous buffer.
  --   This function is a cancellation point and therefore not marked with
  --   __THROW.   

   function readv
     (uu_fd : int;
      uu_iovec : access constant bits_types_struct_iovec_h.iovec;
      uu_count : int) return sys_types_h.ssize_t  -- /usr/include/sys/uio.h:41
   with Import => True, 
        Convention => C, 
        External_Name => "readv";

  -- Write data pointed by the buffers described by IOVEC, which
  --   is a vector of COUNT 'struct iovec's, to file descriptor FD.
  --   The data is written in the order specified.
  --   Operates just like 'write' (see <unistd.h>) except that the data
  --   are taken from IOVEC instead of a contiguous buffer.
  --   This function is a cancellation point and therefore not marked with
  --   __THROW.   

   function writev
     (uu_fd : int;
      uu_iovec : access constant bits_types_struct_iovec_h.iovec;
      uu_count : int) return sys_types_h.ssize_t  -- /usr/include/sys/uio.h:52
   with Import => True, 
        Convention => C, 
        External_Name => "writev";

  -- Read data from file descriptor FD at the given position OFFSET
  --   without change the file pointer, and put the result in the buffers
  --   described by IOVEC, which is a vector of COUNT 'struct iovec's.
  --   The buffers are filled in the order specified.  Operates just like
  --   'pread' (see <unistd.h>) except that data are put in IOVEC instead
  --   of a contiguous buffer.
  --   This function is a cancellation point and therefore not marked with
  --   __THROW.   

   function preadv
     (uu_fd : int;
      uu_iovec : access constant bits_types_struct_iovec_h.iovec;
      uu_count : int;
      uu_offset : bits_types_h.uu_off_t) return sys_types_h.ssize_t  -- /usr/include/sys/uio.h:67
   with Import => True, 
        Convention => C, 
        External_Name => "preadv";

  -- Write data pointed by the buffers described by IOVEC, which is a
  --   vector of COUNT 'struct iovec's, to file descriptor FD at the given
  --   position OFFSET without change the file pointer.  The data is
  --   written in the order specified.  Operates just like 'pwrite' (see
  --   <unistd.h>) except that the data are taken from IOVEC instead of a
  --   contiguous buffer.
  --   This function is a cancellation point and therefore not marked with
  --   __THROW.   

   function pwritev
     (uu_fd : int;
      uu_iovec : access constant bits_types_struct_iovec_h.iovec;
      uu_count : int;
      uu_offset : bits_types_h.uu_off_t) return sys_types_h.ssize_t  -- /usr/include/sys/uio.h:79
   with Import => True, 
        Convention => C, 
        External_Name => "pwritev";

  -- Read data from file descriptor FD at the given position OFFSET
  --   without change the file pointer, and put the result in the buffers
  --   described by IOVEC, which is a vector of COUNT 'struct iovec's.
  --   The buffers are filled in the order specified.  Operates just like
  --   'pread' (see <unistd.h>) except that data are put in IOVEC instead
  --   of a contiguous buffer.
  --   This function is a cancellation point and therefore not marked with
  --   __THROW.   

   function preadv64
     (uu_fd : int;
      uu_iovec : access constant bits_types_struct_iovec_h.iovec;
      uu_count : int;
      uu_offset : bits_types_h.uu_off64_t) return sys_types_h.ssize_t  -- /usr/include/sys/uio.h:106
   with Import => True, 
        Convention => C, 
        External_Name => "preadv64";

  -- Write data pointed by the buffers described by IOVEC, which is a
  --   vector of COUNT 'struct iovec's, to file descriptor FD at the given
  --   position OFFSET without change the file pointer.  The data is
  --   written in the order specified.  Operates just like 'pwrite' (see
  --   <unistd.h>) except that the data are taken from IOVEC instead of a
  --   contiguous buffer.
  --   This function is a cancellation point and therefore not marked with
  --   __THROW.   

   function pwritev64
     (uu_fd : int;
      uu_iovec : access constant bits_types_struct_iovec_h.iovec;
      uu_count : int;
      uu_offset : bits_types_h.uu_off64_t) return sys_types_h.ssize_t  -- /usr/include/sys/uio.h:118
   with Import => True, 
        Convention => C, 
        External_Name => "pwritev64";

  -- Same as preadv but with an additional flag argumenti defined at uio.h.   
   function preadv2
     (uu_fp : int;
      uu_iovec : access constant bits_types_struct_iovec_h.iovec;
      uu_count : int;
      uu_offset : bits_types_h.uu_off_t;
      uuu_flags : int) return sys_types_h.ssize_t  -- /usr/include/sys/uio.h:127
   with Import => True, 
        Convention => C, 
        External_Name => "preadv2";

  -- Same as preadv but with an additional flag argument defined at uio.h.   
   function pwritev2
     (uu_fd : int;
      uu_iodev : access constant bits_types_struct_iovec_h.iovec;
      uu_count : int;
      uu_offset : bits_types_h.uu_off_t;
      uu_flags : int) return sys_types_h.ssize_t  -- /usr/include/sys/uio.h:131
   with Import => True, 
        Convention => C, 
        External_Name => "pwritev2";

  -- Same as preadv but with an additional flag argumenti defined at uio.h.   
   function preadv64v2
     (uu_fp : int;
      uu_iovec : access constant bits_types_struct_iovec_h.iovec;
      uu_count : int;
      uu_offset : bits_types_h.uu_off64_t;
      uuu_flags : int) return sys_types_h.ssize_t  -- /usr/include/sys/uio.h:152
   with Import => True, 
        Convention => C, 
        External_Name => "preadv64v2";

  -- Same as preadv but with an additional flag argument defined at uio.h.   
   function pwritev64v2
     (uu_fd : int;
      uu_iodev : access constant bits_types_struct_iovec_h.iovec;
      uu_count : int;
      uu_offset : bits_types_h.uu_off64_t;
      uu_flags : int) return sys_types_h.ssize_t  -- /usr/include/sys/uio.h:157
   with Import => True, 
        Convention => C, 
        External_Name => "pwritev64v2";

  -- Some operating systems provide system-specific extensions to this
  --   header.   

end sys_uio_h;
