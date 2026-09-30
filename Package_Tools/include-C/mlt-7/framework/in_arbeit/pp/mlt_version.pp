
unit mlt_version;
interface

{
  Automatically converted by H2Pas 1.0.0 from mlt_version.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mlt_version.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file mlt_version.h
 * \brief contains version information
 *
 * Copyright (C) 2010-2023 Meltytech, LLC
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
{$ifndef MLT_VERSION_H}
{$define MLT_VERSION_H}
{ Add quotes around any #define variables }

const
  LIBMLT_VERSION_MAJOR = 7;  
  LIBMLT_VERSION_MINOR = 22;  
  LIBMLT_VERSION_REVISION = 0;  

function mlt_version_get_int:longint;cdecl;external;
function mlt_version_get_major:longint;cdecl;external;
function mlt_version_get_minor:longint;cdecl;external;
function mlt_version_get_revision:longint;cdecl;external;
function mlt_version_get_string:Pchar;cdecl;external;
{$endif}

implementation


end.
