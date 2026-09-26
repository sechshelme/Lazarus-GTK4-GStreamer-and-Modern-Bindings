unit atspi_value;

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
 * Copyright 2010, 2011 Novell, Inc.
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
{$ifndef _ATSPI_VALUE_H_}
{$define _ATSPI_VALUE_H_}
{$include "glib-object.h"}
{$include "atspi-constants.h"}
{$include "atspi-types.h"}

function atspi_value_get_type:TGType;cdecl;external libatspi;
type
  PAtspiValue = ^TAtspiValue;
  TAtspiValue = record
      parent : TGTypeInterface;
    end;


function atspi_value_get_minimum_value(obj:PAtspiValue; error:PPGError):Tgdouble;cdecl;external libatspi;
function atspi_value_get_current_value(obj:PAtspiValue; error:PPGError):Tgdouble;cdecl;external libatspi;
function atspi_value_get_maximum_value(obj:PAtspiValue; error:PPGError):Tgdouble;cdecl;external libatspi;
function atspi_value_set_current_value(obj:PAtspiValue; new_value:Tgdouble; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_value_get_minimum_increment(obj:PAtspiValue; error:PPGError):Tgdouble;cdecl;external libatspi;
function atspi_value_get_text(obj:PAtspiValue; error:PPGError):Pgchar;cdecl;external libatspi;
{$endif}
{ _ATSPI_VALUE_H_  }

// === Konventiert am: 26-9-26 13:14:40 ===

function ATSPI_TYPE_VALUE : TGType;
function ATSPI_VALUE(obj : Pointer) : PAtspiValue;
function ATSPI_IS_VALUE(obj : Pointer) : Tgboolean;
function ATSPI_VALUE_GET_IFACE(obj : Pointer) : PAtspiValue;

implementation

function ATSPI_TYPE_VALUE : TGType;
  begin
    ATSPI_TYPE_VALUE:=atspi_value_get_type;
  end;

function ATSPI_VALUE(obj : Pointer) : PAtspiValue;
begin
  Result := PAtspiValue(g_type_check_instance_cast(obj, ATSPI_TYPE_VALUE));
end;

function ATSPI_IS_VALUE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  ATSPI_TYPE_VALUE);
end;

function ATSPI_VALUE_GET_IFACE(obj : Pointer) : PAtspiValue;
begin
  Result := g_type_interface_peek(obj, ATSPI_TYPE_VALUE);
end;



end.
