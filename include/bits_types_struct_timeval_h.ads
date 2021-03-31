pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with bits_types_h;

package bits_types_struct_timeval_h is

  -- A time value that is accurate to the nearest
  --   microsecond but also has a range of years.   

  -- Seconds.   
   type timeval is record
      tv_sec : aliased bits_types_h.uu_time_t;  -- /usr/include/bits/types/struct_timeval.h:10
      tv_usec : aliased bits_types_h.uu_suseconds_t;  -- /usr/include/bits/types/struct_timeval.h:11
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/bits/types/struct_timeval.h:8

  -- Microseconds.   
end bits_types_struct_timeval_h;
