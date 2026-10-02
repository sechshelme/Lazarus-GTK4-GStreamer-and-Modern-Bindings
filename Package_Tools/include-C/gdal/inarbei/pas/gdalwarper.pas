unit gdalwarper;

interface

uses
  fp_gdal;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*****************************************************************************
 * $Id$
 *
 * Project:  GDAL High Performance Warper
 * Purpose:  Prototypes, and definitions for warping related work.
 * Author:   Frank Warmerdam, warmerdam@pobox.com
 *
 ******************************************************************************
 * Copyright (c) 2003, Frank Warmerdam
 * Copyright (c) 2009-2012, Even Rouault <even dot rouault at spatialys.com>
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
{$ifndef GDALWARPER_H_INCLUDED}
{$define GDALWARPER_H_INCLUDED}
{*
 * \file gdalwarper.h
 *
 * GDAL warper related entry points and definitions.  Eventually it is
 * expected that this file will be mostly private to the implementation,
 * and the public C entry points will be available in gdal_alg.h.
  }
{$include "gdal_alg.h"}
{$include "cpl_minixml.h"}
{$include "cpl_multiproc.h"}
{ Note: values are selected to be consistent with GDALRIOResampleAlg of
 * gcore/gdal.h  }
{! Warp Resampling Algorithm  }
{! Nearest neighbour (select on one input pixel)  }{! Bilinear (2x2 kernel)  }{! Cubic Convolution Approximation (4x4 kernel)  }{! Cubic B-Spline Approximation (4x4 kernel)  }{! Lanczos windowed sinc interpolation (6x6 kernel)  }{! Average (computes the weighted average of all non-NODATA contributing
       pixels)  }
{! Mode (selects the value which appears most often of all the sampled
       points)  }
{  GRA_Gauss=7 reserved.  }
{! Max (selects maximum of all non-NODATA contributing pixels)  }{! Min (selects minimum of all non-NODATA contributing pixels)  }{! Med (selects median of all non-NODATA contributing pixels)  }{! Q1 (selects first quartile of all non-NODATA contributing pixels)  }
{! Q3 (selects third quartile of all non-NODATA contributing pixels)  }
{! Sum (weighed sum of all non-NODATA contributing pixels). Added in
       GDAL 3.1  }
{! RMS (weighted root mean square (quadratic mean) of all non-NODATA
       contributing pixels)  }
{! @cond Doxygen_Suppress  }
{! @endcond  }
type
  PGDALResampleAlg = ^TGDALResampleAlg;
  TGDALResampleAlg =  Longint;
  Const
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
;
{! GWKAverageOrMode Algorithm  }
{! Average  }{! Mode  }{! Mode of GDT_Byte, GDT_UInt16, or GDT_Int16  }{! Maximum  }{! Minimum  }{! Quantile  }{! Sum  }{! RMS  }type
  PGWKAverageOrModeAlg = ^TGWKAverageOrModeAlg;
  TGWKAverageOrModeAlg =  Longint;
  Const
    GWKAOM_Average = 1;
    GWKAOM_Fmode = 2;
    GWKAOM_Imode = 3;
    GWKAOM_Max = 4;
    GWKAOM_Min = 5;
    GWKAOM_Quant = 6;
    GWKAOM_Sum = 7;
    GWKAOM_RMS = 8;
;
{! @cond Doxygen_Suppress  }
type

  TGDALMaskFunc = function (pMaskFuncArg:pointer; nBandCount:longint; eType:TGDALDataType; nXOff:longint; nYOff:longint; 
               nXSize:longint; nYSize:longint; papabyImageData:PPGByte; bMaskIsFloat:longint; pMask:pointer):longint;cdecl;

function GDALWarpNoDataMasker(pMaskFuncArg:pointer; nBandCount:longint; eType:TGDALDataType; nXOff:longint; nYOff:longint; 
           nXSize:longint; nYSize:longint; papabyImageData:PPGByte; bMaskIsFloat:longint; pValidityMask:pointer; 
           pbOutAllValid:Plongint):TCPLErr;cdecl;external libgdal;
{ppImageData  }function GDALWarpDstAlphaMasker(pMaskFuncArg:pointer; nBandCount:longint; eType:TGDALDataType; nXOff:longint; nYOff:longint; 
           nXSize:longint; nYSize:longint; para8:PPGByte; bMaskIsFloat:longint; pValidityMask:pointer):TCPLErr;cdecl;external libgdal;
{ppImageData  }function GDALWarpSrcAlphaMasker(pMaskFuncArg:pointer; nBandCount:longint; eType:TGDALDataType; nXOff:longint; nYOff:longint; 
           nXSize:longint; nYSize:longint; para8:PPGByte; bMaskIsFloat:longint; pValidityMask:pointer; 
           pbOutAllOpaque:Plongint):TCPLErr;cdecl;external libgdal;
{ppImageData  }function GDALWarpSrcMaskMasker(pMaskFuncArg:pointer; nBandCount:longint; eType:TGDALDataType; nXOff:longint; nYOff:longint; 
           nXSize:longint; nYSize:longint; para8:PPGByte; bMaskIsFloat:longint; pValidityMask:pointer):TCPLErr;cdecl;external libgdal;
{ ppImageData  }function GDALWarpCutlineMasker(pMaskFuncArg:pointer; nBandCount:longint; eType:TGDALDataType; nXOff:longint; nYOff:longint; 
           nXSize:longint; nYSize:longint; para8:PPGByte; bMaskIsFloat:longint; pValidityMask:pointer):TCPLErr;cdecl;external libgdal;
{ GCMVF stands for GDALWARP_CUTLINE_MASKER_VALIDITY_FLAG  }
const
  GCMVF_PARTIAL_INTERSECTION = 0;  
  GCMVF_NO_INTERSECTION = 1;  
  GCMVF_CHUNK_FULLY_WITHIN_CUTLINE = 2;  
{ ppImageData  }
function GDALWarpCutlineMaskerEx(pMaskFuncArg:pointer; nBandCount:longint; eType:TGDALDataType; nXOff:longint; nYOff:longint; 
           nXSize:longint; nYSize:longint; para8:PPGByte; bMaskIsFloat:longint; pValidityMask:pointer; 
           pnValidityFlag:Plongint):TCPLErr;cdecl;external libgdal;
{! @endcond  }
{********************************************************************** }
{                           GDALWarpOptions                             }
{********************************************************************** }
{* Warp control options for use with GDALWarpOperation::Initialize()   }
{! In bytes, 0.0 for internal default  }
{! Resampling algorithm to use  }
{! data type to use during warp operation, GDT_Unknown lets the algorithm
        select the type  }
{! Source image dataset.  }
{! Destination image dataset - may be NULL if only using
     * GDALWarpOperation::WarpRegionToBuffer().  }
{! Number of bands to process, may be 0 to select all bands.  }
{! The band numbers for the source bands to process (1 based)  }
{! The band numbers for the destination bands to process (1 based)  }
{! The source band so use as an alpha (transparency) value, 0=disabled  }
{! The dest. band so use as an alpha (transparency) value, 0=disabled  }
{! The "nodata" value real component for each input band, if NULL there
     * isn't one  }
{! The "nodata" value imaginary component - may be NULL even if real
      component is provided. This value is not used to flag invalid values.
      Only the real component is used.  }
{! The "nodata" value real component for each output band, if NULL there
     * isn't one  }
{! The "nodata" value imaginary component - may be NULL even if real
      component is provided. Note that warp operations only use real component
      for flagging invalid data. }
{! GDALProgressFunc() compatible progress reporting function, or NULL
      if there isn't one.  }
{! Callback argument to be passed to pfnProgress.  }
{! Type of spatial point transformer function  }
{! Handle to image transformer setup structure  }
{* Unused. Must be NULL  }
{* Unused. Must be NULL  }
{* Unused. Must be NULL  }
{* Unused. Must be NULL  }
{* Unused. Must be NULL  }
{* Unused. Must be NULL  }
{* Unused. Must be NULL  }
{* Unused. Must be NULL  }
{* Unused. Must be NULL  }
{* Unused. Must be NULL  }
{* Unused. Must be NULL  }
{* Unused. Must be NULL  }
{* Unused. Must be NULL  }
{* Unused. Must be NULL  }
{! Optional OGRPolygonH for a masking cutline.  }
{! Optional blending distance to apply across cutline in pixels, default is
     * zero.  }
type
  PGDALWarpOptions = ^TGDALWarpOptions;
  TGDALWarpOptions = record
      papszWarpOptions : ^Pchar;
      dfWarpMemoryLimit : Tdouble;
      eResampleAlg : TGDALResampleAlg;
      eWorkingDataType : TGDALDataType;
      hSrcDS : TGDALDatasetH;
      hDstDS : TGDALDatasetH;
      nBandCount : longint;
      panSrcBands : Plongint;
      panDstBands : Plongint;
      nSrcAlphaBand : longint;
      nDstAlphaBand : longint;
      padfSrcNoDataReal : Pdouble;
      padfSrcNoDataImag : Pdouble;
      padfDstNoDataReal : Pdouble;
      padfDstNoDataImag : Pdouble;
      pfnProgress : TGDALProgressFunc;
      pProgressArg : pointer;
      pfnTransformer : TGDALTransformerFunc;
      pTransformerArg : pointer;
      papfnSrcPerBandValidityMaskFunc : PGDALMaskFunc;
      papSrcPerBandValidityMaskFuncArg : ^pointer;
      pfnSrcValidityMaskFunc : TGDALMaskFunc;
      pSrcValidityMaskFuncArg : pointer;
      pfnSrcDensityMaskFunc : TGDALMaskFunc;
      pSrcDensityMaskFuncArg : pointer;
      pfnDstDensityMaskFunc : TGDALMaskFunc;
      pDstDensityMaskFuncArg : pointer;
      pfnDstValidityMaskFunc : TGDALMaskFunc;
      pDstValidityMaskFuncArg : pointer;
      pfnPreWarpChunkProcessor : function (pKern:pointer; pArg:pointer):TCPLErr;cdecl;
      pPreWarpProcessorArg : pointer;
      pfnPostWarpChunkProcessor : function (pKern:pointer; pArg:pointer):TCPLErr;cdecl;
      pPostWarpProcessorArg : pointer;
      hCutline : pointer;
      dfCutlineBlendDist : Tdouble;
    end;

function GDALCreateWarpOptions:PGDALWarpOptions;cdecl;external libgdal;
procedure GDALDestroyWarpOptions(para1:PGDALWarpOptions);cdecl;external libgdal;
function GDALCloneWarpOptions(para1:PGDALWarpOptions):PGDALWarpOptions;cdecl;external libgdal;
procedure GDALWarpInitDstNoDataReal(para1:PGDALWarpOptions; dNoDataReal:Tdouble);cdecl;external libgdal;
procedure GDALWarpInitSrcNoDataReal(para1:PGDALWarpOptions; dNoDataReal:Tdouble);cdecl;external libgdal;
procedure GDALWarpInitNoDataReal(para1:PGDALWarpOptions; dNoDataReal:Tdouble);cdecl;external libgdal;
procedure GDALWarpInitDstNoDataImag(para1:PGDALWarpOptions; dNoDataImag:Tdouble);cdecl;external libgdal;
procedure GDALWarpInitSrcNoDataImag(para1:PGDALWarpOptions; dNoDataImag:Tdouble);cdecl;external libgdal;
procedure GDALWarpResolveWorkingDataType(para1:PGDALWarpOptions);cdecl;external libgdal;
procedure GDALWarpInitDefaultBandMapping(para1:PGDALWarpOptions; nBandCount:longint);cdecl;external libgdal;
{! @cond Doxygen_Suppress  }
function GDALSerializeWarpOptions(para1:PGDALWarpOptions):PCPLXMLNode;cdecl;external libgdal;
function GDALDeserializeWarpOptions(para1:PCPLXMLNode):PGDALWarpOptions;cdecl;external libgdal;
{! @endcond  }
{********************************************************************** }
{                         GDALReprojectImage()                          }
{********************************************************************** }
function GDALReprojectImage(hSrcDS:TGDALDatasetH; pszSrcWKT:Pchar; hDstDS:TGDALDatasetH; pszDstWKT:Pchar; eResampleAlg:TGDALResampleAlg; 
           dfWarpMemoryLimit:Tdouble; dfMaxError:Tdouble; pfnProgress:TGDALProgressFunc; pProgressArg:pointer; psOptions:PGDALWarpOptions):TCPLErr;cdecl;external libgdal;
function GDALCreateAndReprojectImage(hSrcDS:TGDALDatasetH; pszSrcWKT:Pchar; pszDstFilename:Pchar; pszDstWKT:Pchar; hDstDriver:TGDALDriverH; 
           papszCreateOptions:PPchar; eResampleAlg:TGDALResampleAlg; dfWarpMemoryLimit:Tdouble; dfMaxError:Tdouble; pfnProgress:TGDALProgressFunc; 
           pProgressArg:pointer; psOptions:PGDALWarpOptions):TCPLErr;cdecl;external libgdal;
{********************************************************************** }
{                           VRTWarpedDataset                            }
{********************************************************************** }
function GDALAutoCreateWarpedVRT(hSrcDS:TGDALDatasetH; pszSrcWKT:Pchar; pszDstWKT:Pchar; eResampleAlg:TGDALResampleAlg; dfMaxError:Tdouble; 
           psOptions:PGDALWarpOptions):TGDALDatasetH;cdecl;external libgdal;
function GDALAutoCreateWarpedVRTEx(hSrcDS:TGDALDatasetH; pszSrcWKT:Pchar; pszDstWKT:Pchar; eResampleAlg:TGDALResampleAlg; dfMaxError:Tdouble; 
           psOptions:PGDALWarpOptions; papszTransformerOptions:TCSLConstList):TGDALDatasetH;cdecl;external libgdal;
function GDALCreateWarpedVRT(hSrcDS:TGDALDatasetH; nPixels:longint; nLines:longint; padfGeoTransform:Pdouble; psOptions:PGDALWarpOptions):TGDALDatasetH;cdecl;external libgdal;
function GDALInitializeWarpedVRT(hDS:TGDALDatasetH; psWO:PGDALWarpOptions):TCPLErr;cdecl;external libgdal;
{$if defined(__cplusplus) && !defined(CPL_SUPRESS_CPLUSPLUS)}
{$include <vector>}
{$include <utility>}
{********************************************************************** }
{                            GDALWarpKernel                             }
{                                                                       }
{* This is the number of dummy pixels that must be reserved in source arrays
 * in order to satisfy assumptions made in GWKResample(), and more specifically
 * by GWKGetPixelRow() that always read a even number of pixels. So if we are
 * in the situation to read the last pixel of the source array, we need 1 extra
 * dummy pixel to avoid reading out of bounds.  }

const
  WARP_EXTRA_ELTS = 1;  
{* This class represents the lowest level of abstraction of warping.
 *
 * It holds the imagery for one "chunk" of a warp, and the
 * pre-prepared masks.  All IO is done before and after its
 * operation.  This class is not normally used by the
 * application.
  }
{! @cond Doxygen_Suppress  }

function GWKThreadsCreate(papszWarpOptions:PPchar; pfnTransformer:TGDALTransformerFunc; pTransformerArg:pointer):pointer;cdecl;external libgdal;
procedure GWKThreadsEnd(psThreadDataIn:pointer);cdecl;external libgdal;
{! @endcond  }
{********************************************************************** }
{                         GDALWarpOperation()                           }
{                                                                       }
{      This object is application created, or created by a higher       }
{      level convenience function.  It is responsible for               }
{      subdividing the operation into chunks, loading and saving        }
{      imagery, and establishing the varios validity and density        }
{      masks.  Actual resampling is done by the GDALWarpKernel.         }
{********************************************************************** }
{! @cond Doxygen_Suppress  }
type
{! @endcond  }
{$endif}
{ def __cplusplus  }
{* Opaque type representing a GDALWarpOperation object  }
type
  PGDALWarpOperationH = ^TGDALWarpOperationH;
  TGDALWarpOperationH = pointer;

function GDALCreateWarpOperation(para1:PGDALWarpOptions):TGDALWarpOperationH;cdecl;external libgdal;
procedure GDALDestroyWarpOperation(para1:TGDALWarpOperationH);cdecl;external libgdal;
function GDALChunkAndWarpImage(para1:TGDALWarpOperationH; para2:longint; para3:longint; para4:longint; para5:longint):TCPLErr;cdecl;external libgdal;
function GDALChunkAndWarpMulti(para1:TGDALWarpOperationH; para2:longint; para3:longint; para4:longint; para5:longint):TCPLErr;cdecl;external libgdal;
function GDALWarpRegion(para1:TGDALWarpOperationH; para2:longint; para3:longint; para4:longint; para5:longint; 
           para6:longint; para7:longint; para8:longint; para9:longint):TCPLErr;cdecl;external libgdal;
function GDALWarpRegionToBuffer(para1:TGDALWarpOperationH; para2:longint; para3:longint; para4:longint; para5:longint; 
           para6:pointer; para7:TGDALDataType; para8:longint; para9:longint; para10:longint; 
           para11:longint):TCPLErr;cdecl;external libgdal;
{********************************************************************** }
{      Warping kernel functions                                         }
{********************************************************************** }
{! @cond Doxygen_Suppress  }
function GWKGetFilterRadius(eResampleAlg:TGDALResampleAlg):longint;cdecl;external libgdal;
type

  TFilterFuncType = function (dfX:Tdouble):Tdouble;cdecl;

function GWKGetFilterFunc(eResampleAlg:TGDALResampleAlg):TFilterFuncType;cdecl;external libgdal;
{ TODO(schwehr): Can padfVals be a const pointer? }
type

  TFilterFunc4ValuesType = function (padfVals:Pdouble):Tdouble;cdecl;

function GWKGetFilterFunc4Values(eResampleAlg:TGDALResampleAlg):TFilterFunc4ValuesType;cdecl;external libgdal;
{! @endcond  }
{$endif}
{ ndef GDAL_ALG_H_INCLUDED  }

// === Konventiert am: 2-10-26 16:54:31 ===


implementation



end.
