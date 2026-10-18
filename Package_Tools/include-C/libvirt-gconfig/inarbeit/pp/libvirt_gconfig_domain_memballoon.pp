
unit libvirt_gconfig_domain_memballoon;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_domain_memballoon.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_domain_memballoon.h
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
PGVirConfigDomainMemballoon  = ^GVirConfigDomainMemballoon;
PGVirConfigDomainMemballoonClass  = ^GVirConfigDomainMemballoonClass;
PGVirConfigDomainMemballoonModel  = ^GVirConfigDomainMemballoonModel;
PGVirConfigDomainMemballoonPrivate  = ^GVirConfigDomainMemballoonPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-memballoon.h: libvirt domain memballoon configuration
 *
 * Copyright (C) 2011 Red Hat, Inc.
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
 * Author: Daniel P. Berrange <berrange@redhat.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_MEMBALLOON : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_MEMBALLOON(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_MEMBALLOON_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_MEMBALLOON(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_MEMBALLOON_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_MEMBALLOON_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirConfigDomainMemballoon = ^TGVirConfigDomainMemballoon;
  TGVirConfigDomainMemballoon = record
      parent : TGVirConfigDomainDevice;
      priv : PGVirConfigDomainMemballoonPrivate;
    end;

  PGVirConfigDomainMemballoonClass = ^TGVirConfigDomainMemballoonClass;
  TGVirConfigDomainMemballoonClass = record
      parent_class : TGVirConfigDomainDeviceClass;
      padding : array[0..19] of Tgpointer;
    end;


  PGVirConfigDomainMemballoonModel = ^TGVirConfigDomainMemballoonModel;
  TGVirConfigDomainMemballoonModel =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_MEMBALLOON_MODEL_NONE = 0;
    GVIR_CONFIG_DOMAIN_MEMBALLOON_MODEL_VIRTIO = 1;
;

function gvir_config_domain_memballoon_get_type:TGType;cdecl;external;
function gvir_config_domain_memballoon_new:PGVirConfigDomainMemballoon;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_memballoon_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainMemballoon;cdecl;external;
procedure gvir_config_domain_memballoon_set_model(memballoon:PGVirConfigDomainMemballoon; model:TGVirConfigDomainMemballoonModel);cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_MEMBALLOON : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_DOMAIN_MEMBALLOON:=gvir_config_domain_memballoon_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_MEMBALLOON(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_MEMBALLOON:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_DOMAIN_MEMBALLOON,GVirConfigDomainMemballoon);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_MEMBALLOON_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_MEMBALLOON_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_DOMAIN_MEMBALLOON,GVirConfigDomainMemballoonClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_MEMBALLOON(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_MEMBALLOON:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_DOMAIN_MEMBALLOON);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_MEMBALLOON_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_MEMBALLOON_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_DOMAIN_MEMBALLOON);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_MEMBALLOON_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_MEMBALLOON_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_DOMAIN_MEMBALLOON,GVirConfigDomainMemballoonClass);
end;


end.
