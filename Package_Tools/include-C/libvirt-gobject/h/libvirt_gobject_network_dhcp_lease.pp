
unit libvirt_gobject_network_dhcp_lease;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gobject_network_dhcp_lease.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gobject_network_dhcp_lease.h
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
Pgchar  = ^gchar;
PGVirIPAddrType  = ^GVirIPAddrType;
PGVirNetworkDHCPLease  = ^GVirNetworkDHCPLease;
PGVirNetworkDHCPLeaseClass  = ^GVirNetworkDHCPLeaseClass;
PGVirNetworkDHCPLeasePrivate  = ^GVirNetworkDHCPLeasePrivate;
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

{ was #define dname def_expr }
function GVIR_TYPE_NETWORK_DHCP_LEASE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_NETWORK_DHCP_LEASE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_NETWORK_DHCP_LEASE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_NETWORK_DHCP_LEASE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_NETWORK_DHCP_LEASE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_NETWORK_DHCP_LEASE_GET_CLASS(obj : longint) : longint;

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


function gvir_network_dhcp_lease_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gvir_network_dhcp_lease_get_iface(lease:PGVirNetworkDHCPLease):Pgchar;cdecl;external;
function gvir_network_dhcp_lease_get_expiry_time(lease:PGVirNetworkDHCPLease):Tgint64;cdecl;external;
function gvir_network_dhcp_lease_get_ip_type(lease:PGVirNetworkDHCPLease):Tgint;cdecl;external;
(* Const before type ignored *)
function gvir_network_dhcp_lease_get_mac(lease:PGVirNetworkDHCPLease):Pgchar;cdecl;external;
(* Const before type ignored *)
function gvir_network_dhcp_lease_get_iaid(lease:PGVirNetworkDHCPLease):Pgchar;cdecl;external;
(* Const before type ignored *)
function gvir_network_dhcp_lease_get_ip(lease:PGVirNetworkDHCPLease):Pgchar;cdecl;external;
function gvir_network_dhcp_lease_get_prefix(lease:PGVirNetworkDHCPLease):Tguint;cdecl;external;
(* Const before type ignored *)
function gvir_network_dhcp_lease_get_hostname(lease:PGVirNetworkDHCPLease):Pgchar;cdecl;external;
(* Const before type ignored *)
function gvir_network_dhcp_lease_get_client_id(lease:PGVirNetworkDHCPLease):Pgchar;cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_TYPE_NETWORK_DHCP_LEASE : longint; { return type might be wrong }
  begin
    GVIR_TYPE_NETWORK_DHCP_LEASE:=gvir_network_dhcp_lease_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_NETWORK_DHCP_LEASE(obj : longint) : longint;
begin
  GVIR_NETWORK_DHCP_LEASE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_TYPE_NETWORK_DHCP_LEASE,GVirNetworkDHCPLease);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_NETWORK_DHCP_LEASE_CLASS(klass : longint) : longint;
begin
  GVIR_NETWORK_DHCP_LEASE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_TYPE_NETWORK_DHCP_LEASE,GVirNetworkDHCPLeaseClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_NETWORK_DHCP_LEASE(obj : longint) : longint;
begin
  GVIR_IS_NETWORK_DHCP_LEASE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_TYPE_NETWORK_DHCP_LEASE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_NETWORK_DHCP_LEASE_CLASS(klass : longint) : longint;
begin
  GVIR_IS_NETWORK_DHCP_LEASE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_TYPE_NETWORK_DHCP_LEASE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_NETWORK_DHCP_LEASE_GET_CLASS(obj : longint) : longint;
begin
  GVIR_NETWORK_DHCP_LEASE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_TYPE_NETWORK_DHCP_LEASE,GVirNetworkDHCPLeaseClass);
end;


end.
