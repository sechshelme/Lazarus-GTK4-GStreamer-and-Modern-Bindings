{$IFDEF read_interface}


type
  PVncColorMapEntry = ^TVncColorMapEntry;
  TVncColorMapEntry = record
    red: Tguint16;
    green: Tguint16;
    blue: Tguint16;
  end;

  PVncColorMap = ^TVncColorMap;
  TVncColorMap = record
    offset: Tguint16;
    size: Tguint16;
    colors: PVncColorMapEntry;
  end;

function vnc_color_map_get_type: TGType; cdecl; external libgvnc;
function vnc_color_map_new(offset: Tguint16; size: Tguint16): PVncColorMap; cdecl; external libgvnc;
function vnc_color_map_copy(map: PVncColorMap): PVncColorMap; cdecl; external libgvnc;
procedure vnc_color_map_free(map: PVncColorMap); cdecl; external libgvnc;
function vnc_color_map_set(map: PVncColorMap; idx: Tguint16; red: Tguint16; green: Tguint16; blue: Tguint16): Tgboolean; cdecl; external libgvnc;
function vnc_color_map_lookup(map: PVncColorMap; idx: Tguint16; red: Pguint16; green: Pguint16; blue: Pguint16): Tgboolean; cdecl; external libgvnc;

// === Konventiert am: 20-10-26 19:51:02 ===

function VNC_TYPE_COLOR_MAP: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function VNC_TYPE_COLOR_MAP: TGType;
begin
  VNC_TYPE_COLOR_MAP := vnc_color_map_get_type;
end;



{$ENDIF read_implementation}
