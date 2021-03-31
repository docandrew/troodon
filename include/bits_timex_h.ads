pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with bits_types_h;
with bits_types_struct_timeval_h;

package bits_timex_h is

   ADJ_OFFSET : constant := 16#0001#;  --  /usr/include/bits/timex.h:57
   ADJ_FREQUENCY : constant := 16#0002#;  --  /usr/include/bits/timex.h:58
   ADJ_MAXERROR : constant := 16#0004#;  --  /usr/include/bits/timex.h:59
   ADJ_ESTERROR : constant := 16#0008#;  --  /usr/include/bits/timex.h:60
   ADJ_STATUS : constant := 16#0010#;  --  /usr/include/bits/timex.h:61
   ADJ_TIMECONST : constant := 16#0020#;  --  /usr/include/bits/timex.h:62
   ADJ_TAI : constant := 16#0080#;  --  /usr/include/bits/timex.h:63
   ADJ_SETOFFSET : constant := 16#0100#;  --  /usr/include/bits/timex.h:64
   ADJ_MICRO : constant := 16#1000#;  --  /usr/include/bits/timex.h:65
   ADJ_NANO : constant := 16#2000#;  --  /usr/include/bits/timex.h:66
   ADJ_TICK : constant := 16#4000#;  --  /usr/include/bits/timex.h:67
   ADJ_OFFSET_SINGLESHOT : constant := 16#8001#;  --  /usr/include/bits/timex.h:68
   ADJ_OFFSET_SS_READ : constant := 16#a001#;  --  /usr/include/bits/timex.h:69
   --  unsupported macro: MOD_OFFSET ADJ_OFFSET
   --  unsupported macro: MOD_FREQUENCY ADJ_FREQUENCY
   --  unsupported macro: MOD_MAXERROR ADJ_MAXERROR
   --  unsupported macro: MOD_ESTERROR ADJ_ESTERROR
   --  unsupported macro: MOD_STATUS ADJ_STATUS
   --  unsupported macro: MOD_TIMECONST ADJ_TIMECONST
   --  unsupported macro: MOD_CLKB ADJ_TICK
   --  unsupported macro: MOD_CLKA ADJ_OFFSET_SINGLESHOT
   --  unsupported macro: MOD_TAI ADJ_TAI
   --  unsupported macro: MOD_MICRO ADJ_MICRO
   --  unsupported macro: MOD_NANO ADJ_NANO

   STA_PLL : constant := 16#0001#;  --  /usr/include/bits/timex.h:86
   STA_PPSFREQ : constant := 16#0002#;  --  /usr/include/bits/timex.h:87
   STA_PPSTIME : constant := 16#0004#;  --  /usr/include/bits/timex.h:88
   STA_FLL : constant := 16#0008#;  --  /usr/include/bits/timex.h:89

   STA_INS : constant := 16#0010#;  --  /usr/include/bits/timex.h:91
   STA_DEL : constant := 16#0020#;  --  /usr/include/bits/timex.h:92
   STA_UNSYNC : constant := 16#0040#;  --  /usr/include/bits/timex.h:93
   STA_FREQHOLD : constant := 16#0080#;  --  /usr/include/bits/timex.h:94

   STA_PPSSIGNAL : constant := 16#0100#;  --  /usr/include/bits/timex.h:96
   STA_PPSJITTER : constant := 16#0200#;  --  /usr/include/bits/timex.h:97
   STA_PPSWANDER : constant := 16#0400#;  --  /usr/include/bits/timex.h:98
   STA_PPSERROR : constant := 16#0800#;  --  /usr/include/bits/timex.h:99

   STA_CLOCKERR : constant := 16#1000#;  --  /usr/include/bits/timex.h:101
   STA_NANO : constant := 16#2000#;  --  /usr/include/bits/timex.h:102
   STA_MODE : constant := 16#4000#;  --  /usr/include/bits/timex.h:103
   STA_CLK : constant := 16#8000#;  --  /usr/include/bits/timex.h:104
   --  unsupported macro: STA_RONLY (STA_PPSSIGNAL | STA_PPSJITTER | STA_PPSWANDER | STA_PPSERROR | STA_CLOCKERR | STA_NANO | STA_MODE | STA_CLK)

  -- Copyright (C) 1995-2021 Free Software Foundation, Inc.
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

  -- These definitions from linux/timex.h as of 3.18.   
  -- mode selector  
   type timex is record
      modes : aliased unsigned;  -- /usr/include/bits/timex.h:28
      offset : aliased bits_types_h.uu_syscall_slong_t;  -- /usr/include/bits/timex.h:29
      freq : aliased bits_types_h.uu_syscall_slong_t;  -- /usr/include/bits/timex.h:30
      maxerror : aliased bits_types_h.uu_syscall_slong_t;  -- /usr/include/bits/timex.h:31
      esterror : aliased bits_types_h.uu_syscall_slong_t;  -- /usr/include/bits/timex.h:32
      status : aliased int;  -- /usr/include/bits/timex.h:33
      c_constant : aliased bits_types_h.uu_syscall_slong_t;  -- /usr/include/bits/timex.h:34
      precision : aliased bits_types_h.uu_syscall_slong_t;  -- /usr/include/bits/timex.h:35
      tolerance : aliased bits_types_h.uu_syscall_slong_t;  -- /usr/include/bits/timex.h:36
      time : aliased bits_types_struct_timeval_h.timeval;  -- /usr/include/bits/timex.h:37
      tick : aliased bits_types_h.uu_syscall_slong_t;  -- /usr/include/bits/timex.h:38
      ppsfreq : aliased bits_types_h.uu_syscall_slong_t;  -- /usr/include/bits/timex.h:39
      jitter : aliased bits_types_h.uu_syscall_slong_t;  -- /usr/include/bits/timex.h:40
      shift : aliased int;  -- /usr/include/bits/timex.h:41
      stabil : aliased bits_types_h.uu_syscall_slong_t;  -- /usr/include/bits/timex.h:42
      jitcnt : aliased bits_types_h.uu_syscall_slong_t;  -- /usr/include/bits/timex.h:43
      calcnt : aliased bits_types_h.uu_syscall_slong_t;  -- /usr/include/bits/timex.h:44
      errcnt : aliased bits_types_h.uu_syscall_slong_t;  -- /usr/include/bits/timex.h:45
      stbcnt : aliased bits_types_h.uu_syscall_slong_t;  -- /usr/include/bits/timex.h:46
      tai : aliased int;  -- /usr/include/bits/timex.h:48
      field_21 : aliased int;
      field_22 : aliased int;
      field_23 : aliased int;
      field_24 : aliased int;
      field_25 : aliased int;
      field_26 : aliased int;
      field_27 : aliased int;
      field_28 : aliased int;
      field_29 : aliased int;
      field_30 : aliased int;
      field_31 : aliased int;
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/bits/timex.h:26

  -- time offset (usec)  
  -- frequency offset (scaled ppm)  
  -- maximum error (usec)  
  -- estimated error (usec)  
  -- clock command/status  
  -- pll time constant  
  -- clock precision (usec) (ro)  
  -- clock frequency tolerance (ppm) (ro)  
  -- (read only, except for ADJ_SETOFFSET)  
  -- (modified) usecs between clock ticks  
  -- pps frequency (scaled ppm) (ro)  
  -- pps jitter (us) (ro)  
  -- interval duration (s) (shift) (ro)  
  -- pps stability (scaled ppm) (ro)  
  -- jitter limit exceeded (ro)  
  -- calibration intervals (ro)  
  -- calibration errors (ro)  
  -- stability limit exceeded (ro)  
  -- TAI offset (ro)  
  -- ???  
  -- Mode codes (timex.mode)  
  -- xntp 3.4 compatibility names  
  -- Status codes (timex.status)  
  -- Read-only bits  
end bits_timex_h;
