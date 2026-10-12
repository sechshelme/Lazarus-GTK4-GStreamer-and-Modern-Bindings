{$IFDEF read_interface}


type
  //TLsmSvgPolygonElement = record
  //  base: TLsmSvgTransformable;
  //  points: TLsmAttribute;
  //end;
  PLsmSvgPolygonElement = type Pointer;

  TLsmSvgPolygonElementClass = record
    base_class: TLsmSvgTransformableClass;
  end;
  PLsmSvgPolygonElementClass = ^TLsmSvgPolygonElementClass;

function lsm_svg_polygon_element_get_type: TGType; cdecl; external liblasem;
function lsm_svg_polygon_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:05:41 ===

function LSM_TYPE_SVG_POLYGON_ELEMENT: TGType;
function LSM_SVG_POLYGON_ELEMENT(obj: Pointer): PLsmSvgPolygonElement;
function LSM_SVG_POLYGON_ELEMENT_CLASS(klass: Pointer): PLsmSvgPolygonElementClass;
function LSM_IS_SVG_POLYGON_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_SVG_POLYGON_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_POLYGON_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgPolygonElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_POLYGON_ELEMENT: TGType;
begin
  LSM_TYPE_SVG_POLYGON_ELEMENT := lsm_svg_polygon_element_get_type;
end;

function LSM_SVG_POLYGON_ELEMENT(obj: Pointer): PLsmSvgPolygonElement;
begin
  Result := PLsmSvgPolygonElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_POLYGON_ELEMENT));
end;

function LSM_SVG_POLYGON_ELEMENT_CLASS(klass: Pointer): PLsmSvgPolygonElementClass;
begin
  Result := PLsmSvgPolygonElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_POLYGON_ELEMENT));
end;

function LSM_IS_SVG_POLYGON_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_POLYGON_ELEMENT);
end;

function LSM_IS_SVG_POLYGON_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_POLYGON_ELEMENT);
end;

function LSM_SVG_POLYGON_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgPolygonElementClass;
begin
  Result := PLsmSvgPolygonElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
