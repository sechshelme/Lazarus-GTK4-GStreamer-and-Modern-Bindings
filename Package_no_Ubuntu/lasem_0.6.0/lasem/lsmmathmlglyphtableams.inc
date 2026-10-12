{$IFDEF read_interface}


const
  LSM_MATHML_RADICAL_UTF8 = '\xe2\x88\x9a';
  LSM_MATHML_RADICAL_ORDER_X_OFFSET = 0.5;
  LSM_MATHML_RADICAL_ORDER_Y_OFFSET = 0.5;
  LSM_MATHML_RADICAL_TOP_LINE_WIDTH = 0.05;
var
  AMS_table : PLsmMathmlOperatorGlyph;cvar;external liblasem;

function lsm_mathml_glyph_table_find_operator_glyph(text: pchar): PLsmMathmlOperatorGlyph; cdecl; external liblasem;
function lsm_mathml_glyph_table_get_operator_slant(text: pchar): double; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:45:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
