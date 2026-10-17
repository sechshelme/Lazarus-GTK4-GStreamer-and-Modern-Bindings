
unit libvirt_gconfig_domain_cpu;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_domain_cpu.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_domain_cpu
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pgchar  = ^gchar;
PGError  = ^GError;
PGVirConfigDomainCpu  = ^GVirConfigDomainCpu;
PGVirConfigDomainCpuClass  = ^GVirConfigDomainCpuClass;
PGVirConfigDomainCpuMatchPolicy  = ^GVirConfigDomainCpuMatchPolicy;
PGVirConfigDomainCpuMode  = ^GVirConfigDomainCpuMode;
PGVirConfigDomainCpuModel  = ^GVirConfigDomainCpuModel;
PGVirConfigDomainCpuPrivate  = ^GVirConfigDomainCpuPrivate;
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

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_CPU : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CPU(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CPU_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_CPU(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_CPU_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CPU_GET_CLASS(obj : longint) : longint;

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

function gvir_config_domain_cpu_get_type:TGType;cdecl;external;
function gvir_config_domain_cpu_new:PGVirConfigDomainCpu;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_cpu_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainCpu;cdecl;external;
procedure gvir_config_domain_cpu_set_match_policy(cpu:PGVirConfigDomainCpu; policy:TGVirConfigDomainCpuMatchPolicy);cdecl;external;
function gvir_config_domain_cpu_get_match_policy(cpu:PGVirConfigDomainCpu):TGVirConfigDomainCpuMatchPolicy;cdecl;external;
procedure gvir_config_domain_cpu_set_mode(cpu:PGVirConfigDomainCpu; mode:TGVirConfigDomainCpuMode);cdecl;external;
procedure gvir_config_domain_cpu_set_model(cpu:PGVirConfigDomainCpu; model:PGVirConfigDomainCpuModel);cdecl;external;
function gvir_config_domain_cpu_get_mode(cpu:PGVirConfigDomainCpu):TGVirConfigDomainCpuMode;cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_CPU : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_DOMAIN_CPU:=gvir_config_domain_cpu_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CPU(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_CPU:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_DOMAIN_CPU,GVirConfigDomainCpu);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CPU_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_CPU_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_DOMAIN_CPU,GVirConfigDomainCpuClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_CPU(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_CPU:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_DOMAIN_CPU);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_CPU_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_CPU_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_DOMAIN_CPU);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CPU_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_CPU_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_DOMAIN_CPU,GVirConfigDomainCpuClass);
end;


end.
