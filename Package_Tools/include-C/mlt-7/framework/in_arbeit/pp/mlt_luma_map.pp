
unit mlt_luma_map;
interface

{
  Automatically converted by H2Pas 1.0.0 from mlt_luma_map.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mlt_luma_map.h
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
Pchar  = ^char;
Plongint  = ^longint;
Pmlt_luma_map  = ^mlt_luma_map;
Pmlt_luma_map_s  = ^mlt_luma_map_s;
Puint16_t  = ^uint16_t;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * \file mlt_luma_map.h
 * \brief functions to generate and read luma-wipe transition maps
 *
 * Copyright (C) 2003-2019 Meltytech, LLC
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
{$ifndef MLT_LUMA_MAP_H}
{$define MLT_LUMA_MAP_H}
{$include <stdint.h>}
{$include <stdio.h>}
{ C++ extern C conditionnal removed }
type
  Pmlt_luma_map_s = ^Tmlt_luma_map_s;
  Tmlt_luma_map_s = record
      _type : longint;
      w : longint;
      h : longint;
      bands : longint;
      rband : longint;
      vmirror : longint;
      hmirror : longint;
      dmirror : longint;
      invert : longint;
      offset : longint;
      flip : longint;
      flop : longint;
      pflip : longint;
      pflop : longint;
      quart : longint;
      rotate : longint;
    end;


  Pmlt_luma_map = ^Tmlt_luma_map;
  Tmlt_luma_map = Pmlt_luma_map_s;

procedure mlt_luma_map_init(self:Tmlt_luma_map);cdecl;external;
(* Const before type ignored *)
function mlt_luma_map_new(path:Pchar):Tmlt_luma_map;cdecl;external;
function mlt_luma_map_render(self:Tmlt_luma_map):Puint16_t;cdecl;external;
(* Const before type ignored *)
function mlt_luma_map_from_pgm(filename:Pchar; map:PPuint16_t; width:Plongint; height:Plongint):longint;cdecl;external;
procedure mlt_luma_map_from_yuv422(image:Puint8_t; map:PPuint16_t; width:longint; height:longint);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
