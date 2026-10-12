{$IFDEF read_interface}


type
  //TLsmSvgClipPathElement = record
  //  base: TLsmSvgTransformable;
  //  units: TLsmSvgPatternUnitsAttribute;
  //  enable_rendering: Tgboolean;
  //end;
  PLsmSvgClipPathElement = type Pointer;

  TLsmSvgClipPathElementClass = record
    base_class: TLsmSvgTransformableClass;
  end;
  PLsmSvgClipPathElementClass = ^TLsmSvgClipPathElementClass;

function lsm_svg_clip_path_element_get_type: TGType; cdecl; external liblasem;
function lsm_svg_clip_path_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:56:52 ===

function LSM_TYPE_SVG_CLIP_PATH_ELEMENT: TGType;
function LSM_SVG_CLIP_PATH_ELEMENT(obj: Pointer): PLsmSvgClipPathElement;
function LSM_SVG_CLIP_PATH_ELEMENT_CLASS(klass: Pointer): PLsmSvgClipPathElementClass;
function LSM_IS_SVG_CLIP_PATH_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_SVG_CLIP_PATH_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_CLIP_PATH_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgClipPathElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_CLIP_PATH_ELEMENT: TGType;
begin
  LSM_TYPE_SVG_CLIP_PATH_ELEMENT := lsm_svg_clip_path_element_get_type;
end;

function LSM_SVG_CLIP_PATH_ELEMENT(obj: Pointer): PLsmSvgClipPathElement;
begin
  Result := PLsmSvgClipPathElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_CLIP_PATH_ELEMENT));
end;

function LSM_SVG_CLIP_PATH_ELEMENT_CLASS(klass: Pointer): PLsmSvgClipPathElementClass;
begin
  Result := PLsmSvgClipPathElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_CLIP_PATH_ELEMENT));
end;

function LSM_IS_SVG_CLIP_PATH_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_CLIP_PATH_ELEMENT);
end;

function LSM_IS_SVG_CLIP_PATH_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_CLIP_PATH_ELEMENT);
end;

function LSM_SVG_CLIP_PATH_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgClipPathElementClass;
begin
  Result := PLsmSvgClipPathElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
