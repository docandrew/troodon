pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with bits_stdint_intn_h;
with bits_stdint_uintn_h;

package KHR_khrplatform_h is

   --  unsupported macro: KHRONOS_APICALL __attribute__((visibility("default")))
   KHRONOS_SUPPORT_INT64 : constant := 1;  --  /usr/include/KHR/khrplatform.h:156
   KHRONOS_SUPPORT_FLOAT : constant := 1;  --  /usr/include/KHR/khrplatform.h:157

   KHRONOS_MAX_ENUM : constant := 16#7FFFFFFF#;  --  /usr/include/KHR/khrplatform.h:277

  --** Copyright (c) 2008-2018 The Khronos Group Inc.
  --**
  --** Permission is hereby granted, free of charge, to any person obtaining a
  --** copy of this software and/or associated documentation files (the
  --** "Materials"), to deal in the Materials without restriction, including
  --** without limitation the rights to use, copy, modify, merge, publish,
  --** distribute, sublicense, and/or sell copies of the Materials, and to
  --** permit persons to whom the Materials are furnished to do so, subject to
  --** the following conditions:
  --**
  --** The above copyright notice and this permission notice shall be included
  --** in all copies or substantial portions of the Materials.
  --**
  --** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  --** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  --** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
  --** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
  --** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
  --** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
  --** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
  -- 

  -- Khronos platform-specific types and definitions.
  -- *
  -- * The master copy of khrplatform.h is maintained in the Khronos EGL
  -- * Registry repository at https://github.com/KhronosGroup/EGL-Registry
  -- * The last semantic modification to khrplatform.h was at commit ID:
  -- *      67a3e0864c2d75ea5287b9f3d2eb74a745936692
  -- *
  -- * Adopters may modify this file to suit their platform. Adopters are
  -- * encouraged to submit platform specific modifications to the Khronos
  -- * group so that they can be included in future versions of this file.
  -- * Please submit changes by filing pull requests or issues on
  -- * the EGL Registry repository linked above.
  -- *
  -- *
  -- * See the Implementer's Guidelines for information about where this file
  -- * should be located on your system and for more details of its use:
  -- *    http://www.khronos.org/registry/implementers_guide.pdf
  -- *
  -- * This file should be included as
  -- *        #include <KHR/khrplatform.h>
  -- * by Khronos client API header files that use its types and defines.
  -- *
  -- * The types in khrplatform.h should only be used to define API-specific types.
  -- *
  -- * Types defined in khrplatform.h:
  -- *    khronos_int8_t              signed   8  bit
  -- *    khronos_uint8_t             unsigned 8  bit
  -- *    khronos_int16_t             signed   16 bit
  -- *    khronos_uint16_t            unsigned 16 bit
  -- *    khronos_int32_t             signed   32 bit
  -- *    khronos_uint32_t            unsigned 32 bit
  -- *    khronos_int64_t             signed   64 bit
  -- *    khronos_uint64_t            unsigned 64 bit
  -- *    khronos_intptr_t            signed   same number of bits as a pointer
  -- *    khronos_uintptr_t           unsigned same number of bits as a pointer
  -- *    khronos_ssize_t             signed   size
  -- *    khronos_usize_t             unsigned size
  -- *    khronos_float_t             signed   32 bit floating point
  -- *    khronos_time_ns_t           unsigned 64 bit time in nanoseconds
  -- *    khronos_utime_nanoseconds_t unsigned time interval or absolute time in
  -- *                                         nanoseconds
  -- *    khronos_stime_nanoseconds_t signed time interval in nanoseconds
  -- *    khronos_boolean_enum_t      enumerated boolean type. This should
  -- *      only be used as a base type when a client API's boolean type is
  -- *      an enum. Client APIs which use an integer or other type for
  -- *      booleans cannot use this as the base type for their boolean.
  -- *
  -- * Tokens defined in khrplatform.h:
  -- *
  -- *    KHRONOS_FALSE, KHRONOS_TRUE Enumerated boolean false/true values.
  -- *
  -- *    KHRONOS_SUPPORT_INT64 is 1 if 64 bit integers are supported; otherwise 0.
  -- *    KHRONOS_SUPPORT_FLOAT is 1 if floats are supported; otherwise 0.
  -- *
  -- * Calling convention macros defined in this file:
  -- *    KHRONOS_APICALL
  -- *    KHRONOS_APIENTRY
  -- *    KHRONOS_APIATTRIBUTES
  -- *
  -- * These may be used in function prototypes as:
  -- *
  -- *      KHRONOS_APICALL void KHRONOS_APIENTRY funcname(
  -- *                                  int arg1,
  -- *                                  int arg2) KHRONOS_APIATTRIBUTES;
  --  

  ---------------------------------------------------------------------------
  -- * Definition of KHRONOS_APICALL
  -- *-------------------------------------------------------------------------
  -- * This precedes the return type of the function in the function prototype.
  --  

  -- If the preprocessor constant KHRONOS_STATIC is defined, make the
  --     * header compatible with static linking.  

  -- KHRONOS_APIATTRIBUTES is not used by the client API headers yet  
  ---------------------------------------------------------------------------
  -- * Definition of KHRONOS_APIENTRY
  -- *-------------------------------------------------------------------------
  -- * This follows the return type of the function  and precedes the function
  -- * name in the function prototype.
  --  

  -- Win32 but not WinCE  
  ---------------------------------------------------------------------------
  -- * Definition of KHRONOS_APIATTRIBUTES
  -- *-------------------------------------------------------------------------
  -- * This follows the closing parenthesis of the function prototype arguments.
  --  

  ---------------------------------------------------------------------------
  -- * basic type definitions
  -- *----------------------------------------------------------------------- 

  -- * Using <stdint.h>
  --  

   subtype khronos_int32_t is bits_stdint_intn_h.int32_t;  -- /usr/include/KHR/khrplatform.h:152

   subtype khronos_uint32_t is bits_stdint_uintn_h.uint32_t;  -- /usr/include/KHR/khrplatform.h:153

   subtype khronos_int64_t is bits_stdint_intn_h.int64_t;  -- /usr/include/KHR/khrplatform.h:154

   subtype khronos_uint64_t is bits_stdint_uintn_h.uint64_t;  -- /usr/include/KHR/khrplatform.h:155

  -- * Using <inttypes.h>
  --  

  -- * Win32
  --  

  -- * Sun or Digital
  --  

  -- * Hypothetical platform with no float or int64 support
  --  

  -- * Generic fallback
  --  

  -- * Types that are (so far) the same on all platforms
  --  

   subtype khronos_int8_t is signed_char;  -- /usr/include/KHR/khrplatform.h:230

   subtype khronos_uint8_t is unsigned_char;  -- /usr/include/KHR/khrplatform.h:231

   subtype khronos_int16_t is short;  -- /usr/include/KHR/khrplatform.h:232

   subtype khronos_uint16_t is unsigned_short;  -- /usr/include/KHR/khrplatform.h:233

  -- * Types that differ between LLP64 and LP64 architectures - in LLP64,
  -- * pointers are 64 bits, but 'long' is still 32 bits. Win64 appears
  -- * to be the only LLP64 architecture in current use.
  --  

   subtype khronos_intptr_t is long;  -- /usr/include/KHR/khrplatform.h:246

   subtype khronos_uintptr_t is unsigned_long;  -- /usr/include/KHR/khrplatform.h:247

   subtype khronos_ssize_t is long;  -- /usr/include/KHR/khrplatform.h:248

   subtype khronos_usize_t is unsigned_long;  -- /usr/include/KHR/khrplatform.h:249

  -- * Float type
  --  

   subtype khronos_float_t is float;  -- /usr/include/KHR/khrplatform.h:256

  -- Time types
  -- *
  -- * These types can be used to represent a time interval in nanoseconds or
  -- * an absolute Unadjusted System Time.  Unadjusted System Time is the number
  -- * of nanoseconds since some arbitrary system event (e.g. since the last
  -- * time the system booted).  The Unadjusted System Time is an unsigned
  -- * 64 bit value that wraps back to 0 every 584 years.  Time intervals
  -- * may be either signed or unsigned.
  --  

   subtype khronos_utime_nanoseconds_t is khronos_uint64_t;  -- /usr/include/KHR/khrplatform.h:269

   subtype khronos_stime_nanoseconds_t is khronos_int64_t;  -- /usr/include/KHR/khrplatform.h:270

  -- * Dummy value used to pad enum types to 32 bits.
  --  

  -- * Enumerated boolean type
  -- *
  -- * Values other than zero should be considered to be true.  Therefore
  -- * comparisons should not be made against KHRONOS_TRUE.
  --  

   subtype khronos_boolean_enum_t is unsigned;
   KHRONOS_FALSE : constant unsigned := 0;
   KHRONOS_TRUE : constant unsigned := 1;
   KHRONOS_BOOLEAN_ENUM_FORCE_SIZE : constant unsigned := 2147483647;  -- /usr/include/KHR/khrplatform.h:290

end KHR_khrplatform_h;
