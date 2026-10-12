{$IFDEF read_interface}


type
  TLsmMathmlAlignMarkElement = record
    element: TLsmMathmlElement;
  end;
  PLsmMathmlAlignMarkElement = ^TLsmMathmlAlignMarkElement;

  TLsmMathmlAlignMarkElementClass = record
    parent_class: TLsmMathmlElementClass;
  end;
  PLsmMathmlAlignMarkElementClass = ^TLsmMathmlAlignMarkElementClass;


function lsm_mathml_align_mark_element_get_type: TGType; cdecl; external liblasem;
function lsm_mathml_align_mark_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:39:23 ===

function LSM_TYPE_MATHML_ALIGN_MARK_ELEMENT: TGType;
function LSM_MATHML_ALIGN_MARK_ELEMENT(obj: Pointer): PLsmMathmlAlignMarkElement;
function LSM_MATHML_ALIGN_MARK_ELEMENT_CLASS(klass: Pointer): PLsmMathmlAlignMarkElementClass;
function LSM_IS_MATHML_ALIGN_MARK_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_MATHML_ALIGN_MARK_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_MATHML_ALIGN_MARK_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlAlignMarkElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_ALIGN_MARK_ELEMENT: TGType;
begin
  LSM_TYPE_MATHML_ALIGN_MARK_ELEMENT := lsm_mathml_align_mark_element_get_type;
end;

function LSM_MATHML_ALIGN_MARK_ELEMENT(obj: Pointer): PLsmMathmlAlignMarkElement;
begin
  Result := PLsmMathmlAlignMarkElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_ALIGN_MARK_ELEMENT));
end;

function LSM_MATHML_ALIGN_MARK_ELEMENT_CLASS(klass: Pointer): PLsmMathmlAlignMarkElementClass;
begin
  Result := PLsmMathmlAlignMarkElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_ALIGN_MARK_ELEMENT));
end;

function LSM_IS_MATHML_ALIGN_MARK_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_MATHML_ALIGN_MARK_ELEMENT);
end;

function LSM_IS_MATHML_ALIGN_MARK_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_MATHML_ALIGN_MARK_ELEMENT);
end;

function LSM_MATHML_ALIGN_MARK_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlAlignMarkElementClass;
begin
  Result := PLsmMathmlAlignMarkElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
