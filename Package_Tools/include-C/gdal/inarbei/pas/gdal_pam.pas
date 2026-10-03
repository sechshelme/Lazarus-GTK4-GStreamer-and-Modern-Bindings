unit gdal_pam;

interface

uses
  fp_gdal;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


var
  GDALPamRasterBand: Tclass; cvar; public;

const
  GCIF_GEOTRANSFORM = $01;
  GCIF_PROJECTION = $02;
  GCIF_METADATA = $04;
  GCIF_GCPS = $08;
  GCIF_NODATA = $001000;
  GCIF_CATEGORYNAMES = $002000;
  GCIF_MINMAX = $004000;
  GCIF_SCALEOFFSET = $008000;
  GCIF_UNITTYPE = $010000;
  GCIF_COLORTABLE = $020000;
  GCIF_COLORINTERP = $020000;
  GCIF_BAND_METADATA = $040000;
  GCIF_RAT = $080000;
  GCIF_MASK = $100000;
  GCIF_BAND_DESCRIPTION = $200000;
  GCIF_ONLY_IF_MISSING = $10000000;
  GCIF_PROCESS_BANDS = $20000000;
  GCIF_PAM_DEFAULT = GCIF_GEOTRANSFORM or GCIF_PROJECTION or GCIF_METADATA or
    GCIF_GCPS or GCIF_NODATA or GCIF_CATEGORYNAMES or GCIF_MINMAX or
    GCIF_SCALEOFFSET or GCIF_UNITTYPE or GCIF_COLORTABLE or GCIF_COLORINTERP or
    GCIF_BAND_METADATA or GCIF_RAT or GCIF_MASK or GCIF_ONLY_IF_MISSING or
    GCIF_PROCESS_BANDS or GCIF_BAND_DESCRIPTION;

  GPF_DIRTY = $01;
  GPF_TRIED_READ_FAILED = $02;
  GPF_DISABLED = $04;
  GPF_AUXMODE = $08;
  GPF_NOSAVE = $10;

function PamGetProxy(para1: pchar): pchar; cdecl; external libgdal;
function PamAllocateProxy(para1: pchar): pchar; cdecl; external libgdal;
function PamDeallocateProxy(para1: pchar): pchar; cdecl; external libgdal;
procedure PamCleanProxyDB; cdecl; external libgdal;

// === Konventiert am: 2-10-26 16:42:11 ===


implementation



end.
