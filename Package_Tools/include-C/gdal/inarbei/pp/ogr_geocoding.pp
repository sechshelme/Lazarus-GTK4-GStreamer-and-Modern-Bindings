
unit ogr_geocoding;
interface

{
  Automatically converted by H2Pas 1.0.0 from ogr_geocoding.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ogr_geocoding.h
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
POGRGeocodingSessionH  = ^OGRGeocodingSessionH;
POGRGeocodingSessionHS  = ^OGRGeocodingSessionHS;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*****************************************************************************
 * $Id$
 *
 * Project:  OpenGIS Simple Features Reference Implementation
 * Purpose:  Client of geocoding service.
 * Author:   Even Rouault, <even dot rouault at spatialys.com>
 *
 ******************************************************************************
 * Copyright (c) 2012, Even Rouault <even dot rouault at spatialys.com>
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
{$ifndef OGR_GEOCODING_H_INCLUDED}
{$define OGR_GEOCODING_H_INCLUDED}
{$include "cpl_port.h"}
{$include "ogr_api.h"}
{*
 * \file ogr_geocoding.h
 *
 * C API for geocoding client.
  }
{* Opaque type for a geocoding session  }
type
  POGRGeocodingSessionH = ^TOGRGeocodingSessionH;
  TOGRGeocodingSessionH = POGRGeocodingSessionHS;

function OGRGeocodeCreateSession(papszOptions:PPchar):TOGRGeocodingSessionH;cdecl;external;
procedure OGRGeocodeDestroySession(hSession:TOGRGeocodingSessionH);cdecl;external;
(* Const before type ignored *)
function OGRGeocode(hSession:TOGRGeocodingSessionH; pszQuery:Pchar; papszStructuredQuery:PPchar; papszOptions:PPchar):TOGRLayerH;cdecl;external;
function OGRGeocodeReverse(hSession:TOGRGeocodingSessionH; dfLon:Tdouble; dfLat:Tdouble; papszOptions:PPchar):TOGRLayerH;cdecl;external;
procedure OGRGeocodeFreeResult(hLayer:TOGRLayerH);cdecl;external;
{$endif}
{ OGR_GEOCODING_H_INCLUDED }

implementation


end.
