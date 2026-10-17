unit libvirt_gconfig_capabilities_host_secmodel;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-capabilities-host-secmodel.h: libvirt security model capabilities
 *
 * Copyright (C) 2014 SUSE LINUX Products GmbH, Nuernberg, Germany.
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
 * Authors: Cédric Bosdonnat <cbosdonnat@suse.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

type
{ Do not add fields to this struct  }
  PGVirConfigCapabilitiesHostSecModel = ^TGVirConfigCapabilitiesHostSecModel;
  TGVirConfigCapabilitiesHostSecModel = record
      parent : TGVirConfigObject;
      priv : PGVirConfigCapabilitiesHostSecModelPrivate;
    end;

  PGVirConfigCapabilitiesHostSecModelClass = ^TGVirConfigCapabilitiesHostSecModelClass;
  TGVirConfigCapabilitiesHostSecModelClass = record
      parent_class : TGVirConfigObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_capabilities_host_secmodel_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_capabilities_host_secmodel_get_model(secmodel:PGVirConfigCapabilitiesHostSecModel):Pgchar;cdecl;external libvirtgconfig;
function gvir_config_capabilities_host_secmodel_get_doi(secmodel:PGVirConfigCapabilitiesHostSecModel):Pgchar;cdecl;external libvirtgconfig;

// === Konventiert am: 17-10-26 19:51:51 ===

function GVIR_CONFIG_TYPE_CAPABILITIES_HOST_SECMODEL : TGType;
function GVIR_CONFIG_CAPABILITIES_HOST_SECMODEL(obj : Pointer) : PGVirConfigCapabilitiesHostSecModel;
function GVIR_CONFIG_CAPABILITIES_HOST_SECMODEL_CLASS(klass : Pointer) : PGVirConfigCapabilitiesHostSecModelClass;
function GVIR_CONFIG_IS_CAPABILITIES_HOST_SECMODEL(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_CAPABILITIES_HOST_SECMODEL_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_CAPABILITIES_HOST_SECMODEL_GET_CLASS(obj : Pointer) : PGVirConfigCapabilitiesHostSecModelClass;

implementation

function GVIR_CONFIG_TYPE_CAPABILITIES_HOST_SECMODEL : TGType;
  begin
    GVIR_CONFIG_TYPE_CAPABILITIES_HOST_SECMODEL:=gvir_config_capabilities_host_secmodel_get_type;
  end;

function GVIR_CONFIG_CAPABILITIES_HOST_SECMODEL(obj : Pointer) : PGVirConfigCapabilitiesHostSecModel;
begin
  Result := PGVirConfigCapabilitiesHostSecModel(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_CAPABILITIES_HOST_SECMODEL));
end;

function GVIR_CONFIG_CAPABILITIES_HOST_SECMODEL_CLASS(klass : Pointer) : PGVirConfigCapabilitiesHostSecModelClass;
begin
  Result := PGVirConfigCapabilitiesHostSecModelClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_CAPABILITIES_HOST_SECMODEL));
end;

function GVIR_CONFIG_IS_CAPABILITIES_HOST_SECMODEL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_CAPABILITIES_HOST_SECMODEL);
end;

function GVIR_CONFIG_IS_CAPABILITIES_HOST_SECMODEL_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_CAPABILITIES_HOST_SECMODEL);
end;

function GVIR_CONFIG_CAPABILITIES_HOST_SECMODEL_GET_CLASS(obj : Pointer) : PGVirConfigCapabilitiesHostSecModelClass;
begin
  Result := PGVirConfigCapabilitiesHostSecModelClass(PGTypeInstance(obj)^.g_class);
end;



end.
