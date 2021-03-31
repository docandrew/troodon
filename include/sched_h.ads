pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with bits_types_h;
limited with bits_types_struct_sched_param_h;
limited with bits_types_struct_timespec_h;
with stddef_h;
limited with bits_cpu_set_h;

package sched_h is

   --  unsupported macro: sched_priority sched_priority
   --  unsupported macro: CPU_SETSIZE __CPU_SETSIZE
   --  arg-macro: procedure CPU_SET (cpu, cpusetp)
   --    __CPU_SET_S (cpu, sizeof (cpu_set_t), cpusetp)
   --  arg-macro: procedure CPU_CLR (cpu, cpusetp)
   --    __CPU_CLR_S (cpu, sizeof (cpu_set_t), cpusetp)
   --  arg-macro: procedure CPU_ISSET (cpu, cpusetp)
   --    __CPU_ISSET_S (cpu, sizeof (cpu_set_t), cpusetp)
   --  arg-macro: procedure CPU_ZERO (cpusetp)
   --    __CPU_ZERO_S (sizeof (cpu_set_t), cpusetp)
   --  arg-macro: procedure CPU_COUNT (cpusetp)
   --    __CPU_COUNT_S (sizeof (cpu_set_t), cpusetp)
   --  arg-macro: procedure CPU_SET_S (cpu, setsize, cpusetp)
   --    __CPU_SET_S (cpu, setsize, cpusetp)
   --  arg-macro: procedure CPU_CLR_S (cpu, setsize, cpusetp)
   --    __CPU_CLR_S (cpu, setsize, cpusetp)
   --  arg-macro: procedure CPU_ISSET_S (cpu, setsize, cpusetp)
   --    __CPU_ISSET_S (cpu, setsize, cpusetp)
   --  arg-macro: procedure CPU_ZERO_S (setsize, cpusetp)
   --    __CPU_ZERO_S (setsize, cpusetp)
   --  arg-macro: procedure CPU_COUNT_S (setsize, cpusetp)
   --    __CPU_COUNT_S (setsize, cpusetp)
   --  arg-macro: procedure CPU_EQUAL (cpusetp1, cpusetp2)
   --    __CPU_EQUAL_S (sizeof (cpu_set_t), cpusetp1, cpusetp2)
   --  arg-macro: procedure CPU_EQUAL_S (setsize, cpusetp1, cpusetp2)
   --    __CPU_EQUAL_S (setsize, cpusetp1, cpusetp2)
   --  arg-macro: procedure CPU_AND (destset, srcset1, srcset2)
   --    __CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2, and)
   --  arg-macro: procedure CPU_OR (destset, srcset1, srcset2)
   --    __CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2, or)
   --  arg-macro: procedure CPU_XOR (destset, srcset1, srcset2)
   --    __CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2, xor)
   --  arg-macro: procedure CPU_AND_S (setsize, destset, srcset1, srcset2)
   --    __CPU_OP_S (setsize, destset, srcset1, srcset2, and)
   --  arg-macro: procedure CPU_OR_S (setsize, destset, srcset1, srcset2)
   --    __CPU_OP_S (setsize, destset, srcset1, srcset2, or)
   --  arg-macro: procedure CPU_XOR_S (setsize, destset, srcset1, srcset2)
   --    __CPU_OP_S (setsize, destset, srcset1, srcset2, xor)
   --  arg-macro: procedure CPU_ALLOC_SIZE (count)
   --    __CPU_ALLOC_SIZE (count)
   --  arg-macro: procedure CPU_ALLOC (count)
   --    __CPU_ALLOC (count)
   --  arg-macro: procedure CPU_FREE (cpuset)
   --    __CPU_FREE (cpuset)
  -- Definitions for POSIX 1003.1b-1993 (aka POSIX.4) scheduling interface.
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

  -- Get type definitions.   
  -- Get system specific constant and data structure definitions.   
  -- Backward compatibility.   
  -- Set scheduling parameters for a process.   
   function sched_setparam (uu_pid : bits_types_h.uu_pid_t; uu_param : access constant bits_types_struct_sched_param_h.sched_param) return int  -- /usr/include/sched.h:54
   with Import => True, 
        Convention => C, 
        External_Name => "sched_setparam";

  -- Retrieve scheduling parameters for a particular process.   
   function sched_getparam (uu_pid : bits_types_h.uu_pid_t; uu_param : access bits_types_struct_sched_param_h.sched_param) return int  -- /usr/include/sched.h:58
   with Import => True, 
        Convention => C, 
        External_Name => "sched_getparam";

  -- Set scheduling algorithm and/or parameters for a process.   
   function sched_setscheduler
     (uu_pid : bits_types_h.uu_pid_t;
      uu_policy : int;
      uu_param : access constant bits_types_struct_sched_param_h.sched_param) return int  -- /usr/include/sched.h:61
   with Import => True, 
        Convention => C, 
        External_Name => "sched_setscheduler";

  -- Retrieve scheduling algorithm for a particular purpose.   
   function sched_getscheduler (uu_pid : bits_types_h.uu_pid_t) return int  -- /usr/include/sched.h:65
   with Import => True, 
        Convention => C, 
        External_Name => "sched_getscheduler";

  -- Yield the processor.   
   function sched_yield return int  -- /usr/include/sched.h:68
   with Import => True, 
        Convention => C, 
        External_Name => "sched_yield";

  -- Get maximum priority value for a scheduler.   
   function sched_get_priority_max (uu_algorithm : int) return int  -- /usr/include/sched.h:71
   with Import => True, 
        Convention => C, 
        External_Name => "sched_get_priority_max";

  -- Get minimum priority value for a scheduler.   
   function sched_get_priority_min (uu_algorithm : int) return int  -- /usr/include/sched.h:74
   with Import => True, 
        Convention => C, 
        External_Name => "sched_get_priority_min";

  -- Get the SCHED_RR interval for the named process.   
   function sched_rr_get_interval (uu_pid : bits_types_h.uu_pid_t; uu_t : access bits_types_struct_timespec_h.timespec) return int  -- /usr/include/sched.h:77
   with Import => True, 
        Convention => C, 
        External_Name => "sched_rr_get_interval";

  -- Access macros for `cpu_set'.   
  -- Set the CPU affinity for a task  
   function sched_setaffinity
     (uu_pid : bits_types_h.uu_pid_t;
      uu_cpusetsize : stddef_h.size_t;
      uu_cpuset : access constant bits_cpu_set_h.cpu_set_t) return int  -- /usr/include/sched.h:121
   with Import => True, 
        Convention => C, 
        External_Name => "sched_setaffinity";

  -- Get the CPU affinity for a task  
   function sched_getaffinity
     (uu_pid : bits_types_h.uu_pid_t;
      uu_cpusetsize : stddef_h.size_t;
      uu_cpuset : access bits_cpu_set_h.cpu_set_t) return int  -- /usr/include/sched.h:125
   with Import => True, 
        Convention => C, 
        External_Name => "sched_getaffinity";

end sched_h;
