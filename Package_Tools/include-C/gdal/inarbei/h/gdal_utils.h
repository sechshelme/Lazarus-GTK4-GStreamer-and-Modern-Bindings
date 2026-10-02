/******************************************************************************
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
 ****************************************************************************/

#ifndef GDAL_UTILS_H_INCLUDED
#define GDAL_UTILS_H_INCLUDED

/**
 * \file gdal_utils.h
 *
 * Public (C callable) GDAL Utilities entry points.
 *
 * @since GDAL 2.1
 */

#include "cpl_port.h"
#include "gdal.h"



/*! Options for GDALInfo(). Opaque type */
typedef struct GDALInfoOptions GDALInfoOptions;

/** Opaque type */
typedef struct GDALInfoOptionsForBinary GDALInfoOptionsForBinary;

GDALInfoOptions  *
GDALInfoOptionsNew(char **papszArgv,
                   GDALInfoOptionsForBinary *psOptionsForBinary);

void  GDALInfoOptionsFree(GDALInfoOptions *psOptions);

char  *GDALInfo(GDALDatasetH hDataset, const GDALInfoOptions *psOptions);

/*! Options for GDALTranslate(). Opaque type */
typedef struct GDALTranslateOptions GDALTranslateOptions;

/** Opaque type */
typedef struct GDALTranslateOptionsForBinary GDALTranslateOptionsForBinary;

GDALTranslateOptions  *
GDALTranslateOptionsNew(char **papszArgv,
                        GDALTranslateOptionsForBinary *psOptionsForBinary);

void  GDALTranslateOptionsFree(GDALTranslateOptions *psOptions);

void  GDALTranslateOptionsSetProgress(GDALTranslateOptions *psOptions,
                                             GDALProgressFunc pfnProgress,
                                             void *pProgressData);

GDALDatasetH  GDALTranslate(const char *pszDestFilename,
                                   GDALDatasetH hSrcDataset,
                                   const GDALTranslateOptions *psOptions,
                                   int *pbUsageError);

/*! Options for GDALWarp(). Opaque type */
typedef struct GDALWarpAppOptions GDALWarpAppOptions;

/** Opaque type */
typedef struct GDALWarpAppOptionsForBinary GDALWarpAppOptionsForBinary;

GDALWarpAppOptions  *
GDALWarpAppOptionsNew(char **papszArgv,
                      GDALWarpAppOptionsForBinary *psOptionsForBinary);

void  GDALWarpAppOptionsFree(GDALWarpAppOptions *psOptions);

void  GDALWarpAppOptionsSetProgress(GDALWarpAppOptions *psOptions,
                                           GDALProgressFunc pfnProgress,
                                           void *pProgressData);
void  GDALWarpAppOptionsSetQuiet(GDALWarpAppOptions *psOptions,
                                        int bQuiet);
void  GDALWarpAppOptionsSetWarpOption(GDALWarpAppOptions *psOptions,
                                             const char *pszKey,
                                             const char *pszValue);

GDALDatasetH  GDALWarp(const char *pszDest, GDALDatasetH hDstDS,
                              int nSrcCount, GDALDatasetH *pahSrcDS,
                              const GDALWarpAppOptions *psOptions,
                              int *pbUsageError);

/*! Options for GDALVectorTranslate(). Opaque type */
typedef struct GDALVectorTranslateOptions GDALVectorTranslateOptions;

/** Opaque type */
typedef struct GDALVectorTranslateOptionsForBinary
    GDALVectorTranslateOptionsForBinary;

GDALVectorTranslateOptions  *GDALVectorTranslateOptionsNew(
    char **papszArgv, GDALVectorTranslateOptionsForBinary *psOptionsForBinary);

void 
GDALVectorTranslateOptionsFree(GDALVectorTranslateOptions *psOptions);

void  GDALVectorTranslateOptionsSetProgress(
    GDALVectorTranslateOptions *psOptions, GDALProgressFunc pfnProgress,
    void *pProgressData);

GDALDatasetH  GDALVectorTranslate(
    const char *pszDest, GDALDatasetH hDstDS, int nSrcCount,
    GDALDatasetH *pahSrcDS, const GDALVectorTranslateOptions *psOptions,
    int *pbUsageError);

/*! Options for GDALDEMProcessing(). Opaque type */
typedef struct GDALDEMProcessingOptions GDALDEMProcessingOptions;

/** Opaque type */
typedef struct GDALDEMProcessingOptionsForBinary
    GDALDEMProcessingOptionsForBinary;

GDALDEMProcessingOptions  *GDALDEMProcessingOptionsNew(
    char **papszArgv, GDALDEMProcessingOptionsForBinary *psOptionsForBinary);

void  GDALDEMProcessingOptionsFree(GDALDEMProcessingOptions *psOptions);

void  GDALDEMProcessingOptionsSetProgress(
    GDALDEMProcessingOptions *psOptions, GDALProgressFunc pfnProgress,
    void *pProgressData);

GDALDatasetH 
GDALDEMProcessing(const char *pszDestFilename, GDALDatasetH hSrcDataset,
                  const char *pszProcessing, const char *pszColorFilename,
                  const GDALDEMProcessingOptions *psOptions, int *pbUsageError);

/*! Options for GDALNearblack(). Opaque type */
typedef struct GDALNearblackOptions GDALNearblackOptions;

/** Opaque type */
typedef struct GDALNearblackOptionsForBinary GDALNearblackOptionsForBinary;

GDALNearblackOptions  *
GDALNearblackOptionsNew(char **papszArgv,
                        GDALNearblackOptionsForBinary *psOptionsForBinary);

void  GDALNearblackOptionsFree(GDALNearblackOptions *psOptions);

void  GDALNearblackOptionsSetProgress(GDALNearblackOptions *psOptions,
                                             GDALProgressFunc pfnProgress,
                                             void *pProgressData);

GDALDatasetH  GDALNearblack(const char *pszDest, GDALDatasetH hDstDS,
                                   GDALDatasetH hSrcDS,
                                   const GDALNearblackOptions *psOptions,
                                   int *pbUsageError);

/*! Options for GDALGrid(). Opaque type */
typedef struct GDALGridOptions GDALGridOptions;

/** Opaque type */
typedef struct GDALGridOptionsForBinary GDALGridOptionsForBinary;

GDALGridOptions  *
GDALGridOptionsNew(char **papszArgv,
                   GDALGridOptionsForBinary *psOptionsForBinary);

void  GDALGridOptionsFree(GDALGridOptions *psOptions);

void  GDALGridOptionsSetProgress(GDALGridOptions *psOptions,
                                        GDALProgressFunc pfnProgress,
                                        void *pProgressData);

GDALDatasetH  GDALGrid(const char *pszDest, GDALDatasetH hSrcDS,
                              const GDALGridOptions *psOptions,
                              int *pbUsageError);

/*! Options for GDALRasterize(). Opaque type */
typedef struct GDALRasterizeOptions GDALRasterizeOptions;

/** Opaque type */
typedef struct GDALRasterizeOptionsForBinary GDALRasterizeOptionsForBinary;

GDALRasterizeOptions  *
GDALRasterizeOptionsNew(char **papszArgv,
                        GDALRasterizeOptionsForBinary *psOptionsForBinary);

void  GDALRasterizeOptionsFree(GDALRasterizeOptions *psOptions);

void  GDALRasterizeOptionsSetProgress(GDALRasterizeOptions *psOptions,
                                             GDALProgressFunc pfnProgress,
                                             void *pProgressData);

GDALDatasetH  GDALRasterize(const char *pszDest, GDALDatasetH hDstDS,
                                   GDALDatasetH hSrcDS,
                                   const GDALRasterizeOptions *psOptions,
                                   int *pbUsageError);

/*! Options for GDALFootprint(). Opaque type */
typedef struct GDALFootprintOptions GDALFootprintOptions;

/** Opaque type */
typedef struct GDALFootprintOptionsForBinary GDALFootprintOptionsForBinary;

GDALFootprintOptions  *
GDALFootprintOptionsNew(char **papszArgv,
                        GDALFootprintOptionsForBinary *psOptionsForBinary);

void  GDALFootprintOptionsFree(GDALFootprintOptions *psOptions);

void  GDALFootprintOptionsSetProgress(GDALFootprintOptions *psOptions,
                                             GDALProgressFunc pfnProgress,
                                             void *pProgressData);

GDALDatasetH  GDALFootprint(const char *pszDest, GDALDatasetH hDstDS,
                                   GDALDatasetH hSrcDS,
                                   const GDALFootprintOptions *psOptions,
                                   int *pbUsageError);

/*! Options for GDALBuildVRT(). Opaque type */
typedef struct GDALBuildVRTOptions GDALBuildVRTOptions;

/** Opaque type */
typedef struct GDALBuildVRTOptionsForBinary GDALBuildVRTOptionsForBinary;

GDALBuildVRTOptions  *
GDALBuildVRTOptionsNew(char **papszArgv,
                       GDALBuildVRTOptionsForBinary *psOptionsForBinary);

void  GDALBuildVRTOptionsFree(GDALBuildVRTOptions *psOptions);

void  GDALBuildVRTOptionsSetProgress(GDALBuildVRTOptions *psOptions,
                                            GDALProgressFunc pfnProgress,
                                            void *pProgressData);

GDALDatasetH  GDALBuildVRT(const char *pszDest, int nSrcCount,
                                  GDALDatasetH *pahSrcDS,
                                  const char *const *papszSrcDSNames,
                                  const GDALBuildVRTOptions *psOptions,
                                  int *pbUsageError);

/*! Options for GDALMultiDimInfo(). Opaque type */
typedef struct GDALMultiDimInfoOptions GDALMultiDimInfoOptions;

/** Opaque type */
typedef struct GDALMultiDimInfoOptionsForBinary
    GDALMultiDimInfoOptionsForBinary;

GDALMultiDimInfoOptions  *GDALMultiDimInfoOptionsNew(
    char **papszArgv, GDALMultiDimInfoOptionsForBinary *psOptionsForBinary);

void  GDALMultiDimInfoOptionsFree(GDALMultiDimInfoOptions *psOptions);

char  *GDALMultiDimInfo(GDALDatasetH hDataset,
                               const GDALMultiDimInfoOptions *psOptions);

/*! Options for GDALMultiDimTranslate(). Opaque type */
typedef struct GDALMultiDimTranslateOptions GDALMultiDimTranslateOptions;

/** Opaque type */
typedef struct GDALMultiDimTranslateOptionsForBinary
    GDALMultiDimTranslateOptionsForBinary;

GDALMultiDimTranslateOptions  *GDALMultiDimTranslateOptionsNew(
    char **papszArgv,
    GDALMultiDimTranslateOptionsForBinary *psOptionsForBinary);

void 
GDALMultiDimTranslateOptionsFree(GDALMultiDimTranslateOptions *psOptions);

void  GDALMultiDimTranslateOptionsSetProgress(
    GDALMultiDimTranslateOptions *psOptions, GDALProgressFunc pfnProgress,
    void *pProgressData);

GDALDatasetH  GDALMultiDimTranslate(
    const char *pszDest, GDALDatasetH hDstDataset, int nSrcCount,
    GDALDatasetH *pahSrcDS, const GDALMultiDimTranslateOptions *psOptions,
    int *pbUsageError);

/*! Options for GDALVectorInfo(). Opaque type */
typedef struct GDALVectorInfoOptions GDALVectorInfoOptions;

/** Opaque type */
typedef struct GDALVectorInfoOptionsForBinary GDALVectorInfoOptionsForBinary;

GDALVectorInfoOptions  *
GDALVectorInfoOptionsNew(char **papszArgv,
                         GDALVectorInfoOptionsForBinary *psOptionsForBinary);

void  GDALVectorInfoOptionsFree(GDALVectorInfoOptions *psOptions);

char  *GDALVectorInfo(GDALDatasetH hDataset,
                             const GDALVectorInfoOptions *psOptions);



#endif /* GDAL_UTILS_H_INCLUDED */
