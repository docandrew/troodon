pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;

package bits_types_h is

  -- bits/types.h -- definitions of __*_t types underlying *_t types.
  --   Copyright (C) 2002-2021 Free Software Foundation, Inc.
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

  -- * Never include this file directly; use <sys/types.h> instead.
  --  

  -- Convenience types.   
   subtype uu_u_char is unsigned_char;  -- /usr/include/bits/types.h:31

   subtype uu_u_short is unsigned_short;  -- /usr/include/bits/types.h:32

   subtype uu_u_int is unsigned;  -- /usr/include/bits/types.h:33

   subtype uu_u_long is unsigned_long;  -- /usr/include/bits/types.h:34

  -- Fixed-size types, underlying types depend on word size and compiler.   
   subtype uu_int8_t is signed_char;  -- /usr/include/bits/types.h:37

   subtype uu_uint8_t is unsigned_char;  -- /usr/include/bits/types.h:38

   subtype uu_int16_t is short;  -- /usr/include/bits/types.h:39

   subtype uu_uint16_t is unsigned_short;  -- /usr/include/bits/types.h:40

   subtype uu_int32_t is int;  -- /usr/include/bits/types.h:41

   subtype uu_uint32_t is unsigned;  -- /usr/include/bits/types.h:42

   subtype uu_int64_t is long;  -- /usr/include/bits/types.h:44

   subtype uu_uint64_t is unsigned_long;  -- /usr/include/bits/types.h:45

  -- Smallest types with at least a given width.   
   subtype uu_int_least8_t is uu_int8_t;  -- /usr/include/bits/types.h:52

   subtype uu_uint_least8_t is uu_uint8_t;  -- /usr/include/bits/types.h:53

   subtype uu_int_least16_t is uu_int16_t;  -- /usr/include/bits/types.h:54

   subtype uu_uint_least16_t is uu_uint16_t;  -- /usr/include/bits/types.h:55

   subtype uu_int_least32_t is uu_int32_t;  -- /usr/include/bits/types.h:56

   subtype uu_uint_least32_t is uu_uint32_t;  -- /usr/include/bits/types.h:57

   subtype uu_int_least64_t is uu_int64_t;  -- /usr/include/bits/types.h:58

   subtype uu_uint_least64_t is uu_uint64_t;  -- /usr/include/bits/types.h:59

  -- quad_t is also 64 bits.   
   subtype uu_quad_t is long;  -- /usr/include/bits/types.h:63

   subtype uu_u_quad_t is unsigned_long;  -- /usr/include/bits/types.h:64

  -- Largest integral types.   
   subtype uu_intmax_t is long;  -- /usr/include/bits/types.h:72

   subtype uu_uintmax_t is unsigned_long;  -- /usr/include/bits/types.h:73

  -- The machine-dependent file <bits/typesizes.h> defines __*_T_TYPE
  --   macros for each of the OS types we define below.  The definitions
  --   of those macros must use the following macros for underlying types.
  --   We define __S<SIZE>_TYPE and __U<SIZE>_TYPE for the signed and unsigned
  --   variants of each of the following integer types on this machine.
  --	16		-- "natural" 16-bit type (always short)
  --	32		-- "natural" 32-bit type (always int)
  --	64		-- "natural" 64-bit type (long or long long)
  --	LONG32		-- 32-bit type, traditionally long
  --	QUAD		-- 64-bit type, traditionally long long
  --	WORD		-- natural type of __WORDSIZE bits (int or long)
  --	LONGWORD	-- type of __WORDSIZE bits, traditionally long
  --   We distinguish WORD/LONGWORD, 32/LONG32, and 64/QUAD so that the
  --   conventional uses of `long' or `long long' type modifiers match the
  --   types we define, even when a less-adorned type would be the same size.
  --   This matters for (somewhat) portably writing printf/scanf formats for
  --   these types, where using the appropriate l or ll format modifiers can
  --   make the typedefs and the formats match up across all GNU platforms.  If
  --   we used `long' when it's 64 bits where `long long' is expected, then the
  --   compiler would warn about the formats not matching the argument types,
  --   and the programmer changing them to shut up the compiler would break the
  --   program's portability.
  --   Here we assume what is presently the case in all the GCC configurations
  --   we support: long long is always 64 bits, long is always word/address size,
  --   and int is always 32 bits.   

  -- We want __extension__ before typedef's that use nonstandard base types
  --   such as `long long' in C89 mode.   

  -- No need to mark the typedef with __extension__.    
  -- Defines __*_T_TYPE macros.   
  -- Defines __TIME*_T_TYPE macros.   
  -- Type of device numbers.   
   subtype uu_dev_t is unsigned_long;  -- /usr/include/bits/types.h:145

  -- Type of user identifications.   
   subtype uu_uid_t is unsigned;  -- /usr/include/bits/types.h:146

  -- Type of group identifications.   
   subtype uu_gid_t is unsigned;  -- /usr/include/bits/types.h:147

  -- Type of file serial numbers.   
   subtype uu_ino_t is unsigned_long;  -- /usr/include/bits/types.h:148

  -- Type of file serial numbers (LFS). 
   subtype uu_ino64_t is unsigned_long;  -- /usr/include/bits/types.h:149

  -- Type of file attribute bitmasks.   
   subtype uu_mode_t is unsigned;  -- /usr/include/bits/types.h:150

  -- Type of file link counts.   
   subtype uu_nlink_t is unsigned_long;  -- /usr/include/bits/types.h:151

  -- Type of file sizes and offsets.   
   subtype uu_off_t is long;  -- /usr/include/bits/types.h:152

  -- Type of file sizes and offsets (LFS).   
   subtype uu_off64_t is long;  -- /usr/include/bits/types.h:153

  -- Type of process identifications.   
   subtype uu_pid_t is int;  -- /usr/include/bits/types.h:154

  -- Type of file system IDs.   
   --  skipped anonymous struct anon_0

   type uu_fsid_t_array857 is array (0 .. 1) of aliased int;
   type uu_fsid_t is record
      uu_val : aliased uu_fsid_t_array857;  -- /usr/include/bits/types.h:155
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/bits/types.h:155

  -- Type of CPU usage counts.   
   subtype uu_clock_t is long;  -- /usr/include/bits/types.h:156

  -- Type for resource measurement.   
   subtype uu_rlim_t is unsigned_long;  -- /usr/include/bits/types.h:157

  -- Type for resource measurement (LFS).   
   subtype uu_rlim64_t is unsigned_long;  -- /usr/include/bits/types.h:158

  -- General type for IDs.   
   subtype uu_id_t is unsigned;  -- /usr/include/bits/types.h:159

  -- Seconds since the Epoch.   
   subtype uu_time_t is long;  -- /usr/include/bits/types.h:160

  -- Count of microseconds.   
   subtype uu_useconds_t is unsigned;  -- /usr/include/bits/types.h:161

  -- Signed count of microseconds.   
   subtype uu_suseconds_t is long;  -- /usr/include/bits/types.h:162

   subtype uu_suseconds64_t is long;  -- /usr/include/bits/types.h:163

  -- The type of a disk address.   
   subtype uu_daddr_t is int;  -- /usr/include/bits/types.h:165

  -- Type of an IPC key.   
   subtype uu_key_t is int;  -- /usr/include/bits/types.h:166

  -- Clock ID used in clock and timer functions.   
   subtype uu_clockid_t is int;  -- /usr/include/bits/types.h:169

  -- Timer ID returned by `timer_create'.   
   type uu_timer_t is new System.Address;  -- /usr/include/bits/types.h:172

  -- Type to represent block size.   
   subtype uu_blksize_t is long;  -- /usr/include/bits/types.h:175

  -- Types from the Large File Support interface.   
  -- Type to count number of disk blocks.   
   subtype uu_blkcnt_t is long;  -- /usr/include/bits/types.h:180

   subtype uu_blkcnt64_t is long;  -- /usr/include/bits/types.h:181

  -- Type to count file system blocks.   
   subtype uu_fsblkcnt_t is unsigned_long;  -- /usr/include/bits/types.h:184

   subtype uu_fsblkcnt64_t is unsigned_long;  -- /usr/include/bits/types.h:185

  -- Type to count file system nodes.   
   subtype uu_fsfilcnt_t is unsigned_long;  -- /usr/include/bits/types.h:188

   subtype uu_fsfilcnt64_t is unsigned_long;  -- /usr/include/bits/types.h:189

  -- Type of miscellaneous file system fields.   
   subtype uu_fsword_t is long;  -- /usr/include/bits/types.h:192

  -- Type of a byte count, or error.   
   subtype uu_ssize_t is long;  -- /usr/include/bits/types.h:194

  -- Signed long type used in system calls.   
   subtype uu_syscall_slong_t is long;  -- /usr/include/bits/types.h:197

  -- Unsigned long type used in system calls.   
   subtype uu_syscall_ulong_t is unsigned_long;  -- /usr/include/bits/types.h:199

  -- These few don't really vary by system, they always correspond
  --   to one of the other defined types.   

  -- Type of file sizes and offsets (LFS).   
   subtype uu_loff_t is uu_off64_t;  -- /usr/include/bits/types.h:203

   type uu_caddr_t is new Interfaces.C.Strings.chars_ptr;  -- /usr/include/bits/types.h:204

  -- Duplicates info from stdint.h but this is used in unistd.h.   
   subtype uu_intptr_t is long;  -- /usr/include/bits/types.h:207

  -- Duplicate info from sys/socket.h.   
   subtype uu_socklen_t is unsigned;  -- /usr/include/bits/types.h:210

  -- C99: An integer type that can be accessed as an atomic entity,
  --   even in the presence of asynchronous interrupts.
  --   It is not currently necessary for this to be machine-specific.   

   subtype uu_sig_atomic_t is int;  -- /usr/include/bits/types.h:215

  -- Seconds since the Epoch, visible to user code when time_t is too
  --   narrow only for consistency with the old way of widening too-narrow
  --   types.  User code should never use __time64_t.   

end bits_types_h;
