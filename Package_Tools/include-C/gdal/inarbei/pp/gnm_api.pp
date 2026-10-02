
unit gnm_api;
interface

{
  Automatically converted by H2Pas 1.0.0 from gnm_api.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gnm_api.h
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
PGNMGenericNetworkH  = ^GNMGenericNetworkH;
PGNMNetworkH  = ^GNMNetworkH;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*****************************************************************************
 * $Id$
 *
 * Project:  GDAL/OGR Geography Network support (Geographic Network Model)
 * Purpose:  GNM C API.
 * Authors:  Mikhail Gusev (gusevmihs at gmail dot com)
 *           Dmitry Baryshnikov, polimax@mail.ru
 *
 ******************************************************************************
 * Copyright (c) 2014, Mikhail Gusev
 * Copyright (c) 2014-2015, NextGIS <info@nextgis.com>
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
{$ifndef GNM_API}
{$define GNM_API}
{$include "gnm.h"}
type
  PGNMNetworkH = ^TGNMNetworkH;
  TGNMNetworkH = pointer;

  PGNMGenericNetworkH = ^TGNMGenericNetworkH;
  TGNMGenericNetworkH = pointer;
(* Const before type ignored *)

function GNMGetName(hNet:TGNMNetworkH):Pchar;cdecl;external;
function GNMGetVersion(hNet:TGNMNetworkH):longint;cdecl;external;
function GNMDisconnectAll(hNet:TGNMNetworkH):TCPLErr;cdecl;external;
function GNMGetFeatureByGlobalFID(hNet:TGNMNetworkH; nGFID:TGNMGFID):TOGRFeatureH;cdecl;external;
function GNMGetPath(hNet:TGNMNetworkH; nStartFID:TGNMGFID; nEndFID:TGNMGFID; eAlgorithm:TGNMGraphAlgorithmType; papszOptions:PPchar):TOGRLayerH;cdecl;external;
function GNMConnectFeatures(hNet:TGNMGenericNetworkH; nSrcFID:TGNMGFID; nTgtFID:TGNMGFID; nConFID:TGNMGFID; dfCost:Tdouble; 
           dfInvCost:Tdouble; eDir:TGNMDirection):TCPLErr;cdecl;external;
function GNMDisconnectFeatures(hNet:TGNMGenericNetworkH; nSrcFID:TGNMGFID; nTgtFID:TGNMGFID; nConFID:TGNMGFID):TCPLErr;cdecl;external;
function GNMDisconnectFeaturesWithId(hNet:TGNMGenericNetworkH; nFID:TGNMGFID):TCPLErr;cdecl;external;
function GNMReconnectFeatures(hNet:TGNMGenericNetworkH; nSrcFID:TGNMGFID; nTgtFID:TGNMGFID; nConFID:TGNMGFID; dfCost:Tdouble; 
           dfInvCost:Tdouble; eDir:TGNMDirection):TCPLErr;cdecl;external;
(* Const before type ignored *)
function GNMCreateRule(hNet:TGNMGenericNetworkH; pszRuleStr:Pchar):TCPLErr;cdecl;external;
function GNMDeleteAllRules(hNet:TGNMGenericNetworkH):TCPLErr;cdecl;external;
(* Const before type ignored *)
function GNMDeleteRule(hNet:TGNMGenericNetworkH; pszRuleStr:Pchar):TCPLErr;cdecl;external;
function GNMGetRules(hNet:TGNMGenericNetworkH):^Pchar;cdecl;external;
function GNMConnectPointsByLines(hNet:TGNMGenericNetworkH; papszLayerList:PPchar; dfTolerance:Tdouble; dfCost:Tdouble; dfInvCost:Tdouble; 
           eDir:TGNMDirection):TCPLErr;cdecl;external;
function GNMChangeBlockState(hNet:TGNMGenericNetworkH; nFID:TGNMGFID; bIsBlock:Tbool):TCPLErr;cdecl;external;
function GNMChangeAllBlockState(hNet:TGNMGenericNetworkH; bIsBlock:longint):TCPLErr;cdecl;external;
function GNMCastToNetwork(hBase:TGDALMajorObjectH):TGNMNetworkH;cdecl;external;
function GNMCastToGenericNetwork(hBase:TGDALMajorObjectH):TGNMGenericNetworkH;cdecl;external;
{$endif}
{ GNM_API }

implementation


end.
