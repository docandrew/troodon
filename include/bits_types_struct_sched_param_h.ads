pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package bits_types_struct_sched_param_h is

  -- Sched parameter structure.  Generic version.
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
  --   License along with the GNU C Library;  if not, see
  --   <https://www.gnu.org/licenses/>.   

  -- Data structure to describe a process' schedulability.   
   type sched_param is record
      sched_priority : aliased int;  -- /usr/include/bits/types/struct_sched_param.h:25
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/bits/types/struct_sched_param.h:23

end bits_types_struct_sched_param_h;
