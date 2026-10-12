{$IFDEF read_interface}


type
  //TLsmSvgAElement = record
  //  base: TLsmSvgTransformable;
  //end;
  PLsmSvgAElement = type Pointer;

  TLsmSvgAElementClass = record
    base_class: TLsmSvgTransformableClass;
  end;
  PLsmSvgAElementClass = ^TLsmSvgAElementClass;

function lsm_svg_a_element_get_type: TGType; cdecl; external liblasem;
function lsm_svg_a_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:56:20 ===

function LSM_TYPE_SVG_A_ELEMENT: TGType;
function LSM_SVG_A_ELEMENT(obj: Pointer): PLsmSvgAElement;
function LSM_SVG_A_ELEMENT_CLASS(klass: Pointer): PLsmSvgAElementClass;
function LSM_IS_SVG_A_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_SVG_A_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_A_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgAElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_A_ELEMENT: TGType;
begin
  LSM_TYPE_SVG_A_ELEMENT := lsm_svg_a_element_get_type;
end;

function LSM_SVG_A_ELEMENT(obj: Pointer): PLsmSvgAElement;
begin
  Result := PLsmSvgAElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_A_ELEMENT));
end;

function LSM_SVG_A_ELEMENT_CLASS(klass: Pointer): PLsmSvgAElementClass;
begin
  Result := PLsmSvgAElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_A_ELEMENT));
end;

function LSM_IS_SVG_A_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_A_ELEMENT);
end;

function LSM_IS_SVG_A_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_A_ELEMENT);
end;

function LSM_SVG_A_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgAElementClass;
begin
  Result := PLsmSvgAElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
