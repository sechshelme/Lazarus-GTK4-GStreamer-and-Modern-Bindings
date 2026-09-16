/*******************************************************************************
 * Copyright (c) 2008-2020 The Khronos Group Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 ******************************************************************************/

#ifndef __CL_PLATFORM_H
#define __CL_PLATFORM_H

#include <CL/cl_version.h>

#ifdef __cplusplus
extern "C" {
#endif



/* scalar types  */
typedef signed   __int8         cl_char;
typedef unsigned __int8         cl_uchar;
typedef signed   __int16        cl_short;
typedef unsigned __int16        cl_ushort;
typedef signed   __int32        cl_int;
typedef unsigned __int32        cl_uint;
typedef signed   __int64        cl_long;
typedef unsigned __int64        cl_ulong;

typedef unsigned __int16        cl_half;
typedef float                   cl_float;
typedef double                  cl_double;

#if defined(__clang__)
#pragma clang diagnostic pop
#endif

/* Macro names and corresponding values defined by OpenCL */
#define CL_CHAR_BIT         8
#define CL_SCHAR_MAX        127
#define CL_SCHAR_MIN        (-127-1)
#define CL_CHAR_MAX         CL_SCHAR_MAX
#define CL_CHAR_MIN         CL_SCHAR_MIN
#define CL_UCHAR_MAX        255
#define CL_SHRT_MAX         32767
#define CL_SHRT_MIN         (-32767-1)
#define CL_USHRT_MAX        65535
#define CL_INT_MAX          2147483647
#define CL_INT_MIN          (-2147483647-1)
#define CL_UINT_MAX         0xffffffffU
#define CL_LONG_MAX         ((cl_long) 0x7FFFFFFFFFFFFFFFLL)
#define CL_LONG_MIN         ((cl_long) -0x7FFFFFFFFFFFFFFFLL - 1LL)
#define CL_ULONG_MAX        ((cl_ulong) 0xFFFFFFFFFFFFFFFFULL)

#define CL_FLT_DIG          6
#define CL_FLT_MANT_DIG     24
#define CL_FLT_MAX_10_EXP   +38
#define CL_FLT_MAX_EXP      +128
#define CL_FLT_MIN_10_EXP   -37
#define CL_FLT_MIN_EXP      -125
#define CL_FLT_RADIX        2
#define CL_FLT_MAX          340282346638528859811704183484516925440.0
#define CL_FLT_MIN          1.175494350822287507969e-38
#define CL_FLT_EPSILON      1.1920928955078125e-7

#define CL_HALF_DIG          3
#define CL_HALF_MANT_DIG     11
#define CL_HALF_MAX_10_EXP   +4
#define CL_HALF_MAX_EXP      +16
#define CL_HALF_MIN_10_EXP   -4
#define CL_HALF_MIN_EXP      -13
#define CL_HALF_RADIX        2
#define CL_HALF_MAX          65504.0
#define CL_HALF_MIN          6.103515625e-05
#define CL_HALF_EPSILON      9.765625e-04

#define CL_DBL_DIG          15
#define CL_DBL_MANT_DIG     53
#define CL_DBL_MAX_10_EXP   +308
#define CL_DBL_MAX_EXP      +1024
#define CL_DBL_MIN_10_EXP   -307
#define CL_DBL_MIN_EXP      -1021
#define CL_DBL_RADIX        2
#define CL_DBL_MAX          1.7976931348623158e+308
#define CL_DBL_MIN          2.225073858507201383090e-308
#define CL_DBL_EPSILON      2.220446049250313080847e-16

#define CL_M_E              2.7182818284590452354
#define CL_M_LOG2E          1.4426950408889634074
#define CL_M_LOG10E         0.43429448190325182765
#define CL_M_LN2            0.69314718055994530942
#define CL_M_LN10           2.30258509299404568402
#define CL_M_PI             3.14159265358979323846
#define CL_M_PI_2           1.57079632679489661923
#define CL_M_PI_4           0.78539816339744830962
#define CL_M_1_PI           0.31830988618379067154
#define CL_M_2_PI           0.63661977236758134308
#define CL_M_2_SQRTPI       1.12837916709551257390
#define CL_M_SQRT2          1.41421356237309504880
#define CL_M_SQRT1_2        0.70710678118654752440

#define CL_M_E_F            2.718281828
#define CL_M_LOG2E_F        1.442695041
#define CL_M_LOG10E_F       0.434294482
#define CL_M_LN2_F          0.693147181
#define CL_M_LN10_F         2.302585093
#define CL_M_PI_F           3.141592654
#define CL_M_PI_2_F         1.570796327
#define CL_M_PI_4_F         0.785398163
#define CL_M_1_PI_F         0.318309886
#define CL_M_2_PI_F         0.636619772
#define CL_M_2_SQRTPI_F     1.128379167
#define CL_M_SQRT2_F        1.414213562
#define CL_M_SQRT1_2_F      0.707106781

#define CL_NAN              (CL_INFINITY - CL_INFINITY)
#define CL_HUGE_VALF        ((cl_float) 1e50)
#define CL_HUGE_VAL         ((cl_double) 1e500)
#define CL_MAXFLOAT         CL_FLT_MAX
#define CL_INFINITY         CL_HUGE_VALF

#else

#include <stdint.h>

/* scalar types  */
typedef int8_t          cl_char;
typedef uint8_t         cl_uchar;
typedef int16_t         cl_short;
typedef uint16_t        cl_ushort;
typedef int32_t         cl_int;
typedef uint32_t        cl_uint;
typedef int64_t         cl_long;
typedef uint64_t        cl_ulong;

typedef uint16_t        cl_half;
typedef float           cl_float;
typedef double          cl_double;

/* Macro names and corresponding values defined by OpenCL */
#define CL_CHAR_BIT         8
#define CL_SCHAR_MAX        127
#define CL_SCHAR_MIN        (-127-1)
#define CL_CHAR_MAX         CL_SCHAR_MAX
#define CL_CHAR_MIN         CL_SCHAR_MIN
#define CL_UCHAR_MAX        255
#define CL_SHRT_MAX         32767
#define CL_SHRT_MIN         (-32767-1)
#define CL_USHRT_MAX        65535
#define CL_INT_MAX          2147483647
#define CL_INT_MIN          (-2147483647-1)
#define CL_UINT_MAX         0xffffffffU
#define CL_LONG_MAX         ((cl_long) 0x7FFFFFFFFFFFFFFFLL)
#define CL_LONG_MIN         ((cl_long) -0x7FFFFFFFFFFFFFFFLL - 1LL)
#define CL_ULONG_MAX        ((cl_ulong) 0xFFFFFFFFFFFFFFFFULL)

#define CL_FLT_DIG          6
#define CL_FLT_MANT_DIG     24
#define CL_FLT_MAX_10_EXP   +38
#define CL_FLT_MAX_EXP      +128
#define CL_FLT_MIN_10_EXP   -37
#define CL_FLT_MIN_EXP      -125
#define CL_FLT_RADIX        2
#define CL_FLT_MAX          340282346638528859811704183484516925440.0
#define CL_FLT_MIN          1.175494350822287507969e-38
#define CL_FLT_EPSILON      1.1920928955078125e-7

#define CL_HALF_DIG          3
#define CL_HALF_MANT_DIG     11
#define CL_HALF_MAX_10_EXP   +4
#define CL_HALF_MAX_EXP      +16
#define CL_HALF_MIN_10_EXP   -4
#define CL_HALF_MIN_EXP      -13
#define CL_HALF_RADIX        2
#define CL_HALF_MAX          65504.0
#define CL_HALF_MIN          6.103515625e-05
#define CL_HALF_EPSILON      9.765625e-04

#define CL_DBL_DIG          15
#define CL_DBL_MANT_DIG     53
#define CL_DBL_MAX_10_EXP   +308
#define CL_DBL_MAX_EXP      +1024
#define CL_DBL_MIN_10_EXP   -307
#define CL_DBL_MIN_EXP      -1021
#define CL_DBL_RADIX        2
#define CL_DBL_MAX          179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.0
#define CL_DBL_MIN          2.225073858507201383090e-308
#define CL_DBL_EPSILON      2.220446049250313080847e-16

#define CL_M_E              2.7182818284590452354
#define CL_M_LOG2E          1.4426950408889634074
#define CL_M_LOG10E         0.43429448190325182765
#define CL_M_LN2            0.69314718055994530942
#define CL_M_LN10           2.30258509299404568402
#define CL_M_PI             3.14159265358979323846
#define CL_M_PI_2           1.57079632679489661923
#define CL_M_PI_4           0.78539816339744830962
#define CL_M_1_PI           0.31830988618379067154
#define CL_M_2_PI           0.63661977236758134308
#define CL_M_2_SQRTPI       1.12837916709551257390
#define CL_M_SQRT2          1.41421356237309504880
#define CL_M_SQRT1_2        0.70710678118654752440

#define CL_M_E_F            2.718281828
#define CL_M_LOG2E_F        1.442695041
#define CL_M_LOG10E_F       0.434294482
#define CL_M_LN2_F          0.693147181
#define CL_M_LN10_F         2.302585093
#define CL_M_PI_F           3.141592654
#define CL_M_PI_2_F         1.570796327
#define CL_M_PI_4_F         0.785398163
#define CL_M_1_PI_F         0.318309886
#define CL_M_2_PI_F         0.636619772
#define CL_M_2_SQRTPI_F     1.128379167
#define CL_M_SQRT2_F        1.414213562
#define CL_M_SQRT1_2_F      0.707106781

   #define CL_HUGE_VALF     ((cl_float) 1e50)
   #define CL_HUGE_VAL      ((cl_double) 1e500)
   float nanf( const char * );
   #define CL_NAN           nanf( "" )
#define CL_MAXFLOAT         CL_FLT_MAX
#define CL_INFINITY         CL_HUGE_VALF

#endif

#include <stddef.h>

/* Mirror types to GL types. Mirror types allow us to avoid deciding which 87s to load based on whether we are using GL or GLES here. */
typedef unsigned int cl_GLuint;
typedef int          cl_GLint;
typedef unsigned int cl_GLenum;

/*
 * Vector types
 *
 *  Note:   OpenCL requires that all types be naturally aligned.
 *          This means that vector types must be naturally aligned.
 *          For example, a vector of four floats must be aligned to
 *          a 16 byte boundary (calculated as 4 * the natural 4-byte
 *          alignment of the float).  The alignment qualifiers here
 *          will only function properly if your compiler supports them
 *          and if you don't actively work to defeat them.  For example,
 *          in order for a cl_float4 to be 16 byte aligned in a struct,
 *          the start of the struct must itself be 16-byte aligned.
 *
 *          Maintaining proper alignment is the user's responsibility.
 */


/*xxxxxxxxxxx
        typedef cl_uchar    __cl_uchar16    __attribute__((vector_size(16)));
        typedef cl_char     __cl_char16     __attribute__((vector_size(16)));
        typedef cl_ushort   __cl_ushort8    __attribute__((vector_size(16)));
        typedef cl_short    __cl_short8     __attribute__((vector_size(16)));
        typedef cl_uint     __cl_uint4      __attribute__((vector_size(16)));
        typedef cl_int      __cl_int4       __attribute__((vector_size(16)));
        typedef cl_ulong    __cl_ulong2     __attribute__((vector_size(16)));
        typedef cl_long     __cl_long2      __attribute__((vector_size(16)));
        typedef cl_double   __cl_double2    __attribute__((vector_size(16)));
*/

    #define __CL_UCHAR16__  1
    #define __CL_CHAR16__   1
    #define __CL_USHORT8__  1
    #define __CL_SHORT8__   1
    #define __CL_INT4__     1
    #define __CL_UINT4__    1
    #define __CL_ULONG2__   1
    #define __CL_LONG2__    1
    #define __CL_DOUBLE2__  1

/*xxxxxxxx
        typedef cl_uchar    __cl_uchar8     __attribute__((vector_size(8)));
        typedef cl_char     __cl_char8      __attribute__((vector_size(8)));
        typedef cl_ushort   __cl_ushort4    __attribute__((vector_size(8)));
        typedef cl_short    __cl_short4     __attribute__((vector_size(8)));
        typedef cl_uint     __cl_uint2      __attribute__((vector_size(8)));
        typedef cl_int      __cl_int2       __attribute__((vector_size(8)));
        typedef cl_ulong    __cl_ulong1     __attribute__((vector_size(8)));
        typedef cl_long     __cl_long1      __attribute__((vector_size(8)));
        typedef cl_float    __cl_float2     __attribute__((vector_size(8)));
    #define __CL_UCHAR8__   1
    #define __CL_CHAR8__    1
    #define __CL_USHORT4__  1
    #define __CL_SHORT4__   1
    #define __CL_INT2__     1
    #define __CL_UINT2__    1
    #define __CL_ULONG1__   1
    #define __CL_LONG1__    1
    #define __CL_FLOAT2__   1
        typedef cl_float    __cl_float8     __attribute__((vector_size(32)));
        typedef cl_double   __cl_double4    __attribute__((vector_size(32)));
*/

//xxxxxxxx
typedef union
{
    cl_char   s[2];

   struct{ cl_char  x, y; };
   struct{ cl_char  s0, s1; };
   struct{ cl_char  lo, hi; };
}cl_char2;

typedef union
{
    cl_char   s[4];
    struct{ cl_char  x, y, z, w; };
    struct{ cl_char  s0, s1, s2, s3; };
    struct{ cl_char2 lo, hi; };
}cl_char4;
typedef  cl_char4  cl_char3;

typedef union
{
    cl_char    s[8];
    struct{ cl_char  x, y, z, w; };
    struct{ cl_char  s0, s1, s2, s3, s4, s5, s6, s7; };
    struct{ cl_char4 lo, hi; };
}cl_char8;

typedef union
{
    cl_char   s[16];
    struct{ cl_char  x, y, z, w, __spacer4, __spacer5, __spacer6, __spacer7, __spacer8, __spacer9, sa, sb, sc, sd, se, sf; };
    struct{ cl_char  s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sA, sB, sC, sD, sE, sF; };
    struct{ cl_char8 lo, hi; };
}cl_char16;


/* ---- cl_ucharn ---- */
typedef union
{
    cl_uchar   s[2];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_uchar  x, y; };
    struct{ cl_uchar  s0, s1; };
    struct{ cl_uchar  lo, hi; };
#endif
#if defined( __cl_uchar2__)
    __cl_uchar2     v2;
#endif
}cl_uchar2;

typedef union
{
    cl_uchar   s[4];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_uchar  x, y, z, w; };
    struct{ cl_uchar  s0, s1, s2, s3; };
    struct{ cl_uchar2 lo, hi; };
#endif
#if defined( __CL_UCHAR2__)
    __cl_uchar2     v2[2];
#endif
#if defined( __CL_UCHAR4__)
    __cl_uchar4     v4;
#endif
}cl_uchar4;

/* cl_uchar3 is identical in size, alignment and behavior to cl_uchar4. See section 6.1.5. */
typedef  cl_uchar4  cl_uchar3;

typedef union
{
    cl_uchar    s[8];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_uchar  x, y, z, w; };
    struct{ cl_uchar  s0, s1, s2, s3, s4, s5, s6, s7; };
    struct{ cl_uchar4 lo, hi; };
#endif
#if defined( __CL_UCHAR2__)
    __cl_uchar2     v2[4];
#endif
#if defined( __CL_UCHAR4__)
    __cl_uchar4     v4[2];
#endif
#if defined( __CL_UCHAR8__ )
    __cl_uchar8     v8;
#endif
}cl_uchar8;

typedef union
{
    cl_uchar   s[16];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_uchar  x, y, z, w, __spacer4, __spacer5, __spacer6, __spacer7, __spacer8, __spacer9, sa, sb, sc, sd, se, sf; };
    struct{ cl_uchar  s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sA, sB, sC, sD, sE, sF; };
    struct{ cl_uchar8 lo, hi; };
#endif
#if defined( __CL_UCHAR2__)
    __cl_uchar2     v2[8];
#endif
#if defined( __CL_UCHAR4__)
    __cl_uchar4     v4[4];
#endif
#if defined( __CL_UCHAR8__ )
    __cl_uchar8     v8[2];
#endif
#if defined( __CL_UCHAR16__ )
    __cl_uchar16    v16;
#endif
}cl_uchar16;


/* ---- cl_shortn ---- */
typedef union
{
    cl_short   s[2];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_short  x, y; };
    struct{ cl_short  s0, s1; };
    struct{ cl_short  lo, hi; };
#endif
#if defined( __CL_SHORT2__)
    __cl_short2     v2;
#endif
}cl_short2;

typedef union
{
    cl_short   s[4];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_short  x, y, z, w; };
    struct{ cl_short  s0, s1, s2, s3; };
    struct{ cl_short2 lo, hi; };
#endif
#if defined( __CL_SHORT2__)
    __cl_short2     v2[2];
#endif
#if defined( __CL_SHORT4__)
    __cl_short4     v4;
#endif
}cl_short4;

/* cl_short3 is identical in size, alignment and behavior to cl_short4. See section 6.1.5. */
typedef  cl_short4  cl_short3;

typedef union
{
    cl_short    s[8];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_short  x, y, z, w; };
    struct{ cl_short  s0, s1, s2, s3, s4, s5, s6, s7; };
    struct{ cl_short4 lo, hi; };
#endif
#if defined( __CL_SHORT2__)
    __cl_short2     v2[4];
#endif
#if defined( __CL_SHORT4__)
    __cl_short4     v4[2];
#endif
#if defined( __CL_SHORT8__ )
    __cl_short8     v8;
#endif
}cl_short8;

typedef union
{
    cl_short  CL_ALIGNED(32) s[16];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_short  x, y, z, w, __spacer4, __spacer5, __spacer6, __spacer7, __spacer8, __spacer9, sa, sb, sc, sd, se, sf; };
    struct{ cl_short  s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sA, sB, sC, sD, sE, sF; };
    struct{ cl_short8 lo, hi; };
#endif
#if defined( __CL_SHORT2__)
    __cl_short2     v2[8];
#endif
#if defined( __CL_SHORT4__)
    __cl_short4     v4[4];
#endif
#if defined( __CL_SHORT8__ )
    __cl_short8     v8[2];
#endif
#if defined( __CL_SHORT16__ )
    __cl_short16    v16;
#endif
}cl_short16;


/* ---- cl_ushortn ---- */
typedef union
{
    cl_ushort   s[2];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_ushort  x, y; };
    struct{ cl_ushort  s0, s1; };
    struct{ cl_ushort  lo, hi; };
#endif
#if defined( __CL_USHORT2__)
    __cl_ushort2     v2;
#endif
}cl_ushort2;

typedef union
{
    cl_ushort   s[4];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_ushort  x, y, z, w; };
    struct{ cl_ushort  s0, s1, s2, s3; };
    struct{ cl_ushort2 lo, hi; };
#endif
#if defined( __CL_USHORT2__)
    __cl_ushort2     v2[2];
#endif
#if defined( __CL_USHORT4__)
    __cl_ushort4     v4;
#endif
}cl_ushort4;

/* cl_ushort3 is identical in size, alignment and behavior to cl_ushort4. See section 6.1.5. */
typedef  cl_ushort4  cl_ushort3;

typedef union
{
    cl_ushort    s[8];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_ushort  x, y, z, w; };
    struct{ cl_ushort  s0, s1, s2, s3, s4, s5, s6, s7; };
    struct{ cl_ushort4 lo, hi; };
#endif
#if defined( __CL_USHORT2__)
    __cl_ushort2     v2[4];
#endif
#if defined( __CL_USHORT4__)
    __cl_ushort4     v4[2];
#endif
#if defined( __CL_USHORT8__ )
    __cl_ushort8     v8;
#endif
}cl_ushort8;

typedef union
{
    cl_ushort  CL_ALIGNED(32) s[16];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_ushort  x, y, z, w, __spacer4, __spacer5, __spacer6, __spacer7, __spacer8, __spacer9, sa, sb, sc, sd, se, sf; };
    struct{ cl_ushort  s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sA, sB, sC, sD, sE, sF; };
    struct{ cl_ushort8 lo, hi; };
#endif
#if defined( __CL_USHORT2__)
    __cl_ushort2     v2[8];
#endif
#if defined( __CL_USHORT4__)
    __cl_ushort4     v4[4];
#endif
#if defined( __CL_USHORT8__ )
    __cl_ushort8     v8[2];
#endif
#if defined( __CL_USHORT16__ )
    __cl_ushort16    v16;
#endif
}cl_ushort16;


/* ---- cl_halfn ---- */
typedef union
{
    cl_half   s[2];
#if __CL_HAS_ANON_STRUCT__
     struct{ cl_half  x, y; };
     struct{ cl_half  s0, s1; };
     struct{ cl_half  lo, hi; };
#endif
#if defined( __CL_HALF2__)
    __cl_half2     v2;
#endif
}cl_half2;

typedef union
{
    cl_half   s[4];
#if __CL_HAS_ANON_STRUCT__
     struct{ cl_half  x, y, z, w; };
     struct{ cl_half  s0, s1, s2, s3; };
     struct{ cl_half2 lo, hi; };
#endif
#if defined( __CL_HALF2__)
    __cl_half2     v2[2];
#endif
#if defined( __CL_HALF4__)
    __cl_half4     v4;
#endif
}cl_half4;

/* cl_half3 is identical in size, alignment and behavior to cl_half4. See section 6.1.5. */
typedef  cl_half4  cl_half3;

typedef union
{
    cl_half    s[8];
#if __CL_HAS_ANON_STRUCT__
     struct{ cl_half  x, y, z, w; };
     struct{ cl_half  s0, s1, s2, s3, s4, s5, s6, s7; };
     struct{ cl_half4 lo, hi; };
#endif
#if defined( __CL_HALF2__)
    __cl_half2     v2[4];
#endif
#if defined( __CL_HALF4__)
    __cl_half4     v4[2];
#endif
#if defined( __CL_HALF8__ )
    __cl_half8     v8;
#endif
}cl_half8;

typedef union
{
    cl_half  CL_ALIGNED(32) s[16];
#if __CL_HAS_ANON_STRUCT__
     struct{ cl_half  x, y, z, w, __spacer4, __spacer5, __spacer6, __spacer7, __spacer8, __spacer9, sa, sb, sc, sd, se, sf; };
     struct{ cl_half  s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sA, sB, sC, sD, sE, sF; };
     struct{ cl_half8 lo, hi; };
#endif
#if defined( __CL_HALF2__)
    __cl_half2     v2[8];
#endif
#if defined( __CL_HALF4__)
    __cl_half4     v4[4];
#endif
#if defined( __CL_HALF8__ )
    __cl_half8     v8[2];
#endif
#if defined( __CL_HALF16__ )
    __cl_half16    v16;
#endif
}cl_half16;

/* ---- cl_intn ---- */
typedef union
{
    cl_int   s[2];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_int  x, y; };
    struct{ cl_int  s0, s1; };
    struct{ cl_int  lo, hi; };
#endif
#if defined( __CL_INT2__)
    __cl_int2     v2;
#endif
}cl_int2;

typedef union
{
    cl_int   s[4];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_int  x, y, z, w; };
    struct{ cl_int  s0, s1, s2, s3; };
    struct{ cl_int2 lo, hi; };
#endif
#if defined( __CL_INT2__)
    __cl_int2     v2[2];
#endif
#if defined( __CL_INT4__)
    __cl_int4     v4;
#endif
}cl_int4;

/* cl_int3 is identical in size, alignment and behavior to cl_int4. See section 6.1.5. */
typedef  cl_int4  cl_int3;

typedef union
{
    cl_int   CL_ALIGNED(32) s[8];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_int  x, y, z, w; };
    struct{ cl_int  s0, s1, s2, s3, s4, s5, s6, s7; };
    struct{ cl_int4 lo, hi; };
#endif
#if defined( __CL_INT2__)
    __cl_int2     v2[4];
#endif
#if defined( __CL_INT4__)
    __cl_int4     v4[2];
#endif
#if defined( __CL_INT8__ )
    __cl_int8     v8;
#endif
}cl_int8;

typedef union
{
    cl_int  CL_ALIGNED(64) s[16];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_int  x, y, z, w, __spacer4, __spacer5, __spacer6, __spacer7, __spacer8, __spacer9, sa, sb, sc, sd, se, sf; };
    struct{ cl_int  s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sA, sB, sC, sD, sE, sF; };
    struct{ cl_int8 lo, hi; };
#endif
#if defined( __CL_INT2__)
    __cl_int2     v2[8];
#endif
#if defined( __CL_INT4__)
    __cl_int4     v4[4];
#endif
#if defined( __CL_INT8__ )
    __cl_int8     v8[2];
#endif
#if defined( __CL_INT16__ )
    __cl_int16    v16;
#endif
}cl_int16;


/* ---- cl_uintn ---- */
typedef union
{
    cl_uint   s[2];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_uint  x, y; };
    struct{ cl_uint  s0, s1; };
    struct{ cl_uint  lo, hi; };
#endif
#if defined( __CL_UINT2__)
    __cl_uint2     v2;
#endif
}cl_uint2;

typedef union
{
    cl_uint   s[4];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_uint  x, y, z, w; };
    struct{ cl_uint  s0, s1, s2, s3; };
    struct{ cl_uint2 lo, hi; };
#endif
#if defined( __CL_UINT2__)
    __cl_uint2     v2[2];
#endif
#if defined( __CL_UINT4__)
    __cl_uint4     v4;
#endif
}cl_uint4;

/* cl_uint3 is identical in size, alignment and behavior to cl_uint4. See section 6.1.5. */
typedef  cl_uint4  cl_uint3;

typedef union
{
    cl_uint   CL_ALIGNED(32) s[8];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_uint  x, y, z, w; };
    struct{ cl_uint  s0, s1, s2, s3, s4, s5, s6, s7; };
    struct{ cl_uint4 lo, hi; };
#endif
#if defined( __CL_UINT2__)
    __cl_uint2     v2[4];
#endif
#if defined( __CL_UINT4__)
    __cl_uint4     v4[2];
#endif
#if defined( __CL_UINT8__ )
    __cl_uint8     v8;
#endif
}cl_uint8;

typedef union
{
    cl_uint  CL_ALIGNED(64) s[16];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_uint  x, y, z, w, __spacer4, __spacer5, __spacer6, __spacer7, __spacer8, __spacer9, sa, sb, sc, sd, se, sf; };
    struct{ cl_uint  s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sA, sB, sC, sD, sE, sF; };
    struct{ cl_uint8 lo, hi; };
#endif
#if defined( __CL_UINT2__)
    __cl_uint2     v2[8];
#endif
#if defined( __CL_UINT4__)
    __cl_uint4     v4[4];
#endif
#if defined( __CL_UINT8__ )
    __cl_uint8     v8[2];
#endif
#if defined( __CL_UINT16__ )
    __cl_uint16    v16;
#endif
}cl_uint16;

/* ---- cl_longn ---- */
typedef union
{
    cl_long   s[2];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_long  x, y; };
    struct{ cl_long  s0, s1; };
    struct{ cl_long  lo, hi; };
#endif
#if defined( __CL_LONG2__)
    __cl_long2     v2;
#endif
}cl_long2;

typedef union
{
    cl_long  CL_ALIGNED(32) s[4];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_long  x, y, z, w; };
    struct{ cl_long  s0, s1, s2, s3; };
    struct{ cl_long2 lo, hi; };
#endif
#if defined( __CL_LONG2__)
    __cl_long2     v2[2];
#endif
#if defined( __CL_LONG4__)
    __cl_long4     v4;
#endif
}cl_long4;

/* cl_long3 is identical in size, alignment and behavior to cl_long4. See section 6.1.5. */
typedef  cl_long4  cl_long3;

typedef union
{
    cl_long   CL_ALIGNED(64) s[8];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_long  x, y, z, w; };
    struct{ cl_long  s0, s1, s2, s3, s4, s5, s6, s7; };
    struct{ cl_long4 lo, hi; };
#endif
#if defined( __CL_LONG2__)
    __cl_long2     v2[4];
#endif
#if defined( __CL_LONG4__)
    __cl_long4     v4[2];
#endif
#if defined( __CL_LONG8__ )
    __cl_long8     v8;
#endif
}cl_long8;

typedef union
{
    cl_long  CL_ALIGNED(128) s[16];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_long  x, y, z, w, __spacer4, __spacer5, __spacer6, __spacer7, __spacer8, __spacer9, sa, sb, sc, sd, se, sf; };
    struct{ cl_long  s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sA, sB, sC, sD, sE, sF; };
    struct{ cl_long8 lo, hi; };
#endif
#if defined( __CL_LONG2__)
    __cl_long2     v2[8];
#endif
#if defined( __CL_LONG4__)
    __cl_long4     v4[4];
#endif
#if defined( __CL_LONG8__ )
    __cl_long8     v8[2];
#endif
#if defined( __CL_LONG16__ )
    __cl_long16    v16;
#endif
}cl_long16;


/* ---- cl_ulongn ---- */
typedef union
{
    cl_ulong   s[2];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_ulong  x, y; };
    struct{ cl_ulong  s0, s1; };
    struct{ cl_ulong  lo, hi; };
#endif
#if defined( __CL_ULONG2__)
    __cl_ulong2     v2;
#endif
}cl_ulong2;

typedef union
{
    cl_ulong  CL_ALIGNED(32) s[4];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_ulong  x, y, z, w; };
    struct{ cl_ulong  s0, s1, s2, s3; };
    struct{ cl_ulong2 lo, hi; };
#endif
#if defined( __CL_ULONG2__)
    __cl_ulong2     v2[2];
#endif
#if defined( __CL_ULONG4__)
    __cl_ulong4     v4;
#endif
}cl_ulong4;

/* cl_ulong3 is identical in size, alignment and behavior to cl_ulong4. See section 6.1.5. */
typedef  cl_ulong4  cl_ulong3;

typedef union
{
    cl_ulong   CL_ALIGNED(64) s[8];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_ulong  x, y, z, w; };
    struct{ cl_ulong  s0, s1, s2, s3, s4, s5, s6, s7; };
    struct{ cl_ulong4 lo, hi; };
#endif
#if defined( __CL_ULONG2__)
    __cl_ulong2     v2[4];
#endif
#if defined( __CL_ULONG4__)
    __cl_ulong4     v4[2];
#endif
#if defined( __CL_ULONG8__ )
    __cl_ulong8     v8;
#endif
}cl_ulong8;

typedef union
{
    cl_ulong  CL_ALIGNED(128) s[16];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_ulong  x, y, z, w, __spacer4, __spacer5, __spacer6, __spacer7, __spacer8, __spacer9, sa, sb, sc, sd, se, sf; };
    struct{ cl_ulong  s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sA, sB, sC, sD, sE, sF; };
    struct{ cl_ulong8 lo, hi; };
#endif
#if defined( __CL_ULONG2__)
    __cl_ulong2     v2[8];
#endif
#if defined( __CL_ULONG4__)
    __cl_ulong4     v4[4];
#endif
#if defined( __CL_ULONG8__ )
    __cl_ulong8     v8[2];
#endif
#if defined( __CL_ULONG16__ )
    __cl_ulong16    v16;
#endif
}cl_ulong16;


/* --- cl_floatn ---- */

typedef union
{
    cl_float   s[2];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_float  x, y; };
    struct{ cl_float  s0, s1; };
    struct{ cl_float  lo, hi; };
#endif
#if defined( __CL_FLOAT2__)
    __cl_float2     v2;
#endif
}cl_float2;

typedef union
{
    cl_float   s[4];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_float   x, y, z, w; };
    struct{ cl_float   s0, s1, s2, s3; };
    struct{ cl_float2  lo, hi; };
#endif
#if defined( __CL_FLOAT2__)
    __cl_float2     v2[2];
#endif
#if defined( __CL_FLOAT4__)
    __cl_float4     v4;
#endif
}cl_float4;

/* cl_float3 is identical in size, alignment and behavior to cl_float4. See section 6.1.5. */
typedef  cl_float4  cl_float3;

typedef union
{
    cl_float   CL_ALIGNED(32) s[8];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_float   x, y, z, w; };
    struct{ cl_float   s0, s1, s2, s3, s4, s5, s6, s7; };
    struct{ cl_float4  lo, hi; };
#endif
#if defined( __CL_FLOAT2__)
    __cl_float2     v2[4];
#endif
#if defined( __CL_FLOAT4__)
    __cl_float4     v4[2];
#endif
#if defined( __CL_FLOAT8__ )
    __cl_float8     v8;
#endif
}cl_float8;

typedef union
{
    cl_float  CL_ALIGNED(64) s[16];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_float  x, y, z, w, __spacer4, __spacer5, __spacer6, __spacer7, __spacer8, __spacer9, sa, sb, sc, sd, se, sf; };
    struct{ cl_float  s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sA, sB, sC, sD, sE, sF; };
    struct{ cl_float8 lo, hi; };
#endif
#if defined( __CL_FLOAT2__)
    __cl_float2     v2[8];
#endif
#if defined( __CL_FLOAT4__)
    __cl_float4     v4[4];
#endif
#if defined( __CL_FLOAT8__ )
    __cl_float8     v8[2];
#endif
#if defined( __CL_FLOAT16__ )
    __cl_float16    v16;
#endif
}cl_float16;

/* --- cl_doublen ---- */

typedef union
{
    cl_double   s[2];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_double  x, y; };
    struct{ cl_double s0, s1; };
    struct{ cl_double lo, hi; };
#endif
#if defined( __CL_DOUBLE2__)
    __cl_double2     v2;
#endif
}cl_double2;

typedef union
{
    cl_double  CL_ALIGNED(32) s[4];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_double  x, y, z, w; };
    struct{ cl_double  s0, s1, s2, s3; };
    struct{ cl_double2 lo, hi; };
#endif
#if defined( __CL_DOUBLE2__)
    __cl_double2     v2[2];
#endif
#if defined( __CL_DOUBLE4__)
    __cl_double4     v4;
#endif
}cl_double4;

/* cl_double3 is identical in size, alignment and behavior to cl_double4. See section 6.1.5. */
typedef  cl_double4  cl_double3;

typedef union
{
    cl_double   CL_ALIGNED(64) s[8];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_double  x, y, z, w; };
    struct{ cl_double  s0, s1, s2, s3, s4, s5, s6, s7; };
    struct{ cl_double4 lo, hi; };
#endif
#if defined( __CL_DOUBLE2__)
    __cl_double2     v2[4];
#endif
#if defined( __CL_DOUBLE4__)
    __cl_double4     v4[2];
#endif
#if defined( __CL_DOUBLE8__ )
    __cl_double8     v8;
#endif
}cl_double8;

typedef union
{
    cl_double  CL_ALIGNED(128) s[16];
#if __CL_HAS_ANON_STRUCT__
    struct{ cl_double  x, y, z, w, __spacer4, __spacer5, __spacer6, __spacer7, __spacer8, __spacer9, sa, sb, sc, sd, se, sf; };
    struct{ cl_double  s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sA, sB, sC, sD, sE, sF; };
    struct{ cl_double8 lo, hi; };
#endif
#if defined( __CL_DOUBLE2__)
    __cl_double2     v2[8];
#endif
#if defined( __CL_DOUBLE4__)
    __cl_double4     v4[4];
#endif
#if defined( __CL_DOUBLE8__ )
    __cl_double8     v8[2];
#endif
#if defined( __CL_DOUBLE16__ )
    __cl_double16    v16;
#endif
}cl_double16;

/* Macro to facilitate debugging
 * Usage:
 *   Place CL_PROGRAM_STRING_DEBUG_INFO on the line before the first line of your source.
 *   The first line ends with:   CL_PROGRAM_STRING_DEBUG_INFO \"
 *   Each line thereafter of OpenCL C source must end with: \n\
 *   The last line ends in ";
 *
 *   Example:
 *
 *   const char *my_program = CL_PROGRAM_STRING_DEBUG_INFO "\
 *   kernel void foo( int a, float * b )             \n\
 *   {                                               \n\
 *      // my comment                                \n\
 *      *b[ get_global_id(0)] = a;                   \n\
 *   }                                               \n\
 *   ";
 *
 * This should correctly set up the line, (column) and file information for your source
 * string so you can do source level debugging.
 */
#define  __CL_STRINGIFY( _x )               # _x
#define  _CL_STRINGIFY( _x )                __CL_STRINGIFY( _x )
#define  CL_PROGRAM_STRING_DEBUG_INFO       "#line "  _CL_STRINGIFY(__LINE__) " \"" __FILE__ "\" \n\n"

#ifdef __cplusplus
}
#endif

#if defined(_WIN32) && defined(_MSC_VER) && __CL_HAS_ANON_STRUCT__
    #pragma warning( pop )
#endif

#endif  /* __CL_PLATFORM_H  */
