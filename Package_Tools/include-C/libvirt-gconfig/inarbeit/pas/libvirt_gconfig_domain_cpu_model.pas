unit libvirt_gconfig_domain_cpu_model;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-cpu-model.h: libvirt domain CPU model
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
{$include "libvirt-gconfig-capabilities-cpu-model.h"}

type
{ Do not add fields to this struct  }
  PGVirConfigDomainCpuModel = ^TGVirConfigDomainCpuModel;
  TGVirConfigDomainCpuModel = record
      parent : TGVirConfigCapabilitiesCpuModel;
      priv : PGVirConfigDomainCpuModelPrivate;
    end;

  PGVirConfigDomainCpuModelClass = ^TGVirConfigDomainCpuModelClass;
  TGVirConfigDomainCpuModelClass = record
      parent_class : TGVirConfigCapabilitiesCpuModelClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_cpu_model_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_cpu_model_new:PGVirConfigDomainCpuModel;cdecl;external libvirtgconfig;
function gvir_config_domain_cpu_model_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainCpuModel;cdecl;external libvirtgconfig;

// === Konventiert am: 17-10-26 20:09:15 ===

function GVIR_CONFIG_TYPE_DOMAIN_CPU_MODEL : TGType;
function GVIR_CONFIG_DOMAIN_CPU_MODEL(obj : Pointer) : PGVirConfigDomainCpuModel;
function GVIR_CONFIG_DOMAIN_CPU_MODEL_CLASS(klass : Pointer) : PGVirConfigDomainCpuModelClass;
function GVIR_CONFIG_IS_DOMAIN_CPU_MODEL(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_CPU_MODEL_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_CPU_MODEL_GET_CLASS(obj : Pointer) : PGVirConfigDomainCpuModelClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_CPU_MODEL : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_CPU_MODEL:=gvir_config_domain_cpu_model_get_type;
  end;

function GVIR_CONFIG_DOMAIN_CPU_MODEL(obj : Pointer) : PGVirConfigDomainCpuModel;
begin
  Result := PGVirConfigDomainCpuModel(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_CPU_MODEL));
end;

function GVIR_CONFIG_DOMAIN_CPU_MODEL_CLASS(klass : Pointer) : PGVirConfigDomainCpuModelClass;
begin
  Result := PGVirConfigDomainCpuModelClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_CPU_MODEL));
end;

function GVIR_CONFIG_IS_DOMAIN_CPU_MODEL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_CPU_MODEL);
end;

function GVIR_CONFIG_IS_DOMAIN_CPU_MODEL_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_CPU_MODEL);
end;

function GVIR_CONFIG_DOMAIN_CPU_MODEL_GET_CLASS(obj : Pointer) : PGVirConfigDomainCpuModelClass;
begin
  Result := PGVirConfigDomainCpuModelClass(PGTypeInstance(obj)^.g_class);
end;



end.
