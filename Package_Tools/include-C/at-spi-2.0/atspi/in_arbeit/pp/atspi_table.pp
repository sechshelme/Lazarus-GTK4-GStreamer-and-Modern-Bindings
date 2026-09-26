
unit atspi_table;
interface

{
  Automatically converted by H2Pas 1.0.0 from atspi_table.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    atspi_table
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
PAtspiTable  = ^AtspiTable;
PGArray  = ^GArray;
Pgboolean  = ^gboolean;
Pgchar  = ^gchar;
PGError  = ^GError;
Pgint  = ^gint;
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
{$ifndef _ATSPI_TABLE_H_}
{$define _ATSPI_TABLE_H_}
{$include "glib-object.h"}
{$include "atspi-constants.h"}
{$include "atspi-types.h"}

{ was #define dname def_expr }
function ATSPI_TYPE_TABLE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_TABLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_TABLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_TABLE_GET_IFACE(obj : longint) : longint;

function atspi_table_get_type:TGType;cdecl;external;
type
  PAtspiTable = ^TAtspiTable;
  TAtspiTable = record
      parent : TGTypeInterface;
    end;


function atspi_table_get_caption(obj:PAtspiTable; error:PPGError):PAtspiAccessible;cdecl;external;
function atspi_table_get_summary(obj:PAtspiTable; error:PPGError):PAtspiAccessible;cdecl;external;
function atspi_table_get_n_rows(obj:PAtspiTable; error:PPGError):Tgint;cdecl;external;
function atspi_table_get_n_columns(obj:PAtspiTable; error:PPGError):Tgint;cdecl;external;
function atspi_table_get_accessible_at(obj:PAtspiTable; row:Tgint; column:Tgint; error:PPGError):PAtspiAccessible;cdecl;external;
function atspi_table_get_index_at(obj:PAtspiTable; row:Tgint; column:Tgint; error:PPGError):Tgint;cdecl;external;
function atspi_table_get_row_at_index(obj:PAtspiTable; index:Tgint; error:PPGError):Tgint;cdecl;external;
function atspi_table_get_column_at_index(obj:PAtspiTable; index:Tgint; error:PPGError):Tgint;cdecl;external;
function atspi_table_get_row_description(obj:PAtspiTable; row:Tgint; error:PPGError):Pgchar;cdecl;external;
function atspi_table_get_column_description(obj:PAtspiTable; column:Tgint; error:PPGError):Pgchar;cdecl;external;
function atspi_table_get_row_extent_at(obj:PAtspiTable; row:Tgint; column:Tgint; error:PPGError):Tgint;cdecl;external;
function atspi_table_get_column_extent_at(obj:PAtspiTable; row:Tgint; column:Tgint; error:PPGError):Tgint;cdecl;external;
function atspi_table_get_row_header(obj:PAtspiTable; row:Tgint; error:PPGError):PAtspiAccessible;cdecl;external;
function atspi_table_get_column_header(obj:PAtspiTable; column:Tgint; error:PPGError):PAtspiAccessible;cdecl;external;
function atspi_table_get_n_selected_rows(obj:PAtspiTable; error:PPGError):Tgint;cdecl;external;
function atspi_table_get_selected_rows(obj:PAtspiTable; error:PPGError):PGArray;cdecl;external;
function atspi_table_get_selected_columns(obj:PAtspiTable; error:PPGError):PGArray;cdecl;external;
function atspi_table_get_n_selected_columns(obj:PAtspiTable; error:PPGError):Tgint;cdecl;external;
function atspi_table_is_row_selected(obj:PAtspiTable; row:Tgint; error:PPGError):Tgboolean;cdecl;external;
function atspi_table_is_column_selected(obj:PAtspiTable; column:Tgint; error:PPGError):Tgboolean;cdecl;external;
function atspi_table_add_row_selection(obj:PAtspiTable; row:Tgint; error:PPGError):Tgboolean;cdecl;external;
function atspi_table_add_column_selection(obj:PAtspiTable; column:Tgint; error:PPGError):Tgboolean;cdecl;external;
function atspi_table_remove_row_selection(obj:PAtspiTable; row:Tgint; error:PPGError):Tgboolean;cdecl;external;
function atspi_table_remove_column_selection(obj:PAtspiTable; column:Tgint; error:PPGError):Tgboolean;cdecl;external;
function atspi_table_get_row_column_extents_at_index(obj:PAtspiTable; index:Tgint; row:Pgint; col:Pgint; row_extents:Pgint; 
           col_extents:Pgint; is_selected:Pgboolean; error:PPGError):Tgboolean;cdecl;external;
function atspi_table_is_selected(obj:PAtspiTable; row:Tgint; column:Tgint; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ _ATSPI_TABLE_H_  }

implementation

{ was #define dname def_expr }
function ATSPI_TYPE_TABLE : longint; { return type might be wrong }
  begin
    ATSPI_TYPE_TABLE:=atspi_table_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_TABLE(obj : longint) : longint;
begin
  ATSPI_TABLE:=G_TYPE_CHECK_INSTANCE_CAST(obj,ATSPI_TYPE_TABLE,AtspiTable);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_TABLE(obj : longint) : longint;
begin
  ATSPI_IS_TABLE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,ATSPI_TYPE_TABLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_TABLE_GET_IFACE(obj : longint) : longint;
begin
  ATSPI_TABLE_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,ATSPI_TYPE_TABLE,AtspiTable);
end;


end.
