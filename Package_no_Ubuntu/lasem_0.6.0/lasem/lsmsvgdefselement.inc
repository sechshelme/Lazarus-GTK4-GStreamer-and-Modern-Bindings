{$IFDEF read_interface}


type
//  TLsmSvgDefsElement = record
//    base: TLsmSvgTransformable;
//  end;
  PLsmSvgDefsElement = type Pointer;

  TLsmSvgDefsElementClass = record
    base_class: TLsmSvgTransformableClass;
  end;
  PLsmSvgDefsElementClass = ^TLsmSvgDefsElementClass;

function lsm_svg_defs_element_get_type: TGType; cdecl; external liblasem;
function lsm_svg_defs_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:58:48 ===

function LSM_TYPE_SVG_DEFS_ELEMENT: TGType;
function LSM_SVG_DEFS_ELEMENT(obj: Pointer): PLsmSvgDefsElement;
function LSM_SVG_DEFS_ELEMENT_CLASS(klass: Pointer): PLsmSvgDefsElementClass;
function LSM_IS_SVG_DEFS_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_SVG_DEFS_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_DEFS_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgDefsElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_DEFS_ELEMENT: TGType;
begin
  LSM_TYPE_SVG_DEFS_ELEMENT := lsm_svg_defs_element_get_type;
end;

function LSM_SVG_DEFS_ELEMENT(obj: Pointer): PLsmSvgDefsElement;
begin
  Result := PLsmSvgDefsElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_DEFS_ELEMENT));
end;

function LSM_SVG_DEFS_ELEMENT_CLASS(klass: Pointer): PLsmSvgDefsElementClass;
begin
  Result := PLsmSvgDefsElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_DEFS_ELEMENT));
end;

function LSM_IS_SVG_DEFS_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_DEFS_ELEMENT);
end;

function LSM_IS_SVG_DEFS_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_DEFS_ELEMENT);
end;

function LSM_SVG_DEFS_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgDefsElementClass;
begin
  Result := PLsmSvgDefsElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
