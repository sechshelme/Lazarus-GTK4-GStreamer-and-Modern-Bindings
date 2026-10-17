unit libvirt_gconfig_capabilities_cpu;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-capabilities-cpu.h: libvirt CPU capabilities
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
{$include "libvirt-gconfig-capabilities-cpu-topology.h"}
{$include "libvirt-gconfig-capabilities-cpu-feature.h"}
{$include "libvirt-gconfig-capabilities-cpu-model.h"}

type
{ Do not add fields to this struct  }
  PGVirConfigCapabilitiesCpu = ^TGVirConfigCapabilitiesCpu;
  TGVirConfigCapabilitiesCpu = record
      parent : TGVirConfigObject;
      priv : PGVirConfigCapabilitiesCpuPrivate;
    end;

  PGVirConfigCapabilitiesCpuClass = ^TGVirConfigCapabilitiesCpuClass;
  TGVirConfigCapabilitiesCpuClass = record
      parent_class : TGVirConfigObjectClass;
      get_features : function (cpu:PGVirConfigCapabilitiesCpu):PGList;cdecl;
      padding : array[0..18] of Tgpointer;
    end;


function gvir_config_capabilities_cpu_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_capabilities_cpu_get_arch(cpu:PGVirConfigCapabilitiesCpu):Pgchar;cdecl;external libvirtgconfig;
procedure gvir_config_capabilities_cpu_add_feature(cpu:PGVirConfigCapabilitiesCpu; feature:PGVirConfigCapabilitiesCpuFeature);cdecl;external libvirtgconfig;
function gvir_config_capabilities_cpu_get_features(cpu:PGVirConfigCapabilitiesCpu):PGList;cdecl;external libvirtgconfig;
function gvir_config_capabilities_cpu_get_topology(cpu:PGVirConfigCapabilitiesCpu):PGVirConfigCapabilitiesCpuTopology;cdecl;external libvirtgconfig;
procedure gvir_config_capabilities_cpu_set_topology(cpu:PGVirConfigCapabilitiesCpu; topology:PGVirConfigCapabilitiesCpuTopology);cdecl;external libvirtgconfig;
function gvir_config_capabilities_cpu_get_model(cpu:PGVirConfigCapabilitiesCpu):PGVirConfigCapabilitiesCpuModel;cdecl;external libvirtgconfig;

// === Konventiert am: 17-10-26 19:52:48 ===

function GVIR_CONFIG_TYPE_CAPABILITIES_CPU : TGType;
function GVIR_CONFIG_CAPABILITIES_CPU(obj : Pointer) : PGVirConfigCapabilitiesCpu;
function GVIR_CONFIG_CAPABILITIES_CPU_CLASS(klass : Pointer) : PGVirConfigCapabilitiesCpuClass;
function GVIR_CONFIG_IS_CAPABILITIES_CPU(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_CAPABILITIES_CPU_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_CAPABILITIES_CPU_GET_CLASS(obj : Pointer) : PGVirConfigCapabilitiesCpuClass;

implementation

function GVIR_CONFIG_TYPE_CAPABILITIES_CPU : TGType;
  begin
    GVIR_CONFIG_TYPE_CAPABILITIES_CPU:=gvir_config_capabilities_cpu_get_type;
  end;

function GVIR_CONFIG_CAPABILITIES_CPU(obj : Pointer) : PGVirConfigCapabilitiesCpu;
begin
  Result := PGVirConfigCapabilitiesCpu(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_CAPABILITIES_CPU));
end;

function GVIR_CONFIG_CAPABILITIES_CPU_CLASS(klass : Pointer) : PGVirConfigCapabilitiesCpuClass;
begin
  Result := PGVirConfigCapabilitiesCpuClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_CAPABILITIES_CPU));
end;

function GVIR_CONFIG_IS_CAPABILITIES_CPU(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_CAPABILITIES_CPU);
end;

function GVIR_CONFIG_IS_CAPABILITIES_CPU_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_CAPABILITIES_CPU);
end;

function GVIR_CONFIG_CAPABILITIES_CPU_GET_CLASS(obj : Pointer) : PGVirConfigCapabilitiesCpuClass;
begin
  Result := PGVirConfigCapabilitiesCpuClass(PGTypeInstance(obj)^.g_class);
end;



end.
