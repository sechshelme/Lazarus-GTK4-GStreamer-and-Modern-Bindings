{$IFDEF read_interface}


function lsm_mathml_style_get_type: TGType; cdecl; external liblasem;

type
  TLsmMathmlColor = record
    red: double;
    green: double;
    blue: double;
    alpha: double;
  end;
  PLsmMathmlColor = ^TLsmMathmlColor;

type
  TLsmMathmlStyle = record
    display: TLsmMathmlDisplay;
    script_level: longint;
    script_size_multiplier: double;
    script_min_size: double;
    negative_very_very_thin_math_space: double;
    negative_very_thin_math_space: double;
    negative_thin_math_space: double;
    negative_medium_math_space: double;
    negative_thick_math_space: double;
    negative_very_thick_math_space: double;
    negative_very_very_thick_math_space: double;
    very_very_thin_math_space: double;
    very_thin_math_space: double;
    thin_math_space: double;
    medium_math_space: double;
    thick_math_space: double;
    very_thick_math_space: double;
    very_very_thick_math_space: double;
    math_family: pchar;
    math_variant: TLsmMathmlVariant;
    math_size: double;
    math_color: TLsmMathmlColor;
    math_background: TLsmMathmlColor;
    bevelled: Tgboolean;
    subscript_shift: double;
    superscript_shift: double;
    line_thickness: double;
  end;
  PLsmMathmlStyle = ^TLsmMathmlStyle;

function lsm_mathml_style_new: PLsmMathmlStyle; cdecl; external liblasem;
procedure lsm_mathml_style_free(style: PLsmMathmlStyle); cdecl; external liblasem;
function lsm_mathml_style_duplicate(from: PLsmMathmlStyle): PLsmMathmlStyle; cdecl; external liblasem;
procedure lsm_mathml_style_change_script_level(style: PLsmMathmlStyle; increment: longint); cdecl; external liblasem;
procedure lsm_mathml_style_set_math_size_pt(style: PLsmMathmlStyle; math_size: double); cdecl; external liblasem;
procedure lsm_mathml_style_set_script_min_size_pt(style: PLsmMathmlStyle; script_min_size: double); cdecl; external liblasem;
procedure lsm_mathml_style_set_math_family(style: PLsmMathmlStyle; math_family: pchar); cdecl; external liblasem;
procedure lsm_mathml_style_set_math_variant(style: PLsmMathmlStyle; math_variant: TLsmMathmlVariant); cdecl; external liblasem;
procedure lsm_mathml_style_set_math_color(style: PLsmMathmlStyle; red: double; green: double; blue: double; alpha: double); cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:49:38 ===

function LSM_TYPE_MATHML_STYLE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_STYLE: TGType;
begin
  LSM_TYPE_MATHML_STYLE := lsm_mathml_style_get_type;
end;



{$ENDIF read_implementation}
