unit atspi_collection;

interface

uses
  fp_glib2, fp_atspi, atspi_constants, atspi_matchrule;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function atspi_collection_get_type: TGType; cdecl; external libatspi;

type
  PAtspiCollection = ^TAtspiCollection;
  TAtspiCollection = record
    parent: TGTypeInterface;
  end;

function atspi_collection_is_ancestor_of(collection: PAtspiCollection; test: PAtspiAccessible; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_collection_get_matches(collection: PAtspiCollection; rule: PAtspiMatchRule; sortby: TAtspiCollectionSortOrder; count: Tgint; traverse: Tgboolean;
  error: PPGError): PGArray; cdecl; external libatspi;
function atspi_collection_get_matches_to(collection: PAtspiCollection; current_object: PAtspiAccessible; rule: PAtspiMatchRule; sortby: TAtspiCollectionSortOrder; tree: TAtspiCollectionTreeTraversalType;
  limit_scope: Tgboolean; count: Tgint; traverse: Tgboolean; error: PPGError): PGArray; cdecl; external libatspi;
function atspi_collection_get_matches_from(collection: PAtspiCollection; current_object: PAtspiAccessible; rule: PAtspiMatchRule; sortby: TAtspiCollectionSortOrder; tree: TAtspiCollectionTreeTraversalType;
  count: Tgint; traverse: Tgboolean; error: PPGError): PGArray; cdecl; external libatspi;
function atspi_collection_get_active_descendant(collection: PAtspiCollection; error: PPGError): PAtspiAccessible; cdecl; external libatspi;

// === Konventiert am: 26-9-26 12:56:37 ===

function ATSPI_TYPE_COLLECTION: TGType;
function ATSPI_COLLECTION(obj: Pointer): PAtspiCollection;
function ATSPI_IS_COLLECTION(obj: Pointer): Tgboolean;
function ATSPI_COLLECTION_GET_IFACE(obj: Pointer): PAtspiCollection;

implementation

function ATSPI_TYPE_COLLECTION: TGType;
begin
  ATSPI_TYPE_COLLECTION := atspi_collection_get_type;
end;

function ATSPI_COLLECTION(obj: Pointer): PAtspiCollection;
begin
  Result := PAtspiCollection(g_type_check_instance_cast(obj, ATSPI_TYPE_COLLECTION));
end;

function ATSPI_IS_COLLECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ATSPI_TYPE_COLLECTION);
end;

function ATSPI_COLLECTION_GET_IFACE(obj: Pointer): PAtspiCollection;
begin
  Result := g_type_interface_peek(obj, ATSPI_TYPE_COLLECTION);
end;

end.
