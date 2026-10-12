{$IFDEF read_interface}


type
  //TLsmSvgPathElement = record
  //  base: TLsmSvgTransformable;
  //  d: TLsmAttribute;
  //  path_length: TLsmSvgDoubleAttribute;
  //end;
  PLsmSvgPathElement = type Pointer;

  TLsmSvgPathElementClass = record
    base_class: TLsmSvgTransformableClass;
  end;
  PLsmSvgPathElementClass = ^TLsmSvgPathElementClass;

function lsm_svg_path_element_get_type: TGType; cdecl; external liblasem;
function lsm_svg_path_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:05:35 ===

function LSM_TYPE_SVG_PATH_ELEMENT: TGType;
function LSM_SVG_PATH_ELEMENT(obj: Pointer): PLsmSvgPathElement;
function LSM_SVG_PATH_ELEMENT_CLASS(klass: Pointer): PLsmSvgPathElementClass;
function LSM_IS_SVG_PATH_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_SVG_PATH_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_PATH_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgPathElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_PATH_ELEMENT: TGType;
begin
  LSM_TYPE_SVG_PATH_ELEMENT := lsm_svg_path_element_get_type;
end;

function LSM_SVG_PATH_ELEMENT(obj: Pointer): PLsmSvgPathElement;
begin
  Result := PLsmSvgPathElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_PATH_ELEMENT));
end;

function LSM_SVG_PATH_ELEMENT_CLASS(klass: Pointer): PLsmSvgPathElementClass;
begin
  Result := PLsmSvgPathElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_PATH_ELEMENT));
end;

function LSM_IS_SVG_PATH_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_PATH_ELEMENT);
end;

function LSM_IS_SVG_PATH_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_PATH_ELEMENT);
end;

function LSM_SVG_PATH_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgPathElementClass;
begin
  Result := PLsmSvgPathElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
