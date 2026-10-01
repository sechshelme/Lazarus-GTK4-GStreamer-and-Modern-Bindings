unit mlt_slices;

interface

uses
  fp_mlt;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pmlt_slices_s = type Pointer;

  Tmlt_slices_proc = function(id: longint; idx: longint; jobs: longint; cookie: pointer): longint; cdecl;

function mlt_slices_count_normal: longint; cdecl; external libmlt;
function mlt_slices_count_rr: longint; cdecl; external libmlt;
function mlt_slices_count_fifo: longint; cdecl; external libmlt;
procedure mlt_slices_run_normal(jobs: longint; proc: Tmlt_slices_proc; cookie: pointer); cdecl; external libmlt;
procedure mlt_slices_run_rr(jobs: longint; proc: Tmlt_slices_proc; cookie: pointer); cdecl; external libmlt;
procedure mlt_slices_run_fifo(jobs: longint; proc: Tmlt_slices_proc; cookie: pointer); cdecl; external libmlt;
function mlt_slices_size_slice(jobs: longint; index: longint; input_size: longint; start: Plongint): longint; cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:44:49 ===


implementation



end.
