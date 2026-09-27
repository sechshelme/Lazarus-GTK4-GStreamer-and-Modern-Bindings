

  {$IFDEF read_struct}
type
  PAtspiSelection = ^TAtspiSelection;
  TAtspiSelection = record
    parent: TGTypeInterface;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function atspi_selection_get_type: TGType; cdecl; external libatspi;
function atspi_selection_get_n_selected_children(obj: PAtspiSelection; error: PPGError): Tgint; cdecl; external libatspi;
function atspi_selection_get_selected_child(obj: PAtspiSelection; selected_child_index: Tgint; error: PPGError): PAtspiAccessible; cdecl; external libatspi;
function atspi_selection_select_child(obj: PAtspiSelection; child_index: Tgint; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_selection_deselect_selected_child(obj: PAtspiSelection; selected_child_index: Tgint; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_selection_deselect_child(obj: PAtspiSelection; child_index: Tgint; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_selection_is_child_selected(obj: PAtspiSelection; child_index: Tgint; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_selection_select_all(obj: PAtspiSelection; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_selection_clear_selection(obj: PAtspiSelection; error: PPGError): Tgboolean; cdecl; external libatspi;

// === Konventiert am: 26-9-26 13:15:35 ===

function ATSPI_TYPE_SELECTION: TGType;
function ATSPI_SELECTION(obj: Pointer): PAtspiSelection;
function ATSPI_IS_SELECTION(obj: Pointer): Tgboolean;
function ATSPI_SELECTION_GET_IFACE(obj: Pointer): PAtspiSelection;
{$ENDIF read_function}


{$IFDEF read_implementation}

function ATSPI_TYPE_SELECTION: TGType;
begin
  ATSPI_TYPE_SELECTION := atspi_selection_get_type;
end;

function ATSPI_SELECTION(obj: Pointer): PAtspiSelection;
begin
  Result := PAtspiSelection(g_type_check_instance_cast(obj, ATSPI_TYPE_SELECTION));
end;

function ATSPI_IS_SELECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ATSPI_TYPE_SELECTION);
end;

function ATSPI_SELECTION_GET_IFACE(obj: Pointer): PAtspiSelection;
begin
  Result := g_type_interface_peek(obj, ATSPI_TYPE_SELECTION);
end;



{$ENDIF read_implementation}
