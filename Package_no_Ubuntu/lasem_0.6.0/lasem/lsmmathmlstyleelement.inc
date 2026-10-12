{$IFDEF read_interface}


type
  //TLsmMathmlStyleElement = record
  //  presentation_container: TLsmMathmlPresentationContainer;
  //  display_style: TLsmMathmlBooleanAttribute;
  //  script_level: TLsmMathmlScriptLevelAttribute;
  //  script_size_multiplier: TLsmMathmlDoubleAttribute;
  //  script_min_size: TLsmMathmlLengthAttribute;
  //  negative_very_very_thin_math_space: TLsmMathmlLengthAttribute;
  //  negative_very_thin_math_space: TLsmMathmlLengthAttribute;
  //  negative_thin_math_space: TLsmMathmlLengthAttribute;
  //  negative_medium_math_space: TLsmMathmlLengthAttribute;
  //  negative_thick_math_space: TLsmMathmlLengthAttribute;
  //  negative_very_thick_math_space: TLsmMathmlLengthAttribute;
  //  negative_very_very_thick_math_space: TLsmMathmlLengthAttribute;
  //  very_very_thin_math_space: TLsmMathmlLengthAttribute;
  //  very_thin_math_space: TLsmMathmlLengthAttribute;
  //  thin_math_space: TLsmMathmlLengthAttribute;
  //  medium_math_space: TLsmMathmlLengthAttribute;
  //  thick_math_space: TLsmMathmlLengthAttribute;
  //  very_thick_math_space: TLsmMathmlLengthAttribute;
  //  very_very_thick_math_space: TLsmMathmlLengthAttribute;
  //  font_weight: TLsmMathmlEnumAttribute;
  //  font_style: TLsmMathmlEnumAttribute;
  //  math_family: TLsmMathmlStringAttribute;
  //  math_variant: TLsmMathmlEnumAttribute;
  //  math_size: TLsmMathmlLengthAttribute;
  //  math_color: TLsmMathmlColorAttribute;
  //  math_background: TLsmMathmlColorAttribute;
  //  line_thickness: TLsmMathmlLengthAttribute;
  //end;
  PLsmMathmlStyleElement = type Pointer;

  //TLsmMathmlStyleElementClass = record
  //  parent_class: TLsmMathmlPresentationContainerClass;
  //end;
  PLsmMathmlStyleElementClass = type Pointer;

function lsm_mathml_style_element_get_type: TGType; cdecl; external liblasem;
function lsm_mathml_style_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:49:43 ===

function LSM_TYPE_MATHML_STYLE_ELEMENT: TGType;
function LSM_MATHML_STYLE_ELEMENT(obj: Pointer): PLsmMathmlStyleElement;
function LSM_MATHML_STYLE_ELEMENT_CLASS(klass: Pointer): PLsmMathmlStyleElementClass;
function LSM_IS_MATHML_STYLE_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_MATHML_STYLE_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_MATHML_STYLE_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlStyleElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_STYLE_ELEMENT: TGType;
begin
  LSM_TYPE_MATHML_STYLE_ELEMENT := lsm_mathml_style_element_get_type;
end;

function LSM_MATHML_STYLE_ELEMENT(obj: Pointer): PLsmMathmlStyleElement;
begin
  Result := PLsmMathmlStyleElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_STYLE_ELEMENT));
end;

function LSM_MATHML_STYLE_ELEMENT_CLASS(klass: Pointer): PLsmMathmlStyleElementClass;
begin
  Result := PLsmMathmlStyleElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_STYLE_ELEMENT));
end;

function LSM_IS_MATHML_STYLE_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_MATHML_STYLE_ELEMENT);
end;

function LSM_IS_MATHML_STYLE_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_MATHML_STYLE_ELEMENT);
end;

function LSM_MATHML_STYLE_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlStyleElementClass;
begin
  Result := PLsmMathmlStyleElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
