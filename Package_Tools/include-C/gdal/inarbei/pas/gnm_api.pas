unit gnm_api;

interface

uses
  fp_gdal;

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

function GNMGetName(hNet:TGNMNetworkH):Pchar;cdecl;external libgdal;
function GNMGetVersion(hNet:TGNMNetworkH):longint;cdecl;external libgdal;
function GNMDisconnectAll(hNet:TGNMNetworkH):TCPLErr;cdecl;external libgdal;
function GNMGetFeatureByGlobalFID(hNet:TGNMNetworkH; nGFID:TGNMGFID):TOGRFeatureH;cdecl;external libgdal;
function GNMGetPath(hNet:TGNMNetworkH; nStartFID:TGNMGFID; nEndFID:TGNMGFID; eAlgorithm:TGNMGraphAlgorithmType; papszOptions:PPchar):TOGRLayerH;cdecl;external libgdal;
function GNMConnectFeatures(hNet:TGNMGenericNetworkH; nSrcFID:TGNMGFID; nTgtFID:TGNMGFID; nConFID:TGNMGFID; dfCost:Tdouble; 
           dfInvCost:Tdouble; eDir:TGNMDirection):TCPLErr;cdecl;external libgdal;
function GNMDisconnectFeatures(hNet:TGNMGenericNetworkH; nSrcFID:TGNMGFID; nTgtFID:TGNMGFID; nConFID:TGNMGFID):TCPLErr;cdecl;external libgdal;
function GNMDisconnectFeaturesWithId(hNet:TGNMGenericNetworkH; nFID:TGNMGFID):TCPLErr;cdecl;external libgdal;
function GNMReconnectFeatures(hNet:TGNMGenericNetworkH; nSrcFID:TGNMGFID; nTgtFID:TGNMGFID; nConFID:TGNMGFID; dfCost:Tdouble; 
           dfInvCost:Tdouble; eDir:TGNMDirection):TCPLErr;cdecl;external libgdal;
function GNMCreateRule(hNet:TGNMGenericNetworkH; pszRuleStr:Pchar):TCPLErr;cdecl;external libgdal;
function GNMDeleteAllRules(hNet:TGNMGenericNetworkH):TCPLErr;cdecl;external libgdal;
function GNMDeleteRule(hNet:TGNMGenericNetworkH; pszRuleStr:Pchar):TCPLErr;cdecl;external libgdal;
function GNMGetRules(hNet:TGNMGenericNetworkH):^Pchar;cdecl;external libgdal;
function GNMConnectPointsByLines(hNet:TGNMGenericNetworkH; papszLayerList:PPchar; dfTolerance:Tdouble; dfCost:Tdouble; dfInvCost:Tdouble; 
           eDir:TGNMDirection):TCPLErr;cdecl;external libgdal;
function GNMChangeBlockState(hNet:TGNMGenericNetworkH; nFID:TGNMGFID; bIsBlock:Tbool):TCPLErr;cdecl;external libgdal;
function GNMChangeAllBlockState(hNet:TGNMGenericNetworkH; bIsBlock:longint):TCPLErr;cdecl;external libgdal;
function GNMCastToNetwork(hBase:TGDALMajorObjectH):TGNMNetworkH;cdecl;external libgdal;
function GNMCastToGenericNetwork(hBase:TGDALMajorObjectH):TGNMGenericNetworkH;cdecl;external libgdal;
{$endif}
{ GNM_API }

// === Konventiert am: 2-10-26 16:54:25 ===


implementation



end.
