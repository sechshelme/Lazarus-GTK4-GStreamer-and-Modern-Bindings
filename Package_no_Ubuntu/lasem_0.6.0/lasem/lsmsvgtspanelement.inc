{$IFDEF read_interface}


type
  //TLsmSvgTspanElement = record
  //  element: TLsmSvgElement;
  //  x: TLsmSvgLengthListAttribute;
  //  y: TLsmSvgLengthListAttribute;
  //  dx: TLsmSvgLengthListAttribute;
  //  dy: TLsmSvgLengthListAttribute;
  //end;
  PLsmSvgTspanElement = type Pointer;

  TLsmSvgTspanElementClass = record
    element_class: TLsmSvgElementClass;
  end;
  PLsmSvgTspanElementClass = ^TLsmSvgTspanElementClass;

function lsm_svg_tspan_element_get_type: TGType; cdecl; external liblasem;
function lsm_svg_tspan_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:12:02 ===

function LSM_TYPE_SVG_TSPAN_ELEMENT: TGType;
function LSM_SVG_TSPAN_ELEMENT(obj: Pointer): PLsmSvgTspanElement;
function LSM_SVG_TSPAN_ELEMENT_CLASS(klass: Pointer): PLsmSvgTspanElementClass;
function LSM_IS_SVG_TSPAN_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_SVG_TSPAN_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_TSPAN_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgTspanElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_TSPAN_ELEMENT: TGType;
begin
  LSM_TYPE_SVG_TSPAN_ELEMENT := lsm_svg_tspan_element_get_type;
end;

function LSM_SVG_TSPAN_ELEMENT(obj: Pointer): PLsmSvgTspanElement;
begin
  Result := PLsmSvgTspanElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_TSPAN_ELEMENT));
end;

function LSM_SVG_TSPAN_ELEMENT_CLASS(klass: Pointer): PLsmSvgTspanElementClass;
begin
  Result := PLsmSvgTspanElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_TSPAN_ELEMENT));
end;

function LSM_IS_SVG_TSPAN_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_TSPAN_ELEMENT);
end;

function LSM_IS_SVG_TSPAN_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_TSPAN_ELEMENT);
end;

function LSM_SVG_TSPAN_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgTspanElementClass;
begin
  Result := PLsmSvgTspanElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
