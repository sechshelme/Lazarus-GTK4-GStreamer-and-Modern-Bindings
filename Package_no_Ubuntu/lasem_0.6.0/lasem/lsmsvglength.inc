{$IFDEF read_interface}


type
  TLsmSvgViewbox = record
    resolution_ppi: double;
    viewbox: TLsmBox;
    diagonal: double;
  end;
  PLsmSvgViewbox = ^TLsmSvgViewbox;

function lsm_svg_viewbox_new(resolution_ppi: double; viewbox: PLsmBox): PLsmSvgViewbox; cdecl; external liblasem;
procedure lsm_svg_viewbox_free(viewbox: PLsmSvgViewbox); cdecl; external liblasem;

type
  TLsmSvgLength = record
    value_unit: double;
    _type: TLsmSvgLengthType;
  end;
  PLsmSvgLength = ^TLsmSvgLength;

  TLsmSvgAnimatedLength = record
    base: TLsmSvgLength;
    animated: TLsmSvgLength;
  end;
  PLsmSvgAnimatedLength = ^TLsmSvgAnimatedLength;

function lsm_svg_length_normalize(length: PLsmSvgLength; viewbox: PLsmSvgViewbox; font_size: double; direction: TLsmSvgLengthDirection): double; cdecl; external liblasem;
function lsm_svg_parse_length(str: PPchar; length: PLsmSvgLength): Tgboolean; cdecl; external liblasem;

type
  TLsmSvgLengthList = record
    n_lengths: dword;
    lengths: PLsmSvgLength;
  end;
  PLsmSvgLengthList = ^TLsmSvgLengthList;

  // === Konventiert am: 3-3-26 17:05:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
