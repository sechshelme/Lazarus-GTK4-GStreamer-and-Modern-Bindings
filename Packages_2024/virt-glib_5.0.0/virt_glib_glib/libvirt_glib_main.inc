{$IFDEF read_interface}


procedure gvir_init(argc: Plongint; argv: PPPchar); cdecl; external libvirtglib;
function gvir_init_check(argc: Plongint; argv: PPPchar; err: PPGError): Tgboolean; cdecl; external libvirtglib;

// === Konventiert am: 18-10-26 17:33:06 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
