unit mlt_cache;

interface

uses
  fp_mlt;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file mlt_cache.h
 * \brief least recently used cache
 * \see mlt_cache_s
 *
 * Copyright (C) 2007-2023 Meltytech, LLC
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
{$ifndef MLT_CACHE_H}
{$define MLT_CACHE_H}
{$include "mlt_types.h"}

function mlt_cache_item_data(item:Tmlt_cache_item; size:Plongint):pointer;cdecl;external libmlt;
procedure mlt_cache_item_close(item:Tmlt_cache_item);cdecl;external libmlt;
function mlt_cache_init:Tmlt_cache;cdecl;external libmlt;
procedure mlt_cache_set_size(cache:Tmlt_cache; size:longint);cdecl;external libmlt;
function mlt_cache_get_size(cache:Tmlt_cache):longint;cdecl;external libmlt;
procedure mlt_cache_close(cache:Tmlt_cache);cdecl;external libmlt;
procedure mlt_cache_purge(cache:Tmlt_cache; object:pointer);cdecl;external libmlt;
procedure mlt_cache_put(cache:Tmlt_cache; object:pointer; data:pointer; size:longint; destructor:Tmlt_destructor);cdecl;external libmlt;
function mlt_cache_get(cache:Tmlt_cache; object:pointer):Tmlt_cache_item;cdecl;external libmlt;
procedure mlt_cache_put_frame(cache:Tmlt_cache; frame:Tmlt_frame);cdecl;external libmlt;
procedure mlt_cache_put_frame_audio(cache:Tmlt_cache; frame:Tmlt_frame);cdecl;external libmlt;
procedure mlt_cache_put_frame_image(cache:Tmlt_cache; frame:Tmlt_frame);cdecl;external libmlt;
function mlt_cache_get_frame(cache:Tmlt_cache; position:Tmlt_position):Tmlt_frame;cdecl;external libmlt;
{$endif}

// === Konventiert am: 30-9-26 19:27:29 ===


implementation



end.
