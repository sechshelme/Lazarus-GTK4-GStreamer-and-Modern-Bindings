
unit libvirt_interface;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_interface.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_interface.h
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
PvirConnectListAllInterfacesFlags  = ^virConnectListAllInterfacesFlags;
PvirInterface  = ^virInterface;
PvirInterfaceDefineFlags  = ^virInterfaceDefineFlags;
PvirInterfacePtr  = ^virInterfacePtr;
PvirInterfaceXMLFlags  = ^virInterfaceXMLFlags;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-interface.h
 * Summary: APIs for management of interfaces
 * Description: Provides APIs for the management of interfaces
 *
 * Copyright (C) 2006-2014 Red Hat, Inc.
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
{$ifndef LIBVIRT_INTERFACE_H}
{$define LIBVIRT_INTERFACE_H}
{$ifndef __VIR_LIBVIRT_H_INCLUDES__}
{$error "Don't include this file directly, only use libvirt/libvirt.h"}
{$endif}
{*
 * virInterface:
 *
 * a virInterface is a private structure representing a virtual interface.
 *
 * Since: 0.6.4
  }
type
{*
 * virInterfacePtr:
 *
 * a virInterfacePtr is pointer to a virInterface private structure, this is the
 * type used to reference a virtual interface in the API.
 *
 * Since: 0.6.4
  }

  PvirInterfacePtr = ^TvirInterfacePtr;
  TvirInterfacePtr = PvirInterface;

function virInterfaceGetConnect(iface:TvirInterfacePtr):TvirConnectPtr;cdecl;external;
function virConnectNumOfInterfaces(conn:TvirConnectPtr):longint;cdecl;external;
(* Const before declarator ignored *)
function virConnectListInterfaces(conn:TvirConnectPtr; names:PPchar; maxnames:longint):longint;cdecl;external;
function virConnectNumOfDefinedInterfaces(conn:TvirConnectPtr):longint;cdecl;external;
(* Const before declarator ignored *)
function virConnectListDefinedInterfaces(conn:TvirConnectPtr; names:PPchar; maxnames:longint):longint;cdecl;external;
{*
 * virConnectListAllInterfacesFlags:
 *
 * Flags used to filter the returned interfaces.
 *
 * Since: 0.10.2
  }
{ (Since: 0.10.2)  }
{ (Since: 0.10.2)  }
type
  PvirConnectListAllInterfacesFlags = ^TvirConnectListAllInterfacesFlags;
  TvirConnectListAllInterfacesFlags =  Longint;
  Const
    VIR_CONNECT_LIST_INTERFACES_INACTIVE = 1 shl 0;
    VIR_CONNECT_LIST_INTERFACES_ACTIVE = 1 shl 1;
;

function virConnectListAllInterfaces(conn:TvirConnectPtr; ifaces:PPvirInterfacePtr; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
function virInterfaceLookupByName(conn:TvirConnectPtr; name:Pchar):TvirInterfacePtr;cdecl;external;
(* Const before type ignored *)
function virInterfaceLookupByMACString(conn:TvirConnectPtr; mac:Pchar):TvirInterfacePtr;cdecl;external;
(* Const before type ignored *)
function virInterfaceGetName(iface:TvirInterfacePtr):Pchar;cdecl;external;
(* Const before type ignored *)
function virInterfaceGetMACString(iface:TvirInterfacePtr):Pchar;cdecl;external;
{*
 * virInterfaceXMLFlags:
 *
 * Since: 0.7.3
  }
{ dump inactive interface information (Since: 0.7.3)  }
type
  PvirInterfaceXMLFlags = ^TvirInterfaceXMLFlags;
  TvirInterfaceXMLFlags =  Longint;
  Const
    VIR_INTERFACE_XML_INACTIVE = 1 shl 0;
;
{*
 * virInterfaceDefineFlags:
 *
 * Since: 7.7.0
  }
{ Validate the XML document against schema (Since: 7.7.0)  }
type
  PvirInterfaceDefineFlags = ^TvirInterfaceDefineFlags;
  TvirInterfaceDefineFlags =  Longint;
  Const
    VIR_INTERFACE_DEFINE_VALIDATE = 1 shl 0;
;

function virInterfaceGetXMLDesc(iface:TvirInterfacePtr; flags:dword):Pchar;cdecl;external;
(* Const before type ignored *)
function virInterfaceDefineXML(conn:TvirConnectPtr; xmlDesc:Pchar; flags:dword):TvirInterfacePtr;cdecl;external;
function virInterfaceUndefine(iface:TvirInterfacePtr):longint;cdecl;external;
function virInterfaceCreate(iface:TvirInterfacePtr; flags:dword):longint;cdecl;external;
function virInterfaceDestroy(iface:TvirInterfacePtr; flags:dword):longint;cdecl;external;
function virInterfaceRef(iface:TvirInterfacePtr):longint;cdecl;external;
function virInterfaceFree(iface:TvirInterfacePtr):longint;cdecl;external;
function virInterfaceChangeBegin(conn:TvirConnectPtr; flags:dword):longint;cdecl;external;
function virInterfaceChangeCommit(conn:TvirConnectPtr; flags:dword):longint;cdecl;external;
function virInterfaceChangeRollback(conn:TvirConnectPtr; flags:dword):longint;cdecl;external;
function virInterfaceIsActive(iface:TvirInterfacePtr):longint;cdecl;external;
{$endif}
{ LIBVIRT_INTERFACE_H  }

implementation


end.
