pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with bits_setjmp_h;
with bits_types_u_sigset_t_h;

package bits_types_struct_u_jmp_buf_tag_h is

  -- Define struct __jmp_buf_tag.
  --   Copyright (C) 1991-2021 Free Software Foundation, Inc.
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

  -- Get `__jmp_buf'.   
  -- Calling environment, plus possibly a saved signal mask.   
  -- NOTE: The machine-dependent definitions of `__sigsetjmp'
  --       assume that a `jmp_buf' begins with a `__jmp_buf' and that
  --       `__mask_was_saved' follows it.  Do not move these members
  --       or add others before it.   

  -- Calling environment.   
   type uu_jmp_buf_tag is record
      uu_jmpbuf : aliased bits_setjmp_h.uu_jmp_buf;  -- /usr/include/bits/types/struct___jmp_buf_tag.h:32
      uu_mask_was_saved : aliased int;  -- /usr/include/bits/types/struct___jmp_buf_tag.h:33
      uu_saved_mask : aliased bits_types_u_sigset_t_h.uu_sigset_t;  -- /usr/include/bits/types/struct___jmp_buf_tag.h:34
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/bits/types/struct___jmp_buf_tag.h:26

  -- Saved the signal mask?   
  -- Saved signal mask.   
end bits_types_struct_u_jmp_buf_tag_h;
