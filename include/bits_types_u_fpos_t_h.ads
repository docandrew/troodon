pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with bits_types_h;
with bits_types_u_mbstate_t_h;

package bits_types_u_fpos_t_h is

  -- The tag name of this struct is _G_fpos_t to preserve historic
  --   C++ mangled names for functions taking fpos_t arguments.
  --   That name should not be used in new code.   

   type u_G_fpos_t is record
      uu_pos : aliased bits_types_h.uu_off_t;  -- /usr/include/bits/types/__fpos_t.h:12
      uu_state : aliased bits_types_u_mbstate_t_h.uu_mbstate_t;  -- /usr/include/bits/types/__fpos_t.h:13
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/bits/types/__fpos_t.h:10

   subtype uu_fpos_t is u_G_fpos_t;  -- /usr/include/bits/types/__fpos_t.h:14

end bits_types_u_fpos_t_h;
