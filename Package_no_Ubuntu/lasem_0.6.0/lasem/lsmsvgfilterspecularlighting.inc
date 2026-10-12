{$IFDEF read_interface}


type
  //TLsmSvgFilterSpecularLighting = record
  //  base: TLsmSvgFilterPrimitive;
  //  surface_scale: TLsmSvgDoubleAttribute;
  //  specular_constant: TLsmSvgDoubleAttribute;
  //  specular_exponent: TLsmSvgDoubleAttribute;
  //  kernel_unit_length: TLsmSvgOneOrTwoDoubleAttribute;
  //end;
  PLsmSvgFilterSpecularLighting = type Pointer;

  TLsmSvgFilterSpecularLightingClass = record
    element_class: TLsmSvgFilterPrimitiveClass;
  end;
  PLsmSvgFilterSpecularLightingClass = ^TLsmSvgFilterSpecularLightingClass;

function lsm_svg_filter_specular_lighting_get_type: TGType; cdecl; external liblasem;
function lsm_svg_filter_specular_lighting_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:01:16 ===

function LSM_TYPE_SVG_FILTER_SPECULAR_LIGHTING: TGType;
function LSM_SVG_FILTER_SPECULAR_LIGHTING(obj: Pointer): PLsmSvgFilterSpecularLighting;
function LSM_SVG_FILTER_SPECULAR_LIGHTING_CLASS(klass: Pointer): PLsmSvgFilterSpecularLightingClass;
function LSM_IS_SVG_FILTER_SPECULAR_LIGHTING(obj: Pointer): Tgboolean;
function LSM_IS_SVG_FILTER_SPECULAR_LIGHTING_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_FILTER_SPECULAR_LIGHTING_GET_CLASS(obj: Pointer): PLsmSvgFilterSpecularLightingClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_FILTER_SPECULAR_LIGHTING: TGType;
begin
  LSM_TYPE_SVG_FILTER_SPECULAR_LIGHTING := lsm_svg_filter_specular_lighting_get_type;
end;

function LSM_SVG_FILTER_SPECULAR_LIGHTING(obj: Pointer): PLsmSvgFilterSpecularLighting;
begin
  Result := PLsmSvgFilterSpecularLighting(g_type_check_instance_cast(obj, LSM_TYPE_SVG_FILTER_SPECULAR_LIGHTING));
end;

function LSM_SVG_FILTER_SPECULAR_LIGHTING_CLASS(klass: Pointer): PLsmSvgFilterSpecularLightingClass;
begin
  Result := PLsmSvgFilterSpecularLightingClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_FILTER_SPECULAR_LIGHTING));
end;

function LSM_IS_SVG_FILTER_SPECULAR_LIGHTING(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_FILTER_SPECULAR_LIGHTING);
end;

function LSM_IS_SVG_FILTER_SPECULAR_LIGHTING_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_FILTER_SPECULAR_LIGHTING);
end;

function LSM_SVG_FILTER_SPECULAR_LIGHTING_GET_CLASS(obj: Pointer): PLsmSvgFilterSpecularLightingClass;
begin
  Result := PLsmSvgFilterSpecularLightingClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
