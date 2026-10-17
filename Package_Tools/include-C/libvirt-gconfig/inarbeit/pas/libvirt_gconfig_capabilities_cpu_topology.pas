unit libvirt_gconfig_capabilities_cpu_topology;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-capabilities-cpu-topology.h: libvirt CPU topology capabilities
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

type
{ Do not add fields to this struct  }
  PGVirConfigCapabilitiesCpuTopology = ^TGVirConfigCapabilitiesCpuTopology;
  TGVirConfigCapabilitiesCpuTopology = record
      parent : TGVirConfigObject;
      priv : PGVirConfigCapabilitiesCpuTopologyPrivate;
    end;

  PGVirConfigCapabilitiesCpuTopologyClass = ^TGVirConfigCapabilitiesCpuTopologyClass;
  TGVirConfigCapabilitiesCpuTopologyClass = record
      parent_class : TGVirConfigObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_capabilities_cpu_topology_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_capabilities_cpu_topology_new:PGVirConfigCapabilitiesCpuTopology;cdecl;external libvirtgconfig;
function gvir_config_capabilities_cpu_topology_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigCapabilitiesCpuTopology;cdecl;external libvirtgconfig;
function gvir_config_capabilities_cpu_topology_get_sockets(topology:PGVirConfigCapabilitiesCpuTopology):Tguint64;cdecl;external libvirtgconfig;
procedure gvir_config_capabilities_cpu_topology_set_sockets(topology:PGVirConfigCapabilitiesCpuTopology; sockets:Tguint64);cdecl;external libvirtgconfig;
function gvir_config_capabilities_cpu_topology_get_cores(topology:PGVirConfigCapabilitiesCpuTopology):Tguint64;cdecl;external libvirtgconfig;
procedure gvir_config_capabilities_cpu_topology_set_cores(topology:PGVirConfigCapabilitiesCpuTopology; cores:Tguint64);cdecl;external libvirtgconfig;
function gvir_config_capabilities_cpu_topology_get_threads(topology:PGVirConfigCapabilitiesCpuTopology):Tguint64;cdecl;external libvirtgconfig;
procedure gvir_config_capabilities_cpu_topology_set_threads(topology:PGVirConfigCapabilitiesCpuTopology; threads:Tguint64);cdecl;external libvirtgconfig;

// === Konventiert am: 17-10-26 19:52:32 ===

function GVIR_CONFIG_TYPE_CAPABILITIES_CPU_TOPOLOGY : TGType;
function GVIR_CONFIG_CAPABILITIES_CPU_TOPOLOGY(obj : Pointer) : PGVirConfigCapabilitiesCpuTopology;
function GVIR_CONFIG_CAPABILITIES_CPU_TOPOLOGY_CLASS(klass : Pointer) : PGVirConfigCapabilitiesCpuTopologyClass;
function GVIR_CONFIG_IS_CAPABILITIES_CPU_TOPOLOGY(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_CAPABILITIES_CPU_TOPOLOGY_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_CAPABILITIES_CPU_TOPOLOGY_GET_CLASS(obj : Pointer) : PGVirConfigCapabilitiesCpuTopologyClass;

implementation

function GVIR_CONFIG_TYPE_CAPABILITIES_CPU_TOPOLOGY : TGType;
  begin
    GVIR_CONFIG_TYPE_CAPABILITIES_CPU_TOPOLOGY:=gvir_config_capabilities_cpu_topology_get_type;
  end;

function GVIR_CONFIG_CAPABILITIES_CPU_TOPOLOGY(obj : Pointer) : PGVirConfigCapabilitiesCpuTopology;
begin
  Result := PGVirConfigCapabilitiesCpuTopology(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_CAPABILITIES_CPU_TOPOLOGY));
end;

function GVIR_CONFIG_CAPABILITIES_CPU_TOPOLOGY_CLASS(klass : Pointer) : PGVirConfigCapabilitiesCpuTopologyClass;
begin
  Result := PGVirConfigCapabilitiesCpuTopologyClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_CAPABILITIES_CPU_TOPOLOGY));
end;

function GVIR_CONFIG_IS_CAPABILITIES_CPU_TOPOLOGY(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_CAPABILITIES_CPU_TOPOLOGY);
end;

function GVIR_CONFIG_IS_CAPABILITIES_CPU_TOPOLOGY_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_CAPABILITIES_CPU_TOPOLOGY);
end;

function GVIR_CONFIG_CAPABILITIES_CPU_TOPOLOGY_GET_CLASS(obj : Pointer) : PGVirConfigCapabilitiesCpuTopologyClass;
begin
  Result := PGVirConfigCapabilitiesCpuTopologyClass(PGTypeInstance(obj)^.g_class);
end;



end.
