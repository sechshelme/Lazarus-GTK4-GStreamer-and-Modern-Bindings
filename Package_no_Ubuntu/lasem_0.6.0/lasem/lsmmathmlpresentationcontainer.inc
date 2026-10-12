{$IFDEF read_interface}


type
  //  TLsmMathmlPresentationContainer = record
  ///    element: TLsmMathmlElement;
  //  end;
  PLsmMathmlPresentationContainer = type Pointer;

//  TLsmMathmlPresentationContainerClass = record
//    parent_class: TLsmMathmlElementClass;
//  end;
  PLsmMathmlPresentationContainerClass = type Pointer;

function lsm_mathml_presentation_container_get_type: TGType; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:46:12 ===

function LSM_TYPE_MATHML_PRESENTATION_CONTAINER: TGType;
function LSM_MATHML_PRESENTATION_CONTAINER(obj: Pointer): PLsmMathmlPresentationContainer;
function LSM_MATHML_PRESENTATION_CONTAINER_CLASS(klass: Pointer): PLsmMathmlPresentationContainerClass;
function LSM_IS_MATHML_PRESENTATION_CONTAINER(obj: Pointer): Tgboolean;
function LSM_IS_MATHML_PRESENTATION_CONTAINER_CLASS(klass: Pointer): Tgboolean;
function LSM_MATHML_PRESENTATION_CONTAINER_GET_CLASS(obj: Pointer): PLsmMathmlPresentationContainerClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_PRESENTATION_CONTAINER: TGType;
begin
  LSM_TYPE_MATHML_PRESENTATION_CONTAINER := lsm_mathml_presentation_container_get_type;
end;

function LSM_MATHML_PRESENTATION_CONTAINER(obj: Pointer): PLsmMathmlPresentationContainer;
begin
  Result := PLsmMathmlPresentationContainer(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_PRESENTATION_CONTAINER));
end;

function LSM_MATHML_PRESENTATION_CONTAINER_CLASS(klass: Pointer): PLsmMathmlPresentationContainerClass;
begin
  Result := PLsmMathmlPresentationContainerClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_PRESENTATION_CONTAINER));
end;

function LSM_IS_MATHML_PRESENTATION_CONTAINER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_MATHML_PRESENTATION_CONTAINER);
end;

function LSM_IS_MATHML_PRESENTATION_CONTAINER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_MATHML_PRESENTATION_CONTAINER);
end;

function LSM_MATHML_PRESENTATION_CONTAINER_GET_CLASS(obj: Pointer): PLsmMathmlPresentationContainerClass;
begin
  Result := PLsmMathmlPresentationContainerClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
