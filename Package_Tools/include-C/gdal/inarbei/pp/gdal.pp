
unit gdal;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdal.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdal.h
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
PCPLVirtualMem  = ^CPLVirtualMem;
PCPLXMLNode  = ^CPLXMLNode;
Pdouble  = ^double;
PFILE  = ^FILE;
PGByte  = ^GByte;
PGDAL_GCP  = ^GDAL_GCP;
PGDALAccess  = ^GDALAccess;
PGDALAsyncReaderH  = ^GDALAsyncReaderH;
PGDALAsyncStatusType  = ^GDALAsyncStatusType;
PGDALAttributeH  = ^GDALAttributeH;
PGDALAttributeHS  = ^GDALAttributeHS;
PGDALColorEntry  = ^GDALColorEntry;
PGDALColorInterp  = ^GDALColorInterp;
PGDALColorTableH  = ^GDALColorTableH;
PGDALDatasetH  = ^GDALDatasetH;
PGDALDataType  = ^GDALDataType;
PGDALDimensionH  = ^GDALDimensionH;
PGDALDimensionHS  = ^GDALDimensionHS;
PGDALDriverH  = ^GDALDriverH;
PGDALEDTComponentH  = ^GDALEDTComponentH;
PGDALEDTComponentHS  = ^GDALEDTComponentHS;
PGDALExtendedDataTypeClass  = ^GDALExtendedDataTypeClass;
PGDALExtendedDataTypeH  = ^GDALExtendedDataTypeH;
PGDALExtendedDataTypeHS  = ^GDALExtendedDataTypeHS;
PGDALExtendedDataTypeSubType  = ^GDALExtendedDataTypeSubType;
PGDALGroupH  = ^GDALGroupH;
PGDALGroupHS  = ^GDALGroupHS;
PGDALMajorObjectH  = ^GDALMajorObjectH;
PGDALMDArrayH  = ^GDALMDArrayH;
PGDALMDArrayHS  = ^GDALMDArrayHS;
PGDALPaletteInterp  = ^GDALPaletteInterp;
PGDALRasterAttributeTableH  = ^GDALRasterAttributeTableH;
PGDALRasterBandH  = ^GDALRasterBandH;
PGDALRasterIOExtraArg  = ^GDALRasterIOExtraArg;
PGDALRATFieldType  = ^GDALRATFieldType;
PGDALRATFieldUsage  = ^GDALRATFieldUsage;
PGDALRATTableType  = ^GDALRATTableType;
PGDALRelationshipCardinality  = ^GDALRelationshipCardinality;
PGDALRelationshipH  = ^GDALRelationshipH;
PGDALRelationshipType  = ^GDALRelationshipType;
PGDALRIOResampleAlg  = ^GDALRIOResampleAlg;
PGDALRPCInfoV1  = ^GDALRPCInfoV1;
PGDALRPCInfoV2  = ^GDALRPCInfoV2;
PGDALRWFlag  = ^GDALRWFlag;
PGDALSubdatasetInfo  = ^GDALSubdatasetInfo;
PGDALSubdatasetInfoH  = ^GDALSubdatasetInfoH;
PGDALTileOrganization  = ^GDALTileOrganization;
PGInt64  = ^GInt64;
PGIntBig  = ^GIntBig;
PGPtrDiff_t  = ^GPtrDiff_t;
PGSpacing  = ^GSpacing;
PGUInt64  = ^GUInt64;
PGUIntBig  = ^GUIntBig;
Plongint  = ^longint;
POGRLayerH  = ^OGRLayerH;
Psingle  = ^single;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*****************************************************************************
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
 *************************************************************************** }
{$ifndef GDAL_H_INCLUDED}
{$define GDAL_H_INCLUDED}
{*
 * \file gdal.h
 *
 * Public (C callable) GDAL entry points.
  }
{$ifndef DOXYGEN_SKIP}
{$if defined(GDAL_COMPILATION)}
{$define DO_NOT_DEFINE_GDAL_DATE_NAME}
{$endif}
{$include "gdal_version.h"}
{$include "cpl_port.h"}
{$include "cpl_error.h"}
{$include "cpl_progress.h"}
{$include "cpl_virtualmem.h"}
{$include "cpl_minixml.h"}
{$include "ogr_api.h"}
{$endif}
{$include <stdbool.h>}
{$include <stdint.h>}
{ --------------------------------------------------------------------  }
{      Significant constants.                                           }
{ --------------------------------------------------------------------  }
{! Pixel data types  }
{! Unknown or unspecified type  }{! Eight bit unsigned integer  }{! 8-bit signed integer (GDAL >= 3.7)  }{! Sixteen bit unsigned integer  }{! Sixteen bit signed integer  }{! Thirty two bit unsigned integer  }{! Thirty two bit signed integer  }{! 64 bit unsigned integer (GDAL >= 3.5) }{! 64 bit signed integer  (GDAL >= 3.5) }{! Thirty two bit floating point  }{! Sixty four bit floating point  }{! Complex Int16  }{! Complex Int32  }{ TODO?(#6879): GDT_CInt64  }
{! Complex Float32  }{! Complex Float64  }{ maximum type # + 1  }
type
  PGDALDataType = ^TGDALDataType;
  TGDALDataType =  Longint;
  Const
    GDT_Unknown = 0;
    GDT_Byte = 1;
    GDT_Int8 = 14;
    GDT_UInt16 = 2;
    GDT_Int16 = 3;
    GDT_UInt32 = 4;
    GDT_Int32 = 5;
    GDT_UInt64 = 12;
    GDT_Int64 = 13;
    GDT_Float32 = 6;
    GDT_Float64 = 7;
    GDT_CInt16 = 8;
    GDT_CInt32 = 9;
    GDT_CFloat32 = 10;
    GDT_CFloat64 = 11;
    GDT_TypeCount = 15;
;

function GDALGetDataTypeSize(para1:TGDALDataType):longint;cdecl;external;
{ Deprecated. }
function GDALGetDataTypeSizeBits(eDataType:TGDALDataType):longint;cdecl;external;
function GDALGetDataTypeSizeBytes(para1:TGDALDataType):longint;cdecl;external;
function GDALDataTypeIsComplex(para1:TGDALDataType):longint;cdecl;external;
function GDALDataTypeIsInteger(para1:TGDALDataType):longint;cdecl;external;
function GDALDataTypeIsFloating(para1:TGDALDataType):longint;cdecl;external;
function GDALDataTypeIsSigned(para1:TGDALDataType):longint;cdecl;external;
(* Const before type ignored *)
function GDALGetDataTypeName(para1:TGDALDataType):Pchar;cdecl;external;
(* Const before type ignored *)
function GDALGetDataTypeByName(para1:Pchar):TGDALDataType;cdecl;external;
function GDALDataTypeUnion(para1:TGDALDataType; para2:TGDALDataType):TGDALDataType;cdecl;external;
function GDALDataTypeUnionWithValue(eDT:TGDALDataType; dValue:Tdouble; bComplex:longint):TGDALDataType;cdecl;external;
function GDALFindDataType(nBits:longint; bSigned:longint; bFloating:longint; bComplex:longint):TGDALDataType;cdecl;external;
function GDALFindDataTypeForValue(dValue:Tdouble; bComplex:longint):TGDALDataType;cdecl;external;
function GDALAdjustValueToDataType(eDT:TGDALDataType; dfValue:Tdouble; pbClamped:Plongint; pbRounded:Plongint):Tdouble;cdecl;external;
function GDALGetNonComplexDataType(para1:TGDALDataType):TGDALDataType;cdecl;external;
function GDALDataTypeIsConversionLossy(eTypeFrom:TGDALDataType; eTypeTo:TGDALDataType):longint;cdecl;external;
{*
 * status of the asynchronous stream
  }
type
  PGDALAsyncStatusType = ^TGDALAsyncStatusType;
  TGDALAsyncStatusType =  Longint;
  Const
    GARIO_PENDING = 0;
    GARIO_UPDATE = 1;
    GARIO_ERROR = 2;
    GARIO_COMPLETE = 3;
    GARIO_TypeCount = 4;
;
(* Const before type ignored *)

function GDALGetAsyncStatusTypeName(para1:TGDALAsyncStatusType):Pchar;cdecl;external;
(* Const before type ignored *)
function GDALGetAsyncStatusTypeByName(para1:Pchar):TGDALAsyncStatusType;cdecl;external;
{! Flag indicating read/write, or read-only access to data.  }
{! Read only (no update) access  }{! Read/write access.  }type
  PGDALAccess = ^TGDALAccess;
  TGDALAccess =  Longint;
  Const
    GA_ReadOnly = 0;
    GA_Update = 1;
;
{! Read/Write flag for RasterIO() method  }
{! Read data  }{! Write data  }type
  PGDALRWFlag = ^TGDALRWFlag;
  TGDALRWFlag =  Longint;
  Const
    GF_Read = 0;
    GF_Write = 1;
;
{ NOTE: values are selected to be consistent with GDALResampleAlg of
 * alg/gdalwarper.h  }
{* RasterIO() resampling method.
 * @since GDAL 2.0
  }
{! Nearest neighbour  }{! Bilinear (2x2 kernel)  }{! Cubic Convolution Approximation (4x4 kernel)  }{! Cubic B-Spline Approximation (4x4 kernel)  }{! Lanczos windowed sinc interpolation (6x6 kernel)  }{! Average  }{! Mode (selects the value which appears most often of all the sampled
       points)  }
{! Gauss blurring  }{ NOTE: values 8 to 13 are reserved for max,min,med,Q1,Q3,sum  }
{! @cond Doxygen_Suppress  }
{! @endcond  }
{* RMS: Root Mean Square / Quadratic Mean.
     * For complex numbers, applies on the real and imaginary part
     * independently.
      }
{! @cond Doxygen_Suppress  }
{! @endcond  }
type
  PGDALRIOResampleAlg = ^TGDALRIOResampleAlg;
  TGDALRIOResampleAlg =  Longint;
  Const
    GRIORA_NearestNeighbour = 0;
    GRIORA_Bilinear = 1;
    GRIORA_Cubic = 2;
    GRIORA_CubicSpline = 3;
    GRIORA_Lanczos = 4;
    GRIORA_Average = 5;
    GRIORA_Mode = 6;
    GRIORA_Gauss = 7;
    GRIORA_RESERVED_START = 8;
    GRIORA_RESERVED_END = 13;
    GRIORA_RMS = 14;
    GRIORA_LAST = GRIORA_RMS;
;
{ NOTE to developers: only add members, and if so edit INIT_RASTERIO_EXTRA_ARG
  }
{* Structure to pass extra arguments to RasterIO() method,
 * must be initialized with INIT_RASTERIO_EXTRA_ARG
 * @since GDAL 2.0
  }
{! Version of structure (to allow future extensions of the structure)  }
{! Resampling algorithm  }
{! Progress callback  }
{! Progress callback user data  }
{! Indicate if dfXOff, dfYOff, dfXSize and dfYSize are set.
        Mostly reserved from the VRT driver to communicate a more precise
        source window. Must be such that dfXOff - nXOff < 1.0 and
        dfYOff - nYOff < 1.0 and nXSize - dfXSize < 1.0 and nYSize - dfYSize
       < 1.0  }
{! Pixel offset to the top left corner. Only valid if
     * bFloatingPointWindowValidity = TRUE  }
{! Line offset to the top left corner. Only valid if
     * bFloatingPointWindowValidity = TRUE  }
{! Width in pixels of the area of interest. Only valid if
     * bFloatingPointWindowValidity = TRUE  }
{! Height in pixels of the area of interest. Only valid if
     * bFloatingPointWindowValidity = TRUE  }
type
  PGDALRasterIOExtraArg = ^TGDALRasterIOExtraArg;
  TGDALRasterIOExtraArg = record
      nVersion : longint;
      eResampleAlg : TGDALRIOResampleAlg;
      pfnProgress : TGDALProgressFunc;
      pProgressData : pointer;
      bFloatingPointWindowValidity : longint;
      dfXOff : Tdouble;
      dfYOff : Tdouble;
      dfXSize : Tdouble;
      dfYSize : Tdouble;
    end;
{! Types of color interpretation for raster bands.  }
{! Undefined  }{! Greyscale  }{! Paletted (see associated color table)  }{! Red band of RGBA image  }{! Green band of RGBA image  }{! Blue band of RGBA image  }{! Alpha (0=transparent, 255=opaque)  }{! Hue band of HLS image  }{! Saturation band of HLS image  }{! Lightness band of HLS image  }{! Cyan band of CMYK image  }{! Magenta band of CMYK image  }{! Yellow band of CMYK image  }{! Black band of CMYK image  }{! Y Luminance  }{! Cb Chroma  }{! Cr Chroma  }{! Max current value (equals to GCI_YCbCr_CrBand currently)  }
  PGDALColorInterp = ^TGDALColorInterp;
  TGDALColorInterp =  Longint;
  Const
    GCI_Undefined = 0;
    GCI_GrayIndex = 1;
    GCI_PaletteIndex = 2;
    GCI_RedBand = 3;
    GCI_GreenBand = 4;
    GCI_BlueBand = 5;
    GCI_AlphaBand = 6;
    GCI_HueBand = 7;
    GCI_SaturationBand = 8;
    GCI_LightnessBand = 9;
    GCI_CyanBand = 10;
    GCI_MagentaBand = 11;
    GCI_YellowBand = 12;
    GCI_BlackBand = 13;
    GCI_YCbCr_YBand = 14;
    GCI_YCbCr_CbBand = 15;
    GCI_YCbCr_CrBand = 16;
    GCI_Max = 16;
;
(* Const before type ignored *)

function GDALGetColorInterpretationName(para1:TGDALColorInterp):Pchar;cdecl;external;
(* Const before type ignored *)
function GDALGetColorInterpretationByName(pszName:Pchar):TGDALColorInterp;cdecl;external;
{! Types of color interpretations for a GDALColorTable.  }
{! Grayscale (in GDALColorEntry.c1)  }{! Red, Green, Blue and Alpha in (in c1, c2, c3 and c4)  }{! Cyan, Magenta, Yellow and Black (in c1, c2, c3 and c4) }{! Hue, Lightness and Saturation (in c1, c2, and c3)  }type
  PGDALPaletteInterp = ^TGDALPaletteInterp;
  TGDALPaletteInterp =  Longint;
  Const
    GPI_Gray = 0;
    GPI_RGB = 1;
    GPI_CMYK = 2;
    GPI_HLS = 3;
;
(* Const before type ignored *)

function GDALGetPaletteInterpretationName(para1:TGDALPaletteInterp):Pchar;cdecl;external;
{ "well known" metadata items.  }
{* Metadata item for dataset that indicates the spatial interpretation of a
 *  pixel  }
const
  GDALMD_AREA_OR_POINT = 'AREA_OR_POINT';  
{* Value for GDALMD_AREA_OR_POINT that indicates that a pixel represents an
 * area  }
  GDALMD_AOP_AREA = 'Area';  
{* Value for GDALMD_AREA_OR_POINT that indicates that a pixel represents a
 * point  }
  GDALMD_AOP_POINT = 'Point';  
{ --------------------------------------------------------------------  }
{      GDAL Specific error codes.                                       }
{                                                                       }
{      error codes 100 to 299 reserved for GDAL.                        }
{ --------------------------------------------------------------------  }
{$ifndef DOXYGEN_SKIP}

{ was #define dname def_expr }
function CPLE_WrongFormat : longint; { return type might be wrong }

{$endif}
{ --------------------------------------------------------------------  }
{      Define handle types related to various internal classes.         }
{ --------------------------------------------------------------------  }
{* Opaque type used for the C bindings of the C++ GDALMajorObject class  }
type
  PGDALMajorObjectH = ^TGDALMajorObjectH;
  TGDALMajorObjectH = pointer;
{* Opaque type used for the C bindings of the C++ GDALDataset class  }

  PGDALDatasetH = ^TGDALDatasetH;
  TGDALDatasetH = pointer;
{* Opaque type used for the C bindings of the C++ GDALRasterBand class  }

  PGDALRasterBandH = ^TGDALRasterBandH;
  TGDALRasterBandH = pointer;
{* Opaque type used for the C bindings of the C++ GDALDriver class  }

  PGDALDriverH = ^TGDALDriverH;
  TGDALDriverH = pointer;
{* Opaque type used for the C bindings of the C++ GDALColorTable class  }

  PGDALColorTableH = ^TGDALColorTableH;
  TGDALColorTableH = pointer;
{* Opaque type used for the C bindings of the C++ GDALRasterAttributeTable
 * class  }

  PGDALRasterAttributeTableH = ^TGDALRasterAttributeTableH;
  TGDALRasterAttributeTableH = pointer;
{* Opaque type used for the C bindings of the C++ GDALAsyncReader class  }

  PGDALAsyncReaderH = ^TGDALAsyncReaderH;
  TGDALAsyncReaderH = pointer;
{* Opaque type used for the C bindings of the C++ GDALRelationship class
 *  @since GDAL 3.6
  }

  PGDALRelationshipH = ^TGDALRelationshipH;
  TGDALRelationshipH = pointer;
{* Type to express pixel, line or band spacing. Signed 64 bit integer.  }

  PGSpacing = ^TGSpacing;
  TGSpacing = TGIntBig;
{* Enumeration giving the class of a GDALExtendedDataType.
 * @since GDAL 3.1
  }
{* Numeric value. Based on GDALDataType enumeration  }
{* String value.  }
{* Compound data type.  }

  PGDALExtendedDataTypeClass = ^TGDALExtendedDataTypeClass;
  TGDALExtendedDataTypeClass =  Longint;
  Const
    GEDTC_NUMERIC = 0;
    GEDTC_STRING = 1;
    GEDTC_COMPOUND = 2;
;
{* Enumeration giving the subtype of a GDALExtendedDataType.
 * @since GDAL 3.4
  }
{* None.  }
{* JSon. Only applies to GEDTC_STRING  }
type
  PGDALExtendedDataTypeSubType = ^TGDALExtendedDataTypeSubType;
  TGDALExtendedDataTypeSubType =  Longint;
  Const
    GEDTST_NONE = 0;
    GEDTST_JSON = 1;
;
{* Opaque type for C++ GDALExtendedDataType  }
type
  PGDALExtendedDataTypeH = ^TGDALExtendedDataTypeH;
  TGDALExtendedDataTypeH = PGDALExtendedDataTypeHS;
{* Opaque type for C++ GDALEDTComponent  }

  PGDALEDTComponentH = ^TGDALEDTComponentH;
  TGDALEDTComponentH = PGDALEDTComponentHS;
{* Opaque type for C++ GDALGroup  }

  PGDALGroupH = ^TGDALGroupH;
  TGDALGroupH = PGDALGroupHS;
{* Opaque type for C++ GDALMDArray  }

  PGDALMDArrayH = ^TGDALMDArrayH;
  TGDALMDArrayH = PGDALMDArrayHS;
{* Opaque type for C++ GDALAttribute  }

  PGDALAttributeH = ^TGDALAttributeH;
  TGDALAttributeH = PGDALAttributeHS;
{* Opaque type for C++ GDALDimension  }

  PGDALDimensionH = ^TGDALDimensionH;
  TGDALDimensionH = PGDALDimensionHS;
{ ====================================================================  }
{      Registration/driver related.                                     }
{ ====================================================================  }
{* Long name of the driver  }

const
  GDAL_DMD_LONGNAME = 'DMD_LONGNAME';  
{* URL (relative to http://gdal.org/) to the help page of the driver  }
  GDAL_DMD_HELPTOPIC = 'DMD_HELPTOPIC';  
{* MIME type handled by the driver.  }
  GDAL_DMD_MIMETYPE = 'DMD_MIMETYPE';  
{* Extension handled by the driver.  }
  GDAL_DMD_EXTENSION = 'DMD_EXTENSION';  
{* Connection prefix to provide as the file name of the open function.
 * Typically set for non-file based drivers. Generally used with open options.
 * @since GDAL 2.0
  }
  GDAL_DMD_CONNECTION_PREFIX = 'DMD_CONNECTION_PREFIX';  
{* List of (space separated) extensions handled by the driver.
 * @since GDAL 2.0
  }
  GDAL_DMD_EXTENSIONS = 'DMD_EXTENSIONS';  
{* XML snippet with creation options.  }
  GDAL_DMD_CREATIONOPTIONLIST = 'DMD_CREATIONOPTIONLIST';  
{* XML snippet with multidimensional dataset creation options.
 * @since GDAL 3.1
  }
  GDAL_DMD_MULTIDIM_DATASET_CREATIONOPTIONLIST = 'DMD_MULTIDIM_DATASET_CREATIONOPTIONLIST';  
{* XML snippet with multidimensional group creation options.
 * @since GDAL 3.1
  }
  GDAL_DMD_MULTIDIM_GROUP_CREATIONOPTIONLIST = 'DMD_MULTIDIM_GROUP_CREATIONOPTIONLIST';  
{* XML snippet with multidimensional dimension creation options.
 * @since GDAL 3.1
  }
  GDAL_DMD_MULTIDIM_DIMENSION_CREATIONOPTIONLIST = 'DMD_MULTIDIM_DIMENSION_CREATIONOPTIONLIST';  
{* XML snippet with multidimensional array creation options.
 * @since GDAL 3.1
  }
  GDAL_DMD_MULTIDIM_ARRAY_CREATIONOPTIONLIST = 'DMD_MULTIDIM_ARRAY_CREATIONOPTIONLIST';  
{* XML snippet with multidimensional array open options.
 * @since GDAL 3.6
  }
  GDAL_DMD_MULTIDIM_ARRAY_OPENOPTIONLIST = 'DMD_MULTIDIM_ARRAY_OPENOPTIONLIST';  
{* XML snippet with multidimensional attribute creation options.
 * @since GDAL 3.1
  }
  GDAL_DMD_MULTIDIM_ATTRIBUTE_CREATIONOPTIONLIST = 'DMD_MULTIDIM_ATTRIBUTE_CREATIONOPTIONLIST';  
{* XML snippet with open options.
 * @since GDAL 2.0
  }
  GDAL_DMD_OPENOPTIONLIST = 'DMD_OPENOPTIONLIST';  
{* List of (space separated) raster data types supported by the
 * Create()/CreateCopy() API.  }
  GDAL_DMD_CREATIONDATATYPES = 'DMD_CREATIONDATATYPES';  
{* List of (space separated) vector field types supported by the CreateField()
 * API.
 * @since GDAL 2.0
 *  }
  GDAL_DMD_CREATIONFIELDDATATYPES = 'DMD_CREATIONFIELDDATATYPES';  
{* List of (space separated) vector field sub-types supported by the
 * CreateField() API.
 * @since GDAL 2.3
 *  }
  GDAL_DMD_CREATIONFIELDDATASUBTYPES = 'DMD_CREATIONFIELDDATASUBTYPES';  
{* List of (space separated) capability flags supported by the CreateField() API.
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
  }
  GDAL_DMD_CREATION_FIELD_DEFN_FLAGS = 'DMD_CREATION_FIELD_DEFN_FLAGS';  
{* Capability set by a driver that exposes Subdatasets.
 *
 * This capability reflects that a raster driver supports child layers, such as
 * NetCDF or multi-table raster Geopackages.
 *
 * See GDAL_DCAP_MULTIPLE_VECTOR_LAYERS for a similar capability flag
 * for vector drivers.
  }
  GDAL_DMD_SUBDATASETS = 'DMD_SUBDATASETS';  
{* Capability set by a vector driver that supports field width and precision.
 *
 * This capability reflects that a vector driver includes the decimal separator
 * in the field width of fields of type OFTReal.
 *
 * See GDAL_DMD_NUMERIC_FIELD_WIDTH_INCLUDES_SIGN for a related capability flag.
 * @since GDAL 3.7
  }
  GDAL_DMD_NUMERIC_FIELD_WIDTH_INCLUDES_DECIMAL_SEPARATOR = 'DMD_NUMERIC_FIELD_WIDTH_INCLUDES_DECIMAL_SEPARATOR';  
{* Capability set by a vector driver that supports field width and precision.
 *
 * This capability reflects that a vector driver includes the sign
 * in the field width of fields of type OFTReal.
 *
 * See GDAL_DMD_NUMERIC_FIELD_WIDTH_INCLUDES_DECIMAL_SEPARATOR for a related capability flag.
 * @since GDAL 3.7
  }
  GDAL_DMD_NUMERIC_FIELD_WIDTH_INCLUDES_SIGN = 'DMD_NUMERIC_FIELD_WIDTH_INCLUDES_SIGN';  
{* Capability set by a driver that implements the Open() API.  }
  GDAL_DCAP_OPEN = 'DCAP_OPEN';  
{* Capability set by a driver that implements the Create() API.
 *
 * If GDAL_DCAP_CREATE is set, but GDAL_DCAP_CREATECOPY not, a generic
 * CreateCopy() implementation is available and will use the Create() API of
 * the driver.
 * So to test if some CreateCopy() implementation is available, generic or
 * specialize, test for both GDAL_DCAP_CREATE and GDAL_DCAP_CREATECOPY.
  }
  GDAL_DCAP_CREATE = 'DCAP_CREATE';  
{* Capability set by a driver that implements the CreateMultidimensional() API.
 *
 * @since GDAL 3.1
  }
  GDAL_DCAP_CREATE_MULTIDIMENSIONAL = 'DCAP_CREATE_MULTIDIMENSIONAL';  
{* Capability set by a driver that implements the CreateCopy() API.
 *
 * If GDAL_DCAP_CREATECOPY is not defined, but GDAL_DCAP_CREATE is set, a
 * generic CreateCopy() implementation is available and will use the Create()
 * API of the driver. So to test if some CreateCopy() implementation is
 * available, generic or specialize, test for both GDAL_DCAP_CREATE and
 * GDAL_DCAP_CREATECOPY.
  }
  GDAL_DCAP_CREATECOPY = 'DCAP_CREATECOPY';  
{* Capability set by a driver that implements the VectorTranslateFrom() API.
 *
 * @since GDAL 3.8
  }
  GDAL_DCAP_VECTOR_TRANSLATE_FROM = 'DCAP_VECTOR_TRANSLATE_FROM';  
{* Capability set by a driver that implements the CreateCopy() API, but with
 * multidimensional raster as input and output.
 *
 * @since GDAL 3.1
  }
  GDAL_DCAP_CREATECOPY_MULTIDIMENSIONAL = 'DCAP_CREATECOPY_MULTIDIMENSIONAL';  
{* Capability set by a driver that supports multidimensional data.
 * @since GDAL 3.1
  }
  GDAL_DCAP_MULTIDIM_RASTER = 'DCAP_MULTIDIM_RASTER';  
{* Capability set by a driver that can copy over subdatasets.  }
  GDAL_DCAP_SUBCREATECOPY = 'DCAP_SUBCREATECOPY';  
{* Capability set by a driver that can read/create datasets through the VSI*L
 * API.  }
  GDAL_DCAP_VIRTUALIO = 'DCAP_VIRTUALIO';  
{* Capability set by a driver having raster capability.
 * @since GDAL 2.0
  }
  GDAL_DCAP_RASTER = 'DCAP_RASTER';  
{* Capability set by a driver having vector capability.
 * @since GDAL 2.0
  }
  GDAL_DCAP_VECTOR = 'DCAP_VECTOR';  
{* Capability set by a driver having geographical network model capability.
 * @since GDAL 2.1
  }
  GDAL_DCAP_GNM = 'DCAP_GNM';  
{* Capability set by a driver that can create layers.
 * @since GDAL 3.6
  }
  GDAL_DCAP_CREATE_LAYER = 'DCAP_CREATE_LAYER';  
{* Capability set by a driver that can delete layers.
 * @since GDAL 3.6
  }
  GDAL_DCAP_DELETE_LAYER = 'DCAP_DELETE_LAYER';  
{* Capability set by a driver that can create fields.
 * @since GDAL 3.6
  }
  GDAL_DCAP_CREATE_FIELD = 'DCAP_CREATE_FIELD';  
{* Capability set by a driver that can delete fields.
 * @since GDAL 3.6
  }
  GDAL_DCAP_DELETE_FIELD = 'DCAP_DELETE_FIELD';  
{* Capability set by a driver that can reorder fields.
 * @since GDAL 3.6
  }
  GDAL_DCAP_REORDER_FIELDS = 'DCAP_REORDER_FIELDS';  
{* List of (space separated) flags supported by the OGRLayer::AlterFieldDefn()
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
  }
  GDAL_DMD_ALTER_FIELD_DEFN_FLAGS = 'GDAL_DMD_ALTER_FIELD_DEFN_FLAGS';  
{* List of (space separated) field names which are considered illegal by the
 * driver and should not be used when creating/altering fields.
 *
 * @since GDAL 3.7
  }
  GDAL_DMD_ILLEGAL_FIELD_NAMES = 'GDAL_DMD_ILLEGAL_FIELD_NAMES';  
{* Capability set by a driver that can create fields with NOT NULL constraint.
 * @since GDAL 2.0
  }
  GDAL_DCAP_NOTNULL_FIELDS = 'DCAP_NOTNULL_FIELDS';  
{* Capability set by a driver that can create fields with UNIQUE constraint.
 * @since GDAL 3.2
  }
  GDAL_DCAP_UNIQUE_FIELDS = 'DCAP_UNIQUE_FIELDS';  
{* Capability set by a driver that can create fields with DEFAULT values.
 * @since GDAL 2.0
  }
  GDAL_DCAP_DEFAULT_FIELDS = 'DCAP_DEFAULT_FIELDS';  
{* Capability set by a driver that can create geometry fields with NOT NULL
 * constraint.
 * @since GDAL 2.0
  }
  GDAL_DCAP_NOTNULL_GEOMFIELDS = 'DCAP_NOTNULL_GEOMFIELDS';  
{* Capability set by a non-spatial driver having no support for geometries.
 * E.g. non-spatial vector drivers (e.g. spreadsheet format drivers) do not
 * support geometries, and accordingly will have this capability present.
 * @since GDAL 2.3
  }
  GDAL_DCAP_NONSPATIAL = 'DCAP_NONSPATIAL';  
{* Capability set by a driver that can support curved geometries.
 * @since GDAL 3.6
  }
  GDAL_DCAP_CURVE_GEOMETRIES = 'DCAP_CURVE_GEOMETRIES';  
{* Capability set by a driver that can support measured geometries.
 *
 * @since GDAL 3.6
  }
  GDAL_DCAP_MEASURED_GEOMETRIES = 'DCAP_MEASURED_GEOMETRIES';  
{* Capability set by a driver that can support the Z dimension for geometries.
 *
 * @since GDAL 3.6
  }
  GDAL_DCAP_Z_GEOMETRIES = 'DCAP_Z_GEOMETRIES';  
{* List of (space separated) flags which reflect the geometry handling behavior
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
  }
  GDAL_DMD_GEOMETRY_FLAGS = 'GDAL_DMD_GEOMETRY_FLAGS';  
{* Capability set by drivers which support either reading or writing feature
 * styles.
 *
 * Consider using the more granular GDAL_DCAP_FEATURE_STYLES_READ or
 * GDAL_DCAP_FEATURE_STYLES_WRITE capabilities instead.
 *
 * @since GDAL 2.3
  }
  GDAL_DCAP_FEATURE_STYLES = 'DCAP_FEATURE_STYLES';  
{* Capability set by drivers which support reading feature styles.
 * @since GDAL 3.7
  }
  GDAL_DCAP_FEATURE_STYLES_READ = 'DCAP_FEATURE_STYLES_READ';  
{* Capability set by drivers which support writing feature styles.
 * @since GDAL 3.7
  }
  GDAL_DCAP_FEATURE_STYLES_WRITE = 'DCAP_FEATURE_STYLES_WRITE';  
{* Capability set by drivers which support storing/retrieving coordinate epoch
 * for dynamic CRS
 * @since GDAL 3.4
  }
  GDAL_DCAP_COORDINATE_EPOCH = 'DCAP_COORDINATE_EPOCH';  
{* Capability set by drivers for formats which support multiple vector layers.
 *
 * Note: some GDAL drivers expose "virtual" layer support while the underlying
 * formats themselves do not. This capability is only set for drivers of formats
 * which have a native concept of multiple vector layers (such as GeoPackage).
 *
 * @since GDAL 3.4
  }
  GDAL_DCAP_MULTIPLE_VECTOR_LAYERS = 'DCAP_MULTIPLE_VECTOR_LAYERS';  
{* Capability set by drivers for formats which support reading field domains.
 *
 * @since GDAL 3.5
  }
  GDAL_DCAP_FIELD_DOMAINS = 'DCAP_FIELD_DOMAINS';  
{* Capability set by drivers for formats which support reading table
 * relationships.
 *
 * @since GDAL 3.6
  }
  GDAL_DCAP_RELATIONSHIPS = 'DCAP_RELATIONSHIPS';  
{* Capability set by drivers for formats which support creating table
 * relationships.
 * @since GDAL 3.6
  }
  GDAL_DCAP_CREATE_RELATIONSHIP = 'DCAP_CREATE_RELATIONSHIP';  
{* Capability set by drivers for formats which support deleting table
 * relationships.
 * @since GDAL 3.6
  }
  GDAL_DCAP_DELETE_RELATIONSHIP = 'DCAP_DELETE_RELATIONSHIP';  
{* Capability set by drivers for formats which support updating existing table
 * relationships.
 * @since GDAL 3.6
  }
  GDAL_DCAP_UPDATE_RELATIONSHIP = 'DCAP_UPDATE_RELATIONSHIP';  
{* Capability set by drivers whose FlushCache() implementation returns a
 * dataset that can be opened afterwards and seen in a consistent state, without
 * requiring the dataset on which FlushCache() has been called to be closed.
 * @since GDAL 3.8
  }
  GDAL_DCAP_FLUSHCACHE_CONSISTENT_STATE = 'DCAP_FLUSHCACHE_CONSISTENT_STATE';  
{* List of (space separated) flags indicating the features of relationships are
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
  }
  GDAL_DMD_RELATIONSHIP_FLAGS = 'GDAL_DMD_RELATIONSHIP_FLAGS';  
{* List of (space separated) standard related table types which are recognised
 * by the driver.
 *
 * See GDALRelationshipGetRelatedTableType/GDALRelationshipSetRelatedTableType
 *
 * @since GDAL 3.7
  }
  GDAL_DMD_RELATIONSHIP_RELATED_TABLE_TYPES = 'GDAL_DMD_RELATIONSHIP_RELATED_TABLE_TYPES';  
{* Capability set by drivers for formats which support renaming vector layers.
 *
 * @since GDAL 3.5
  }
  GDAL_DCAP_RENAME_LAYERS = 'DCAP_RENAME_LAYERS';  
{* List of (space separated) field domain types supported by the AddFieldDomain()
 * API.
 *
 * Supported values are Coded, Range and Glob, corresponding to the
 * OGRFieldDomainType::OFDT_CODED, OGRFieldDomainType::OFDT_RANGE, and
 * OGRFieldDomainType::OFDT_GLOB field domain types respectively.
 *
 * @since GDAL 3.5
  }
  GDAL_DMD_CREATION_FIELD_DOMAIN_TYPES = 'DMD_CREATION_FIELD_DOMAIN_TYPES';  
{* List of (space separated) flags supported by the
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
  }
  GDAL_DMD_ALTER_GEOM_FIELD_DEFN_FLAGS = 'DMD_ALTER_GEOM_FIELD_DEFN_FLAGS';  
{* List of (space separated) SQL dialects supported by the driver.
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
  }
  GDAL_DMD_SUPPORTED_SQL_DIALECTS = 'DMD_SUPPORTED_SQL_DIALECTS';  
{* Value for GDALDimension::GetType() specifying the X axis of a horizontal
 * CRS.
 * @since GDAL 3.1
  }
  GDAL_DIM_TYPE_HORIZONTAL_X = 'HORIZONTAL_X';  
{* Value for GDALDimension::GetType() specifying the Y axis of a horizontal
 * CRS.
 * @since GDAL 3.1
  }
  GDAL_DIM_TYPE_HORIZONTAL_Y = 'HORIZONTAL_Y';  
{* Value for GDALDimension::GetType() specifying a vertical axis.
 * @since GDAL 3.1
  }
  GDAL_DIM_TYPE_VERTICAL = 'VERTICAL';  
{* Value for GDALDimension::GetType() specifying a temporal axis.
 * @since GDAL 3.1
  }
  GDAL_DIM_TYPE_TEMPORAL = 'TEMPORAL';  
{* Value for GDALDimension::GetType() specifying a parametric axis.
 * @since GDAL 3.1
  }
  GDAL_DIM_TYPE_PARAMETRIC = 'PARAMETRIC';  
{*< Dataset capability for supporting AddRelationship() \
                         (at least partially)  }
  GDsCAddRelationship = 'AddRelationship';  
{*< Dataset capability for supporting                \
                            DeleteRelationship() }
  GDsCDeleteRelationship = 'DeleteRelationship';  
{*< Dataset capability for supporting                \
                            UpdateRelationship() }
  GDsCUpdateRelationship = 'UpdateRelationship';  

procedure GDALAllRegister;cdecl;external;
procedure GDALRegisterPlugins;cdecl;external;
(* Const before type ignored *)
function GDALRegisterPlugin(name:Pchar):TCPLErr;cdecl;external;
(* Const before type ignored *)
function GDALCreate(hDriver:TGDALDriverH; para2:Pchar; para3:longint; para4:longint; para5:longint; 
           para6:TGDALDataType; para7:TCSLConstList):TGDALDatasetH;cdecl;external;
(* Const before type ignored *)
function GDALCreateCopy(para1:TGDALDriverH; para2:Pchar; para3:TGDALDatasetH; para4:longint; para5:TCSLConstList; 
           para6:TGDALProgressFunc; para7:pointer):TGDALDatasetH;cdecl;external;
(* Const before type ignored *)
function GDALIdentifyDriver(pszFilename:Pchar; papszFileList:TCSLConstList):TGDALDriverH;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function GDALIdentifyDriverEx(pszFilename:Pchar; nIdentifyFlags:dword; papszAllowedDrivers:PPchar; papszFileList:PPchar):TGDALDriverH;cdecl;external;
(* Const before type ignored *)
function GDALOpen(pszFilename:Pchar; eAccess:TGDALAccess):TGDALDatasetH;cdecl;external;
(* Const before type ignored *)
function GDALOpenShared(para1:Pchar; para2:TGDALAccess):TGDALDatasetH;cdecl;external;
{ Note: we define GDAL_OF_READONLY and GDAL_OF_UPDATE to be on purpose  }
{ equals to GA_ReadOnly and GA_Update  }
{* Open in read-only mode.
 * Used by GDALOpenEx().
 * @since GDAL 2.0
  }
const
  GDAL_OF_READONLY = $00;  
{* Open in update mode.
 * Used by GDALOpenEx().
 * @since GDAL 2.0
  }
  GDAL_OF_UPDATE = $01;  
{* Allow raster and vector drivers to be used.
 * Used by GDALOpenEx().
 * @since GDAL 2.0
  }
  GDAL_OF_ALL = $00;  
{* Allow raster drivers to be used.
 * Used by GDALOpenEx().
 * @since GDAL 2.0
  }
  GDAL_OF_RASTER = $02;  
{* Allow vector drivers to be used.
 * Used by GDALOpenEx().
 * @since GDAL 2.0
  }
  GDAL_OF_VECTOR = $04;  
{* Allow gnm drivers to be used.
 * Used by GDALOpenEx().
 * @since GDAL 2.1
  }
  GDAL_OF_GNM = $08;  
{* Allow multidimensional raster drivers to be used.
 * Used by GDALOpenEx().
 * @since GDAL 3.1
  }
  GDAL_OF_MULTIDIM_RASTER = $10;  
{$ifndef DOXYGEN_SKIP}

const
  GDAL_OF_KIND_MASK = $1E;  
{$endif}
{* Open in shared mode.
 * Used by GDALOpenEx().
 * @since GDAL 2.0
  }

const
  GDAL_OF_SHARED = $20;  
{* Emit error message in case of failed open.
 * Used by GDALOpenEx().
 * @since GDAL 2.0
  }
  GDAL_OF_VERBOSE_ERROR = $40;  
{* Open as internal dataset. Such dataset isn't registered in the global list
 * of opened dataset. Cannot be used with GDAL_OF_SHARED.
 *
 * Used by GDALOpenEx().
 * @since GDAL 2.0
  }
  GDAL_OF_INTERNAL = $80;  
{* Let GDAL decide if a array-based or hashset-based storage strategy for
 * cached blocks must be used.
 *
 * GDAL_OF_DEFAULT_BLOCK_ACCESS, GDAL_OF_ARRAY_BLOCK_ACCESS and
 * GDAL_OF_HASHSET_BLOCK_ACCESS are mutually exclusive.
 *
 * Used by GDALOpenEx().
 * @since GDAL 2.1
  }
  GDAL_OF_DEFAULT_BLOCK_ACCESS = 0;  
{* Use a array-based storage strategy for cached blocks.
 *
 * GDAL_OF_DEFAULT_BLOCK_ACCESS, GDAL_OF_ARRAY_BLOCK_ACCESS and
 * GDAL_OF_HASHSET_BLOCK_ACCESS are mutually exclusive.
 *
 * Used by GDALOpenEx().
 * @since GDAL 2.1
  }
  GDAL_OF_ARRAY_BLOCK_ACCESS = $100;  
{* Use a hashset-based storage strategy for cached blocks.
 *
 * GDAL_OF_DEFAULT_BLOCK_ACCESS, GDAL_OF_ARRAY_BLOCK_ACCESS and
 * GDAL_OF_HASHSET_BLOCK_ACCESS are mutually exclusive.
 *
 * Used by GDALOpenEx().
 * @since GDAL 2.1
  }
  GDAL_OF_HASHSET_BLOCK_ACCESS = $200;  
{$ifndef DOXYGEN_SKIP}
{ Reserved for a potential future alternative to GDAL_OF_ARRAY_BLOCK_ACCESS
 * and GDAL_OF_HASHSET_BLOCK_ACCESS  }

const
  GDAL_OF_RESERVED_1 = $300;  
{* Mask to detect the block access method  }
  GDAL_OF_BLOCK_ACCESS_MASK = $300;  
{$endif}
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)

function GDALOpenEx(pszFilename:Pchar; nOpenFlags:dword; papszAllowedDrivers:PPchar; papszOpenOptions:PPchar; papszSiblingFiles:PPchar):TGDALDatasetH;cdecl;external;
function GDALDumpOpenDatasets(para1:PFILE):longint;cdecl;external;
(* Const before type ignored *)
function GDALGetDriverByName(para1:Pchar):TGDALDriverH;cdecl;external;
function GDALGetDriverCount:longint;cdecl;external;
function GDALGetDriver(para1:longint):TGDALDriverH;cdecl;external;
function GDALCreateDriver:TGDALDriverH;cdecl;external;
procedure GDALDestroyDriver(para1:TGDALDriverH);cdecl;external;
function GDALRegisterDriver(para1:TGDALDriverH):longint;cdecl;external;
procedure GDALDeregisterDriver(para1:TGDALDriverH);cdecl;external;
procedure GDALDestroyDriverManager;cdecl;external;
{$ifndef DOXYGEN_SKIP}

procedure GDALDestroy;cdecl;external;
{$endif}
(* Const before type ignored *)

function GDALDeleteDataset(para1:TGDALDriverH; para2:Pchar):TCPLErr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GDALRenameDataset(para1:TGDALDriverH; pszNewName:Pchar; pszOldName:Pchar):TCPLErr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GDALCopyDatasetFiles(para1:TGDALDriverH; pszNewName:Pchar; pszOldName:Pchar):TCPLErr;cdecl;external;
function GDALValidateCreationOptions(para1:TGDALDriverH; papszCreationOptions:TCSLConstList):longint;cdecl;external;
{ The following are deprecated  }
(* Const before type ignored *)
function GDALGetDriverShortName(para1:TGDALDriverH):Pchar;cdecl;external;
(* Const before type ignored *)
function GDALGetDriverLongName(para1:TGDALDriverH):Pchar;cdecl;external;
(* Const before type ignored *)
function GDALGetDriverHelpTopic(para1:TGDALDriverH):Pchar;cdecl;external;
(* Const before type ignored *)
function GDALGetDriverCreationOptionList(para1:TGDALDriverH):Pchar;cdecl;external;
{ ====================================================================  }
{      GDAL_GCP                                                         }
{ ====================================================================  }
{* Ground Control Point  }
{* Unique identifier, often numeric  }
{* Informational message or ""  }
{* Pixel (x) location of GCP on raster  }
{* Line (y) location of GCP on raster  }
{* X position of GCP in georeferenced space  }
{* Y position of GCP in georeferenced space  }
{* Elevation of GCP, or zero if not known  }
type
  PGDAL_GCP = ^TGDAL_GCP;
  TGDAL_GCP = record
      pszId : Pchar;
      pszInfo : Pchar;
      dfGCPPixel : Tdouble;
      dfGCPLine : Tdouble;
      dfGCPX : Tdouble;
      dfGCPY : Tdouble;
      dfGCPZ : Tdouble;
    end;

procedure GDALInitGCPs(para1:longint; para2:PGDAL_GCP);cdecl;external;
procedure GDALDeinitGCPs(para1:longint; para2:PGDAL_GCP);cdecl;external;
(* Const before type ignored *)
function GDALDuplicateGCPs(para1:longint; para2:PGDAL_GCP):PGDAL_GCP;cdecl;external;
(* Const before type ignored *)
function GDALGCPsToGeoTransform(nGCPCount:longint; pasGCPs:PGDAL_GCP; padfGeoTransform:Pdouble; bApproxOK:longint):longint;cdecl;external;
function GDALInvGeoTransform(padfGeoTransformIn:Pdouble; padfInvGeoTransformOut:Pdouble):longint;cdecl;external;
procedure GDALApplyGeoTransform(para1:Pdouble; para2:Tdouble; para3:Tdouble; para4:Pdouble; para5:Pdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure GDALComposeGeoTransforms(padfGeoTransform1:Pdouble; padfGeoTransform2:Pdouble; padfGeoTransformOut:Pdouble);cdecl;external;
{ ====================================================================  }
{      major objects (dataset, and, driver, drivermanager).             }
{ ====================================================================  }
function GDALGetMetadataDomainList(hObject:TGDALMajorObjectH):^Pchar;cdecl;external;
(* Const before type ignored *)
function GDALGetMetadata(para1:TGDALMajorObjectH; para2:Pchar):^Pchar;cdecl;external;
(* Const before type ignored *)
function GDALSetMetadata(para1:TGDALMajorObjectH; para2:TCSLConstList; para3:Pchar):TCPLErr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GDALGetMetadataItem(para1:TGDALMajorObjectH; para2:Pchar; para3:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GDALSetMetadataItem(para1:TGDALMajorObjectH; para2:Pchar; para3:Pchar; para4:Pchar):TCPLErr;cdecl;external;
(* Const before type ignored *)
function GDALGetDescription(para1:TGDALMajorObjectH):Pchar;cdecl;external;
(* Const before type ignored *)
procedure GDALSetDescription(para1:TGDALMajorObjectH; para2:Pchar);cdecl;external;
{ ====================================================================  }
{      GDALDataset class ... normally this represents one file.         }
{ ====================================================================  }
{* Name of driver metadata item for layer creation option list  }
const
  GDAL_DS_LAYER_CREATIONOPTIONLIST = 'DS_LAYER_CREATIONOPTIONLIST';  

function GDALGetDatasetDriver(para1:TGDALDatasetH):TGDALDriverH;cdecl;external;
function GDALGetFileList(para1:TGDALDatasetH):^Pchar;cdecl;external;
function GDALClose(para1:TGDALDatasetH):TCPLErr;cdecl;external;
function GDALGetRasterXSize(para1:TGDALDatasetH):longint;cdecl;external;
function GDALGetRasterYSize(para1:TGDALDatasetH):longint;cdecl;external;
function GDALGetRasterCount(para1:TGDALDatasetH):longint;cdecl;external;
function GDALGetRasterBand(para1:TGDALDatasetH; para2:longint):TGDALRasterBandH;cdecl;external;
function GDALAddBand(hDS:TGDALDatasetH; eType:TGDALDataType; papszOptions:TCSLConstList):TCPLErr;cdecl;external;
function GDALBeginAsyncReader(hDS:TGDALDatasetH; nXOff:longint; nYOff:longint; nXSize:longint; nYSize:longint; 
           pBuf:pointer; nBufXSize:longint; nBufYSize:longint; eBufType:TGDALDataType; nBandCount:longint; 
           panBandMap:Plongint; nPixelSpace:longint; nLineSpace:longint; nBandSpace:longint; papszOptions:TCSLConstList):TGDALAsyncReaderH;cdecl;external;
procedure GDALEndAsyncReader(hDS:TGDALDatasetH; hAsynchReaderH:TGDALAsyncReaderH);cdecl;external;
function GDALDatasetRasterIO(hDS:TGDALDatasetH; eRWFlag:TGDALRWFlag; nDSXOff:longint; nDSYOff:longint; nDSXSize:longint; 
           nDSYSize:longint; pBuffer:pointer; nBXSize:longint; nBYSize:longint; eBDataType:TGDALDataType; 
           nBandCount:longint; panBandCount:Plongint; nPixelSpace:longint; nLineSpace:longint; nBandSpace:longint):TCPLErr;cdecl;external;
function GDALDatasetRasterIOEx(hDS:TGDALDatasetH; eRWFlag:TGDALRWFlag; nDSXOff:longint; nDSYOff:longint; nDSXSize:longint; 
           nDSYSize:longint; pBuffer:pointer; nBXSize:longint; nBYSize:longint; eBDataType:TGDALDataType; 
           nBandCount:longint; panBandCount:Plongint; nPixelSpace:TGSpacing; nLineSpace:TGSpacing; nBandSpace:TGSpacing; 
           psExtraArg:PGDALRasterIOExtraArg):TCPLErr;cdecl;external;
function GDALDatasetAdviseRead(hDS:TGDALDatasetH; nDSXOff:longint; nDSYOff:longint; nDSXSize:longint; nDSYSize:longint; 
           nBXSize:longint; nBYSize:longint; eBDataType:TGDALDataType; nBandCount:longint; panBandCount:Plongint; 
           papszOptions:TCSLConstList):TCPLErr;cdecl;external;
(* Const before type ignored *)
function GDALDatasetGetCompressionFormats(hDS:TGDALDatasetH; nXOff:longint; nYOff:longint; nXSize:longint; nYSize:longint; 
           nBandCount:longint; panBandList:Plongint):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GDALDatasetReadCompressedData(hDS:TGDALDatasetH; pszFormat:Pchar; nXOff:longint; nYOff:longint; nXSize:longint; 
           nYSize:longint; nBandCount:longint; panBandList:Plongint; ppBuffer:Ppointer; pnBufferSize:Psize_t; 
           ppszDetailedFormat:PPchar):TCPLErr;cdecl;external;
(* Const before type ignored *)
function GDALGetProjectionRef(para1:TGDALDatasetH):Pchar;cdecl;external;
function GDALGetSpatialRef(para1:TGDALDatasetH):TOGRSpatialReferenceH;cdecl;external;
(* Const before type ignored *)
function GDALSetProjection(para1:TGDALDatasetH; para2:Pchar):TCPLErr;cdecl;external;
function GDALSetSpatialRef(para1:TGDALDatasetH; para2:TOGRSpatialReferenceH):TCPLErr;cdecl;external;
function GDALGetGeoTransform(para1:TGDALDatasetH; para2:Pdouble):TCPLErr;cdecl;external;
function GDALSetGeoTransform(para1:TGDALDatasetH; para2:Pdouble):TCPLErr;cdecl;external;
function GDALGetGCPCount(para1:TGDALDatasetH):longint;cdecl;external;
(* Const before type ignored *)
function GDALGetGCPProjection(para1:TGDALDatasetH):Pchar;cdecl;external;
function GDALGetGCPSpatialRef(para1:TGDALDatasetH):TOGRSpatialReferenceH;cdecl;external;
(* Const before type ignored *)
function GDALGetGCPs(para1:TGDALDatasetH):PGDAL_GCP;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GDALSetGCPs(para1:TGDALDatasetH; para2:longint; para3:PGDAL_GCP; para4:Pchar):TCPLErr;cdecl;external;
(* Const before type ignored *)
function GDALSetGCPs2(para1:TGDALDatasetH; para2:longint; para3:PGDAL_GCP; para4:TOGRSpatialReferenceH):TCPLErr;cdecl;external;
(* Const before type ignored *)
function GDALGetInternalHandle(para1:TGDALDatasetH; para2:Pchar):pointer;cdecl;external;
function GDALReferenceDataset(para1:TGDALDatasetH):longint;cdecl;external;
function GDALDereferenceDataset(para1:TGDALDatasetH):longint;cdecl;external;
function GDALReleaseDataset(para1:TGDALDatasetH):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GDALBuildOverviews(para1:TGDALDatasetH; para2:Pchar; para3:longint; para4:Plongint; para5:longint; 
           para6:Plongint; para7:TGDALProgressFunc; para8:pointer):TCPLErr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GDALBuildOverviewsEx(para1:TGDALDatasetH; para2:Pchar; para3:longint; para4:Plongint; para5:longint; 
           para6:Plongint; para7:TGDALProgressFunc; para8:pointer; papszOptions:TCSLConstList):TCPLErr;cdecl;external;
procedure GDALGetOpenDatasets(hDS:PPGDALDatasetH; pnCount:Plongint);cdecl;external;
function GDALGetAccess(hDS:TGDALDatasetH):longint;cdecl;external;
function GDALFlushCache(hDS:TGDALDatasetH):TCPLErr;cdecl;external;
function GDALCreateDatasetMaskBand(hDS:TGDALDatasetH; nFlags:longint):TCPLErr;cdecl;external;
function GDALDatasetCopyWholeRaster(hSrcDS:TGDALDatasetH; hDstDS:TGDALDatasetH; papszOptions:TCSLConstList; pfnProgress:TGDALProgressFunc; pProgressData:pointer):TCPLErr;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function GDALRasterBandCopyWholeRaster(hSrcBand:TGDALRasterBandH; hDstBand:TGDALRasterBandH; constpapszOptions:PPchar; pfnProgress:TGDALProgressFunc; pProgressData:pointer):TCPLErr;cdecl;external;
(* Const before type ignored *)
function GDALRegenerateOverviews(hSrcBand:TGDALRasterBandH; nOverviewCount:longint; pahOverviewBands:PGDALRasterBandH; pszResampling:Pchar; pfnProgress:TGDALProgressFunc; 
           pProgressData:pointer):TCPLErr;cdecl;external;
(* Const before type ignored *)
function GDALRegenerateOverviewsEx(hSrcBand:TGDALRasterBandH; nOverviewCount:longint; pahOverviewBands:PGDALRasterBandH; pszResampling:Pchar; pfnProgress:TGDALProgressFunc; 
           pProgressData:pointer; papszOptions:TCSLConstList):TCPLErr;cdecl;external;
function GDALDatasetGetLayerCount(para1:TGDALDatasetH):longint;cdecl;external;
function GDALDatasetGetLayer(para1:TGDALDatasetH; para2:longint):TOGRLayerH;cdecl;external;
(* Const before type ignored *)
function GDALDatasetGetLayerByName(para1:TGDALDatasetH; para2:Pchar):TOGRLayerH;cdecl;external;
function GDALDatasetIsLayerPrivate(para1:TGDALDatasetH; para2:longint):longint;cdecl;external;
function GDALDatasetDeleteLayer(para1:TGDALDatasetH; para2:longint):TOGRErr;cdecl;external;
(* Const before type ignored *)
function GDALDatasetCreateLayer(para1:TGDALDatasetH; para2:Pchar; para3:TOGRSpatialReferenceH; para4:TOGRwkbGeometryType; para5:TCSLConstList):TOGRLayerH;cdecl;external;
(* Const before type ignored *)
function GDALDatasetCopyLayer(para1:TGDALDatasetH; para2:TOGRLayerH; para3:Pchar; para4:TCSLConstList):TOGRLayerH;cdecl;external;
procedure GDALDatasetResetReading(para1:TGDALDatasetH);cdecl;external;
function GDALDatasetGetNextFeature(hDS:TGDALDatasetH; phBelongingLayer:POGRLayerH; pdfProgressPct:Pdouble; pfnProgress:TGDALProgressFunc; pProgressData:pointer):TOGRFeatureH;cdecl;external;
(* Const before type ignored *)
function GDALDatasetTestCapability(para1:TGDALDatasetH; para2:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GDALDatasetExecuteSQL(para1:TGDALDatasetH; para2:Pchar; para3:TOGRGeometryH; para4:Pchar):TOGRLayerH;cdecl;external;
function GDALDatasetAbortSQL(para1:TGDALDatasetH):TOGRErr;cdecl;external;
procedure GDALDatasetReleaseResultSet(para1:TGDALDatasetH; para2:TOGRLayerH);cdecl;external;
function GDALDatasetGetStyleTable(para1:TGDALDatasetH):TOGRStyleTableH;cdecl;external;
procedure GDALDatasetSetStyleTableDirectly(para1:TGDALDatasetH; para2:TOGRStyleTableH);cdecl;external;
procedure GDALDatasetSetStyleTable(para1:TGDALDatasetH; para2:TOGRStyleTableH);cdecl;external;
function GDALDatasetStartTransaction(hDS:TGDALDatasetH; bForce:longint):TOGRErr;cdecl;external;
function GDALDatasetCommitTransaction(hDS:TGDALDatasetH):TOGRErr;cdecl;external;
function GDALDatasetRollbackTransaction(hDS:TGDALDatasetH):TOGRErr;cdecl;external;
procedure GDALDatasetClearStatistics(hDS:TGDALDatasetH);cdecl;external;
function GDALDatasetGetFieldDomainNames(para1:TGDALDatasetH; para2:TCSLConstList):^Pchar;cdecl;external;
(* Const before type ignored *)
function GDALDatasetGetFieldDomain(hDS:TGDALDatasetH; pszName:Pchar):TOGRFieldDomainH;cdecl;external;
function GDALDatasetAddFieldDomain(hDS:TGDALDatasetH; hFieldDomain:TOGRFieldDomainH; ppszFailureReason:PPchar):Tbool;cdecl;external;
(* Const before type ignored *)
function GDALDatasetDeleteFieldDomain(hDS:TGDALDatasetH; pszName:Pchar; ppszFailureReason:PPchar):Tbool;cdecl;external;
function GDALDatasetUpdateFieldDomain(hDS:TGDALDatasetH; hFieldDomain:TOGRFieldDomainH; ppszFailureReason:PPchar):Tbool;cdecl;external;
function GDALDatasetGetRelationshipNames(para1:TGDALDatasetH; para2:TCSLConstList):^Pchar;cdecl;external;
(* Const before type ignored *)
function GDALDatasetGetRelationship(hDS:TGDALDatasetH; pszName:Pchar):TGDALRelationshipH;cdecl;external;
function GDALDatasetAddRelationship(hDS:TGDALDatasetH; hRelationship:TGDALRelationshipH; ppszFailureReason:PPchar):Tbool;cdecl;external;
(* Const before type ignored *)
function GDALDatasetDeleteRelationship(hDS:TGDALDatasetH; pszName:Pchar; ppszFailureReason:PPchar):Tbool;cdecl;external;
function GDALDatasetUpdateRelationship(hDS:TGDALDatasetH; hRelationship:TGDALRelationshipH; ppszFailureReason:PPchar):Tbool;cdecl;external;
{* Type of functions to pass to GDALDatasetSetQueryLoggerFunc
 * @since GDAL 3.7  }
(* Const before type ignored *)
(* Const before type ignored *)
type

  TGDALQueryLoggerFunc = procedure (pszSQL:Pchar; pszError:Pchar; lNumRecords:Tint64_t; lExecutionTimeMilliseconds:Tint64_t; pQueryLoggerArg:pointer);cdecl;
{*
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
  }

function GDALDatasetSetQueryLoggerFunc(hDS:TGDALDatasetH; pfnQueryLoggerFunc:TGDALQueryLoggerFunc; poQueryLoggerArg:pointer):Tbool;cdecl;external;
{ ====================================================================  }
{      Informational utilities about subdatasets in file names          }
{ ====================================================================  }
{*
 *  Opaque type used for the C bindings of the C++ GDALSubdatasetInfo class
 *  @since GDAL 3.8
 }
type
  PGDALSubdatasetInfoH = ^TGDALSubdatasetInfoH;
  TGDALSubdatasetInfoH = PGDALSubdatasetInfo;
{*
 * @brief Returns a new GDALSubdatasetInfo object with methods to extract
 *        and manipulate subdataset information.
 *        If the pszFileName argument is not recognized by any driver as
 *        a subdataset descriptor, NULL is returned.
 *        The returned object must be freed with GDALDestroySubdatasetInfo().
 * @param pszFileName           File name with subdataset information
 * @note                        This method does not check if the subdataset actually exists.
 * @return                      Opaque pointer to a GDALSubdatasetInfo object or NULL if no drivers accepted the file name.
 * @since                       GDAL 3.8
  }
(* Const before type ignored *)

function GDALGetSubdatasetInfo(pszFileName:Pchar):TGDALSubdatasetInfoH;cdecl;external;
{*
 * @brief Returns the file path component of a
 *        subdataset descriptor effectively stripping the information about the subdataset
 *        and returning the "parent" dataset descriptor.
 *        The returned string must be freed with CPLFree().
 * @param hInfo                 Pointer to GDALSubdatasetInfo object
 * @note                        This method does not check if the subdataset actually exists.
 * @return                      The original string with the subdataset information removed.
 * @since                       GDAL 3.8
  }
function GDALSubdatasetInfoGetPathComponent(hInfo:TGDALSubdatasetInfoH):Pchar;cdecl;external;
{*
 * @brief Returns the subdataset component of a subdataset descriptor descriptor.
 *        The returned string must be freed with CPLFree().
 * @param hInfo                 Pointer to GDALSubdatasetInfo object
 * @note                        This method does not check if the subdataset actually exists.
 * @return                      The subdataset name.
 * @since                       GDAL 3.8
  }
function GDALSubdatasetInfoGetSubdatasetComponent(hInfo:TGDALSubdatasetInfoH):Pchar;cdecl;external;
{*
 * @brief Replaces the path component of a subdataset descriptor.
 *        The returned string must be freed with CPLFree().
 * @param hInfo                 Pointer to GDALSubdatasetInfo object
 * @param pszNewPath            New path.
 * @note                        This method does not check if the subdataset actually exists.
 * @return                      The original subdataset descriptor with the old path component replaced by newPath.
 * @since                       GDAL 3.8
  }
(* Const before type ignored *)
function GDALSubdatasetInfoModifyPathComponent(hInfo:TGDALSubdatasetInfoH; pszNewPath:Pchar):Pchar;cdecl;external;
{*
 * @brief Destroys a GDALSubdatasetInfo object.
 * @param hInfo                 Pointer to GDALSubdatasetInfo object
 * @since                       GDAL 3.8
  }
procedure GDALDestroySubdatasetInfo(hInfo:TGDALSubdatasetInfoH);cdecl;external;
{ ====================================================================  }
{      GDALRasterBand ... one band/channel in a dataset.                }
{ ====================================================================  }
{ Note: the only user of SRCVAL() was frmts/vrt/pixelfunctions.cpp and we no  }
{ longer use it.  }
{*
 * SRCVAL - Macro which may be used by pixel functions to obtain
 *          a pixel from a source buffer.
  }
{* Type of functions to pass to GDALAddDerivedBandPixelFunc.
 * @since GDAL 2.2  }
type

  TGDALDerivedPixelFunc = function (papoSources:Ppointer; nSources:longint; pData:pointer; nBufXSize:longint; nBufYSize:longint; 
               eSrcType:TGDALDataType; eBufType:TGDALDataType; nPixelSpace:longint; nLineSpace:longint):TCPLErr;cdecl;
{* Type of functions to pass to GDALAddDerivedBandPixelFuncWithArgs.
 * @since GDAL 3.4  }

  TGDALDerivedPixelFuncWithArgs = function (papoSources:Ppointer; nSources:longint; pData:pointer; nBufXSize:longint; nBufYSize:longint; 
               eSrcType:TGDALDataType; eBufType:TGDALDataType; nPixelSpace:longint; nLineSpace:longint; papszFunctionArgs:TCSLConstList):TCPLErr;cdecl;

function GDALGetRasterDataType(para1:TGDALRasterBandH):TGDALDataType;cdecl;external;
procedure GDALGetBlockSize(para1:TGDALRasterBandH; pnXSize:Plongint; pnYSize:Plongint);cdecl;external;
function GDALGetActualBlockSize(para1:TGDALRasterBandH; nXBlockOff:longint; nYBlockOff:longint; pnXValid:Plongint; pnYValid:Plongint):TCPLErr;cdecl;external;
function GDALRasterAdviseRead(hRB:TGDALRasterBandH; nDSXOff:longint; nDSYOff:longint; nDSXSize:longint; nDSYSize:longint; 
           nBXSize:longint; nBYSize:longint; eBDataType:TGDALDataType; papszOptions:TCSLConstList):TCPLErr;cdecl;external;
function GDALRasterIO(hRBand:TGDALRasterBandH; eRWFlag:TGDALRWFlag; nDSXOff:longint; nDSYOff:longint; nDSXSize:longint; 
           nDSYSize:longint; pBuffer:pointer; nBXSize:longint; nBYSize:longint; eBDataType:TGDALDataType; 
           nPixelSpace:longint; nLineSpace:longint):TCPLErr;cdecl;external;
function GDALRasterIOEx(hRBand:TGDALRasterBandH; eRWFlag:TGDALRWFlag; nDSXOff:longint; nDSYOff:longint; nDSXSize:longint; 
           nDSYSize:longint; pBuffer:pointer; nBXSize:longint; nBYSize:longint; eBDataType:TGDALDataType; 
           nPixelSpace:TGSpacing; nLineSpace:TGSpacing; psExtraArg:PGDALRasterIOExtraArg):TCPLErr;cdecl;external;
function GDALReadBlock(para1:TGDALRasterBandH; para2:longint; para3:longint; para4:pointer):TCPLErr;cdecl;external;
function GDALWriteBlock(para1:TGDALRasterBandH; para2:longint; para3:longint; para4:pointer):TCPLErr;cdecl;external;
function GDALGetRasterBandXSize(para1:TGDALRasterBandH):longint;cdecl;external;
function GDALGetRasterBandYSize(para1:TGDALRasterBandH):longint;cdecl;external;
function GDALGetRasterAccess(para1:TGDALRasterBandH):TGDALAccess;cdecl;external;
function GDALGetBandNumber(para1:TGDALRasterBandH):longint;cdecl;external;
function GDALGetBandDataset(para1:TGDALRasterBandH):TGDALDatasetH;cdecl;external;
function GDALGetRasterColorInterpretation(para1:TGDALRasterBandH):TGDALColorInterp;cdecl;external;
function GDALSetRasterColorInterpretation(para1:TGDALRasterBandH; para2:TGDALColorInterp):TCPLErr;cdecl;external;
function GDALGetRasterColorTable(para1:TGDALRasterBandH):TGDALColorTableH;cdecl;external;
function GDALSetRasterColorTable(para1:TGDALRasterBandH; para2:TGDALColorTableH):TCPLErr;cdecl;external;
function GDALHasArbitraryOverviews(para1:TGDALRasterBandH):longint;cdecl;external;
function GDALGetOverviewCount(para1:TGDALRasterBandH):longint;cdecl;external;
function GDALGetOverview(para1:TGDALRasterBandH; para2:longint):TGDALRasterBandH;cdecl;external;
function GDALGetRasterNoDataValue(para1:TGDALRasterBandH; para2:Plongint):Tdouble;cdecl;external;
function GDALGetRasterNoDataValueAsInt64(para1:TGDALRasterBandH; para2:Plongint):Tint64_t;cdecl;external;
function GDALGetRasterNoDataValueAsUInt64(para1:TGDALRasterBandH; para2:Plongint):Tuint64_t;cdecl;external;
function GDALSetRasterNoDataValue(para1:TGDALRasterBandH; para2:Tdouble):TCPLErr;cdecl;external;
function GDALSetRasterNoDataValueAsInt64(para1:TGDALRasterBandH; para2:Tint64_t):TCPLErr;cdecl;external;
function GDALSetRasterNoDataValueAsUInt64(para1:TGDALRasterBandH; para2:Tuint64_t):TCPLErr;cdecl;external;
function GDALDeleteRasterNoDataValue(para1:TGDALRasterBandH):TCPLErr;cdecl;external;
function GDALGetRasterCategoryNames(para1:TGDALRasterBandH):^Pchar;cdecl;external;
function GDALSetRasterCategoryNames(para1:TGDALRasterBandH; para2:TCSLConstList):TCPLErr;cdecl;external;
function GDALGetRasterMinimum(para1:TGDALRasterBandH; pbSuccess:Plongint):Tdouble;cdecl;external;
function GDALGetRasterMaximum(para1:TGDALRasterBandH; pbSuccess:Plongint):Tdouble;cdecl;external;
function GDALGetRasterStatistics(para1:TGDALRasterBandH; bApproxOK:longint; bForce:longint; pdfMin:Pdouble; pdfMax:Pdouble; 
           pdfMean:Pdouble; pdfStdDev:Pdouble):TCPLErr;cdecl;external;
function GDALComputeRasterStatistics(para1:TGDALRasterBandH; bApproxOK:longint; pdfMin:Pdouble; pdfMax:Pdouble; pdfMean:Pdouble; 
           pdfStdDev:Pdouble; pfnProgress:TGDALProgressFunc; pProgressData:pointer):TCPLErr;cdecl;external;
function GDALSetRasterStatistics(hBand:TGDALRasterBandH; dfMin:Tdouble; dfMax:Tdouble; dfMean:Tdouble; dfStdDev:Tdouble):TCPLErr;cdecl;external;
function GDALRasterBandAsMDArray(para1:TGDALRasterBandH):TGDALMDArrayH;cdecl;external;
(* Const before type ignored *)
function GDALGetRasterUnitType(para1:TGDALRasterBandH):Pchar;cdecl;external;
(* Const before type ignored *)
function GDALSetRasterUnitType(hBand:TGDALRasterBandH; pszNewValue:Pchar):TCPLErr;cdecl;external;
function GDALGetRasterOffset(para1:TGDALRasterBandH; pbSuccess:Plongint):Tdouble;cdecl;external;
function GDALSetRasterOffset(hBand:TGDALRasterBandH; dfNewOffset:Tdouble):TCPLErr;cdecl;external;
function GDALGetRasterScale(para1:TGDALRasterBandH; pbSuccess:Plongint):Tdouble;cdecl;external;
function GDALSetRasterScale(hBand:TGDALRasterBandH; dfNewOffset:Tdouble):TCPLErr;cdecl;external;
function GDALComputeRasterMinMax(hBand:TGDALRasterBandH; bApproxOK:longint; adfMinMax:array[0..1] of Tdouble):TCPLErr;cdecl;external;
function GDALFlushRasterCache(hBand:TGDALRasterBandH):TCPLErr;cdecl;external;
{! @cond Doxygen_Suppress  }
{    CPL_WARN_DEPRECATED("Use GDALGetRasterHistogramEx() instead") }
{! @endcond  }
function GDALGetRasterHistogram(hBand:TGDALRasterBandH; dfMin:Tdouble; dfMax:Tdouble; nBuckets:longint; panHistogram:Plongint; 
           bIncludeOutOfRange:longint; bApproxOK:longint; pfnProgress:TGDALProgressFunc; pProgressData:pointer):TCPLErr;cdecl;external;
function GDALGetRasterHistogramEx(hBand:TGDALRasterBandH; dfMin:Tdouble; dfMax:Tdouble; nBuckets:longint; panHistogram:PGUIntBig; 
           bIncludeOutOfRange:longint; bApproxOK:longint; pfnProgress:TGDALProgressFunc; pProgressData:pointer):TCPLErr;cdecl;external;
{! @cond Doxygen_Suppress  }
{  CPL_WARN_DEPRECATED("Use GDALGetDefaultHistogramEx() instead") }
{! @endcond  }
function GDALGetDefaultHistogram(hBand:TGDALRasterBandH; pdfMin:Pdouble; pdfMax:Pdouble; pnBuckets:Plongint; ppanHistogram:PPlongint; 
           bForce:longint; pfnProgress:TGDALProgressFunc; pProgressData:pointer):TCPLErr;cdecl;external;
function GDALGetDefaultHistogramEx(hBand:TGDALRasterBandH; pdfMin:Pdouble; pdfMax:Pdouble; pnBuckets:Plongint; ppanHistogram:PPGUIntBig; 
           bForce:longint; pfnProgress:TGDALProgressFunc; pProgressData:pointer):TCPLErr;cdecl;external;
{! @cond Doxygen_Suppress  }
{CPL_WARN_DEPRECATED("Use GDALSetDefaultHistogramEx() instead") }
{! @endcond  }
function GDALSetDefaultHistogram(hBand:TGDALRasterBandH; dfMin:Tdouble; dfMax:Tdouble; nBuckets:longint; panHistogram:Plongint):TCPLErr;cdecl;external;
function GDALSetDefaultHistogramEx(hBand:TGDALRasterBandH; dfMin:Tdouble; dfMax:Tdouble; nBuckets:longint; panHistogram:PGUIntBig):TCPLErr;cdecl;external;
function GDALGetRandomRasterSample(para1:TGDALRasterBandH; para2:longint; para3:Psingle):longint;cdecl;external;
function GDALGetRasterSampleOverview(para1:TGDALRasterBandH; para2:longint):TGDALRasterBandH;cdecl;external;
function GDALGetRasterSampleOverviewEx(para1:TGDALRasterBandH; para2:TGUIntBig):TGDALRasterBandH;cdecl;external;
function GDALFillRaster(hBand:TGDALRasterBandH; dfRealValue:Tdouble; dfImaginaryValue:Tdouble):TCPLErr;cdecl;external;
function GDALComputeBandStats(hBand:TGDALRasterBandH; nSampleStep:longint; pdfMean:Pdouble; pdfStdDev:Pdouble; pfnProgress:TGDALProgressFunc; 
           pProgressData:pointer):TCPLErr;cdecl;external;
function GDALOverviewMagnitudeCorrection(hBaseBand:TGDALRasterBandH; nOverviewCount:longint; pahOverviews:PGDALRasterBandH; pfnProgress:TGDALProgressFunc; pProgressData:pointer):TCPLErr;cdecl;external;
function GDALGetDefaultRAT(hBand:TGDALRasterBandH):TGDALRasterAttributeTableH;cdecl;external;
function GDALSetDefaultRAT(para1:TGDALRasterBandH; para2:TGDALRasterAttributeTableH):TCPLErr;cdecl;external;
(* Const before type ignored *)
function GDALAddDerivedBandPixelFunc(pszName:Pchar; pfnPixelFunc:TGDALDerivedPixelFunc):TCPLErr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GDALAddDerivedBandPixelFuncWithArgs(pszName:Pchar; pfnPixelFunc:TGDALDerivedPixelFuncWithArgs; pszMetadata:Pchar):TCPLErr;cdecl;external;
function GDALGetMaskBand(hBand:TGDALRasterBandH):TGDALRasterBandH;cdecl;external;
function GDALGetMaskFlags(hBand:TGDALRasterBandH):longint;cdecl;external;
function GDALCreateMaskBand(hBand:TGDALRasterBandH; nFlags:longint):TCPLErr;cdecl;external;
function GDALIsMaskBand(hBand:TGDALRasterBandH):Tbool;cdecl;external;
{* Flag returned by GDALGetMaskFlags() to indicate that all pixels are valid  }
const
  GMF_ALL_VALID = $01;  
{* Flag returned by GDALGetMaskFlags() to indicate that the mask band is
 * valid for all bands  }
  GMF_PER_DATASET = $02;  
{* Flag returned by GDALGetMaskFlags() to indicate that the mask band is
 * an alpha band  }
  GMF_ALPHA = $04;  
{* Flag returned by GDALGetMaskFlags() to indicate that the mask band is
 * computed from nodata values  }
  GMF_NODATA = $08;  
{* Flag returned by GDALGetDataCoverageStatus() when the driver does not
 * implement GetDataCoverageStatus(). This flag should be returned together
 * with GDAL_DATA_COVERAGE_STATUS_DATA  }
  GDAL_DATA_COVERAGE_STATUS_UNIMPLEMENTED = $01;  
{* Flag returned by GDALGetDataCoverageStatus() when there is (potentially)
 * data in the queried window. Can be combined with the binary or operator
 * with GDAL_DATA_COVERAGE_STATUS_UNIMPLEMENTED or
 * GDAL_DATA_COVERAGE_STATUS_EMPTY  }
  GDAL_DATA_COVERAGE_STATUS_DATA = $02;  
{* Flag returned by GDALGetDataCoverageStatus() when there is nodata in the
 * queried window. This is typically identified by the concept of missing block
 * in formats that supports it.
 * Can be combined with the binary or operator with
 * GDAL_DATA_COVERAGE_STATUS_DATA  }
  GDAL_DATA_COVERAGE_STATUS_EMPTY = $04;  

function GDALGetDataCoverageStatus(hBand:TGDALRasterBandH; nXOff:longint; nYOff:longint; nXSize:longint; nYSize:longint; 
           nMaskFlagStop:longint; pdfDataPct:Pdouble):longint;cdecl;external;
{ ====================================================================  }
{     GDALAsyncReader                                                   }
{ ====================================================================  }
function GDALARGetNextUpdatedRegion(hARIO:TGDALAsyncReaderH; dfTimeout:Tdouble; pnXBufOff:Plongint; pnYBufOff:Plongint; pnXBufSize:Plongint; 
           pnYBufSize:Plongint):TGDALAsyncStatusType;cdecl;external;
function GDALARLockBuffer(hARIO:TGDALAsyncReaderH; dfTimeout:Tdouble):longint;cdecl;external;
procedure GDALARUnlockBuffer(hARIO:TGDALAsyncReaderH);cdecl;external;
{ --------------------------------------------------------------------  }
{      Helper functions.                                                }
{ --------------------------------------------------------------------  }
function GDALGeneralCmdLineProcessor(nArgc:longint; ppapszArgv:PPPchar; nOptions:longint):longint;cdecl;external;
procedure GDALSwapWords(pData:pointer; nWordSize:longint; nWordCount:longint; nWordSkip:longint);cdecl;external;
procedure GDALSwapWordsEx(pData:pointer; nWordSize:longint; nWordCount:Tsize_t; nWordSkip:longint);cdecl;external;
(* Const before type ignored *)
procedure GDALCopyWords(pSrcData:pointer; eSrcType:TGDALDataType; nSrcPixelOffset:longint; pDstData:pointer; eDstType:TGDALDataType; 
            nDstPixelOffset:longint; nWordCount:longint);cdecl;external;
(* Const before type ignored *)
procedure GDALCopyWords64(pSrcData:pointer; eSrcType:TGDALDataType; nSrcPixelOffset:longint; pDstData:pointer; eDstType:TGDALDataType; 
            nDstPixelOffset:longint; nWordCount:TGPtrDiff_t);cdecl;external;
(* Const before type ignored *)
procedure GDALCopyBits(pabySrcData:PGByte; nSrcOffset:longint; nSrcStep:longint; pabyDstData:PGByte; nDstOffset:longint; 
            nDstStep:longint; nBitCount:longint; nStepCount:longint);cdecl;external;
(* Const before type ignored *)
procedure GDALDeinterleave(pSourceBuffer:pointer; eSourceDT:TGDALDataType; nComponents:longint; ppDestBuffer:Ppointer; eDestDT:TGDALDataType; 
            nIters:Tsize_t);cdecl;external;
(* Const before type ignored *)
function GDALLoadWorldFile(para1:Pchar; para2:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GDALReadWorldFile(para1:Pchar; para2:Pchar; para3:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GDALWriteWorldFile(para1:Pchar; para2:Pchar; para3:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
function GDALLoadTabFile(para1:Pchar; para2:Pdouble; para3:PPchar; para4:Plongint; para5:PPGDAL_GCP):longint;cdecl;external;
(* Const before type ignored *)
function GDALReadTabFile(para1:Pchar; para2:Pdouble; para3:PPchar; para4:Plongint; para5:PPGDAL_GCP):longint;cdecl;external;
(* Const before type ignored *)
function GDALLoadOziMapFile(para1:Pchar; para2:Pdouble; para3:PPchar; para4:Plongint; para5:PPGDAL_GCP):longint;cdecl;external;
(* Const before type ignored *)
function GDALReadOziMapFile(para1:Pchar; para2:Pdouble; para3:PPchar; para4:Plongint; para5:PPGDAL_GCP):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GDALDecToDMS(para1:Tdouble; para2:Pchar; para3:longint):Pchar;cdecl;external;
function GDALPackedDMSToDec(para1:Tdouble):Tdouble;cdecl;external;
function GDALDecToPackedDMS(para1:Tdouble):Tdouble;cdecl;external;
{ Note to developers : please keep this section in sync with ogr_core.h  }
{$ifndef GDAL_VERSION_INFO_DEFINED}
{$ifndef DOXYGEN_SKIP}
{$define GDAL_VERSION_INFO_DEFINED}
{$endif}
(* Const before type ignored *)
(* Const before type ignored *)

function GDALVersionInfo(para1:Pchar):Pchar;cdecl;external;
{$endif}
{$ifndef GDAL_CHECK_VERSION}
(* Const before type ignored *)

function GDALCheckVersion(nVersionMajor:longint; nVersionMinor:longint; pszCallingComponentName:Pchar):longint;cdecl;external;
{* Helper macro for GDALCheckVersion()
  @see GDALCheckVersion()
   }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDAL_CHECK_VERSION(pszCallingComponentName : longint) : longint;

{$endif}
{! @cond Doxygen_Suppress  }
{$ifdef GDAL_COMPILATION}

const
  GDALExtractRPCInfoV1 = GDALExtractRPCInfo;  
{$else}

const
  GDALRPCInfo = GDALRPCInfoV2;  
  GDALExtractRPCInfo = GDALExtractRPCInfoV2;  
{$endif}
{ Deprecated: use GDALRPCInfoV2  }
{!< Line offset  }
{!< Sample/Pixel offset  }
{!< Latitude offset  }
{!< Longitude offset  }
{!< Height offset  }
{!< Line scale  }
{!< Sample/Pixel scale  }
{!< Latitude scale  }
{!< Longitude scale  }
{!< Height scale  }
{!< Line Numerator Coefficients  }
{!< Line Denominator Coefficients  }
{!< Sample/Pixel Numerator Coefficients  }
{!< Sample/Pixel Denominator Coefficients  }
{!< Minimum longitude  }
{!< Minimum latitude  }
{!< Maximum longitude  }
{!< Maximum latitude  }
type
  PGDALRPCInfoV1 = ^TGDALRPCInfoV1;
  TGDALRPCInfoV1 = record
      dfLINE_OFF : Tdouble;
      dfSAMP_OFF : Tdouble;
      dfLAT_OFF : Tdouble;
      dfLONG_OFF : Tdouble;
      dfHEIGHT_OFF : Tdouble;
      dfLINE_SCALE : Tdouble;
      dfSAMP_SCALE : Tdouble;
      dfLAT_SCALE : Tdouble;
      dfLONG_SCALE : Tdouble;
      dfHEIGHT_SCALE : Tdouble;
      adfLINE_NUM_COEFF : array[0..19] of Tdouble;
      adfLINE_DEN_COEFF : array[0..19] of Tdouble;
      adfSAMP_NUM_COEFF : array[0..19] of Tdouble;
      adfSAMP_DEN_COEFF : array[0..19] of Tdouble;
      dfMIN_LONG : Tdouble;
      dfMIN_LAT : Tdouble;
      dfMAX_LONG : Tdouble;
      dfMAX_LAT : Tdouble;
    end;
{! @endcond  }
{* Structure to store Rational Polynomial Coefficients / Rigorous Projection
 * Model. See http://geotiff.maptools.org/rpc_prop.html  }
{!< Line offset  }
{!< Sample/Pixel offset  }
{!< Latitude offset  }
{!< Longitude offset  }
{!< Height offset  }
{!< Line scale  }
{!< Sample/Pixel scale  }
{!< Latitude scale  }
{!< Longitude scale  }
{!< Height scale  }
{!< Line Numerator Coefficients  }
{!< Line Denominator Coefficients  }
{!< Sample/Pixel Numerator Coefficients  }
{!< Sample/Pixel Denominator Coefficients  }
{!< Minimum longitude  }
{!< Minimum latitude  }
{!< Maximum longitude  }
{!< Maximum latitude  }
{ Those fields should be at the end. And all above fields should be the
     * same as in GDALRPCInfoV1  }
{!< Bias error  }
{!< Random error  }

  PGDALRPCInfoV2 = ^TGDALRPCInfoV2;
  TGDALRPCInfoV2 = record
      dfLINE_OFF : Tdouble;
      dfSAMP_OFF : Tdouble;
      dfLAT_OFF : Tdouble;
      dfLONG_OFF : Tdouble;
      dfHEIGHT_OFF : Tdouble;
      dfLINE_SCALE : Tdouble;
      dfSAMP_SCALE : Tdouble;
      dfLAT_SCALE : Tdouble;
      dfLONG_SCALE : Tdouble;
      dfHEIGHT_SCALE : Tdouble;
      adfLINE_NUM_COEFF : array[0..19] of Tdouble;
      adfLINE_DEN_COEFF : array[0..19] of Tdouble;
      adfSAMP_NUM_COEFF : array[0..19] of Tdouble;
      adfSAMP_DEN_COEFF : array[0..19] of Tdouble;
      dfMIN_LONG : Tdouble;
      dfMIN_LAT : Tdouble;
      dfMAX_LONG : Tdouble;
      dfMAX_LAT : Tdouble;
      dfERR_BIAS : Tdouble;
      dfERR_RAND : Tdouble;
    end;
{! @cond Doxygen_Suppress  }

function GDALExtractRPCInfoV1(para1:TCSLConstList; para2:PGDALRPCInfoV1):longint;cdecl;external;
{! @endcond  }
function GDALExtractRPCInfoV2(para1:TCSLConstList; para2:PGDALRPCInfoV2):longint;cdecl;external;
{ ====================================================================  }
{      Color tables.                                                    }
{ ====================================================================  }
{* Color tuple  }
{! gray, red, cyan or hue  }
{! green, magenta, or lightness  }
{! blue, yellow, or saturation  }
{! alpha or blackband  }
type
  PGDALColorEntry = ^TGDALColorEntry;
  TGDALColorEntry = record
      c1 : smallint;
      c2 : smallint;
      c3 : smallint;
      c4 : smallint;
    end;

function GDALCreateColorTable(para1:TGDALPaletteInterp):TGDALColorTableH;cdecl;external;
procedure GDALDestroyColorTable(para1:TGDALColorTableH);cdecl;external;
function GDALCloneColorTable(para1:TGDALColorTableH):TGDALColorTableH;cdecl;external;
function GDALGetPaletteInterpretation(para1:TGDALColorTableH):TGDALPaletteInterp;cdecl;external;
function GDALGetColorEntryCount(para1:TGDALColorTableH):longint;cdecl;external;
(* Const before type ignored *)
function GDALGetColorEntry(para1:TGDALColorTableH; para2:longint):PGDALColorEntry;cdecl;external;
function GDALGetColorEntryAsRGB(para1:TGDALColorTableH; para2:longint; para3:PGDALColorEntry):longint;cdecl;external;
(* Const before type ignored *)
procedure GDALSetColorEntry(para1:TGDALColorTableH; para2:longint; para3:PGDALColorEntry);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure GDALCreateColorRamp(hTable:TGDALColorTableH; nStartIndex:longint; psStartColor:PGDALColorEntry; nEndIndex:longint; psEndColor:PGDALColorEntry);cdecl;external;
{ ====================================================================  }
{      Raster Attribute Table                                           }
{ ====================================================================  }
{* Field type of raster attribute table  }
{! Integer field  }{! Floating point (double) field  }{! String field  }type
  PGDALRATFieldType = ^TGDALRATFieldType;
  TGDALRATFieldType =  Longint;
  Const
    GFT_Integer = 0;
    GFT_Real = 1;
    GFT_String = 2;
;
{* Field usage of raster attribute table  }
{! General purpose field.  }{! Histogram pixel count  }{! Class name  }{! Class range minimum  }{! Class range maximum  }{! Class value (min=max)  }{! Red class color (0-255)  }{! Green class color (0-255)  }{! Blue class color (0-255)  }{! Alpha (0=transparent,255=opaque) }{! Color Range Red Minimum  }{! Color Range Green Minimum  }{! Color Range Blue Minimum  }{! Color Range Alpha Minimum  }{! Color Range Red Maximum  }{! Color Range Green Maximum  }{! Color Range Blue Maximum  }{! Color Range Alpha Maximum  }{! Maximum GFU value (equals to GFU_AlphaMax+1 currently)  }type
  PGDALRATFieldUsage = ^TGDALRATFieldUsage;
  TGDALRATFieldUsage =  Longint;
  Const
    GFU_Generic = 0;
    GFU_PixelCount = 1;
    GFU_Name = 2;
    GFU_Min = 3;
    GFU_Max = 4;
    GFU_MinMax = 5;
    GFU_Red = 6;
    GFU_Green = 7;
    GFU_Blue = 8;
    GFU_Alpha = 9;
    GFU_RedMin = 10;
    GFU_GreenMin = 11;
    GFU_BlueMin = 12;
    GFU_AlphaMin = 13;
    GFU_RedMax = 14;
    GFU_GreenMax = 15;
    GFU_BlueMax = 16;
    GFU_AlphaMax = 17;
    GFU_MaxCount = 18;
;
{* RAT table type (thematic or athematic)
 * @since GDAL 2.4
  }
{! Thematic table type  }{! Athematic table type  }type
  PGDALRATTableType = ^TGDALRATTableType;
  TGDALRATTableType =  Longint;
  Const
    GRTT_THEMATIC = 0;
    GRTT_ATHEMATIC = 1;
;

function GDALCreateRasterAttributeTable:TGDALRasterAttributeTableH;cdecl;external;
procedure GDALDestroyRasterAttributeTable(para1:TGDALRasterAttributeTableH);cdecl;external;
function GDALRATGetColumnCount(para1:TGDALRasterAttributeTableH):longint;cdecl;external;
(* Const before type ignored *)
function GDALRATGetNameOfCol(para1:TGDALRasterAttributeTableH; para2:longint):Pchar;cdecl;external;
function GDALRATGetUsageOfCol(para1:TGDALRasterAttributeTableH; para2:longint):TGDALRATFieldUsage;cdecl;external;
function GDALRATGetTypeOfCol(para1:TGDALRasterAttributeTableH; para2:longint):TGDALRATFieldType;cdecl;external;
function GDALRATGetColOfUsage(para1:TGDALRasterAttributeTableH; para2:TGDALRATFieldUsage):longint;cdecl;external;
function GDALRATGetRowCount(para1:TGDALRasterAttributeTableH):longint;cdecl;external;
(* Const before type ignored *)
function GDALRATGetValueAsString(para1:TGDALRasterAttributeTableH; para2:longint; para3:longint):Pchar;cdecl;external;
function GDALRATGetValueAsInt(para1:TGDALRasterAttributeTableH; para2:longint; para3:longint):longint;cdecl;external;
function GDALRATGetValueAsDouble(para1:TGDALRasterAttributeTableH; para2:longint; para3:longint):Tdouble;cdecl;external;
(* Const before type ignored *)
procedure GDALRATSetValueAsString(para1:TGDALRasterAttributeTableH; para2:longint; para3:longint; para4:Pchar);cdecl;external;
procedure GDALRATSetValueAsInt(para1:TGDALRasterAttributeTableH; para2:longint; para3:longint; para4:longint);cdecl;external;
procedure GDALRATSetValueAsDouble(para1:TGDALRasterAttributeTableH; para2:longint; para3:longint; para4:Tdouble);cdecl;external;
function GDALRATChangesAreWrittenToFile(hRAT:TGDALRasterAttributeTableH):longint;cdecl;external;
function GDALRATValuesIOAsDouble(hRAT:TGDALRasterAttributeTableH; eRWFlag:TGDALRWFlag; iField:longint; iStartRow:longint; iLength:longint; 
           pdfData:Pdouble):TCPLErr;cdecl;external;
function GDALRATValuesIOAsInteger(hRAT:TGDALRasterAttributeTableH; eRWFlag:TGDALRWFlag; iField:longint; iStartRow:longint; iLength:longint; 
           pnData:Plongint):TCPLErr;cdecl;external;
function GDALRATValuesIOAsString(hRAT:TGDALRasterAttributeTableH; eRWFlag:TGDALRWFlag; iField:longint; iStartRow:longint; iLength:longint; 
           papszStrList:TCSLConstList):TCPLErr;cdecl;external;
procedure GDALRATSetRowCount(para1:TGDALRasterAttributeTableH; para2:longint);cdecl;external;
(* Const before type ignored *)
function GDALRATCreateColumn(para1:TGDALRasterAttributeTableH; para2:Pchar; para3:TGDALRATFieldType; para4:TGDALRATFieldUsage):TCPLErr;cdecl;external;
function GDALRATSetLinearBinning(para1:TGDALRasterAttributeTableH; para2:Tdouble; para3:Tdouble):TCPLErr;cdecl;external;
function GDALRATGetLinearBinning(para1:TGDALRasterAttributeTableH; para2:Pdouble; para3:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
function GDALRATSetTableType(hRAT:TGDALRasterAttributeTableH; eInTableType:TGDALRATTableType):TCPLErr;cdecl;external;
function GDALRATGetTableType(hRAT:TGDALRasterAttributeTableH):TGDALRATTableType;cdecl;external;
function GDALRATInitializeFromColorTable(para1:TGDALRasterAttributeTableH; para2:TGDALColorTableH):TCPLErr;cdecl;external;
function GDALRATTranslateToColorTable(para1:TGDALRasterAttributeTableH; nEntryCount:longint):TGDALColorTableH;cdecl;external;
procedure GDALRATDumpReadable(para1:TGDALRasterAttributeTableH; para2:PFILE);cdecl;external;
(* Const before type ignored *)
function GDALRATClone(para1:TGDALRasterAttributeTableH):TGDALRasterAttributeTableH;cdecl;external;
function GDALRATSerializeJSON(para1:TGDALRasterAttributeTableH):pointer;cdecl;external;
function GDALRATGetRowOfValue(para1:TGDALRasterAttributeTableH; para2:Tdouble):longint;cdecl;external;
procedure GDALRATRemoveStatistics(para1:TGDALRasterAttributeTableH);cdecl;external;
{ --------------------------------------------------------------------  }
{                          Relationships                                }
{ --------------------------------------------------------------------  }
{* Cardinality of relationship.
 *
 * @since GDAL 3.6
  }
{* One-to-one  }
{* One-to-many  }
{* Many-to-one  }
{* Many-to-many  }
type
  PGDALRelationshipCardinality = ^TGDALRelationshipCardinality;
  TGDALRelationshipCardinality =  Longint;
  Const
    GRC_ONE_TO_ONE = 0;
    GRC_ONE_TO_MANY = 1;
    GRC_MANY_TO_ONE = 2;
    GRC_MANY_TO_MANY = 3;
;
{* Type of relationship.
 *
 * @since GDAL 3.6
  }
{* Composite relationship  }
{* Association relationship  }
{* Aggregation relationship  }
type
  PGDALRelationshipType = ^TGDALRelationshipType;
  TGDALRelationshipType =  Longint;
  Const
    GRT_COMPOSITE = 0;
    GRT_ASSOCIATION = 1;
    GRT_AGGREGATION = 2;
;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function GDALRelationshipCreate(para1:Pchar; para2:Pchar; para3:Pchar; para4:TGDALRelationshipCardinality):TGDALRelationshipH;cdecl;external;
procedure GDALDestroyRelationship(para1:TGDALRelationshipH);cdecl;external;
(* Const before type ignored *)
function GDALRelationshipGetName(para1:TGDALRelationshipH):Pchar;cdecl;external;
function GDALRelationshipGetCardinality(para1:TGDALRelationshipH):TGDALRelationshipCardinality;cdecl;external;
(* Const before type ignored *)
function GDALRelationshipGetLeftTableName(para1:TGDALRelationshipH):Pchar;cdecl;external;
(* Const before type ignored *)
function GDALRelationshipGetRightTableName(para1:TGDALRelationshipH):Pchar;cdecl;external;
(* Const before type ignored *)
function GDALRelationshipGetMappingTableName(para1:TGDALRelationshipH):Pchar;cdecl;external;
(* Const before type ignored *)
procedure GDALRelationshipSetMappingTableName(para1:TGDALRelationshipH; para2:Pchar);cdecl;external;
function GDALRelationshipGetLeftTableFields(para1:TGDALRelationshipH):^Pchar;cdecl;external;
function GDALRelationshipGetRightTableFields(para1:TGDALRelationshipH):^Pchar;cdecl;external;
procedure GDALRelationshipSetLeftTableFields(para1:TGDALRelationshipH; para2:TCSLConstList);cdecl;external;
procedure GDALRelationshipSetRightTableFields(para1:TGDALRelationshipH; para2:TCSLConstList);cdecl;external;
function GDALRelationshipGetLeftMappingTableFields(para1:TGDALRelationshipH):^Pchar;cdecl;external;
function GDALRelationshipGetRightMappingTableFields(para1:TGDALRelationshipH):^Pchar;cdecl;external;
procedure GDALRelationshipSetLeftMappingTableFields(para1:TGDALRelationshipH; para2:TCSLConstList);cdecl;external;
procedure GDALRelationshipSetRightMappingTableFields(para1:TGDALRelationshipH; para2:TCSLConstList);cdecl;external;
function GDALRelationshipGetType(para1:TGDALRelationshipH):TGDALRelationshipType;cdecl;external;
procedure GDALRelationshipSetType(para1:TGDALRelationshipH; para2:TGDALRelationshipType);cdecl;external;
(* Const before type ignored *)
function GDALRelationshipGetForwardPathLabel(para1:TGDALRelationshipH):Pchar;cdecl;external;
(* Const before type ignored *)
procedure GDALRelationshipSetForwardPathLabel(para1:TGDALRelationshipH; para2:Pchar);cdecl;external;
(* Const before type ignored *)
function GDALRelationshipGetBackwardPathLabel(para1:TGDALRelationshipH):Pchar;cdecl;external;
(* Const before type ignored *)
procedure GDALRelationshipSetBackwardPathLabel(para1:TGDALRelationshipH; para2:Pchar);cdecl;external;
(* Const before type ignored *)
function GDALRelationshipGetRelatedTableType(para1:TGDALRelationshipH):Pchar;cdecl;external;
(* Const before type ignored *)
procedure GDALRelationshipSetRelatedTableType(para1:TGDALRelationshipH; para2:Pchar);cdecl;external;
{ ====================================================================  }
{      GDAL Cache Management                                            }
{ ====================================================================  }
procedure GDALSetCacheMax(nBytes:longint);cdecl;external;
function GDALGetCacheMax:longint;cdecl;external;
function GDALGetCacheUsed:longint;cdecl;external;
procedure GDALSetCacheMax64(nBytes:TGIntBig);cdecl;external;
function GDALGetCacheMax64:TGIntBig;cdecl;external;
function GDALGetCacheUsed64:TGIntBig;cdecl;external;
function GDALFlushCacheBlock:longint;cdecl;external;
{ ====================================================================  }
{      GDAL virtual memory                                              }
{ ====================================================================  }
function GDALDatasetGetVirtualMem(hDS:TGDALDatasetH; eRWFlag:TGDALRWFlag; nXOff:longint; nYOff:longint; nXSize:longint; 
           nYSize:longint; nBufXSize:longint; nBufYSize:longint; eBufType:TGDALDataType; nBandCount:longint; 
           panBandMap:Plongint; nPixelSpace:longint; nLineSpace:TGIntBig; nBandSpace:TGIntBig; nCacheSize:Tsize_t; 
           nPageSizeHint:Tsize_t; bSingleThreadUsage:longint; papszOptions:TCSLConstList):PCPLVirtualMem;cdecl;external;
function GDALRasterBandGetVirtualMem(hBand:TGDALRasterBandH; eRWFlag:TGDALRWFlag; nXOff:longint; nYOff:longint; nXSize:longint; 
           nYSize:longint; nBufXSize:longint; nBufYSize:longint; eBufType:TGDALDataType; nPixelSpace:longint; 
           nLineSpace:TGIntBig; nCacheSize:Tsize_t; nPageSizeHint:Tsize_t; bSingleThreadUsage:longint; papszOptions:TCSLConstList):PCPLVirtualMem;cdecl;external;
function GDALGetVirtualMemAuto(hBand:TGDALRasterBandH; eRWFlag:TGDALRWFlag; pnPixelSpace:Plongint; pnLineSpace:PGIntBig; papszOptions:TCSLConstList):PCPLVirtualMem;cdecl;external;
{*! Enumeration to describe the tile organization  }
{! Tile Interleaved by Pixel: tile (0,0) with internal band interleaved by
       pixel organization, tile (1, 0), ...   }
{! Band Interleaved by Tile : tile (0,0) of first band, tile (0,0) of
       second band, ... tile (1,0) of first band, tile (1,0) of second band, ...
      }
{! Band SeQuential : all the tiles of first band, all the tiles of
       following band...  }
type
  PGDALTileOrganization = ^TGDALTileOrganization;
  TGDALTileOrganization =  Longint;
  Const
    GTO_TIP = 0;
    GTO_BIT = 1;
    GTO_BSQ = 2;
;

function GDALDatasetGetTiledVirtualMem(hDS:TGDALDatasetH; eRWFlag:TGDALRWFlag; nXOff:longint; nYOff:longint; nXSize:longint; 
           nYSize:longint; nTileXSize:longint; nTileYSize:longint; eBufType:TGDALDataType; nBandCount:longint; 
           panBandMap:Plongint; eTileOrganization:TGDALTileOrganization; nCacheSize:Tsize_t; bSingleThreadUsage:longint; papszOptions:TCSLConstList):PCPLVirtualMem;cdecl;external;
function GDALRasterBandGetTiledVirtualMem(hBand:TGDALRasterBandH; eRWFlag:TGDALRWFlag; nXOff:longint; nYOff:longint; nXSize:longint; 
           nYSize:longint; nTileXSize:longint; nTileYSize:longint; eBufType:TGDALDataType; nCacheSize:Tsize_t; 
           bSingleThreadUsage:longint; papszOptions:TCSLConstList):PCPLVirtualMem;cdecl;external;
{ ====================================================================  }
{      VRTPansharpenedDataset class.                                    }
{ ====================================================================  }
(* Const before type ignored *)
function GDALCreatePansharpenedVRT(pszXML:Pchar; hPanchroBand:TGDALRasterBandH; nInputSpectralBands:longint; pahInputSpectralBands:PGDALRasterBandH):TGDALDatasetH;cdecl;external;
{ ===================================================================  }
{      Misc API                                                         }
{ ====================================================================  }
(* Const before type ignored *)
function GDALGetJPEG2000Structure(pszFilename:Pchar; papszOptions:TCSLConstList):PCPLXMLNode;cdecl;external;
{ ====================================================================  }
{      Multidimensional API_api                                        }
{ ====================================================================  }
(* Const before type ignored *)
function GDALCreateMultiDimensional(hDriver:TGDALDriverH; pszName:Pchar; papszRootGroupOptions:TCSLConstList; papszOptions:TCSLConstList):TGDALDatasetH;cdecl;external;
function GDALExtendedDataTypeCreate(eType:TGDALDataType):TGDALExtendedDataTypeH;cdecl;external;
function GDALExtendedDataTypeCreateString(nMaxStringLength:Tsize_t):TGDALExtendedDataTypeH;cdecl;external;
function GDALExtendedDataTypeCreateStringEx(nMaxStringLength:Tsize_t; eSubType:TGDALExtendedDataTypeSubType):TGDALExtendedDataTypeH;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GDALExtendedDataTypeCreateCompound(pszName:Pchar; nTotalSize:Tsize_t; nComponents:Tsize_t; comps:PGDALEDTComponentH):TGDALExtendedDataTypeH;cdecl;external;
procedure GDALExtendedDataTypeRelease(hEDT:TGDALExtendedDataTypeH);cdecl;external;
(* Const before type ignored *)
function GDALExtendedDataTypeGetName(hEDT:TGDALExtendedDataTypeH):Pchar;cdecl;external;
function GDALExtendedDataTypeGetClass(hEDT:TGDALExtendedDataTypeH):TGDALExtendedDataTypeClass;cdecl;external;
function GDALExtendedDataTypeGetNumericDataType(hEDT:TGDALExtendedDataTypeH):TGDALDataType;cdecl;external;
function GDALExtendedDataTypeGetSize(hEDT:TGDALExtendedDataTypeH):Tsize_t;cdecl;external;
function GDALExtendedDataTypeGetMaxStringLength(hEDT:TGDALExtendedDataTypeH):Tsize_t;cdecl;external;
function GDALExtendedDataTypeGetComponents(hEDT:TGDALExtendedDataTypeH; pnCount:Psize_t):PGDALEDTComponentH;cdecl;external;
procedure GDALExtendedDataTypeFreeComponents(components:PGDALEDTComponentH; nCount:Tsize_t);cdecl;external;
function GDALExtendedDataTypeCanConvertTo(hSourceEDT:TGDALExtendedDataTypeH; hTargetEDT:TGDALExtendedDataTypeH):longint;cdecl;external;
function GDALExtendedDataTypeEquals(hFirstEDT:TGDALExtendedDataTypeH; hSecondEDT:TGDALExtendedDataTypeH):longint;cdecl;external;
function GDALExtendedDataTypeGetSubType(hEDT:TGDALExtendedDataTypeH):TGDALExtendedDataTypeSubType;cdecl;external;
(* Const before type ignored *)
function GDALEDTComponentCreate(pszName:Pchar; nOffset:Tsize_t; hType:TGDALExtendedDataTypeH):TGDALEDTComponentH;cdecl;external;
procedure GDALEDTComponentRelease(hComp:TGDALEDTComponentH);cdecl;external;
(* Const before type ignored *)
function GDALEDTComponentGetName(hComp:TGDALEDTComponentH):Pchar;cdecl;external;
function GDALEDTComponentGetOffset(hComp:TGDALEDTComponentH):Tsize_t;cdecl;external;
function GDALEDTComponentGetType(hComp:TGDALEDTComponentH):TGDALExtendedDataTypeH;cdecl;external;
function GDALDatasetGetRootGroup(hDS:TGDALDatasetH):TGDALGroupH;cdecl;external;
procedure GDALGroupRelease(hGroup:TGDALGroupH);cdecl;external;
(* Const before type ignored *)
function GDALGroupGetName(hGroup:TGDALGroupH):Pchar;cdecl;external;
(* Const before type ignored *)
function GDALGroupGetFullName(hGroup:TGDALGroupH):Pchar;cdecl;external;
function GDALGroupGetMDArrayNames(hGroup:TGDALGroupH; papszOptions:TCSLConstList):^Pchar;cdecl;external;
(* Const before type ignored *)
function GDALGroupOpenMDArray(hGroup:TGDALGroupH; pszMDArrayName:Pchar; papszOptions:TCSLConstList):TGDALMDArrayH;cdecl;external;
(* Const before type ignored *)
function GDALGroupOpenMDArrayFromFullname(hGroup:TGDALGroupH; pszMDArrayName:Pchar; papszOptions:TCSLConstList):TGDALMDArrayH;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GDALGroupResolveMDArray(hGroup:TGDALGroupH; pszName:Pchar; pszStartingPoint:Pchar; papszOptions:TCSLConstList):TGDALMDArrayH;cdecl;external;
function GDALGroupGetGroupNames(hGroup:TGDALGroupH; papszOptions:TCSLConstList):^Pchar;cdecl;external;
(* Const before type ignored *)
function GDALGroupOpenGroup(hGroup:TGDALGroupH; pszSubGroupName:Pchar; papszOptions:TCSLConstList):TGDALGroupH;cdecl;external;
(* Const before type ignored *)
function GDALGroupOpenGroupFromFullname(hGroup:TGDALGroupH; pszMDArrayName:Pchar; papszOptions:TCSLConstList):TGDALGroupH;cdecl;external;
function GDALGroupGetVectorLayerNames(hGroup:TGDALGroupH; papszOptions:TCSLConstList):^Pchar;cdecl;external;
(* Const before type ignored *)
function GDALGroupOpenVectorLayer(hGroup:TGDALGroupH; pszVectorLayerName:Pchar; papszOptions:TCSLConstList):TOGRLayerH;cdecl;external;
function GDALGroupGetDimensions(hGroup:TGDALGroupH; pnCount:Psize_t; papszOptions:TCSLConstList):PGDALDimensionH;cdecl;external;
(* Const before type ignored *)
function GDALGroupGetAttribute(hGroup:TGDALGroupH; pszName:Pchar):TGDALAttributeH;cdecl;external;
function GDALGroupGetAttributes(hGroup:TGDALGroupH; pnCount:Psize_t; papszOptions:TCSLConstList):PGDALAttributeH;cdecl;external;
function GDALGroupGetStructuralInfo(hGroup:TGDALGroupH):TCSLConstList;cdecl;external;
(* Const before type ignored *)
function GDALGroupCreateGroup(hGroup:TGDALGroupH; pszSubGroupName:Pchar; papszOptions:TCSLConstList):TGDALGroupH;cdecl;external;
(* Const before type ignored *)
function GDALGroupDeleteGroup(hGroup:TGDALGroupH; pszName:Pchar; papszOptions:TCSLConstList):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GDALGroupCreateDimension(hGroup:TGDALGroupH; pszName:Pchar; pszType:Pchar; pszDirection:Pchar; nSize:TGUInt64; 
           papszOptions:TCSLConstList):TGDALDimensionH;cdecl;external;
(* Const before type ignored *)
function GDALGroupCreateMDArray(hGroup:TGDALGroupH; pszName:Pchar; nDimensions:Tsize_t; pahDimensions:PGDALDimensionH; hEDT:TGDALExtendedDataTypeH; 
           papszOptions:TCSLConstList):TGDALMDArrayH;cdecl;external;
(* Const before type ignored *)
function GDALGroupDeleteMDArray(hGroup:TGDALGroupH; pszName:Pchar; papszOptions:TCSLConstList):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GDALGroupCreateAttribute(hGroup:TGDALGroupH; pszName:Pchar; nDimensions:Tsize_t; panDimensions:PGUInt64; hEDT:TGDALExtendedDataTypeH; 
           papszOptions:TCSLConstList):TGDALAttributeH;cdecl;external;
(* Const before type ignored *)
function GDALGroupDeleteAttribute(hGroup:TGDALGroupH; pszName:Pchar; papszOptions:TCSLConstList):Tbool;cdecl;external;
(* Const before type ignored *)
function GDALGroupRename(hGroup:TGDALGroupH; pszNewName:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
function GDALGroupSubsetDimensionFromSelection(hGroup:TGDALGroupH; pszSelection:Pchar; papszOptions:TCSLConstList):TGDALGroupH;cdecl;external;
procedure GDALMDArrayRelease(hMDArray:TGDALMDArrayH);cdecl;external;
(* Const before type ignored *)
function GDALMDArrayGetName(hArray:TGDALMDArrayH):Pchar;cdecl;external;
(* Const before type ignored *)
function GDALMDArrayGetFullName(hArray:TGDALMDArrayH):Pchar;cdecl;external;
function GDALMDArrayGetTotalElementsCount(hArray:TGDALMDArrayH):TGUInt64;cdecl;external;
function GDALMDArrayGetDimensionCount(hArray:TGDALMDArrayH):Tsize_t;cdecl;external;
function GDALMDArrayGetDimensions(hArray:TGDALMDArrayH; pnCount:Psize_t):PGDALDimensionH;cdecl;external;
function GDALMDArrayGetDataType(hArray:TGDALMDArrayH):TGDALExtendedDataTypeH;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GDALMDArrayRead(hArray:TGDALMDArrayH; arrayStartIdx:PGUInt64; count:Psize_t; arrayStep:PGInt64; bufferStride:PGPtrDiff_t; 
           bufferDatatype:TGDALExtendedDataTypeH; pDstBuffer:pointer; pDstBufferAllocStart:pointer; nDstBufferllocSize:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GDALMDArrayWrite(hArray:TGDALMDArrayH; arrayStartIdx:PGUInt64; count:Psize_t; arrayStep:PGInt64; bufferStride:PGPtrDiff_t; 
           bufferDatatype:TGDALExtendedDataTypeH; pSrcBuffer:pointer; psrcBufferAllocStart:pointer; nSrcBufferllocSize:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GDALMDArrayAdviseRead(hArray:TGDALMDArrayH; arrayStartIdx:PGUInt64; count:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GDALMDArrayAdviseReadEx(hArray:TGDALMDArrayH; arrayStartIdx:PGUInt64; count:Psize_t; papszOptions:TCSLConstList):longint;cdecl;external;
(* Const before type ignored *)
function GDALMDArrayGetAttribute(hArray:TGDALMDArrayH; pszName:Pchar):TGDALAttributeH;cdecl;external;
function GDALMDArrayGetAttributes(hArray:TGDALMDArrayH; pnCount:Psize_t; papszOptions:TCSLConstList):PGDALAttributeH;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GDALMDArrayCreateAttribute(hArray:TGDALMDArrayH; pszName:Pchar; nDimensions:Tsize_t; panDimensions:PGUInt64; hEDT:TGDALExtendedDataTypeH; 
           papszOptions:TCSLConstList):TGDALAttributeH;cdecl;external;
(* Const before type ignored *)
function GDALMDArrayDeleteAttribute(hArray:TGDALMDArrayH; pszName:Pchar; papszOptions:TCSLConstList):Tbool;cdecl;external;
(* Const before type ignored *)
function GDALMDArrayResize(hArray:TGDALMDArrayH; panNewDimSizes:PGUInt64; papszOptions:TCSLConstList):Tbool;cdecl;external;
(* Const before type ignored *)
function GDALMDArrayGetRawNoDataValue(hArray:TGDALMDArrayH):pointer;cdecl;external;
function GDALMDArrayGetNoDataValueAsDouble(hArray:TGDALMDArrayH; pbHasNoDataValue:Plongint):Tdouble;cdecl;external;
function GDALMDArrayGetNoDataValueAsInt64(hArray:TGDALMDArrayH; pbHasNoDataValue:Plongint):Tint64_t;cdecl;external;
function GDALMDArrayGetNoDataValueAsUInt64(hArray:TGDALMDArrayH; pbHasNoDataValue:Plongint):Tuint64_t;cdecl;external;
(* Const before type ignored *)
function GDALMDArraySetRawNoDataValue(hArray:TGDALMDArrayH; para2:pointer):longint;cdecl;external;
function GDALMDArraySetNoDataValueAsDouble(hArray:TGDALMDArrayH; dfNoDataValue:Tdouble):longint;cdecl;external;
function GDALMDArraySetNoDataValueAsInt64(hArray:TGDALMDArrayH; nNoDataValue:Tint64_t):longint;cdecl;external;
function GDALMDArraySetNoDataValueAsUInt64(hArray:TGDALMDArrayH; nNoDataValue:Tuint64_t):longint;cdecl;external;
function GDALMDArraySetScale(hArray:TGDALMDArrayH; dfScale:Tdouble):longint;cdecl;external;
function GDALMDArraySetScaleEx(hArray:TGDALMDArrayH; dfScale:Tdouble; eStorageType:TGDALDataType):longint;cdecl;external;
function GDALMDArrayGetScale(hArray:TGDALMDArrayH; pbHasValue:Plongint):Tdouble;cdecl;external;
function GDALMDArrayGetScaleEx(hArray:TGDALMDArrayH; pbHasValue:Plongint; peStorageType:PGDALDataType):Tdouble;cdecl;external;
function GDALMDArraySetOffset(hArray:TGDALMDArrayH; dfOffset:Tdouble):longint;cdecl;external;
function GDALMDArraySetOffsetEx(hArray:TGDALMDArrayH; dfOffset:Tdouble; eStorageType:TGDALDataType):longint;cdecl;external;
function GDALMDArrayGetOffset(hArray:TGDALMDArrayH; pbHasValue:Plongint):Tdouble;cdecl;external;
function GDALMDArrayGetOffsetEx(hArray:TGDALMDArrayH; pbHasValue:Plongint; peStorageType:PGDALDataType):Tdouble;cdecl;external;
function GDALMDArrayGetBlockSize(hArray:TGDALMDArrayH; pnCount:Psize_t):PGUInt64;cdecl;external;
(* Const before type ignored *)
function GDALMDArraySetUnit(hArray:TGDALMDArrayH; para2:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function GDALMDArrayGetUnit(hArray:TGDALMDArrayH):Pchar;cdecl;external;
function GDALMDArraySetSpatialRef(para1:TGDALMDArrayH; para2:TOGRSpatialReferenceH):longint;cdecl;external;
function GDALMDArrayGetSpatialRef(hArray:TGDALMDArrayH):TOGRSpatialReferenceH;cdecl;external;
function GDALMDArrayGetProcessingChunkSize(hArray:TGDALMDArrayH; pnCount:Psize_t; nMaxChunkMemory:Tsize_t):Psize_t;cdecl;external;
function GDALMDArrayGetStructuralInfo(hArray:TGDALMDArrayH):TCSLConstList;cdecl;external;
(* Const before type ignored *)
function GDALMDArrayGetView(hArray:TGDALMDArrayH; pszViewExpr:Pchar):TGDALMDArrayH;cdecl;external;
(* Const before type ignored *)
function GDALMDArrayTranspose(hArray:TGDALMDArrayH; nNewAxisCount:Tsize_t; panMapNewAxisToOldAxis:Plongint):TGDALMDArrayH;cdecl;external;
function GDALMDArrayGetUnscaled(hArray:TGDALMDArrayH):TGDALMDArrayH;cdecl;external;
function GDALMDArrayGetMask(hArray:TGDALMDArrayH; papszOptions:TCSLConstList):TGDALMDArrayH;cdecl;external;
function GDALMDArrayAsClassicDataset(hArray:TGDALMDArrayH; iXDim:Tsize_t; iYDim:Tsize_t):TGDALDatasetH;cdecl;external;
function GDALMDArrayAsClassicDatasetEx(hArray:TGDALMDArrayH; iXDim:Tsize_t; iYDim:Tsize_t; hRootGroup:TGDALGroupH; papszOptions:TCSLConstList):TGDALDatasetH;cdecl;external;
function GDALMDArrayGetStatistics(hArray:TGDALMDArrayH; para2:TGDALDatasetH; bApproxOK:longint; bForce:longint; pdfMin:Pdouble; 
           pdfMax:Pdouble; pdfMean:Pdouble; pdfStdDev:Pdouble; pnValidCount:PGUInt64; pfnProgress:TGDALProgressFunc; 
           pProgressData:pointer):TCPLErr;cdecl;external;
function GDALMDArrayComputeStatistics(hArray:TGDALMDArrayH; para2:TGDALDatasetH; bApproxOK:longint; pdfMin:Pdouble; pdfMax:Pdouble; 
           pdfMean:Pdouble; pdfStdDev:Pdouble; pnValidCount:PGUInt64; para9:TGDALProgressFunc; pProgressData:pointer):longint;cdecl;external;
function GDALMDArrayComputeStatisticsEx(hArray:TGDALMDArrayH; para2:TGDALDatasetH; bApproxOK:longint; pdfMin:Pdouble; pdfMax:Pdouble; 
           pdfMean:Pdouble; pdfStdDev:Pdouble; pnValidCount:PGUInt64; para9:TGDALProgressFunc; pProgressData:pointer; 
           papszOptions:TCSLConstList):longint;cdecl;external;
(* Const before type ignored *)
function GDALMDArrayGetResampled(hArray:TGDALMDArrayH; nNewDimCount:Tsize_t; pahNewDims:PGDALDimensionH; resampleAlg:TGDALRIOResampleAlg; hTargetSRS:TOGRSpatialReferenceH; 
           papszOptions:TCSLConstList):TGDALMDArrayH;cdecl;external;
(* Const before type ignored *)
function GDALMDArrayGetGridded(hArray:TGDALMDArrayH; pszGridOptions:Pchar; hXArray:TGDALMDArrayH; hYArray:TGDALMDArrayH; papszOptions:TCSLConstList):TGDALMDArrayH;cdecl;external;
function GDALMDArrayGetCoordinateVariables(hArray:TGDALMDArrayH; pnCount:Psize_t):PGDALMDArrayH;cdecl;external;
procedure GDALReleaseArrays(arrays:PGDALMDArrayH; nCount:Tsize_t);cdecl;external;
function GDALMDArrayCache(hArray:TGDALMDArrayH; papszOptions:TCSLConstList):longint;cdecl;external;
(* Const before type ignored *)
function GDALMDArrayRename(hArray:TGDALMDArrayH; pszNewName:Pchar):Tbool;cdecl;external;
procedure GDALAttributeRelease(hAttr:TGDALAttributeH);cdecl;external;
procedure GDALReleaseAttributes(attributes:PGDALAttributeH; nCount:Tsize_t);cdecl;external;
(* Const before type ignored *)
function GDALAttributeGetName(hAttr:TGDALAttributeH):Pchar;cdecl;external;
(* Const before type ignored *)
function GDALAttributeGetFullName(hAttr:TGDALAttributeH):Pchar;cdecl;external;
function GDALAttributeGetTotalElementsCount(hAttr:TGDALAttributeH):TGUInt64;cdecl;external;
function GDALAttributeGetDimensionCount(hAttr:TGDALAttributeH):Tsize_t;cdecl;external;
function GDALAttributeGetDimensionsSize(hAttr:TGDALAttributeH; pnCount:Psize_t):PGUInt64;cdecl;external;
function GDALAttributeGetDataType(hAttr:TGDALAttributeH):TGDALExtendedDataTypeH;cdecl;external;
function GDALAttributeReadAsRaw(hAttr:TGDALAttributeH; pnSize:Psize_t):PGByte;cdecl;external;
procedure GDALAttributeFreeRawResult(hAttr:TGDALAttributeH; raw:PGByte; nSize:Tsize_t);cdecl;external;
(* Const before type ignored *)
function GDALAttributeReadAsString(hAttr:TGDALAttributeH):Pchar;cdecl;external;
function GDALAttributeReadAsInt(hAttr:TGDALAttributeH):longint;cdecl;external;
function GDALAttributeReadAsDouble(hAttr:TGDALAttributeH):Tdouble;cdecl;external;
function GDALAttributeReadAsStringArray(hAttr:TGDALAttributeH):^Pchar;cdecl;external;
function GDALAttributeReadAsIntArray(hAttr:TGDALAttributeH; pnCount:Psize_t):Plongint;cdecl;external;
function GDALAttributeReadAsDoubleArray(hAttr:TGDALAttributeH; pnCount:Psize_t):Pdouble;cdecl;external;
(* Const before type ignored *)
function GDALAttributeWriteRaw(hAttr:TGDALAttributeH; para2:pointer; para3:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function GDALAttributeWriteString(hAttr:TGDALAttributeH; para2:Pchar):longint;cdecl;external;
function GDALAttributeWriteStringArray(hAttr:TGDALAttributeH; para2:TCSLConstList):longint;cdecl;external;
function GDALAttributeWriteInt(hAttr:TGDALAttributeH; para2:longint):longint;cdecl;external;
function GDALAttributeWriteDouble(hAttr:TGDALAttributeH; para2:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
function GDALAttributeWriteDoubleArray(hAttr:TGDALAttributeH; para2:Pdouble; para3:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function GDALAttributeRename(hAttr:TGDALAttributeH; pszNewName:Pchar):Tbool;cdecl;external;
procedure GDALDimensionRelease(hDim:TGDALDimensionH);cdecl;external;
procedure GDALReleaseDimensions(dims:PGDALDimensionH; nCount:Tsize_t);cdecl;external;
(* Const before type ignored *)
function GDALDimensionGetName(hDim:TGDALDimensionH):Pchar;cdecl;external;
(* Const before type ignored *)
function GDALDimensionGetFullName(hDim:TGDALDimensionH):Pchar;cdecl;external;
(* Const before type ignored *)
function GDALDimensionGetType(hDim:TGDALDimensionH):Pchar;cdecl;external;
(* Const before type ignored *)
function GDALDimensionGetDirection(hDim:TGDALDimensionH):Pchar;cdecl;external;
function GDALDimensionGetSize(hDim:TGDALDimensionH):TGUInt64;cdecl;external;
function GDALDimensionGetIndexingVariable(hDim:TGDALDimensionH):TGDALMDArrayH;cdecl;external;
function GDALDimensionSetIndexingVariable(hDim:TGDALDimensionH; hArray:TGDALMDArrayH):longint;cdecl;external;
(* Const before type ignored *)
function GDALDimensionRename(hDim:TGDALDimensionH; pszNewName:Pchar):Tbool;cdecl;external;
{$endif}
{ ndef GDAL_H_INCLUDED  }

implementation

{ was #define dname def_expr }
function CPLE_WrongFormat : longint; { return type might be wrong }
  begin
    CPLE_WrongFormat:=CPL_STATIC_CAST(CPLErrorNum,200);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDAL_CHECK_VERSION(pszCallingComponentName : longint) : longint;
begin
  GDAL_CHECK_VERSION:=GDALCheckVersion(GDAL_VERSION_MAJOR,GDAL_VERSION_MINOR,pszCallingComponentName);
end;


end.
