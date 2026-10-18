{$IFDEF read_interface}


procedure gvir_config_init(argc: Plongint; argv: PPPchar); cdecl; external libvirtgconfig;
function gvir_config_init_check(argc: Plongint; argv: PPPchar; err: PPGError): Tgboolean; cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:53:35 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
