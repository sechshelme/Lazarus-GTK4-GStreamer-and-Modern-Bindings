{$IFDEF read_interface}


type
  //TLsmSvgRadialGradientElement = record
  //  base: TLsmSvgGradientElement;
  //  cx: TLsmSvgLengthAttribute;
  //  cy: TLsmSvgLengthAttribute;
  //  r: TLsmSvgLengthAttribute;
  //  fx: TLsmSvgLengthAttribute;
  //  fy: TLsmSvgLengthAttribute;
  //end;
  PLsmSvgRadialGradientElement = type Pointer;

  TLsmSvgRadialGradientElementClass = record
    parent_class: TLsmSvgGradientElementClass;
  end;
  PLsmSvgRadialGradientElementClass = ^TLsmSvgRadialGradientElementClass;

function lsm_svg_radial_gradient_element_get_type: TGType; cdecl; external liblasem;
function lsm_svg_radial_gradient_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:05:45 ===

function LSM_TYPE_SVG_RADIAL_GRADIENT_ELEMENT: TGType;
function LSM_SVG_RADIAL_GRADIENT_ELEMENT(obj: Pointer): PLsmSvgRadialGradientElement;
function LSM_SVG_RADIAL_GRADIENT_ELEMENT_CLASS(klass: Pointer): PLsmSvgRadialGradientElementClass;
function LSM_IS_SVG_RADIAL_GRADIENT_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_SVG_RADIAL_GRADIENT_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_RADIAL_GRADIENT_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgRadialGradientElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_RADIAL_GRADIENT_ELEMENT: TGType;
begin
  LSM_TYPE_SVG_RADIAL_GRADIENT_ELEMENT := lsm_svg_radial_gradient_element_get_type;
end;

function LSM_SVG_RADIAL_GRADIENT_ELEMENT(obj: Pointer): PLsmSvgRadialGradientElement;
begin
  Result := PLsmSvgRadialGradientElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_RADIAL_GRADIENT_ELEMENT));
end;

function LSM_SVG_RADIAL_GRADIENT_ELEMENT_CLASS(klass: Pointer): PLsmSvgRadialGradientElementClass;
begin
  Result := PLsmSvgRadialGradientElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_RADIAL_GRADIENT_ELEMENT));
end;

function LSM_IS_SVG_RADIAL_GRADIENT_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_RADIAL_GRADIENT_ELEMENT);
end;

function LSM_IS_SVG_RADIAL_GRADIENT_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_RADIAL_GRADIENT_ELEMENT);
end;

function LSM_SVG_RADIAL_GRADIENT_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgRadialGradientElementClass;
begin
  Result := PLsmSvgRadialGradientElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
