
unit libvirt_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_common.h
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
Pdouble  = ^double;
Pdword  = ^dword;
Pint64  = ^int64;
Plongint  = ^longint;
Pqword  = ^qword;
PvirConnectCloseReason  = ^virConnectCloseReason;
PvirTypedParameter  = ^virTypedParameter;
PvirTypedParameterFlags  = ^virTypedParameterFlags;
PvirTypedParameterPtr  = ^virTypedParameterPtr;
PvirTypedParameterType  = ^virTypedParameterType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-common.h
 * Summary: common macros and enums for the libvirt and libvirt-admin library
 * Description: Provides common macros and enums needed by both libvirt and
 *              libvirt-admin libraries
 *
 * Copyright (C) 2015 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library.  If not, see
 * <http://www.gnu.org/licenses/>.
  }
{$if !defined __VIR_LIBVIRT_H_INCLUDES__ && !defined __VIR_ADMIN_H_INCLUDES__}
{$error "Don't include this file directly"}
{$endif}
{$ifndef __VIR_VIRCOMMON_H__}
{$define __VIR_VIRCOMMON_H__}
{$include <sys/types.h>}
{ General note - in the header files, any linear enumeration which
 * might be expanded in the future has an optional *_LAST value that
 * gives the size of the enum at the time of compilation, if the user
 * defines VIR_ENUM_SENTINELS.  Enumerations for bit values do not
 * have a *_LAST value, but additional bits may be defined.   }
{ library versioning  }
{*
 * LIBVIR_VERSION_NUMBER:
 *
 * Macro providing the version of the library as
 * version * 1,000,000 + minor * 1000 + micro
 *
 * Since: 0.0.1
  }

const
  LIBVIR_VERSION_NUMBER = 10000000;  
{*
 * LIBVIR_CHECK_VERSION:
 * @major: major component of the version number
 * @minor: minor component of the version number
 * @micro: micro component of the version number
 *
 * Macro for developers to easily check what version of the library
 * their code is compiling against.
 * e.g.
 *   #if LIBVIR_CHECK_VERSION(1,1,3)
 *     // some code that only works in 1.1.3 and newer
 *   #endif
 *
 * Since: 1.2.0
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function LIBVIR_CHECK_VERSION(major,minor,micro : longint) : longint;

{
 * virFreeCallback:
 * @opaque: opaque user data provided at registration
 *
 * Type for a callback cleanup function to be paired with a callback.  This
 * function will be called as a final chance to clean up the @opaque
 * registered with the primary callback, at the time when the primary
 * callback is deregistered.
 *
 * It is forbidden to call any other libvirt APIs from an
 * implementation of this callback, since it can be invoked
 * from a context which is not re-entrant safe. Failure to
 * abide by this requirement may lead to application deadlocks
 * or crashes.
 *
 * Since: 0.5.0
  }
type

  TvirFreeCallback = procedure (opaque:pointer);cdecl;
{*
 * virConnectCloseReason:
 *
 * Since: 0.10.0
  }
{ Misc I/O error (Since: 0.10.0)  }
{ End-of-file from server (Since: 0.10.0)  }
{ Keepalive timer triggered (Since: 0.10.0)  }
{ Client requested it (Since: 0.10.0)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 0.10.0)  }
{$endif}
type
  PvirConnectCloseReason = ^TvirConnectCloseReason;
  TvirConnectCloseReason =  Longint;
  Const
    VIR_CONNECT_CLOSE_REASON_ERROR = 0;
    VIR_CONNECT_CLOSE_REASON_EOF = 1;
    VIR_CONNECT_CLOSE_REASON_KEEPALIVE = 2;
    VIR_CONNECT_CLOSE_REASON_CLIENT = 3;
    VIR_CONNECT_CLOSE_REASON_LAST = 4;
;
{*
 * virTypedParameterType:
 *
 * Express the type of a virTypedParameter
 *
 * Since: 0.9.2
  }
{ integer case (Since: 0.9.2)  }
{ unsigned integer case (Since: 0.9.2)  }
{ long long case (Since: 0.9.2)  }
{ unsigned long long case (Since: 0.9.2)  }
{ double case (Since: 0.9.2)  }
{ boolean(character) case (Since: 0.9.2)  }
{ string case (Since: 0.9.8)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 0.9.10)  }
{$endif}
type
  PvirTypedParameterType = ^TvirTypedParameterType;
  TvirTypedParameterType =  Longint;
  Const
    VIR_TYPED_PARAM_INT = 1;
    VIR_TYPED_PARAM_UINT = 2;
    VIR_TYPED_PARAM_LLONG = 3;
    VIR_TYPED_PARAM_ULLONG = 4;
    VIR_TYPED_PARAM_DOUBLE = 5;
    VIR_TYPED_PARAM_BOOLEAN = 6;
    VIR_TYPED_PARAM_STRING = 7;
    VIR_TYPED_PARAM_LAST = 8;
;
{*
 * virTypedParameterFlags:
 *
 * Flags related to libvirt APIs that use virTypedParameter.
 *
 * These enums should not conflict with those of virDomainModificationImpact.
 *
 * Since: 0.9.8
  }
{ 1 << 0 is reserved for virDomainModificationImpact  }
{ 1 << 1 is reserved for virDomainModificationImpact  }
{ Older servers lacked the ability to handle string typed
     * parameters.  Attempts to set a string parameter with an older
     * server will fail at the client, but attempts to retrieve
     * parameters must not return strings from a new server to an
     * older client, so this flag exists to identify newer clients to
     * newer servers.  This flag is automatically set when needed, so
     * the user does not have to worry about it; however, manually
     * setting the flag can be used to reject servers that cannot
     * return typed strings, even if no strings would be returned.
     *
     * Since: 0.9.8
      }
type
  PvirTypedParameterFlags = ^TvirTypedParameterFlags;
  TvirTypedParameterFlags =  Longint;
  Const
    VIR_TYPED_PARAM_STRING_OKAY = 1 shl 2;
;
{*
 * VIR_TYPED_PARAM_FIELD_LENGTH:
 *
 * Macro providing the field length of virTypedParameter name
 *
 * Since: 0.9.2
  }
  VIR_TYPED_PARAM_FIELD_LENGTH = 80;  
{*
 * virTypedParameter:
 *
 * A named parameter, including a type and value.
 *
 * The types virSchedParameter, virBlkioParameter, and
 * virMemoryParameter are aliases of this type, for use when
 * targeting libvirt earlier than 0.9.2.
 *
 * Since: 0.9.2
  }
type
{ parameter name  }
{ parameter type, virTypedParameterType  }
{ type is INT  }
{ type is UINT  }
{ type is LLONG  }
{ type is ULLONG  }
{ type is DOUBLE  }
{ type is BOOLEAN  }
{ type is STRING, may not be NULL  }
{ parameter value  }
  PvirTypedParameter = ^TvirTypedParameter;
  TvirTypedParameter = record
      field : array[0..(VIR_TYPED_PARAM_FIELD_LENGTH)-1] of char;
      _type : longint;
      value : record
          case longint of
            0 : ( i : longint );
            1 : ( ui : dword );
            2 : ( l : int64 );
            3 : ( ul : qword );
            4 : ( d : Tdouble );
            5 : ( b : char );
            6 : ( s : Pchar );
          end;
    end;

{*
 * virTypedParameterPtr:
 *
 * a pointer to a virTypedParameter structure.
 *
 * Since: 0.9.2
  }

  PvirTypedParameterPtr = ^TvirTypedParameterPtr;
  TvirTypedParameterPtr = PvirTypedParameter;
(* Const before type ignored *)

function virTypedParamsGet(params:TvirTypedParameterPtr; nparams:longint; name:Pchar):TvirTypedParameterPtr;cdecl;external;
(* Const before type ignored *)
function virTypedParamsGetInt(params:TvirTypedParameterPtr; nparams:longint; name:Pchar; value:Plongint):longint;cdecl;external;
(* Const before type ignored *)
function virTypedParamsGetUInt(params:TvirTypedParameterPtr; nparams:longint; name:Pchar; value:Pdword):longint;cdecl;external;
(* Const before type ignored *)
function virTypedParamsGetLLong(params:TvirTypedParameterPtr; nparams:longint; name:Pchar; value:Pint64):longint;cdecl;external;
(* Const before type ignored *)
function virTypedParamsGetULLong(params:TvirTypedParameterPtr; nparams:longint; name:Pchar; value:Pqword):longint;cdecl;external;
(* Const before type ignored *)
function virTypedParamsGetDouble(params:TvirTypedParameterPtr; nparams:longint; name:Pchar; value:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
function virTypedParamsGetBoolean(params:TvirTypedParameterPtr; nparams:longint; name:Pchar; value:Plongint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function virTypedParamsGetString(params:TvirTypedParameterPtr; nparams:longint; name:Pchar; value:PPchar):longint;cdecl;external;
(* Const before type ignored *)
function virTypedParamsAddInt(params:PvirTypedParameterPtr; nparams:Plongint; maxparams:Plongint; name:Pchar; value:longint):longint;cdecl;external;
(* Const before type ignored *)
function virTypedParamsAddUInt(params:PvirTypedParameterPtr; nparams:Plongint; maxparams:Plongint; name:Pchar; value:dword):longint;cdecl;external;
(* Const before type ignored *)
function virTypedParamsAddLLong(params:PvirTypedParameterPtr; nparams:Plongint; maxparams:Plongint; name:Pchar; value:int64):longint;cdecl;external;
(* Const before type ignored *)
function virTypedParamsAddULLong(params:PvirTypedParameterPtr; nparams:Plongint; maxparams:Plongint; name:Pchar; value:qword):longint;cdecl;external;
(* Const before type ignored *)
function virTypedParamsAddDouble(params:PvirTypedParameterPtr; nparams:Plongint; maxparams:Plongint; name:Pchar; value:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
function virTypedParamsAddBoolean(params:PvirTypedParameterPtr; nparams:Plongint; maxparams:Plongint; name:Pchar; value:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function virTypedParamsAddString(params:PvirTypedParameterPtr; nparams:Plongint; maxparams:Plongint; name:Pchar; value:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function virTypedParamsAddStringList(params:PvirTypedParameterPtr; nparams:Plongint; maxparams:Plongint; name:Pchar; values:PPchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function virTypedParamsAddFromString(params:PvirTypedParameterPtr; nparams:Plongint; maxparams:Plongint; name:Pchar; _type:longint; 
           value:Pchar):longint;cdecl;external;
procedure virTypedParamsClear(params:TvirTypedParameterPtr; nparams:longint);cdecl;external;
procedure virTypedParamsFree(params:TvirTypedParameterPtr; nparams:longint);cdecl;external;
{$endif}
{ __VIR_VIRCOMMON_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBVIR_CHECK_VERSION(major,minor,micro : longint) : longint;
begin
  LIBVIR_CHECK_VERSION:=(((major*1000000)+(minor*1000))+micro)<=LIBVIR_VERSION_NUMBER;
end;


end.
