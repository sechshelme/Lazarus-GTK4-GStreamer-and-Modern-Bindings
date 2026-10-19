{$IFDEF read_interface}


procedure gvir_init_object(argc: Plongint; argv: PPPchar); cdecl; external libvirtgobject;
function gvir_init_object_check(argc: Plongint; argv: PPPchar; err: PPGError): Tgboolean; cdecl; external libvirtgobject;

// === Konventiert am: 18-10-26 19:32:54 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
