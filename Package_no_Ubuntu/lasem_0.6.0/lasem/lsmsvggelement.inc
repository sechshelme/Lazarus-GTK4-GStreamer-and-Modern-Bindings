{$IFDEF read_interface}


type
  //TLsmSvgGElement = record
  //  base: TLsmSvgTransformable;
  //end;
  PLsmSvgGElement = type Pointer;

  TLsmSvgGElementClass = record
    base_class: TLsmSvgTransformableClass;
  end;
  PLsmSvgGElementClass = ^TLsmSvgGElementClass;

function lsm_svg_g_element_get_type: TGType; cdecl; external liblasem;
function lsm_svg_g_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:04:52 ===

function LSM_TYPE_SVG_G_ELEMENT: TGType;
function LSM_SVG_G_ELEMENT(obj: Pointer): PLsmSvgGElement;
function LSM_SVG_G_ELEMENT_CLASS(klass: Pointer): PLsmSvgGElementClass;
function LSM_IS_SVG_G_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_SVG_G_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_G_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgGElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_G_ELEMENT: TGType;
begin
  LSM_TYPE_SVG_G_ELEMENT := lsm_svg_g_element_get_type;
end;

function LSM_SVG_G_ELEMENT(obj: Pointer): PLsmSvgGElement;
begin
  Result := PLsmSvgGElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_G_ELEMENT));
end;

function LSM_SVG_G_ELEMENT_CLASS(klass: Pointer): PLsmSvgGElementClass;
begin
  Result := PLsmSvgGElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_G_ELEMENT));
end;

function LSM_IS_SVG_G_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_G_ELEMENT);
end;

function LSM_IS_SVG_G_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_G_ELEMENT);
end;

function LSM_SVG_G_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgGElementClass;
begin
  Result := PLsmSvgGElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
