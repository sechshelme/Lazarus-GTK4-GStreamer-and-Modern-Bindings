
unit libvirt_gobject_connection;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gobject_connection.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gobject_connection.h
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
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGList  = ^GList;
PGVirConfigCapabilities  = ^GVirConfigCapabilities;
PGVirConfigDomain  = ^GVirConfigDomain;
PGVirConfigDomainCapabilities  = ^GVirConfigDomainCapabilities;
PGVirConfigStoragePool  = ^GVirConfigStoragePool;
PGVirConnection  = ^GVirConnection;
PGVirConnectionClass  = ^GVirConnectionClass;
PGVirConnectionPrivate  = ^GVirConnectionPrivate;
PGVirDomain  = ^GVirDomain;
PGVirInterface  = ^GVirInterface;
PGVirNetwork  = ^GVirNetwork;
PGVirNetworkFilter  = ^GVirNetworkFilter;
PGVirNodeDevice  = ^GVirNodeDevice;
PGVirNodeInfo  = ^GVirNodeInfo;
PGVirSecret  = ^GVirSecret;
PGVirStoragePool  = ^GVirStoragePool;
PGVirStream  = ^GVirStream;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gobject-connection.h: libvirt gobject integration
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
function GVIR_TYPE_CONNECTION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONNECTION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONNECTION_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_CONNECTION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_CONNECTION_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONNECTION_GET_CLASS(obj : longint) : longint;

{ was #define dname def_expr }
function GVIR_TYPE_CONNECTION_HANDLE : longint; { return type might be wrong }

type
{ string indicating the CPU model  }
{ memory size in kilobytes  }
{ the number of active CPUs  }
{ expected CPU frequency  }
{ the number of NUMA cell, 1 for unusual NUMA topologies or uniform memo  }
{ number of CPU sockets per node if nodes > 1, total number of CPU socke  }
{ number of cores per socket  }
{ number of threads per core  }
  PGVirNodeInfo = ^TGVirNodeInfo;
  TGVirNodeInfo = record
      model : array[0..31] of Tgchar;
      memory : Tgulong;
      cpus : Tguint;
      mhz : Tguint;
      nodes : Tguint;
      sockets : Tguint;
      cores : Tguint;
      threads : Tguint;
    end;

{ Do not add fields to this struct  }
  PGVirConnection = ^TGVirConnection;
  TGVirConnection = record
      parent : TGObject;
      priv : PGVirConnectionPrivate;
    end;

{ signals  }
  PGVirConnectionClass = ^TGVirConnectionClass;
  TGVirConnectionClass = record
      parent_class : TGObjectClass;
      connection_opened : procedure (conn:PGVirConnection);cdecl;
      connection_closed : procedure (conn:PGVirConnection);cdecl;
      domain_added : procedure (conn:PGVirConnection; dom:PGVirDomain);cdecl;
      domain_removed : procedure (conn:PGVirConnection; dom:PGVirDomain);cdecl;
      stream_new : function (conn:PGVirConnection; handle:Tgpointer):PGVirStream;cdecl;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_connection_get_type:TGType;cdecl;external;
function gvir_connection_handle_get_type:TGType;cdecl;external;
function gvir_node_info_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gvir_connection_new(uri:Pchar):PGVirConnection;cdecl;external;
function gvir_connection_open(conn:PGVirConnection; cancellable:PGCancellable; err:PPGError):Tgboolean;cdecl;external;
function gvir_connection_open_read_only(conn:PGVirConnection; cancellable:PGCancellable; err:PPGError):Tgboolean;cdecl;external;
procedure gvir_connection_open_async(conn:PGVirConnection; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gvir_connection_open_finish(conn:PGVirConnection; result:PGAsyncResult; err:PPGError):Tgboolean;cdecl;external;
procedure gvir_connection_open_read_only_async(conn:PGVirConnection; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gvir_connection_open_read_only_finish(conn:PGVirConnection; result:PGAsyncResult; err:PPGError):Tgboolean;cdecl;external;
function gvir_connection_is_open(conn:PGVirConnection):Tgboolean;cdecl;external;
function gvir_connection_is_read_only(conn:PGVirConnection):Tgboolean;cdecl;external;
procedure gvir_connection_close(conn:PGVirConnection);cdecl;external;
function gvir_connection_fetch_domains(conn:PGVirConnection; cancellable:PGCancellable; err:PPGError):Tgboolean;cdecl;external;
procedure gvir_connection_fetch_domains_async(conn:PGVirConnection; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gvir_connection_fetch_domains_finish(conn:PGVirConnection; result:PGAsyncResult; err:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gvir_connection_get_uri(conn:PGVirConnection):Pgchar;cdecl;external;
function gvir_connection_get_hypervisor_name(conn:PGVirConnection; err:PPGError):Pgchar;cdecl;external;
function gvir_connection_get_version(conn:PGVirConnection; err:PPGError):Tgulong;cdecl;external;
function gvir_connection_get_domains(conn:PGVirConnection):PGList;cdecl;external;
(* Const before type ignored *)
function gvir_connection_get_domain(conn:PGVirConnection; uuid:Pgchar):PGVirDomain;cdecl;external;
function gvir_connection_find_domain_by_id(conn:PGVirConnection; id:Tgint):PGVirDomain;cdecl;external;
(* Const before type ignored *)
function gvir_connection_find_domain_by_name(conn:PGVirConnection; name:Pgchar):PGVirDomain;cdecl;external;
function gvir_connection_create_domain(conn:PGVirConnection; conf:PGVirConfigDomain; err:PPGError):PGVirDomain;cdecl;external;
function gvir_connection_start_domain(conn:PGVirConnection; conf:PGVirConfigDomain; flags:Tguint; err:PPGError):PGVirDomain;cdecl;external;
function gvir_connection_fetch_interfaces(conn:PGVirConnection; cancellable:PGCancellable; err:PPGError):Tgboolean;cdecl;external;
procedure gvir_connection_fetch_interfaces_async(conn:PGVirConnection; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gvir_connection_fetch_interfaces_finish(conn:PGVirConnection; result:PGAsyncResult; err:PPGError):Tgboolean;cdecl;external;
function gvir_connection_get_interfaces(conn:PGVirConnection):PGList;cdecl;external;
(* Const before type ignored *)
function gvir_connection_get_interface(conn:PGVirConnection; name:Pgchar):PGVirInterface;cdecl;external;
(* Const before type ignored *)
function gvir_connection_find_interface_by_mac(conn:PGVirConnection; macaddr:Pgchar):PGVirInterface;cdecl;external;
function gvir_connection_fetch_networks(conn:PGVirConnection; cancellable:PGCancellable; err:PPGError):Tgboolean;cdecl;external;
procedure gvir_connection_fetch_networks_async(conn:PGVirConnection; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gvir_connection_fetch_networks_finish(conn:PGVirConnection; result:PGAsyncResult; err:PPGError):Tgboolean;cdecl;external;
function gvir_connection_get_networks(conn:PGVirConnection):PGList;cdecl;external;
(* Const before type ignored *)
function gvir_connection_get_network(conn:PGVirConnection; uuid:Pgchar):PGVirNetwork;cdecl;external;
(* Const before type ignored *)
function gvir_connection_find_network_by_name(conn:PGVirConnection; name:Pgchar):PGVirNetwork;cdecl;external;
{$if 0}

function gvir_connection_get_network_filters(conn:PGVirConnection):PGList;cdecl;external;
(* Const before type ignored *)
function gvir_connection_get_network_filter(conn:PGVirConnection; uuid:Pgchar):PGVirNetworkFilter;cdecl;external;
(* Const before type ignored *)
function gvir_connection_find_network_filter_by_name(conn:PGVirConnection; name:Pgchar):PGVirNetworkFilter;cdecl;external;
function gvir_connection_get_node_devices(conn:PGVirConnection):PGList;cdecl;external;
(* Const before type ignored *)
function gvir_connection_get_node_device(conn:PGVirConnection; name:Pgchar):PGVirNodeDevice;cdecl;external;
function gvir_connection_get_secrets(conn:PGVirConnection):PGList;cdecl;external;
(* Const before type ignored *)
function gvir_connection_get_secret(conn:PGVirConnection; uuid:Pgchar):PGVirSecret;cdecl;external;
{$endif}

function gvir_connection_fetch_storage_pools(conn:PGVirConnection; cancellable:PGCancellable; err:PPGError):Tgboolean;cdecl;external;
procedure gvir_connection_fetch_storage_pools_async(conn:PGVirConnection; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gvir_connection_fetch_storage_pools_finish(conn:PGVirConnection; result:PGAsyncResult; err:PPGError):Tgboolean;cdecl;external;
function gvir_connection_get_storage_pools(conn:PGVirConnection):PGList;cdecl;external;
(* Const before type ignored *)
function gvir_connection_get_storage_pool(conn:PGVirConnection; uuid:Pgchar):PGVirStoragePool;cdecl;external;
(* Const before type ignored *)
function gvir_connection_find_storage_pool_by_name(conn:PGVirConnection; name:Pgchar):PGVirStoragePool;cdecl;external;
function gvir_connection_create_storage_pool(conn:PGVirConnection; conf:PGVirConfigStoragePool; flags:Tguint; err:PPGError):PGVirStoragePool;cdecl;external;
function gvir_connection_get_stream(conn:PGVirConnection; flags:Tguint):PGVirStream;cdecl;external;
function gvir_connection_get_node_info(conn:PGVirConnection; err:PPGError):PGVirNodeInfo;cdecl;external;
function gvir_connection_get_capabilities(conn:PGVirConnection; err:PPGError):PGVirConfigCapabilities;cdecl;external;
procedure gvir_connection_get_capabilities_async(conn:PGVirConnection; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gvir_connection_get_capabilities_finish(conn:PGVirConnection; result:PGAsyncResult; err:PPGError):PGVirConfigCapabilities;cdecl;external;
function gvir_connection_restore_domain_from_file(conn:PGVirConnection; filename:Pgchar; custom_conf:PGVirConfigDomain; flags:Tguint; err:PPGError):Tgboolean;cdecl;external;
procedure gvir_connection_restore_domain_from_file_async(conn:PGVirConnection; filename:Pgchar; custom_conf:PGVirConfigDomain; flags:Tguint; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gvir_connection_restore_domain_from_file_finish(conn:PGVirConnection; result:PGAsyncResult; err:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gvir_connection_get_domain_capabilities(conn:PGVirConnection; emulatorbin:Pgchar; arch:Pgchar; machine:Pgchar; virttype:Pgchar; 
           flags:Tguint; err:PPGError):PGVirConfigDomainCapabilities;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gvir_connection_get_domain_capabilities_async(conn:PGVirConnection; emulatorbin:Pgchar; arch:Pgchar; machine:Pgchar; virttype:Pgchar; 
            flags:Tguint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gvir_connection_get_domain_capabilities_finish(conn:PGVirConnection; result:PGAsyncResult; err:PPGError):PGVirConfigDomainCapabilities;cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_TYPE_CONNECTION : longint; { return type might be wrong }
  begin
    GVIR_TYPE_CONNECTION:=gvir_connection_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONNECTION(obj : longint) : longint;
begin
  GVIR_CONNECTION:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_TYPE_CONNECTION,GVirConnection);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONNECTION_CLASS(klass : longint) : longint;
begin
  GVIR_CONNECTION_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_TYPE_CONNECTION,GVirConnectionClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_CONNECTION(obj : longint) : longint;
begin
  GVIR_IS_CONNECTION:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_TYPE_CONNECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_CONNECTION_CLASS(klass : longint) : longint;
begin
  GVIR_IS_CONNECTION_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_TYPE_CONNECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONNECTION_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONNECTION_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_TYPE_CONNECTION,GVirConnectionClass);
end;

{ was #define dname def_expr }
function GVIR_TYPE_CONNECTION_HANDLE : longint; { return type might be wrong }
  begin
    GVIR_TYPE_CONNECTION_HANDLE:=gvir_connection_handle_get_type;
  end;


end.
