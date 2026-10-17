
unit libvirt_gconfig_domain_chardev_source_unix;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_domain_chardev_source_unix.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_domain_chardev_source_unix.h
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
PGVirConfigDomainChardevSourceUnix  = ^GVirConfigDomainChardevSourceUnix;
PGVirConfigDomainChardevSourceUnixClass  = ^GVirConfigDomainChardevSourceUnixClass;
PGVirConfigDomainChardevSourceUnixPrivate  = ^GVirConfigDomainChardevSourceUnixPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-chardev-source-unix.h: libvirt domain chardev unix configuration
 *
 * Copyright (C) 2012 Red Hat, Inc.
 * Copyright (C) 2015 T A Mahadevan.
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
 * Author: T A Mahadevan <ta.mahadevan@gmail.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_UNIX : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_UNIX(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_UNIX_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_UNIX(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_UNIX_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_UNIX_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirConfigDomainChardevSourceUnix = ^TGVirConfigDomainChardevSourceUnix;
  TGVirConfigDomainChardevSourceUnix = record
      parent : TGVirConfigDomainChardevSource;
      priv : PGVirConfigDomainChardevSourceUnixPrivate;
    end;

  PGVirConfigDomainChardevSourceUnixClass = ^TGVirConfigDomainChardevSourceUnixClass;
  TGVirConfigDomainChardevSourceUnixClass = record
      parent_class : TGVirConfigDomainChardevSourceClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_chardev_source_unix_get_type:TGType;cdecl;external;
function gvir_config_domain_chardev_source_unix_new:PGVirConfigDomainChardevSourceUnix;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_chardev_source_unix_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainChardevSourceUnix;cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_UNIX : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_UNIX:=gvir_config_domain_chardev_source_unix_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_UNIX(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_UNIX:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_UNIX,GVirConfigDomainChardevSourceUnix);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_UNIX_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_UNIX_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_UNIX,GVirConfigDomainChardevSourceUnixClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_UNIX(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_UNIX:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_UNIX);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_UNIX_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_UNIX_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_UNIX);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_UNIX_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_UNIX_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_UNIX,GVirConfigDomainChardevSourceUnixClass);
end;


end.
