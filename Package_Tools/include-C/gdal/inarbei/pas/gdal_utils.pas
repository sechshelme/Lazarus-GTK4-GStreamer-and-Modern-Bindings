unit gdal_utils;

interface

uses
  fp_gdal, gdal, cpl_progress;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGDALInfoOptions = type Pointer;
  PGDALInfoOptionsForBinary = type Pointer;

function GDALInfoOptionsNew(papszArgv: PPchar; psOptionsForBinary: PGDALInfoOptionsForBinary): PGDALInfoOptions; cdecl; external libgdal;
procedure GDALInfoOptionsFree(psOptions: PGDALInfoOptions); cdecl; external libgdal;
function GDALInfo(hDataset: TGDALDatasetH; psOptions: PGDALInfoOptions): pchar; cdecl; external libgdal;

type
  PGDALTranslateOptions = type Pointer;
  PGDALTranslateOptionsForBinary = type Pointer;

function GDALTranslateOptionsNew(papszArgv: PPchar; psOptionsForBinary: PGDALTranslateOptionsForBinary): PGDALTranslateOptions; cdecl; external libgdal;
procedure GDALTranslateOptionsFree(psOptions: PGDALTranslateOptions); cdecl; external libgdal;
procedure GDALTranslateOptionsSetProgress(psOptions: PGDALTranslateOptions; pfnProgress: TGDALProgressFunc; pProgressData: pointer); cdecl; external libgdal;
function GDALTranslate(pszDestFilename: pchar; hSrcDataset: TGDALDatasetH; psOptions: PGDALTranslateOptions; pbUsageError: Plongint): TGDALDatasetH; cdecl; external libgdal;
type
  PGDALWarpAppOptions = type Pointer;
  PGDALWarpAppOptionsForBinary = type Pointer;

function GDALWarpAppOptionsNew(papszArgv: PPchar; psOptionsForBinary: PGDALWarpAppOptionsForBinary): PGDALWarpAppOptions; cdecl; external libgdal;
procedure GDALWarpAppOptionsFree(psOptions: PGDALWarpAppOptions); cdecl; external libgdal;
procedure GDALWarpAppOptionsSetProgress(psOptions: PGDALWarpAppOptions; pfnProgress: TGDALProgressFunc; pProgressData: pointer); cdecl; external libgdal;
procedure GDALWarpAppOptionsSetQuiet(psOptions: PGDALWarpAppOptions; bQuiet: longint); cdecl; external libgdal;
procedure GDALWarpAppOptionsSetWarpOption(psOptions: PGDALWarpAppOptions; pszKey: pchar; pszValue: pchar); cdecl; external libgdal;
function GDALWarp(pszDest: pchar; hDstDS: TGDALDatasetH; nSrcCount: longint; pahSrcDS: PGDALDatasetH; psOptions: PGDALWarpAppOptions;
  pbUsageError: Plongint): TGDALDatasetH; cdecl; external libgdal;

type
  PGDALVectorTranslateOptions = type Pointer;
  PGDALVectorTranslateOptionsForBinary = type Pointer;

function GDALVectorTranslateOptionsNew(papszArgv: PPchar; psOptionsForBinary: PGDALVectorTranslateOptionsForBinary): PGDALVectorTranslateOptions; cdecl; external libgdal;
procedure GDALVectorTranslateOptionsFree(psOptions: PGDALVectorTranslateOptions); cdecl; external libgdal;
procedure GDALVectorTranslateOptionsSetProgress(psOptions: PGDALVectorTranslateOptions; pfnProgress: TGDALProgressFunc; pProgressData: pointer); cdecl; external libgdal;
function GDALVectorTranslate(pszDest: pchar; hDstDS: TGDALDatasetH; nSrcCount: longint; pahSrcDS: PGDALDatasetH; psOptions: PGDALVectorTranslateOptions;
  pbUsageError: Plongint): TGDALDatasetH; cdecl; external libgdal;

type
  PGDALDEMProcessingOptions = type Pointer;
  PGDALDEMProcessingOptionsForBinary = type Pointer;

function GDALDEMProcessingOptionsNew(papszArgv: PPchar; psOptionsForBinary: PGDALDEMProcessingOptionsForBinary): PGDALDEMProcessingOptions; cdecl; external libgdal;
procedure GDALDEMProcessingOptionsFree(psOptions: PGDALDEMProcessingOptions); cdecl; external libgdal;
procedure GDALDEMProcessingOptionsSetProgress(psOptions: PGDALDEMProcessingOptions; pfnProgress: TGDALProgressFunc; pProgressData: pointer); cdecl; external libgdal;
function GDALDEMProcessing(pszDestFilename: pchar; hSrcDataset: TGDALDatasetH; pszProcessing: pchar; pszColorFilename: pchar; psOptions: PGDALDEMProcessingOptions;
  pbUsageError: Plongint): TGDALDatasetH; cdecl; external libgdal;

type
  PGDALNearblackOptionsForBinary = type Pointer;
  PGDALNearblackOptions = type Pointer;

function GDALNearblackOptionsNew(papszArgv: PPchar; psOptionsForBinary: PGDALNearblackOptionsForBinary): PGDALNearblackOptions; cdecl; external libgdal;
procedure GDALNearblackOptionsFree(psOptions: PGDALNearblackOptions); cdecl; external libgdal;
procedure GDALNearblackOptionsSetProgress(psOptions: PGDALNearblackOptions; pfnProgress: TGDALProgressFunc; pProgressData: pointer); cdecl; external libgdal;
function GDALNearblack(pszDest: pchar; hDstDS: TGDALDatasetH; hSrcDS: TGDALDatasetH; psOptions: PGDALNearblackOptions; pbUsageError: Plongint): TGDALDatasetH; cdecl; external libgdal;

type
  PGDALGridOptions = type Pointer;
  PGDALGridOptionsForBinary = type Pointer;

function GDALGridOptionsNew(papszArgv: PPchar; psOptionsForBinary: PGDALGridOptionsForBinary): PGDALGridOptions; cdecl; external libgdal;
procedure GDALGridOptionsFree(psOptions: PGDALGridOptions); cdecl; external libgdal;
procedure GDALGridOptionsSetProgress(psOptions: PGDALGridOptions; pfnProgress: TGDALProgressFunc; pProgressData: pointer); cdecl; external libgdal;
function GDALGrid(pszDest: pchar; hSrcDS: TGDALDatasetH; psOptions: PGDALGridOptions; pbUsageError: Plongint): TGDALDatasetH; cdecl; external libgdal;

type
  PGDALRasterizeOptions = type Pointer;
  PGDALRasterizeOptionsForBinary = type Pointer;

function GDALRasterizeOptionsNew(papszArgv: PPchar; psOptionsForBinary: PGDALRasterizeOptionsForBinary): PGDALRasterizeOptions; cdecl; external libgdal;
procedure GDALRasterizeOptionsFree(psOptions: PGDALRasterizeOptions); cdecl; external libgdal;
procedure GDALRasterizeOptionsSetProgress(psOptions: PGDALRasterizeOptions; pfnProgress: TGDALProgressFunc; pProgressData: pointer); cdecl; external libgdal;
function GDALRasterize(pszDest: pchar; hDstDS: TGDALDatasetH; hSrcDS: TGDALDatasetH; psOptions: PGDALRasterizeOptions; pbUsageError: Plongint): TGDALDatasetH; cdecl; external libgdal;

type
  PGDALFootprintOptions = type Pointer;
  PGDALFootprintOptionsForBinary = type Pointer;

function GDALFootprintOptionsNew(papszArgv: PPchar; psOptionsForBinary: PGDALFootprintOptionsForBinary): PGDALFootprintOptions; cdecl; external libgdal;
procedure GDALFootprintOptionsFree(psOptions: PGDALFootprintOptions); cdecl; external libgdal;
procedure GDALFootprintOptionsSetProgress(psOptions: PGDALFootprintOptions; pfnProgress: TGDALProgressFunc; pProgressData: pointer); cdecl; external libgdal;
function GDALFootprint(pszDest: pchar; hDstDS: TGDALDatasetH; hSrcDS: TGDALDatasetH; psOptions: PGDALFootprintOptions; pbUsageError: Plongint): TGDALDatasetH; cdecl; external libgdal;

type
  PGDALBuildVRTOptions = type Pointer;
  PGDALBuildVRTOptionsForBinary = type Pointer;

function GDALBuildVRTOptionsNew(papszArgv: PPchar; psOptionsForBinary: PGDALBuildVRTOptionsForBinary): PGDALBuildVRTOptions; cdecl; external libgdal;
procedure GDALBuildVRTOptionsFree(psOptions: PGDALBuildVRTOptions); cdecl; external libgdal;
procedure GDALBuildVRTOptionsSetProgress(psOptions: PGDALBuildVRTOptions; pfnProgress: TGDALProgressFunc; pProgressData: pointer); cdecl; external libgdal;
function GDALBuildVRT(pszDest: pchar; nSrcCount: longint; pahSrcDS: PGDALDatasetH; papszSrcDSNames: PPchar; psOptions: PGDALBuildVRTOptions;
  pbUsageError: Plongint): TGDALDatasetH; cdecl; external libgdal;

type
  PGDALMultiDimInfoOptions = type Pointer;
  PGDALMultiDimInfoOptionsForBinary = type Pointer;

function GDALMultiDimInfoOptionsNew(papszArgv: PPchar; psOptionsForBinary: PGDALMultiDimInfoOptionsForBinary): PGDALMultiDimInfoOptions; cdecl; external libgdal;
procedure GDALMultiDimInfoOptionsFree(psOptions: PGDALMultiDimInfoOptions); cdecl; external libgdal;
function GDALMultiDimInfo(hDataset: TGDALDatasetH; psOptions: PGDALMultiDimInfoOptions): pchar; cdecl; external libgdal;

type
  PGDALMultiDimTranslateOptions = type Pointer;
  PGDALMultiDimTranslateOptionsForBinary = type Pointer;

function GDALMultiDimTranslateOptionsNew(papszArgv: PPchar; psOptionsForBinary: PGDALMultiDimTranslateOptionsForBinary): PGDALMultiDimTranslateOptions; cdecl; external libgdal;
procedure GDALMultiDimTranslateOptionsFree(psOptions: PGDALMultiDimTranslateOptions); cdecl; external libgdal;
procedure GDALMultiDimTranslateOptionsSetProgress(psOptions: PGDALMultiDimTranslateOptions; pfnProgress: TGDALProgressFunc; pProgressData: pointer); cdecl; external libgdal;
function GDALMultiDimTranslate(pszDest: pchar; hDstDataset: TGDALDatasetH; nSrcCount: longint; pahSrcDS: PGDALDatasetH; psOptions: PGDALMultiDimTranslateOptions;
  pbUsageError: Plongint): TGDALDatasetH; cdecl; external libgdal;

type
  PGDALVectorInfoOptions = type Pointer;
  PGDALVectorInfoOptionsForBinary = type Pointer;

function GDALVectorInfoOptionsNew(papszArgv: PPchar; psOptionsForBinary: PGDALVectorInfoOptionsForBinary): PGDALVectorInfoOptions; cdecl; external libgdal;
procedure GDALVectorInfoOptionsFree(psOptions: PGDALVectorInfoOptions); cdecl; external libgdal;
function GDALVectorInfo(hDataset: TGDALDatasetH; psOptions: PGDALVectorInfoOptions): pchar; cdecl; external libgdal;

// === Konventiert am: 2-10-26 16:42:04 ===


implementation



end.
