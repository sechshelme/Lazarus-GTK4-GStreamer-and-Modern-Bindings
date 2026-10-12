{$IFDEF read_interface}


type
  //TLsmSvgSymbolElement = record
  //  element: TLsmSvgElement;
  //  viewbox: TLsmSvgViewboxAttribute;
  //  preserve_aspect_ratio: TLsmSvgPreserveAspectRatioAttribute;
  //end;
  PLsmSvgSymbolElement = type Pointer;

  TLsmSvgSymbolElementClass = record
    element_class: TLsmSvgElementClass;
  end;
  PLsmSvgSymbolElementClass = ^TLsmSvgSymbolElementClass;

function lsm_svg_symbol_element_get_type: TGType; cdecl; external liblasem;
function lsm_svg_symbol_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:11:35 ===

function LSM_TYPE_SVG_SYMBOL_ELEMENT: TGType;
function LSM_SVG_SYMBOL_ELEMENT(obj: Pointer): PLsmSvgSymbolElement;
function LSM_SVG_SYMBOL_ELEMENT_CLASS(klass: Pointer): PLsmSvgSymbolElementClass;
function LSM_IS_SVG_SYMBOL_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_SVG_SYMBOL_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_SYMBOL_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgSymbolElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_SYMBOL_ELEMENT: TGType;
begin
  LSM_TYPE_SVG_SYMBOL_ELEMENT := lsm_svg_symbol_element_get_type;
end;

function LSM_SVG_SYMBOL_ELEMENT(obj: Pointer): PLsmSvgSymbolElement;
begin
  Result := PLsmSvgSymbolElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_SYMBOL_ELEMENT));
end;

function LSM_SVG_SYMBOL_ELEMENT_CLASS(klass: Pointer): PLsmSvgSymbolElementClass;
begin
  Result := PLsmSvgSymbolElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_SYMBOL_ELEMENT));
end;

function LSM_IS_SVG_SYMBOL_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_SYMBOL_ELEMENT);
end;

function LSM_IS_SVG_SYMBOL_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_SYMBOL_ELEMENT);
end;

function LSM_SVG_SYMBOL_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgSymbolElementClass;
begin
  Result := PLsmSvgSymbolElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
