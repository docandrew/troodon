pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with bits_types_h;

package stdint_h is

   INT8_MIN : constant := (-128);  --  /usr/include/stdint.h:116
   INT16_MIN : constant := (-32767-1);  --  /usr/include/stdint.h:117
   INT32_MIN : constant := (-2147483647-1);  --  /usr/include/stdint.h:118
   --  unsupported macro: INT64_MIN (-__INT64_C(9223372036854775807)-1)

   INT8_MAX : constant := (127);  --  /usr/include/stdint.h:121
   INT16_MAX : constant := (32767);  --  /usr/include/stdint.h:122
   INT32_MAX : constant := (2147483647);  --  /usr/include/stdint.h:123
   --  unsupported macro: INT64_MAX (__INT64_C(9223372036854775807))

   UINT8_MAX : constant := (255);  --  /usr/include/stdint.h:127
   UINT16_MAX : constant := (65535);  --  /usr/include/stdint.h:128
   UINT32_MAX : constant := (4294967295);  --  /usr/include/stdint.h:129
   --  unsupported macro: UINT64_MAX (__UINT64_C(18446744073709551615))

   INT_LEAST8_MIN : constant := (-128);  --  /usr/include/stdint.h:134
   INT_LEAST16_MIN : constant := (-32767-1);  --  /usr/include/stdint.h:135
   INT_LEAST32_MIN : constant := (-2147483647-1);  --  /usr/include/stdint.h:136
   --  unsupported macro: INT_LEAST64_MIN (-__INT64_C(9223372036854775807)-1)

   INT_LEAST8_MAX : constant := (127);  --  /usr/include/stdint.h:139
   INT_LEAST16_MAX : constant := (32767);  --  /usr/include/stdint.h:140
   INT_LEAST32_MAX : constant := (2147483647);  --  /usr/include/stdint.h:141
   --  unsupported macro: INT_LEAST64_MAX (__INT64_C(9223372036854775807))

   UINT_LEAST8_MAX : constant := (255);  --  /usr/include/stdint.h:145
   UINT_LEAST16_MAX : constant := (65535);  --  /usr/include/stdint.h:146
   UINT_LEAST32_MAX : constant := (4294967295);  --  /usr/include/stdint.h:147
   --  unsupported macro: UINT_LEAST64_MAX (__UINT64_C(18446744073709551615))

   INT_FAST8_MIN : constant := (-128);  --  /usr/include/stdint.h:152

   INT_FAST16_MIN : constant := (-9223372036854775807-1);  --  /usr/include/stdint.h:154
   INT_FAST32_MIN : constant := (-9223372036854775807-1);  --  /usr/include/stdint.h:155
   --  unsupported macro: INT_FAST64_MIN (-__INT64_C(9223372036854775807)-1)

   INT_FAST8_MAX : constant := (127);  --  /usr/include/stdint.h:162

   INT_FAST16_MAX : constant := (9223372036854775807);  --  /usr/include/stdint.h:164
   INT_FAST32_MAX : constant := (9223372036854775807);  --  /usr/include/stdint.h:165
   --  unsupported macro: INT_FAST64_MAX (__INT64_C(9223372036854775807))

   UINT_FAST8_MAX : constant := (255);  --  /usr/include/stdint.h:173

   UINT_FAST16_MAX : constant := (18446744073709551615);  --  /usr/include/stdint.h:175
   UINT_FAST32_MAX : constant := (18446744073709551615);  --  /usr/include/stdint.h:176
   --  unsupported macro: UINT_FAST64_MAX (__UINT64_C(18446744073709551615))

   INTPTR_MIN : constant := (-9223372036854775807-1);  --  /usr/include/stdint.h:186
   INTPTR_MAX : constant := (9223372036854775807);  --  /usr/include/stdint.h:187
   UINTPTR_MAX : constant := (18446744073709551615);  --  /usr/include/stdint.h:188
   --  unsupported macro: INTMAX_MIN (-__INT64_C(9223372036854775807)-1)
   --  unsupported macro: INTMAX_MAX (__INT64_C(9223372036854775807))
   --  unsupported macro: UINTMAX_MAX (__UINT64_C(18446744073709551615))

   PTRDIFF_MIN : constant := (-9223372036854775807-1);  --  /usr/include/stdint.h:209
   PTRDIFF_MAX : constant := (9223372036854775807);  --  /usr/include/stdint.h:210

   SIG_ATOMIC_MIN : constant := (-2147483647-1);  --  /usr/include/stdint.h:222
   SIG_ATOMIC_MAX : constant := (2147483647);  --  /usr/include/stdint.h:223

   SIZE_MAX : constant := (18446744073709551615);  --  /usr/include/stdint.h:227
   --  unsupported macro: WCHAR_MIN __WCHAR_MIN
   --  unsupported macro: WCHAR_MAX __WCHAR_MAX

   WINT_MIN : constant := (0);  --  /usr/include/stdint.h:244
   WINT_MAX : constant := (4294967295);  --  /usr/include/stdint.h:245
   --  arg-macro: procedure INT8_C (c)
   --    c
   --  arg-macro: procedure INT16_C (c)
   --    c
   --  arg-macro: procedure INT32_C (c)
   --    c
   --  unsupported macro: INT64_C(c) c ## L
   --  arg-macro: procedure UINT8_C (c)
   --    c
   --  arg-macro: procedure UINT16_C (c)
   --    c
   --  unsupported macro: UINT32_C(c) c ## U
   --  unsupported macro: UINT64_C(c) c ## UL
   --  unsupported macro: INTMAX_C(c) c ## L
   --  unsupported macro: UINTMAX_C(c) c ## UL

   INT8_WIDTH : constant := 8;  --  /usr/include/stdint.h:278
   UINT8_WIDTH : constant := 8;  --  /usr/include/stdint.h:279
   INT16_WIDTH : constant := 16;  --  /usr/include/stdint.h:280
   UINT16_WIDTH : constant := 16;  --  /usr/include/stdint.h:281
   INT32_WIDTH : constant := 32;  --  /usr/include/stdint.h:282
   UINT32_WIDTH : constant := 32;  --  /usr/include/stdint.h:283
   INT64_WIDTH : constant := 64;  --  /usr/include/stdint.h:284
   UINT64_WIDTH : constant := 64;  --  /usr/include/stdint.h:285

   INT_LEAST8_WIDTH : constant := 8;  --  /usr/include/stdint.h:287
   UINT_LEAST8_WIDTH : constant := 8;  --  /usr/include/stdint.h:288
   INT_LEAST16_WIDTH : constant := 16;  --  /usr/include/stdint.h:289
   UINT_LEAST16_WIDTH : constant := 16;  --  /usr/include/stdint.h:290
   INT_LEAST32_WIDTH : constant := 32;  --  /usr/include/stdint.h:291
   UINT_LEAST32_WIDTH : constant := 32;  --  /usr/include/stdint.h:292
   INT_LEAST64_WIDTH : constant := 64;  --  /usr/include/stdint.h:293
   UINT_LEAST64_WIDTH : constant := 64;  --  /usr/include/stdint.h:294

   INT_FAST8_WIDTH : constant := 8;  --  /usr/include/stdint.h:296
   UINT_FAST8_WIDTH : constant := 8;  --  /usr/include/stdint.h:297
   --  unsupported macro: INT_FAST16_WIDTH __WORDSIZE
   --  unsupported macro: UINT_FAST16_WIDTH __WORDSIZE
   --  unsupported macro: INT_FAST32_WIDTH __WORDSIZE
   --  unsupported macro: UINT_FAST32_WIDTH __WORDSIZE

   INT_FAST64_WIDTH : constant := 64;  --  /usr/include/stdint.h:302
   UINT_FAST64_WIDTH : constant := 64;  --  /usr/include/stdint.h:303
   --  unsupported macro: INTPTR_WIDTH __WORDSIZE
   --  unsupported macro: UINTPTR_WIDTH __WORDSIZE

   INTMAX_WIDTH : constant := 64;  --  /usr/include/stdint.h:308
   UINTMAX_WIDTH : constant := 64;  --  /usr/include/stdint.h:309
   --  unsupported macro: PTRDIFF_WIDTH __WORDSIZE

   SIG_ATOMIC_WIDTH : constant := 32;  --  /usr/include/stdint.h:312
   --  unsupported macro: SIZE_WIDTH __WORDSIZE

   WCHAR_WIDTH : constant := 32;  --  /usr/include/stdint.h:314
   WINT_WIDTH : constant := 32;  --  /usr/include/stdint.h:315

  -- Copyright (C) 1997-2021 Free Software Foundation, Inc.
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

  -- *	ISO C99: 7.18 Integer types <stdint.h>
  --  

  -- Exact integral types.   
  -- Signed.   
  -- Unsigned.   
  -- Small types.   
  -- Signed.   
   subtype int_least8_t is bits_types_h.uu_int_least8_t;  -- /usr/include/stdint.h:43

   subtype int_least16_t is bits_types_h.uu_int_least16_t;  -- /usr/include/stdint.h:44

   subtype int_least32_t is bits_types_h.uu_int_least32_t;  -- /usr/include/stdint.h:45

   subtype int_least64_t is bits_types_h.uu_int_least64_t;  -- /usr/include/stdint.h:46

  -- Unsigned.   
   subtype uint_least8_t is bits_types_h.uu_uint_least8_t;  -- /usr/include/stdint.h:49

   subtype uint_least16_t is bits_types_h.uu_uint_least16_t;  -- /usr/include/stdint.h:50

   subtype uint_least32_t is bits_types_h.uu_uint_least32_t;  -- /usr/include/stdint.h:51

   subtype uint_least64_t is bits_types_h.uu_uint_least64_t;  -- /usr/include/stdint.h:52

  -- Fast types.   
  -- Signed.   
   subtype int_fast8_t is signed_char;  -- /usr/include/stdint.h:58

   subtype int_fast16_t is long;  -- /usr/include/stdint.h:60

   subtype int_fast32_t is long;  -- /usr/include/stdint.h:61

   subtype int_fast64_t is long;  -- /usr/include/stdint.h:62

  -- Unsigned.   
   subtype uint_fast8_t is unsigned_char;  -- /usr/include/stdint.h:71

   subtype uint_fast16_t is unsigned_long;  -- /usr/include/stdint.h:73

   subtype uint_fast32_t is unsigned_long;  -- /usr/include/stdint.h:74

   subtype uint_fast64_t is unsigned_long;  -- /usr/include/stdint.h:75

  -- Types for `void *' pointers.   
   subtype intptr_t is long;  -- /usr/include/stdint.h:87

   subtype uintptr_t is unsigned_long;  -- /usr/include/stdint.h:90

  -- Largest integral types.   
   subtype intmax_t is bits_types_h.uu_intmax_t;  -- /usr/include/stdint.h:101

   subtype uintmax_t is bits_types_h.uu_uintmax_t;  -- /usr/include/stdint.h:102

  -- Limits of integral types.   
  -- Minimum of signed integral types.   
  -- Maximum of signed integral types.   
  -- Maximum of unsigned integral types.   
  -- Minimum of signed integral types having a minimum size.   
  -- Maximum of signed integral types having a minimum size.   
  -- Maximum of unsigned integral types having a minimum size.   
  -- Minimum of fast signed integral types having a minimum size.   
  -- Maximum of fast signed integral types having a minimum size.   
  -- Maximum of fast unsigned integral types having a minimum size.   
  -- Values to test for integral types holding `void *' pointer.   
  -- Minimum for largest signed integral type.   
  -- Maximum for largest signed integral type.   
  -- Maximum for largest unsigned integral type.   
  -- Limits of other integer types.   
  -- Limits of `ptrdiff_t' type.   
  -- Limits of `sig_atomic_t'.   
  -- Limit of `size_t' type.   
  -- Limits of `wchar_t'.   
  -- These constants might also be defined in <wchar.h>.   
  -- Limits of `wint_t'.   
  -- Signed.   
  -- Unsigned.   
  -- Maximal type.   
end stdint_h;
