unit atspi_table_cell;

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
{$ifndef _ATSPI_TABLE_CELL_H_}
{$define _ATSPI_TABLE_CELL_H_}
{$include "glib-object.h"}
{$include "atspi-constants.h"}
{$include "atspi-types.h"}

function atspi_table_cell_get_type:TGType;cdecl;external libatspi;
type
  PAtspiTableCell = ^TAtspiTableCell;
  TAtspiTableCell = record
      parent : TGTypeInterface;
    end;


function atspi_table_cell_get_column_span(obj:PAtspiTableCell; error:PPGError):Tgint;cdecl;external libatspi;
function atspi_table_cell_get_column_header_cells(obj:PAtspiTableCell; error:PPGError):PGPtrArray;cdecl;external libatspi;
function atspi_table_cell_get_column_index(obj:PAtspiTableCell; error:PPGError):Tgint;cdecl;external libatspi;
function atspi_table_cell_get_row_span(obj:PAtspiTableCell; error:PPGError):Tgint;cdecl;external libatspi;
function atspi_table_cell_get_row_header_cells(obj:PAtspiTableCell; error:PPGError):PGPtrArray;cdecl;external libatspi;
function atspi_table_cell_get_position(obj:PAtspiTableCell; row:Pgint; column:Pgint; error:PPGError):Tgint;cdecl;external libatspi;
procedure atspi_table_cell_get_row_column_span(obj:PAtspiTableCell; row:Pgint; column:Pgint; row_span:Pgint; column_span:Pgint; 
            error:PPGError);cdecl;external libatspi;
function atspi_table_cell_get_table(obj:PAtspiTableCell; error:PPGError):PAtspiAccessible;cdecl;external libatspi;
{$endif}
{ _ATSPI_TABLE_CELL_H_  }

// === Konventiert am: 26-9-26 13:15:11 ===

function ATSPI_TYPE_TABLE_CELL : TGType;
function ATSPI_TABLE_CELL(obj : Pointer) : PAtspiTableCell;
function ATSPI_IS_TABLE_CELL(obj : Pointer) : Tgboolean;
function ATSPI_TABLE_CELL_GET_IFACE(obj : Pointer) : PAtspiTableCell;

implementation

function ATSPI_TYPE_TABLE_CELL : TGType;
  begin
    ATSPI_TYPE_TABLE_CELL:=atspi_table_cell_get_type;
  end;

function ATSPI_TABLE_CELL(obj : Pointer) : PAtspiTableCell;
begin
  Result := PAtspiTableCell(g_type_check_instance_cast(obj, ATSPI_TYPE_TABLE_CELL));
end;

function ATSPI_IS_TABLE_CELL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  ATSPI_TYPE_TABLE_CELL);
end;

function ATSPI_TABLE_CELL_GET_IFACE(obj : Pointer) : PAtspiTableCell;
begin
  Result := g_type_interface_peek(obj, ATSPI_TYPE_TABLE_CELL);
end;



end.
