{$IFDEF read_interface}


const
  LSM_MATHML_FONT_SERIF = 'Serif';
  LSM_MATHML_FONT_SANS = 'Sans';
  LSM_MATHML_FONT_MONOSPACE = 'Monospace';
  LSM_MATHML_FONT_FRAKTUR = 'Serif';
  LSM_MATHML_FONT_SCRIPT = 'cmsy10';
  LSM_MATHML_FONT_DOUBLE_STRUCK = 'msbm10';

type
  TLsmMathmlView = record
    dom_view: TLsmDomView;
  end;
  PLsmMathmlView = ^TLsmMathmlView;

//  TLsmMathmlMathElement = record
    //element: TLsmMathmlElement;
    //default_style: PLsmMathmlStyle;
    //mode: TLsmMathmlEnumAttribute;
    //display: TLsmMathmlEnumAttribute;
//  end;
  PLsmMathmlMathElement = type Pointer;

//  TLsmMathmlMathElementClass = record
//    parent_class: TLsmMathmlElementClass;
//  end;
  PLsmMathmlMathElementClass = type Pointer;

function lsm_mathml_math_element_get_type: TGType; cdecl; external liblasem;
function lsm_mathml_math_element_new: PLsmDomNode; cdecl; external liblasem;
function lsm_mathml_math_element_get_default_style(math_element: PLsmMathmlMathElement): PLsmMathmlStyle; cdecl; external liblasem;
procedure lsm_mathml_math_element_set_default_style(math_element: PLsmMathmlMathElement; style: PLsmMathmlStyle); cdecl; external liblasem;
procedure lsm_mathml_math_element_update(math_element: PLsmMathmlMathElement); cdecl; external liblasem;
function lsm_mathml_math_element_measure(math_element: PLsmMathmlMathElement; view: PLsmMathmlView): PLsmMathmlBbox; cdecl; external liblasem;
procedure lsm_mathml_math_element_layout(math_element: PLsmMathmlMathElement; view: PLsmMathmlView; bbox: PLsmMathmlBbox); cdecl; external liblasem;
procedure lsm_mathml_math_element_render(math_element: PLsmMathmlMathElement; view: PLsmMathmlView); cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:45:45 ===

function LSM_TYPE_MATHML_MATH_ELEMENT: TGType;
function LSM_MATHML_MATH_ELEMENT(obj: Pointer): PLsmMathmlMathElement;
function LSM_MATHML_MATH_ELEMENT_CLASS(klass: Pointer): PLsmMathmlMathElementClass;
function LSM_IS_MATHML_MATH_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_MATHML_MATH_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_MATHML_MATH_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlMathElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_MATH_ELEMENT: TGType;
begin
  LSM_TYPE_MATHML_MATH_ELEMENT := lsm_mathml_math_element_get_type;
end;

function LSM_MATHML_MATH_ELEMENT(obj: Pointer): PLsmMathmlMathElement;
begin
  Result := PLsmMathmlMathElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_MATH_ELEMENT));
end;

function LSM_MATHML_MATH_ELEMENT_CLASS(klass: Pointer): PLsmMathmlMathElementClass;
begin
  Result := PLsmMathmlMathElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_MATH_ELEMENT));
end;

function LSM_IS_MATHML_MATH_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_MATHML_MATH_ELEMENT);
end;

function LSM_IS_MATHML_MATH_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_MATHML_MATH_ELEMENT);
end;

function LSM_MATHML_MATH_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlMathElementClass;
begin
  Result := PLsmMathmlMathElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
