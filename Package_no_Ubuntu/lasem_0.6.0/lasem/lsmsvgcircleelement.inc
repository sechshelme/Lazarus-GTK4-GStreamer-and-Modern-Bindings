{$IFDEF read_interface}

type
  //TLsmSvgCircleElement = record
  //  base: TLsmSvgTransformable;
  //  cx: TLsmSvgLengthAttribute;
  //  cy: TLsmSvgLengthAttribute;
  //  r: TLsmSvgLengthAttribute;
  //end;
  PLsmSvgCircleElement = type Pointer;

  TLsmSvgCircleElementClass = record
    base_class: TLsmSvgTransformableClass;
  end;
  PLsmSvgCircleElementClass = ^TLsmSvgCircleElementClass;

function lsm_svg_circle_element_get_type: TGType; cdecl; external liblasem;
function lsm_svg_circle_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:56:49 ===

function LSM_TYPE_SVG_CIRCLE_ELEMENT: TGType;
function LSM_SVG_CIRCLE_ELEMENT(obj: Pointer): PLsmSvgCircleElement;
function LSM_SVG_CIRCLE_ELEMENT_CLASS(klass: Pointer): PLsmSvgCircleElementClass;
function LSM_IS_SVG_CIRCLE_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_SVG_CIRCLE_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_CIRCLE_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgCircleElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_CIRCLE_ELEMENT: TGType;
begin
  LSM_TYPE_SVG_CIRCLE_ELEMENT := lsm_svg_circle_element_get_type;
end;

function LSM_SVG_CIRCLE_ELEMENT(obj: Pointer): PLsmSvgCircleElement;
begin
  Result := PLsmSvgCircleElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_CIRCLE_ELEMENT));
end;

function LSM_SVG_CIRCLE_ELEMENT_CLASS(klass: Pointer): PLsmSvgCircleElementClass;
begin
  Result := PLsmSvgCircleElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_CIRCLE_ELEMENT));
end;

function LSM_IS_SVG_CIRCLE_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_CIRCLE_ELEMENT);
end;

function LSM_IS_SVG_CIRCLE_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_CIRCLE_ELEMENT);
end;

function LSM_SVG_CIRCLE_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgCircleElementClass;
begin
  Result := PLsmSvgCircleElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
