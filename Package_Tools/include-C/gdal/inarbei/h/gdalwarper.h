/******************************************************************************
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
 ****************************************************************************/

#ifndef GDALWARPER_H_INCLUDED
#define GDALWARPER_H_INCLUDED

/**
 * \file gdalwarper.h
 *
 * GDAL warper related entry points and definitions.  Eventually it is
 * expected that this file will be mostly private to the implementation,
 * and the public C entry points will be available in gdal_alg.h.
 */

#include "gdal_alg.h"
#include "cpl_minixml.h"
#include "cpl_multiproc.h"



/* Note: values are selected to be consistent with GDALRIOResampleAlg of
 * gcore/gdal.h */
/*! Warp Resampling Algorithm */
typedef enum
{
    /*! Nearest neighbour (select on one input pixel) */ GRA_NearestNeighbour =
        0,
    /*! Bilinear (2x2 kernel) */ GRA_Bilinear = 1,
    /*! Cubic Convolution Approximation (4x4 kernel) */ GRA_Cubic = 2,
    /*! Cubic B-Spline Approximation (4x4 kernel) */ GRA_CubicSpline = 3,
    /*! Lanczos windowed sinc interpolation (6x6 kernel) */ GRA_Lanczos = 4,
    /*! Average (computes the weighted average of all non-NODATA contributing
       pixels) */
    GRA_Average = 5,
    /*! Mode (selects the value which appears most often of all the sampled
       points) */
    GRA_Mode = 6,
    /*  GRA_Gauss=7 reserved. */
    /*! Max (selects maximum of all non-NODATA contributing pixels) */ GRA_Max =
        8,
    /*! Min (selects minimum of all non-NODATA contributing pixels) */ GRA_Min =
        9,
    /*! Med (selects median of all non-NODATA contributing pixels) */ GRA_Med =
        10,
    /*! Q1 (selects first quartile of all non-NODATA contributing pixels) */
    GRA_Q1 = 11,
    /*! Q3 (selects third quartile of all non-NODATA contributing pixels) */
    GRA_Q3 = 12,
    /*! Sum (weighed sum of all non-NODATA contributing pixels). Added in
       GDAL 3.1 */
    GRA_Sum = 13,
    /*! RMS (weighted root mean square (quadratic mean) of all non-NODATA
       contributing pixels) */
    GRA_RMS = 14,
    /*! @cond Doxygen_Suppress */
    GRA_LAST_VALUE = GRA_RMS
    /*! @endcond */
} GDALResampleAlg;

/*! GWKAverageOrMode Algorithm */
typedef enum
{
    /*! Average */ GWKAOM_Average = 1,
    /*! Mode */ GWKAOM_Fmode = 2,
    /*! Mode of GDT_Byte, GDT_UInt16, or GDT_Int16 */ GWKAOM_Imode = 3,
    /*! Maximum */ GWKAOM_Max = 4,
    /*! Minimum */ GWKAOM_Min = 5,
    /*! Quantile */ GWKAOM_Quant = 6,
    /*! Sum */ GWKAOM_Sum = 7,
    /*! RMS */ GWKAOM_RMS = 8
} GWKAverageOrModeAlg;

/*! @cond Doxygen_Suppress */
typedef int (*GDALMaskFunc)(void *pMaskFuncArg, int nBandCount,
                            GDALDataType eType, int nXOff, int nYOff,
                            int nXSize, int nYSize, GByte **papabyImageData,
                            int bMaskIsFloat, void *pMask);

CPLErr  GDALWarpNoDataMasker(void *pMaskFuncArg, int nBandCount,
                                    GDALDataType eType, int nXOff, int nYOff,
                                    int nXSize, int nYSize,
                                    GByte **papabyImageData, int bMaskIsFloat,
                                    void *pValidityMask, int *pbOutAllValid);

CPLErr  GDALWarpDstAlphaMasker(void *pMaskFuncArg, int nBandCount,
                                      GDALDataType eType, int nXOff, int nYOff,
                                      int nXSize, int nYSize,
                                      GByte ** /*ppImageData */,
                                      int bMaskIsFloat, void *pValidityMask);
CPLErr  GDALWarpSrcAlphaMasker(void *pMaskFuncArg, int nBandCount,
                                      GDALDataType eType, int nXOff, int nYOff,
                                      int nXSize, int nYSize,
                                      GByte ** /*ppImageData */,
                                      int bMaskIsFloat, void *pValidityMask,
                                      int *pbOutAllOpaque);

CPLErr  GDALWarpSrcMaskMasker(void *pMaskFuncArg, int nBandCount,
                                     GDALDataType eType, int nXOff, int nYOff,
                                     int nXSize, int nYSize,
                                     GByte ** /*ppImageData */,
                                     int bMaskIsFloat, void *pValidityMask);

CPLErr  GDALWarpCutlineMasker(void *pMaskFuncArg, int nBandCount,
                                     GDALDataType eType, int nXOff, int nYOff,
                                     int nXSize, int nYSize,
                                     GByte ** /* ppImageData */,
                                     int bMaskIsFloat, void *pValidityMask);

/* GCMVF stands for GDALWARP_CUTLINE_MASKER_VALIDITY_FLAG */
#define GCMVF_PARTIAL_INTERSECTION 0
#define GCMVF_NO_INTERSECTION 1
#define GCMVF_CHUNK_FULLY_WITHIN_CUTLINE 2
CPLErr  GDALWarpCutlineMaskerEx(void *pMaskFuncArg, int nBandCount,
                                       GDALDataType eType, int nXOff, int nYOff,
                                       int nXSize, int nYSize,
                                       GByte ** /* ppImageData */,
                                       int bMaskIsFloat, void *pValidityMask,
                                       int *pnValidityFlag);
/*! @endcond */

/************************************************************************/
/*                           GDALWarpOptions                            */
/************************************************************************/

/** Warp control options for use with GDALWarpOperation::Initialize()  */
typedef struct
{

    char **papszWarpOptions;

    /*! In bytes, 0.0 for internal default */
    double dfWarpMemoryLimit;

    /*! Resampling algorithm to use */
    GDALResampleAlg eResampleAlg;

    /*! data type to use during warp operation, GDT_Unknown lets the algorithm
        select the type */
    GDALDataType eWorkingDataType;

    /*! Source image dataset. */
    GDALDatasetH hSrcDS;

    /*! Destination image dataset - may be NULL if only using
     * GDALWarpOperation::WarpRegionToBuffer(). */
    GDALDatasetH hDstDS;

    /*! Number of bands to process, may be 0 to select all bands. */
    int nBandCount;

    /*! The band numbers for the source bands to process (1 based) */
    int *panSrcBands;

    /*! The band numbers for the destination bands to process (1 based) */
    int *panDstBands;

    /*! The source band so use as an alpha (transparency) value, 0=disabled */
    int nSrcAlphaBand;

    /*! The dest. band so use as an alpha (transparency) value, 0=disabled */
    int nDstAlphaBand;

    /*! The "nodata" value real component for each input band, if NULL there
     * isn't one */
    double *padfSrcNoDataReal;
    /*! The "nodata" value imaginary component - may be NULL even if real
      component is provided. This value is not used to flag invalid values.
      Only the real component is used. */
    double *padfSrcNoDataImag;

    /*! The "nodata" value real component for each output band, if NULL there
     * isn't one */
    double *padfDstNoDataReal;
    /*! The "nodata" value imaginary component - may be NULL even if real
      component is provided. Note that warp operations only use real component
      for flagging invalid data.*/
    double *padfDstNoDataImag;

    /*! GDALProgressFunc() compatible progress reporting function, or NULL
      if there isn't one. */
    GDALProgressFunc pfnProgress;

    /*! Callback argument to be passed to pfnProgress. */
    void *pProgressArg;

    /*! Type of spatial point transformer function */
    GDALTransformerFunc pfnTransformer;

    /*! Handle to image transformer setup structure */
    void *pTransformerArg;

    /** Unused. Must be NULL */
    GDALMaskFunc *papfnSrcPerBandValidityMaskFunc;
    /** Unused. Must be NULL */
    void **papSrcPerBandValidityMaskFuncArg;

    /** Unused. Must be NULL */
    GDALMaskFunc pfnSrcValidityMaskFunc;
    /** Unused. Must be NULL */
    void *pSrcValidityMaskFuncArg;

    /** Unused. Must be NULL */
    GDALMaskFunc pfnSrcDensityMaskFunc;
    /** Unused. Must be NULL */
    void *pSrcDensityMaskFuncArg;

    /** Unused. Must be NULL */
    GDALMaskFunc pfnDstDensityMaskFunc;
    /** Unused. Must be NULL */
    void *pDstDensityMaskFuncArg;

    /** Unused. Must be NULL */
    GDALMaskFunc pfnDstValidityMaskFunc;
    /** Unused. Must be NULL */
    void *pDstValidityMaskFuncArg;

    /** Unused. Must be NULL */
    CPLErr (*pfnPreWarpChunkProcessor)(void *pKern, void *pArg);
    /** Unused. Must be NULL */
    void *pPreWarpProcessorArg;

    /** Unused. Must be NULL */
    CPLErr (*pfnPostWarpChunkProcessor)(void *pKern, void *pArg);
    /** Unused. Must be NULL */
    void *pPostWarpProcessorArg;

    /*! Optional OGRPolygonH for a masking cutline. */
    void *hCutline;

    /*! Optional blending distance to apply across cutline in pixels, default is
     * zero. */
    double dfCutlineBlendDist;

} GDALWarpOptions;

GDALWarpOptions  * GDALCreateWarpOptions(void);
void   GDALDestroyWarpOptions(GDALWarpOptions *);
GDALWarpOptions  *
GDALCloneWarpOptions(const GDALWarpOptions *);

void   GDALWarpInitDstNoDataReal(GDALWarpOptions *,
                                                   double dNoDataReal);

void   GDALWarpInitSrcNoDataReal(GDALWarpOptions *,
                                                   double dNoDataReal);

void   GDALWarpInitNoDataReal(GDALWarpOptions *,
                                                double dNoDataReal);

void   GDALWarpInitDstNoDataImag(GDALWarpOptions *,
                                                   double dNoDataImag);

void   GDALWarpInitSrcNoDataImag(GDALWarpOptions *,
                                                   double dNoDataImag);

void   GDALWarpResolveWorkingDataType(GDALWarpOptions *);

void   GDALWarpInitDefaultBandMapping(GDALWarpOptions *,
                                                        int nBandCount);

/*! @cond Doxygen_Suppress */
CPLXMLNode  *
GDALSerializeWarpOptions(const GDALWarpOptions *);
GDALWarpOptions  * GDALDeserializeWarpOptions(CPLXMLNode *);
/*! @endcond */

/************************************************************************/
/*                         GDALReprojectImage()                         */
/************************************************************************/

CPLErr   GDALReprojectImage(
    GDALDatasetH hSrcDS, const char *pszSrcWKT, GDALDatasetH hDstDS,
    const char *pszDstWKT, GDALResampleAlg eResampleAlg,
    double dfWarpMemoryLimit, double dfMaxError, GDALProgressFunc pfnProgress,
    void *pProgressArg, GDALWarpOptions *psOptions);

CPLErr   GDALCreateAndReprojectImage(
    GDALDatasetH hSrcDS, const char *pszSrcWKT, const char *pszDstFilename,
    const char *pszDstWKT, GDALDriverH hDstDriver, char **papszCreateOptions,
    GDALResampleAlg eResampleAlg, double dfWarpMemoryLimit, double dfMaxError,
    GDALProgressFunc pfnProgress, void *pProgressArg,
    GDALWarpOptions *psOptions);

/************************************************************************/
/*                           VRTWarpedDataset                           */
/************************************************************************/

GDALDatasetH  
GDALAutoCreateWarpedVRT(GDALDatasetH hSrcDS, const char *pszSrcWKT,
                        const char *pszDstWKT, GDALResampleAlg eResampleAlg,
                        double dfMaxError, const GDALWarpOptions *psOptions);

GDALDatasetH   GDALAutoCreateWarpedVRTEx(
    GDALDatasetH hSrcDS, const char *pszSrcWKT, const char *pszDstWKT,
    GDALResampleAlg eResampleAlg, double dfMaxError,
    const GDALWarpOptions *psOptions, CSLConstList papszTransformerOptions);

GDALDatasetH  
GDALCreateWarpedVRT(GDALDatasetH hSrcDS, int nPixels, int nLines,
                    double *padfGeoTransform, GDALWarpOptions *psOptions);

CPLErr   GDALInitializeWarpedVRT(GDALDatasetH hDS,
                                                   GDALWarpOptions *psWO);



#if defined(__cplusplus) && !defined(CPL_SUPRESS_CPLUSPLUS)

#include <vector>
#include <utility>

/************************************************************************/
/*                            GDALWarpKernel                            */
/*                                                                      */

/** This is the number of dummy pixels that must be reserved in source arrays
 * in order to satisfy assumptions made in GWKResample(), and more specifically
 * by GWKGetPixelRow() that always read a even number of pixels. So if we are
 * in the situation to read the last pixel of the source array, we need 1 extra
 * dummy pixel to avoid reading out of bounds. */
#define WARP_EXTRA_ELTS 1

/** This class represents the lowest level of abstraction of warping.
 *
 * It holds the imagery for one "chunk" of a warp, and the
 * pre-prepared masks.  All IO is done before and after its
 * operation.  This class is not normally used by the
 * application.
 */

/*! @cond Doxygen_Suppress */
void *GWKThreadsCreate(char **papszWarpOptions,
                       GDALTransformerFunc pfnTransformer,
                       void *pTransformerArg);
void GWKThreadsEnd(void *psThreadDataIn);
/*! @endcond */

/************************************************************************/
/*                         GDALWarpOperation()                          */
/*                                                                      */
/*      This object is application created, or created by a higher      */
/*      level convenience function.  It is responsible for              */
/*      subdividing the operation into chunks, loading and saving       */
/*      imagery, and establishing the varios validity and density       */
/*      masks.  Actual resampling is done by the GDALWarpKernel.        */
/************************************************************************/

/*! @cond Doxygen_Suppress */
typedef struct _GDALWarpChunk GDALWarpChunk;
/*! @endcond */

#endif /* def __cplusplus */



/** Opaque type representing a GDALWarpOperation object */
typedef void *GDALWarpOperationH;

GDALWarpOperationH  GDALCreateWarpOperation(const GDALWarpOptions *);
void  GDALDestroyWarpOperation(GDALWarpOperationH);
CPLErr  GDALChunkAndWarpImage(GDALWarpOperationH, int, int, int, int);
CPLErr  GDALChunkAndWarpMulti(GDALWarpOperationH, int, int, int, int);
CPLErr  GDALWarpRegion(GDALWarpOperationH, int, int, int, int, int, int,
                              int, int);
CPLErr  GDALWarpRegionToBuffer(GDALWarpOperationH, int, int, int, int,
                                      void *, GDALDataType, int, int, int, int);

/************************************************************************/
/*      Warping kernel functions                                        */
/************************************************************************/

/*! @cond Doxygen_Suppress */
int GWKGetFilterRadius(GDALResampleAlg eResampleAlg);

typedef double (*FilterFuncType)(double dfX);
FilterFuncType GWKGetFilterFunc(GDALResampleAlg eResampleAlg);

// TODO(schwehr): Can padfVals be a const pointer?
typedef double (*FilterFunc4ValuesType)(double *padfVals);
FilterFunc4ValuesType GWKGetFilterFunc4Values(GDALResampleAlg eResampleAlg);
/*! @endcond */



#endif /* ndef GDAL_ALG_H_INCLUDED */
