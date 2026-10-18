
unit libvirt_gconfig_domain_sound;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_domain_sound.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_domain_sound.h
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
PGVirConfigDomainSound  = ^GVirConfigDomainSound;
PGVirConfigDomainSoundClass  = ^GVirConfigDomainSoundClass;
PGVirConfigDomainSoundModel  = ^GVirConfigDomainSoundModel;
PGVirConfigDomainSoundPrivate  = ^GVirConfigDomainSoundPrivate;
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

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_SOUND : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_SOUND(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_SOUND_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_SOUND(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_SOUND_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_SOUND_GET_CLASS(obj : longint) : longint;

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

function gvir_config_domain_sound_get_type:TGType;cdecl;external;
function gvir_config_domain_sound_new:PGVirConfigDomainSound;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_sound_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainSound;cdecl;external;
procedure gvir_config_domain_sound_set_model(sound:PGVirConfigDomainSound; model:TGVirConfigDomainSoundModel);cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_SOUND : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_DOMAIN_SOUND:=gvir_config_domain_sound_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_SOUND(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_SOUND:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_DOMAIN_SOUND,GVirConfigDomainSound);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_SOUND_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_SOUND_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_DOMAIN_SOUND,GVirConfigDomainSoundClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_SOUND(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_SOUND:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_DOMAIN_SOUND);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_SOUND_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_SOUND_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_DOMAIN_SOUND);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_SOUND_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_SOUND_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_DOMAIN_SOUND,GVirConfigDomainSoundClass);
end;


end.
