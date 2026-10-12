{$IFDEF read_interface}


type
  //TLsmSvgFilterOffset = record
  //  base: TLsmSvgFilterPrimitive;
  //  dx: TLsmSvgDoubleAttribute;
  //  dy: TLsmSvgDoubleAttribute;
  //end;
  PLsmSvgFilterOffset = type Pointer;

  TLsmSvgFilterOffsetClass = record
    element_class: TLsmSvgFilterPrimitiveClass;
  end;
  PLsmSvgFilterOffsetClass = ^TLsmSvgFilterOffsetClass;

function lsm_svg_filter_offset_get_type: TGType; cdecl; external liblasem;
function lsm_svg_filter_offset_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:01:10 ===

function LSM_TYPE_SVG_FILTER_OFFSET: TGType;
function LSM_SVG_FILTER_OFFSET(obj: Pointer): PLsmSvgFilterOffset;
function LSM_SVG_FILTER_OFFSET_CLASS(klass: Pointer): PLsmSvgFilterOffsetClass;
function LSM_IS_SVG_FILTER_OFFSET(obj: Pointer): Tgboolean;
function LSM_IS_SVG_FILTER_OFFSET_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_FILTER_OFFSET_GET_CLASS(obj: Pointer): PLsmSvgFilterOffsetClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_FILTER_OFFSET: TGType;
begin
  LSM_TYPE_SVG_FILTER_OFFSET := lsm_svg_filter_offset_get_type;
end;

function LSM_SVG_FILTER_OFFSET(obj: Pointer): PLsmSvgFilterOffset;
begin
  Result := PLsmSvgFilterOffset(g_type_check_instance_cast(obj, LSM_TYPE_SVG_FILTER_OFFSET));
end;

function LSM_SVG_FILTER_OFFSET_CLASS(klass: Pointer): PLsmSvgFilterOffsetClass;
begin
  Result := PLsmSvgFilterOffsetClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_FILTER_OFFSET));
end;

function LSM_IS_SVG_FILTER_OFFSET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_FILTER_OFFSET);
end;

function LSM_IS_SVG_FILTER_OFFSET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_FILTER_OFFSET);
end;

function LSM_SVG_FILTER_OFFSET_GET_CLASS(obj: Pointer): PLsmSvgFilterOffsetClass;
begin
  Result := PLsmSvgFilterOffsetClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
