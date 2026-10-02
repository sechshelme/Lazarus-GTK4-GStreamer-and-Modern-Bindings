unit cpl_progress;

interface

uses
  fp_gdal;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGDALProgressFunc = function(dfComplete: double; pszMessage: pchar; pProgressArg: pointer): longint; cdecl;

function GDALDummyProgress(para1: double; para2: pchar; para3: pointer): longint; cdecl; external libgdal;
function GDALTermProgress(para1: double; para2: pchar; para3: pointer): longint; cdecl; external libgdal;
function GDALScaledProgress(para1: double; para2: pchar; para3: pointer): longint; cdecl; external libgdal;
function GDALCreateScaledProgress(para1: double; para2: double; para3: TGDALProgressFunc; para4: pointer): pointer; cdecl; external libgdal;
procedure GDALDestroyScaledProgress(para1: pointer); cdecl; external libgdal;

// === Konventiert am: 2-10-26 16:33:03 ===


implementation



end.
