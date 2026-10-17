
unit libvirt_gconfig_capabilities_guest_arch;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_capabilities_guest_arch.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_capabilities_guest_arch.h
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
PGVirConfigCapabilitiesGuestArch  = ^GVirConfigCapabilitiesGuestArch;
PGVirConfigCapabilitiesGuestArchClass  = ^GVirConfigCapabilitiesGuestArchClass;
PGVirConfigCapabilitiesGuestArchPrivate  = ^GVirConfigCapabilitiesGuestArchPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-capabilities-guest-arch.h: libvirt guest architecture capabilities
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

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_ARCH : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_CAPABILITIES_GUEST_ARCH(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_CAPABILITIES_GUEST_ARCH_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_CAPABILITIES_GUEST_ARCH(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_CAPABILITIES_GUEST_ARCH_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_CAPABILITIES_GUEST_ARCH_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirConfigCapabilitiesGuestArch = ^TGVirConfigCapabilitiesGuestArch;
  TGVirConfigCapabilitiesGuestArch = record
      parent : TGVirConfigObject;
      priv : PGVirConfigCapabilitiesGuestArchPrivate;
    end;

  PGVirConfigCapabilitiesGuestArchClass = ^TGVirConfigCapabilitiesGuestArchClass;
  TGVirConfigCapabilitiesGuestArchClass = record
      parent_class : TGVirConfigObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_capabilities_guest_arch_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gvir_config_capabilities_guest_arch_get_name(arch:PGVirConfigCapabilitiesGuestArch):Pgchar;cdecl;external;
function gvir_config_capabilities_guest_arch_get_domains(arch:PGVirConfigCapabilitiesGuestArch):PGList;cdecl;external;
(* Const before type ignored *)
function gvir_config_capabilities_guest_arch_get_emulator(arch:PGVirConfigCapabilitiesGuestArch):Pgchar;cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_ARCH : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_ARCH:=gvir_config_capabilities_guest_arch_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_CAPABILITIES_GUEST_ARCH(obj : longint) : longint;
begin
  GVIR_CONFIG_CAPABILITIES_GUEST_ARCH:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_ARCH,GVirConfigCapabilitiesGuestArch);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_CAPABILITIES_GUEST_ARCH_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_CAPABILITIES_GUEST_ARCH_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_ARCH,GVirConfigCapabilitiesGuestArchClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_CAPABILITIES_GUEST_ARCH(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_CAPABILITIES_GUEST_ARCH:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_ARCH);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_CAPABILITIES_GUEST_ARCH_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_CAPABILITIES_GUEST_ARCH_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_ARCH);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_CAPABILITIES_GUEST_ARCH_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_CAPABILITIES_GUEST_ARCH_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_ARCH,GVirConfigCapabilitiesGuestArchClass);
end;


end.
