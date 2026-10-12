{$IFDEF read_interface}


type
  //TLsmMathmlStringElement = record
  //  presentation_token: TLsmMathmlPresentationToken;
  //  left_quote: TLsmMathmlStringAttribute;
  //  right_quote: TLsmMathmlStringAttribute;
  //end;
  PLsmMathmlStringElement = type Pointer;

  //TLsmMathmlStringElementClass = record
  //  parent_class: TLsmMathmlPresentationTokenClass;
  //end;
  PLsmMathmlStringElementClass = type Pointer;

function lsm_mathml_string_element_get_type: TGType; cdecl; external liblasem;
function lsm_mathml_string_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:49:32 ===

function LSM_TYPE_MATHML_STRING_ELEMENT: TGType;
function LSM_MATHML_STRING_ELEMENT(obj: Pointer): PLsmMathmlStringElement;
function LSM_MATHML_STRING_ELEMENT_CLASS(klass: Pointer): PLsmMathmlStringElementClass;
function LSM_IS_MATHML_STRING_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_MATHML_STRING_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_MATHML_STRING_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlStringElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_STRING_ELEMENT: TGType;
begin
  LSM_TYPE_MATHML_STRING_ELEMENT := lsm_mathml_string_element_get_type;
end;

function LSM_MATHML_STRING_ELEMENT(obj: Pointer): PLsmMathmlStringElement;
begin
  Result := PLsmMathmlStringElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_STRING_ELEMENT));
end;

function LSM_MATHML_STRING_ELEMENT_CLASS(klass: Pointer): PLsmMathmlStringElementClass;
begin
  Result := PLsmMathmlStringElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_STRING_ELEMENT));
end;

function LSM_IS_MATHML_STRING_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_MATHML_STRING_ELEMENT);
end;

function LSM_IS_MATHML_STRING_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_MATHML_STRING_ELEMENT);
end;

function LSM_MATHML_STRING_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlStringElementClass;
begin
  Result := PLsmMathmlStringElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
