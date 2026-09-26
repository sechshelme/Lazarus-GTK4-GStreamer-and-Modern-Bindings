unit atspi_accessible;

interface

uses
  fp_glib2, fp_atspi;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAtspiAccessible = ^TAtspiAccessible;
  TAtspiAccessible = record
    parent: TAtspiObject;
    accessible_parent: PAtspiAccessible;
    children: PGPtrArray;
    role: TAtspiRole;
    interfaces: Tgint;
    name: pchar;
    description: pchar;
    states: PAtspiStateSet;
    attributes: PGHashTable;
    cached_properties: Tguint;
    priv: PAtspiAccessiblePrivate;
  end;

  PAtspiAccessibleClass = ^TAtspiAccessibleClass;
  TAtspiAccessibleClass = record
    parent_class: TAtspiObjectClass;
    region_changed: procedure(accessible: PAtspiAccessible; current_offset: Tgint; last_offset: Tgint); cdecl;
    mode_changed: procedure(accessible: PAtspiAccessible; enabled: Tgboolean); cdecl;
  end;

function atspi_accessible_get_type: TGType; cdecl; external libatspi;
function _atspi_accessible_new(app: PAtspiApplication; path: Pgchar): PAtspiAccessible; cdecl; external libatspi;
function atspi_accessible_get_name(obj: PAtspiAccessible; error: PPGError): Pgchar; cdecl; external libatspi;
function atspi_accessible_get_description(obj: PAtspiAccessible; error: PPGError): Pgchar; cdecl; external libatspi;
function atspi_accessible_get_parent(obj: PAtspiAccessible; error: PPGError): PAtspiAccessible; cdecl; external libatspi;
function atspi_accessible_get_child_count(obj: PAtspiAccessible; error: PPGError): Tgint; cdecl; external libatspi;
function atspi_accessible_get_child_at_index(obj: PAtspiAccessible; child_index: Tgint; error: PPGError): PAtspiAccessible; cdecl; external libatspi;
function atspi_accessible_get_index_in_parent(obj: PAtspiAccessible; error: PPGError): Tgint; cdecl; external libatspi;
function atspi_accessible_get_relation_set(obj: PAtspiAccessible; error: PPGError): PGArray; cdecl; external libatspi;
function atspi_accessible_get_role(obj: PAtspiAccessible; error: PPGError): TAtspiRole; cdecl; external libatspi;
function atspi_accessible_get_role_name(obj: PAtspiAccessible; error: PPGError): Pgchar; cdecl; external libatspi;
function atspi_accessible_get_localized_role_name(obj: PAtspiAccessible; error: PPGError): Pgchar; cdecl; external libatspi;
function atspi_accessible_get_state_set(obj: PAtspiAccessible): PAtspiStateSet; cdecl; external libatspi;
function atspi_accessible_get_attributes(obj: PAtspiAccessible; error: PPGError): PGHashTable; cdecl; external libatspi;
function atspi_accessible_get_attributes_as_array(obj: PAtspiAccessible; error: PPGError): PGArray; cdecl; external libatspi;
function atspi_accessible_get_toolkit_name(obj: PAtspiAccessible; error: PPGError): Pgchar; cdecl; external libatspi;
function atspi_accessible_get_toolkit_version(obj: PAtspiAccessible; error: PPGError): Pgchar; cdecl; external libatspi;
function atspi_accessible_get_atspi_version(obj: PAtspiAccessible; error: PPGError): Pgchar; cdecl; external libatspi;
function atspi_accessible_get_id(obj: PAtspiAccessible; error: PPGError): Tgint; cdecl; external libatspi;
function atspi_accessible_get_application(obj: PAtspiAccessible; error: PPGError): PAtspiAccessible; cdecl; external libatspi;

function atspi_accessible_get_action(obj: PAtspiAccessible): PAtspiAction; cdecl; external libatspi; deprecated;
function atspi_accessible_get_collection(obj: PAtspiAccessible): PAtspiCollection; cdecl; external libatspi; deprecated;
function atspi_accessible_get_component(obj: PAtspiAccessible): PAtspiComponent; cdecl; external libatspi; deprecated;
function atspi_accessible_get_document(obj: PAtspiAccessible): PAtspiDocument; cdecl; external libatspi; deprecated;
function atspi_accessible_get_editable_text(obj: PAtspiAccessible): PAtspiEditableText; cdecl; external libatspi; deprecated;
function atspi_accessible_get_hyperlink(obj: PAtspiAccessible): PAtspiHyperlink; cdecl; external libatspi; deprecated;
function atspi_accessible_get_hypertext(obj: PAtspiAccessible): PAtspiHypertext; cdecl; external libatspi; deprecated;
function atspi_accessible_get_image(obj: PAtspiAccessible): PAtspiImage; cdecl; external libatspi; deprecated;
function atspi_accessible_get_selection(obj: PAtspiAccessible): PAtspiSelection; cdecl; external libatspi; deprecated;
function atspi_accessible_get_table(obj: PAtspiAccessible): PAtspiTable; cdecl; external libatspi; deprecated;
function atspi_accessible_get_table_cell(obj: PAtspiAccessible): PAtspiTableCell; cdecl; external libatspi; deprecated;
function atspi_accessible_get_text(obj: PAtspiAccessible): PAtspiText; cdecl; external libatspi; deprecated;
function atspi_accessible_get_value(obj: PAtspiAccessible): PAtspiValue; cdecl; external libatspi; deprecated;

function atspi_accessible_get_action_iface(obj: PAtspiAccessible): PAtspiAction; cdecl; external libatspi;
function atspi_accessible_get_collection_iface(obj: PAtspiAccessible): PAtspiCollection; cdecl; external libatspi;
function atspi_accessible_get_component_iface(obj: PAtspiAccessible): PAtspiComponent; cdecl; external libatspi;
function atspi_accessible_get_document_iface(obj: PAtspiAccessible): PAtspiDocument; cdecl; external libatspi;
function atspi_accessible_get_editable_text_iface(obj: PAtspiAccessible): PAtspiEditableText; cdecl; external libatspi;
function atspi_accessible_get_hypertext_iface(obj: PAtspiAccessible): PAtspiHypertext; cdecl; external libatspi;
function atspi_accessible_get_image_iface(obj: PAtspiAccessible): PAtspiImage; cdecl; external libatspi;
function atspi_accessible_get_selection_iface(obj: PAtspiAccessible): PAtspiSelection; cdecl; external libatspi;
function atspi_accessible_get_table_iface(obj: PAtspiAccessible): PAtspiTable; cdecl; external libatspi;
function atspi_accessible_get_text_iface(obj: PAtspiAccessible): PAtspiText; cdecl; external libatspi;
function atspi_accessible_get_value_iface(obj: PAtspiAccessible): PAtspiValue; cdecl; external libatspi;
function atspi_accessible_get_interfaces(obj: PAtspiAccessible): PGArray; cdecl; external libatspi;
function atspi_accessible_get_object_locale(accessible: PAtspiAccessible; error: PPGError): Pgchar; cdecl; external libatspi;
procedure atspi_accessible_set_cache_mask(accessible: PAtspiAccessible; mask: TAtspiCache); cdecl; external libatspi;
procedure atspi_accessible_clear_cache(obj: PAtspiAccessible); cdecl; external libatspi;
procedure atspi_accessible_clear_cache_single(obj: PAtspiAccessible); cdecl; external libatspi;
function atspi_accessible_get_process_id(accessible: PAtspiAccessible; error: PPGError): Tguint; cdecl; external libatspi;
function atspi_accessible_get_accessible_id(obj: PAtspiAccessible; error: PPGError): Pgchar; cdecl; external libatspi;
function atspi_accessible_get_help_text(obj: PAtspiAccessible; error: PPGError): Pgchar; cdecl; external libatspi;

procedure _atspi_accessible_add_cache(accessible: PAtspiAccessible; flag: TAtspiCache); cdecl; external libatspi;
function _atspi_accessible_get_cache_mask(accessible: PAtspiAccessible): TAtspiCache; cdecl; external libatspi;
function _atspi_accessible_test_cache(accessible: PAtspiAccessible; flag: TAtspiCache): Tgboolean; cdecl; external libatspi;

// === Konventiert am: 26-9-26 12:59:13 ===

function ATSPI_TYPE_ACCESSIBLE: TGType;
function ATSPI_ACCESSIBLE(obj: Pointer): PAtspiAccessible;
function ATSPI_ACCESSIBLE_CLASS(klass: Pointer): PAtspiAccessibleClass;
function ATSPI_IS_ACCESSIBLE(obj: Pointer): Tgboolean;
function ATSPI_IS_ACCESSIBLE_CLASS(klass: Pointer): Tgboolean;
function ATSPI_ACCESSIBLE_GET_CLASS(obj: Pointer): PAtspiAccessibleClass;

implementation

function ATSPI_TYPE_ACCESSIBLE: TGType;
begin
  ATSPI_TYPE_ACCESSIBLE := atspi_accessible_get_type;
end;

function ATSPI_ACCESSIBLE(obj: Pointer): PAtspiAccessible;
begin
  Result := PAtspiAccessible(g_type_check_instance_cast(obj, ATSPI_TYPE_ACCESSIBLE));
end;

function ATSPI_ACCESSIBLE_CLASS(klass: Pointer): PAtspiAccessibleClass;
begin
  Result := PAtspiAccessibleClass(g_type_check_class_cast(klass, ATSPI_TYPE_ACCESSIBLE));
end;

function ATSPI_IS_ACCESSIBLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ATSPI_TYPE_ACCESSIBLE);
end;

function ATSPI_IS_ACCESSIBLE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ATSPI_TYPE_ACCESSIBLE);
end;

function ATSPI_ACCESSIBLE_GET_CLASS(obj: Pointer): PAtspiAccessibleClass;
begin
  Result := PAtspiAccessibleClass(PGTypeInstance(obj)^.g_class);
end;



end.
