

  {$IFDEF read_struct}
type
  PAtspiMatchRule = ^TAtspiMatchRule;
  TAtspiMatchRule = record
    parent: TGObject;
    states: PAtspiStateSet;
    statematchtype: TAtspiCollectionMatchType;
    attributes: PGHashTable;
    attributematchtype: TAtspiCollectionMatchType;
    interfaces: PGArray;
    interfacematchtype: TAtspiCollectionMatchType;
    roles: array[0..3] of Tgint;
    rolematchtype: TAtspiCollectionMatchType;
    invert: Tgboolean;
  end;

  PAtspiMatchRuleClass = ^TAtspiMatchRuleClass;
  TAtspiMatchRuleClass = record
    parent_class: TGObjectClass;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function atspi_match_rule_get_type: TGType; cdecl; external libatspi;
function atspi_match_rule_new(states: PAtspiStateSet; statematchtype: TAtspiCollectionMatchType; attributes: PGHashTable; attributematchtype: TAtspiCollectionMatchType; roles: PGArray;
  rolematchtype: TAtspiCollectionMatchType; interfaces: PGArray; interfacematchtype: TAtspiCollectionMatchType; invert: Tgboolean): PAtspiMatchRule; cdecl; external libatspi;

// === Konventiert am: 26-9-26 13:04:57 ===

function ATSPI_TYPE_MATCH_RULE: TGType;
function ATSPI_MATCH_RULE(obj: Pointer): PAtspiMatchRule;
function ATSPI_MATCH_RULE_CLASS(klass: Pointer): PAtspiMatchRuleClass;
function ATSPI_IS_MATCH_RULE(obj: Pointer): Tgboolean;
function ATSPI_IS_MATCH_RULE_CLASS(klass: Pointer): Tgboolean;
function ATSPI_MATCH_RULE_GET_CLASS(obj: Pointer): PAtspiMatchRuleClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function ATSPI_TYPE_MATCH_RULE: TGType;
begin
  ATSPI_TYPE_MATCH_RULE := atspi_match_rule_get_type;
end;

function ATSPI_MATCH_RULE(obj: Pointer): PAtspiMatchRule;
begin
  Result := PAtspiMatchRule(g_type_check_instance_cast(obj, ATSPI_TYPE_MATCH_RULE));
end;

function ATSPI_MATCH_RULE_CLASS(klass: Pointer): PAtspiMatchRuleClass;
begin
  Result := PAtspiMatchRuleClass(g_type_check_class_cast(klass, ATSPI_TYPE_MATCH_RULE));
end;

function ATSPI_IS_MATCH_RULE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ATSPI_TYPE_MATCH_RULE);
end;

function ATSPI_IS_MATCH_RULE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ATSPI_TYPE_MATCH_RULE);
end;

function ATSPI_MATCH_RULE_GET_CLASS(obj: Pointer): PAtspiMatchRuleClass;
begin
  Result := PAtspiMatchRuleClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
