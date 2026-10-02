/******************************************************************************
 * $Id$
 *
 * Project:  OpenGIS Simple Features Reference Implementation
 * Purpose:  C API for OGR Geometry, Feature, Layers, DataSource and drivers.
 * Author:   Frank Warmerdam, warmerdam@pobox.com
 *
 ******************************************************************************
 * Copyright (c) 2002, Frank Warmerdam
 * Copyright (c) 2008-2013, Even Rouault <even dot rouault at spatialys.com>
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

#ifndef OGR_API_H_INCLUDED
#define OGR_API_H_INCLUDED

/**
 * \file ogr_api.h
 *
 * C API and defines for OGRFeature, OGRGeometry, and OGRDataSource
 * related classes.
 *
 * See also: ogr_geometry.h, ogr_feature.h, ogrsf_frmts.h, ogr_featurestyle.h
 */

#include "cpl_progress.h"
#include "cpl_minixml.h"
#include "ogr_core.h"

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>



bool  OGRGetGEOSVersion(int *pnMajor, int *pnMinor, int *pnPatch);

/* -------------------------------------------------------------------- */
/*      Geometry related functions (ogr_geometry.h)                     */
/* -------------------------------------------------------------------- */
#ifndef DEFINEH_OGRGeometryH
/*! @cond Doxygen_Suppress */
#define DEFINEH_OGRGeometryH
/*! @endcond */
#ifdef DEBUG
typedef struct OGRGeometryHS *OGRGeometryH;
#else
/** Opaque type for a geometry */
typedef void *OGRGeometryH;
#endif
#endif /* DEFINEH_OGRGeometryH */

#ifndef DEFINED_OGRSpatialReferenceH
/*! @cond Doxygen_Suppress */
#define DEFINED_OGRSpatialReferenceH
/*! @endcond */

#ifndef DOXYGEN_XML
#ifdef DEBUG
typedef struct OGRSpatialReferenceHS *OGRSpatialReferenceH;
typedef struct OGRCoordinateTransformationHS *OGRCoordinateTransformationH;
#else
/** Opaque type for a spatial reference system */
typedef void *OGRSpatialReferenceH;
/** Opaque type for a coordinate transformation object */
typedef void *OGRCoordinateTransformationH;
#endif
#endif

#endif /* DEFINED_OGRSpatialReferenceH */

struct _CPLXMLNode;

/* From base OGRGeometry class */

OGRErr  OGR_G_CreateFromWkb(const void *, OGRSpatialReferenceH,
                                   OGRGeometryH *, int);
OGRErr  OGR_G_CreateFromWkbEx(const void *, OGRSpatialReferenceH,
                                     OGRGeometryH *, size_t);
OGRErr  OGR_G_CreateFromWkt(char **, OGRSpatialReferenceH,
                                   OGRGeometryH *);
OGRErr  OGR_G_CreateFromFgf(const void *, OGRSpatialReferenceH,
                                   OGRGeometryH *, int, int *);
void  OGR_G_DestroyGeometry(OGRGeometryH);
OGRGeometryH
     OGR_G_CreateGeometry(OGRwkbGeometryType) ;
OGRGeometryH  OGR_G_ApproximateArcAngles(
    double dfCenterX, double dfCenterY, double dfZ, double dfPrimaryRadius,
    double dfSecondaryAxis, double dfRotation, double dfStartAngle,
    double dfEndAngle, double dfMaxAngleStepSizeDegrees) ;

OGRGeometryH  OGR_G_ForceToPolygon(OGRGeometryH) ;
OGRGeometryH
     OGR_G_ForceToLineString(OGRGeometryH) ;
OGRGeometryH
     OGR_G_ForceToMultiPolygon(OGRGeometryH) ;
OGRGeometryH
     OGR_G_ForceToMultiPoint(OGRGeometryH) ;
OGRGeometryH
     OGR_G_ForceToMultiLineString(OGRGeometryH) ;
OGRGeometryH  OGR_G_ForceTo(OGRGeometryH hGeom,
                                   OGRwkbGeometryType eTargetType,
                                   char **papszOptions) ;
OGRGeometryH  OGR_G_RemoveLowerDimensionSubGeoms(
    const OGRGeometryH hGeom) ;

int  OGR_G_GetDimension(OGRGeometryH);
int  OGR_G_GetCoordinateDimension(OGRGeometryH);
int  OGR_G_CoordinateDimension(OGRGeometryH);
void  OGR_G_SetCoordinateDimension(OGRGeometryH, int);
int  OGR_G_Is3D(OGRGeometryH);
int  OGR_G_IsMeasured(OGRGeometryH);
void  OGR_G_Set3D(OGRGeometryH, int);
void  OGR_G_SetMeasured(OGRGeometryH, int);
OGRGeometryH  OGR_G_Clone(OGRGeometryH) ;
void  OGR_G_GetEnvelope(OGRGeometryH, OGREnvelope *);
void  OGR_G_GetEnvelope3D(OGRGeometryH, OGREnvelope3D *);
OGRErr  OGR_G_ImportFromWkb(OGRGeometryH, const void *, int);
OGRErr  OGR_G_ExportToWkb(OGRGeometryH, OGRwkbByteOrder,
                                 unsigned char *);
OGRErr  OGR_G_ExportToIsoWkb(OGRGeometryH, OGRwkbByteOrder,
                                    unsigned char *);
int  OGR_G_WkbSize(OGRGeometryH hGeom);
size_t  OGR_G_WkbSizeEx(OGRGeometryH hGeom);
OGRErr  OGR_G_ImportFromWkt(OGRGeometryH, char **);
OGRErr  OGR_G_ExportToWkt(OGRGeometryH, char **);
OGRErr  OGR_G_ExportToIsoWkt(OGRGeometryH, char **);
OGRwkbGeometryType  OGR_G_GetGeometryType(OGRGeometryH);
const char  *OGR_G_GetGeometryName(OGRGeometryH);
void  OGR_G_DumpReadable(OGRGeometryH, FILE *, const char *);
void  OGR_G_FlattenTo2D(OGRGeometryH);
void  OGR_G_CloseRings(OGRGeometryH);

OGRGeometryH  OGR_G_CreateFromGML(const char *) ;
char  *OGR_G_ExportToGML(OGRGeometryH) ;
char  *OGR_G_ExportToGMLEx(OGRGeometryH,
                                  char **papszOptions) ;

OGRGeometryH  OGR_G_CreateFromGMLTree(const CPLXMLNode *)
    ;
CPLXMLNode  *OGR_G_ExportToGMLTree(OGRGeometryH) ;
CPLXMLNode  *
    OGR_G_ExportEnvelopeToGMLTree(OGRGeometryH) ;

char  *OGR_G_ExportToKML(OGRGeometryH, const char *pszAltitudeMode)
    ;

char  *OGR_G_ExportToJson(OGRGeometryH) ;
char  *OGR_G_ExportToJsonEx(OGRGeometryH,
                                   char **papszOptions) ;
/** Create a OGR geometry from a GeoJSON geometry object */
OGRGeometryH  OGR_G_CreateGeometryFromJson(const char *)
    ;
/** Create a OGR geometry from a ESRI JSON geometry object */
OGRGeometryH  OGR_G_CreateGeometryFromEsriJson(const char *)
    ;

void  OGR_G_AssignSpatialReference(OGRGeometryH, OGRSpatialReferenceH);
OGRSpatialReferenceH  OGR_G_GetSpatialReference(OGRGeometryH);
OGRErr  OGR_G_Transform(OGRGeometryH, OGRCoordinateTransformationH);
OGRErr  OGR_G_TransformTo(OGRGeometryH, OGRSpatialReferenceH);

/** Opaque type for a geometry transformer. */
typedef struct OGRGeomTransformer *OGRGeomTransformerH;
OGRGeomTransformerH 
OGR_GeomTransformer_Create(OGRCoordinateTransformationH,
                           CSLConstList papszOptions) ;
OGRGeometryH 
OGR_GeomTransformer_Transform(OGRGeomTransformerH hTransformer,
                              OGRGeometryH hGeom) ;
void  OGR_GeomTransformer_Destroy(OGRGeomTransformerH hTransformer);

OGRGeometryH  OGR_G_Simplify(OGRGeometryH hThis,
                                    double tolerance) ;
OGRGeometryH  OGR_G_SimplifyPreserveTopology(
    OGRGeometryH hThis, double tolerance) ;
OGRGeometryH 
OGR_G_DelaunayTriangulation(OGRGeometryH hThis, double dfTolerance,
                            int bOnlyEdges) ;

void  OGR_G_Segmentize(OGRGeometryH hGeom, double dfMaxLength);
int  OGR_G_Intersects(OGRGeometryH, OGRGeometryH);
int  OGR_G_Equals(OGRGeometryH, OGRGeometryH);
/*int     OGR_G_EqualsExact( OGRGeometryH, OGRGeometryH, double );*/
int  OGR_G_Disjoint(OGRGeometryH, OGRGeometryH);
int  OGR_G_Touches(OGRGeometryH, OGRGeometryH);
int  OGR_G_Crosses(OGRGeometryH, OGRGeometryH);
int  OGR_G_Within(OGRGeometryH, OGRGeometryH);
int  OGR_G_Contains(OGRGeometryH, OGRGeometryH);
int  OGR_G_Overlaps(OGRGeometryH, OGRGeometryH);

OGRGeometryH  OGR_G_Boundary(OGRGeometryH) ;
OGRGeometryH  OGR_G_ConvexHull(OGRGeometryH) ;
OGRGeometryH  OGR_G_ConcaveHull(OGRGeometryH, double dfRatio,
                                       bool bAllowHoles) ;
OGRGeometryH  OGR_G_Buffer(OGRGeometryH, double,
                                  int) ;
OGRGeometryH  OGR_G_Intersection(OGRGeometryH,
                                        OGRGeometryH) ;
OGRGeometryH  OGR_G_Union(OGRGeometryH,
                                 OGRGeometryH) ;
OGRGeometryH  OGR_G_UnionCascaded(OGRGeometryH) ;
OGRGeometryH  OGR_G_UnaryUnion(OGRGeometryH) ;
OGRGeometryH  OGR_G_PointOnSurface(OGRGeometryH) ;
/*OGRGeometryH  OGR_G_Polygonize( OGRGeometryH *, int);*/
/*OGRGeometryH  OGR_G_Polygonizer_getCutEdges( OGRGeometryH *, int);*/
/*OGRGeometryH  OGR_G_LineMerge( OGRGeometryH );*/

OGRGeometryH  OGR_G_Difference(OGRGeometryH,
                                      OGRGeometryH) ;
OGRGeometryH  OGR_G_SymDifference(OGRGeometryH,
                                         OGRGeometryH) ;
double  OGR_G_Distance(OGRGeometryH, OGRGeometryH);
double  OGR_G_Distance3D(OGRGeometryH, OGRGeometryH);
double  OGR_G_Length(OGRGeometryH);
double  OGR_G_Area(OGRGeometryH);
bool  OGR_G_IsClockwise(OGRGeometryH hGeom);
int  OGR_G_Centroid(OGRGeometryH, OGRGeometryH);
OGRGeometryH  OGR_G_Value(OGRGeometryH,
                                 double dfDistance) ;

void  OGR_G_Empty(OGRGeometryH);
int  OGR_G_IsEmpty(OGRGeometryH);
int  OGR_G_IsValid(OGRGeometryH);
/*char     *OGR_G_IsValidReason( OGRGeometryH );*/
OGRGeometryH  OGR_G_MakeValid(OGRGeometryH) ;
OGRGeometryH  OGR_G_MakeValidEx(OGRGeometryH,
                                       CSLConstList) ;
OGRGeometryH  OGR_G_Normalize(OGRGeometryH) ;
int  OGR_G_IsSimple(OGRGeometryH);
int  OGR_G_IsRing(OGRGeometryH);

OGRGeometryH  OGR_G_Polygonize(OGRGeometryH) ;

/*! @cond Doxygen_Suppress */
/* backward compatibility (non-standard methods) */
int  OGR_G_Intersect(OGRGeometryH, OGRGeometryH)
//    CPL_WARN_DEPRECATED("Non standard method. Use OGR_G_Intersects() instead");
;
int  OGR_G_Equal(OGRGeometryH, OGRGeometryH)
//    CPL_WARN_DEPRECATED("Non standard method. Use OGR_G_Equals() instead")
;
OGRGeometryH  OGR_G_SymmetricDifference(OGRGeometryH, OGRGeometryH)
//    CPL_WARN_DEPRECATED(
  //      "Non standard method. Use OGR_G_SymDifference() instead")
;
double  OGR_G_GetArea(OGRGeometryH)
//    CPL_WARN_DEPRECATED("Non standard method. Use OGR_G_Area() instead");
;
OGRGeometryH  OGR_G_GetBoundary(OGRGeometryH)
//    CPL_WARN_DEPRECATED("Non standard method. Use OGR_G_Boundary() instead")
;
int  OGR_G_GetPointCount(OGRGeometryH);
int  OGR_G_GetPoints(OGRGeometryH hGeom, void *pabyX, int nXStride,
                            void *pabyY, int nYStride, void *pabyZ,
                            int nZStride);
int  OGR_G_GetPointsZM(OGRGeometryH hGeom, void *pabyX, int nXStride,
                              void *pabyY, int nYStride, void *pabyZ,
                              int nZStride, void *pabyM, int nMStride);
double  OGR_G_GetX(OGRGeometryH, int);
double  OGR_G_GetY(OGRGeometryH, int);
double  OGR_G_GetZ(OGRGeometryH, int);
double  OGR_G_GetM(OGRGeometryH, int);
void  OGR_G_GetPoint(OGRGeometryH, int iPoint, double *, double *,
                            double *);
void  OGR_G_GetPointZM(OGRGeometryH, int iPoint, double *, double *,
                              double *, double *);
void  OGR_G_SetPointCount(OGRGeometryH hGeom, int nNewPointCount);
void  OGR_G_SetPoint(OGRGeometryH, int iPoint, double, double, double);
void  OGR_G_SetPoint_2D(OGRGeometryH, int iPoint, double, double);
void  OGR_G_SetPointM(OGRGeometryH, int iPoint, double, double, double);
void  OGR_G_SetPointZM(OGRGeometryH, int iPoint, double, double, double,
                              double);
void  OGR_G_AddPoint(OGRGeometryH, double, double, double);
void  OGR_G_AddPoint_2D(OGRGeometryH, double, double);
void  OGR_G_AddPointM(OGRGeometryH, double, double, double);
void  OGR_G_AddPointZM(OGRGeometryH, double, double, double, double);
void  OGR_G_SetPoints(OGRGeometryH hGeom, int nPointsIn,
                             const void *pabyX, int nXStride, const void *pabyY,
                             int nYStride, const void *pabyZ, int nZStride);
void  OGR_G_SetPointsZM(OGRGeometryH hGeom, int nPointsIn,
                               const void *pabyX, int nXStride,
                               const void *pabyY, int nYStride,
                               const void *pabyZ, int nZStride,
                               const void *pabyM, int nMStride);
void  OGR_G_SwapXY(OGRGeometryH hGeom);

/* Methods for getting/setting rings and members collections */

int  OGR_G_GetGeometryCount(OGRGeometryH);
OGRGeometryH  OGR_G_GetGeometryRef(OGRGeometryH, int);
OGRErr  OGR_G_AddGeometry(OGRGeometryH, OGRGeometryH);
OGRErr  OGR_G_AddGeometryDirectly(OGRGeometryH, OGRGeometryH);
OGRErr  OGR_G_RemoveGeometry(OGRGeometryH, int, int);

int  OGR_G_HasCurveGeometry(OGRGeometryH, int bLookForNonLinear);
OGRGeometryH 
OGR_G_GetLinearGeometry(OGRGeometryH hGeom, double dfMaxAngleStepSizeDegrees,
                        char **papszOptions) ;
OGRGeometryH  OGR_G_GetCurveGeometry(
    OGRGeometryH hGeom, char **papszOptions) ;

OGRGeometryH  OGRBuildPolygonFromEdges(
    OGRGeometryH hLinesAsCollection, int bBestEffort, int bAutoClose,
    double dfTolerance, OGRErr *peErr) ;

/*! @cond Doxygen_Suppress */
OGRErr 
OGRSetGenerate_DB2_V72_BYTE_ORDER(int bGenerate_DB2_V72_BYTE_ORDER);

int  OGRGetGenerate_DB2_V72_BYTE_ORDER(void);
/*! @endcond */

void  OGRSetNonLinearGeometriesEnabledFlag(int bFlag);
int  OGRGetNonLinearGeometriesEnabledFlag(void);

/** Opaque type for a prepared geometry */
typedef struct _OGRPreparedGeometry *OGRPreparedGeometryH;

int  OGRHasPreparedGeometrySupport(void);
OGRPreparedGeometryH  OGRCreatePreparedGeometry(OGRGeometryH hGeom);
void  OGRDestroyPreparedGeometry(OGRPreparedGeometryH hPreparedGeom);
int  OGRPreparedGeometryIntersects(OGRPreparedGeometryH hPreparedGeom,
                                          OGRGeometryH hOtherGeom);
int  OGRPreparedGeometryContains(OGRPreparedGeometryH hPreparedGeom,
                                        OGRGeometryH hOtherGeom);

/* -------------------------------------------------------------------- */
/*      Feature related (ogr_feature.h)                                 */
/* -------------------------------------------------------------------- */

#ifndef DEFINE_OGRFeatureH
/*! @cond Doxygen_Suppress */
#define DEFINE_OGRFeatureH
/*! @endcond */
#ifdef DEBUG
typedef struct OGRFieldDefnHS *OGRFieldDefnH;
typedef struct OGRFeatureDefnHS *OGRFeatureDefnH;
typedef struct OGRFeatureHS *OGRFeatureH;
typedef struct OGRStyleTableHS *OGRStyleTableH;
#else
/** Opaque type for a field definition (OGRFieldDefn) */
typedef void *OGRFieldDefnH;
/** Opaque type for a feature definition (OGRFeatureDefn) */
typedef void *OGRFeatureDefnH;
/** Opaque type for a feature (OGRFeature) */
typedef void *OGRFeatureH;
/** Opaque type for a style table (OGRStyleTable) */
typedef void *OGRStyleTableH;
#endif
/** Opaque type for a geometry field definition (OGRGeomFieldDefn) */
typedef struct OGRGeomFieldDefnHS *OGRGeomFieldDefnH;

/** Opaque type for a field domain definition (OGRFieldDomain) */
typedef struct OGRFieldDomainHS *OGRFieldDomainH;
#endif /* DEFINE_OGRFeatureH */

/* OGRFieldDefn */

OGRFieldDefnH  OGR_Fld_Create(const char *,
                                     OGRFieldType) ;
void  OGR_Fld_Destroy(OGRFieldDefnH);

void  OGR_Fld_SetName(OGRFieldDefnH, const char *);
const char  *OGR_Fld_GetNameRef(OGRFieldDefnH);
void  OGR_Fld_SetAlternativeName(OGRFieldDefnH, const char *);
const char  *OGR_Fld_GetAlternativeNameRef(OGRFieldDefnH);
OGRFieldType  OGR_Fld_GetType(OGRFieldDefnH);
void  OGR_Fld_SetType(OGRFieldDefnH, OGRFieldType);
OGRFieldSubType  OGR_Fld_GetSubType(OGRFieldDefnH);
void  OGR_Fld_SetSubType(OGRFieldDefnH, OGRFieldSubType);
OGRJustification  OGR_Fld_GetJustify(OGRFieldDefnH);
void  OGR_Fld_SetJustify(OGRFieldDefnH, OGRJustification);
int  OGR_Fld_GetWidth(OGRFieldDefnH);
void  OGR_Fld_SetWidth(OGRFieldDefnH, int);
int  OGR_Fld_GetPrecision(OGRFieldDefnH);
void  OGR_Fld_SetPrecision(OGRFieldDefnH, int);
int  OGR_Fld_GetTZFlag(OGRFieldDefnH);
void  OGR_Fld_SetTZFlag(OGRFieldDefnH, int);
void  OGR_Fld_Set(OGRFieldDefnH, const char *, OGRFieldType, int, int,
                         OGRJustification);
int  OGR_Fld_IsIgnored(OGRFieldDefnH hDefn);
void  OGR_Fld_SetIgnored(OGRFieldDefnH hDefn, int);
int  OGR_Fld_IsNullable(OGRFieldDefnH hDefn);
void  OGR_Fld_SetNullable(OGRFieldDefnH hDefn, int);
int  OGR_Fld_IsUnique(OGRFieldDefnH hDefn);
void  OGR_Fld_SetUnique(OGRFieldDefnH hDefn, int);
const char  *OGR_Fld_GetDefault(OGRFieldDefnH hDefn);
void  OGR_Fld_SetDefault(OGRFieldDefnH hDefn, const char *);
int  OGR_Fld_IsDefaultDriverSpecific(OGRFieldDefnH hDefn);
const char  *OGR_Fld_GetDomainName(OGRFieldDefnH hDefn);
void  OGR_Fld_SetDomainName(OGRFieldDefnH hDefn, const char *);
const char  *OGR_Fld_GetComment(OGRFieldDefnH hDefn);
void  OGR_Fld_SetComment(OGRFieldDefnH hDefn, const char *);

const char  *OGR_GetFieldTypeName(OGRFieldType);
const char  *OGR_GetFieldSubTypeName(OGRFieldSubType);
int  OGR_AreTypeSubTypeCompatible(OGRFieldType eType,
                                         OGRFieldSubType eSubType);

/* OGRGeomFieldDefnH */

OGRGeomFieldDefnH  OGR_GFld_Create(const char *, OGRwkbGeometryType)
    ;
void  OGR_GFld_Destroy(OGRGeomFieldDefnH);

void  OGR_GFld_SetName(OGRGeomFieldDefnH, const char *);
const char  *OGR_GFld_GetNameRef(OGRGeomFieldDefnH);

OGRwkbGeometryType  OGR_GFld_GetType(OGRGeomFieldDefnH);
void  OGR_GFld_SetType(OGRGeomFieldDefnH, OGRwkbGeometryType);

OGRSpatialReferenceH  OGR_GFld_GetSpatialRef(OGRGeomFieldDefnH);
void  OGR_GFld_SetSpatialRef(OGRGeomFieldDefnH,
                                    OGRSpatialReferenceH hSRS);

int  OGR_GFld_IsNullable(OGRGeomFieldDefnH hDefn);
void  OGR_GFld_SetNullable(OGRGeomFieldDefnH hDefn, int);

int  OGR_GFld_IsIgnored(OGRGeomFieldDefnH hDefn);
void  OGR_GFld_SetIgnored(OGRGeomFieldDefnH hDefn, int);

/* OGRFeatureDefn */

OGRFeatureDefnH  OGR_FD_Create(const char *) ;
void  OGR_FD_Destroy(OGRFeatureDefnH);
void  OGR_FD_Release(OGRFeatureDefnH);
const char  *OGR_FD_GetName(OGRFeatureDefnH);
int  OGR_FD_GetFieldCount(OGRFeatureDefnH);
OGRFieldDefnH  OGR_FD_GetFieldDefn(OGRFeatureDefnH, int);
int  OGR_FD_GetFieldIndex(OGRFeatureDefnH, const char *);
void  OGR_FD_AddFieldDefn(OGRFeatureDefnH, OGRFieldDefnH);
OGRErr  OGR_FD_DeleteFieldDefn(OGRFeatureDefnH hDefn, int iField);
OGRErr  OGR_FD_ReorderFieldDefns(OGRFeatureDefnH hDefn,
                                        const int *panMap);
OGRwkbGeometryType  OGR_FD_GetGeomType(OGRFeatureDefnH);
void  OGR_FD_SetGeomType(OGRFeatureDefnH, OGRwkbGeometryType);
int  OGR_FD_IsGeometryIgnored(OGRFeatureDefnH);
void  OGR_FD_SetGeometryIgnored(OGRFeatureDefnH, int);
int  OGR_FD_IsStyleIgnored(OGRFeatureDefnH);
void  OGR_FD_SetStyleIgnored(OGRFeatureDefnH, int);
int  OGR_FD_Reference(OGRFeatureDefnH);
int  OGR_FD_Dereference(OGRFeatureDefnH);
int  OGR_FD_GetReferenceCount(OGRFeatureDefnH);

int  OGR_FD_GetGeomFieldCount(OGRFeatureDefnH hFDefn);
OGRGeomFieldDefnH  OGR_FD_GetGeomFieldDefn(OGRFeatureDefnH hFDefn,
                                                  int i);
int  OGR_FD_GetGeomFieldIndex(OGRFeatureDefnH hFDefn,
                                     const char *pszName);

void  OGR_FD_AddGeomFieldDefn(OGRFeatureDefnH hFDefn,
                                     OGRGeomFieldDefnH hGFldDefn);
OGRErr  OGR_FD_DeleteGeomFieldDefn(OGRFeatureDefnH hFDefn,
                                          int iGeomField);
int  OGR_FD_IsSame(OGRFeatureDefnH hFDefn, OGRFeatureDefnH hOtherFDefn);
/* OGRFeature */

OGRFeatureH  OGR_F_Create(OGRFeatureDefnH) ;
void  OGR_F_Destroy(OGRFeatureH);
OGRFeatureDefnH  OGR_F_GetDefnRef(OGRFeatureH);

OGRErr  OGR_F_SetGeometryDirectly(OGRFeatureH, OGRGeometryH);
OGRErr  OGR_F_SetGeometry(OGRFeatureH, OGRGeometryH);
OGRGeometryH  OGR_F_GetGeometryRef(OGRFeatureH);
OGRGeometryH  OGR_F_StealGeometry(OGRFeatureH) ;
OGRGeometryH  OGR_F_StealGeometryEx(OGRFeatureH, int iGeomField)
    ;
OGRFeatureH  OGR_F_Clone(OGRFeatureH) ;
int  OGR_F_Equal(OGRFeatureH, OGRFeatureH);

int  OGR_F_GetFieldCount(OGRFeatureH);
OGRFieldDefnH  OGR_F_GetFieldDefnRef(OGRFeatureH, int);
int  OGR_F_GetFieldIndex(OGRFeatureH, const char *);

int  OGR_F_IsFieldSet(OGRFeatureH, int);
void  OGR_F_UnsetField(OGRFeatureH, int);

int  OGR_F_IsFieldNull(OGRFeatureH, int);
int  OGR_F_IsFieldSetAndNotNull(OGRFeatureH, int);
void  OGR_F_SetFieldNull(OGRFeatureH, int);

OGRField  *OGR_F_GetRawFieldRef(OGRFeatureH, int);

int  OGR_RawField_IsUnset(const OGRField *);
int  OGR_RawField_IsNull(const OGRField *);
void  OGR_RawField_SetUnset(OGRField *);
void  OGR_RawField_SetNull(OGRField *);

int  OGR_F_GetFieldAsInteger(OGRFeatureH, int);
GIntBig  OGR_F_GetFieldAsInteger64(OGRFeatureH, int);
double  OGR_F_GetFieldAsDouble(OGRFeatureH, int);
const char  *OGR_F_GetFieldAsString(OGRFeatureH, int);
const char  *OGR_F_GetFieldAsISO8601DateTime(OGRFeatureH, int,
                                                    CSLConstList);
const int  *OGR_F_GetFieldAsIntegerList(OGRFeatureH, int, int *);
const GIntBig  *OGR_F_GetFieldAsInteger64List(OGRFeatureH, int, int *);
const double  *OGR_F_GetFieldAsDoubleList(OGRFeatureH, int, int *);
char  **OGR_F_GetFieldAsStringList(OGRFeatureH, int);
GByte  *OGR_F_GetFieldAsBinary(OGRFeatureH, int, int *);
int  OGR_F_GetFieldAsDateTime(OGRFeatureH, int, int *, int *, int *,
                                     int *, int *, int *, int *);
int  OGR_F_GetFieldAsDateTimeEx(OGRFeatureH hFeat, int iField,
                                       int *pnYear, int *pnMonth, int *pnDay,
                                       int *pnHour, int *pnMinute,
                                       float *pfSecond, int *pnTZFlag);

void  OGR_F_SetFieldInteger(OGRFeatureH, int, int);
void  OGR_F_SetFieldInteger64(OGRFeatureH, int, GIntBig);
void  OGR_F_SetFieldDouble(OGRFeatureH, int, double);
void  OGR_F_SetFieldString(OGRFeatureH, int, const char *);
void  OGR_F_SetFieldIntegerList(OGRFeatureH, int, int, const int *);
void  OGR_F_SetFieldInteger64List(OGRFeatureH, int, int,
                                         const GIntBig *);
void  OGR_F_SetFieldDoubleList(OGRFeatureH, int, int, const double *);
void  OGR_F_SetFieldStringList(OGRFeatureH, int, CSLConstList);
void  OGR_F_SetFieldRaw(OGRFeatureH, int, const OGRField *);
void  OGR_F_SetFieldBinary(OGRFeatureH, int, int, const void *);
void  OGR_F_SetFieldDateTime(OGRFeatureH, int, int, int, int, int, int,
                                    int, int);
void  OGR_F_SetFieldDateTimeEx(OGRFeatureH, int, int, int, int, int, int,
                                      float, int);

int  OGR_F_GetGeomFieldCount(OGRFeatureH hFeat);
OGRGeomFieldDefnH  OGR_F_GetGeomFieldDefnRef(OGRFeatureH hFeat,
                                                    int iField);
int  OGR_F_GetGeomFieldIndex(OGRFeatureH hFeat, const char *pszName);

OGRGeometryH  OGR_F_GetGeomFieldRef(OGRFeatureH hFeat, int iField);
OGRErr  OGR_F_SetGeomFieldDirectly(OGRFeatureH hFeat, int iField,
                                          OGRGeometryH hGeom);
OGRErr  OGR_F_SetGeomField(OGRFeatureH hFeat, int iField,
                                  OGRGeometryH hGeom);

GIntBig  OGR_F_GetFID(OGRFeatureH);
OGRErr  OGR_F_SetFID(OGRFeatureH, GIntBig);
void  OGR_F_DumpReadable(OGRFeatureH, FILE *);
char  *OGR_F_DumpReadableAsString(OGRFeatureH,
                                         CSLConstList) ;
OGRErr  OGR_F_SetFrom(OGRFeatureH, OGRFeatureH, int);
OGRErr  OGR_F_SetFromWithMap(OGRFeatureH, OGRFeatureH, int, const int *);

const char  *OGR_F_GetStyleString(OGRFeatureH);
void  OGR_F_SetStyleString(OGRFeatureH, const char *);
void  OGR_F_SetStyleStringDirectly(OGRFeatureH, char *);
/** Return style table */
OGRStyleTableH  OGR_F_GetStyleTable(OGRFeatureH);
/** Set style table and take ownership */
void  OGR_F_SetStyleTableDirectly(OGRFeatureH, OGRStyleTableH);
/** Set style table */
void  OGR_F_SetStyleTable(OGRFeatureH, OGRStyleTableH);

const char  *OGR_F_GetNativeData(OGRFeatureH);
void  OGR_F_SetNativeData(OGRFeatureH, const char *);
const char  *OGR_F_GetNativeMediaType(OGRFeatureH);
void  OGR_F_SetNativeMediaType(OGRFeatureH, const char *);

void  OGR_F_FillUnsetWithDefault(OGRFeatureH hFeat, int bNotNullableOnly,
                                        char **papszOptions);
int  OGR_F_Validate(OGRFeatureH, int nValidateFlags, int bEmitError);

/* OGRFieldDomain */

void  OGR_FldDomain_Destroy(OGRFieldDomainH);
const char  *OGR_FldDomain_GetName(OGRFieldDomainH);
const char  *OGR_FldDomain_GetDescription(OGRFieldDomainH);
OGRFieldDomainType  OGR_FldDomain_GetDomainType(OGRFieldDomainH);
OGRFieldType  OGR_FldDomain_GetFieldType(OGRFieldDomainH);
OGRFieldSubType  OGR_FldDomain_GetFieldSubType(OGRFieldDomainH);
OGRFieldDomainSplitPolicy  OGR_FldDomain_GetSplitPolicy(OGRFieldDomainH);
void  OGR_FldDomain_SetSplitPolicy(OGRFieldDomainH,
                                          OGRFieldDomainSplitPolicy);
OGRFieldDomainMergePolicy  OGR_FldDomain_GetMergePolicy(OGRFieldDomainH);
void  OGR_FldDomain_SetMergePolicy(OGRFieldDomainH,
                                          OGRFieldDomainMergePolicy);

OGRFieldDomainH  OGR_CodedFldDomain_Create(
    const char *pszName, const char *pszDescription, OGRFieldType eFieldType,
    OGRFieldSubType eFieldSubType, const OGRCodedValue *enumeration);
const OGRCodedValue  *OGR_CodedFldDomain_GetEnumeration(OGRFieldDomainH);

OGRFieldDomainH  OGR_RangeFldDomain_Create(
    const char *pszName, const char *pszDescription, OGRFieldType eFieldType,
    OGRFieldSubType eFieldSubType, const OGRField *psMin, bool bMinIsInclusive,
    const OGRField *psMax, bool bMaxIsInclusive);
const OGRField  *OGR_RangeFldDomain_GetMin(OGRFieldDomainH,
                                                  bool *pbIsInclusiveOut);
const OGRField  *OGR_RangeFldDomain_GetMax(OGRFieldDomainH,
                                                  bool *pbIsInclusiveOut);

OGRFieldDomainH  OGR_GlobFldDomain_Create(const char *pszName,
                                                 const char *pszDescription,
                                                 OGRFieldType eFieldType,
                                                 OGRFieldSubType eFieldSubType,
                                                 const char *pszGlob);
const char  *OGR_GlobFldDomain_GetGlob(OGRFieldDomainH);

/* -------------------------------------------------------------------- */
/*      ogrsf_frmts.h                                                   */
/* -------------------------------------------------------------------- */

#ifdef DEBUG
typedef struct OGRLayerHS *OGRLayerH;
typedef struct OGRDataSourceHS *OGRDataSourceH;
typedef struct OGRDriverHS *OGRSFDriverH;
#else
/** Opaque type for a layer (OGRLayer) */
typedef void *OGRLayerH;
/** Opaque type for a OGR datasource (OGRDataSource) */
typedef void *OGRDataSourceH;
/** Opaque type for a OGR driver (OGRSFDriver) */
typedef void *OGRSFDriverH;
#endif

/* OGRLayer */

const char  *OGR_L_GetName(OGRLayerH);
OGRwkbGeometryType  OGR_L_GetGeomType(OGRLayerH);

/** Result item of OGR_L_GetGeometryTypes */
typedef struct
{
    /** Geometry type */
    OGRwkbGeometryType eGeomType;
    /** Number of geometries of type eGeomType */
    int64_t nCount;
} OGRGeometryTypeCounter;

/** Flag for OGR_L_GetGeometryTypes() indicating that
 * OGRGeometryTypeCounter::nCount value is not needed */
#define OGR_GGT_COUNT_NOT_NEEDED 0x1
/** Flag for OGR_L_GetGeometryTypes() indicating that iteration might stop as
 * sooon as 2 distinct geometry types are found. */
#define OGR_GGT_STOP_IF_MIXED 0x2
/** Flag for OGR_L_GetGeometryTypes() indicating that a GeometryCollectionZ
 * whose first subgeometry is a TinZ should be reported as TinZ */
#define OGR_GGT_GEOMCOLLECTIONZ_TINZ 0x4
OGRGeometryTypeCounter  *
OGR_L_GetGeometryTypes(OGRLayerH hLayer, int iGeomField, int nFlags,
                       int *pnEntryCount, GDALProgressFunc pfnProgress,
                       void *pProgressData);

OGRGeometryH  OGR_L_GetSpatialFilter(OGRLayerH);
void  OGR_L_SetSpatialFilter(OGRLayerH, OGRGeometryH);
void  OGR_L_SetSpatialFilterRect(OGRLayerH, double, double, double,
                                        double);
void  OGR_L_SetSpatialFilterEx(OGRLayerH, int iGeomField,
                                      OGRGeometryH hGeom);
void  OGR_L_SetSpatialFilterRectEx(OGRLayerH, int iGeomField,
                                          double dfMinX, double dfMinY,
                                          double dfMaxX, double dfMaxY);
OGRErr  OGR_L_SetAttributeFilter(OGRLayerH, const char *);
void  OGR_L_ResetReading(OGRLayerH);
OGRFeatureH  OGR_L_GetNextFeature(OGRLayerH) ;

struct ArrowArrayStream;

bool  OGR_L_GetArrowStream(OGRLayerH hLayer,
                                  struct ArrowArrayStream *out_stream,
                                  char **papszOptions);

/** Data type for a Arrow C schema. Include ogr_recordbatch.h to get the
 * definition. */
struct ArrowSchema;

bool  OGR_L_IsArrowSchemaSupported(OGRLayerH hLayer,
                                          const struct ArrowSchema *schema,
                                          char **papszOptions,
                                          char **ppszErrorMsg);
bool  OGR_L_CreateFieldFromArrowSchema(OGRLayerH hLayer,
                                              const struct ArrowSchema *schema,
                                              char **papszOptions);

/** Data type for a Arrow C array. Include ogr_recordbatch.h to get the
 * definition. */
struct ArrowArray;

bool  OGR_L_WriteArrowBatch(OGRLayerH hLayer,
                                   const struct ArrowSchema *schema,
                                   struct ArrowArray *array,
                                   char **papszOptions);

OGRErr  OGR_L_SetNextByIndex(OGRLayerH, GIntBig);
OGRFeatureH  OGR_L_GetFeature(OGRLayerH, GIntBig) ;
OGRErr  OGR_L_SetFeature(OGRLayerH, OGRFeatureH) ;
OGRErr  OGR_L_CreateFeature(OGRLayerH,
                                   OGRFeatureH) ;
OGRErr  OGR_L_DeleteFeature(OGRLayerH, GIntBig) ;
OGRErr  OGR_L_UpsertFeature(OGRLayerH,
                                   OGRFeatureH) ;
OGRErr 
OGR_L_UpdateFeature(OGRLayerH, OGRFeatureH, int nUpdatedFieldsCount,
                    const int *panUpdatedFieldsIdx, int nUpdatedGeomFieldsCount,
                    const int *panUpdatedGeomFieldsIdx,
                    bool bUpdateStyleString) ;
OGRFeatureDefnH  OGR_L_GetLayerDefn(OGRLayerH);
OGRSpatialReferenceH  OGR_L_GetSpatialRef(OGRLayerH);
OGRSpatialReferenceH  *
OGR_L_GetSupportedSRSList(OGRLayerH hLayer, int iGeomField, int *pnCount);
OGRErr  OGR_L_SetActiveSRS(OGRLayerH hLayer, int iGeomField,
                                  OGRSpatialReferenceH hSRS);
int  OGR_L_FindFieldIndex(OGRLayerH, const char *, int bExactMatch);
GIntBig  OGR_L_GetFeatureCount(OGRLayerH, int);
OGRErr  OGR_L_GetExtent(OGRLayerH, OGREnvelope *, int);
OGRErr  OGR_L_GetExtentEx(OGRLayerH, int iGeomField,
                                 OGREnvelope *psExtent, int bForce);
int  OGR_L_TestCapability(OGRLayerH, const char *);
OGRErr  OGR_L_CreateField(OGRLayerH, OGRFieldDefnH, int);
OGRErr  OGR_L_CreateGeomField(OGRLayerH hLayer,
                                     OGRGeomFieldDefnH hFieldDefn, int bForce);
OGRErr  OGR_L_DeleteField(OGRLayerH, int iField);
OGRErr  OGR_L_ReorderFields(OGRLayerH, int *panMap);
OGRErr  OGR_L_ReorderField(OGRLayerH, int iOldFieldPos,
                                  int iNewFieldPos);
OGRErr  OGR_L_AlterFieldDefn(OGRLayerH, int iField,
                                    OGRFieldDefnH hNewFieldDefn, int nFlags);
OGRErr  OGR_L_AlterGeomFieldDefn(OGRLayerH, int iField,
                                        OGRGeomFieldDefnH hNewGeomFieldDefn,
                                        int nFlags);
OGRErr  OGR_L_StartTransaction(OGRLayerH) ;
OGRErr  OGR_L_CommitTransaction(OGRLayerH) ;
OGRErr  OGR_L_RollbackTransaction(OGRLayerH);
OGRErr  OGR_L_Rename(OGRLayerH hLayer, const char *pszNewName);

/*! @cond Doxygen_Suppress */
int  OGR_L_Reference(OGRLayerH);
int  OGR_L_Dereference(OGRLayerH);
int  OGR_L_GetRefCount(OGRLayerH);
/*! @endcond */
OGRErr  OGR_L_SyncToDisk(OGRLayerH);
/*! @cond Doxygen_Suppress */
GIntBig  OGR_L_GetFeaturesRead(OGRLayerH);
/*! @endcond */
const char  *OGR_L_GetFIDColumn(OGRLayerH);
const char  *OGR_L_GetGeometryColumn(OGRLayerH);
/** Get style table */
OGRStyleTableH  OGR_L_GetStyleTable(OGRLayerH);
/** Set style table (and take ownership) */
void  OGR_L_SetStyleTableDirectly(OGRLayerH, OGRStyleTableH);
/** Set style table */
void  OGR_L_SetStyleTable(OGRLayerH, OGRStyleTableH);
OGRErr  OGR_L_SetIgnoredFields(OGRLayerH, const char **);
OGRErr  OGR_L_Intersection(OGRLayerH, OGRLayerH, OGRLayerH, char **,
                                  GDALProgressFunc, void *);
OGRErr  OGR_L_Union(OGRLayerH, OGRLayerH, OGRLayerH, char **,
                           GDALProgressFunc, void *);
OGRErr  OGR_L_SymDifference(OGRLayerH, OGRLayerH, OGRLayerH, char **,
                                   GDALProgressFunc, void *);
OGRErr  OGR_L_Identity(OGRLayerH, OGRLayerH, OGRLayerH, char **,
                              GDALProgressFunc, void *);
OGRErr  OGR_L_Update(OGRLayerH, OGRLayerH, OGRLayerH, char **,
                            GDALProgressFunc, void *);
OGRErr  OGR_L_Clip(OGRLayerH, OGRLayerH, OGRLayerH, char **,
                          GDALProgressFunc, void *);
OGRErr  OGR_L_Erase(OGRLayerH, OGRLayerH, OGRLayerH, char **,
                           GDALProgressFunc, void *);

/* OGRDataSource */

void  OGR_DS_Destroy(OGRDataSourceH);
const char  *OGR_DS_GetName(OGRDataSourceH);
int  OGR_DS_GetLayerCount(OGRDataSourceH);
OGRLayerH  OGR_DS_GetLayer(OGRDataSourceH, int);
OGRLayerH  OGR_DS_GetLayerByName(OGRDataSourceH, const char *);
OGRErr  OGR_DS_DeleteLayer(OGRDataSourceH, int);
OGRSFDriverH  OGR_DS_GetDriver(OGRDataSourceH);
OGRLayerH  OGR_DS_CreateLayer(OGRDataSourceH, const char *,
                                     OGRSpatialReferenceH, OGRwkbGeometryType,
                                     char **);
OGRLayerH  OGR_DS_CopyLayer(OGRDataSourceH, OGRLayerH, const char *,
                                   char **);
int  OGR_DS_TestCapability(OGRDataSourceH, const char *);
OGRLayerH  OGR_DS_ExecuteSQL(OGRDataSourceH, const char *, OGRGeometryH,
                                    const char *);
void  OGR_DS_ReleaseResultSet(OGRDataSourceH, OGRLayerH);
/*! @cond Doxygen_Suppress */
int  OGR_DS_Reference(OGRDataSourceH);
int  OGR_DS_Dereference(OGRDataSourceH);
int  OGR_DS_GetRefCount(OGRDataSourceH);
int  OGR_DS_GetSummaryRefCount(OGRDataSourceH);
/*! @endcond */
/** Flush pending changes to disk. See GDALDataset::FlushCache() */
OGRErr  OGR_DS_SyncToDisk(OGRDataSourceH);
/** Get style table */
OGRStyleTableH  OGR_DS_GetStyleTable(OGRDataSourceH);
/** Set style table (and take ownership) */
void  OGR_DS_SetStyleTableDirectly(OGRDataSourceH, OGRStyleTableH);
/** Set style table */
void  OGR_DS_SetStyleTable(OGRDataSourceH, OGRStyleTableH);

/* OGRSFDriver */

const char  *OGR_Dr_GetName(OGRSFDriverH);
OGRDataSourceH  OGR_Dr_Open(OGRSFDriverH, const char *,
                                   int) ;
int  OGR_Dr_TestCapability(OGRSFDriverH, const char *);
OGRDataSourceH  OGR_Dr_CreateDataSource(OGRSFDriverH, const char *,
                                               char **) ;
OGRDataSourceH  OGR_Dr_CopyDataSource(OGRSFDriverH, OGRDataSourceH,
                                             const char *,
                                             char **) ;
OGRErr  OGR_Dr_DeleteDataSource(OGRSFDriverH, const char *);

/* OGRSFDriverRegistrar */

OGRDataSourceH  OGROpen(const char *, int,
                               OGRSFDriverH *) ;
OGRDataSourceH  OGROpenShared(const char *, int,
                                     OGRSFDriverH *) ;
OGRErr  OGRReleaseDataSource(OGRDataSourceH);
/*! @cond Doxygen_Suppress */
void  OGRRegisterDriver(OGRSFDriverH);
void  OGRDeregisterDriver(OGRSFDriverH);
/*! @endcond */
int  OGRGetDriverCount(void);
OGRSFDriverH  OGRGetDriver(int);
OGRSFDriverH  OGRGetDriverByName(const char *);
/*! @cond Doxygen_Suppress */
int  OGRGetOpenDSCount(void);
OGRDataSourceH  OGRGetOpenDS(int iDS);
/*! @endcond */

void  OGRRegisterAll(void);

/** Clean-up all drivers (including raster ones starting with GDAL 2.0.
 * See GDALDestroyDriverManager() */
void  OGRCleanupAll(void);

/* -------------------------------------------------------------------- */
/*      ogrsf_featurestyle.h                                            */
/* -------------------------------------------------------------------- */

#ifdef DEBUG
typedef struct OGRStyleMgrHS *OGRStyleMgrH;
typedef struct OGRStyleToolHS *OGRStyleToolH;
#else
/** Style manager opaque type */
typedef void *OGRStyleMgrH;
/** Style tool opaque type */
typedef void *OGRStyleToolH;
#endif

/* OGRStyleMgr */

OGRStyleMgrH  OGR_SM_Create(OGRStyleTableH hStyleTable)
    ;
void  OGR_SM_Destroy(OGRStyleMgrH hSM);

const char  *OGR_SM_InitFromFeature(OGRStyleMgrH hSM, OGRFeatureH hFeat);
int  OGR_SM_InitStyleString(OGRStyleMgrH hSM,
                                   const char *pszStyleString);
int  OGR_SM_GetPartCount(OGRStyleMgrH hSM, const char *pszStyleString);
OGRStyleToolH  OGR_SM_GetPart(OGRStyleMgrH hSM, int nPartId,
                                     const char *pszStyleString);
int  OGR_SM_AddPart(OGRStyleMgrH hSM, OGRStyleToolH hST);
int  OGR_SM_AddStyle(OGRStyleMgrH hSM, const char *pszStyleName,
                            const char *pszStyleString);

/* OGRStyleTool */

OGRStyleToolH  OGR_ST_Create(OGRSTClassId eClassId)
    ;
void  OGR_ST_Destroy(OGRStyleToolH hST);

OGRSTClassId  OGR_ST_GetType(OGRStyleToolH hST);

OGRSTUnitId  OGR_ST_GetUnit(OGRStyleToolH hST);
void  OGR_ST_SetUnit(OGRStyleToolH hST, OGRSTUnitId eUnit,
                            double dfGroundPaperScale);

const char  *OGR_ST_GetParamStr(OGRStyleToolH hST, int eParam,
                                       int *bValueIsNull);
int  OGR_ST_GetParamNum(OGRStyleToolH hST, int eParam,
                               int *bValueIsNull);
double  OGR_ST_GetParamDbl(OGRStyleToolH hST, int eParam,
                                  int *bValueIsNull);
void  OGR_ST_SetParamStr(OGRStyleToolH hST, int eParam,
                                const char *pszValue);
void  OGR_ST_SetParamNum(OGRStyleToolH hST, int eParam, int nValue);
void  OGR_ST_SetParamDbl(OGRStyleToolH hST, int eParam, double dfValue);
const char  *OGR_ST_GetStyleString(OGRStyleToolH hST);

int  OGR_ST_GetRGBFromString(OGRStyleToolH hST, const char *pszColor,
                                    int *pnRed, int *pnGreen, int *pnBlue,
                                    int *pnAlpha);

/* OGRStyleTable */

OGRStyleTableH  OGR_STBL_Create(void) ;
void  OGR_STBL_Destroy(OGRStyleTableH hSTBL);
int  OGR_STBL_AddStyle(OGRStyleTableH hStyleTable, const char *pszName,
                              const char *pszStyleString);
int  OGR_STBL_SaveStyleTable(OGRStyleTableH hStyleTable,
                                    const char *pszFilename);
int  OGR_STBL_LoadStyleTable(OGRStyleTableH hStyleTable,
                                    const char *pszFilename);
const char  *OGR_STBL_Find(OGRStyleTableH hStyleTable,
                                  const char *pszName);
void  OGR_STBL_ResetStyleStringReading(OGRStyleTableH hStyleTable);
const char  *OGR_STBL_GetNextStyle(OGRStyleTableH hStyleTable);
const char  *OGR_STBL_GetLastStyleName(OGRStyleTableH hStyleTable);



#endif /* ndef OGR_API_H_INCLUDED */
