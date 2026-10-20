
unit vncaudioformat;
interface

{
  Automatically converted by H2Pas 1.0.0 from vncaudioformat.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    vncaudioformat.h
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
PVncAudioFormatType  = ^VncAudioFormatType;
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
{$ifndef VNC_AUDIO_FORMAT_H}
{$define VNC_AUDIO_FORMAT_H}
{$include <glib.h>}
{$include <glib-object.h>}

{ was #define dname def_expr }
function VNC_TYPE_AUDIO_FORMAT : longint; { return type might be wrong }

type
  PVncAudioFormat = ^TVncAudioFormat;
  TVncAudioFormat = record
      format : Tguint8;
      nchannels : Tguint8;
      frequency : Tguint32;
    end;


  PVncAudioFormatType = ^TVncAudioFormatType;
  TVncAudioFormatType =  Longint;
  Const
    VNC_AUDIO_FORMAT_RAW_U8 = 0;
    VNC_AUDIO_FORMAT_RAW_S8 = 1;
    VNC_AUDIO_FORMAT_RAW_U16 = 2;
    VNC_AUDIO_FORMAT_RAW_S16 = 3;
    VNC_AUDIO_FORMAT_RAW_U32 = 4;
    VNC_AUDIO_FORMAT_RAW_S32 = 5;
;

function vnc_audio_format_get_type:TGType;cdecl;external;
function vnc_audio_format_new:PVncAudioFormat;cdecl;external;
function vnc_audio_format_copy(format:PVncAudioFormat):PVncAudioFormat;cdecl;external;
procedure vnc_audio_format_free(format:PVncAudioFormat);cdecl;external;
{$endif}
{ VNC_AUDIO_FORMAT_H  }

implementation

{ was #define dname def_expr }
function VNC_TYPE_AUDIO_FORMAT : longint; { return type might be wrong }
  begin
    VNC_TYPE_AUDIO_FORMAT:=vnc_audio_format_get_type;
  end;


end.
