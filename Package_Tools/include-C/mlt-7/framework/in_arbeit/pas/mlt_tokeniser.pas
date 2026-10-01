unit mlt_tokeniser;

interface

uses
  fp_mlt;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pmlt_tokeniser_t = ^Tmlt_tokeniser_t;
  Tmlt_tokeniser_t = record
    input: pchar;
    tokens: ^pchar;
    count: longint;
    size: longint;
  end;

  Tmlt_tokeniser = Tmlt_tokeniser_t;
  Pmlt_tokeniser = Pmlt_tokeniser_t;

function mlt_tokeniser_init: Tmlt_tokeniser; cdecl; external libmlt;
function mlt_tokeniser_parse_new(tokeniser: Tmlt_tokeniser; text: pchar; delimiter: pchar): longint; cdecl; external libmlt;
function mlt_tokeniser_get_input(tokeniser: Tmlt_tokeniser): pchar; cdecl; external libmlt;
function mlt_tokeniser_count(tokeniser: Tmlt_tokeniser): longint; cdecl; external libmlt;
function mlt_tokeniser_get_string(tokeniser: Tmlt_tokeniser; index: longint): pchar; cdecl; external libmlt;
procedure mlt_tokeniser_close(tokeniser: Tmlt_tokeniser); cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:44:46 ===


implementation



end.
