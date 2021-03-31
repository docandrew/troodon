pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with bits_types_clock_t_h;
with bits_types_time_t_h;
limited with bits_types_struct_tm_h;
with Interfaces.C.Strings;
with stddef_h;
with bits_types_locale_t_h;
limited with bits_types_struct_timespec_h;
with bits_types_clockid_t_h;
with sys_types_h;
with System;
with bits_types_timer_t_h;
limited with bits_types_struct_itimerspec_h;

package time_h is

   TIME_UTC : constant := 1;  --  /usr/include/time.h:65

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

  -- *	ISO C99 Standard: 7.23 Date and time	<time.h>
  --  

  -- This defines CLOCKS_PER_SEC, which is the number of processor clock
  --   ticks per second, and possibly a number of other constants.    

  -- Many of the typedefs and structs whose official home is this header
  --   may also need to be defined by other headers.   

   type sigevent is null record;   -- incomplete struct

  -- Time base values for timespec_get.   
  -- Time used by the program so far (user time + system time).
  --   The result / CLOCKS_PER_SEC is program time in seconds.   

   function clock return bits_types_clock_t_h.clock_t  -- /usr/include/time.h:72
   with Import => True, 
        Convention => C, 
        External_Name => "clock";

  -- Return the current time and put it in *TIMER if TIMER is not NULL.   
   function time (uu_timer : access bits_types_time_t_h.time_t) return bits_types_time_t_h.time_t  -- /usr/include/time.h:75
   with Import => True, 
        Convention => C, 
        External_Name => "time";

  -- Return the difference between TIME1 and TIME0.   
   function difftime (uu_time1 : bits_types_time_t_h.time_t; uu_time0 : bits_types_time_t_h.time_t) return double  -- /usr/include/time.h:78
   with Import => True, 
        Convention => C, 
        External_Name => "difftime";

  -- Return the `time_t' representation of TP and normalize TP.   
   function mktime (uu_tp : access bits_types_struct_tm_h.tm) return bits_types_time_t_h.time_t  -- /usr/include/time.h:82
   with Import => True, 
        Convention => C, 
        External_Name => "mktime";

  -- Format TP into S according to FORMAT.
  --   Write no more than MAXSIZE characters and return the number
  --   of characters written, or 0 if it would exceed MAXSIZE.   

   function strftime
     (uu_s : Interfaces.C.Strings.chars_ptr;
      uu_maxsize : stddef_h.size_t;
      uu_format : Interfaces.C.Strings.chars_ptr;
      uu_tp : access constant bits_types_struct_tm_h.tm) return stddef_h.size_t  -- /usr/include/time.h:88
   with Import => True, 
        Convention => C, 
        External_Name => "strftime";

  -- Parse S according to FORMAT and store binary time information in TP.
  --   The return value is a pointer to the first unparsed character in S.   

   function strptime
     (uu_s : Interfaces.C.Strings.chars_ptr;
      uu_fmt : Interfaces.C.Strings.chars_ptr;
      uu_tp : access bits_types_struct_tm_h.tm) return Interfaces.C.Strings.chars_ptr  -- /usr/include/time.h:95
   with Import => True, 
        Convention => C, 
        External_Name => "strptime";

  -- Similar to the two functions above but take the information from
  --   the provided locale and not the global locale.   

   function strftime_l
     (uu_s : Interfaces.C.Strings.chars_ptr;
      uu_maxsize : stddef_h.size_t;
      uu_format : Interfaces.C.Strings.chars_ptr;
      uu_tp : access constant bits_types_struct_tm_h.tm;
      uu_loc : bits_types_locale_t_h.locale_t) return stddef_h.size_t  -- /usr/include/time.h:104
   with Import => True, 
        Convention => C, 
        External_Name => "strftime_l";

   function strptime_l
     (uu_s : Interfaces.C.Strings.chars_ptr;
      uu_fmt : Interfaces.C.Strings.chars_ptr;
      uu_tp : access bits_types_struct_tm_h.tm;
      uu_loc : bits_types_locale_t_h.locale_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/time.h:111
   with Import => True, 
        Convention => C, 
        External_Name => "strptime_l";

  -- Return the `struct tm' representation of *TIMER
  --   in Universal Coordinated Time (aka Greenwich Mean Time).   

   function gmtime (uu_timer : access bits_types_time_t_h.time_t) return access bits_types_struct_tm_h.tm  -- /usr/include/time.h:119
   with Import => True, 
        Convention => C, 
        External_Name => "gmtime";

  -- Return the `struct tm' representation
  --   of *TIMER in the local timezone.   

   function localtime (uu_timer : access bits_types_time_t_h.time_t) return access bits_types_struct_tm_h.tm  -- /usr/include/time.h:123
   with Import => True, 
        Convention => C, 
        External_Name => "localtime";

  -- Return the `struct tm' representation of *TIMER in UTC,
  --   using *TP to store the result.   

   function gmtime_r (uu_timer : access bits_types_time_t_h.time_t; uu_tp : access bits_types_struct_tm_h.tm) return access bits_types_struct_tm_h.tm  -- /usr/include/time.h:128
   with Import => True, 
        Convention => C, 
        External_Name => "gmtime_r";

  -- Return the `struct tm' representation of *TIMER in local time,
  --   using *TP to store the result.   

   function localtime_r (uu_timer : access bits_types_time_t_h.time_t; uu_tp : access bits_types_struct_tm_h.tm) return access bits_types_struct_tm_h.tm  -- /usr/include/time.h:133
   with Import => True, 
        Convention => C, 
        External_Name => "localtime_r";

  -- Return a string of the form "Day Mon dd hh:mm:ss yyyy\n"
  --   that is the representation of TP in this format.   

   function asctime (uu_tp : access constant bits_types_struct_tm_h.tm) return Interfaces.C.Strings.chars_ptr  -- /usr/include/time.h:139
   with Import => True, 
        Convention => C, 
        External_Name => "asctime";

  -- Equivalent to `asctime (localtime (timer))'.   
   function ctime (uu_timer : access bits_types_time_t_h.time_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/time.h:142
   with Import => True, 
        Convention => C, 
        External_Name => "ctime";

  -- Reentrant versions of the above functions.   
  -- Return in BUF a string of the form "Day Mon dd hh:mm:ss yyyy\n"
  --   that is the representation of TP in this format.   

   function asctime_r (uu_tp : access constant bits_types_struct_tm_h.tm; uu_buf : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/include/time.h:149
   with Import => True, 
        Convention => C, 
        External_Name => "asctime_r";

  -- Equivalent to `asctime_r (localtime_r (timer, *TMP*), buf)'.   
   function ctime_r (uu_timer : access bits_types_time_t_h.time_t; uu_buf : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/include/time.h:153
   with Import => True, 
        Convention => C, 
        External_Name => "ctime_r";

  -- Defined in localtime.c.   
  -- Current timezone names.   
  -- If daylight-saving time is ever in use.   
  -- Seconds west of UTC.   
  -- Same as above.   
   tzname : array (0 .. 1) of Interfaces.C.Strings.chars_ptr  -- /usr/include/time.h:166
   with Import => True, 
        Convention => C, 
        External_Name => "tzname";

  -- Set time conversion information from the TZ environment variable.
  --   If TZ is not defined, a locale-dependent default is used.   

   procedure tzset  -- /usr/include/time.h:170
   with Import => True, 
        Convention => C, 
        External_Name => "tzset";

   daylight : aliased int  -- /usr/include/time.h:174
   with Import => True, 
        Convention => C, 
        External_Name => "daylight";

   timezone : aliased long  -- /usr/include/time.h:175
   with Import => True, 
        Convention => C, 
        External_Name => "timezone";

  -- Nonzero if YEAR is a leap year (every 4 years,
  --   except every 100th isn't, and every 400th is).   

  -- Miscellaneous functions many Unices inherited from the public domain
  --   localtime package.  These are included only for compatibility.   

  -- Like `mktime', but for TP represents Universal Time, not local time.   
   function timegm (uu_tp : access bits_types_struct_tm_h.tm) return bits_types_time_t_h.time_t  -- /usr/include/time.h:190
   with Import => True, 
        Convention => C, 
        External_Name => "timegm";

  -- Another name for `mktime'.   
   function timelocal (uu_tp : access bits_types_struct_tm_h.tm) return bits_types_time_t_h.time_t  -- /usr/include/time.h:193
   with Import => True, 
        Convention => C, 
        External_Name => "timelocal";

  -- Return the number of days in YEAR.   
   function dysize (uu_year : int) return int  -- /usr/include/time.h:196
   with Import => True, 
        Convention => C, 
        External_Name => "dysize";

  -- Pause execution for a number of nanoseconds.
  --   This function is a cancellation point and therefore not marked with
  --   __THROW.   

   function nanosleep (uu_requested_time : access constant bits_types_struct_timespec_h.timespec; uu_remaining : access bits_types_struct_timespec_h.timespec) return int  -- /usr/include/time.h:205
   with Import => True, 
        Convention => C, 
        External_Name => "nanosleep";

  -- Get resolution of clock CLOCK_ID.   
   function clock_getres (uu_clock_id : bits_types_clockid_t_h.clockid_t; uu_res : access bits_types_struct_timespec_h.timespec) return int  -- /usr/include/time.h:210
   with Import => True, 
        Convention => C, 
        External_Name => "clock_getres";

  -- Get current value of clock CLOCK_ID and store it in TP.   
   function clock_gettime (uu_clock_id : bits_types_clockid_t_h.clockid_t; uu_tp : access bits_types_struct_timespec_h.timespec) return int  -- /usr/include/time.h:213
   with Import => True, 
        Convention => C, 
        External_Name => "clock_gettime";

  -- Set clock CLOCK_ID to value TP.   
   function clock_settime (uu_clock_id : bits_types_clockid_t_h.clockid_t; uu_tp : access constant bits_types_struct_timespec_h.timespec) return int  -- /usr/include/time.h:216
   with Import => True, 
        Convention => C, 
        External_Name => "clock_settime";

  -- High-resolution sleep with the specified clock.
  --   This function is a cancellation point and therefore not marked with
  --   __THROW.   

   function clock_nanosleep
     (uu_clock_id : bits_types_clockid_t_h.clockid_t;
      uu_flags : int;
      uu_req : access constant bits_types_struct_timespec_h.timespec;
      uu_rem : access bits_types_struct_timespec_h.timespec) return int  -- /usr/include/time.h:224
   with Import => True, 
        Convention => C, 
        External_Name => "clock_nanosleep";

  -- Return clock ID for CPU-time clock.   
   function clock_getcpuclockid (uu_pid : sys_types_h.pid_t; uu_clock_id : access bits_types_clockid_t_h.clockid_t) return int  -- /usr/include/time.h:229
   with Import => True, 
        Convention => C, 
        External_Name => "clock_getcpuclockid";

  -- Create new per-process timer using CLOCK_ID.   
   function timer_create
     (uu_clock_id : bits_types_clockid_t_h.clockid_t;
      uu_evp : access sigevent;
      uu_timerid : System.Address) return int  -- /usr/include/time.h:234
   with Import => True, 
        Convention => C, 
        External_Name => "timer_create";

  -- Delete timer TIMERID.   
   function timer_delete (uu_timerid : bits_types_timer_t_h.timer_t) return int  -- /usr/include/time.h:239
   with Import => True, 
        Convention => C, 
        External_Name => "timer_delete";

  -- Set timer TIMERID to VALUE, returning old value in OVALUE.   
   function timer_settime
     (uu_timerid : bits_types_timer_t_h.timer_t;
      uu_flags : int;
      uu_value : access constant bits_types_struct_itimerspec_h.itimerspec;
      uu_ovalue : access bits_types_struct_itimerspec_h.itimerspec) return int  -- /usr/include/time.h:242
   with Import => True, 
        Convention => C, 
        External_Name => "timer_settime";

  -- Get current value of timer TIMERID and store it in VALUE.   
   function timer_gettime (uu_timerid : bits_types_timer_t_h.timer_t; uu_value : access bits_types_struct_itimerspec_h.itimerspec) return int  -- /usr/include/time.h:247
   with Import => True, 
        Convention => C, 
        External_Name => "timer_gettime";

  -- Get expiration overrun for timer TIMERID.   
   function timer_getoverrun (uu_timerid : bits_types_timer_t_h.timer_t) return int  -- /usr/include/time.h:251
   with Import => True, 
        Convention => C, 
        External_Name => "timer_getoverrun";

  -- Set TS to calendar time based in time base BASE.   
   function timespec_get (uu_ts : access bits_types_struct_timespec_h.timespec; uu_base : int) return int  -- /usr/include/time.h:257
   with Import => True, 
        Convention => C, 
        External_Name => "timespec_get";

  -- Set to one of the following values to indicate an error.
  --     1  the DATEMSK environment variable is null or undefined,
  --     2  the template file cannot be opened for reading,
  --     3  failed to get file status information,
  --     4  the template file is not a regular file,
  --     5  an error is encountered while reading the template file,
  --     6  memory allication failed (not enough memory available),
  --     7  there is no line in the template that matches the input,
  --     8  invalid input specification Example: February 31 or a time is
  --	specified that can not be represented in a time_t (representing
  --	the time in seconds since 00:00:00 UTC, January 1, 1970)  

   getdate_err : aliased int  -- /usr/include/time.h:274
   with Import => True, 
        Convention => C, 
        External_Name => "getdate_err";

  -- Parse the given string as a date specification and return a value
  --   representing the value.  The templates from the file identified by
  --   the environment variable DATEMSK are used.  In case of an error
  --   `getdate_err' is set.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function getdate (uu_string : Interfaces.C.Strings.chars_ptr) return access bits_types_struct_tm_h.tm  -- /usr/include/time.h:283
   with Import => True, 
        Convention => C, 
        External_Name => "getdate";

  -- Since `getdate' is not reentrant because of the use of `getdate_err'
  --   and the static buffer to return the result in, we provide a thread-safe
  --   variant.  The functionality is the same.  The result is returned in
  --   the buffer pointed to by RESBUFP and in case of an error the return
  --   value is != 0 with the same values as given above for `getdate_err'.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function getdate_r (uu_string : Interfaces.C.Strings.chars_ptr; uu_resbufp : access bits_types_struct_tm_h.tm) return int  -- /usr/include/time.h:297
   with Import => True, 
        Convention => C, 
        External_Name => "getdate_r";

end time_h;
