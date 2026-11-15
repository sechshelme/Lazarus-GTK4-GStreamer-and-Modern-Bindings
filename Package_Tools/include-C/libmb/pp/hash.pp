
unit hash;
interface

{
  Automatically converted by H2Pas 1.0.0 from hash.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hash.h
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
Pbyte  = ^byte;
Pchar  = ^char;
Phash  = ^hash;
Pnlist  = ^nlist;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ libmb
 * Copyright (C) 2002 Matthew Allum
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$include <stdio.h>}
{$include <stdlib.h>}
{$include <string.h>}

const
  HASHSIZE = 101;  
type
  Phash = ^Thash;
  Thash = record
      hashtab : ^Pnlist;
      size : longint;
    end;

  Pnlist = ^Tnlist;
  Tnlist = record
      next : Pnlist;
      key : Pchar;
      value : Pbyte;
    end;


function hash_new(size:longint):Phash;cdecl;external;
function hashfunc(h:Phash; s:Pchar):dword;cdecl;external;
function hash_lookup(h:Phash; s:Pchar):Pnlist;cdecl;external;
function hash_add(h:Phash; key:Pchar; val:Pchar):Pnlist;cdecl;external;
procedure hash_empty;cdecl;external;
procedure hash_destroy(h:Phash);cdecl;external;

implementation


end.
