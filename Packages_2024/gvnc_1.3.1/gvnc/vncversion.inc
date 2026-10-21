{$IFDEF read_interface}


const
  VNC_MAJOR_VERSION = 1;
  VNC_MINOR_VERSION = 3;
  VNC_MICRO_VERSION = 1;

function VNC_CHECK_VERSION(major, minor, micro: integer): boolean;

// === Konventiert am: 20-10-26 19:49:55 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function VNC_CHECK_VERSION(major, minor, micro: integer): boolean;
begin
  Result :=
    (VNC_MAJOR_VERSION > major) or
    ((VNC_MAJOR_VERSION = major) and (VNC_MINOR_VERSION > minor)) or
    ((VNC_MAJOR_VERSION = major) and (VNC_MINOR_VERSION = minor) and (VNC_MICRO_VERSION >= micro));
end;



{$ENDIF read_implementation}
