unit atspi_action;

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
 * Copyright 2002 Ximian, Inc.
 *           2002 Sun Microsystems Inc.
 *
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
{$ifndef _ATSPI_ACTION_H_}
{$define _ATSPI_ACTION_H_}
{$include "glib-object.h"}
{$include "atspi-constants.h"}
{$include "atspi-types.h"}

function atspi_action_get_type:TGType;cdecl;external libatspi;
type
  PAtspiAction = ^TAtspiAction;
  TAtspiAction = record
      parent : TGTypeInterface;
    end;


function atspi_action_get_action_description(obj:PAtspiAction; i:longint; error:PPGError):Pgchar;cdecl;external libatspi;
function atspi_action_get_action_name(obj:PAtspiAction; i:Tgint; error:PPGError):Pgchar;cdecl;external libatspi;
function atspi_action_get_n_actions(obj:PAtspiAction; error:PPGError):Tgint;cdecl;external libatspi;
function atspi_action_get_key_binding(obj:PAtspiAction; i:Tgint; error:PPGError):Pgchar;cdecl;external libatspi;
function atspi_action_get_localized_name(obj:PAtspiAction; i:Tgint; error:PPGError):Pgchar;cdecl;external libatspi;
function atspi_action_do_action(obj:PAtspiAction; i:Tgint; error:PPGError):Tgboolean;cdecl;external libatspi;
{$ifndef ATSPI_DISABLE_DEPRECATED}

function atspi_action_get_description(obj:PAtspiAction; i:Tgint; error:PPGError):Pgchar;cdecl;external libatspi;
function atspi_action_get_name(obj:PAtspiAction; i:Tgint; error:PPGError):Pgchar;cdecl;external libatspi;
{$endif}
{$endif}
{ _ATSPI_ACTION_H_  }

// === Konventiert am: 26-9-26 12:58:37 ===

function ATSPI_TYPE_ACTION : TGType;
function ATSPI_ACTION(obj : Pointer) : PAtspiAction;
function ATSPI_IS_ACTION(obj : Pointer) : Tgboolean;
function ATSPI_ACTION_GET_IFACE(obj : Pointer) : PAtspiAction;

implementation

function ATSPI_TYPE_ACTION : TGType;
  begin
    ATSPI_TYPE_ACTION:=atspi_action_get_type;
  end;

function ATSPI_ACTION(obj : Pointer) : PAtspiAction;
begin
  Result := PAtspiAction(g_type_check_instance_cast(obj, ATSPI_TYPE_ACTION));
end;

function ATSPI_IS_ACTION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  ATSPI_TYPE_ACTION);
end;

function ATSPI_ACTION_GET_IFACE(obj : Pointer) : PAtspiAction;
begin
  Result := g_type_interface_peek(obj, ATSPI_TYPE_ACTION);
end;



end.
