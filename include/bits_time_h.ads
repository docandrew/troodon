pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with bits_types_h;
limited with bits_timex_h;

package bits_time_h is

   --  unsupported macro: CLOCKS_PER_SEC ((__clock_t) 1000000)
   CLOCK_REALTIME : constant := 0;  --  /usr/include/bits/time.h:46

   CLOCK_MONOTONIC : constant := 1;  --  /usr/include/bits/time.h:48

   CLOCK_PROCESS_CPUTIME_ID : constant := 2;  --  /usr/include/bits/time.h:50

   CLOCK_THREAD_CPUTIME_ID : constant := 3;  --  /usr/include/bits/time.h:52

   CLOCK_MONOTONIC_RAW : constant := 4;  --  /usr/include/bits/time.h:54

   CLOCK_REALTIME_COARSE : constant := 5;  --  /usr/include/bits/time.h:56

   CLOCK_MONOTONIC_COARSE : constant := 6;  --  /usr/include/bits/time.h:58

   CLOCK_BOOTTIME : constant := 7;  --  /usr/include/bits/time.h:60

   CLOCK_REALTIME_ALARM : constant := 8;  --  /usr/include/bits/time.h:62

   CLOCK_BOOTTIME_ALARM : constant := 9;  --  /usr/include/bits/time.h:64

   CLOCK_TAI : constant := 11;  --  /usr/include/bits/time.h:66

   TIMER_ABSTIME : constant := 1;  --  /usr/include/bits/time.h:69

  -- System-dependent timing definitions.  Linux version.
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

  -- * Never include this file directly; use <time.h> instead.
  --  

  -- ISO/IEC 9899:1999 7.23.1: Components of time
  --   The macro `CLOCKS_PER_SEC' is an expression with type `clock_t' that is
  --   the number per second of the value returned by the `clock' function.   

  -- CAE XSH, Issue 4, Version 2: <time.h>
  --   The value of CLOCKS_PER_SEC is required to be 1 million on all
  --   XSI-conformant systems.  

  -- Even though CLOCKS_PER_SEC has such a strange value CLK_TCK
  --   presents the real value for clock ticks per second for the system.   

  -- Identifier for system-wide realtime clock.   
  -- Monotonic system-wide clock.   
  -- High-resolution timer from the CPU.   
  -- Thread-specific CPU-time clock.   
  -- Monotonic system-wide clock, not adjusted for frequency scaling.   
  -- Identifier for system-wide realtime clock, updated only on ticks.   
  -- Monotonic system-wide clock, updated only on ticks.   
  -- Monotonic system-wide clock that includes time spent in suspension.   
  -- Like CLOCK_REALTIME but also wakes suspended system.   
  -- Like CLOCK_BOOTTIME but also wakes suspended system.   
  -- Like CLOCK_REALTIME but in International Atomic Time.   
  -- Flag to indicate time is absolute.   
  -- Tune a POSIX clock.   
   function clock_adjtime (uu_clock_id : bits_types_h.uu_clockid_t; uu_utx : access bits_timex_h.timex) return int  -- /usr/include/bits/time.h:78
   with Import => True, 
        Convention => C, 
        External_Name => "clock_adjtime";

end bits_time_h;
