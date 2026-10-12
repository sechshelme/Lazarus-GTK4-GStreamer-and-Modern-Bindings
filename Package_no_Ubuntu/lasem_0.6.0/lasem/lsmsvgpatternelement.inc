{$IFDEF read_interface}


type
  //TLsmSvgPatternElement = record
  //  element: TLsmSvgElement;
  //  x: TLsmSvgLengthAttribute;
  //  y: TLsmSvgLengthAttribute;
  //  width: TLsmSvgLengthAttribute;
  //  height: TLsmSvgLengthAttribute;
  //  transform: TLsmSvgTransformAttribute;
  //  units: TLsmSvgPatternUnitsAttribute;
  //  content_units: TLsmSvgPatternUnitsAttribute;
  //  href: TLsmAttribute;
  //  viewbox: TLsmSvgViewboxAttribute;
  //  preserve_aspect_ratio: TLsmSvgPreserveAspectRatioAttribute;
  //  enable_rendering: Tgboolean;
  //end;
  PLsmSvgPatternElement = type Pointer;

  TLsmSvgPatternElementClass = record
    element_class: TLsmSvgElementClass;
  end;
  PLsmSvgPatternElementClass = ^TLsmSvgPatternElementClass;

function lsm_svg_pattern_element_get_type: TGType; cdecl; external liblasem;
function lsm_svg_pattern_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:05:38 ===

function LSM_TYPE_SVG_PATTERN_ELEMENT: TGType;
function LSM_SVG_PATTERN_ELEMENT(obj: Pointer): PLsmSvgPatternElement;
function LSM_SVG_PATTERN_ELEMENT_CLASS(klass: Pointer): PLsmSvgPatternElementClass;
function LSM_IS_SVG_PATTERN_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_SVG_PATTERN_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_PATTERN_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgPatternElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_PATTERN_ELEMENT: TGType;
begin
  LSM_TYPE_SVG_PATTERN_ELEMENT := lsm_svg_pattern_element_get_type;
end;

function LSM_SVG_PATTERN_ELEMENT(obj: Pointer): PLsmSvgPatternElement;
begin
  Result := PLsmSvgPatternElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_PATTERN_ELEMENT));
end;

function LSM_SVG_PATTERN_ELEMENT_CLASS(klass: Pointer): PLsmSvgPatternElementClass;
begin
  Result := PLsmSvgPatternElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_PATTERN_ELEMENT));
end;

function LSM_IS_SVG_PATTERN_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_PATTERN_ELEMENT);
end;

function LSM_IS_SVG_PATTERN_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_PATTERN_ELEMENT);
end;

function LSM_SVG_PATTERN_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgPatternElementClass;
begin
  Result := PLsmSvgPatternElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
