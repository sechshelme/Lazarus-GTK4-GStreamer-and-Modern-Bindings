unit atspi_relation;

interface

uses
  fp_glib2, fp_atspi, atspi_constants;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function atspi_relation_get_type: TGType; cdecl; external libatspi;

type
  PAtspiRelation = ^TAtspiRelation;
  TAtspiRelation = record
    parent: TGObject;
    relation_type: TAtspiRelationType;
    targets: PGArray;
  end;

  PAtspiRelationClass = ^TAtspiRelationClass;
  TAtspiRelationClass = record
    parent_class: TGObjectClass;
  end;

function atspi_relation_get_relation_type(obj: PAtspiRelation): TAtspiRelationType; cdecl; external libatspi;
function atspi_relation_get_n_targets(obj: PAtspiRelation): Tgint; cdecl; external libatspi;
function atspi_relation_get_target(obj: PAtspiRelation; i: Tgint): PAtspiAccessible; cdecl; external libatspi;
function _atspi_relation_new_from_iter(iter: PDBusMessageIter): PAtspiRelation; cdecl; external libatspi;

// === Konventiert am: 26-9-26 13:15:40 ===

function ATSPI_TYPE_RELATION: TGType;
function ATSPI_RELATION(obj: Pointer): PAtspiRelation;
function ATSPI_IS_RELATION(obj: Pointer): Tgboolean;
function ATSPI_RELATION_GET_IFACE(obj: Pointer): PAtspiRelation;

implementation

function ATSPI_TYPE_RELATION: TGType;
begin
  ATSPI_TYPE_RELATION := atspi_relation_get_type;
end;

function ATSPI_RELATION(obj: Pointer): PAtspiRelation;
begin
  Result := PAtspiRelation(g_type_check_instance_cast(obj, ATSPI_TYPE_RELATION));
end;

function ATSPI_IS_RELATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ATSPI_TYPE_RELATION);
end;

function ATSPI_RELATION_GET_IFACE(obj: Pointer): PAtspiRelation;
begin
  Result := g_type_interface_peek(obj, ATSPI_TYPE_RELATION);
end;



end.
