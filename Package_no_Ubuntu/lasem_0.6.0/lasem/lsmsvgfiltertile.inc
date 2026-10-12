{$IFDEF read_interface}


type
  //TLsmSvgFilterTile = record
  //  base: TLsmSvgFilterPrimitive;
  //  std_deviation: TLsmSvgOneOrTwoDoubleAttribute;
  //end;
  PLsmSvgFilterTile = type Pointer;

  TLsmSvgFilterTileClass = record
    element_class: TLsmSvgFilterPrimitiveClass;
  end;
  PLsmSvgFilterTileClass = ^TLsmSvgFilterTileClass;

function lsm_svg_filter_tile_get_type: TGType; cdecl; external liblasem;
function lsm_svg_filter_tile_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:01:27 ===

function LSM_TYPE_SVG_FILTER_TILE: TGType;
function LSM_SVG_FILTER_TILE(obj: Pointer): PLsmSvgFilterTile;
function LSM_SVG_FILTER_TILE_CLASS(klass: Pointer): PLsmSvgFilterTileClass;
function LSM_IS_SVG_FILTER_TILE(obj: Pointer): Tgboolean;
function LSM_IS_SVG_FILTER_TILE_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_FILTER_TILE_GET_CLASS(obj: Pointer): PLsmSvgFilterTileClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_FILTER_TILE: TGType;
begin
  LSM_TYPE_SVG_FILTER_TILE := lsm_svg_filter_tile_get_type;
end;

function LSM_SVG_FILTER_TILE(obj: Pointer): PLsmSvgFilterTile;
begin
  Result := PLsmSvgFilterTile(g_type_check_instance_cast(obj, LSM_TYPE_SVG_FILTER_TILE));
end;

function LSM_SVG_FILTER_TILE_CLASS(klass: Pointer): PLsmSvgFilterTileClass;
begin
  Result := PLsmSvgFilterTileClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_FILTER_TILE));
end;

function LSM_IS_SVG_FILTER_TILE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_FILTER_TILE);
end;

function LSM_IS_SVG_FILTER_TILE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_FILTER_TILE);
end;

function LSM_SVG_FILTER_TILE_GET_CLASS(obj: Pointer): PLsmSvgFilterTileClass;
begin
  Result := PLsmSvgFilterTileClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
