{$IFDEF read_interface}


type
  PLsmMathmlRadicalElementType = ^TLsmMathmlRadicalElementType;
  TLsmMathmlRadicalElementType = longint;

const
  LSM_MATHML_RADICAL_ELEMENT_TYPE_SQRT = 0;
  LSM_MATHML_RADICAL_ELEMENT_TYPE_ROOT = 1;

type
  TLsmMathmlRadicalElement = record
    element: TLsmMathmlElement;
    _type: TLsmMathmlRadicalElementType;
    bbox: TLsmMathmlBbox;
    width: double;
    radical_x_offset: double;
    order_y_offset: double;
  end;
  PLsmMathmlRadicalElement = ^TLsmMathmlRadicalElement;

  TLsmMathmlRadicalElementClass = record
    parent_class: TLsmMathmlElementClass;
  end;
  PLsmMathmlRadicalElementClass = ^TLsmMathmlRadicalElementClass;

function lsm_mathml_radical_element_get_type: TGType; cdecl; external liblasem;
function lsm_mathml_root_element_new: PLsmDomNode; cdecl; external liblasem;
function lsm_mathml_sqrt_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:46:22 ===

function LSM_TYPE_MATHML_RADICAL_ELEMENT: TGType;
function LSM_MATHML_RADICAL_ELEMENT(obj: Pointer): PLsmMathmlRadicalElement;
function LSM_MATHML_RADICAL_ELEMENT_CLASS(klass: Pointer): PLsmMathmlRadicalElementClass;
function LSM_IS_MATHML_RADICAL_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_MATHML_RADICAL_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_MATHML_RADICAL_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlRadicalElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_RADICAL_ELEMENT: TGType;
begin
  LSM_TYPE_MATHML_RADICAL_ELEMENT := lsm_mathml_radical_element_get_type;
end;

function LSM_MATHML_RADICAL_ELEMENT(obj: Pointer): PLsmMathmlRadicalElement;
begin
  Result := PLsmMathmlRadicalElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_RADICAL_ELEMENT));
end;

function LSM_MATHML_RADICAL_ELEMENT_CLASS(klass: Pointer): PLsmMathmlRadicalElementClass;
begin
  Result := PLsmMathmlRadicalElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_RADICAL_ELEMENT));
end;

function LSM_IS_MATHML_RADICAL_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_MATHML_RADICAL_ELEMENT);
end;

function LSM_IS_MATHML_RADICAL_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_MATHML_RADICAL_ELEMENT);
end;

function LSM_MATHML_RADICAL_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlRadicalElementClass;
begin
  Result := PLsmMathmlRadicalElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
