
unit libvirt_gconfig_domain_chardev;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_domain_chardev.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_domain_chardev
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
PGVirConfigDomainChardev  = ^GVirConfigDomainChardev;
PGVirConfigDomainChardevClass  = ^GVirConfigDomainChardevClass;
PGVirConfigDomainChardevPrivate  = ^GVirConfigDomainChardevPrivate;
PGVirConfigDomainChardevSource  = ^GVirConfigDomainChardevSource;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-chardev.h: libvirt domain chardev configuration
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
{$include <libvirt-gconfig/libvirt-gconfig-domain-chardev-source.h>}

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_CHARDEV : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CHARDEV(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CHARDEV_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_CHARDEV(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_CHARDEV_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CHARDEV_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirConfigDomainChardev = ^TGVirConfigDomainChardev;
  TGVirConfigDomainChardev = record
      parent : TGVirConfigDomainDevice;
      priv : PGVirConfigDomainChardevPrivate;
    end;

  PGVirConfigDomainChardevClass = ^TGVirConfigDomainChardevClass;
  TGVirConfigDomainChardevClass = record
      parent_class : TGVirConfigDomainDeviceClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_chardev_get_type:TGType;cdecl;external;
procedure gvir_config_domain_chardev_set_source(chardev:PGVirConfigDomainChardev; source:PGVirConfigDomainChardevSource);cdecl;external;
function gvir_config_domain_chardev_get_source(chardev:PGVirConfigDomainChardev):PGVirConfigDomainChardevSource;cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_CHARDEV : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_DOMAIN_CHARDEV:=gvir_config_domain_chardev_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CHARDEV(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_CHARDEV:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_DOMAIN_CHARDEV,GVirConfigDomainChardev);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CHARDEV_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_CHARDEV_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_DOMAIN_CHARDEV,GVirConfigDomainChardevClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_CHARDEV(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_CHARDEV:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_DOMAIN_CHARDEV);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_CHARDEV_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_CHARDEV_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_DOMAIN_CHARDEV);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CHARDEV_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_CHARDEV_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_DOMAIN_CHARDEV,GVirConfigDomainChardevClass);
end;


end.
