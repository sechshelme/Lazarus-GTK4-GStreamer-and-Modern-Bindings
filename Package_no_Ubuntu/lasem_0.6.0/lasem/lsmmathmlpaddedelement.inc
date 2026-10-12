{$IFDEF read_interface}


type
  //TLsmMathmlPaddedElement = record
  //    presentation_container : TLsmMathmlPresentationContainer;
  //    height : TLsmMathmlLengthAttribute;
  //    depth : TLsmMathmlLengthAttribute;
  //    width : TLsmMathmlLengthAttribute;
  //    left_space : TLsmMathmlLengthAttribute;
  //  end;
  PLsmMathmlPaddedElement = type Pointer;

  //TLsmMathmlPaddedElementClass = record
  //    parent_class : TLsmMathmlPresentationContainerClass;
  //  end;
  PLsmMathmlPaddedElementClass = type Pointer;

function lsm_mathml_padded_element_get_type: TGType; cdecl; external liblasem;
function lsm_mathml_padded_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:46:02 ===

function LSM_TYPE_MATHML_PADDED_ELEMENT: TGType;
function LSM_MATHML_PADDED_ELEMENT(obj: Pointer): PLsmMathmlPaddedElement;
function LSM_MATHML_PADDED_ELEMENT_CLASS(klass: Pointer): PLsmMathmlPaddedElementClass;
function LSM_IS_MATHML_PADDED_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_MATHML_PADDED_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_MATHML_PADDED_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlPaddedElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_PADDED_ELEMENT: TGType;
begin
  LSM_TYPE_MATHML_PADDED_ELEMENT := lsm_mathml_padded_element_get_type;
end;

function LSM_MATHML_PADDED_ELEMENT(obj: Pointer): PLsmMathmlPaddedElement;
begin
  Result := PLsmMathmlPaddedElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_PADDED_ELEMENT));
end;

function LSM_MATHML_PADDED_ELEMENT_CLASS(klass: Pointer): PLsmMathmlPaddedElementClass;
begin
  Result := PLsmMathmlPaddedElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_PADDED_ELEMENT));
end;

function LSM_IS_MATHML_PADDED_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_MATHML_PADDED_ELEMENT);
end;

function LSM_IS_MATHML_PADDED_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_MATHML_PADDED_ELEMENT);
end;

function LSM_MATHML_PADDED_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlPaddedElementClass;
begin
  Result := PLsmMathmlPaddedElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
