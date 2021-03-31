pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with bits_types_struct_timespec_h;

package bits_types_struct_itimerspec_h is

  -- POSIX.1b structure for timer start values and intervals.   
   type itimerspec is record
      it_interval : aliased bits_types_struct_timespec_h.timespec;  -- /usr/include/bits/types/struct_itimerspec.h:10
      it_value : aliased bits_types_struct_timespec_h.timespec;  -- /usr/include/bits/types/struct_itimerspec.h:11
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/bits/types/struct_itimerspec.h:8

end bits_types_struct_itimerspec_h;
