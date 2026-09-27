

  {$IFDEF read_struct}
type
  PAtspiTable = ^TAtspiTable;
  TAtspiTable = record
    parent: TGTypeInterface;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function atspi_table_get_type: TGType; cdecl; external libatspi;
function atspi_table_get_caption(obj: PAtspiTable; error: PPGError): PAtspiAccessible; cdecl; external libatspi;
function atspi_table_get_summary(obj: PAtspiTable; error: PPGError): PAtspiAccessible; cdecl; external libatspi;
function atspi_table_get_n_rows(obj: PAtspiTable; error: PPGError): Tgint; cdecl; external libatspi;
function atspi_table_get_n_columns(obj: PAtspiTable; error: PPGError): Tgint; cdecl; external libatspi;
function atspi_table_get_accessible_at(obj: PAtspiTable; row: Tgint; column: Tgint; error: PPGError): PAtspiAccessible; cdecl; external libatspi;
function atspi_table_get_index_at(obj: PAtspiTable; row: Tgint; column: Tgint; error: PPGError): Tgint; cdecl; external libatspi;
function atspi_table_get_row_at_index(obj: PAtspiTable; index: Tgint; error: PPGError): Tgint; cdecl; external libatspi;
function atspi_table_get_column_at_index(obj: PAtspiTable; index: Tgint; error: PPGError): Tgint; cdecl; external libatspi;
function atspi_table_get_row_description(obj: PAtspiTable; row: Tgint; error: PPGError): Pgchar; cdecl; external libatspi;
function atspi_table_get_column_description(obj: PAtspiTable; column: Tgint; error: PPGError): Pgchar; cdecl; external libatspi;
function atspi_table_get_row_extent_at(obj: PAtspiTable; row: Tgint; column: Tgint; error: PPGError): Tgint; cdecl; external libatspi;
function atspi_table_get_column_extent_at(obj: PAtspiTable; row: Tgint; column: Tgint; error: PPGError): Tgint; cdecl; external libatspi;
function atspi_table_get_row_header(obj: PAtspiTable; row: Tgint; error: PPGError): PAtspiAccessible; cdecl; external libatspi;
function atspi_table_get_column_header(obj: PAtspiTable; column: Tgint; error: PPGError): PAtspiAccessible; cdecl; external libatspi;
function atspi_table_get_n_selected_rows(obj: PAtspiTable; error: PPGError): Tgint; cdecl; external libatspi;
function atspi_table_get_selected_rows(obj: PAtspiTable; error: PPGError): PGArray; cdecl; external libatspi;
function atspi_table_get_selected_columns(obj: PAtspiTable; error: PPGError): PGArray; cdecl; external libatspi;
function atspi_table_get_n_selected_columns(obj: PAtspiTable; error: PPGError): Tgint; cdecl; external libatspi;
function atspi_table_is_row_selected(obj: PAtspiTable; row: Tgint; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_table_is_column_selected(obj: PAtspiTable; column: Tgint; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_table_add_row_selection(obj: PAtspiTable; row: Tgint; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_table_add_column_selection(obj: PAtspiTable; column: Tgint; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_table_remove_row_selection(obj: PAtspiTable; row: Tgint; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_table_remove_column_selection(obj: PAtspiTable; column: Tgint; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_table_get_row_column_extents_at_index(obj: PAtspiTable; index: Tgint; row: Pgint; col: Pgint; row_extents: Pgint;
  col_extents: Pgint; is_selected: Pgboolean; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_table_is_selected(obj: PAtspiTable; row: Tgint; column: Tgint; error: PPGError): Tgboolean; cdecl; external libatspi;

// === Konventiert am: 26-9-26 13:15:16 ===

function ATSPI_TYPE_TABLE: TGType;
function ATSPI_TABLE(obj: Pointer): PAtspiTable;
function ATSPI_IS_TABLE(obj: Pointer): Tgboolean;
function ATSPI_TABLE_GET_IFACE(obj: Pointer): PAtspiTable;
{$ENDIF read_function}


{$IFDEF read_implementation}

function ATSPI_TYPE_TABLE: TGType;
begin
  ATSPI_TYPE_TABLE := atspi_table_get_type;
end;

function ATSPI_TABLE(obj: Pointer): PAtspiTable;
begin
  Result := PAtspiTable(g_type_check_instance_cast(obj, ATSPI_TYPE_TABLE));
end;

function ATSPI_IS_TABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ATSPI_TYPE_TABLE);
end;

function ATSPI_TABLE_GET_IFACE(obj: Pointer): PAtspiTable;
begin
  Result := g_type_interface_peek(obj, ATSPI_TYPE_TABLE);
end;



{$ENDIF read_implementation}
