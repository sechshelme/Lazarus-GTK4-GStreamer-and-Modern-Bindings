
unit libvirt_gconfig_domain_interface_filterref;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_domain_interface_filterref.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_domain_interface_filterref
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
Pchar  = ^char;
Pgchar  = ^gchar;
PGError  = ^GError;
PGList  = ^GList;
PGVirConfigDomainInterfaceFilterref  = ^GVirConfigDomainInterfaceFilterref;
PGVirConfigDomainInterfaceFilterrefClass  = ^GVirConfigDomainInterfaceFilterrefClass;
PGVirConfigDomainInterfaceFilterrefParameter  = ^GVirConfigDomainInterfaceFilterrefParameter;
PGVirConfigDomainInterfaceFilterrefPrivate  = ^GVirConfigDomainInterfaceFilterrefPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-interface-network-filterref.h: libvirt filter reference config
 *
 * Copyright (C) 2013 Red Hat, Inc.
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
 * Author: Ian Main <imain@redhat.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
{$include <libvirt-gconfig/libvirt-gconfig-domain-interface-filterref-parameter.h>}
(** unsupported pragma#pragma once*)

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_FILTERREF : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_INTERFACE_FILTERREF(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_INTERFACE_FILTERREF_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_INTERFACE_FILTERREF(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_INTERFACE_FILTERREF_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_INTERFACE_FILTERREF_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirConfigDomainInterfaceFilterref = ^TGVirConfigDomainInterfaceFilterref;
  TGVirConfigDomainInterfaceFilterref = record
      parent : TGVirConfigObject;
      priv : PGVirConfigDomainInterfaceFilterrefPrivate;
    end;

  PGVirConfigDomainInterfaceFilterrefClass = ^TGVirConfigDomainInterfaceFilterrefClass;
  TGVirConfigDomainInterfaceFilterrefClass = record
      parent_class : TGVirConfigObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_interface_filterref_get_type:TGType;cdecl;external;
function gvir_config_domain_interface_filterref_new:PGVirConfigDomainInterfaceFilterref;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_interface_filterref_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainInterfaceFilterref;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_interface_filterref_set_name(filterref:PGVirConfigDomainInterfaceFilterref; filter:Pchar);cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_interface_filterref_get_name(filterref:PGVirConfigDomainInterfaceFilterref):Pchar;cdecl;external;
procedure gvir_config_domain_interface_filterref_add_parameter(filterref:PGVirConfigDomainInterfaceFilterref; parameter:PGVirConfigDomainInterfaceFilterrefParameter);cdecl;external;
function gvir_config_domain_interface_filterref_get_parameters(filterref:PGVirConfigDomainInterfaceFilterref):PGList;cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_FILTERREF : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_FILTERREF:=gvir_config_domain_interface_filterref_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_INTERFACE_FILTERREF(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_INTERFACE_FILTERREF:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_FILTERREF,GVirConfigDomainInterfaceFilterref);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_INTERFACE_FILTERREF_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_INTERFACE_FILTERREF_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_FILTERREF,GVirConfigDomainInterfaceFilterrefClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_INTERFACE_FILTERREF(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_INTERFACE_FILTERREF:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_FILTERREF);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_INTERFACE_FILTERREF_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_INTERFACE_FILTERREF_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_FILTERREF);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_INTERFACE_FILTERREF_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_INTERFACE_FILTERREF_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_FILTERREF,GVirConfigDomainInterfaceFilterrefClass);
end;


end.
