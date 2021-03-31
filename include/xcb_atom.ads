pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with bits_stdint_uintn_h;

package xcb_atom is

   function xcb_atom_name_by_screen (base : Interfaces.C.Strings.chars_ptr; screen : bits_stdint_uintn_h.uint8_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/xcb_atom.h:10
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_atom_name_by_screen";

   function xcb_atom_name_by_resource (base : Interfaces.C.Strings.chars_ptr; resource : bits_stdint_uintn_h.uint32_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/xcb_atom.h:11
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_atom_name_by_resource";

   function xcb_atom_name_unique (base : Interfaces.C.Strings.chars_ptr; id : bits_stdint_uintn_h.uint32_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/xcb/xcb_atom.h:12
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_atom_name_unique";

end xcb_atom;
