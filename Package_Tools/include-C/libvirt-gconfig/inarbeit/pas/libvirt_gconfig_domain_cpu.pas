unit libvirt_gconfig_domain_cpu;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-cpu.h: libvirt Domain CPU
 *
 * Copyright (C) 2010-2012 Red Hat, Inc.
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
 *          Daniel P. Berrange <berrange@redhat.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)
{$include <libvirt-gconfig/libvirt-gconfig-domain-cpu-model.h>}

type
{ Do not add fields to this struct  }
  PGVirConfigDomainCpu = ^TGVirConfigDomainCpu;
  TGVirConfigDomainCpu = record
      parent : TGVirConfigCapabilitiesCpu;
      priv : PGVirConfigDomainCpuPrivate;
    end;

  PGVirConfigDomainCpuClass = ^TGVirConfigDomainCpuClass;
  TGVirConfigDomainCpuClass = record
      parent_class : TGVirConfigCapabilitiesCpuClass;
      padding : array[0..19] of Tgpointer;
    end;


  PGVirConfigDomainCpuMatchPolicy = ^TGVirConfigDomainCpuMatchPolicy;
  TGVirConfigDomainCpuMatchPolicy =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_CPU_MATCH_POLICY_MINIMUM = 0;
    GVIR_CONFIG_DOMAIN_CPU_MATCH_POLICY_EXACT = 1;
    GVIR_CONFIG_DOMAIN_CPU_MATCH_POLICY_STRICT = 2;
;
type
  PGVirConfigDomainCpuMode = ^TGVirConfigDomainCpuMode;
  TGVirConfigDomainCpuMode =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_CPU_MODE_CUSTOM = 0;
    GVIR_CONFIG_DOMAIN_CPU_MODE_HOST_MODEL = 1;
    GVIR_CONFIG_DOMAIN_CPU_MODE_HOST_PASSTHROUGH = 2;
;

function gvir_config_domain_cpu_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_cpu_new:PGVirConfigDomainCpu;cdecl;external libvirtgconfig;
function gvir_config_domain_cpu_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainCpu;cdecl;external libvirtgconfig;
procedure gvir_config_domain_cpu_set_match_policy(cpu:PGVirConfigDomainCpu; policy:TGVirConfigDomainCpuMatchPolicy);cdecl;external libvirtgconfig;
function gvir_config_domain_cpu_get_match_policy(cpu:PGVirConfigDomainCpu):TGVirConfigDomainCpuMatchPolicy;cdecl;external libvirtgconfig;
procedure gvir_config_domain_cpu_set_mode(cpu:PGVirConfigDomainCpu; mode:TGVirConfigDomainCpuMode);cdecl;external libvirtgconfig;
procedure gvir_config_domain_cpu_set_model(cpu:PGVirConfigDomainCpu; model:PGVirConfigDomainCpuModel);cdecl;external libvirtgconfig;
function gvir_config_domain_cpu_get_mode(cpu:PGVirConfigDomainCpu):TGVirConfigDomainCpuMode;cdecl;external libvirtgconfig;

// === Konventiert am: 17-10-26 19:59:35 ===

function GVIR_CONFIG_TYPE_DOMAIN_CPU : TGType;
function GVIR_CONFIG_DOMAIN_CPU(obj : Pointer) : PGVirConfigDomainCpu;
function GVIR_CONFIG_DOMAIN_CPU_CLASS(klass : Pointer) : PGVirConfigDomainCpuClass;
function GVIR_CONFIG_IS_DOMAIN_CPU(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_CPU_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_CPU_GET_CLASS(obj : Pointer) : PGVirConfigDomainCpuClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_CPU : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_CPU:=gvir_config_domain_cpu_get_type;
  end;

function GVIR_CONFIG_DOMAIN_CPU(obj : Pointer) : PGVirConfigDomainCpu;
begin
  Result := PGVirConfigDomainCpu(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_CPU));
end;

function GVIR_CONFIG_DOMAIN_CPU_CLASS(klass : Pointer) : PGVirConfigDomainCpuClass;
begin
  Result := PGVirConfigDomainCpuClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_CPU));
end;

function GVIR_CONFIG_IS_DOMAIN_CPU(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_CPU);
end;

function GVIR_CONFIG_IS_DOMAIN_CPU_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_CPU);
end;

function GVIR_CONFIG_DOMAIN_CPU_GET_CLASS(obj : Pointer) : PGVirConfigDomainCpuClass;
begin
  Result := PGVirConfigDomainCpuClass(PGTypeInstance(obj)^.g_class);
end;



end.
