

  {$IFDEF read_struct}
type
  PAtspiEditableText = ^TAtspiEditableText;
  TAtspiEditableText = record
    parent: TGTypeInterface;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function atspi_editable_text_get_type: TGType; cdecl; external libatspi;
function atspi_editable_text_set_text_contents(obj: PAtspiEditableText; new_contents: Pgchar; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_editable_text_insert_text(obj: PAtspiEditableText; position: Tgint; text: Pgchar; length: Tgint; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_editable_text_copy_text(obj: PAtspiEditableText; start_pos: Tgint; end_pos: Tgint; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_editable_text_cut_text(obj: PAtspiEditableText; start_pos: Tgint; end_pos: Tgint; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_editable_text_delete_text(obj: PAtspiEditableText; start_pos: Tgint; end_pos: Tgint; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_editable_text_paste_text(obj: PAtspiEditableText; position: Tgint; error: PPGError): Tgboolean; cdecl; external libatspi;

// === Konventiert am: 26-9-26 13:10:49 ===

function ATSPI_TYPE_EDITABLE_TEXT: TGType;
function ATSPI_EDITABLE_TEXT(obj: Pointer): PAtspiEditableText;
function ATSPI_IS_EDITABLE_TEXT(obj: Pointer): Tgboolean;
function ATSPI_EDITABLE_TEXT_GET_IFACE(obj: Pointer): PAtspiEditableText;
{$ENDIF read_function}


{$IFDEF read_implementation}

function ATSPI_TYPE_EDITABLE_TEXT: TGType;
begin
  ATSPI_TYPE_EDITABLE_TEXT := atspi_editable_text_get_type;
end;

function ATSPI_EDITABLE_TEXT(obj: Pointer): PAtspiEditableText;
begin
  Result := PAtspiEditableText(g_type_check_instance_cast(obj, ATSPI_TYPE_EDITABLE_TEXT));
end;

function ATSPI_IS_EDITABLE_TEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ATSPI_TYPE_EDITABLE_TEXT);
end;

function ATSPI_EDITABLE_TEXT_GET_IFACE(obj: Pointer): PAtspiEditableText;
begin
  Result := g_type_interface_peek(obj, ATSPI_TYPE_EDITABLE_TEXT);
end;



{$ENDIF read_implementation}
