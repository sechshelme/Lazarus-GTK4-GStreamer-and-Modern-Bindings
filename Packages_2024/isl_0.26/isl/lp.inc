{$IFDEF read_interface}


type
  Tisl_lp_result = longint;
const
  isl_lp_error = -(1);
  isl_lp_ok = 0;
  isl_lp_unbounded = 1;
  isl_lp_empty = 2;

function isl_basic_set_min_lp_val(bset: Pisl_basic_set; obj: Pisl_aff): Pisl_val; cdecl; external libisl;
function isl_basic_set_max_lp_val(bset: Pisl_basic_set; obj: Pisl_aff): Pisl_val; cdecl; external libisl;

// === Konventiert am: 5-11-26 15:29:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
