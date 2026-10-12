{$IFDEF read_interface}


type
  //TLsmSvgFilterDisplacementMap = record
  //  base: TLsmSvgFilterPrimitive;
  //  in2: TLsmAttribute;
  //  scale: TLsmSvgDoubleAttribute;
  //  x_channel_selector: TLsmSvgChannelSelectorAttribute;
  //  y_channel_selector: TLsmSvgChannelSelectorAttribute;
  //end;
  PLsmSvgFilterDisplacementMap = type Pointer;

  TLsmSvgFilterDisplacementMapClass = record
    element_class: TLsmSvgFilterPrimitiveClass;
  end;
  PLsmSvgFilterDisplacementMapClass = ^TLsmSvgFilterDisplacementMapClass;

function lsm_svg_filter_displacement_map_get_type: TGType; cdecl; external liblasem;
function lsm_svg_filter_displacement_map_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:00:40 ===

function LSM_TYPE_SVG_FILTER_DISPLACEMENT_MAP: TGType;
function LSM_SVG_FILTER_DISPLACEMENT_MAP(obj: Pointer): PLsmSvgFilterDisplacementMap;
function LSM_SVG_FILTER_DISPLACEMENT_MAP_CLASS(klass: Pointer): PLsmSvgFilterDisplacementMapClass;
function LSM_IS_SVG_FILTER_DISPLACEMENT_MAP(obj: Pointer): Tgboolean;
function LSM_IS_SVG_FILTER_DISPLACEMENT_MAP_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_FILTER_DISPLACEMENT_MAP_GET_CLASS(obj: Pointer): PLsmSvgFilterDisplacementMapClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_FILTER_DISPLACEMENT_MAP: TGType;
begin
  LSM_TYPE_SVG_FILTER_DISPLACEMENT_MAP := lsm_svg_filter_displacement_map_get_type;
end;

function LSM_SVG_FILTER_DISPLACEMENT_MAP(obj: Pointer): PLsmSvgFilterDisplacementMap;
begin
  Result := PLsmSvgFilterDisplacementMap(g_type_check_instance_cast(obj, LSM_TYPE_SVG_FILTER_DISPLACEMENT_MAP));
end;

function LSM_SVG_FILTER_DISPLACEMENT_MAP_CLASS(klass: Pointer): PLsmSvgFilterDisplacementMapClass;
begin
  Result := PLsmSvgFilterDisplacementMapClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_FILTER_DISPLACEMENT_MAP));
end;

function LSM_IS_SVG_FILTER_DISPLACEMENT_MAP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_FILTER_DISPLACEMENT_MAP);
end;

function LSM_IS_SVG_FILTER_DISPLACEMENT_MAP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_FILTER_DISPLACEMENT_MAP);
end;

function LSM_SVG_FILTER_DISPLACEMENT_MAP_GET_CLASS(obj: Pointer): PLsmSvgFilterDisplacementMapClass;
begin
  Result := PLsmSvgFilterDisplacementMapClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
