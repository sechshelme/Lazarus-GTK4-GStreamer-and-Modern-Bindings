{$IFDEF read_interface}


type
  TLsmMathmlItexElement = record
    element: TLsmMathmlElement;
    itex: pchar;
    math: PLsmMathmlElement;
  end;
  PLsmMathmlItexElement = ^TLsmMathmlItexElement;

  TLsmMathmlItexElementClass = record
    parent_class: TLsmMathmlElementClass;
  end;
  PLsmMathmlItexElementClass = ^TLsmMathmlItexElementClass;

function lsm_mathml_itex_element_get_type: TGType; cdecl; external liblasem;
function lsm_mathml_itex_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:45:33 ===

function LSM_TYPE_MATHML_ITEX_ELEMENT: TGType;
function LSM_MATHML_ITEX_ELEMENT(obj: Pointer): PLsmMathmlItexElement;
function LSM_MATHML_ITEX_ELEMENT_CLASS(klass: Pointer): PLsmMathmlItexElementClass;
function LSM_IS_MATHML_ITEX_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_MATHML_ITEX_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_MATHML_ITEX_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlItexElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_ITEX_ELEMENT: TGType;
begin
  LSM_TYPE_MATHML_ITEX_ELEMENT := lsm_mathml_itex_element_get_type;
end;

function LSM_MATHML_ITEX_ELEMENT(obj: Pointer): PLsmMathmlItexElement;
begin
  Result := PLsmMathmlItexElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_ITEX_ELEMENT));
end;

function LSM_MATHML_ITEX_ELEMENT_CLASS(klass: Pointer): PLsmMathmlItexElementClass;
begin
  Result := PLsmMathmlItexElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_ITEX_ELEMENT));
end;

function LSM_IS_MATHML_ITEX_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_MATHML_ITEX_ELEMENT);
end;

function LSM_IS_MATHML_ITEX_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_MATHML_ITEX_ELEMENT);
end;

function LSM_MATHML_ITEX_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlItexElementClass;
begin
  Result := PLsmMathmlItexElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
