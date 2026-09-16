unit cl_platform;

interface

uses
  fp_opencl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


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
  Tcl_double = double;

const
  CL_CHAR_BIT = 8;
  CL_SCHAR_MAX = 127;
  CL_SCHAR_MIN = (-(127)) - 1;
  CL_CHAR_MAX = CL_SCHAR_MAX;
  CL_CHAR_MIN = CL_SCHAR_MIN;
  CL_UCHAR_MAX = 255;
  CL_SHRT_MAX = 32767;
  CL_SHRT_MIN = (-(32767)) - 1;
  CL_USHRT_MAX = 65535;
  CL_INT_MAX = 2147483647;
  CL_INT_MIN = (-(2147483647)) - 1;
  CL_UINT_MAX = $ffffffff;

  CL_LONG_MAX = Tcl_long($7FFFFFFFFFFFFFFF);
  CL_LONG_MIN = (Tcl_long(-($7FFFFFFFFFFFFFFF))) - 1;
  CL_ULONG_MAX = Tcl_ulong($FFFFFFFFFFFFFFFF);
  CL_FLT_MAX_10_EXP = +(38);
  CL_FLT_MAX_EXP = +(128);
  CL_HALF_MAX_10_EXP = +(4);
  CL_HALF_MAX_EXP = +(16);
  CL_DBL_MAX_10_EXP = +(308);
  CL_DBL_MAX_EXP = +(1024);

  CL_FLT_DIG = 6;
  CL_FLT_MANT_DIG = 24;

const
  CL_FLT_MIN_10_EXP = -(37);
  CL_FLT_MIN_EXP = -(125);
  CL_FLT_RADIX = 2;
  CL_FLT_MAX = 340282346638528859811704183484516925440.0;
  CL_FLT_MIN = 1.175494350822287507969e-38;
  CL_FLT_EPSILON = 1.1920928955078125e-7;
  CL_HALF_DIG = 3;
  CL_HALF_MANT_DIG = 11;

const
  CL_HALF_MIN_10_EXP = -(4);
  CL_HALF_MIN_EXP = -(13);
  CL_HALF_RADIX = 2;
  CL_HALF_MAX = 65504.0;
  CL_HALF_MIN = 6.103515625e-05;
  CL_HALF_EPSILON = 9.765625e-04;
  CL_DBL_DIG = 15;
  CL_DBL_MANT_DIG = 53;

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

const
  CL_HUGE_VALF = Tcl_float(1e50);
  CL_HUGE_VAL = Tcl_double(1e500);

function nanf(para1: pchar): single; cdecl; external libopencl;

function CL_NAN: single;

const
  CL_MAXFLOAT = CL_FLT_MAX;
  CL_INFINITY = CL_HUGE_VALF;
type
  Pcl_GLuint = ^Tcl_GLuint;
  Tcl_GLuint = dword;

  Pcl_GLint = ^Tcl_GLint;
  Tcl_GLint = longint;

  Pcl_GLenum = ^Tcl_GLenum;
  Tcl_GLenum = dword;

type
  P_cl_float8 = ^T_cl_float8;
  T_cl_float8 = Tcl_float;

  P_cl_double4 = ^T_cl_double4;
  T_cl_double4 = Tcl_double;

type
  Pcl_char2 = ^Tcl_char2;
  Tcl_char2 = record
    case longint of
      0: (s: array[0..1] of Tcl_char);
      1: (xy: record
          x: Tcl_char;
          y: Tcl_char;
          end);
      2: (ss: record
          s0: Tcl_char;
          s1: Tcl_char;
          end);
      3: (lh: record
          lo: Tcl_char;
          hi: Tcl_char;
          end);
  end;

  Pcl_char4 = ^Tcl_char4;
  Tcl_char4 = record
    case longint of
      0: (s: array[0..3] of Tcl_char);
      1: (xyzw: record
          x: Tcl_char;
          y: Tcl_char;
          z: Tcl_char;
          w: Tcl_char;
          end);
      2: (ss: record
          s0: Tcl_char;
          s1: Tcl_char;
          s2: Tcl_char;
          s3: Tcl_char;
          end);
      3: (lh: record
          lo: Tcl_char2;
          hi: Tcl_char2;
          end);
  end;

  Pcl_char3 = ^Tcl_char3;
  Tcl_char3 = Tcl_char4;

  Pcl_char8 = ^Tcl_char8;
  Tcl_char8 = record
    case longint of
      0: (s: array[0..7] of Tcl_char);
      1: (xyzw: record
          x: Tcl_char;
          y: Tcl_char;
          z: Tcl_char;
          w: Tcl_char;
          end);
      2: (ss: record
          s0: Tcl_char;
          s1: Tcl_char;
          s2: Tcl_char;
          s3: Tcl_char;
          s4: Tcl_char;
          s5: Tcl_char;
          s6: Tcl_char;
          s7: Tcl_char;
          end);
      3: (lh: record
          lo: Tcl_char4;
          hi: Tcl_char4;
          end);
  end;

  Pcl_char16 = ^Tcl_char16;
  Tcl_char16 = record
    case longint of
      0: (s: array[0..15] of Tcl_char);
      1: (xyzw: record
          x: Tcl_char;
          y: Tcl_char;
          z: Tcl_char;
          w: Tcl_char;
          __spacer4: Tcl_char;
          __spacer5: Tcl_char;
          __spacer6: Tcl_char;
          __spacer7: Tcl_char;
          __spacer8: Tcl_char;
          __spacer9: Tcl_char;
          sa: Tcl_char;
          sb: Tcl_char;
          sc: Tcl_char;
          sd: Tcl_char;
          se: Tcl_char;
          sf: Tcl_char;
          end);
      2: (ss: record
          s0: Tcl_char;
          s1: Tcl_char;
          s2: Tcl_char;
          s3: Tcl_char;
          s4: Tcl_char;
          s5: Tcl_char;
          s6: Tcl_char;
          s7: Tcl_char;
          s8: Tcl_char;
          s9: Tcl_char;
          sA: Tcl_char;
          sB: Tcl_char;
          sC: Tcl_char;
          sD: Tcl_char;
          sE: Tcl_char;
          sF: Tcl_char;
          end);
      3: (lh: record
          lo: Tcl_char8;
          hi: Tcl_char8;
          end);
  end;

  Pcl_uchar2 = ^Tcl_uchar2;
  Tcl_uchar2 = record
    case longint of
      0: (s: array[0..1] of Tcl_uchar);
      1: (xy: record
          x: Tcl_uchar;
          y: Tcl_uchar;
          end);
      2: (ss: record
          s0: Tcl_uchar;
          s1: Tcl_uchar;
          end);
      3: (lh: record
          lo: Tcl_uchar;
          hi: Tcl_uchar;
          end);
  end;

  Pcl_uchar4 = ^Tcl_uchar4;
  Tcl_uchar4 = record
    case longint of
      0: (s: array[0..3] of Tcl_uchar);
      1: (xyzw: record
          x: Tcl_uchar;
          y: Tcl_uchar;
          z: Tcl_uchar;
          w: Tcl_uchar;
          end);
      2: (ss: record
          s0: Tcl_uchar;
          s1: Tcl_uchar;
          s2: Tcl_uchar;
          s3: Tcl_uchar;
          end);
      3: (lh: record
          lo: Tcl_uchar2;
          hi: Tcl_uchar2;
          end);
  end;

  Pcl_uchar3 = ^Tcl_uchar3;
  Tcl_uchar3 = Tcl_uchar4;

  Pcl_uchar8 = ^Tcl_uchar8;
  Tcl_uchar8 = record
    case longint of
      0: (s: array[0..7] of Tcl_uchar);
      1: (xyzw: record
          x: Tcl_uchar;
          y: Tcl_uchar;
          z: Tcl_uchar;
          w: Tcl_uchar;
          end);
      2: (ss: record
          s0: Tcl_uchar;
          s1: Tcl_uchar;
          s2: Tcl_uchar;
          s3: Tcl_uchar;
          s4: Tcl_uchar;
          s5: Tcl_uchar;
          s6: Tcl_uchar;
          s7: Tcl_uchar;
          end);
      3: (lh: record
          lo: Tcl_uchar4;
          hi: Tcl_uchar4;
          end);
  end;

  Pcl_uchar16 = ^Tcl_uchar16;
  Tcl_uchar16 = record
    case longint of
      0: (s: array[0..15] of Tcl_uchar);
      1: (xyzw: record
          x: Tcl_uchar;
          y: Tcl_uchar;
          z: Tcl_uchar;
          w: Tcl_uchar;
          __spacer4: Tcl_uchar;
          __spacer5: Tcl_uchar;
          __spacer6: Tcl_uchar;
          __spacer7: Tcl_uchar;
          __spacer8: Tcl_uchar;
          __spacer9: Tcl_uchar;
          sa: Tcl_uchar;
          sb: Tcl_uchar;
          sc: Tcl_uchar;
          sd: Tcl_uchar;
          se: Tcl_uchar;
          sf: Tcl_uchar;
          end);
      2: (ss: record
          s0: Tcl_uchar;
          s1: Tcl_uchar;
          s2: Tcl_uchar;
          s3: Tcl_uchar;
          s4: Tcl_uchar;
          s5: Tcl_uchar;
          s6: Tcl_uchar;
          s7: Tcl_uchar;
          s8: Tcl_uchar;
          s9: Tcl_uchar;
          sA: Tcl_uchar;
          sB: Tcl_uchar;
          sC: Tcl_uchar;
          sD: Tcl_uchar;
          sE: Tcl_uchar;
          sF: Tcl_uchar;
          end);
      3: (lh: record
          lo: Tcl_uchar8;
          hi: Tcl_uchar8;
          end);
  end;

  Pcl_short2 = ^Tcl_short2;
  Tcl_short2 = record
    case longint of
      0: (s: array[0..1] of Tcl_short);
      1: (xy: record
          x: Tcl_short;
          y: Tcl_short;
          end);
      2: (ss: record
          s0: Tcl_short;
          s1: Tcl_short;
          end);
      3: (lh: record
          lo: Tcl_short;
          hi: Tcl_short;
          end);
  end;

  Pcl_short4 = ^Tcl_short4;
  Tcl_short4 = record
    case longint of
      0: (s: array[0..3] of Tcl_short);
      1: (xyzw: record
          x: Tcl_short;
          y: Tcl_short;
          z: Tcl_short;
          w: Tcl_short;
          end);
      2: (ss: record
          s0: Tcl_short;
          s1: Tcl_short;
          s2: Tcl_short;
          s3: Tcl_short;
          end);
      3: (lh: record
          lo: Tcl_short2;
          hi: Tcl_short2;
          end);
  end;

  Pcl_short3 = ^Tcl_short3;
  Tcl_short3 = Tcl_short4;

  Pcl_short8 = ^Tcl_short8;
  Tcl_short8 = record
    case longint of
      0: (s: array[0..7] of Tcl_short);
      1: (xyzw: record
          x: Tcl_short;
          y: Tcl_short;
          z: Tcl_short;
          w: Tcl_short;
          end);
      2: (ss: record
          s0: Tcl_short;
          s1: Tcl_short;
          s2: Tcl_short;
          s3: Tcl_short;
          s4: Tcl_short;
          s5: Tcl_short;
          s6: Tcl_short;
          s7: Tcl_short;
          end);
      3: (lh: record
          lo: Tcl_short4;
          hi: Tcl_short4;
          end);
  end;

  Pcl_short16 = ^Tcl_short16;
  Tcl_short16 = record
    case longint of
      0: (s: array[0..15] of Tcl_short);
      1: (xyzw: record
          x: Tcl_short;
          y: Tcl_short;
          z: Tcl_short;
          w: Tcl_short;
          __spacer4: Tcl_short;
          __spacer5: Tcl_short;
          __spacer6: Tcl_short;
          __spacer7: Tcl_short;
          __spacer8: Tcl_short;
          __spacer9: Tcl_short;
          sa: Tcl_short;
          sb: Tcl_short;
          sc: Tcl_short;
          sd: Tcl_short;
          se: Tcl_short;
          sf: Tcl_short;
          end);
      2: (ss: record
          s0: Tcl_short;
          s1: Tcl_short;
          s2: Tcl_short;
          s3: Tcl_short;
          s4: Tcl_short;
          s5: Tcl_short;
          s6: Tcl_short;
          s7: Tcl_short;
          s8: Tcl_short;
          s9: Tcl_short;
          sA: Tcl_short;
          sB: Tcl_short;
          sC: Tcl_short;
          sD: Tcl_short;
          sE: Tcl_short;
          sF: Tcl_short;
          end);
      3: (lh: record
          lo: Tcl_short8;
          hi: Tcl_short8;
          end);
  end;

  Pcl_ushort2 = ^Tcl_ushort2;
  Tcl_ushort2 = record
    case longint of
      0: (s: array[0..1] of Tcl_ushort);
      1: (xy: record
          x: Tcl_ushort;
          y: Tcl_ushort;
          end);
      2: (ss: record
          s0: Tcl_ushort;
          s1: Tcl_ushort;
          end);
      3: (lh: record
          lo: Tcl_ushort;
          hi: Tcl_ushort;
          end);
  end;

  Pcl_ushort4 = ^Tcl_ushort4;
  Tcl_ushort4 = record
    case longint of
      0: (s: array[0..3] of Tcl_ushort);
      1: (xyzw: record
          x: Tcl_ushort;
          y: Tcl_ushort;
          z: Tcl_ushort;
          w: Tcl_ushort;
          end);
      2: (ss: record
          s0: Tcl_ushort;
          s1: Tcl_ushort;
          s2: Tcl_ushort;
          s3: Tcl_ushort;
          end);
      3: (lh: record
          lo: Tcl_ushort2;
          hi: Tcl_ushort2;
          end);
  end;

  Pcl_ushort3 = ^Tcl_ushort3;
  Tcl_ushort3 = Tcl_ushort4;

  Pcl_ushort8 = ^Tcl_ushort8;
  Tcl_ushort8 = record
    case longint of
      0: (s: array[0..7] of Tcl_ushort);
      1: (yzw: record
          x: Tcl_ushort;
          y: Tcl_ushort;
          z: Tcl_ushort;
          w: Tcl_ushort;
          end);
      2: (ss: record
          s0: Tcl_ushort;
          s1: Tcl_ushort;
          s2: Tcl_ushort;
          s3: Tcl_ushort;
          s4: Tcl_ushort;
          s5: Tcl_ushort;
          s6: Tcl_ushort;
          s7: Tcl_ushort;
          end);
      3: (lh: record
          lo: Tcl_ushort4;
          hi: Tcl_ushort4;
          end);
  end;

  Pcl_ushort16 = ^Tcl_ushort16;
  Tcl_ushort16 = record
    case longint of
      0: (s: array[0..15] of Tcl_ushort);
      1: (xyzw: record
          x: Tcl_ushort;
          y: Tcl_ushort;
          z: Tcl_ushort;
          w: Tcl_ushort;
          __spacer4: Tcl_ushort;
          __spacer5: Tcl_ushort;
          __spacer6: Tcl_ushort;
          __spacer7: Tcl_ushort;
          __spacer8: Tcl_ushort;
          __spacer9: Tcl_ushort;
          sa: Tcl_ushort;
          sb: Tcl_ushort;
          sc: Tcl_ushort;
          sd: Tcl_ushort;
          se: Tcl_ushort;
          sf: Tcl_ushort;
          end);
      2: (ss: record
          s0: Tcl_ushort;
          s1: Tcl_ushort;
          s2: Tcl_ushort;
          s3: Tcl_ushort;
          s4: Tcl_ushort;
          s5: Tcl_ushort;
          s6: Tcl_ushort;
          s7: Tcl_ushort;
          s8: Tcl_ushort;
          s9: Tcl_ushort;
          sA: Tcl_ushort;
          sB: Tcl_ushort;
          sC: Tcl_ushort;
          sD: Tcl_ushort;
          sE: Tcl_ushort;
          sF: Tcl_ushort;
          end);
      3: (lh: record
          lo: Tcl_ushort8;
          hi: Tcl_ushort8;
          end);
  end;

  Pcl_half2 = ^Tcl_half2;
  Tcl_half2 = record
    case longint of
      0: (s: array[0..1] of Tcl_half);
      1: (xy: record
          x: Tcl_half;
          y: Tcl_half;
          end);
      2: (ss: record
          s0: Tcl_half;
          s1: Tcl_half;
          end);
      3: (lh: record
          lo: Tcl_half;
          hi: Tcl_half;
          end);
  end;

  Pcl_half4 = ^Tcl_half4;
  Tcl_half4 = record
    case longint of
      0: (s: array[0..3] of Tcl_half);
      1: (xyzw: record
          x: Tcl_half;
          y: Tcl_half;
          z: Tcl_half;
          w: Tcl_half;
          end);
      2: (ss: record
          s0: Tcl_half;
          s1: Tcl_half;
          s2: Tcl_half;
          s3: Tcl_half;
          end);
      3: (lh: record
          lo: Tcl_half2;
          hi: Tcl_half2;
          end);
  end;

  Pcl_half3 = ^Tcl_half3;
  Tcl_half3 = Tcl_half4;

  Pcl_half8 = ^Tcl_half8;
  Tcl_half8 = record
    case longint of
      0: (s: array[0..7] of Tcl_half);
      1: (xyzw: record
          x: Tcl_half;
          y: Tcl_half;
          z: Tcl_half;
          w: Tcl_half;
          end);
      2: (ss: record
          s0: Tcl_half;
          s1: Tcl_half;
          s2: Tcl_half;
          s3: Tcl_half;
          s4: Tcl_half;
          s5: Tcl_half;
          s6: Tcl_half;
          s7: Tcl_half;
          end);
      3: (lh: record
          lo: Tcl_half4;
          hi: Tcl_half4;
          end);
  end;

  Pcl_half16 = ^Tcl_half16;
  Tcl_half16 = record
    case longint of
      0: (s: array[0..15] of Tcl_half);
      1: (xyzw: record
          x: Tcl_half;
          y: Tcl_half;
          z: Tcl_half;
          w: Tcl_half;
          __spacer4: Tcl_half;
          __spacer5: Tcl_half;
          __spacer6: Tcl_half;
          __spacer7: Tcl_half;
          __spacer8: Tcl_half;
          __spacer9: Tcl_half;
          sa: Tcl_half;
          sb: Tcl_half;
          sc: Tcl_half;
          sd: Tcl_half;
          se: Tcl_half;
          sf: Tcl_half;
          end);
      2: (ss: record
          s0: Tcl_half;
          s1: Tcl_half;
          s2: Tcl_half;
          s3: Tcl_half;
          s4: Tcl_half;
          s5: Tcl_half;
          s6: Tcl_half;
          s7: Tcl_half;
          s8: Tcl_half;
          s9: Tcl_half;
          sA: Tcl_half;
          sB: Tcl_half;
          sC: Tcl_half;
          sD: Tcl_half;
          sE: Tcl_half;
          sF: Tcl_half;
          end);
      3: (lh: record
          lo: Tcl_half8;
          hi: Tcl_half8;
          end);
  end;

  Pcl_int2 = ^Tcl_int2;
  Tcl_int2 = record
    case longint of
      0: (s: array[0..1] of Tcl_int);
      1: (xy: record
          x: Tcl_int;
          y: Tcl_int;
          end);
      2: (ss: record
          s0: Tcl_int;
          s1: Tcl_int;
          end);
      3: (lh: record
          lo: Tcl_int;
          hi: Tcl_int;
          end);
  end;

  Pcl_int4 = ^Tcl_int4;
  Tcl_int4 = record
    case longint of
      0: (s: array[0..3] of Tcl_int);
      1: (xyzw: record
          x: Tcl_int;
          y: Tcl_int;
          z: Tcl_int;
          w: Tcl_int;
          end);
      2: (ss: record
          s0: Tcl_int;
          s1: Tcl_int;
          s2: Tcl_int;
          s3: Tcl_int;
          end);
      3: (lh: record
          lo: Tcl_int2;
          hi: Tcl_int2;
          end);
  end;

  Pcl_int3 = ^Tcl_int3;
  Tcl_int3 = Tcl_int4;

  Pcl_int8 = ^Tcl_int8;
  Tcl_int8 = record
    case longint of
      0: (s: array[0..7] of Tcl_int);
      1: (xyzw: record
          x: Tcl_int;
          y: Tcl_int;
          z: Tcl_int;
          w: Tcl_int;
          end);
      2: (ss: record
          s0: Tcl_int;
          s1: Tcl_int;
          s2: Tcl_int;
          s3: Tcl_int;
          s4: Tcl_int;
          s5: Tcl_int;
          s6: Tcl_int;
          s7: Tcl_int;
          end);
      3: (lh: record
          lo: Tcl_int4;
          hi: Tcl_int4;
          end);
  end;

  Pcl_int16 = ^Tcl_int16;
  Tcl_int16 = record
    case longint of
      0: (s: array[0..15] of Tcl_int);
      1: (xyzw: record
          x: Tcl_int;
          y: Tcl_int;
          z: Tcl_int;
          w: Tcl_int;
          __spacer4: Tcl_int;
          __spacer5: Tcl_int;
          __spacer6: Tcl_int;
          __spacer7: Tcl_int;
          __spacer8: Tcl_int;
          __spacer9: Tcl_int;
          sa: Tcl_int;
          sb: Tcl_int;
          sc: Tcl_int;
          sd: Tcl_int;
          se: Tcl_int;
          sf: Tcl_int;
          end);
      2: (ss: record
          s0: Tcl_int;
          s1: Tcl_int;
          s2: Tcl_int;
          s3: Tcl_int;
          s4: Tcl_int;
          s5: Tcl_int;
          s6: Tcl_int;
          s7: Tcl_int;
          s8: Tcl_int;
          s9: Tcl_int;
          sA: Tcl_int;
          sB: Tcl_int;
          sC: Tcl_int;
          sD: Tcl_int;
          sE: Tcl_int;
          sF: Tcl_int;
          end);
      3: (lh: record
          lo: Tcl_int8;
          hi: Tcl_int8;
          end);
  end;

  Pcl_uint2 = ^Tcl_uint2;
  Tcl_uint2 = record
    case longint of
      0: (s: array[0..1] of Tcl_uint);
      1: (xy: record
          x: Tcl_uint;
          y: Tcl_uint;
          end);
      2: (ss: record
          s0: Tcl_uint;
          s1: Tcl_uint;
          end);
      3: (lh: record
          lo: Tcl_uint;
          hi: Tcl_uint;
          end);
  end;

  Pcl_uint4 = ^Tcl_uint4;
  Tcl_uint4 = record
    case longint of
      0: (s: array[0..3] of Tcl_uint);
      1: (xyzw: record
          x: Tcl_uint;
          y: Tcl_uint;
          z: Tcl_uint;
          w: Tcl_uint;
          end);
      2: (ss: record
          s0: Tcl_uint;
          s1: Tcl_uint;
          s2: Tcl_uint;
          s3: Tcl_uint;
          end);
      3: (lh: record
          lo: Tcl_uint2;
          hi: Tcl_uint2;
          end);
  end;

  Pcl_uint3 = ^Tcl_uint3;
  Tcl_uint3 = Tcl_uint4;

  Pcl_uint8 = ^Tcl_uint8;
  Tcl_uint8 = record
    case longint of
      0: (s: array[0..7] of Tcl_uint);
      1: (xyzw: record
          x: Tcl_uint;
          y: Tcl_uint;
          z: Tcl_uint;
          w: Tcl_uint;
          end);
      2: (ss: record
          s0: Tcl_uint;
          s1: Tcl_uint;
          s2: Tcl_uint;
          s3: Tcl_uint;
          s4: Tcl_uint;
          s5: Tcl_uint;
          s6: Tcl_uint;
          s7: Tcl_uint;
          end);
      3: (lh: record
          lo: Tcl_uint4;
          hi: Tcl_uint4;
          end);
  end;

  Pcl_uint16 = ^Tcl_uint16;
  Tcl_uint16 = record
    case longint of
      0: (s: array[0..15] of Tcl_uint);
      1: (xyzw: record
          x: Tcl_uint;
          y: Tcl_uint;
          z: Tcl_uint;
          w: Tcl_uint;
          __spacer4: Tcl_uint;
          __spacer5: Tcl_uint;
          __spacer6: Tcl_uint;
          __spacer7: Tcl_uint;
          __spacer8: Tcl_uint;
          __spacer9: Tcl_uint;
          sa: Tcl_uint;
          sb: Tcl_uint;
          sc: Tcl_uint;
          sd: Tcl_uint;
          se: Tcl_uint;
          sf: Tcl_uint;
          end);
      2: (ss: record
          s0: Tcl_uint;
          s1: Tcl_uint;
          s2: Tcl_uint;
          s3: Tcl_uint;
          s4: Tcl_uint;
          s5: Tcl_uint;
          s6: Tcl_uint;
          s7: Tcl_uint;
          s8: Tcl_uint;
          s9: Tcl_uint;
          sA: Tcl_uint;
          sB: Tcl_uint;
          sC: Tcl_uint;
          sD: Tcl_uint;
          sE: Tcl_uint;
          sF: Tcl_uint;
          end);
      3: (lh: record
          lo: Tcl_uint8;
          hi: Tcl_uint8;
          end);
  end;

  Pcl_long2 = ^Tcl_long2;
  Tcl_long2 = record
    case longint of
      0: (s: array[0..1] of Tcl_long);
      1: (xy: record
          x: Tcl_long;
          y: Tcl_long;
          end);
      2: (ss: record
          s0: Tcl_long;
          s1: Tcl_long;
          end);
      3: (lh: record
          lo: Tcl_long;
          hi: Tcl_long;
          end);
  end;

  Pcl_long4 = ^Tcl_long4;
  Tcl_long4 = record
    case longint of
      0: (s: array[0..3] of Tcl_long);
      1: (xyzw: record
          x: Tcl_long;
          y: Tcl_long;
          z: Tcl_long;
          w: Tcl_long;
          end);
      2: (ss: record
          s0: Tcl_long;
          s1: Tcl_long;
          s2: Tcl_long;
          s3: Tcl_long;
          end);
      3: (lh: record
          lo: Tcl_long2;
          hi: Tcl_long2;
          end);
  end;

  Pcl_long3 = ^Tcl_long3;
  Tcl_long3 = Tcl_long4;

  Pcl_long8 = ^Tcl_long8;
  Tcl_long8 = record
    case longint of
      0: (s: array[0..7] of Tcl_long);
      1: (xyzw: record
          x: Tcl_long;
          y: Tcl_long;
          z: Tcl_long;
          w: Tcl_long;
          end);
      2: (ss: record
          s0: Tcl_long;
          s1: Tcl_long;
          s2: Tcl_long;
          s3: Tcl_long;
          s4: Tcl_long;
          s5: Tcl_long;
          s6: Tcl_long;
          s7: Tcl_long;
          end);
      3: (lh: record
          lo: Tcl_long4;
          hi: Tcl_long4;
          end);
  end;

  Pcl_long16 = ^Tcl_long16;
  Tcl_long16 = record
    case longint of
      0: (s: array[0..15] of Tcl_long);
      1: (xyzw: record
          x: Tcl_long;
          y: Tcl_long;
          z: Tcl_long;
          w: Tcl_long;
          __spacer4: Tcl_long;
          __spacer5: Tcl_long;
          __spacer6: Tcl_long;
          __spacer7: Tcl_long;
          __spacer8: Tcl_long;
          __spacer9: Tcl_long;
          sa: Tcl_long;
          sb: Tcl_long;
          sc: Tcl_long;
          sd: Tcl_long;
          se: Tcl_long;
          sf: Tcl_long;
          end);
      2: (ss: record
          s0: Tcl_long;
          s1: Tcl_long;
          s2: Tcl_long;
          s3: Tcl_long;
          s4: Tcl_long;
          s5: Tcl_long;
          s6: Tcl_long;
          s7: Tcl_long;
          s8: Tcl_long;
          s9: Tcl_long;
          sA: Tcl_long;
          sB: Tcl_long;
          sC: Tcl_long;
          sD: Tcl_long;
          sE: Tcl_long;
          sF: Tcl_long;
          end);
      3: (lh: record
          lo: Tcl_long8;
          hi: Tcl_long8;
          end);
  end;

  Pcl_ulong2 = ^Tcl_ulong2;
  Tcl_ulong2 = record
    case longint of
      0: (s: array[0..1] of Tcl_ulong);
      1: (xy: record
          x: Tcl_ulong;
          y: Tcl_ulong;
          end);
      2: (ss: record
          s0: Tcl_ulong;
          s1: Tcl_ulong;
          end);
      3: (lh: record
          lo: Tcl_ulong;
          hi: Tcl_ulong;
          end);
  end;

  Pcl_ulong4 = ^Tcl_ulong4;
  Tcl_ulong4 = record
    case longint of
      0: (s: array[0..3] of Tcl_ulong);
      1: (xyzw: record
          x: Tcl_ulong;
          y: Tcl_ulong;
          z: Tcl_ulong;
          w: Tcl_ulong;
          end);
      2: (ss: record
          s0: Tcl_ulong;
          s1: Tcl_ulong;
          s2: Tcl_ulong;
          s3: Tcl_ulong;
          end);
      3: (lh: record
          lo: Tcl_ulong2;
          hi: Tcl_ulong2;
          end);
  end;

  Pcl_ulong3 = ^Tcl_ulong3;
  Tcl_ulong3 = Tcl_ulong4;

  Pcl_ulong8 = ^Tcl_ulong8;
  Tcl_ulong8 = record
    case longint of
      0: (s: array[0..7] of Tcl_ulong);
      1: (xyzw: record
          x: Tcl_ulong;
          y: Tcl_ulong;
          z: Tcl_ulong;
          w: Tcl_ulong;
          end);
      2: (ss: record
          s0: Tcl_ulong;
          s1: Tcl_ulong;
          s2: Tcl_ulong;
          s3: Tcl_ulong;
          s4: Tcl_ulong;
          s5: Tcl_ulong;
          s6: Tcl_ulong;
          s7: Tcl_ulong;
          end);
      3: (lh: record
          lo: Tcl_ulong4;
          hi: Tcl_ulong4;
          end);
  end;

  Pcl_ulong16 = ^Tcl_ulong16;
  Tcl_ulong16 = record
    case longint of
      0: (s: array[0..15] of Tcl_ulong);
      1: (xyzw: record
          x: Tcl_ulong;
          y: Tcl_ulong;
          z: Tcl_ulong;
          w: Tcl_ulong;
          __spacer4: Tcl_ulong;
          __spacer5: Tcl_ulong;
          __spacer6: Tcl_ulong;
          __spacer7: Tcl_ulong;
          __spacer8: Tcl_ulong;
          __spacer9: Tcl_ulong;
          sa: Tcl_ulong;
          sb: Tcl_ulong;
          sc: Tcl_ulong;
          sd: Tcl_ulong;
          se: Tcl_ulong;
          sf: Tcl_ulong;
          end);
      2: (ss: record
          s0: Tcl_ulong;
          s1: Tcl_ulong;
          s2: Tcl_ulong;
          s3: Tcl_ulong;
          s4: Tcl_ulong;
          s5: Tcl_ulong;
          s6: Tcl_ulong;
          s7: Tcl_ulong;
          s8: Tcl_ulong;
          s9: Tcl_ulong;
          sA: Tcl_ulong;
          sB: Tcl_ulong;
          sC: Tcl_ulong;
          sD: Tcl_ulong;
          sE: Tcl_ulong;
          sF: Tcl_ulong;
          end);
      3: (lh: record
          lo: Tcl_ulong8;
          hi: Tcl_ulong8;
          end);
  end;

  Pcl_float2 = ^Tcl_float2;
  Tcl_float2 = record
    case longint of
      0: (s: array[0..1] of Tcl_float);
      1: (xy: record
          x: Tcl_float;
          y: Tcl_float;
          end);
      2: (ss: record
          s0: Tcl_float;
          s1: Tcl_float;
          end);
      3: (lh: record
          lo: Tcl_float;
          hi: Tcl_float;
          end);
  end;

  Pcl_float4 = ^Tcl_float4;
  Tcl_float4 = record
    case longint of
      0: (s: array[0..3] of Tcl_float);
      1: (xyzw: record
          x: Tcl_float;
          y: Tcl_float;
          z: Tcl_float;
          w: Tcl_float;
          end);
      2: (ss: record
          s0: Tcl_float;
          s1: Tcl_float;
          s2: Tcl_float;
          s3: Tcl_float;
          end);
      3: (lh: record
          lo: Tcl_float2;
          hi: Tcl_float2;
          end);
  end;

  Pcl_float3 = ^Tcl_float3;
  Tcl_float3 = Tcl_float4;

  Pcl_float8 = ^Tcl_float8;
  Tcl_float8 = record
    case longint of
      0: (s: array[0..7] of Tcl_float);
      1: (xyzw: record
          x: Tcl_float;
          y: Tcl_float;
          z: Tcl_float;
          w: Tcl_float;
          end);
      2: (ss: record
          s0: Tcl_float;
          s1: Tcl_float;
          s2: Tcl_float;
          s3: Tcl_float;
          s4: Tcl_float;
          s5: Tcl_float;
          s6: Tcl_float;
          s7: Tcl_float;
          end);
      3: (lh: record
          lo: Tcl_float4;
          hi: Tcl_float4;
          end);
  end;

  Pcl_float16 = ^Tcl_float16;
  Tcl_float16 = record
    case longint of
      0: (s: array[0..15] of Tcl_float);
      1: (xyzw: record
          x: Tcl_float;
          y: Tcl_float;
          z: Tcl_float;
          w: Tcl_float;
          __spacer4: Tcl_float;
          __spacer5: Tcl_float;
          __spacer6: Tcl_float;
          __spacer7: Tcl_float;
          __spacer8: Tcl_float;
          __spacer9: Tcl_float;
          sa: Tcl_float;
          sb: Tcl_float;
          sc: Tcl_float;
          sd: Tcl_float;
          se: Tcl_float;
          sf: Tcl_float;
          end);
      2: (ss: record
          s0: Tcl_float;
          s1: Tcl_float;
          s2: Tcl_float;
          s3: Tcl_float;
          s4: Tcl_float;
          s5: Tcl_float;
          s6: Tcl_float;
          s7: Tcl_float;
          s8: Tcl_float;
          s9: Tcl_float;
          sA: Tcl_float;
          sB: Tcl_float;
          sC: Tcl_float;
          sD: Tcl_float;
          sE: Tcl_float;
          sF: Tcl_float;
          end);
      3: (lh: record
          lo: Tcl_float8;
          hi: Tcl_float8;
          end);
  end;

  Pcl_double2 = ^Tcl_double2;
  Tcl_double2 = record
    case longint of
      0: (s: array[0..1] of Tcl_double);
      1: (xy: record
          x: Tcl_double;
          y: Tcl_double;
          end);
      2: (ss: record
          s0: Tcl_double;
          s1: Tcl_double;
          end);
      3: (lh: record
          lo: Tcl_double;
          hi: Tcl_double;
          end);
  end;

  Pcl_double4 = ^Tcl_double4;
  Tcl_double4 = record
    case longint of
      0: (s: array[0..3] of Tcl_double);
      1: (xyzw: record
          x: Tcl_double;
          y: Tcl_double;
          z: Tcl_double;
          w: Tcl_double;
          end);
      2: (ss: record
          s0: Tcl_double;
          s1: Tcl_double;
          s2: Tcl_double;
          s3: Tcl_double;
          end);
      3: (lh: record
          lo: Tcl_double2;
          hi: Tcl_double2;
          end);
  end;

  Pcl_double3 = ^Tcl_double3;
  Tcl_double3 = Tcl_double4;

  Pcl_double8 = ^Tcl_double8;
  Tcl_double8 = record
    case longint of
      0: (s: array[0..7] of Tcl_double);
      1: (xyzw: record
          x: Tcl_double;
          y: Tcl_double;
          z: Tcl_double;
          w: Tcl_double;
          end);
      2: (ss: record
          s0: Tcl_double;
          s1: Tcl_double;
          s2: Tcl_double;
          s3: Tcl_double;
          s4: Tcl_double;
          s5: Tcl_double;
          s6: Tcl_double;
          s7: Tcl_double;
          end);
      3: (lh: record
          lo: Tcl_double4;
          hi: Tcl_double4;
          end);
  end;

  Pcl_double16 = ^Tcl_double16;
  Tcl_double16 = record
    case longint of
      0: (s: array[0..15] of Tcl_double);
      1: (xyzw: record
          x: Tcl_double;
          y: Tcl_double;
          z: Tcl_double;
          w: Tcl_double;
          __spacer4: Tcl_double;
          __spacer5: Tcl_double;
          __spacer6: Tcl_double;
          __spacer7: Tcl_double;
          __spacer8: Tcl_double;
          __spacer9: Tcl_double;
          sa: Tcl_double;
          sb: Tcl_double;
          sc: Tcl_double;
          sd: Tcl_double;
          se: Tcl_double;
          sf: Tcl_double;
          end);
      2: (ss: record
          s0: Tcl_double;
          s1: Tcl_double;
          s2: Tcl_double;
          s3: Tcl_double;
          s4: Tcl_double;
          s5: Tcl_double;
          s6: Tcl_double;
          s7: Tcl_double;
          s8: Tcl_double;
          s9: Tcl_double;
          sA: Tcl_double;
          sB: Tcl_double;
          sC: Tcl_double;
          sD: Tcl_double;
          sE: Tcl_double;
          sF: Tcl_double;
          end);
      3: (lh: record
          lo: Tcl_double8;
          hi: Tcl_double8;
          end);
      4: (v2: array[0..7] of Tcl_double2);
      5: (v4: array[0..3] of Tcl_double4);
      6: (v8: array[0..1] of Tcl_double8);
  end;

  // === Konventiert am: 16-9-26 15:57:32 ===


implementation


function CL_NAN: single;
begin
  CL_NAN := nanf('');
end;


end.
