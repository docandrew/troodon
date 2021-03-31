pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with xcb;
with System;
with xproto;
with bits_stdint_uintn_h;
with Interfaces.C.Strings;

package xcb_ewmh is

  -- * Copyright (C) 2009-2011 Arnaud Fontaine <arnau@debian.org>
  -- *
  -- * Permission  is  hereby  granted,  free  of charge,  to  any  person
  -- * obtaining  a copy  of  this software  and associated  documentation
  -- * files   (the  "Software"),   to  deal   in  the   Software  without
  -- * restriction, including without limitation  the rights to use, copy,
  -- * modify, merge, publish,  distribute, sublicense, and/or sell copies
  -- * of  the Software, and  to permit  persons to  whom the  Software is
  -- * furnished to do so, subject to the following conditions:
  -- *
  -- * The  above copyright  notice and  this permission  notice  shall be
  -- * included in all copies or substantial portions of the Software.
  -- *
  -- * THE SOFTWARE  IS PROVIDED  "AS IS", WITHOUT  WARRANTY OF  ANY KIND,
  -- * EXPRESS OR IMPLIED, INCLUDING BUT  NOT LIMITED TO THE WARRANTIES OF
  -- * MERCHANTABILITY,   FITNESS    FOR   A   PARTICULAR    PURPOSE   AND
  -- * NONINFRINGEMENT. IN  NO EVENT SHALL  THE AUTHORS BE LIABLE  FOR ANY
  -- * CLAIM,  DAMAGES  OR  OTHER  LIABILITY,  WHETHER  IN  AN  ACTION  OF
  -- * CONTRACT, TORT OR OTHERWISE, ARISING  FROM, OUT OF OR IN CONNECTION
  -- * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  -- *
  -- * Except as  contained in  this notice, the  names of the  authors or
  -- * their institutions shall not be used in advertising or otherwise to
  -- * promote the  sale, use or  other dealings in this  Software without
  -- * prior written authorization from the authors.
  --  

  --*
  -- * @defgroup xcb__ewmh_t XCB EWMH Functions
  -- *
  -- * These functions  allow easy handling  of the protocol  described in
  -- * the Extended Window Manager  Hints specification. The list of Atoms
  -- * is stored as an M4 file  (atomlist.m4) where each Atom is stored as
  -- * a variable defined in the header.
  -- *
  -- * Replies of requests generating a  list of pointers (such as list of
  -- * windows, atoms and UTF-8 strings)  are simply stored as a structure
  -- * holding  the XCB  reply which  should (usually)  never  be accessed
  -- * directly and has  to be wipe afterwards. This  structure provides a
  -- * convenient access to the list given in the reply itself.
  -- *
  -- * @{
  --  

  --*
  -- * @brief Hold EWMH information specific to a screen
  --  

  --* The X connection  
   --  skipped anonymous struct anon_38

   type xcb_ewmh_connection_t is record
      connection : access xcb.xcb_connection_t;  -- /usr/include/xcb/xcb_ewmh.h:61
      screens : System.Address;  -- /usr/include/xcb/xcb_ewmh.h:63
      nb_screens : aliased int;  -- /usr/include/xcb/xcb_ewmh.h:64
      u_NET_WM_CM_Sn : access xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:66
      u_NET_SUPPORTED : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:68
      u_NET_CLIENT_LIST : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:69
      u_NET_CLIENT_LIST_STACKING : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:70
      u_NET_NUMBER_OF_DESKTOPS : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:71
      u_NET_DESKTOP_GEOMETRY : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:72
      u_NET_DESKTOP_VIEWPORT : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:73
      u_NET_CURRENT_DESKTOP : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:74
      u_NET_DESKTOP_NAMES : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:75
      u_NET_ACTIVE_WINDOW : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:76
      u_NET_WORKAREA : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:77
      u_NET_SUPPORTING_WM_CHECK : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:78
      u_NET_VIRTUAL_ROOTS : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:79
      u_NET_DESKTOP_LAYOUT : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:80
      u_NET_SHOWING_DESKTOP : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:81
      u_NET_CLOSE_WINDOW : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:82
      u_NET_MOVERESIZE_WINDOW : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:83
      u_NET_WM_MOVERESIZE : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:84
      u_NET_RESTACK_WINDOW : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:85
      u_NET_REQUEST_FRAME_EXTENTS : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:86
      u_NET_WM_NAME : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:87
      u_NET_WM_VISIBLE_NAME : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:88
      u_NET_WM_ICON_NAME : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:89
      u_NET_WM_VISIBLE_ICON_NAME : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:90
      u_NET_WM_DESKTOP : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:91
      u_NET_WM_WINDOW_TYPE : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:92
      u_NET_WM_STATE : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:93
      u_NET_WM_ALLOWED_ACTIONS : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:94
      u_NET_WM_STRUT : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:95
      u_NET_WM_STRUT_PARTIAL : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:96
      u_NET_WM_ICON_GEOMETRY : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:97
      u_NET_WM_ICON : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:98
      u_NET_WM_PID : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:99
      u_NET_WM_HANDLED_ICONS : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:100
      u_NET_WM_USER_TIME : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:101
      u_NET_WM_USER_TIME_WINDOW : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:102
      u_NET_FRAME_EXTENTS : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:103
      u_NET_WM_PING : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:104
      u_NET_WM_SYNC_REQUEST : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:105
      u_NET_WM_SYNC_REQUEST_COUNTER : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:106
      u_NET_WM_FULLSCREEN_MONITORS : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:107
      u_NET_WM_FULL_PLACEMENT : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:108
      UTF8_STRING : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:109
      WM_PROTOCOLS : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:110
      MANAGER : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:111
      u_NET_WM_WINDOW_TYPE_DESKTOP : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:112
      u_NET_WM_WINDOW_TYPE_DOCK : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:113
      u_NET_WM_WINDOW_TYPE_TOOLBAR : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:114
      u_NET_WM_WINDOW_TYPE_MENU : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:115
      u_NET_WM_WINDOW_TYPE_UTILITY : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:116
      u_NET_WM_WINDOW_TYPE_SPLASH : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:117
      u_NET_WM_WINDOW_TYPE_DIALOG : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:118
      u_NET_WM_WINDOW_TYPE_DROPDOWN_MENU : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:119
      u_NET_WM_WINDOW_TYPE_POPUP_MENU : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:120
      u_NET_WM_WINDOW_TYPE_TOOLTIP : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:121
      u_NET_WM_WINDOW_TYPE_NOTIFICATION : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:122
      u_NET_WM_WINDOW_TYPE_COMBO : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:123
      u_NET_WM_WINDOW_TYPE_DND : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:124
      u_NET_WM_WINDOW_TYPE_NORMAL : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:125
      u_NET_WM_STATE_MODAL : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:126
      u_NET_WM_STATE_STICKY : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:127
      u_NET_WM_STATE_MAXIMIZED_VERT : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:128
      u_NET_WM_STATE_MAXIMIZED_HORZ : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:129
      u_NET_WM_STATE_SHADED : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:130
      u_NET_WM_STATE_SKIP_TASKBAR : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:131
      u_NET_WM_STATE_SKIP_PAGER : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:132
      u_NET_WM_STATE_HIDDEN : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:133
      u_NET_WM_STATE_FULLSCREEN : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:134
      u_NET_WM_STATE_ABOVE : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:135
      u_NET_WM_STATE_BELOW : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:136
      u_NET_WM_STATE_DEMANDS_ATTENTION : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:137
      u_NET_WM_ACTION_MOVE : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:138
      u_NET_WM_ACTION_RESIZE : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:139
      u_NET_WM_ACTION_MINIMIZE : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:140
      u_NET_WM_ACTION_SHADE : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:141
      u_NET_WM_ACTION_STICK : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:142
      u_NET_WM_ACTION_MAXIMIZE_HORZ : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:143
      u_NET_WM_ACTION_MAXIMIZE_VERT : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:144
      u_NET_WM_ACTION_FULLSCREEN : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:145
      u_NET_WM_ACTION_CHANGE_DESKTOP : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:146
      u_NET_WM_ACTION_CLOSE : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:147
      u_NET_WM_ACTION_ABOVE : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:148
      u_NET_WM_ACTION_BELOW : aliased xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:149
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xcb_ewmh.h:150

  --* The screens on this connection  
  --* _NET_WM_CM_Sn atoms depending on the number of screens  
  --* The EWMH atoms of this connection  
  --*
  -- * @brief Hold a GetProperty reply containing a list of Atoms
  --  

  --* The number of Atoms  
   --  skipped anonymous struct anon_39

   type xcb_ewmh_get_atoms_reply_t is record
      atoms_len : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:157
      atoms : access xproto.xcb_atom_t;  -- /usr/include/xcb/xcb_ewmh.h:159
      u_reply : access xproto.xcb_get_property_reply_t;  -- /usr/include/xcb/xcb_ewmh.h:161
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xcb_ewmh.h:162

  --* The list of Atoms  
  --* The actual GetProperty reply  
  --*
  -- * @brief Hold a GetProperty reply containing a list of Windows
  --  

  --* The number of Windows  
   --  skipped anonymous struct anon_40

   type xcb_ewmh_get_windows_reply_t is record
      windows_len : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:169
      windows : access xproto.xcb_window_t;  -- /usr/include/xcb/xcb_ewmh.h:171
      u_reply : access xproto.xcb_get_property_reply_t;  -- /usr/include/xcb/xcb_ewmh.h:173
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xcb_ewmh.h:174

  --* The list of Windows  
  --* The actual GetProperty reply  
  --*
  -- * @brief Hold a GetProperty reply containg a list of UTF-8 strings
  --  

  --* The number of UTF-8 strings  
   --  skipped anonymous struct anon_41

   type xcb_ewmh_get_utf8_strings_reply_t is record
      strings_len : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:181
      strings : Interfaces.C.Strings.chars_ptr;  -- /usr/include/xcb/xcb_ewmh.h:183
      u_reply : access xproto.xcb_get_property_reply_t;  -- /usr/include/xcb/xcb_ewmh.h:185
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xcb_ewmh.h:186

  --* The list of UTF-8 strings  
  --* The actual GetProperty reply  
  --*
  -- * @brief Coordinates Property values
  --  

  --* The x coordinate  
   --  skipped anonymous struct anon_42

   type xcb_ewmh_coordinates_t is record
      x : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:193
      y : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:195
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xcb_ewmh.h:196

  --* The y coordinate  
  --*
  -- * @brief Hold reply of _NET_DESKTOP_VIEWPORT GetProperty
  --  

  --* The number of desktop viewports  
   --  skipped anonymous struct anon_43

   type xcb_ewmh_get_desktop_viewport_reply_t is record
      desktop_viewport_len : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:203
      desktop_viewport : access xcb_ewmh_coordinates_t;  -- /usr/include/xcb/xcb_ewmh.h:205
      u_reply : access xproto.xcb_get_property_reply_t;  -- /usr/include/xcb/xcb_ewmh.h:207
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xcb_ewmh.h:208

  --* The desktop viewports  
  --* The actual GetProperty reply  
  --*
  -- * @brief Geometry Property values
  --  

  --* The x coordinate  
   --  skipped anonymous struct anon_44

   type xcb_ewmh_geometry_t is record
      x : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:215
      y : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:217
      width : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:219
      height : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:221
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xcb_ewmh.h:222

  --* The y coordinate  
  --* The width  
  --* The height  
  --*
  -- * @brief Hold reply of a _NET_WORKAREA GetProperty
  --  

  --* The number of desktop workarea  
   --  skipped anonymous struct anon_45

   type xcb_ewmh_get_workarea_reply_t is record
      workarea_len : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:229
      workarea : access xcb_ewmh_geometry_t;  -- /usr/include/xcb/xcb_ewmh.h:231
      u_reply : access xproto.xcb_get_property_reply_t;  -- /usr/include/xcb/xcb_ewmh.h:233
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xcb_ewmh.h:234

  --* The list of desktop workarea  
  --* The actual GetProperty reply  
  --*
  -- * @brief Source indication in requests
  --  

  --* No source at all (for clients supporting an older version of
  --      EWMH specification)  

  --* Normal application  
  --* Pagers and other clients that represent direct user actions  
   type xcb_ewmh_client_source_type_t is 
     (XCB_EWMH_CLIENT_SOURCE_TYPE_NONE,
      XCB_EWMH_CLIENT_SOURCE_TYPE_NORMAL,
      XCB_EWMH_CLIENT_SOURCE_TYPE_OTHER)
   with Convention => C;  -- /usr/include/xcb/xcb_ewmh.h:247

  --*
  -- * @brief _NET_DESKTOP_LAYOUT orientation
  --  

  --* Horizontal orientation (desktops laid out in rows)  
  --* Vertical orientation (desktops laid out in columns)  
   type xcb_ewmh_desktop_layout_orientation_t is 
     (XCB_EWMH_WM_ORIENTATION_HORZ,
      XCB_EWMH_WM_ORIENTATION_VERT)
   with Convention => C;  -- /usr/include/xcb/xcb_ewmh.h:257

  --*
  -- * @brief _NET_DESKTOP_LAYOUT starting corner
  --  

  --* Starting corner on the top left  
  --* Starting corner on the top right  
  --* Starting corner on the bottom right  
  --* Starting corner on the bottom left  
   type xcb_ewmh_desktop_layout_starting_corner_t is 
     (XCB_EWMH_WM_TOPLEFT,
      XCB_EWMH_WM_TOPRIGHT,
      XCB_EWMH_WM_BOTTOMRIGHT,
      XCB_EWMH_WM_BOTTOMLEFT)
   with Convention => C;  -- /usr/include/xcb/xcb_ewmh.h:271

  --*
  -- * @brief Hold reply of a _NET_DESKTOP_LAYOUT GetProperty
  -- * @see xcb_ewmh_desktop_layout_orientation_t
  -- * @see xcb_ewmh_desktop_layout_starting_corner_t
  --  

  --* The desktops orientation  
   --  skipped anonymous struct anon_49

   type xcb_ewmh_get_desktop_layout_reply_t is record
      orientation : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:280
      columns : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:282
      rows : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:284
      starting_corner : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:286
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xcb_ewmh.h:287

  --* The number of columns  
  --* The number of rows  
  --* The desktops starting corner  
  --*
  -- * @brief _NET_WM_MOVERESIZE value when moving via keyboard
  -- * @see xcb_ewmh_moveresize_direction_t
  --  

  --* The window x coordinate  
  --* The window y coordinate  
  --* The window width  
  --* The window height  
   subtype xcb_ewmh_moveresize_window_opt_flags_t is unsigned;
   XCB_EWMH_MOVERESIZE_WINDOW_X : constant unsigned := 256;
   XCB_EWMH_MOVERESIZE_WINDOW_Y : constant unsigned := 512;
   XCB_EWMH_MOVERESIZE_WINDOW_WIDTH : constant unsigned := 1024;
   XCB_EWMH_MOVERESIZE_WINDOW_HEIGHT : constant unsigned := 2048;  -- /usr/include/xcb/xcb_ewmh.h:302

  --*
  -- * @brief _NET_WM_MOVERESIZE window movement or resizing
  --  

  --* Resizing applied on the top left edge  
  --* Resizing applied on the top edge  
  --* Resizing applied on the top right edge  
  --* Resizing applied on the right edge  
  --* Resizing applied on the bottom right edge  
  --* Resizing applied on the bottom edge  
  --* Resizing applied on the bottom left edge  
  --* Resizing applied on the left edge  
  -- Movement only  
  -- Size via keyboard  
  -- Move via keyboard  
  -- Cancel operation  
   type xcb_ewmh_moveresize_direction_t is 
     (XCB_EWMH_WM_MOVERESIZE_SIZE_TOPLEFT,
      XCB_EWMH_WM_MOVERESIZE_SIZE_TOP,
      XCB_EWMH_WM_MOVERESIZE_SIZE_TOPRIGHT,
      XCB_EWMH_WM_MOVERESIZE_SIZE_RIGHT,
      XCB_EWMH_WM_MOVERESIZE_SIZE_BOTTOMRIGHT,
      XCB_EWMH_WM_MOVERESIZE_SIZE_BOTTOM,
      XCB_EWMH_WM_MOVERESIZE_SIZE_BOTTOMLEFT,
      XCB_EWMH_WM_MOVERESIZE_SIZE_LEFT,
      XCB_EWMH_WM_MOVERESIZE_MOVE,
      XCB_EWMH_WM_MOVERESIZE_SIZE_KEYBOARD,
      XCB_EWMH_WM_MOVERESIZE_MOVE_KEYBOARD,
      XCB_EWMH_WM_MOVERESIZE_CANCEL)
   with Convention => C;  -- /usr/include/xcb/xcb_ewmh.h:332

  --*
  -- * @brief Action on the _NET_WM_STATE property
  --  

  -- Remove/unset property  
  -- Add/set property  
  -- Toggle property   
   type xcb_ewmh_wm_state_action_t is 
     (XCB_EWMH_WM_STATE_REMOVE,
      XCB_EWMH_WM_STATE_ADD,
      XCB_EWMH_WM_STATE_TOGGLE)
   with Convention => C;  -- /usr/include/xcb/xcb_ewmh.h:344

  --*
  -- * @brief Hold reply of _NET_WM_STRUT_PARTIAL GetProperty
  --  

  --* Reserved space on the left border of the screen  
   --  skipped anonymous struct anon_53

   type xcb_ewmh_wm_strut_partial_t is record
      left : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:351
      right : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:353
      top : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:355
      bottom : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:357
      left_start_y : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:359
      left_end_y : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:361
      right_start_y : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:363
      right_end_y : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:365
      top_start_x : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:367
      top_end_x : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:369
      bottom_start_x : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:371
      bottom_end_x : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:373
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xcb_ewmh.h:374

  --* Reserved space on the right border of the screen  
  --* Reserved space on the top border of the screen  
  --* Reserved space on the bottom border of the screen  
  --* Beginning y coordinate of the left strut  
  --* Ending y coordinate of the left strut  
  --* Beginning y coordinate of the right strut  
  --* Ending y coordinate of the right strut  
  --* Beginning x coordinate of the top strut  
  --* Ending x coordinate of the top strut  
  --* Beginning x coordinate of the bottom strut  
  --* Ending x coordinate of the bottom strut  
  --*
  -- * @brief Hold a single icon from reply of _NET_WM_ICON GetProperty
  --  

  --* Icon width  
   --  skipped anonymous struct anon_54

   type xcb_ewmh_wm_icon_iterator_t is record
      width : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:381
      height : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:383
      data : access bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:385
      c_rem : aliased unsigned;  -- /usr/include/xcb/xcb_ewmh.h:387
      index : aliased unsigned;  -- /usr/include/xcb/xcb_ewmh.h:389
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xcb_ewmh.h:390

  --* Icon height  
  --* Rows, left to right and top to bottom of the CARDINAL ARGB  
  --* Number of icons remaining  
  --* Index of the current icon in the array of icons  
  --*
  -- * @brief Hold reply of _NET_WM_ICON GetProperty
  --  

  --* Number of icons  
   --  skipped anonymous struct anon_55

   type xcb_ewmh_get_wm_icon_reply_t is record
      num_icons : aliased unsigned;  -- /usr/include/xcb/xcb_ewmh.h:397
      u_reply : access xproto.xcb_get_property_reply_t;  -- /usr/include/xcb/xcb_ewmh.h:399
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xcb_ewmh.h:400

  --* The actual GetProperty reply  
  --*
  -- * @brief Hold reply of _NET_REQUEST_FRAME_EXTENTS GetProperty
  --  

  --* Width of the left border  
   --  skipped anonymous struct anon_56

   type xcb_ewmh_get_extents_reply_t is record
      left : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:407
      right : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:409
      top : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:411
      bottom : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:413
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xcb_ewmh.h:414

  --* Width of the right border  
  --* Width of the top border  
  --* Width of the bottom border  
  --*
  -- * @brief Hold reply of _NET_WM_FULLSCREEN_MONITORS GetProperty
  --  

  --* Monitor whose top edge defines the top edge of the fullscreen
  --      window  

   --  skipped anonymous struct anon_57

   type xcb_ewmh_get_wm_fullscreen_monitors_reply_t is record
      top : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:422
      bottom : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:425
      left : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:428
      right : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb_ewmh.h:431
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xcb_ewmh.h:432

  --* Monitor whose bottom edge defines the bottom edge of the
  --      fullscreen window  

  --* Monitor whose left edge defines the left edge of the fullscreen
  --      window  

  --* Monitor whose right edge defines the right edge of the
  --      fullscreen window  

  --*
  -- * @brief Send InternAtom requests for the EWMH atoms and its required atoms
  -- *
  -- * @param c The connection to the X server
  -- * @param ewmh The information relative to EWMH
  -- * @param screen_nbr The screen number
  -- * @return The cookies corresponding to EWMH atoms
  --  

   function xcb_ewmh_init_atoms (c : access xcb.xcb_connection_t; ewmh : access xcb_ewmh_connection_t) return access xproto.xcb_intern_atom_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:442
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_init_atoms";

  --*
  -- * @brief Process  the replies  to the screen  initialisation requests
  -- * previously sent
  -- *
  -- * @param emwh The information relative to EWMH
  -- * @param ewmh_cookies The cookies corresponding to EWMH atoms
  -- * @param e Error if any
  -- * @return Return 1 on success, 0 otherwise
  --  

   function xcb_ewmh_init_atoms_replies
     (ewmh : access xcb_ewmh_connection_t;
      ewmh_cookies : access xproto.xcb_intern_atom_cookie_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:454
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_init_atoms_replies";

   procedure xcb_ewmh_connection_wipe (ewmh : access xcb_ewmh_connection_t)  -- /usr/include/xcb/xcb_ewmh.h:459
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_connection_wipe";

  --*
  -- * @brief Send a SendEvent request containing a ClientMessage event
  -- *
  -- * This  function is  called  by all  the xcb_ewmh_request*  functions
  -- * whose should be used instead of calling directly this function
  -- *
  -- * @param c The X connection
  -- * @param window The window where the action will be applied
  -- * @param dest The destination window (usually the root window)
  -- * @param atom The type of the message
  -- * @param data_len The length of data to be sent
  -- * @param data The data to be sent
  -- * @return The cookie associated with the SendEvent request
  --  

   function xcb_ewmh_send_client_message
     (c : access xcb.xcb_connection_t;
      window : xproto.xcb_window_t;
      dest : xproto.xcb_window_t;
      atom : xproto.xcb_atom_t;
      data_len : bits_stdint_uintn_h.uint32_t;
      data : access bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:479
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_send_client_message";

   function xcb_ewmh_get_window_from_reply (window : access xproto.xcb_window_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:486
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_window_from_reply";

   function xcb_ewmh_get_window_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      window : access xproto.xcb_window_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:489
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_window_reply";

   function xcb_ewmh_get_cardinal_from_reply (cardinal : access bits_stdint_uintn_h.uint32_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:494
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_cardinal_from_reply";

   function xcb_ewmh_get_cardinal_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      cardinal : access bits_stdint_uintn_h.uint32_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:497
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_cardinal_reply";

  --*
  -- * @brief Get  a list  of atoms from  a given GetProperty  reply whose
  -- * type is ATOM
  -- *
  -- * This  function  is  called  by  all  the  xcb_ewmh_get_*_from_reply
  -- * functions  whose should  be used  instead of  calling  it directly.
  -- * Indeed,  The GetProperty request  has been  previously sent  by the
  -- * corresponding xcb_ewmh_get_*.
  -- *
  -- * @param atoms The atoms list
  -- * @param r The reply to get the atoms list from
  -- * @return Return 1 on success, 0 otherwise
  --  

   function xcb_ewmh_get_atoms_from_reply (atoms : access xcb_ewmh_get_atoms_reply_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:515
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_atoms_from_reply";

  --*
  -- * @brief Get a list of atoms  from the reply of a GetProperty request
  -- * whose type is ATOM
  -- *
  -- * This function  is called by all  the xcb_ewmh_get_*_reply functions
  -- * whose  should   be  used  instead  of  calling   it  directly.  The
  -- * GetProperty request  has been previously sent  by the corresponding
  -- * xcb_ewmh_get_*.
  -- *
  -- * @param ewmh The per-screen EWMH specific information
  -- * @param cookie The GetProperty cookie
  -- * @param atoms The atoms list
  -- * @param e The error if any
  -- * @return Return 1 on success, 0 otherwise
  --  

   function xcb_ewmh_get_atoms_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      atoms : access xcb_ewmh_get_atoms_reply_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:533
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_atoms_reply";

  --*
  -- * @brief Wipe the Atoms list reply
  -- *
  -- * This function must be called to free the memory allocated for atoms
  -- * when the reply is requested in *_reply functions.
  -- *
  -- * @param data The X reply to be freed
  --  

   procedure xcb_ewmh_get_atoms_reply_wipe (data : access xcb_ewmh_get_atoms_reply_t)  -- /usr/include/xcb/xcb_ewmh.h:546
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_atoms_reply_wipe";

  --*
  -- * @brief Get  a list  of atoms from  a given GetProperty  reply whose
  -- * type is WINDOW
  -- *
  -- * This  function  is  called  by  all  the  xcb_ewmh_get_*_from_reply
  -- * functions  whose should  be used  instead of  calling  it directly.
  -- * Indeed,  The GetProperty request  has been  previously sent  by the
  -- * corresponding xcb_ewmh_get_*.
  -- *
  -- * @param atoms The atoms list
  -- * @param r The reply to get the atoms list from
  -- * @return Return 1 on success, 0 otherwise
  --  

   function xcb_ewmh_get_windows_from_reply (atoms : access xcb_ewmh_get_windows_reply_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:561
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_windows_from_reply";

   function xcb_ewmh_get_utf8_strings_from_reply
     (ewmh : access xcb_ewmh_connection_t;
      data : access xcb_ewmh_get_utf8_strings_reply_t;
      r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:564
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_utf8_strings_from_reply";

   function xcb_ewmh_get_utf8_strings_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      data : access xcb_ewmh_get_utf8_strings_reply_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:568
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_utf8_strings_reply";

  --*
  -- * @brief Get a list of atoms  from the reply of a GetProperty request
  -- * whose type is WINDOW
  -- *
  -- * This function  is called by all  the xcb_ewmh_get_*_reply functions
  -- * whose  should   be  used  instead  of  calling   it  directly.  The
  -- * GetProperty request  has been previously sent  by the corresponding
  -- * xcb_ewmh_get_*.
  -- *
  -- * @param ewmh The per-screen EWMH specific information
  -- * @param cookie The GetProperty cookie
  -- * @param atoms The atoms list
  -- * @param e The error if any
  -- * @return Return 1 on success, 0 otherwise
  --  

   function xcb_ewmh_get_windows_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      atoms : access xcb_ewmh_get_windows_reply_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:588
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_windows_reply";

  --*
  -- * @brief Wipe the windows list reply
  -- *
  -- * This function must  be called to the free  the memory allocated for
  -- * windows when the reply is requested in '_reply' functions.
  -- *
  -- * @param data The X reply to be freed
  --  

   procedure xcb_ewmh_get_windows_reply_wipe (data : access xcb_ewmh_get_windows_reply_t)  -- /usr/include/xcb/xcb_ewmh.h:601
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_windows_reply_wipe";

  --*
  -- * @brief Wipe the UTF-8 strings list reply
  -- *
  -- * This function must  be called to the free  the memory allocated for
  -- * UTF-8 strings when the reply is requested in '_reply' functions.
  -- *
  -- * @param data The X reply to be freed
  --  

   procedure xcb_ewmh_get_utf8_strings_reply_wipe (data : access xcb_ewmh_get_utf8_strings_reply_t)  -- /usr/include/xcb/xcb_ewmh.h:611
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_utf8_strings_reply_wipe";

  --*
  -- * @brief Send a ChangeProperty request for _NET_SUPPORTED
  -- *
  -- * _NET_SUPPORTED, ATOM[]/32
  -- *
  -- * @param ewmh The per-screen EWMH information
  -- * @param screen_nbr The screen number
  -- * @param list_len The number of Atoms supported by the WM
  -- * @param list The Atoms supported by the WM
  -- * @return Cookie associated with the ChangeProperty _NET_SUPPORTED request
  --  

   function xcb_ewmh_set_supported
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      list_len : bits_stdint_uintn_h.uint32_t;
      list : access xproto.xcb_atom_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:624
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_supported";

  --*
  -- * @see xcb_ewmh_set_supported
  --  

   function xcb_ewmh_set_supported_checked
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      list_len : bits_stdint_uintn_h.uint32_t;
      list : access xproto.xcb_atom_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:632
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_supported_checked";

  --*
  -- * @brief Send  GetProperty request to get  _NET_SUPPORTED root window
  -- *        property
  -- *
  -- * _NET_SUPPORTED, ATOM[]/32
  -- *
  -- * This property MUST  be set by the Window  Manager to indicate which
  -- * hints it supports. For example: considering _NET_WM_STATE both this
  -- * atom   and   all   supported  states   e.g.    _NET_WM_STATE_MODAL,
  -- * _NET_WM_STATE_STICKY, would be  listed. This assumes that backwards
  -- * incompatible changes will  not be made to the  hints (without being
  -- * renamed).
  -- *
  -- * This form can be used only if  the request will cause a reply to be
  -- * generated. Any returned error will be placed in the event queue.
  -- *
  -- * @param ewmh The information relative to EWMH
  -- * @param screen_nbr The screen number
  -- * @return The _NET_SUPPORTED cookie of the GetProperty request
  --  

   function xcb_ewmh_get_supported_unchecked (ewmh : access xcb_ewmh_connection_t; screen_nbr : int) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:657
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_supported_unchecked";

  --*
  -- * @see xcb_ewmh_get_supported_unchecked
  --  

   function xcb_ewmh_get_supported (ewmh : access xcb_ewmh_connection_t; screen_nbr : int) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:663
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_supported";

  --*
  -- * @brief Get the list of supported atoms
  -- *
  -- * @param supported The list of atoms contained in the reply
  -- * @param r GetProperty _NET_SUPPORTED reply
  --  

   function xcb_ewmh_get_supported_from_reply (supported : access xcb_ewmh_get_atoms_reply_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:673
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_supported_from_reply";

  --*
  -- * @brief Get reply from the GetProperty _NET_SUPPORTED cookie
  -- *
  -- * The  parameter  e  supplied  to  this  function  must  be  NULL  if
  -- * xcb_get_window_supported_unchecked() is used.  Otherwise, it stores
  -- * the error if any.
  -- *
  -- * @param ewmh The information relative to EWMH
  -- * @param cookie The _NET_SUPPORTED GetProperty request cookie
  -- * @param supported The reply to be filled
  -- * @param The xcb_generic_error_t supplied
  -- * @return Return 1 on success, 0 otherwise
  --  

   function xcb_ewmh_get_supported_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      supported : access xcb_ewmh_get_atoms_reply_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:693
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_supported_reply";

  --*
  -- * @brief Send a ChangeProperty request for _NET_CLIENT_LIST
  -- *
  -- * _NET_CLIENT_LIST, WINDOW[]/32
  -- *
  -- * @param ewmh The per-screen EWMH information
  -- * @param screen_nbr The screen number
  -- * @param list_len The number of Atoms supported by the WM
  -- * @param list The Atoms supported by the WM
  -- * @return Cookie associated with the ChangeProperty _NET_CLIENT_LIST request
  --  

   function xcb_ewmh_set_client_list
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      list_len : bits_stdint_uintn_h.uint32_t;
      list : access xproto.xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:712
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_client_list";

  --*
  -- * @see xcb_ewmh_set_client_list
  --  

   function xcb_ewmh_set_client_list_checked
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      list_len : bits_stdint_uintn_h.uint32_t;
      list : access xproto.xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:720
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_client_list_checked";

  --*
  -- * @brief Send GetProperty request to get _NET_CLIENT_LIST root window
  -- *        property
  -- *
  -- * This  array   contains  all  X   Windows  managed  by   the  Window
  -- * Manager. _NET_CLIENT_LIST has  initial mapping order, starting with
  -- * the oldest window.  This property SHOULD be set  and updated by the
  -- * Window Manager.
  -- *
  -- * @param ewmh The information relative to EWMH.
  -- * @return The _NET_CLIENT_LIST cookie of the GetProperty request.
  --  

   function xcb_ewmh_get_client_list_unchecked (ewmh : access xcb_ewmh_connection_t; screen_nbr : int) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:737
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_client_list_unchecked";

  --*
  -- * @brief Send GetProperty request to get _NET_CLIENT_LIST root window
  -- *        property
  -- *
  -- * @see xcb_ewmh_get_client_list_unchecked
  -- * @param ewmh The information relative to EWMH.
  -- * @return The _NET_CLIENT_LIST cookie of the GetProperty request.
  --  

   function xcb_ewmh_get_client_list (ewmh : access xcb_ewmh_connection_t; screen_nbr : int) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:748
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_client_list";

  --*
  -- * @brief  Get   the  list  of  client  windows   from  a  GetProperty
  -- * _NET_CLIENT_LIST reply
  -- *
  -- * @param clients The list of clients contained in the reply
  -- * @param r GetProperty _NET_CLIENT_LIST reply
  --  

   function xcb_ewmh_get_client_list_from_reply (clients : access xcb_ewmh_get_windows_reply_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:759
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_client_list_from_reply";

  --*
  -- * @brief Get reply from the GetProperty _NET_CLIENT_LIST cookie
  -- *
  -- * The  parameter  e  supplied  to  this  function  must  be  NULL  if
  -- * xcb_get_window_client_list_unchecked()  is   used.   Otherwise,  it
  -- * stores the error if any.
  -- *
  -- * @param ewmh The information relative to EWMH
  -- * @param cookie The _NET_CLIENT_LIST GetProperty request cookie
  -- * @param clients The list of clients to be filled
  -- * @param The xcb_generic_error_t supplied
  -- * @return Return 1 on success, 0 otherwise
  --  

   function xcb_ewmh_get_client_list_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      clients : access xcb_ewmh_get_windows_reply_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:779
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_client_list_reply";

  --*
  -- * @brief Send a ChangeProperty request for _NET_CLIENT_LIST_STACKING
  -- *
  -- * _NET_CLIENT_LIST_STACKING, WINDOW[]/32
  -- *
  -- * @param ewmh The per-screen EWMH information
  -- * @param screen_nbr The screen number
  -- * @param list_len The number of Atoms supported by the WM
  -- * @param list The Atoms supported by the WM
  -- * @return Cookie associated with the ChangeProperty _NET_CLIENT_LIST_STACKING request
  --  

   function xcb_ewmh_set_client_list_stacking
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      list_len : bits_stdint_uintn_h.uint32_t;
      list : access xproto.xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:798
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_client_list_stacking";

  --*
  -- * @see xcb_ewmh_set_client_list_stacking
  --  

   function xcb_ewmh_set_client_list_stacking_checked
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      list_len : bits_stdint_uintn_h.uint32_t;
      list : access xproto.xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:806
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_client_list_stacking_checked";

  --*
  -- * @brief  Send GetProperty  request to  get _NET_CLIENT_LIST_STACKING
  -- *        root window property
  -- *
  -- * This  array   contains  all  X   Windows  managed  by   the  Window
  -- * Manager.  _NET_CLIENT_LIST_STACKING   has  initial  mapping  order,
  -- * starting with the  oldest window.  This property SHOULD  be set and
  -- * updated by the Window Manager.
  -- *
  -- * @param ewmh The information relative to EWMH
  -- * @return The _NET_CLIENT_LIST_STACKING cookie of the GetProperty request
  --  

   function xcb_ewmh_get_client_list_stacking_unchecked (ewmh : access xcb_ewmh_connection_t; screen_nbr : int) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:823
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_client_list_stacking_unchecked";

  --*
  -- * @see xcb_ewmh_get_client_list_unchecked
  --  

   function xcb_ewmh_get_client_list_stacking (ewmh : access xcb_ewmh_connection_t; screen_nbr : int) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:829
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_client_list_stacking";

  --*
  -- * @brief  Get   the  list  of  client  windows   from  a  GetProperty
  -- * _NET_CLIENT_LIST_STACKING reply
  -- *
  -- * @param clients The list of clients contained in the reply
  -- * @param r GetProperty _NET_CLIENT_LIST_STACKING reply
  --  

   function xcb_ewmh_get_client_list_stacking_from_reply (clients : access xcb_ewmh_get_windows_reply_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:840
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_client_list_stacking_from_reply";

  --*
  -- * @brief  Get reply  from  the GetProperty  _NET_CLIENT_LIST_STACKING
  -- * cookie
  -- *
  -- * The  parameter  e  supplied  to  this  function  must  be  NULL  if
  -- * xcb_get_window_client_list_stacking_unchecked()       is      used.
  -- * Otherwise, it stores the error if any.
  -- *
  -- * @param ewmh The information relative to EWMH
  -- * @param cookie The _NET_CLIENT_LIST_STACKING GetProperty request cookie
  -- * @param clients The list of clients to be filled
  -- * @param The xcb_generic_error_t supplied
  -- * @return Return 1 on success, 0 otherwise
  --  

   function xcb_ewmh_get_client_list_stacking_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      clients : access xcb_ewmh_get_windows_reply_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:861
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_client_list_stacking_reply";

  --*
  -- * @brief Send a ChangeProperty request for _NET_NUMBER_OF_DESKTOPS
  -- *
  -- * _NET_NUMBER_OF_DESKTOPS? CARDINAL/32
  -- *
  -- * @param ewmh The per-screen EWMH information
  -- * @param screen_nbr The screen number
  -- * @param number_of_desktops The number of desktops
  -- * @return Cookie associated with the ChangeProperty _NET_NUMBER_OF_DESKTOPS request
  --  

   function xcb_ewmh_set_number_of_desktops
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      number_of_desktops : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:879
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_number_of_desktops";

  --*
  -- * @see xcb_ewmh_set_number_of_desktops
  --  

   function xcb_ewmh_set_number_of_desktops_checked
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      number_of_desktops : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:886
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_number_of_desktops_checked";

  --*
  -- * @brief Send GetProperty request to get _NET_NUMBER_OF_DESKTOPS root
  -- *        window property
  -- *
  -- * @param ewmh The information relative to EWMH
  -- * @param screen_nbr The screen number
  -- * @return The _NET_NUMBER_OF_DESKTOPS cookie of the GetProperty request.
  --  

   function xcb_ewmh_get_number_of_desktops_unchecked (ewmh : access xcb_ewmh_connection_t; screen_nbr : int) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:898
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_number_of_desktops_unchecked";

  --*
  -- * @see xcb_ewmh_get_number_of_desktops_unchecked
  --  

   function xcb_ewmh_get_number_of_desktops (ewmh : access xcb_ewmh_connection_t; screen_nbr : int) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:904
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_number_of_desktops";

  --*
  -- * @brief  Get   the  list  of  client  windows   from  a  GetProperty
  -- * _NET_NUMBER_OF_DESKTOPS reply
  -- *
  -- * @param clients The list of clients contained in the reply
  -- * @param r GetProperty _NET_NUMBER_OF_DESKTOPS reply
  -- * @return Return 1 on success, 0 otherwise
  --  

   function xcb_ewmh_get_number_of_desktops_from_reply (number_of_desktops : access bits_stdint_uintn_h.uint32_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:916
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_number_of_desktops_from_reply";

  --*
  -- * @brief Get reply from the GetProperty _NET_NUMBER_OF_DESKTOPS cookie
  -- *
  -- * The  parameter  e  supplied  to  this  function  must  be  NULL  if
  -- * xcb_get_window_number_of_desktops_unchecked()  is used.  Otherwise,
  -- * it stores the error if any.
  -- *
  -- * @param ewmh The information relative to EWMH
  -- * @param cookie The _NET_NUMBER_OF_DESKTOPS GetProperty request cookie
  -- * @param supported The reply to be filled
  -- * @param The xcb_generic_error_t supplied
  -- * @return Return 1 on success, 0 otherwise
  --  

   function xcb_ewmh_get_number_of_desktops_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      number_of_desktops : access bits_stdint_uintn_h.uint32_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:936
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_number_of_desktops_reply";

   function xcb_ewmh_request_change_number_of_desktops
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      new_number_of_desktops : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:945
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_request_change_number_of_desktops";

  --*
  -- * @brief Send a ChangeProperty request for _NET_DESKTOP_GEOMETRY
  -- *
  -- * _NET_DESKTOP_GEOMETRY width, height, CARDINAL[2]/32
  -- *
  -- * @param ewmh The per-screen EWMH information
  -- * @param screen_nbr The screen number
  -- * @param new_width The new desktop width
  -- * @param new_height The new desktop height
  -- * @return Cookie associated with the ChangeProperty _NET_DESKTOP_GEOMETRY request
  --  

   function xcb_ewmh_set_desktop_geometry
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      new_width : bits_stdint_uintn_h.uint32_t;
      new_height : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:967
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_desktop_geometry";

  --*
  -- * @see xcb_ewmh_set_desktop_geometry
  --  

   function xcb_ewmh_set_desktop_geometry_checked
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      new_width : bits_stdint_uintn_h.uint32_t;
      new_height : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:975
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_desktop_geometry_checked";

  --*
  -- * @brief Send  GetProperty request to  get _NET_DESKTOP_GEOMETRY root
  -- *        window property
  -- *
  -- * @param ewmh The information relative to EWMH
  -- * @param screen_nbr The screen number
  -- * @return The _NET_DESKTOP_GEOMETRY cookie of the GetProperty request
  --  

   function xcb_ewmh_get_desktop_geometry_unchecked (ewmh : access xcb_ewmh_connection_t; screen_nbr : int) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:988
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_desktop_geometry_unchecked";

  --*
  -- * @see xcb_ewmh_get_desktop_geometry_unchecked
  --  

   function xcb_ewmh_get_desktop_geometry (ewmh : access xcb_ewmh_connection_t; screen_nbr : int) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:994
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_desktop_geometry";

  --*
  -- * @brief Send ClientMessage requesting to change the _NET_DESKTOP_GEOMETRY
  -- *
  -- * @param ewmh The per-screen EWMH information
  -- * @param screen_nbr The screen number
  -- * @param new_width The new desktop width
  -- * @param new_height The new desktop height
  -- * @return The SendEvent cookie
  --  

   function xcb_ewmh_request_change_desktop_geometry
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      new_width : bits_stdint_uintn_h.uint32_t;
      new_height : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1006
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_request_change_desktop_geometry";

  --*
  -- * @brief    Get   the   desktop    geometry   from    a   GetProperty
  -- * _NET_DESKTOP_GEOMETRY reply
  -- *
  -- * @param width The current desktop width
  -- * @param height The current desktop height
  -- * @param r GetProperty _NET_DESKTOP_GEOMETRY reply
  -- * @return Return 1 on success, 0 otherwise
  --  

   function xcb_ewmh_get_desktop_geometry_from_reply
     (width : access bits_stdint_uintn_h.uint32_t;
      height : access bits_stdint_uintn_h.uint32_t;
      r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1020
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_desktop_geometry_from_reply";

  --*
  -- * @brief Get reply from the GetProperty _NET_DESKTOP_GEOMETRY cookie
  -- *
  -- * The  parameter  e  supplied  to  this  function  must  be  NULL  if
  -- * xcb_get_desktop_geometry_unchecked() is used.  Otherwise, it stores
  -- * the error if any.
  -- *
  -- * @param ewmh The information relative to EWMH
  -- * @param cookie The _NET_DESKTOP_GEOMETRY GetProperty request cookie
  -- * @param width The current desktop width
  -- * @param width The current desktop height
  -- * @param The xcb_generic_error_t supplied
  -- * @return Return 1 on success, 0 otherwise
  --  

   function xcb_ewmh_get_desktop_geometry_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      width : access bits_stdint_uintn_h.uint32_t;
      height : access bits_stdint_uintn_h.uint32_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1038
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_desktop_geometry_reply";

  --*
  -- * @brief Send a ChangeProperty request for _NET_DESKTOP_VIEWPORT
  -- *
  -- * _NET_DESKTOP_VIEWPORT x, y, CARDINAL[][2]/32
  -- *
  -- * @param ewmh The per-screen EWMH information
  -- * @param screen_nbr The screen number
  -- * @param list_len The number of desktop viewports
  -- * @param list The desktop viewports
  -- * @return Cookie associated with the ChangeProperty _NET_DESKTOP_VIEWPORT request
  --  

   function xcb_ewmh_set_desktop_viewport
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      list_len : bits_stdint_uintn_h.uint32_t;
      list : access xcb_ewmh_coordinates_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1054
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_desktop_viewport";

  --*
  -- * @see xcb_ewmh_set_desktop_viewport
  --  

   function xcb_ewmh_set_desktop_viewport_checked
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      list_len : bits_stdint_uintn_h.uint32_t;
      list : access xcb_ewmh_coordinates_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1062
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_desktop_viewport_checked";

  --*
  -- * @brief Send  GetProperty request to  get _NET_DESKTOP_VIEWPORT root
  -- *        window property
  -- *
  -- * @param ewmh The information relative to EWMH
  -- * @param screen_nbr The screen number
  -- * @return The _NET_DESKTOP_VIEWPORT cookie of the GetProperty request
  --  

   function xcb_ewmh_get_desktop_viewport_unchecked (ewmh : access xcb_ewmh_connection_t; screen_nbr : int) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1075
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_desktop_viewport_unchecked";

  --*
  -- * @see xcb_ewmh_get_desktop_viewport_unchecked
  --  

   function xcb_ewmh_get_desktop_viewport (ewmh : access xcb_ewmh_connection_t; screen_nbr : int) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1081
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_desktop_viewport";

  --*
  -- * @brief Send ClientMessage requesting to change the _NET_DESKTOP_VIEWPORT
  -- *
  -- * @param ewmh The per-screen EWMH information
  -- * @param screen_nbr The screen number
  -- * @param new_x The new x coordinate
  -- * @param new_y The new y coordinate
  -- * @return The SendEvent cookie
  --  

   function xcb_ewmh_request_change_desktop_viewport
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      x : bits_stdint_uintn_h.uint32_t;
      y : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1093
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_request_change_desktop_viewport";

  --*
  -- * @brief    Get   the   desktop    geometry   from    a   GetProperty
  -- * _NET_DESKTOP_VIEWPORT reply
  -- *
  -- * @param vp The  current desktop viewports
  -- * @param r GetProperty _NET_DESKTOP_VIEWPORT reply
  -- * @return Return 1 on success, 0 otherwise
  --  

   function xcb_ewmh_get_desktop_viewport_from_reply (vp : access xcb_ewmh_get_desktop_viewport_reply_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1105
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_desktop_viewport_from_reply";

  --*
  -- * @brief Get reply from the GetProperty _NET_DESKTOP_VIEWPORT cookie
  -- *
  -- * The  parameter  e  supplied  to  this  function  must  be  NULL  if
  -- * xcb_get_desktop_viewport_unchecked() is used.  Otherwise, it stores
  -- * the error if any.
  -- *
  -- * @param ewmh The information relative to EWMH
  -- * @param cookie The _NET_DESKTOP_VIEWPORT GetProperty request cookie
  -- * @param vp The current desktop viewports
  -- * @param The xcb_generic_error_t supplied
  -- * @return Return 1 on success, 0 otherwise
  --  

   function xcb_ewmh_get_desktop_viewport_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      vp : access xcb_ewmh_get_desktop_viewport_reply_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1121
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_desktop_viewport_reply";

  --*
  -- * @brief Wipe the desktop viewports list reply
  -- *
  -- * This function must be called to free the memory allocated for atoms
  -- * when the reply  is requested in xcb_ewmh_get_desktop_viewport_reply
  -- * function.
  -- *
  -- * @param r The X reply to be freed
  --  

   procedure xcb_ewmh_get_desktop_viewport_reply_wipe (r : access xcb_ewmh_get_desktop_viewport_reply_t)  -- /usr/include/xcb/xcb_ewmh.h:1135
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_desktop_viewport_reply_wipe";

  --*
  -- * @brief Send a ChangeProperty request for _NET_CURRENT_DESKTOP
  -- *
  -- * _NET_CURRENT_DESKTOP desktop, CARDINAL/32
  -- *
  -- * @param ewmh The per-screen EWMH information
  -- * @param screen_nbr The screen number
  -- * @param new_current_desktop The new current desktop
  -- * @return Cookie associated with the ChangeProperty _NET_CURRENT_DESKTOP request
  --  

   function xcb_ewmh_set_current_desktop
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      new_current_desktop : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1147
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_current_desktop";

  --*
  -- * @see xcb_ewmh_set_current_desktop
  --  

   function xcb_ewmh_set_current_desktop_checked
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      new_current_desktop : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1154
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_current_desktop_checked";

  --*
  -- * @brief  Send GetProperty request  to get  _NET_CURRENT_DESKTOP root
  -- *        window property
  -- *
  -- * @param ewmh The information relative to EWMH
  -- * @param screen_nbr The screen number
  -- * @return The _NET_CURRENT_DESKTOP cookie of the GetProperty request
  --  

   function xcb_ewmh_get_current_desktop_unchecked (ewmh : access xcb_ewmh_connection_t; screen_nbr : int) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1166
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_current_desktop_unchecked";

  --*
  -- * @see xcb_ewmh_get_current_desktop_unchecked
  --  

   function xcb_ewmh_get_current_desktop (ewmh : access xcb_ewmh_connection_t; screen_nbr : int) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1172
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_current_desktop";

  --*
  -- * @brief Send ClientMessage requesting to change the _NET_CURRENT_DESKTOP
  -- *
  -- * @param ewmh The per-screen EWMH information
  -- * @param screen_nbr The screen number
  -- * @param new_desktop The new current desktop
  -- * @param timestamp The request timestamp
  -- * @return The SendEvent cookie
  --  

   function xcb_ewmh_request_change_current_desktop
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      new_desktop : bits_stdint_uintn_h.uint32_t;
      timestamp : xproto.xcb_timestamp_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1184
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_request_change_current_desktop";

  --*
  -- * @brief    Get   the   desktop    geometry   from    a   GetProperty
  -- * _NET_CURRENT_DESKTOP reply
  -- *
  -- * @param current_desktop The  current desktop
  -- * @param r GetProperty _NET_CURRENT_DESKTOP reply
  -- * @return Return 1 on success, 0 otherwise
  --  

   function xcb_ewmh_get_current_desktop_from_reply (current_desktop : access bits_stdint_uintn_h.uint32_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1198
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_current_desktop_from_reply";

  --*
  -- * @brief Get reply from the GetProperty _NET_CURRENT_DESKTOP cookie
  -- *
  -- * The  parameter  e  supplied  to  this  function  must  be  NULL  if
  -- * xcb_get_current_desktop_unchecked() is  used.  Otherwise, it stores
  -- * the error if any.
  -- *
  -- * @param ewmh The information relative to EWMH
  -- * @param cookie The _NET_CURRENT_DESKTOP GetProperty request cookie
  -- * @param vp The current desktop
  -- * @param The xcb_generic_error_t supplied
  -- * @return Return 1 on success, 0 otherwise
  --  

   function xcb_ewmh_get_current_desktop_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      current_desktop : access bits_stdint_uintn_h.uint32_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1218
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_current_desktop_reply";

  --*
  -- * @brief Send a ChangeProperty request for _NET_DESKTOP_NAMES
  -- *
  -- * _NET_DESKTOP_NAMES, UTF8_STRING[]
  -- *
  -- * @param ewmh The per-screen EWMH information
  -- * @param screen_nbr The screen number
  -- * @param strings_len The number of desktop names
  -- * @param strings The desktop names
  -- * @return Cookie associated with the ChangeProperty _NET_DESKTOP_NAMES request
  --  

   function xcb_ewmh_set_desktop_names
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      strings_len : bits_stdint_uintn_h.uint32_t;
      strings : Interfaces.C.Strings.chars_ptr) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1237
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_desktop_names";

  --*
  -- * @see xcb_ewmh_set_desktop_names
  --  

   function xcb_ewmh_set_desktop_names_checked
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      strings_len : bits_stdint_uintn_h.uint32_t;
      strings : Interfaces.C.Strings.chars_ptr) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1245
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_desktop_names_checked";

  --*
  -- * @brief  Send  GetProperty request  to  get _NET_DESKTOP_NAMES  root
  -- *        window property
  -- *
  -- * @param ewmh The information relative to EWMH
  -- * @return The _NET_DESKTOP_NAMES cookie of the GetProperty request
  --  

   function xcb_ewmh_get_desktop_names_unchecked (ewmh : access xcb_ewmh_connection_t; screen_nbr : int) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1257
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_desktop_names_unchecked";

  --*
  -- * @see xcb_ewmh_get_desktop_names_unchecked
  --  

   function xcb_ewmh_get_desktop_names (ewmh : access xcb_ewmh_connection_t; screen_nbr : int) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1263
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_desktop_names";

  --*
  -- * @brief    Get   the   desktop    geometry   from    a   GetProperty
  -- * _NET_DESKTOP_NAMES reply
  -- *
  -- * @param ewmh The information relative to EWMH
  -- * @param names The desktop names
  -- * @param r GetProperty _NET_DESKTOP_NAMES reply
  -- * @return Return 1 on success, 0 otherwise
  --  

   function xcb_ewmh_get_desktop_names_from_reply
     (ewmh : access xcb_ewmh_connection_t;
      names : access xcb_ewmh_get_utf8_strings_reply_t;
      r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1276
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_desktop_names_from_reply";

  --*
  -- * @brief Get reply from the GetProperty _NET_DESKTOP_NAMES cookie
  -- *
  -- * The  parameter  e  supplied  to  this  function  must  be  NULL  if
  -- * xcb_get_desktop_names_unchecked()  is used.   Otherwise,  it stores
  -- * the error if any.
  -- *
  -- * @param ewmh The information relative to EWMH
  -- * @param cookie The _NET_DESKTOP_NAMES GetProperty request cookie
  -- * @param names The desktop names
  -- * @param The xcb_generic_error_t supplied
  -- * @return Return 1 on success, 0 otherwise
  --  

   function xcb_ewmh_get_desktop_names_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      names : access xcb_ewmh_get_utf8_strings_reply_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1297
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_desktop_names_reply";

  --*
  -- * @brief Send a ChangeProperty request for _NET_ACTIVE_WINDOW
  -- *
  -- * _NET_ACTIVE_WINDOW, WINDOW/32
  -- *
  -- * @param ewmh The per-screen EWMH information
  -- * @param screen_nbr The screen number
  -- * @param new_active_window The window to make active
  -- * @return Cookie associated with the ChangeProperty _NET_ACTIVE_WINDOW request
  --  

   function xcb_ewmh_set_active_window
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      new_active_window : xproto.xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1315
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_active_window";

  --*
  -- * @see xcb_ewmh_set_active_window
  --  

   function xcb_ewmh_set_active_window_checked
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      new_active_window : xproto.xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1322
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_active_window_checked";

  --*
  -- * @brief Send ClientMessage requesting to change the _NET_ACTIVE_WINDOW
  -- *
  -- * The window ID  of the currently active window or  None if no window
  -- * has  the focus.  This  is a  read-only property  set by  the Window
  -- * Manager. If a Client wants to activate another window, it MUST send
  -- * a  _NET_ACTIVE_WINDOW  client  message  to  the  root  window.  The
  -- * timestamp is Client's  last user activity timestamp at  the time of
  -- * the request, and the currently active window is the Client's active
  -- * toplevel window, if any (the Window Manager may be e.g. more likely
  -- * to obey  the request  if it will  mean transferring focus  from one
  -- * active window to another).
  -- *
  -- * @see xcb_ewmh_client_source_type_t
  -- * @param ewmh The information relative to EWMH
  -- * @param screen_nbr The screen number
  -- * @param window_to_active The window ID to activate
  -- * @param source_indication The source indication
  -- * @param timestamp The client's last user activity timestamp
  -- * @param current_active_window The currently active window or None
  --  

   function xcb_ewmh_request_change_active_window
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      window_to_activate : xproto.xcb_window_t;
      source_indication : xcb_ewmh_client_source_type_t;
      timestamp : xproto.xcb_timestamp_t;
      current_active_window : xproto.xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1347
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_request_change_active_window";

  --*
  -- * @brief  Send  GetProperty request  to  get _NET_ACTIVE_WINDOW  root
  -- *        window property
  -- *
  -- * The window ID  of the currently active window or  None if no window
  -- * has  the focus.  This is  a read-only  property set  by  the Window
  -- * Manager.  This property  SHOULD be  set and  updated by  the Window
  -- * Manager.
  -- *
  -- * This form can be used only if  the request will cause a reply to be
  -- * generated. Any returned error will be placed in the event queue.
  -- *
  -- * @param ewmh The information relative to EWMH
  -- * @param screen_nbr The screen number
  -- * @return The _NET_ACTIVE_WINDOW cookie of the GetProperty request
  --  

   function xcb_ewmh_get_active_window_unchecked (ewmh : access xcb_ewmh_connection_t; screen_nbr : int) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1370
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_active_window_unchecked";

  --*
  -- * @brief  Send  GetProperty request  to  get _NET_ACTIVE_WINDOW  root
  -- *        window property
  -- *
  -- * @see xcb_ewmh_get_active_window_unchecked
  -- * @param ewmh The information relative to EWMH
  -- * @param screen_nbr The screen number
  -- * @return The _NET_ACTIVE_WINDOW cookie of the GetProperty request
  --  

   function xcb_ewmh_get_active_window (ewmh : access xcb_ewmh_connection_t; screen_nbr : int) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1382
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_active_window";

  --*
  -- * @brief  Get   the  list  of  client  windows   from  a  GetProperty
  -- * _NET_ACTIVE_WINDOW reply
  -- *
  -- * @param active_window The current active window
  -- * @param r GetProperty _NET_ACTIVE_WINDOW_OF_DESKTOPS reply
  -- * @return Return 1 on success, 0 otherwise
  --  

   function xcb_ewmh_get_active_window_from_reply (active_window : access xproto.xcb_window_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1394
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_active_window_from_reply";

  --*
  -- * @brief Get reply from the GetProperty _NET_ACTIVE_WINDOW cookie
  -- *
  -- * The  parameter  e  supplied  to  this  function  must  be  NULL  if
  -- * xcb_get_active_window_unchecked()  is used.   Otherwise,  it stores
  -- * the error if any.
  -- *
  -- * @param ewmh The information relative to EWMH.
  -- * @param cookie The _NET_ACTIVE_WINDOW GetProperty request cookie.
  -- * @param active_window The reply to be filled.
  -- * @param The xcb_generic_error_t supplied.
  -- * @return Return 1 on success, 0 otherwise.
  --  

   function xcb_ewmh_get_active_window_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      active_window : access xproto.xcb_window_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1414
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_active_window_reply";

  --*
  -- * @brief Send a ChangeProperty request for _NET_WORKAREA
  -- *
  -- * _NET_WORKAREA, x, y, width, height CARDINAL[][4]/32
  -- *
  -- * @param ewmh The per-screen EWMH information
  -- * @param screen_nbr The screen number
  -- * @param list_len The number of desktops workareas
  -- * @param list The desktops workareas
  -- * @return Cookie associated with the ChangeProperty _NET_WORKAREA request
  --  

   function xcb_ewmh_set_workarea
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      list_len : bits_stdint_uintn_h.uint32_t;
      list : access xcb_ewmh_geometry_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1433
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_workarea";

  --*
  -- * @see xcb_ewmh_set_workarea
  --  

   function xcb_ewmh_set_workarea_checked
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      list_len : bits_stdint_uintn_h.uint32_t;
      list : access xcb_ewmh_geometry_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1441
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_workarea_checked";

  --*
  -- * @brief  Send  GetProperty request  to  get _NET_WORKAREA  root
  -- *        window property
  -- *
  -- * @param ewmh The information relative to EWMH
  -- * @param screen_nbr The screen number
  -- * @return The _NET_WORKAREA cookie of the GetProperty request
  --  

   function xcb_ewmh_get_workarea_unchecked (ewmh : access xcb_ewmh_connection_t; screen_nbr : int) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1454
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_workarea_unchecked";

  --*
  -- * @see xcb_ewmh_get_virtual_roots_unchecked
  --  

   function xcb_ewmh_get_workarea (ewmh : access xcb_ewmh_connection_t; screen_nbr : int) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1460
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_workarea";

  --*
  -- * @brief Get  the desktop  geometry from a  GetProperty _NET_WORKAREA
  -- * reply
  -- *
  -- * @param wa The  current workarea
  -- * @param r GetProperty _NET_WORKAREA reply
  -- * @return Return 1 on success, 0 otherwise
  --  

   function xcb_ewmh_get_workarea_from_reply (wa : access xcb_ewmh_get_workarea_reply_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1471
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_workarea_from_reply";

  --*
  -- * @brief Get reply from the GetProperty _NET_WORKAREA cookie
  -- *
  -- * The  parameter  e  supplied  to  this  function  must  be  NULL  if
  -- * xcb_get_workarea_unchecked()  is used.   Otherwise,  it stores  the
  -- * error if any.
  -- *
  -- * @param ewmh The information relative to EWMH
  -- * @param cookie The _NET_WORKAREA GetProperty request cookie
  -- * @param wa The current workareas of desktops
  -- * @param The xcb_generic_error_t supplied
  -- * @return Return 1 on success, 0 otherwise
  --  

   function xcb_ewmh_get_workarea_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      wa : access xcb_ewmh_get_workarea_reply_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1487
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_workarea_reply";

  --*
  -- * @brief Wipe the workarea list reply
  -- *
  -- * This function must be called to free the memory allocated for atoms
  -- * when   the  reply   is  requested   in  xcb_ewmh_get_workarea_reply
  -- * function.
  -- *
  -- * @param r The X reply to be freed
  --  

   procedure xcb_ewmh_get_workarea_reply_wipe (r : access xcb_ewmh_get_workarea_reply_t)  -- /usr/include/xcb/xcb_ewmh.h:1501
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_workarea_reply_wipe";

  --*
  -- * @brief Send a ChangeProperty request for _NET_SUPPORTING_WM_CHECK
  -- *
  -- * _NET_SUPPORTING_WM_CHECK, WINDOW/32
  -- *
  -- * @param ewmh The per-screen EWMH information
  -- * @param parent_window The root window or child window created by the WM
  -- * @param child_window The child window created by the WM
  -- * @return Cookie associated with the ChangeProperty _NET_SUPPORTING_WM_CHECK request
  --  

   function xcb_ewmh_set_supporting_wm_check
     (ewmh : access xcb_ewmh_connection_t;
      parent_window : xproto.xcb_window_t;
      child_window : xproto.xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1513
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_supporting_wm_check";

  --*
  -- * @see xcb_ewmh_set_supporting_wm_check
  --  

   function xcb_ewmh_set_supporting_wm_check_checked
     (ewmh : access xcb_ewmh_connection_t;
      parent_window : xproto.xcb_window_t;
      child_window : xproto.xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1520
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_supporting_wm_check_checked";

  --*
  -- * @brief  Send GetProperty  request  to get  _NET_SUPPORTING_WM_CHECK
  -- *        root window property
  -- *
  -- * @param ewmh The information relative to EWMH
  -- * @param screen_nbr The screen number
  -- * @return The _NET_SUPPORTING_WM_CHECK cookie of the GetProperty request
  --  

   function xcb_ewmh_get_supporting_wm_check_unchecked (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1532
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_supporting_wm_check_unchecked";

  --*
  -- * @see xcb_ewmh_get_supporting_wm_check_unchecked
  --  

   function xcb_ewmh_get_supporting_wm_check (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1538
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_supporting_wm_check";

  --*
  -- * @brief  Get   the  list  of  client  windows   from  a  GetProperty
  -- * _NET_SUPPORTING_WM_CHECK reply
  -- *
  -- * @param window The child window created by the WM
  -- * @param r GetProperty _NET_SUPPORTING_WM_CHECK reply
  -- * @return Return 1 on success, 0 otherwise
  --  

   function xcb_ewmh_get_supporting_wm_check_from_reply (window : access xproto.xcb_window_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1550
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_supporting_wm_check_from_reply";

  --*
  -- * @brief  Get  reply  from the  GetProperty  _NET_SUPPORTING_WM_CHECK
  -- * cookie
  -- *
  -- * The  parameter  e  supplied  to  this  function  must  be  NULL  if
  -- * xcb_get_supporting_wm_check_unchecked()  is  used.   Otherwise,  it
  -- * stores the error if any.
  -- *
  -- * @param ewmh The information relative to EWMH
  -- * @param cookie The _NET_SUPPORTING_WM_CHECK GetProperty request cookie
  -- * @param window The reply to be filled
  -- * @param The xcb_generic_error_t supplied
  -- * @return Return 1 on success, 0 otherwise
  --  

   function xcb_ewmh_get_supporting_wm_check_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      window : access xproto.xcb_window_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1571
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_supporting_wm_check_reply";

  --*
  -- * @brief Send a ChangeProperty request for _NET_VIRTUAL_ROOTS
  -- *
  -- * _NET_VIRTUAL_ROOTS, WINDOW[]/32
  -- *
  -- * @param ewmh The per-screen EWMH information
  -- * @param screen_nbr The screen number
  -- * @param list_len The number of virtual root windows
  -- * @param list The virtual root windows
  -- * @return Cookie associated with the ChangeProperty _NET_VIRTUAL_ROOTS request
  --  

   function xcb_ewmh_set_virtual_roots
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      list_len : bits_stdint_uintn_h.uint32_t;
      list : access xproto.xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1590
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_virtual_roots";

  --*
  -- * @see xcb_ewmh_set_virtual_roots
  --  

   function xcb_ewmh_set_virtual_roots_checked
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      list_len : bits_stdint_uintn_h.uint32_t;
      list : access xproto.xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1598
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_virtual_roots_checked";

  --*
  -- * @brief  Send  GetProperty request  to  get _NET_VIRTUAL_ROOTS  root
  -- *        window property
  -- *
  -- * @param ewmh The information relative to EWMH
  -- * @param screen_nbr The screen number
  -- * @return The _NET_VIRTUAL_ROOTS cookie of the GetProperty request
  --  

   function xcb_ewmh_get_virtual_roots_unchecked (ewmh : access xcb_ewmh_connection_t; screen_nbr : int) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1611
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_virtual_roots_unchecked";

  --*
  -- * @see xcb_ewmh_get_virtual_roots_unchecked
  --  

   function xcb_ewmh_get_virtual_roots (ewmh : access xcb_ewmh_connection_t; screen_nbr : int) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1617
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_virtual_roots";

  --*
  -- * @brief Get  the desktop  geometry from a  GetProperty _NET_WORKAREA
  -- * reply
  -- *
  -- * @param virtual_roots The current virtual root windows
  -- * @param r GetProperty _NET_VIRTUAL_ROOTS reply
  -- * @return Return 1 on success, 0 otherwise
  --  

   function xcb_ewmh_get_virtual_roots_from_reply (virtual_roots : access xcb_ewmh_get_windows_reply_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1629
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_virtual_roots_from_reply";

  --*
  -- * @brief Get reply from the GetProperty _NET_VIRTUAL_ROOTS cookie
  -- *
  -- * The  parameter  e  supplied  to  this  function  must  be  NULL  if
  -- * xcb_get_virtual_roots_unchecked()  is used.   Otherwise,  it stores
  -- * the error if any.
  -- *
  -- * @param ewmh The information relative to EWMH
  -- * @param cookie The _NET_VIRTUAL_ROOTS GetProperty request cookie
  -- * @param virtual_roots The current virtual root windows
  -- * @param The xcb_generic_error_t supplied
  -- * @return Return 1 on success, 0 otherwise
  --  

   function xcb_ewmh_get_virtual_roots_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      virtual_roots : access xcb_ewmh_get_windows_reply_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1649
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_virtual_roots_reply";

   function xcb_ewmh_set_desktop_layout
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      orientation : xcb_ewmh_desktop_layout_orientation_t;
      columns : bits_stdint_uintn_h.uint32_t;
      rows : bits_stdint_uintn_h.uint32_t;
      starting_corner : xcb_ewmh_desktop_layout_starting_corner_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1657
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_desktop_layout";

   function xcb_ewmh_set_desktop_layout_checked
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      orientation : xcb_ewmh_desktop_layout_orientation_t;
      columns : bits_stdint_uintn_h.uint32_t;
      rows : bits_stdint_uintn_h.uint32_t;
      starting_corner : xcb_ewmh_desktop_layout_starting_corner_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1663
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_desktop_layout_checked";

  --*
  -- * @brief  Send GetProperty  request to  get  _NET_DESKTOP_LAYOUT root
  -- *        window property
  -- *
  -- * @param ewmh The information relative to EWMH
  -- * @param screen_nbr The screen number
  -- * @return The _NET_DESKTOP_LAYOUT cookie of the GetProperty request
  --  

   function xcb_ewmh_get_desktop_layout_unchecked (ewmh : access xcb_ewmh_connection_t; screen_nbr : int) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1677
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_desktop_layout_unchecked";

  --*
  -- * @see xcb_ewmh_get_desktop_layout_unchecked
  --  

   function xcb_ewmh_get_desktop_layout (ewmh : access xcb_ewmh_connection_t; screen_nbr : int) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1683
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_desktop_layout";

   function xcb_ewmh_get_desktop_layout_from_reply (desktop_layouts : access xcb_ewmh_get_desktop_layout_reply_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1686
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_desktop_layout_from_reply";

   function xcb_ewmh_get_desktop_layout_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      desktop_layouts : access xcb_ewmh_get_desktop_layout_reply_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1689
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_desktop_layout_reply";

   function xcb_ewmh_set_showing_desktop
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      desktop : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1694
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_showing_desktop";

   function xcb_ewmh_set_showing_desktop_checked
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      desktop : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1698
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_showing_desktop_checked";

   function xcb_ewmh_get_showing_desktop_unchecked (ewmh : access xcb_ewmh_connection_t; screen_nbr : int) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1702
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_showing_desktop_unchecked";

   function xcb_ewmh_get_showing_desktop (ewmh : access xcb_ewmh_connection_t; screen_nbr : int) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1705
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_showing_desktop";

   function xcb_ewmh_get_showing_desktop_from_reply (desktop : access bits_stdint_uintn_h.uint32_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1709
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_showing_desktop_from_reply";

   function xcb_ewmh_get_showing_desktop_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      desktop : access bits_stdint_uintn_h.uint32_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1716
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_showing_desktop_reply";

   function xcb_ewmh_request_change_showing_desktop
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      enter : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1725
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_request_change_showing_desktop";

   function xcb_ewmh_request_close_window
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      window_to_close : xproto.xcb_window_t;
      timestamp : xproto.xcb_timestamp_t;
      source_indication : xcb_ewmh_client_source_type_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1735
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_request_close_window";

   function xcb_ewmh_request_moveresize_window
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      moveresize_window : xproto.xcb_window_t;
      gravity : xproto.xcb_gravity_t;
      source_indication : xcb_ewmh_client_source_type_t;
      flags : xcb_ewmh_moveresize_window_opt_flags_t;
      x : bits_stdint_uintn_h.uint32_t;
      y : bits_stdint_uintn_h.uint32_t;
      width : bits_stdint_uintn_h.uint32_t;
      height : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1741
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_request_moveresize_window";

   function xcb_ewmh_request_wm_moveresize
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      moveresize_window : xproto.xcb_window_t;
      x_root : bits_stdint_uintn_h.uint32_t;
      y_root : bits_stdint_uintn_h.uint32_t;
      direction : xcb_ewmh_moveresize_direction_t;
      button : xproto.xcb_button_index_t;
      source_indication : xcb_ewmh_client_source_type_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1750
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_request_wm_moveresize";

   function xcb_ewmh_request_restack_window
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      window_to_restack : xproto.xcb_window_t;
      sibling_window : xproto.xcb_window_t;
      detail : xproto.xcb_stack_mode_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1758
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_request_restack_window";

   function xcb_ewmh_request_frame_extents
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      client_window : xproto.xcb_window_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1765
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_request_frame_extents";

   function xcb_ewmh_set_wm_name
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      strings_len : bits_stdint_uintn_h.uint32_t;
      strings : Interfaces.C.Strings.chars_ptr) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1774
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_name";

   function xcb_ewmh_set_wm_name_checked
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      strings_len : bits_stdint_uintn_h.uint32_t;
      strings : Interfaces.C.Strings.chars_ptr) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1779
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_name_checked";

   function xcb_ewmh_get_wm_name_unchecked (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1784
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_name_unchecked";

   function xcb_ewmh_get_wm_name (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1787
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_name";

   function xcb_ewmh_get_wm_name_from_reply
     (ewmh : access xcb_ewmh_connection_t;
      data : access xcb_ewmh_get_utf8_strings_reply_t;
      r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1791
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_name_from_reply";

   function xcb_ewmh_get_wm_name_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      data : access xcb_ewmh_get_utf8_strings_reply_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1799
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_name_reply";

   function xcb_ewmh_set_wm_visible_name
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      strings_len : bits_stdint_uintn_h.uint32_t;
      strings : Interfaces.C.Strings.chars_ptr) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1807
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_visible_name";

   function xcb_ewmh_set_wm_visible_name_checked
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      strings_len : bits_stdint_uintn_h.uint32_t;
      strings : Interfaces.C.Strings.chars_ptr) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1812
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_visible_name_checked";

   function xcb_ewmh_get_wm_visible_name_unchecked (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1817
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_visible_name_unchecked";

   function xcb_ewmh_get_wm_visible_name (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1820
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_visible_name";

   function xcb_ewmh_get_wm_visible_name_from_reply
     (ewmh : access xcb_ewmh_connection_t;
      data : access xcb_ewmh_get_utf8_strings_reply_t;
      r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1824
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_visible_name_from_reply";

   function xcb_ewmh_get_wm_visible_name_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      data : access xcb_ewmh_get_utf8_strings_reply_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1832
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_visible_name_reply";

   function xcb_ewmh_set_wm_icon_name
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      strings_len : bits_stdint_uintn_h.uint32_t;
      strings : Interfaces.C.Strings.chars_ptr) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1840
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_icon_name";

   function xcb_ewmh_set_wm_icon_name_checked
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      strings_len : bits_stdint_uintn_h.uint32_t;
      strings : Interfaces.C.Strings.chars_ptr) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1845
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_icon_name_checked";

   function xcb_ewmh_get_wm_icon_name_unchecked (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1850
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_icon_name_unchecked";

   function xcb_ewmh_get_wm_icon_name (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1853
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_icon_name";

   function xcb_ewmh_get_wm_icon_name_from_reply
     (ewmh : access xcb_ewmh_connection_t;
      data : access xcb_ewmh_get_utf8_strings_reply_t;
      r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1857
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_icon_name_from_reply";

   function xcb_ewmh_get_wm_icon_name_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      data : access xcb_ewmh_get_utf8_strings_reply_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1865
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_icon_name_reply";

   function xcb_ewmh_set_wm_visible_icon_name
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      strings_len : bits_stdint_uintn_h.uint32_t;
      strings : Interfaces.C.Strings.chars_ptr) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1873
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_visible_icon_name";

   function xcb_ewmh_set_wm_visible_icon_name_checked
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      strings_len : bits_stdint_uintn_h.uint32_t;
      strings : Interfaces.C.Strings.chars_ptr) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1878
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_visible_icon_name_checked";

   function xcb_ewmh_get_wm_visible_icon_name_unchecked (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1883
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_visible_icon_name_unchecked";

   function xcb_ewmh_get_wm_visible_icon_name (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1886
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_visible_icon_name";

   function xcb_ewmh_get_wm_visible_icon_name_from_reply
     (ewmh : access xcb_ewmh_connection_t;
      data : access xcb_ewmh_get_utf8_strings_reply_t;
      r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1890
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_visible_icon_name_from_reply";

   function xcb_ewmh_get_wm_visible_icon_name_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      data : access xcb_ewmh_get_utf8_strings_reply_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1898
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_visible_icon_name_reply";

   function xcb_ewmh_set_wm_desktop
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      desktop : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1906
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_desktop";

   function xcb_ewmh_set_wm_desktop_checked
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      desktop : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1910
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_desktop_checked";

   function xcb_ewmh_get_wm_desktop_unchecked (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1915
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_desktop_unchecked";

   function xcb_ewmh_get_wm_desktop (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1918
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_desktop";

   function xcb_ewmh_get_wm_desktop_from_reply (desktop : access bits_stdint_uintn_h.uint32_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1922
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_desktop_from_reply";

   function xcb_ewmh_get_wm_desktop_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      desktop : access bits_stdint_uintn_h.uint32_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1929
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_desktop_reply";

   function xcb_ewmh_request_change_wm_desktop
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      client_window : xproto.xcb_window_t;
      new_desktop : bits_stdint_uintn_h.uint32_t;
      source_indication : xcb_ewmh_client_source_type_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1937
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_request_change_wm_desktop";

   function xcb_ewmh_set_wm_window_type
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      list_len : bits_stdint_uintn_h.uint32_t;
      list : access xproto.xcb_atom_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1943
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_window_type";

   function xcb_ewmh_set_wm_window_type_checked
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      list_len : bits_stdint_uintn_h.uint32_t;
      list : access xproto.xcb_atom_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1948
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_window_type_checked";

   function xcb_ewmh_get_wm_window_type_unchecked (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1953
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_window_type_unchecked";

   function xcb_ewmh_get_wm_window_type (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1956
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_window_type";

   function xcb_ewmh_get_wm_window_type_from_reply (wtypes : access xcb_ewmh_get_atoms_reply_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1959
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_window_type_from_reply";

   function xcb_ewmh_get_wm_window_type_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      name : access xcb_ewmh_get_atoms_reply_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1962
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_window_type_reply";

   function xcb_ewmh_set_wm_state
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      list_len : bits_stdint_uintn_h.uint32_t;
      list : access xproto.xcb_atom_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1967
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_state";

   function xcb_ewmh_set_wm_state_checked
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      list_len : bits_stdint_uintn_h.uint32_t;
      list : access xproto.xcb_atom_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1972
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_state_checked";

   function xcb_ewmh_get_wm_state_unchecked (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1977
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_state_unchecked";

   function xcb_ewmh_get_wm_state (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1980
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_state";

   function xcb_ewmh_get_wm_state_from_reply (wtypes : access xcb_ewmh_get_atoms_reply_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1983
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_state_from_reply";

   function xcb_ewmh_get_wm_state_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      name : access xcb_ewmh_get_atoms_reply_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:1986
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_state_reply";

   function xcb_ewmh_request_change_wm_state
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      client_window : xproto.xcb_window_t;
      action : xcb_ewmh_wm_state_action_t;
      first_property : xproto.xcb_atom_t;
      second_property : xproto.xcb_atom_t;
      source_indication : xcb_ewmh_client_source_type_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1991
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_request_change_wm_state";

   function xcb_ewmh_set_wm_allowed_actions
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      list_len : bits_stdint_uintn_h.uint32_t;
      list : access xproto.xcb_atom_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:1999
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_allowed_actions";

   function xcb_ewmh_set_wm_allowed_actions_checked
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      list_len : bits_stdint_uintn_h.uint32_t;
      list : access xproto.xcb_atom_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2004
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_allowed_actions_checked";

   function xcb_ewmh_get_wm_allowed_actions_unchecked (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2009
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_allowed_actions_unchecked";

   function xcb_ewmh_get_wm_allowed_actions (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2012
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_allowed_actions";

   function xcb_ewmh_get_wm_allowed_actions_from_reply (wtypes : access xcb_ewmh_get_atoms_reply_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:2015
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_allowed_actions_from_reply";

   function xcb_ewmh_get_wm_allowed_actions_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      name : access xcb_ewmh_get_atoms_reply_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:2018
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_allowed_actions_reply";

   function xcb_ewmh_set_wm_strut
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      left : bits_stdint_uintn_h.uint32_t;
      right : bits_stdint_uintn_h.uint32_t;
      top : bits_stdint_uintn_h.uint32_t;
      bottom : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2023
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_strut";

   function xcb_ewmh_set_wm_strut_checked
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      left : bits_stdint_uintn_h.uint32_t;
      right : bits_stdint_uintn_h.uint32_t;
      top : bits_stdint_uintn_h.uint32_t;
      bottom : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2028
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_strut_checked";

   function xcb_ewmh_get_wm_strut_unchecked (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2033
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_strut_unchecked";

   function xcb_ewmh_get_wm_strut (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2036
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_strut";

   function xcb_ewmh_get_wm_strut_from_reply (struts : access xcb_ewmh_get_extents_reply_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:2039
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_strut_from_reply";

   function xcb_ewmh_get_wm_strut_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      struts : access xcb_ewmh_get_extents_reply_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:2042
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_strut_reply";

   function xcb_ewmh_set_wm_strut_partial
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      wm_strut : xcb_ewmh_wm_strut_partial_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2047
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_strut_partial";

   function xcb_ewmh_set_wm_strut_partial_checked
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      wm_strut : xcb_ewmh_wm_strut_partial_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2051
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_strut_partial_checked";

   function xcb_ewmh_get_wm_strut_partial_unchecked (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2055
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_strut_partial_unchecked";

   function xcb_ewmh_get_wm_strut_partial (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2058
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_strut_partial";

   function xcb_ewmh_get_wm_strut_partial_from_reply (struts : access xcb_ewmh_wm_strut_partial_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:2061
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_strut_partial_from_reply";

   function xcb_ewmh_get_wm_strut_partial_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      struts : access xcb_ewmh_wm_strut_partial_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:2064
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_strut_partial_reply";

   function xcb_ewmh_set_wm_icon_geometry
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      left : bits_stdint_uintn_h.uint32_t;
      right : bits_stdint_uintn_h.uint32_t;
      top : bits_stdint_uintn_h.uint32_t;
      bottom : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2069
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_icon_geometry";

   function xcb_ewmh_set_wm_icon_geometry_checked
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      left : bits_stdint_uintn_h.uint32_t;
      right : bits_stdint_uintn_h.uint32_t;
      top : bits_stdint_uintn_h.uint32_t;
      bottom : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2074
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_icon_geometry_checked";

   function xcb_ewmh_get_wm_icon_geometry_unchecked (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2079
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_icon_geometry_unchecked";

   function xcb_ewmh_get_wm_icon_geometry (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2082
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_icon_geometry";

   function xcb_ewmh_get_wm_icon_geometry_from_reply (icons : access xcb_ewmh_geometry_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:2085
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_icon_geometry_from_reply";

   function xcb_ewmh_get_wm_icon_geometry_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      icons : access xcb_ewmh_geometry_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:2088
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_icon_geometry_reply";

  --*
  -- * @brief Send ChangeProperty request to set _NET_WM_ICON window
  -- *        property. The given data is considered to be already
  -- *        prepared, namely that it is an array such as: WIDTH1,
  -- *        HEIGHT1, IMG1, WIDTH2, HEIGHT2, IMG2.
  -- *
  -- *        If you only want to add or append a single icon, you may
  -- *        consider using xcb_ewmh_append_wm_icon_checked which is far
  -- *        easier to use.
  -- *
  -- * _NET_WM_ICON CARDINAL[][2+n]/32
  -- *
  -- * @param ewmh The information relative to EWMH
  -- * @param mode ChangeProperty mode (xcb_prop_mode_t)
  -- * @param window The window to set the property on
  -- * @param data_len Length of the data
  -- * @param data The data
  --  

   function xcb_ewmh_set_wm_icon_checked
     (ewmh : access xcb_ewmh_connection_t;
      mode : bits_stdint_uintn_h.uint8_t;
      window : xproto.xcb_window_t;
      data_len : bits_stdint_uintn_h.uint32_t;
      data : access bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2112
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_icon_checked";

  --*
  -- * @see xcb_ewmh_set_wm_icon_checked
  --  

   function xcb_ewmh_set_wm_icon
     (ewmh : access xcb_ewmh_connection_t;
      mode : bits_stdint_uintn_h.uint8_t;
      window : xproto.xcb_window_t;
      data_len : bits_stdint_uintn_h.uint32_t;
      data : access bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2126
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_icon";

   function xcb_ewmh_append_wm_icon_checked
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      width : bits_stdint_uintn_h.uint32_t;
      height : bits_stdint_uintn_h.uint32_t;
      img_len : bits_stdint_uintn_h.uint32_t;
      img : access bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2136
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_append_wm_icon_checked";

   function xcb_ewmh_append_wm_icon
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      width : bits_stdint_uintn_h.uint32_t;
      height : bits_stdint_uintn_h.uint32_t;
      img_len : bits_stdint_uintn_h.uint32_t;
      img : access bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2141
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_append_wm_icon";

   function xcb_ewmh_get_wm_icon_unchecked (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2146
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_icon_unchecked";

   function xcb_ewmh_get_wm_icon (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2149
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_icon";

   function xcb_ewmh_get_wm_icon_from_reply (wm_icon : access xcb_ewmh_get_wm_icon_reply_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:2152
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_icon_from_reply";

   function xcb_ewmh_get_wm_icon_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      wm_icon : access xcb_ewmh_get_wm_icon_reply_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:2155
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_icon_reply";

   function xcb_ewmh_get_wm_icon_iterator (wm_icon : access constant xcb_ewmh_get_wm_icon_reply_t) return xcb_ewmh_wm_icon_iterator_t  -- /usr/include/xcb/xcb_ewmh.h:2160
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_icon_iterator";

   function xcb_ewmh_get_wm_icon_length (wm_icon : access constant xcb_ewmh_get_wm_icon_reply_t) return unsigned  -- /usr/include/xcb/xcb_ewmh.h:2162
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_icon_length";

   procedure xcb_ewmh_get_wm_icon_next (iterator : access xcb_ewmh_wm_icon_iterator_t)  -- /usr/include/xcb/xcb_ewmh.h:2164
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_icon_next";

   procedure xcb_ewmh_get_wm_icon_reply_wipe (wm_icon : access xcb_ewmh_get_wm_icon_reply_t)  -- /usr/include/xcb/xcb_ewmh.h:2166
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_icon_reply_wipe";

   function xcb_ewmh_set_wm_pid
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      pid : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2168
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_pid";

   function xcb_ewmh_set_wm_pid_checked
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      pid : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2172
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_pid_checked";

   function xcb_ewmh_get_wm_pid_unchecked (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2176
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_pid_unchecked";

   function xcb_ewmh_get_wm_pid (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2179
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_pid";

   function xcb_ewmh_get_wm_pid_from_reply (pid : access bits_stdint_uintn_h.uint32_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:2183
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_pid_from_reply";

   function xcb_ewmh_get_wm_pid_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      pid : access bits_stdint_uintn_h.uint32_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:2190
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_pid_reply";

   function xcb_ewmh_set_wm_handled_icons
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      handled_icons : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2198
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_handled_icons";

   function xcb_ewmh_set_wm_handled_icons_checked
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      handled_icons : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2202
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_handled_icons_checked";

   function xcb_ewmh_get_wm_handled_icons_unchecked (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2206
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_handled_icons_unchecked";

   function xcb_ewmh_get_wm_handled_icons (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2209
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_handled_icons";

   function xcb_ewmh_get_wm_handled_icons_from_reply (handled_icons : access bits_stdint_uintn_h.uint32_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:2213
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_handled_icons_from_reply";

   function xcb_ewmh_get_wm_handled_icons_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      handled_icons : access bits_stdint_uintn_h.uint32_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:2220
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_handled_icons_reply";

   function xcb_ewmh_set_wm_user_time
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      xtime : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2228
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_user_time";

   function xcb_ewmh_set_wm_user_time_checked
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      pid : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2232
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_user_time_checked";

   function xcb_ewmh_get_wm_user_time_unchecked (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2236
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_user_time_unchecked";

   function xcb_ewmh_get_wm_user_time (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2239
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_user_time";

   function xcb_ewmh_get_wm_user_time_from_reply (xtime : access bits_stdint_uintn_h.uint32_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:2243
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_user_time_from_reply";

   function xcb_ewmh_get_wm_user_time_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      xtime : access bits_stdint_uintn_h.uint32_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:2250
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_user_time_reply";

   function xcb_ewmh_set_wm_user_time_window
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      xtime : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2258
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_user_time_window";

   function xcb_ewmh_set_wm_user_time_window_checked
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      pid : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2262
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_user_time_window_checked";

   function xcb_ewmh_get_wm_user_time_window_unchecked (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2266
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_user_time_window_unchecked";

   function xcb_ewmh_get_wm_user_time_window (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2269
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_user_time_window";

   function xcb_ewmh_get_wm_user_time_window_from_reply (xtime : access bits_stdint_uintn_h.uint32_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:2273
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_user_time_window_from_reply";

   function xcb_ewmh_get_wm_user_time_window_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      xtime : access bits_stdint_uintn_h.uint32_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:2280
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_user_time_window_reply";

   function xcb_ewmh_set_frame_extents
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      left : bits_stdint_uintn_h.uint32_t;
      right : bits_stdint_uintn_h.uint32_t;
      top : bits_stdint_uintn_h.uint32_t;
      bottom : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2288
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_frame_extents";

   function xcb_ewmh_set_frame_extents_checked
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      left : bits_stdint_uintn_h.uint32_t;
      right : bits_stdint_uintn_h.uint32_t;
      top : bits_stdint_uintn_h.uint32_t;
      bottom : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2293
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_frame_extents_checked";

   function xcb_ewmh_get_frame_extents_unchecked (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2298
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_frame_extents_unchecked";

   function xcb_ewmh_get_frame_extents (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2301
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_frame_extents";

   function xcb_ewmh_get_frame_extents_from_reply (frame_extents : access xcb_ewmh_get_extents_reply_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:2304
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_frame_extents_from_reply";

   function xcb_ewmh_get_frame_extents_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      frame_extents : access xcb_ewmh_get_extents_reply_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:2307
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_frame_extents_reply";

   function xcb_ewmh_send_wm_ping
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      timestamp : xproto.xcb_timestamp_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2312
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_send_wm_ping";

   function xcb_ewmh_set_wm_sync_request_counter
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      wm_sync_request_counter_atom : xproto.xcb_atom_t;
      low : bits_stdint_uintn_h.uint32_t;
      high : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2316
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_sync_request_counter";

   function xcb_ewmh_set_wm_sync_request_counter_checked
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      wm_sync_request_counter_atom : xproto.xcb_atom_t;
      low : bits_stdint_uintn_h.uint32_t;
      high : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2321
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_sync_request_counter_checked";

   function xcb_ewmh_get_wm_sync_request_counter_unchecked (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2326
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_sync_request_counter_unchecked";

   function xcb_ewmh_get_wm_sync_request_counter (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2329
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_sync_request_counter";

   function xcb_ewmh_get_wm_sync_request_counter_from_reply (counter : access bits_stdint_uintn_h.uint64_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:2332
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_sync_request_counter_from_reply";

   function xcb_ewmh_get_wm_sync_request_counter_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      counter : access bits_stdint_uintn_h.uint64_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:2335
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_sync_request_counter_reply";

   function xcb_ewmh_send_wm_sync_request
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      wm_protocols_atom : xproto.xcb_atom_t;
      wm_sync_request_atom : xproto.xcb_atom_t;
      timestamp : xproto.xcb_timestamp_t;
      counter : bits_stdint_uintn_h.uint64_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2340
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_send_wm_sync_request";

   function xcb_ewmh_set_wm_fullscreen_monitors
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      top : bits_stdint_uintn_h.uint32_t;
      bottom : bits_stdint_uintn_h.uint32_t;
      left : bits_stdint_uintn_h.uint32_t;
      right : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2347
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_fullscreen_monitors";

   function xcb_ewmh_set_wm_fullscreen_monitors_checked
     (ewmh : access xcb_ewmh_connection_t;
      window : xproto.xcb_window_t;
      top : bits_stdint_uintn_h.uint32_t;
      bottom : bits_stdint_uintn_h.uint32_t;
      left : bits_stdint_uintn_h.uint32_t;
      right : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2352
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_fullscreen_monitors_checked";

   function xcb_ewmh_get_wm_fullscreen_monitors_unchecked (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2357
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_fullscreen_monitors_unchecked";

   function xcb_ewmh_get_wm_fullscreen_monitors (ewmh : access xcb_ewmh_connection_t; window : xproto.xcb_window_t) return xproto.xcb_get_property_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2360
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_fullscreen_monitors";

   function xcb_ewmh_get_wm_fullscreen_monitors_from_reply (monitors : access xcb_ewmh_get_wm_fullscreen_monitors_reply_t; r : access xproto.xcb_get_property_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:2363
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_fullscreen_monitors_from_reply";

   function xcb_ewmh_get_wm_fullscreen_monitors_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_property_cookie_t;
      monitors : access xcb_ewmh_get_wm_fullscreen_monitors_reply_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:2366
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_fullscreen_monitors_reply";

   function xcb_ewmh_request_change_wm_fullscreen_monitors
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      window : xproto.xcb_window_t;
      top : bits_stdint_uintn_h.uint32_t;
      bottom : bits_stdint_uintn_h.uint32_t;
      left : bits_stdint_uintn_h.uint32_t;
      right : bits_stdint_uintn_h.uint32_t;
      source_indication : xcb_ewmh_client_source_type_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2372
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_request_change_wm_fullscreen_monitors";

  --*
  -- * @brief Set _NET_WM_CM_Sn ownership to the given window
  -- *
  -- * For  each  screen they  manage,  compositing  manager MUST  acquire
  -- * ownership of a selection named _NET_WM_CM_Sn, where n is the screen
  -- * number.
  -- *
  -- * @param ewmh The information relative to EWMH
  -- * @param screen_nbr The screen number
  -- * @param owner The new owner of _NET_WM_CM_Sn selection
  -- * @param timestamp The client's last user activity timestamp
  -- * @param selection_data1 Optional data described by ICCCM
  -- * @param selection_data2 Optional data described by ICCCM
  --  

   function xcb_ewmh_set_wm_cm_owner
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      owner : xproto.xcb_window_t;
      timestamp : xproto.xcb_timestamp_t;
      selection_data1 : bits_stdint_uintn_h.uint32_t;
      selection_data2 : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2393
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_cm_owner";

  --*
  -- * @see xcb_ewmh_set_wm_cm_owner
  --  

   function xcb_ewmh_set_wm_cm_owner_checked
     (ewmh : access xcb_ewmh_connection_t;
      screen_nbr : int;
      owner : xproto.xcb_window_t;
      timestamp : xproto.xcb_timestamp_t;
      selection_data1 : bits_stdint_uintn_h.uint32_t;
      selection_data2 : bits_stdint_uintn_h.uint32_t) return xcb.xcb_void_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2403
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_set_wm_cm_owner_checked";

  --*
  -- * @brief   Send  GetSelectOwner   request   to  get   the  owner   of
  -- *        _NET_WM_CM_Sn root window property
  -- *
  -- * @param ewmh The information relative to EWMH
  -- * @param screen_nbr The screen number
  -- * @return The _NET_WM_CM_Sn cookie of the GetSelectionOwner request
  --  

   function xcb_ewmh_get_wm_cm_owner_unchecked (ewmh : access xcb_ewmh_connection_t; screen_nbr : int) return xproto.xcb_get_selection_owner_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2418
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_cm_owner_unchecked";

  --*
  -- * @see xcb_ewmh_get_wm_cm_owner_unchecked
  --  

   function xcb_ewmh_get_wm_cm_owner (ewmh : access xcb_ewmh_connection_t; screen_nbr : int) return xproto.xcb_get_selection_owner_cookie_t  -- /usr/include/xcb/xcb_ewmh.h:2424
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_cm_owner";

   function xcb_ewmh_get_wm_cm_owner_from_reply (owner : access xproto.xcb_window_t; r : access xproto.xcb_get_selection_owner_reply_t) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:2427
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_cm_owner_from_reply";

  --*
  -- * @brief Get reply from the GetProperty _NET_CLIENT_LIST cookie
  -- *
  -- * The  parameter  e  supplied  to  this  function  must  be  NULL  if
  -- * xcb_get_window_client_list_unchecked()  is   used.   Otherwise,  it
  -- * stores the error if any.
  -- *
  -- * @param ewmh The information relative to EWMH.
  -- * @param cookie The _NET_WM_CM_Sn GetSelectionOwner request cookie.
  -- * @param owner The window ID which owns the selection or None.
  -- * @param The xcb_generic_error_t supplied.
  -- * @return Return 1 on success, 0 otherwise.
  --  

   function xcb_ewmh_get_wm_cm_owner_reply
     (ewmh : access xcb_ewmh_connection_t;
      cookie : xproto.xcb_get_selection_owner_cookie_t;
      owner : access xproto.xcb_window_t;
      e : System.Address) return bits_stdint_uintn_h.uint8_t  -- /usr/include/xcb/xcb_ewmh.h:2443
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_ewmh_get_wm_cm_owner_reply";

  --*
  -- * @}
  --  

end xcb_ewmh;
