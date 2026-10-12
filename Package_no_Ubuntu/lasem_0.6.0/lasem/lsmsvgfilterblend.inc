{$IFDEF read_interface}


type
  //TLsmSvgFilterBlend = record
  //    base : TLsmSvgFilterPrimitive;
  //    in2 : TLsmAttribute;
  //    mode : TLsmSvgBlendingModeAttribute;
  //  end;
  PLsmSvgFilterBlend = type Pointer;

  TLsmSvgFilterBlendClass = record
    element_class: TLsmSvgFilterPrimitiveClass;
  end;
  PLsmSvgFilterBlendClass = ^TLsmSvgFilterBlendClass;

function lsm_svg_filter_blend_get_type: TGType; cdecl; external liblasem;
function lsm_svg_filter_blend_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:59:12 ===

function LSM_TYPE_SVG_FILTER_BLEND : TGType;
function LSM_SVG_FILTER_BLEND(obj : Pointer) : PLsmSvgFilterBlend;
function LSM_SVG_FILTER_BLEND_CLASS(klass : Pointer) : PLsmSvgFilterBlendClass;
function LSM_IS_SVG_FILTER_BLEND(obj : Pointer) : Tgboolean;
function LSM_IS_SVG_FILTER_BLEND_CLASS(klass : Pointer) : Tgboolean;
function LSM_SVG_FILTER_BLEND_GET_CLASS(obj : Pointer) : PLsmSvgFilterBlendClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_FILTER_BLEND: TGType;
begin
  LSM_TYPE_SVG_FILTER_BLEND := lsm_svg_filter_blend_get_type;
end;

function LSM_SVG_FILTER_BLEND(obj : Pointer) : PLsmSvgFilterBlend;
begin
  Result := PLsmSvgFilterBlend(g_type_check_instance_cast(obj, LSM_TYPE_SVG_FILTER_BLEND));
end;

function LSM_SVG_FILTER_BLEND_CLASS(klass : Pointer) : PLsmSvgFilterBlendClass;
begin
  Result := PLsmSvgFilterBlendClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_FILTER_BLEND));
end;

function LSM_IS_SVG_FILTER_BLEND(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_SVG_FILTER_BLEND);
end;

function LSM_IS_SVG_FILTER_BLEND_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_SVG_FILTER_BLEND);
end;

function LSM_SVG_FILTER_BLEND_GET_CLASS(obj : Pointer) : PLsmSvgFilterBlendClass;
begin
  Result := PLsmSvgFilterBlendClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
