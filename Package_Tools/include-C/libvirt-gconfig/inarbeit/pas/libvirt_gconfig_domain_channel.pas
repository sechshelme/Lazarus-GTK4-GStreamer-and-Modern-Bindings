unit libvirt_gconfig_domain_channel;

interface

uses
  fp_glib2, fp_virtgconfig;

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

function gvir_config_domain_channel_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_channel_new:PGVirConfigDomainChannel;cdecl;external libvirtgconfig;
function gvir_config_domain_channel_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainChannel;cdecl;external libvirtgconfig;
function gvir_config_domain_channel_get_target_type(channel:PGVirConfigDomainChannel):TGVirConfigDomainChannelTargetType;cdecl;external libvirtgconfig;
procedure gvir_config_domain_channel_set_target_type(channel:PGVirConfigDomainChannel; _type:TGVirConfigDomainChannelTargetType);cdecl;external libvirtgconfig;
function gvir_config_domain_channel_get_target_name(channel:PGVirConfigDomainChannel):Pgchar;cdecl;external libvirtgconfig;
procedure gvir_config_domain_channel_set_target_name(channel:PGVirConfigDomainChannel; name:Pgchar);cdecl;external libvirtgconfig;

// === Konventiert am: 17-10-26 19:56:03 ===

function GVIR_CONFIG_TYPE_DOMAIN_CHANNEL : TGType;
function GVIR_CONFIG_DOMAIN_CHANNEL(obj : Pointer) : PGVirConfigDomainChannel;
function GVIR_CONFIG_DOMAIN_CHANNEL_CLASS(klass : Pointer) : PGVirConfigDomainChannelClass;
function GVIR_CONFIG_IS_DOMAIN_CHANNEL(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_CHANNEL_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_CHANNEL_GET_CLASS(obj : Pointer) : PGVirConfigDomainChannelClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_CHANNEL : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_CHANNEL:=gvir_config_domain_channel_get_type;
  end;

function GVIR_CONFIG_DOMAIN_CHANNEL(obj : Pointer) : PGVirConfigDomainChannel;
begin
  Result := PGVirConfigDomainChannel(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_CHANNEL));
end;

function GVIR_CONFIG_DOMAIN_CHANNEL_CLASS(klass : Pointer) : PGVirConfigDomainChannelClass;
begin
  Result := PGVirConfigDomainChannelClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_CHANNEL));
end;

function GVIR_CONFIG_IS_DOMAIN_CHANNEL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_CHANNEL);
end;

function GVIR_CONFIG_IS_DOMAIN_CHANNEL_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_CHANNEL);
end;

function GVIR_CONFIG_DOMAIN_CHANNEL_GET_CLASS(obj : Pointer) : PGVirConfigDomainChannelClass;
begin
  Result := PGVirConfigDomainChannelClass(PGTypeInstance(obj)^.g_class);
end;



end.
