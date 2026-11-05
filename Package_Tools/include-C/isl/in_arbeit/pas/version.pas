unit version;

interface

uses
  fp_isl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function isl_version: Pchar; cdecl; external libisl;

// === Konventiert am: 5-11-26 16:55:29 ===


implementation



end.
