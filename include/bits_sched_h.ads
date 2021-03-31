pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

package bits_sched_h is

   SCHED_OTHER : constant := 0;  --  /usr/include/bits/sched.h:28
   SCHED_FIFO : constant := 1;  --  /usr/include/bits/sched.h:29
   SCHED_RR : constant := 2;  --  /usr/include/bits/sched.h:30

   SCHED_BATCH : constant := 3;  --  /usr/include/bits/sched.h:32
   SCHED_ISO : constant := 4;  --  /usr/include/bits/sched.h:33
   SCHED_IDLE : constant := 5;  --  /usr/include/bits/sched.h:34
   SCHED_DEADLINE : constant := 6;  --  /usr/include/bits/sched.h:35

   SCHED_RESET_ON_FORK : constant := 16#40000000#;  --  /usr/include/bits/sched.h:37

   CSIGNAL : constant := 16#000000ff#;  --  /usr/include/bits/sched.h:42
   CLONE_VM : constant := 16#00000100#;  --  /usr/include/bits/sched.h:43
   CLONE_FS : constant := 16#00000200#;  --  /usr/include/bits/sched.h:44
   CLONE_FILES : constant := 16#00000400#;  --  /usr/include/bits/sched.h:45
   CLONE_SIGHAND : constant := 16#00000800#;  --  /usr/include/bits/sched.h:46
   CLONE_PIDFD : constant := 16#00001000#;  --  /usr/include/bits/sched.h:47

   CLONE_PTRACE : constant := 16#00002000#;  --  /usr/include/bits/sched.h:49
   CLONE_VFORK : constant := 16#00004000#;  --  /usr/include/bits/sched.h:50

   CLONE_PARENT : constant := 16#00008000#;  --  /usr/include/bits/sched.h:52

   CLONE_THREAD : constant := 16#00010000#;  --  /usr/include/bits/sched.h:54
   CLONE_NEWNS : constant := 16#00020000#;  --  /usr/include/bits/sched.h:55
   CLONE_SYSVSEM : constant := 16#00040000#;  --  /usr/include/bits/sched.h:56
   CLONE_SETTLS : constant := 16#00080000#;  --  /usr/include/bits/sched.h:57
   CLONE_PARENT_SETTID : constant := 16#00100000#;  --  /usr/include/bits/sched.h:58

   CLONE_CHILD_CLEARTID : constant := 16#00200000#;  --  /usr/include/bits/sched.h:60

   CLONE_DETACHED : constant := 16#00400000#;  --  /usr/include/bits/sched.h:62
   CLONE_UNTRACED : constant := 16#00800000#;  --  /usr/include/bits/sched.h:63

   CLONE_CHILD_SETTID : constant := 16#01000000#;  --  /usr/include/bits/sched.h:65

   CLONE_NEWCGROUP : constant := 16#02000000#;  --  /usr/include/bits/sched.h:67
   CLONE_NEWUTS : constant := 16#04000000#;  --  /usr/include/bits/sched.h:68
   CLONE_NEWIPC : constant := 16#08000000#;  --  /usr/include/bits/sched.h:69
   CLONE_NEWUSER : constant := 16#10000000#;  --  /usr/include/bits/sched.h:70
   CLONE_NEWPID : constant := 16#20000000#;  --  /usr/include/bits/sched.h:71
   CLONE_NEWNET : constant := 16#40000000#;  --  /usr/include/bits/sched.h:72
   CLONE_IO : constant := 16#80000000#;  --  /usr/include/bits/sched.h:73

  -- Definitions of constants and data structure for POSIX 1003.1b-1993
  --   scheduling interface.
  --   Copyright (C) 1996-2021 Free Software Foundation, Inc.
  --   This file is part of the GNU C Library.
  --   The GNU C Library is free software; you can redistribute it and/or
  --   modify it under the terms of the GNU Lesser General Public
  --   License as published by the Free Software Foundation; either
  --   version 2.1 of the License, or (at your option) any later version.
  --   The GNU C Library is distributed in the hope that it will be useful,
  --   but WITHOUT ANY WARRANTY; without even the implied warranty of
  --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  --   Lesser General Public License for more details.
  --   You should have received a copy of the GNU Lesser General Public
  --   License along with the GNU C Library; if not, see
  --   <https://www.gnu.org/licenses/>.   

  -- Scheduling algorithms.   
  -- Cloning flags.   
  -- Clone current process.   
   function clone
     (uu_fn : access function (arg1 : System.Address) return int;
      uu_child_stack : System.Address;
      uu_flags : int;
      uu_arg : System.Address  -- , ...
      ) return int  -- /usr/include/bits/sched.h:82
   with Import => True, 
        Convention => C, 
        External_Name => "clone";

  -- Unshare the specified resources.   
   function unshare (uu_flags : int) return int  -- /usr/include/bits/sched.h:86
   with Import => True, 
        Convention => C, 
        External_Name => "unshare";

  -- Get index of currently used CPU.   
   function sched_getcpu return int  -- /usr/include/bits/sched.h:89
   with Import => True, 
        Convention => C, 
        External_Name => "sched_getcpu";

  -- Get currently used CPU and NUMA node.   
   function getcpu (arg1 : access unsigned; arg2 : access unsigned) return int  -- /usr/include/bits/sched.h:92
   with Import => True, 
        Convention => C, 
        External_Name => "getcpu";

  -- Switch process to namespace of type NSTYPE indicated by FD.   
   function setns (uu_fd : int; uu_nstype : int) return int  -- /usr/include/bits/sched.h:95
   with Import => True, 
        Convention => C, 
        External_Name => "setns";

end bits_sched_h;
