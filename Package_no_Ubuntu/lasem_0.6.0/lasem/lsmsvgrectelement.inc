{$IFDEF read_interface}


type
  //TLsmSvgRectElement = record
  //  base: TLsmSvgTransformable;
  //  x: TLsmSvgLengthAttribute;
  //  y: TLsmSvgLengthAttribute;
  //  width: TLsmSvgLengthAttribute;
  //  height: TLsmSvgLengthAttribute;
  //  rx: TLsmSvgLengthAttribute;
  //  ry: TLsmSvgLengthAttribute;
  //end;
  PLsmSvgRectElement = type Pointer;

  TLsmSvgRectElementClass = record
    base_class: TLsmSvgTransformableClass;
  end;
  PLsmSvgRectElementClass = ^TLsmSvgRectElementClass;

function lsm_svg_rect_element_get_type: TGType; cdecl; external liblasem;
function lsm_svg_rect_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:05:48 ===

function LSM_TYPE_SVG_RECT_ELEMENT: TGType;
function LSM_SVG_RECT_ELEMENT(obj: Pointer): PLsmSvgRectElement;
function LSM_SVG_RECT_ELEMENT_CLASS(klass: Pointer): PLsmSvgRectElementClass;
function LSM_IS_SVG_RECT_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_SVG_RECT_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_RECT_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgRectElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_RECT_ELEMENT: TGType;
begin
  LSM_TYPE_SVG_RECT_ELEMENT := lsm_svg_rect_element_get_type;
end;

function LSM_SVG_RECT_ELEMENT(obj: Pointer): PLsmSvgRectElement;
begin
  Result := PLsmSvgRectElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_RECT_ELEMENT));
end;

function LSM_SVG_RECT_ELEMENT_CLASS(klass: Pointer): PLsmSvgRectElementClass;
begin
  Result := PLsmSvgRectElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_RECT_ELEMENT));
end;

function LSM_IS_SVG_RECT_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_RECT_ELEMENT);
end;

function LSM_IS_SVG_RECT_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_RECT_ELEMENT);
end;

function LSM_SVG_RECT_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgRectElementClass;
begin
  Result := PLsmSvgRectElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
