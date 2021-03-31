pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with bits_types_h;

package bits_types_time_t_h is

  -- Returned by `time'.   
   subtype time_t is bits_types_h.uu_time_t;  -- /usr/include/bits/types/time_t.h:7

end bits_types_time_t_h;
