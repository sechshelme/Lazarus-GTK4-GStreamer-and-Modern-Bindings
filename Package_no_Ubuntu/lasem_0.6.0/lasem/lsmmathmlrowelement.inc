{$IFDEF read_interface}


type
  //  TLsmMathmlRowElement = record
  //      presentation_container : TLsmMathmlPresentationContainer;
  //    end;
  PLsmMathmlRowElement = type Pointer;

  //  TLsmMathmlRowElementClass = record
  //      parent_class : TLsmMathmlPresentationContainerClass;
  //    end;
  PLsmMathmlRowElementClass = type Pointer;

function lsm_mathml_row_element_get_type: TGType; cdecl; external liblasem;
function lsm_mathml_row_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:49:19 ===

function LSM_TYPE_MATHML_ROW_ELEMENT: TGType;
function LSM_MATHML_ROW_ELEMENT(obj: Pointer): PLsmMathmlRowElement;
function LSM_MATHML_ROW_ELEMENT_CLASS(klass: Pointer): PLsmMathmlRowElementClass;
function LSM_IS_MATHML_ROW_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_MATHML_ROW_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_MATHML_ROW_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlRowElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_ROW_ELEMENT: TGType;
begin
  LSM_TYPE_MATHML_ROW_ELEMENT := lsm_mathml_row_element_get_type;
end;

function LSM_MATHML_ROW_ELEMENT(obj: Pointer): PLsmMathmlRowElement;
begin
  Result := PLsmMathmlRowElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_ROW_ELEMENT));
end;

function LSM_MATHML_ROW_ELEMENT_CLASS(klass: Pointer): PLsmMathmlRowElementClass;
begin
  Result := PLsmMathmlRowElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_ROW_ELEMENT));
end;

function LSM_IS_MATHML_ROW_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_MATHML_ROW_ELEMENT);
end;

function LSM_IS_MATHML_ROW_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_MATHML_ROW_ELEMENT);
end;

function LSM_MATHML_ROW_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlRowElementClass;
begin
  Result := PLsmMathmlRowElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
