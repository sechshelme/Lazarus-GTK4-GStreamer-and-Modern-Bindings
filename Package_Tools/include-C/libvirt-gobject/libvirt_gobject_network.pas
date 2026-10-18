unit libvirt_gobject_network;

interface

uses
  fp_glib2, fp_virt_glib;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gobject-network.c: libvirt gobject integration
 *
 * Copyright (C) 2010-2011 Red Hat, Inc.
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
 * License along with this library. If not, see
 * <http://www.gnu.org/licenses/>.
 *
 * Author: Daniel P. Berrange <berrange@redhat.com>
  }
{$if !defined(__LIBVIRT_GOBJECT_H__) && !defined(LIBVIRT_GOBJECT_BUILD)}
{$error "Only <libvirt-gobject/libvirt-gobject.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

{ was #define dname def_expr }
function GVIR_TYPE_NETWORK_HANDLE : longint; { return type might be wrong }

type
{ Do not add fields to this struct  }
  PGVirNetwork = ^TGVirNetwork;
  TGVirNetwork = record
      parent : TGObject;
      priv : PGVirNetworkPrivate;
    end;

  PGVirNetworkClass = ^TGVirNetworkClass;
  TGVirNetworkClass = record
      parent_class : TGObjectClass;
      started : procedure (net:PGVirNetwork);cdecl;
      stopped : procedure (net:PGVirNetwork);cdecl;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_network_get_type:TGType;cdecl;external libvirtgobject;
function gvir_network_handle_get_type:TGType;cdecl;external libvirtgobject;
function gvir_network_get_name(network:PGVirNetwork):Pgchar;cdecl;external libvirtgobject;
function gvir_network_get_uuid(network:PGVirNetwork):Pgchar;cdecl;external libvirtgobject;
function gvir_network_get_config(network:PGVirNetwork; flags:Tguint; err:PPGError):PGVirConfigNetwork;cdecl;external libvirtgobject;
function gvir_network_get_dhcp_leases(network:PGVirNetwork; mac:Pchar; flags:Tguint; err:PPGError):PGList;cdecl;external libvirtgobject;

// === Konventiert am: 18-10-26 19:32:08 ===

function GVIR_TYPE_NETWORK : TGType;
function GVIR_NETWORK(obj : Pointer) : PGVirNetwork;
function GVIR_NETWORK_CLASS(klass : Pointer) : PGVirNetworkClass;
function GVIR_IS_NETWORK(obj : Pointer) : Tgboolean;
function GVIR_IS_NETWORK_CLASS(klass : Pointer) : Tgboolean;
function GVIR_NETWORK_GET_CLASS(obj : Pointer) : PGVirNetworkClass;

implementation

function GVIR_TYPE_NETWORK : TGType;
  begin
    GVIR_TYPE_NETWORK:=gvir_network_get_type;
  end;

function GVIR_NETWORK(obj : Pointer) : PGVirNetwork;
begin
  Result := PGVirNetwork(g_type_check_instance_cast(obj, GVIR_TYPE_NETWORK));
end;

function GVIR_NETWORK_CLASS(klass : Pointer) : PGVirNetworkClass;
begin
  Result := PGVirNetworkClass(g_type_check_class_cast(klass, GVIR_TYPE_NETWORK));
end;

function GVIR_IS_NETWORK(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_TYPE_NETWORK);
end;

function GVIR_IS_NETWORK_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_TYPE_NETWORK);
end;

function GVIR_NETWORK_GET_CLASS(obj : Pointer) : PGVirNetworkClass;
begin
  Result := PGVirNetworkClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname def_expr }
function GVIR_TYPE_NETWORK_HANDLE : longint; { return type might be wrong }
  begin
    GVIR_TYPE_NETWORK_HANDLE:=gvir_network_handle_get_type;
  end;


end.
