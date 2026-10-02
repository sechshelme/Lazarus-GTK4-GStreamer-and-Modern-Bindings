
unit cpl_quad_tree;
interface

{
  Automatically converted by H2Pas 1.0.0 from cpl_quad_tree.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cpl_quad_tree.h
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
PCPLQuadTree  = ^CPLQuadTree;
PCPLRectObj  = ^CPLRectObj;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*********************************************************************
 * $Id$
 *
 * Project:  CPL - Common Portability Library
 * Purpose:  Implementation of quadtree building and searching functions.
 *           Derived from shapelib and mapserver implementations
 * Author:   Frank Warmerdam, warmerdam@pobox.com
 *           Even Rouault, <even dot rouault at spatialys.com>
 *
 ******************************************************************************
 * Copyright (c) 1999-2008, Frank Warmerdam
 * Copyright (c) 2008-2014, Even Rouault <even dot rouault at spatialys.com>
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
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *************************************************************************** }
{$ifndef CPL_QUAD_TREE_H_INCLUDED}
{$define CPL_QUAD_TREE_H_INCLUDED}
{$include "cpl_port.h"}
{$include <stdbool.h>}
{*
 * \file cpl_quad_tree.h
 *
 * Quad tree implementation.
 *
 * A quadtree is a tree data structure in which each internal node
 * has up to four children. Quadtrees are most often used to partition
 * a two dimensional space by recursively subdividing it into four
 * quadrants or regions
  }
{ Types  }
{* Describe a rectangle  }
{*< Minimum x  }
{*< Minimum y  }
{*< Maximum x  }
{*< Maximum y  }
type
  PCPLRectObj = ^TCPLRectObj;
  TCPLRectObj = record
      minx : Tdouble;
      miny : Tdouble;
      maxx : Tdouble;
      maxy : Tdouble;
    end;
{* Opaque type for a quad tree  }
{* CPLQuadTreeGetBoundsFunc  }
(* Const before type ignored *)

  TCPLQuadTreeGetBoundsFunc = procedure (hFeature:pointer; pBounds:PCPLRectObj);cdecl;
{* CPLQuadTreeGetBoundsExFunc  }
(* Const before type ignored *)

  TCPLQuadTreeGetBoundsExFunc = procedure (hFeature:pointer; pUserData:pointer; pBounds:PCPLRectObj);cdecl;
{* CPLQuadTreeForeachFunc  }

  TCPLQuadTreeForeachFunc = function (pElt:pointer; pUserData:pointer):longint;cdecl;
{* CPLQuadTreeDumpFeatureFunc  }
(* Const before type ignored *)

  TCPLQuadTreeDumpFeatureFunc = procedure (hFeature:pointer; nIndentLevel:longint; pUserData:pointer);cdecl;
{ Functions  }
(* Const before type ignored *)

function CPLQuadTreeCreate(pGlobalBounds:PCPLRectObj; pfnGetBounds:TCPLQuadTreeGetBoundsFunc):PCPLQuadTree;cdecl;external;
(* Const before type ignored *)
function CPLQuadTreeCreateEx(pGlobalBounds:PCPLRectObj; pfnGetBounds:TCPLQuadTreeGetBoundsExFunc; pUserData:pointer):PCPLQuadTree;cdecl;external;
procedure CPLQuadTreeDestroy(hQuadtree:PCPLQuadTree);cdecl;external;
procedure CPLQuadTreeSetBucketCapacity(hQuadtree:PCPLQuadTree; nBucketCapacity:longint);cdecl;external;
procedure CPLQuadTreeForceUseOfSubNodes(hQuadTree:PCPLQuadTree);cdecl;external;
function CPLQuadTreeGetAdvisedMaxDepth(nExpectedFeatures:longint):longint;cdecl;external;
procedure CPLQuadTreeSetMaxDepth(hQuadtree:PCPLQuadTree; nMaxDepth:longint);cdecl;external;
procedure CPLQuadTreeInsert(hQuadtree:PCPLQuadTree; hFeature:pointer);cdecl;external;
(* Const before type ignored *)
procedure CPLQuadTreeInsertWithBounds(hQuadtree:PCPLQuadTree; hFeature:pointer; psBounds:PCPLRectObj);cdecl;external;
(* Const before type ignored *)
procedure CPLQuadTreeRemove(hQuadtree:PCPLQuadTree; hFeature:pointer; psBounds:PCPLRectObj);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CPLQuadTreeSearch(hQuadtree:PCPLQuadTree; pAoi:PCPLRectObj; pnFeatureCount:Plongint):^pointer;cdecl;external;
(* Const before type ignored *)
procedure CPLQuadTreeForeach(hQuadtree:PCPLQuadTree; pfnForeach:TCPLQuadTreeForeachFunc; pUserData:pointer);cdecl;external;
(* Const before type ignored *)
procedure CPLQuadTreeDump(hQuadtree:PCPLQuadTree; pfnDumpFeatureFunc:TCPLQuadTreeDumpFeatureFunc; pUserData:pointer);cdecl;external;
(* Const before type ignored *)
procedure CPLQuadTreeGetStats(hQuadtree:PCPLQuadTree; pnFeatureCount:Plongint; pnNodeCount:Plongint; pnMaxDepth:Plongint; pnMaxBucketCapacity:Plongint);cdecl;external;
{$endif}

implementation


end.
