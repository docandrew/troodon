pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package bits_cpu_set_h is

  -- Definition of the cpu_set_t structure used by the POSIX 1003.1b-1993
  --   scheduling interface.
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

  -- Size definition for CPU sets.   
  -- Type for array elements in 'cpu_set_t'.   
   subtype uu_cpu_mask is unsigned_long;  -- /usr/include/bits/cpu-set.h:32

  -- Basic access functions.   
  -- Data structure to describe CPU mask.   
   --  skipped anonymous struct anon_16

   type cpu_set_t_array1085 is array (0 .. 15) of aliased uu_cpu_mask;
   type cpu_set_t is record
      uu_bits : aliased cpu_set_t_array1085;  -- /usr/include/bits/cpu-set.h:41
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/bits/cpu-set.h:42

  -- Access functions for CPU masks.   
   --  skipped func __sched_cpucount

   --  skipped func __sched_cpualloc

   --  skipped func __sched_cpufree

end bits_cpu_set_h;
