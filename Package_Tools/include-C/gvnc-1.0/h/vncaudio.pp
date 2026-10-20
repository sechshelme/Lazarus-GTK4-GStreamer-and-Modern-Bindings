
unit vncaudio;
interface

{
  Automatically converted by H2Pas 1.0.0 from vncaudio.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    vncaudio
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
PVncAudio  = ^VncAudio;
PVncAudioFormat  = ^VncAudioFormat;
PVncAudioInterface  = ^VncAudioInterface;
PVncAudioSample  = ^VncAudioSample;
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
{$ifndef VNC_AUDIO_H}
{$define VNC_AUDIO_H}
{$include <glib-object.h>}
{$include <vncaudioformat.h>}
{$include <vncaudiosample.h>}

{ was #define dname def_expr }
function VNC_TYPE_AUDIO : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_AUDIO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_IS_AUDIO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_AUDIO_GET_INTERFACE(inst : longint) : longint;

type
{ Dummy object  }
  PVncAudioInterface = ^TVncAudioInterface;
  TVncAudioInterface = record
      parent : TGTypeInterface;
      playback_start : function (audio:PVncAudio; format:PVncAudioFormat):Tgboolean;cdecl;
      playback_stop : function (audio:PVncAudio):Tgboolean;cdecl;
      playback_data : function (audio:PVncAudio; sample:PVncAudioSample):Tgboolean;cdecl;
    end;


function vnc_audio_get_type:TGType;cdecl;external;
procedure vnc_audio_playback_start(aud:PVncAudio; format:PVncAudioFormat);cdecl;external;
procedure vnc_audio_playback_stop(aud:PVncAudio);cdecl;external;
procedure vnc_audio_playback_data(aud:PVncAudio; sample:PVncAudioSample);cdecl;external;
{$endif}
{ VNC_AUDIO_H  }

implementation

{ was #define dname def_expr }
function VNC_TYPE_AUDIO : longint; { return type might be wrong }
  begin
    VNC_TYPE_AUDIO:=vnc_audio_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_AUDIO(obj : longint) : longint;
begin
  VNC_AUDIO:=G_TYPE_CHECK_INSTANCE_CAST(obj,VNC_TYPE_AUDIO,VncAudio);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_IS_AUDIO(obj : longint) : longint;
begin
  VNC_IS_AUDIO:=G_TYPE_CHECK_INSTANCE_TYPE(obj,VNC_TYPE_AUDIO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_AUDIO_GET_INTERFACE(inst : longint) : longint;
begin
  VNC_AUDIO_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(inst,VNC_TYPE_AUDIO,VncAudioInterface);
end;


end.
