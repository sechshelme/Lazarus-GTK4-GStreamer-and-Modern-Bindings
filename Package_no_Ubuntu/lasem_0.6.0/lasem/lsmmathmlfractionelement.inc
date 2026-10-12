{$IFDEF read_interface}


type
  //TLsmMathmlFractionElement = record
  //  presentation_container: TLsmMathmlElement;
  //  line_thickness: TLsmMathmlLengthAttribute;
  //  bevelled: TLsmMathmlBooleanAttribute;
  //  display: TLsmMathmlDisplay;
  //  axis_offset: double;
  //end;
  PLsmMathmlFractionElement = type Pointer;

  TLsmMathmlFractionElementClass = record
    parent_class: TLsmMathmlElementClass;
  end;
  PLsmMathmlFractionElementClass = ^TLsmMathmlFractionElementClass;

function lsm_mathml_fraction_element_get_type: TGType; cdecl; external liblasem;
function lsm_mathml_fraction_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:45:19 ===

function LSM_TYPE_MATHML_FRACTION_ELEMENT: TGType;
function LSM_MATHML_FRACTION_ELEMENT(obj: Pointer): PLsmMathmlFractionElement;
function LSM_MATHML_FRACTION_ELEMENT_CLASS(klass: Pointer): PLsmMathmlFractionElementClass;
function LSM_IS_MATHML_FRACTION_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_MATHML_FRACTION_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_MATHML_FRACTION_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlFractionElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_FRACTION_ELEMENT: TGType;
begin
  LSM_TYPE_MATHML_FRACTION_ELEMENT := lsm_mathml_fraction_element_get_type;
end;

function LSM_MATHML_FRACTION_ELEMENT(obj: Pointer): PLsmMathmlFractionElement;
begin
  Result := PLsmMathmlFractionElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_FRACTION_ELEMENT));
end;

function LSM_MATHML_FRACTION_ELEMENT_CLASS(klass: Pointer): PLsmMathmlFractionElementClass;
begin
  Result := PLsmMathmlFractionElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_FRACTION_ELEMENT));
end;

function LSM_IS_MATHML_FRACTION_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_MATHML_FRACTION_ELEMENT);
end;

function LSM_IS_MATHML_FRACTION_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_MATHML_FRACTION_ELEMENT);
end;

function LSM_MATHML_FRACTION_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlFractionElementClass;
begin
  Result := PLsmMathmlFractionElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
