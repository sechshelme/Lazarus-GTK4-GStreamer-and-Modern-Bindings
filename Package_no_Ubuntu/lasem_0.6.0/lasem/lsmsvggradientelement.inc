{$IFDEF read_interface}


type
  TLsmSvgGradientElementAttributes = record
    transform: TLsmSvgMatrix;
    units: TLsmSvgPatternUnits;
    spread_method: TLsmSvgSpreadMethod;
  end;

  //TLsmSvgGradientElement = record
  //  element: TLsmSvgElement;
  //  transform: TLsmSvgTransformAttribute;
  //  units: TLsmSvgPatternUnitsAttribute;
  //  spread_method: TLsmSvgSpreadMethodAtttribute;
  //  href: TLsmAttribute;
  //  enable_rendering: Tgboolean;
  //end;
  PLsmSvgGradientElement = type Pointer;

  TLsmSvgGradientElementClass = record
    element_class: TLsmSvgElementClass;
    create_gradient: function(self: PLsmSvgElement; view: PLsmSvgView): PLsmSvgGradientElement; cdecl;
  end;
  PLsmSvgGradientElementClass = ^TLsmSvgGradientElementClass;

function lsm_svg_gradient_element_get_type: TGType; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:04:56 ===

function LSM_TYPE_SVG_GRADIENT_ELEMENT: TGType;
function LSM_SVG_GRADIENT_ELEMENT(obj: Pointer): PLsmSvgGradientElement;
function LSM_SVG_GRADIENT_ELEMENT_CLASS(klass: Pointer): PLsmSvgGradientElementClass;
function LSM_IS_SVG_GRADIENT_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_SVG_GRADIENT_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_GRADIENT_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgGradientElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_GRADIENT_ELEMENT: TGType;
begin
  LSM_TYPE_SVG_GRADIENT_ELEMENT := lsm_svg_gradient_element_get_type;
end;

function LSM_SVG_GRADIENT_ELEMENT(obj: Pointer): PLsmSvgGradientElement;
begin
  Result := PLsmSvgGradientElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_GRADIENT_ELEMENT));
end;

function LSM_SVG_GRADIENT_ELEMENT_CLASS(klass: Pointer): PLsmSvgGradientElementClass;
begin
  Result := PLsmSvgGradientElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_GRADIENT_ELEMENT));
end;

function LSM_IS_SVG_GRADIENT_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_GRADIENT_ELEMENT);
end;

function LSM_IS_SVG_GRADIENT_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_GRADIENT_ELEMENT);
end;

function LSM_SVG_GRADIENT_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgGradientElementClass;
begin
  Result := PLsmSvgGradientElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
