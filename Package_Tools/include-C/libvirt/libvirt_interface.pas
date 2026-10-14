unit libvirt_interface;

interface

uses
  fp_virt;

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

function virInterfaceGetConnect(iface:TvirInterfacePtr):TvirConnectPtr;cdecl;external libvirt;
function virConnectNumOfInterfaces(conn:TvirConnectPtr):longint;cdecl;external libvirt;
function virConnectListInterfaces(conn:TvirConnectPtr; names:PPchar; maxnames:longint):longint;cdecl;external libvirt;
function virConnectNumOfDefinedInterfaces(conn:TvirConnectPtr):longint;cdecl;external libvirt;
function virConnectListDefinedInterfaces(conn:TvirConnectPtr; names:PPchar; maxnames:longint):longint;cdecl;external libvirt;
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

function virConnectListAllInterfaces(conn:TvirConnectPtr; ifaces:PPvirInterfacePtr; flags:dword):longint;cdecl;external libvirt;
function virInterfaceLookupByName(conn:TvirConnectPtr; name:Pchar):TvirInterfacePtr;cdecl;external libvirt;
function virInterfaceLookupByMACString(conn:TvirConnectPtr; mac:Pchar):TvirInterfacePtr;cdecl;external libvirt;
function virInterfaceGetName(iface:TvirInterfacePtr):Pchar;cdecl;external libvirt;
function virInterfaceGetMACString(iface:TvirInterfacePtr):Pchar;cdecl;external libvirt;
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

function virInterfaceGetXMLDesc(iface:TvirInterfacePtr; flags:dword):Pchar;cdecl;external libvirt;
function virInterfaceDefineXML(conn:TvirConnectPtr; xmlDesc:Pchar; flags:dword):TvirInterfacePtr;cdecl;external libvirt;
function virInterfaceUndefine(iface:TvirInterfacePtr):longint;cdecl;external libvirt;
function virInterfaceCreate(iface:TvirInterfacePtr; flags:dword):longint;cdecl;external libvirt;
function virInterfaceDestroy(iface:TvirInterfacePtr; flags:dword):longint;cdecl;external libvirt;
function virInterfaceRef(iface:TvirInterfacePtr):longint;cdecl;external libvirt;
function virInterfaceFree(iface:TvirInterfacePtr):longint;cdecl;external libvirt;
function virInterfaceChangeBegin(conn:TvirConnectPtr; flags:dword):longint;cdecl;external libvirt;
function virInterfaceChangeCommit(conn:TvirConnectPtr; flags:dword):longint;cdecl;external libvirt;
function virInterfaceChangeRollback(conn:TvirConnectPtr; flags:dword):longint;cdecl;external libvirt;
function virInterfaceIsActive(iface:TvirInterfacePtr):longint;cdecl;external libvirt;
{$endif}
{ LIBVIRT_INTERFACE_H  }

// === Konventiert am: 14-10-26 19:34:40 ===


implementation



end.
