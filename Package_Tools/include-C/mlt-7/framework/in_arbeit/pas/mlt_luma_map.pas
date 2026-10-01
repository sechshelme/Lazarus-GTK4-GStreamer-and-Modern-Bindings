unit mlt_luma_map;

interface

uses
  fp_mlt;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pmlt_luma_map_s = ^Tmlt_luma_map_s;
  Tmlt_luma_map_s = record
    _type: longint;
    w: longint;
    h: longint;
    bands: longint;
    rband: longint;
    vmirror: longint;
    hmirror: longint;
    dmirror: longint;
    invert: longint;
    offset: longint;
    flip: longint;
    flop: longint;
    pflip: longint;
    pflop: longint;
    quart: longint;
    rotate: longint;
  end;

  Pmlt_luma_map = ^Tmlt_luma_map;
  Tmlt_luma_map = Pmlt_luma_map_s;

procedure mlt_luma_map_init(self: Tmlt_luma_map); cdecl; external libmlt;
function mlt_luma_map_new(path: pchar): Tmlt_luma_map; cdecl; external libmlt;
function mlt_luma_map_render(self: Tmlt_luma_map): Puint16_t; cdecl; external libmlt;
function mlt_luma_map_from_pgm(filename: pchar; map: PPuint16_t; width: Plongint; height: Plongint): longint; cdecl; external libmlt;
procedure mlt_luma_map_from_yuv422(image: Puint8_t; map: PPuint16_t; width: longint; height: longint); cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:36:14 ===


implementation



end.
