{$IFDEF read_interface}


type
  //TLsmSvgMaskElement = record
  //  element: TLsmSvgElement;
  //  x: TLsmSvgLengthAttribute;
  //  y: TLsmSvgLengthAttribute;
  //  width: TLsmSvgLengthAttribute;
  //  height: TLsmSvgLengthAttribute;
  //  units: TLsmSvgPatternUnitsAttribute;
  //  content_units: TLsmSvgPatternUnitsAttribute;
  //  enable_rendering: Tgboolean;
  //end;
  PLsmSvgMaskElement = type Pointer;

  TLsmSvgMaskElementClass = record
    element_class: TLsmSvgElementClass;
  end;
  PLsmSvgMaskElementClass = ^TLsmSvgMaskElementClass;

function lsm_svg_mask_element_get_type: TGType; cdecl; external liblasem;
function lsm_svg_mask_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:05:21 ===

function LSM_TYPE_SVG_MASK_ELEMENT: TGType;
function LSM_SVG_MASK_ELEMENT(obj: Pointer): PLsmSvgMaskElement;
function LSM_SVG_MASK_ELEMENT_CLASS(klass: Pointer): PLsmSvgMaskElementClass;
function LSM_IS_SVG_MASK_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_SVG_MASK_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_MASK_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgMaskElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_MASK_ELEMENT: TGType;
begin
  LSM_TYPE_SVG_MASK_ELEMENT := lsm_svg_mask_element_get_type;
end;

function LSM_SVG_MASK_ELEMENT(obj: Pointer): PLsmSvgMaskElement;
begin
  Result := PLsmSvgMaskElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_MASK_ELEMENT));
end;

function LSM_SVG_MASK_ELEMENT_CLASS(klass: Pointer): PLsmSvgMaskElementClass;
begin
  Result := PLsmSvgMaskElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_MASK_ELEMENT));
end;

function LSM_IS_SVG_MASK_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_MASK_ELEMENT);
end;

function LSM_IS_SVG_MASK_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_MASK_ELEMENT);
end;

function LSM_SVG_MASK_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgMaskElementClass;
begin
  Result := PLsmSvgMaskElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
