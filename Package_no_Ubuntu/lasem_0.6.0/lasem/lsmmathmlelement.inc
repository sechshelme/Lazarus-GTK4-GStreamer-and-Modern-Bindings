{$IFDEF read_interface}


type
  TLsmMathmlElementStyle = record
    math_family: pchar;
    math_variant: TLsmMathmlVariant;
    math_size: double;
    math_color: TLsmMathmlColor;
    math_background: TLsmMathmlColor;
  end;
  PLsmMathmlElementStyle = ^TLsmMathmlElementStyle;

type
  TLsmMathmlElement = record
    element: TLsmDomElement;
    class_name: TLsmAttribute;
    id: TLsmAttribute;
    href: TLsmAttribute;
    style: TLsmMathmlElementStyle;
    need_update: Tgboolean;
    need_children_update: Tgboolean;
    need_measure: Tgboolean;
    need_layout: Tgboolean;
    x: double;
    y: double;
    bbox: TLsmMathmlBbox;
  end;
  PLsmMathmlElement = ^TLsmMathmlElement;

  TLsmMathmlElementClass = record
    parent_class: TLsmDomElementClass;
    attribute_manager: PLsmAttributeManager;
    update: procedure(element: PLsmMathmlElement; style: PLsmMathmlStyle); cdecl;
    update_children: function(element: PLsmMathmlElement; style: PLsmMathmlStyle): Tgboolean; cdecl;
    measure: function(element: PLsmMathmlElement; view: PLsmMathmlView; bbox: PLsmMathmlBbox): PLsmMathmlBbox; cdecl;
    layout: procedure(element: PLsmMathmlElement; view: PLsmMathmlView; x: double; y: double; bbox: PLsmMathmlBbox); cdecl;
    render: procedure(element: PLsmMathmlElement; view: PLsmMathmlView); cdecl;
    get_embellished_core: function(self: PLsmMathmlElement): PLsmMathmlOperatorElement; cdecl;
    is_inferred_row: function(self: PLsmMathmlElement): Tgboolean; cdecl;
  end;
  PLsmMathmlElementClass = ^TLsmMathmlElementClass;

function lsm_mathml_element_get_type: TGType; cdecl; external liblasem;
function lsm_mathml_element_update(element: PLsmMathmlElement; style: PLsmMathmlStyle): Tgboolean; cdecl; external liblasem;
function lsm_mathml_element_measure(element: PLsmMathmlElement; view: PLsmMathmlView; stretch_bbox: PLsmMathmlBbox): PLsmMathmlBbox; cdecl; external liblasem;
procedure lsm_mathml_element_layout(element: PLsmMathmlElement; view: PLsmMathmlView; x: double; y: double; bbox: PLsmMathmlBbox); cdecl; external liblasem;
procedure lsm_mathml_element_render(element: PLsmMathmlElement; view: PLsmMathmlView); cdecl; external liblasem;
function lsm_mathml_element_get_embellished_core(self: PLsmMathmlElement): PLsmMathmlOperatorElement; cdecl; external liblasem;
function lsm_mathml_element_get_bbox(self: PLsmMathmlElement): PLsmMathmlBbox; cdecl; external liblasem;
function lsm_mathml_element_is_inferred_row(self: PLsmMathmlElement): Tgboolean; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:39:47 ===

function LSM_TYPE_MATHML_ELEMENT: TGType;
function LSM_MATHML_ELEMENT(obj: Pointer): PLsmMathmlElement;
function LSM_MATHML_ELEMENT_CLASS(klass: Pointer): PLsmMathmlElementClass;
function LSM_IS_MATHML_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_MATHML_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_MATHML_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_ELEMENT: TGType;
begin
  LSM_TYPE_MATHML_ELEMENT := lsm_mathml_element_get_type;
end;

function LSM_MATHML_ELEMENT(obj: Pointer): PLsmMathmlElement;
begin
  Result := PLsmMathmlElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_ELEMENT));
end;

function LSM_MATHML_ELEMENT_CLASS(klass: Pointer): PLsmMathmlElementClass;
begin
  Result := PLsmMathmlElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_ELEMENT));
end;

function LSM_IS_MATHML_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_MATHML_ELEMENT);
end;

function LSM_IS_MATHML_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_MATHML_ELEMENT);
end;

function LSM_MATHML_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlElementClass;
begin
  Result := PLsmMathmlElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
