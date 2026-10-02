/******************************************************************************
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
 ****************************************************************************/

#ifndef GDAL_ALG_H_INCLUDED
#define GDAL_ALG_H_INCLUDED

/**
 * \file gdal_alg.h
 *
 * Public (C callable) GDAL algorithm entry points, and definitions.
 */

#ifndef DOXYGEN_SKIP
#include "gdal.h"
#include "cpl_minixml.h"
#include "ogr_api.h"
#include <stdint.h>
#endif



int   GDALComputeMedianCutPCT(
    GDALRasterBandH hRed, GDALRasterBandH hGreen, GDALRasterBandH hBlue,
    int (*pfnIncludePixel)(int, int, void *), int nColors,
    GDALColorTableH hColorTable, GDALProgressFunc pfnProgress,
    void *pProgressArg);

int   GDALDitherRGB2PCT(
    GDALRasterBandH hRed, GDALRasterBandH hGreen, GDALRasterBandH hBlue,
    GDALRasterBandH hTarget, GDALColorTableH hColorTable,
    GDALProgressFunc pfnProgress, void *pProgressArg);

int   GDALChecksumImage(GDALRasterBandH hBand, int nXOff,
                                          int nYOff, int nXSize, int nYSize);

CPLErr   GDALComputeProximity(GDALRasterBandH hSrcBand,
                                                GDALRasterBandH hProximityBand,
                                                char **papszOptions,
                                                GDALProgressFunc pfnProgress,
                                                void *pProgressArg);

CPLErr   GDALFillNodata(
    GDALRasterBandH hTargetBand, GDALRasterBandH hMaskBand,
    double dfMaxSearchDist, int bDeprecatedOption, int nSmoothingIterations,
    char **papszOptions, GDALProgressFunc pfnProgress, void *pProgressArg);

CPLErr   GDALPolygonize(GDALRasterBandH hSrcBand,
                                          GDALRasterBandH hMaskBand,
                                          OGRLayerH hOutLayer, int iPixValField,
                                          char **papszOptions,
                                          GDALProgressFunc pfnProgress,
                                          void *pProgressArg);

CPLErr  
GDALFPolygonize(GDALRasterBandH hSrcBand, GDALRasterBandH hMaskBand,
                OGRLayerH hOutLayer, int iPixValField, char **papszOptions,
                GDALProgressFunc pfnProgress, void *pProgressArg);

CPLErr   GDALSieveFilter(
    GDALRasterBandH hSrcBand, GDALRasterBandH hMaskBand,
    GDALRasterBandH hDstBand, int nSizeThreshold, int nConnectedness,
    char **papszOptions, GDALProgressFunc pfnProgress, void *pProgressArg);

/*
 * Warp Related.
 */

typedef int (*GDALTransformerFunc)(void *pTransformerArg, int bDstToSrc,
                                   int nPointCount, double *x, double *y,
                                   double *z, int *panSuccess);

/*! @cond Doxygen_Suppress */
#define GDAL_GTI2_SIGNATURE "GTI2"

typedef struct
{
    GByte abySignature[4];
    const char *pszClassName;
    GDALTransformerFunc pfnTransform;
    void (*pfnCleanup)(void *pTransformerArg);
    CPLXMLNode *(*pfnSerialize)(void *pTransformerArg);
    void *(*pfnCreateSimilar)(void *pTransformerArg, double dfSrcRatioX,
                              double dfSrcRatioY);
} GDALTransformerInfo;
/*! @endcond */

/*! @cond Doxygen_Suppress */
void  GDALDestroyTransformer(void *pTransformerArg);
int  GDALUseTransformer(void *pTransformerArg, int bDstToSrc,
                               int nPointCount, double *x, double *y, double *z,
                               int *panSuccess);
void *GDALCreateSimilarTransformer(void *psTransformerArg, double dfSrcRatioX,
                                   double dfSrcRatioY);
/*! @endcond */

/* High level transformer for going from image coordinates on one file
   to image coordinates on another, potentially doing reprojection,
   utilizing GCPs or using the geotransform. */

void  *
GDALCreateGenImgProjTransformer(GDALDatasetH hSrcDS, const char *pszSrcWKT,
                                GDALDatasetH hDstDS, const char *pszDstWKT,
                                int bGCPUseOK, double dfGCPErrorThreshold,
                                int nOrder);
void  *GDALCreateGenImgProjTransformer2(GDALDatasetH hSrcDS,
                                               GDALDatasetH hDstDS,
                                               char **papszOptions);
void  *GDALCreateGenImgProjTransformer3(
    const char *pszSrcWKT, const double *padfSrcGeoTransform,
    const char *pszDstWKT, const double *padfDstGeoTransform);

void  *GDALCreateGenImgProjTransformer4(
    OGRSpatialReferenceH hSrcSRS, const double *padfSrcGeoTransform,
    OGRSpatialReferenceH hDstSRS, const double *padfDstGeoTransform,
    const char *const *papszOptions);

void  GDALSetGenImgProjTransformerDstGeoTransform(void *,
                                                         const double *);
void  GDALDestroyGenImgProjTransformer(void *);
int  GDALGenImgProjTransform(void *pTransformArg, int bDstToSrc,
                                    int nPointCount, double *x, double *y,
                                    double *z, int *panSuccess);

void GDALSetTransformerDstGeoTransform(void *, const double *);
void GDALGetTransformerDstGeoTransform(void *, double *);

/* Geo to geo reprojection transformer. */
void  *GDALCreateReprojectionTransformer(const char *pszSrcWKT,
                                                const char *pszDstWKT);
void  *
GDALCreateReprojectionTransformerEx(OGRSpatialReferenceH hSrcSRS,
                                    OGRSpatialReferenceH hDstSRS,
                                    const char *const *papszOptions);
void  GDALDestroyReprojectionTransformer(void *);
int  GDALReprojectionTransform(void *pTransformArg, int bDstToSrc,
                                      int nPointCount, double *x, double *y,
                                      double *z, int *panSuccess);

/* GCP based transformer ... forward is to georef coordinates */
void  *GDALCreateGCPTransformer(int nGCPCount,
                                       const GDAL_GCP *pasGCPList,
                                       int nReqOrder, int bReversed);

/* GCP based transformer with refinement of the GCPs ... forward is to georef
 * coordinates */
void  *GDALCreateGCPRefineTransformer(int nGCPCount,
                                             const GDAL_GCP *pasGCPList,
                                             int nReqOrder, int bReversed,
                                             double tolerance, int minimumGcps);

void  GDALDestroyGCPTransformer(void *pTransformArg);
int  GDALGCPTransform(void *pTransformArg, int bDstToSrc,
                             int nPointCount, double *x, double *y, double *z,
                             int *panSuccess);

/* Thin Plate Spine transformer ... forward is to georef coordinates */

void  *GDALCreateTPSTransformer(int nGCPCount,
                                       const GDAL_GCP *pasGCPList,
                                       int bReversed);
void  GDALDestroyTPSTransformer(void *pTransformArg);
int  GDALTPSTransform(void *pTransformArg, int bDstToSrc,
                             int nPointCount, double *x, double *y, double *z,
                             int *panSuccess);

/*! @cond Doxygen_Suppress */
#ifdef GDAL_COMPILATION
#define RPCInfoV1ToMD RPCInfoToMD
#else
#define RPCInfoToMD RPCInfoV2ToMD
#endif
char  **RPCInfoV1ToMD(GDALRPCInfoV1 *psRPCInfo);
char  **RPCInfoV2ToMD(GDALRPCInfoV2 *psRPCInfo);
/*! @endcond */

/* RPC based transformer ... src is pixel/line/elev, dst is long/lat/elev */

/*! @cond Doxygen_Suppress */
#ifdef GDAL_COMPILATION
#define GDALCreateRPCTransformerV1 GDALCreateRPCTransformer
#else
#define GDALCreateRPCTransformer GDALCreateRPCTransformerV2
#endif

void  *GDALCreateRPCTransformerV1(GDALRPCInfoV1 *psRPC, int bReversed,
                                         double dfPixErrThreshold,
                                         char **papszOptions);
/*! @endcond */

void  *GDALCreateRPCTransformerV2(const GDALRPCInfoV2 *psRPC,
                                         int bReversed,
                                         double dfPixErrThreshold,
                                         char **papszOptions);

void  GDALDestroyRPCTransformer(void *pTransformArg);
int  GDALRPCTransform(void *pTransformArg, int bDstToSrc,
                             int nPointCount, double *x, double *y, double *z,
                             int *panSuccess);

/* Geolocation transformer */

void  *GDALCreateGeoLocTransformer(GDALDatasetH hBaseDS,
                                          char **papszGeolocationInfo,
                                          int bReversed);
void  GDALDestroyGeoLocTransformer(void *pTransformArg);
int  GDALGeoLocTransform(void *pTransformArg, int bDstToSrc,
                                int nPointCount, double *x, double *y,
                                double *z, int *panSuccess);

/* Approximate transformer */
void  *GDALCreateApproxTransformer(GDALTransformerFunc pfnRawTransformer,
                                          void *pRawTransformerArg,
                                          double dfMaxError);
void  GDALApproxTransformerOwnsSubtransformer(void *pCBData,
                                                     int bOwnFlag);
void  GDALDestroyApproxTransformer(void *pApproxArg);
int  GDALApproxTransform(void *pTransformArg, int bDstToSrc,
                                int nPointCount, double *x, double *y,
                                double *z, int *panSuccess);

int   GDALSimpleImageWarp(
    GDALDatasetH hSrcDS, GDALDatasetH hDstDS, int nBandCount, int *panBandList,
    GDALTransformerFunc pfnTransform, void *pTransformArg,
    GDALProgressFunc pfnProgress, void *pProgressArg, char **papszWarpOptions);

CPLErr  
GDALSuggestedWarpOutput(GDALDatasetH hSrcDS, GDALTransformerFunc pfnTransformer,
                        void *pTransformArg, double *padfGeoTransformOut,
                        int *pnPixels, int *pnLines);

/** Flag for GDALSuggestedWarpOutput2() to ask to round-up output size */
#define GDAL_SWO_ROUND_UP_SIZE 0x1

CPLErr   GDALSuggestedWarpOutput2(
    GDALDatasetH hSrcDS, GDALTransformerFunc pfnTransformer,
    void *pTransformArg, double *padfGeoTransformOut, int *pnPixels,
    int *pnLines, double *padfExtent, int nOptions);

/*! @cond Doxygen_Suppress */
CPLXMLNode  *GDALSerializeTransformer(GDALTransformerFunc pfnFunc,
                                             void *pTransformArg);
CPLErr  GDALDeserializeTransformer(CPLXMLNode *psTree,
                                          GDALTransformerFunc *ppfnFunc,
                                          void **ppTransformArg);
/*! @endcond */

CPLErr  GDALTransformGeolocations(
    GDALRasterBandH hXBand, GDALRasterBandH hYBand, GDALRasterBandH hZBand,
    GDALTransformerFunc pfnTransformer, void *pTransformArg,
    GDALProgressFunc pfnProgress, void *pProgressArg, char **papszOptions);

/* -------------------------------------------------------------------- */
/*      Contour Line Generation                                         */
/* -------------------------------------------------------------------- */

/** Contour writer callback type */
typedef CPLErr (*GDALContourWriter)(double dfLevel, int nPoints, double *padfX,
                                    double *padfY, void *);

/** Contour generator opaque type */
typedef void *GDALContourGeneratorH;

GDALContourGeneratorH 
GDAL_CG_Create(int nWidth, int nHeight, int bNoDataSet, double dfNoDataValue,
               double dfContourInterval, double dfContourBase,
               GDALContourWriter pfnWriter, void *pCBData);
CPLErr  GDAL_CG_FeedLine(GDALContourGeneratorH hCG,
                                double *padfScanline);
void  GDAL_CG_Destroy(GDALContourGeneratorH hCG);

/*! @cond Doxygen_Suppress */
typedef struct
{
    void *hLayer;

    double adfGeoTransform[6];

    int nElevField;
    int nElevFieldMin;
    int nElevFieldMax;
    int nIDField;
    int nNextID;
} OGRContourWriterInfo;

CPLErr  OGRContourWriter(double, int, double *, double *, void *pInfo);
/*! @endcond */

CPLErr  GDALContourGenerate(
    GDALRasterBandH hBand, double dfContourInterval, double dfContourBase,
    int nFixedLevelCount, double *padfFixedLevels, int bUseNoData,
    double dfNoDataValue, void *hLayer, int iIDField, int iElevField,
    GDALProgressFunc pfnProgress, void *pProgressArg);

CPLErr  GDALContourGenerateEx(GDALRasterBandH hBand, void *hLayer,
                                     CSLConstList options,
                                     GDALProgressFunc pfnProgress,
                                     void *pProgressArg);

/* -------------------------------------------------------------------- */
/*      Viewshed Generation                                             */
/* -------------------------------------------------------------------- */

/** Viewshed Modes */
typedef enum
{
    GVM_Diagonal = 1,
    GVM_Edge = 2,
    GVM_Max = 3,
    GVM_Min = 4
} GDALViewshedMode;

/** Viewshed output types */
typedef enum
{
    GVOT_NORMAL = 1,
    GVOT_MIN_TARGET_HEIGHT_FROM_DEM = 2,
    GVOT_MIN_TARGET_HEIGHT_FROM_GROUND = 3
} GDALViewshedOutputType;

GDALDatasetH  GDALViewshedGenerate(
    GDALRasterBandH hBand, const char *pszDriverName,
    const char *pszTargetRasterName, CSLConstList papszCreationOptions,
    double dfObserverX, double dfObserverY, double dfObserverHeight,
    double dfTargetHeight, double dfVisibleVal, double dfInvisibleVal,
    double dfOutOfRangeVal, double dfNoDataVal, double dfCurvCoeff,
    GDALViewshedMode eMode, double dfMaxDistance, GDALProgressFunc pfnProgress,
    void *pProgressArg, GDALViewshedOutputType heightMode,
    CSLConstList papszExtraOptions);

/************************************************************************/
/*      Rasterizer API - geometries burned into GDAL raster.            */
/************************************************************************/

CPLErr  GDALRasterizeGeometries(
    GDALDatasetH hDS, int nBandCount, const int *panBandList, int nGeomCount,
    const OGRGeometryH *pahGeometries, GDALTransformerFunc pfnTransformer,
    void *pTransformArg, const double *padfGeomBurnValues,
    CSLConstList papszOptions, GDALProgressFunc pfnProgress,
    void *pProgressArg);

CPLErr  GDALRasterizeGeometriesInt64(
    GDALDatasetH hDS, int nBandCount, const int *panBandList, int nGeomCount,
    const OGRGeometryH *pahGeometries, GDALTransformerFunc pfnTransformer,
    void *pTransformArg, const int64_t *panGeomBurnValues,
    CSLConstList papszOptions, GDALProgressFunc pfnProgress,
    void *pProgressArg);

CPLErr  GDALRasterizeLayers(
    GDALDatasetH hDS, int nBandCount, int *panBandList, int nLayerCount,
    OGRLayerH *pahLayers, GDALTransformerFunc pfnTransformer,
    void *pTransformArg, double *padfLayerBurnValues, char **papszOptions,
    GDALProgressFunc pfnProgress, void *pProgressArg);

CPLErr  GDALRasterizeLayersBuf(
    void *pData, int nBufXSize, int nBufYSize, GDALDataType eBufType,
    int nPixelSpace, int nLineSpace, int nLayerCount, OGRLayerH *pahLayers,
    const char *pszDstProjection, double *padfDstGeoTransform,
    GDALTransformerFunc pfnTransformer, void *pTransformArg, double dfBurnValue,
    char **papszOptions, GDALProgressFunc pfnProgress, void *pProgressArg);

/************************************************************************/
/*  Gridding interface.                                                 */
/************************************************************************/

/** Gridding Algorithms */
typedef enum
{
    /*! Inverse distance to a power */ GGA_InverseDistanceToAPower = 1,
    /*! Moving Average */ GGA_MovingAverage = 2,
    /*! Nearest Neighbor */ GGA_NearestNeighbor = 3,
    /*! Minimum Value (Data Metric) */ GGA_MetricMinimum = 4,
    /*! Maximum Value (Data Metric) */ GGA_MetricMaximum = 5,
    /*! Data Range (Data Metric) */ GGA_MetricRange = 6,
    /*! Number of Points (Data Metric) */ GGA_MetricCount = 7,
    /*! Average Distance (Data Metric) */ GGA_MetricAverageDistance = 8,
    /*! Average Distance Between Data Points (Data Metric) */
    GGA_MetricAverageDistancePts = 9,
    /*! Linear interpolation (from Delaunay triangulation. Since GDAL 2.1 */
    GGA_Linear = 10,
    /*! Inverse distance to a power with nearest neighbor search for max points
     */
    GGA_InverseDistanceToAPowerNearestNeighbor = 11
} GDALGridAlgorithm;

/** Inverse distance to a power method control options */
typedef struct
{
    /*! Added in GDAL 3.6 to detect potential ABI issues. Should be set to
     * sizeof(GDALGridInverseDistanceToAPowerOptions) */
    size_t nSizeOfStructure;
    /*! Weighting power. */
    double dfPower;
    /*! Smoothing parameter. */
    double dfSmoothing;
    /*! Reserved for future use. */
    double dfAnisotropyRatio;
    /*! Reserved for future use. */
    double dfAnisotropyAngle;
    /*! The first radius (X axis if rotation angle is 0) of search ellipse. */
    double dfRadius1;
    /*! The second radius (Y axis if rotation angle is 0) of search ellipse. */
    double dfRadius2;
    /*! Angle of ellipse rotation in degrees.
     *
     * Ellipse rotated counter clockwise.
     */
    double dfAngle;
    /*! Maximum number of data points to use.
     *
     * Do not search for more points than this number.
     */
    GUInt32 nMaxPoints;
    /*! Minimum number of data points to use.
     *
     * If less amount of points found the grid node considered empty and will
     * be filled with NODATA marker.
     */
    GUInt32 nMinPoints;
    /*! No data marker to fill empty points. */
    double dfNoDataValue;
} GDALGridInverseDistanceToAPowerOptions;

/** Inverse distance to a power, with nearest neighbour search, control options
 */
typedef struct
{
    /*! Added in GDAL 3.6 to detect potential ABI issues. Should be set to
     * sizeof(GDALGridInverseDistanceToAPowerNearestNeighborOptions) */
    size_t nSizeOfStructure;
    /*! Weighting power. */
    double dfPower;
    /*! The radius of search circle. */
    double dfRadius;
    /*! Smoothing parameter. */
    double dfSmoothing;

    /*! Maximum number of data points to use.
     *
     * Do not search for more points than this number.
     */
    GUInt32 nMaxPoints;
    /*! Minimum number of data points to use.
     *
     * If less amount of points found the grid node considered empty and will
     * be filled with NODATA marker.
     */
    GUInt32 nMinPoints;
    /*! No data marker to fill empty points. */
    double dfNoDataValue;
    /*! Maximum number of data points to use for each of the 4 quadrants.
     *
     * Do not search for more points than this number.
     */
    GUInt32 nMaxPointsPerQuadrant;
    /*! Minimum number of data points to use for each of the 4 quadrants.
     *
     * If less amount of points found the grid node considered empty and will
     * be filled with NODATA marker.
     */
    GUInt32 nMinPointsPerQuadrant;
} GDALGridInverseDistanceToAPowerNearestNeighborOptions;

/** Moving average method control options */
typedef struct
{
    /*! Added in GDAL 3.6 to detect potential ABI issues. Should be set to
     * sizeof(GDALGridMovingAverageOptions) */
    size_t nSizeOfStructure;
    /*! The first radius (X axis if rotation angle is 0) of search ellipse. */
    double dfRadius1;
    /*! The second radius (Y axis if rotation angle is 0) of search ellipse. */
    double dfRadius2;
    /*! Angle of ellipse rotation in degrees.
     *
     * Ellipse rotated counter clockwise.
     */
    double dfAngle;
    /*! Maximum number of data points to use.
     *
     * Do not search for more points than this number.
     */
    GUInt32 nMaxPoints;
    /*! Minimum number of data points to average.
     *
     * If less amount of points found the grid node considered empty and will
     * be filled with NODATA marker.
     */
    GUInt32 nMinPoints;
    /*! No data marker to fill empty points. */
    double dfNoDataValue;
    /*! Maximum number of data points to use for each of the 4 quadrants.
     *
     * Do not search for more points than this number.
     */
    GUInt32 nMaxPointsPerQuadrant;
    /*! Minimum number of data points to use for each of the 4 quadrants.
     *
     * If less amount of points found the grid node considered empty and will
     * be filled with NODATA marker.
     */
    GUInt32 nMinPointsPerQuadrant;
} GDALGridMovingAverageOptions;

/** Nearest neighbor method control options */
typedef struct
{
    /*! Added in GDAL 3.6 to detect potential ABI issues. Should be set to
     * sizeof(GDALGridNearestNeighborOptions) */
    size_t nSizeOfStructure;
    /*! The first radius (X axis if rotation angle is 0) of search ellipse. */
    double dfRadius1;
    /*! The second radius (Y axis if rotation angle is 0) of search ellipse. */
    double dfRadius2;
    /*! Angle of ellipse rotation in degrees.
     *
     * Ellipse rotated counter clockwise.
     */
    double dfAngle;
    /*! No data marker to fill empty points. */
    double dfNoDataValue;
} GDALGridNearestNeighborOptions;

/** Data metrics method control options */
typedef struct
{
    /*! Added in GDAL 3.6 to detect potential ABI issues. Should be set to
     * sizeof(GDALGridDataMetricsOptions) */
    size_t nSizeOfStructure;
    /*! The first radius (X axis if rotation angle is 0) of search ellipse. */
    double dfRadius1;
    /*! The second radius (Y axis if rotation angle is 0) of search ellipse. */
    double dfRadius2;
    /*! Angle of ellipse rotation in degrees.
     *
     * Ellipse rotated counter clockwise.
     */
    double dfAngle;
    /*! Minimum number of data points to average.
     *
     * If less amount of points found the grid node considered empty and will
     * be filled with NODATA marker.
     */
    GUInt32 nMinPoints;
    /*! No data marker to fill empty points. */
    double dfNoDataValue;
    /*! Maximum number of data points to use for each of the 4 quadrants.
     *
     * Do not search for more points than this number.
     */
    GUInt32 nMaxPointsPerQuadrant;
    /*! Minimum number of data points to use for each of the 4 quadrants.
     *
     * If less amount of points found the grid node considered empty and will
     * be filled with NODATA marker.
     */
    GUInt32 nMinPointsPerQuadrant;
} GDALGridDataMetricsOptions;

/** Linear method control options */
typedef struct
{
    /*! Added in GDAL 3.6 to detect potential ABI issues. Should be set to
     * sizeof(GDALGridLinearOptions) */
    size_t nSizeOfStructure;
    /*! In case the point to be interpolated does not fit into a triangle of
     * the Delaunay triangulation, use that maximum distance to search a nearest
     * neighbour, or use nodata otherwise. If set to -1, the search distance is
     * infinite. If set to 0, nodata value will be always used.
     */
    double dfRadius;
    /*! No data marker to fill empty points. */
    double dfNoDataValue;
} GDALGridLinearOptions;

CPLErr  GDALGridCreate(GDALGridAlgorithm, const void *, GUInt32,
                              const double *, const double *, const double *,
                              double, double, double, double, GUInt32, GUInt32,
                              GDALDataType, void *, GDALProgressFunc, void *);

/** Grid context opaque type */
typedef struct GDALGridContext GDALGridContext;

GDALGridContext  *
GDALGridContextCreate(GDALGridAlgorithm eAlgorithm, const void *poOptions,
                      GUInt32 nPoints, const double *padfX, const double *padfY,
                      const double *padfZ, int bCallerWillKeepPointArraysAlive);

void  GDALGridContextFree(GDALGridContext *psContext);

CPLErr  GDALGridContextProcess(GDALGridContext *psContext, double dfXMin,
                                      double dfXMax, double dfYMin,
                                      double dfYMax, GUInt32 nXSize,
                                      GUInt32 nYSize, GDALDataType eType,
                                      void *pData, GDALProgressFunc pfnProgress,
                                      void *pProgressArg);

GDAL_GCP  *GDALComputeMatchingPoints(GDALDatasetH hFirstImage,
                                            GDALDatasetH hSecondImage,
                                            char **papszOptions,
                                            int *pnGCPCount);

/************************************************************************/
/*  Delaunay triangulation interface.                                   */
/************************************************************************/

/** Triangle fact */
typedef struct
{
    int anVertexIdx[3];   /**< index to the padfX/padfY arrays */
    int anNeighborIdx[3]; /**< index to GDALDelaunayTriangulation.pasFacets, or
                             -1 */
    /* anNeighborIdx[k] is the triangle to the opposite side */
    /* of the opposite segment of anVertexIdx[k] */
} GDALTriFacet;

/** Triangle barycentric coefficients.
 *
 * Conversion from cartesian (x,y) to barycentric (l1,l2,l3) with :
 *  l1 = dfMul1X * (x - dfCxtX) + dfMul1Y * (y - dfCstY)
 *  l2 = dfMul2X * (x - dfCxtX) + dfMul2Y * (y - dfCstY)
 *  l3 = 1 - l1 - l2
 */
typedef struct
{
    double dfMul1X; /**< dfMul1X */
    double dfMul1Y; /**< dfMul1Y */
    double dfMul2X; /**< dfMul2X */
    double dfMul2Y; /**< dfMul2Y */
    double dfCstX;  /**< dfCstX */
    double dfCstY;  /**< dfCstY */
} GDALTriBarycentricCoefficients;

/** Triangulation structure */
typedef struct
{
    int nFacets;             /**< number of facets */
    GDALTriFacet *pasFacets; /**< array of nFacets facets */
    GDALTriBarycentricCoefficients
        *pasFacetCoefficients; /**< arra of nFacets barycentric coefficients */
} GDALTriangulation;

int  GDALHasTriangulation(void);

GDALTriangulation  *GDALTriangulationCreateDelaunay(int nPoints,
                                                           const double *padfX,
                                                           const double *padfY);
int  GDALTriangulationComputeBarycentricCoefficients(
    GDALTriangulation *psDT, const double *padfX, const double *padfY);
int  GDALTriangulationComputeBarycentricCoordinates(
    const GDALTriangulation *psDT, int nFacetIdx, double dfX, double dfY,
    double *pdfL1, double *pdfL2, double *pdfL3);
int  GDALTriangulationFindFacetBruteForce(const GDALTriangulation *psDT,
                                                 double dfX, double dfY,
                                                 int *panOutputFacetIdx);
int  GDALTriangulationFindFacetDirected(const GDALTriangulation *psDT,
                                               int nFacetIdx, double dfX,
                                               double dfY,
                                               int *panOutputFacetIdx);
void  GDALTriangulationFree(GDALTriangulation *psDT);

/*! @cond Doxygen_Suppress */
#ifndef CPL_WARN_DEPRECATED_GDALOpenVerticalShiftGrid
#define CPL_WARN_DEPRECATED_GDALOpenVerticalShiftGrid CPL_WARN_DEPRECATED
#endif
/*! @endcond */

GDALDatasetH  GDALOpenVerticalShiftGrid(const char *pszProj4Geoidgrids,
                                               int *pbError)
    /*! @cond Doxygen_Suppress */
//    CPL_WARN_DEPRECATED_GDALOpenVerticalShiftGrid(
//        "GDALOpenVerticalShiftGrid() will be removed in GDAL 4.0")
    /*! @endcond */
    ;

/*! @cond Doxygen_Suppress */
#ifndef CPL_WARN_DEPRECATED_GDALApplyVerticalShiftGrid
#define CPL_WARN_DEPRECATED_GDALApplyVerticalShiftGrid CPL_WARN_DEPRECATED
#endif
/*! @endcond */

GDALDatasetH  GDALApplyVerticalShiftGrid(GDALDatasetH hSrcDataset,
                                                GDALDatasetH hGridDataset,
                                                int bInverse,
                                                double dfSrcUnitToMeter,
                                                double dfDstUnitToMeter,
                                                const char *const *papszOptions)
    /*! @cond Doxygen_Suppress */
//    CPL_WARN_DEPRECATED_GDALApplyVerticalShiftGrid(
//        "GDALApplyVerticalShiftGrid() will be removed in GDAL 4.0")
    /*! @endcond */
    ;



#endif /* ndef GDAL_ALG_H_INCLUDED */
