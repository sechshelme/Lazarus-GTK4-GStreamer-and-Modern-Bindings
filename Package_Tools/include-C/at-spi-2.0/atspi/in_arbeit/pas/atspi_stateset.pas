unit atspi_stateset;

interface

uses
  fp_glib2, fp_atspi;

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


function atspi_state_set_get_type:TGType;cdecl;external libatspi;
function atspi_state_set_new(states:PGArray):PAtspiStateSet;cdecl;external libatspi;
procedure atspi_state_set_set_by_name(set:PAtspiStateSet; name:Pgchar; enabled:Tgboolean);cdecl;external libatspi;
procedure atspi_state_set_add(set:PAtspiStateSet; state:TAtspiStateType);cdecl;external libatspi;
function atspi_state_set_compare(set:PAtspiStateSet; set2:PAtspiStateSet):PAtspiStateSet;cdecl;external libatspi;
function atspi_state_set_contains(set:PAtspiStateSet; state:TAtspiStateType):Tgboolean;cdecl;external libatspi;
function atspi_state_set_equals(set:PAtspiStateSet; set2:PAtspiStateSet):Tgboolean;cdecl;external libatspi;
function atspi_state_set_get_states(set:PAtspiStateSet):PGArray;cdecl;external libatspi;
function atspi_state_set_is_empty(set:PAtspiStateSet):Tgboolean;cdecl;external libatspi;
procedure atspi_state_set_remove(set:PAtspiStateSet; state:TAtspiStateType);cdecl;external libatspi;
function _atspi_state_set_new_internal(accessible:PAtspiAccessible; states:Tgint64):PAtspiStateSet;cdecl;external libatspi;
{$endif}
{ _ATSPI_STATE_SET_H_  }

// === Konventiert am: 26-9-26 13:15:23 ===

function ATSPI_TYPE_STATE_SET : TGType;
function ATSPI_STATE_SET(obj : Pointer) : PAtspiStateSet;
function ATSPI_STATE_SET_CLASS(klass : Pointer) : PAtspiStateSetClass;
function ATSPI_IS_STATE_SET(obj : Pointer) : Tgboolean;
function ATSPI_IS_STATE_SET_CLASS(klass : Pointer) : Tgboolean;
function ATSPI_STATE_SET_GET_CLASS(obj : Pointer) : PAtspiStateSetClass;

implementation

function ATSPI_TYPE_STATE_SET : TGType;
  begin
    ATSPI_TYPE_STATE_SET:=atspi_state_set_get_type;
  end;

function ATSPI_STATE_SET(obj : Pointer) : PAtspiStateSet;
begin
  Result := PAtspiStateSet(g_type_check_instance_cast(obj, ATSPI_TYPE_STATE_SET));
end;

function ATSPI_STATE_SET_CLASS(klass : Pointer) : PAtspiStateSetClass;
begin
  Result := PAtspiStateSetClass(g_type_check_class_cast(klass, ATSPI_TYPE_STATE_SET));
end;

function ATSPI_IS_STATE_SET(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  ATSPI_TYPE_STATE_SET);
end;

function ATSPI_IS_STATE_SET_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  ATSPI_TYPE_STATE_SET);
end;

function ATSPI_STATE_SET_GET_CLASS(obj : Pointer) : PAtspiStateSetClass;
begin
  Result := PAtspiStateSetClass(PGTypeInstance(obj)^.g_class);
end;



end.
