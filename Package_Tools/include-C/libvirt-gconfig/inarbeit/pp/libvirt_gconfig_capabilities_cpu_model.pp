
unit libvirt_gconfig_capabilities_cpu_model;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_capabilities_cpu_model.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_capabilities_cpu_model.h
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
PGVirConfigCapabilitiesCpuModel  = ^GVirConfigCapabilitiesCpuModel;
PGVirConfigCapabilitiesCpuModelClass  = ^GVirConfigCapabilitiesCpuModelClass;
PGVirConfigCapabilitiesCpuModelPrivate  = ^GVirConfigCapabilitiesCpuModelPrivate;
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

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_CAPABILITIES_CPU_MODEL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_CAPABILITIES_CPU_MODEL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_CAPABILITIES_CPU_MODEL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_CAPABILITIES_CPU_MODEL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_CAPABILITIES_CPU_MODEL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_CAPABILITIES_CPU_MODEL_GET_CLASS(obj : longint) : longint;

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


function gvir_config_capabilities_cpu_model_get_type:TGType;cdecl;external;
function gvir_config_capabilities_cpu_model_new:PGVirConfigCapabilitiesCpuModel;cdecl;external;
(* Const before type ignored *)
function gvir_config_capabilities_cpu_model_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigCapabilitiesCpuModel;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_capabilities_cpu_model_set_name(model:PGVirConfigCapabilitiesCpuModel; name:Pgchar);cdecl;external;
(* Const before type ignored *)
function gvir_config_capabilities_cpu_model_get_name(model:PGVirConfigCapabilitiesCpuModel):Pgchar;cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_CAPABILITIES_CPU_MODEL : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_CAPABILITIES_CPU_MODEL:=gvir_config_capabilities_cpu_model_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_CAPABILITIES_CPU_MODEL(obj : longint) : longint;
begin
  GVIR_CONFIG_CAPABILITIES_CPU_MODEL:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_CAPABILITIES_CPU_MODEL,GVirConfigCapabilitiesCpuModel);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_CAPABILITIES_CPU_MODEL_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_CAPABILITIES_CPU_MODEL_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_CAPABILITIES_CPU_MODEL,GVirConfigCapabilitiesCpuModelClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_CAPABILITIES_CPU_MODEL(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_CAPABILITIES_CPU_MODEL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_CAPABILITIES_CPU_MODEL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_CAPABILITIES_CPU_MODEL_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_CAPABILITIES_CPU_MODEL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_CAPABILITIES_CPU_MODEL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_CAPABILITIES_CPU_MODEL_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_CAPABILITIES_CPU_MODEL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_CAPABILITIES_CPU_MODEL,GVirConfigCapabilitiesCpuModelClass);
end;


end.
