unit libvirt_gconfig_network;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-network.c: libvirt network configuration
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
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

type
{ Do not add fields to this struct  }
  PGVirConfigNetwork = ^TGVirConfigNetwork;
  TGVirConfigNetwork = record
      parent : TGVirConfigObject;
      priv : PGVirConfigNetworkPrivate;
    end;

  PGVirConfigNetworkClass = ^TGVirConfigNetworkClass;
  TGVirConfigNetworkClass = record
      parent_class : TGVirConfigObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_network_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_network_new:PGVirConfigNetwork;cdecl;external libvirtgconfig;
function gvir_config_network_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigNetwork;cdecl;external libvirtgconfig;

// === Konventiert am: 18-10-26 12:53:13 ===

function GVIR_CONFIG_TYPE_NETWORK : TGType;
function GVIR_CONFIG_NETWORK(obj : Pointer) : PGVirConfigNetwork;
function GVIR_CONFIG_NETWORK_CLASS(klass : Pointer) : PGVirConfigNetworkClass;
function GVIR_CONFIG_IS_NETWORK(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_NETWORK_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_NETWORK_GET_CLASS(obj : Pointer) : PGVirConfigNetworkClass;

implementation

function GVIR_CONFIG_TYPE_NETWORK : TGType;
  begin
    GVIR_CONFIG_TYPE_NETWORK:=gvir_config_network_get_type;
  end;

function GVIR_CONFIG_NETWORK(obj : Pointer) : PGVirConfigNetwork;
begin
  Result := PGVirConfigNetwork(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_NETWORK));
end;

function GVIR_CONFIG_NETWORK_CLASS(klass : Pointer) : PGVirConfigNetworkClass;
begin
  Result := PGVirConfigNetworkClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_NETWORK));
end;

function GVIR_CONFIG_IS_NETWORK(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_NETWORK);
end;

function GVIR_CONFIG_IS_NETWORK_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_NETWORK);
end;

function GVIR_CONFIG_NETWORK_GET_CLASS(obj : Pointer) : PGVirConfigNetworkClass;
begin
  Result := PGVirConfigNetworkClass(PGTypeInstance(obj)^.g_class);
end;



end.
