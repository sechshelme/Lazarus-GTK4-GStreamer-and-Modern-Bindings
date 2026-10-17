unit libvirt_gconfig_capabilities_cpu_model;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-capabilities-cpu-model.h: libvirt CPU model capabilities
 *
 * Copyright (C) 2014 Red Hat, Inc.
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
 * Authors: Zeeshan Ali <zeenix@redhat.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

type
{ Do not add fields to this struct  }
  PGVirConfigCapabilitiesCpuModel = ^TGVirConfigCapabilitiesCpuModel;
  TGVirConfigCapabilitiesCpuModel = record
      parent : TGVirConfigObject;
      priv : PGVirConfigCapabilitiesCpuModelPrivate;
    end;

  PGVirConfigCapabilitiesCpuModelClass = ^TGVirConfigCapabilitiesCpuModelClass;
  TGVirConfigCapabilitiesCpuModelClass = record
      parent_class : TGVirConfigObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_capabilities_cpu_model_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_capabilities_cpu_model_new:PGVirConfigCapabilitiesCpuModel;cdecl;external libvirtgconfig;
function gvir_config_capabilities_cpu_model_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigCapabilitiesCpuModel;cdecl;external libvirtgconfig;
procedure gvir_config_capabilities_cpu_model_set_name(model:PGVirConfigCapabilitiesCpuModel; name:Pgchar);cdecl;external libvirtgconfig;
function gvir_config_capabilities_cpu_model_get_name(model:PGVirConfigCapabilitiesCpuModel):Pgchar;cdecl;external libvirtgconfig;

// === Konventiert am: 17-10-26 19:52:41 ===

function GVIR_CONFIG_TYPE_CAPABILITIES_CPU_MODEL : TGType;
function GVIR_CONFIG_CAPABILITIES_CPU_MODEL(obj : Pointer) : PGVirConfigCapabilitiesCpuModel;
function GVIR_CONFIG_CAPABILITIES_CPU_MODEL_CLASS(klass : Pointer) : PGVirConfigCapabilitiesCpuModelClass;
function GVIR_CONFIG_IS_CAPABILITIES_CPU_MODEL(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_CAPABILITIES_CPU_MODEL_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_CAPABILITIES_CPU_MODEL_GET_CLASS(obj : Pointer) : PGVirConfigCapabilitiesCpuModelClass;

implementation

function GVIR_CONFIG_TYPE_CAPABILITIES_CPU_MODEL : TGType;
  begin
    GVIR_CONFIG_TYPE_CAPABILITIES_CPU_MODEL:=gvir_config_capabilities_cpu_model_get_type;
  end;

function GVIR_CONFIG_CAPABILITIES_CPU_MODEL(obj : Pointer) : PGVirConfigCapabilitiesCpuModel;
begin
  Result := PGVirConfigCapabilitiesCpuModel(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_CAPABILITIES_CPU_MODEL));
end;

function GVIR_CONFIG_CAPABILITIES_CPU_MODEL_CLASS(klass : Pointer) : PGVirConfigCapabilitiesCpuModelClass;
begin
  Result := PGVirConfigCapabilitiesCpuModelClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_CAPABILITIES_CPU_MODEL));
end;

function GVIR_CONFIG_IS_CAPABILITIES_CPU_MODEL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_CAPABILITIES_CPU_MODEL);
end;

function GVIR_CONFIG_IS_CAPABILITIES_CPU_MODEL_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_CAPABILITIES_CPU_MODEL);
end;

function GVIR_CONFIG_CAPABILITIES_CPU_MODEL_GET_CLASS(obj : Pointer) : PGVirConfigCapabilitiesCpuModelClass;
begin
  Result := PGVirConfigCapabilitiesCpuModelClass(PGTypeInstance(obj)^.g_class);
end;



end.
