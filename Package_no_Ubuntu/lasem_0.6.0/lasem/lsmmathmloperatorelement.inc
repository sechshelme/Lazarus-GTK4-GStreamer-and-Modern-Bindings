{$IFDEF read_interface}


type
  //TLsmMathmlOperatorElement = record
  //  presentation_token: TLsmMathmlPresentationToken;
  //  form: TLsmMathmlEnumAttribute;
  //  fence: TLsmMathmlBooleanAttribute;
  //  separator: TLsmMathmlBooleanAttribute;
  //  left_space: TLsmMathmlSpaceAttribute;
  //  right_space: TLsmMathmlSpaceAttribute;
  //  stretchy: TLsmMathmlBooleanAttribute;
  //  symmetric: TLsmMathmlBooleanAttribute;
  //  max_size: TLsmMathmlSpaceAttribute;
  //  min_size: TLsmMathmlSpaceAttribute;
  //  large_op: TLsmMathmlBooleanAttribute;
  //  movable_limits: TLsmMathmlBooleanAttribute;
  //  accent: TLsmMathmlBooleanAttribute;
  //  is_large_op: Tgboolean;
  //end;
  PLsmMathmlOperatorElement = type Pointer;

//  TLsmMathmlOperatorElementClass = record
//    parent_class: TLsmMathmlPresentationTokenClass;
//  end;
  PLsmMathmlOperatorElementClass = type Pointer;

function lsm_mathml_operator_element_get_type: TGType; cdecl; external liblasem;
function lsm_mathml_operator_element_new: PLsmDomNode; cdecl; external liblasem;
function lsm_mathml_operator_element_get_slant(operator_element: PLsmMathmlOperatorElement; view: PLsmMathmlView): double; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:45:59 ===

function LSM_TYPE_MATHML_OPERATOR_ELEMENT: TGType;
function LSM_MATHML_OPERATOR_ELEMENT(obj: Pointer): PLsmMathmlOperatorElement;
function LSM_MATHML_OPERATOR_ELEMENT_CLASS(klass: Pointer): PLsmMathmlOperatorElementClass;
function LSM_IS_MATHML_OPERATOR_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_MATHML_OPERATOR_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_MATHML_OPERATOR_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlOperatorElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_OPERATOR_ELEMENT: TGType;
begin
  LSM_TYPE_MATHML_OPERATOR_ELEMENT := lsm_mathml_operator_element_get_type;
end;

function LSM_MATHML_OPERATOR_ELEMENT(obj: Pointer): PLsmMathmlOperatorElement;
begin
  Result := PLsmMathmlOperatorElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_OPERATOR_ELEMENT));
end;

function LSM_MATHML_OPERATOR_ELEMENT_CLASS(klass: Pointer): PLsmMathmlOperatorElementClass;
begin
  Result := PLsmMathmlOperatorElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_OPERATOR_ELEMENT));
end;

function LSM_IS_MATHML_OPERATOR_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_MATHML_OPERATOR_ELEMENT);
end;

function LSM_IS_MATHML_OPERATOR_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_MATHML_OPERATOR_ELEMENT);
end;

function LSM_MATHML_OPERATOR_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlOperatorElementClass;
begin
  Result := PLsmMathmlOperatorElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
