unit libvirt_gconfig_domain_cpu_feature;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-cpu-feature.h: libvirt domain CPU feature
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
  PGVirConfigDomainCpuFeature = ^TGVirConfigDomainCpuFeature;
  TGVirConfigDomainCpuFeature = record
      parent : TGVirConfigCapabilitiesCpu;
      priv : PGVirConfigDomainCpuFeaturePrivate;
    end;

  PGVirConfigDomainCpuFeatureClass = ^TGVirConfigDomainCpuFeatureClass;
  TGVirConfigDomainCpuFeatureClass = record
      parent_class : TGVirConfigCapabilitiesCpuClass;
      padding : array[0..19] of Tgpointer;
    end;


  PGVirConfigDomainCpuFeaturePolicy = ^TGVirConfigDomainCpuFeaturePolicy;
  TGVirConfigDomainCpuFeaturePolicy =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_CPU_FEATURE_POLICY_FORCE = 0;
    GVIR_CONFIG_DOMAIN_CPU_FEATURE_POLICY_REQUIRE = 1;
    GVIR_CONFIG_DOMAIN_CPU_FEATURE_POLICY_OPTIONAL = 2;
    GVIR_CONFIG_DOMAIN_CPU_FEATURE_POLICY_DISABLE = 3;
    GVIR_CONFIG_DOMAIN_CPU_FEATURE_POLICY_FORBID = 4;
;

function gvir_config_domain_cpu_feature_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_cpu_feature_new:PGVirConfigDomainCpuFeature;cdecl;external libvirtgconfig;
function gvir_config_domain_cpu_feature_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainCpuFeature;cdecl;external libvirtgconfig;
procedure gvir_config_domain_cpu_feature_set_policy(feature:PGVirConfigDomainCpuFeature; policy:TGVirConfigDomainCpuFeaturePolicy);cdecl;external libvirtgconfig;
function gvir_config_domain_cpu_feature_get_policy(feature:PGVirConfigDomainCpuFeature):TGVirConfigDomainCpuFeaturePolicy;cdecl;external libvirtgconfig;

// === Konventiert am: 17-10-26 19:59:32 ===

function GVIR_CONFIG_TYPE_DOMAIN_CPU_FEATURE : TGType;
function GVIR_CONFIG_DOMAIN_CPU_FEATURE(obj : Pointer) : PGVirConfigDomainCpuFeature;
function GVIR_CONFIG_DOMAIN_CPU_FEATURE_CLASS(klass : Pointer) : PGVirConfigDomainCpuFeatureClass;
function GVIR_CONFIG_IS_DOMAIN_CPU_FEATURE(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_CPU_FEATURE_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_CPU_FEATURE_GET_CLASS(obj : Pointer) : PGVirConfigDomainCpuFeatureClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_CPU_FEATURE : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_CPU_FEATURE:=gvir_config_domain_cpu_feature_get_type;
  end;

function GVIR_CONFIG_DOMAIN_CPU_FEATURE(obj : Pointer) : PGVirConfigDomainCpuFeature;
begin
  Result := PGVirConfigDomainCpuFeature(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_CPU_FEATURE));
end;

function GVIR_CONFIG_DOMAIN_CPU_FEATURE_CLASS(klass : Pointer) : PGVirConfigDomainCpuFeatureClass;
begin
  Result := PGVirConfigDomainCpuFeatureClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_CPU_FEATURE));
end;

function GVIR_CONFIG_IS_DOMAIN_CPU_FEATURE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_CPU_FEATURE);
end;

function GVIR_CONFIG_IS_DOMAIN_CPU_FEATURE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_CPU_FEATURE);
end;

function GVIR_CONFIG_DOMAIN_CPU_FEATURE_GET_CLASS(obj : Pointer) : PGVirConfigDomainCpuFeatureClass;
begin
  Result := PGVirConfigDomainCpuFeatureClass(PGTypeInstance(obj)^.g_class);
end;



end.
