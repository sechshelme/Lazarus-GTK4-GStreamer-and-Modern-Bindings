unit libvirt_nwfilter;

interface

uses
  fp_virt;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-nwfilter.h
 * Summary: APIs for management of nwfilters
 * Description: Provides APIs for the management of nwfilters
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
{$ifndef LIBVIRT_NWFILTER_H}
{$define LIBVIRT_NWFILTER_H}
{$ifndef __VIR_LIBVIRT_H_INCLUDES__}
{$error "Don't include this file directly, only use libvirt/libvirt.h"}
{$endif}
{*
 * virNWFilter:
 *
 * a virNWFilter is a private structure representing a network filter
 *
 * Since: 0.8.0
  }
type
{*
 * virNWFilterPtr:
 *
 * a virNWFilterPtr is pointer to a virNWFilter private structure,
 * this is the type used to reference a network filter in the API.
 *
 * Since: 0.8.0
  }

  PvirNWFilterPtr = ^TvirNWFilterPtr;
  TvirNWFilterPtr = PvirNWFilter;
{*
 * virNWFilterBinding:
 *
 * a virNWFilterBinding is a private structure representing a network
 * filter binding to a port
 *
 * Since: 4.5.0
  }
{*
 * virNWFilterBindingPtr:
 *
 * a virNWFilterBindingPtr is pointer to a virNWFilterBinding private
 * structure, this is the type used to reference a network filter
 * port binding in the API.
 *
 * Since: 4.5.0
  }

  PvirNWFilterBindingPtr = ^TvirNWFilterBindingPtr;
  TvirNWFilterBindingPtr = PvirNWFilterBinding;
{
 * List NWFilters
  }

function virConnectNumOfNWFilters(conn:TvirConnectPtr):longint;cdecl;external libvirt;
function virConnectListNWFilters(conn:TvirConnectPtr; names:PPchar; maxnames:longint):longint;cdecl;external libvirt;
function virConnectListAllNWFilters(conn:TvirConnectPtr; filters:PPvirNWFilterPtr; flags:dword):longint;cdecl;external libvirt;
{
 * Lookup nwfilter by name or uuid
  }
function virNWFilterLookupByName(conn:TvirConnectPtr; name:Pchar):TvirNWFilterPtr;cdecl;external libvirt;
function virNWFilterLookupByUUID(conn:TvirConnectPtr; uuid:Pbyte):TvirNWFilterPtr;cdecl;external libvirt;
function virNWFilterLookupByUUIDString(conn:TvirConnectPtr; uuid:Pchar):TvirNWFilterPtr;cdecl;external libvirt;
{*
 * virNWFilterDefineFlags:
 *
 * Since: 7.7.0
  }
{ Validate the XML document against schema (Since: 7.7.0)  }
type
  PvirNWFilterDefineFlags = ^TvirNWFilterDefineFlags;
  TvirNWFilterDefineFlags =  Longint;
  Const
    VIR_NWFILTER_DEFINE_VALIDATE = 1 shl 0;
;
{
 * Define persistent nwfilter
  }

function virNWFilterDefineXML(conn:TvirConnectPtr; xmlDesc:Pchar):TvirNWFilterPtr;cdecl;external libvirt;
function virNWFilterDefineXMLFlags(conn:TvirConnectPtr; xmlDesc:Pchar; flags:dword):TvirNWFilterPtr;cdecl;external libvirt;
{
 * Delete persistent nwfilter
  }
function virNWFilterUndefine(nwfilter:TvirNWFilterPtr):longint;cdecl;external libvirt;
{
 * NWFilter destroy/free
  }
function virNWFilterRef(nwfilter:TvirNWFilterPtr):longint;cdecl;external libvirt;
function virNWFilterFree(nwfilter:TvirNWFilterPtr):longint;cdecl;external libvirt;
{
 * NWFilter information
  }
{*
 * virNWFilterBindingCreateFlags:
 *
 * Since: 7.8.0
  }
{ Validate the XML document against schema (Since: 7.8.0)  }
type
  PvirNWFilterBindingCreateFlags = ^TvirNWFilterBindingCreateFlags;
  TvirNWFilterBindingCreateFlags =  Longint;
  Const
    VIR_NWFILTER_BINDING_CREATE_VALIDATE = 1 shl 0;
;

function virNWFilterGetName(nwfilter:TvirNWFilterPtr):Pchar;cdecl;external libvirt;
function virNWFilterGetUUID(nwfilter:TvirNWFilterPtr; uuid:Pbyte):longint;cdecl;external libvirt;
function virNWFilterGetUUIDString(nwfilter:TvirNWFilterPtr; buf:Pchar):longint;cdecl;external libvirt;
function virNWFilterGetXMLDesc(nwfilter:TvirNWFilterPtr; flags:dword):Pchar;cdecl;external libvirt;
function virNWFilterBindingLookupByPortDev(conn:TvirConnectPtr; portdev:Pchar):TvirNWFilterBindingPtr;cdecl;external libvirt;
function virNWFilterBindingGetPortDev(binding:TvirNWFilterBindingPtr):Pchar;cdecl;external libvirt;
function virNWFilterBindingGetFilterName(binding:TvirNWFilterBindingPtr):Pchar;cdecl;external libvirt;
function virConnectListAllNWFilterBindings(conn:TvirConnectPtr; bindings:PPvirNWFilterBindingPtr; flags:dword):longint;cdecl;external libvirt;
function virNWFilterBindingCreateXML(conn:TvirConnectPtr; xml:Pchar; flags:dword):TvirNWFilterBindingPtr;cdecl;external libvirt;
function virNWFilterBindingGetXMLDesc(binding:TvirNWFilterBindingPtr; flags:dword):Pchar;cdecl;external libvirt;
function virNWFilterBindingDelete(binding:TvirNWFilterBindingPtr):longint;cdecl;external libvirt;
function virNWFilterBindingRef(binding:TvirNWFilterBindingPtr):longint;cdecl;external libvirt;
function virNWFilterBindingFree(binding:TvirNWFilterBindingPtr):longint;cdecl;external libvirt;
{$endif}
{ LIBVIRT_NWFILTER_H  }

// === Konventiert am: 14-10-26 19:34:30 ===


implementation



end.
