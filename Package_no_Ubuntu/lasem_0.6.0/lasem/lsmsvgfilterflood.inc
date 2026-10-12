{$IFDEF read_interface}


type
  //TLsmSvgFilterFlood = record
  //  base: TLsmSvgFilterPrimitive;
  //end;
  PLsmSvgFilterFlood = type Pointer;

  TLsmSvgFilterFloodClass = record
    element_class: TLsmSvgFilterPrimitiveClass;
  end;
  PLsmSvgFilterFloodClass = ^TLsmSvgFilterFloodClass;

function lsm_svg_filter_flood_get_type: TGType; cdecl; external liblasem;
function lsm_svg_filter_flood_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:00:46 ===

function LSM_TYPE_SVG_FILTER_FLOOD: TGType;
function LSM_SVG_FILTER_FLOOD(obj: Pointer): PLsmSvgFilterFlood;
function LSM_SVG_FILTER_FLOOD_CLASS(klass: Pointer): PLsmSvgFilterFloodClass;
function LSM_IS_SVG_FILTER_FLOOD(obj: Pointer): Tgboolean;
function LSM_IS_SVG_FILTER_FLOOD_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_FILTER_FLOOD_GET_CLASS(obj: Pointer): PLsmSvgFilterFloodClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_FILTER_FLOOD: TGType;
begin
  LSM_TYPE_SVG_FILTER_FLOOD := lsm_svg_filter_flood_get_type;
end;

function LSM_SVG_FILTER_FLOOD(obj: Pointer): PLsmSvgFilterFlood;
begin
  Result := PLsmSvgFilterFlood(g_type_check_instance_cast(obj, LSM_TYPE_SVG_FILTER_FLOOD));
end;

function LSM_SVG_FILTER_FLOOD_CLASS(klass: Pointer): PLsmSvgFilterFloodClass;
begin
  Result := PLsmSvgFilterFloodClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_FILTER_FLOOD));
end;

function LSM_IS_SVG_FILTER_FLOOD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_FILTER_FLOOD);
end;

function LSM_IS_SVG_FILTER_FLOOD_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_FILTER_FLOOD);
end;

function LSM_SVG_FILTER_FLOOD_GET_CLASS(obj: Pointer): PLsmSvgFilterFloodClass;
begin
  Result := PLsmSvgFilterFloodClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
