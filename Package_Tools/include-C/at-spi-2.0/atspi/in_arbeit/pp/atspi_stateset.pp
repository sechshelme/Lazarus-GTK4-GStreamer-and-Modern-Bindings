
unit atspi_stateset;
interface

{
  Automatically converted by H2Pas 1.0.0 from atspi_stateset.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    atspi_stateset.h
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
PAtspiAccessible  = ^AtspiAccessible;
PAtspiStateSet  = ^AtspiStateSet;
PAtspiStateSetClass  = ^AtspiStateSetClass;
PGArray  = ^GArray;
Pgchar  = ^gchar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * AT-SPI - Assistive Technology Service Provider Interface
 * (Gnome Accessibility Project; http://developer.gnome.org/projects/gap)
 *
 * Copyright 2001, 2002 Sun Microsystems Inc.,
 * Copyright 2001, 2002 Ximian, Inc.
 * Copyright 2010, 2011 Novell, Inc.
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
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef _ATSPI_STATE_SET_H_}
{$define _ATSPI_STATE_SET_H_}

{ was #define dname def_expr }
function ATSPI_TYPE_STATE_SET : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_STATE_SET(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_STATE_SET_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_STATE_SET(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_STATE_SET_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_STATE_SET_GET_CLASS(obj : longint) : longint;

type
  PAtspiStateSet = ^TAtspiStateSet;
  TAtspiStateSet = record
      parent : TGObject;
      accessible : PAtspiAccessible;
      states : Tgint64;
    end;

  PAtspiStateSetClass = ^TAtspiStateSetClass;
  TAtspiStateSetClass = record
      parent_class : TGObjectClass;
    end;


function atspi_state_set_get_type:TGType;cdecl;external;
function atspi_state_set_new(states:PGArray):PAtspiStateSet;cdecl;external;
(* Const before type ignored *)
procedure atspi_state_set_set_by_name(set:PAtspiStateSet; name:Pgchar; enabled:Tgboolean);cdecl;external;
procedure atspi_state_set_add(set:PAtspiStateSet; state:TAtspiStateType);cdecl;external;
function atspi_state_set_compare(set:PAtspiStateSet; set2:PAtspiStateSet):PAtspiStateSet;cdecl;external;
function atspi_state_set_contains(set:PAtspiStateSet; state:TAtspiStateType):Tgboolean;cdecl;external;
function atspi_state_set_equals(set:PAtspiStateSet; set2:PAtspiStateSet):Tgboolean;cdecl;external;
function atspi_state_set_get_states(set:PAtspiStateSet):PGArray;cdecl;external;
function atspi_state_set_is_empty(set:PAtspiStateSet):Tgboolean;cdecl;external;
procedure atspi_state_set_remove(set:PAtspiStateSet; state:TAtspiStateType);cdecl;external;
function _atspi_state_set_new_internal(accessible:PAtspiAccessible; states:Tgint64):PAtspiStateSet;cdecl;external;
{$endif}
{ _ATSPI_STATE_SET_H_  }

implementation

{ was #define dname def_expr }
function ATSPI_TYPE_STATE_SET : longint; { return type might be wrong }
  begin
    ATSPI_TYPE_STATE_SET:=atspi_state_set_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_STATE_SET(obj : longint) : longint;
begin
  ATSPI_STATE_SET:=G_TYPE_CHECK_INSTANCE_CAST(obj,ATSPI_TYPE_STATE_SET,AtspiStateSet);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_STATE_SET_CLASS(klass : longint) : longint;
begin
  ATSPI_STATE_SET_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,ATSPI_TYPE_STATE_SET,AtspiStateSetClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_STATE_SET(obj : longint) : longint;
begin
  ATSPI_IS_STATE_SET:=G_TYPE_CHECK_INSTANCE_TYPE(obj,ATSPI_TYPE_STATE_SET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_STATE_SET_CLASS(klass : longint) : longint;
begin
  ATSPI_IS_STATE_SET_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,ATSPI_TYPE_STATE_SET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_STATE_SET_GET_CLASS(obj : longint) : longint;
begin
  ATSPI_STATE_SET_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,ATSPI_TYPE_STATE_SET,AtspiStateSetClass);
end;


end.
