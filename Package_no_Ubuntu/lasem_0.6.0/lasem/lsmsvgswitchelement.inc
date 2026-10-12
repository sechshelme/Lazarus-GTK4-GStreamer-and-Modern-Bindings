{$IFDEF read_interface}


type
  //TLsmSvgSwitchElement = record
  //  base: TLsmSvgTransformable;
  //end;
  PLsmSvgSwitchElement = type Pointer;

  TLsmSvgSwitchElementClass = record
    base_class: TLsmSvgTransformableClass;
  end;
  PLsmSvgSwitchElementClass = ^TLsmSvgSwitchElementClass;

function lsm_svg_switch_element_get_type: TGType; cdecl; external liblasem;
function lsm_svg_switch_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:11:32 ===

function LSM_TYPE_SVG_SWITCH_ELEMENT: TGType;
function LSM_SVG_SWITCH_ELEMENT(obj: Pointer): PLsmSvgSwitchElement;
function LSM_SVG_SWITCH_ELEMENT_CLASS(klass: Pointer): PLsmSvgSwitchElementClass;
function LSM_IS_SVG_SWITCH_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_SVG_SWITCH_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_SWITCH_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgSwitchElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_SWITCH_ELEMENT: TGType;
begin
  LSM_TYPE_SVG_SWITCH_ELEMENT := lsm_svg_switch_element_get_type;
end;

function LSM_SVG_SWITCH_ELEMENT(obj: Pointer): PLsmSvgSwitchElement;
begin
  Result := PLsmSvgSwitchElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_SWITCH_ELEMENT));
end;

function LSM_SVG_SWITCH_ELEMENT_CLASS(klass: Pointer): PLsmSvgSwitchElementClass;
begin
  Result := PLsmSvgSwitchElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_SWITCH_ELEMENT));
end;

function LSM_IS_SVG_SWITCH_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_SWITCH_ELEMENT);
end;

function LSM_IS_SVG_SWITCH_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_SWITCH_ELEMENT);
end;

function LSM_SVG_SWITCH_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgSwitchElementClass;
begin
  Result := PLsmSvgSwitchElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
