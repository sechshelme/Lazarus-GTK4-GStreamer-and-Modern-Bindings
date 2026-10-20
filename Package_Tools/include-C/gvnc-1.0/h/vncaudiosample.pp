
unit vncaudiosample;
interface

{
  Automatically converted by H2Pas 1.0.0 from vncaudiosample.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    vncaudiosample.h
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
Pguint8  = ^guint8;
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
{$ifndef VNC_AUDIO_SAMPLE_H}
{$define VNC_AUDIO_SAMPLE_H}
{$include <glib.h>}
{$include <glib-object.h>}

{ was #define dname def_expr }
function VNC_TYPE_AUDIO_SAMPLE : longint; { return type might be wrong }

type
  PVncAudioSample = ^TVncAudioSample;
  TVncAudioSample = record
      data : Pguint8;
      length : Tguint32;
      capacity : Tguint32;
    end;


function vnc_audio_sample_get_type:TGType;cdecl;external;
function vnc_audio_sample_new(capacity:Tguint32):PVncAudioSample;cdecl;external;
function vnc_audio_sample_copy(sample:PVncAudioSample):PVncAudioSample;cdecl;external;
procedure vnc_audio_sample_free(sample:PVncAudioSample);cdecl;external;
{$endif}
{ VNC_AUDIO_SAMPLE_H  }

implementation

{ was #define dname def_expr }
function VNC_TYPE_AUDIO_SAMPLE : longint; { return type might be wrong }
  begin
    VNC_TYPE_AUDIO_SAMPLE:=vnc_audio_sample_get_type;
  end;


end.
