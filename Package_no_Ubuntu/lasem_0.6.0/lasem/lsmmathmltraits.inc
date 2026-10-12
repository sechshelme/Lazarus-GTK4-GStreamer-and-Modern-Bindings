{$IFDEF read_interface}


const
  LSM_MATHML_SPACE_EM_NEGATIVE_VERY_VERY_THIN = -(0.055556);
  LSM_MATHML_SPACE_EM_NEGATIVE_VERY_THIN = -(0.111111);
  LSM_MATHML_SPACE_EM_NEGATIVE_THIN = -(0.166667);
  LSM_MATHML_SPACE_EM_NEGATIVE_MEDIUM = -(0.222222);
  LSM_MATHML_SPACE_EM_NEGATIVE_THICK = -(0.277778);
  LSM_MATHML_SPACE_EM_NEGATIVE_VERY_THICK = -(0.333333);
  LSM_MATHML_SPACE_EM_NEGATIVE_VERY_VERY_THICK = -(0.388889);
  LSM_MATHML_SPACE_EM_VERY_VERY_THIN = 0.055556;
  LSM_MATHML_SPACE_EM_VERY_THIN = 0.111111;
  LSM_MATHML_SPACE_EM_THIN = 0.166667;
  LSM_MATHML_SPACE_EM_MEDIUM = 0.222222;
  LSM_MATHML_SPACE_EM_THICK = 0.277778;
  LSM_MATHML_SPACE_EM_VERY_THICK = 0.333333;
  LSM_MATHML_SPACE_EM_VERY_VERY_THICK = 0.388889;

function lsm_mathml_color_get_type: TGType; cdecl; external liblasem;

type
  TLsmMathmlLength = record
    value: double;
    unit_: TLsmMathmlUnit;
  end;
  PLsmMathmlLength = ^TLsmMathmlLength;

function lsm_mathml_length_get_type: TGType; cdecl; external liblasem;
function lsm_mathml_length_normalize(length: PLsmMathmlLength; base: double; font_size: double): double; cdecl; external liblasem;

type
  TLsmMathmlScriptLevel = record
    sign: TLsmMathmlScriptLevelSign;
    level: longint;
  end;
  PLsmMathmlScriptLevel = ^TLsmMathmlScriptLevel;

  TLsmMathmlEnumList = record
    n_values: dword;
    values: Plongint;
  end;
  PLsmMathmlEnumList = ^TLsmMathmlEnumList;

type
  TLsmMathmlSpace = record
    name: TLsmMathmlSpaceName;
    length: TLsmMathmlLength;
  end;
  PLsmMathmlSpace = ^TLsmMathmlSpace;

function lsm_mathml_space_get_type: TGType; cdecl; external liblasem;

type
  TLsmMathmlSpaceList = record
    n_spaces: dword;
    spaces: PLsmMathmlSpace;
  end;
  PLsmMathmlSpaceList = ^TLsmMathmlSpaceList;

procedure lsm_mathml_enum_list_init(enum_list: PLsmMathmlEnumList; enum_list_default: PLsmMathmlEnumList); cdecl; external liblasem;
procedure lsm_mathml_space_list_init(space_list: PLsmMathmlSpaceList; space_list_default: PLsmMathmlSpaceList); cdecl; external liblasem;

var
  lsm_mathml_boolean_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_mathml_unsigned_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_mathml_display_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_mathml_mode_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_mathml_line_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_mathml_font_style_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_mathml_font_weight_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_mathml_variant_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_mathml_form_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_mathml_notation_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_mathml_linebreak_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_mathml_row_align_list_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_mathml_column_align_list_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_mathml_line_list_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_mathml_script_level_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_mathml_double_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_mathml_string_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_mathml_length_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_mathml_space_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_mathml_space_list_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_mathml_color_trait_class : TLsmTraitClass;cvar;external liblasem;

// === Konventiert am: 3-3-26 15:50:03 ===

function LSM_TYPE_MATHML_LENGTH: TGType;
function LSM_TYPE_MATHML_COLOR: TGType;
function LSM_TYPE_MATHML_SPACE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_COLOR: TGType;
begin
  LSM_TYPE_MATHML_COLOR := lsm_mathml_color_get_type;
end;

function LSM_TYPE_MATHML_LENGTH: TGType;
begin
  LSM_TYPE_MATHML_LENGTH := lsm_mathml_length_get_type;
end;

function LSM_TYPE_MATHML_SPACE: TGType;
begin
  LSM_TYPE_MATHML_SPACE := lsm_mathml_space_get_type;
end;


{$ENDIF read_implementation}
