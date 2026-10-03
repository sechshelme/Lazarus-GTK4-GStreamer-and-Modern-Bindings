unit gdal_csv;

interface

uses
  fp_gdal;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function GDALDefaultCSVFilename(pszBasename: pchar): pchar; cdecl; external libgdal;

// === Konventiert am: 2-10-26 16:37:55 ===


implementation



end.
