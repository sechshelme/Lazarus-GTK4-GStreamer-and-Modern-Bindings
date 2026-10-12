{$IFDEF read_interface}


type
  //TLsmSvgFilterTurbulence = record
  //  base: TLsmSvgFilterPrimitive;
  //  base_frequency: TLsmSvgOneOrTwoDoubleAttribute;
  //  n_octaves: TLsmSvgIntegerAttribute;
  //  seed: TLsmSvgDoubleAttribute;
  //  stitch_tiles: TLsmSvgStitchTilesAttribute;
  //  _type: TLsmSvgTurbulenceTypeAttribute;
  //end;
  PLsmSvgFilterTurbulence = type Pointer;

  TLsmSvgFilterTurbulenceClass = record
    element_class: TLsmSvgFilterPrimitiveClass;
  end;
  PLsmSvgFilterTurbulenceClass = ^TLsmSvgFilterTurbulenceClass;

function lsm_svg_filter_turbulence_get_type: TGType; cdecl; external liblasem;
function lsm_svg_filter_turbulence_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:01:31 ===

function LSM_TYPE_SVG_FILTER_TURBULENCE: TGType;
function LSM_SVG_FILTER_TURBULENCE(obj: Pointer): PLsmSvgFilterTurbulence;
function LSM_SVG_FILTER_TURBULENCE_CLASS(klass: Pointer): PLsmSvgFilterTurbulenceClass;
function LSM_IS_SVG_FILTER_TURBULENCE(obj: Pointer): Tgboolean;
function LSM_IS_SVG_FILTER_TURBULENCE_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_FILTER_TURBULENCE_GET_CLASS(obj: Pointer): PLsmSvgFilterTurbulenceClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_FILTER_TURBULENCE: TGType;
begin
  LSM_TYPE_SVG_FILTER_TURBULENCE := lsm_svg_filter_turbulence_get_type;
end;

function LSM_SVG_FILTER_TURBULENCE(obj: Pointer): PLsmSvgFilterTurbulence;
begin
  Result := PLsmSvgFilterTurbulence(g_type_check_instance_cast(obj, LSM_TYPE_SVG_FILTER_TURBULENCE));
end;

function LSM_SVG_FILTER_TURBULENCE_CLASS(klass: Pointer): PLsmSvgFilterTurbulenceClass;
begin
  Result := PLsmSvgFilterTurbulenceClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_FILTER_TURBULENCE));
end;

function LSM_IS_SVG_FILTER_TURBULENCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_FILTER_TURBULENCE);
end;

function LSM_IS_SVG_FILTER_TURBULENCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_FILTER_TURBULENCE);
end;

function LSM_SVG_FILTER_TURBULENCE_GET_CLASS(obj: Pointer): PLsmSvgFilterTurbulenceClass;
begin
  Result := PLsmSvgFilterTurbulenceClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
