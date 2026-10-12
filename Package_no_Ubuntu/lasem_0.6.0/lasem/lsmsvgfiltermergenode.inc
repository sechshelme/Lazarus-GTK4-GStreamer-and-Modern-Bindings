{$IFDEF read_interface}


type
  //TLsmSvgFilterMergeNode = record
  //  base: TLsmSvgFilterPrimitive;
  //  std_deviation: TLsmSvgOneOrTwoDoubleAttribute;
  //end;
  PLsmSvgFilterMergeNode = type Pointer;

  TLsmSvgFilterMergeNodeClass = record
    element_class: TLsmSvgFilterPrimitiveClass;
  end;
  PLsmSvgFilterMergeNodeClass = ^TLsmSvgFilterMergeNodeClass;

function lsm_svg_filter_merge_node_get_type: TGType; cdecl; external liblasem;
function lsm_svg_filter_merge_node_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:01:03 ===

function LSM_TYPE_SVG_FILTER_MERGE_NODE: TGType;
function LSM_SVG_FILTER_MERGE_NODE(obj: Pointer): PLsmSvgFilterMergeNode;
function LSM_SVG_FILTER_MERGE_NODE_CLASS(klass: Pointer): PLsmSvgFilterMergeNodeClass;
function LSM_IS_SVG_FILTER_MERGE_NODE(obj: Pointer): Tgboolean;
function LSM_IS_SVG_FILTER_MERGE_NODE_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_FILTER_MERGE_NODE_GET_CLASS(obj: Pointer): PLsmSvgFilterMergeNodeClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_FILTER_MERGE_NODE: TGType;
begin
  LSM_TYPE_SVG_FILTER_MERGE_NODE := lsm_svg_filter_merge_node_get_type;
end;

function LSM_SVG_FILTER_MERGE_NODE(obj: Pointer): PLsmSvgFilterMergeNode;
begin
  Result := PLsmSvgFilterMergeNode(g_type_check_instance_cast(obj, LSM_TYPE_SVG_FILTER_MERGE_NODE));
end;

function LSM_SVG_FILTER_MERGE_NODE_CLASS(klass: Pointer): PLsmSvgFilterMergeNodeClass;
begin
  Result := PLsmSvgFilterMergeNodeClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_FILTER_MERGE_NODE));
end;

function LSM_IS_SVG_FILTER_MERGE_NODE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_FILTER_MERGE_NODE);
end;

function LSM_IS_SVG_FILTER_MERGE_NODE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_FILTER_MERGE_NODE);
end;

function LSM_SVG_FILTER_MERGE_NODE_GET_CLASS(obj: Pointer): PLsmSvgFilterMergeNodeClass;
begin
  Result := PLsmSvgFilterMergeNodeClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
