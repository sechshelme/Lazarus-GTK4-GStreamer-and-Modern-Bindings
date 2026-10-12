{$IFDEF read_interface}


type
  TLsmMathmlSemanticsElement = record
    element: TLsmMathmlElement;
  end;
  PLsmMathmlSemanticsElement = ^TLsmMathmlSemanticsElement;

  TLsmMathmlSemanticsElementClass = record
    parent_class: TLsmMathmlElementClass;
  end;
  PLsmMathmlSemanticsElementClass = ^TLsmMathmlSemanticsElementClass;

function lsm_mathml_semantics_element_get_type: TGType; cdecl; external liblasem;
function lsm_mathml_semantics_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:49:26 ===

function LSM_TYPE_MATHML_SEMANTICS_ELEMENT: TGType;
function LSM_MATHML_SEMANTICS_ELEMENT(obj: Pointer): PLsmMathmlSemanticsElement;
function LSM_MATHML_SEMANTICS_ELEMENT_CLASS(klass: Pointer): PLsmMathmlSemanticsElementClass;
function LSM_IS_MATHML_SEMANTICS_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_MATHML_SEMANTICS_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_MATHML_SEMANTICS_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlSemanticsElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_SEMANTICS_ELEMENT: TGType;
begin
  LSM_TYPE_MATHML_SEMANTICS_ELEMENT := lsm_mathml_semantics_element_get_type;
end;

function LSM_MATHML_SEMANTICS_ELEMENT(obj: Pointer): PLsmMathmlSemanticsElement;
begin
  Result := PLsmMathmlSemanticsElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_SEMANTICS_ELEMENT));
end;

function LSM_MATHML_SEMANTICS_ELEMENT_CLASS(klass: Pointer): PLsmMathmlSemanticsElementClass;
begin
  Result := PLsmMathmlSemanticsElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_SEMANTICS_ELEMENT));
end;

function LSM_IS_MATHML_SEMANTICS_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_MATHML_SEMANTICS_ELEMENT);
end;

function LSM_IS_MATHML_SEMANTICS_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_MATHML_SEMANTICS_ELEMENT);
end;

function LSM_MATHML_SEMANTICS_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlSemanticsElementClass;
begin
  Result := PLsmMathmlSemanticsElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
