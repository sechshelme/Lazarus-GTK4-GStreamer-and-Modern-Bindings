
unit cl_platform;
interface

{
  Automatically converted by H2Pas 1.0.0 from cl_platform.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cl_platform.h
}

    { Pointers to basic pascal types, inserted by h2pas conversion program.}
    Type
      PLongint  = ^Longint;
      PSmallInt = ^SmallInt;
      PByte     = ^Byte;
      PWord     = ^Word;
      PDWord    = ^DWord;
      PDouble   = ^Double;

    Type
    Pchar  = ^char;
    Pcl_char  = ^cl_char;
    Pcl_char16  = ^cl_char16;
    Pcl_char3  = ^cl_char3;
    Pcl_char4  = ^cl_char4;
    Pcl_double  = ^cl_double;
    Pcl_double16  = ^cl_double16;
    Pcl_double3  = ^cl_double3;
    Pcl_double4  = ^cl_double4;
    Pcl_float  = ^cl_float;
    Pcl_float16  = ^cl_float16;
    Pcl_float3  = ^cl_float3;
    Pcl_float4  = ^cl_float4;
    Pcl_GLenum  = ^cl_GLenum;
    Pcl_GLint  = ^cl_GLint;
    Pcl_GLuint  = ^cl_GLuint;
    Pcl_half  = ^cl_half;
    Pcl_half16  = ^cl_half16;
    Pcl_half3  = ^cl_half3;
    Pcl_half4  = ^cl_half4;
    Pcl_int  = ^cl_int;
    Pcl_int16  = ^cl_int16;
    Pcl_int3  = ^cl_int3;
    Pcl_int4  = ^cl_int4;
    Pcl_long  = ^cl_long;
    Pcl_long16  = ^cl_long16;
    Pcl_long3  = ^cl_long3;
    Pcl_long4  = ^cl_long4;
    Pcl_short  = ^cl_short;
    Pcl_short16  = ^cl_short16;
    Pcl_short3  = ^cl_short3;
    Pcl_short4  = ^cl_short4;
    Pcl_uchar  = ^cl_uchar;
    Pcl_uchar16  = ^cl_uchar16;
    Pcl_uchar3  = ^cl_uchar3;
    Pcl_uchar4  = ^cl_uchar4;
    Pcl_uint  = ^cl_uint;
    Pcl_uint16  = ^cl_uint16;
    Pcl_uint3  = ^cl_uint3;
    Pcl_uint4  = ^cl_uint4;
    Pcl_ulong  = ^cl_ulong;
    Pcl_ulong16  = ^cl_ulong16;
    Pcl_ulong3  = ^cl_ulong3;
    Pcl_ulong4  = ^cl_ulong4;
    Pcl_ushort  = ^cl_ushort;
    Pcl_ushort16  = ^cl_ushort16;
    Pcl_ushort3  = ^cl_ushort3;
    Pcl_ushort4  = ^cl_ushort4;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{******************************************************************************
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
 ***************************************************************************** }
{$ifndef __CL_PLATFORM_H}
{$define __CL_PLATFORM_H}
{$include <CL/cl_version.h>}
{ C++ extern C conditionnal removed }
{ scalar types   }
type
  Pcl_char = ^Tcl_char;
  Tcl_char = shortint;

  Pcl_uchar = ^Tcl_uchar;
  Tcl_uchar = byte;

  Pcl_short = ^Tcl_short;
  Tcl_short = smallint;

  Pcl_ushort = ^Tcl_ushort;
  Tcl_ushort = word;

  Pcl_int = ^Tcl_int;
  Tcl_int = longint;

  Pcl_uint = ^Tcl_uint;
  Tcl_uint = dword;

  Pcl_long = ^Tcl_long;
  Tcl_long = int64;

  Pcl_ulong = ^Tcl_ulong;
  Tcl_ulong = qword;

  Pcl_half = ^Tcl_half;
  Tcl_half = word;

  Pcl_float = ^Tcl_float;
  Tcl_float = single;

  Pcl_double = ^Tcl_double;
  Tcl_double = Tdouble;
{$if defined(__clang__)}
(** unsupported pragma#pragma clang diagnostic pop*)
{$endif}
{ Macro names and corresponding values defined by OpenCL  }

const
  CL_CHAR_BIT = 8;  
  CL_SCHAR_MAX = 127;  
  CL_SCHAR_MIN = (-(127))-1;  
  CL_CHAR_MAX = CL_SCHAR_MAX;  
  CL_CHAR_MIN = CL_SCHAR_MIN;  
  CL_UCHAR_MAX = 255;  
  CL_SHRT_MAX = 32767;  
  CL_SHRT_MIN = (-(32767))-1;  
  CL_USHRT_MAX = 65535;  
  CL_INT_MAX = 2147483647;  
  CL_INT_MIN = (-(2147483647))-1;  
  CL_UINT_MAX = $ffffffff;  

{ was #define dname def_expr }
function CL_LONG_MAX : Tcl_long;  

{ was #define dname def_expr }
function CL_LONG_MIN : longint; { return type might be wrong }

{ was #define dname def_expr }
function CL_ULONG_MAX : Tcl_ulong;  

const
  CL_FLT_DIG = 6;  
  CL_FLT_MANT_DIG = 24;  

{ was #define dname def_expr }
function CL_FLT_MAX_10_EXP : longint; { return type might be wrong }

{ was #define dname def_expr }
function CL_FLT_MAX_EXP : longint; { return type might be wrong }

const
  CL_FLT_MIN_10_EXP = -(37);  
  CL_FLT_MIN_EXP = -(125);  
  CL_FLT_RADIX = 2;  
  CL_FLT_MAX = 340282346638528859811704183484516925440.0;  
  CL_FLT_MIN = 1.175494350822287507969e-38;  
  CL_FLT_EPSILON = 1.1920928955078125e-7;  
  CL_HALF_DIG = 3;  
  CL_HALF_MANT_DIG = 11;  

{ was #define dname def_expr }
function CL_HALF_MAX_10_EXP : longint; { return type might be wrong }

{ was #define dname def_expr }
function CL_HALF_MAX_EXP : longint; { return type might be wrong }

const
  CL_HALF_MIN_10_EXP = -(4);  
  CL_HALF_MIN_EXP = -(13);  
  CL_HALF_RADIX = 2;  
  CL_HALF_MAX = 65504.0;  
  CL_HALF_MIN = 6.103515625e-05;  
  CL_HALF_EPSILON = 9.765625e-04;  
  CL_DBL_DIG = 15;  
  CL_DBL_MANT_DIG = 53;  

{ was #define dname def_expr }
function CL_DBL_MAX_10_EXP : longint; { return type might be wrong }

{ was #define dname def_expr }
function CL_DBL_MAX_EXP : longint; { return type might be wrong }

const
  CL_DBL_MIN_10_EXP = -(307);  
  CL_DBL_MIN_EXP = -(1021);  
  CL_DBL_RADIX = 2;  
  CL_DBL_MAX = 1.7976931348623158e+308;  
  CL_DBL_MIN = 2.225073858507201383090e-308;  
  CL_DBL_EPSILON = 2.220446049250313080847e-16;  
  CL_M_E = 2.7182818284590452354;  
  CL_M_LOG2E = 1.4426950408889634074;  
  CL_M_LOG10E = 0.43429448190325182765;  
  CL_M_LN2 = 0.69314718055994530942;  
  CL_M_LN10 = 2.30258509299404568402;  
  CL_M_PI = 3.14159265358979323846;  
  CL_M_PI_2 = 1.57079632679489661923;  
  CL_M_PI_4 = 0.78539816339744830962;  
  CL_M_1_PI = 0.31830988618379067154;  
  CL_M_2_PI = 0.63661977236758134308;  
  CL_M_2_SQRTPI = 1.12837916709551257390;  
  CL_M_SQRT2 = 1.41421356237309504880;  
  CL_M_SQRT1_2 = 0.70710678118654752440;  
  CL_M_E_F = 2.718281828;  
  CL_M_LOG2E_F = 1.442695041;  
  CL_M_LOG10E_F = 0.434294482;  
  CL_M_LN2_F = 0.693147181;  
  CL_M_LN10_F = 2.302585093;  
  CL_M_PI_F = 3.141592654;  
  CL_M_PI_2_F = 1.570796327;  
  CL_M_PI_4_F = 0.785398163;  
  CL_M_1_PI_F = 0.318309886;  
  CL_M_2_PI_F = 0.636619772;  
  CL_M_2_SQRTPI_F = 1.128379167;  
  CL_M_SQRT2_F = 1.414213562;  
  CL_M_SQRT1_2_F = 0.707106781;  
  CL_NAN = CL_INFINITY-CL_INFINITY;  

{ was #define dname def_expr }
function CL_HUGE_VALF : Tcl_float;  

{ was #define dname def_expr }
function CL_HUGE_VAL : Tcl_double;  

const
  CL_MAXFLOAT = CL_FLT_MAX;  
  CL_INFINITY = CL_HUGE_VALF;  
{$else}
{$include <stdint.h>}
{ scalar types   }
type
  Pcl_char = ^Tcl_char;
  Tcl_char = Tint8_t;

  Pcl_uchar = ^Tcl_uchar;
  Tcl_uchar = Tuint8_t;

  Pcl_short = ^Tcl_short;
  Tcl_short = Tint16_t;

  Pcl_ushort = ^Tcl_ushort;
  Tcl_ushort = Tuint16_t;

  Pcl_int = ^Tcl_int;
  Tcl_int = Tint32_t;

  Pcl_uint = ^Tcl_uint;
  Tcl_uint = Tuint32_t;

  Pcl_long = ^Tcl_long;
  Tcl_long = Tint64_t;

  Pcl_ulong = ^Tcl_ulong;
  Tcl_ulong = Tuint64_t;

  Pcl_half = ^Tcl_half;
  Tcl_half = Tuint16_t;

  Pcl_float = ^Tcl_float;
  Tcl_float = single;

  Pcl_double = ^Tcl_double;
  Tcl_double = Tdouble;
{ Macro names and corresponding values defined by OpenCL  }

const
  CL_CHAR_BIT = 8;  
  CL_SCHAR_MAX = 127;  
  CL_SCHAR_MIN = (-(127))-1;  
  CL_CHAR_MAX = CL_SCHAR_MAX;  
  CL_CHAR_MIN = CL_SCHAR_MIN;  
  CL_UCHAR_MAX = 255;  
  CL_SHRT_MAX = 32767;  
  CL_SHRT_MIN = (-(32767))-1;  
  CL_USHRT_MAX = 65535;  
  CL_INT_MAX = 2147483647;  
  CL_INT_MIN = (-(2147483647))-1;  
  CL_UINT_MAX = $ffffffff;  

{ was #define dname def_expr }
function CL_LONG_MAX : Tcl_long;  

{ was #define dname def_expr }
function CL_LONG_MIN : longint; { return type might be wrong }

{ was #define dname def_expr }
function CL_ULONG_MAX : Tcl_ulong;  

const
  CL_FLT_DIG = 6;  
  CL_FLT_MANT_DIG = 24;  

{ was #define dname def_expr }
function CL_FLT_MAX_10_EXP : longint; { return type might be wrong }

{ was #define dname def_expr }
function CL_FLT_MAX_EXP : longint; { return type might be wrong }

const
  CL_FLT_MIN_10_EXP = -(37);  
  CL_FLT_MIN_EXP = -(125);  
  CL_FLT_RADIX = 2;  
  CL_FLT_MAX = 340282346638528859811704183484516925440.0;  
  CL_FLT_MIN = 1.175494350822287507969e-38;  
  CL_FLT_EPSILON = 1.1920928955078125e-7;  
  CL_HALF_DIG = 3;  
  CL_HALF_MANT_DIG = 11;  

{ was #define dname def_expr }
function CL_HALF_MAX_10_EXP : longint; { return type might be wrong }

{ was #define dname def_expr }
function CL_HALF_MAX_EXP : longint; { return type might be wrong }

const
  CL_HALF_MIN_10_EXP = -(4);  
  CL_HALF_MIN_EXP = -(13);  
  CL_HALF_RADIX = 2;  
  CL_HALF_MAX = 65504.0;  
  CL_HALF_MIN = 6.103515625e-05;  
  CL_HALF_EPSILON = 9.765625e-04;  
  CL_DBL_DIG = 15;  
  CL_DBL_MANT_DIG = 53;  

{ was #define dname def_expr }
function CL_DBL_MAX_10_EXP : longint; { return type might be wrong }

{ was #define dname def_expr }
function CL_DBL_MAX_EXP : longint; { return type might be wrong }

const
  CL_DBL_MIN_10_EXP = -(307);  
  CL_DBL_MIN_EXP = -(1021);  
  CL_DBL_RADIX = 2;  
  CL_DBL_MAX = 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797;  
  CL_DBL_MIN = 2.225073858507201383090e-308;  
  CL_DBL_EPSILON = 2.220446049250313080847e-16;  
  CL_M_E = 2.7182818284590452354;  
  CL_M_LOG2E = 1.4426950408889634074;  
  CL_M_LOG10E = 0.43429448190325182765;  
  CL_M_LN2 = 0.69314718055994530942;  
  CL_M_LN10 = 2.30258509299404568402;  
  CL_M_PI = 3.14159265358979323846;  
  CL_M_PI_2 = 1.57079632679489661923;  
  CL_M_PI_4 = 0.78539816339744830962;  
  CL_M_1_PI = 0.31830988618379067154;  
  CL_M_2_PI = 0.63661977236758134308;  
  CL_M_2_SQRTPI = 1.12837916709551257390;  
  CL_M_SQRT2 = 1.41421356237309504880;  
  CL_M_SQRT1_2 = 0.70710678118654752440;  
  CL_M_E_F = 2.718281828;  
  CL_M_LOG2E_F = 1.442695041;  
  CL_M_LOG10E_F = 0.434294482;  
  CL_M_LN2_F = 0.693147181;  
  CL_M_LN10_F = 2.302585093;  
  CL_M_PI_F = 3.141592654;  
  CL_M_PI_2_F = 1.570796327;  
  CL_M_PI_4_F = 0.785398163;  
  CL_M_1_PI_F = 0.318309886;  
  CL_M_2_PI_F = 0.636619772;  
  CL_M_2_SQRTPI_F = 1.128379167;  
  CL_M_SQRT2_F = 1.414213562;  
  CL_M_SQRT1_2_F = 0.707106781;  

{ was #define dname def_expr }
function CL_HUGE_VALF : Tcl_float;  

{ was #define dname def_expr }
function CL_HUGE_VAL : Tcl_double;  

(* Const before type ignored *)
function nanf(para1:Pchar):single;cdecl;external;
{ was #define dname def_expr }
function CL_NAN : longint; { return type might be wrong }

const
  CL_MAXFLOAT = CL_FLT_MAX;  
  CL_INFINITY = CL_HUGE_VALF;  
{$endif}
{$include <stddef.h>}
{ Mirror types to GL types. Mirror types allow us to avoid deciding which 87s to load based on whether we are using GL or GLES here.  }
type
  Pcl_GLuint = ^Tcl_GLuint;
  Tcl_GLuint = dword;

  Pcl_GLint = ^Tcl_GLint;
  Tcl_GLint = longint;

  Pcl_GLenum = ^Tcl_GLenum;
  Tcl_GLenum = dword;
{
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
  }
{xxxxxxxxxxx
        typedef cl_uchar    __cl_uchar16    __attribute__((vector_size(16)));
        typedef cl_char     __cl_char16     __attribute__((vector_size(16)));
        typedef cl_ushort   __cl_ushort8    __attribute__((vector_size(16)));
        typedef cl_short    __cl_short8     __attribute__((vector_size(16)));
        typedef cl_uint     __cl_uint4      __attribute__((vector_size(16)));
        typedef cl_int      __cl_int4       __attribute__((vector_size(16)));
        typedef cl_ulong    __cl_ulong2     __attribute__((vector_size(16)));
        typedef cl_long     __cl_long2      __attribute__((vector_size(16)));
        typedef cl_double   __cl_double2    __attribute__((vector_size(16)));
 }

const
  __CL_UCHAR16__ = 1;  
  __CL_CHAR16__ = 1;  
  __CL_USHORT8__ = 1;  
  __CL_SHORT8__ = 1;  
  __CL_INT4__ = 1;  
  __CL_UINT4__ = 1;  
  __CL_ULONG2__ = 1;  
  __CL_LONG2__ = 1;  
  __CL_DOUBLE2__ = 1;  
{xxxxxxxx
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
 }
{xxxxxxxx }
(* error 
   struct{ cl_char  x, y; };
 in member_list *)
(* error 
   struct{ cl_char  s0, s1; };
 in member_list *)
(* error 
   struct{ cl_char  lo, hi; };
 in member_list *)
(* error 
typedef union
 in member_list *)
(* error 
    struct{ cl_char  x, y, z, w; };
 in member_list *)
(* error 
    struct{ cl_char  s0, s1, s2, s3; };
 in member_list *)
(* error 
    struct{ cl_char2 lo, hi; };
 in member_list *)
type
  Pcl_char4 = ^Tcl_char4;
  Tcl_char4 = record
      case longint of
      end;

  Pcl_char3 = ^Tcl_char3;
  Tcl_char3 = Tcl_char4;
(* error 
    struct{ cl_char  x, y, z, w; };
 in member_list *)
(* error 
    struct{ cl_char  s0, s1, s2, s3, s4, s5, s6, s7; };
 in member_list *)
(* error 
    struct{ cl_char4 lo, hi; };
 in member_list *)
(* error 
typedef union
 in member_list *)
(* error 
    struct{ cl_char  x, y, z, w, __spacer4, __spacer5, __spacer6, __spacer7, __spacer8, __spacer9, sa, sb, sc, sd, se, sf; };
 in member_list *)
(* error 
    struct{ cl_char  s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sA, sB, sC, sD, sE, sF; };
 in member_list *)
(* error 
    struct{ cl_char8 lo, hi; };
 in member_list *)

  Pcl_char16 = ^Tcl_char16;
  Tcl_char16 = record
      case longint of
      end;
{ ---- cl_ucharn ----  }
{$if __CL_HAS_ANON_STRUCT__}
(* error 
    struct{ cl_uchar  x, y; };
 in member_list *)
(* error 
    struct{ cl_uchar  s0, s1; };
 in member_list *)
(* error 
    struct{ cl_uchar  lo, hi; };
{$endif}
{$if defined( __cl_uchar2__)}
{$endif}
 in member_list *)
(* error 
typedef union
{$if __CL_HAS_ANON_STRUCT__}
 in member_list *)
(* error 
    struct{ cl_uchar  x, y, z, w; };
 in member_list *)
(* error 
    struct{ cl_uchar  s0, s1, s2, s3; };
 in member_list *)
(* error 
    struct{ cl_uchar2 lo, hi; };
{$endif}
{$if defined( __CL_UCHAR2__)}
{$endif}
{$if defined( __CL_UCHAR4__)}
{$endif}
 in member_list *)
type
  Pcl_uchar4 = ^Tcl_uchar4;
  Tcl_uchar4 = record
      case longint of
      end;
{ cl_uchar3 is identical in size, alignment and behavior to cl_uchar4. See section 6.1.5.  }

  Pcl_uchar3 = ^Tcl_uchar3;
  Tcl_uchar3 = Tcl_uchar4;
{$if __CL_HAS_ANON_STRUCT__}
(* error 
    struct{ cl_uchar  x, y, z, w; };
 in member_list *)
(* error 
    struct{ cl_uchar  s0, s1, s2, s3, s4, s5, s6, s7; };
 in member_list *)
(* error 
    struct{ cl_uchar4 lo, hi; };
{$endif}
{$if defined( __CL_UCHAR2__)}
{$endif}
{$if defined( __CL_UCHAR4__)}
{$endif}
{$if defined( __CL_UCHAR8__ )}
{$endif}
 in member_list *)
(* error 
typedef union
{$if __CL_HAS_ANON_STRUCT__}
 in member_list *)
(* error 
    struct{ cl_uchar  x, y, z, w, __spacer4, __spacer5, __spacer6, __spacer7, __spacer8, __spacer9, sa, sb, sc, sd, se, sf; };
 in member_list *)
(* error 
    struct{ cl_uchar  s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sA, sB, sC, sD, sE, sF; };
 in member_list *)
(* error 
    struct{ cl_uchar8 lo, hi; };
{$endif}
{$if defined( __CL_UCHAR2__)}
{$endif}
{$if defined( __CL_UCHAR4__)}
{$endif}
{$if defined( __CL_UCHAR8__ )}
{$endif}
{$if defined( __CL_UCHAR16__ )}
{$endif}
 in member_list *)
type
  Pcl_uchar16 = ^Tcl_uchar16;
  Tcl_uchar16 = record
      case longint of
      end;
{ ---- cl_shortn ----  }
{$if __CL_HAS_ANON_STRUCT__}
(* error 
    struct{ cl_short  x, y; };
 in member_list *)
(* error 
    struct{ cl_short  s0, s1; };
 in member_list *)
(* error 
    struct{ cl_short  lo, hi; };
{$endif}
{$if defined( __CL_SHORT2__)}
{$endif}
 in member_list *)
(* error 
typedef union
{$if __CL_HAS_ANON_STRUCT__}
 in member_list *)
(* error 
    struct{ cl_short  x, y, z, w; };
 in member_list *)
(* error 
    struct{ cl_short  s0, s1, s2, s3; };
 in member_list *)
(* error 
    struct{ cl_short2 lo, hi; };
{$endif}
{$if defined( __CL_SHORT2__)}
{$endif}
{$if defined( __CL_SHORT4__)}
{$endif}
 in member_list *)
type
  Pcl_short4 = ^Tcl_short4;
  Tcl_short4 = record
      case longint of
      end;
{ cl_short3 is identical in size, alignment and behavior to cl_short4. See section 6.1.5.  }

  Pcl_short3 = ^Tcl_short3;
  Tcl_short3 = Tcl_short4;
{$if __CL_HAS_ANON_STRUCT__}
(* error 
    struct{ cl_short  x, y, z, w; };
 in member_list *)
(* error 
    struct{ cl_short  s0, s1, s2, s3, s4, s5, s6, s7; };
 in member_list *)
(* error 
    struct{ cl_short4 lo, hi; };
{$endif}
{$if defined( __CL_SHORT2__)}
{$endif}
{$if defined( __CL_SHORT4__)}
{$endif}
{$if defined( __CL_SHORT8__ )}
{$endif}
 in member_list *)
(* error 
typedef union
{$if __CL_HAS_ANON_STRUCT__}
 in member_list *)
(* error 
    struct{ cl_short  x, y, z, w, __spacer4, __spacer5, __spacer6, __spacer7, __spacer8, __spacer9, sa, sb, sc, sd, se, sf; };
 in member_list *)
(* error 
    struct{ cl_short  s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sA, sB, sC, sD, sE, sF; };
 in member_list *)
(* error 
    struct{ cl_short8 lo, hi; };
{$endif}
{$if defined( __CL_SHORT2__)}
{$endif}
{$if defined( __CL_SHORT4__)}
{$endif}
{$if defined( __CL_SHORT8__ )}
{$endif}
{$if defined( __CL_SHORT16__ )}
{$endif}
 in member_list *)
type
  Pcl_short16 = ^Tcl_short16;
  Tcl_short16 = record
      case longint of
      end;
{ ---- cl_ushortn ----  }
{$if __CL_HAS_ANON_STRUCT__}
(* error 
    struct{ cl_ushort  x, y; };
 in member_list *)
(* error 
    struct{ cl_ushort  s0, s1; };
 in member_list *)
(* error 
    struct{ cl_ushort  lo, hi; };
{$endif}
{$if defined( __CL_USHORT2__)}
{$endif}
 in member_list *)
(* error 
typedef union
{$if __CL_HAS_ANON_STRUCT__}
 in member_list *)
(* error 
    struct{ cl_ushort  x, y, z, w; };
 in member_list *)
(* error 
    struct{ cl_ushort  s0, s1, s2, s3; };
 in member_list *)
(* error 
    struct{ cl_ushort2 lo, hi; };
{$endif}
{$if defined( __CL_USHORT2__)}
{$endif}
{$if defined( __CL_USHORT4__)}
{$endif}
 in member_list *)
type
  Pcl_ushort4 = ^Tcl_ushort4;
  Tcl_ushort4 = record
      case longint of
      end;
{ cl_ushort3 is identical in size, alignment and behavior to cl_ushort4. See section 6.1.5.  }

  Pcl_ushort3 = ^Tcl_ushort3;
  Tcl_ushort3 = Tcl_ushort4;
{$if __CL_HAS_ANON_STRUCT__}
(* error 
    struct{ cl_ushort  x, y, z, w; };
 in member_list *)
(* error 
    struct{ cl_ushort  s0, s1, s2, s3, s4, s5, s6, s7; };
 in member_list *)
(* error 
    struct{ cl_ushort4 lo, hi; };
{$endif}
{$if defined( __CL_USHORT2__)}
{$endif}
{$if defined( __CL_USHORT4__)}
{$endif}
{$if defined( __CL_USHORT8__ )}
{$endif}
 in member_list *)
(* error 
typedef union
{$if __CL_HAS_ANON_STRUCT__}
 in member_list *)
(* error 
    struct{ cl_ushort  x, y, z, w, __spacer4, __spacer5, __spacer6, __spacer7, __spacer8, __spacer9, sa, sb, sc, sd, se, sf; };
 in member_list *)
(* error 
    struct{ cl_ushort  s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sA, sB, sC, sD, sE, sF; };
 in member_list *)
(* error 
    struct{ cl_ushort8 lo, hi; };
{$endif}
{$if defined( __CL_USHORT2__)}
{$endif}
{$if defined( __CL_USHORT4__)}
{$endif}
{$if defined( __CL_USHORT8__ )}
{$endif}
{$if defined( __CL_USHORT16__ )}
{$endif}
 in member_list *)
type
  Pcl_ushort16 = ^Tcl_ushort16;
  Tcl_ushort16 = record
      case longint of
      end;
{ ---- cl_halfn ----  }
{$if __CL_HAS_ANON_STRUCT__}
(* error 
     struct{ cl_half  x, y; };
 in member_list *)
(* error 
     struct{ cl_half  s0, s1; };
 in member_list *)
(* error 
     struct{ cl_half  lo, hi; };
{$endif}
{$if defined( __CL_HALF2__)}
{$endif}
 in member_list *)
(* error 
typedef union
{$if __CL_HAS_ANON_STRUCT__}
 in member_list *)
(* error 
     struct{ cl_half  x, y, z, w; };
 in member_list *)
(* error 
     struct{ cl_half  s0, s1, s2, s3; };
 in member_list *)
(* error 
     struct{ cl_half2 lo, hi; };
{$endif}
{$if defined( __CL_HALF2__)}
{$endif}
{$if defined( __CL_HALF4__)}
{$endif}
 in member_list *)
type
  Pcl_half4 = ^Tcl_half4;
  Tcl_half4 = record
      case longint of
      end;
{ cl_half3 is identical in size, alignment and behavior to cl_half4. See section 6.1.5.  }

  Pcl_half3 = ^Tcl_half3;
  Tcl_half3 = Tcl_half4;
{$if __CL_HAS_ANON_STRUCT__}
(* error 
     struct{ cl_half  x, y, z, w; };
 in member_list *)
(* error 
     struct{ cl_half  s0, s1, s2, s3, s4, s5, s6, s7; };
 in member_list *)
(* error 
     struct{ cl_half4 lo, hi; };
{$endif}
{$if defined( __CL_HALF2__)}
{$endif}
{$if defined( __CL_HALF4__)}
{$endif}
{$if defined( __CL_HALF8__ )}
{$endif}
 in member_list *)
(* error 
typedef union
{$if __CL_HAS_ANON_STRUCT__}
 in member_list *)
(* error 
     struct{ cl_half  x, y, z, w, __spacer4, __spacer5, __spacer6, __spacer7, __spacer8, __spacer9, sa, sb, sc, sd, se, sf; };
 in member_list *)
(* error 
     struct{ cl_half  s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sA, sB, sC, sD, sE, sF; };
 in member_list *)
(* error 
     struct{ cl_half8 lo, hi; };
{$endif}
{$if defined( __CL_HALF2__)}
{$endif}
{$if defined( __CL_HALF4__)}
{$endif}
{$if defined( __CL_HALF8__ )}
{$endif}
{$if defined( __CL_HALF16__ )}
{$endif}
 in member_list *)
type
  Pcl_half16 = ^Tcl_half16;
  Tcl_half16 = record
      case longint of
      end;
{ ---- cl_intn ----  }
{$if __CL_HAS_ANON_STRUCT__}
(* error 
    struct{ cl_int  x, y; };
 in member_list *)
(* error 
    struct{ cl_int  s0, s1; };
 in member_list *)
(* error 
    struct{ cl_int  lo, hi; };
{$endif}
{$if defined( __CL_INT2__)}
{$endif}
 in member_list *)
(* error 
typedef union
{$if __CL_HAS_ANON_STRUCT__}
 in member_list *)
(* error 
    struct{ cl_int  x, y, z, w; };
 in member_list *)
(* error 
    struct{ cl_int  s0, s1, s2, s3; };
 in member_list *)
(* error 
    struct{ cl_int2 lo, hi; };
{$endif}
{$if defined( __CL_INT2__)}
{$endif}
{$if defined( __CL_INT4__)}
{$endif}
 in member_list *)
type
  Pcl_int4 = ^Tcl_int4;
  Tcl_int4 = record
      case longint of
      end;
{ cl_int3 is identical in size, alignment and behavior to cl_int4. See section 6.1.5.  }

  Pcl_int3 = ^Tcl_int3;
  Tcl_int3 = Tcl_int4;
(* error 
    cl_int   CL_ALIGNED(32) s[8];
 in declarator_list *)
{$if __CL_HAS_ANON_STRUCT__}
(* error 
    struct{ cl_int  x, y, z, w; };
 in member_list *)
(* error 
    struct{ cl_int  s0, s1, s2, s3, s4, s5, s6, s7; };
 in member_list *)
(* error 
    struct{ cl_int4 lo, hi; };
{$endif}
{$if defined( __CL_INT2__)}
{$endif}
{$if defined( __CL_INT4__)}
{$endif}
{$if defined( __CL_INT8__ )}
{$endif}
 in member_list *)
(* error 
typedef union
{$if __CL_HAS_ANON_STRUCT__}
 in member_list *)
(* error 
    struct{ cl_int  x, y, z, w, __spacer4, __spacer5, __spacer6, __spacer7, __spacer8, __spacer9, sa, sb, sc, sd, se, sf; };
 in member_list *)
(* error 
    struct{ cl_int  s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sA, sB, sC, sD, sE, sF; };
 in member_list *)
(* error 
    struct{ cl_int8 lo, hi; };
{$endif}
{$if defined( __CL_INT2__)}
{$endif}
{$if defined( __CL_INT4__)}
{$endif}
{$if defined( __CL_INT8__ )}
{$endif}
{$if defined( __CL_INT16__ )}
{$endif}
 in member_list *)
type
  Pcl_int16 = ^Tcl_int16;
  Tcl_int16 = record
      case longint of
      end;
{ ---- cl_uintn ----  }
{$if __CL_HAS_ANON_STRUCT__}
(* error 
    struct{ cl_uint  x, y; };
 in member_list *)
(* error 
    struct{ cl_uint  s0, s1; };
 in member_list *)
(* error 
    struct{ cl_uint  lo, hi; };
{$endif}
{$if defined( __CL_UINT2__)}
{$endif}
 in member_list *)
(* error 
typedef union
{$if __CL_HAS_ANON_STRUCT__}
 in member_list *)
(* error 
    struct{ cl_uint  x, y, z, w; };
 in member_list *)
(* error 
    struct{ cl_uint  s0, s1, s2, s3; };
 in member_list *)
(* error 
    struct{ cl_uint2 lo, hi; };
{$endif}
{$if defined( __CL_UINT2__)}
{$endif}
{$if defined( __CL_UINT4__)}
{$endif}
 in member_list *)
type
  Pcl_uint4 = ^Tcl_uint4;
  Tcl_uint4 = record
      case longint of
      end;
{ cl_uint3 is identical in size, alignment and behavior to cl_uint4. See section 6.1.5.  }

  Pcl_uint3 = ^Tcl_uint3;
  Tcl_uint3 = Tcl_uint4;
(* error 
    cl_uint   CL_ALIGNED(32) s[8];
 in declarator_list *)
{$if __CL_HAS_ANON_STRUCT__}
(* error 
    struct{ cl_uint  x, y, z, w; };
 in member_list *)
(* error 
    struct{ cl_uint  s0, s1, s2, s3, s4, s5, s6, s7; };
 in member_list *)
(* error 
    struct{ cl_uint4 lo, hi; };
{$endif}
{$if defined( __CL_UINT2__)}
{$endif}
{$if defined( __CL_UINT4__)}
{$endif}
{$if defined( __CL_UINT8__ )}
{$endif}
 in member_list *)
(* error 
typedef union
{$if __CL_HAS_ANON_STRUCT__}
 in member_list *)
(* error 
    struct{ cl_uint  x, y, z, w, __spacer4, __spacer5, __spacer6, __spacer7, __spacer8, __spacer9, sa, sb, sc, sd, se, sf; };
 in member_list *)
(* error 
    struct{ cl_uint  s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sA, sB, sC, sD, sE, sF; };
 in member_list *)
(* error 
    struct{ cl_uint8 lo, hi; };
{$endif}
{$if defined( __CL_UINT2__)}
{$endif}
{$if defined( __CL_UINT4__)}
{$endif}
{$if defined( __CL_UINT8__ )}
{$endif}
{$if defined( __CL_UINT16__ )}
{$endif}
 in member_list *)
type
  Pcl_uint16 = ^Tcl_uint16;
  Tcl_uint16 = record
      case longint of
      end;
{ ---- cl_longn ----  }
{$if __CL_HAS_ANON_STRUCT__}
(* error 
    struct{ cl_long  x, y; };
 in member_list *)
(* error 
    struct{ cl_long  s0, s1; };
 in member_list *)
(* error 
    struct{ cl_long  lo, hi; };
{$endif}
{$if defined( __CL_LONG2__)}
{$endif}
 in member_list *)
(* error 
typedef union
{$if __CL_HAS_ANON_STRUCT__}
 in member_list *)
(* error 
    struct{ cl_long  x, y, z, w; };
 in member_list *)
(* error 
    struct{ cl_long  s0, s1, s2, s3; };
 in member_list *)
(* error 
    struct{ cl_long2 lo, hi; };
{$endif}
{$if defined( __CL_LONG2__)}
{$endif}
{$if defined( __CL_LONG4__)}
{$endif}
 in member_list *)
type
  Pcl_long4 = ^Tcl_long4;
  Tcl_long4 = record
      case longint of
      end;
{ cl_long3 is identical in size, alignment and behavior to cl_long4. See section 6.1.5.  }

  Pcl_long3 = ^Tcl_long3;
  Tcl_long3 = Tcl_long4;
(* error 
    cl_long   CL_ALIGNED(64) s[8];
 in declarator_list *)
{$if __CL_HAS_ANON_STRUCT__}
(* error 
    struct{ cl_long  x, y, z, w; };
 in member_list *)
(* error 
    struct{ cl_long  s0, s1, s2, s3, s4, s5, s6, s7; };
 in member_list *)
(* error 
    struct{ cl_long4 lo, hi; };
{$endif}
{$if defined( __CL_LONG2__)}
{$endif}
{$if defined( __CL_LONG4__)}
{$endif}
{$if defined( __CL_LONG8__ )}
{$endif}
 in member_list *)
(* error 
typedef union
{$if __CL_HAS_ANON_STRUCT__}
 in member_list *)
(* error 
    struct{ cl_long  x, y, z, w, __spacer4, __spacer5, __spacer6, __spacer7, __spacer8, __spacer9, sa, sb, sc, sd, se, sf; };
 in member_list *)
(* error 
    struct{ cl_long  s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sA, sB, sC, sD, sE, sF; };
 in member_list *)
(* error 
    struct{ cl_long8 lo, hi; };
{$endif}
{$if defined( __CL_LONG2__)}
{$endif}
{$if defined( __CL_LONG4__)}
{$endif}
{$if defined( __CL_LONG8__ )}
{$endif}
{$if defined( __CL_LONG16__ )}
{$endif}
 in member_list *)
type
  Pcl_long16 = ^Tcl_long16;
  Tcl_long16 = record
      case longint of
      end;
{ ---- cl_ulongn ----  }
{$if __CL_HAS_ANON_STRUCT__}
(* error 
    struct{ cl_ulong  x, y; };
 in member_list *)
(* error 
    struct{ cl_ulong  s0, s1; };
 in member_list *)
(* error 
    struct{ cl_ulong  lo, hi; };
{$endif}
{$if defined( __CL_ULONG2__)}
{$endif}
 in member_list *)
(* error 
typedef union
{$if __CL_HAS_ANON_STRUCT__}
 in member_list *)
(* error 
    struct{ cl_ulong  x, y, z, w; };
 in member_list *)
(* error 
    struct{ cl_ulong  s0, s1, s2, s3; };
 in member_list *)
(* error 
    struct{ cl_ulong2 lo, hi; };
{$endif}
{$if defined( __CL_ULONG2__)}
{$endif}
{$if defined( __CL_ULONG4__)}
{$endif}
 in member_list *)
type
  Pcl_ulong4 = ^Tcl_ulong4;
  Tcl_ulong4 = record
      case longint of
      end;
{ cl_ulong3 is identical in size, alignment and behavior to cl_ulong4. See section 6.1.5.  }

  Pcl_ulong3 = ^Tcl_ulong3;
  Tcl_ulong3 = Tcl_ulong4;
(* error 
    cl_ulong   CL_ALIGNED(64) s[8];
 in declarator_list *)
{$if __CL_HAS_ANON_STRUCT__}
(* error 
    struct{ cl_ulong  x, y, z, w; };
 in member_list *)
(* error 
    struct{ cl_ulong  s0, s1, s2, s3, s4, s5, s6, s7; };
 in member_list *)
(* error 
    struct{ cl_ulong4 lo, hi; };
{$endif}
{$if defined( __CL_ULONG2__)}
{$endif}
{$if defined( __CL_ULONG4__)}
{$endif}
{$if defined( __CL_ULONG8__ )}
{$endif}
 in member_list *)
(* error 
typedef union
{$if __CL_HAS_ANON_STRUCT__}
 in member_list *)
(* error 
    struct{ cl_ulong  x, y, z, w, __spacer4, __spacer5, __spacer6, __spacer7, __spacer8, __spacer9, sa, sb, sc, sd, se, sf; };
 in member_list *)
(* error 
    struct{ cl_ulong  s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sA, sB, sC, sD, sE, sF; };
 in member_list *)
(* error 
    struct{ cl_ulong8 lo, hi; };
{$endif}
{$if defined( __CL_ULONG2__)}
{$endif}
{$if defined( __CL_ULONG4__)}
{$endif}
{$if defined( __CL_ULONG8__ )}
{$endif}
{$if defined( __CL_ULONG16__ )}
{$endif}
 in member_list *)
type
  Pcl_ulong16 = ^Tcl_ulong16;
  Tcl_ulong16 = record
      case longint of
      end;
{ --- cl_floatn ----  }
{$if __CL_HAS_ANON_STRUCT__}
(* error 
    struct{ cl_float  x, y; };
 in member_list *)
(* error 
    struct{ cl_float  s0, s1; };
 in member_list *)
(* error 
    struct{ cl_float  lo, hi; };
{$endif}
{$if defined( __CL_FLOAT2__)}
{$endif}
 in member_list *)
(* error 
typedef union
{$if __CL_HAS_ANON_STRUCT__}
 in member_list *)
(* error 
    struct{ cl_float   x, y, z, w; };
 in member_list *)
(* error 
    struct{ cl_float   s0, s1, s2, s3; };
 in member_list *)
(* error 
    struct{ cl_float2  lo, hi; };
{$endif}
{$if defined( __CL_FLOAT2__)}
{$endif}
{$if defined( __CL_FLOAT4__)}
{$endif}
 in member_list *)
type
  Pcl_float4 = ^Tcl_float4;
  Tcl_float4 = record
      case longint of
      end;
{ cl_float3 is identical in size, alignment and behavior to cl_float4. See section 6.1.5.  }

  Pcl_float3 = ^Tcl_float3;
  Tcl_float3 = Tcl_float4;
(* error 
    cl_float   CL_ALIGNED(32) s[8];
 in declarator_list *)
{$if __CL_HAS_ANON_STRUCT__}
(* error 
    struct{ cl_float   x, y, z, w; };
 in member_list *)
(* error 
    struct{ cl_float   s0, s1, s2, s3, s4, s5, s6, s7; };
 in member_list *)
(* error 
    struct{ cl_float4  lo, hi; };
{$endif}
{$if defined( __CL_FLOAT2__)}
{$endif}
{$if defined( __CL_FLOAT4__)}
{$endif}
{$if defined( __CL_FLOAT8__ )}
{$endif}
 in member_list *)
(* error 
typedef union
{$if __CL_HAS_ANON_STRUCT__}
 in member_list *)
(* error 
    struct{ cl_float  x, y, z, w, __spacer4, __spacer5, __spacer6, __spacer7, __spacer8, __spacer9, sa, sb, sc, sd, se, sf; };
 in member_list *)
(* error 
    struct{ cl_float  s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sA, sB, sC, sD, sE, sF; };
 in member_list *)
(* error 
    struct{ cl_float8 lo, hi; };
{$endif}
{$if defined( __CL_FLOAT2__)}
{$endif}
{$if defined( __CL_FLOAT4__)}
{$endif}
{$if defined( __CL_FLOAT8__ )}
{$endif}
{$if defined( __CL_FLOAT16__ )}
{$endif}
 in member_list *)
type
  Pcl_float16 = ^Tcl_float16;
  Tcl_float16 = record
      case longint of
      end;
{ --- cl_doublen ----  }
{$if __CL_HAS_ANON_STRUCT__}
(* error 
    struct{ cl_double  x, y; };
 in member_list *)
(* error 
    struct{ cl_double s0, s1; };
 in member_list *)
(* error 
    struct{ cl_double lo, hi; };
{$endif}
{$if defined( __CL_DOUBLE2__)}
{$endif}
 in member_list *)
(* error 
typedef union
{$if __CL_HAS_ANON_STRUCT__}
 in member_list *)
(* error 
    struct{ cl_double  x, y, z, w; };
 in member_list *)
(* error 
    struct{ cl_double  s0, s1, s2, s3; };
 in member_list *)
(* error 
    struct{ cl_double2 lo, hi; };
{$endif}
{$if defined( __CL_DOUBLE2__)}
{$endif}
{$if defined( __CL_DOUBLE4__)}
{$endif}
 in member_list *)
type
  Pcl_double4 = ^Tcl_double4;
  Tcl_double4 = record
      case longint of
      end;
{ cl_double3 is identical in size, alignment and behavior to cl_double4. See section 6.1.5.  }

  Pcl_double3 = ^Tcl_double3;
  Tcl_double3 = Tcl_double4;
(* error 
    cl_double   CL_ALIGNED(64) s[8];
 in declarator_list *)
{$if __CL_HAS_ANON_STRUCT__}
(* error 
    struct{ cl_double  x, y, z, w; };
 in member_list *)
(* error 
    struct{ cl_double  s0, s1, s2, s3, s4, s5, s6, s7; };
 in member_list *)
(* error 
    struct{ cl_double4 lo, hi; };
{$endif}
{$if defined( __CL_DOUBLE2__)}
{$endif}
{$if defined( __CL_DOUBLE4__)}
{$endif}
{$if defined( __CL_DOUBLE8__ )}
{$endif}
 in member_list *)
(* error 
typedef union
{$if __CL_HAS_ANON_STRUCT__}
 in member_list *)
(* error 
    struct{ cl_double  x, y, z, w, __spacer4, __spacer5, __spacer6, __spacer7, __spacer8, __spacer9, sa, sb, sc, sd, se, sf; };
 in member_list *)
(* error 
    struct{ cl_double  s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sA, sB, sC, sD, sE, sF; };
 in member_list *)
(* error 
    struct{ cl_double8 lo, hi; };
{$endif}
{$if defined( __CL_DOUBLE2__)}
{$endif}
{$if defined( __CL_DOUBLE4__)}
{$endif}
{$if defined( __CL_DOUBLE8__ )}
{$endif}
{$if defined( __CL_DOUBLE16__ )}
{$endif}
 in member_list *)
type
  Pcl_double16 = ^Tcl_double16;
  Tcl_double16 = record
      case longint of
      end;
{ Macro to facilitate debugging
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
 *                                                  \n\
 *      // my comment                                \n\
 *      *b[ get_global_id(0)] = a;                   \n\
 *                                                  \n\
 *   ";
 *
 * This should correctly set up the line, (column) and file information for your source
 * string so you can do source level debugging.
  }
(* error 
#define  __CL_STRINGIFY( _x )               # _x
in define line 1108 *)
    { was #define dname(params) para_def_expr }
    { argument types are unknown }
    { return type might be wrong }   

    function _CL_STRINGIFY(_x : longint) : longint;    

(* error 
#define  CL_PROGRAM_STRING_DEBUG_INFO       "#line "  _CL_STRINGIFY(__LINE__) " \"" __FILE__ "\" \n\n"
in define line 1110 *)
{ C++ end of extern C conditionnal removed }
{$if defined(_WIN32) && defined(_MSC_VER) && __CL_HAS_ANON_STRUCT__}
(** unsupported pragma#pragma warning( pop )*)
{$endif}
{$endif}
    { __CL_PLATFORM_H   }

implementation

{ was #define dname def_expr }
function CL_LONG_MAX : Tcl_long;
  begin
    CL_LONG_MAX:=Tcl_long($7FFFFFFFFFFFFFFF);
  end;

{ was #define dname def_expr }
function CL_LONG_MIN : longint; { return type might be wrong }
  begin
    CL_LONG_MIN:=(Tcl_long(-($7FFFFFFFFFFFFFFF)))-1;
  end;

{ was #define dname def_expr }
function CL_ULONG_MAX : Tcl_ulong;
  begin
    CL_ULONG_MAX:=Tcl_ulong($FFFFFFFFFFFFFFFF);
  end;

{ was #define dname def_expr }
function CL_FLT_MAX_10_EXP : longint; { return type might be wrong }
  begin
    CL_FLT_MAX_10_EXP:=+(38);
  end;

{ was #define dname def_expr }
function CL_FLT_MAX_EXP : longint; { return type might be wrong }
  begin
    CL_FLT_MAX_EXP:=+(128);
  end;

{ was #define dname def_expr }
function CL_HALF_MAX_10_EXP : longint; { return type might be wrong }
  begin
    CL_HALF_MAX_10_EXP:=+(4);
  end;

{ was #define dname def_expr }
function CL_HALF_MAX_EXP : longint; { return type might be wrong }
  begin
    CL_HALF_MAX_EXP:=+(16);
  end;

{ was #define dname def_expr }
function CL_DBL_MAX_10_EXP : longint; { return type might be wrong }
  begin
    CL_DBL_MAX_10_EXP:=+(308);
  end;

{ was #define dname def_expr }
function CL_DBL_MAX_EXP : longint; { return type might be wrong }
  begin
    CL_DBL_MAX_EXP:=+(1024);
  end;

{ was #define dname def_expr }
function CL_HUGE_VALF : Tcl_float;
  begin
    CL_HUGE_VALF:=Tcl_float(1e50);
  end;

{ was #define dname def_expr }
function CL_HUGE_VAL : Tcl_double;
  begin
    CL_HUGE_VAL:=Tcl_double(1e500);
  end;

{ was #define dname def_expr }
function CL_LONG_MAX : Tcl_long;
  begin
    CL_LONG_MAX:=Tcl_long($7FFFFFFFFFFFFFFF);
  end;

{ was #define dname def_expr }
function CL_LONG_MIN : longint; { return type might be wrong }
  begin
    CL_LONG_MIN:=(Tcl_long(-($7FFFFFFFFFFFFFFF)))-1;
  end;

{ was #define dname def_expr }
function CL_ULONG_MAX : Tcl_ulong;
  begin
    CL_ULONG_MAX:=Tcl_ulong($FFFFFFFFFFFFFFFF);
  end;

{ was #define dname def_expr }
function CL_FLT_MAX_10_EXP : longint; { return type might be wrong }
  begin
    CL_FLT_MAX_10_EXP:=+(38);
  end;

{ was #define dname def_expr }
function CL_FLT_MAX_EXP : longint; { return type might be wrong }
  begin
    CL_FLT_MAX_EXP:=+(128);
  end;

{ was #define dname def_expr }
function CL_HALF_MAX_10_EXP : longint; { return type might be wrong }
  begin
    CL_HALF_MAX_10_EXP:=+(4);
  end;

{ was #define dname def_expr }
function CL_HALF_MAX_EXP : longint; { return type might be wrong }
  begin
    CL_HALF_MAX_EXP:=+(16);
  end;

{ was #define dname def_expr }
function CL_DBL_MAX_10_EXP : longint; { return type might be wrong }
  begin
    CL_DBL_MAX_10_EXP:=+(308);
  end;

{ was #define dname def_expr }
function CL_DBL_MAX_EXP : longint; { return type might be wrong }
  begin
    CL_DBL_MAX_EXP:=+(1024);
  end;

{ was #define dname def_expr }
function CL_HUGE_VALF : Tcl_float;
  begin
    CL_HUGE_VALF:=Tcl_float(1e50);
  end;

{ was #define dname def_expr }
function CL_HUGE_VAL : Tcl_double;
  begin
    CL_HUGE_VAL:=Tcl_double(1e500);
  end;

{ was #define dname def_expr }
function CL_NAN : longint; { return type might be wrong }
  begin
    CL_NAN:=nanf('');
  end;

    { was #define dname(params) para_def_expr }
    { argument types are unknown }
    { return type might be wrong }   
    function _CL_STRINGIFY(_x : longint) : longint;
    begin
      _CL_STRINGIFY:=__CL_STRINGIFY(_x);
    end;


end.
