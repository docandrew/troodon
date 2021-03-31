pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with bits_types_h;

package bits_types_clockid_t_h is

  -- Clock ID used in clock and timer functions.   
   subtype clockid_t is bits_types_h.uu_clockid_t;  -- /usr/include/bits/types/clockid_t.h:7

end bits_types_clockid_t_h;
