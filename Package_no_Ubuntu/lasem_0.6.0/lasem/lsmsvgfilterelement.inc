{$IFDEF read_interface}


type
  //TLsmSvgFilterElement = record
  //  element: TLsmSvgElement;
  //  x: TLsmSvgLengthAttribute;
  //  y: TLsmSvgLengthAttribute;
  //  width: TLsmSvgLengthAttribute;
  //  height: TLsmSvgLengthAttribute;
  //  units: TLsmSvgPatternUnitsAttribute;
  //  primitive_units: TLsmSvgPatternUnitsAttribute;
  //  enable_rendering: Tgboolean;
  //end;
  PLsmSvgFilterElement = type Pointer;

  TLsmSvgFilterElementClass = record
    element_class: TLsmSvgElementClass;
  end;
  PLsmSvgFilterElementClass = ^TLsmSvgFilterElementClass;

function lsm_svg_filter_element_get_type: TGType; cdecl; external liblasem;
function lsm_svg_filter_element_new: PLsmDomNode; cdecl; external liblasem;
function lsm_svg_filter_element_get_effect_viewport(filter: PLsmSvgFilterElement; source_extents: PLsmBox; view: PLsmSvgView): TLsmBox; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:00:43 ===

function LSM_TYPE_SVG_FILTER_ELEMENT: TGType;
function LSM_SVG_FILTER_ELEMENT(obj: Pointer): PLsmSvgFilterElement;
function LSM_SVG_FILTER_ELEMENT_CLASS(klass: Pointer): PLsmSvgFilterElementClass;
function LSM_IS_SVG_FILTER_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_SVG_FILTER_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_FILTER_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgFilterElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_FILTER_ELEMENT: TGType;
begin
  LSM_TYPE_SVG_FILTER_ELEMENT := lsm_svg_filter_element_get_type;
end;

function LSM_SVG_FILTER_ELEMENT(obj: Pointer): PLsmSvgFilterElement;
begin
  Result := PLsmSvgFilterElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_FILTER_ELEMENT));
end;

function LSM_SVG_FILTER_ELEMENT_CLASS(klass: Pointer): PLsmSvgFilterElementClass;
begin
  Result := PLsmSvgFilterElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_FILTER_ELEMENT));
end;

function LSM_IS_SVG_FILTER_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_FILTER_ELEMENT);
end;

function LSM_IS_SVG_FILTER_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_FILTER_ELEMENT);
end;

function LSM_SVG_FILTER_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgFilterElementClass;
begin
  Result := PLsmSvgFilterElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
