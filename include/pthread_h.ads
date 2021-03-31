pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with bits_pthreadtypes_h;
limited with bits_types_struct_timespec_h;
with bits_types_clockid_t_h;
with stddef_h;
limited with bits_types_struct_sched_param_h;
limited with bits_cpu_set_h;
limited with bits_types_u_sigset_t_h;
with Interfaces.C.Strings;
with bits_setjmp_h;
with bits_types_h;

package pthread_h is

   --  unsupported macro: PTHREAD_CREATE_JOINABLE PTHREAD_CREATE_JOINABLE
   --  unsupported macro: PTHREAD_CREATE_DETACHED PTHREAD_CREATE_DETACHED
   --  unsupported macro: PTHREAD_MUTEX_INITIALIZER { { __PTHREAD_MUTEX_INITIALIZER (PTHREAD_MUTEX_TIMED_NP) } }
   --  unsupported macro: PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP { { __PTHREAD_MUTEX_INITIALIZER (PTHREAD_MUTEX_RECURSIVE_NP) } }
   --  unsupported macro: PTHREAD_ERRORCHECK_MUTEX_INITIALIZER_NP { { __PTHREAD_MUTEX_INITIALIZER (PTHREAD_MUTEX_ERRORCHECK_NP) } }
   --  unsupported macro: PTHREAD_ADAPTIVE_MUTEX_INITIALIZER_NP { { __PTHREAD_MUTEX_INITIALIZER (PTHREAD_MUTEX_ADAPTIVE_NP) } }
   --  unsupported macro: PTHREAD_RWLOCK_INITIALIZER { { __PTHREAD_RWLOCK_INITIALIZER (PTHREAD_RWLOCK_DEFAULT_NP) } }
   --  unsupported macro: PTHREAD_RWLOCK_WRITER_NONRECURSIVE_INITIALIZER_NP { { __PTHREAD_RWLOCK_INITIALIZER (PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP) } }
   --  unsupported macro: PTHREAD_INHERIT_SCHED PTHREAD_INHERIT_SCHED
   --  unsupported macro: PTHREAD_EXPLICIT_SCHED PTHREAD_EXPLICIT_SCHED
   --  unsupported macro: PTHREAD_SCOPE_SYSTEM PTHREAD_SCOPE_SYSTEM
   --  unsupported macro: PTHREAD_SCOPE_PROCESS PTHREAD_SCOPE_PROCESS
   --  unsupported macro: PTHREAD_PROCESS_PRIVATE PTHREAD_PROCESS_PRIVATE
   --  unsupported macro: PTHREAD_PROCESS_SHARED PTHREAD_PROCESS_SHARED
   --  unsupported macro: PTHREAD_COND_INITIALIZER { { {0}, {0}, {0, 0}, {0, 0}, 0, 0, {0, 0} } }
   --  unsupported macro: PTHREAD_CANCEL_ENABLE PTHREAD_CANCEL_ENABLE
   --  unsupported macro: PTHREAD_CANCEL_DISABLE PTHREAD_CANCEL_DISABLE
   --  unsupported macro: PTHREAD_CANCEL_DEFERRED PTHREAD_CANCEL_DEFERRED
   --  unsupported macro: PTHREAD_CANCEL_ASYNCHRONOUS PTHREAD_CANCEL_ASYNCHRONOUS
   --  unsupported macro: PTHREAD_CANCELED ((void *) -1)
   PTHREAD_ONCE_INIT : constant := 0;  --  /usr/include/pthread.h:184

   PTHREAD_BARRIER_SERIAL_THREAD : constant := -1;  --  /usr/include/pthread.h:191

   PTHREAD_ATTR_NO_SIGMASK_NP : constant := (-1);  --  /usr/include/pthread.h:402
   --  arg-macro: procedure pthread_cleanup_push (routine, arg)
   --    do { __pthread_cleanup_class __clframe (routine, arg)
   --  arg-macro: procedure pthread_cleanup_pop (execute)
   --    __clframe.__setdoit (execute); } while (0)
   --  arg-macro: procedure pthread_cleanup_push_defer_np (routine, arg)
   --    do { __pthread_cleanup_class __clframe (routine, arg); __clframe.__defer ()
   --  arg-macro: procedure pthread_cleanup_pop_restore_np (execute)
   --    __clframe.__restore (); __clframe.__setdoit (execute); } while (0)

  -- Copyright (C) 2002-2021 Free Software Foundation, Inc.
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

  -- Detach state.   
  -- Mutex types.   
  -- For compatibility.   
  -- Robust mutex or not flags.   
  -- Mutex protocols.   
  -- Read-write lock types.   
  -- Read-write lock initializers.   
  -- Scheduler inheritance.   
  -- Scope handling.   
  -- Process shared or private flag.   
  -- Conditional variable handling.   
  -- Cleanup buffers  
  -- Function to call.   
   type u_pthread_cleanup_buffer;
   type u_pthread_cleanup_buffer is record
      uu_routine : access procedure (arg1 : System.Address);  -- /usr/include/pthread.h:159
      uu_arg : System.Address;  -- /usr/include/pthread.h:160
      uu_canceltype : aliased int;  -- /usr/include/pthread.h:161
      uu_prev : access u_pthread_cleanup_buffer;  -- /usr/include/pthread.h:162
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/pthread.h:157

  -- Its argument.   
  -- Saved cancellation type.  
  -- Chaining of cleanup functions.   
  -- Cancellation  
  -- Single execution handling.   
  -- Value returned by 'pthread_barrier_wait' for one of the threads after
  --   the required number of threads have called this function.
  --   -1 is distinct from 0 and all errno constants  

  -- Create a new thread, starting with execution of START-ROUTINE
  --   getting passed ARG.  Creation attributed come from ATTR.  The new
  --   handle is stored in *NEWTHREAD.   

   function pthread_create
     (uu_newthread : access bits_pthreadtypes_h.pthread_t;
      uu_attr : access constant bits_pthreadtypes_h.pthread_attr_t;
      uu_start_routine : access function (arg1 : System.Address) return System.Address;
      uu_arg : System.Address) return int  -- /usr/include/pthread.h:200
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_create";

  -- Terminate calling thread.
  --   The registered cleanup handlers are called via exception handling
  --   so we cannot mark this function with __THROW. 

   procedure pthread_exit (uu_retval : System.Address)  -- /usr/include/pthread.h:209
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_exit";

  -- Make calling thread wait for termination of the thread TH.  The
  --   exit status of the thread is stored in *THREAD_RETURN, if THREAD_RETURN
  --   is not NULL.
  --   This function is a cancellation point and therefore not marked with
  --   __THROW.   

   function pthread_join (uu_th : bits_pthreadtypes_h.pthread_t; uu_thread_return : System.Address) return int  -- /usr/include/pthread.h:217
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_join";

  -- Check whether thread TH has terminated.  If yes return the status of
  --   the thread in *THREAD_RETURN, if THREAD_RETURN is not NULL.   

   function pthread_tryjoin_np (uu_th : bits_pthreadtypes_h.pthread_t; uu_thread_return : System.Address) return int  -- /usr/include/pthread.h:222
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_tryjoin_np";

  -- Make calling thread wait for termination of the thread TH, but only
  --   until TIMEOUT.  The exit status of the thread is stored in
  --   *THREAD_RETURN, if THREAD_RETURN is not NULL.
  --   This function is a cancellation point and therefore not marked with
  --   __THROW.   

   function pthread_timedjoin_np
     (uu_th : bits_pthreadtypes_h.pthread_t;
      uu_thread_return : System.Address;
      uu_abstime : access constant bits_types_struct_timespec_h.timespec) return int  -- /usr/include/pthread.h:230
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_timedjoin_np";

  -- Make calling thread wait for termination of the thread TH, but only
  --   until TIMEOUT measured against the clock specified by CLOCKID.  The
  --   exit status of the thread is stored in *THREAD_RETURN, if
  --   THREAD_RETURN is not NULL.
  --   This function is a cancellation point and therefore not marked with
  --   __THROW.   

   function pthread_clockjoin_np
     (uu_th : bits_pthreadtypes_h.pthread_t;
      uu_thread_return : System.Address;
      uu_clockid : bits_types_clockid_t_h.clockid_t;
      uu_abstime : access constant bits_types_struct_timespec_h.timespec) return int  -- /usr/include/pthread.h:240
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_clockjoin_np";

  -- Indicate that the thread TH is never to be joined with PTHREAD_JOIN.
  --   The resources of TH will therefore be freed immediately when it
  --   terminates, instead of waiting for another thread to perform PTHREAD_JOIN
  --   on it.   

   function pthread_detach (uu_th : bits_pthreadtypes_h.pthread_t) return int  -- /usr/include/pthread.h:249
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_detach";

  -- Obtain the identifier of the current thread.   
   function pthread_self return bits_pthreadtypes_h.pthread_t  -- /usr/include/pthread.h:253
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_self";

  -- Compare two thread identifiers.   
   function pthread_equal (uu_thread1 : bits_pthreadtypes_h.pthread_t; uu_thread2 : bits_pthreadtypes_h.pthread_t) return int  -- /usr/include/pthread.h:256
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_equal";

  -- Thread attribute handling.   
  -- Initialize thread attribute *ATTR with default attributes
  --   (detachstate is PTHREAD_JOINABLE, scheduling policy is SCHED_OTHER,
  --    no user-provided stack).   

   function pthread_attr_init (uu_attr : access bits_pthreadtypes_h.pthread_attr_t) return int  -- /usr/include/pthread.h:265
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_attr_init";

  -- Destroy thread attribute *ATTR.   
   function pthread_attr_destroy (uu_attr : access bits_pthreadtypes_h.pthread_attr_t) return int  -- /usr/include/pthread.h:268
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_attr_destroy";

  -- Get detach state attribute.   
   function pthread_attr_getdetachstate (uu_attr : access constant bits_pthreadtypes_h.pthread_attr_t; uu_detachstate : access int) return int  -- /usr/include/pthread.h:272
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_attr_getdetachstate";

  -- Set detach state attribute.   
   function pthread_attr_setdetachstate (uu_attr : access bits_pthreadtypes_h.pthread_attr_t; uu_detachstate : int) return int  -- /usr/include/pthread.h:277
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_attr_setdetachstate";

  -- Get the size of the guard area created for stack overflow protection.   
   function pthread_attr_getguardsize (uu_attr : access constant bits_pthreadtypes_h.pthread_attr_t; uu_guardsize : access stddef_h.size_t) return int  -- /usr/include/pthread.h:283
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_attr_getguardsize";

  -- Set the size of the guard area created for stack overflow protection.   
   function pthread_attr_setguardsize (uu_attr : access bits_pthreadtypes_h.pthread_attr_t; uu_guardsize : stddef_h.size_t) return int  -- /usr/include/pthread.h:288
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_attr_setguardsize";

  -- Return in *PARAM the scheduling parameters of *ATTR.   
   function pthread_attr_getschedparam (uu_attr : access constant bits_pthreadtypes_h.pthread_attr_t; uu_param : access bits_types_struct_sched_param_h.sched_param) return int  -- /usr/include/pthread.h:294
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_attr_getschedparam";

  -- Set scheduling parameters (priority, etc) in *ATTR according to PARAM.   
   function pthread_attr_setschedparam (uu_attr : access bits_pthreadtypes_h.pthread_attr_t; uu_param : access constant bits_types_struct_sched_param_h.sched_param) return int  -- /usr/include/pthread.h:299
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_attr_setschedparam";

  -- Return in *POLICY the scheduling policy of *ATTR.   
   function pthread_attr_getschedpolicy (uu_attr : access constant bits_pthreadtypes_h.pthread_attr_t; uu_policy : access int) return int  -- /usr/include/pthread.h:304
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_attr_getschedpolicy";

  -- Set scheduling policy in *ATTR according to POLICY.   
   function pthread_attr_setschedpolicy (uu_attr : access bits_pthreadtypes_h.pthread_attr_t; uu_policy : int) return int  -- /usr/include/pthread.h:309
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_attr_setschedpolicy";

  -- Return in *INHERIT the scheduling inheritance mode of *ATTR.   
   function pthread_attr_getinheritsched (uu_attr : access constant bits_pthreadtypes_h.pthread_attr_t; uu_inherit : access int) return int  -- /usr/include/pthread.h:313
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_attr_getinheritsched";

  -- Set scheduling inheritance mode in *ATTR according to INHERIT.   
   function pthread_attr_setinheritsched (uu_attr : access bits_pthreadtypes_h.pthread_attr_t; uu_inherit : int) return int  -- /usr/include/pthread.h:318
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_attr_setinheritsched";

  -- Return in *SCOPE the scheduling contention scope of *ATTR.   
   function pthread_attr_getscope (uu_attr : access constant bits_pthreadtypes_h.pthread_attr_t; uu_scope : access int) return int  -- /usr/include/pthread.h:324
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_attr_getscope";

  -- Set scheduling contention scope in *ATTR according to SCOPE.   
   function pthread_attr_setscope (uu_attr : access bits_pthreadtypes_h.pthread_attr_t; uu_scope : int) return int  -- /usr/include/pthread.h:329
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_attr_setscope";

  -- Return the previously set address for the stack.   
   function pthread_attr_getstackaddr (uu_attr : access constant bits_pthreadtypes_h.pthread_attr_t; uu_stackaddr : System.Address) return int  -- /usr/include/pthread.h:333
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_attr_getstackaddr";

  -- Set the starting address of the stack of the thread to be created.
  --   Depending on whether the stack grows up or down the value must either
  --   be higher or lower than all the address in the memory block.  The
  --   minimal size of the block must be PTHREAD_STACK_MIN.   

   function pthread_attr_setstackaddr (uu_attr : access bits_pthreadtypes_h.pthread_attr_t; uu_stackaddr : System.Address) return int  -- /usr/include/pthread.h:341
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_attr_setstackaddr";

  -- Return the currently used minimal stack size.   
   function pthread_attr_getstacksize (uu_attr : access constant bits_pthreadtypes_h.pthread_attr_t; uu_stacksize : access stddef_h.size_t) return int  -- /usr/include/pthread.h:346
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_attr_getstacksize";

  -- Add information about the minimum stack size needed for the thread
  --   to be started.  This size must never be less than PTHREAD_STACK_MIN
  --   and must also not exceed the system limits.   

   function pthread_attr_setstacksize (uu_attr : access bits_pthreadtypes_h.pthread_attr_t; uu_stacksize : stddef_h.size_t) return int  -- /usr/include/pthread.h:353
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_attr_setstacksize";

  -- Return the previously set address for the stack.   
   function pthread_attr_getstack
     (uu_attr : access constant bits_pthreadtypes_h.pthread_attr_t;
      uu_stackaddr : System.Address;
      uu_stacksize : access stddef_h.size_t) return int  -- /usr/include/pthread.h:359
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_attr_getstack";

  -- The following two interfaces are intended to replace the last two.  They
  --   require setting the address as well as the size since only setting the
  --   address will make the implementation on some architectures impossible.   

   function pthread_attr_setstack
     (uu_attr : access bits_pthreadtypes_h.pthread_attr_t;
      uu_stackaddr : System.Address;
      uu_stacksize : stddef_h.size_t) return int  -- /usr/include/pthread.h:367
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_attr_setstack";

  -- Thread created with attribute ATTR will be limited to run only on
  --   the processors represented in CPUSET.   

   function pthread_attr_setaffinity_np
     (uu_attr : access bits_pthreadtypes_h.pthread_attr_t;
      uu_cpusetsize : stddef_h.size_t;
      uu_cpuset : access constant bits_cpu_set_h.cpu_set_t) return int  -- /usr/include/pthread.h:374
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_attr_setaffinity_np";

  -- Get bit set in CPUSET representing the processors threads created with
  --   ATTR can run on.   

   function pthread_attr_getaffinity_np
     (uu_attr : access constant bits_pthreadtypes_h.pthread_attr_t;
      uu_cpusetsize : stddef_h.size_t;
      uu_cpuset : access bits_cpu_set_h.cpu_set_t) return int  -- /usr/include/pthread.h:381
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_attr_getaffinity_np";

  -- Get the default attributes used by pthread_create in this process.   
   function pthread_getattr_default_np (uu_attr : access bits_pthreadtypes_h.pthread_attr_t) return int  -- /usr/include/pthread.h:387
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_getattr_default_np";

  -- Store *SIGMASK as the signal mask for the new thread in *ATTR.   
   function pthread_attr_setsigmask_np (uu_attr : access bits_pthreadtypes_h.pthread_attr_t; sigmask : access constant bits_types_u_sigset_t_h.uu_sigset_t) return int  -- /usr/include/pthread.h:391
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_attr_setsigmask_np";

  -- Store the signal mask of *ATTR in *SIGMASK.  If there is no signal
  --   mask stored, return PTHREAD_ATTR_NOSIGMASK_NP.  Return zero on
  --   success.   

   function pthread_attr_getsigmask_np (uu_attr : access constant bits_pthreadtypes_h.pthread_attr_t; sigmask : access bits_types_u_sigset_t_h.uu_sigset_t) return int  -- /usr/include/pthread.h:397
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_attr_getsigmask_np";

  -- Special return value from pthread_attr_getsigmask_np if the signal
  --   mask has not been set.   

  -- Set the default attributes to be used by pthread_create in this
  --   process.   

   function pthread_setattr_default_np (uu_attr : access constant bits_pthreadtypes_h.pthread_attr_t) return int  -- /usr/include/pthread.h:406
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_setattr_default_np";

  -- Initialize thread attribute *ATTR with attributes corresponding to the
  --   already running thread TH.  It shall be called on uninitialized ATTR
  --   and destroyed with pthread_attr_destroy when no longer needed.   

   function pthread_getattr_np (uu_th : bits_pthreadtypes_h.pthread_t; uu_attr : access bits_pthreadtypes_h.pthread_attr_t) return int  -- /usr/include/pthread.h:412
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_getattr_np";

  -- Functions for scheduling control.   
  -- Set the scheduling parameters for TARGET_THREAD according to POLICY
  --   and *PARAM.   

   function pthread_setschedparam
     (uu_target_thread : bits_pthreadtypes_h.pthread_t;
      uu_policy : int;
      uu_param : access constant bits_types_struct_sched_param_h.sched_param) return int  -- /usr/include/pthread.h:421
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_setschedparam";

  -- Return in *POLICY and *PARAM the scheduling parameters for TARGET_THREAD.  
   function pthread_getschedparam
     (uu_target_thread : bits_pthreadtypes_h.pthread_t;
      uu_policy : access int;
      uu_param : access bits_types_struct_sched_param_h.sched_param) return int  -- /usr/include/pthread.h:426
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_getschedparam";

  -- Set the scheduling priority for TARGET_THREAD.   
   function pthread_setschedprio (uu_target_thread : bits_pthreadtypes_h.pthread_t; uu_prio : int) return int  -- /usr/include/pthread.h:432
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_setschedprio";

  -- Get thread name visible in the kernel and its interfaces.   
   function pthread_getname_np
     (uu_target_thread : bits_pthreadtypes_h.pthread_t;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_buflen : stddef_h.size_t) return int  -- /usr/include/pthread.h:438
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_getname_np";

  -- Set thread name visible in the kernel and its interfaces.   
   function pthread_setname_np (uu_target_thread : bits_pthreadtypes_h.pthread_t; uu_name : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/pthread.h:443
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_setname_np";

  -- Determine level of concurrency.   
   function pthread_getconcurrency return int  -- /usr/include/pthread.h:450
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_getconcurrency";

  -- Set new concurrency level to LEVEL.   
   function pthread_setconcurrency (uu_level : int) return int  -- /usr/include/pthread.h:453
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_setconcurrency";

  -- Yield the processor to another thread or process.
  --   This function is similar to the POSIX `sched_yield' function but
  --   might be differently implemented in the case of a m-on-n thread
  --   implementation.   

   function pthread_yield return int  -- /usr/include/pthread.h:461
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_yield";

  -- Limit specified thread TH to run only on the processors represented
  --   in CPUSET.   

   function pthread_setaffinity_np
     (uu_th : bits_pthreadtypes_h.pthread_t;
      uu_cpusetsize : stddef_h.size_t;
      uu_cpuset : access constant bits_cpu_set_h.cpu_set_t) return int  -- /usr/include/pthread.h:466
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_setaffinity_np";

  -- Get bit set in CPUSET representing the processors TH can run on.   
   function pthread_getaffinity_np
     (uu_th : bits_pthreadtypes_h.pthread_t;
      uu_cpusetsize : stddef_h.size_t;
      uu_cpuset : access bits_cpu_set_h.cpu_set_t) return int  -- /usr/include/pthread.h:471
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_getaffinity_np";

  -- Functions for handling initialization.   
  -- Guarantee that the initialization function INIT_ROUTINE will be called
  --   only once, even if pthread_once is executed several times with the
  --   same ONCE_CONTROL argument. ONCE_CONTROL must point to a static or
  --   extern variable initialized to PTHREAD_ONCE_INIT.
  --   The initialization functions might throw exception which is why
  --   this function is not marked with __THROW.   

   function pthread_once (uu_once_control : access bits_pthreadtypes_h.pthread_once_t; uu_init_routine : access procedure) return int  -- /usr/include/pthread.h:486
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_once";

  -- Functions for handling cancellation.
  --   Note that these functions are explicitly not marked to not throw an
  --   exception in C++ code.  If cancellation is implemented by unwinding
  --   this is necessary to have the compiler generate the unwind information.   

  -- Set cancelability state of current thread to STATE, returning old
  --   state in *OLDSTATE if OLDSTATE is not NULL.   

   function pthread_setcancelstate (uu_state : int; uu_oldstate : access int) return int  -- /usr/include/pthread.h:498
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_setcancelstate";

  -- Set cancellation state of current thread to TYPE, returning the old
  --   type in *OLDTYPE if OLDTYPE is not NULL.   

   function pthread_setcanceltype (uu_type : int; uu_oldtype : access int) return int  -- /usr/include/pthread.h:502
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_setcanceltype";

  -- Cancel THREAD immediately or at the next possibility.   
   function pthread_cancel (uu_th : bits_pthreadtypes_h.pthread_t) return int  -- /usr/include/pthread.h:505
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_cancel";

  -- Test for pending cancellation for the current thread and terminate
  --   the thread as per pthread_exit(PTHREAD_CANCELED) if it has been
  --   cancelled.   

   procedure pthread_testcancel  -- /usr/include/pthread.h:510
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_testcancel";

  -- Cancellation handling with integration into exception handling.   
   type uu_cancel_jmp_buf_tag is record
      uu_cancel_jmp_buf : aliased bits_setjmp_h.uu_jmp_buf;  -- /usr/include/pthread.h:517
      uu_mask_was_saved : aliased int;  -- /usr/include/pthread.h:518
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/pthread.h:515

   --  skipped anonymous struct anon_27

   type uu_pthread_unwind_buf_t_array1432 is array (0 .. 0) of aliased uu_cancel_jmp_buf_tag;
   type uu_pthread_unwind_buf_t_array1433 is array (0 .. 3) of System.Address;
   type uu_pthread_unwind_buf_t is record
      uu_cancel_jmp_buf : aliased uu_pthread_unwind_buf_t_array1432;  -- /usr/include/pthread.h:523
      uu_pad : uu_pthread_unwind_buf_t_array1433;  -- /usr/include/pthread.h:524
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/pthread.h:525

  -- No special attributes by default.   
  -- Structure to hold the cleanup handler information.   
   type uu_pthread_cleanup_frame is record
      uu_cancel_routine : access procedure (arg1 : System.Address);  -- /usr/include/pthread.h:536
      uu_cancel_arg : System.Address;  -- /usr/include/pthread.h:537
      uu_do_it : aliased int;  -- /usr/include/pthread.h:538
      uu_cancel_type : aliased int;  -- /usr/include/pthread.h:539
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/pthread.h:534

  -- Class to handle cancellation handler invocation.   
   package Class_uu_pthread_cleanup_class is
      type uu_pthread_cleanup_class is limited record
         uu_cancel_routine : access procedure (arg1 : System.Address);  -- /usr/include/pthread.h:547
         uu_cancel_arg : System.Address;  -- /usr/include/pthread.h:548
         uu_do_it : aliased int;  -- /usr/include/pthread.h:549
         uu_cancel_type : aliased int;  -- /usr/include/pthread.h:550
      end record
      with Import => True,
           Convention => CPP;

      function New_uu_pthread_cleanup_class (uu_fct : access procedure (arg1 : System.Address); uu_arg : System.Address) return uu_pthread_cleanup_class;  -- /usr/include/pthread.h:553
      pragma CPP_Constructor (New_uu_pthread_cleanup_class, "_ZN23__pthread_cleanup_classC1EPFvPvES0_");

      procedure Delete_uu_pthread_cleanup_class (this : access uu_pthread_cleanup_class)  -- /usr/include/pthread.h:555
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN23__pthread_cleanup_classD1Ev";

      --  skipped func __setdoit

      --  skipped func __defer

      --  skipped func __restore
   end;
   use Class_uu_pthread_cleanup_class;
  -- Install a cleanup handler: ROUTINE will be called with arguments ARG
  --   when the thread is canceled or calls pthread_exit.  ROUTINE will also
  --   be called with arguments ARG when the matching pthread_cleanup_pop
  --   is executed with non-zero EXECUTE argument.
  --   pthread_cleanup_push and pthread_cleanup_pop are macros and must always
  --   be used in matching pairs at the same nesting level of braces.   

  -- Remove a cleanup handler installed by the matching pthread_cleanup_push.
  --   If EXECUTE is non-zero, the handler function is called.  

  -- Install a cleanup handler as pthread_cleanup_push does, but also
  --   saves the current cancellation type and sets it to deferred
  --   cancellation.   

  -- Remove a cleanup handler as pthread_cleanup_pop does, but also
  --   restores the cancellation type that was in effect when the matching
  --   pthread_cleanup_push_defer was called.   

  -- Function called to call the cleanup handler.  As an extern inline
  --   function the compiler is free to decide inlining the change when
  --   needed or fall back on the copy which must exist somewhere
  --   else.   

  -- Install a cleanup handler: ROUTINE will be called with arguments ARG
  --   when the thread is canceled or calls pthread_exit.  ROUTINE will also
  --   be called with arguments ARG when the matching pthread_cleanup_pop
  --   is executed with non-zero EXECUTE argument.
  --   pthread_cleanup_push and pthread_cleanup_pop are macros and must always
  --   be used in matching pairs at the same nesting level of braces.   

  -- Remove a cleanup handler installed by the matching pthread_cleanup_push.
  --   If EXECUTE is non-zero, the handler function is called.  

  -- Install a cleanup handler as pthread_cleanup_push does, but also
  --   saves the current cancellation type and sets it to deferred
  --   cancellation.   

  -- Remove a cleanup handler as pthread_cleanup_pop does, but also
  --   restores the cancellation type that was in effect when the matching
  --   pthread_cleanup_push_defer was called.   

  -- Install a cleanup handler: ROUTINE will be called with arguments ARG
  --   when the thread is canceled or calls pthread_exit.  ROUTINE will also
  --   be called with arguments ARG when the matching pthread_cleanup_pop
  --   is executed with non-zero EXECUTE argument.
  --   pthread_cleanup_push and pthread_cleanup_pop are macros and must always
  --   be used in matching pairs at the same nesting level of braces.   

  -- Remove a cleanup handler installed by the matching pthread_cleanup_push.
  --   If EXECUTE is non-zero, the handler function is called.  

  -- Install a cleanup handler as pthread_cleanup_push does, but also
  --   saves the current cancellation type and sets it to deferred
  --   cancellation.   

  -- Remove a cleanup handler as pthread_cleanup_pop does, but also
  --   restores the cancellation type that was in effect when the matching
  --   pthread_cleanup_push_defer was called.   

  -- Internal interface to initiate cleanup.   
  -- Function used in the macros.  Calling __sigsetjmp, with its first
  --   argument declared as an array, results in a -Wstringop-overflow
  --   warning from GCC 11 because struct pthread_unwind_buf is smaller
  --   than jmp_buf.  The calls from the macros have __SAVEMASK set to 0,
  --   so nothing beyond the common prefix is used and this warning is a
  --   false positive.  Use an alias with its first argument declared to
  --   use the type in the macros if possible to avoid this warning.   

   --  skipped func __sigsetjmp

  -- Mutex handling.   
  -- Initialize a mutex.   
   function pthread_mutex_init (uu_mutex : access bits_pthreadtypes_h.pthread_mutex_t; uu_mutexattr : access constant bits_pthreadtypes_h.pthread_mutexattr_t) return int  -- /usr/include/pthread.h:758
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_mutex_init";

  -- Destroy a mutex.   
   function pthread_mutex_destroy (uu_mutex : access bits_pthreadtypes_h.pthread_mutex_t) return int  -- /usr/include/pthread.h:763
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_mutex_destroy";

  -- Try locking a mutex.   
   function pthread_mutex_trylock (uu_mutex : access bits_pthreadtypes_h.pthread_mutex_t) return int  -- /usr/include/pthread.h:767
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_mutex_trylock";

  -- Lock a mutex.   
   function pthread_mutex_lock (uu_mutex : access bits_pthreadtypes_h.pthread_mutex_t) return int  -- /usr/include/pthread.h:771
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_mutex_lock";

  -- Wait until lock becomes available, or specified time passes.  
   function pthread_mutex_timedlock (uu_mutex : access bits_pthreadtypes_h.pthread_mutex_t; uu_abstime : access constant bits_types_struct_timespec_h.timespec) return int  -- /usr/include/pthread.h:776
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_mutex_timedlock";

   function pthread_mutex_clocklock
     (uu_mutex : access bits_pthreadtypes_h.pthread_mutex_t;
      uu_clockid : bits_types_clockid_t_h.clockid_t;
      uu_abstime : access constant bits_types_struct_timespec_h.timespec) return int  -- /usr/include/pthread.h:782
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_mutex_clocklock";

  -- Unlock a mutex.   
   function pthread_mutex_unlock (uu_mutex : access bits_pthreadtypes_h.pthread_mutex_t) return int  -- /usr/include/pthread.h:789
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_mutex_unlock";

  -- Get the priority ceiling of MUTEX.   
   function pthread_mutex_getprioceiling (uu_mutex : access constant bits_pthreadtypes_h.pthread_mutex_t; uu_prioceiling : access int) return int  -- /usr/include/pthread.h:794
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_mutex_getprioceiling";

  -- Set the priority ceiling of MUTEX to PRIOCEILING, return old
  --   priority ceiling value in *OLD_CEILING.   

   function pthread_mutex_setprioceiling
     (uu_mutex : access bits_pthreadtypes_h.pthread_mutex_t;
      uu_prioceiling : int;
      uu_old_ceiling : access int) return int  -- /usr/include/pthread.h:801
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_mutex_setprioceiling";

  -- Declare the state protected by MUTEX as consistent.   
   function pthread_mutex_consistent (uu_mutex : access bits_pthreadtypes_h.pthread_mutex_t) return int  -- /usr/include/pthread.h:809
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_mutex_consistent";

   function pthread_mutex_consistent_np (uu_mutex : access bits_pthreadtypes_h.pthread_mutex_t) return int  -- /usr/include/pthread.h:812
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_mutex_consistent_np";

  -- Functions for handling mutex attributes.   
  -- Initialize mutex attribute object ATTR with default attributes
  --   (kind is PTHREAD_MUTEX_TIMED_NP).   

   function pthread_mutexattr_init (uu_attr : access bits_pthreadtypes_h.pthread_mutexattr_t) return int  -- /usr/include/pthread.h:822
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_mutexattr_init";

  -- Destroy mutex attribute object ATTR.   
   function pthread_mutexattr_destroy (uu_attr : access bits_pthreadtypes_h.pthread_mutexattr_t) return int  -- /usr/include/pthread.h:826
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_mutexattr_destroy";

  -- Get the process-shared flag of the mutex attribute ATTR.   
   function pthread_mutexattr_getpshared (uu_attr : access constant bits_pthreadtypes_h.pthread_mutexattr_t; uu_pshared : access int) return int  -- /usr/include/pthread.h:830
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_mutexattr_getpshared";

  -- Set the process-shared flag of the mutex attribute ATTR.   
   function pthread_mutexattr_setpshared (uu_attr : access bits_pthreadtypes_h.pthread_mutexattr_t; uu_pshared : int) return int  -- /usr/include/pthread.h:836
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_mutexattr_setpshared";

  -- Return in *KIND the mutex kind attribute in *ATTR.   
   function pthread_mutexattr_gettype (uu_attr : access constant bits_pthreadtypes_h.pthread_mutexattr_t; uu_kind : access int) return int  -- /usr/include/pthread.h:842
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_mutexattr_gettype";

  -- Set the mutex kind attribute in *ATTR to KIND (either PTHREAD_MUTEX_NORMAL,
  --   PTHREAD_MUTEX_RECURSIVE, PTHREAD_MUTEX_ERRORCHECK, or
  --   PTHREAD_MUTEX_DEFAULT).   

   function pthread_mutexattr_settype (uu_attr : access bits_pthreadtypes_h.pthread_mutexattr_t; uu_kind : int) return int  -- /usr/include/pthread.h:849
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_mutexattr_settype";

  -- Return in *PROTOCOL the mutex protocol attribute in *ATTR.   
   function pthread_mutexattr_getprotocol (uu_attr : access constant bits_pthreadtypes_h.pthread_mutexattr_t; uu_protocol : access int) return int  -- /usr/include/pthread.h:854
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_mutexattr_getprotocol";

  -- Set the mutex protocol attribute in *ATTR to PROTOCOL (either
  --   PTHREAD_PRIO_NONE, PTHREAD_PRIO_INHERIT, or PTHREAD_PRIO_PROTECT).   

   function pthread_mutexattr_setprotocol (uu_attr : access bits_pthreadtypes_h.pthread_mutexattr_t; uu_protocol : int) return int  -- /usr/include/pthread.h:861
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_mutexattr_setprotocol";

  -- Return in *PRIOCEILING the mutex prioceiling attribute in *ATTR.   
   function pthread_mutexattr_getprioceiling (uu_attr : access constant bits_pthreadtypes_h.pthread_mutexattr_t; uu_prioceiling : access int) return int  -- /usr/include/pthread.h:866
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_mutexattr_getprioceiling";

  -- Set the mutex prioceiling attribute in *ATTR to PRIOCEILING.   
   function pthread_mutexattr_setprioceiling (uu_attr : access bits_pthreadtypes_h.pthread_mutexattr_t; uu_prioceiling : int) return int  -- /usr/include/pthread.h:872
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_mutexattr_setprioceiling";

  -- Get the robustness flag of the mutex attribute ATTR.   
   function pthread_mutexattr_getrobust (uu_attr : access constant bits_pthreadtypes_h.pthread_mutexattr_t; uu_robustness : access int) return int  -- /usr/include/pthread.h:878
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_mutexattr_getrobust";

   function pthread_mutexattr_getrobust_np (uu_attr : access constant bits_pthreadtypes_h.pthread_mutexattr_t; uu_robustness : access int) return int  -- /usr/include/pthread.h:882
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_mutexattr_getrobust_np";

  -- Set the robustness flag of the mutex attribute ATTR.   
   function pthread_mutexattr_setrobust (uu_attr : access bits_pthreadtypes_h.pthread_mutexattr_t; uu_robustness : int) return int  -- /usr/include/pthread.h:888
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_mutexattr_setrobust";

   function pthread_mutexattr_setrobust_np (uu_attr : access bits_pthreadtypes_h.pthread_mutexattr_t; uu_robustness : int) return int  -- /usr/include/pthread.h:892
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_mutexattr_setrobust_np";

  -- Functions for handling read-write locks.   
  -- Initialize read-write lock RWLOCK using attributes ATTR, or use
  --   the default values if later is NULL.   

   function pthread_rwlock_init (uu_rwlock : access bits_pthreadtypes_h.pthread_rwlock_t; uu_attr : access constant bits_pthreadtypes_h.pthread_rwlockattr_t) return int  -- /usr/include/pthread.h:904
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_rwlock_init";

  -- Destroy read-write lock RWLOCK.   
   function pthread_rwlock_destroy (uu_rwlock : access bits_pthreadtypes_h.pthread_rwlock_t) return int  -- /usr/include/pthread.h:909
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_rwlock_destroy";

  -- Acquire read lock for RWLOCK.   
   function pthread_rwlock_rdlock (uu_rwlock : access bits_pthreadtypes_h.pthread_rwlock_t) return int  -- /usr/include/pthread.h:913
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_rwlock_rdlock";

  -- Try to acquire read lock for RWLOCK.   
   function pthread_rwlock_tryrdlock (uu_rwlock : access bits_pthreadtypes_h.pthread_rwlock_t) return int  -- /usr/include/pthread.h:917
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_rwlock_tryrdlock";

  -- Try to acquire read lock for RWLOCK or return after specfied time.   
   function pthread_rwlock_timedrdlock (uu_rwlock : access bits_pthreadtypes_h.pthread_rwlock_t; uu_abstime : access constant bits_types_struct_timespec_h.timespec) return int  -- /usr/include/pthread.h:922
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_rwlock_timedrdlock";

   function pthread_rwlock_clockrdlock
     (uu_rwlock : access bits_pthreadtypes_h.pthread_rwlock_t;
      uu_clockid : bits_types_clockid_t_h.clockid_t;
      uu_abstime : access constant bits_types_struct_timespec_h.timespec) return int  -- /usr/include/pthread.h:928
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_rwlock_clockrdlock";

  -- Acquire write lock for RWLOCK.   
   function pthread_rwlock_wrlock (uu_rwlock : access bits_pthreadtypes_h.pthread_rwlock_t) return int  -- /usr/include/pthread.h:935
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_rwlock_wrlock";

  -- Try to acquire write lock for RWLOCK.   
   function pthread_rwlock_trywrlock (uu_rwlock : access bits_pthreadtypes_h.pthread_rwlock_t) return int  -- /usr/include/pthread.h:939
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_rwlock_trywrlock";

  -- Try to acquire write lock for RWLOCK or return after specfied time.   
   function pthread_rwlock_timedwrlock (uu_rwlock : access bits_pthreadtypes_h.pthread_rwlock_t; uu_abstime : access constant bits_types_struct_timespec_h.timespec) return int  -- /usr/include/pthread.h:944
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_rwlock_timedwrlock";

   function pthread_rwlock_clockwrlock
     (uu_rwlock : access bits_pthreadtypes_h.pthread_rwlock_t;
      uu_clockid : bits_types_clockid_t_h.clockid_t;
      uu_abstime : access constant bits_types_struct_timespec_h.timespec) return int  -- /usr/include/pthread.h:950
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_rwlock_clockwrlock";

  -- Unlock RWLOCK.   
   function pthread_rwlock_unlock (uu_rwlock : access bits_pthreadtypes_h.pthread_rwlock_t) return int  -- /usr/include/pthread.h:957
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_rwlock_unlock";

  -- Functions for handling read-write lock attributes.   
  -- Initialize attribute object ATTR with default values.   
   function pthread_rwlockattr_init (uu_attr : access bits_pthreadtypes_h.pthread_rwlockattr_t) return int  -- /usr/include/pthread.h:964
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_rwlockattr_init";

  -- Destroy attribute object ATTR.   
   function pthread_rwlockattr_destroy (uu_attr : access bits_pthreadtypes_h.pthread_rwlockattr_t) return int  -- /usr/include/pthread.h:968
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_rwlockattr_destroy";

  -- Return current setting of process-shared attribute of ATTR in PSHARED.   
   function pthread_rwlockattr_getpshared (uu_attr : access constant bits_pthreadtypes_h.pthread_rwlockattr_t; uu_pshared : access int) return int  -- /usr/include/pthread.h:972
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_rwlockattr_getpshared";

  -- Set process-shared attribute of ATTR to PSHARED.   
   function pthread_rwlockattr_setpshared (uu_attr : access bits_pthreadtypes_h.pthread_rwlockattr_t; uu_pshared : int) return int  -- /usr/include/pthread.h:978
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_rwlockattr_setpshared";

  -- Return current setting of reader/writer preference.   
   function pthread_rwlockattr_getkind_np (uu_attr : access constant bits_pthreadtypes_h.pthread_rwlockattr_t; uu_pref : access int) return int  -- /usr/include/pthread.h:983
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_rwlockattr_getkind_np";

  -- Set reader/write preference.   
   function pthread_rwlockattr_setkind_np (uu_attr : access bits_pthreadtypes_h.pthread_rwlockattr_t; uu_pref : int) return int  -- /usr/include/pthread.h:989
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_rwlockattr_setkind_np";

  -- Functions for handling conditional variables.   
  -- Initialize condition variable COND using attributes ATTR, or use
  --   the default values if later is NULL.   

   function pthread_cond_init (uu_cond : access bits_pthreadtypes_h.pthread_cond_t; uu_cond_attr : access constant bits_pthreadtypes_h.pthread_condattr_t) return int  -- /usr/include/pthread.h:998
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_cond_init";

  -- Destroy condition variable COND.   
   function pthread_cond_destroy (uu_cond : access bits_pthreadtypes_h.pthread_cond_t) return int  -- /usr/include/pthread.h:1003
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_cond_destroy";

  -- Wake up one thread waiting for condition variable COND.   
   function pthread_cond_signal (uu_cond : access bits_pthreadtypes_h.pthread_cond_t) return int  -- /usr/include/pthread.h:1007
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_cond_signal";

  -- Wake up all threads waiting for condition variables COND.   
   function pthread_cond_broadcast (uu_cond : access bits_pthreadtypes_h.pthread_cond_t) return int  -- /usr/include/pthread.h:1011
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_cond_broadcast";

  -- Wait for condition variable COND to be signaled or broadcast.
  --   MUTEX is assumed to be locked before.
  --   This function is a cancellation point and therefore not marked with
  --   __THROW.   

   function pthread_cond_wait (uu_cond : access bits_pthreadtypes_h.pthread_cond_t; uu_mutex : access bits_pthreadtypes_h.pthread_mutex_t) return int  -- /usr/include/pthread.h:1019
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_cond_wait";

  -- Wait for condition variable COND to be signaled or broadcast until
  --   ABSTIME.  MUTEX is assumed to be locked before.  ABSTIME is an
  --   absolute time specification; zero is the beginning of the epoch
  --   (00:00:00 GMT, January 1, 1970).
  --   This function is a cancellation point and therefore not marked with
  --   __THROW.   

   function pthread_cond_timedwait
     (uu_cond : access bits_pthreadtypes_h.pthread_cond_t;
      uu_mutex : access bits_pthreadtypes_h.pthread_mutex_t;
      uu_abstime : access constant bits_types_struct_timespec_h.timespec) return int  -- /usr/include/pthread.h:1030
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_cond_timedwait";

  -- Wait for condition variable COND to be signaled or broadcast until
  --   ABSTIME measured by the specified clock. MUTEX is assumed to be
  --   locked before. CLOCK is the clock to use. ABSTIME is an absolute
  --   time specification against CLOCK's epoch.
  --   This function is a cancellation point and therefore not marked with
  --   __THROW.  

   function pthread_cond_clockwait
     (uu_cond : access bits_pthreadtypes_h.pthread_cond_t;
      uu_mutex : access bits_pthreadtypes_h.pthread_mutex_t;
      uu_clock_id : bits_types_h.uu_clockid_t;
      uu_abstime : access constant bits_types_struct_timespec_h.timespec) return int  -- /usr/include/pthread.h:1043
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_cond_clockwait";

  -- Functions for handling condition variable attributes.   
  -- Initialize condition variable attribute ATTR.   
   function pthread_condattr_init (uu_attr : access bits_pthreadtypes_h.pthread_condattr_t) return int  -- /usr/include/pthread.h:1053
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_condattr_init";

  -- Destroy condition variable attribute ATTR.   
   function pthread_condattr_destroy (uu_attr : access bits_pthreadtypes_h.pthread_condattr_t) return int  -- /usr/include/pthread.h:1057
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_condattr_destroy";

  -- Get the process-shared flag of the condition variable attribute ATTR.   
   function pthread_condattr_getpshared (uu_attr : access constant bits_pthreadtypes_h.pthread_condattr_t; uu_pshared : access int) return int  -- /usr/include/pthread.h:1061
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_condattr_getpshared";

  -- Set the process-shared flag of the condition variable attribute ATTR.   
   function pthread_condattr_setpshared (uu_attr : access bits_pthreadtypes_h.pthread_condattr_t; uu_pshared : int) return int  -- /usr/include/pthread.h:1067
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_condattr_setpshared";

  -- Get the clock selected for the condition variable attribute ATTR.   
   function pthread_condattr_getclock (uu_attr : access constant bits_pthreadtypes_h.pthread_condattr_t; uu_clock_id : access bits_types_h.uu_clockid_t) return int  -- /usr/include/pthread.h:1072
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_condattr_getclock";

  -- Set the clock selected for the condition variable attribute ATTR.   
   function pthread_condattr_setclock (uu_attr : access bits_pthreadtypes_h.pthread_condattr_t; uu_clock_id : bits_types_h.uu_clockid_t) return int  -- /usr/include/pthread.h:1078
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_condattr_setclock";

  -- Functions to handle spinlocks.   
  -- Initialize the spinlock LOCK.  If PSHARED is nonzero the spinlock can
  --   be shared between different processes.   

   function pthread_spin_init (uu_lock : access bits_pthreadtypes_h.pthread_spinlock_t; uu_pshared : int) return int  -- /usr/include/pthread.h:1089
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_spin_init";

  -- Destroy the spinlock LOCK.   
   function pthread_spin_destroy (uu_lock : access bits_pthreadtypes_h.pthread_spinlock_t) return int  -- /usr/include/pthread.h:1093
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_spin_destroy";

  -- Wait until spinlock LOCK is retrieved.   
   function pthread_spin_lock (uu_lock : access bits_pthreadtypes_h.pthread_spinlock_t) return int  -- /usr/include/pthread.h:1097
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_spin_lock";

  -- Try to lock spinlock LOCK.   
   function pthread_spin_trylock (uu_lock : access bits_pthreadtypes_h.pthread_spinlock_t) return int  -- /usr/include/pthread.h:1101
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_spin_trylock";

  -- Release spinlock LOCK.   
   function pthread_spin_unlock (uu_lock : access bits_pthreadtypes_h.pthread_spinlock_t) return int  -- /usr/include/pthread.h:1105
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_spin_unlock";

  -- Functions to handle barriers.   
  -- Initialize BARRIER with the attributes in ATTR.  The barrier is
  --   opened when COUNT waiters arrived.   

   function pthread_barrier_init
     (uu_barrier : access bits_pthreadtypes_h.pthread_barrier_t;
      uu_attr : access constant bits_pthreadtypes_h.pthread_barrierattr_t;
      uu_count : unsigned) return int  -- /usr/include/pthread.h:1113
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_barrier_init";

  -- Destroy a previously dynamically initialized barrier BARRIER.   
   function pthread_barrier_destroy (uu_barrier : access bits_pthreadtypes_h.pthread_barrier_t) return int  -- /usr/include/pthread.h:1119
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_barrier_destroy";

  -- Wait on barrier BARRIER.   
   function pthread_barrier_wait (uu_barrier : access bits_pthreadtypes_h.pthread_barrier_t) return int  -- /usr/include/pthread.h:1123
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_barrier_wait";

  -- Initialize barrier attribute ATTR.   
   function pthread_barrierattr_init (uu_attr : access bits_pthreadtypes_h.pthread_barrierattr_t) return int  -- /usr/include/pthread.h:1128
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_barrierattr_init";

  -- Destroy previously dynamically initialized barrier attribute ATTR.   
   function pthread_barrierattr_destroy (uu_attr : access bits_pthreadtypes_h.pthread_barrierattr_t) return int  -- /usr/include/pthread.h:1132
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_barrierattr_destroy";

  -- Get the process-shared flag of the barrier attribute ATTR.   
   function pthread_barrierattr_getpshared (uu_attr : access constant bits_pthreadtypes_h.pthread_barrierattr_t; uu_pshared : access int) return int  -- /usr/include/pthread.h:1136
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_barrierattr_getpshared";

  -- Set the process-shared flag of the barrier attribute ATTR.   
   function pthread_barrierattr_setpshared (uu_attr : access bits_pthreadtypes_h.pthread_barrierattr_t; uu_pshared : int) return int  -- /usr/include/pthread.h:1142
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_barrierattr_setpshared";

  -- Functions for handling thread-specific data.   
  -- Create a key value identifying a location in the thread-specific
  --   data area.  Each thread maintains a distinct thread-specific data
  --   area.  DESTR_FUNCTION, if non-NULL, is called with the value
  --   associated to that key when the key is destroyed.
  --   DESTR_FUNCTION is not called if the value associated is NULL when
  --   the key is destroyed.   

   function pthread_key_create (uu_key : access bits_pthreadtypes_h.pthread_key_t; uu_destr_function : access procedure (arg1 : System.Address)) return int  -- /usr/include/pthread.h:1156
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_key_create";

  -- Destroy KEY.   
   function pthread_key_delete (uu_key : bits_pthreadtypes_h.pthread_key_t) return int  -- /usr/include/pthread.h:1161
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_key_delete";

  -- Return current value of the thread-specific data slot identified by KEY.   
   function pthread_getspecific (uu_key : bits_pthreadtypes_h.pthread_key_t) return System.Address  -- /usr/include/pthread.h:1164
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_getspecific";

  -- Store POINTER in the thread-specific data slot identified by KEY.  
   function pthread_setspecific (uu_key : bits_pthreadtypes_h.pthread_key_t; uu_pointer : System.Address) return int  -- /usr/include/pthread.h:1167
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_setspecific";

  -- Get ID of CPU-time clock for thread THREAD_ID.   
   function pthread_getcpuclockid (uu_thread_id : bits_pthreadtypes_h.pthread_t; uu_clock_id : access bits_types_h.uu_clockid_t) return int  -- /usr/include/pthread.h:1173
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_getcpuclockid";

  -- Install handlers to be called when a new process is created with FORK.
  --   The PREPARE handler is called in the parent process just before performing
  --   FORK. The PARENT handler is called in the parent process just after FORK.
  --   The CHILD handler is called in the child process.  Each of the three
  --   handlers can be NULL, meaning that no handler needs to be called at that
  --   point.
  --   PTHREAD_ATFORK can be called several times, in which case the PREPARE
  --   handlers are called in LIFO order (last added with PTHREAD_ATFORK,
  --   first called before FORK), and the PARENT and CHILD handlers are called
  --   in FIFO (first added, first called).   

   function pthread_atfork
     (uu_prepare : access procedure;
      uu_parent : access procedure;
      uu_child : access procedure) return int  -- /usr/include/pthread.h:1190
   with Import => True, 
        Convention => C, 
        External_Name => "pthread_atfork";

  -- Optimizations.   
end pthread_h;
