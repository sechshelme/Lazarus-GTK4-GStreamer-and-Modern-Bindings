unit libvirt_gobject_network_dhcp_lease;

interface

uses
  fp_glib2, fp_virt_glib;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gobject-network-dhcp-lease.h: libvirt gobject integration
 *
 * Copyright (C) 2010-2011 Red Hat, Inc.
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
 * License along with this library. If not, see
 * <http://www.gnu.org/licenses/>.
 *
 * Authors: Zeeshan Ali (Khattak) <zeeshanak@gnome.org>
 *          Daniel P. Berrange <berrange@redhat.com>
  }
{$if !defined(__LIBVIRT_GOBJECT_H__) && !defined(LIBVIRT_GOBJECT_BUILD)}
{$error "Only <libvirt-gobject/libvirt-gobject.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)
{*
 * GVirIPAddrType:
 * @GVIR_IP_ADDR_TYPE_IPV4: IPv4 Address.
 * @GVIR_IP_ADDR_TYPE_IPV6: IPv6 Address.
  }
type
  PGVirIPAddrType = ^TGVirIPAddrType;
  TGVirIPAddrType =  Longint;
  Const
    GVIR_IP_ADDR_TYPE_IPV4 = 0;
    GVIR_IP_ADDR_TYPE_IPV6 = 1;
;

type
{ Do not add fields to this struct  }
  PGVirNetworkDHCPLease = ^TGVirNetworkDHCPLease;
  TGVirNetworkDHCPLease = record
      parent : TGObject;
      priv : PGVirNetworkDHCPLeasePrivate;
    end;

  PGVirNetworkDHCPLeaseClass = ^TGVirNetworkDHCPLeaseClass;
  TGVirNetworkDHCPLeaseClass = record
      parent_class : TGObjectClass;
      padding : array[0..6] of Tgpointer;
    end;


function gvir_network_dhcp_lease_get_type:TGType;cdecl;external libvirtgobject;
function gvir_network_dhcp_lease_get_iface(lease:PGVirNetworkDHCPLease):Pgchar;cdecl;external libvirtgobject;
function gvir_network_dhcp_lease_get_expiry_time(lease:PGVirNetworkDHCPLease):Tgint64;cdecl;external libvirtgobject;
function gvir_network_dhcp_lease_get_ip_type(lease:PGVirNetworkDHCPLease):Tgint;cdecl;external libvirtgobject;
function gvir_network_dhcp_lease_get_mac(lease:PGVirNetworkDHCPLease):Pgchar;cdecl;external libvirtgobject;
function gvir_network_dhcp_lease_get_iaid(lease:PGVirNetworkDHCPLease):Pgchar;cdecl;external libvirtgobject;
function gvir_network_dhcp_lease_get_ip(lease:PGVirNetworkDHCPLease):Pgchar;cdecl;external libvirtgobject;
function gvir_network_dhcp_lease_get_prefix(lease:PGVirNetworkDHCPLease):Tguint;cdecl;external libvirtgobject;
function gvir_network_dhcp_lease_get_hostname(lease:PGVirNetworkDHCPLease):Pgchar;cdecl;external libvirtgobject;
function gvir_network_dhcp_lease_get_client_id(lease:PGVirNetworkDHCPLease):Pgchar;cdecl;external libvirtgobject;

// === Konventiert am: 18-10-26 19:32:05 ===

function GVIR_TYPE_NETWORK_DHCP_LEASE : TGType;
function GVIR_NETWORK_DHCP_LEASE(obj : Pointer) : PGVirNetworkDHCPLease;
function GVIR_NETWORK_DHCP_LEASE_CLASS(klass : Pointer) : PGVirNetworkDHCPLeaseClass;
function GVIR_IS_NETWORK_DHCP_LEASE(obj : Pointer) : Tgboolean;
function GVIR_IS_NETWORK_DHCP_LEASE_CLASS(klass : Pointer) : Tgboolean;
function GVIR_NETWORK_DHCP_LEASE_GET_CLASS(obj : Pointer) : PGVirNetworkDHCPLeaseClass;

implementation

function GVIR_TYPE_NETWORK_DHCP_LEASE : TGType;
  begin
    GVIR_TYPE_NETWORK_DHCP_LEASE:=gvir_network_dhcp_lease_get_type;
  end;

function GVIR_NETWORK_DHCP_LEASE(obj : Pointer) : PGVirNetworkDHCPLease;
begin
  Result := PGVirNetworkDHCPLease(g_type_check_instance_cast(obj, GVIR_TYPE_NETWORK_DHCP_LEASE));
end;

function GVIR_NETWORK_DHCP_LEASE_CLASS(klass : Pointer) : PGVirNetworkDHCPLeaseClass;
begin
  Result := PGVirNetworkDHCPLeaseClass(g_type_check_class_cast(klass, GVIR_TYPE_NETWORK_DHCP_LEASE));
end;

function GVIR_IS_NETWORK_DHCP_LEASE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_TYPE_NETWORK_DHCP_LEASE);
end;

function GVIR_IS_NETWORK_DHCP_LEASE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_TYPE_NETWORK_DHCP_LEASE);
end;

function GVIR_NETWORK_DHCP_LEASE_GET_CLASS(obj : Pointer) : PGVirNetworkDHCPLeaseClass;
begin
  Result := PGVirNetworkDHCPLeaseClass(PGTypeInstance(obj)^.g_class);
end;



end.
