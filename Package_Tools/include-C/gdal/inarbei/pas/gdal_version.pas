unit gdal_version;

interface

uses
  fp_gdal;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GDAL_VERSION_MAJOR = 3;
  GDAL_VERSION_MINOR = 8;
  GDAL_VERSION_REV = 4;
  GDAL_VERSION_BUILD = 0;

function GDAL_COMPUTE_VERSION(maj, min, rev: longint): longint;
function GDAL_VERSION_NUM: longint;

const
  GDAL_RELEASE_DATE = 20240208;
  GDAL_RELEASE_NAME = '3.8.4';

  // === Konventiert am: 2-10-26 16:42:01 ===


implementation


function GDAL_COMPUTE_VERSION(maj, min, rev: longint): longint;
begin
  GDAL_COMPUTE_VERSION := ((maj * 1000000) + (min * 10000)) + (rev * 100);
end;

function GDAL_VERSION_NUM: longint;
begin
  GDAL_VERSION_NUM := (GDAL_COMPUTE_VERSION(GDAL_VERSION_MAJOR, GDAL_VERSION_MINOR, GDAL_VERSION_REV)) + GDAL_VERSION_BUILD;
end;


end.
