{$IFDEF read_interface}


type
  //TLsmSvgFilterImage = record
  //  base: TLsmSvgFilterPrimitive;
  //  href: TLsmAttribute;
  //  preserve_aspect_ratio: TLsmSvgPreserveAspectRatioAttribute;
  //  pixbuf: PGdkPixbuf;
  //end;
  PLsmSvgFilterImage = type Pointer;

  TLsmSvgFilterImageClass = record
    element_class: TLsmSvgFilterPrimitiveClass;
  end;
  PLsmSvgFilterImageClass = ^TLsmSvgFilterImageClass;

function lsm_svg_filter_image_get_type: TGType; cdecl; external liblasem;
function lsm_svg_filter_image_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:00:54 ===

function LSM_TYPE_SVG_FILTER_IMAGE: TGType;
function LSM_SVG_FILTER_IMAGE(obj: Pointer): PLsmSvgFilterImage;
function LSM_SVG_FILTER_IMAGE_CLASS(klass: Pointer): PLsmSvgFilterImageClass;
function LSM_IS_SVG_FILTER_IMAGE(obj: Pointer): Tgboolean;
function LSM_IS_SVG_FILTER_IMAGE_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_FILTER_IMAGE_GET_CLASS(obj: Pointer): PLsmSvgFilterImageClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_FILTER_IMAGE: TGType;
begin
  LSM_TYPE_SVG_FILTER_IMAGE := lsm_svg_filter_image_get_type;
end;

function LSM_SVG_FILTER_IMAGE(obj: Pointer): PLsmSvgFilterImage;
begin
  Result := PLsmSvgFilterImage(g_type_check_instance_cast(obj, LSM_TYPE_SVG_FILTER_IMAGE));
end;

function LSM_SVG_FILTER_IMAGE_CLASS(klass: Pointer): PLsmSvgFilterImageClass;
begin
  Result := PLsmSvgFilterImageClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_FILTER_IMAGE));
end;

function LSM_IS_SVG_FILTER_IMAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_FILTER_IMAGE);
end;

function LSM_IS_SVG_FILTER_IMAGE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_FILTER_IMAGE);
end;

function LSM_SVG_FILTER_IMAGE_GET_CLASS(obj: Pointer): PLsmSvgFilterImageClass;
begin
  Result := PLsmSvgFilterImageClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
