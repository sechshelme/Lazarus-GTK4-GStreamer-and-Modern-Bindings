
unit cpl_port;
interface

{
  Automatically converted by H2Pas 1.0.0 from cpl_port.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cpl_port.h
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
PCSLConstList  = ^CSLConstList;
PGBool  = ^GBool;
PGByte  = ^GByte;
PGInt16  = ^GInt16;
PGInt32  = ^GInt32;
PGInt64  = ^GInt64;
PGInt8  = ^GInt8;
PGIntBig  = ^GIntBig;
PGPtrDiff_t  = ^GPtrDiff_t;
PGUInt16  = ^GUInt16;
PGUInt32  = ^GUInt32;
PGUInt64  = ^GUInt64;
PGUIntBig  = ^GUIntBig;
PGUIntptr_t  = ^GUIntptr_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$if UINT_MAX == 65535}
type
  PGInt32 = ^TGInt32;
  TGInt32 = longint;

  PGUInt32 = ^TGUInt32;
  TGUInt32 = dword;
{$else}
{* Int32 type  }
type
  PGInt32 = ^TGInt32;
  TGInt32 = longint;
{* Unsigned int32 type  }

  PGUInt32 = ^TGUInt32;
  TGUInt32 = dword;
{$endif}
{* Int16 type  }
type
  PGInt16 = ^TGInt16;
  TGInt16 = smallint;
{* Unsigned int16 type  }

  PGUInt16 = ^TGUInt16;
  TGUInt16 = word;
{* Unsigned byte type  }

  PGByte = ^TGByte;
  TGByte = byte;
{* Signed int8 type  }

  PGInt8 = ^TGInt8;
  TGInt8 = char;
{ hack for PDF driver and poppler >= 0.15.0 that defines incompatible "typedef
 * bool GBool"  }
{ in include/poppler/goo/gtypes.h  }
{$ifndef CPL_GBOOL_DEFINED}
{! @cond Doxygen_Suppress  }
{$define CPL_GBOOL_DEFINED}
{! @endcond  }
{* Type for boolean values (alias to int)  }
type
  PGBool = ^TGBool;
  TGBool = longint;
{$endif}
{ --------------------------------------------------------------------  }
{      64bit support                                                    }
{ --------------------------------------------------------------------  }
{* Large signed integer type (generally 64-bit integer type).
 *  Use GInt64 when exactly 64 bit is needed  }
type
  PGIntBig = ^TGIntBig;
  TGIntBig = int64;
{* Large unsigned integer type (generally 64-bit unsigned integer type).
 *  Use GUInt64 when exactly 64 bit is needed  }

  PGUIntBig = ^TGUIntBig;
  TGUIntBig = qword;
{* Minimum GIntBig value  }

{ was #define dname def_expr }
function GINTBIG_MIN : longint; { return type might be wrong }

{* Maximum GIntBig value  }
{ was #define dname def_expr }
function GINTBIG_MAX : longint; { return type might be wrong }

{* Maximum GUIntBig value  }
{ was #define dname def_expr }
function GUINTBIG_MAX : longint; { return type might be wrong }

{! @cond Doxygen_Suppress  }
const
  CPL_HAS_GINT64 = 1;  
{! @endcond  }
{ Note: we might want to use instead int64_t / uint64_t if they are available
  }
{* Signed 64 bit integer type  }
type
  PGInt64 = ^TGInt64;
  TGInt64 = TGIntBig;
{* Unsigned 64 bit integer type  }

  PGUInt64 = ^TGUInt64;
  TGUInt64 = TGUIntBig;
{* Minimum GInt64 value  }

const
  GINT64_MIN = GINTBIG_MIN;  
{* Maximum GInt64 value  }
  GINT64_MAX = GINTBIG_MAX;  
{* Minimum GUInt64 value  }
  GUINT64_MAX = GUINTBIG_MAX;  
{$if SIZEOF_VOIDP > 8}
{$include <stddef.h>  // ptrdiff_t}
{* Integer type large enough to hold the difference between 2 addresses  }
type
  PGPtrDiff_t = ^TGPtrDiff_t;
  TGPtrDiff_t = Tptrdiff_t;
(*** was #elif ****){$else SIZEOF_VOIDP == 8}
{* Integer type large enough to hold the difference between 2 addresses  }
type
  PGPtrDiff_t = ^TGPtrDiff_t;
  TGPtrDiff_t = TGIntBig;
{$else}
{* Integer type large enough to hold the difference between 2 addresses  }
type
  PGPtrDiff_t = ^TGPtrDiff_t;
  TGPtrDiff_t = longint;
{$endif}
{$ifdef GDAL_COMPILATION}
{$include <stdint.h>}
type
  PGUIntptr_t = ^TGUIntptr_t;
  TGUIntptr_t = Tuintptr_t;
(* Const before type ignored *)
{    CPL_WARN_DEPRECATED("Use CPLvsnprintf() instead") }

function vsnprintf(str:Pchar; size:Tsize_t; fmt:Pchar; args:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
{        CPL_WARN_DEPRECATED("Use CPLsnprintf() instead") }
function snprintf(str:Pchar; size:Tsize_t; fmt:Pchar; args:array of const):longint;cdecl;external;
function snprintf(str:Pchar; size:Tsize_t; fmt:Pchar):longint;cdecl;external;
(* Const before type ignored *)
{    CPL_WARN_DEPRECATED("Use CPLsnprintf() instead"); }
function sprintf(str:Pchar; fmt:Pchar; args:array of const):longint;cdecl;external;
function sprintf(str:Pchar; fmt:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
type
  PCSLConstList = ^TCSLConstList;
  TCSLConstList = ^Pchar;
{$else}
{* Type of a constant null-terminated list of nul terminated strings.
 * Seen as char** from C and const char* const* from C++  }
type
  PCSLConstList = ^TCSLConstList;
  TCSLConstList = ^Pchar;
{$endif}
{$endif}
{ ndef CPL_BASE_H_INCLUDED  }

implementation

{ was #define dname def_expr }
function GINTBIG_MIN : longint; { return type might be wrong }
  begin
    GINTBIG_MIN:=(CPL_STATIC_CAST(GIntBig,$80000000)) shl 32;
  end;

{ was #define dname def_expr }
function GINTBIG_MAX : longint; { return type might be wrong }
  begin
    GINTBIG_MAX:=((CPL_STATIC_CAST(GIntBig,$7FFFFFFF)) shl 32) or $FFFFFFFF;
  end;

{ was #define dname def_expr }
function GUINTBIG_MAX : longint; { return type might be wrong }
  begin
    GUINTBIG_MAX:=((CPL_STATIC_CAST(GUIntBig,$FFFFFFFF)) shl 32) or $FFFFFFFF;
  end;


end.
