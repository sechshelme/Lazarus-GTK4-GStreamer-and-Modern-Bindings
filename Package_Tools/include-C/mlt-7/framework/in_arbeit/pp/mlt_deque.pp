
unit mlt_deque;
interface

{
  Automatically converted by H2Pas 1.0.0 from mlt_deque.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mlt_deque.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file mlt_deque.h
 * \brief double ended queue
 * \see mlt_deque_s
 *
 * Copyright (C) 2003-2014 Meltytech, LLC
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
{$ifndef MLT_DEQUE_H}
{$define MLT_DEQUE_H}
{$include "mlt_types.h"}
{* The callback function used to compare items for insert sort.
 *
 * \public \memberof mlt_deque_s
 * \param a the first object
 * \param b the second object
 * \returns 0 if equal, < 0 if a < b, or > 0 if a > b
 }
type

  Tmlt_deque_compare = function (a:pointer; b:pointer):longint;cdecl;

function mlt_deque_init:Tmlt_deque;cdecl;external;
function mlt_deque_count(self:Tmlt_deque):longint;cdecl;external;
function mlt_deque_push_back(self:Tmlt_deque; item:pointer):longint;cdecl;external;
function mlt_deque_pop_back(self:Tmlt_deque):pointer;cdecl;external;
function mlt_deque_push_front(self:Tmlt_deque; item:pointer):longint;cdecl;external;
function mlt_deque_pop_front(self:Tmlt_deque):pointer;cdecl;external;
function mlt_deque_peek_back(self:Tmlt_deque):pointer;cdecl;external;
function mlt_deque_peek_front(self:Tmlt_deque):pointer;cdecl;external;
function mlt_deque_peek(self:Tmlt_deque; index:longint):pointer;cdecl;external;
function mlt_deque_insert(self:Tmlt_deque; item:pointer; para3:Tmlt_deque_compare):longint;cdecl;external;
function mlt_deque_push_back_int(self:Tmlt_deque; item:longint):longint;cdecl;external;
function mlt_deque_pop_back_int(self:Tmlt_deque):longint;cdecl;external;
function mlt_deque_push_front_int(self:Tmlt_deque; item:longint):longint;cdecl;external;
function mlt_deque_pop_front_int(self:Tmlt_deque):longint;cdecl;external;
function mlt_deque_peek_back_int(self:Tmlt_deque):longint;cdecl;external;
function mlt_deque_peek_front_int(self:Tmlt_deque):longint;cdecl;external;
function mlt_deque_push_back_double(self:Tmlt_deque; item:Tdouble):longint;cdecl;external;
function mlt_deque_pop_back_double(self:Tmlt_deque):Tdouble;cdecl;external;
function mlt_deque_push_front_double(self:Tmlt_deque; item:Tdouble):longint;cdecl;external;
function mlt_deque_pop_front_double(self:Tmlt_deque):Tdouble;cdecl;external;
function mlt_deque_peek_back_double(self:Tmlt_deque):Tdouble;cdecl;external;
function mlt_deque_peek_front_double(self:Tmlt_deque):Tdouble;cdecl;external;
procedure mlt_deque_close(self:Tmlt_deque);cdecl;external;
{$endif}

implementation


end.
