
unit gdal_utils;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdal_utils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdal_utils.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PGDALBuildVRTOptions  = ^GDALBuildVRTOptions;
PGDALBuildVRTOptionsForBinary  = ^GDALBuildVRTOptionsForBinary;
PGDALDatasetH  = ^GDALDatasetH;
PGDALDEMProcessingOptions  = ^GDALDEMProcessingOptions;
PGDALDEMProcessingOptionsForBinary  = ^GDALDEMProcessingOptionsForBinary;
PGDALFootprintOptions  = ^GDALFootprintOptions;
PGDALFootprintOptionsForBinary  = ^GDALFootprintOptionsForBinary;
PGDALGridOptions  = ^GDALGridOptions;
PGDALGridOptionsForBinary  = ^GDALGridOptionsForBinary;
PGDALInfoOptions  = ^GDALInfoOptions;
PGDALInfoOptionsForBinary  = ^GDALInfoOptionsForBinary;
PGDALMultiDimInfoOptions  = ^GDALMultiDimInfoOptions;
PGDALMultiDimInfoOptionsForBinary  = ^GDALMultiDimInfoOptionsForBinary;
PGDALMultiDimTranslateOptions  = ^GDALMultiDimTranslateOptions;
PGDALMultiDimTranslateOptionsForBinary  = ^GDALMultiDimTranslateOptionsForBinary;
PGDALNearblackOptions  = ^GDALNearblackOptions;
PGDALNearblackOptionsForBinary  = ^GDALNearblackOptionsForBinary;
PGDALRasterizeOptions  = ^GDALRasterizeOptions;
PGDALRasterizeOptionsForBinary  = ^GDALRasterizeOptionsForBinary;
PGDALTranslateOptions  = ^GDALTranslateOptions;
PGDALTranslateOptionsForBinary  = ^GDALTranslateOptionsForBinary;
PGDALVectorInfoOptions  = ^GDALVectorInfoOptions;
PGDALVectorInfoOptionsForBinary  = ^GDALVectorInfoOptionsForBinary;
PGDALVectorTranslateOptions  = ^GDALVectorTranslateOptions;
PGDALVectorTranslateOptionsForBinary  = ^GDALVectorTranslateOptionsForBinary;
PGDALWarpAppOptions  = ^GDALWarpAppOptions;
PGDALWarpAppOptionsForBinary  = ^GDALWarpAppOptionsForBinary;
Plongint  = ^longint;
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

function GDALInfoOptionsNew(papszArgv:PPchar; psOptionsForBinary:PGDALInfoOptionsForBinary):PGDALInfoOptions;cdecl;external;
procedure GDALInfoOptionsFree(psOptions:PGDALInfoOptions);cdecl;external;
(* Const before type ignored *)
function GDALInfo(hDataset:TGDALDatasetH; psOptions:PGDALInfoOptions):Pchar;cdecl;external;
{! Options for GDALTranslate(). Opaque type  }
type
{* Opaque type  }

function GDALTranslateOptionsNew(papszArgv:PPchar; psOptionsForBinary:PGDALTranslateOptionsForBinary):PGDALTranslateOptions;cdecl;external;
procedure GDALTranslateOptionsFree(psOptions:PGDALTranslateOptions);cdecl;external;
procedure GDALTranslateOptionsSetProgress(psOptions:PGDALTranslateOptions; pfnProgress:TGDALProgressFunc; pProgressData:pointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GDALTranslate(pszDestFilename:Pchar; hSrcDataset:TGDALDatasetH; psOptions:PGDALTranslateOptions; pbUsageError:Plongint):TGDALDatasetH;cdecl;external;
{! Options for GDALWarp(). Opaque type  }
type
{* Opaque type  }

function GDALWarpAppOptionsNew(papszArgv:PPchar; psOptionsForBinary:PGDALWarpAppOptionsForBinary):PGDALWarpAppOptions;cdecl;external;
procedure GDALWarpAppOptionsFree(psOptions:PGDALWarpAppOptions);cdecl;external;
procedure GDALWarpAppOptionsSetProgress(psOptions:PGDALWarpAppOptions; pfnProgress:TGDALProgressFunc; pProgressData:pointer);cdecl;external;
procedure GDALWarpAppOptionsSetQuiet(psOptions:PGDALWarpAppOptions; bQuiet:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure GDALWarpAppOptionsSetWarpOption(psOptions:PGDALWarpAppOptions; pszKey:Pchar; pszValue:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GDALWarp(pszDest:Pchar; hDstDS:TGDALDatasetH; nSrcCount:longint; pahSrcDS:PGDALDatasetH; psOptions:PGDALWarpAppOptions; 
           pbUsageError:Plongint):TGDALDatasetH;cdecl;external;
{! Options for GDALVectorTranslate(). Opaque type  }
type
{* Opaque type  }

function GDALVectorTranslateOptionsNew(papszArgv:PPchar; psOptionsForBinary:PGDALVectorTranslateOptionsForBinary):PGDALVectorTranslateOptions;cdecl;external;
procedure GDALVectorTranslateOptionsFree(psOptions:PGDALVectorTranslateOptions);cdecl;external;
procedure GDALVectorTranslateOptionsSetProgress(psOptions:PGDALVectorTranslateOptions; pfnProgress:TGDALProgressFunc; pProgressData:pointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GDALVectorTranslate(pszDest:Pchar; hDstDS:TGDALDatasetH; nSrcCount:longint; pahSrcDS:PGDALDatasetH; psOptions:PGDALVectorTranslateOptions; 
           pbUsageError:Plongint):TGDALDatasetH;cdecl;external;
{! Options for GDALDEMProcessing(). Opaque type  }
type
{* Opaque type  }

function GDALDEMProcessingOptionsNew(papszArgv:PPchar; psOptionsForBinary:PGDALDEMProcessingOptionsForBinary):PGDALDEMProcessingOptions;cdecl;external;
procedure GDALDEMProcessingOptionsFree(psOptions:PGDALDEMProcessingOptions);cdecl;external;
procedure GDALDEMProcessingOptionsSetProgress(psOptions:PGDALDEMProcessingOptions; pfnProgress:TGDALProgressFunc; pProgressData:pointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GDALDEMProcessing(pszDestFilename:Pchar; hSrcDataset:TGDALDatasetH; pszProcessing:Pchar; pszColorFilename:Pchar; psOptions:PGDALDEMProcessingOptions; 
           pbUsageError:Plongint):TGDALDatasetH;cdecl;external;
{! Options for GDALNearblack(). Opaque type  }
type
{* Opaque type  }

function GDALNearblackOptionsNew(papszArgv:PPchar; psOptionsForBinary:PGDALNearblackOptionsForBinary):PGDALNearblackOptions;cdecl;external;
procedure GDALNearblackOptionsFree(psOptions:PGDALNearblackOptions);cdecl;external;
procedure GDALNearblackOptionsSetProgress(psOptions:PGDALNearblackOptions; pfnProgress:TGDALProgressFunc; pProgressData:pointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GDALNearblack(pszDest:Pchar; hDstDS:TGDALDatasetH; hSrcDS:TGDALDatasetH; psOptions:PGDALNearblackOptions; pbUsageError:Plongint):TGDALDatasetH;cdecl;external;
{! Options for GDALGrid(). Opaque type  }
type
{* Opaque type  }

function GDALGridOptionsNew(papszArgv:PPchar; psOptionsForBinary:PGDALGridOptionsForBinary):PGDALGridOptions;cdecl;external;
procedure GDALGridOptionsFree(psOptions:PGDALGridOptions);cdecl;external;
procedure GDALGridOptionsSetProgress(psOptions:PGDALGridOptions; pfnProgress:TGDALProgressFunc; pProgressData:pointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GDALGrid(pszDest:Pchar; hSrcDS:TGDALDatasetH; psOptions:PGDALGridOptions; pbUsageError:Plongint):TGDALDatasetH;cdecl;external;
{! Options for GDALRasterize(). Opaque type  }
type
{* Opaque type  }

function GDALRasterizeOptionsNew(papszArgv:PPchar; psOptionsForBinary:PGDALRasterizeOptionsForBinary):PGDALRasterizeOptions;cdecl;external;
procedure GDALRasterizeOptionsFree(psOptions:PGDALRasterizeOptions);cdecl;external;
procedure GDALRasterizeOptionsSetProgress(psOptions:PGDALRasterizeOptions; pfnProgress:TGDALProgressFunc; pProgressData:pointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GDALRasterize(pszDest:Pchar; hDstDS:TGDALDatasetH; hSrcDS:TGDALDatasetH; psOptions:PGDALRasterizeOptions; pbUsageError:Plongint):TGDALDatasetH;cdecl;external;
{! Options for GDALFootprint(). Opaque type  }
type
{* Opaque type  }

function GDALFootprintOptionsNew(papszArgv:PPchar; psOptionsForBinary:PGDALFootprintOptionsForBinary):PGDALFootprintOptions;cdecl;external;
procedure GDALFootprintOptionsFree(psOptions:PGDALFootprintOptions);cdecl;external;
procedure GDALFootprintOptionsSetProgress(psOptions:PGDALFootprintOptions; pfnProgress:TGDALProgressFunc; pProgressData:pointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GDALFootprint(pszDest:Pchar; hDstDS:TGDALDatasetH; hSrcDS:TGDALDatasetH; psOptions:PGDALFootprintOptions; pbUsageError:Plongint):TGDALDatasetH;cdecl;external;
{! Options for GDALBuildVRT(). Opaque type  }
type
{* Opaque type  }

function GDALBuildVRTOptionsNew(papszArgv:PPchar; psOptionsForBinary:PGDALBuildVRTOptionsForBinary):PGDALBuildVRTOptions;cdecl;external;
procedure GDALBuildVRTOptionsFree(psOptions:PGDALBuildVRTOptions);cdecl;external;
procedure GDALBuildVRTOptionsSetProgress(psOptions:PGDALBuildVRTOptions; pfnProgress:TGDALProgressFunc; pProgressData:pointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
function GDALBuildVRT(pszDest:Pchar; nSrcCount:longint; pahSrcDS:PGDALDatasetH; papszSrcDSNames:PPchar; psOptions:PGDALBuildVRTOptions; 
           pbUsageError:Plongint):TGDALDatasetH;cdecl;external;
{! Options for GDALMultiDimInfo(). Opaque type  }
type
{* Opaque type  }

function GDALMultiDimInfoOptionsNew(papszArgv:PPchar; psOptionsForBinary:PGDALMultiDimInfoOptionsForBinary):PGDALMultiDimInfoOptions;cdecl;external;
procedure GDALMultiDimInfoOptionsFree(psOptions:PGDALMultiDimInfoOptions);cdecl;external;
(* Const before type ignored *)
function GDALMultiDimInfo(hDataset:TGDALDatasetH; psOptions:PGDALMultiDimInfoOptions):Pchar;cdecl;external;
{! Options for GDALMultiDimTranslate(). Opaque type  }
type
{* Opaque type  }

function GDALMultiDimTranslateOptionsNew(papszArgv:PPchar; psOptionsForBinary:PGDALMultiDimTranslateOptionsForBinary):PGDALMultiDimTranslateOptions;cdecl;external;
procedure GDALMultiDimTranslateOptionsFree(psOptions:PGDALMultiDimTranslateOptions);cdecl;external;
procedure GDALMultiDimTranslateOptionsSetProgress(psOptions:PGDALMultiDimTranslateOptions; pfnProgress:TGDALProgressFunc; pProgressData:pointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GDALMultiDimTranslate(pszDest:Pchar; hDstDataset:TGDALDatasetH; nSrcCount:longint; pahSrcDS:PGDALDatasetH; psOptions:PGDALMultiDimTranslateOptions; 
           pbUsageError:Plongint):TGDALDatasetH;cdecl;external;
{! Options for GDALVectorInfo(). Opaque type  }
type
{* Opaque type  }

function GDALVectorInfoOptionsNew(papszArgv:PPchar; psOptionsForBinary:PGDALVectorInfoOptionsForBinary):PGDALVectorInfoOptions;cdecl;external;
procedure GDALVectorInfoOptionsFree(psOptions:PGDALVectorInfoOptions);cdecl;external;
(* Const before type ignored *)
function GDALVectorInfo(hDataset:TGDALDatasetH; psOptions:PGDALVectorInfoOptions):Pchar;cdecl;external;
{$endif}
{ GDAL_UTILS_H_INCLUDED  }

implementation


end.
