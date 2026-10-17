
unit libvirt_gconfig_domain_audio;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_domain_audio.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_domain_audio.h
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
PGVirConfigDomainAudio  = ^GVirConfigDomainAudio;
PGVirConfigDomainAudioBackend  = ^GVirConfigDomainAudioBackend;
PGVirConfigDomainAudioClass  = ^GVirConfigDomainAudioClass;
PGVirConfigDomainAudioPrivate  = ^GVirConfigDomainAudioPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-audio.h: libvirt domain audio configuration
 *
 * Copyright (C) 2021 Red Hat, Inc.
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
 * Author: Felipe Borges <feborges@redhat.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_AUDIO : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_AUDIO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_AUDIO_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_AUDIO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_AUDIO_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_AUDIO_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirConfigDomainAudio = ^TGVirConfigDomainAudio;
  TGVirConfigDomainAudio = record
      parent : TGVirConfigDomainDevice;
      priv : PGVirConfigDomainAudioPrivate;
    end;

  PGVirConfigDomainAudioClass = ^TGVirConfigDomainAudioClass;
  TGVirConfigDomainAudioClass = record
      parent_class : TGVirConfigDomainDeviceClass;
      padding : array[0..19] of Tgpointer;
    end;


  PGVirConfigDomainAudioBackend = ^TGVirConfigDomainAudioBackend;
  TGVirConfigDomainAudioBackend =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_AUDIO_BACKEND_NONE = 0;
    GVIR_CONFIG_DOMAIN_AUDIO_BACKEND_ALSA = 1;
    GVIR_CONFIG_DOMAIN_AUDIO_BACKEND_COREAUDIO = 2;
    GVIR_CONFIG_DOMAIN_AUDIO_BACKEND_JACK = 3;
    GVIR_CONFIG_DOMAIN_AUDIO_BACKEND_OSS = 4;
    GVIR_CONFIG_DOMAIN_AUDIO_BACKEND_PULSEAUDIO = 5;
    GVIR_CONFIG_DOMAIN_AUDIO_BACKEND_SDL = 6;
    GVIR_CONFIG_DOMAIN_AUDIO_BACKEND_SPICE = 7;
    GVIR_CONFIG_DOMAIN_AUDIO_BACKEND_FILE = 8;
;

function gvir_config_domain_audio_get_type:TGType;cdecl;external;
function gvir_config_domain_audio_new:PGVirConfigDomainAudio;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_audio_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainAudio;cdecl;external;
procedure gvir_config_domain_audio_set_backend(audio:PGVirConfigDomainAudio; backend:TGVirConfigDomainAudioBackend);cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_audio_set_server_name(audio:PGVirConfigDomainAudio; server_name:Pgchar);cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_AUDIO : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_DOMAIN_AUDIO:=gvir_config_domain_audio_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_AUDIO(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_AUDIO:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_DOMAIN_AUDIO,GVirConfigDomainAudio);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_AUDIO_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_AUDIO_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_DOMAIN_AUDIO,GVirConfigDomainAudioClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_AUDIO(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_AUDIO:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_DOMAIN_AUDIO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_AUDIO_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_AUDIO_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_DOMAIN_AUDIO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_AUDIO_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_AUDIO_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_DOMAIN_AUDIO,GVirConfigDomainAudioClass);
end;


end.
