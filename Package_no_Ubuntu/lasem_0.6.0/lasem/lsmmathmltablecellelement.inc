{$IFDEF read_interface}


type
  TLsmMathmlTableCellElement = record
    element: TLsmMathmlElement;
    row_span: TLsmMathmlUnsignedAttribute;
    column_span: TLsmMathmlUnsignedAttribute;
  end;
  PLsmMathmlTableCellElement = ^TLsmMathmlTableCellElement;

  TLsmMathmlTableCellElementClass = record
    parent_class: TLsmMathmlElementClass;
  end;
  PLsmMathmlTableCellElementClass = ^TLsmMathmlTableCellElementClass;

function lsm_mathml_table_cell_element_get_type: TGType; cdecl; external liblasem;
function lsm_mathml_table_cell_element_new: PLsmDomNode; cdecl; external liblasem;
procedure lsm_mathml_table_cell_element_get_spans(self: PLsmMathmlTableCellElement; row_span: Pdword; column_span: Pdword); cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:49:47 ===

function LSM_TYPE_MATHML_TABLE_CELL_ELEMENT: TGType;
function LSM_MATHML_TABLE_CELL_ELEMENT(obj: Pointer): PLsmMathmlTableCellElement;
function LSM_MATHML_TABLE_CELL_ELEMENT_CLASS(klass: Pointer): PLsmMathmlTableCellElementClass;
function LSM_IS_MATHML_TABLE_CELL_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_MATHML_TABLE_CELL_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_MATHML_TABLE_CELL_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlTableCellElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_TABLE_CELL_ELEMENT: TGType;
begin
  LSM_TYPE_MATHML_TABLE_CELL_ELEMENT := lsm_mathml_table_cell_element_get_type;
end;

function LSM_MATHML_TABLE_CELL_ELEMENT(obj: Pointer): PLsmMathmlTableCellElement;
begin
  Result := PLsmMathmlTableCellElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_TABLE_CELL_ELEMENT));
end;

function LSM_MATHML_TABLE_CELL_ELEMENT_CLASS(klass: Pointer): PLsmMathmlTableCellElementClass;
begin
  Result := PLsmMathmlTableCellElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_TABLE_CELL_ELEMENT));
end;

function LSM_IS_MATHML_TABLE_CELL_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_MATHML_TABLE_CELL_ELEMENT);
end;

function LSM_IS_MATHML_TABLE_CELL_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_MATHML_TABLE_CELL_ELEMENT);
end;

function LSM_MATHML_TABLE_CELL_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlTableCellElementClass;
begin
  Result := PLsmMathmlTableCellElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
