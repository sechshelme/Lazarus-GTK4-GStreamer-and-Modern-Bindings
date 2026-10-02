unit cpl_list;

interface

uses
  fp_gdal;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*********************************************************************
 * $Id$
 *
 * Name:     cpl_list.h
 * Project:  CPL - Common Portability Library
 * Purpose:  List functions.
 * Author:   Andrey Kiselev, dron@remotesensing.org
 *
 **********************************************************************
 * Copyright (c) 2003, Andrey Kiselev <dron@remotesensing.org>
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
{$ifndef CPL_LIST_H_INCLUDED}
{$define CPL_LIST_H_INCLUDED}
{$include "cpl_port.h"}
{*
 * \file cpl_list.h
 *
 * Simplest list implementation.  List contains only pointers to stored
 * objects, not objects itself. All operations regarding allocation and
 * freeing memory for objects should be performed by the caller.
 *
  }
{* List element structure.  }
type
{* List element structure.  }
{! Pointer to the data object. Should be allocated and freed by the
     * caller.
     *  }
{! Pointer to the next element in list. NULL, if current element is the
     * last one.
      }
  PCPLList = ^TCPLList;
  TCPLList = record
      pData : pointer;
      psNext : PCPLList;
    end;


function CPLListAppend(psList:PCPLList; pData:pointer):PCPLList;cdecl;external libgdal;
function CPLListInsert(psList:PCPLList; pData:pointer; nPosition:longint):PCPLList;cdecl;external libgdal;
function CPLListGetLast(psList:PCPLList):PCPLList;cdecl;external libgdal;
function CPLListGet(psList:PCPLList; nPosition:longint):PCPLList;cdecl;external libgdal;
function CPLListCount(psList:PCPLList):longint;cdecl;external libgdal;
function CPLListRemove(psList:PCPLList; nPosition:longint):PCPLList;cdecl;external libgdal;
procedure CPLListDestroy(psList:PCPLList);cdecl;external libgdal;
function CPLListGetNext(psElement:PCPLList):PCPLList;cdecl;external libgdal;
function CPLListGetData(psElement:PCPLList):pointer;cdecl;external libgdal;
{$endif}
{ CPL_LIST_H_INCLUDED  }

// === Konventiert am: 2-10-26 16:20:14 ===


implementation



end.
