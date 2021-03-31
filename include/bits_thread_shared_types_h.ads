pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;

package bits_thread_shared_types_h is

  -- Common threading primitives definitions for both POSIX and C11.
  --   Copyright (C) 2017-2021 Free Software Foundation, Inc.
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

  -- Arch-specific definitions.  Each architecture must define the following
  --   macros to define the expected sizes of pthread data types:
  --   __SIZEOF_PTHREAD_ATTR_T        - size of pthread_attr_t.
  --   __SIZEOF_PTHREAD_MUTEX_T       - size of pthread_mutex_t.
  --   __SIZEOF_PTHREAD_MUTEXATTR_T   - size of pthread_mutexattr_t.
  --   __SIZEOF_PTHREAD_COND_T        - size of pthread_cond_t.
  --   __SIZEOF_PTHREAD_CONDATTR_T    - size of pthread_condattr_t.
  --   __SIZEOF_PTHREAD_RWLOCK_T      - size of pthread_rwlock_t.
  --   __SIZEOF_PTHREAD_RWLOCKATTR_T  - size of pthread_rwlockattr_t.
  --   __SIZEOF_PTHREAD_BARRIER_T     - size of pthread_barrier_t.
  --   __SIZEOF_PTHREAD_BARRIERATTR_T - size of pthread_barrierattr_t.
  --   The additional macro defines any constraint for the lock alignment
  --   inside the thread structures:
  --   __LOCK_ALIGNMENT - for internal lock/futex usage.
  --   Same idea but for the once locking primitive:
  --   __ONCE_ALIGNMENT - for pthread_once_t/once_flag definition.   

  -- Common definition of pthread_mutex_t.  
   type uu_pthread_internal_list;
   type uu_pthread_internal_list is record
      uu_prev : access uu_pthread_internal_list;  -- /usr/include/bits/thread-shared-types.h:51
      uu_next : access uu_pthread_internal_list;  -- /usr/include/bits/thread-shared-types.h:52
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/bits/thread-shared-types.h:49

   subtype uu_pthread_list_t is uu_pthread_internal_list;  -- /usr/include/bits/thread-shared-types.h:53

   type uu_pthread_internal_slist;
   type uu_pthread_internal_slist is record
      uu_next : access uu_pthread_internal_slist;  -- /usr/include/bits/thread-shared-types.h:57
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/bits/thread-shared-types.h:55

   subtype uu_pthread_slist_t is uu_pthread_internal_slist;  -- /usr/include/bits/thread-shared-types.h:58

  -- Arch-specific mutex definitions.  A generic implementation is provided
  --   by sysdeps/nptl/bits/struct_mutex.h.  If required, an architecture
  --   can override it by defining:
  --   1. struct __pthread_mutex_s (used on both pthread_mutex_t and mtx_t
  --      definition).  It should contains at least the internal members
  --      defined in the generic version.
  --   2. __LOCK_ALIGNMENT for any extra attribute for internal lock used with
  --      atomic operations.
  --   3. The macro __PTHREAD_MUTEX_INITIALIZER used for static initialization.
  --      It should initialize the mutex internal flag.   

  -- Arch-sepecific read-write lock definitions.  A generic implementation is
  --   provided by struct_rwlock.h.  If required, an architecture can override it
  --   by defining:
  --   1. struct __pthread_rwlock_arch_t (used on pthread_rwlock_t definition).
  --      It should contain at least the internal members defined in the
  --      generic version.
  --   2. The macro __PTHREAD_RWLOCK_INITIALIZER used for static initialization.
  --      It should initialize the rwlock internal type.   

  -- Common definition of pthread_cond_t.  
   type anon_4 is record
      uu_low : aliased unsigned;  -- /usr/include/bits/thread-shared-types.h:99
      uu_high : aliased unsigned;  -- /usr/include/bits/thread-shared-types.h:100
   end record
   with Convention => C_Pass_By_Copy;
   type anon_3 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_wseq : aliased Extensions.unsigned_long_long;  -- /usr/include/bits/thread-shared-types.h:96
         when others =>
            uu_wseq32 : aliased anon_4;  -- /usr/include/bits/thread-shared-types.h:101
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type anon_6 is record
      uu_low : aliased unsigned;  -- /usr/include/bits/thread-shared-types.h:108
      uu_high : aliased unsigned;  -- /usr/include/bits/thread-shared-types.h:109
   end record
   with Convention => C_Pass_By_Copy;
   type anon_5 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_g1_start : aliased Extensions.unsigned_long_long;  -- /usr/include/bits/thread-shared-types.h:105
         when others =>
            uu_g1_start32 : aliased anon_6;  -- /usr/include/bits/thread-shared-types.h:110
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type uu_pthread_cond_s_array992 is array (0 .. 1) of aliased unsigned;
   type uu_pthread_cond_s is record
      parent : aliased anon_3;
      field_2 : aliased anon_5;
      uu_g_refs : aliased uu_pthread_cond_s_array992;  -- /usr/include/bits/thread-shared-types.h:112
      uu_g_size : aliased uu_pthread_cond_s_array992;  -- /usr/include/bits/thread-shared-types.h:113
      uu_g1_orig_size : aliased unsigned;  -- /usr/include/bits/thread-shared-types.h:114
      uu_wrefs : aliased unsigned;  -- /usr/include/bits/thread-shared-types.h:115
      uu_g_signals : aliased uu_pthread_cond_s_array992;  -- /usr/include/bits/thread-shared-types.h:116
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/bits/thread-shared-types.h:92

   subtype uu_tss_t is unsigned;  -- /usr/include/bits/thread-shared-types.h:119

   subtype uu_thrd_t is unsigned_long;  -- /usr/include/bits/thread-shared-types.h:120

   --  skipped anonymous struct anon_7

   type uu_once_flag is record
      uu_data : aliased int;  -- /usr/include/bits/thread-shared-types.h:124
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/bits/thread-shared-types.h:125

end bits_thread_shared_types_h;
