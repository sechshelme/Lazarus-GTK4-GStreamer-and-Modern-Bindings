{$IFDEF read_interface}


function gvir_error_new(domain: TGQuark; code: Tgint; format: Pgchar): PGError; cdecl; varargs; external libvirtglib;
function gvir_error_new_literal(domain: TGQuark; code: Tgint; message: Pgchar): PGError; cdecl; external libvirtglib;
function gvir_error_new_valist(domain: TGQuark; code: Tgint; format: Pgchar; args: Tva_list): PGError; cdecl; external libvirtglib;
procedure gvir_set_error(error: PPGError; domain: TGQuark; code: Tgint; format: Pgchar); cdecl; varargs; external libvirtglib;
procedure gvir_set_error_literal(error: PPGError; domain: TGQuark; code: Tgint; message: Pgchar); cdecl; external libvirtglib;
procedure gvir_set_error_valist(error: PPGError; domain: TGQuark; code: Tgint; format: Pgchar; args: Tva_list); cdecl; external libvirtglib;
procedure gvir_critical(format: Pgchar); cdecl; varargs; external libvirtglib;
procedure gvir_warning(format: Pgchar); cdecl; varargs; external libvirtglib;

// === Konventiert am: 18-10-26 17:33:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
