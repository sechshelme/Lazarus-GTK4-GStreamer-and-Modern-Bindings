
unit libvirt_gconfig_capabilities_host;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_capabilities_host.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_capabilities_host
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
PGList  = ^GList;
PGVirConfigCapabilitiesCpu  = ^GVirConfigCapabilitiesCpu;
PGVirConfigCapabilitiesHost  = ^GVirConfigCapabilitiesHost;
PGVirConfigCapabilitiesHostClass  = ^GVirConfigCapabilitiesHostClass;
PGVirConfigCapabilitiesHostPrivate  = ^GVirConfigCapabilitiesHostPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-capabilities-host.h: libvirt host capabilities
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
{$include "libvirt-gconfig/libvirt-gconfig-capabilities-cpu.h"}

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_CAPABILITIES_HOST : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_CAPABILITIES_HOST(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_CAPABILITIES_HOST_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_CAPABILITIES_HOST(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_CAPABILITIES_HOST_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_CAPABILITIES_HOST_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirConfigCapabilitiesHost = ^TGVirConfigCapabilitiesHost;
  TGVirConfigCapabilitiesHost = record
      parent : TGVirConfigObject;
      priv : PGVirConfigCapabilitiesHostPrivate;
    end;

  PGVirConfigCapabilitiesHostClass = ^TGVirConfigCapabilitiesHostClass;
  TGVirConfigCapabilitiesHostClass = record
      parent_class : TGVirConfigObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_capabilities_host_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gvir_config_capabilities_host_get_uuid(host:PGVirConfigCapabilitiesHost):Pgchar;cdecl;external;
function gvir_config_capabilities_host_get_cpu(host:PGVirConfigCapabilitiesHost):PGVirConfigCapabilitiesCpu;cdecl;external;
function gvir_config_capabilities_host_get_secmodels(host:PGVirConfigCapabilitiesHost):PGList;cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_CAPABILITIES_HOST : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_CAPABILITIES_HOST:=gvir_config_capabilities_host_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_CAPABILITIES_HOST(obj : longint) : longint;
begin
  GVIR_CONFIG_CAPABILITIES_HOST:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_CAPABILITIES_HOST,GVirConfigCapabilitiesHost);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_CAPABILITIES_HOST_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_CAPABILITIES_HOST_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_CAPABILITIES_HOST,GVirConfigCapabilitiesHostClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_CAPABILITIES_HOST(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_CAPABILITIES_HOST:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_CAPABILITIES_HOST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_CAPABILITIES_HOST_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_CAPABILITIES_HOST_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_CAPABILITIES_HOST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_CAPABILITIES_HOST_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_CAPABILITIES_HOST_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_CAPABILITIES_HOST,GVirConfigCapabilitiesHostClass);
end;


end.
