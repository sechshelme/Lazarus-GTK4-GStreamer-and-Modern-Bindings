unit atspi_text;

interface

uses
  fp_glib2, fp_atspi, atspi_constants, atspi_component;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAtspiRange = ^TAtspiRange;
  TAtspiRange = record
    start_offset: Tgint;
    end_offset: Tgint;
  end;

function atspi_range_get_type: TGType; cdecl; external libatspi;
function atspi_range_copy(src: PAtspiRange): PAtspiRange; cdecl; external libatspi;

type
  PAtspiTextRange = ^TAtspiTextRange;
  TAtspiTextRange = record
    start_offset: Tgint;
    end_offset: Tgint;
    content: Pgchar;
  end;

function atspi_text_get_type: TGType; cdecl; external libatspi;
type
  PAtspiText = ^TAtspiText;
  TAtspiText = record
    parent: TGTypeInterface;
  end;

function atspi_text_range_get_type: TGType; cdecl; external libatspi;
function atspi_text_get_character_count(obj: PAtspiText; error: PPGError): Tgint; cdecl; external libatspi;
function atspi_text_get_text(obj: PAtspiText; start_offset: Tgint; end_offset: Tgint; error: PPGError): Pgchar; cdecl; external libatspi;
function atspi_text_get_caret_offset(obj: PAtspiText; error: PPGError): Tgint; cdecl; external libatspi;

function atspi_text_get_attributes(obj: PAtspiText; offset: Tgint; start_offset: Pgint; end_offset: Pgint; error: PPGError): PGHashTable; cdecl; external libatspi; deprecated;

function atspi_text_get_text_attributes(obj: PAtspiText; offset: Tgint; start_offset: Pgint; end_offset: Pgint; error: PPGError): PGHashTable; cdecl; external libatspi;
function atspi_text_get_attribute_run(obj: PAtspiText; offset: Tgint; include_defaults: Tgboolean; start_offset: Pgint; end_offset: Pgint;
  error: PPGError): PGHashTable; cdecl; external libatspi;

function atspi_text_get_attribute_value(obj: PAtspiText; offset: Tgint; attribute_name: Pgchar; error: PPGError): Pgchar; cdecl; external libatspi; deprecated;

function atspi_text_get_text_attribute_value(obj: PAtspiText; offset: Tgint; attribute_name: Pgchar; error: PPGError): Pgchar; cdecl; external libatspi;
function atspi_text_get_default_attributes(obj: PAtspiText; error: PPGError): PGHashTable; cdecl; external libatspi;
function atspi_text_set_caret_offset(obj: PAtspiText; new_offset: Tgint; error: PPGError): Tgboolean; cdecl; external libatspi;

function atspi_text_get_text_before_offset(obj: PAtspiText; offset: Tgint; _type: TAtspiTextBoundaryType; error: PPGError): PAtspiTextRange; cdecl; external libatspi; deprecated;
function atspi_text_get_text_at_offset(obj: PAtspiText; offset: Tgint; _type: TAtspiTextBoundaryType; error: PPGError): PAtspiTextRange; cdecl; external libatspi; deprecated;
function atspi_text_get_text_after_offset(obj: PAtspiText; offset: Tgint; _type: TAtspiTextBoundaryType; error: PPGError): PAtspiTextRange; cdecl; external libatspi; deprecated;

function atspi_text_get_string_at_offset(obj: PAtspiText; offset: Tgint; granularity: TAtspiTextGranularity; error: PPGError): PAtspiTextRange; cdecl; external libatspi;
function atspi_text_get_character_at_offset(obj: PAtspiText; offset: Tgint; error: PPGError): Tguint; cdecl; external libatspi;
function atspi_text_get_character_extents(obj: PAtspiText; offset: Tgint; _type: TAtspiCoordType; error: PPGError): PAtspiRect; cdecl; external libatspi;
function atspi_text_get_offset_at_point(obj: PAtspiText; x: Tgint; y: Tgint; _type: TAtspiCoordType; error: PPGError): Tgint; cdecl; external libatspi;
function atspi_text_get_range_extents(obj: PAtspiText; start_offset: Tgint; end_offset: Tgint; _type: TAtspiCoordType; error: PPGError): PAtspiRect; cdecl; external libatspi;
function atspi_text_get_bounded_ranges(obj: PAtspiText; x: Tgint; y: Tgint; width: Tgint; height: Tgint;
  _type: TAtspiCoordType; clipTypeX: TAtspiTextClipType; clipTypeY: TAtspiTextClipType; error: PPGError): PGArray; cdecl; external libatspi;
function atspi_text_get_n_selections(obj: PAtspiText; error: PPGError): Tgint; cdecl; external libatspi;
function atspi_text_get_selection(obj: PAtspiText; selection_num: Tgint; error: PPGError): PAtspiRange; cdecl; external libatspi;
function atspi_text_add_selection(obj: PAtspiText; start_offset: Tgint; end_offset: Tgint; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_text_remove_selection(obj: PAtspiText; selection_num: Tgint; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_text_set_selection(obj: PAtspiText; selection_num: Tgint; start_offset: Tgint; end_offset: Tgint; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_text_scroll_substring_to(obj: PAtspiText; start_offset: Tgint; end_offset: Tgint; _type: TAtspiScrollType; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_text_scroll_substring_to_point(obj: PAtspiText; start_offset: Tgint; end_offset: Tgint; coords: TAtspiCoordType; x: Tgint;
  y: Tgint; error: PPGError): Tgboolean; cdecl; external libatspi;

function ATSPI_TYPE_RANGE: TGType;
function ATSPI_TYPE_TEXT_RANGE: TGType;

// === Konventiert am: 26-9-26 13:15:05 ===

function ATSPI_TYPE_TEXT: TGType;
function ATSPI_TEXT(obj: Pointer): PAtspiText;
function ATSPI_IS_TEXT(obj: Pointer): Tgboolean;
function ATSPI_TEXT_GET_IFACE(obj: Pointer): PAtspiText;

implementation

function ATSPI_TYPE_TEXT: TGType;
begin
  ATSPI_TYPE_TEXT := atspi_text_get_type;
end;

function ATSPI_TEXT(obj: Pointer): PAtspiText;
begin
  Result := PAtspiText(g_type_check_instance_cast(obj, ATSPI_TYPE_TEXT));
end;

function ATSPI_IS_TEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ATSPI_TYPE_TEXT);
end;

function ATSPI_TEXT_GET_IFACE(obj: Pointer): PAtspiText;
begin
  Result := g_type_interface_peek(obj, ATSPI_TYPE_TEXT);
end;


function ATSPI_TYPE_RANGE: TGType;
begin
  ATSPI_TYPE_RANGE := atspi_range_get_type;
end;

function ATSPI_TYPE_TEXT_RANGE: TGType;
begin
  ATSPI_TYPE_TEXT_RANGE := atspi_text_range_get_type;
end;


end.
