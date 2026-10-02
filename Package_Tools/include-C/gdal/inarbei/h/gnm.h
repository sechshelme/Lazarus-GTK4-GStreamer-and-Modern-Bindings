/******************************************************************************
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
 ****************************************************************************/

#ifndef GNM
#define GNM

#if defined(__cplusplus) && !defined(CPL_SUPRESS_CPLUSPLUS)
#include "ogrsf_frmts.h"
#endif
#include "gnmgraph.h"

// Direction of an edge.
typedef int GNMDirection;  // We use int values in order to save them to the
                           // network data.

// Network's metadata parameters names.
#define GNM_MD_NAME "net_name"
#define GNM_MD_DESCR "net_description"
#define GNM_MD_SRS "net_srs"
#define GNM_MD_VERSION "net_version"
#define GNM_MD_RULE "net_rule"
#define GNM_MD_FORMAT "FORMAT"
#define GNM_MD_FETCHEDGES "fetch_edge"
#define GNM_MD_FETCHVERTEX "fetch_vertex"
#define GNM_MD_NUM_PATHS "num_paths"
#define GNM_MD_EMITTER "emitter"

// TODO: Constants for capabilities.
// #define GNMCanChangeConnections "CanChangeConnections"

typedef enum
{
    /** Dijkstra shortest path */ GATDijkstraShortestPath = 1,
    /** KShortest Paths        */ GATKShortestPath,
    /** Recursive Breadth-first search */ GATConnectedComponents
} GNMGraphAlgorithmType;

#if defined(__cplusplus) && !defined(CPL_SUPRESS_CPLUSPLUS)

/**
 * General GNM class which represents a geography network of common format.
 *
 * @since GDAL 2.1
 */


typedef enum
{
    /** Rule for connect features */ GRTConnection = 0
} GNMRuleType;

/**
 * @brief The simple class for rules
 *
 * By now we have only connect rules, so the one class is enough. Maybe in
 * future the set of classes for different rule types will be needed.
 *
 * @since GDAL 2.1
 */


