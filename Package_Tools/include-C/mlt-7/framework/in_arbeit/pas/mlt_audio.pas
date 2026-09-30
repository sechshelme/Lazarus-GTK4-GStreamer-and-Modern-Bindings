unit mlt_audio;

interface

uses
  fp_mlt;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file mlt_audio.h
 * \brief Audio class
 * \see mlt_audio_s
 *
 * Copyright (C) 2020 Meltytech, LLC
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
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
  }
{$ifndef MLT_AUDIO_H}
{$define MLT_AUDIO_H}
{$include "mlt_types.h"}
{* \brief Audio class
 *
 * Audio is the data object that represents audio for a period of time.
  }
type
  Pmlt_audio_s = ^Tmlt_audio_s;
  Tmlt_audio_s = record
      data : pointer;
      frequency : longint;
      format : Tmlt_audio_format;
      samples : longint;
      channels : longint;
      layout : Tmlt_channel_layout;
      release_data : Tmlt_destructor;
      close : Tmlt_destructor;
    end;


function mlt_audio_new:Tmlt_audio;cdecl;external libmlt;
procedure mlt_audio_close(self:Tmlt_audio);cdecl;external libmlt;
procedure mlt_audio_set_values(self:Tmlt_audio; data:pointer; frequency:longint; format:Tmlt_audio_format; samples:longint; 
            channels:longint);cdecl;external libmlt;
procedure mlt_audio_get_values(self:Tmlt_audio; data:Ppointer; frequency:Plongint; format:Pmlt_audio_format; samples:Plongint; 
            channels:Plongint);cdecl;external libmlt;
procedure mlt_audio_alloc_data(self:Tmlt_audio);cdecl;external libmlt;
procedure mlt_audio_free_data(self:Tmlt_audio);cdecl;external libmlt;
function mlt_audio_calculate_size(self:Tmlt_audio):longint;cdecl;external libmlt;
function mlt_audio_plane_count(self:Tmlt_audio):longint;cdecl;external libmlt;
function mlt_audio_plane_size(self:Tmlt_audio):longint;cdecl;external libmlt;
procedure mlt_audio_get_planes(self:Tmlt_audio; planes:PPuint8_t);cdecl;external libmlt;
procedure mlt_audio_silence(self:Tmlt_audio; samples:longint; start:longint);cdecl;external libmlt;
procedure mlt_audio_shrink(self:Tmlt_audio; samples:longint);cdecl;external libmlt;
procedure mlt_audio_reverse(self:Tmlt_audio);cdecl;external libmlt;
procedure mlt_audio_copy(dst:Tmlt_audio; src:Tmlt_audio; samples:longint; src_start:longint; dst_start:longint);cdecl;external libmlt;
function mlt_audio_calculate_frame_samples(fps:single; frequency:longint; position:Tint64_t):longint;cdecl;external libmlt;
function mlt_audio_calculate_samples_to_position(fps:single; frequency:longint; position:Tint64_t):Tint64_t;cdecl;external libmlt;
function mlt_audio_format_name(format:Tmlt_audio_format):Pchar;cdecl;external libmlt;
function mlt_audio_format_size(format:Tmlt_audio_format; samples:longint; channels:longint):longint;cdecl;external libmlt;
function mlt_audio_channel_layout_name(layout:Tmlt_channel_layout):Pchar;cdecl;external libmlt;
function mlt_audio_channel_layout_id(name:Pchar):Tmlt_channel_layout;cdecl;external libmlt;
function mlt_audio_channel_layout_channels(layout:Tmlt_channel_layout):longint;cdecl;external libmlt;
function mlt_audio_channel_layout_default(channels:longint):Tmlt_channel_layout;cdecl;external libmlt;
{$endif}

// === Konventiert am: 30-9-26 19:27:32 ===


implementation



end.
