
unit libvirt_gconfig_domain_hostdev;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_domain_hostdev.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_domain_hostdev
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
PGVirConfigDomainHostdev  = ^GVirConfigDomainHostdev;
PGVirConfigDomainHostdevClass  = ^GVirConfigDomainHostdevClass;
PGVirConfigDomainHostdevPrivate  = ^GVirConfigDomainHostdevPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-hostdev.h: libvirt domain hostdev configuration
 *
 * Copyright (C) 2016 Red Hat, Inc.
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
 * Authors: Zeeshan Ali (Khattak) <zeeshanak@gnome.org>
 *          Christophe Fergeau <cfergeau@redhat.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_HOSTDEV(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_HOSTDEV_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_HOSTDEV(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_HOSTDEV_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_HOSTDEV_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirConfigDomainHostdev = ^TGVirConfigDomainHostdev;
  TGVirConfigDomainHostdev = record
      parent : TGVirConfigDomainDevice;
      priv : PGVirConfigDomainHostdevPrivate;
    end;

  PGVirConfigDomainHostdevClass = ^TGVirConfigDomainHostdevClass;
  TGVirConfigDomainHostdevClass = record
      parent_class : TGVirConfigDomainDeviceClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_hostdev_get_type:TGType;cdecl;external;
procedure gvir_config_domain_hostdev_set_boot_order(hostdev:PGVirConfigDomainHostdev; order:Tgint);cdecl;external;
function gvir_config_domain_hostdev_get_boot_order(hostdev:PGVirConfigDomainHostdev):Tgint;cdecl;external;
procedure gvir_config_domain_hostdev_set_readonly(hostdev:PGVirConfigDomainHostdev; readonly:Tgboolean);cdecl;external;
function gvir_config_domain_hostdev_get_readonly(hostdev:PGVirConfigDomainHostdev):Tgboolean;cdecl;external;
procedure gvir_config_domain_hostdev_set_shareable(hostdev:PGVirConfigDomainHostdev; shareable:Tgboolean);cdecl;external;
function gvir_config_domain_hostdev_get_shareable(hostdev:PGVirConfigDomainHostdev):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV:=gvir_config_domain_hostdev_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_HOSTDEV(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_HOSTDEV:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV,GVirConfigDomainHostdev);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_HOSTDEV_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_HOSTDEV_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV,GVirConfigDomainHostdevClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_HOSTDEV(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_HOSTDEV:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_HOSTDEV_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_HOSTDEV_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_HOSTDEV_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_HOSTDEV_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV,GVirConfigDomainHostdevClass);
end;


end.
