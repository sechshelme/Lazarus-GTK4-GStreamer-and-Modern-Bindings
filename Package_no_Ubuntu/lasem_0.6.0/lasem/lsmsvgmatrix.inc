{$IFDEF read_interface}


type
  PLsmSvgMatrixFlags = ^TLsmSvgMatrixFlags;
  TLsmSvgMatrixFlags = longint;

const
  LSM_SVG_MATRIX_FLAGS_IDENTITY = 1 shl 0;

type
  TLsmSvgMatrix = record
    a: double;
    b: double;
    c: double;
    d: double;
    e: double;
    f: double;
    flags: TLsmSvgMatrixFlags;
  end;
  PLsmSvgMatrix = ^TLsmSvgMatrix;

function lsm_svg_matrix_is_identity(matrix: PLsmSvgMatrix): Tgboolean; cdecl; external liblasem;
function lsm_svg_matrix_is_invertible(matrix: PLsmSvgMatrix): Tgboolean; cdecl; external liblasem;
procedure lsm_svg_matrix_init(matrix: PLsmSvgMatrix; a: double; b: double; c: double; d: double;
  e: double; f: double); cdecl; external liblasem;
procedure lsm_svg_matrix_init_identity(matrix: PLsmSvgMatrix); cdecl; external liblasem;
procedure lsm_svg_matrix_init_scale(matrix: PLsmSvgMatrix; sx: double; sy: double); cdecl; external liblasem;
procedure lsm_svg_matrix_scale(matrix: PLsmSvgMatrix; sx: double; sy: double); cdecl; external liblasem;
procedure lsm_svg_matrix_init_translate(matrix: PLsmSvgMatrix; tx: double; ty: double); cdecl; external liblasem;
procedure lsm_svg_matrix_translate(matrix: PLsmSvgMatrix; tx: double; ty: double); cdecl; external liblasem;
procedure lsm_svg_matrix_init_rotate(matrix: PLsmSvgMatrix; radians: double); cdecl; external liblasem;
procedure lsm_svg_matrix_rotate(matrix: PLsmSvgMatrix; radians: double); cdecl; external liblasem;
procedure lsm_svg_matrix_init_skew_x(matrix: PLsmSvgMatrix; radians: double); cdecl; external liblasem;
procedure lsm_svg_matrix_skew_x(matrix: PLsmSvgMatrix; radians: double); cdecl; external liblasem;
procedure lsm_svg_matrix_init_skew_y(matrix: PLsmSvgMatrix; radians: double); cdecl; external liblasem;
procedure lsm_svg_matrix_skew_y(matrix: PLsmSvgMatrix; radians: double); cdecl; external liblasem;
procedure lsm_svg_matrix_multiply(result: PLsmSvgMatrix; a: PLsmSvgMatrix; b: PLsmSvgMatrix); cdecl; external liblasem;
procedure lsm_svg_matrix_transform_point(matrix: PLsmSvgMatrix; x: Pdouble; y: Pdouble); cdecl; external liblasem;
procedure lsm_svg_matrix_transform_bounding_box(matrix: PLsmSvgMatrix; x1: Pdouble; y1: Pdouble; x2: Pdouble; y2: Pdouble); cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:05:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
