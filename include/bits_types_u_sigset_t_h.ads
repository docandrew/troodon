pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package bits_types_u_sigset_t_h is

   --  skipped anonymous struct anon_1

   type uu_sigset_t_array937 is array (0 .. 15) of aliased unsigned_long;
   type uu_sigset_t is record
      uu_val : aliased uu_sigset_t_array937;  -- /usr/include/bits/types/__sigset_t.h:7
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/bits/types/__sigset_t.h:8

end bits_types_u_sigset_t_h;
