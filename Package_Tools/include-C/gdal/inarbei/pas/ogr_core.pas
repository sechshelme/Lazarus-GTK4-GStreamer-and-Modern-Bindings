unit ogr_core;

interface

uses
  fp_gdal;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*****************************************************************************
 * $Id$
 *
 * Project:  OpenGIS Simple Features Reference Implementation
 * Purpose:  Define some core portability services for cross-platform OGR code.
 * Author:   Frank Warmerdam, warmerdam@pobox.com
 *
 ******************************************************************************
 * Copyright (c) 1999, Frank Warmerdam
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
{$ifndef OGR_CORE_H_INCLUDED}
{$define OGR_CORE_H_INCLUDED}
{$include "cpl_port.h"}
{$if defined(GDAL_COMPILATION)}
{$define DO_NOT_DEFINE_GDAL_DATE_NAME}
{$endif}
{$include "gdal_version.h"}
{*
 * \file
 *
 * Core portability services for cross-platform OGR code.
  }
{$if defined(__cplusplus) && !defined(CPL_SUPRESS_CPLUSPLUS)}
type
  POGREnvelope = ^TOGREnvelope;
  TOGREnvelope = record
      MinX : Tdouble;
      MaxX : Tdouble;
      MinY : Tdouble;
      MaxY : Tdouble;
    end;

  POGREnvelope3D = ^TOGREnvelope3D;
  TOGREnvelope3D = record
      MinX : Tdouble;
      MaxX : Tdouble;
      MinY : Tdouble;
      MaxY : Tdouble;
      MinZ : Tdouble;
      MaxZ : Tdouble;
    end;
{! @cond Doxygen_Suppress  }

function OGRMalloc(para1:Tsize_t):pointer;cdecl;external libgdal;
{ CPL_WARN_DEPRECATED("Use CPLMalloc instead."); }
{    CPL_WARN_DEPRECATED("Use CPLCalloc instead."); }
function OGRCalloc(para1:Tsize_t; para2:Tsize_t):pointer;cdecl;external libgdal;
{    CPL_WARN_DEPRECATED("Use CPLRealloc instead.") }
function OGRRealloc(para1:pointer; para2:Tsize_t):pointer;cdecl;external libgdal;
{  CPL_WARN_DEPRECATED("Use CPLStrdup instead.") }
function OGRStrdup(para1:Pchar):Pchar;cdecl;external libgdal;
procedure OGRFree(para1:pointer);cdecl;external libgdal;
{ CPL_WARN_DEPRECATED("Use CPLFree instead."); }
{! @endcond  }
{$ifdef STRICT_OGRERR_TYPE}
{* Type for a OGR error  }
{*< Success  }
{*< Not enough data to deserialize  }
{*< Not enough memory  }
{*< Unsupported geometry type  }
{*< Unsupported operation  }
{*< Corrupt data  }
{*< Failure  }
{*< Unsupported SRS  }
{*< Invalid handle  }
{*< Non existing feature. Added in GDAL 2.0  }
type
  POGRErr = ^TOGRErr;
  TOGRErr =  Longint;
  Const
    OGRERR_NONE = 0;
    OGRERR_NOT_ENOUGH_DATA = 1;
    OGRERR_NOT_ENOUGH_MEMORY = 2;
    OGRERR_UNSUPPORTED_GEOMETRY_TYPE = 3;
    OGRERR_UNSUPPORTED_OPERATION = 4;
    OGRERR_CORRUPT_DATA = 5;
    OGRERR_FAILURE = 6;
    OGRERR_UNSUPPORTED_SRS = 7;
    OGRERR_INVALID_HANDLE = 8;
    OGRERR_NON_EXISTING_FEATURE = 9;
;
{$else}
{* Type for a OGR error  }
type
  POGRErr = ^TOGRErr;
  TOGRErr = longint;
{*< Success  }

const
  OGRERR_NONE = 0;  
{*< Not enough data to deserialize  }
  OGRERR_NOT_ENOUGH_DATA = 1;  
{*< Not enough memory  }
  OGRERR_NOT_ENOUGH_MEMORY = 2;  
{*< Unsupported geometry type  }
  OGRERR_UNSUPPORTED_GEOMETRY_TYPE = 3;  
{*< Unsupported operation  }
  OGRERR_UNSUPPORTED_OPERATION = 4;  
{*< Corrupt data  }
  OGRERR_CORRUPT_DATA = 5;  
{*< Failure  }
  OGRERR_FAILURE = 6;  
{*< Unsupported SRS  }
  OGRERR_UNSUPPORTED_SRS = 7;  
{*< Invalid handle  }
  OGRERR_INVALID_HANDLE = 8;  
{*< Non existing feature. Added in GDAL 2.0  }
  OGRERR_NON_EXISTING_FEATURE = 9;  
{$endif}
{* Type for a OGR boolean  }
type
  POGRBoolean = ^TOGRBoolean;
  TOGRBoolean = longint;
{ --------------------------------------------------------------------  }
{      ogr_geometry.h related definitions.                              }
{ --------------------------------------------------------------------  }
{*
 * List of well known binary geometry types.  These are used within the BLOBs
 * but are also returned from OGRGeometry::getGeometryType() to identify the
 * type of a geometry object.
  }
{*< unknown type, non-standard  }
{*< 0-dimensional geometric object, standard WKB  }
{*< 1-dimensional geometric object with linear
                        *   interpolation between Points, standard WKB  }
{*< planar 2-dimensional geometric object defined
                        *   by 1 exterior boundary and 0 or more interior
                        *   boundaries, standard WKB  }
{*< GeometryCollection of Points, standard WKB  }
{*< GeometryCollection of LineStrings, standard WKB  }
{*< GeometryCollection of Polygons, standard WKB  }
{*< geometric object that is a collection of 1
                                    or more geometric objects, standard WKB  }
{*< one or more circular arc segments connected end
                            * to end, ISO SQL/MM Part 3. GDAL &gt;= 2.0  }
{*< sequence of contiguous curves, ISO SQL/MM Part 3.
                             GDAL &gt;= 2.0  }
{*< planar surface, defined by 1 exterior boundary
                           *   and zero or more interior boundaries, that are
                           * curves. ISO SQL/MM Part 3. GDAL &gt;= 2.0  }
{*< GeometryCollection of Curves, ISO SQL/MM Part 3.
                             GDAL &gt;= 2.0  }
{*< GeometryCollection of Surfaces, ISO SQL/MM
                             Part 3. GDAL &gt;= 2.0  }
{*< Curve (abstract type). ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< Surface (abstract type). ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< a contiguous collection of polygons, which share common
                  * boundary segments,      ISO SQL/MM Part 3. GDAL &gt;= 2.3  }
{*< a PolyhedralSurface consisting only of Triangle patches
                  *    ISO SQL/MM Part 3. GDAL &gt;= 2.3  }
{*< a Triangle. ISO SQL/MM Part 3. GDAL &gt;= 2.3  }
{*< non-standard, for pure attribute records  }
{*< non-standard, just for createGeometry()  }
{*< wkbCircularString with Z component. ISO
                                  SQL/MM Part 3. GDAL &gt;= 2.0  }
{*< wkbCompoundCurve with Z component. ISO SQL/MM
                                 Part 3. GDAL &gt;= 2.0  }
{*< wkbCurvePolygon with Z component. ISO SQL/MM
                                 Part 3. GDAL &gt;= 2.0  }
{*< wkbMultiCurve with Z component. ISO SQL/MM
                                 Part 3. GDAL &gt;= 2.0  }
{*< wkbMultiSurface with Z component. ISO SQL/MM
                                 Part 3. GDAL &gt;= 2.0  }
{*< wkbCurve with Z component. ISO SQL/MM Part 3. GDAL
                           &gt;= 2.1  }
{*< wkbSurface with Z component. ISO SQL/MM Part 3.
                           GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.3  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.3  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.3  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.3  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.3  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.3  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.1  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.3  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.3  }
{*< ISO SQL/MM Part 3. GDAL &gt;= 2.3  }
{*< 2.5D extension as per 99-402  }
{*< 2.5D extension as per 99-402  }
{*< 2.5D extension as per 99-402  }
{*< 2.5D extension as per 99-402  }
{*< 2.5D extension as per 99-402  }
{*< 2.5D extension as per 99-402  }
{*< 2.5D extension as per 99-402  }
{$endif}
type
  POGRwkbGeometryType = ^TOGRwkbGeometryType;
  TOGRwkbGeometryType =  Longint;
  Const
    wkbUnknown = 0;
    wkbPoint = 1;
    wkbLineString = 2;
    wkbPolygon = 3;
    wkbMultiPoint = 4;
    wkbMultiLineString = 5;
    wkbMultiPolygon = 6;
    wkbGeometryCollection = 7;
    wkbCircularString = 8;
    wkbCompoundCurve = 9;
    wkbCurvePolygon = 10;
    wkbMultiCurve = 11;
    wkbMultiSurface = 12;
    wkbCurve = 13;
    wkbSurface = 14;
    wkbPolyhedralSurface = 15;
    wkbTIN = 16;
    wkbTriangle = 17;
    wkbNone = 100;
    wkbLinearRing = 101;
    wkbCircularStringZ = 1008;
    wkbCompoundCurveZ = 1009;
    wkbCurvePolygonZ = 1010;
    wkbMultiCurveZ = 1011;
    wkbMultiSurfaceZ = 1012;
    wkbCurveZ = 1013;
    wkbSurfaceZ = 1014;
    wkbPolyhedralSurfaceZ = 1015;
    wkbTINZ = 1016;
    wkbTriangleZ = 1017;
    wkbPointM = 2001;
    wkbLineStringM = 2002;
    wkbPolygonM = 2003;
    wkbMultiPointM = 2004;
    wkbMultiLineStringM = 2005;
    wkbMultiPolygonM = 2006;
    wkbGeometryCollectionM = 2007;
    wkbCircularStringM = 2008;
    wkbCompoundCurveM = 2009;
    wkbCurvePolygonM = 2010;
    wkbMultiCurveM = 2011;
    wkbMultiSurfaceM = 2012;
    wkbCurveM = 2013;
    wkbSurfaceM = 2014;
    wkbPolyhedralSurfaceM = 2015;
    wkbTINM = 2016;
    wkbTriangleM = 2017;
    wkbPointZM = 3001;
    wkbLineStringZM = 3002;
    wkbPolygonZM = 3003;
    wkbMultiPointZM = 3004;
    wkbMultiLineStringZM = 3005;
    wkbMultiPolygonZM = 3006;
    wkbGeometryCollectionZM = 3007;
    wkbCircularStringZM = 3008;
    wkbCompoundCurveZM = 3009;
    wkbCurvePolygonZM = 3010;
    wkbMultiCurveZM = 3011;
    wkbMultiSurfaceZM = 3012;
    wkbCurveZM = 3013;
    wkbSurfaceZM = 3014;
    wkbPolyhedralSurfaceZM = 3015;
    wkbTINZM = 3016;
    wkbTriangleZM = 3017;
    wkbPoint25D = $80000001;
    wkbLineString25D = $80000002;
    wkbPolygon25D = $80000003;
    wkbMultiPoint25D = $80000004;
    wkbMultiLineString25D = $80000005;
    wkbMultiPolygon25D = $80000006;
    wkbGeometryCollection25D = $80000007;
;
{ clang-format off  }
{*
 * Output variants of WKB we support.
 *
 * 99-402 was a short-lived extension to SFSQL 1.1 that used a high-bit flag
 * to indicate the presence of Z coordinates in a WKB geometry.
 *
 * SQL/MM Part 3 and SFSQL 1.2 use offsets of 1000 (Z), 2000 (M) and 3000 (ZM)
 * to indicate the present of higher dimensional coordinates in a WKB geometry.
 * Reference: <a href="https://portal.opengeospatial.org/files/?artifact_id=320243">
 * 09-009_Committee_Draft_ISOIEC_CD_13249-3_SQLMM_Spatial.pdf</a>,
 * ISO/IEC JTC 1/SC 32 N 1820, ISO/IEC CD 13249-3:201x(E), Date: 2009-01-16.
 * The codes are also found in §8.2.3 of <a href="http://portal.opengeospatial.org/files/?artifact_id=25355"> OGC
 * 06-103r4 "OpenGIS® Implementation Standard for Geographic information -
 * Simple feature access - Part 1: Common architecture", v1.2.1</a>
  }
{ clang-format on  }
{*< Old-style 99-402 extended dimension (Z) WKB types  }
{*< SFSQL 1.2 and ISO SQL/MM Part 3 extended dimension (Z&M)
                      WKB types  }
{*< PostGIS 1.X has different codes for CurvePolygon,
                          MultiCurve and MultiSurface  }
type
  POGRwkbVariant = ^TOGRwkbVariant;
  TOGRwkbVariant =  Longint;
  Const
    wkbVariantOldOgc = 0;
    wkbVariantIso = 1;
    wkbVariantPostGIS1 = 2;
;
{$ifndef GDAL_COMPILATION}
{* @deprecated in GDAL 2.0. Use wkbHasZ() or wkbSetZ() instead  }

const
  wkb25DBit = $80000000;  
{$endif}
{$ifndef __cplusplus}
{* Return the 2D geometry type corresponding to the specified geometry type  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function wkbFlatten(x : longint) : longint;

{$else}
{* Return the 2D geometry type corresponding to the specified geometry type  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function wkbFlatten(x : longint) : longint;

{$endif}
{* Return if the geometry type is a 3D geometry type
 * @since GDAL 2.0
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function wkbHasZ(x : longint) : longint;

{* Return the 3D geometry type corresponding to the specified geometry type.
 * @since GDAL 2.0
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function wkbSetZ(x : longint) : longint;

{* Return if the geometry type is a measured geometry type
 * @since GDAL 2.1
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function wkbHasM(x : longint) : longint;

{* Return the measured geometry type corresponding to the specified geometry
 * type.
 * @since GDAL 2.1
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function wkbSetM(x : longint) : longint;

{$ifndef DOXYGEN_SKIP}

const
  ogrZMarker = $21125711;  
{$endif}

function OGRGeometryTypeToName(eType:TOGRwkbGeometryType):Pchar;cdecl;external libgdal;
function OGRMergeGeometryTypes(eMain:TOGRwkbGeometryType; eExtra:TOGRwkbGeometryType):TOGRwkbGeometryType;cdecl;external libgdal;
function OGRMergeGeometryTypesEx(eMain:TOGRwkbGeometryType; eExtra:TOGRwkbGeometryType; bAllowPromotingToCurves:longint):TOGRwkbGeometryType;cdecl;external libgdal;
function OGR_GT_Flatten(eType:TOGRwkbGeometryType):TOGRwkbGeometryType;cdecl;external libgdal;
function OGR_GT_SetZ(eType:TOGRwkbGeometryType):TOGRwkbGeometryType;cdecl;external libgdal;
function OGR_GT_SetM(eType:TOGRwkbGeometryType):TOGRwkbGeometryType;cdecl;external libgdal;
function OGR_GT_SetModifier(eType:TOGRwkbGeometryType; bSetZ:longint; bSetM:longint):TOGRwkbGeometryType;cdecl;external libgdal;
function OGR_GT_HasZ(eType:TOGRwkbGeometryType):longint;cdecl;external libgdal;
function OGR_GT_HasM(eType:TOGRwkbGeometryType):longint;cdecl;external libgdal;
function OGR_GT_IsSubClassOf(eType:TOGRwkbGeometryType; eSuperType:TOGRwkbGeometryType):longint;cdecl;external libgdal;
function OGR_GT_IsCurve(para1:TOGRwkbGeometryType):longint;cdecl;external libgdal;
function OGR_GT_IsSurface(para1:TOGRwkbGeometryType):longint;cdecl;external libgdal;
function OGR_GT_IsNonLinear(para1:TOGRwkbGeometryType):longint;cdecl;external libgdal;
function OGR_GT_GetCollection(eType:TOGRwkbGeometryType):TOGRwkbGeometryType;cdecl;external libgdal;
function OGR_GT_GetCurve(eType:TOGRwkbGeometryType):TOGRwkbGeometryType;cdecl;external libgdal;
function OGR_GT_GetLinear(eType:TOGRwkbGeometryType):TOGRwkbGeometryType;cdecl;external libgdal;
{* Enumeration to describe byte order  }
{*< MSB/Sun/Motorola: Most Significant Byte First    }
{*< LSB/Intel/Vax: Least Significant Byte First       }
type
  POGRwkbByteOrder = ^TOGRwkbByteOrder;
  TOGRwkbByteOrder =  Longint;
  Const
    wkbXDR = 0;
    wkbNDR = 1;
;
{$endif}
{ #ifndef DOXYGEN_SKIP  }
{* Alter field name.
 * Used by OGR_L_AlterFieldDefn().
  }

const
  ALTER_NAME_FLAG = $1;  
{* Alter field type.
 * Used by OGR_L_AlterFieldDefn().
  }
  ALTER_TYPE_FLAG = $2;  
{* Alter field width and precision.
 * Used by OGR_L_AlterFieldDefn().
  }
  ALTER_WIDTH_PRECISION_FLAG = $4;  
{* Alter field NOT NULL constraint.
 * Used by OGR_L_AlterFieldDefn().
 * @since GDAL 2.0
  }
  ALTER_NULLABLE_FLAG = $8;  
{* Alter field DEFAULT value.
 * Used by OGR_L_AlterFieldDefn().
 * @since GDAL 2.0
  }
  ALTER_DEFAULT_FLAG = $10;  
{* Alter field UNIQUE constraint.
 * Used by OGR_L_AlterFieldDefn().
 * @since GDAL 3.2
  }
  ALTER_UNIQUE_FLAG = $20;  
{* Alter field domain name.
 * Used by OGR_L_AlterFieldDefn().
 * @since GDAL 3.3
  }
  ALTER_DOMAIN_FLAG = $40;  
{* Alter field alternative name.
 * Used by OGR_L_AlterFieldDefn().
 * @since GDAL 3.7
  }
  ALTER_ALTERNATIVE_NAME_FLAG = $80;  
{* Alter field comment.
 * Used by OGR_L_AlterFieldDefn().
 * @since GDAL 3.7
  }
  ALTER_COMMENT_FLAG = $100;  
{* Alter all parameters of field definition.
 * Used by OGR_L_AlterFieldDefn().
  }
  ALTER_ALL_FLAG = (((((((ALTER_NAME_FLAG or ALTER_TYPE_FLAG) or ALTER_WIDTH_PRECISION_FLAG) or ALTER_NULLABLE_FLAG) or ALTER_DEFAULT_FLAG) or ALTER_UNIQUE_FLAG) or ALTER_DOMAIN_FLAG) or ALTER_ALTERNATIVE_NAME_FLAG) or ALTER_COMMENT_FLAG;  
{* Alter geometry field name.
 * Used by OGR_L_AlterGeomFieldDefn().
 * @since GDAL 3.6
  }
  ALTER_GEOM_FIELD_DEFN_NAME_FLAG = $1000;  
{* Alter geometry field type.
 * Used by OGR_L_AlterGeomFieldDefn().
 * @since GDAL 3.6
  }
  ALTER_GEOM_FIELD_DEFN_TYPE_FLAG = $2000;  
{* Alter geometry field nullable state.
 * Used by OGR_L_AlterGeomFieldDefn().
 * @since GDAL 3.6
  }
  ALTER_GEOM_FIELD_DEFN_NULLABLE_FLAG = $4000;  
{* Alter geometry field spatial reference system (except its coordinate epoch)
 * Used by OGR_L_AlterGeomFieldDefn().
 * @since GDAL 3.6
  }
  ALTER_GEOM_FIELD_DEFN_SRS_FLAG = $8000;  
{* Alter geometry field coordinate epoch
 * Used by OGR_L_AlterGeomFieldDefn().
 * @since GDAL 3.6
  }
  ALTER_GEOM_FIELD_DEFN_SRS_COORD_EPOCH_FLAG = $10000;  
{* Alter all parameters of field definition.
 * Used by OGR_L_AlterGeomFieldDefn().
 * @since GDAL 3.6
  }
  ALTER_GEOM_FIELD_DEFN_ALL_FLAG = (((ALTER_GEOM_FIELD_DEFN_NAME_FLAG or ALTER_GEOM_FIELD_DEFN_TYPE_FLAG) or ALTER_GEOM_FIELD_DEFN_NULLABLE_FLAG) or ALTER_GEOM_FIELD_DEFN_SRS_FLAG) or ALTER_GEOM_FIELD_DEFN_SRS_COORD_EPOCH_FLAG;  
{* Validate that fields respect not-null constraints.
 * Used by OGR_F_Validate().
 * @since GDAL 2.0
  }
  OGR_F_VAL_NULL = $00000001;  
{* Validate that geometries respect geometry column type.
 * Used by OGR_F_Validate().
 * @since GDAL 2.0
  }
  OGR_F_VAL_GEOM_TYPE = $00000002;  
{* Validate that (string) fields respect field width.
 * Used by OGR_F_Validate().
 * @since GDAL 2.0
  }
  OGR_F_VAL_WIDTH = $00000004;  
{* Allow fields that are null when there's an associated default value.
 * This can be used for drivers where the low-level layers will automatically
 * set the field value to the associated default value. This flag only makes
 * sense if OGR_F_VAL_NULL is set too. Used by OGR_F_Validate().
 * @since GDAL 2.0
  }
  OGR_F_VAL_ALLOW_NULL_WHEN_DEFAULT = $00000008;  
{* Allow geometry fields to have a different coordinate dimension that their
 * geometry column type.
 * This flag only makes sense if OGR_F_VAL_GEOM_TYPE is set too.
 * Used by OGR_F_Validate().
 * @since GDAL 2.1
  }
  OGR_F_VAL_ALLOW_DIFFERENT_GEOM_DIM = $00000010;  
{* Enable all validation tests (except OGR_F_VAL_ALLOW_DIFFERENT_GEOM_DIM)
 * Used by OGR_F_Validate().
 * @since GDAL 2.0
  }
  OGR_F_VAL_ALL = $7FFFFFFF and ( not (OGR_F_VAL_ALLOW_DIFFERENT_GEOM_DIM));  
{********************************************************************** }
{                  ogr_feature.h related definitions.                   }
{********************************************************************** }
{*
 * List of feature field types.  This list is likely to be extended in the
 * future ... avoid coding applications based on the assumption that all
 * field types can be known.
  }
{* Simple 32bit integer  }{* List of 32bit integers  }{* Double Precision floating point  }{* List of doubles  }{* String of ASCII chars  }{* Array of strings  }{* deprecated  }{* deprecated  }{* Raw Binary data  }{* Date  }{* Time  }{* Date and Time  }{* Single 64bit integer  }{* List of 64bit integers  }type
  POGRFieldType = ^TOGRFieldType;
  TOGRFieldType =  Longint;
  Const
    OFTInteger = 0;
    OFTIntegerList = 1;
    OFTReal = 2;
    OFTRealList = 3;
    OFTString = 4;
    OFTStringList = 5;
    OFTWideString = 6;
    OFTWideStringList = 7;
    OFTBinary = 8;
    OFTDate = 9;
    OFTTime = 10;
    OFTDateTime = 11;
    OFTInteger64 = 12;
    OFTInteger64List = 13;
    OFTMaxType = 13;
;
{*
 * List of field subtypes. A subtype represents a hint, a restriction of the
 * main type, that is not strictly necessary to consult.
 * This list is likely to be extended in the
 * future ... avoid coding applications based on the assumption that all
 * field types can be known.
 * Most subtypes only make sense for a restricted set of main types.
 * @since GDAL 2.0
  }
{* No subtype. This is the default value  }{* Boolean integer. Only valid for OFTInteger and OFTIntegerList. }
{* Signed 16-bit integer. Only valid for OFTInteger and OFTIntegerList.  }
{* Single precision (32 bit) floating point. Only valid for OFTReal and
       OFTRealList.  }
{* JSON content. Only valid for OFTString.
     * @since GDAL 2.4
      }
{* UUID string representation. Only valid for OFTString.
     * @since GDAL 3.3
      }
type
  POGRFieldSubType = ^TOGRFieldSubType;
  TOGRFieldSubType =  Longint;
  Const
    OFSTNone = 0;
    OFSTBoolean = 1;
    OFSTInt16 = 2;
    OFSTFloat32 = 3;
    OFSTJSON = 4;
    OFSTUUID = 5;
    OFSTMaxSubType = 5;
;
{*
 * Display justification for field values.
  }
type
  POGRJustification = ^TOGRJustification;
  TOGRJustification =  Longint;
  Const
    OJUndefined = 0;
    OJLeft = 1;
    OJRight = 2;
;
{* Special value for a unset FID  }
  OGRNullFID = -(1);  
{ Special value for an unknown field type. This should only be used
 * while reading a file. At the end of file any unknown types should
 * be set to OFTString.
  }
{! @cond Doxygen_Suppress  }
{! @endcond  }
{* Special value set in OGRField.Set.nMarker1, nMarker2 and nMarker3 for
 *  a unset field.
 *  Direct use of this value is strongly discouraged.
 *  Use OGR_RawField_SetUnset() or OGR_RawField_IsUnset() instead.
  }
  OGRUnsetMarker = -(21121);  
{* Special value set in OGRField.Set.nMarker1, nMarker2 and nMarker3 for
 *  a null field.
 *  Direct use of this value is strongly discouraged.
 *  Use OGR_RawField_SetNull() or OGR_RawField_IsNull() instead.
 *  @since GDAL 2.2
  }
  OGRNullMarker = -(21122);  
{* Time zone flag indicating unknown timezone. For the
 *  OGRFieldDefn::GetTZFlag() property, this may also indicate a mix of
 *  unknown, localtime or known time zones in the same field.
  }
  OGR_TZFLAG_UNKNOWN = 0;  
{* Time zone flag indicating local time  }
  OGR_TZFLAG_LOCALTIME = 1;  
{* Time zone flag only returned by OGRFieldDefn::GetTZFlag() to indicate
 * that all values in the field have a known time zone (ie different from
 * OGR_TZFLAG_UNKNOWN and OGR_TZFLAG_LOCALTIME), but it may be different among
 * features.  }
  OGR_TZFLAG_MIXED_TZ = 2;  
{* Time zone flag indicating UTC.
 * Used to derived other time zone flags with the following logic:
 * - values above 100 indicate a 15 minute increment per unit.
 * - values under 100 indicate a 15 minute decrement per unit.
 * For example: a value of 101 indicates UTC+00:15, a value of 102 UTC+00:30,
 * a value of 99 UTC-00:15 ,etc.  }
  OGR_TZFLAG_UTC = 100;  
{********************************************************************** }
{                               OGRField                                }
{********************************************************************** }
{*
 * OGRFeature field attribute value union.
  }
{! @cond Doxygen_Suppress  }
{ 0=unknown, 1=localtime(ambiguous),
                           100=GMT, 104=GMT+1, 80=GMT-5, etc  }
{ must be set to 0  }
{ with millisecond accuracy. at the end of the structure,
                         so as to keep it 12 bytes on 32 bit  }
{! @endcond  }
type
  POGRField = ^TOGRField;
  TOGRField = record
      case longint of
        0 : ( Integer : longint );
        1 : ( Integer64 : TGIntBig );
        2 : ( Real : Tdouble );
        3 : ( _String : Pchar );
        4 : ( IntegerList : record
            nCount : longint;
            paList : Plongint;
          end );
        5 : ( Integer64List : record
            nCount : longint;
            paList : PGIntBig;
          end );
        6 : ( RealList : record
            nCount : longint;
            paList : Pdouble;
          end );
        7 : ( StringList : record
            nCount : longint;
            paList : ^Pchar;
          end );
        8 : ( Binary : record
            nCount : longint;
            paData : PGByte;
          end );
        9 : ( Set : record
            nMarker1 : longint;
            nMarker2 : longint;
            nMarker3 : longint;
          end );
        10 : ( Date : record
            Year : TGInt16;
            Month : TGByte;
            Day : TGByte;
            Hour : TGByte;
            Minute : TGByte;
            TZFlag : TGByte;
            Reserved : TGByte;
            Second : single;
          end );
      end;
{ __cplusplus }
{* Option for OGRParseDate() to ask for lax checks on the input format  }

const
  OGRPARSEDATE_OPTION_LAX = 1;  

function OGRParseDate(pszInput:Pchar; psOutput:POGRField; nOptions:longint):longint;cdecl;external libgdal;
{ --------------------------------------------------------------------  }
{      Constants from ogrsf_frmts.h for capabilities.                   }
{ --------------------------------------------------------------------  }
{*< Layer capability for random read  }
const
  OLCRandomRead = 'RandomRead';  
{*< Layer capability for sequential write  }
  OLCSequentialWrite = 'SequentialWrite';  
{*< Layer capability for random write  }
  OLCRandomWrite = 'RandomWrite';  
{*< Layer capability for fast spatial filter  }
  OLCFastSpatialFilter = 'FastSpatialFilter';  
{*< Layer capability for fast feature count retrieval  \
                         }
  OLCFastFeatureCount = 'FastFeatureCount';  
{*< Layer capability for fast extent retrieval  }
  OLCFastGetExtent = 'FastGetExtent';  
{*< Layer capability for field creation                     \
                    }
  OLCCreateField = 'CreateField';  
{*< Layer capability for field deletion                     \
                    }
  OLCDeleteField = 'DeleteField';  
{*< Layer capability for field reordering  }
  OLCReorderFields = 'ReorderFields';  
{*< Layer capability for field alteration  }
  OLCAlterFieldDefn = 'AlterFieldDefn';  
{*< Layer capability for geometry field alteration   \
                           }
  OLCAlterGeomFieldDefn = 'AlterGeomFieldDefn';  
{*< Layer capability for transactions                      \
                     }
  OLCTransactions = 'Transactions';  
{*< Layer capability for feature deletion  }
  OLCDeleteFeature = 'DeleteFeature';  
{*< Layer capability for feature upsert  }
  OLCUpsertFeature = 'UpsertFeature';  
{*< Layer capability for specialized \
                                              UpdateFeature() implementation  }
  OLCUpdateFeature = 'UpdateFeature';  
{*< Layer capability for setting next feature index  \
                           }
  OLCFastSetNextByIndex = 'FastSetNextByIndex';  
{*< Layer capability for strings returned with UTF-8      \
                       encoding  }
  OLCStringsAsUTF8 = 'StringsAsUTF8';  
{*< Layer capability for field ignoring  }
  OLCIgnoreFields = 'IgnoreFields';  
{*< Layer capability for geometry field creation  }
  OLCCreateGeomField = 'CreateGeomField';  
{*< Layer capability for curve geometries support  }
  OLCCurveGeometries = 'CurveGeometries';  
{*< Layer capability for measured geometries support \
                           }
  OLCMeasuredGeometries = 'MeasuredGeometries';  
{*< Layer capability for geometry with Z dimension support. \
                     Since GDAL 3.6.  }
  OLCZGeometries = 'ZGeometries';  
{*< Layer capability for a layer that supports Rename()  }
  OLCRename = 'Rename';  
{*< Layer capability for fast GetArrowStream()       \
                            implementation  }
  OLCFastGetArrowStream = 'FastGetArrowStream';  
{*< Layer capability for fast WriteArrowBatch()     \
                            implementation  }
  OLCFastWriteArrowBatch = 'FastWriteArrowBatch';  
{*< Dataset capability for layer creation  }
  ODsCCreateLayer = 'CreateLayer';  
{*< Dataset capability for layer deletion  }
  ODsCDeleteLayer = 'DeleteLayer';  
{ Reserved:                   "RenameLayer"  }
{*< Dataset capability for geometry     \
                                         field creation support  }
  ODsCCreateGeomFieldAfterCreateLayer = 'CreateGeomFieldAfterCreateLayer';  
{*< Dataset capability for curve geometries support  }
  ODsCCurveGeometries = 'CurveGeometries';  
{*< Dataset capability for dataset transcations  }
  ODsCTransactions = 'Transactions';  
{*< Dataset capability for emulated dataset        \
                              transactions  }
  ODsCEmulatedTransactions = 'EmulatedTransactions';  
{*< Dataset capability for measured geometries       \
                            support  }
  ODsCMeasuredGeometries = 'MeasuredGeometries';  
{*< Dataset capability for geometry with Z dimension        \
                     support. Since GDAL 3.6.  }
  ODsCZGeometries = 'ZGeometries';  
{*< Dataset capability for GetNextFeature() returning   \
                         features from random layers  }
  ODsCRandomLayerRead = 'RandomLayerRead';  
{ Note the unfortunate trailing space at the end of the string  }
{*< Dataset capability for supporting CreateFeature   \
                           on layer in random order  }
  ODsCRandomLayerWrite = 'RandomLayerWrite ';  
{*< Dataset capability for supporting AddFieldDomain()   \
                        (at least partially)  }
  ODsCAddFieldDomain = 'AddFieldDomain';  
{*< Dataset capability for supporting                 \
                           DeleteFieldDomain() }
  ODsCDeleteFieldDomain = 'DeleteFieldDomain';  
{*< Dataset capability for supporting                 \
                           UpdateFieldDomain() }
  ODsCUpdateFieldDomain = 'UpdateFieldDomain';  
{*< Driver capability for datasource creation  }
  ODrCCreateDataSource = 'CreateDataSource';  
{*< Driver capability for datasource deletion  }
  ODrCDeleteDataSource = 'DeleteDataSource';  
{ --------------------------------------------------------------------  }
{      Layer metadata items.                                            }
{ --------------------------------------------------------------------  }
{* Capability set to YES as metadata on a layer that has features with
  * 64 bit identifiers.
  @since GDAL 2.0
   }
  OLMD_FID64 = 'OLMD_FID64';  
{********************************************************************** }
{                  ogr_featurestyle.h related definitions.              }
{********************************************************************** }
{*
 * OGRStyleTool derived class types (returned by GetType()).
  }
{*< None  }
{*< Pen  }
{*< Brush  }
{*< Symbol  }
{*< Label  }
{*< Vector  }
type
  Pogr_style_tool_class_id = ^Togr_style_tool_class_id;
  Togr_style_tool_class_id =  Longint;
  Const
    OGRSTCNone = 0;
    OGRSTCPen = 1;
    OGRSTCBrush = 2;
    OGRSTCSymbol = 3;
    OGRSTCLabel = 4;
    OGRSTCVector = 5;
;
  TOGRSTClassId = Togr_style_tool_class_id;
  POGRSTClassId = ^TOGRSTClassId;
{*
 * List of units supported by OGRStyleTools.
  }
{*< Ground unit  }
{*< Pixel  }
{*< Points  }
{*< Millimeter  }
{*< Centimeter  }
{*< Inch  }
type
  Pogr_style_tool_units_id = ^Togr_style_tool_units_id;
  Togr_style_tool_units_id =  Longint;
  Const
    OGRSTUGround = 0;
    OGRSTUPixel = 1;
    OGRSTUPoints = 2;
    OGRSTUMM = 3;
    OGRSTUCM = 4;
    OGRSTUInches = 5;
;
  TOGRSTUnitId = Togr_style_tool_units_id;
  POGRSTUnitId = ^TOGRSTUnitId;
{*
 * List of parameters for use with OGRStylePen.
  }
{*< Color  }
{*< Width  }
{*< Pattern  }
{*< Id  }
{*< Perpendicular offset  }
{*< Cap  }
{*< Join  }
{*< Priority  }
{$ifndef DOXYGEN_SKIP}
{$endif}
type
  Pogr_style_tool_param_pen_id = ^Togr_style_tool_param_pen_id;
  Togr_style_tool_param_pen_id =  Longint;
  Const
    OGRSTPenColor = 0;
    OGRSTPenWidth = 1;
    OGRSTPenPattern = 2;
    OGRSTPenId = 3;
    OGRSTPenPerOffset = 4;
    OGRSTPenCap = 5;
    OGRSTPenJoin = 6;
    OGRSTPenPriority = 7;
    OGRSTPenLast = 8;
;
  TOGRSTPenParam = Togr_style_tool_param_pen_id;
  POGRSTPenParam = ^TOGRSTPenParam;
{*
 * List of parameters for use with OGRStyleBrush.
  }
{*< Foreground color  }
{*< Background color  }
{*< Id  }
{*< Angle  }
{*< Size  }
{*< Dx  }
{*< Dy  }
{*< Priority  }
{$ifndef DOXYGEN_SKIP}
{$endif}
type
  Pogr_style_tool_param_brush_id = ^Togr_style_tool_param_brush_id;
  Togr_style_tool_param_brush_id =  Longint;
  Const
    OGRSTBrushFColor = 0;
    OGRSTBrushBColor = 1;
    OGRSTBrushId = 2;
    OGRSTBrushAngle = 3;
    OGRSTBrushSize = 4;
    OGRSTBrushDx = 5;
    OGRSTBrushDy = 6;
    OGRSTBrushPriority = 7;
    OGRSTBrushLast = 8;
;
  TOGRSTBrushParam = Togr_style_tool_param_brush_id;
  POGRSTBrushParam = ^TOGRSTBrushParam;
{*
 * List of parameters for use with OGRStyleSymbol.
  }
{*< Id  }
{*< Angle  }
{*< Color  }
{*< Size  }
{*< Dx  }
{*< Dy  }
{*< Step  }
{*< Perpendicular  }
{*< Offset  }
{*< Priority  }
{*< Font name  }
{*< Outline color  }
{$ifndef DOXYGEN_SKIP}
{$endif}
type
  Pogr_style_tool_param_symbol_id = ^Togr_style_tool_param_symbol_id;
  Togr_style_tool_param_symbol_id =  Longint;
  Const
    OGRSTSymbolId = 0;
    OGRSTSymbolAngle = 1;
    OGRSTSymbolColor = 2;
    OGRSTSymbolSize = 3;
    OGRSTSymbolDx = 4;
    OGRSTSymbolDy = 5;
    OGRSTSymbolStep = 6;
    OGRSTSymbolPerp = 7;
    OGRSTSymbolOffset = 8;
    OGRSTSymbolPriority = 9;
    OGRSTSymbolFontName = 10;
    OGRSTSymbolOColor = 11;
    OGRSTSymbolLast = 12;
;
  TOGRSTSymbolParam = Togr_style_tool_param_symbol_id;
  POGRSTSymbolParam = ^TOGRSTSymbolParam;
{*
 * List of parameters for use with OGRStyleLabel.
  }
{*< Font name  }
{*< Size  }
{*< Text string  }
{*< Angle  }
{*< Foreground color  }
{*< Background color  }
{*< Placement  }
{*< Anchor  }
{*< Dx  }
{*< Dy  }
{*< Perpendicular  }
{*< Bold  }
{*< Italic  }
{*< Underline  }
{*< Priority  }
{*< Strike out  }
{*< Stretch  }
{*< OBSOLETE; do not use  }
{*< OBSOLETE; do not use  }
{*< Highlight color  }
{*< Outline color  }
{$ifndef DOXYGEN_SKIP}
{$endif}
type
  Pogr_style_tool_param_label_id = ^Togr_style_tool_param_label_id;
  Togr_style_tool_param_label_id =  Longint;
  Const
    OGRSTLabelFontName = 0;
    OGRSTLabelSize = 1;
    OGRSTLabelTextString = 2;
    OGRSTLabelAngle = 3;
    OGRSTLabelFColor = 4;
    OGRSTLabelBColor = 5;
    OGRSTLabelPlacement = 6;
    OGRSTLabelAnchor = 7;
    OGRSTLabelDx = 8;
    OGRSTLabelDy = 9;
    OGRSTLabelPerp = 10;
    OGRSTLabelBold = 11;
    OGRSTLabelItalic = 12;
    OGRSTLabelUnderline = 13;
    OGRSTLabelPriority = 14;
    OGRSTLabelStrikeout = 15;
    OGRSTLabelStretch = 16;
    OGRSTLabelAdjHor = 17;
    OGRSTLabelAdjVert = 18;
    OGRSTLabelHColor = 19;
    OGRSTLabelOColor = 20;
    OGRSTLabelLast = 21;
;
  TOGRSTLabelParam = Togr_style_tool_param_label_id;
  POGRSTLabelParam = ^TOGRSTLabelParam;
{ --------------------------------------------------------------------  }
{                          Field domains                                }
{ --------------------------------------------------------------------  }
{* Associates a code and a value
 *
 * @since GDAL 3.3
  }
{* Code. Content should be of the type of the OGRFieldDomain  }
{* Value. Might be NULL  }
type
  POGRCodedValue = ^TOGRCodedValue;
  TOGRCodedValue = record
      pszCode : Pchar;
      pszValue : Pchar;
    end;
{* Type of field domain.
 *
 * @since GDAL 3.3
  }
{* Coded  }
{* Range (min/max)  }
{* Glob (used by GeoPackage)  }

  POGRFieldDomainType = ^TOGRFieldDomainType;
  TOGRFieldDomainType =  Longint;
  Const
    OFDT_CODED = 0;
    OFDT_RANGE = 1;
    OFDT_GLOB = 2;
;
{* Split policy for field domains.
 *
 * When a feature is split in two, defines how the value of attributes
 * following the domain are computed.
 *
 * @since GDAL 3.3
  }
{* Default value  }
{* Duplicate  }
{* New values are computed by the ratio of their area/length compared to
       the area/length of the original feature  }
type
  POGRFieldDomainSplitPolicy = ^TOGRFieldDomainSplitPolicy;
  TOGRFieldDomainSplitPolicy =  Longint;
  Const
    OFDSP_DEFAULT_VALUE = 0;
    OFDSP_DUPLICATE = 1;
    OFDSP_GEOMETRY_RATIO = 2;
;
{* Merge policy for field domains.
 *
 * When a feature is built by merging two features, defines how the value of
 * attributes following the domain are computed.
 *
 * @since GDAL 3.3
  }
{* Default value  }
{* Sum  }
{* New values are computed as the weighted average of the source values.  }
type
  POGRFieldDomainMergePolicy = ^TOGRFieldDomainMergePolicy;
  TOGRFieldDomainMergePolicy =  Longint;
  Const
    OFDMP_DEFAULT_VALUE = 0;
    OFDMP_SUM = 1;
    OFDMP_GEOMETRY_WEIGHTED = 2;
;
{ -------------------------------------------------------------------  }
{                        Version checking                              }
{ --------------------------------------------------------------------  }
{$ifndef DOXYGEN_SKIP}
{ Note to developers : please keep this section in sync with gdal.h  }
{$ifndef GDAL_VERSION_INFO_DEFINED}
{$define GDAL_VERSION_INFO_DEFINED}

function GDALVersionInfo(para1:Pchar):Pchar;cdecl;external libgdal;
{$endif}
{$ifndef GDAL_CHECK_VERSION}
{* Return TRUE if GDAL library version at runtime matches
   nVersionMajor.nVersionMinor.

    The purpose of this method is to ensure that calling code will run with the
   GDAL version it is compiled for. It is primarily indented for external
   plugins.

    @param nVersionMajor Major version to be tested against
    @param nVersionMinor Minor version to be tested against
    @param pszCallingComponentName If not NULL, in case of version mismatch, the
   method will issue a failure mentioning the name of the calling component.
   }

function GDALCheckVersion(nVersionMajor:longint; nVersionMinor:longint; pszCallingComponentName:Pchar):longint;cdecl;external libgdal;
{* Helper macro for GDALCheckVersion  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDAL_CHECK_VERSION(pszCallingComponentName : longint) : longint;

{$endif}
{$endif}
{ #ifndef DOXYGEN_SKIP  }
{$endif}
{ ndef OGR_CORE_H_INCLUDED  }

// === Konventiert am: 2-10-26 16:54:19 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function wkbFlatten(x : longint) : longint;
begin
  wkbFlatten:=OGR_GT_Flatten(TOGRwkbGeometryType(x));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function wkbFlatten(x : longint) : longint;
begin
  wkbFlatten:=OGR_GT_Flatten((static_cast<OGRwkbGeometryType)>x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function wkbHasZ(x : longint) : longint;
begin
  wkbHasZ:=(OGR_GT_HasZ(x))<>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function wkbSetZ(x : longint) : longint;
begin
  wkbSetZ:=OGR_GT_SetZ(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function wkbHasM(x : longint) : longint;
begin
  wkbHasM:=(OGR_GT_HasM(x))<>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function wkbSetM(x : longint) : longint;
begin
  wkbSetM:=OGR_GT_SetM(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDAL_CHECK_VERSION(pszCallingComponentName : longint) : longint;
begin
  GDAL_CHECK_VERSION:=GDALCheckVersion(GDAL_VERSION_MAJOR,GDAL_VERSION_MINOR,pszCallingComponentName);
end;


end.
