
unit atspi_action;
interface

{
  Automatically converted by H2Pas 1.0.0 from atspi_action.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    atspi_action.h
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
PAtspiAction  = ^AtspiAction;
Pgchar  = ^gchar;
PGError  = ^GError;
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

{ was #define dname def_expr }
function ATSPI_TYPE_ACTION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_ACTION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_ACTION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_ACTION_GET_IFACE(obj : longint) : longint;

function atspi_action_get_type:TGType;cdecl;external;
type
  PAtspiAction = ^TAtspiAction;
  TAtspiAction = record
      parent : TGTypeInterface;
    end;


function atspi_action_get_action_description(obj:PAtspiAction; i:longint; error:PPGError):Pgchar;cdecl;external;
function atspi_action_get_action_name(obj:PAtspiAction; i:Tgint; error:PPGError):Pgchar;cdecl;external;
function atspi_action_get_n_actions(obj:PAtspiAction; error:PPGError):Tgint;cdecl;external;
function atspi_action_get_key_binding(obj:PAtspiAction; i:Tgint; error:PPGError):Pgchar;cdecl;external;
function atspi_action_get_localized_name(obj:PAtspiAction; i:Tgint; error:PPGError):Pgchar;cdecl;external;
function atspi_action_do_action(obj:PAtspiAction; i:Tgint; error:PPGError):Tgboolean;cdecl;external;
{$ifndef ATSPI_DISABLE_DEPRECATED}

function atspi_action_get_description(obj:PAtspiAction; i:Tgint; error:PPGError):Pgchar;cdecl;external;
function atspi_action_get_name(obj:PAtspiAction; i:Tgint; error:PPGError):Pgchar;cdecl;external;
{$endif}
{$endif}
{ _ATSPI_ACTION_H_  }

implementation

{ was #define dname def_expr }
function ATSPI_TYPE_ACTION : longint; { return type might be wrong }
  begin
    ATSPI_TYPE_ACTION:=atspi_action_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_ACTION(obj : longint) : longint;
begin
  ATSPI_ACTION:=G_TYPE_CHECK_INSTANCE_CAST(obj,ATSPI_TYPE_ACTION,AtspiAction);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_ACTION(obj : longint) : longint;
begin
  ATSPI_IS_ACTION:=G_TYPE_CHECK_INSTANCE_TYPE(obj,ATSPI_TYPE_ACTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_ACTION_GET_IFACE(obj : longint) : longint;
begin
  ATSPI_ACTION_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,ATSPI_TYPE_ACTION,AtspiAction);
end;


end.
