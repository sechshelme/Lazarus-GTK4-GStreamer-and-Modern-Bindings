unit libvirt_gconfig_domain_sound;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-sound.h: libvirt domain sound configuration
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
 * Author: Christophe Fergeau <cfergeau@redhat.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

type
{ Do not add fields to this struct  }
  PGVirConfigDomainSound = ^TGVirConfigDomainSound;
  TGVirConfigDomainSound = record
      parent : TGVirConfigDomainDevice;
      priv : PGVirConfigDomainSoundPrivate;
    end;

  PGVirConfigDomainSoundClass = ^TGVirConfigDomainSoundClass;
  TGVirConfigDomainSoundClass = record
      parent_class : TGVirConfigDomainDeviceClass;
      padding : array[0..19] of Tgpointer;
    end;


  PGVirConfigDomainSoundModel = ^TGVirConfigDomainSoundModel;
  TGVirConfigDomainSoundModel =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_SOUND_MODEL_SB16 = 0;
    GVIR_CONFIG_DOMAIN_SOUND_MODEL_ES1370 = 1;
    GVIR_CONFIG_DOMAIN_SOUND_MODEL_PCSPK = 2;
    GVIR_CONFIG_DOMAIN_SOUND_MODEL_AC97 = 3;
    GVIR_CONFIG_DOMAIN_SOUND_MODEL_ICH6 = 4;
    GVIR_CONFIG_DOMAIN_SOUND_MODEL_ICH9 = 5;
;

function gvir_config_domain_sound_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_sound_new:PGVirConfigDomainSound;cdecl;external libvirtgconfig;
function gvir_config_domain_sound_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainSound;cdecl;external libvirtgconfig;
procedure gvir_config_domain_sound_set_model(sound:PGVirConfigDomainSound; model:TGVirConfigDomainSoundModel);cdecl;external libvirtgconfig;

// === Konventiert am: 18-10-26 12:49:43 ===

function GVIR_CONFIG_TYPE_DOMAIN_SOUND : TGType;
function GVIR_CONFIG_DOMAIN_SOUND(obj : Pointer) : PGVirConfigDomainSound;
function GVIR_CONFIG_DOMAIN_SOUND_CLASS(klass : Pointer) : PGVirConfigDomainSoundClass;
function GVIR_CONFIG_IS_DOMAIN_SOUND(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_SOUND_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_SOUND_GET_CLASS(obj : Pointer) : PGVirConfigDomainSoundClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_SOUND : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_SOUND:=gvir_config_domain_sound_get_type;
  end;

function GVIR_CONFIG_DOMAIN_SOUND(obj : Pointer) : PGVirConfigDomainSound;
begin
  Result := PGVirConfigDomainSound(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_SOUND));
end;

function GVIR_CONFIG_DOMAIN_SOUND_CLASS(klass : Pointer) : PGVirConfigDomainSoundClass;
begin
  Result := PGVirConfigDomainSoundClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_SOUND));
end;

function GVIR_CONFIG_IS_DOMAIN_SOUND(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_SOUND);
end;

function GVIR_CONFIG_IS_DOMAIN_SOUND_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_SOUND);
end;

function GVIR_CONFIG_DOMAIN_SOUND_GET_CLASS(obj : Pointer) : PGVirConfigDomainSoundClass;
begin
  Result := PGVirConfigDomainSoundClass(PGTypeInstance(obj)^.g_class);
end;



end.
