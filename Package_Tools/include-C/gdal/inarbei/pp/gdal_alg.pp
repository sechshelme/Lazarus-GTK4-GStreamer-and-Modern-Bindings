
unit gdal_alg;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdal_alg.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdal_alg
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
PCPLXMLNode  = ^CPLXMLNode;
Pdouble  = ^double;
PGDAL_GCP  = ^GDAL_GCP;
PGDALContourGeneratorH  = ^GDALContourGeneratorH;
PGDALGridAlgorithm  = ^GDALGridAlgorithm;
PGDALGridContext  = ^GDALGridContext;
PGDALGridDataMetricsOptions  = ^GDALGridDataMetricsOptions;
PGDALGridInverseDistanceToAPowerNearestNeighborOptions  = ^GDALGridInverseDistanceToAPowerNearestNeighborOptions;
PGDALGridInverseDistanceToAPowerOptions  = ^GDALGridInverseDistanceToAPowerOptions;
PGDALGridLinearOptions  = ^GDALGridLinearOptions;
PGDALGridMovingAverageOptions  = ^GDALGridMovingAverageOptions;
PGDALGridNearestNeighborOptions  = ^GDALGridNearestNeighborOptions;
PGDALRPCInfoV1  = ^GDALRPCInfoV1;
PGDALRPCInfoV2  = ^GDALRPCInfoV2;
PGDALTransformerFunc  = ^GDALTransformerFunc;
PGDALTransformerInfo  = ^GDALTransformerInfo;
PGDALTriangulation  = ^GDALTriangulation;
PGDALTriBarycentricCoefficients  = ^GDALTriBarycentricCoefficients;
PGDALTriFacet  = ^GDALTriFacet;
PGDALViewshedMode  = ^GDALViewshedMode;
PGDALViewshedOutputType  = ^GDALViewshedOutputType;
Pint64_t  = ^int64_t;
Plongint  = ^longint;
POGRContourWriterInfo  = ^OGRContourWriterInfo;
POGRGeometryH  = ^OGRGeometryH;
POGRLayerH  = ^OGRLayerH;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*****************************************************************************
 * $Id$
 *
 * Project:  GDAL Image Processing Algorithms
 * Purpose:  Prototypes, and definitions for various GDAL based algorithms.
 * Author:   Frank Warmerdam, warmerdam@pobox.com
 *
 ******************************************************************************
 * Copyright (c) 2001, Frank Warmerdam
 * Copyright (c) 2008-2012, Even Rouault <even dot rouault at spatialys.com>
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
{$ifndef GDAL_ALG_H_INCLUDED}
{$define GDAL_ALG_H_INCLUDED}
{*
 * \file gdal_alg.h
 *
 * Public (C callable) GDAL algorithm entry points, and definitions.
  }
{$ifndef DOXYGEN_SKIP}
{$include "gdal.h"}
{$include "cpl_minixml.h"}
{$include "ogr_api.h"}
{$include <stdint.h>}
{$endif}

function GDALComputeMedianCutPCT(hRed:TGDALRasterBandH; hGreen:TGDALRasterBandH; hBlue:TGDALRasterBandH; pfnIncludePixel:function (para1:longint; para2:longint; para3:pointer):longint; nColors:longint; 
           hColorTable:TGDALColorTableH; pfnProgress:TGDALProgressFunc; pProgressArg:pointer):longint;cdecl;external;
function GDALDitherRGB2PCT(hRed:TGDALRasterBandH; hGreen:TGDALRasterBandH; hBlue:TGDALRasterBandH; hTarget:TGDALRasterBandH; hColorTable:TGDALColorTableH; 
           pfnProgress:TGDALProgressFunc; pProgressArg:pointer):longint;cdecl;external;
function GDALChecksumImage(hBand:TGDALRasterBandH; nXOff:longint; nYOff:longint; nXSize:longint; nYSize:longint):longint;cdecl;external;
function GDALComputeProximity(hSrcBand:TGDALRasterBandH; hProximityBand:TGDALRasterBandH; papszOptions:PPchar; pfnProgress:TGDALProgressFunc; pProgressArg:pointer):TCPLErr;cdecl;external;
function GDALFillNodata(hTargetBand:TGDALRasterBandH; hMaskBand:TGDALRasterBandH; dfMaxSearchDist:Tdouble; bDeprecatedOption:longint; nSmoothingIterations:longint; 
           papszOptions:PPchar; pfnProgress:TGDALProgressFunc; pProgressArg:pointer):TCPLErr;cdecl;external;
function GDALPolygonize(hSrcBand:TGDALRasterBandH; hMaskBand:TGDALRasterBandH; hOutLayer:TOGRLayerH; iPixValField:longint; papszOptions:PPchar; 
           pfnProgress:TGDALProgressFunc; pProgressArg:pointer):TCPLErr;cdecl;external;
function GDALFPolygonize(hSrcBand:TGDALRasterBandH; hMaskBand:TGDALRasterBandH; hOutLayer:TOGRLayerH; iPixValField:longint; papszOptions:PPchar; 
           pfnProgress:TGDALProgressFunc; pProgressArg:pointer):TCPLErr;cdecl;external;
function GDALSieveFilter(hSrcBand:TGDALRasterBandH; hMaskBand:TGDALRasterBandH; hDstBand:TGDALRasterBandH; nSizeThreshold:longint; nConnectedness:longint; 
           papszOptions:PPchar; pfnProgress:TGDALProgressFunc; pProgressArg:pointer):TCPLErr;cdecl;external;
{
 * Warp Related.
  }
type

  TGDALTransformerFunc = function (pTransformerArg:pointer; bDstToSrc:longint; nPointCount:longint; x:Pdouble; y:Pdouble; 
               z:Pdouble; panSuccess:Plongint):longint;cdecl;
{! @cond Doxygen_Suppress  }

const
  GDAL_GTI2_SIGNATURE = 'GTI2';  
(* Const before type ignored *)
type
  PGDALTransformerInfo = ^TGDALTransformerInfo;
  TGDALTransformerInfo = record
      abySignature : array[0..3] of TGByte;
      pszClassName : Pchar;
      pfnTransform : TGDALTransformerFunc;
      pfnCleanup : procedure (pTransformerArg:pointer);cdecl;
      pfnSerialize : function (pTransformerArg:pointer):PCPLXMLNode;cdecl;
      pfnCreateSimilar : function (pTransformerArg:pointer; dfSrcRatioX:Tdouble; dfSrcRatioY:Tdouble):pointer;cdecl;
    end;
{! @endcond  }
{! @cond Doxygen_Suppress  }

procedure GDALDestroyTransformer(pTransformerArg:pointer);cdecl;external;
function GDALUseTransformer(pTransformerArg:pointer; bDstToSrc:longint; nPointCount:longint; x:Pdouble; y:Pdouble; 
           z:Pdouble; panSuccess:Plongint):longint;cdecl;external;
function GDALCreateSimilarTransformer(psTransformerArg:pointer; dfSrcRatioX:Tdouble; dfSrcRatioY:Tdouble):pointer;cdecl;external;
{! @endcond  }
{ High level transformer for going from image coordinates on one file
   to image coordinates on another, potentially doing reprojection,
   utilizing GCPs or using the geotransform.  }
(* Const before type ignored *)
(* Const before type ignored *)
function GDALCreateGenImgProjTransformer(hSrcDS:TGDALDatasetH; pszSrcWKT:Pchar; hDstDS:TGDALDatasetH; pszDstWKT:Pchar; bGCPUseOK:longint; 
           dfGCPErrorThreshold:Tdouble; nOrder:longint):pointer;cdecl;external;
function GDALCreateGenImgProjTransformer2(hSrcDS:TGDALDatasetH; hDstDS:TGDALDatasetH; papszOptions:PPchar):pointer;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GDALCreateGenImgProjTransformer3(pszSrcWKT:Pchar; padfSrcGeoTransform:Pdouble; pszDstWKT:Pchar; padfDstGeoTransform:Pdouble):pointer;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function GDALCreateGenImgProjTransformer4(hSrcSRS:TOGRSpatialReferenceH; padfSrcGeoTransform:Pdouble; hDstSRS:TOGRSpatialReferenceH; padfDstGeoTransform:Pdouble; papszOptions:PPchar):pointer;cdecl;external;
(* Const before type ignored *)
procedure GDALSetGenImgProjTransformerDstGeoTransform(para1:pointer; para2:Pdouble);cdecl;external;
procedure GDALDestroyGenImgProjTransformer(para1:pointer);cdecl;external;
function GDALGenImgProjTransform(pTransformArg:pointer; bDstToSrc:longint; nPointCount:longint; x:Pdouble; y:Pdouble; 
           z:Pdouble; panSuccess:Plongint):longint;cdecl;external;
(* Const before type ignored *)
procedure GDALSetTransformerDstGeoTransform(para1:pointer; para2:Pdouble);cdecl;external;
procedure GDALGetTransformerDstGeoTransform(para1:pointer; para2:Pdouble);cdecl;external;
{ Geo to geo reprojection transformer.  }
(* Const before type ignored *)
(* Const before type ignored *)
function GDALCreateReprojectionTransformer(pszSrcWKT:Pchar; pszDstWKT:Pchar):pointer;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function GDALCreateReprojectionTransformerEx(hSrcSRS:TOGRSpatialReferenceH; hDstSRS:TOGRSpatialReferenceH; papszOptions:PPchar):pointer;cdecl;external;
procedure GDALDestroyReprojectionTransformer(para1:pointer);cdecl;external;
function GDALReprojectionTransform(pTransformArg:pointer; bDstToSrc:longint; nPointCount:longint; x:Pdouble; y:Pdouble; 
           z:Pdouble; panSuccess:Plongint):longint;cdecl;external;
{ GCP based transformer ... forward is to georef coordinates  }
(* Const before type ignored *)
function GDALCreateGCPTransformer(nGCPCount:longint; pasGCPList:PGDAL_GCP; nReqOrder:longint; bReversed:longint):pointer;cdecl;external;
{ GCP based transformer with refinement of the GCPs ... forward is to georef
 * coordinates  }
(* Const before type ignored *)
function GDALCreateGCPRefineTransformer(nGCPCount:longint; pasGCPList:PGDAL_GCP; nReqOrder:longint; bReversed:longint; tolerance:Tdouble; 
           minimumGcps:longint):pointer;cdecl;external;
procedure GDALDestroyGCPTransformer(pTransformArg:pointer);cdecl;external;
function GDALGCPTransform(pTransformArg:pointer; bDstToSrc:longint; nPointCount:longint; x:Pdouble; y:Pdouble; 
           z:Pdouble; panSuccess:Plongint):longint;cdecl;external;
{ Thin Plate Spine transformer ... forward is to georef coordinates  }
(* Const before type ignored *)
function GDALCreateTPSTransformer(nGCPCount:longint; pasGCPList:PGDAL_GCP; bReversed:longint):pointer;cdecl;external;
procedure GDALDestroyTPSTransformer(pTransformArg:pointer);cdecl;external;
function GDALTPSTransform(pTransformArg:pointer; bDstToSrc:longint; nPointCount:longint; x:Pdouble; y:Pdouble; 
           z:Pdouble; panSuccess:Plongint):longint;cdecl;external;
{! @cond Doxygen_Suppress  }
{$ifdef GDAL_COMPILATION}
const
  RPCInfoV1ToMD = RPCInfoToMD;  
{$else}

const
  RPCInfoToMD = RPCInfoV2ToMD;  
{$endif}

function RPCInfoV1ToMD(psRPCInfo:PGDALRPCInfoV1):^Pchar;cdecl;external;
function RPCInfoV2ToMD(psRPCInfo:PGDALRPCInfoV2):^Pchar;cdecl;external;
{! @endcond  }
{ RPC based transformer ... src is pixel/line/elev, dst is long/lat/elev  }
{! @cond Doxygen_Suppress  }
{$ifdef GDAL_COMPILATION}
const
  GDALCreateRPCTransformerV1 = GDALCreateRPCTransformer;  
{$else}

const
  GDALCreateRPCTransformer = GDALCreateRPCTransformerV2;  
{$endif}

function GDALCreateRPCTransformerV1(psRPC:PGDALRPCInfoV1; bReversed:longint; dfPixErrThreshold:Tdouble; papszOptions:PPchar):pointer;cdecl;external;
{! @endcond  }
(* Const before type ignored *)
function GDALCreateRPCTransformerV2(psRPC:PGDALRPCInfoV2; bReversed:longint; dfPixErrThreshold:Tdouble; papszOptions:PPchar):pointer;cdecl;external;
procedure GDALDestroyRPCTransformer(pTransformArg:pointer);cdecl;external;
function GDALRPCTransform(pTransformArg:pointer; bDstToSrc:longint; nPointCount:longint; x:Pdouble; y:Pdouble; 
           z:Pdouble; panSuccess:Plongint):longint;cdecl;external;
{ Geolocation transformer  }
function GDALCreateGeoLocTransformer(hBaseDS:TGDALDatasetH; papszGeolocationInfo:PPchar; bReversed:longint):pointer;cdecl;external;
procedure GDALDestroyGeoLocTransformer(pTransformArg:pointer);cdecl;external;
function GDALGeoLocTransform(pTransformArg:pointer; bDstToSrc:longint; nPointCount:longint; x:Pdouble; y:Pdouble; 
           z:Pdouble; panSuccess:Plongint):longint;cdecl;external;
{ Approximate transformer  }
function GDALCreateApproxTransformer(pfnRawTransformer:TGDALTransformerFunc; pRawTransformerArg:pointer; dfMaxError:Tdouble):pointer;cdecl;external;
procedure GDALApproxTransformerOwnsSubtransformer(pCBData:pointer; bOwnFlag:longint);cdecl;external;
procedure GDALDestroyApproxTransformer(pApproxArg:pointer);cdecl;external;
function GDALApproxTransform(pTransformArg:pointer; bDstToSrc:longint; nPointCount:longint; x:Pdouble; y:Pdouble; 
           z:Pdouble; panSuccess:Plongint):longint;cdecl;external;
function GDALSimpleImageWarp(hSrcDS:TGDALDatasetH; hDstDS:TGDALDatasetH; nBandCount:longint; panBandList:Plongint; pfnTransform:TGDALTransformerFunc; 
           pTransformArg:pointer; pfnProgress:TGDALProgressFunc; pProgressArg:pointer; papszWarpOptions:PPchar):longint;cdecl;external;
function GDALSuggestedWarpOutput(hSrcDS:TGDALDatasetH; pfnTransformer:TGDALTransformerFunc; pTransformArg:pointer; padfGeoTransformOut:Pdouble; pnPixels:Plongint; 
           pnLines:Plongint):TCPLErr;cdecl;external;
{* Flag for GDALSuggestedWarpOutput2() to ask to round-up output size  }
const
  GDAL_SWO_ROUND_UP_SIZE = $1;  

function GDALSuggestedWarpOutput2(hSrcDS:TGDALDatasetH; pfnTransformer:TGDALTransformerFunc; pTransformArg:pointer; padfGeoTransformOut:Pdouble; pnPixels:Plongint; 
           pnLines:Plongint; padfExtent:Pdouble; nOptions:longint):TCPLErr;cdecl;external;
{! @cond Doxygen_Suppress  }
function GDALSerializeTransformer(pfnFunc:TGDALTransformerFunc; pTransformArg:pointer):PCPLXMLNode;cdecl;external;
function GDALDeserializeTransformer(psTree:PCPLXMLNode; ppfnFunc:PGDALTransformerFunc; ppTransformArg:Ppointer):TCPLErr;cdecl;external;
{! @endcond  }
function GDALTransformGeolocations(hXBand:TGDALRasterBandH; hYBand:TGDALRasterBandH; hZBand:TGDALRasterBandH; pfnTransformer:TGDALTransformerFunc; pTransformArg:pointer; 
           pfnProgress:TGDALProgressFunc; pProgressArg:pointer; papszOptions:PPchar):TCPLErr;cdecl;external;
{ --------------------------------------------------------------------  }
{      Contour Line Generation                                          }
{ --------------------------------------------------------------------  }
{* Contour writer callback type  }
type

  TGDALContourWriter = function (dfLevel:Tdouble; nPoints:longint; padfX:Pdouble; padfY:Pdouble; para5:pointer):TCPLErr;cdecl;
{* Contour generator opaque type  }

  PGDALContourGeneratorH = ^TGDALContourGeneratorH;
  TGDALContourGeneratorH = pointer;

function GDAL_CG_Create(nWidth:longint; nHeight:longint; bNoDataSet:longint; dfNoDataValue:Tdouble; dfContourInterval:Tdouble; 
           dfContourBase:Tdouble; pfnWriter:TGDALContourWriter; pCBData:pointer):TGDALContourGeneratorH;cdecl;external;
function GDAL_CG_FeedLine(hCG:TGDALContourGeneratorH; padfScanline:Pdouble):TCPLErr;cdecl;external;
procedure GDAL_CG_Destroy(hCG:TGDALContourGeneratorH);cdecl;external;
{! @cond Doxygen_Suppress  }
type
  POGRContourWriterInfo = ^TOGRContourWriterInfo;
  TOGRContourWriterInfo = record
      hLayer : pointer;
      adfGeoTransform : array[0..5] of Tdouble;
      nElevField : longint;
      nElevFieldMin : longint;
      nElevFieldMax : longint;
      nIDField : longint;
      nNextID : longint;
    end;

function OGRContourWriter(para1:Tdouble; para2:longint; para3:Pdouble; para4:Pdouble; pInfo:pointer):TCPLErr;cdecl;external;
{! @endcond  }
function GDALContourGenerate(hBand:TGDALRasterBandH; dfContourInterval:Tdouble; dfContourBase:Tdouble; nFixedLevelCount:longint; padfFixedLevels:Pdouble; 
           bUseNoData:longint; dfNoDataValue:Tdouble; hLayer:pointer; iIDField:longint; iElevField:longint; 
           pfnProgress:TGDALProgressFunc; pProgressArg:pointer):TCPLErr;cdecl;external;
function GDALContourGenerateEx(hBand:TGDALRasterBandH; hLayer:pointer; options:TCSLConstList; pfnProgress:TGDALProgressFunc; pProgressArg:pointer):TCPLErr;cdecl;external;
{ --------------------------------------------------------------------  }
{      Viewshed Generation                                              }
{ --------------------------------------------------------------------  }
{* Viewshed Modes  }
type
  PGDALViewshedMode = ^TGDALViewshedMode;
  TGDALViewshedMode =  Longint;
  Const
    GVM_Diagonal = 1;
    GVM_Edge = 2;
    GVM_Max = 3;
    GVM_Min = 4;
;
{* Viewshed output types  }
type
  PGDALViewshedOutputType = ^TGDALViewshedOutputType;
  TGDALViewshedOutputType =  Longint;
  Const
    GVOT_NORMAL = 1;
    GVOT_MIN_TARGET_HEIGHT_FROM_DEM = 2;
    GVOT_MIN_TARGET_HEIGHT_FROM_GROUND = 3;
;
(* Const before type ignored *)
(* Const before type ignored *)

function GDALViewshedGenerate(hBand:TGDALRasterBandH; pszDriverName:Pchar; pszTargetRasterName:Pchar; papszCreationOptions:TCSLConstList; dfObserverX:Tdouble; 
           dfObserverY:Tdouble; dfObserverHeight:Tdouble; dfTargetHeight:Tdouble; dfVisibleVal:Tdouble; dfInvisibleVal:Tdouble; 
           dfOutOfRangeVal:Tdouble; dfNoDataVal:Tdouble; dfCurvCoeff:Tdouble; eMode:TGDALViewshedMode; dfMaxDistance:Tdouble; 
           pfnProgress:TGDALProgressFunc; pProgressArg:pointer; heightMode:TGDALViewshedOutputType; papszExtraOptions:TCSLConstList):TGDALDatasetH;cdecl;external;
{********************************************************************** }
{      Rasterizer API - geometries burned into GDAL raster.             }
{********************************************************************** }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GDALRasterizeGeometries(hDS:TGDALDatasetH; nBandCount:longint; panBandList:Plongint; nGeomCount:longint; pahGeometries:POGRGeometryH; 
           pfnTransformer:TGDALTransformerFunc; pTransformArg:pointer; padfGeomBurnValues:Pdouble; papszOptions:TCSLConstList; pfnProgress:TGDALProgressFunc; 
           pProgressArg:pointer):TCPLErr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GDALRasterizeGeometriesInt64(hDS:TGDALDatasetH; nBandCount:longint; panBandList:Plongint; nGeomCount:longint; pahGeometries:POGRGeometryH; 
           pfnTransformer:TGDALTransformerFunc; pTransformArg:pointer; panGeomBurnValues:Pint64_t; papszOptions:TCSLConstList; pfnProgress:TGDALProgressFunc; 
           pProgressArg:pointer):TCPLErr;cdecl;external;
function GDALRasterizeLayers(hDS:TGDALDatasetH; nBandCount:longint; panBandList:Plongint; nLayerCount:longint; pahLayers:POGRLayerH; 
           pfnTransformer:TGDALTransformerFunc; pTransformArg:pointer; padfLayerBurnValues:Pdouble; papszOptions:PPchar; pfnProgress:TGDALProgressFunc; 
           pProgressArg:pointer):TCPLErr;cdecl;external;
(* Const before type ignored *)
function GDALRasterizeLayersBuf(pData:pointer; nBufXSize:longint; nBufYSize:longint; eBufType:TGDALDataType; nPixelSpace:longint; 
           nLineSpace:longint; nLayerCount:longint; pahLayers:POGRLayerH; pszDstProjection:Pchar; padfDstGeoTransform:Pdouble; 
           pfnTransformer:TGDALTransformerFunc; pTransformArg:pointer; dfBurnValue:Tdouble; papszOptions:PPchar; pfnProgress:TGDALProgressFunc; 
           pProgressArg:pointer):TCPLErr;cdecl;external;
{********************************************************************** }
{  Gridding interface.                                                  }
{********************************************************************** }
{* Gridding Algorithms  }
{! Inverse distance to a power  }{! Moving Average  }{! Nearest Neighbor  }{! Minimum Value (Data Metric)  }{! Maximum Value (Data Metric)  }{! Data Range (Data Metric)  }{! Number of Points (Data Metric)  }{! Average Distance (Data Metric)  }{! Average Distance Between Data Points (Data Metric)  }
{! Linear interpolation (from Delaunay triangulation. Since GDAL 2.1  }
{! Inverse distance to a power with nearest neighbor search for max points
      }
type
  PGDALGridAlgorithm = ^TGDALGridAlgorithm;
  TGDALGridAlgorithm =  Longint;
  Const
    GGA_InverseDistanceToAPower = 1;
    GGA_MovingAverage = 2;
    GGA_NearestNeighbor = 3;
    GGA_MetricMinimum = 4;
    GGA_MetricMaximum = 5;
    GGA_MetricRange = 6;
    GGA_MetricCount = 7;
    GGA_MetricAverageDistance = 8;
    GGA_MetricAverageDistancePts = 9;
    GGA_Linear = 10;
    GGA_InverseDistanceToAPowerNearestNeighbor = 11;
;
{* Inverse distance to a power method control options  }
{! Added in GDAL 3.6 to detect potential ABI issues. Should be set to
     * sizeof(GDALGridInverseDistanceToAPowerOptions)  }
{! Weighting power.  }
{! Smoothing parameter.  }
{! Reserved for future use.  }
{! Reserved for future use.  }
{! The first radius (X axis if rotation angle is 0) of search ellipse.  }
{! The second radius (Y axis if rotation angle is 0) of search ellipse.  }
{! Angle of ellipse rotation in degrees.
     *
     * Ellipse rotated counter clockwise.
      }
{! Maximum number of data points to use.
     *
     * Do not search for more points than this number.
      }
{! Minimum number of data points to use.
     *
     * If less amount of points found the grid node considered empty and will
     * be filled with NODATA marker.
      }
{! No data marker to fill empty points.  }
type
  PGDALGridInverseDistanceToAPowerOptions = ^TGDALGridInverseDistanceToAPowerOptions;
  TGDALGridInverseDistanceToAPowerOptions = record
      nSizeOfStructure : Tsize_t;
      dfPower : Tdouble;
      dfSmoothing : Tdouble;
      dfAnisotropyRatio : Tdouble;
      dfAnisotropyAngle : Tdouble;
      dfRadius1 : Tdouble;
      dfRadius2 : Tdouble;
      dfAngle : Tdouble;
      nMaxPoints : TGUInt32;
      nMinPoints : TGUInt32;
      dfNoDataValue : Tdouble;
    end;
{* Inverse distance to a power, with nearest neighbour search, control options
  }
{! Added in GDAL 3.6 to detect potential ABI issues. Should be set to
     * sizeof(GDALGridInverseDistanceToAPowerNearestNeighborOptions)  }
{! Weighting power.  }
{! The radius of search circle.  }
{! Smoothing parameter.  }
{! Maximum number of data points to use.
     *
     * Do not search for more points than this number.
      }
{! Minimum number of data points to use.
     *
     * If less amount of points found the grid node considered empty and will
     * be filled with NODATA marker.
      }
{! No data marker to fill empty points.  }
{! Maximum number of data points to use for each of the 4 quadrants.
     *
     * Do not search for more points than this number.
      }
{! Minimum number of data points to use for each of the 4 quadrants.
     *
     * If less amount of points found the grid node considered empty and will
     * be filled with NODATA marker.
      }

  PGDALGridInverseDistanceToAPowerNearestNeighborOptions = ^TGDALGridInverseDistanceToAPowerNearestNeighborOptions;
  TGDALGridInverseDistanceToAPowerNearestNeighborOptions = record
      nSizeOfStructure : Tsize_t;
      dfPower : Tdouble;
      dfRadius : Tdouble;
      dfSmoothing : Tdouble;
      nMaxPoints : TGUInt32;
      nMinPoints : TGUInt32;
      dfNoDataValue : Tdouble;
      nMaxPointsPerQuadrant : TGUInt32;
      nMinPointsPerQuadrant : TGUInt32;
    end;
{* Moving average method control options  }
{! Added in GDAL 3.6 to detect potential ABI issues. Should be set to
     * sizeof(GDALGridMovingAverageOptions)  }
{! The first radius (X axis if rotation angle is 0) of search ellipse.  }
{! The second radius (Y axis if rotation angle is 0) of search ellipse.  }
{! Angle of ellipse rotation in degrees.
     *
     * Ellipse rotated counter clockwise.
      }
{! Maximum number of data points to use.
     *
     * Do not search for more points than this number.
      }
{! Minimum number of data points to average.
     *
     * If less amount of points found the grid node considered empty and will
     * be filled with NODATA marker.
      }
{! No data marker to fill empty points.  }
{! Maximum number of data points to use for each of the 4 quadrants.
     *
     * Do not search for more points than this number.
      }
{! Minimum number of data points to use for each of the 4 quadrants.
     *
     * If less amount of points found the grid node considered empty and will
     * be filled with NODATA marker.
      }

  PGDALGridMovingAverageOptions = ^TGDALGridMovingAverageOptions;
  TGDALGridMovingAverageOptions = record
      nSizeOfStructure : Tsize_t;
      dfRadius1 : Tdouble;
      dfRadius2 : Tdouble;
      dfAngle : Tdouble;
      nMaxPoints : TGUInt32;
      nMinPoints : TGUInt32;
      dfNoDataValue : Tdouble;
      nMaxPointsPerQuadrant : TGUInt32;
      nMinPointsPerQuadrant : TGUInt32;
    end;
{* Nearest neighbor method control options  }
{! Added in GDAL 3.6 to detect potential ABI issues. Should be set to
     * sizeof(GDALGridNearestNeighborOptions)  }
{! The first radius (X axis if rotation angle is 0) of search ellipse.  }
{! The second radius (Y axis if rotation angle is 0) of search ellipse.  }
{! Angle of ellipse rotation in degrees.
     *
     * Ellipse rotated counter clockwise.
      }
{! No data marker to fill empty points.  }

  PGDALGridNearestNeighborOptions = ^TGDALGridNearestNeighborOptions;
  TGDALGridNearestNeighborOptions = record
      nSizeOfStructure : Tsize_t;
      dfRadius1 : Tdouble;
      dfRadius2 : Tdouble;
      dfAngle : Tdouble;
      dfNoDataValue : Tdouble;
    end;
{* Data metrics method control options  }
{! Added in GDAL 3.6 to detect potential ABI issues. Should be set to
     * sizeof(GDALGridDataMetricsOptions)  }
{! The first radius (X axis if rotation angle is 0) of search ellipse.  }
{! The second radius (Y axis if rotation angle is 0) of search ellipse.  }
{! Angle of ellipse rotation in degrees.
     *
     * Ellipse rotated counter clockwise.
      }
{! Minimum number of data points to average.
     *
     * If less amount of points found the grid node considered empty and will
     * be filled with NODATA marker.
      }
{! No data marker to fill empty points.  }
{! Maximum number of data points to use for each of the 4 quadrants.
     *
     * Do not search for more points than this number.
      }
{! Minimum number of data points to use for each of the 4 quadrants.
     *
     * If less amount of points found the grid node considered empty and will
     * be filled with NODATA marker.
      }

  PGDALGridDataMetricsOptions = ^TGDALGridDataMetricsOptions;
  TGDALGridDataMetricsOptions = record
      nSizeOfStructure : Tsize_t;
      dfRadius1 : Tdouble;
      dfRadius2 : Tdouble;
      dfAngle : Tdouble;
      nMinPoints : TGUInt32;
      dfNoDataValue : Tdouble;
      nMaxPointsPerQuadrant : TGUInt32;
      nMinPointsPerQuadrant : TGUInt32;
    end;
{* Linear method control options  }
{! Added in GDAL 3.6 to detect potential ABI issues. Should be set to
     * sizeof(GDALGridLinearOptions)  }
{! In case the point to be interpolated does not fit into a triangle of
     * the Delaunay triangulation, use that maximum distance to search a nearest
     * neighbour, or use nodata otherwise. If set to -1, the search distance is
     * infinite. If set to 0, nodata value will be always used.
      }
{! No data marker to fill empty points.  }

  PGDALGridLinearOptions = ^TGDALGridLinearOptions;
  TGDALGridLinearOptions = record
      nSizeOfStructure : Tsize_t;
      dfRadius : Tdouble;
      dfNoDataValue : Tdouble;
    end;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function GDALGridCreate(para1:TGDALGridAlgorithm; para2:pointer; para3:TGUInt32; para4:Pdouble; para5:Pdouble; 
           para6:Pdouble; para7:Tdouble; para8:Tdouble; para9:Tdouble; para10:Tdouble; 
           para11:TGUInt32; para12:TGUInt32; para13:TGDALDataType; para14:pointer; para15:TGDALProgressFunc; 
           para16:pointer):TCPLErr;cdecl;external;
{* Grid context opaque type  }
type
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function GDALGridContextCreate(eAlgorithm:TGDALGridAlgorithm; poOptions:pointer; nPoints:TGUInt32; padfX:Pdouble; padfY:Pdouble; 
           padfZ:Pdouble; bCallerWillKeepPointArraysAlive:longint):PGDALGridContext;cdecl;external;
procedure GDALGridContextFree(psContext:PGDALGridContext);cdecl;external;
function GDALGridContextProcess(psContext:PGDALGridContext; dfXMin:Tdouble; dfXMax:Tdouble; dfYMin:Tdouble; dfYMax:Tdouble; 
           nXSize:TGUInt32; nYSize:TGUInt32; eType:TGDALDataType; pData:pointer; pfnProgress:TGDALProgressFunc; 
           pProgressArg:pointer):TCPLErr;cdecl;external;
function GDALComputeMatchingPoints(hFirstImage:TGDALDatasetH; hSecondImage:TGDALDatasetH; papszOptions:PPchar; pnGCPCount:Plongint):PGDAL_GCP;cdecl;external;
{********************************************************************** }
{  Delaunay triangulation interface.                                    }
{********************************************************************** }
{* Triangle fact  }
{*< index to the padfX/padfY arrays  }
{*< index to GDALDelaunayTriangulation.pasFacets, or
                             -1  }
{ anNeighborIdx[k] is the triangle to the opposite side  }
{ of the opposite segment of anVertexIdx[k]  }
type
  PGDALTriFacet = ^TGDALTriFacet;
  TGDALTriFacet = record
      anVertexIdx : array[0..2] of longint;
      anNeighborIdx : array[0..2] of longint;
    end;
{* Triangle barycentric coefficients.
 *
 * Conversion from cartesian (x,y) to barycentric (l1,l2,l3) with :
 *  l1 = dfMul1X * (x - dfCxtX) + dfMul1Y * (y - dfCstY)
 *  l2 = dfMul2X * (x - dfCxtX) + dfMul2Y * (y - dfCstY)
 *  l3 = 1 - l1 - l2
  }
{*< dfMul1X  }
{*< dfMul1Y  }
{*< dfMul2X  }
{*< dfMul2Y  }
{*< dfCstX  }
{*< dfCstY  }

  PGDALTriBarycentricCoefficients = ^TGDALTriBarycentricCoefficients;
  TGDALTriBarycentricCoefficients = record
      dfMul1X : Tdouble;
      dfMul1Y : Tdouble;
      dfMul2X : Tdouble;
      dfMul2Y : Tdouble;
      dfCstX : Tdouble;
      dfCstY : Tdouble;
    end;
{* Triangulation structure  }
{*< number of facets  }
{*< array of nFacets facets  }
{*< arra of nFacets barycentric coefficients  }

  PGDALTriangulation = ^TGDALTriangulation;
  TGDALTriangulation = record
      nFacets : longint;
      pasFacets : PGDALTriFacet;
      pasFacetCoefficients : PGDALTriBarycentricCoefficients;
    end;

function GDALHasTriangulation:longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GDALTriangulationCreateDelaunay(nPoints:longint; padfX:Pdouble; padfY:Pdouble):PGDALTriangulation;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GDALTriangulationComputeBarycentricCoefficients(psDT:PGDALTriangulation; padfX:Pdouble; padfY:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
function GDALTriangulationComputeBarycentricCoordinates(psDT:PGDALTriangulation; nFacetIdx:longint; dfX:Tdouble; dfY:Tdouble; pdfL1:Pdouble; 
           pdfL2:Pdouble; pdfL3:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
function GDALTriangulationFindFacetBruteForce(psDT:PGDALTriangulation; dfX:Tdouble; dfY:Tdouble; panOutputFacetIdx:Plongint):longint;cdecl;external;
(* Const before type ignored *)
function GDALTriangulationFindFacetDirected(psDT:PGDALTriangulation; nFacetIdx:longint; dfX:Tdouble; dfY:Tdouble; panOutputFacetIdx:Plongint):longint;cdecl;external;
procedure GDALTriangulationFree(psDT:PGDALTriangulation);cdecl;external;
{! @cond Doxygen_Suppress  }
{$ifndef CPL_WARN_DEPRECATED_GDALOpenVerticalShiftGrid}

const
  CPL_WARN_DEPRECATED_GDALOpenVerticalShiftGrid = CPL_WARN_DEPRECATED;  
{$endif}
{! @endcond  }
(* Const before type ignored *)
{! @cond Doxygen_Suppress  }
{    CPL_WARN_DEPRECATED_GDALOpenVerticalShiftGrid( }
{        "GDALOpenVerticalShiftGrid() will be removed in GDAL 4.0") }
{! @endcond  }

function GDALOpenVerticalShiftGrid(pszProj4Geoidgrids:Pchar; pbError:Plongint):TGDALDatasetH;cdecl;external;
{! @cond Doxygen_Suppress  }
{$ifndef CPL_WARN_DEPRECATED_GDALApplyVerticalShiftGrid}

const
  CPL_WARN_DEPRECATED_GDALApplyVerticalShiftGrid = CPL_WARN_DEPRECATED;  
{$endif}
{! @endcond  }
(* Const before type ignored *)
(* Const before declarator ignored *)
{! @cond Doxygen_Suppress  }
{    CPL_WARN_DEPRECATED_GDALApplyVerticalShiftGrid( }
{        "GDALApplyVerticalShiftGrid() will be removed in GDAL 4.0") }
{! @endcond  }

function GDALApplyVerticalShiftGrid(hSrcDataset:TGDALDatasetH; hGridDataset:TGDALDatasetH; bInverse:longint; dfSrcUnitToMeter:Tdouble; dfDstUnitToMeter:Tdouble; 
           papszOptions:PPchar):TGDALDatasetH;cdecl;external;
{$endif}
{ ndef GDAL_ALG_H_INCLUDED  }

implementation


end.
