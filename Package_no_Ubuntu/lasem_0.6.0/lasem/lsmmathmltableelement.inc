{$IFDEF read_interface}


type
  TLsmMathmlTableElement = record
    element: TLsmMathmlElement;
    row_align: TLsmMathmlEnumListAttribute;
    column_align: TLsmMathmlEnumListAttribute;
    row_spacing: TLsmMathmlSpaceListAttribute;
    column_spacing: TLsmMathmlSpaceListAttribute;
    row_lines: TLsmMathmlEnumListAttribute;
    column_lines: TLsmMathmlEnumListAttribute;
    frame: TLsmMathmlEnumAttribute;
    frame_spacing: TLsmMathmlSpaceListAttribute;
    label_spacing: TLsmMathmlLengthAttribute;
    equal_rows: TLsmMathmlBooleanAttribute;
    equal_columns: TLsmMathmlBooleanAttribute;
    display_style: TLsmMathmlBooleanAttribute;
    n_columns: dword;
    n_rows: dword;
    widths: Pdouble;
    heights: Pdouble;
    depths: Pdouble;
    line_width: double;
  end;
  PLsmMathmlTableElement = ^TLsmMathmlTableElement;

  TLsmMathmlTableElementClass = record
    parent_class: TLsmMathmlElementClass;
  end;
  PLsmMathmlTableElementClass = ^TLsmMathmlTableElementClass;

function lsm_mathml_table_element_get_type: TGType; cdecl; external liblasem;
function lsm_mathml_table_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:49:51 ===

function LSM_TYPE_MATHML_TABLE_ELEMENT: TGType;
function LSM_MATHML_TABLE_ELEMENT(obj: Pointer): PLsmMathmlTableElement;
function LSM_MATHML_TABLE_ELEMENT_CLASS(klass: Pointer): PLsmMathmlTableElementClass;
function LSM_IS_MATHML_TABLE_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_MATHML_TABLE_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_MATHML_TABLE_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlTableElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_TABLE_ELEMENT: TGType;
begin
  LSM_TYPE_MATHML_TABLE_ELEMENT := lsm_mathml_table_element_get_type;
end;

function LSM_MATHML_TABLE_ELEMENT(obj: Pointer): PLsmMathmlTableElement;
begin
  Result := PLsmMathmlTableElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_TABLE_ELEMENT));
end;

function LSM_MATHML_TABLE_ELEMENT_CLASS(klass: Pointer): PLsmMathmlTableElementClass;
begin
  Result := PLsmMathmlTableElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_TABLE_ELEMENT));
end;

function LSM_IS_MATHML_TABLE_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_MATHML_TABLE_ELEMENT);
end;

function LSM_IS_MATHML_TABLE_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_MATHML_TABLE_ELEMENT);
end;

function LSM_MATHML_TABLE_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlTableElementClass;
begin
  Result := PLsmMathmlTableElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
