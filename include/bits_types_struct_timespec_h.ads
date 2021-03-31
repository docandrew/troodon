pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with bits_types_h;

package bits_types_struct_timespec_h is

  -- NB: Include guard matches what <linux/time.h> uses.   
  -- POSIX.1b structure for a time value.  This is like a `struct timeval' but
  --   has nanoseconds instead of microseconds.   

  -- Seconds.   
   type timespec is record
      tv_sec : aliased bits_types_h.uu_time_t;  -- /usr/include/bits/types/struct_timespec.h:12
      tv_nsec : aliased bits_types_h.uu_syscall_slong_t;  -- /usr/include/bits/types/struct_timespec.h:16
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/bits/types/struct_timespec.h:10

  -- Nanoseconds.   
  -- Padding.   
  -- Nanoseconds.   
  -- Nanoseconds.   
  -- Padding.   
end bits_types_struct_timespec_h;
