pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with bits_types_h;

package bits_types_timer_t_h is

  -- Timer ID returned by `timer_create'.   
   subtype timer_t is bits_types_h.uu_timer_t;  -- /usr/include/bits/types/timer_t.h:7

end bits_types_timer_t_h;
