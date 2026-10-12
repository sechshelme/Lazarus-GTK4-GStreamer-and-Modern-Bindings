{$IFDEF read_interface}


type
//  TLsmMathmlAlignGroupElement = record
//    element: TLsmMathmlElement;
//  end;
  PLsmMathmlAlignGroupElement = type Pointer;

//  TLsmMathmlAlignGroupElementClass = record
//    parent_class: TLsmMathmlElementClass;
//  end;
  PLsmMathmlAlignGroupElementClass = type Pointer;

function lsm_mathml_align_group_element_get_type: TGType; cdecl; external liblasem;
function lsm_mathml_align_group_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:39:19 ===

function LSM_TYPE_MATHML_ALIGN_GROUP_ELEMENT: TGType;
function LSM_MATHML_ALIGN_GROUP_ELEMENT(obj: Pointer): PLsmMathmlAlignGroupElement;
function LSM_MATHML_ALIGN_GROUP_ELEMENT_CLASS(klass: Pointer): PLsmMathmlAlignGroupElementClass;
function LSM_IS_MATHML_ALIGN_GROUP_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_MATHML_ALIGN_GROUP_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_MATHML_ALIGN_GROUP_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlAlignGroupElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_ALIGN_GROUP_ELEMENT: TGType;
begin
  LSM_TYPE_MATHML_ALIGN_GROUP_ELEMENT := lsm_mathml_align_group_element_get_type;
end;

function LSM_MATHML_ALIGN_GROUP_ELEMENT(obj: Pointer): PLsmMathmlAlignGroupElement;
begin
  Result := PLsmMathmlAlignGroupElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_ALIGN_GROUP_ELEMENT));
end;

function LSM_MATHML_ALIGN_GROUP_ELEMENT_CLASS(klass: Pointer): PLsmMathmlAlignGroupElementClass;
begin
  Result := PLsmMathmlAlignGroupElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_ALIGN_GROUP_ELEMENT));
end;

function LSM_IS_MATHML_ALIGN_GROUP_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_MATHML_ALIGN_GROUP_ELEMENT);
end;

function LSM_IS_MATHML_ALIGN_GROUP_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_MATHML_ALIGN_GROUP_ELEMENT);
end;

function LSM_MATHML_ALIGN_GROUP_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlAlignGroupElementClass;
begin
  Result := PLsmMathmlAlignGroupElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
