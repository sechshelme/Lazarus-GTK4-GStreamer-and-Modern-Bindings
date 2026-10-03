unit gdalwarper;

interface

uses
  fp_gdal, cpl_port, gdal, cpl_error, cpl_progress, gdal_alg, cpl_minixml;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGDALResampleAlg = ^TGDALResampleAlg;
  TGDALResampleAlg = longint;
const
  GRA_NearestNeighbour = 0;
  GRA_Bilinear = 1;
  GRA_Cubic = 2;
  GRA_CubicSpline = 3;
  GRA_Lanczos = 4;
  GRA_Average = 5;
  GRA_Mode = 6;
  GRA_Max = 8;
  GRA_Min = 9;
  GRA_Med = 10;
  GRA_Q1 = 11;
  GRA_Q3 = 12;
  GRA_Sum = 13;
  GRA_RMS = 14;
  GRA_LAST_VALUE = GRA_RMS;

type
  PGWKAverageOrModeAlg = ^TGWKAverageOrModeAlg;
  TGWKAverageOrModeAlg = longint;
const
  GWKAOM_Average = 1;
  GWKAOM_Fmode = 2;
  GWKAOM_Imode = 3;
  GWKAOM_Max = 4;
  GWKAOM_Min = 5;
  GWKAOM_Quant = 6;
  GWKAOM_Sum = 7;
  GWKAOM_RMS = 8;

type
  PGDALMaskFunc = ^TGDALMaskFunc;
  TGDALMaskFunc = function(pMaskFuncArg: pointer; nBandCount: longint; eType: TGDALDataType; nXOff: longint; nYOff: longint;
    nXSize: longint; nYSize: longint; papabyImageData: PPGByte; bMaskIsFloat: longint; pMask: pointer): longint; cdecl;

function GDALWarpNoDataMasker(pMaskFuncArg: pointer; nBandCount: longint; eType: TGDALDataType; nXOff: longint; nYOff: longint;
  nXSize: longint; nYSize: longint; papabyImageData: PPGByte; bMaskIsFloat: longint; pValidityMask: pointer;
  pbOutAllValid: Plongint): TCPLErr; cdecl; external libgdal;
function GDALWarpDstAlphaMasker(pMaskFuncArg: pointer; nBandCount: longint; eType: TGDALDataType; nXOff: longint; nYOff: longint;
  nXSize: longint; nYSize: longint; para8: PPGByte; bMaskIsFloat: longint; pValidityMask: pointer): TCPLErr; cdecl; external libgdal;
function GDALWarpSrcAlphaMasker(pMaskFuncArg: pointer; nBandCount: longint; eType: TGDALDataType; nXOff: longint; nYOff: longint;
  nXSize: longint; nYSize: longint; para8: PPGByte; bMaskIsFloat: longint; pValidityMask: pointer;
  pbOutAllOpaque: Plongint): TCPLErr; cdecl; external libgdal;
function GDALWarpSrcMaskMasker(pMaskFuncArg: pointer; nBandCount: longint; eType: TGDALDataType; nXOff: longint; nYOff: longint;
  nXSize: longint; nYSize: longint; para8: PPGByte; bMaskIsFloat: longint; pValidityMask: pointer): TCPLErr; cdecl; external libgdal;
function GDALWarpCutlineMasker(pMaskFuncArg: pointer; nBandCount: longint; eType: TGDALDataType; nXOff: longint; nYOff: longint;
  nXSize: longint; nYSize: longint; para8: PPGByte; bMaskIsFloat: longint; pValidityMask: pointer): TCPLErr; cdecl; external libgdal;

const
  GCMVF_PARTIAL_INTERSECTION = 0;
  GCMVF_NO_INTERSECTION = 1;
  GCMVF_CHUNK_FULLY_WITHIN_CUTLINE = 2;

function GDALWarpCutlineMaskerEx(pMaskFuncArg: pointer; nBandCount: longint; eType: TGDALDataType; nXOff: longint; nYOff: longint;
  nXSize: longint; nYSize: longint; para8: PPGByte; bMaskIsFloat: longint; pValidityMask: pointer;
  pnValidityFlag: Plongint): TCPLErr; cdecl; external libgdal;

type
  PGDALWarpOptions = ^TGDALWarpOptions;
  TGDALWarpOptions = record
    papszWarpOptions: ^pchar;
    dfWarpMemoryLimit: double;
    eResampleAlg: TGDALResampleAlg;
    eWorkingDataType: TGDALDataType;
    hSrcDS: TGDALDatasetH;
    hDstDS: TGDALDatasetH;
    nBandCount: longint;
    panSrcBands: Plongint;
    panDstBands: Plongint;
    nSrcAlphaBand: longint;
    nDstAlphaBand: longint;
    padfSrcNoDataReal: Pdouble;
    padfSrcNoDataImag: Pdouble;
    padfDstNoDataReal: Pdouble;
    padfDstNoDataImag: Pdouble;
    pfnProgress: TGDALProgressFunc;
    pProgressArg: pointer;
    pfnTransformer: TGDALTransformerFunc;
    pTransformerArg: pointer;
    papfnSrcPerBandValidityMaskFunc: PGDALMaskFunc;
    papSrcPerBandValidityMaskFuncArg: ^pointer;
    pfnSrcValidityMaskFunc: TGDALMaskFunc;
    pSrcValidityMaskFuncArg: pointer;
    pfnSrcDensityMaskFunc: TGDALMaskFunc;
    pSrcDensityMaskFuncArg: pointer;
    pfnDstDensityMaskFunc: TGDALMaskFunc;
    pDstDensityMaskFuncArg: pointer;
    pfnDstValidityMaskFunc: TGDALMaskFunc;
    pDstValidityMaskFuncArg: pointer;
    pfnPreWarpChunkProcessor: function(pKern: pointer; pArg: pointer): TCPLErr; cdecl;
    pPreWarpProcessorArg: pointer;
    pfnPostWarpChunkProcessor: function(pKern: pointer; pArg: pointer): TCPLErr; cdecl;
    pPostWarpProcessorArg: pointer;
    hCutline: pointer;
    dfCutlineBlendDist: double;
  end;

function GDALCreateWarpOptions: PGDALWarpOptions; cdecl; external libgdal;
procedure GDALDestroyWarpOptions(para1: PGDALWarpOptions); cdecl; external libgdal;
function GDALCloneWarpOptions(para1: PGDALWarpOptions): PGDALWarpOptions; cdecl; external libgdal;
procedure GDALWarpInitDstNoDataReal(para1: PGDALWarpOptions; dNoDataReal: double); cdecl; external libgdal;
procedure GDALWarpInitSrcNoDataReal(para1: PGDALWarpOptions; dNoDataReal: double); cdecl; external libgdal;
procedure GDALWarpInitNoDataReal(para1: PGDALWarpOptions; dNoDataReal: double); cdecl; external libgdal;
procedure GDALWarpInitDstNoDataImag(para1: PGDALWarpOptions; dNoDataImag: double); cdecl; external libgdal;
procedure GDALWarpInitSrcNoDataImag(para1: PGDALWarpOptions; dNoDataImag: double); cdecl; external libgdal;
procedure GDALWarpResolveWorkingDataType(para1: PGDALWarpOptions); cdecl; external libgdal;
procedure GDALWarpInitDefaultBandMapping(para1: PGDALWarpOptions; nBandCount: longint); cdecl; external libgdal;
function GDALSerializeWarpOptions(para1: PGDALWarpOptions): PCPLXMLNode; cdecl; external libgdal;
function GDALDeserializeWarpOptions(para1: PCPLXMLNode): PGDALWarpOptions; cdecl; external libgdal;

function GDALReprojectImage(hSrcDS: TGDALDatasetH; pszSrcWKT: pchar; hDstDS: TGDALDatasetH; pszDstWKT: pchar; eResampleAlg: TGDALResampleAlg;
  dfWarpMemoryLimit: double; dfMaxError: double; pfnProgress: TGDALProgressFunc; pProgressArg: pointer; psOptions: PGDALWarpOptions): TCPLErr; cdecl; external libgdal;
function GDALCreateAndReprojectImage(hSrcDS: TGDALDatasetH; pszSrcWKT: pchar; pszDstFilename: pchar; pszDstWKT: pchar; hDstDriver: TGDALDriverH;
  papszCreateOptions: PPchar; eResampleAlg: TGDALResampleAlg; dfWarpMemoryLimit: double; dfMaxError: double; pfnProgress: TGDALProgressFunc;
  pProgressArg: pointer; psOptions: PGDALWarpOptions): TCPLErr; cdecl; external libgdal;

function GDALAutoCreateWarpedVRT(hSrcDS: TGDALDatasetH; pszSrcWKT: pchar; pszDstWKT: pchar; eResampleAlg: TGDALResampleAlg; dfMaxError: double;
  psOptions: PGDALWarpOptions): TGDALDatasetH; cdecl; external libgdal;
function GDALAutoCreateWarpedVRTEx(hSrcDS: TGDALDatasetH; pszSrcWKT: pchar; pszDstWKT: pchar; eResampleAlg: TGDALResampleAlg; dfMaxError: double;
  psOptions: PGDALWarpOptions; papszTransformerOptions: TCSLConstList): TGDALDatasetH; cdecl; external libgdal;
function GDALCreateWarpedVRT(hSrcDS: TGDALDatasetH; nPixels: longint; nLines: longint; padfGeoTransform: Pdouble; psOptions: PGDALWarpOptions): TGDALDatasetH; cdecl; external libgdal;
function GDALInitializeWarpedVRT(hDS: TGDALDatasetH; psWO: PGDALWarpOptions): TCPLErr; cdecl; external libgdal;

const
  WARP_EXTRA_ELTS = 1;

function GWKThreadsCreate(papszWarpOptions: PPchar; pfnTransformer: TGDALTransformerFunc; pTransformerArg: pointer): pointer; cdecl; external libgdal;
procedure GWKThreadsEnd(psThreadDataIn: pointer); cdecl; external libgdal;

type
  PGDALWarpOperationH = ^TGDALWarpOperationH;
  TGDALWarpOperationH = pointer;

function GDALCreateWarpOperation(para1: PGDALWarpOptions): TGDALWarpOperationH; cdecl; external libgdal;
procedure GDALDestroyWarpOperation(para1: TGDALWarpOperationH); cdecl; external libgdal;
function GDALChunkAndWarpImage(para1: TGDALWarpOperationH; para2: longint; para3: longint; para4: longint; para5: longint): TCPLErr; cdecl; external libgdal;
function GDALChunkAndWarpMulti(para1: TGDALWarpOperationH; para2: longint; para3: longint; para4: longint; para5: longint): TCPLErr; cdecl; external libgdal;
function GDALWarpRegion(para1: TGDALWarpOperationH; para2: longint; para3: longint; para4: longint; para5: longint;
  para6: longint; para7: longint; para8: longint; para9: longint): TCPLErr; cdecl; external libgdal;
function GDALWarpRegionToBuffer(para1: TGDALWarpOperationH; para2: longint; para3: longint; para4: longint; para5: longint;
  para6: pointer; para7: TGDALDataType; para8: longint; para9: longint; para10: longint;
  para11: longint): TCPLErr; cdecl; external libgdal;

function GWKGetFilterRadius(eResampleAlg: TGDALResampleAlg): longint; cdecl; external libgdal;

type
  TFilterFuncType = function(dfX: double): double; cdecl;

function GWKGetFilterFunc(eResampleAlg: TGDALResampleAlg): TFilterFuncType; cdecl; external libgdal;

type
  TFilterFunc4ValuesType = function(padfVals: Pdouble): double; cdecl;

function GWKGetFilterFunc4Values(eResampleAlg: TGDALResampleAlg): TFilterFunc4ValuesType; cdecl; external libgdal;

// === Konventiert am: 2-10-26 16:54:31 ===


implementation



end.
