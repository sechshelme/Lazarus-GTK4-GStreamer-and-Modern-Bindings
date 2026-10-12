{$IFDEF read_interface}


type
  //TLsmSvgSvgElement = record
  //  element: TLsmSvgElement;
  //  x: TLsmSvgLengthAttribute;
  //  y: TLsmSvgLengthAttribute;
  //  width: TLsmSvgLengthAttribute;
  //  height: TLsmSvgLengthAttribute;
  //  viewbox: TLsmSvgViewboxAttribute;
  //  preserve_aspect_ratio: TLsmSvgPreserveAspectRatioAttribute;
  //  svg_box: TLsmBox;
  //end;
  PLsmSvgSvgElement = type Pointer;

  //TLsmSvgSvgElementClass = record
  //  element_class: TLsmSvgElementClass;
  //end;
  PLsmSvgSvgElementClass = type Pointer;

function lsm_svg_svg_element_get_type: TGType; cdecl; external liblasem;
function lsm_svg_svg_element_new: PLsmDomNode; cdecl; external liblasem;
procedure lsm_svg_svg_element_measure(self: PLsmSvgSvgElement; view: PLsmSvgView; width: Pdouble; height: Pdouble); cdecl; external liblasem;
procedure lsm_svg_svg_element_render(svg_element: PLsmSvgSvgElement; view: PLsmSvgView); cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:11:27 ===

function LSM_TYPE_SVG_SVG_ELEMENT: TGType;
function LSM_SVG_SVG_ELEMENT(obj: Pointer): PLsmSvgSvgElement;
function LSM_SVG_SVG_ELEMENT_CLASS(klass: Pointer): PLsmSvgSvgElementClass;
function LSM_IS_SVG_SVG_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_SVG_SVG_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_SVG_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgSvgElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_SVG_ELEMENT: TGType;
begin
  LSM_TYPE_SVG_SVG_ELEMENT := lsm_svg_svg_element_get_type;
end;

function LSM_SVG_SVG_ELEMENT(obj: Pointer): PLsmSvgSvgElement;
begin
  Result := PLsmSvgSvgElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_SVG_ELEMENT));
end;

function LSM_SVG_SVG_ELEMENT_CLASS(klass: Pointer): PLsmSvgSvgElementClass;
begin
  Result := PLsmSvgSvgElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_SVG_ELEMENT));
end;

function LSM_IS_SVG_SVG_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_SVG_ELEMENT);
end;

function LSM_IS_SVG_SVG_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_SVG_ELEMENT);
end;

function LSM_SVG_SVG_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgSvgElementClass;
begin
  Result := PLsmSvgSvgElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
