{$IFDEF read_interface}


type
  //TLsmSvgFilterComposite = record
  //  base: TLsmSvgFilterPrimitive;
  //  in2: TLsmAttribute;
  //  op: TLsmSvgBlendingModeAttribute;
  //end;
  PLsmSvgFilterComposite = type Pointer;

  TLsmSvgFilterCompositeClass = record
    element_class: TLsmSvgFilterPrimitiveClass;
  end;
  PLsmSvgFilterCompositeClass = ^TLsmSvgFilterCompositeClass;


function lsm_svg_filter_composite_get_type: TGType; cdecl; external liblasem;
function lsm_svg_filter_composite_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:00:33 ===

function LSM_TYPE_SVG_FILTER_COMPOSITE: TGType;
function LSM_SVG_FILTER_COMPOSITE(obj: Pointer): PLsmSvgFilterComposite;
function LSM_SVG_FILTER_COMPOSITE_CLASS(klass: Pointer): PLsmSvgFilterCompositeClass;
function LSM_IS_SVG_FILTER_COMPOSITE(obj: Pointer): Tgboolean;
function LSM_IS_SVG_FILTER_COMPOSITE_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_FILTER_COMPOSITE_GET_CLASS(obj: Pointer): PLsmSvgFilterCompositeClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_FILTER_COMPOSITE: TGType;
begin
  LSM_TYPE_SVG_FILTER_COMPOSITE := lsm_svg_filter_composite_get_type;
end;

function LSM_SVG_FILTER_COMPOSITE(obj: Pointer): PLsmSvgFilterComposite;
begin
  Result := PLsmSvgFilterComposite(g_type_check_instance_cast(obj, LSM_TYPE_SVG_FILTER_COMPOSITE));
end;

function LSM_SVG_FILTER_COMPOSITE_CLASS(klass: Pointer): PLsmSvgFilterCompositeClass;
begin
  Result := PLsmSvgFilterCompositeClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_FILTER_COMPOSITE));
end;

function LSM_IS_SVG_FILTER_COMPOSITE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_FILTER_COMPOSITE);
end;

function LSM_IS_SVG_FILTER_COMPOSITE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_FILTER_COMPOSITE);
end;

function LSM_SVG_FILTER_COMPOSITE_GET_CLASS(obj: Pointer): PLsmSvgFilterCompositeClass;
begin
  Result := PLsmSvgFilterCompositeClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
