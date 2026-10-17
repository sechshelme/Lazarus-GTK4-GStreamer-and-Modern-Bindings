unit libvirt_gconfig_domain_controller;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-controller.h: libvirt domain controller configuration
 *
 * Copyright (C) 2012 Red Hat, Inc.
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
 * Author: Christophe Fergeau <cfergeau@redhat.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

type
{ Do not add fields to this struct  }
  PGVirConfigDomainController = ^TGVirConfigDomainController;
  TGVirConfigDomainController = record
      parent : TGVirConfigDomainDevice;
      priv : PGVirConfigDomainControllerPrivate;
    end;

  PGVirConfigDomainControllerClass = ^TGVirConfigDomainControllerClass;
  TGVirConfigDomainControllerClass = record
      parent_class : TGVirConfigDomainDeviceClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_controller_get_type:TGType;cdecl;external libvirtgconfig;
procedure gvir_config_domain_controller_set_index(controller:PGVirConfigDomainController; index:Tguint);cdecl;external libvirtgconfig;
function gvir_config_domain_controller_get_index(controller:PGVirConfigDomainController):Tguint;cdecl;external libvirtgconfig;
procedure gvir_config_domain_controller_set_address(controller:PGVirConfigDomainController; address:PGVirConfigDomainAddress);cdecl;external libvirtgconfig;
procedure gvir_config_domain_controller_set_ports(controller:PGVirConfigDomainController; ports:Tguint);cdecl;external libvirtgconfig;
function gvir_config_domain_controller_get_ports(controller:PGVirConfigDomainController):Tguint;cdecl;external libvirtgconfig;

// === Konventiert am: 17-10-26 19:59:43 ===

function GVIR_CONFIG_TYPE_DOMAIN_CONTROLLER : TGType;
function GVIR_CONFIG_DOMAIN_CONTROLLER(obj : Pointer) : PGVirConfigDomainController;
function GVIR_CONFIG_DOMAIN_CONTROLLER_CLASS(klass : Pointer) : PGVirConfigDomainControllerClass;
function GVIR_CONFIG_IS_DOMAIN_CONTROLLER(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_CONTROLLER_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_CONTROLLER_GET_CLASS(obj : Pointer) : PGVirConfigDomainControllerClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_CONTROLLER : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_CONTROLLER:=gvir_config_domain_controller_get_type;
  end;

function GVIR_CONFIG_DOMAIN_CONTROLLER(obj : Pointer) : PGVirConfigDomainController;
begin
  Result := PGVirConfigDomainController(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_CONTROLLER));
end;

function GVIR_CONFIG_DOMAIN_CONTROLLER_CLASS(klass : Pointer) : PGVirConfigDomainControllerClass;
begin
  Result := PGVirConfigDomainControllerClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_CONTROLLER));
end;

function GVIR_CONFIG_IS_DOMAIN_CONTROLLER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_CONTROLLER);
end;

function GVIR_CONFIG_IS_DOMAIN_CONTROLLER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_CONTROLLER);
end;

function GVIR_CONFIG_DOMAIN_CONTROLLER_GET_CLASS(obj : Pointer) : PGVirConfigDomainControllerClass;
begin
  Result := PGVirConfigDomainControllerClass(PGTypeInstance(obj)^.g_class);
end;



end.
