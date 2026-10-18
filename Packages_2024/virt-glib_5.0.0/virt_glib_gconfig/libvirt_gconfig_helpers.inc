{$IFDEF read_interface}


function gvir_config_object_error_quark: TGQuark; cdecl; external libvirtgconfig;

function GVIR_CONFIG_OBJECT_ERROR: TGQuark;


// === Konventiert am: 18-10-26 12:53:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GVIR_CONFIG_OBJECT_ERROR: TGQuark;
begin
  GVIR_CONFIG_OBJECT_ERROR := gvir_config_object_error_quark;
end;


{$ENDIF read_implementation}
