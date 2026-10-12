{$IFDEF read_interface}


type
//  TLsmMathmlActionElement = record
//    presentation_container: TLsmMathmlPresentationContainer;
//  end;
  PLsmMathmlActionElement = type Pointer;

//  TLsmMathmlActionElementClass = record
//    parent_class: TLsmMathmlPresentationContainerClass;
//  end;
  PLsmMathmlActionElementClass = type Pointer;

function lsm_mathml_action_element_get_type: TGType; cdecl; external liblasem;
function lsm_mathml_action_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:39:15 ===

function LSM_TYPE_MATHML_ACTION_ELEMENT: TGType;
function LSM_MATHML_ACTION_ELEMENT(obj: Pointer): PLsmMathmlActionElement;
function LSM_MATHML_ACTION_ELEMENT_CLASS(klass: Pointer): PLsmMathmlActionElementClass;
function LSM_IS_MATHML_ACTION_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_MATHML_ACTION_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_MATHML_ACTION_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlActionElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_ACTION_ELEMENT: TGType;
begin
  LSM_TYPE_MATHML_ACTION_ELEMENT := lsm_mathml_action_element_get_type;
end;

function LSM_MATHML_ACTION_ELEMENT(obj: Pointer): PLsmMathmlActionElement;
begin
  Result := PLsmMathmlActionElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_ACTION_ELEMENT));
end;

function LSM_MATHML_ACTION_ELEMENT_CLASS(klass: Pointer): PLsmMathmlActionElementClass;
begin
  Result := PLsmMathmlActionElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_ACTION_ELEMENT));
end;

function LSM_IS_MATHML_ACTION_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_MATHML_ACTION_ELEMENT);
end;

function LSM_IS_MATHML_ACTION_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_MATHML_ACTION_ELEMENT);
end;

function LSM_MATHML_ACTION_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlActionElementClass;
begin
  Result := PLsmMathmlActionElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
