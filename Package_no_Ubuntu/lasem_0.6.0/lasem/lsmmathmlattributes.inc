{$IFDEF read_interface}


type
  TLsmMathmlBooleanAttribute = record
    base: TLsmAttribute;
    value: Tgboolean;
  end;
  PLsmMathmlBooleanAttribute = ^TLsmMathmlBooleanAttribute;

  TLsmMathmlUnsignedAttribute = record
    base: TLsmAttribute;
    value: dword;
  end;
  PLsmMathmlUnsignedAttribute = ^TLsmMathmlUnsignedAttribute;

  TLsmMathmlEnumAttribute = record
    base: TLsmAttribute;
    value: dword;
  end;
  PLsmMathmlEnumAttribute = ^TLsmMathmlEnumAttribute;

  TLsmMathmlDoubleAttribute = record
    base: TLsmAttribute;
    value: double;
  end;
  PLsmMathmlDoubleAttribute = ^TLsmMathmlDoubleAttribute;

  TLsmMathmlScriptLevelAttribute = record
    base: TLsmAttribute;
    value: TLsmMathmlScriptLevel;
  end;
  PLsmMathmlScriptLevelAttribute = ^TLsmMathmlScriptLevelAttribute;

  TLsmMathmlColorAttribute = record
    base: TLsmAttribute;
    color: TLsmMathmlColor;
  end;
  PLsmMathmlColorAttribute = ^TLsmMathmlColorAttribute;

  TLsmMathmlStringAttribute = record
    base: TLsmAttribute;
    value: pchar;
  end;
  PLsmMathmlStringAttribute = ^TLsmMathmlStringAttribute;

function lsm_mathml_boolean_attribute_inherit(attribute: PLsmMathmlBooleanAttribute; value: Tgboolean): Tgboolean; cdecl; external liblasem;
function lsm_mathml_double_attribute_inherit(attribute: PLsmMathmlDoubleAttribute; value: double): double; cdecl; external liblasem;
function lsm_mathml_color_attribute_inherit(attribute: PLsmMathmlColorAttribute; value: TLsmMathmlColor): TLsmMathmlColor; cdecl; external liblasem;
function lsm_mathml_string_attribute_inherit(attribute: PLsmMathmlStringAttribute; _string: pchar): pchar; cdecl; external liblasem;
function lsm_mathml_script_level_attribute_apply(attribute: PLsmMathmlScriptLevelAttribute; script_level: longint): longint; cdecl; external liblasem;
function lsm_mathml_enum_attribute_inherit(attribute: PLsmMathmlEnumAttribute; value: dword): dword; cdecl; external liblasem;

type
  TLsmMathmlEnumListAttribute = record
    base: TLsmAttribute;
    enum_list: TLsmMathmlEnumList;
  end;
  PLsmMathmlEnumListAttribute = ^TLsmMathmlEnumListAttribute;

  TLsmMathmlLengthAttribute = record
    base: TLsmAttribute;
    length: TLsmMathmlLength;
    value: double;
  end;
  PLsmMathmlLengthAttribute = ^TLsmMathmlLengthAttribute;

function lsm_mathml_length_attribute_normalize(attribute: PLsmMathmlLengthAttribute; base: double; default_value: PLsmMathmlLength; style: PLsmMathmlStyle): double; cdecl; external liblasem;

type
  TLsmMathmlSpaceAttribute = record
    base: TLsmAttribute;
    space: TLsmMathmlSpace;
    value: double;
  end;
  PLsmMathmlSpaceAttribute = ^TLsmMathmlSpaceAttribute;

function lsm_mathml_space_attribute_normalize(attribute: PLsmMathmlSpaceAttribute; base: double; default_value: PLsmMathmlSpace; style: PLsmMathmlStyle): double; cdecl; external liblasem;

type
  TLsmMathmlSpaceListAttribute = record
    base: TLsmAttribute;
    space_list: TLsmMathmlSpaceList;
    n_values: dword;
    values: Pdouble;
  end;
  PLsmMathmlSpaceListAttribute = ^TLsmMathmlSpaceListAttribute;

procedure lsm_mathml_space_list_attribute_normalize(attribute: PLsmMathmlSpaceListAttribute; base: double; default_value: PLsmMathmlSpaceList; style: PLsmMathmlStyle); cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:39:34 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
