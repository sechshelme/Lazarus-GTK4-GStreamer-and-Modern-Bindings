{$IFDEF read_interface}


type
  TLsmDomText = record
    character_data: TLsmDomCharacterData;
  end;
  PLsmDomText = ^TLsmDomText;

  TLsmDomTextClass = record
    parent_class: TLsmDomCharacterDataClass;
  end;
  PLsmDomTextClass = ^TLsmDomTextClass;

function lsm_dom_text_get_type: TGType; cdecl; external liblasem;
function lsm_dom_text_new(data: pchar): PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:38:07 ===

function LSM_TYPE_DOM_TEXT: TGType;
function LSM_DOM_TEXT(obj: Pointer): PLsmDomText;
function LSM_DOM_TEXT_CLASS(klass: Pointer): PLsmDomTextClass;
function LSM_IS_DOM_TEXT(obj: Pointer): Tgboolean;
function LSM_IS_DOM_TEXT_CLASS(klass: Pointer): Tgboolean;
function LSM_DOM_TEXT_GET_CLASS(obj: Pointer): PLsmDomTextClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_DOM_TEXT: TGType;
begin
  LSM_TYPE_DOM_TEXT := lsm_dom_text_get_type;
end;

function LSM_DOM_TEXT(obj: Pointer): PLsmDomText;
begin
  Result := PLsmDomText(g_type_check_instance_cast(obj, LSM_TYPE_DOM_TEXT));
end;

function LSM_DOM_TEXT_CLASS(klass: Pointer): PLsmDomTextClass;
begin
  Result := PLsmDomTextClass(g_type_check_class_cast(klass, LSM_TYPE_DOM_TEXT));
end;

function LSM_IS_DOM_TEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_DOM_TEXT);
end;

function LSM_IS_DOM_TEXT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_DOM_TEXT);
end;

function LSM_DOM_TEXT_GET_CLASS(obj: Pointer): PLsmDomTextClass;
begin
  Result := PLsmDomTextClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
