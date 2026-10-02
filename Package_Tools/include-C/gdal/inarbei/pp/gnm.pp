
unit gnm;
interface

{
  Automatically converted by H2Pas 1.0.0 from gnm.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gnm.h
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
PGNMDirection  = ^GNMDirection;
PGNMGraphAlgorithmType  = ^GNMGraphAlgorithmType;
PGNMRuleType  = ^GNMRuleType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*****************************************************************************
 * $Id$
 *
 * Project:  GDAL/OGR Geography Network support (Geographic Network Model)
 * Purpose:  GNM general public declarations.
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
{$ifndef GNM}
{$define GNM}
{$if defined(__cplusplus) && !defined(CPL_SUPRESS_CPLUSPLUS)}
{$include "ogrsf_frmts.h"}
{$endif}
{$include "gnmgraph.h"}
{ Direction of an edge. }
type
  PGNMDirection = ^TGNMDirection;
  TGNMDirection = longint;
{ We use int values in order to save them to the }
{ network data. }
{ Network's metadata parameters names. }

const
  GNM_MD_NAME = 'net_name';  
  GNM_MD_DESCR = 'net_description';  
  GNM_MD_SRS = 'net_srs';  
  GNM_MD_VERSION = 'net_version';  
  GNM_MD_RULE = 'net_rule';  
  GNM_MD_FORMAT = 'FORMAT';  
  GNM_MD_FETCHEDGES = 'fetch_edge';  
  GNM_MD_FETCHVERTEX = 'fetch_vertex';  
  GNM_MD_NUM_PATHS = 'num_paths';  
  GNM_MD_EMITTER = 'emitter';  
{ TODO: Constants for capabilities. }
{ #define GNMCanChangeConnections "CanChangeConnections" }
{* Dijkstra shortest path  }{* KShortest Paths         }{* Recursive Breadth-first search  }type
  PGNMGraphAlgorithmType = ^TGNMGraphAlgorithmType;
  TGNMGraphAlgorithmType =  Longint;
  Const
    GATDijkstraShortestPath = 1;
    GATKShortestPath = 2;
    GATConnectedComponents = 3;
;
{$if defined(__cplusplus) && !defined(CPL_SUPRESS_CPLUSPLUS)}
{*
 * General GNM class which represents a geography network of common format.
 *
 * @since GDAL 2.1
  }
{* Rule for connect features  }type
  PGNMRuleType = ^TGNMRuleType;
  TGNMRuleType =  Longint;
  Const
    GRTConnection = 0;
;
{*
 * @brief The simple class for rules
 *
 * By now we have only connect rules, so the one class is enough. Maybe in
 * future the set of classes for different rule types will be needed.
 *
 * @since GDAL 2.1
  }

implementation


end.
