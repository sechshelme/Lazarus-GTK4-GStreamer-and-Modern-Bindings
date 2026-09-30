
unit mlt_cache;
interface

{
  Automatically converted by H2Pas 1.0.0 from mlt_cache.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mlt_cache.h
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
Plongint  = ^longint;
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

function mlt_cache_item_data(item:Tmlt_cache_item; size:Plongint):pointer;cdecl;external;
procedure mlt_cache_item_close(item:Tmlt_cache_item);cdecl;external;
function mlt_cache_init:Tmlt_cache;cdecl;external;
procedure mlt_cache_set_size(cache:Tmlt_cache; size:longint);cdecl;external;
function mlt_cache_get_size(cache:Tmlt_cache):longint;cdecl;external;
procedure mlt_cache_close(cache:Tmlt_cache);cdecl;external;
procedure mlt_cache_purge(cache:Tmlt_cache; object:pointer);cdecl;external;
procedure mlt_cache_put(cache:Tmlt_cache; object:pointer; data:pointer; size:longint; destructor:Tmlt_destructor);cdecl;external;
function mlt_cache_get(cache:Tmlt_cache; object:pointer):Tmlt_cache_item;cdecl;external;
procedure mlt_cache_put_frame(cache:Tmlt_cache; frame:Tmlt_frame);cdecl;external;
procedure mlt_cache_put_frame_audio(cache:Tmlt_cache; frame:Tmlt_frame);cdecl;external;
procedure mlt_cache_put_frame_image(cache:Tmlt_cache; frame:Tmlt_frame);cdecl;external;
function mlt_cache_get_frame(cache:Tmlt_cache; position:Tmlt_position):Tmlt_frame;cdecl;external;
{$endif}

implementation


end.
