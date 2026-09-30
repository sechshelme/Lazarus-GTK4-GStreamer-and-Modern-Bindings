
unit mlt_pool;
interface

{
  Automatically converted by H2Pas 1.0.0 from mlt_pool.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mlt_pool.h
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
 * \file mlt_pool.h
 * \brief memory pooling functionality
 * \see mlt_pool_s
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
{$ifndef MLT_POOL_H}
{$define MLT_POOL_H}

procedure mlt_pool_init;cdecl;external;
function mlt_pool_alloc(size:longint):pointer;cdecl;external;
function mlt_pool_realloc(ptr:pointer; size:longint):pointer;cdecl;external;
procedure mlt_pool_release(release:pointer);cdecl;external;
procedure mlt_pool_purge;cdecl;external;
procedure mlt_pool_close;cdecl;external;
procedure mlt_pool_stat;cdecl;external;
{$endif}

implementation


end.
