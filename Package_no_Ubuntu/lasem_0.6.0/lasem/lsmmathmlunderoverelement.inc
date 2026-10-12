{$IFDEF read_interface}


type
  PLsmMathmlUnderOverElementType = ^TLsmMathmlUnderOverElementType;
  TLsmMathmlUnderOverElementType = longint;

const
  LSM_MATHML_UNDER_OVER_ELEMENT_TYPE_UNDER = 0;
  LSM_MATHML_UNDER_OVER_ELEMENT_TYPE_OVER = 1;
  LSM_MATHML_UNDER_OVER_ELEMENT_TYPE_UNDER_OVER = 2;

type
  TLsmMathmlUnderOverElement = record
    element: TLsmMathmlElement;
    accent: TLsmMathmlBooleanAttribute;
    accent_under: TLsmMathmlBooleanAttribute;
    _type: TLsmMathmlUnderOverElementType;
    base: PLsmMathmlElement;
    underscript: PLsmMathmlElement;
    overscript: PLsmMathmlElement;
    display: TLsmMathmlDisplay;
    under_space: double;
    over_space: double;
    as_script: Tgboolean;
    underscript_offset: double;
    overscript_offset: double;
  end;
  PLsmMathmlUnderOverElement = ^TLsmMathmlUnderOverElement;

  TLsmMathmlUnderOverElementClass = record
    parent_class: TLsmMathmlElementClass;
  end;
  PLsmMathmlUnderOverElementClass = ^TLsmMathmlUnderOverElementClass;

function lsm_mathml_under_over_element_get_type: TGType; cdecl; external liblasem;
function lsm_mathml_under_element_new: PLsmDomNode; cdecl; external liblasem;
function lsm_mathml_over_element_new: PLsmDomNode; cdecl; external liblasem;
function lsm_mathml_under_over_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:53:38 ===

function LSM_TYPE_MATHML_UNDER_OVER_ELEMENT: TGType;
function LSM_MATHML_UNDER_OVER_ELEMENT(obj: Pointer): PLsmMathmlUnderOverElement;
function LSM_MATHML_UNDER_OVER_ELEMENT_CLASS(klass: Pointer): PLsmMathmlUnderOverElementClass;
function LSM_IS_MATHML_UNDER_OVER_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_MATHML_UNDER_OVER_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_MATHML_UNDER_OVER_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlUnderOverElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_UNDER_OVER_ELEMENT: TGType;
begin
  LSM_TYPE_MATHML_UNDER_OVER_ELEMENT := lsm_mathml_under_over_element_get_type;
end;

function LSM_MATHML_UNDER_OVER_ELEMENT(obj: Pointer): PLsmMathmlUnderOverElement;
begin
  Result := PLsmMathmlUnderOverElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_UNDER_OVER_ELEMENT));
end;

function LSM_MATHML_UNDER_OVER_ELEMENT_CLASS(klass: Pointer): PLsmMathmlUnderOverElementClass;
begin
  Result := PLsmMathmlUnderOverElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_UNDER_OVER_ELEMENT));
end;

function LSM_IS_MATHML_UNDER_OVER_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_MATHML_UNDER_OVER_ELEMENT);
end;

function LSM_IS_MATHML_UNDER_OVER_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_MATHML_UNDER_OVER_ELEMENT);
end;

function LSM_MATHML_UNDER_OVER_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlUnderOverElementClass;
begin
  Result := PLsmMathmlUnderOverElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
