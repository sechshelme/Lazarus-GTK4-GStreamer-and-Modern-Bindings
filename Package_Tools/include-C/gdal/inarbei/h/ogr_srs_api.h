/******************************************************************************
 * $Id$
 *
 * Project:  OpenGIS Simple Features Reference Implementation
 * Purpose:  C API and constant declarations for OGR Spatial References.
 * Author:   Frank Warmerdam, warmerdam@pobox.com
 *
 ******************************************************************************
 * Copyright (c) 2000, Frank Warmerdam
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

#ifndef OGR_SRS_API_H_INCLUDED
#define OGR_SRS_API_H_INCLUDED

#include <stdbool.h>

#ifndef SWIG
#include "ogr_core.h"



/**
 * \file ogr_srs_api.h
 *
 * C spatial reference system services and defines.
 *
 * See also: ogr_spatialref.h
 */

/** Axis orientations (corresponds to CS_AxisOrientationEnum). */
typedef enum
{
    OAO_Other = 0, /**< Other */
    OAO_North = 1, /**< North */
    OAO_South = 2, /**< South */
    OAO_East = 3,  /**< East */
    OAO_West = 4,  /**< West */
    OAO_Up = 5,    /**< Up (to space) */
    OAO_Down = 6   /**< Down (to Earth center) */
} OGRAxisOrientation;

const char  *OSRAxisEnumToName(OGRAxisOrientation eOrientation);

#endif  // ndef SWIG

/* ==================================================================== */
/*      Some standard WKT geographic coordinate systems.                */
/* ==================================================================== */


/* ==================================================================== */
/*      Some "standard" strings.                                        */
/* ==================================================================== */

/** Albers_Conic_Equal_Area projection */
#define SRS_PT_ALBERS_CONIC_EQUAL_AREA "Albers_Conic_Equal_Area"
/** Azimuthal_Equidistant projection */
#define SRS_PT_AZIMUTHAL_EQUIDISTANT "Azimuthal_Equidistant"
/** Cassini_Soldner projection */
#define SRS_PT_CASSINI_SOLDNER "Cassini_Soldner"
/** Cylindrical_Equal_Area projection */
#define SRS_PT_CYLINDRICAL_EQUAL_AREA "Cylindrical_Equal_Area"
/** Cylindrical_Equal_Area projection */
#define SRS_PT_BONNE "Bonne"
/** Eckert_I projection */
#define SRS_PT_ECKERT_I "Eckert_I"
/** Eckert_II projection */
#define SRS_PT_ECKERT_II "Eckert_II"
/** Eckert_III projection */
#define SRS_PT_ECKERT_III "Eckert_III"
/** Eckert_IV projection */
#define SRS_PT_ECKERT_IV "Eckert_IV"
/** Eckert_V projection */
#define SRS_PT_ECKERT_V "Eckert_V"
/** Eckert_VI projection */
#define SRS_PT_ECKERT_VI "Eckert_VI"
/** Equidistant_Conic projection */
#define SRS_PT_EQUIDISTANT_CONIC "Equidistant_Conic"
/** Equirectangular projection */
#define SRS_PT_EQUIRECTANGULAR "Equirectangular"
/** Gall_Stereographic projection */
#define SRS_PT_GALL_STEREOGRAPHIC "Gall_Stereographic"
/** Gauss_Schreiber_Transverse_Mercator projection */
#define SRS_PT_GAUSSSCHREIBERTMERCATOR "Gauss_Schreiber_Transverse_Mercator"
/** Geostationary_Satellite projection */
#define SRS_PT_GEOSTATIONARY_SATELLITE "Geostationary_Satellite"
/** Goode_Homolosine projection */
#define SRS_PT_GOODE_HOMOLOSINE "Goode_Homolosine"
/** Interrupted_Goode_Homolosine projection */
#define SRS_PT_IGH "Interrupted_Goode_Homolosine"
/** Gnomonic projection */
#define SRS_PT_GNOMONIC "Gnomonic"
/** Hotine_Oblique_Mercator_Azimuth_Center projection */
#define SRS_PT_HOTINE_OBLIQUE_MERCATOR_AZIMUTH_CENTER                          \
    "Hotine_Oblique_Mercator_Azimuth_Center"
/** Hotine_Oblique_Mercator projection */
#define SRS_PT_HOTINE_OBLIQUE_MERCATOR "Hotine_Oblique_Mercator"
/** Hotine_Oblique_Mercator_Two_Point_Natural_Origin projection */
#define SRS_PT_HOTINE_OBLIQUE_MERCATOR_TWO_POINT_NATURAL_ORIGIN                \
    "Hotine_Oblique_Mercator_Two_Point_Natural_Origin"
/** Laborde_Oblique_Mercator projection */
#define SRS_PT_LABORDE_OBLIQUE_MERCATOR "Laborde_Oblique_Mercator"
/** Lambert_Conformal_Conic_1SP projection */
#define SRS_PT_LAMBERT_CONFORMAL_CONIC_1SP "Lambert_Conformal_Conic_1SP"
/** Lambert_Conformal_Conic_2SP projection */
#define SRS_PT_LAMBERT_CONFORMAL_CONIC_2SP "Lambert_Conformal_Conic_2SP"
/** Lambert_Conformal_Conic_2SP_Belgium projection */
#define SRS_PT_LAMBERT_CONFORMAL_CONIC_2SP_BELGIUM                             \
    "Lambert_Conformal_Conic_2SP_Belgium"
/** Lambert_Azimuthal_Equal_Area projection */
#define SRS_PT_LAMBERT_AZIMUTHAL_EQUAL_AREA "Lambert_Azimuthal_Equal_Area"
/** Mercator_1SP projection */
#define SRS_PT_MERCATOR_1SP "Mercator_1SP"
/** Mercator_2SP projection */
#define SRS_PT_MERCATOR_2SP "Mercator_2SP"
/** Mercator_Auxiliary_Sphere is used used by ESRI to mean EPSG:3875 */
#define SRS_PT_MERCATOR_AUXILIARY_SPHERE "Mercator_Auxiliary_Sphere"
/** Miller_Cylindrical projection */
#define SRS_PT_MILLER_CYLINDRICAL "Miller_Cylindrical"
/** Mollweide projection */
#define SRS_PT_MOLLWEIDE "Mollweide"
/** New_Zealand_Map_Grid projection */
#define SRS_PT_NEW_ZEALAND_MAP_GRID "New_Zealand_Map_Grid"
/** Oblique_Stereographic projection */
#define SRS_PT_OBLIQUE_STEREOGRAPHIC "Oblique_Stereographic"
/** Orthographic projection */
#define SRS_PT_ORTHOGRAPHIC "Orthographic"
/** Polar_Stereographic projection */
#define SRS_PT_POLAR_STEREOGRAPHIC "Polar_Stereographic"
/** Polyconic projection */
#define SRS_PT_POLYCONIC "Polyconic"
/** Robinson projection */
#define SRS_PT_ROBINSON "Robinson"
/** Sinusoidal projection */
#define SRS_PT_SINUSOIDAL "Sinusoidal"
/** Stereographic projection */
#define SRS_PT_STEREOGRAPHIC "Stereographic"
/** Swiss_Oblique_Cylindrical projection */
#define SRS_PT_SWISS_OBLIQUE_CYLINDRICAL "Swiss_Oblique_Cylindrical"
/** Transverse_Mercator projection */
#define SRS_PT_TRANSVERSE_MERCATOR "Transverse_Mercator"
/** Transverse_Mercator_South_Orientated projection */
#define SRS_PT_TRANSVERSE_MERCATOR_SOUTH_ORIENTED                              \
    "Transverse_Mercator_South_Orientated"

/* special mapinfo variants on Transverse Mercator */
/** Transverse_Mercator_MapInfo_21 projection */
#define SRS_PT_TRANSVERSE_MERCATOR_MI_21 "Transverse_Mercator_MapInfo_21"
/** Transverse_Mercator_MapInfo_22 projection */
#define SRS_PT_TRANSVERSE_MERCATOR_MI_22 "Transverse_Mercator_MapInfo_22"
/** Transverse_Mercator_MapInfo_23 projection */
#define SRS_PT_TRANSVERSE_MERCATOR_MI_23 "Transverse_Mercator_MapInfo_23"
/** Transverse_Mercator_MapInfo_24 projection */
#define SRS_PT_TRANSVERSE_MERCATOR_MI_24 "Transverse_Mercator_MapInfo_24"
/** Transverse_Mercator_MapInfo_25 projection */
#define SRS_PT_TRANSVERSE_MERCATOR_MI_25 "Transverse_Mercator_MapInfo_25"

/** Tunisia_Mining_Grid projection */
#define SRS_PT_TUNISIA_MINING_GRID "Tunisia_Mining_Grid"
/** Two_Point_Equidistant projection */
#define SRS_PT_TWO_POINT_EQUIDISTANT "Two_Point_Equidistant"
/** VanDerGrinten projection */
#define SRS_PT_VANDERGRINTEN "VanDerGrinten"
/** Krovak projection */
#define SRS_PT_KROVAK "Krovak"
/** International_Map_of_the_World_Polyconic projection */
#define SRS_PT_IMW_POLYCONIC "International_Map_of_the_World_Polyconic"
/** Wagner_I projection */
#define SRS_PT_WAGNER_I "Wagner_I"
/** Wagner_II projection */
#define SRS_PT_WAGNER_II "Wagner_II"
/** Wagner_III projection */
#define SRS_PT_WAGNER_III "Wagner_III"
/** Wagner_IV projection */
#define SRS_PT_WAGNER_IV "Wagner_IV"
/** Wagner_V projection */
#define SRS_PT_WAGNER_V "Wagner_V"
/** Wagner_VI projection */
#define SRS_PT_WAGNER_VI "Wagner_VI"
/** Wagner_VII projection */
#define SRS_PT_WAGNER_VII "Wagner_VII"
/** Quadrilateralized_Spherical_Cube projection */
#define SRS_PT_QSC "Quadrilateralized_Spherical_Cube"
/** Aitoff projection */
#define SRS_PT_AITOFF "Aitoff"
/** Winkel_I projection */
#define SRS_PT_WINKEL_I "Winkel_I"
/** Winkel_II projection */
#define SRS_PT_WINKEL_II "Winkel_II"
/** Winkel_Tripel projection */
#define SRS_PT_WINKEL_TRIPEL "Winkel_Tripel"
/** Craster_Parabolic projection */
#define SRS_PT_CRASTER_PARABOLIC "Craster_Parabolic"
/** Loximuthal projection */
#define SRS_PT_LOXIMUTHAL "Loximuthal"
/** Quartic_Authalic projection */
#define SRS_PT_QUARTIC_AUTHALIC "Quartic_Authalic"
/** Spherical_Cross_Track_Height projection */
#define SRS_PT_SCH "Spherical_Cross_Track_Height"

/** central_meridian projection parameter */
#define SRS_PP_CENTRAL_MERIDIAN "central_meridian"
/** scale_factor projection parameter */
#define SRS_PP_SCALE_FACTOR "scale_factor"
/** standard_parallel_1 projection parameter */
#define SRS_PP_STANDARD_PARALLEL_1 "standard_parallel_1"
/** standard_parallel_2 projection parameter */
#define SRS_PP_STANDARD_PARALLEL_2 "standard_parallel_2"
/** pseudo_standard_parallel_1 projection parameter */
#define SRS_PP_PSEUDO_STD_PARALLEL_1 "pseudo_standard_parallel_1"
/** longitude_of_center projection parameter */
#define SRS_PP_LONGITUDE_OF_CENTER "longitude_of_center"
/** latitude_of_center projection parameter */
#define SRS_PP_LATITUDE_OF_CENTER "latitude_of_center"
/** longitude_of_origin projection parameter */
#define SRS_PP_LONGITUDE_OF_ORIGIN "longitude_of_origin"
/** latitude_of_origin projection parameter */
#define SRS_PP_LATITUDE_OF_ORIGIN "latitude_of_origin"
/** false_easting projection parameter */
#define SRS_PP_FALSE_EASTING "false_easting"
/** false_northing projection parameter */
#define SRS_PP_FALSE_NORTHING "false_northing"
/** azimuth projection parameter */
#define SRS_PP_AZIMUTH "azimuth"
/** longitude_of_point_1 projection parameter */
#define SRS_PP_LONGITUDE_OF_POINT_1 "longitude_of_point_1"
/** latitude_of_point_1 projection parameter */
#define SRS_PP_LATITUDE_OF_POINT_1 "latitude_of_point_1"
/** longitude_of_point_2 projection parameter */
#define SRS_PP_LONGITUDE_OF_POINT_2 "longitude_of_point_2"
/** latitude_of_point_2 projection parameter */
#define SRS_PP_LATITUDE_OF_POINT_2 "latitude_of_point_2"
/** longitude_of_point_3 projection parameter */
#define SRS_PP_LONGITUDE_OF_POINT_3 "longitude_of_point_3"
/** latitude_of_point_3 projection parameter */
#define SRS_PP_LATITUDE_OF_POINT_3 "latitude_of_point_3"
/** rectified_grid_angle projection parameter */
#define SRS_PP_RECTIFIED_GRID_ANGLE "rectified_grid_angle"
/** landsat_number projection parameter */
#define SRS_PP_LANDSAT_NUMBER "landsat_number"
/** path_number projection parameter */
#define SRS_PP_PATH_NUMBER "path_number"
/** perspective_point_height projection parameter */
#define SRS_PP_PERSPECTIVE_POINT_HEIGHT "perspective_point_height"
/** satellite_height projection parameter */
#define SRS_PP_SATELLITE_HEIGHT "satellite_height"
/** fipszone projection parameter */
#define SRS_PP_FIPSZONE "fipszone"
/** zone projection parameter */
#define SRS_PP_ZONE "zone"
/** Latitude_Of_1st_Point projection parameter */
#define SRS_PP_LATITUDE_OF_1ST_POINT "Latitude_Of_1st_Point"
/** Longitude_Of_1st_Point projection parameter */
#define SRS_PP_LONGITUDE_OF_1ST_POINT "Longitude_Of_1st_Point"
/** Latitude_Of_2nd_Point projection parameter */
#define SRS_PP_LATITUDE_OF_2ND_POINT "Latitude_Of_2nd_Point"
/** Longitude_Of_2nd_Point projection parameter */
#define SRS_PP_LONGITUDE_OF_2ND_POINT "Longitude_Of_2nd_Point"
/** peg_point_latitude projection parameter */
#define SRS_PP_PEG_POINT_LATITUDE "peg_point_latitude"
/** peg_point_longitude projection parameter */
#define SRS_PP_PEG_POINT_LONGITUDE "peg_point_longitude"
/** peg_point_heading projection parameter */
#define SRS_PP_PEG_POINT_HEADING "peg_point_heading"
/** peg_point_height projection parameter */
#define SRS_PP_PEG_POINT_HEIGHT "peg_point_height"

/** Linear unit Meter */
#define SRS_UL_METER "Meter"
/** Linear unit Foot (International) */
#define SRS_UL_FOOT "Foot (International)" /* or just "FOOT"? */
/** Linear unit Foot (International) conversion factor to meter*/
#define SRS_UL_FOOT_CONV "0.3048"
/** Linear unit Foot */
#define SRS_UL_US_FOOT "Foot_US" /* or "US survey foot" from EPSG */
/** Linear unit Foot conversion factor to meter */
#define SRS_UL_US_FOOT_CONV "0.3048006096012192"
/** Linear unit Nautical Mile */
#define SRS_UL_NAUTICAL_MILE "Nautical Mile"
/** Linear unit Nautical Mile conversion factor to meter */
#define SRS_UL_NAUTICAL_MILE_CONV "1852.0"
/** Linear unit Link */
#define SRS_UL_LINK "Link" /* Based on US Foot */
/** Linear unit Link conversion factor to meter */
#define SRS_UL_LINK_CONV "0.20116684023368047"
/** Linear unit Chain */
#define SRS_UL_CHAIN "Chain" /* based on US Foot */
/** Linear unit Chain conversion factor to meter */
#define SRS_UL_CHAIN_CONV "20.116684023368047"
/** Linear unit Rod */
#define SRS_UL_ROD "Rod" /* based on US Foot */
/** Linear unit Rod conversion factor to meter */
#define SRS_UL_ROD_CONV "5.02921005842012"
/** Linear unit Link_Clarke */
#define SRS_UL_LINK_Clarke "Link_Clarke"
/** Linear unit Link_Clarke conversion factor to meter */
#define SRS_UL_LINK_Clarke_CONV "0.2011661949"

/** Linear unit Kilometer */
#define SRS_UL_KILOMETER "Kilometer"
/** Linear unit Kilometer conversion factor to meter */
#define SRS_UL_KILOMETER_CONV "1000."
/** Linear unit Decimeter */
#define SRS_UL_DECIMETER "Decimeter"
/** Linear unit Decimeter conversion factor to meter */
#define SRS_UL_DECIMETER_CONV "0.1"
/** Linear unit Decimeter */
#define SRS_UL_CENTIMETER "Centimeter"
/** Linear unit Decimeter conversion factor to meter */
#define SRS_UL_CENTIMETER_CONV "0.01"
/** Linear unit Millimeter */
#define SRS_UL_MILLIMETER "Millimeter"
/** Linear unit Millimeter conversion factor to meter */
#define SRS_UL_MILLIMETER_CONV "0.001"
/** Linear unit Nautical_Mile_International */
#define SRS_UL_INTL_NAUT_MILE "Nautical_Mile_International"
/** Linear unit Nautical_Mile_International conversion factor to meter */
#define SRS_UL_INTL_NAUT_MILE_CONV "1852.0"
/** Linear unit Inch_International */
#define SRS_UL_INTL_INCH "Inch_International"
/** Linear unit Inch_International conversion factor to meter */
#define SRS_UL_INTL_INCH_CONV "0.0254"
/** Linear unit Foot_International */
#define SRS_UL_INTL_FOOT "Foot_International"
/** Linear unit Foot_International conversion factor to meter */
#define SRS_UL_INTL_FOOT_CONV "0.3048"
/** Linear unit Yard_International */
#define SRS_UL_INTL_YARD "Yard_International"
/** Linear unit Yard_International conversion factor to meter */
#define SRS_UL_INTL_YARD_CONV "0.9144"
/** Linear unit Statute_Mile_International */
#define SRS_UL_INTL_STAT_MILE "Statute_Mile_International"
/** Linear unit Statute_Mile_Internationalconversion factor to meter */
#define SRS_UL_INTL_STAT_MILE_CONV "1609.344"
/** Linear unit Fathom_International */
#define SRS_UL_INTL_FATHOM "Fathom_International"
/** Linear unit Fathom_International conversion factor to meter */
#define SRS_UL_INTL_FATHOM_CONV "1.8288"
/** Linear unit Chain_International */
#define SRS_UL_INTL_CHAIN "Chain_International"
/** Linear unit Chain_International conversion factor to meter */
#define SRS_UL_INTL_CHAIN_CONV "20.1168"
/** Linear unit Link_International */
#define SRS_UL_INTL_LINK "Link_International"
/** Linear unit Link_International conversion factor to meter */
#define SRS_UL_INTL_LINK_CONV "0.201168"
/** Linear unit Inch_US_Surveyor */
#define SRS_UL_US_INCH "Inch_US_Surveyor"
/** Linear unit Inch_US_Surveyor conversion factor to meter */
#define SRS_UL_US_INCH_CONV "0.025400050800101603"
/** Linear unit Yard_US_Surveyor */
#define SRS_UL_US_YARD "Yard_US_Surveyor"
/** Linear unit Yard_US_Surveyor conversion factor to meter */
#define SRS_UL_US_YARD_CONV "0.914401828803658"
/** Linear unit Chain_US_Surveyor */
#define SRS_UL_US_CHAIN "Chain_US_Surveyor"
/** Linear unit Chain_US_Surveyor conversion factor to meter */
#define SRS_UL_US_CHAIN_CONV "20.11684023368047"
/** Linear unit Statute_Mile_US_Surveyor */
#define SRS_UL_US_STAT_MILE "Statute_Mile_US_Surveyor"
/** Linear unit Statute_Mile_US_Surveyor conversion factor to meter */
#define SRS_UL_US_STAT_MILE_CONV "1609.347218694437"
/** Linear unit Yard_Indian */
#define SRS_UL_INDIAN_YARD "Yard_Indian"
/** Linear unit Yard_Indian conversion factor to meter */
#define SRS_UL_INDIAN_YARD_CONV "0.91439523"
/** Linear unit Foot_Indian */
#define SRS_UL_INDIAN_FOOT "Foot_Indian"
/** Linear unit Foot_Indian conversion factor to meter */
#define SRS_UL_INDIAN_FOOT_CONV "0.30479841"
/** Linear unit Chain_Indian */
#define SRS_UL_INDIAN_CHAIN "Chain_Indian"
/** Linear unit Chain_Indian conversion factor to meter */
#define SRS_UL_INDIAN_CHAIN_CONV "20.11669506"

/** Angular unit degree */
#define SRS_UA_DEGREE "degree"
/** Angular unit degree conversion factor to radians */
#define SRS_UA_DEGREE_CONV "0.0174532925199433"
/** Angular unit radian */
#define SRS_UA_RADIAN "radian"

/** Prime meridian Greenwich */
#define SRS_PM_GREENWICH "Greenwich"

/** North_American_Datum_1927 datum name */
#define SRS_DN_NAD27 "North_American_Datum_1927"
/** North_American_Datum_1983 datum name */
#define SRS_DN_NAD83 "North_American_Datum_1983"
/** WGS_1972 datum name */
#define SRS_DN_WGS72 "WGS_1972"
/** WGS_1984 datum name */
#define SRS_DN_WGS84 "WGS_1984"

/** Semi-major axis of the WGS84 ellipsoid */
#define SRS_WGS84_SEMIMAJOR 6378137.0
/** Inverse flattening of the WGS84 ellipsoid */
#define SRS_WGS84_INVFLATTENING 298.257223563

#ifndef SWIG
/* -------------------------------------------------------------------- */
/*      C Wrappers for C++ objects and methods.                         */
/* -------------------------------------------------------------------- */
#ifndef DEFINED_OGRSpatialReferenceH
/*! @cond Doxygen_Suppress */
#define DEFINED_OGRSpatialReferenceH
/*! @endcond */

#ifdef DEBUG
typedef struct OGRSpatialReferenceHS *OGRSpatialReferenceH;
typedef struct OGRCoordinateTransformationHS *OGRCoordinateTransformationH;
#else
/** Opaque type for a Spatial Reference object */
typedef void *OGRSpatialReferenceH;
/** Opaque type for a coordinate transformation object */
typedef void *OGRCoordinateTransformationH;
#endif

#endif

void  OSRSetPROJSearchPaths(const char *const *papszPaths);
char  **OSRGetPROJSearchPaths(void);
void  OSRSetPROJAuxDbPaths(const char *const *papszPaths);
char  **OSRGetPROJAuxDbPaths(void);
void  OSRSetPROJEnableNetwork(int enabled);
int  OSRGetPROJEnableNetwork(void);
void  OSRGetPROJVersion(int *pnMajor, int *pnMinor, int *pnPatch);

OGRSpatialReferenceH  
OSRNewSpatialReference(const char * /* = NULL */);
OGRSpatialReferenceH   OSRCloneGeogCS(OGRSpatialReferenceH);
OGRSpatialReferenceH   OSRClone(OGRSpatialReferenceH);
void   OSRDestroySpatialReference(OGRSpatialReferenceH);

int  OSRReference(OGRSpatialReferenceH);
int  OSRDereference(OGRSpatialReferenceH);
void  OSRRelease(OGRSpatialReferenceH);

OGRErr  OSRValidate(OGRSpatialReferenceH);

OGRErr   OSRImportFromEPSG(OGRSpatialReferenceH, int);
OGRErr   OSRImportFromEPSGA(OGRSpatialReferenceH, int);
OGRErr  OSRImportFromWkt(OGRSpatialReferenceH, char **);
OGRErr  OSRImportFromProj4(OGRSpatialReferenceH, const char *);
OGRErr  OSRImportFromESRI(OGRSpatialReferenceH, char **);
OGRErr  OSRImportFromPCI(OGRSpatialReferenceH hSRS, const char *,
                                const char *, double *);
OGRErr  OSRImportFromUSGS(OGRSpatialReferenceH, long, long, double *,
                                 long);
OGRErr  OSRImportFromXML(OGRSpatialReferenceH, const char *);
OGRErr  OSRImportFromDict(OGRSpatialReferenceH, const char *,
                                 const char *);
OGRErr  OSRImportFromPanorama(OGRSpatialReferenceH, long, long, long,
                                     double *);
OGRErr  OSRImportFromOzi(OGRSpatialReferenceH, const char *const *);
OGRErr  OSRImportFromMICoordSys(OGRSpatialReferenceH, const char *);
OGRErr  OSRImportFromERM(OGRSpatialReferenceH, const char *,
                                const char *, const char *);
OGRErr  OSRImportFromUrl(OGRSpatialReferenceH, const char *);

OGRErr   OSRExportToWkt(OGRSpatialReferenceH, char **);
OGRErr  OSRExportToWktEx(OGRSpatialReferenceH, char **ppszResult,
                                const char *const *papszOptions);
OGRErr   OSRExportToPrettyWkt(OGRSpatialReferenceH, char **,
                                                int);
OGRErr  OSRExportToPROJJSON(OGRSpatialReferenceH hSRS, char **ppszReturn,
                                   const char *const *papszOptions);
OGRErr   OSRExportToProj4(OGRSpatialReferenceH, char **);
OGRErr  OSRExportToPCI(OGRSpatialReferenceH, char **, char **,
                              double **);
OGRErr  OSRExportToUSGS(OGRSpatialReferenceH, long *, long *, double **,
                               long *);
OGRErr  OSRExportToXML(OGRSpatialReferenceH, char **, const char *);
OGRErr  OSRExportToPanorama(OGRSpatialReferenceH, long *, long *, long *,
                                   long *, double *);
OGRErr  OSRExportToMICoordSys(OGRSpatialReferenceH, char **);
OGRErr  OSRExportToERM(OGRSpatialReferenceH, char *, char *, char *);

OGRErr  OSRMorphToESRI(OGRSpatialReferenceH);
OGRErr  OSRMorphFromESRI(OGRSpatialReferenceH);

OGRErr  OSRStripVertical(OGRSpatialReferenceH);

OGRSpatialReferenceH  OSRConvertToOtherProjection(
    OGRSpatialReferenceH hSRS, const char *pszTargetProjection,
    const char *const *papszOptions);

const char  *OSRGetName(OGRSpatialReferenceH hSRS);

OGRErr   OSRSetAttrValue(OGRSpatialReferenceH hSRS,
                                           const char *pszNodePath,
                                           const char *pszNewNodeValue);
const char  * OSRGetAttrValue(OGRSpatialReferenceH hSRS,
                                                const char *pszName,
                                                int iChild /* = 0 */);

OGRErr  OSRSetAngularUnits(OGRSpatialReferenceH, const char *, double);
double  OSRGetAngularUnits(OGRSpatialReferenceH, char **);
OGRErr  OSRSetLinearUnits(OGRSpatialReferenceH, const char *, double);
OGRErr  OSRSetTargetLinearUnits(OGRSpatialReferenceH, const char *,
                                       const char *, double);
OGRErr  OSRSetLinearUnitsAndUpdateParameters(OGRSpatialReferenceH,
                                                    const char *, double);
double  OSRGetLinearUnits(OGRSpatialReferenceH, char **);
double  OSRGetTargetLinearUnits(OGRSpatialReferenceH, const char *,
                                       char **);

double  OSRGetPrimeMeridian(OGRSpatialReferenceH, char **);

int  OSRIsGeographic(OGRSpatialReferenceH);
int  OSRIsDerivedGeographic(OGRSpatialReferenceH);
int  OSRIsLocal(OGRSpatialReferenceH);
int  OSRIsProjected(OGRSpatialReferenceH);
int  OSRIsCompound(OGRSpatialReferenceH);
int  OSRIsGeocentric(OGRSpatialReferenceH);
int  OSRIsVertical(OGRSpatialReferenceH);
int  OSRIsDynamic(OGRSpatialReferenceH);
int  OSRHasPointMotionOperation(OGRSpatialReferenceH);
int  OSRIsSameGeogCS(OGRSpatialReferenceH, OGRSpatialReferenceH);
int  OSRIsSameVertCS(OGRSpatialReferenceH, OGRSpatialReferenceH);
int  OSRIsSame(OGRSpatialReferenceH, OGRSpatialReferenceH);
int  OSRIsSameEx(OGRSpatialReferenceH, OGRSpatialReferenceH,
                        const char *const *papszOptions);

void  OSRSetCoordinateEpoch(OGRSpatialReferenceH hSRS,
                                   double dfCoordinateEpoch);
double  OSRGetCoordinateEpoch(OGRSpatialReferenceH hSRS);

OGRErr  OSRSetLocalCS(OGRSpatialReferenceH hSRS, const char *pszName);
OGRErr  OSRSetProjCS(OGRSpatialReferenceH hSRS, const char *pszName);
OGRErr  OSRSetGeocCS(OGRSpatialReferenceH hSRS, const char *pszName);
OGRErr  OSRSetWellKnownGeogCS(OGRSpatialReferenceH hSRS,
                                     const char *pszName);
OGRErr   OSRSetFromUserInput(OGRSpatialReferenceH hSRS,
                                               const char *);
OGRErr  OSRCopyGeogCSFrom(OGRSpatialReferenceH hSRS,
                                 const OGRSpatialReferenceH hSrcSRS);
OGRErr  OSRSetTOWGS84(OGRSpatialReferenceH hSRS, double, double, double,
                             double, double, double, double);
OGRErr  OSRGetTOWGS84(OGRSpatialReferenceH hSRS, double *, int);
OGRErr  OSRAddGuessedTOWGS84(OGRSpatialReferenceH hSRS);

OGRErr  OSRSetCompoundCS(OGRSpatialReferenceH hSRS, const char *pszName,
                                OGRSpatialReferenceH hHorizSRS,
                                OGRSpatialReferenceH hVertSRS);
OGRErr  OSRPromoteTo3D(OGRSpatialReferenceH hSRS, const char *pszName);
OGRErr  OSRDemoteTo2D(OGRSpatialReferenceH hSRS, const char *pszName);

OGRErr  OSRSetGeogCS(OGRSpatialReferenceH hSRS, const char *pszGeogName,
                            const char *pszDatumName,
                            const char *pszEllipsoidName, double dfSemiMajor,
                            double dfInvFlattening,
                            const char *pszPMName /* = NULL */,
                            double dfPMOffset /* = 0.0 */,
                            const char *pszUnits /* = NULL */,
                            double dfConvertToRadians /* = 0.0 */);

OGRErr  OSRSetVertCS(OGRSpatialReferenceH hSRS,
                            const char *pszVertCSName,
                            const char *pszVertDatumName, int nVertDatumType);

double  OSRGetSemiMajor(OGRSpatialReferenceH, OGRErr * /* = NULL */);
double  OSRGetSemiMinor(OGRSpatialReferenceH, OGRErr * /* = NULL */);
double  OSRGetInvFlattening(OGRSpatialReferenceH, OGRErr * /*=NULL*/);

OGRErr  OSRSetAuthority(OGRSpatialReferenceH hSRS,
                               const char *pszTargetKey,
                               const char *pszAuthority, int nCode);
const char  *OSRGetAuthorityCode(OGRSpatialReferenceH hSRS,
                                        const char *pszTargetKey);
const char  *OSRGetAuthorityName(OGRSpatialReferenceH hSRS,
                                        const char *pszTargetKey);

int  OSRGetAreaOfUse(OGRSpatialReferenceH hSRS,
                            double *pdfWestLongitudeDeg,
                            double *pdfSouthLatitudeDeg,
                            double *pdfEastLongitudeDeg,
                            double *pdfNorthLatitudeDeg,
                            const char **ppszAreaName);

OGRErr  OSRSetProjection(OGRSpatialReferenceH, const char *);
OGRErr  OSRSetProjParm(OGRSpatialReferenceH, const char *, double);
double  OSRGetProjParm(OGRSpatialReferenceH hSRS,
                              const char *pszParamName,
                              double dfDefault /* = 0.0 */,
                              OGRErr * /* = NULL */);
OGRErr  OSRSetNormProjParm(OGRSpatialReferenceH, const char *, double);
double  OSRGetNormProjParm(OGRSpatialReferenceH hSRS,
                                  const char *pszParamName,
                                  double dfDefault /* = 0.0 */,
                                  OGRErr * /* = NULL */);

OGRErr  OSRSetUTM(OGRSpatialReferenceH hSRS, int nZone, int bNorth);
int  OSRGetUTMZone(OGRSpatialReferenceH hSRS, int *pbNorth);
OGRErr  OSRSetStatePlane(OGRSpatialReferenceH hSRS, int nZone,
                                int bNAD83);
OGRErr  OSRSetStatePlaneWithUnits(OGRSpatialReferenceH hSRS, int nZone,
                                         int bNAD83,
                                         const char *pszOverrideUnitName,
                                         double dfOverrideUnit);
OGRErr  OSRAutoIdentifyEPSG(OGRSpatialReferenceH hSRS);

OGRSpatialReferenceH  *OSRFindMatches(OGRSpatialReferenceH hSRS,
                                             char **papszOptions,
                                             int *pnEntries,
                                             int **ppanMatchConfidence);
void  OSRFreeSRSArray(OGRSpatialReferenceH *pahSRS);

int  OSREPSGTreatsAsLatLong(OGRSpatialReferenceH hSRS);
int  OSREPSGTreatsAsNorthingEasting(OGRSpatialReferenceH hSRS);
const char  *OSRGetAxis(OGRSpatialReferenceH hSRS,
                               const char *pszTargetKey, int iAxis,
                               OGRAxisOrientation *peOrientation);
int  OSRGetAxesCount(OGRSpatialReferenceH hSRS);
OGRErr  OSRSetAxes(OGRSpatialReferenceH hSRS, const char *pszTargetKey,
                          const char *pszXAxisName,
                          OGRAxisOrientation eXAxisOrientation,
                          const char *pszYAxisName,
                          OGRAxisOrientation eYAxisOrientation);

/** Data axis to CRS axis mapping strategy. */
typedef enum
{
    OAMS_TRADITIONAL_GIS_ORDER, /**< Traditional GIS order */
    OAMS_AUTHORITY_COMPLIANT, /**< Compliant with the order mandated by the CRS
                                 authority */
    OAMS_CUSTOM               /**< Custom */
} OSRAxisMappingStrategy;

OSRAxisMappingStrategy 
OSRGetAxisMappingStrategy(OGRSpatialReferenceH hSRS);

void  OSRSetAxisMappingStrategy(OGRSpatialReferenceH hSRS,
                                       OSRAxisMappingStrategy strategy);

const int  *OSRGetDataAxisToSRSAxisMapping(OGRSpatialReferenceH hSRS,
                                                  int *pnCount);

OGRErr  OSRSetDataAxisToSRSAxisMapping(OGRSpatialReferenceH hSRS,
                                              int nMappingSize,
                                              const int *panMapping);

/** Albers Conic Equal Area */
OGRErr  OSRSetACEA(OGRSpatialReferenceH hSRS, double dfStdP1,
                          double dfStdP2, double dfCenterLat,
                          double dfCenterLong, double dfFalseEasting,
                          double dfFalseNorthing);

/** Azimuthal Equidistant */
OGRErr  OSRSetAE(OGRSpatialReferenceH hSRS, double dfCenterLat,
                        double dfCenterLong, double dfFalseEasting,
                        double dfFalseNorthing);

/** Bonne */
OGRErr  OSRSetBonne(OGRSpatialReferenceH hSRS, double dfStandardParallel,
                           double dfCentralMeridian, double dfFalseEasting,
                           double dfFalseNorthing);

/** Cylindrical Equal Area */
OGRErr  OSRSetCEA(OGRSpatialReferenceH hSRS, double dfStdP1,
                         double dfCentralMeridian, double dfFalseEasting,
                         double dfFalseNorthing);

/** Cassini-Soldner */
OGRErr  OSRSetCS(OGRSpatialReferenceH hSRS, double dfCenterLat,
                        double dfCenterLong, double dfFalseEasting,
                        double dfFalseNorthing);

/** Equidistant Conic */
OGRErr  OSRSetEC(OGRSpatialReferenceH hSRS, double dfStdP1,
                        double dfStdP2, double dfCenterLat, double dfCenterLong,
                        double dfFalseEasting, double dfFalseNorthing);

/** Eckert I-VI */
OGRErr  OSRSetEckert(OGRSpatialReferenceH hSRS, int nVariation,
                            double dfCentralMeridian, double dfFalseEasting,
                            double dfFalseNorthing);

/** Eckert IV */
OGRErr  OSRSetEckertIV(OGRSpatialReferenceH hSRS,
                              double dfCentralMeridian, double dfFalseEasting,
                              double dfFalseNorthing);

/** Eckert VI */
OGRErr  OSRSetEckertVI(OGRSpatialReferenceH hSRS,
                              double dfCentralMeridian, double dfFalseEasting,
                              double dfFalseNorthing);

/** Equirectangular */
OGRErr  OSRSetEquirectangular(OGRSpatialReferenceH hSRS,
                                     double dfCenterLat, double dfCenterLong,
                                     double dfFalseEasting,
                                     double dfFalseNorthing);

/** Equirectangular generalized form */
OGRErr  OSRSetEquirectangular2(OGRSpatialReferenceH hSRS,
                                      double dfCenterLat, double dfCenterLong,
                                      double dfPseudoStdParallel1,
                                      double dfFalseEasting,
                                      double dfFalseNorthing);

/** Gall Stereograpic */
OGRErr  OSRSetGS(OGRSpatialReferenceH hSRS, double dfCentralMeridian,
                        double dfFalseEasting, double dfFalseNorthing);

/** Goode Homolosine */
OGRErr  OSRSetGH(OGRSpatialReferenceH hSRS, double dfCentralMeridian,
                        double dfFalseEasting, double dfFalseNorthing);

/** Interrupted Goode Homolosine */
OGRErr  OSRSetIGH(OGRSpatialReferenceH hSRS);

/** GEOS - Geostationary Satellite View */
OGRErr  OSRSetGEOS(OGRSpatialReferenceH hSRS, double dfCentralMeridian,
                          double dfSatelliteHeight, double dfFalseEasting,
                          double dfFalseNorthing);

/** Gauss Schreiber Transverse Mercator */
OGRErr  OSRSetGaussSchreiberTMercator(
    OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong,
    double dfScale, double dfFalseEasting, double dfFalseNorthing);
/** Gnomonic */
OGRErr  OSRSetGnomonic(OGRSpatialReferenceH hSRS, double dfCenterLat,
                              double dfCenterLong, double dfFalseEasting,
                              double dfFalseNorthing);

#ifdef undef
/** Oblique Mercator (aka HOM (variant B) */
OGRErr  OSRSetOM(OGRSpatialReferenceH hSRS, double dfCenterLat,
                        double dfCenterLong, double dfAzimuth,
                        double dfRectToSkew, double dfScale,
                        double dfFalseEasting, double dfFalseNorthing);
#endif

/** Hotine Oblique Mercator using azimuth angle */
OGRErr  OSRSetHOM(OGRSpatialReferenceH hSRS, double dfCenterLat,
                         double dfCenterLong, double dfAzimuth,
                         double dfRectToSkew, double dfScale,
                         double dfFalseEasting, double dfFalseNorthing);

OGRErr  OSRSetHOMAC(OGRSpatialReferenceH hSRS, double dfCenterLat,
                           double dfCenterLong, double dfAzimuth,
                           double dfRectToSkew, double dfScale,
                           double dfFalseEasting, double dfFalseNorthing);

/** Hotine Oblique Mercator using two points on centerline */
OGRErr  OSRSetHOM2PNO(OGRSpatialReferenceH hSRS, double dfCenterLat,
                             double dfLat1, double dfLong1, double dfLat2,
                             double dfLong2, double dfScale,
                             double dfFalseEasting, double dfFalseNorthing);

/** International Map of the World Polyconic */
OGRErr  OSRSetIWMPolyconic(OGRSpatialReferenceH hSRS, double dfLat1,
                                  double dfLat2, double dfCenterLong,
                                  double dfFalseEasting,
                                  double dfFalseNorthing);

/** Krovak Oblique Conic Conformal */
OGRErr  OSRSetKrovak(OGRSpatialReferenceH hSRS, double dfCenterLat,
                            double dfCenterLong, double dfAzimuth,
                            double dfPseudoStdParallelLat, double dfScale,
                            double dfFalseEasting, double dfFalseNorthing);

/** Lambert Azimuthal Equal-Area */
OGRErr  OSRSetLAEA(OGRSpatialReferenceH hSRS, double dfCenterLat,
                          double dfCenterLong, double dfFalseEasting,
                          double dfFalseNorthing);

/** Lambert Conformal Conic */
OGRErr  OSRSetLCC(OGRSpatialReferenceH hSRS, double dfStdP1,
                         double dfStdP2, double dfCenterLat,
                         double dfCenterLong, double dfFalseEasting,
                         double dfFalseNorthing);

/** Lambert Conformal Conic 1SP */
OGRErr  OSRSetLCC1SP(OGRSpatialReferenceH hSRS, double dfCenterLat,
                            double dfCenterLong, double dfScale,
                            double dfFalseEasting, double dfFalseNorthing);

/** Lambert Conformal Conic (Belgium) */
OGRErr  OSRSetLCCB(OGRSpatialReferenceH hSRS, double dfStdP1,
                          double dfStdP2, double dfCenterLat,
                          double dfCenterLong, double dfFalseEasting,
                          double dfFalseNorthing);

/** Miller Cylindrical */
OGRErr  OSRSetMC(OGRSpatialReferenceH hSRS, double dfCenterLat,
                        double dfCenterLong, double dfFalseEasting,
                        double dfFalseNorthing);

/** Mercator */
OGRErr  OSRSetMercator(OGRSpatialReferenceH hSRS, double dfCenterLat,
                              double dfCenterLong, double dfScale,
                              double dfFalseEasting, double dfFalseNorthing);

/** Mercator 2SP */
OGRErr  OSRSetMercator2SP(OGRSpatialReferenceH hSRS, double dfStdP1,
                                 double dfCenterLat, double dfCenterLong,
                                 double dfFalseEasting, double dfFalseNorthing);

/** Mollweide */
OGRErr  OSRSetMollweide(OGRSpatialReferenceH hSRS,
                               double dfCentralMeridian, double dfFalseEasting,
                               double dfFalseNorthing);

/** New Zealand Map Grid */
OGRErr  OSRSetNZMG(OGRSpatialReferenceH hSRS, double dfCenterLat,
                          double dfCenterLong, double dfFalseEasting,
                          double dfFalseNorthing);

/** Oblique Stereographic */
OGRErr  OSRSetOS(OGRSpatialReferenceH hSRS, double dfOriginLat,
                        double dfCMeridian, double dfScale,
                        double dfFalseEasting, double dfFalseNorthing);

/** Orthographic */
OGRErr  OSRSetOrthographic(OGRSpatialReferenceH hSRS, double dfCenterLat,
                                  double dfCenterLong, double dfFalseEasting,
                                  double dfFalseNorthing);

/** Polyconic */
OGRErr  OSRSetPolyconic(OGRSpatialReferenceH hSRS, double dfCenterLat,
                               double dfCenterLong, double dfFalseEasting,
                               double dfFalseNorthing);

/** Polar Stereographic */
OGRErr  OSRSetPS(OGRSpatialReferenceH hSRS, double dfCenterLat,
                        double dfCenterLong, double dfScale,
                        double dfFalseEasting, double dfFalseNorthing);

/** Robinson */
OGRErr  OSRSetRobinson(OGRSpatialReferenceH hSRS, double dfCenterLong,
                              double dfFalseEasting, double dfFalseNorthing);

/** Sinusoidal */
OGRErr  OSRSetSinusoidal(OGRSpatialReferenceH hSRS, double dfCenterLong,
                                double dfFalseEasting, double dfFalseNorthing);

/** Stereographic */
OGRErr  OSRSetStereographic(OGRSpatialReferenceH hSRS,
                                   double dfCenterLat, double dfCenterLong,
                                   double dfScale, double dfFalseEasting,
                                   double dfFalseNorthing);

/** Swiss Oblique Cylindrical */
OGRErr  OSRSetSOC(OGRSpatialReferenceH hSRS, double dfLatitudeOfOrigin,
                         double dfCentralMeridian, double dfFalseEasting,
                         double dfFalseNorthing);

/** Transverse Mercator
 *
 * Special processing available for Transverse Mercator with GDAL &gt;= 1.10 and
 * PROJ &gt;= 4.8 : see OGRSpatialReference::exportToProj4().
 */

OGRErr  OSRSetTM(OGRSpatialReferenceH hSRS, double dfCenterLat,
                        double dfCenterLong, double dfScale,
                        double dfFalseEasting, double dfFalseNorthing);

/** Transverse Mercator variant */
OGRErr  OSRSetTMVariant(OGRSpatialReferenceH hSRS,
                               const char *pszVariantName, double dfCenterLat,
                               double dfCenterLong, double dfScale,
                               double dfFalseEasting, double dfFalseNorthing);

/** Tunesia Mining Grid  */
OGRErr  OSRSetTMG(OGRSpatialReferenceH hSRS, double dfCenterLat,
                         double dfCenterLong, double dfFalseEasting,
                         double dfFalseNorthing);

/** Transverse Mercator (South Oriented) */
OGRErr  OSRSetTMSO(OGRSpatialReferenceH hSRS, double dfCenterLat,
                          double dfCenterLong, double dfScale,
                          double dfFalseEasting, double dfFalseNorthing);

/** TPED (Two Point Equi Distant) */
OGRErr  OSRSetTPED(OGRSpatialReferenceH hSRS, double dfLat1,
                          double dfLong1, double dfLat2, double dfLong2,
                          double dfFalseEasting, double dfFalseNorthing);

/** VanDerGrinten */
OGRErr  OSRSetVDG(OGRSpatialReferenceH hSRS, double dfCenterLong,
                         double dfFalseEasting, double dfFalseNorthing);

/** Wagner I -- VII */
OGRErr  OSRSetWagner(OGRSpatialReferenceH hSRS, int nVariation,
                            double dfCenterLat, double dfFalseEasting,
                            double dfFalseNorthing);

/** Quadrilateralized Spherical Cube */
OGRErr  OSRSetQSC(OGRSpatialReferenceH hSRS, double dfCenterLat,
                         double dfCenterLong);

/** Spherical, Cross-track, Height */
OGRErr  OSRSetSCH(OGRSpatialReferenceH hSRS, double dfPegLat,
                         double dfPegLong, double dfPegHeading,
                         double dfPegHgt);

/** Vertical Perspective / Near-sided Perspective */
OGRErr  OSRSetVerticalPerspective(
    OGRSpatialReferenceH hSRS, double dfTopoOriginLat, double dfTopoOriginLon,
    double dfTopoOriginHeight, double dfViewPointHeight, double dfFalseEasting,
    double dfFalseNorthing);

double  OSRCalcInvFlattening(double dfSemiMajor, double dfSemiMinor);
double  OSRCalcSemiMinorFromInvFlattening(double dfSemiMajor,
                                                 double dfInvFlattening);

void  OSRCleanup(void);

/** \brief Type of Coordinate Reference System (CRS). */
typedef enum
{
    /** Geographic 2D CRS */
    OSR_CRS_TYPE_GEOGRAPHIC_2D,
    /** Geographic 3D CRS */
    OSR_CRS_TYPE_GEOGRAPHIC_3D,
    /** Geocentric CRS */
    OSR_CRS_TYPE_GEOCENTRIC,
    /** Projected CRS */
    OSR_CRS_TYPE_PROJECTED,
    /** Vertical CRS */
    OSR_CRS_TYPE_VERTICAL,
    /** Compound CRS */
    OSR_CRS_TYPE_COMPOUND,
    /** Other */
    OSR_CRS_TYPE_OTHER,
} OSRCRSType;

/** \brief Structure given overall description of a CRS.
 *
 * This structure may grow over time, and should not be directly allocated by
 * client code.
 */
typedef struct
{
    /** Authority name. */
    char *pszAuthName;
    /** Object code. */
    char *pszCode;
    /** Object name. */
    char *pszName;
    /** Object type. */
    OSRCRSType eType;
    /** Whether the object is deprecated */
    int bDeprecated;
    /** Whereas the west_lon_degree, south_lat_degree, east_lon_degree and
     * north_lat_degree fields are valid. */
    int bBboxValid;
    /** Western-most longitude of the area of use, in degrees. */
    double dfWestLongitudeDeg;
    /** Southern-most latitude of the area of use, in degrees. */
    double dfSouthLatitudeDeg;
    /** Eastern-most longitude of the area of use, in degrees. */
    double dfEastLongitudeDeg;
    /** Northern-most latitude of the area of use, in degrees. */
    double dfNorthLatitudeDeg;
    /** Name of the area of use. */
    char *pszAreaName;
    /** Name of the projection method for a projected CRS. Might be NULL even
     *for projected CRS in some cases. */
    char *pszProjectionMethod;
} OSRCRSInfo;

/** \brief Structure to describe optional parameters to
 * OSRGetCRSInfoListFromDatabase()
 *
 * Unused for now.
 */
typedef struct OSRCRSListParameters OSRCRSListParameters;

OSRCRSInfo  **
OSRGetCRSInfoListFromDatabase(const char *pszAuthName,
                              const OSRCRSListParameters *params,
                              int *pnOutResultCount);

void  OSRDestroyCRSInfoList(OSRCRSInfo **list);

/* -------------------------------------------------------------------- */
/*      OGRCoordinateTransform C API.                                   */
/* -------------------------------------------------------------------- */
OGRCoordinateTransformationH   OCTNewCoordinateTransformation(
    OGRSpatialReferenceH hSourceSRS, OGRSpatialReferenceH hTargetSRS);

/** Coordinate transformation options. */
typedef struct OGRCoordinateTransformationOptions
    *OGRCoordinateTransformationOptionsH;

OGRCoordinateTransformationOptionsH 
OCTNewCoordinateTransformationOptions(void);

int  OCTCoordinateTransformationOptionsSetOperation(
    OGRCoordinateTransformationOptionsH hOptions, const char *pszCO,
    int bReverseCO);

int  OCTCoordinateTransformationOptionsSetAreaOfInterest(
    OGRCoordinateTransformationOptionsH hOptions, double dfWestLongitudeDeg,
    double dfSouthLatitudeDeg, double dfEastLongitudeDeg,
    double dfNorthLatitudeDeg);

int  OCTCoordinateTransformationOptionsSetDesiredAccuracy(
    OGRCoordinateTransformationOptionsH hOptions, double dfAccuracy);

int  OCTCoordinateTransformationOptionsSetBallparkAllowed(
    OGRCoordinateTransformationOptionsH hOptions, int bAllowBallpark);

int  OCTCoordinateTransformationOptionsSetOnlyBest(
    OGRCoordinateTransformationOptionsH hOptions, bool bOnlyBest);

void  OCTDestroyCoordinateTransformationOptions(
    OGRCoordinateTransformationOptionsH);

OGRCoordinateTransformationH  OCTNewCoordinateTransformationEx(
    OGRSpatialReferenceH hSourceSRS, OGRSpatialReferenceH hTargetSRS,
    OGRCoordinateTransformationOptionsH hOptions);

OGRCoordinateTransformationH 
OCTClone(OGRCoordinateTransformationH hTransform);
OGRSpatialReferenceH 
OCTGetSourceCS(OGRCoordinateTransformationH hTransform);
OGRSpatialReferenceH 
OCTGetTargetCS(OGRCoordinateTransformationH hTransform);
OGRCoordinateTransformationH 
OCTGetInverse(OGRCoordinateTransformationH hTransform);

void  
    OCTDestroyCoordinateTransformation(OGRCoordinateTransformationH);

int   OCTTransform(OGRCoordinateTransformationH hCT,
                                     int nCount, double *x, double *y,
                                     double *z);

int   OCTTransformEx(OGRCoordinateTransformationH hCT,
                                       int nCount, double *x, double *y,
                                       double *z, int *pabSuccess);

int  OCTTransform4D(OGRCoordinateTransformationH hCT, int nCount,
                           double *x, double *y, double *z, double *t,
                           int *pabSuccess);

int  OCTTransform4DWithErrorCodes(OGRCoordinateTransformationH hCT,
                                         int nCount, double *x, double *y,
                                         double *z, double *t,
                                         int *panErrorCodes);

int   OCTTransformBounds(OGRCoordinateTransformationH hCT,
                                           const double xmin, const double ymin,
                                           const double xmax, const double ymax,
                                           double *out_xmin, double *out_ymin,
                                           double *out_xmax, double *out_ymax,
                                           const int densify_pts);



#endif /* ndef SWIG */

#endif /* ndef OGR_SRS_API_H_INCLUDED */
