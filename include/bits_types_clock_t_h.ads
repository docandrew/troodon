pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with bits_types_h;

package bits_types_clock_t_h is

  -- Returned by `clock'.   
   subtype clock_t is bits_types_h.uu_clock_t;  -- /usr/include/bits/types/clock_t.h:7

end bits_types_clock_t_h;
