unit gdal_utils;

interface

uses
  fp_gdal;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*****************************************************************************
 * $Id$
 *
 * Project:  GDAL Utilities
 * Purpose:  GDAL Utilities Public Declarations.
 * Author:   Faza Mahamood, fazamhd at gmail dot com
 *
 * ****************************************************************************
 * Copyright (c) 1998, Frank Warmerdam
 * Copyright (c) 2007-2015, Even Rouault <even.rouault at spatialys.com>
 * Copyright (c) 2015, Faza Mahamood
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *************************************************************************** }
{$ifndef GDAL_UTILS_H_INCLUDED}
{$define GDAL_UTILS_H_INCLUDED}
{*
 * \file gdal_utils.h
 *
 * Public (C callable) GDAL Utilities entry points.
 *
 * @since GDAL 2.1
  }
{$include "cpl_port.h"}
{$include "gdal.h"}
{! Options for GDALInfo(). Opaque type  }
type
{* Opaque type  }

function GDALInfoOptionsNew(papszArgv:PPchar; psOptionsForBinary:PGDALInfoOptionsForBinary):PGDALInfoOptions;cdecl;external libgdal;
procedure GDALInfoOptionsFree(psOptions:PGDALInfoOptions);cdecl;external libgdal;
function GDALInfo(hDataset:TGDALDatasetH; psOptions:PGDALInfoOptions):Pchar;cdecl;external libgdal;
{! Options for GDALTranslate(). Opaque type  }
type
{* Opaque type  }

function GDALTranslateOptionsNew(papszArgv:PPchar; psOptionsForBinary:PGDALTranslateOptionsForBinary):PGDALTranslateOptions;cdecl;external libgdal;
procedure GDALTranslateOptionsFree(psOptions:PGDALTranslateOptions);cdecl;external libgdal;
procedure GDALTranslateOptionsSetProgress(psOptions:PGDALTranslateOptions; pfnProgress:TGDALProgressFunc; pProgressData:pointer);cdecl;external libgdal;
function GDALTranslate(pszDestFilename:Pchar; hSrcDataset:TGDALDatasetH; psOptions:PGDALTranslateOptions; pbUsageError:Plongint):TGDALDatasetH;cdecl;external libgdal;
{! Options for GDALWarp(). Opaque type  }
type
{* Opaque type  }

function GDALWarpAppOptionsNew(papszArgv:PPchar; psOptionsForBinary:PGDALWarpAppOptionsForBinary):PGDALWarpAppOptions;cdecl;external libgdal;
procedure GDALWarpAppOptionsFree(psOptions:PGDALWarpAppOptions);cdecl;external libgdal;
procedure GDALWarpAppOptionsSetProgress(psOptions:PGDALWarpAppOptions; pfnProgress:TGDALProgressFunc; pProgressData:pointer);cdecl;external libgdal;
procedure GDALWarpAppOptionsSetQuiet(psOptions:PGDALWarpAppOptions; bQuiet:longint);cdecl;external libgdal;
procedure GDALWarpAppOptionsSetWarpOption(psOptions:PGDALWarpAppOptions; pszKey:Pchar; pszValue:Pchar);cdecl;external libgdal;
function GDALWarp(pszDest:Pchar; hDstDS:TGDALDatasetH; nSrcCount:longint; pahSrcDS:PGDALDatasetH; psOptions:PGDALWarpAppOptions; 
           pbUsageError:Plongint):TGDALDatasetH;cdecl;external libgdal;
{! Options for GDALVectorTranslate(). Opaque type  }
type
{* Opaque type  }

function GDALVectorTranslateOptionsNew(papszArgv:PPchar; psOptionsForBinary:PGDALVectorTranslateOptionsForBinary):PGDALVectorTranslateOptions;cdecl;external libgdal;
procedure GDALVectorTranslateOptionsFree(psOptions:PGDALVectorTranslateOptions);cdecl;external libgdal;
procedure GDALVectorTranslateOptionsSetProgress(psOptions:PGDALVectorTranslateOptions; pfnProgress:TGDALProgressFunc; pProgressData:pointer);cdecl;external libgdal;
function GDALVectorTranslate(pszDest:Pchar; hDstDS:TGDALDatasetH; nSrcCount:longint; pahSrcDS:PGDALDatasetH; psOptions:PGDALVectorTranslateOptions; 
           pbUsageError:Plongint):TGDALDatasetH;cdecl;external libgdal;
{! Options for GDALDEMProcessing(). Opaque type  }
type
{* Opaque type  }

function GDALDEMProcessingOptionsNew(papszArgv:PPchar; psOptionsForBinary:PGDALDEMProcessingOptionsForBinary):PGDALDEMProcessingOptions;cdecl;external libgdal;
procedure GDALDEMProcessingOptionsFree(psOptions:PGDALDEMProcessingOptions);cdecl;external libgdal;
procedure GDALDEMProcessingOptionsSetProgress(psOptions:PGDALDEMProcessingOptions; pfnProgress:TGDALProgressFunc; pProgressData:pointer);cdecl;external libgdal;
function GDALDEMProcessing(pszDestFilename:Pchar; hSrcDataset:TGDALDatasetH; pszProcessing:Pchar; pszColorFilename:Pchar; psOptions:PGDALDEMProcessingOptions; 
           pbUsageError:Plongint):TGDALDatasetH;cdecl;external libgdal;
{! Options for GDALNearblack(). Opaque type  }
type
{* Opaque type  }

function GDALNearblackOptionsNew(papszArgv:PPchar; psOptionsForBinary:PGDALNearblackOptionsForBinary):PGDALNearblackOptions;cdecl;external libgdal;
procedure GDALNearblackOptionsFree(psOptions:PGDALNearblackOptions);cdecl;external libgdal;
procedure GDALNearblackOptionsSetProgress(psOptions:PGDALNearblackOptions; pfnProgress:TGDALProgressFunc; pProgressData:pointer);cdecl;external libgdal;
function GDALNearblack(pszDest:Pchar; hDstDS:TGDALDatasetH; hSrcDS:TGDALDatasetH; psOptions:PGDALNearblackOptions; pbUsageError:Plongint):TGDALDatasetH;cdecl;external libgdal;
{! Options for GDALGrid(). Opaque type  }
type
{* Opaque type  }

function GDALGridOptionsNew(papszArgv:PPchar; psOptionsForBinary:PGDALGridOptionsForBinary):PGDALGridOptions;cdecl;external libgdal;
procedure GDALGridOptionsFree(psOptions:PGDALGridOptions);cdecl;external libgdal;
procedure GDALGridOptionsSetProgress(psOptions:PGDALGridOptions; pfnProgress:TGDALProgressFunc; pProgressData:pointer);cdecl;external libgdal;
function GDALGrid(pszDest:Pchar; hSrcDS:TGDALDatasetH; psOptions:PGDALGridOptions; pbUsageError:Plongint):TGDALDatasetH;cdecl;external libgdal;
{! Options for GDALRasterize(). Opaque type  }
type
{* Opaque type  }

function GDALRasterizeOptionsNew(papszArgv:PPchar; psOptionsForBinary:PGDALRasterizeOptionsForBinary):PGDALRasterizeOptions;cdecl;external libgdal;
procedure GDALRasterizeOptionsFree(psOptions:PGDALRasterizeOptions);cdecl;external libgdal;
procedure GDALRasterizeOptionsSetProgress(psOptions:PGDALRasterizeOptions; pfnProgress:TGDALProgressFunc; pProgressData:pointer);cdecl;external libgdal;
function GDALRasterize(pszDest:Pchar; hDstDS:TGDALDatasetH; hSrcDS:TGDALDatasetH; psOptions:PGDALRasterizeOptions; pbUsageError:Plongint):TGDALDatasetH;cdecl;external libgdal;
{! Options for GDALFootprint(). Opaque type  }
type
{* Opaque type  }

function GDALFootprintOptionsNew(papszArgv:PPchar; psOptionsForBinary:PGDALFootprintOptionsForBinary):PGDALFootprintOptions;cdecl;external libgdal;
procedure GDALFootprintOptionsFree(psOptions:PGDALFootprintOptions);cdecl;external libgdal;
procedure GDALFootprintOptionsSetProgress(psOptions:PGDALFootprintOptions; pfnProgress:TGDALProgressFunc; pProgressData:pointer);cdecl;external libgdal;
function GDALFootprint(pszDest:Pchar; hDstDS:TGDALDatasetH; hSrcDS:TGDALDatasetH; psOptions:PGDALFootprintOptions; pbUsageError:Plongint):TGDALDatasetH;cdecl;external libgdal;
{! Options for GDALBuildVRT(). Opaque type  }
type
{* Opaque type  }

function GDALBuildVRTOptionsNew(papszArgv:PPchar; psOptionsForBinary:PGDALBuildVRTOptionsForBinary):PGDALBuildVRTOptions;cdecl;external libgdal;
procedure GDALBuildVRTOptionsFree(psOptions:PGDALBuildVRTOptions);cdecl;external libgdal;
procedure GDALBuildVRTOptionsSetProgress(psOptions:PGDALBuildVRTOptions; pfnProgress:TGDALProgressFunc; pProgressData:pointer);cdecl;external libgdal;
function GDALBuildVRT(pszDest:Pchar; nSrcCount:longint; pahSrcDS:PGDALDatasetH; papszSrcDSNames:PPchar; psOptions:PGDALBuildVRTOptions; 
           pbUsageError:Plongint):TGDALDatasetH;cdecl;external libgdal;
{! Options for GDALMultiDimInfo(). Opaque type  }
type
{* Opaque type  }

function GDALMultiDimInfoOptionsNew(papszArgv:PPchar; psOptionsForBinary:PGDALMultiDimInfoOptionsForBinary):PGDALMultiDimInfoOptions;cdecl;external libgdal;
procedure GDALMultiDimInfoOptionsFree(psOptions:PGDALMultiDimInfoOptions);cdecl;external libgdal;
function GDALMultiDimInfo(hDataset:TGDALDatasetH; psOptions:PGDALMultiDimInfoOptions):Pchar;cdecl;external libgdal;
{! Options for GDALMultiDimTranslate(). Opaque type  }
type
{* Opaque type  }

function GDALMultiDimTranslateOptionsNew(papszArgv:PPchar; psOptionsForBinary:PGDALMultiDimTranslateOptionsForBinary):PGDALMultiDimTranslateOptions;cdecl;external libgdal;
procedure GDALMultiDimTranslateOptionsFree(psOptions:PGDALMultiDimTranslateOptions);cdecl;external libgdal;
procedure GDALMultiDimTranslateOptionsSetProgress(psOptions:PGDALMultiDimTranslateOptions; pfnProgress:TGDALProgressFunc; pProgressData:pointer);cdecl;external libgdal;
function GDALMultiDimTranslate(pszDest:Pchar; hDstDataset:TGDALDatasetH; nSrcCount:longint; pahSrcDS:PGDALDatasetH; psOptions:PGDALMultiDimTranslateOptions; 
           pbUsageError:Plongint):TGDALDatasetH;cdecl;external libgdal;
{! Options for GDALVectorInfo(). Opaque type  }
type
{* Opaque type  }

function GDALVectorInfoOptionsNew(papszArgv:PPchar; psOptionsForBinary:PGDALVectorInfoOptionsForBinary):PGDALVectorInfoOptions;cdecl;external libgdal;
procedure GDALVectorInfoOptionsFree(psOptions:PGDALVectorInfoOptions);cdecl;external libgdal;
function GDALVectorInfo(hDataset:TGDALDatasetH; psOptions:PGDALVectorInfoOptions):Pchar;cdecl;external libgdal;
{$endif}
{ GDAL_UTILS_H_INCLUDED  }

// === Konventiert am: 2-10-26 16:42:04 ===


implementation



end.
