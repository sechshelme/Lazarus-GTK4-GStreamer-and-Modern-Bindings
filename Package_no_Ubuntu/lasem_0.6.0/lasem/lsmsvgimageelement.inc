{$IFDEF read_interface}


type
  //TLsmSvgImageElement = record
  //  base: TLsmSvgTransformable;
  //  x: TLsmSvgLengthAttribute;
  //  y: TLsmSvgLengthAttribute;
  //  width: TLsmSvgLengthAttribute;
  //  height: TLsmSvgLengthAttribute;
  //  href: TLsmAttribute;
  //  preserve_aspect_ratio: TLsmSvgPreserveAspectRatioAttribute;
  //  pixbuf: PGdkPixbuf;
  //end;
  PLsmSvgImageElement = type Pointer;

  TLsmSvgImageElementClass = record
    base_class: TLsmSvgTransformableClass;
  end;
  PLsmSvgImageElementClass = ^TLsmSvgImageElementClass;


function lsm_svg_image_element_get_type: TGType; cdecl; external liblasem;
function lsm_svg_image_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:04:59 ===

function LSM_TYPE_SVG_IMAGE_ELEMENT: TGType;
function LSM_SVG_IMAGE_ELEMENT(obj: Pointer): PLsmSvgImageElement;
function LSM_SVG_IMAGE_ELEMENT_CLASS(klass: Pointer): PLsmSvgImageElementClass;
function LSM_IS_SVG_IMAGE_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_SVG_IMAGE_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_IMAGE_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgImageElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_IMAGE_ELEMENT: TGType;
begin
  LSM_TYPE_SVG_IMAGE_ELEMENT := lsm_svg_image_element_get_type;
end;

function LSM_SVG_IMAGE_ELEMENT(obj: Pointer): PLsmSvgImageElement;
begin
  Result := PLsmSvgImageElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_IMAGE_ELEMENT));
end;

function LSM_SVG_IMAGE_ELEMENT_CLASS(klass: Pointer): PLsmSvgImageElementClass;
begin
  Result := PLsmSvgImageElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_IMAGE_ELEMENT));
end;

function LSM_IS_SVG_IMAGE_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_IMAGE_ELEMENT);
end;

function LSM_IS_SVG_IMAGE_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_IMAGE_ELEMENT);
end;

function LSM_SVG_IMAGE_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgImageElementClass;
begin
  Result := PLsmSvgImageElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
