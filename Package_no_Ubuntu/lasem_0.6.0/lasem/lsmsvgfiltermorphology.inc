{$IFDEF read_interface}


type
  //TLsmSvgFilterMorphology = record
  //  base: TLsmSvgFilterPrimitive;
  //  op: TLsmSvgMorphologyOperatorAttribute;
  //  radius: TLsmSvgLengthAttribute;
  //end;
  PLsmSvgFilterMorphology = type Pointer;

  TLsmSvgFilterMorphologyClass = record
    element_class: TLsmSvgFilterPrimitiveClass;
  end;
  PLsmSvgFilterMorphologyClass = ^TLsmSvgFilterMorphologyClass;

function lsm_svg_filter_morphology_get_type: TGType; cdecl; external liblasem;
function lsm_svg_filter_morphology_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:01:07 ===

function LSM_TYPE_SVG_FILTER_MORPHOLOGY: TGType;
function LSM_SVG_FILTER_MORPHOLOGY(obj: Pointer): PLsmSvgFilterMorphology;
function LSM_SVG_FILTER_MORPHOLOGY_CLASS(klass: Pointer): PLsmSvgFilterMorphologyClass;
function LSM_IS_SVG_FILTER_MORPHOLOGY(obj: Pointer): Tgboolean;
function LSM_IS_SVG_FILTER_MORPHOLOGY_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_FILTER_MORPHOLOGY_GET_CLASS(obj: Pointer): PLsmSvgFilterMorphologyClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_FILTER_MORPHOLOGY: TGType;
begin
  LSM_TYPE_SVG_FILTER_MORPHOLOGY := lsm_svg_filter_morphology_get_type;
end;

function LSM_SVG_FILTER_MORPHOLOGY(obj: Pointer): PLsmSvgFilterMorphology;
begin
  Result := PLsmSvgFilterMorphology(g_type_check_instance_cast(obj, LSM_TYPE_SVG_FILTER_MORPHOLOGY));
end;

function LSM_SVG_FILTER_MORPHOLOGY_CLASS(klass: Pointer): PLsmSvgFilterMorphologyClass;
begin
  Result := PLsmSvgFilterMorphologyClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_FILTER_MORPHOLOGY));
end;

function LSM_IS_SVG_FILTER_MORPHOLOGY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_FILTER_MORPHOLOGY);
end;

function LSM_IS_SVG_FILTER_MORPHOLOGY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_FILTER_MORPHOLOGY);
end;

function LSM_SVG_FILTER_MORPHOLOGY_GET_CLASS(obj: Pointer): PLsmSvgFilterMorphologyClass;
begin
  Result := PLsmSvgFilterMorphologyClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
