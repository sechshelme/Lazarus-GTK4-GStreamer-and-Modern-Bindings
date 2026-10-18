unit libvirt_gconfig_domain_interface;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-interface.h: libvirt domain interface configuration
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
{$include <libvirt-gconfig/libvirt-gconfig-domain-interface-filterref.h>}

type
{ Do not add fields to this struct  }
  PGVirConfigDomainInterface = ^TGVirConfigDomainInterface;
  TGVirConfigDomainInterface = record
      parent : TGVirConfigDomainDevice;
      priv : PGVirConfigDomainInterfacePrivate;
    end;

  PGVirConfigDomainInterfaceClass = ^TGVirConfigDomainInterfaceClass;
  TGVirConfigDomainInterfaceClass = record
      parent_class : TGVirConfigDomainDeviceClass;
      padding : array[0..19] of Tgpointer;
    end;


  PGVirConfigDomainInterfaceLinkState = ^TGVirConfigDomainInterfaceLinkState;
  TGVirConfigDomainInterfaceLinkState =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_INTERFACE_LINK_STATE_DEFAULT = 0;
    GVIR_CONFIG_DOMAIN_INTERFACE_LINK_STATE_UP = 1;
    GVIR_CONFIG_DOMAIN_INTERFACE_LINK_STATE_DOWN = 2;
;

function gvir_config_domain_interface_get_type:TGType;cdecl;external libvirtgconfig;
procedure gvir_config_domain_interface_set_ifname(interface:PGVirConfigDomainInterface; ifname:Pchar);cdecl;external libvirtgconfig;
procedure gvir_config_domain_interface_set_link_state(interface:PGVirConfigDomainInterface; state:TGVirConfigDomainInterfaceLinkState);cdecl;external libvirtgconfig;
procedure gvir_config_domain_interface_set_mac(interface:PGVirConfigDomainInterface; mac_address:Pchar);cdecl;external libvirtgconfig;
procedure gvir_config_domain_interface_set_model(interface:PGVirConfigDomainInterface; model:Pchar);cdecl;external libvirtgconfig;
function gvir_config_domain_interface_get_ifname(interface:PGVirConfigDomainInterface):Pchar;cdecl;external libvirtgconfig;
function gvir_config_domain_interface_get_link_state(interface:PGVirConfigDomainInterface):TGVirConfigDomainInterfaceLinkState;cdecl;external libvirtgconfig;
function gvir_config_domain_interface_get_mac(interface:PGVirConfigDomainInterface):Pchar;cdecl;external libvirtgconfig;
function gvir_config_domain_interface_get_model(interface:PGVirConfigDomainInterface):Pchar;cdecl;external libvirtgconfig;
procedure gvir_config_domain_interface_set_filterref(interface:PGVirConfigDomainInterface; filterref:PGVirConfigDomainInterfaceFilterref);cdecl;external libvirtgconfig;
function gvir_config_domain_interface_get_filterref(interface:PGVirConfigDomainInterface):PGVirConfigDomainInterfaceFilterref;cdecl;external libvirtgconfig;

// === Konventiert am: 18-10-26 12:43:24 ===

function GVIR_CONFIG_TYPE_DOMAIN_INTERFACE : TGType;
function GVIR_CONFIG_DOMAIN_INTERFACE(obj : Pointer) : PGVirConfigDomainInterface;
function GVIR_CONFIG_DOMAIN_INTERFACE_CLASS(klass : Pointer) : PGVirConfigDomainInterfaceClass;
function GVIR_CONFIG_IS_DOMAIN_INTERFACE(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_INTERFACE_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_INTERFACE_GET_CLASS(obj : Pointer) : PGVirConfigDomainInterfaceClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_INTERFACE : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_INTERFACE:=gvir_config_domain_interface_get_type;
  end;

function GVIR_CONFIG_DOMAIN_INTERFACE(obj : Pointer) : PGVirConfigDomainInterface;
begin
  Result := PGVirConfigDomainInterface(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE));
end;

function GVIR_CONFIG_DOMAIN_INTERFACE_CLASS(klass : Pointer) : PGVirConfigDomainInterfaceClass;
begin
  Result := PGVirConfigDomainInterfaceClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE));
end;

function GVIR_CONFIG_IS_DOMAIN_INTERFACE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_INTERFACE);
end;

function GVIR_CONFIG_IS_DOMAIN_INTERFACE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_INTERFACE);
end;

function GVIR_CONFIG_DOMAIN_INTERFACE_GET_CLASS(obj : Pointer) : PGVirConfigDomainInterfaceClass;
begin
  Result := PGVirConfigDomainInterfaceClass(PGTypeInstance(obj)^.g_class);
end;



end.
