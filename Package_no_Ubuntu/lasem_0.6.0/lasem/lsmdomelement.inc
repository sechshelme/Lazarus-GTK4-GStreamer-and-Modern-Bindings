{$IFDEF read_interface}


type
  TLsmDomElementClass = record
    parent_class: TLsmDomNodeClass;
    get_attribute: function(self: PLsmDomElement; name: pchar): pchar; cdecl;
    set_attribute: procedure(self: PLsmDomElement; name: pchar; attribute_value: pchar); cdecl;
    get_serialized_attributes: function(self: PLsmDomElement): pchar; cdecl;
  end;
  PLsmDomElementClass = ^TLsmDomElementClass;

function lsm_dom_element_get_type: TGType; cdecl; external liblasem;
function lsm_dom_element_get_tag_name(self: PLsmDomElement): pchar; cdecl; external liblasem;
function lsm_dom_element_get_attribute(self: PLsmDomElement; name: pchar): pchar; cdecl; external liblasem;
procedure lsm_dom_element_set_attribute(self: PLsmDomElement; name: pchar; attribute_value: pchar); cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:12:05 ===

function LSM_TYPE_DOM_ELEMENT: TGType;
function LSM_DOM_ELEMENT(obj: Pointer): PLsmDomElement;
function LSM_DOM_ELEMENT_CLASS(klass: Pointer): PLsmDomElementClass;
function LSM_IS_DOM_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_DOM_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_DOM_ELEMENT_GET_CLASS(obj: Pointer): PLsmDomElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_DOM_ELEMENT: TGType;
begin
  LSM_TYPE_DOM_ELEMENT := lsm_dom_element_get_type;
end;

function LSM_DOM_ELEMENT(obj: Pointer): PLsmDomElement;
begin
  Result := PLsmDomElement(g_type_check_instance_cast(obj, LSM_TYPE_DOM_ELEMENT));
end;

function LSM_DOM_ELEMENT_CLASS(klass: Pointer): PLsmDomElementClass;
begin
  Result := PLsmDomElementClass(g_type_check_class_cast(klass, LSM_TYPE_DOM_ELEMENT));
end;

function LSM_IS_DOM_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_DOM_ELEMENT);
end;

function LSM_IS_DOM_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_DOM_ELEMENT);
end;

function LSM_DOM_ELEMENT_GET_CLASS(obj: Pointer): PLsmDomElementClass;
begin
  Result := PLsmDomElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
