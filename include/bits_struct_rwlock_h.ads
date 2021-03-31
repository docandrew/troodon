pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package bits_struct_rwlock_h is

  -- x86 internal rwlock struct definitions.
  --   Copyright (C) 2019-2021 Free Software Foundation, Inc.
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
  --   <http://www.gnu.org/licenses/>.   

   type uu_pthread_rwlock_arch_t_array981 is array (0 .. 6) of aliased unsigned_char;
   type uu_pthread_rwlock_arch_t is record
      uu_readers : aliased unsigned;  -- /usr/include/bits/struct_rwlock.h:25
      uu_writers : aliased unsigned;  -- /usr/include/bits/struct_rwlock.h:26
      uu_wrphase_futex : aliased unsigned;  -- /usr/include/bits/struct_rwlock.h:27
      uu_writers_futex : aliased unsigned;  -- /usr/include/bits/struct_rwlock.h:28
      uu_pad3 : aliased unsigned;  -- /usr/include/bits/struct_rwlock.h:29
      uu_pad4 : aliased unsigned;  -- /usr/include/bits/struct_rwlock.h:30
      uu_cur_writer : aliased int;  -- /usr/include/bits/struct_rwlock.h:32
      uu_shared : aliased int;  -- /usr/include/bits/struct_rwlock.h:33
      uu_rwelision : aliased signed_char;  -- /usr/include/bits/struct_rwlock.h:34
      uu_pad1 : aliased uu_pthread_rwlock_arch_t_array981;  -- /usr/include/bits/struct_rwlock.h:39
      uu_pad2 : aliased unsigned_long;  -- /usr/include/bits/struct_rwlock.h:42
      uu_flags : aliased unsigned;  -- /usr/include/bits/struct_rwlock.h:45
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/bits/struct_rwlock.h:23

  -- FLAGS must stay at this position in the structure to maintain
  --     binary compatibility.   

  -- FLAGS must stay at this position in the structure to maintain
  --     binary compatibility.   

end bits_struct_rwlock_h;
