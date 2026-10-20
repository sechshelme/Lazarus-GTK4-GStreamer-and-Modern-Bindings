
unit vncbaseaudio;
interface

{
  Automatically converted by H2Pas 1.0.0 from vncbaseaudio.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    vncbaseaudio.h
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
PVncAudioFormat  = ^VncAudioFormat;
PVncAudioSample  = ^VncAudioSample;
PVncBaseAudio  = ^VncBaseAudio;
PVncBaseAudioClass  = ^VncBaseAudioClass;
PVncBaseAudioPrivate  = ^VncBaseAudioPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GTK VNC Widget
 *
 * Copyright (C) 2010 Daniel P. Berrange <dan@berrange.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.0 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
  }
{$ifndef VNC_BASE_AUDIO_H}
{$define VNC_BASE_AUDIO_H}
{$include <glib-object.h>}
{$include <vncaudio.h>}

{ was #define dname def_expr }
function VNC_TYPE_BASE_AUDIO : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_BASE_AUDIO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_BASE_AUDIO_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_IS_BASE_AUDIO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_IS_BASE_AUDIO_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_BASE_AUDIO_GET_CLASS(obj : longint) : longint;

type
  PVncBaseAudio = ^TVncBaseAudio;
  TVncBaseAudio = record
      parent : TGObject;
      priv : PVncBaseAudioPrivate;
    end;

  PVncBaseAudioClass = ^TVncBaseAudioClass;
  TVncBaseAudioClass = record
      parent_class : TGObjectClass;
      playback_start : function (audio:PVncBaseAudio; format:PVncAudioFormat):Tgboolean;cdecl;
      playback_stop : function (audio:PVncBaseAudio):Tgboolean;cdecl;
      playback_data : function (audio:PVncBaseAudio; sample:PVncAudioSample):Tgboolean;cdecl;
    end;


function vnc_base_audio_get_type:TGType;cdecl;external;
function vnc_base_audio_new:PVncBaseAudio;cdecl;external;
{$endif}
{ VNC_BASE_AUDIO_H  }

implementation

{ was #define dname def_expr }
function VNC_TYPE_BASE_AUDIO : longint; { return type might be wrong }
  begin
    VNC_TYPE_BASE_AUDIO:=vnc_base_audio_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_BASE_AUDIO(obj : longint) : longint;
begin
  VNC_BASE_AUDIO:=G_TYPE_CHECK_INSTANCE_CAST(obj,VNC_TYPE_BASE_AUDIO,VncBaseAudio);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_BASE_AUDIO_CLASS(klass : longint) : longint;
begin
  VNC_BASE_AUDIO_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,VNC_TYPE_BASE_AUDIO,VncBaseAudioClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_IS_BASE_AUDIO(obj : longint) : longint;
begin
  VNC_IS_BASE_AUDIO:=G_TYPE_CHECK_INSTANCE_TYPE(obj,VNC_TYPE_BASE_AUDIO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_IS_BASE_AUDIO_CLASS(klass : longint) : longint;
begin
  VNC_IS_BASE_AUDIO_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,VNC_TYPE_BASE_AUDIO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_BASE_AUDIO_GET_CLASS(obj : longint) : longint;
begin
  VNC_BASE_AUDIO_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,VNC_TYPE_BASE_AUDIO,VncBaseAudioClass);
end;


end.
