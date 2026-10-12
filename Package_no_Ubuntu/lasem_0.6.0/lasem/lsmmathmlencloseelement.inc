{$IFDEF read_interface}


type
  //TLsmMathmlEncloseElement = record
  //  presentation_container: TLsmMathmlPresentationContainer;
  //  notation: TLsmMathmlEnumAttribute;
  //  math_color: TLsmMathmlColorAttribute;
  //  math_background: TLsmMathmlColorAttribute;
  //  x_child_offset: Tdouble;
  //end;
  PLsmMathmlEncloseElement = type Pointer;

  //  TLsmMathmlEncloseElementClass = record
  //    parent_class: TLsmMathmlPresentationContainerClass;
  //  end;
  PLsmMathmlEncloseElementClass = type Pointer;

function lsm_mathml_enclose_element_get_type: TGType; cdecl; external liblasem;
function lsm_mathml_enclose_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:44:57 ===

function LSM_TYPE_MATHML_ENCLOSE_ELEMENT: TGType;
function LSM_MATHML_ENCLOSE_ELEMENT(obj: Pointer): PLsmMathmlEncloseElement;
function LSM_MATHML_ENCLOSE_ELEMENT_CLASS(klass: Pointer): PLsmMathmlEncloseElementClass;
function LSM_IS_MATHML_ENCLOSE_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_MATHML_ENCLOSE_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_MATHML_ENCLOSE_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlEncloseElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_ENCLOSE_ELEMENT: TGType;
begin
  LSM_TYPE_MATHML_ENCLOSE_ELEMENT := lsm_mathml_enclose_element_get_type;
end;

function LSM_MATHML_ENCLOSE_ELEMENT(obj: Pointer): PLsmMathmlEncloseElement;
begin
  Result := PLsmMathmlEncloseElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_ENCLOSE_ELEMENT));
end;

function LSM_MATHML_ENCLOSE_ELEMENT_CLASS(klass: Pointer): PLsmMathmlEncloseElementClass;
begin
  Result := PLsmMathmlEncloseElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_ENCLOSE_ELEMENT));
end;

function LSM_IS_MATHML_ENCLOSE_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_MATHML_ENCLOSE_ELEMENT);
end;

function LSM_IS_MATHML_ENCLOSE_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_MATHML_ENCLOSE_ELEMENT);
end;

function LSM_MATHML_ENCLOSE_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlEncloseElementClass;
begin
  Result := PLsmMathmlEncloseElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
