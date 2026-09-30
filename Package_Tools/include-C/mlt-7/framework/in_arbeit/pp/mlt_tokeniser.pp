
unit mlt_tokeniser;
interface

{
  Automatically converted by H2Pas 1.0.0 from mlt_tokeniser.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mlt_tokeniser.h
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
Pmlt_tokeniser  = ^mlt_tokeniser;
Pmlt_tokeniser_t  = ^mlt_tokeniser_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file mlt_tokeniser.h
 * \brief string tokeniser
 * \see mlt_tokeniser_s
 *
 * Copyright (C) 2002-2014 Meltytech, LLC
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
{$ifndef MLT_TOKENISER_H}
{$define MLT_TOKENISER_H}
{* \brief Tokeniser class
 *
  }
type
  Pmlt_tokeniser = ^Tmlt_tokeniser;
  Tmlt_tokeniser = ^record
      input : Pchar;
      tokens : ^Pchar;
      count : longint;
      size : longint;
    end;
  Tmlt_tokeniser_t = Tmlt_tokeniser;
  Pmlt_tokeniser_t = ^Tmlt_tokeniser_t;
{ Remote parser API.
 }

function mlt_tokeniser_init:Tmlt_tokeniser;cdecl;external;
(* Const before type ignored *)
function mlt_tokeniser_parse_new(tokeniser:Tmlt_tokeniser; text:Pchar; delimiter:Pchar):longint;cdecl;external;
function mlt_tokeniser_get_input(tokeniser:Tmlt_tokeniser):Pchar;cdecl;external;
function mlt_tokeniser_count(tokeniser:Tmlt_tokeniser):longint;cdecl;external;
function mlt_tokeniser_get_string(tokeniser:Tmlt_tokeniser; index:longint):Pchar;cdecl;external;
procedure mlt_tokeniser_close(tokeniser:Tmlt_tokeniser);cdecl;external;
{$endif}

implementation


end.
