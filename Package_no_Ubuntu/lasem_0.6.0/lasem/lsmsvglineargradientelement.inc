{$IFDEF read_interface}


type
  //TLsmSvgLinearGradientElement = record
  //  base: TLsmSvgGradientElement;
  //  x1: TLsmSvgLengthAttribute;
  //  y1: TLsmSvgLengthAttribute;
  //  x2: TLsmSvgLengthAttribute;
  //  y2: TLsmSvgLengthAttribute;
  //end;
  PLsmSvgLinearGradientElement = type Pointer;

  TLsmSvgLinearGradientElementClass = record
    parent_class: TLsmSvgGradientElementClass;
  end;
  PLsmSvgLinearGradientElementClass = ^TLsmSvgLinearGradientElementClass;

function lsm_svg_linear_gradient_element_get_type: TGType; cdecl; external liblasem;
function lsm_svg_linear_gradient_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:05:12 ===

function LSM_TYPE_SVG_LINEAR_GRADIENT_ELEMENT: TGType;
function LSM_SVG_LINEAR_GRADIENT_ELEMENT(obj: Pointer): PLsmSvgLinearGradientElement;
function LSM_SVG_LINEAR_GRADIENT_ELEMENT_CLASS(klass: Pointer): PLsmSvgLinearGradientElementClass;
function LSM_IS_SVG_LINEAR_GRADIENT_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_SVG_LINEAR_GRADIENT_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_LINEAR_GRADIENT_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgLinearGradientElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_LINEAR_GRADIENT_ELEMENT: TGType;
begin
  LSM_TYPE_SVG_LINEAR_GRADIENT_ELEMENT := lsm_svg_linear_gradient_element_get_type;
end;

function LSM_SVG_LINEAR_GRADIENT_ELEMENT(obj: Pointer): PLsmSvgLinearGradientElement;
begin
  Result := PLsmSvgLinearGradientElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_LINEAR_GRADIENT_ELEMENT));
end;

function LSM_SVG_LINEAR_GRADIENT_ELEMENT_CLASS(klass: Pointer): PLsmSvgLinearGradientElementClass;
begin
  Result := PLsmSvgLinearGradientElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_LINEAR_GRADIENT_ELEMENT));
end;

function LSM_IS_SVG_LINEAR_GRADIENT_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_LINEAR_GRADIENT_ELEMENT);
end;

function LSM_IS_SVG_LINEAR_GRADIENT_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_LINEAR_GRADIENT_ELEMENT);
end;

function LSM_SVG_LINEAR_GRADIENT_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgLinearGradientElementClass;
begin
  Result := PLsmSvgLinearGradientElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
