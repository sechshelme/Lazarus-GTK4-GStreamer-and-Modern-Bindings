{$IFDEF read_interface}


type
  TLsmMathmlBbox = record
    width: double;
    height: double;
    depth: double;
    is_defined: Tgboolean;
  end;
  PLsmMathmlBbox = ^TLsmMathmlBbox;

  TLsmMathmlPadding = record
    left: double;
    right: double;
    top: double;
    bottom: double;
  end;
  PLsmMathmlPadding = ^TLsmMathmlPadding;

var
  lsm_mathml_bbox_null : TLsmMathmlBbox;cvar;external liblasem;

procedure lsm_mathml_bbox_add_horizontally(bbox: PLsmMathmlBbox; new_bbox: PLsmMathmlBbox); cdecl; external liblasem;
procedure lsm_mathml_bbox_add_over(self: PLsmMathmlBbox; bbox: PLsmMathmlBbox); cdecl; external liblasem;
procedure lsm_mathml_bbox_add_under(self: PLsmMathmlBbox; bbox: PLsmMathmlBbox); cdecl; external liblasem;
procedure lsm_mathml_bbox_merge_vertically(self: PLsmMathmlBbox; bbox: PLsmMathmlBbox; offset: double); cdecl; external liblasem;
procedure lsm_mathml_bbox_stretch(self: PLsmMathmlBbox; bbox: PLsmMathmlBbox); cdecl; external liblasem;
procedure lsm_mathml_bbox_stretch_vertically(self: PLsmMathmlBbox; bbox: PLsmMathmlBbox); cdecl; external liblasem;
procedure lsm_mathml_bbox_stretch_horizontally(self: PLsmMathmlBbox; bbox: PLsmMathmlBbox); cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:53:46 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
