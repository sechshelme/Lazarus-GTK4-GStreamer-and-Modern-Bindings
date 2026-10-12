{$IFDEF read_interface}


type
  //TLsmSvgFilterGaussianBlur = record
  //  base: TLsmSvgFilterPrimitive;
  //  std_deviation: TLsmSvgOneOrTwoDoubleAttribute;
  //end;
  PLsmSvgFilterGaussianBlur = type Pointer;

  TLsmSvgFilterGaussianBlurClass = record
    element_class: TLsmSvgFilterPrimitiveClass;
  end;
  PLsmSvgFilterGaussianBlurClass = ^TLsmSvgFilterGaussianBlurClass;

function lsm_svg_filter_gaussian_blur_get_type: TGType; cdecl; external liblasem;
function lsm_svg_filter_gaussian_blur_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:00:50 ===

function LSM_TYPE_SVG_FILTER_GAUSSIAN_BLUR: TGType;
function LSM_SVG_FILTER_GAUSSIAN_BLUR(obj: Pointer): PLsmSvgFilterGaussianBlur;
function LSM_SVG_FILTER_GAUSSIAN_BLUR_CLASS(klass: Pointer): PLsmSvgFilterGaussianBlurClass;
function LSM_IS_SVG_FILTER_GAUSSIAN_BLUR(obj: Pointer): Tgboolean;
function LSM_IS_SVG_FILTER_GAUSSIAN_BLUR_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_FILTER_GAUSSIAN_BLUR_GET_CLASS(obj: Pointer): PLsmSvgFilterGaussianBlurClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_FILTER_GAUSSIAN_BLUR: TGType;
begin
  LSM_TYPE_SVG_FILTER_GAUSSIAN_BLUR := lsm_svg_filter_gaussian_blur_get_type;
end;

function LSM_SVG_FILTER_GAUSSIAN_BLUR(obj: Pointer): PLsmSvgFilterGaussianBlur;
begin
  Result := PLsmSvgFilterGaussianBlur(g_type_check_instance_cast(obj, LSM_TYPE_SVG_FILTER_GAUSSIAN_BLUR));
end;

function LSM_SVG_FILTER_GAUSSIAN_BLUR_CLASS(klass: Pointer): PLsmSvgFilterGaussianBlurClass;
begin
  Result := PLsmSvgFilterGaussianBlurClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_FILTER_GAUSSIAN_BLUR));
end;

function LSM_IS_SVG_FILTER_GAUSSIAN_BLUR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_FILTER_GAUSSIAN_BLUR);
end;

function LSM_IS_SVG_FILTER_GAUSSIAN_BLUR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_FILTER_GAUSSIAN_BLUR);
end;

function LSM_SVG_FILTER_GAUSSIAN_BLUR_GET_CLASS(obj: Pointer): PLsmSvgFilterGaussianBlurClass;
begin
  Result := PLsmSvgFilterGaussianBlurClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
