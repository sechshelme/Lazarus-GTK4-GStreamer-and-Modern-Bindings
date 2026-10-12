{$IFDEF read_interface}


type
  //TLsmSvgMarkerElement = record
  //  element: TLsmSvgElement;
  //  units: TLsmSvgMarkerUnitsAttribute;
  //  ref_x: TLsmSvgLengthAttribute;
  //  ref_y: TLsmSvgLengthAttribute;
  //  width: TLsmSvgLengthAttribute;
  //  height: TLsmSvgLengthAttribute;
  //  orientation: TLsmSvgAngleAttribute;
  //  viewbox: TLsmSvgViewboxAttribute;
  //  preserve_aspect_ratio: TLsmSvgPreserveAspectRatioAttribute;
  //  enable_rendering: Tgboolean;
  //  stroke_width: double;
  //  vertex_angle: double;
  //  style: PLsmSvgStyle;
  //end;
  PLsmSvgMarkerElement = type Pointer;

  TLsmSvgMarkerElementClass = record
    element_class: TLsmSvgElementClass;
  end;
  PLsmSvgMarkerElementClass = ^TLsmSvgMarkerElementClass;

function lsm_svg_marker_element_get_type: TGType; cdecl; external liblasem;
function lsm_svg_marker_element_new: PLsmDomNode; cdecl; external liblasem;
procedure lsm_svg_marker_element_render(marker: PLsmSvgMarkerElement; view: PLsmSvgView; stroke_width: double; vertex_angle: double); cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:05:19 ===

function LSM_TYPE_SVG_MARKER_ELEMENT: TGType;
function LSM_SVG_MARKER_ELEMENT(obj: Pointer): PLsmSvgMarkerElement;
function LSM_SVG_MARKER_ELEMENT_CLASS(klass: Pointer): PLsmSvgMarkerElementClass;
function LSM_IS_SVG_MARKER_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_SVG_MARKER_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_MARKER_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgMarkerElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_MARKER_ELEMENT: TGType;
begin
  LSM_TYPE_SVG_MARKER_ELEMENT := lsm_svg_marker_element_get_type;
end;

function LSM_SVG_MARKER_ELEMENT(obj: Pointer): PLsmSvgMarkerElement;
begin
  Result := PLsmSvgMarkerElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_MARKER_ELEMENT));
end;

function LSM_SVG_MARKER_ELEMENT_CLASS(klass: Pointer): PLsmSvgMarkerElementClass;
begin
  Result := PLsmSvgMarkerElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_MARKER_ELEMENT));
end;

function LSM_IS_SVG_MARKER_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_MARKER_ELEMENT);
end;

function LSM_IS_SVG_MARKER_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_MARKER_ELEMENT);
end;

function LSM_SVG_MARKER_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgMarkerElementClass;
begin
  Result := PLsmSvgMarkerElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
