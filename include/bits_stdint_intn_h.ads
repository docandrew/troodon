pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with bits_types_h;

package bits_stdint_intn_h is

  -- Define intN_t types.
  --   Copyright (C) 2017-2021 Free Software Foundation, Inc.
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

   subtype int8_t is bits_types_h.uu_int8_t;  -- /usr/include/bits/stdint-intn.h:24

   subtype int16_t is bits_types_h.uu_int16_t;  -- /usr/include/bits/stdint-intn.h:25

   subtype int32_t is bits_types_h.uu_int32_t;  -- /usr/include/bits/stdint-intn.h:26

   subtype int64_t is bits_types_h.uu_int64_t;  -- /usr/include/bits/stdint-intn.h:27

end bits_stdint_intn_h;
