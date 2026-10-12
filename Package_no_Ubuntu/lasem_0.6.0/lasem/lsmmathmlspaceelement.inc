{$IFDEF read_interface}

type
  TLsmMathmlSpaceElement = record
    element: TLsmMathmlElement;
    width: TLsmMathmlSpaceAttribute;
    height: TLsmMathmlLengthAttribute;
    depth: TLsmMathmlLengthAttribute;
    linebreak: TLsmMathmlEnumAttribute;
  end;
  PLsmMathmlSpaceElement = ^TLsmMathmlSpaceElement;

  TLsmMathmlSpaceElementClass = record
    parent_class: TLsmMathmlElementClass;
  end;
  PLsmMathmlSpaceElementClass = ^TLsmMathmlSpaceElementClass;

function lsm_mathml_space_element_get_type: TGType; cdecl; external liblasem;
function lsm_mathml_space_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:49:29 ===

function LSM_TYPE_MATHML_SPACE_ELEMENT: TGType;
function LSM_MATHML_SPACE_ELEMENT(obj: Pointer): PLsmMathmlSpaceElement;
function LSM_MATHML_SPACE_ELEMENT_CLASS(klass: Pointer): PLsmMathmlSpaceElementClass;
function LSM_IS_MATHML_SPACE_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_MATHML_SPACE_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_MATHML_SPACE_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlSpaceElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_SPACE_ELEMENT: TGType;
begin
  LSM_TYPE_MATHML_SPACE_ELEMENT := lsm_mathml_space_element_get_type;
end;

function LSM_MATHML_SPACE_ELEMENT(obj: Pointer): PLsmMathmlSpaceElement;
begin
  Result := PLsmMathmlSpaceElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_SPACE_ELEMENT));
end;

function LSM_MATHML_SPACE_ELEMENT_CLASS(klass: Pointer): PLsmMathmlSpaceElementClass;
begin
  Result := PLsmMathmlSpaceElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_SPACE_ELEMENT));
end;

function LSM_IS_MATHML_SPACE_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_MATHML_SPACE_ELEMENT);
end;

function LSM_IS_MATHML_SPACE_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_MATHML_SPACE_ELEMENT);
end;

function LSM_MATHML_SPACE_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlSpaceElementClass;
begin
  Result := PLsmMathmlSpaceElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
