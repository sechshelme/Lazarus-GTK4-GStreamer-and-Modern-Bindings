{$IFDEF read_interface}


type
  TLsmMathmlPhantomElement = record
    element: TLsmMathmlElement;
  end;
  PLsmMathmlPhantomElement = ^TLsmMathmlPhantomElement;

  TLsmMathmlPhantomElementClass = record
    parent_class: TLsmMathmlElementClass;
  end;
  PLsmMathmlPhantomElementClass = ^TLsmMathmlPhantomElementClass;

function lsm_mathml_phantom_element_get_type: TGType; cdecl; external liblasem;
function lsm_mathml_phantom_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:46:05 ===

function LSM_TYPE_MATHML_PHANTOM_ELEMENT: TGType;
function LSM_MATHML_PHANTOM_ELEMENT(obj: Pointer): PLsmMathmlPhantomElement;
function LSM_MATHML_PHANTOM_ELEMENT_CLASS(klass: Pointer): PLsmMathmlPhantomElementClass;
function LSM_IS_MATHML_PHANTOM_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_MATHML_PHANTOM_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_MATHML_PHANTOM_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlPhantomElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_PHANTOM_ELEMENT: TGType;
begin
  LSM_TYPE_MATHML_PHANTOM_ELEMENT := lsm_mathml_phantom_element_get_type;
end;

function LSM_MATHML_PHANTOM_ELEMENT(obj: Pointer): PLsmMathmlPhantomElement;
begin
  Result := PLsmMathmlPhantomElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_PHANTOM_ELEMENT));
end;

function LSM_MATHML_PHANTOM_ELEMENT_CLASS(klass: Pointer): PLsmMathmlPhantomElementClass;
begin
  Result := PLsmMathmlPhantomElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_PHANTOM_ELEMENT));
end;

function LSM_IS_MATHML_PHANTOM_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_MATHML_PHANTOM_ELEMENT);
end;

function LSM_IS_MATHML_PHANTOM_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_MATHML_PHANTOM_ELEMENT);
end;

function LSM_MATHML_PHANTOM_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlPhantomElementClass;
begin
  Result := PLsmMathmlPhantomElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
