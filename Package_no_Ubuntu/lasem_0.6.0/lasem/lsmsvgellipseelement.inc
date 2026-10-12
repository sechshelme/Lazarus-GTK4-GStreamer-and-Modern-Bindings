{$IFDEF read_interface}


type
  //TLsmSvgEllipseElement = record
  //  base: TLsmSvgTransformable;
  //  cx: TLsmSvgLengthAttribute;
  //  cy: TLsmSvgLengthAttribute;
  //  rx: TLsmSvgLengthAttribute;
  //  ry: TLsmSvgLengthAttribute;
  //end;
  PLsmSvgEllipseElement = type Pointer;

  TLsmSvgEllipseElementClass = record
    base_class: TLsmSvgTransformableClass;
  end;
  PLsmSvgEllipseElementClass = ^TLsmSvgEllipseElementClass;

function lsm_svg_ellipse_element_get_type: TGType; cdecl; external liblasem;
function lsm_svg_ellipse_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:58:58 ===

function LSM_TYPE_SVG_ELLIPSE_ELEMENT: TGType;
function LSM_SVG_ELLIPSE_ELEMENT(obj: Pointer): PLsmSvgEllipseElement;
function LSM_SVG_ELLIPSE_ELEMENT_CLASS(klass: Pointer): PLsmSvgEllipseElementClass;
function LSM_IS_SVG_ELLIPSE_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_SVG_ELLIPSE_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_ELLIPSE_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgEllipseElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_ELLIPSE_ELEMENT: TGType;
begin
  LSM_TYPE_SVG_ELLIPSE_ELEMENT := lsm_svg_ellipse_element_get_type;
end;

function LSM_SVG_ELLIPSE_ELEMENT(obj: Pointer): PLsmSvgEllipseElement;
begin
  Result := PLsmSvgEllipseElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_ELLIPSE_ELEMENT));
end;

function LSM_SVG_ELLIPSE_ELEMENT_CLASS(klass: Pointer): PLsmSvgEllipseElementClass;
begin
  Result := PLsmSvgEllipseElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_ELLIPSE_ELEMENT));
end;

function LSM_IS_SVG_ELLIPSE_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_ELLIPSE_ELEMENT);
end;

function LSM_IS_SVG_ELLIPSE_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_ELLIPSE_ELEMENT);
end;

function LSM_SVG_ELLIPSE_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgEllipseElementClass;
begin
  Result := PLsmSvgEllipseElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
