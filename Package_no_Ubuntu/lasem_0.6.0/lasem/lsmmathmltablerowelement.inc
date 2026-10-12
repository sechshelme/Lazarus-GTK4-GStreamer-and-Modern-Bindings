{$IFDEF read_interface}


type
  PLsmMathmlTableRowElementType = ^TLsmMathmlTableRowElementType;
  TLsmMathmlTableRowElementType = longint;

const
  LSM_MATHML_TABLE_ROW_ELEMENT_TYPE_ROW = 0;
  LSM_MATHML_TABLE_ROW_ELEMENT_TYPE_LABELED_ROW = 1;

type
  TLsmMathmlTableRowElement = record
    element: TLsmMathmlElement;
    _type: TLsmMathmlTableRowElementType;
  end;
  PLsmMathmlTableRowElement = ^TLsmMathmlTableRowElement;

  TLsmMathmlTableRowElementClass = record
    parent_class: TLsmMathmlElementClass;
  end;
  PLsmMathmlTableRowElementClass = ^TLsmMathmlTableRowElementClass;

function lsm_mathml_table_row_element_get_type: TGType; cdecl; external liblasem;
function lsm_mathml_table_row_element_new: PLsmDomNode; cdecl; external liblasem;
function lsm_mathml_labeled_table_row_element_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:49:54 ===

function LSM_TYPE_MATHML_TABLE_ROW_ELEMENT: TGType;
function LSM_MATHML_TABLE_ROW_ELEMENT(obj: Pointer): PLsmMathmlTableRowElement;
function LSM_MATHML_TABLE_ROW_ELEMENT_CLASS(klass: Pointer): PLsmMathmlTableRowElementClass;
function LSM_IS_MATHML_TABLE_ROW_ELEMENT(obj: Pointer): Tgboolean;
function LSM_IS_MATHML_TABLE_ROW_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_MATHML_TABLE_ROW_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlTableRowElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_TABLE_ROW_ELEMENT: TGType;
begin
  LSM_TYPE_MATHML_TABLE_ROW_ELEMENT := lsm_mathml_table_row_element_get_type;
end;

function LSM_MATHML_TABLE_ROW_ELEMENT(obj: Pointer): PLsmMathmlTableRowElement;
begin
  Result := PLsmMathmlTableRowElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_TABLE_ROW_ELEMENT));
end;

function LSM_MATHML_TABLE_ROW_ELEMENT_CLASS(klass: Pointer): PLsmMathmlTableRowElementClass;
begin
  Result := PLsmMathmlTableRowElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_TABLE_ROW_ELEMENT));
end;

function LSM_IS_MATHML_TABLE_ROW_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_MATHML_TABLE_ROW_ELEMENT);
end;

function LSM_IS_MATHML_TABLE_ROW_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_MATHML_TABLE_ROW_ELEMENT);
end;

function LSM_MATHML_TABLE_ROW_ELEMENT_GET_CLASS(obj: Pointer): PLsmMathmlTableRowElementClass;
begin
  Result := PLsmMathmlTableRowElementClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
