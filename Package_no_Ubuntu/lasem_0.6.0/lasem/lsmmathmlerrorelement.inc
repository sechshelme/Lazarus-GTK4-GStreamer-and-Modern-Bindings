{$IFDEF read_interface}


type
  //  TLsmMathmlErrorElement = record
  //    presentation_container: TLsmMathmlPresentationContainer;
  //  end;
  PLsmMathmlErrorElement = type Pointer;

  //  TLsmMathmlErrorElementClass = record
  //    parent_class: TLsmMathmlPresentationContainerClass;
  //  end;
  PLsmMathmlErrorElementClass = type Pointer;

function lsm_mathml_error_element_get_type: TGType; cdecl; external liblasem;
function lsm_mathml_error_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:45:11 ===

function LSM_TYPE_MATHML_ERROR_ELEMENT: TGType;
function LSM_MATHML_ERROR_ELEMENT(obj: Pointer): PLsmMathmlErrorElement;
function LSM_MATHML_ERROR_ELEMENT_CLASS(klass: Pointer): PLsmMathmlErrorElementClass;
function LSM_IS_MATHML_ERROR_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_MATHML_ERROR_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_MATHML_ERROR_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlErrorElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_ERROR_ELEMENT: TGType;
begin
  LSM_TYPE_MATHML_ERROR_ELEMENT := lsm_mathml_error_element_get_type;
end;

function LSM_MATHML_ERROR_ELEMENT(obj: Pointer): PLsmMathmlErrorElement;
begin
  Result := PLsmMathmlErrorElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_ERROR_ELEMENT));
end;

function LSM_MATHML_ERROR_ELEMENT_CLASS(klass: Pointer): PLsmMathmlErrorElementClass;
begin
  Result := PLsmMathmlErrorElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_ERROR_ELEMENT));
end;

function LSM_IS_MATHML_ERROR_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_MATHML_ERROR_ELEMENT);
end;

function LSM_IS_MATHML_ERROR_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_MATHML_ERROR_ELEMENT);
end;

function LSM_MATHML_ERROR_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlErrorElementClass;
begin
  Result := PLsmMathmlErrorElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
