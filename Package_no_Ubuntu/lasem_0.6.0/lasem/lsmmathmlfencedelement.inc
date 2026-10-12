{$IFDEF read_interface}


type
  //TLsmMathmlFencedElement = record
  //    presentation_container : TLsmMathmlPresentationContainer;
  //    open : TLsmMathmlStringAttribute;
  //    close : TLsmMathmlStringAttribute;
  //    separators : TLsmMathmlStringAttribute;
  //    open_bbox : TLsmMathmlBbox;
  //    close_bbox : TLsmMathmlBbox;
  //  end;
  PLsmMathmlFencedElement = type Pointer;

  //TLsmMathmlFencedElementClass = record
  //    parent_class : TLsmMathmlPresentationContainerClass;
  //  end;
  PLsmMathmlFencedElementClass = type Pointer;


function lsm_mathml_fenced_element_get_type: TGType; cdecl; external liblasem;
function lsm_mathml_fenced_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:45:15 ===

function LSM_TYPE_MATHML_FENCED_ELEMENT: TGType;
function LSM_MATHML_FENCED_ELEMENT(obj: Pointer): PLsmMathmlFencedElement;
function LSM_MATHML_FENCED_ELEMENT_CLASS(klass: Pointer): PLsmMathmlFencedElementClass;
function LSM_IS_MATHML_FENCED_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_MATHML_FENCED_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_MATHML_FENCED_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlFencedElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_FENCED_ELEMENT: TGType;
begin
  LSM_TYPE_MATHML_FENCED_ELEMENT := lsm_mathml_fenced_element_get_type;
end;

function LSM_MATHML_FENCED_ELEMENT(obj: Pointer): PLsmMathmlFencedElement;
begin
  Result := PLsmMathmlFencedElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_FENCED_ELEMENT));
end;

function LSM_MATHML_FENCED_ELEMENT_CLASS(klass: Pointer): PLsmMathmlFencedElementClass;
begin
  Result := PLsmMathmlFencedElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_FENCED_ELEMENT));
end;

function LSM_IS_MATHML_FENCED_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_MATHML_FENCED_ELEMENT);
end;

function LSM_IS_MATHML_FENCED_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_MATHML_FENCED_ELEMENT);
end;

function LSM_MATHML_FENCED_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlFencedElementClass;
begin
  Result := PLsmMathmlFencedElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
