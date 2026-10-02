unit ogr_srs_api;

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
 *************************************************************************** }
{$ifndef OGR_SRS_API_H_INCLUDED}
{$define OGR_SRS_API_H_INCLUDED}
{$include <stdbool.h>}
{$ifndef SWIG}
{$include "ogr_core.h"}
{*
 * \file ogr_srs_api.h
 *
 * C spatial reference system services and defines.
 *
 * See also: ogr_spatialref.h
  }
{* Axis orientations (corresponds to CS_AxisOrientationEnum).  }
{*< Other  }
{*< North  }
{*< South  }
{*< East  }
{*< West  }
{*< Up (to space)  }
{*< Down (to Earth center)  }
type
  POGRAxisOrientation = ^TOGRAxisOrientation;
  TOGRAxisOrientation =  Longint;
  Const
    OAO_Other = 0;
    OAO_North = 1;
    OAO_South = 2;
    OAO_East = 3;
    OAO_West = 4;
    OAO_Up = 5;
    OAO_Down = 6;
;

function OSRAxisEnumToName(eOrientation:TOGRAxisOrientation):Pchar;cdecl;external libgdal;
{$endif}
{ ndef SWIG }
{ ====================================================================  }
{      Some standard WKT geographic coordinate systems.                 }
{ ====================================================================  }
{ ====================================================================  }
{      Some "standard" strings.                                         }
{ ====================================================================  }
{* Albers_Conic_Equal_Area projection  }

const
  SRS_PT_ALBERS_CONIC_EQUAL_AREA = 'Albers_Conic_Equal_Area';  
{* Azimuthal_Equidistant projection  }
  SRS_PT_AZIMUTHAL_EQUIDISTANT = 'Azimuthal_Equidistant';  
{* Cassini_Soldner projection  }
  SRS_PT_CASSINI_SOLDNER = 'Cassini_Soldner';  
{* Cylindrical_Equal_Area projection  }
  SRS_PT_CYLINDRICAL_EQUAL_AREA = 'Cylindrical_Equal_Area';  
{* Cylindrical_Equal_Area projection  }
  SRS_PT_BONNE = 'Bonne';  
{* Eckert_I projection  }
  SRS_PT_ECKERT_I = 'Eckert_I';  
{* Eckert_II projection  }
  SRS_PT_ECKERT_II = 'Eckert_II';  
{* Eckert_III projection  }
  SRS_PT_ECKERT_III = 'Eckert_III';  
{* Eckert_IV projection  }
  SRS_PT_ECKERT_IV = 'Eckert_IV';  
{* Eckert_V projection  }
  SRS_PT_ECKERT_V = 'Eckert_V';  
{* Eckert_VI projection  }
  SRS_PT_ECKERT_VI = 'Eckert_VI';  
{* Equidistant_Conic projection  }
  SRS_PT_EQUIDISTANT_CONIC = 'Equidistant_Conic';  
{* Equirectangular projection  }
  SRS_PT_EQUIRECTANGULAR = 'Equirectangular';  
{* Gall_Stereographic projection  }
  SRS_PT_GALL_STEREOGRAPHIC = 'Gall_Stereographic';  
{* Gauss_Schreiber_Transverse_Mercator projection  }
  SRS_PT_GAUSSSCHREIBERTMERCATOR = 'Gauss_Schreiber_Transverse_Mercator';  
{* Geostationary_Satellite projection  }
  SRS_PT_GEOSTATIONARY_SATELLITE = 'Geostationary_Satellite';  
{* Goode_Homolosine projection  }
  SRS_PT_GOODE_HOMOLOSINE = 'Goode_Homolosine';  
{* Interrupted_Goode_Homolosine projection  }
  SRS_PT_IGH = 'Interrupted_Goode_Homolosine';  
{* Gnomonic projection  }
  SRS_PT_GNOMONIC = 'Gnomonic';  
{* Hotine_Oblique_Mercator_Azimuth_Center projection  }
  SRS_PT_HOTINE_OBLIQUE_MERCATOR_AZIMUTH_CENTER = 'Hotine_Oblique_Mercator_Azimuth_Center';  
{* Hotine_Oblique_Mercator projection  }
  SRS_PT_HOTINE_OBLIQUE_MERCATOR = 'Hotine_Oblique_Mercator';  
{* Hotine_Oblique_Mercator_Two_Point_Natural_Origin projection  }
  SRS_PT_HOTINE_OBLIQUE_MERCATOR_TWO_POINT_NATURAL_ORIGIN = 'Hotine_Oblique_Mercator_Two_Point_Natural_Origin';  
{* Laborde_Oblique_Mercator projection  }
  SRS_PT_LABORDE_OBLIQUE_MERCATOR = 'Laborde_Oblique_Mercator';  
{* Lambert_Conformal_Conic_1SP projection  }
  SRS_PT_LAMBERT_CONFORMAL_CONIC_1SP = 'Lambert_Conformal_Conic_1SP';  
{* Lambert_Conformal_Conic_2SP projection  }
  SRS_PT_LAMBERT_CONFORMAL_CONIC_2SP = 'Lambert_Conformal_Conic_2SP';  
{* Lambert_Conformal_Conic_2SP_Belgium projection  }
  SRS_PT_LAMBERT_CONFORMAL_CONIC_2SP_BELGIUM = 'Lambert_Conformal_Conic_2SP_Belgium';  
{* Lambert_Azimuthal_Equal_Area projection  }
  SRS_PT_LAMBERT_AZIMUTHAL_EQUAL_AREA = 'Lambert_Azimuthal_Equal_Area';  
{* Mercator_1SP projection  }
  SRS_PT_MERCATOR_1SP = 'Mercator_1SP';  
{* Mercator_2SP projection  }
  SRS_PT_MERCATOR_2SP = 'Mercator_2SP';  
{* Mercator_Auxiliary_Sphere is used used by ESRI to mean EPSG:3875  }
  SRS_PT_MERCATOR_AUXILIARY_SPHERE = 'Mercator_Auxiliary_Sphere';  
{* Miller_Cylindrical projection  }
  SRS_PT_MILLER_CYLINDRICAL = 'Miller_Cylindrical';  
{* Mollweide projection  }
  SRS_PT_MOLLWEIDE = 'Mollweide';  
{* New_Zealand_Map_Grid projection  }
  SRS_PT_NEW_ZEALAND_MAP_GRID = 'New_Zealand_Map_Grid';  
{* Oblique_Stereographic projection  }
  SRS_PT_OBLIQUE_STEREOGRAPHIC = 'Oblique_Stereographic';  
{* Orthographic projection  }
  SRS_PT_ORTHOGRAPHIC = 'Orthographic';  
{* Polar_Stereographic projection  }
  SRS_PT_POLAR_STEREOGRAPHIC = 'Polar_Stereographic';  
{* Polyconic projection  }
  SRS_PT_POLYCONIC = 'Polyconic';  
{* Robinson projection  }
  SRS_PT_ROBINSON = 'Robinson';  
{* Sinusoidal projection  }
  SRS_PT_SINUSOIDAL = 'Sinusoidal';  
{* Stereographic projection  }
  SRS_PT_STEREOGRAPHIC = 'Stereographic';  
{* Swiss_Oblique_Cylindrical projection  }
  SRS_PT_SWISS_OBLIQUE_CYLINDRICAL = 'Swiss_Oblique_Cylindrical';  
{* Transverse_Mercator projection  }
  SRS_PT_TRANSVERSE_MERCATOR = 'Transverse_Mercator';  
{* Transverse_Mercator_South_Orientated projection  }
  SRS_PT_TRANSVERSE_MERCATOR_SOUTH_ORIENTED = 'Transverse_Mercator_South_Orientated';  
{ special mapinfo variants on Transverse Mercator  }
{* Transverse_Mercator_MapInfo_21 projection  }
  SRS_PT_TRANSVERSE_MERCATOR_MI_21 = 'Transverse_Mercator_MapInfo_21';  
{* Transverse_Mercator_MapInfo_22 projection  }
  SRS_PT_TRANSVERSE_MERCATOR_MI_22 = 'Transverse_Mercator_MapInfo_22';  
{* Transverse_Mercator_MapInfo_23 projection  }
  SRS_PT_TRANSVERSE_MERCATOR_MI_23 = 'Transverse_Mercator_MapInfo_23';  
{* Transverse_Mercator_MapInfo_24 projection  }
  SRS_PT_TRANSVERSE_MERCATOR_MI_24 = 'Transverse_Mercator_MapInfo_24';  
{* Transverse_Mercator_MapInfo_25 projection  }
  SRS_PT_TRANSVERSE_MERCATOR_MI_25 = 'Transverse_Mercator_MapInfo_25';  
{* Tunisia_Mining_Grid projection  }
  SRS_PT_TUNISIA_MINING_GRID = 'Tunisia_Mining_Grid';  
{* Two_Point_Equidistant projection  }
  SRS_PT_TWO_POINT_EQUIDISTANT = 'Two_Point_Equidistant';  
{* VanDerGrinten projection  }
  SRS_PT_VANDERGRINTEN = 'VanDerGrinten';  
{* Krovak projection  }
  SRS_PT_KROVAK = 'Krovak';  
{* International_Map_of_the_World_Polyconic projection  }
  SRS_PT_IMW_POLYCONIC = 'International_Map_of_the_World_Polyconic';  
{* Wagner_I projection  }
  SRS_PT_WAGNER_I = 'Wagner_I';  
{* Wagner_II projection  }
  SRS_PT_WAGNER_II = 'Wagner_II';  
{* Wagner_III projection  }
  SRS_PT_WAGNER_III = 'Wagner_III';  
{* Wagner_IV projection  }
  SRS_PT_WAGNER_IV = 'Wagner_IV';  
{* Wagner_V projection  }
  SRS_PT_WAGNER_V = 'Wagner_V';  
{* Wagner_VI projection  }
  SRS_PT_WAGNER_VI = 'Wagner_VI';  
{* Wagner_VII projection  }
  SRS_PT_WAGNER_VII = 'Wagner_VII';  
{* Quadrilateralized_Spherical_Cube projection  }
  SRS_PT_QSC = 'Quadrilateralized_Spherical_Cube';  
{* Aitoff projection  }
  SRS_PT_AITOFF = 'Aitoff';  
{* Winkel_I projection  }
  SRS_PT_WINKEL_I = 'Winkel_I';  
{* Winkel_II projection  }
  SRS_PT_WINKEL_II = 'Winkel_II';  
{* Winkel_Tripel projection  }
  SRS_PT_WINKEL_TRIPEL = 'Winkel_Tripel';  
{* Craster_Parabolic projection  }
  SRS_PT_CRASTER_PARABOLIC = 'Craster_Parabolic';  
{* Loximuthal projection  }
  SRS_PT_LOXIMUTHAL = 'Loximuthal';  
{* Quartic_Authalic projection  }
  SRS_PT_QUARTIC_AUTHALIC = 'Quartic_Authalic';  
{* Spherical_Cross_Track_Height projection  }
  SRS_PT_SCH = 'Spherical_Cross_Track_Height';  
{* central_meridian projection parameter  }
  SRS_PP_CENTRAL_MERIDIAN = 'central_meridian';  
{* scale_factor projection parameter  }
  SRS_PP_SCALE_FACTOR = 'scale_factor';  
{* standard_parallel_1 projection parameter  }
  SRS_PP_STANDARD_PARALLEL_1 = 'standard_parallel_1';  
{* standard_parallel_2 projection parameter  }
  SRS_PP_STANDARD_PARALLEL_2 = 'standard_parallel_2';  
{* pseudo_standard_parallel_1 projection parameter  }
  SRS_PP_PSEUDO_STD_PARALLEL_1 = 'pseudo_standard_parallel_1';  
{* longitude_of_center projection parameter  }
  SRS_PP_LONGITUDE_OF_CENTER = 'longitude_of_center';  
{* latitude_of_center projection parameter  }
  SRS_PP_LATITUDE_OF_CENTER = 'latitude_of_center';  
{* longitude_of_origin projection parameter  }
  SRS_PP_LONGITUDE_OF_ORIGIN = 'longitude_of_origin';  
{* latitude_of_origin projection parameter  }
  SRS_PP_LATITUDE_OF_ORIGIN = 'latitude_of_origin';  
{* false_easting projection parameter  }
  SRS_PP_FALSE_EASTING = 'false_easting';  
{* false_northing projection parameter  }
  SRS_PP_FALSE_NORTHING = 'false_northing';  
{* azimuth projection parameter  }
  SRS_PP_AZIMUTH = 'azimuth';  
{* longitude_of_point_1 projection parameter  }
  SRS_PP_LONGITUDE_OF_POINT_1 = 'longitude_of_point_1';  
{* latitude_of_point_1 projection parameter  }
  SRS_PP_LATITUDE_OF_POINT_1 = 'latitude_of_point_1';  
{* longitude_of_point_2 projection parameter  }
  SRS_PP_LONGITUDE_OF_POINT_2 = 'longitude_of_point_2';  
{* latitude_of_point_2 projection parameter  }
  SRS_PP_LATITUDE_OF_POINT_2 = 'latitude_of_point_2';  
{* longitude_of_point_3 projection parameter  }
  SRS_PP_LONGITUDE_OF_POINT_3 = 'longitude_of_point_3';  
{* latitude_of_point_3 projection parameter  }
  SRS_PP_LATITUDE_OF_POINT_3 = 'latitude_of_point_3';  
{* rectified_grid_angle projection parameter  }
  SRS_PP_RECTIFIED_GRID_ANGLE = 'rectified_grid_angle';  
{* landsat_number projection parameter  }
  SRS_PP_LANDSAT_NUMBER = 'landsat_number';  
{* path_number projection parameter  }
  SRS_PP_PATH_NUMBER = 'path_number';  
{* perspective_point_height projection parameter  }
  SRS_PP_PERSPECTIVE_POINT_HEIGHT = 'perspective_point_height';  
{* satellite_height projection parameter  }
  SRS_PP_SATELLITE_HEIGHT = 'satellite_height';  
{* fipszone projection parameter  }
  SRS_PP_FIPSZONE = 'fipszone';  
{* zone projection parameter  }
  SRS_PP_ZONE = 'zone';  
{* Latitude_Of_1st_Point projection parameter  }
  SRS_PP_LATITUDE_OF_1ST_POINT = 'Latitude_Of_1st_Point';  
{* Longitude_Of_1st_Point projection parameter  }
  SRS_PP_LONGITUDE_OF_1ST_POINT = 'Longitude_Of_1st_Point';  
{* Latitude_Of_2nd_Point projection parameter  }
  SRS_PP_LATITUDE_OF_2ND_POINT = 'Latitude_Of_2nd_Point';  
{* Longitude_Of_2nd_Point projection parameter  }
  SRS_PP_LONGITUDE_OF_2ND_POINT = 'Longitude_Of_2nd_Point';  
{* peg_point_latitude projection parameter  }
  SRS_PP_PEG_POINT_LATITUDE = 'peg_point_latitude';  
{* peg_point_longitude projection parameter  }
  SRS_PP_PEG_POINT_LONGITUDE = 'peg_point_longitude';  
{* peg_point_heading projection parameter  }
  SRS_PP_PEG_POINT_HEADING = 'peg_point_heading';  
{* peg_point_height projection parameter  }
  SRS_PP_PEG_POINT_HEIGHT = 'peg_point_height';  
{* Linear unit Meter  }
  SRS_UL_METER = 'Meter';  
{* Linear unit Foot (International)  }
{ or just "FOOT"?  }
  SRS_UL_FOOT = 'Foot (International)';  
{* Linear unit Foot (International) conversion factor to meter }
  SRS_UL_FOOT_CONV = '0.3048';  
{* Linear unit Foot  }
{ or "US survey foot" from EPSG  }
  SRS_UL_US_FOOT = 'Foot_US';  
{* Linear unit Foot conversion factor to meter  }
  SRS_UL_US_FOOT_CONV = '0.3048006096012192';  
{* Linear unit Nautical Mile  }
  SRS_UL_NAUTICAL_MILE = 'Nautical Mile';  
{* Linear unit Nautical Mile conversion factor to meter  }
  SRS_UL_NAUTICAL_MILE_CONV = '1852.0';  
{* Linear unit Link  }
{ Based on US Foot  }
  SRS_UL_LINK = 'Link';  
{* Linear unit Link conversion factor to meter  }
  SRS_UL_LINK_CONV = '0.20116684023368047';  
{* Linear unit Chain  }
{ based on US Foot  }
  SRS_UL_CHAIN = 'Chain';  
{* Linear unit Chain conversion factor to meter  }
  SRS_UL_CHAIN_CONV = '20.116684023368047';  
{* Linear unit Rod  }
{ based on US Foot  }
  SRS_UL_ROD = 'Rod';  
{* Linear unit Rod conversion factor to meter  }
  SRS_UL_ROD_CONV = '5.02921005842012';  
{* Linear unit Link_Clarke  }
  SRS_UL_LINK_Clarke = 'Link_Clarke';  
{* Linear unit Link_Clarke conversion factor to meter  }
  SRS_UL_LINK_Clarke_CONV = '0.2011661949';  
{* Linear unit Kilometer  }
  SRS_UL_KILOMETER = 'Kilometer';  
{* Linear unit Kilometer conversion factor to meter  }
  SRS_UL_KILOMETER_CONV = '1000.';  
{* Linear unit Decimeter  }
  SRS_UL_DECIMETER = 'Decimeter';  
{* Linear unit Decimeter conversion factor to meter  }
  SRS_UL_DECIMETER_CONV = '0.1';  
{* Linear unit Decimeter  }
  SRS_UL_CENTIMETER = 'Centimeter';  
{* Linear unit Decimeter conversion factor to meter  }
  SRS_UL_CENTIMETER_CONV = '0.01';  
{* Linear unit Millimeter  }
  SRS_UL_MILLIMETER = 'Millimeter';  
{* Linear unit Millimeter conversion factor to meter  }
  SRS_UL_MILLIMETER_CONV = '0.001';  
{* Linear unit Nautical_Mile_International  }
  SRS_UL_INTL_NAUT_MILE = 'Nautical_Mile_International';  
{* Linear unit Nautical_Mile_International conversion factor to meter  }
  SRS_UL_INTL_NAUT_MILE_CONV = '1852.0';  
{* Linear unit Inch_International  }
  SRS_UL_INTL_INCH = 'Inch_International';  
{* Linear unit Inch_International conversion factor to meter  }
  SRS_UL_INTL_INCH_CONV = '0.0254';  
{* Linear unit Foot_International  }
  SRS_UL_INTL_FOOT = 'Foot_International';  
{* Linear unit Foot_International conversion factor to meter  }
  SRS_UL_INTL_FOOT_CONV = '0.3048';  
{* Linear unit Yard_International  }
  SRS_UL_INTL_YARD = 'Yard_International';  
{* Linear unit Yard_International conversion factor to meter  }
  SRS_UL_INTL_YARD_CONV = '0.9144';  
{* Linear unit Statute_Mile_International  }
  SRS_UL_INTL_STAT_MILE = 'Statute_Mile_International';  
{* Linear unit Statute_Mile_Internationalconversion factor to meter  }
  SRS_UL_INTL_STAT_MILE_CONV = '1609.344';  
{* Linear unit Fathom_International  }
  SRS_UL_INTL_FATHOM = 'Fathom_International';  
{* Linear unit Fathom_International conversion factor to meter  }
  SRS_UL_INTL_FATHOM_CONV = '1.8288';  
{* Linear unit Chain_International  }
  SRS_UL_INTL_CHAIN = 'Chain_International';  
{* Linear unit Chain_International conversion factor to meter  }
  SRS_UL_INTL_CHAIN_CONV = '20.1168';  
{* Linear unit Link_International  }
  SRS_UL_INTL_LINK = 'Link_International';  
{* Linear unit Link_International conversion factor to meter  }
  SRS_UL_INTL_LINK_CONV = '0.201168';  
{* Linear unit Inch_US_Surveyor  }
  SRS_UL_US_INCH = 'Inch_US_Surveyor';  
{* Linear unit Inch_US_Surveyor conversion factor to meter  }
  SRS_UL_US_INCH_CONV = '0.025400050800101603';  
{* Linear unit Yard_US_Surveyor  }
  SRS_UL_US_YARD = 'Yard_US_Surveyor';  
{* Linear unit Yard_US_Surveyor conversion factor to meter  }
  SRS_UL_US_YARD_CONV = '0.914401828803658';  
{* Linear unit Chain_US_Surveyor  }
  SRS_UL_US_CHAIN = 'Chain_US_Surveyor';  
{* Linear unit Chain_US_Surveyor conversion factor to meter  }
  SRS_UL_US_CHAIN_CONV = '20.11684023368047';  
{* Linear unit Statute_Mile_US_Surveyor  }
  SRS_UL_US_STAT_MILE = 'Statute_Mile_US_Surveyor';  
{* Linear unit Statute_Mile_US_Surveyor conversion factor to meter  }
  SRS_UL_US_STAT_MILE_CONV = '1609.347218694437';  
{* Linear unit Yard_Indian  }
  SRS_UL_INDIAN_YARD = 'Yard_Indian';  
{* Linear unit Yard_Indian conversion factor to meter  }
  SRS_UL_INDIAN_YARD_CONV = '0.91439523';  
{* Linear unit Foot_Indian  }
  SRS_UL_INDIAN_FOOT = 'Foot_Indian';  
{* Linear unit Foot_Indian conversion factor to meter  }
  SRS_UL_INDIAN_FOOT_CONV = '0.30479841';  
{* Linear unit Chain_Indian  }
  SRS_UL_INDIAN_CHAIN = 'Chain_Indian';  
{* Linear unit Chain_Indian conversion factor to meter  }
  SRS_UL_INDIAN_CHAIN_CONV = '20.11669506';  
{* Angular unit degree  }
  SRS_UA_DEGREE = 'degree';  
{* Angular unit degree conversion factor to radians  }
  SRS_UA_DEGREE_CONV = '0.0174532925199433';  
{* Angular unit radian  }
  SRS_UA_RADIAN = 'radian';  
{* Prime meridian Greenwich  }
  SRS_PM_GREENWICH = 'Greenwich';  
{* North_American_Datum_1927 datum name  }
  SRS_DN_NAD27 = 'North_American_Datum_1927';  
{* North_American_Datum_1983 datum name  }
  SRS_DN_NAD83 = 'North_American_Datum_1983';  
{* WGS_1972 datum name  }
  SRS_DN_WGS72 = 'WGS_1972';  
{* WGS_1984 datum name  }
  SRS_DN_WGS84 = 'WGS_1984';  
{* Semi-major axis of the WGS84 ellipsoid  }
  SRS_WGS84_SEMIMAJOR = 6378137.0;  
{* Inverse flattening of the WGS84 ellipsoid  }
  SRS_WGS84_INVFLATTENING = 298.257223563;  
{$ifndef SWIG}
{ --------------------------------------------------------------------  }
{      C Wrappers for C++ objects and methods.                          }
{ --------------------------------------------------------------------  }
{$ifndef DEFINED_OGRSpatialReferenceH}
{! @cond Doxygen_Suppress  }
{$define DEFINED_OGRSpatialReferenceH}
{! @endcond  }
{$ifdef DEBUG}
type
  POGRSpatialReferenceH = ^TOGRSpatialReferenceH;
  TOGRSpatialReferenceH = POGRSpatialReferenceHS;

  POGRCoordinateTransformationH = ^TOGRCoordinateTransformationH;
  TOGRCoordinateTransformationH = POGRCoordinateTransformationHS;
{$else}
{* Opaque type for a Spatial Reference object  }
type
  POGRSpatialReferenceH = ^TOGRSpatialReferenceH;
  TOGRSpatialReferenceH = pointer;
{* Opaque type for a coordinate transformation object  }

  POGRCoordinateTransformationH = ^TOGRCoordinateTransformationH;
  TOGRCoordinateTransformationH = pointer;
{$endif}
{$endif}

procedure OSRSetPROJSearchPaths(papszPaths:PPchar);cdecl;external libgdal;
function OSRGetPROJSearchPaths:^Pchar;cdecl;external libgdal;
procedure OSRSetPROJAuxDbPaths(papszPaths:PPchar);cdecl;external libgdal;
function OSRGetPROJAuxDbPaths:^Pchar;cdecl;external libgdal;
procedure OSRSetPROJEnableNetwork(enabled:longint);cdecl;external libgdal;
function OSRGetPROJEnableNetwork:longint;cdecl;external libgdal;
procedure OSRGetPROJVersion(pnMajor:Plongint; pnMinor:Plongint; pnPatch:Plongint);cdecl;external libgdal;
{ = NULL  }function OSRNewSpatialReference(para1:Pchar):TOGRSpatialReferenceH;cdecl;external libgdal;
function OSRCloneGeogCS(para1:TOGRSpatialReferenceH):TOGRSpatialReferenceH;cdecl;external libgdal;
function OSRClone(para1:TOGRSpatialReferenceH):TOGRSpatialReferenceH;cdecl;external libgdal;
procedure OSRDestroySpatialReference(para1:TOGRSpatialReferenceH);cdecl;external libgdal;
function OSRReference(para1:TOGRSpatialReferenceH):longint;cdecl;external libgdal;
function OSRDereference(para1:TOGRSpatialReferenceH):longint;cdecl;external libgdal;
procedure OSRRelease(para1:TOGRSpatialReferenceH);cdecl;external libgdal;
function OSRValidate(para1:TOGRSpatialReferenceH):TOGRErr;cdecl;external libgdal;
function OSRImportFromEPSG(para1:TOGRSpatialReferenceH; para2:longint):TOGRErr;cdecl;external libgdal;
function OSRImportFromEPSGA(para1:TOGRSpatialReferenceH; para2:longint):TOGRErr;cdecl;external libgdal;
function OSRImportFromWkt(para1:TOGRSpatialReferenceH; para2:PPchar):TOGRErr;cdecl;external libgdal;
function OSRImportFromProj4(para1:TOGRSpatialReferenceH; para2:Pchar):TOGRErr;cdecl;external libgdal;
function OSRImportFromESRI(para1:TOGRSpatialReferenceH; para2:PPchar):TOGRErr;cdecl;external libgdal;
function OSRImportFromPCI(hSRS:TOGRSpatialReferenceH; para2:Pchar; para3:Pchar; para4:Pdouble):TOGRErr;cdecl;external libgdal;
function OSRImportFromUSGS(para1:TOGRSpatialReferenceH; para2:longint; para3:longint; para4:Pdouble; para5:longint):TOGRErr;cdecl;external libgdal;
function OSRImportFromXML(para1:TOGRSpatialReferenceH; para2:Pchar):TOGRErr;cdecl;external libgdal;
function OSRImportFromDict(para1:TOGRSpatialReferenceH; para2:Pchar; para3:Pchar):TOGRErr;cdecl;external libgdal;
function OSRImportFromPanorama(para1:TOGRSpatialReferenceH; para2:longint; para3:longint; para4:longint; para5:Pdouble):TOGRErr;cdecl;external libgdal;
(* Const before abstract_declarator ignored *)
function OSRImportFromOzi(para1:TOGRSpatialReferenceH; para2:PPchar):TOGRErr;cdecl;external libgdal;
function OSRImportFromMICoordSys(para1:TOGRSpatialReferenceH; para2:Pchar):TOGRErr;cdecl;external libgdal;
function OSRImportFromERM(para1:TOGRSpatialReferenceH; para2:Pchar; para3:Pchar; para4:Pchar):TOGRErr;cdecl;external libgdal;
function OSRImportFromUrl(para1:TOGRSpatialReferenceH; para2:Pchar):TOGRErr;cdecl;external libgdal;
function OSRExportToWkt(para1:TOGRSpatialReferenceH; para2:PPchar):TOGRErr;cdecl;external libgdal;
function OSRExportToWktEx(para1:TOGRSpatialReferenceH; ppszResult:PPchar; papszOptions:PPchar):TOGRErr;cdecl;external libgdal;
function OSRExportToPrettyWkt(para1:TOGRSpatialReferenceH; para2:PPchar; para3:longint):TOGRErr;cdecl;external libgdal;
function OSRExportToPROJJSON(hSRS:TOGRSpatialReferenceH; ppszReturn:PPchar; papszOptions:PPchar):TOGRErr;cdecl;external libgdal;
function OSRExportToProj4(para1:TOGRSpatialReferenceH; para2:PPchar):TOGRErr;cdecl;external libgdal;
function OSRExportToPCI(para1:TOGRSpatialReferenceH; para2:PPchar; para3:PPchar; para4:PPdouble):TOGRErr;cdecl;external libgdal;
function OSRExportToUSGS(para1:TOGRSpatialReferenceH; para2:Plongint; para3:Plongint; para4:PPdouble; para5:Plongint):TOGRErr;cdecl;external libgdal;
function OSRExportToXML(para1:TOGRSpatialReferenceH; para2:PPchar; para3:Pchar):TOGRErr;cdecl;external libgdal;
function OSRExportToPanorama(para1:TOGRSpatialReferenceH; para2:Plongint; para3:Plongint; para4:Plongint; para5:Plongint; 
           para6:Pdouble):TOGRErr;cdecl;external libgdal;
function OSRExportToMICoordSys(para1:TOGRSpatialReferenceH; para2:PPchar):TOGRErr;cdecl;external libgdal;
function OSRExportToERM(para1:TOGRSpatialReferenceH; para2:Pchar; para3:Pchar; para4:Pchar):TOGRErr;cdecl;external libgdal;
function OSRMorphToESRI(para1:TOGRSpatialReferenceH):TOGRErr;cdecl;external libgdal;
function OSRMorphFromESRI(para1:TOGRSpatialReferenceH):TOGRErr;cdecl;external libgdal;
function OSRStripVertical(para1:TOGRSpatialReferenceH):TOGRErr;cdecl;external libgdal;
function OSRConvertToOtherProjection(hSRS:TOGRSpatialReferenceH; pszTargetProjection:Pchar; papszOptions:PPchar):TOGRSpatialReferenceH;cdecl;external libgdal;
function OSRGetName(hSRS:TOGRSpatialReferenceH):Pchar;cdecl;external libgdal;
function OSRSetAttrValue(hSRS:TOGRSpatialReferenceH; pszNodePath:Pchar; pszNewNodeValue:Pchar):TOGRErr;cdecl;external libgdal;
{ = 0  }function OSRGetAttrValue(hSRS:TOGRSpatialReferenceH; pszName:Pchar; iChild:longint):Pchar;cdecl;external libgdal;
function OSRSetAngularUnits(para1:TOGRSpatialReferenceH; para2:Pchar; para3:Tdouble):TOGRErr;cdecl;external libgdal;
function OSRGetAngularUnits(para1:TOGRSpatialReferenceH; para2:PPchar):Tdouble;cdecl;external libgdal;
function OSRSetLinearUnits(para1:TOGRSpatialReferenceH; para2:Pchar; para3:Tdouble):TOGRErr;cdecl;external libgdal;
function OSRSetTargetLinearUnits(para1:TOGRSpatialReferenceH; para2:Pchar; para3:Pchar; para4:Tdouble):TOGRErr;cdecl;external libgdal;
function OSRSetLinearUnitsAndUpdateParameters(para1:TOGRSpatialReferenceH; para2:Pchar; para3:Tdouble):TOGRErr;cdecl;external libgdal;
function OSRGetLinearUnits(para1:TOGRSpatialReferenceH; para2:PPchar):Tdouble;cdecl;external libgdal;
function OSRGetTargetLinearUnits(para1:TOGRSpatialReferenceH; para2:Pchar; para3:PPchar):Tdouble;cdecl;external libgdal;
function OSRGetPrimeMeridian(para1:TOGRSpatialReferenceH; para2:PPchar):Tdouble;cdecl;external libgdal;
function OSRIsGeographic(para1:TOGRSpatialReferenceH):longint;cdecl;external libgdal;
function OSRIsDerivedGeographic(para1:TOGRSpatialReferenceH):longint;cdecl;external libgdal;
function OSRIsLocal(para1:TOGRSpatialReferenceH):longint;cdecl;external libgdal;
function OSRIsProjected(para1:TOGRSpatialReferenceH):longint;cdecl;external libgdal;
function OSRIsCompound(para1:TOGRSpatialReferenceH):longint;cdecl;external libgdal;
function OSRIsGeocentric(para1:TOGRSpatialReferenceH):longint;cdecl;external libgdal;
function OSRIsVertical(para1:TOGRSpatialReferenceH):longint;cdecl;external libgdal;
function OSRIsDynamic(para1:TOGRSpatialReferenceH):longint;cdecl;external libgdal;
function OSRHasPointMotionOperation(para1:TOGRSpatialReferenceH):longint;cdecl;external libgdal;
function OSRIsSameGeogCS(para1:TOGRSpatialReferenceH; para2:TOGRSpatialReferenceH):longint;cdecl;external libgdal;
function OSRIsSameVertCS(para1:TOGRSpatialReferenceH; para2:TOGRSpatialReferenceH):longint;cdecl;external libgdal;
function OSRIsSame(para1:TOGRSpatialReferenceH; para2:TOGRSpatialReferenceH):longint;cdecl;external libgdal;
function OSRIsSameEx(para1:TOGRSpatialReferenceH; para2:TOGRSpatialReferenceH; papszOptions:PPchar):longint;cdecl;external libgdal;
procedure OSRSetCoordinateEpoch(hSRS:TOGRSpatialReferenceH; dfCoordinateEpoch:Tdouble);cdecl;external libgdal;
function OSRGetCoordinateEpoch(hSRS:TOGRSpatialReferenceH):Tdouble;cdecl;external libgdal;
function OSRSetLocalCS(hSRS:TOGRSpatialReferenceH; pszName:Pchar):TOGRErr;cdecl;external libgdal;
function OSRSetProjCS(hSRS:TOGRSpatialReferenceH; pszName:Pchar):TOGRErr;cdecl;external libgdal;
function OSRSetGeocCS(hSRS:TOGRSpatialReferenceH; pszName:Pchar):TOGRErr;cdecl;external libgdal;
function OSRSetWellKnownGeogCS(hSRS:TOGRSpatialReferenceH; pszName:Pchar):TOGRErr;cdecl;external libgdal;
function OSRSetFromUserInput(hSRS:TOGRSpatialReferenceH; para2:Pchar):TOGRErr;cdecl;external libgdal;
function OSRCopyGeogCSFrom(hSRS:TOGRSpatialReferenceH; hSrcSRS:TOGRSpatialReferenceH):TOGRErr;cdecl;external libgdal;
function OSRSetTOWGS84(hSRS:TOGRSpatialReferenceH; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble; 
           para6:Tdouble; para7:Tdouble; para8:Tdouble):TOGRErr;cdecl;external libgdal;
function OSRGetTOWGS84(hSRS:TOGRSpatialReferenceH; para2:Pdouble; para3:longint):TOGRErr;cdecl;external libgdal;
function OSRAddGuessedTOWGS84(hSRS:TOGRSpatialReferenceH):TOGRErr;cdecl;external libgdal;
function OSRSetCompoundCS(hSRS:TOGRSpatialReferenceH; pszName:Pchar; hHorizSRS:TOGRSpatialReferenceH; hVertSRS:TOGRSpatialReferenceH):TOGRErr;cdecl;external libgdal;
function OSRPromoteTo3D(hSRS:TOGRSpatialReferenceH; pszName:Pchar):TOGRErr;cdecl;external libgdal;
function OSRDemoteTo2D(hSRS:TOGRSpatialReferenceH; pszName:Pchar):TOGRErr;cdecl;external libgdal;
{ = NULL  }{ = 0.0  }(* Const before type ignored *)
{ = NULL  }{ = 0.0  }function OSRSetGeogCS(hSRS:TOGRSpatialReferenceH; pszGeogName:Pchar; pszDatumName:Pchar; pszEllipsoidName:Pchar; dfSemiMajor:Tdouble; 
           dfInvFlattening:Tdouble; pszPMName:Pchar; dfPMOffset:Tdouble; pszUnits:Pchar; dfConvertToRadians:Tdouble):TOGRErr;cdecl;external libgdal;
function OSRSetVertCS(hSRS:TOGRSpatialReferenceH; pszVertCSName:Pchar; pszVertDatumName:Pchar; nVertDatumType:longint):TOGRErr;cdecl;external libgdal;
{ = NULL  }function OSRGetSemiMajor(para1:TOGRSpatialReferenceH; para2:POGRErr):Tdouble;cdecl;external libgdal;
{ = NULL  }function OSRGetSemiMinor(para1:TOGRSpatialReferenceH; para2:POGRErr):Tdouble;cdecl;external libgdal;
{=NULL }function OSRGetInvFlattening(para1:TOGRSpatialReferenceH; para2:POGRErr):Tdouble;cdecl;external libgdal;
function OSRSetAuthority(hSRS:TOGRSpatialReferenceH; pszTargetKey:Pchar; pszAuthority:Pchar; nCode:longint):TOGRErr;cdecl;external libgdal;
function OSRGetAuthorityCode(hSRS:TOGRSpatialReferenceH; pszTargetKey:Pchar):Pchar;cdecl;external libgdal;
function OSRGetAuthorityName(hSRS:TOGRSpatialReferenceH; pszTargetKey:Pchar):Pchar;cdecl;external libgdal;
function OSRGetAreaOfUse(hSRS:TOGRSpatialReferenceH; pdfWestLongitudeDeg:Pdouble; pdfSouthLatitudeDeg:Pdouble; pdfEastLongitudeDeg:Pdouble; pdfNorthLatitudeDeg:Pdouble; 
           ppszAreaName:PPchar):longint;cdecl;external libgdal;
function OSRSetProjection(para1:TOGRSpatialReferenceH; para2:Pchar):TOGRErr;cdecl;external libgdal;
function OSRSetProjParm(para1:TOGRSpatialReferenceH; para2:Pchar; para3:Tdouble):TOGRErr;cdecl;external libgdal;
{ = 0.0  }{ = NULL  }function OSRGetProjParm(hSRS:TOGRSpatialReferenceH; pszParamName:Pchar; dfDefault:Tdouble; para4:POGRErr):Tdouble;cdecl;external libgdal;
function OSRSetNormProjParm(para1:TOGRSpatialReferenceH; para2:Pchar; para3:Tdouble):TOGRErr;cdecl;external libgdal;
{ = 0.0  }{ = NULL  }function OSRGetNormProjParm(hSRS:TOGRSpatialReferenceH; pszParamName:Pchar; dfDefault:Tdouble; para4:POGRErr):Tdouble;cdecl;external libgdal;
function OSRSetUTM(hSRS:TOGRSpatialReferenceH; nZone:longint; bNorth:longint):TOGRErr;cdecl;external libgdal;
function OSRGetUTMZone(hSRS:TOGRSpatialReferenceH; pbNorth:Plongint):longint;cdecl;external libgdal;
function OSRSetStatePlane(hSRS:TOGRSpatialReferenceH; nZone:longint; bNAD83:longint):TOGRErr;cdecl;external libgdal;
function OSRSetStatePlaneWithUnits(hSRS:TOGRSpatialReferenceH; nZone:longint; bNAD83:longint; pszOverrideUnitName:Pchar; dfOverrideUnit:Tdouble):TOGRErr;cdecl;external libgdal;
function OSRAutoIdentifyEPSG(hSRS:TOGRSpatialReferenceH):TOGRErr;cdecl;external libgdal;
function OSRFindMatches(hSRS:TOGRSpatialReferenceH; papszOptions:PPchar; pnEntries:Plongint; ppanMatchConfidence:PPlongint):POGRSpatialReferenceH;cdecl;external libgdal;
procedure OSRFreeSRSArray(pahSRS:POGRSpatialReferenceH);cdecl;external libgdal;
function OSREPSGTreatsAsLatLong(hSRS:TOGRSpatialReferenceH):longint;cdecl;external libgdal;
function OSREPSGTreatsAsNorthingEasting(hSRS:TOGRSpatialReferenceH):longint;cdecl;external libgdal;
function OSRGetAxis(hSRS:TOGRSpatialReferenceH; pszTargetKey:Pchar; iAxis:longint; peOrientation:POGRAxisOrientation):Pchar;cdecl;external libgdal;
function OSRGetAxesCount(hSRS:TOGRSpatialReferenceH):longint;cdecl;external libgdal;
function OSRSetAxes(hSRS:TOGRSpatialReferenceH; pszTargetKey:Pchar; pszXAxisName:Pchar; eXAxisOrientation:TOGRAxisOrientation; pszYAxisName:Pchar; 
           eYAxisOrientation:TOGRAxisOrientation):TOGRErr;cdecl;external libgdal;
{* Data axis to CRS axis mapping strategy.  }
{*< Traditional GIS order  }
{*< Compliant with the order mandated by the CRS
                                 authority  }
{*< Custom  }
type
  POSRAxisMappingStrategy = ^TOSRAxisMappingStrategy;
  TOSRAxisMappingStrategy =  Longint;
  Const
    OAMS_TRADITIONAL_GIS_ORDER = 0;
    OAMS_AUTHORITY_COMPLIANT = 1;
    OAMS_CUSTOM = 2;
;

function OSRGetAxisMappingStrategy(hSRS:TOGRSpatialReferenceH):TOSRAxisMappingStrategy;cdecl;external libgdal;
procedure OSRSetAxisMappingStrategy(hSRS:TOGRSpatialReferenceH; strategy:TOSRAxisMappingStrategy);cdecl;external libgdal;
function OSRGetDataAxisToSRSAxisMapping(hSRS:TOGRSpatialReferenceH; pnCount:Plongint):Plongint;cdecl;external libgdal;
function OSRSetDataAxisToSRSAxisMapping(hSRS:TOGRSpatialReferenceH; nMappingSize:longint; panMapping:Plongint):TOGRErr;cdecl;external libgdal;
{* Albers Conic Equal Area  }
function OSRSetACEA(hSRS:TOGRSpatialReferenceH; dfStdP1:Tdouble; dfStdP2:Tdouble; dfCenterLat:Tdouble; dfCenterLong:Tdouble; 
           dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Azimuthal Equidistant  }
function OSRSetAE(hSRS:TOGRSpatialReferenceH; dfCenterLat:Tdouble; dfCenterLong:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Bonne  }
function OSRSetBonne(hSRS:TOGRSpatialReferenceH; dfStandardParallel:Tdouble; dfCentralMeridian:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Cylindrical Equal Area  }
function OSRSetCEA(hSRS:TOGRSpatialReferenceH; dfStdP1:Tdouble; dfCentralMeridian:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Cassini-Soldner  }
function OSRSetCS(hSRS:TOGRSpatialReferenceH; dfCenterLat:Tdouble; dfCenterLong:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Equidistant Conic  }
function OSRSetEC(hSRS:TOGRSpatialReferenceH; dfStdP1:Tdouble; dfStdP2:Tdouble; dfCenterLat:Tdouble; dfCenterLong:Tdouble; 
           dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Eckert I-VI  }
function OSRSetEckert(hSRS:TOGRSpatialReferenceH; nVariation:longint; dfCentralMeridian:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Eckert IV  }
function OSRSetEckertIV(hSRS:TOGRSpatialReferenceH; dfCentralMeridian:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Eckert VI  }
function OSRSetEckertVI(hSRS:TOGRSpatialReferenceH; dfCentralMeridian:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Equirectangular  }
function OSRSetEquirectangular(hSRS:TOGRSpatialReferenceH; dfCenterLat:Tdouble; dfCenterLong:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Equirectangular generalized form  }
function OSRSetEquirectangular2(hSRS:TOGRSpatialReferenceH; dfCenterLat:Tdouble; dfCenterLong:Tdouble; dfPseudoStdParallel1:Tdouble; dfFalseEasting:Tdouble; 
           dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Gall Stereograpic  }
function OSRSetGS(hSRS:TOGRSpatialReferenceH; dfCentralMeridian:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Goode Homolosine  }
function OSRSetGH(hSRS:TOGRSpatialReferenceH; dfCentralMeridian:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Interrupted Goode Homolosine  }
function OSRSetIGH(hSRS:TOGRSpatialReferenceH):TOGRErr;cdecl;external libgdal;
{* GEOS - Geostationary Satellite View  }
function OSRSetGEOS(hSRS:TOGRSpatialReferenceH; dfCentralMeridian:Tdouble; dfSatelliteHeight:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Gauss Schreiber Transverse Mercator  }
function OSRSetGaussSchreiberTMercator(hSRS:TOGRSpatialReferenceH; dfCenterLat:Tdouble; dfCenterLong:Tdouble; dfScale:Tdouble; dfFalseEasting:Tdouble; 
           dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Gnomonic  }
function OSRSetGnomonic(hSRS:TOGRSpatialReferenceH; dfCenterLat:Tdouble; dfCenterLong:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{$ifdef undef}
{* Oblique Mercator (aka HOM (variant B)  }
function OSRSetOM(hSRS:TOGRSpatialReferenceH; dfCenterLat:Tdouble; dfCenterLong:Tdouble; dfAzimuth:Tdouble; dfRectToSkew:Tdouble; 
           dfScale:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{$endif}
{* Hotine Oblique Mercator using azimuth angle  }

function OSRSetHOM(hSRS:TOGRSpatialReferenceH; dfCenterLat:Tdouble; dfCenterLong:Tdouble; dfAzimuth:Tdouble; dfRectToSkew:Tdouble; 
           dfScale:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
function OSRSetHOMAC(hSRS:TOGRSpatialReferenceH; dfCenterLat:Tdouble; dfCenterLong:Tdouble; dfAzimuth:Tdouble; dfRectToSkew:Tdouble; 
           dfScale:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Hotine Oblique Mercator using two points on centerline  }
function OSRSetHOM2PNO(hSRS:TOGRSpatialReferenceH; dfCenterLat:Tdouble; dfLat1:Tdouble; dfLong1:Tdouble; dfLat2:Tdouble; 
           dfLong2:Tdouble; dfScale:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* International Map of the World Polyconic  }
function OSRSetIWMPolyconic(hSRS:TOGRSpatialReferenceH; dfLat1:Tdouble; dfLat2:Tdouble; dfCenterLong:Tdouble; dfFalseEasting:Tdouble; 
           dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Krovak Oblique Conic Conformal  }
function OSRSetKrovak(hSRS:TOGRSpatialReferenceH; dfCenterLat:Tdouble; dfCenterLong:Tdouble; dfAzimuth:Tdouble; dfPseudoStdParallelLat:Tdouble; 
           dfScale:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Lambert Azimuthal Equal-Area  }
function OSRSetLAEA(hSRS:TOGRSpatialReferenceH; dfCenterLat:Tdouble; dfCenterLong:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Lambert Conformal Conic  }
function OSRSetLCC(hSRS:TOGRSpatialReferenceH; dfStdP1:Tdouble; dfStdP2:Tdouble; dfCenterLat:Tdouble; dfCenterLong:Tdouble; 
           dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Lambert Conformal Conic 1SP  }
function OSRSetLCC1SP(hSRS:TOGRSpatialReferenceH; dfCenterLat:Tdouble; dfCenterLong:Tdouble; dfScale:Tdouble; dfFalseEasting:Tdouble; 
           dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Lambert Conformal Conic (Belgium)  }
function OSRSetLCCB(hSRS:TOGRSpatialReferenceH; dfStdP1:Tdouble; dfStdP2:Tdouble; dfCenterLat:Tdouble; dfCenterLong:Tdouble; 
           dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Miller Cylindrical  }
function OSRSetMC(hSRS:TOGRSpatialReferenceH; dfCenterLat:Tdouble; dfCenterLong:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Mercator  }
function OSRSetMercator(hSRS:TOGRSpatialReferenceH; dfCenterLat:Tdouble; dfCenterLong:Tdouble; dfScale:Tdouble; dfFalseEasting:Tdouble; 
           dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Mercator 2SP  }
function OSRSetMercator2SP(hSRS:TOGRSpatialReferenceH; dfStdP1:Tdouble; dfCenterLat:Tdouble; dfCenterLong:Tdouble; dfFalseEasting:Tdouble; 
           dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Mollweide  }
function OSRSetMollweide(hSRS:TOGRSpatialReferenceH; dfCentralMeridian:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* New Zealand Map Grid  }
function OSRSetNZMG(hSRS:TOGRSpatialReferenceH; dfCenterLat:Tdouble; dfCenterLong:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Oblique Stereographic  }
function OSRSetOS(hSRS:TOGRSpatialReferenceH; dfOriginLat:Tdouble; dfCMeridian:Tdouble; dfScale:Tdouble; dfFalseEasting:Tdouble; 
           dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Orthographic  }
function OSRSetOrthographic(hSRS:TOGRSpatialReferenceH; dfCenterLat:Tdouble; dfCenterLong:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Polyconic  }
function OSRSetPolyconic(hSRS:TOGRSpatialReferenceH; dfCenterLat:Tdouble; dfCenterLong:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Polar Stereographic  }
function OSRSetPS(hSRS:TOGRSpatialReferenceH; dfCenterLat:Tdouble; dfCenterLong:Tdouble; dfScale:Tdouble; dfFalseEasting:Tdouble; 
           dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Robinson  }
function OSRSetRobinson(hSRS:TOGRSpatialReferenceH; dfCenterLong:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Sinusoidal  }
function OSRSetSinusoidal(hSRS:TOGRSpatialReferenceH; dfCenterLong:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Stereographic  }
function OSRSetStereographic(hSRS:TOGRSpatialReferenceH; dfCenterLat:Tdouble; dfCenterLong:Tdouble; dfScale:Tdouble; dfFalseEasting:Tdouble; 
           dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Swiss Oblique Cylindrical  }
function OSRSetSOC(hSRS:TOGRSpatialReferenceH; dfLatitudeOfOrigin:Tdouble; dfCentralMeridian:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Transverse Mercator
 *
 * Special processing available for Transverse Mercator with GDAL &gt;= 1.10 and
 * PROJ &gt;= 4.8 : see OGRSpatialReference::exportToProj4().
  }
function OSRSetTM(hSRS:TOGRSpatialReferenceH; dfCenterLat:Tdouble; dfCenterLong:Tdouble; dfScale:Tdouble; dfFalseEasting:Tdouble; 
           dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Transverse Mercator variant  }
function OSRSetTMVariant(hSRS:TOGRSpatialReferenceH; pszVariantName:Pchar; dfCenterLat:Tdouble; dfCenterLong:Tdouble; dfScale:Tdouble; 
           dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Tunesia Mining Grid   }
function OSRSetTMG(hSRS:TOGRSpatialReferenceH; dfCenterLat:Tdouble; dfCenterLong:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Transverse Mercator (South Oriented)  }
function OSRSetTMSO(hSRS:TOGRSpatialReferenceH; dfCenterLat:Tdouble; dfCenterLong:Tdouble; dfScale:Tdouble; dfFalseEasting:Tdouble; 
           dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* TPED (Two Point Equi Distant)  }
function OSRSetTPED(hSRS:TOGRSpatialReferenceH; dfLat1:Tdouble; dfLong1:Tdouble; dfLat2:Tdouble; dfLong2:Tdouble; 
           dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* VanDerGrinten  }
function OSRSetVDG(hSRS:TOGRSpatialReferenceH; dfCenterLong:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Wagner I -- VII  }
function OSRSetWagner(hSRS:TOGRSpatialReferenceH; nVariation:longint; dfCenterLat:Tdouble; dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
{* Quadrilateralized Spherical Cube  }
function OSRSetQSC(hSRS:TOGRSpatialReferenceH; dfCenterLat:Tdouble; dfCenterLong:Tdouble):TOGRErr;cdecl;external libgdal;
{* Spherical, Cross-track, Height  }
function OSRSetSCH(hSRS:TOGRSpatialReferenceH; dfPegLat:Tdouble; dfPegLong:Tdouble; dfPegHeading:Tdouble; dfPegHgt:Tdouble):TOGRErr;cdecl;external libgdal;
{* Vertical Perspective / Near-sided Perspective  }
function OSRSetVerticalPerspective(hSRS:TOGRSpatialReferenceH; dfTopoOriginLat:Tdouble; dfTopoOriginLon:Tdouble; dfTopoOriginHeight:Tdouble; dfViewPointHeight:Tdouble; 
           dfFalseEasting:Tdouble; dfFalseNorthing:Tdouble):TOGRErr;cdecl;external libgdal;
function OSRCalcInvFlattening(dfSemiMajor:Tdouble; dfSemiMinor:Tdouble):Tdouble;cdecl;external libgdal;
function OSRCalcSemiMinorFromInvFlattening(dfSemiMajor:Tdouble; dfInvFlattening:Tdouble):Tdouble;cdecl;external libgdal;
procedure OSRCleanup;cdecl;external libgdal;
{* \brief Type of Coordinate Reference System (CRS).  }
{* Geographic 2D CRS  }
{* Geographic 3D CRS  }
{* Geocentric CRS  }
{* Projected CRS  }
{* Vertical CRS  }
{* Compound CRS  }
{* Other  }
type
  POSRCRSType = ^TOSRCRSType;
  TOSRCRSType =  Longint;
  Const
    OSR_CRS_TYPE_GEOGRAPHIC_2D = 0;
    OSR_CRS_TYPE_GEOGRAPHIC_3D = 1;
    OSR_CRS_TYPE_GEOCENTRIC = 2;
    OSR_CRS_TYPE_PROJECTED = 3;
    OSR_CRS_TYPE_VERTICAL = 4;
    OSR_CRS_TYPE_COMPOUND = 5;
    OSR_CRS_TYPE_OTHER = 6;
;
{* \brief Structure given overall description of a CRS.
 *
 * This structure may grow over time, and should not be directly allocated by
 * client code.
  }
{* Authority name.  }
{* Object code.  }
{* Object name.  }
{* Object type.  }
{* Whether the object is deprecated  }
{* Whereas the west_lon_degree, south_lat_degree, east_lon_degree and
     * north_lat_degree fields are valid.  }
{* Western-most longitude of the area of use, in degrees.  }
{* Southern-most latitude of the area of use, in degrees.  }
{* Eastern-most longitude of the area of use, in degrees.  }
{* Northern-most latitude of the area of use, in degrees.  }
{* Name of the area of use.  }
{* Name of the projection method for a projected CRS. Might be NULL even
     *for projected CRS in some cases.  }
type
  POSRCRSInfo = ^TOSRCRSInfo;
  TOSRCRSInfo = record
      pszAuthName : Pchar;
      pszCode : Pchar;
      pszName : Pchar;
      eType : TOSRCRSType;
      bDeprecated : longint;
      bBboxValid : longint;
      dfWestLongitudeDeg : Tdouble;
      dfSouthLatitudeDeg : Tdouble;
      dfEastLongitudeDeg : Tdouble;
      dfNorthLatitudeDeg : Tdouble;
      pszAreaName : Pchar;
      pszProjectionMethod : Pchar;
    end;
{* \brief Structure to describe optional parameters to
 * OSRGetCRSInfoListFromDatabase()
 *
 * Unused for now.
  }

function OSRGetCRSInfoListFromDatabase(pszAuthName:Pchar; params:POSRCRSListParameters; pnOutResultCount:Plongint):^POSRCRSInfo;cdecl;external libgdal;
procedure OSRDestroyCRSInfoList(list:PPOSRCRSInfo);cdecl;external libgdal;
{ --------------------------------------------------------------------  }
{      OGRCoordinateTransform C API.                                    }
{ --------------------------------------------------------------------  }
function OCTNewCoordinateTransformation(hSourceSRS:TOGRSpatialReferenceH; hTargetSRS:TOGRSpatialReferenceH):TOGRCoordinateTransformationH;cdecl;external libgdal;
{* Coordinate transformation options.  }
type
  POGRCoordinateTransformationOptionsH = ^TOGRCoordinateTransformationOptionsH;
  TOGRCoordinateTransformationOptionsH = POGRCoordinateTransformationOptions;

function OCTNewCoordinateTransformationOptions:TOGRCoordinateTransformationOptionsH;cdecl;external libgdal;
function OCTCoordinateTransformationOptionsSetOperation(hOptions:TOGRCoordinateTransformationOptionsH; pszCO:Pchar; bReverseCO:longint):longint;cdecl;external libgdal;
function OCTCoordinateTransformationOptionsSetAreaOfInterest(hOptions:TOGRCoordinateTransformationOptionsH; dfWestLongitudeDeg:Tdouble; dfSouthLatitudeDeg:Tdouble; dfEastLongitudeDeg:Tdouble; dfNorthLatitudeDeg:Tdouble):longint;cdecl;external libgdal;
function OCTCoordinateTransformationOptionsSetDesiredAccuracy(hOptions:TOGRCoordinateTransformationOptionsH; dfAccuracy:Tdouble):longint;cdecl;external libgdal;
function OCTCoordinateTransformationOptionsSetBallparkAllowed(hOptions:TOGRCoordinateTransformationOptionsH; bAllowBallpark:longint):longint;cdecl;external libgdal;
function OCTCoordinateTransformationOptionsSetOnlyBest(hOptions:TOGRCoordinateTransformationOptionsH; bOnlyBest:Tbool):longint;cdecl;external libgdal;
procedure OCTDestroyCoordinateTransformationOptions(para1:TOGRCoordinateTransformationOptionsH);cdecl;external libgdal;
function OCTNewCoordinateTransformationEx(hSourceSRS:TOGRSpatialReferenceH; hTargetSRS:TOGRSpatialReferenceH; hOptions:TOGRCoordinateTransformationOptionsH):TOGRCoordinateTransformationH;cdecl;external libgdal;
function OCTClone(hTransform:TOGRCoordinateTransformationH):TOGRCoordinateTransformationH;cdecl;external libgdal;
function OCTGetSourceCS(hTransform:TOGRCoordinateTransformationH):TOGRSpatialReferenceH;cdecl;external libgdal;
function OCTGetTargetCS(hTransform:TOGRCoordinateTransformationH):TOGRSpatialReferenceH;cdecl;external libgdal;
function OCTGetInverse(hTransform:TOGRCoordinateTransformationH):TOGRCoordinateTransformationH;cdecl;external libgdal;
procedure OCTDestroyCoordinateTransformation(para1:TOGRCoordinateTransformationH);cdecl;external libgdal;
function OCTTransform(hCT:TOGRCoordinateTransformationH; nCount:longint; x:Pdouble; y:Pdouble; z:Pdouble):longint;cdecl;external libgdal;
function OCTTransformEx(hCT:TOGRCoordinateTransformationH; nCount:longint; x:Pdouble; y:Pdouble; z:Pdouble; 
           pabSuccess:Plongint):longint;cdecl;external libgdal;
function OCTTransform4D(hCT:TOGRCoordinateTransformationH; nCount:longint; x:Pdouble; y:Pdouble; z:Pdouble; 
           t:Pdouble; pabSuccess:Plongint):longint;cdecl;external libgdal;
function OCTTransform4DWithErrorCodes(hCT:TOGRCoordinateTransformationH; nCount:longint; x:Pdouble; y:Pdouble; z:Pdouble; 
           t:Pdouble; panErrorCodes:Plongint):longint;cdecl;external libgdal;
function OCTTransformBounds(hCT:TOGRCoordinateTransformationH; xmin:Tdouble; ymin:Tdouble; xmax:Tdouble; ymax:Tdouble; 
           out_xmin:Pdouble; out_ymin:Pdouble; out_xmax:Pdouble; out_ymax:Pdouble; densify_pts:longint):longint;cdecl;external libgdal;
{$endif}
{ ndef SWIG  }
{$endif}
{ ndef OGR_SRS_API_H_INCLUDED  }

// === Konventiert am: 2-10-26 16:59:45 ===


implementation



end.
