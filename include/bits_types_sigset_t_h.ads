pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with bits_types_u_sigset_t_h;

package bits_types_sigset_t_h is

  -- A set of signals to be blocked, unblocked, or waited for.   
   subtype sigset_t is bits_types_u_sigset_t_h.uu_sigset_t;  -- /usr/include/bits/types/sigset_t.h:7

end bits_types_sigset_t_h;
