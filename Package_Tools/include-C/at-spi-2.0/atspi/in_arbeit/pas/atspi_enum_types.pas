unit atspi_enum_types;

interface

uses
  fp_glib2, fp_atspi;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function ATSPI_TYPE_LOCALE_TYPE: TgType;
function atspi_locale_type_get_type: TGType; cdecl; external libatspi;

function ATSPI_TYPE_COORD_TYPE: TgType;
function atspi_coord_type_get_type: TGType; cdecl; external libatspi;

function ATSPI_TYPE_COLLECTION_SORT_ORDER: TgType;
function atspi_collection_sort_order_get_type: TGType; cdecl; external libatspi;

function ATSPI_TYPE_COLLECTION_MATCH_TYPE: TgType;
function atspi_collection_match_type_get_type: TGType; cdecl; external libatspi;

function ATSPI_TYPE_COLLECTION_TREE_TRAVERSAL_TYPE: TgType;
function atspi_collection_tree_traversal_type_get_type: TGType; cdecl; external libatspi;

function ATSPI_TYPE_COMPONENT_LAYER: TgType;
function atspi_component_layer_get_type: TGType; cdecl; external libatspi;

function ATSPI_TYPE_TEXT_BOUNDARY_TYPE: TgType;
function atspi_text_boundary_type_get_type: TGType; cdecl; external libatspi;

function ATSPI_TYPE_TEXT_GRANULARITY: TgType;
function atspi_text_granularity_get_type: TGType; cdecl; external libatspi;

function ATSPI_TYPE_TEXT_CLIP_TYPE: TgType;
function atspi_text_clip_type_get_type: TGType; cdecl; external libatspi;

function ATSPI_TYPE_STATE_TYPE: TgType;
function atspi_state_type_get_type: TGType; cdecl; external libatspi;

function ATSPI_TYPE_KEY_EVENT_TYPE: TgType;
function atspi_key_event_type_get_type: TGType; cdecl; external libatspi;

function ATSPI_TYPE_EVENT_TYPE: TgType;
function atspi_event_type_get_type: TGType; cdecl; external libatspi;

function ATSPI_TYPE_KEY_SYNTH_TYPE: TgType;
function atspi_key_synth_type_get_type: TGType; cdecl; external libatspi;

function ATSPI_TYPE_MODIFIER_TYPE: TgType;
function atspi_modifier_type_get_type: TGType; cdecl; external libatspi;

function ATSPI_TYPE_RELATION_TYPE: TgType;
function atspi_relation_type_get_type: TGType; cdecl; external libatspi;

function ATSPI_TYPE_ROLE: TgType;
function atspi_role_get_type: TGType; cdecl; external libatspi;

function ATSPI_TYPE_CACHE: TgType;
function atspi_cache_get_type: TGType; cdecl; external libatspi;

function ATSPI_TYPE_SCROLL_TYPE: TgType;
function atspi_scroll_type_get_type: TGType; cdecl; external libatspi;

function ATSPI_TYPE_LIVE: TgType;
function atspi_live_get_type: TGType; cdecl; external libatspi;

function ATSPI_TYPE_KEY_LISTENER_SYNC_TYPE: TgType;
function atspi_key_listener_sync_type_get_type: TGType; cdecl; external libatspi;

// === Konventiert am: 26-9-26 13:08:16 ===


implementation


function ATSPI_TYPE_LOCALE_TYPE: TgType;
begin
  ATSPI_TYPE_LOCALE_TYPE := atspi_locale_type_get_type;
end;

function ATSPI_TYPE_COORD_TYPE: TgType;
begin
  ATSPI_TYPE_COORD_TYPE := atspi_coord_type_get_type;
end;

function ATSPI_TYPE_COLLECTION_SORT_ORDER: TgType;
begin
  ATSPI_TYPE_COLLECTION_SORT_ORDER := atspi_collection_sort_order_get_type;
end;

function ATSPI_TYPE_COLLECTION_MATCH_TYPE: TgType;
begin
  ATSPI_TYPE_COLLECTION_MATCH_TYPE := atspi_collection_match_type_get_type;
end;

function ATSPI_TYPE_COLLECTION_TREE_TRAVERSAL_TYPE: TgType;
begin
  ATSPI_TYPE_COLLECTION_TREE_TRAVERSAL_TYPE := atspi_collection_tree_traversal_type_get_type;
end;

function ATSPI_TYPE_COMPONENT_LAYER: TgType;
begin
  ATSPI_TYPE_COMPONENT_LAYER := atspi_component_layer_get_type;
end;

function ATSPI_TYPE_TEXT_BOUNDARY_TYPE: TgType;
begin
  ATSPI_TYPE_TEXT_BOUNDARY_TYPE := atspi_text_boundary_type_get_type;
end;

function ATSPI_TYPE_TEXT_GRANULARITY: TgType;
begin
  ATSPI_TYPE_TEXT_GRANULARITY := atspi_text_granularity_get_type;
end;

function ATSPI_TYPE_TEXT_CLIP_TYPE: TgType;
begin
  ATSPI_TYPE_TEXT_CLIP_TYPE := atspi_text_clip_type_get_type;
end;

function ATSPI_TYPE_STATE_TYPE: TgType;
begin
  ATSPI_TYPE_STATE_TYPE := atspi_state_type_get_type;
end;

function ATSPI_TYPE_KEY_EVENT_TYPE: TgType;
begin
  ATSPI_TYPE_KEY_EVENT_TYPE := atspi_key_event_type_get_type;
end;

function ATSPI_TYPE_EVENT_TYPE: TgType;
begin
  ATSPI_TYPE_EVENT_TYPE := atspi_event_type_get_type;
end;

function ATSPI_TYPE_KEY_SYNTH_TYPE: TgType;
begin
  ATSPI_TYPE_KEY_SYNTH_TYPE := atspi_key_synth_type_get_type;
end;

function ATSPI_TYPE_MODIFIER_TYPE: TgType;
begin
  ATSPI_TYPE_MODIFIER_TYPE := atspi_modifier_type_get_type;
end;

function ATSPI_TYPE_RELATION_TYPE: TgType;
begin
  ATSPI_TYPE_RELATION_TYPE := atspi_relation_type_get_type;
end;

function ATSPI_TYPE_ROLE: TgType;
begin
  ATSPI_TYPE_ROLE := atspi_role_get_type;
end;

function ATSPI_TYPE_CACHE: TgType;
begin
  ATSPI_TYPE_CACHE := atspi_cache_get_type;
end;

function ATSPI_TYPE_SCROLL_TYPE: TgType;
begin
  ATSPI_TYPE_SCROLL_TYPE := atspi_scroll_type_get_type;
end;

function ATSPI_TYPE_LIVE: TgType;
begin
  ATSPI_TYPE_LIVE := atspi_live_get_type;
end;

function ATSPI_TYPE_KEY_LISTENER_SYNC_TYPE: TgType;
begin
  ATSPI_TYPE_KEY_LISTENER_SYNC_TYPE := atspi_key_listener_sync_type_get_type;
end;


end.
