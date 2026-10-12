{$IFDEF read_interface}


type
  //TLsmSvgFilterColorMatrix = record
  //  base: TLsmSvgFilterPrimitive;
  //  _type: TLsmSvgColorFilterTypeAttribute;
  //  values: TLsmSvgVectorAttribute;
  //end;
  PLsmSvgFilterColorMatrix = type Pointer;

  TLsmSvgFilterColorMatrixClass = record
    element_class: TLsmSvgFilterPrimitiveClass;
  end;
  PLsmSvgFilterColorMatrixClass = ^TLsmSvgFilterColorMatrixClass;

function lsm_svg_filter_color_matrix_get_type: TGType; cdecl; external liblasem;
function lsm_svg_filter_color_matrix_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:00:29 ===

function LSM_TYPE_SVG_FILTER_COLOR_MATRIX: TGType;
function LSM_SVG_FILTER_COLOR_MATRIX(obj: Pointer): PLsmSvgFilterColorMatrix;
function LSM_SVG_FILTER_COLOR_MATRIX_CLASS(klass: Pointer): PLsmSvgFilterColorMatrixClass;
function LSM_IS_SVG_FILTER_COLOR_MATRIX(obj: Pointer): Tgboolean;
function LSM_IS_SVG_FILTER_COLOR_MATRIX_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_FILTER_COLOR_MATRIX_GET_CLASS(obj: Pointer): PLsmSvgFilterColorMatrixClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_FILTER_COLOR_MATRIX: TGType;
begin
  LSM_TYPE_SVG_FILTER_COLOR_MATRIX := lsm_svg_filter_color_matrix_get_type;
end;

function LSM_SVG_FILTER_COLOR_MATRIX(obj: Pointer): PLsmSvgFilterColorMatrix;
begin
  Result := PLsmSvgFilterColorMatrix(g_type_check_instance_cast(obj, LSM_TYPE_SVG_FILTER_COLOR_MATRIX));
end;

function LSM_SVG_FILTER_COLOR_MATRIX_CLASS(klass: Pointer): PLsmSvgFilterColorMatrixClass;
begin
  Result := PLsmSvgFilterColorMatrixClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_FILTER_COLOR_MATRIX));
end;

function LSM_IS_SVG_FILTER_COLOR_MATRIX(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_FILTER_COLOR_MATRIX);
end;

function LSM_IS_SVG_FILTER_COLOR_MATRIX_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_FILTER_COLOR_MATRIX);
end;

function LSM_SVG_FILTER_COLOR_MATRIX_GET_CLASS(obj: Pointer): PLsmSvgFilterColorMatrixClass;
begin
  Result := PLsmSvgFilterColorMatrixClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
