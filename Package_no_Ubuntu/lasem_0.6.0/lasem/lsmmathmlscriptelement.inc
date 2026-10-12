{$IFDEF read_interface}


type
  PLsmMathmlScriptElementType = ^TLsmMathmlScriptElementType;
  TLsmMathmlScriptElementType = longint;

const
  LSM_MATHML_SCRIPT_ELEMENT_TYPE_SUB = 0;
  LSM_MATHML_SCRIPT_ELEMENT_TYPE_SUP = 1;
  LSM_MATHML_SCRIPT_ELEMENT_TYPE_SUB_SUP = 2;

type
  TLsmMathmlScriptElement = record
    element: TLsmMathmlElement;
    base: PLsmMathmlElement;
    subscript: PLsmMathmlElement;
    superscript: PLsmMathmlElement;
    subscript_offset: double;
    superscript_offset: double;
    _type: TLsmMathmlScriptElementType;
    subscript_shift: TLsmMathmlLengthAttribute;
    superscript_shift: TLsmMathmlLengthAttribute;
    display: TLsmMathmlDisplay;
  end;
  PLsmMathmlScriptElement = ^TLsmMathmlScriptElement;

  TLsmMathmlScriptElementClass = record
    parent_class: TLsmMathmlElementClass;
  end;
  PLsmMathmlScriptElementClass = ^TLsmMathmlScriptElementClass;

function lsm_mathml_script_element_get_type: TGType; cdecl; external liblasem;
function lsm_mathml_sub_element_new: PLsmDomNode; cdecl; external liblasem;
function lsm_mathml_sup_element_new: PLsmDomNode; cdecl; external liblasem;
function lsm_mathml_sub_sup_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:49:23 ===

function LSM_TYPE_MATHML_SCRIPT_ELEMENT: TGType;
function LSM_MATHML_SCRIPT_ELEMENT(obj: Pointer): PLsmMathmlScriptElement;
function LSM_MATHML_SCRIPT_ELEMENT_CLASS(klass: Pointer): PLsmMathmlScriptElementClass;
function LSM_IS_MATHML_SCRIPT_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_MATHML_SCRIPT_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_MATHML_SCRIPT_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlScriptElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_SCRIPT_ELEMENT: TGType;
begin
  LSM_TYPE_MATHML_SCRIPT_ELEMENT := lsm_mathml_script_element_get_type;
end;

function LSM_MATHML_SCRIPT_ELEMENT(obj: Pointer): PLsmMathmlScriptElement;
begin
  Result := PLsmMathmlScriptElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_SCRIPT_ELEMENT));
end;

function LSM_MATHML_SCRIPT_ELEMENT_CLASS(klass: Pointer): PLsmMathmlScriptElementClass;
begin
  Result := PLsmMathmlScriptElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_SCRIPT_ELEMENT));
end;

function LSM_IS_MATHML_SCRIPT_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_MATHML_SCRIPT_ELEMENT);
end;

function LSM_IS_MATHML_SCRIPT_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_MATHML_SCRIPT_ELEMENT);
end;

function LSM_MATHML_SCRIPT_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlScriptElementClass;
begin
  Result := PLsmMathmlScriptElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
