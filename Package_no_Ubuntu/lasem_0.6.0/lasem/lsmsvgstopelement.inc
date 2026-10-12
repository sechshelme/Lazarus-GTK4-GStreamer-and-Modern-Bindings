{$IFDEF read_interface}


type
  //TLsmSvgStopElement = record
  //  element: TLsmSvgElement;
  //  offset: TLsmSvgLengthAttribute;
  //end;
  PLsmSvgStopElement = type Pointer;

  TLsmSvgStopElementClass = record
    element_class: TLsmSvgElementClass;
  end;
  PLsmSvgStopElementClass = ^TLsmSvgStopElementClass;

function lsm_svg_stop_element_get_type: TGType; cdecl; external liblasem;
function lsm_svg_stop_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:11:13 ===

function LSM_TYPE_SVG_STOP_ELEMENT: TGType;
function LSM_SVG_STOP_ELEMENT(obj: Pointer): PLsmSvgStopElement;
function LSM_SVG_STOP_ELEMENT_CLASS(klass: Pointer): PLsmSvgStopElementClass;
function LSM_IS_SVG_STOP_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_SVG_STOP_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_STOP_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgStopElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_STOP_ELEMENT: TGType;
begin
  LSM_TYPE_SVG_STOP_ELEMENT := lsm_svg_stop_element_get_type;
end;

function LSM_SVG_STOP_ELEMENT(obj: Pointer): PLsmSvgStopElement;
begin
  Result := PLsmSvgStopElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_STOP_ELEMENT));
end;

function LSM_SVG_STOP_ELEMENT_CLASS(klass: Pointer): PLsmSvgStopElementClass;
begin
  Result := PLsmSvgStopElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_STOP_ELEMENT));
end;

function LSM_IS_SVG_STOP_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_STOP_ELEMENT);
end;

function LSM_IS_SVG_STOP_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_STOP_ELEMENT);
end;

function LSM_SVG_STOP_ELEMENT_GET_CLASS(obj: Pointer): PLsmSvgStopElementClass;
begin
  Result := PLsmSvgStopElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
