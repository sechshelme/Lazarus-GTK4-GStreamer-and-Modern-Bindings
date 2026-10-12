{$IFDEF read_interface}


type
  PLsmSvgUseElementFlags = ^TLsmSvgUseElementFlags;
  TLsmSvgUseElementFlags = longint;

const
  LSM_SVG_USE_ELEMENT_FLAGS_IN_USE_FOR_RENDER = 1 shl 0;
  LSM_SVG_USE_ELEMENT_FLAGS_IN_USE_FOR_GET_EXTENTS = 1 shl 1;

type
  //TLsmSvgUseElement = record
  //  base: TLsmSvgTransformable;
  //  x: TLsmSvgLengthAttribute;
  //  y: TLsmSvgLengthAttribute;
  //  width: TLsmSvgLengthAttribute;
  //  height: TLsmSvgLengthAttribute;
  //  href: TLsmAttribute;
  //  flags: TLsmSvgUseElementFlags;
  //end;
  PLsmSvgUseElement = type Pointer;

  TLsmSvgUseElementClass = record
    base_class: TLsmSvgTransformableClass;
  end;
  PLsmSvgUseElementClass = ^TLsmSvgUseElementClass;

function lsm_svg_use_element_get_type: TGType; cdecl; external liblasem;
function lsm_svg_use_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:12:14 ===

function LSM_TYPE_SVG_USE_ELEMENT: TGType;
function LSM_SVG_USE_ELEMENT(obj: Pointer): PLsmSvgUseElement;
function LSM_SVG_USE_ELEMENT_CLASS(klass: Pointer): PLsmSvgUseElementClass;
function LSM_IS_SVG_USE_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_SVG_USE_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_USE_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgUseElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_USE_ELEMENT: TGType;
begin
  LSM_TYPE_SVG_USE_ELEMENT := lsm_svg_use_element_get_type;
end;

function LSM_SVG_USE_ELEMENT(obj: Pointer): PLsmSvgUseElement;
begin
  Result := PLsmSvgUseElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_USE_ELEMENT));
end;

function LSM_SVG_USE_ELEMENT_CLASS(klass: Pointer): PLsmSvgUseElementClass;
begin
  Result := PLsmSvgUseElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_USE_ELEMENT));
end;

function LSM_IS_SVG_USE_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_USE_ELEMENT);
end;

function LSM_IS_SVG_USE_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_USE_ELEMENT);
end;

function LSM_SVG_USE_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgUseElementClass;
begin
  Result := PLsmSvgUseElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
