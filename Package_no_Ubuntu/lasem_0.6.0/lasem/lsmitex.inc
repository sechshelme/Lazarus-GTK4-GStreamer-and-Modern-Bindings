{$IFDEF read_interface}


function lsm_itex_to_mathml(itex: pchar; size: Tgssize): pchar; cdecl; external liblasem;
procedure lsm_itex_free_mathml_buffer(mathml: pchar); cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:38:58 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
