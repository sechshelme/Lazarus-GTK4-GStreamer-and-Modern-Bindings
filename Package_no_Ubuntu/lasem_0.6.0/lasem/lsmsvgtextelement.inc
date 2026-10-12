{$IFDEF read_interface}


type
  //TLsmSvgTextElement = record
  //  base: TLsmSvgTransformable;
  //  x: TLsmSvgLengthListAttribute;
  //  y: TLsmSvgLengthListAttribute;
  //  dx: TLsmSvgLengthListAttribute;
  //  dy: TLsmSvgLengthListAttribute;
  //end;
  PLsmSvgTextElement = type Pointer;

  TLsmSvgTextElementClass = record
    base_class: TLsmSvgTransformableClass;
  end;
  PLsmSvgTextElementClass = ^TLsmSvgTextElementClass;

function lsm_svg_text_element_get_type: TGType; cdecl; external liblasem;
function lsm_svg_text_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:11:38 ===

function LSM_TYPE_SVG_TEXT_ELEMENT: TGType;
function LSM_SVG_TEXT_ELEMENT(obj: Pointer): PLsmSvgTextElement;
function LSM_SVG_TEXT_ELEMENT_CLASS(klass: Pointer): PLsmSvgTextElementClass;
function LSM_IS_SVG_TEXT_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_SVG_TEXT_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_TEXT_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgTextElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_TEXT_ELEMENT: TGType;
begin
  LSM_TYPE_SVG_TEXT_ELEMENT := lsm_svg_text_element_get_type;
end;

function LSM_SVG_TEXT_ELEMENT(obj: Pointer): PLsmSvgTextElement;
begin
  Result := PLsmSvgTextElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_TEXT_ELEMENT));
end;

function LSM_SVG_TEXT_ELEMENT_CLASS(klass: Pointer): PLsmSvgTextElementClass;
begin
  Result := PLsmSvgTextElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_TEXT_ELEMENT));
end;

function LSM_IS_SVG_TEXT_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_TEXT_ELEMENT);
end;

function LSM_IS_SVG_TEXT_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_TEXT_ELEMENT);
end;

function LSM_SVG_TEXT_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgTextElementClass;
begin
  Result := PLsmSvgTextElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
