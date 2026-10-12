{$IFDEF read_interface}


type
  //TLsmSvgPolylineElement = record
  //  base: TLsmSvgTransformable;
  //  points: TLsmAttribute;
  //end;
  PLsmSvgPolylineElement = type Pointer;

  TLsmSvgPolylineElementClass = record
    base_class: TLsmSvgTransformableClass;
  end;
  PLsmSvgPolylineElementClass = ^TLsmSvgPolylineElementClass;

function lsm_svg_polyline_element_get_type: TGType; cdecl; external liblasem;
function lsm_svg_polyline_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:05:43 ===

function LSM_TYPE_SVG_POLYLINE_ELEMENT: TGType;
function LSM_SVG_POLYLINE_ELEMENT(obj: Pointer): PLsmSvgPolylineElement;
function LSM_SVG_POLYLINE_ELEMENT_CLASS(klass: Pointer): PLsmSvgPolylineElementClass;
function LSM_IS_SVG_POLYLINE_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_SVG_POLYLINE_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_POLYLINE_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgPolylineElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_POLYLINE_ELEMENT: TGType;
begin
  LSM_TYPE_SVG_POLYLINE_ELEMENT := lsm_svg_polyline_element_get_type;
end;

function LSM_SVG_POLYLINE_ELEMENT(obj: Pointer): PLsmSvgPolylineElement;
begin
  Result := PLsmSvgPolylineElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_POLYLINE_ELEMENT));
end;

function LSM_SVG_POLYLINE_ELEMENT_CLASS(klass: Pointer): PLsmSvgPolylineElementClass;
begin
  Result := PLsmSvgPolylineElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_POLYLINE_ELEMENT));
end;

function LSM_IS_SVG_POLYLINE_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_POLYLINE_ELEMENT);
end;

function LSM_IS_SVG_POLYLINE_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_POLYLINE_ELEMENT);
end;

function LSM_SVG_POLYLINE_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgPolylineElementClass;
begin
  Result := PLsmSvgPolylineElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
