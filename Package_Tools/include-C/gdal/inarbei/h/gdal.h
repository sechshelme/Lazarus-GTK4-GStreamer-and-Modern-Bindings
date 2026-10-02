/******************************************************************************
 * $Id$
 *
 * Project:  GDAL Core
 * Purpose:  GDAL Core C/Public declarations.
 * Author:   Frank Warmerdam, warmerdam@pobox.com
 *
 ******************************************************************************
 * Copyright (c) 1998, 2002 Frank Warmerdam
 * Copyright (c) 2007-2014, Even Rouault <even dot rouault at spatialys.com>
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

#ifndef GDAL_H_INCLUDED
#define GDAL_H_INCLUDED

/**
 * \file gdal.h
 *
 * Public (C callable) GDAL entry points.
 */

#ifndef DOXYGEN_SKIP
#if defined(GDAL_COMPILATION)
#define DO_NOT_DEFINE_GDAL_DATE_NAME
#endif
#include "gdal_version.h"
#include "cpl_port.h"
#include "cpl_error.h"
#include "cpl_progress.h"
#include "cpl_virtualmem.h"
#include "cpl_minixml.h"
#include "ogr_api.h"
#endif

#include <stdbool.h>
#include <stdint.h>

/* -------------------------------------------------------------------- */
/*      Significant constants.                                          */
/* -------------------------------------------------------------------- */



/*! Pixel data types */
typedef enum
{
    /*! Unknown or unspecified type */ GDT_Unknown = 0,
    /*! Eight bit unsigned integer */ GDT_Byte = 1,
    /*! 8-bit signed integer (GDAL >= 3.7) */ GDT_Int8 = 14,
    /*! Sixteen bit unsigned integer */ GDT_UInt16 = 2,
    /*! Sixteen bit signed integer */ GDT_Int16 = 3,
    /*! Thirty two bit unsigned integer */ GDT_UInt32 = 4,
    /*! Thirty two bit signed integer */ GDT_Int32 = 5,
    /*! 64 bit unsigned integer (GDAL >= 3.5)*/ GDT_UInt64 = 12,
    /*! 64 bit signed integer  (GDAL >= 3.5)*/ GDT_Int64 = 13,
    /*! Thirty two bit floating point */ GDT_Float32 = 6,
    /*! Sixty four bit floating point */ GDT_Float64 = 7,
    /*! Complex Int16 */ GDT_CInt16 = 8,
    /*! Complex Int32 */ GDT_CInt32 = 9,
    /* TODO?(#6879): GDT_CInt64 */
    /*! Complex Float32 */ GDT_CFloat32 = 10,
    /*! Complex Float64 */ GDT_CFloat64 = 11,
    GDT_TypeCount = 15 /* maximum type # + 1 */
} GDALDataType;

int   GDALGetDataTypeSize(GDALDataType);  // Deprecated.
int   GDALGetDataTypeSizeBits(GDALDataType eDataType);
int   GDALGetDataTypeSizeBytes(GDALDataType);
int   GDALDataTypeIsComplex(GDALDataType);
int   GDALDataTypeIsInteger(GDALDataType);
int   GDALDataTypeIsFloating(GDALDataType);
int   GDALDataTypeIsSigned(GDALDataType);
const char  * GDALGetDataTypeName(GDALDataType);
GDALDataType   GDALGetDataTypeByName(const char *);
GDALDataType   GDALDataTypeUnion(GDALDataType, GDALDataType);
GDALDataType   GDALDataTypeUnionWithValue(GDALDataType eDT,
                                                            double dValue,
                                                            int bComplex);
GDALDataType   GDALFindDataType(int nBits, int bSigned,
                                                  int bFloating, int bComplex);
GDALDataType   GDALFindDataTypeForValue(double dValue,
                                                          int bComplex);
double  GDALAdjustValueToDataType(GDALDataType eDT, double dfValue,
                                         int *pbClamped, int *pbRounded);
GDALDataType   GDALGetNonComplexDataType(GDALDataType);
int   GDALDataTypeIsConversionLossy(GDALDataType eTypeFrom,
                                                      GDALDataType eTypeTo);

/**
 * status of the asynchronous stream
 */
typedef enum
{
    GARIO_PENDING = 0,
    GARIO_UPDATE = 1,
    GARIO_ERROR = 2,
    GARIO_COMPLETE = 3,
    GARIO_TypeCount = 4
} GDALAsyncStatusType;

const char  * GDALGetAsyncStatusTypeName(GDALAsyncStatusType);
GDALAsyncStatusType  
GDALGetAsyncStatusTypeByName(const char *);

/*! Flag indicating read/write, or read-only access to data. */
typedef enum
{
    /*! Read only (no update) access */ GA_ReadOnly = 0,
    /*! Read/write access. */ GA_Update = 1
} GDALAccess;

/*! Read/Write flag for RasterIO() method */
typedef enum
{
    /*! Read data */ GF_Read = 0,
    /*! Write data */ GF_Write = 1
} GDALRWFlag;

/* NOTE: values are selected to be consistent with GDALResampleAlg of
 * alg/gdalwarper.h */
/** RasterIO() resampling method.
 * @since GDAL 2.0
 */
typedef enum
{
    /*! Nearest neighbour */ GRIORA_NearestNeighbour = 0,
    /*! Bilinear (2x2 kernel) */ GRIORA_Bilinear = 1,
    /*! Cubic Convolution Approximation (4x4 kernel) */ GRIORA_Cubic = 2,
    /*! Cubic B-Spline Approximation (4x4 kernel) */ GRIORA_CubicSpline = 3,
    /*! Lanczos windowed sinc interpolation (6x6 kernel) */ GRIORA_Lanczos = 4,
    /*! Average */ GRIORA_Average = 5,
    /*! Mode (selects the value which appears most often of all the sampled
       points) */
    GRIORA_Mode = 6,
    /*! Gauss blurring */ GRIORA_Gauss = 7,
    /* NOTE: values 8 to 13 are reserved for max,min,med,Q1,Q3,sum */
    /*! @cond Doxygen_Suppress */
    GRIORA_RESERVED_START = 8,
    GRIORA_RESERVED_END = 13,
    /*! @endcond */
    /** RMS: Root Mean Square / Quadratic Mean.
     * For complex numbers, applies on the real and imaginary part
     * independently.
     */
    GRIORA_RMS = 14,
    /*! @cond Doxygen_Suppress */
    GRIORA_LAST = GRIORA_RMS
    /*! @endcond */
} GDALRIOResampleAlg;

/* NOTE to developers: only add members, and if so edit INIT_RASTERIO_EXTRA_ARG
 */
/** Structure to pass extra arguments to RasterIO() method,
 * must be initialized with INIT_RASTERIO_EXTRA_ARG
 * @since GDAL 2.0
 */
typedef struct
{
    /*! Version of structure (to allow future extensions of the structure) */
    int nVersion;

    /*! Resampling algorithm */
    GDALRIOResampleAlg eResampleAlg;

    /*! Progress callback */
    GDALProgressFunc pfnProgress;
    /*! Progress callback user data */
    void *pProgressData;

    /*! Indicate if dfXOff, dfYOff, dfXSize and dfYSize are set.
        Mostly reserved from the VRT driver to communicate a more precise
        source window. Must be such that dfXOff - nXOff < 1.0 and
        dfYOff - nYOff < 1.0 and nXSize - dfXSize < 1.0 and nYSize - dfYSize
       < 1.0 */
    int bFloatingPointWindowValidity;
    /*! Pixel offset to the top left corner. Only valid if
     * bFloatingPointWindowValidity = TRUE */
    double dfXOff;
    /*! Line offset to the top left corner. Only valid if
     * bFloatingPointWindowValidity = TRUE */
    double dfYOff;
    /*! Width in pixels of the area of interest. Only valid if
     * bFloatingPointWindowValidity = TRUE */
    double dfXSize;
    /*! Height in pixels of the area of interest. Only valid if
     * bFloatingPointWindowValidity = TRUE */
    double dfYSize;
} GDALRasterIOExtraArg;


/*! Types of color interpretation for raster bands. */
typedef enum
{
    /*! Undefined */ GCI_Undefined = 0,
    /*! Greyscale */ GCI_GrayIndex = 1,
    /*! Paletted (see associated color table) */ GCI_PaletteIndex = 2,
    /*! Red band of RGBA image */ GCI_RedBand = 3,
    /*! Green band of RGBA image */ GCI_GreenBand = 4,
    /*! Blue band of RGBA image */ GCI_BlueBand = 5,
    /*! Alpha (0=transparent, 255=opaque) */ GCI_AlphaBand = 6,
    /*! Hue band of HLS image */ GCI_HueBand = 7,
    /*! Saturation band of HLS image */ GCI_SaturationBand = 8,
    /*! Lightness band of HLS image */ GCI_LightnessBand = 9,
    /*! Cyan band of CMYK image */ GCI_CyanBand = 10,
    /*! Magenta band of CMYK image */ GCI_MagentaBand = 11,
    /*! Yellow band of CMYK image */ GCI_YellowBand = 12,
    /*! Black band of CMYK image */ GCI_BlackBand = 13,
    /*! Y Luminance */ GCI_YCbCr_YBand = 14,
    /*! Cb Chroma */ GCI_YCbCr_CbBand = 15,
    /*! Cr Chroma */ GCI_YCbCr_CrBand = 16,
    /*! Max current value (equals to GCI_YCbCr_CrBand currently) */ GCI_Max = 16
} GDALColorInterp;

const char  *GDALGetColorInterpretationName(GDALColorInterp);
GDALColorInterp  GDALGetColorInterpretationByName(const char *pszName);

/*! Types of color interpretations for a GDALColorTable. */
typedef enum
{
    /*! Grayscale (in GDALColorEntry.c1) */ GPI_Gray = 0,
    /*! Red, Green, Blue and Alpha in (in c1, c2, c3 and c4) */ GPI_RGB = 1,
    /*! Cyan, Magenta, Yellow and Black (in c1, c2, c3 and c4)*/ GPI_CMYK = 2,
    /*! Hue, Lightness and Saturation (in c1, c2, and c3) */ GPI_HLS = 3
} GDALPaletteInterp;

const char  *GDALGetPaletteInterpretationName(GDALPaletteInterp);

/* "well known" metadata items. */

/** Metadata item for dataset that indicates the spatial interpretation of a
 *  pixel */
#define GDALMD_AREA_OR_POINT "AREA_OR_POINT"
/** Value for GDALMD_AREA_OR_POINT that indicates that a pixel represents an
 * area */
#define GDALMD_AOP_AREA "Area"
/** Value for GDALMD_AREA_OR_POINT that indicates that a pixel represents a
 * point */
#define GDALMD_AOP_POINT "Point"

/* -------------------------------------------------------------------- */
/*      GDAL Specific error codes.                                      */
/*                                                                      */
/*      error codes 100 to 299 reserved for GDAL.                       */
/* -------------------------------------------------------------------- */
#ifndef DOXYGEN_SKIP
#define CPLE_WrongFormat CPL_STATIC_CAST(CPLErrorNum, 200)
#endif

/* -------------------------------------------------------------------- */
/*      Define handle types related to various internal classes.        */
/* -------------------------------------------------------------------- */

/** Opaque type used for the C bindings of the C++ GDALMajorObject class */
typedef void *GDALMajorObjectH;

/** Opaque type used for the C bindings of the C++ GDALDataset class */
typedef void *GDALDatasetH;

/** Opaque type used for the C bindings of the C++ GDALRasterBand class */
typedef void *GDALRasterBandH;

/** Opaque type used for the C bindings of the C++ GDALDriver class */
typedef void *GDALDriverH;

/** Opaque type used for the C bindings of the C++ GDALColorTable class */
typedef void *GDALColorTableH;

/** Opaque type used for the C bindings of the C++ GDALRasterAttributeTable
 * class */
typedef void *GDALRasterAttributeTableH;

/** Opaque type used for the C bindings of the C++ GDALAsyncReader class */
typedef void *GDALAsyncReaderH;

/** Opaque type used for the C bindings of the C++ GDALRelationship class
 *  @since GDAL 3.6
 */
typedef void *GDALRelationshipH;

/** Type to express pixel, line or band spacing. Signed 64 bit integer. */
typedef GIntBig GSpacing;

/** Enumeration giving the class of a GDALExtendedDataType.
 * @since GDAL 3.1
 */
typedef enum
{
    /** Numeric value. Based on GDALDataType enumeration */
    GEDTC_NUMERIC,
    /** String value. */
    GEDTC_STRING,
    /** Compound data type. */
    GEDTC_COMPOUND
} GDALExtendedDataTypeClass;

/** Enumeration giving the subtype of a GDALExtendedDataType.
 * @since GDAL 3.4
 */
typedef enum
{
    /** None. */
    GEDTST_NONE,
    /** JSon. Only applies to GEDTC_STRING */
    GEDTST_JSON
} GDALExtendedDataTypeSubType;

/** Opaque type for C++ GDALExtendedDataType */
typedef struct GDALExtendedDataTypeHS *GDALExtendedDataTypeH;
/** Opaque type for C++ GDALEDTComponent */
typedef struct GDALEDTComponentHS *GDALEDTComponentH;
/** Opaque type for C++ GDALGroup */
typedef struct GDALGroupHS *GDALGroupH;
/** Opaque type for C++ GDALMDArray */
typedef struct GDALMDArrayHS *GDALMDArrayH;
/** Opaque type for C++ GDALAttribute */
typedef struct GDALAttributeHS *GDALAttributeH;
/** Opaque type for C++ GDALDimension */
typedef struct GDALDimensionHS *GDALDimensionH;

/* ==================================================================== */
/*      Registration/driver related.                                    */
/* ==================================================================== */

/** Long name of the driver */
#define GDAL_DMD_LONGNAME "DMD_LONGNAME"

/** URL (relative to http://gdal.org/) to the help page of the driver */
#define GDAL_DMD_HELPTOPIC "DMD_HELPTOPIC"

/** MIME type handled by the driver. */
#define GDAL_DMD_MIMETYPE "DMD_MIMETYPE"

/** Extension handled by the driver. */
#define GDAL_DMD_EXTENSION "DMD_EXTENSION"

/** Connection prefix to provide as the file name of the open function.
 * Typically set for non-file based drivers. Generally used with open options.
 * @since GDAL 2.0
 */
#define GDAL_DMD_CONNECTION_PREFIX "DMD_CONNECTION_PREFIX"

/** List of (space separated) extensions handled by the driver.
 * @since GDAL 2.0
 */
#define GDAL_DMD_EXTENSIONS "DMD_EXTENSIONS"

/** XML snippet with creation options. */
#define GDAL_DMD_CREATIONOPTIONLIST "DMD_CREATIONOPTIONLIST"

/** XML snippet with multidimensional dataset creation options.
 * @since GDAL 3.1
 */
#define GDAL_DMD_MULTIDIM_DATASET_CREATIONOPTIONLIST                           \
    "DMD_MULTIDIM_DATASET_CREATIONOPTIONLIST"

/** XML snippet with multidimensional group creation options.
 * @since GDAL 3.1
 */
#define GDAL_DMD_MULTIDIM_GROUP_CREATIONOPTIONLIST                             \
    "DMD_MULTIDIM_GROUP_CREATIONOPTIONLIST"

/** XML snippet with multidimensional dimension creation options.
 * @since GDAL 3.1
 */
#define GDAL_DMD_MULTIDIM_DIMENSION_CREATIONOPTIONLIST                         \
    "DMD_MULTIDIM_DIMENSION_CREATIONOPTIONLIST"

/** XML snippet with multidimensional array creation options.
 * @since GDAL 3.1
 */
#define GDAL_DMD_MULTIDIM_ARRAY_CREATIONOPTIONLIST                             \
    "DMD_MULTIDIM_ARRAY_CREATIONOPTIONLIST"

/** XML snippet with multidimensional array open options.
 * @since GDAL 3.6
 */
#define GDAL_DMD_MULTIDIM_ARRAY_OPENOPTIONLIST                                 \
    "DMD_MULTIDIM_ARRAY_OPENOPTIONLIST"

/** XML snippet with multidimensional attribute creation options.
 * @since GDAL 3.1
 */
#define GDAL_DMD_MULTIDIM_ATTRIBUTE_CREATIONOPTIONLIST                         \
    "DMD_MULTIDIM_ATTRIBUTE_CREATIONOPTIONLIST"

/** XML snippet with open options.
 * @since GDAL 2.0
 */
#define GDAL_DMD_OPENOPTIONLIST "DMD_OPENOPTIONLIST"

/** List of (space separated) raster data types supported by the
 * Create()/CreateCopy() API. */
#define GDAL_DMD_CREATIONDATATYPES "DMD_CREATIONDATATYPES"

/** List of (space separated) vector field types supported by the CreateField()
 * API.
 * @since GDAL 2.0
 * */
#define GDAL_DMD_CREATIONFIELDDATATYPES "DMD_CREATIONFIELDDATATYPES"

/** List of (space separated) vector field sub-types supported by the
 * CreateField() API.
 * @since GDAL 2.3
 * */
#define GDAL_DMD_CREATIONFIELDDATASUBTYPES "DMD_CREATIONFIELDDATASUBTYPES"

/** List of (space separated) capability flags supported by the CreateField() API.
 *
 * Supported values are:
 *
 * - "WidthPrecision": field width and precision is supported.
 * - "Nullable": field (non-)nullable status is supported.
 * - "Unique": field unique constraint is supported.
 * - "Default": field default value is supported.
 * - "AlternativeName": field alternative name is supported.
 * - "Comment": field comment is supported.
 * - "Domain": field can be associated with a domain.
 *
 * @see GDAL_DMD_ALTER_FIELD_DEFN_FLAGS for capabilities supported when altering
 * existing fields.
 *
 * @since GDAL 3.7
 */
#define GDAL_DMD_CREATION_FIELD_DEFN_FLAGS "DMD_CREATION_FIELD_DEFN_FLAGS"

/** Capability set by a driver that exposes Subdatasets.
 *
 * This capability reflects that a raster driver supports child layers, such as
 * NetCDF or multi-table raster Geopackages.
 *
 * See GDAL_DCAP_MULTIPLE_VECTOR_LAYERS for a similar capability flag
 * for vector drivers.
 */
#define GDAL_DMD_SUBDATASETS "DMD_SUBDATASETS"

/** Capability set by a vector driver that supports field width and precision.
 *
 * This capability reflects that a vector driver includes the decimal separator
 * in the field width of fields of type OFTReal.
 *
 * See GDAL_DMD_NUMERIC_FIELD_WIDTH_INCLUDES_SIGN for a related capability flag.
 * @since GDAL 3.7
 */
#define GDAL_DMD_NUMERIC_FIELD_WIDTH_INCLUDES_DECIMAL_SEPARATOR                \
    "DMD_NUMERIC_FIELD_WIDTH_INCLUDES_DECIMAL_SEPARATOR"

/** Capability set by a vector driver that supports field width and precision.
 *
 * This capability reflects that a vector driver includes the sign
 * in the field width of fields of type OFTReal.
 *
 * See GDAL_DMD_NUMERIC_FIELD_WIDTH_INCLUDES_DECIMAL_SEPARATOR for a related capability flag.
 * @since GDAL 3.7
 */
#define GDAL_DMD_NUMERIC_FIELD_WIDTH_INCLUDES_SIGN                             \
    "DMD_NUMERIC_FIELD_WIDTH_INCLUDES_SIGN"

/** Capability set by a driver that implements the Open() API. */
#define GDAL_DCAP_OPEN "DCAP_OPEN"

/** Capability set by a driver that implements the Create() API.
 *
 * If GDAL_DCAP_CREATE is set, but GDAL_DCAP_CREATECOPY not, a generic
 * CreateCopy() implementation is available and will use the Create() API of
 * the driver.
 * So to test if some CreateCopy() implementation is available, generic or
 * specialize, test for both GDAL_DCAP_CREATE and GDAL_DCAP_CREATECOPY.
 */
#define GDAL_DCAP_CREATE "DCAP_CREATE"

/** Capability set by a driver that implements the CreateMultidimensional() API.
 *
 * @since GDAL 3.1
 */
#define GDAL_DCAP_CREATE_MULTIDIMENSIONAL "DCAP_CREATE_MULTIDIMENSIONAL"

/** Capability set by a driver that implements the CreateCopy() API.
 *
 * If GDAL_DCAP_CREATECOPY is not defined, but GDAL_DCAP_CREATE is set, a
 * generic CreateCopy() implementation is available and will use the Create()
 * API of the driver. So to test if some CreateCopy() implementation is
 * available, generic or specialize, test for both GDAL_DCAP_CREATE and
 * GDAL_DCAP_CREATECOPY.
 */
#define GDAL_DCAP_CREATECOPY "DCAP_CREATECOPY"

/** Capability set by a driver that implements the VectorTranslateFrom() API.
 *
 * @since GDAL 3.8
 */
#define GDAL_DCAP_VECTOR_TRANSLATE_FROM "DCAP_VECTOR_TRANSLATE_FROM"

/** Capability set by a driver that implements the CreateCopy() API, but with
 * multidimensional raster as input and output.
 *
 * @since GDAL 3.1
 */
#define GDAL_DCAP_CREATECOPY_MULTIDIMENSIONAL "DCAP_CREATECOPY_MULTIDIMENSIONAL"

/** Capability set by a driver that supports multidimensional data.
 * @since GDAL 3.1
 */
#define GDAL_DCAP_MULTIDIM_RASTER "DCAP_MULTIDIM_RASTER"

/** Capability set by a driver that can copy over subdatasets. */
#define GDAL_DCAP_SUBCREATECOPY "DCAP_SUBCREATECOPY"

/** Capability set by a driver that can read/create datasets through the VSI*L
 * API. */
#define GDAL_DCAP_VIRTUALIO "DCAP_VIRTUALIO"

/** Capability set by a driver having raster capability.
 * @since GDAL 2.0
 */
#define GDAL_DCAP_RASTER "DCAP_RASTER"

/** Capability set by a driver having vector capability.
 * @since GDAL 2.0
 */
#define GDAL_DCAP_VECTOR "DCAP_VECTOR"

/** Capability set by a driver having geographical network model capability.
 * @since GDAL 2.1
 */
#define GDAL_DCAP_GNM "DCAP_GNM"

/** Capability set by a driver that can create layers.
 * @since GDAL 3.6
 */
#define GDAL_DCAP_CREATE_LAYER "DCAP_CREATE_LAYER"

/** Capability set by a driver that can delete layers.
 * @since GDAL 3.6
 */
#define GDAL_DCAP_DELETE_LAYER "DCAP_DELETE_LAYER"

/** Capability set by a driver that can create fields.
 * @since GDAL 3.6
 */
#define GDAL_DCAP_CREATE_FIELD "DCAP_CREATE_FIELD"

/** Capability set by a driver that can delete fields.
 * @since GDAL 3.6
 */
#define GDAL_DCAP_DELETE_FIELD "DCAP_DELETE_FIELD"

/** Capability set by a driver that can reorder fields.
 * @since GDAL 3.6
 */
#define GDAL_DCAP_REORDER_FIELDS "DCAP_REORDER_FIELDS"

/** List of (space separated) flags supported by the OGRLayer::AlterFieldDefn()
 * API.
 *
 * Supported values are "Name", "Type", "WidthPrecision", "Nullable", "Default",
 * "Unique", "Domain", "AlternativeName" and "Comment", corresponding respectively
 * to the ALTER_NAME_FLAG, ALTER_TYPE_FLAG, ALTER_WIDTH_PRECISION_FLAG, ALTER_NULLABLE_FLAG,
 * ALTER_DEFAULT_FLAG, ALTER_UNIQUE_FLAG, ALTER_DOMAIN_FLAG,
 * ALTER_ALTERNATIVE_NAME_FLAG and ALTER_COMMENT_FLAG flags.
 *
 * Note that advertizing one of these flags doesn't necessarily mean that
 * all modifications of the corresponding property can be made. For example,
 * altering the field type may be restricted by the current type of the field,
 * etc.
 *
 * @see GDAL_DMD_CREATION_FIELD_DEFN_FLAGS for capabilities supported
 * when creating new fields.
 *
 * @since GDAL 3.6
 */
#define GDAL_DMD_ALTER_FIELD_DEFN_FLAGS "GDAL_DMD_ALTER_FIELD_DEFN_FLAGS"

/** List of (space separated) field names which are considered illegal by the
 * driver and should not be used when creating/altering fields.
 *
 * @since GDAL 3.7
 */
#define GDAL_DMD_ILLEGAL_FIELD_NAMES "GDAL_DMD_ILLEGAL_FIELD_NAMES"

/** Capability set by a driver that can create fields with NOT NULL constraint.
 * @since GDAL 2.0
 */
#define GDAL_DCAP_NOTNULL_FIELDS "DCAP_NOTNULL_FIELDS"

/** Capability set by a driver that can create fields with UNIQUE constraint.
 * @since GDAL 3.2
 */
#define GDAL_DCAP_UNIQUE_FIELDS "DCAP_UNIQUE_FIELDS"

/** Capability set by a driver that can create fields with DEFAULT values.
 * @since GDAL 2.0
 */
#define GDAL_DCAP_DEFAULT_FIELDS "DCAP_DEFAULT_FIELDS"

/** Capability set by a driver that can create geometry fields with NOT NULL
 * constraint.
 * @since GDAL 2.0
 */
#define GDAL_DCAP_NOTNULL_GEOMFIELDS "DCAP_NOTNULL_GEOMFIELDS"

/** Capability set by a non-spatial driver having no support for geometries.
 * E.g. non-spatial vector drivers (e.g. spreadsheet format drivers) do not
 * support geometries, and accordingly will have this capability present.
 * @since GDAL 2.3
 */
#define GDAL_DCAP_NONSPATIAL "DCAP_NONSPATIAL"

/** Capability set by a driver that can support curved geometries.
 * @since GDAL 3.6
 */
#define GDAL_DCAP_CURVE_GEOMETRIES "DCAP_CURVE_GEOMETRIES"

/** Capability set by a driver that can support measured geometries.
 *
 * @since GDAL 3.6
 */
#define GDAL_DCAP_MEASURED_GEOMETRIES "DCAP_MEASURED_GEOMETRIES"

/** Capability set by a driver that can support the Z dimension for geometries.
 *
 * @since GDAL 3.6
 */
#define GDAL_DCAP_Z_GEOMETRIES "DCAP_Z_GEOMETRIES"

/** List of (space separated) flags which reflect the geometry handling behavior
 * of a driver.
 *
 * Supported values are currently:
 *
 * - "EquatesMultiAndSingleLineStringDuringWrite" and
 * "EquatesMultiAndSinglePolygonDuringWrite". These flags indicate that the
 * driver does not differentiate between single-part and multi-part linestring
 * and polygon geometries when writing features respectively.
 *
 * @since GDAL 3.6
 */
#define GDAL_DMD_GEOMETRY_FLAGS "GDAL_DMD_GEOMETRY_FLAGS"

/** Capability set by drivers which support either reading or writing feature
 * styles.
 *
 * Consider using the more granular GDAL_DCAP_FEATURE_STYLES_READ or
 * GDAL_DCAP_FEATURE_STYLES_WRITE capabilities instead.
 *
 * @since GDAL 2.3
 */
#define GDAL_DCAP_FEATURE_STYLES "DCAP_FEATURE_STYLES"

/** Capability set by drivers which support reading feature styles.
 * @since GDAL 3.7
 */
#define GDAL_DCAP_FEATURE_STYLES_READ "DCAP_FEATURE_STYLES_READ"

/** Capability set by drivers which support writing feature styles.
 * @since GDAL 3.7
 */
#define GDAL_DCAP_FEATURE_STYLES_WRITE "DCAP_FEATURE_STYLES_WRITE"

/** Capability set by drivers which support storing/retrieving coordinate epoch
 * for dynamic CRS
 * @since GDAL 3.4
 */
#define GDAL_DCAP_COORDINATE_EPOCH "DCAP_COORDINATE_EPOCH"

/** Capability set by drivers for formats which support multiple vector layers.
 *
 * Note: some GDAL drivers expose "virtual" layer support while the underlying
 * formats themselves do not. This capability is only set for drivers of formats
 * which have a native concept of multiple vector layers (such as GeoPackage).
 *
 * @since GDAL 3.4
 */
#define GDAL_DCAP_MULTIPLE_VECTOR_LAYERS "DCAP_MULTIPLE_VECTOR_LAYERS"

/** Capability set by drivers for formats which support reading field domains.
 *
 * @since GDAL 3.5
 */
#define GDAL_DCAP_FIELD_DOMAINS "DCAP_FIELD_DOMAINS"

/** Capability set by drivers for formats which support reading table
 * relationships.
 *
 * @since GDAL 3.6
 */
#define GDAL_DCAP_RELATIONSHIPS "DCAP_RELATIONSHIPS"

/** Capability set by drivers for formats which support creating table
 * relationships.
 * @since GDAL 3.6
 */
#define GDAL_DCAP_CREATE_RELATIONSHIP "DCAP_CREATE_RELATIONSHIP"

/** Capability set by drivers for formats which support deleting table
 * relationships.
 * @since GDAL 3.6
 */
#define GDAL_DCAP_DELETE_RELATIONSHIP "DCAP_DELETE_RELATIONSHIP"

/** Capability set by drivers for formats which support updating existing table
 * relationships.
 * @since GDAL 3.6
 */
#define GDAL_DCAP_UPDATE_RELATIONSHIP "DCAP_UPDATE_RELATIONSHIP"

/** Capability set by drivers whose FlushCache() implementation returns a
 * dataset that can be opened afterwards and seen in a consistent state, without
 * requiring the dataset on which FlushCache() has been called to be closed.
 * @since GDAL 3.8
 */
#define GDAL_DCAP_FLUSHCACHE_CONSISTENT_STATE "DCAP_FLUSHCACHE_CONSISTENT_STATE"

/** List of (space separated) flags indicating the features of relationships are
 * supported by the driver.
 *
 * Supported values are:
 *
 * - "OneToOne": supports one-to-one relationships, see
 * GDALRelationshipCardinality::GRC_ONE_TO_ONE
 * - "OneToMany": supports one-to-many relationships, see
 * GDALRelationshipCardinality::GRC_ONE_TO_MANY
 * - "ManyToOne": supports many-to-one relationships, see
 * GDALRelationshipCardinality::GRC_MANY_TO_ONE
 * - "ManyToMany": supports many-to-many relationships, see
 * GDALRelationshipCardinality::GRC_MANY_TO_MANY
 * - "Composite": supports composite relationship types, see
 * GDALRelationshipType::GRT_COMPOSITE
 * - "Association": supports association relationship types, see
 * GDALRelationshipType::GRT_ASSOCIATION
 * - "Aggregation": supports aggregation relationship types, see
 * GDALRelationshipType::GRT_AGGREGATION
 * - "MultipleFieldKeys": multiple fields can be used for relationship keys. If
 * not present then only a single field name can be used.
 * - "ForwardPathLabel": supports forward path labels
 * - "BackwardPathLabel": supports backward path labels
 *
 * @since GDAL 3.6
 */
#define GDAL_DMD_RELATIONSHIP_FLAGS "GDAL_DMD_RELATIONSHIP_FLAGS"

/** List of (space separated) standard related table types which are recognised
 * by the driver.
 *
 * See GDALRelationshipGetRelatedTableType/GDALRelationshipSetRelatedTableType
 *
 * @since GDAL 3.7
 */
#define GDAL_DMD_RELATIONSHIP_RELATED_TABLE_TYPES                              \
    "GDAL_DMD_RELATIONSHIP_RELATED_TABLE_TYPES"

/** Capability set by drivers for formats which support renaming vector layers.
 *
 * @since GDAL 3.5
 */
#define GDAL_DCAP_RENAME_LAYERS "DCAP_RENAME_LAYERS"

/** List of (space separated) field domain types supported by the AddFieldDomain()
 * API.
 *
 * Supported values are Coded, Range and Glob, corresponding to the
 * OGRFieldDomainType::OFDT_CODED, OGRFieldDomainType::OFDT_RANGE, and
 * OGRFieldDomainType::OFDT_GLOB field domain types respectively.
 *
 * @since GDAL 3.5
 */
#define GDAL_DMD_CREATION_FIELD_DOMAIN_TYPES "DMD_CREATION_FIELD_DOMAIN_TYPES"

/** List of (space separated) flags supported by the
 * OGRLayer::AlterGeomFieldDefn() API.
 *
 * Supported values are "Name", "Type", "Nullable", "SRS", "CoordinateEpoch",
 * corresponding respectively to the ALTER_GEOM_FIELD_DEFN_NAME_FLAG,
 * ALTER_GEOM_FIELD_DEFN_TYPE_FLAG, ALTER_GEOM_FIELD_DEFN_NULLABLE_FLAG,
 * ALTER_GEOM_FIELD_DEFN_SRS_FLAG, ALTER_GEOM_FIELD_DEFN_SRS_COORD_EPOCH_FLAG
 * flags. Note that advertizing one of these flags doesn't necessarily mean that
 * all modifications of the corresponding property can be made. For example,
 * altering the geometry type may be restricted by the type of the geometries in
 * the field, or changing the nullable state to non-nullable is not possible if
 * null geometries are present, etc.
 *
 * @since GDAL 3.6
 */
#define GDAL_DMD_ALTER_GEOM_FIELD_DEFN_FLAGS "DMD_ALTER_GEOM_FIELD_DEFN_FLAGS"

/** List of (space separated) SQL dialects supported by the driver.
 *
 * The default SQL dialect for the driver will always be the first listed value.
 *
 * Standard values are:
 *
 * - "OGRSQL": the OGR SQL dialect, see
 * https://gdal.org/user/ogr_sql_dialect.html
 * - "SQLITE": the SQLite dialect, see
 * https://gdal.org/user/sql_sqlite_dialect.html
 * - "NATIVE": for drivers with an RDBMS backend this value indicates that the
 * SQL will be passed directly to that database backend, and therefore the
 * RDBMS' native dialect will be used
 *
 * Other dialect values may also be present for some drivers (for some of them,
 * the query string to use might not even by SQL but a dedicated query
 * language). For further details on their interpretation, see the documentation
 * for the respective driver.
 *
 * @since GDAL 3.6
 */
#define GDAL_DMD_SUPPORTED_SQL_DIALECTS "DMD_SUPPORTED_SQL_DIALECTS"

/** Value for GDALDimension::GetType() specifying the X axis of a horizontal
 * CRS.
 * @since GDAL 3.1
 */
#define GDAL_DIM_TYPE_HORIZONTAL_X "HORIZONTAL_X"

/** Value for GDALDimension::GetType() specifying the Y axis of a horizontal
 * CRS.
 * @since GDAL 3.1
 */
#define GDAL_DIM_TYPE_HORIZONTAL_Y "HORIZONTAL_Y"

/** Value for GDALDimension::GetType() specifying a vertical axis.
 * @since GDAL 3.1
 */
#define GDAL_DIM_TYPE_VERTICAL "VERTICAL"

/** Value for GDALDimension::GetType() specifying a temporal axis.
 * @since GDAL 3.1
 */
#define GDAL_DIM_TYPE_TEMPORAL "TEMPORAL"

/** Value for GDALDimension::GetType() specifying a parametric axis.
 * @since GDAL 3.1
 */
#define GDAL_DIM_TYPE_PARAMETRIC "PARAMETRIC"

#define GDsCAddRelationship                                                    \
    "AddRelationship" /**< Dataset capability for supporting AddRelationship() \
                         (at least partially) */
#define GDsCDeleteRelationship                                                 \
    "DeleteRelationship" /**< Dataset capability for supporting                \
                            DeleteRelationship()*/
#define GDsCUpdateRelationship                                                 \
    "UpdateRelationship" /**< Dataset capability for supporting                \
                            UpdateRelationship()*/

void   GDALAllRegister(void);
void  GDALRegisterPlugins(void);
CPLErr  GDALRegisterPlugin(const char *name);

GDALDatasetH  
GDALCreate(GDALDriverH hDriver, const char *, int, int, int, GDALDataType,
           CSLConstList) ;
GDALDatasetH   GDALCreateCopy(GDALDriverH, const char *,
                                                GDALDatasetH, int, CSLConstList,
                                                GDALProgressFunc,
                                                void *) ;

GDALDriverH   GDALIdentifyDriver(const char *pszFilename,
                                                   CSLConstList papszFileList);

GDALDriverH   GDALIdentifyDriverEx(
    const char *pszFilename, unsigned int nIdentifyFlags,
    const char *const *papszAllowedDrivers, const char *const *papszFileList);

GDALDatasetH  
GDALOpen(const char *pszFilename, GDALAccess eAccess) ;
GDALDatasetH   GDALOpenShared(const char *, GDALAccess)
    ;

/* Note: we define GDAL_OF_READONLY and GDAL_OF_UPDATE to be on purpose */
/* equals to GA_ReadOnly and GA_Update */

/** Open in read-only mode.
 * Used by GDALOpenEx().
 * @since GDAL 2.0
 */
#define GDAL_OF_READONLY 0x00

/** Open in update mode.
 * Used by GDALOpenEx().
 * @since GDAL 2.0
 */
#define GDAL_OF_UPDATE 0x01

/** Allow raster and vector drivers to be used.
 * Used by GDALOpenEx().
 * @since GDAL 2.0
 */
#define GDAL_OF_ALL 0x00

/** Allow raster drivers to be used.
 * Used by GDALOpenEx().
 * @since GDAL 2.0
 */
#define GDAL_OF_RASTER 0x02

/** Allow vector drivers to be used.
 * Used by GDALOpenEx().
 * @since GDAL 2.0
 */
#define GDAL_OF_VECTOR 0x04

/** Allow gnm drivers to be used.
 * Used by GDALOpenEx().
 * @since GDAL 2.1
 */
#define GDAL_OF_GNM 0x08

/** Allow multidimensional raster drivers to be used.
 * Used by GDALOpenEx().
 * @since GDAL 3.1
 */
#define GDAL_OF_MULTIDIM_RASTER 0x10

#ifndef DOXYGEN_SKIP
#define GDAL_OF_KIND_MASK 0x1E
#endif

/** Open in shared mode.
 * Used by GDALOpenEx().
 * @since GDAL 2.0
 */
#define GDAL_OF_SHARED 0x20

/** Emit error message in case of failed open.
 * Used by GDALOpenEx().
 * @since GDAL 2.0
 */
#define GDAL_OF_VERBOSE_ERROR 0x40

/** Open as internal dataset. Such dataset isn't registered in the global list
 * of opened dataset. Cannot be used with GDAL_OF_SHARED.
 *
 * Used by GDALOpenEx().
 * @since GDAL 2.0
 */
#define GDAL_OF_INTERNAL 0x80

/** Let GDAL decide if a array-based or hashset-based storage strategy for
 * cached blocks must be used.
 *
 * GDAL_OF_DEFAULT_BLOCK_ACCESS, GDAL_OF_ARRAY_BLOCK_ACCESS and
 * GDAL_OF_HASHSET_BLOCK_ACCESS are mutually exclusive.
 *
 * Used by GDALOpenEx().
 * @since GDAL 2.1
 */
#define GDAL_OF_DEFAULT_BLOCK_ACCESS 0

/** Use a array-based storage strategy for cached blocks.
 *
 * GDAL_OF_DEFAULT_BLOCK_ACCESS, GDAL_OF_ARRAY_BLOCK_ACCESS and
 * GDAL_OF_HASHSET_BLOCK_ACCESS are mutually exclusive.
 *
 * Used by GDALOpenEx().
 * @since GDAL 2.1
 */
#define GDAL_OF_ARRAY_BLOCK_ACCESS 0x100

/** Use a hashset-based storage strategy for cached blocks.
 *
 * GDAL_OF_DEFAULT_BLOCK_ACCESS, GDAL_OF_ARRAY_BLOCK_ACCESS and
 * GDAL_OF_HASHSET_BLOCK_ACCESS are mutually exclusive.
 *
 * Used by GDALOpenEx().
 * @since GDAL 2.1
 */
#define GDAL_OF_HASHSET_BLOCK_ACCESS 0x200

#ifndef DOXYGEN_SKIP
/* Reserved for a potential future alternative to GDAL_OF_ARRAY_BLOCK_ACCESS
 * and GDAL_OF_HASHSET_BLOCK_ACCESS */
#define GDAL_OF_RESERVED_1 0x300

/** Mask to detect the block access method */
#define GDAL_OF_BLOCK_ACCESS_MASK 0x300
#endif

GDALDatasetH   GDALOpenEx(
    const char *pszFilename, unsigned int nOpenFlags,
    const char *const *papszAllowedDrivers, const char *const *papszOpenOptions,
    const char *const *papszSiblingFiles) ;

int   GDALDumpOpenDatasets(FILE *);

GDALDriverH   GDALGetDriverByName(const char *);
int   GDALGetDriverCount(void);
GDALDriverH   GDALGetDriver(int);
GDALDriverH   GDALCreateDriver(void);
void   GDALDestroyDriver(GDALDriverH);
int   GDALRegisterDriver(GDALDriverH);
void   GDALDeregisterDriver(GDALDriverH);
void   GDALDestroyDriverManager(void);
#ifndef DOXYGEN_SKIP
void  GDALDestroy(void);
#endif
CPLErr   GDALDeleteDataset(GDALDriverH, const char *);
CPLErr   GDALRenameDataset(GDALDriverH,
                                             const char *pszNewName,
                                             const char *pszOldName);
CPLErr   GDALCopyDatasetFiles(GDALDriverH,
                                                const char *pszNewName,
                                                const char *pszOldName);
int  
GDALValidateCreationOptions(GDALDriverH, CSLConstList papszCreationOptions);

/* The following are deprecated */
const char  * GDALGetDriverShortName(GDALDriverH);
const char  * GDALGetDriverLongName(GDALDriverH);
const char  * GDALGetDriverHelpTopic(GDALDriverH);
const char  * GDALGetDriverCreationOptionList(GDALDriverH);

/* ==================================================================== */
/*      GDAL_GCP                                                        */
/* ==================================================================== */

/** Ground Control Point */
typedef struct
{
    /** Unique identifier, often numeric */
    char *pszId;

    /** Informational message or "" */
    char *pszInfo;

    /** Pixel (x) location of GCP on raster */
    double dfGCPPixel;
    /** Line (y) location of GCP on raster */
    double dfGCPLine;

    /** X position of GCP in georeferenced space */
    double dfGCPX;

    /** Y position of GCP in georeferenced space */
    double dfGCPY;

    /** Elevation of GCP, or zero if not known */
    double dfGCPZ;
} GDAL_GCP;

void   GDALInitGCPs(int, GDAL_GCP *);
void   GDALDeinitGCPs(int, GDAL_GCP *);
GDAL_GCP  * GDALDuplicateGCPs(int, const GDAL_GCP *);

int   GDALGCPsToGeoTransform(
    int nGCPCount, const GDAL_GCP *pasGCPs, double *padfGeoTransform,
    int bApproxOK) ;
int   GDALInvGeoTransform(double *padfGeoTransformIn,
                                            double *padfInvGeoTransformOut)
    ;
void   GDALApplyGeoTransform(double *, double, double,
                                               double *, double *);
void  GDALComposeGeoTransforms(const double *padfGeoTransform1,
                                      const double *padfGeoTransform2,
                                      double *padfGeoTransformOut);

/* ==================================================================== */
/*      major objects (dataset, and, driver, drivermanager).            */
/* ==================================================================== */

char  ** GDALGetMetadataDomainList(GDALMajorObjectH hObject);
char  ** GDALGetMetadata(GDALMajorObjectH, const char *);
CPLErr   GDALSetMetadata(GDALMajorObjectH, CSLConstList,
                                           const char *);
const char  * GDALGetMetadataItem(GDALMajorObjectH,
                                                    const char *, const char *);
CPLErr   GDALSetMetadataItem(GDALMajorObjectH, const char *,
                                               const char *, const char *);
const char  * GDALGetDescription(GDALMajorObjectH);
void   GDALSetDescription(GDALMajorObjectH, const char *);

/* ==================================================================== */
/*      GDALDataset class ... normally this represents one file.        */
/* ==================================================================== */

/** Name of driver metadata item for layer creation option list */
#define GDAL_DS_LAYER_CREATIONOPTIONLIST "DS_LAYER_CREATIONOPTIONLIST"

GDALDriverH   GDALGetDatasetDriver(GDALDatasetH);
char  ** GDALGetFileList(GDALDatasetH);
CPLErr   GDALClose(GDALDatasetH);
int   GDALGetRasterXSize(GDALDatasetH);
int   GDALGetRasterYSize(GDALDatasetH);
int   GDALGetRasterCount(GDALDatasetH);
GDALRasterBandH   GDALGetRasterBand(GDALDatasetH, int);

CPLErr   GDALAddBand(GDALDatasetH hDS, GDALDataType eType,
                                       CSLConstList papszOptions);

GDALAsyncReaderH   GDALBeginAsyncReader(
    GDALDatasetH hDS, int nXOff, int nYOff, int nXSize, int nYSize, void *pBuf,
    int nBufXSize, int nBufYSize, GDALDataType eBufType, int nBandCount,
    int *panBandMap, int nPixelSpace, int nLineSpace, int nBandSpace,
    CSLConstList papszOptions) ;

void   GDALEndAsyncReader(GDALDatasetH hDS,
                                            GDALAsyncReaderH hAsynchReaderH);

CPLErr   GDALDatasetRasterIO(
    GDALDatasetH hDS, GDALRWFlag eRWFlag, int nDSXOff, int nDSYOff,
    int nDSXSize, int nDSYSize, void *pBuffer, int nBXSize, int nBYSize,
    GDALDataType eBDataType, int nBandCount, int *panBandCount, int nPixelSpace,
    int nLineSpace, int nBandSpace) ;

CPLErr   GDALDatasetRasterIOEx(
    GDALDatasetH hDS, GDALRWFlag eRWFlag, int nDSXOff, int nDSYOff,
    int nDSXSize, int nDSYSize, void *pBuffer, int nBXSize, int nBYSize,
    GDALDataType eBDataType, int nBandCount, int *panBandCount,
    GSpacing nPixelSpace, GSpacing nLineSpace, GSpacing nBandSpace,
    GDALRasterIOExtraArg *psExtraArg) ;

CPLErr   GDALDatasetAdviseRead(
    GDALDatasetH hDS, int nDSXOff, int nDSYOff, int nDSXSize, int nDSYSize,
    int nBXSize, int nBYSize, GDALDataType eBDataType, int nBandCount,
    int *panBandCount, CSLConstList papszOptions);

char  **
GDALDatasetGetCompressionFormats(GDALDatasetH hDS, int nXOff, int nYOff,
                                 int nXSize, int nYSize, int nBandCount,
                                 const int *panBandList) ;
CPLErr  GDALDatasetReadCompressedData(
    GDALDatasetH hDS, const char *pszFormat, int nXOff, int nYOff, int nXSize,
    int nYSize, int nBandCount, const int *panBandList, void **ppBuffer,
    size_t *pnBufferSize, char **ppszDetailedFormat);

const char  * GDALGetProjectionRef(GDALDatasetH);
OGRSpatialReferenceH  GDALGetSpatialRef(GDALDatasetH);
CPLErr   GDALSetProjection(GDALDatasetH, const char *);
CPLErr  GDALSetSpatialRef(GDALDatasetH, OGRSpatialReferenceH);
CPLErr   GDALGetGeoTransform(GDALDatasetH, double *);
CPLErr   GDALSetGeoTransform(GDALDatasetH, double *);

int   GDALGetGCPCount(GDALDatasetH);
const char  * GDALGetGCPProjection(GDALDatasetH);
OGRSpatialReferenceH  GDALGetGCPSpatialRef(GDALDatasetH);
const GDAL_GCP  * GDALGetGCPs(GDALDatasetH);
CPLErr   GDALSetGCPs(GDALDatasetH, int, const GDAL_GCP *,
                                       const char *);
CPLErr  GDALSetGCPs2(GDALDatasetH, int, const GDAL_GCP *,
                            OGRSpatialReferenceH);

void  * GDALGetInternalHandle(GDALDatasetH, const char *);
int   GDALReferenceDataset(GDALDatasetH);
int   GDALDereferenceDataset(GDALDatasetH);
int   GDALReleaseDataset(GDALDatasetH);

CPLErr   GDALBuildOverviews(GDALDatasetH, const char *, int,
                                              const int *, int, const int *,
                                              GDALProgressFunc,
                                              void *) ;
CPLErr   GDALBuildOverviewsEx(
    GDALDatasetH, const char *, int, const int *, int, const int *,
    GDALProgressFunc, void *, CSLConstList papszOptions) ;
void   GDALGetOpenDatasets(GDALDatasetH **hDS, int *pnCount);
int   GDALGetAccess(GDALDatasetH hDS);
CPLErr   GDALFlushCache(GDALDatasetH hDS);

CPLErr   GDALCreateDatasetMaskBand(GDALDatasetH hDS,
                                                     int nFlags);

CPLErr   GDALDatasetCopyWholeRaster(
    GDALDatasetH hSrcDS, GDALDatasetH hDstDS, CSLConstList papszOptions,
    GDALProgressFunc pfnProgress, void *pProgressData) ;

CPLErr   GDALRasterBandCopyWholeRaster(
    GDALRasterBandH hSrcBand, GDALRasterBandH hDstBand,
    const char *const *constpapszOptions, GDALProgressFunc pfnProgress,
    void *pProgressData) ;

CPLErr  GDALRegenerateOverviews(GDALRasterBandH hSrcBand,
                                       int nOverviewCount,
                                       GDALRasterBandH *pahOverviewBands,
                                       const char *pszResampling,
                                       GDALProgressFunc pfnProgress,
                                       void *pProgressData);

CPLErr  GDALRegenerateOverviewsEx(GDALRasterBandH hSrcBand,
                                         int nOverviewCount,
                                         GDALRasterBandH *pahOverviewBands,
                                         const char *pszResampling,
                                         GDALProgressFunc pfnProgress,
                                         void *pProgressData,
                                         CSLConstList papszOptions);

int  GDALDatasetGetLayerCount(GDALDatasetH);
OGRLayerH  GDALDatasetGetLayer(GDALDatasetH, int);
OGRLayerH  GDALDatasetGetLayerByName(GDALDatasetH, const char *);
int  GDALDatasetIsLayerPrivate(GDALDatasetH, int);
OGRErr  GDALDatasetDeleteLayer(GDALDatasetH, int);
OGRLayerH  GDALDatasetCreateLayer(GDALDatasetH, const char *,
                                         OGRSpatialReferenceH,
                                         OGRwkbGeometryType, CSLConstList);
OGRLayerH  GDALDatasetCopyLayer(GDALDatasetH, OGRLayerH, const char *,
                                       CSLConstList);
void  GDALDatasetResetReading(GDALDatasetH);
OGRFeatureH  GDALDatasetGetNextFeature(GDALDatasetH hDS,
                                              OGRLayerH *phBelongingLayer,
                                              double *pdfProgressPct,
                                              GDALProgressFunc pfnProgress,
                                              void *pProgressData);
int  GDALDatasetTestCapability(GDALDatasetH, const char *);
OGRLayerH  GDALDatasetExecuteSQL(GDALDatasetH, const char *,
                                        OGRGeometryH, const char *);
OGRErr  GDALDatasetAbortSQL(GDALDatasetH);
void  GDALDatasetReleaseResultSet(GDALDatasetH, OGRLayerH);
OGRStyleTableH  GDALDatasetGetStyleTable(GDALDatasetH);
void  GDALDatasetSetStyleTableDirectly(GDALDatasetH, OGRStyleTableH);
void  GDALDatasetSetStyleTable(GDALDatasetH, OGRStyleTableH);
OGRErr  GDALDatasetStartTransaction(GDALDatasetH hDS, int bForce);
OGRErr  GDALDatasetCommitTransaction(GDALDatasetH hDS);
OGRErr  GDALDatasetRollbackTransaction(GDALDatasetH hDS);
void  GDALDatasetClearStatistics(GDALDatasetH hDS);

char  **GDALDatasetGetFieldDomainNames(GDALDatasetH, CSLConstList)
    ;
OGRFieldDomainH  GDALDatasetGetFieldDomain(GDALDatasetH hDS,
                                                  const char *pszName);
bool  GDALDatasetAddFieldDomain(GDALDatasetH hDS,
                                       OGRFieldDomainH hFieldDomain,
                                       char **ppszFailureReason);
bool  GDALDatasetDeleteFieldDomain(GDALDatasetH hDS, const char *pszName,
                                          char **ppszFailureReason);
bool  GDALDatasetUpdateFieldDomain(GDALDatasetH hDS,
                                          OGRFieldDomainH hFieldDomain,
                                          char **ppszFailureReason);

char  **GDALDatasetGetRelationshipNames(GDALDatasetH, CSLConstList)
    ;
GDALRelationshipH  GDALDatasetGetRelationship(GDALDatasetH hDS,
                                                     const char *pszName);

bool  GDALDatasetAddRelationship(GDALDatasetH hDS,
                                        GDALRelationshipH hRelationship,
                                        char **ppszFailureReason);
bool  GDALDatasetDeleteRelationship(GDALDatasetH hDS,
                                           const char *pszName,
                                           char **ppszFailureReason);
bool  GDALDatasetUpdateRelationship(GDALDatasetH hDS,
                                           GDALRelationshipH hRelationship,
                                           char **ppszFailureReason);

/** Type of functions to pass to GDALDatasetSetQueryLoggerFunc
 * @since GDAL 3.7 */
typedef void (*GDALQueryLoggerFunc)(const char *pszSQL, const char *pszError,
                                    int64_t lNumRecords,
                                    int64_t lExecutionTimeMilliseconds,
                                    void *pQueryLoggerArg);

/**
 * Sets the SQL query logger callback.
 *
 * When supported by the driver, the callback will be called with
 * the executed SQL text, the error message, the execution time in milliseconds,
 * the number of records fetched/affected and the client status data.
 *
 * A value of -1 in the execution time or in the number of records indicates
 * that the values are unknown.
 *
 * @param hDS                   Dataset handle.
 * @param pfnQueryLoggerFunc    Callback function
 * @param poQueryLoggerArg      Opaque client status data
 * @return                      true in case of success.
 * @since                       GDAL 3.7
 */
bool  GDALDatasetSetQueryLoggerFunc(
    GDALDatasetH hDS, GDALQueryLoggerFunc pfnQueryLoggerFunc,
    void *poQueryLoggerArg);

/* ==================================================================== */
/*      Informational utilities about subdatasets in file names         */
/* ==================================================================== */

/**
 *  Opaque type used for the C bindings of the C++ GDALSubdatasetInfo class
 *  @since GDAL 3.8
*/
typedef struct GDALSubdatasetInfo *GDALSubdatasetInfoH;

/**
 * @brief Returns a new GDALSubdatasetInfo object with methods to extract
 *        and manipulate subdataset information.
 *        If the pszFileName argument is not recognized by any driver as
 *        a subdataset descriptor, NULL is returned.
 *        The returned object must be freed with GDALDestroySubdatasetInfo().
 * @param pszFileName           File name with subdataset information
 * @note                        This method does not check if the subdataset actually exists.
 * @return                      Opaque pointer to a GDALSubdatasetInfo object or NULL if no drivers accepted the file name.
 * @since                       GDAL 3.8
 */
GDALSubdatasetInfoH  GDALGetSubdatasetInfo(const char *pszFileName);

/**
 * @brief Returns the file path component of a
 *        subdataset descriptor effectively stripping the information about the subdataset
 *        and returning the "parent" dataset descriptor.
 *        The returned string must be freed with CPLFree().
 * @param hInfo                 Pointer to GDALSubdatasetInfo object
 * @note                        This method does not check if the subdataset actually exists.
 * @return                      The original string with the subdataset information removed.
 * @since                       GDAL 3.8
 */
char  *GDALSubdatasetInfoGetPathComponent(GDALSubdatasetInfoH hInfo);

/**
 * @brief Returns the subdataset component of a subdataset descriptor descriptor.
 *        The returned string must be freed with CPLFree().
 * @param hInfo                 Pointer to GDALSubdatasetInfo object
 * @note                        This method does not check if the subdataset actually exists.
 * @return                      The subdataset name.
 * @since                       GDAL 3.8
 */
char  *
GDALSubdatasetInfoGetSubdatasetComponent(GDALSubdatasetInfoH hInfo);

/**
 * @brief Replaces the path component of a subdataset descriptor.
 *        The returned string must be freed with CPLFree().
 * @param hInfo                 Pointer to GDALSubdatasetInfo object
 * @param pszNewPath            New path.
 * @note                        This method does not check if the subdataset actually exists.
 * @return                      The original subdataset descriptor with the old path component replaced by newPath.
 * @since                       GDAL 3.8
 */
char  *GDALSubdatasetInfoModifyPathComponent(GDALSubdatasetInfoH hInfo,
                                                    const char *pszNewPath);

/**
 * @brief Destroys a GDALSubdatasetInfo object.
 * @param hInfo                 Pointer to GDALSubdatasetInfo object
 * @since                       GDAL 3.8
 */
void  GDALDestroySubdatasetInfo(GDALSubdatasetInfoH hInfo);

/* ==================================================================== */
/*      GDALRasterBand ... one band/channel in a dataset.               */
/* ==================================================================== */

/* Note: the only user of SRCVAL() was frmts/vrt/pixelfunctions.cpp and we no */
/* longer use it. */

/**
 * SRCVAL - Macro which may be used by pixel functions to obtain
 *          a pixel from a source buffer.
 */

/** Type of functions to pass to GDALAddDerivedBandPixelFunc.
 * @since GDAL 2.2 */
typedef CPLErr (*GDALDerivedPixelFunc)(void **papoSources, int nSources,
                                       void *pData, int nBufXSize,
                                       int nBufYSize, GDALDataType eSrcType,
                                       GDALDataType eBufType, int nPixelSpace,
                                       int nLineSpace);

/** Type of functions to pass to GDALAddDerivedBandPixelFuncWithArgs.
 * @since GDAL 3.4 */
typedef CPLErr (*GDALDerivedPixelFuncWithArgs)(
    void **papoSources, int nSources, void *pData, int nBufXSize, int nBufYSize,
    GDALDataType eSrcType, GDALDataType eBufType, int nPixelSpace,
    int nLineSpace, CSLConstList papszFunctionArgs);

GDALDataType   GDALGetRasterDataType(GDALRasterBandH);
void   GDALGetBlockSize(GDALRasterBandH, int *pnXSize,
                                          int *pnYSize);

CPLErr   GDALGetActualBlockSize(GDALRasterBandH,
                                                  int nXBlockOff,
                                                  int nYBlockOff, int *pnXValid,
                                                  int *pnYValid);

CPLErr   GDALRasterAdviseRead(GDALRasterBandH hRB,
                                                int nDSXOff, int nDSYOff,
                                                int nDSXSize, int nDSYSize,
                                                int nBXSize, int nBYSize,
                                                GDALDataType eBDataType,
                                                CSLConstList papszOptions);

CPLErr   GDALRasterIO(GDALRasterBandH hRBand,
                                        GDALRWFlag eRWFlag, int nDSXOff,
                                        int nDSYOff, int nDSXSize, int nDSYSize,
                                        void *pBuffer, int nBXSize, int nBYSize,
                                        GDALDataType eBDataType,
                                        int nPixelSpace,
                                        int nLineSpace) ;
CPLErr   GDALRasterIOEx(
    GDALRasterBandH hRBand, GDALRWFlag eRWFlag, int nDSXOff, int nDSYOff,
    int nDSXSize, int nDSYSize, void *pBuffer, int nBXSize, int nBYSize,
    GDALDataType eBDataType, GSpacing nPixelSpace, GSpacing nLineSpace,
    GDALRasterIOExtraArg *psExtraArg) ;
CPLErr   GDALReadBlock(GDALRasterBandH, int, int,
                                         void *) ;
CPLErr   GDALWriteBlock(GDALRasterBandH, int, int,
                                          void *) ;
int   GDALGetRasterBandXSize(GDALRasterBandH);
int   GDALGetRasterBandYSize(GDALRasterBandH);
GDALAccess   GDALGetRasterAccess(GDALRasterBandH);
int   GDALGetBandNumber(GDALRasterBandH);
GDALDatasetH   GDALGetBandDataset(GDALRasterBandH);

GDALColorInterp
      GDALGetRasterColorInterpretation(GDALRasterBandH);
CPLErr   GDALSetRasterColorInterpretation(GDALRasterBandH,
                                                            GDALColorInterp);
GDALColorTableH   GDALGetRasterColorTable(GDALRasterBandH);
CPLErr   GDALSetRasterColorTable(GDALRasterBandH,
                                                   GDALColorTableH);
int   GDALHasArbitraryOverviews(GDALRasterBandH);
int   GDALGetOverviewCount(GDALRasterBandH);
GDALRasterBandH   GDALGetOverview(GDALRasterBandH, int);
double   GDALGetRasterNoDataValue(GDALRasterBandH, int *);
int64_t   GDALGetRasterNoDataValueAsInt64(GDALRasterBandH,
                                                            int *);
uint64_t   GDALGetRasterNoDataValueAsUInt64(GDALRasterBandH,
                                                              int *);
CPLErr   GDALSetRasterNoDataValue(GDALRasterBandH, double);
CPLErr   GDALSetRasterNoDataValueAsInt64(GDALRasterBandH,
                                                           int64_t);
CPLErr   GDALSetRasterNoDataValueAsUInt64(GDALRasterBandH,
                                                            uint64_t);
CPLErr   GDALDeleteRasterNoDataValue(GDALRasterBandH);
char  ** GDALGetRasterCategoryNames(GDALRasterBandH);
CPLErr   GDALSetRasterCategoryNames(GDALRasterBandH,
                                                      CSLConstList);
double   GDALGetRasterMinimum(GDALRasterBandH,
                                                int *pbSuccess);
double   GDALGetRasterMaximum(GDALRasterBandH,
                                                int *pbSuccess);
CPLErr   GDALGetRasterStatistics(
    GDALRasterBandH, int bApproxOK, int bForce, double *pdfMin, double *pdfMax,
    double *pdfMean, double *pdfStdDev);
CPLErr  
GDALComputeRasterStatistics(GDALRasterBandH, int bApproxOK, double *pdfMin,
                            double *pdfMax, double *pdfMean, double *pdfStdDev,
                            GDALProgressFunc pfnProgress, void *pProgressData);
CPLErr   GDALSetRasterStatistics(GDALRasterBandH hBand,
                                                   double dfMin, double dfMax,
                                                   double dfMean,
                                                   double dfStdDev);

GDALMDArrayH
     GDALRasterBandAsMDArray(GDALRasterBandH) ;

const char  * GDALGetRasterUnitType(GDALRasterBandH);
CPLErr   GDALSetRasterUnitType(GDALRasterBandH hBand,
                                                 const char *pszNewValue);
double   GDALGetRasterOffset(GDALRasterBandH, int *pbSuccess);
CPLErr   GDALSetRasterOffset(GDALRasterBandH hBand,
                                               double dfNewOffset);
double   GDALGetRasterScale(GDALRasterBandH, int *pbSuccess);
CPLErr   GDALSetRasterScale(GDALRasterBandH hBand,
                                              double dfNewOffset);
CPLErr   GDALComputeRasterMinMax(GDALRasterBandH hBand,
                                                   int bApproxOK,
                                                   double adfMinMax[2]);
CPLErr   GDALFlushRasterCache(GDALRasterBandH hBand);
CPLErr   GDALGetRasterHistogram(
    GDALRasterBandH hBand, double dfMin, double dfMax, int nBuckets,
    int *panHistogram, int bIncludeOutOfRange, int bApproxOK,
    GDALProgressFunc pfnProgress, void *pProgressData)
    /*! @cond Doxygen_Suppress */
//    CPL_WARN_DEPRECATED("Use GDALGetRasterHistogramEx() instead")
    /*! @endcond */
    ;
CPLErr   GDALGetRasterHistogramEx(
    GDALRasterBandH hBand, double dfMin, double dfMax, int nBuckets,
    GUIntBig *panHistogram, int bIncludeOutOfRange, int bApproxOK,
    GDALProgressFunc pfnProgress, void *pProgressData);
CPLErr  
GDALGetDefaultHistogram(GDALRasterBandH hBand, double *pdfMin, double *pdfMax,
                        int *pnBuckets, int **ppanHistogram, int bForce,
                        GDALProgressFunc pfnProgress, void *pProgressData)
    /*! @cond Doxygen_Suppress */
  //  CPL_WARN_DEPRECATED("Use GDALGetDefaultHistogramEx() instead")
    /*! @endcond */
    ;
CPLErr  
GDALGetDefaultHistogramEx(GDALRasterBandH hBand, double *pdfMin, double *pdfMax,
                          int *pnBuckets, GUIntBig **ppanHistogram, int bForce,
                          GDALProgressFunc pfnProgress, void *pProgressData);
CPLErr   GDALSetDefaultHistogram(GDALRasterBandH hBand,
                                                   double dfMin, double dfMax,
                                                   int nBuckets,
                                                   int *panHistogram)
    /*! @cond Doxygen_Suppress */
    //CPL_WARN_DEPRECATED("Use GDALSetDefaultHistogramEx() instead")
    /*! @endcond */
    ;
CPLErr   GDALSetDefaultHistogramEx(GDALRasterBandH hBand,
                                                     double dfMin, double dfMax,
                                                     int nBuckets,
                                                     GUIntBig *panHistogram);
int   GDALGetRandomRasterSample(GDALRasterBandH, int,
                                                  float *);
GDALRasterBandH   GDALGetRasterSampleOverview(GDALRasterBandH,
                                                                int);
GDALRasterBandH  
    GDALGetRasterSampleOverviewEx(GDALRasterBandH, GUIntBig);
CPLErr   GDALFillRaster(GDALRasterBandH hBand,
                                          double dfRealValue,
                                          double dfImaginaryValue);
CPLErr   GDALComputeBandStats(
    GDALRasterBandH hBand, int nSampleStep, double *pdfMean, double *pdfStdDev,
    GDALProgressFunc pfnProgress, void *pProgressData);
CPLErr  GDALOverviewMagnitudeCorrection(GDALRasterBandH hBaseBand,
                                               int nOverviewCount,
                                               GDALRasterBandH *pahOverviews,
                                               GDALProgressFunc pfnProgress,
                                               void *pProgressData);

GDALRasterAttributeTableH  
GDALGetDefaultRAT(GDALRasterBandH hBand);
CPLErr   GDALSetDefaultRAT(GDALRasterBandH,
                                             GDALRasterAttributeTableH);
CPLErr   GDALAddDerivedBandPixelFunc(
    const char *pszName, GDALDerivedPixelFunc pfnPixelFunc);
CPLErr   GDALAddDerivedBandPixelFuncWithArgs(
    const char *pszName, GDALDerivedPixelFuncWithArgs pfnPixelFunc,
    const char *pszMetadata);

GDALRasterBandH   GDALGetMaskBand(GDALRasterBandH hBand);
int   GDALGetMaskFlags(GDALRasterBandH hBand);
CPLErr   GDALCreateMaskBand(GDALRasterBandH hBand,
                                              int nFlags);
bool  GDALIsMaskBand(GDALRasterBandH hBand);

/** Flag returned by GDALGetMaskFlags() to indicate that all pixels are valid */
#define GMF_ALL_VALID 0x01
/** Flag returned by GDALGetMaskFlags() to indicate that the mask band is
 * valid for all bands */
#define GMF_PER_DATASET 0x02
/** Flag returned by GDALGetMaskFlags() to indicate that the mask band is
 * an alpha band */
#define GMF_ALPHA 0x04
/** Flag returned by GDALGetMaskFlags() to indicate that the mask band is
 * computed from nodata values */
#define GMF_NODATA 0x08

/** Flag returned by GDALGetDataCoverageStatus() when the driver does not
 * implement GetDataCoverageStatus(). This flag should be returned together
 * with GDAL_DATA_COVERAGE_STATUS_DATA */
#define GDAL_DATA_COVERAGE_STATUS_UNIMPLEMENTED 0x01

/** Flag returned by GDALGetDataCoverageStatus() when there is (potentially)
 * data in the queried window. Can be combined with the binary or operator
 * with GDAL_DATA_COVERAGE_STATUS_UNIMPLEMENTED or
 * GDAL_DATA_COVERAGE_STATUS_EMPTY */
#define GDAL_DATA_COVERAGE_STATUS_DATA 0x02

/** Flag returned by GDALGetDataCoverageStatus() when there is nodata in the
 * queried window. This is typically identified by the concept of missing block
 * in formats that supports it.
 * Can be combined with the binary or operator with
 * GDAL_DATA_COVERAGE_STATUS_DATA */
#define GDAL_DATA_COVERAGE_STATUS_EMPTY 0x04

int   GDALGetDataCoverageStatus(GDALRasterBandH hBand,
                                                  int nXOff, int nYOff,
                                                  int nXSize, int nYSize,
                                                  int nMaskFlagStop,
                                                  double *pdfDataPct);

/* ==================================================================== */
/*     GDALAsyncReader                                                  */
/* ==================================================================== */

GDALAsyncStatusType   GDALARGetNextUpdatedRegion(
    GDALAsyncReaderH hARIO, double dfTimeout, int *pnXBufOff, int *pnYBufOff,
    int *pnXBufSize, int *pnYBufSize);
int   GDALARLockBuffer(GDALAsyncReaderH hARIO,
                                         double dfTimeout);
void   GDALARUnlockBuffer(GDALAsyncReaderH hARIO);

/* -------------------------------------------------------------------- */
/*      Helper functions.                                               */
/* -------------------------------------------------------------------- */
int   GDALGeneralCmdLineProcessor(int nArgc,
                                                    char ***ppapszArgv,
                                                    int nOptions);
void   GDALSwapWords(void *pData, int nWordSize,
                                       int nWordCount, int nWordSkip);
void   GDALSwapWordsEx(void *pData, int nWordSize,
                                         size_t nWordCount, int nWordSkip);

void   GDALCopyWords(const void * pSrcData,
                                       GDALDataType eSrcType,
                                       int nSrcPixelOffset,
                                       void * pDstData,
                                       GDALDataType eDstType,
                                       int nDstPixelOffset, int nWordCount);

void   GDALCopyWords64(
    const void * pSrcData, GDALDataType eSrcType,
    int nSrcPixelOffset, void * pDstData, GDALDataType eDstType,
    int nDstPixelOffset, GPtrDiff_t nWordCount);

void  GDALCopyBits(const GByte *pabySrcData, int nSrcOffset,
                          int nSrcStep, GByte *pabyDstData, int nDstOffset,
                          int nDstStep, int nBitCount, int nStepCount);

void  GDALDeinterleave(const void *pSourceBuffer, GDALDataType eSourceDT,
                              int nComponents, void **ppDestBuffer,
                              GDALDataType eDestDT, size_t nIters);

int   GDALLoadWorldFile(const char *, double *);
int   GDALReadWorldFile(const char *, const char *, double *);
int   GDALWriteWorldFile(const char *, const char *,
                                           double *);
int   GDALLoadTabFile(const char *, double *, char **, int *,
                                        GDAL_GCP **);
int   GDALReadTabFile(const char *, double *, char **, int *,
                                        GDAL_GCP **);
int   GDALLoadOziMapFile(const char *, double *, char **,
                                           int *, GDAL_GCP **);
int   GDALReadOziMapFile(const char *, double *, char **,
                                           int *, GDAL_GCP **);

const char  * GDALDecToDMS(double, const char *, int);
double   GDALPackedDMSToDec(double);
double   GDALDecToPackedDMS(double);

/* Note to developers : please keep this section in sync with ogr_core.h */

#ifndef GDAL_VERSION_INFO_DEFINED
#ifndef DOXYGEN_SKIP
#define GDAL_VERSION_INFO_DEFINED
#endif
const char  * GDALVersionInfo(const char *);
#endif

#ifndef GDAL_CHECK_VERSION

int   GDALCheckVersion(int nVersionMajor, int nVersionMinor,
                                         const char *pszCallingComponentName);

/** Helper macro for GDALCheckVersion()
  @see GDALCheckVersion()
  */
#define GDAL_CHECK_VERSION(pszCallingComponentName)                            \
    GDALCheckVersion(GDAL_VERSION_MAJOR, GDAL_VERSION_MINOR,                   \
                     pszCallingComponentName)

#endif

/*! @cond Doxygen_Suppress */
#ifdef GDAL_COMPILATION
#define GDALExtractRPCInfoV1 GDALExtractRPCInfo
#else
#define GDALRPCInfo GDALRPCInfoV2
#define GDALExtractRPCInfo GDALExtractRPCInfoV2
#endif

/* Deprecated: use GDALRPCInfoV2 */
typedef struct
{
    double dfLINE_OFF;   /*!< Line offset */
    double dfSAMP_OFF;   /*!< Sample/Pixel offset */
    double dfLAT_OFF;    /*!< Latitude offset */
    double dfLONG_OFF;   /*!< Longitude offset */
    double dfHEIGHT_OFF; /*!< Height offset */

    double dfLINE_SCALE;   /*!< Line scale */
    double dfSAMP_SCALE;   /*!< Sample/Pixel scale */
    double dfLAT_SCALE;    /*!< Latitude scale */
    double dfLONG_SCALE;   /*!< Longitude scale */
    double dfHEIGHT_SCALE; /*!< Height scale */

    double adfLINE_NUM_COEFF[20]; /*!< Line Numerator Coefficients */
    double adfLINE_DEN_COEFF[20]; /*!< Line Denominator Coefficients */
    double adfSAMP_NUM_COEFF[20]; /*!< Sample/Pixel Numerator Coefficients */
    double adfSAMP_DEN_COEFF[20]; /*!< Sample/Pixel Denominator Coefficients */

    double dfMIN_LONG; /*!< Minimum longitude */
    double dfMIN_LAT;  /*!< Minimum latitude */
    double dfMAX_LONG; /*!< Maximum longitude */
    double dfMAX_LAT;  /*!< Maximum latitude */
} GDALRPCInfoV1;
/*! @endcond */

/** Structure to store Rational Polynomial Coefficients / Rigorous Projection
 * Model. See http://geotiff.maptools.org/rpc_prop.html */
typedef struct
{
    double dfLINE_OFF;   /*!< Line offset */
    double dfSAMP_OFF;   /*!< Sample/Pixel offset */
    double dfLAT_OFF;    /*!< Latitude offset */
    double dfLONG_OFF;   /*!< Longitude offset */
    double dfHEIGHT_OFF; /*!< Height offset */

    double dfLINE_SCALE;   /*!< Line scale */
    double dfSAMP_SCALE;   /*!< Sample/Pixel scale */
    double dfLAT_SCALE;    /*!< Latitude scale */
    double dfLONG_SCALE;   /*!< Longitude scale */
    double dfHEIGHT_SCALE; /*!< Height scale */

    double adfLINE_NUM_COEFF[20]; /*!< Line Numerator Coefficients */
    double adfLINE_DEN_COEFF[20]; /*!< Line Denominator Coefficients */
    double adfSAMP_NUM_COEFF[20]; /*!< Sample/Pixel Numerator Coefficients */
    double adfSAMP_DEN_COEFF[20]; /*!< Sample/Pixel Denominator Coefficients */

    double dfMIN_LONG; /*!< Minimum longitude */
    double dfMIN_LAT;  /*!< Minimum latitude */
    double dfMAX_LONG; /*!< Maximum longitude */
    double dfMAX_LAT;  /*!< Maximum latitude */

    /* Those fields should be at the end. And all above fields should be the
     * same as in GDALRPCInfoV1 */
    double dfERR_BIAS; /*!< Bias error */
    double dfERR_RAND; /*!< Random error */
} GDALRPCInfoV2;

/*! @cond Doxygen_Suppress */
int   GDALExtractRPCInfoV1(CSLConstList, GDALRPCInfoV1 *);
/*! @endcond */
int   GDALExtractRPCInfoV2(CSLConstList, GDALRPCInfoV2 *);

/* ==================================================================== */
/*      Color tables.                                                   */
/* ==================================================================== */

/** Color tuple */
typedef struct
{
    /*! gray, red, cyan or hue */
    short c1;

    /*! green, magenta, or lightness */
    short c2;

    /*! blue, yellow, or saturation */
    short c3;

    /*! alpha or blackband */
    short c4;
} GDALColorEntry;

GDALColorTableH   GDALCreateColorTable(GDALPaletteInterp)
    ;
void   GDALDestroyColorTable(GDALColorTableH);
GDALColorTableH   GDALCloneColorTable(GDALColorTableH);
GDALPaletteInterp
      GDALGetPaletteInterpretation(GDALColorTableH);
int   GDALGetColorEntryCount(GDALColorTableH);
const GDALColorEntry  * GDALGetColorEntry(GDALColorTableH,
                                                            int);
int   GDALGetColorEntryAsRGB(GDALColorTableH, int,
                                               GDALColorEntry *);
void   GDALSetColorEntry(GDALColorTableH, int,
                                           const GDALColorEntry *);
void   GDALCreateColorRamp(GDALColorTableH hTable,
                                             int nStartIndex,
                                             const GDALColorEntry *psStartColor,
                                             int nEndIndex,
                                             const GDALColorEntry *psEndColor);

/* ==================================================================== */
/*      Raster Attribute Table                                          */
/* ==================================================================== */

/** Field type of raster attribute table */
typedef enum
{
    /*! Integer field */ GFT_Integer,
    /*! Floating point (double) field */ GFT_Real,
    /*! String field */ GFT_String
} GDALRATFieldType;

/** Field usage of raster attribute table */
typedef enum
{
    /*! General purpose field. */ GFU_Generic = 0,
    /*! Histogram pixel count */ GFU_PixelCount = 1,
    /*! Class name */ GFU_Name = 2,
    /*! Class range minimum */ GFU_Min = 3,
    /*! Class range maximum */ GFU_Max = 4,
    /*! Class value (min=max) */ GFU_MinMax = 5,
    /*! Red class color (0-255) */ GFU_Red = 6,
    /*! Green class color (0-255) */ GFU_Green = 7,
    /*! Blue class color (0-255) */ GFU_Blue = 8,
    /*! Alpha (0=transparent,255=opaque)*/ GFU_Alpha = 9,
    /*! Color Range Red Minimum */ GFU_RedMin = 10,
    /*! Color Range Green Minimum */ GFU_GreenMin = 11,
    /*! Color Range Blue Minimum */ GFU_BlueMin = 12,
    /*! Color Range Alpha Minimum */ GFU_AlphaMin = 13,
    /*! Color Range Red Maximum */ GFU_RedMax = 14,
    /*! Color Range Green Maximum */ GFU_GreenMax = 15,
    /*! Color Range Blue Maximum */ GFU_BlueMax = 16,
    /*! Color Range Alpha Maximum */ GFU_AlphaMax = 17,
    /*! Maximum GFU value (equals to GFU_AlphaMax+1 currently) */ GFU_MaxCount
} GDALRATFieldUsage;

/** RAT table type (thematic or athematic)
 * @since GDAL 2.4
 */
typedef enum
{
    /*! Thematic table type */ GRTT_THEMATIC,
    /*! Athematic table type */ GRTT_ATHEMATIC
} GDALRATTableType;

GDALRasterAttributeTableH  
GDALCreateRasterAttributeTable(void) ;

void  
    GDALDestroyRasterAttributeTable(GDALRasterAttributeTableH);

int   GDALRATGetColumnCount(GDALRasterAttributeTableH);

const char  * GDALRATGetNameOfCol(GDALRasterAttributeTableH,
                                                    int);
GDALRATFieldUsage  
GDALRATGetUsageOfCol(GDALRasterAttributeTableH, int);
GDALRATFieldType  
GDALRATGetTypeOfCol(GDALRasterAttributeTableH, int);

int   GDALRATGetColOfUsage(GDALRasterAttributeTableH,
                                             GDALRATFieldUsage);
int   GDALRATGetRowCount(GDALRasterAttributeTableH);

const char  *
GDALRATGetValueAsString(GDALRasterAttributeTableH, int, int);
int   GDALRATGetValueAsInt(GDALRasterAttributeTableH, int,
                                             int);
double   GDALRATGetValueAsDouble(GDALRasterAttributeTableH,
                                                   int, int);

void   GDALRATSetValueAsString(GDALRasterAttributeTableH, int,
                                                 int, const char *);
void   GDALRATSetValueAsInt(GDALRasterAttributeTableH, int,
                                              int, int);
void   GDALRATSetValueAsDouble(GDALRasterAttributeTableH, int,
                                                 int, double);

int  
GDALRATChangesAreWrittenToFile(GDALRasterAttributeTableH hRAT);

CPLErr   GDALRATValuesIOAsDouble(
    GDALRasterAttributeTableH hRAT, GDALRWFlag eRWFlag, int iField,
    int iStartRow, int iLength, double *pdfData);
CPLErr  
GDALRATValuesIOAsInteger(GDALRasterAttributeTableH hRAT, GDALRWFlag eRWFlag,
                         int iField, int iStartRow, int iLength, int *pnData);
CPLErr   GDALRATValuesIOAsString(
    GDALRasterAttributeTableH hRAT, GDALRWFlag eRWFlag, int iField,
    int iStartRow, int iLength, CSLConstList papszStrList);

void   GDALRATSetRowCount(GDALRasterAttributeTableH, int);
CPLErr   GDALRATCreateColumn(GDALRasterAttributeTableH,
                                               const char *, GDALRATFieldType,
                                               GDALRATFieldUsage);
CPLErr   GDALRATSetLinearBinning(GDALRasterAttributeTableH,
                                                   double, double);
int   GDALRATGetLinearBinning(GDALRasterAttributeTableH,
                                                double *, double *);
CPLErr   GDALRATSetTableType(
    GDALRasterAttributeTableH hRAT, const GDALRATTableType eInTableType);
GDALRATTableType  
GDALRATGetTableType(GDALRasterAttributeTableH hRAT);
CPLErr  
    GDALRATInitializeFromColorTable(GDALRasterAttributeTableH, GDALColorTableH);
GDALColorTableH  
GDALRATTranslateToColorTable(GDALRasterAttributeTableH, int nEntryCount);
void   GDALRATDumpReadable(GDALRasterAttributeTableH, FILE *);
GDALRasterAttributeTableH  
GDALRATClone(const GDALRasterAttributeTableH);

void  * GDALRATSerializeJSON(GDALRasterAttributeTableH)
    ;

int   GDALRATGetRowOfValue(GDALRasterAttributeTableH, double);
void   GDALRATRemoveStatistics(GDALRasterAttributeTableH);

/* -------------------------------------------------------------------- */
/*                          Relationships                               */
/* -------------------------------------------------------------------- */

/** Cardinality of relationship.
 *
 * @since GDAL 3.6
 */
typedef enum
{
    /** One-to-one */
    GRC_ONE_TO_ONE,
    /** One-to-many */
    GRC_ONE_TO_MANY,
    /** Many-to-one */
    GRC_MANY_TO_ONE,
    /** Many-to-many */
    GRC_MANY_TO_MANY,
} GDALRelationshipCardinality;

/** Type of relationship.
 *
 * @since GDAL 3.6
 */
typedef enum
{
    /** Composite relationship */
    GRT_COMPOSITE,
    /** Association relationship */
    GRT_ASSOCIATION,
    /** Aggregation relationship */
    GRT_AGGREGATION,
} GDALRelationshipType;

GDALRelationshipH  GDALRelationshipCreate(const char *, const char *,
                                                 const char *,
                                                 GDALRelationshipCardinality);
void   GDALDestroyRelationship(GDALRelationshipH);
const char  *GDALRelationshipGetName(GDALRelationshipH);
GDALRelationshipCardinality
     GDALRelationshipGetCardinality(GDALRelationshipH);
const char  *GDALRelationshipGetLeftTableName(GDALRelationshipH);
const char  *GDALRelationshipGetRightTableName(GDALRelationshipH);
const char  *GDALRelationshipGetMappingTableName(GDALRelationshipH);
void  GDALRelationshipSetMappingTableName(GDALRelationshipH,
                                                 const char *);
char  **GDALRelationshipGetLeftTableFields(GDALRelationshipH);
char  **GDALRelationshipGetRightTableFields(GDALRelationshipH);
void  GDALRelationshipSetLeftTableFields(GDALRelationshipH,
                                                CSLConstList);
void  GDALRelationshipSetRightTableFields(GDALRelationshipH,
                                                 CSLConstList);
char  **GDALRelationshipGetLeftMappingTableFields(GDALRelationshipH);
char  **GDALRelationshipGetRightMappingTableFields(GDALRelationshipH);
void  GDALRelationshipSetLeftMappingTableFields(GDALRelationshipH,
                                                       CSLConstList);
void  GDALRelationshipSetRightMappingTableFields(GDALRelationshipH,
                                                        CSLConstList);
GDALRelationshipType  GDALRelationshipGetType(GDALRelationshipH);
void  GDALRelationshipSetType(GDALRelationshipH, GDALRelationshipType);
const char  *GDALRelationshipGetForwardPathLabel(GDALRelationshipH);
void  GDALRelationshipSetForwardPathLabel(GDALRelationshipH,
                                                 const char *);
const char  *GDALRelationshipGetBackwardPathLabel(GDALRelationshipH);
void  GDALRelationshipSetBackwardPathLabel(GDALRelationshipH,
                                                  const char *);
const char  *GDALRelationshipGetRelatedTableType(GDALRelationshipH);
void  GDALRelationshipSetRelatedTableType(GDALRelationshipH,
                                                 const char *);

/* ==================================================================== */
/*      GDAL Cache Management                                           */
/* ==================================================================== */

void   GDALSetCacheMax(int nBytes);
int   GDALGetCacheMax(void);
int   GDALGetCacheUsed(void);
void   GDALSetCacheMax64(GIntBig nBytes);
GIntBig   GDALGetCacheMax64(void);
GIntBig   GDALGetCacheUsed64(void);

int   GDALFlushCacheBlock(void);

/* ==================================================================== */
/*      GDAL virtual memory                                             */
/* ==================================================================== */

CPLVirtualMem  *GDALDatasetGetVirtualMem(
    GDALDatasetH hDS, GDALRWFlag eRWFlag, int nXOff, int nYOff, int nXSize,
    int nYSize, int nBufXSize, int nBufYSize, GDALDataType eBufType,
    int nBandCount, int *panBandMap, int nPixelSpace, GIntBig nLineSpace,
    GIntBig nBandSpace, size_t nCacheSize, size_t nPageSizeHint,
    int bSingleThreadUsage, CSLConstList papszOptions) ;

CPLVirtualMem  *GDALRasterBandGetVirtualMem(
    GDALRasterBandH hBand, GDALRWFlag eRWFlag, int nXOff, int nYOff, int nXSize,
    int nYSize, int nBufXSize, int nBufYSize, GDALDataType eBufType,
    int nPixelSpace, GIntBig nLineSpace, size_t nCacheSize,
    size_t nPageSizeHint, int bSingleThreadUsage,
    CSLConstList papszOptions) ;

CPLVirtualMem  *
GDALGetVirtualMemAuto(GDALRasterBandH hBand, GDALRWFlag eRWFlag,
                      int *pnPixelSpace, GIntBig *pnLineSpace,
                      CSLConstList papszOptions) ;

/**! Enumeration to describe the tile organization */
typedef enum
{
    /*! Tile Interleaved by Pixel: tile (0,0) with internal band interleaved by
       pixel organization, tile (1, 0), ...  */
    GTO_TIP,
    /*! Band Interleaved by Tile : tile (0,0) of first band, tile (0,0) of
       second band, ... tile (1,0) of first band, tile (1,0) of second band, ...
     */
    GTO_BIT,
    /*! Band SeQuential : all the tiles of first band, all the tiles of
       following band... */
    GTO_BSQ
} GDALTileOrganization;

CPLVirtualMem  *GDALDatasetGetTiledVirtualMem(
    GDALDatasetH hDS, GDALRWFlag eRWFlag, int nXOff, int nYOff, int nXSize,
    int nYSize, int nTileXSize, int nTileYSize, GDALDataType eBufType,
    int nBandCount, int *panBandMap, GDALTileOrganization eTileOrganization,
    size_t nCacheSize, int bSingleThreadUsage,
    CSLConstList papszOptions) ;

CPLVirtualMem  *GDALRasterBandGetTiledVirtualMem(
    GDALRasterBandH hBand, GDALRWFlag eRWFlag, int nXOff, int nYOff, int nXSize,
    int nYSize, int nTileXSize, int nTileYSize, GDALDataType eBufType,
    size_t nCacheSize, int bSingleThreadUsage,
    CSLConstList papszOptions) ;

/* ==================================================================== */
/*      VRTPansharpenedDataset class.                                   */
/* ==================================================================== */

GDALDatasetH  GDALCreatePansharpenedVRT(
    const char *pszXML, GDALRasterBandH hPanchroBand, int nInputSpectralBands,
    GDALRasterBandH *pahInputSpectralBands) ;

/* =================================================================== */
/*      Misc API                                                        */
/* ==================================================================== */

CPLXMLNode  *
GDALGetJPEG2000Structure(const char *pszFilename,
                         CSLConstList papszOptions) ;

/* ==================================================================== */
/*      Multidimensional API_api                                       */
/* ==================================================================== */

GDALDatasetH 
GDALCreateMultiDimensional(GDALDriverH hDriver, const char *pszName,
                           CSLConstList papszRootGroupOptions,
                           CSLConstList papszOptions) ;

GDALExtendedDataTypeH  GDALExtendedDataTypeCreate(GDALDataType eType)
    ;
GDALExtendedDataTypeH  GDALExtendedDataTypeCreateString(
    size_t nMaxStringLength) ;
GDALExtendedDataTypeH  GDALExtendedDataTypeCreateStringEx(
    size_t nMaxStringLength,
    GDALExtendedDataTypeSubType eSubType) ;
GDALExtendedDataTypeH  GDALExtendedDataTypeCreateCompound(
    const char *pszName, size_t nTotalSize, size_t nComponents,
    const GDALEDTComponentH *comps) ;
void  GDALExtendedDataTypeRelease(GDALExtendedDataTypeH hEDT);
const char  *GDALExtendedDataTypeGetName(GDALExtendedDataTypeH hEDT);
GDALExtendedDataTypeClass 
GDALExtendedDataTypeGetClass(GDALExtendedDataTypeH hEDT);
GDALDataType 
GDALExtendedDataTypeGetNumericDataType(GDALExtendedDataTypeH hEDT);
size_t  GDALExtendedDataTypeGetSize(GDALExtendedDataTypeH hEDT);
size_t 
GDALExtendedDataTypeGetMaxStringLength(GDALExtendedDataTypeH hEDT);
GDALEDTComponentH  *
GDALExtendedDataTypeGetComponents(GDALExtendedDataTypeH hEDT,
                                  size_t *pnCount) ;
void  GDALExtendedDataTypeFreeComponents(GDALEDTComponentH *components,
                                                size_t nCount);
int  GDALExtendedDataTypeCanConvertTo(GDALExtendedDataTypeH hSourceEDT,
                                             GDALExtendedDataTypeH hTargetEDT);
int  GDALExtendedDataTypeEquals(GDALExtendedDataTypeH hFirstEDT,
                                       GDALExtendedDataTypeH hSecondEDT);
GDALExtendedDataTypeSubType 
GDALExtendedDataTypeGetSubType(GDALExtendedDataTypeH hEDT);

GDALEDTComponentH 
GDALEDTComponentCreate(const char *pszName, size_t nOffset,
                       GDALExtendedDataTypeH hType) ;
void  GDALEDTComponentRelease(GDALEDTComponentH hComp);
const char  *GDALEDTComponentGetName(GDALEDTComponentH hComp);
size_t  GDALEDTComponentGetOffset(GDALEDTComponentH hComp);
GDALExtendedDataTypeH  GDALEDTComponentGetType(GDALEDTComponentH hComp)
    ;

GDALGroupH  GDALDatasetGetRootGroup(GDALDatasetH hDS)
    ;
void  GDALGroupRelease(GDALGroupH hGroup);
const char  *GDALGroupGetName(GDALGroupH hGroup);
const char  *GDALGroupGetFullName(GDALGroupH hGroup);
char  **
GDALGroupGetMDArrayNames(GDALGroupH hGroup,
                         CSLConstList papszOptions) ;
GDALMDArrayH 
GDALGroupOpenMDArray(GDALGroupH hGroup, const char *pszMDArrayName,
                     CSLConstList papszOptions) ;
GDALMDArrayH  GDALGroupOpenMDArrayFromFullname(
    GDALGroupH hGroup, const char *pszMDArrayName,
    CSLConstList papszOptions) ;
GDALMDArrayH  GDALGroupResolveMDArray(
    GDALGroupH hGroup, const char *pszName, const char *pszStartingPoint,
    CSLConstList papszOptions) ;
char  **
GDALGroupGetGroupNames(GDALGroupH hGroup,
                       CSLConstList papszOptions) ;
GDALGroupH 
GDALGroupOpenGroup(GDALGroupH hGroup, const char *pszSubGroupName,
                   CSLConstList papszOptions) ;
GDALGroupH  GDALGroupOpenGroupFromFullname(
    GDALGroupH hGroup, const char *pszMDArrayName,
    CSLConstList papszOptions) ;
char  **
GDALGroupGetVectorLayerNames(GDALGroupH hGroup,
                             CSLConstList papszOptions) ;
OGRLayerH 
GDALGroupOpenVectorLayer(GDALGroupH hGroup, const char *pszVectorLayerName,
                         CSLConstList papszOptions) ;
GDALDimensionH  *
GDALGroupGetDimensions(GDALGroupH hGroup, size_t *pnCount,
                       CSLConstList papszOptions) ;
GDALAttributeH  GDALGroupGetAttribute(
    GDALGroupH hGroup, const char *pszName) ;
GDALAttributeH  *
GDALGroupGetAttributes(GDALGroupH hGroup, size_t *pnCount,
                       CSLConstList papszOptions) ;
CSLConstList  GDALGroupGetStructuralInfo(GDALGroupH hGroup);
GDALGroupH 
GDALGroupCreateGroup(GDALGroupH hGroup, const char *pszSubGroupName,
                     CSLConstList papszOptions) ;
bool  GDALGroupDeleteGroup(GDALGroupH hGroup, const char *pszName,
                                  CSLConstList papszOptions);
GDALDimensionH  GDALGroupCreateDimension(
    GDALGroupH hGroup, const char *pszName, const char *pszType,
    const char *pszDirection, GUInt64 nSize,
    CSLConstList papszOptions) ;
GDALMDArrayH  GDALGroupCreateMDArray(
    GDALGroupH hGroup, const char *pszName, size_t nDimensions,
    GDALDimensionH *pahDimensions, GDALExtendedDataTypeH hEDT,
    CSLConstList papszOptions) ;
bool  GDALGroupDeleteMDArray(GDALGroupH hGroup, const char *pszName,
                                    CSLConstList papszOptions);
GDALAttributeH  GDALGroupCreateAttribute(
    GDALGroupH hGroup, const char *pszName, size_t nDimensions,
    const GUInt64 *panDimensions, GDALExtendedDataTypeH hEDT,
    CSLConstList papszOptions) ;
bool  GDALGroupDeleteAttribute(GDALGroupH hGroup, const char *pszName,
                                      CSLConstList papszOptions);
bool  GDALGroupRename(GDALGroupH hGroup, const char *pszNewName);
GDALGroupH  GDALGroupSubsetDimensionFromSelection(
    GDALGroupH hGroup, const char *pszSelection, CSLConstList papszOptions);

void  GDALMDArrayRelease(GDALMDArrayH hMDArray);
const char  *GDALMDArrayGetName(GDALMDArrayH hArray);
const char  *GDALMDArrayGetFullName(GDALMDArrayH hArray);
GUInt64  GDALMDArrayGetTotalElementsCount(GDALMDArrayH hArray);
size_t  GDALMDArrayGetDimensionCount(GDALMDArrayH hArray);
GDALDimensionH  *
GDALMDArrayGetDimensions(GDALMDArrayH hArray,
                         size_t *pnCount) ;
GDALExtendedDataTypeH  GDALMDArrayGetDataType(GDALMDArrayH hArray)
    ;
int  GDALMDArrayRead(GDALMDArrayH hArray, const GUInt64 *arrayStartIdx,
                            const size_t *count, const GInt64 *arrayStep,
                            const GPtrDiff_t *bufferStride,
                            GDALExtendedDataTypeH bufferDatatype,
                            void *pDstBuffer, const void *pDstBufferAllocStart,
                            size_t nDstBufferllocSize);
int  GDALMDArrayWrite(GDALMDArrayH hArray, const GUInt64 *arrayStartIdx,
                             const size_t *count, const GInt64 *arrayStep,
                             const GPtrDiff_t *bufferStride,
                             GDALExtendedDataTypeH bufferDatatype,
                             const void *pSrcBuffer,
                             const void *psrcBufferAllocStart,
                             size_t nSrcBufferllocSize);
int  GDALMDArrayAdviseRead(GDALMDArrayH hArray,
                                  const GUInt64 *arrayStartIdx,
                                  const size_t *count);
int  GDALMDArrayAdviseReadEx(GDALMDArrayH hArray,
                                    const GUInt64 *arrayStartIdx,
                                    const size_t *count,
                                    CSLConstList papszOptions);
GDALAttributeH  GDALMDArrayGetAttribute(
    GDALMDArrayH hArray, const char *pszName) ;
GDALAttributeH  *
GDALMDArrayGetAttributes(GDALMDArrayH hArray, size_t *pnCount,
                         CSLConstList papszOptions) ;
GDALAttributeH  GDALMDArrayCreateAttribute(
    GDALMDArrayH hArray, const char *pszName, size_t nDimensions,
    const GUInt64 *panDimensions, GDALExtendedDataTypeH hEDT,
    CSLConstList papszOptions) ;
bool  GDALMDArrayDeleteAttribute(GDALMDArrayH hArray,
                                        const char *pszName,
                                        CSLConstList papszOptions);
bool  GDALMDArrayResize(GDALMDArrayH hArray,
                               const GUInt64 *panNewDimSizes,
                               CSLConstList papszOptions);
const void  *GDALMDArrayGetRawNoDataValue(GDALMDArrayH hArray);
double  GDALMDArrayGetNoDataValueAsDouble(GDALMDArrayH hArray,
                                                 int *pbHasNoDataValue);
int64_t  GDALMDArrayGetNoDataValueAsInt64(GDALMDArrayH hArray,
                                                 int *pbHasNoDataValue);
uint64_t  GDALMDArrayGetNoDataValueAsUInt64(GDALMDArrayH hArray,
                                                   int *pbHasNoDataValue);
int  GDALMDArraySetRawNoDataValue(GDALMDArrayH hArray, const void *);
int  GDALMDArraySetNoDataValueAsDouble(GDALMDArrayH hArray,
                                              double dfNoDataValue);
int  GDALMDArraySetNoDataValueAsInt64(GDALMDArrayH hArray,
                                             int64_t nNoDataValue);
int  GDALMDArraySetNoDataValueAsUInt64(GDALMDArrayH hArray,
                                              uint64_t nNoDataValue);
int  GDALMDArraySetScale(GDALMDArrayH hArray, double dfScale);
int  GDALMDArraySetScaleEx(GDALMDArrayH hArray, double dfScale,
                                  GDALDataType eStorageType);
double  GDALMDArrayGetScale(GDALMDArrayH hArray, int *pbHasValue);
double  GDALMDArrayGetScaleEx(GDALMDArrayH hArray, int *pbHasValue,
                                     GDALDataType *peStorageType);
int  GDALMDArraySetOffset(GDALMDArrayH hArray, double dfOffset);
int  GDALMDArraySetOffsetEx(GDALMDArrayH hArray, double dfOffset,
                                   GDALDataType eStorageType);
double  GDALMDArrayGetOffset(GDALMDArrayH hArray, int *pbHasValue);
double  GDALMDArrayGetOffsetEx(GDALMDArrayH hArray, int *pbHasValue,
                                      GDALDataType *peStorageType);
GUInt64  *GDALMDArrayGetBlockSize(GDALMDArrayH hArray, size_t *pnCount);
int  GDALMDArraySetUnit(GDALMDArrayH hArray, const char *);
const char  *GDALMDArrayGetUnit(GDALMDArrayH hArray);
int  GDALMDArraySetSpatialRef(GDALMDArrayH, OGRSpatialReferenceH);
OGRSpatialReferenceH  GDALMDArrayGetSpatialRef(GDALMDArrayH hArray);
size_t  *GDALMDArrayGetProcessingChunkSize(GDALMDArrayH hArray,
                                                  size_t *pnCount,
                                                  size_t nMaxChunkMemory);
CSLConstList  GDALMDArrayGetStructuralInfo(GDALMDArrayH hArray);
GDALMDArrayH  GDALMDArrayGetView(GDALMDArrayH hArray,
                                        const char *pszViewExpr);
GDALMDArrayH  GDALMDArrayTranspose(GDALMDArrayH hArray,
                                          size_t nNewAxisCount,
                                          const int *panMapNewAxisToOldAxis);
GDALMDArrayH  GDALMDArrayGetUnscaled(GDALMDArrayH hArray);
GDALMDArrayH  GDALMDArrayGetMask(GDALMDArrayH hArray,
                                        CSLConstList papszOptions);
GDALDatasetH  GDALMDArrayAsClassicDataset(GDALMDArrayH hArray,
                                                 size_t iXDim, size_t iYDim);
GDALDatasetH  GDALMDArrayAsClassicDatasetEx(GDALMDArrayH hArray,
                                                   size_t iXDim, size_t iYDim,
                                                   GDALGroupH hRootGroup,
                                                   CSLConstList papszOptions);
CPLErr  GDALMDArrayGetStatistics(
    GDALMDArrayH hArray, GDALDatasetH, int bApproxOK, int bForce,
    double *pdfMin, double *pdfMax, double *pdfMean, double *pdfStdDev,
    GUInt64 *pnValidCount, GDALProgressFunc pfnProgress, void *pProgressData);
int  GDALMDArrayComputeStatistics(GDALMDArrayH hArray, GDALDatasetH,
                                         int bApproxOK, double *pdfMin,
                                         double *pdfMax, double *pdfMean,
                                         double *pdfStdDev,
                                         GUInt64 *pnValidCount,
                                         GDALProgressFunc, void *pProgressData);
int  GDALMDArrayComputeStatisticsEx(
    GDALMDArrayH hArray, GDALDatasetH, int bApproxOK, double *pdfMin,
    double *pdfMax, double *pdfMean, double *pdfStdDev, GUInt64 *pnValidCount,
    GDALProgressFunc, void *pProgressData, CSLConstList papszOptions);
GDALMDArrayH  GDALMDArrayGetResampled(GDALMDArrayH hArray,
                                             size_t nNewDimCount,
                                             const GDALDimensionH *pahNewDims,
                                             GDALRIOResampleAlg resampleAlg,
                                             OGRSpatialReferenceH hTargetSRS,
                                             CSLConstList papszOptions);
GDALMDArrayH  GDALMDArrayGetGridded(
    GDALMDArrayH hArray, const char *pszGridOptions, GDALMDArrayH hXArray,
    GDALMDArrayH hYArray, CSLConstList papszOptions) ;

GDALMDArrayH  *
GDALMDArrayGetCoordinateVariables(GDALMDArrayH hArray,
                                  size_t *pnCount) ;
void  GDALReleaseArrays(GDALMDArrayH *arrays, size_t nCount);
int  GDALMDArrayCache(GDALMDArrayH hArray, CSLConstList papszOptions);
bool  GDALMDArrayRename(GDALMDArrayH hArray, const char *pszNewName);

void  GDALAttributeRelease(GDALAttributeH hAttr);
void  GDALReleaseAttributes(GDALAttributeH *attributes, size_t nCount);
const char  *GDALAttributeGetName(GDALAttributeH hAttr);
const char  *GDALAttributeGetFullName(GDALAttributeH hAttr);
GUInt64  GDALAttributeGetTotalElementsCount(GDALAttributeH hAttr);
size_t  GDALAttributeGetDimensionCount(GDALAttributeH hAttr);
GUInt64  *
GDALAttributeGetDimensionsSize(GDALAttributeH hAttr,
                               size_t *pnCount) ;
GDALExtendedDataTypeH  GDALAttributeGetDataType(GDALAttributeH hAttr)
    ;
GByte  *GDALAttributeReadAsRaw(GDALAttributeH hAttr,
                                      size_t *pnSize) ;
void  GDALAttributeFreeRawResult(GDALAttributeH hAttr, GByte *raw,
                                        size_t nSize);
const char  *GDALAttributeReadAsString(GDALAttributeH hAttr);
int  GDALAttributeReadAsInt(GDALAttributeH hAttr);
double  GDALAttributeReadAsDouble(GDALAttributeH hAttr);
char  **
GDALAttributeReadAsStringArray(GDALAttributeH hAttr) ;
int  *GDALAttributeReadAsIntArray(GDALAttributeH hAttr, size_t *pnCount)
    ;
double  *
GDALAttributeReadAsDoubleArray(GDALAttributeH hAttr,
                               size_t *pnCount) ;
int  GDALAttributeWriteRaw(GDALAttributeH hAttr, const void *, size_t);
int  GDALAttributeWriteString(GDALAttributeH hAttr, const char *);
int  GDALAttributeWriteStringArray(GDALAttributeH hAttr, CSLConstList);
int  GDALAttributeWriteInt(GDALAttributeH hAttr, int);
int  GDALAttributeWriteDouble(GDALAttributeH hAttr, double);
int  GDALAttributeWriteDoubleArray(GDALAttributeH hAttr, const double *,
                                          size_t);
bool  GDALAttributeRename(GDALAttributeH hAttr, const char *pszNewName);

void  GDALDimensionRelease(GDALDimensionH hDim);
void  GDALReleaseDimensions(GDALDimensionH *dims, size_t nCount);
const char  *GDALDimensionGetName(GDALDimensionH hDim);
const char  *GDALDimensionGetFullName(GDALDimensionH hDim);
const char  *GDALDimensionGetType(GDALDimensionH hDim);
const char  *GDALDimensionGetDirection(GDALDimensionH hDim);
GUInt64  GDALDimensionGetSize(GDALDimensionH hDim);
GDALMDArrayH  GDALDimensionGetIndexingVariable(GDALDimensionH hDim)
    ;
int  GDALDimensionSetIndexingVariable(GDALDimensionH hDim,
                                             GDALMDArrayH hArray);
bool  GDALDimensionRename(GDALDimensionH hDim, const char *pszNewName);



#endif /* ndef GDAL_H_INCLUDED */
