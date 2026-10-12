{$IFDEF read_interface}


type
  //TLsmSvgFilterMerge = record
  //  base: TLsmSvgFilterPrimitive;
  //end;
  PLsmSvgFilterMerge = type Pointer;

  TLsmSvgFilterMergeClass = record
    element_class: TLsmSvgFilterPrimitiveClass;
  end;
  PLsmSvgFilterMergeClass = ^TLsmSvgFilterMergeClass;

function lsm_svg_filter_merge_get_type: TGType; cdecl; external liblasem;
function lsm_svg_filter_merge_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:00:59 ===

function LSM_TYPE_SVG_FILTER_MERGE: TGType;
function LSM_SVG_FILTER_MERGE(obj: Pointer): PLsmSvgFilterMerge;
function LSM_SVG_FILTER_MERGE_CLASS(klass: Pointer): PLsmSvgFilterMergeClass;
function LSM_IS_SVG_FILTER_MERGE(obj: Pointer): Tgboolean;
function LSM_IS_SVG_FILTER_MERGE_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_FILTER_MERGE_GET_CLASS(obj: Pointer): PLsmSvgFilterMergeClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_FILTER_MERGE: TGType;
begin
  LSM_TYPE_SVG_FILTER_MERGE := lsm_svg_filter_merge_get_type;
end;

function LSM_SVG_FILTER_MERGE(obj: Pointer): PLsmSvgFilterMerge;
begin
  Result := PLsmSvgFilterMerge(g_type_check_instance_cast(obj, LSM_TYPE_SVG_FILTER_MERGE));
end;

function LSM_SVG_FILTER_MERGE_CLASS(klass: Pointer): PLsmSvgFilterMergeClass;
begin
  Result := PLsmSvgFilterMergeClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_FILTER_MERGE));
end;

function LSM_IS_SVG_FILTER_MERGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_FILTER_MERGE);
end;

function LSM_IS_SVG_FILTER_MERGE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_FILTER_MERGE);
end;

function LSM_SVG_FILTER_MERGE_GET_CLASS(obj: Pointer): PLsmSvgFilterMergeClass;
begin
  Result := PLsmSvgFilterMergeClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
