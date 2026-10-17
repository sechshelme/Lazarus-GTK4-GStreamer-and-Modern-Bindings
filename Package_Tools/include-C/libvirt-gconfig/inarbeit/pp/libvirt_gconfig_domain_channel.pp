
unit libvirt_gconfig_domain_channel;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_domain_channel.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_domain_channel.h
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
PGVirConfigDomainChannel  = ^GVirConfigDomainChannel;
PGVirConfigDomainChannelClass  = ^GVirConfigDomainChannelClass;
PGVirConfigDomainChannelPrivate  = ^GVirConfigDomainChannelPrivate;
PGVirConfigDomainChannelTargetType  = ^GVirConfigDomainChannelTargetType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-channel.h: libvirt domain channel configuration
 *
 * Copyright (C) 2011-2012 Red Hat, Inc.
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
function GVIR_CONFIG_TYPE_DOMAIN_CHANNEL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CHANNEL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CHANNEL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_CHANNEL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_CHANNEL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CHANNEL_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirConfigDomainChannel = ^TGVirConfigDomainChannel;
  TGVirConfigDomainChannel = record
      parent : TGVirConfigDomainChardev;
      priv : PGVirConfigDomainChannelPrivate;
    end;

  PGVirConfigDomainChannelClass = ^TGVirConfigDomainChannelClass;
  TGVirConfigDomainChannelClass = record
      parent_class : TGVirConfigDomainChardevClass;
      padding : array[0..19] of Tgpointer;
    end;


  PGVirConfigDomainChannelTargetType = ^TGVirConfigDomainChannelTargetType;
  TGVirConfigDomainChannelTargetType =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_CHANNEL_TARGET_GUESTFWD = 0;
    GVIR_CONFIG_DOMAIN_CHANNEL_TARGET_VIRTIO = 1;
    GVIR_CONFIG_DOMAIN_CHANNEL_TARGET_SPICEPORT = 2;
;

function gvir_config_domain_channel_get_type:TGType;cdecl;external;
function gvir_config_domain_channel_new:PGVirConfigDomainChannel;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_channel_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainChannel;cdecl;external;
function gvir_config_domain_channel_get_target_type(channel:PGVirConfigDomainChannel):TGVirConfigDomainChannelTargetType;cdecl;external;
procedure gvir_config_domain_channel_set_target_type(channel:PGVirConfigDomainChannel; _type:TGVirConfigDomainChannelTargetType);cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_channel_get_target_name(channel:PGVirConfigDomainChannel):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_channel_set_target_name(channel:PGVirConfigDomainChannel; name:Pgchar);cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_CHANNEL : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_DOMAIN_CHANNEL:=gvir_config_domain_channel_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CHANNEL(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_CHANNEL:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_DOMAIN_CHANNEL,GVirConfigDomainChannel);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CHANNEL_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_CHANNEL_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_DOMAIN_CHANNEL,GVirConfigDomainChannelClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_CHANNEL(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_CHANNEL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_DOMAIN_CHANNEL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_CHANNEL_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_CHANNEL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_DOMAIN_CHANNEL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CHANNEL_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_CHANNEL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_DOMAIN_CHANNEL,GVirConfigDomainChannelClass);
end;


end.
