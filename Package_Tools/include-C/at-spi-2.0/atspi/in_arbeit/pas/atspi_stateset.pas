unit atspi_stateset;

interface

uses
  fp_glib2, fp_atspi, atspi_constants;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAtspiStateSet = ^TAtspiStateSet;
  TAtspiStateSet = record
    parent: TGObject;
    accessible: PAtspiAccessible;
    states: Tgint64;
  end;

  PAtspiStateSetClass = ^TAtspiStateSetClass;
  TAtspiStateSetClass = record
    parent_class: TGObjectClass;
  end;

function atspi_state_set_get_type: TGType; cdecl; external libatspi;
function atspi_state_set_new(states: PGArray): PAtspiStateSet; cdecl; external libatspi;
procedure atspi_state_set_set_by_name(set_: PAtspiStateSet; name: Pgchar; enabled: Tgboolean); cdecl; external libatspi;
procedure atspi_state_set_add(set_: PAtspiStateSet; state: TAtspiStateType); cdecl; external libatspi;
function atspi_state_set_compare(set_: PAtspiStateSet; set2: PAtspiStateSet): PAtspiStateSet; cdecl; external libatspi;
function atspi_state_set_contains(set_: PAtspiStateSet; state: TAtspiStateType): Tgboolean; cdecl; external libatspi;
function atspi_state_set_equals(set_: PAtspiStateSet; set2: PAtspiStateSet): Tgboolean; cdecl; external libatspi;
function atspi_state_set_get_states(set_: PAtspiStateSet): PGArray; cdecl; external libatspi;
function atspi_state_set_is_empty(set_: PAtspiStateSet): Tgboolean; cdecl; external libatspi;
procedure atspi_state_set_remove(set_: PAtspiStateSet; state: TAtspiStateType); cdecl; external libatspi;
function _atspi_state_set_new_internal(accessible: PAtspiAccessible; states: Tgint64): PAtspiStateSet; cdecl; external libatspi;

// === Konventiert am: 26-9-26 13:15:23 ===

function ATSPI_TYPE_STATE_SET: TGType;
function ATSPI_STATE_SET(obj: Pointer): PAtspiStateSet;
function ATSPI_STATE_SET_CLASS(klass: Pointer): PAtspiStateSetClass;
function ATSPI_IS_STATE_SET(obj: Pointer): Tgboolean;
function ATSPI_IS_STATE_SET_CLASS(klass: Pointer): Tgboolean;
function ATSPI_STATE_SET_GET_CLASS(obj: Pointer): PAtspiStateSetClass;

implementation

function ATSPI_TYPE_STATE_SET: TGType;
begin
  ATSPI_TYPE_STATE_SET := atspi_state_set_get_type;
end;

function ATSPI_STATE_SET(obj: Pointer): PAtspiStateSet;
begin
  Result := PAtspiStateSet(g_type_check_instance_cast(obj, ATSPI_TYPE_STATE_SET));
end;

function ATSPI_STATE_SET_CLASS(klass: Pointer): PAtspiStateSetClass;
begin
  Result := PAtspiStateSetClass(g_type_check_class_cast(klass, ATSPI_TYPE_STATE_SET));
end;

function ATSPI_IS_STATE_SET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ATSPI_TYPE_STATE_SET);
end;

function ATSPI_IS_STATE_SET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ATSPI_TYPE_STATE_SET);
end;

function ATSPI_STATE_SET_GET_CLASS(obj: Pointer): PAtspiStateSetClass;
begin
  Result := PAtspiStateSetClass(PGTypeInstance(obj)^.g_class);
end;



end.
