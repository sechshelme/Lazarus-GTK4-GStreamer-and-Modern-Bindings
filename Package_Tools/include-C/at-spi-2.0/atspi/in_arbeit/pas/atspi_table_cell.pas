unit atspi_table_cell;

interface

uses
  fp_glib2, fp_atspi;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function atspi_table_cell_get_type: TGType; cdecl; external libatspi;

type
  PAtspiTableCell = ^TAtspiTableCell;
  TAtspiTableCell = record
    parent: TGTypeInterface;
  end;

function atspi_table_cell_get_column_span(obj: PAtspiTableCell; error: PPGError): Tgint; cdecl; external libatspi;
function atspi_table_cell_get_column_header_cells(obj: PAtspiTableCell; error: PPGError): PGPtrArray; cdecl; external libatspi;
function atspi_table_cell_get_column_index(obj: PAtspiTableCell; error: PPGError): Tgint; cdecl; external libatspi;
function atspi_table_cell_get_row_span(obj: PAtspiTableCell; error: PPGError): Tgint; cdecl; external libatspi;
function atspi_table_cell_get_row_header_cells(obj: PAtspiTableCell; error: PPGError): PGPtrArray; cdecl; external libatspi;
function atspi_table_cell_get_position(obj: PAtspiTableCell; row: Pgint; column: Pgint; error: PPGError): Tgint; cdecl; external libatspi;
procedure atspi_table_cell_get_row_column_span(obj: PAtspiTableCell; row: Pgint; column: Pgint; row_span: Pgint; column_span: Pgint;
  error: PPGError); cdecl; external libatspi;
function atspi_table_cell_get_table(obj: PAtspiTableCell; error: PPGError): PAtspiAccessible; cdecl; external libatspi;

// === Konventiert am: 26-9-26 13:15:11 ===

function ATSPI_TYPE_TABLE_CELL: TGType;
function ATSPI_TABLE_CELL(obj: Pointer): PAtspiTableCell;
function ATSPI_IS_TABLE_CELL(obj: Pointer): Tgboolean;
function ATSPI_TABLE_CELL_GET_IFACE(obj: Pointer): PAtspiTableCell;

implementation

function ATSPI_TYPE_TABLE_CELL: TGType;
begin
  ATSPI_TYPE_TABLE_CELL := atspi_table_cell_get_type;
end;

function ATSPI_TABLE_CELL(obj: Pointer): PAtspiTableCell;
begin
  Result := PAtspiTableCell(g_type_check_instance_cast(obj, ATSPI_TYPE_TABLE_CELL));
end;

function ATSPI_IS_TABLE_CELL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ATSPI_TYPE_TABLE_CELL);
end;

function ATSPI_TABLE_CELL_GET_IFACE(obj: Pointer): PAtspiTableCell;
begin
  Result := g_type_interface_peek(obj, ATSPI_TYPE_TABLE_CELL);
end;



end.
