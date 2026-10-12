{$IFDEF read_interface}


type
  TLsmDomCharacterData = record
    node: TLsmDomNode;
    data: pchar;
  end;
  PLsmDomCharacterData = ^TLsmDomCharacterData;

  TLsmDomCharacterDataClass = record
    parent_class: TLsmDomNodeClass;
  end;
  PLsmDomCharacterDataClass = ^TLsmDomCharacterDataClass;

function lsm_dom_character_data_get_type: TGType; cdecl; external liblasem;
function lsm_dom_character_data_get_data(self: PLsmDomCharacterData): pchar; cdecl; external liblasem;
procedure lsm_dom_character_data_set_data(self: PLsmDomCharacterData; value: pchar); cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:11:44 ===

function LSM_TYPE_DOM_CHARACTER_DATA: TGType;
function LSM_DOM_CHARACTER_DATA(obj: Pointer): PLsmDomCharacterData;
function LSM_DOM_CHARACTER_DATA_CLASS(klass: Pointer): PLsmDomNodeClass;
function LSM_IS_DOM_CHARACTER_DATA(obj: Pointer): Tgboolean;
function LSM_IS_DOM_CHARACTER_DATA_CLASS(klass: Pointer): Tgboolean;
function LSM_DOM_CHARACTER_DATA_GET_CLASS(obj: Pointer): PLsmDomNodeClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_DOM_CHARACTER_DATA: TGType;
begin
  LSM_TYPE_DOM_CHARACTER_DATA := lsm_dom_character_data_get_type;
end;

function LSM_DOM_CHARACTER_DATA(obj: Pointer): PLsmDomCharacterData;
begin
  Result := PLsmDomCharacterData(g_type_check_instance_cast(obj, LSM_TYPE_DOM_CHARACTER_DATA));
end;

function LSM_DOM_CHARACTER_DATA_CLASS(klass: Pointer): PLsmDomNodeClass;
begin
  Result := PLsmDomNodeClass(g_type_check_class_cast(klass, LSM_TYPE_DOM_CHARACTER_DATA));
end;

function LSM_IS_DOM_CHARACTER_DATA(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_DOM_CHARACTER_DATA);
end;

function LSM_IS_DOM_CHARACTER_DATA_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_DOM_CHARACTER_DATA);
end;

function LSM_DOM_CHARACTER_DATA_GET_CLASS(obj: Pointer): PLsmDomNodeClass;
begin
  Result := PLsmDomNodeClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
