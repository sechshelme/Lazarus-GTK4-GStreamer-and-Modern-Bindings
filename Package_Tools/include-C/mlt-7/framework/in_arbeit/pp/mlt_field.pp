
unit mlt_field;
interface

{
  Automatically converted by H2Pas 1.0.0 from mlt_field.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mlt_field.h
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
 * \file mlt_field.h
 * \brief a field for planting multiple transitions and services
 * \see mlt_field_s
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
{$ifndef MLT_FIELD_H}
{$define MLT_FIELD_H}
{$include "mlt_types.h"}

function mlt_field_init:Tmlt_field;cdecl;external;
function mlt_field_new(multitrack:Tmlt_multitrack; tractor:Tmlt_tractor):Tmlt_field;cdecl;external;
function mlt_field_service(self:Tmlt_field):Tmlt_service;cdecl;external;
function mlt_field_tractor(self:Tmlt_field):Tmlt_tractor;cdecl;external;
function mlt_field_multitrack(self:Tmlt_field):Tmlt_multitrack;cdecl;external;
function mlt_field_properties(self:Tmlt_field):Tmlt_properties;cdecl;external;
function mlt_field_plant_filter(self:Tmlt_field; that:Tmlt_filter; track:longint):longint;cdecl;external;
function mlt_field_plant_transition(self:Tmlt_field; that:Tmlt_transition; a_track:longint; b_track:longint):longint;cdecl;external;
procedure mlt_field_close(self:Tmlt_field);cdecl;external;
procedure mlt_field_disconnect_service(self:Tmlt_field; service:Tmlt_service);cdecl;external;
{$endif}

implementation


end.
