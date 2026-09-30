unit mlt_playlist;

interface

uses
  fp_mlt;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file mlt_playlist.h
 * \brief playlist service class
 * \see mlt_playlist_s
 *
 * Copyright (C) 2003-2022 Meltytech, LLC
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
{$ifndef MLT_PLAYLIST_H}
{$define MLT_PLAYLIST_H}
{$include "mlt_producer.h"}
{* \brief structure for returning clip information from a playlist entry
  }
{*< the index of the clip within the playlist  }
{*< the clip's producer (or parent producer of a cut)  }
{*< the clips' cut producer  }
{*< the time this begins relative to the beginning of the playlist  }
{*< the file name or address of the clip  }
{*< the clip's in point  }
{*< the clip's out point  }
{*< the duration of the clip  }
{*< the unedited duration of the clip  }
{*< the frame rate of the clip  }
{*< the number of times the clip is repeated  }
type
  Pmlt_playlist_clip_info = ^Tmlt_playlist_clip_info;
  Tmlt_playlist_clip_info = record
      clip : longint;
      producer : Tmlt_producer;
      cut : Tmlt_producer;
      start : Tmlt_position;
      resource : Pchar;
      frame_in : Tmlt_position;
      frame_out : Tmlt_position;
      frame_count : Tmlt_position;
      length : Tmlt_position;
      fps : single;
      _repeat : longint;
    end;
{* Playlist Entry
 }
  Tplaylist_entry_s = Tplaylist_entry;
{* \brief Playlist class
 *
 * A playlist is a sequential container of producers and blank spaces. The class provides all
 * sorts of playlist assembly and manipulation routines. A playlist is also a producer within
 * the framework.
 *
 * \extends mlt_producer_s
 * \properties \em autoclose Set this true if you are doing sequential processing and want to
 * automatically close producers as they are finished being used to free resources.
 * \properties \em meta.fx_cut Set true on a producer to indicate that it is a "fx_cut,"
 * which is a way to add filters as a playlist entry - useful only in a multitrack. See FxCut in the docs.
 * \properties \em mix_in
 * \properties \em mix_out
 * \properties \em hide Set to 1 to hide the video (make it an audio-only track),
 * 2 to hide the audio (make it a video-only track), or 3 to hide audio and video (hidden track).
 * This property only applies when using a multitrack or transition.
 * \event \em playlist-next The playlist fires this when it moves to the next item in the list.
 *   The event data is an integer of the index of the entry that just completed.
  }
{/ Deprecated }
  Pmlt_playlist_s = ^Tmlt_playlist_s;
  Tmlt_playlist_s = record
      parent : Tmlt_producer_s;
      blank : Tmlt_producer_s;
      size : longint;
      count : longint;
      list : ^Pplaylist_entry;
    end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function MLT_PLAYLIST_PRODUCER(playlist : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_PLAYLIST_SERVICE(playlist : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_PLAYLIST_PROPERTIES(playlist : longint) : longint;

function mlt_playlist_init:Tmlt_playlist;cdecl;external libmlt;
function mlt_playlist_new(profile:Tmlt_profile):Tmlt_playlist;cdecl;external libmlt;
function mlt_playlist_producer(self:Tmlt_playlist):Tmlt_producer;cdecl;external libmlt;
function mlt_playlist_service(self:Tmlt_playlist):Tmlt_service;cdecl;external libmlt;
function mlt_playlist_properties(self:Tmlt_playlist):Tmlt_properties;cdecl;external libmlt;
function mlt_playlist_count(self:Tmlt_playlist):longint;cdecl;external libmlt;
function mlt_playlist_clear(self:Tmlt_playlist):longint;cdecl;external libmlt;
function mlt_playlist_append(self:Tmlt_playlist; producer:Tmlt_producer):longint;cdecl;external libmlt;
function mlt_playlist_append_io(self:Tmlt_playlist; producer:Tmlt_producer; in:Tmlt_position; out:Tmlt_position):longint;cdecl;external libmlt;
function mlt_playlist_blank(self:Tmlt_playlist; out:Tmlt_position):longint;cdecl;external libmlt;
function mlt_playlist_blank_time(self:Tmlt_playlist; length:Pchar):longint;cdecl;external libmlt;
function mlt_playlist_clip(self:Tmlt_playlist; whence:Tmlt_whence; index:longint):Tmlt_position;cdecl;external libmlt;
function mlt_playlist_current_clip(self:Tmlt_playlist):longint;cdecl;external libmlt;
function mlt_playlist_current(self:Tmlt_playlist):Tmlt_producer;cdecl;external libmlt;
function mlt_playlist_get_clip_info(self:Tmlt_playlist; info:Pmlt_playlist_clip_info; index:longint):longint;cdecl;external libmlt;
function mlt_playlist_insert(self:Tmlt_playlist; producer:Tmlt_producer; where:longint; in:Tmlt_position; out:Tmlt_position):longint;cdecl;external libmlt;
function mlt_playlist_remove(self:Tmlt_playlist; where:longint):longint;cdecl;external libmlt;
function mlt_playlist_move(self:Tmlt_playlist; from:longint; to:longint):longint;cdecl;external libmlt;
function mlt_playlist_reorder(self:Tmlt_playlist; indices:Plongint):longint;cdecl;external libmlt;
function mlt_playlist_resize_clip(self:Tmlt_playlist; clip:longint; in:Tmlt_position; out:Tmlt_position):longint;cdecl;external libmlt;
function mlt_playlist_repeat_clip(self:Tmlt_playlist; clip:longint; _repeat:longint):longint;cdecl;external libmlt;
function mlt_playlist_split(self:Tmlt_playlist; clip:longint; position:Tmlt_position):longint;cdecl;external libmlt;
function mlt_playlist_split_at(self:Tmlt_playlist; position:Tmlt_position; left:longint):longint;cdecl;external libmlt;
function mlt_playlist_join(self:Tmlt_playlist; clip:longint; count:longint; merge:longint):longint;cdecl;external libmlt;
function mlt_playlist_mix(self:Tmlt_playlist; clip:longint; length:longint; transition:Tmlt_transition):longint;cdecl;external libmlt;
function mlt_playlist_mix_in(self:Tmlt_playlist; clip:longint; length:longint):longint;cdecl;external libmlt;
function mlt_playlist_mix_out(self:Tmlt_playlist; clip:longint; length:longint):longint;cdecl;external libmlt;
function mlt_playlist_mix_add(self:Tmlt_playlist; clip:longint; transition:Tmlt_transition):longint;cdecl;external libmlt;
function mlt_playlist_get_clip(self:Tmlt_playlist; clip:longint):Tmlt_producer;cdecl;external libmlt;
function mlt_playlist_get_clip_at(self:Tmlt_playlist; position:Tmlt_position):Tmlt_producer;cdecl;external libmlt;
function mlt_playlist_get_clip_index_at(self:Tmlt_playlist; position:Tmlt_position):longint;cdecl;external libmlt;
function mlt_playlist_clip_is_mix(self:Tmlt_playlist; clip:longint):longint;cdecl;external libmlt;
procedure mlt_playlist_consolidate_blanks(self:Tmlt_playlist; keep_length:longint);cdecl;external libmlt;
function mlt_playlist_is_blank(self:Tmlt_playlist; clip:longint):longint;cdecl;external libmlt;
function mlt_playlist_is_blank_at(self:Tmlt_playlist; position:Tmlt_position):longint;cdecl;external libmlt;
procedure mlt_playlist_insert_blank(self:Tmlt_playlist; clip:longint; out:longint);cdecl;external libmlt;
procedure mlt_playlist_pad_blanks(self:Tmlt_playlist; position:Tmlt_position; length:longint; find:longint);cdecl;external libmlt;
function mlt_playlist_replace_with_blank(self:Tmlt_playlist; clip:longint):Tmlt_producer;cdecl;external libmlt;
function mlt_playlist_insert_at(self:Tmlt_playlist; position:Tmlt_position; producer:Tmlt_producer; mode:longint):longint;cdecl;external libmlt;
function mlt_playlist_clip_start(self:Tmlt_playlist; clip:longint):longint;cdecl;external libmlt;
function mlt_playlist_clip_length(self:Tmlt_playlist; clip:longint):longint;cdecl;external libmlt;
function mlt_playlist_blanks_from(self:Tmlt_playlist; clip:longint; bounded:longint):longint;cdecl;external libmlt;
function mlt_playlist_remove_region(self:Tmlt_playlist; position:Tmlt_position; length:longint):longint;cdecl;external libmlt;
procedure mlt_playlist_close(self:Tmlt_playlist);cdecl;external libmlt;
{$endif}

// === Konventiert am: 30-9-26 19:36:04 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_PLAYLIST_PRODUCER(playlist : longint) : longint;
begin
  MLT_PLAYLIST_PRODUCER:=@(playlist^.parent);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_PLAYLIST_SERVICE(playlist : longint) : longint;
begin
  MLT_PLAYLIST_SERVICE:=MLT_PRODUCER_SERVICE(MLT_PLAYLIST_PRODUCER(playlist));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_PLAYLIST_PROPERTIES(playlist : longint) : longint;
begin
  MLT_PLAYLIST_PROPERTIES:=MLT_SERVICE_PROPERTIES(MLT_PLAYLIST_SERVICE(playlist));
end;


end.
