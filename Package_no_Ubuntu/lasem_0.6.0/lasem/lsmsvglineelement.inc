{$IFDEF read_interface}


type
  //TLsmSvgLineElement = record
  //  base: TLsmSvgTransformable;
  //  x1: TLsmSvgLengthAttribute;
  //  y1: TLsmSvgLengthAttribute;
  //  x2: TLsmSvgLengthAttribute;
  //  y2: TLsmSvgLengthAttribute;
  //end;
  PLsmSvgLineElement = type Pointer;

  TLsmSvgLineElementClass = record
    base_class: TLsmSvgTransformableClass;
  end;
  PLsmSvgLineElementClass = ^TLsmSvgLineElementClass;

function lsm_svg_line_element_get_type: TGType; cdecl; external liblasem;
function lsm_svg_line_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:05:16 ===

function LSM_TYPE_SVG_LINE_ELEMENT: TGType;
function LSM_SVG_LINE_ELEMENT(obj: Pointer): PLsmSvgLineElement;
function LSM_SVG_LINE_ELEMENT_CLASS(klass: Pointer): PLsmSvgLineElementClass;
function LSM_IS_SVG_LINE_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_SVG_LINE_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_LINE_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgLineElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_LINE_ELEMENT: TGType;
begin
  LSM_TYPE_SVG_LINE_ELEMENT := lsm_svg_line_element_get_type;
end;

function LSM_SVG_LINE_ELEMENT(obj: Pointer): PLsmSvgLineElement;
begin
  Result := PLsmSvgLineElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_LINE_ELEMENT));
end;

function LSM_SVG_LINE_ELEMENT_CLASS(klass: Pointer): PLsmSvgLineElementClass;
begin
  Result := PLsmSvgLineElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_LINE_ELEMENT));
end;

function LSM_IS_SVG_LINE_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_LINE_ELEMENT);
end;

function LSM_IS_SVG_LINE_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_LINE_ELEMENT);
end;

function LSM_SVG_LINE_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgLineElementClass;
begin
  Result := PLsmSvgLineElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
