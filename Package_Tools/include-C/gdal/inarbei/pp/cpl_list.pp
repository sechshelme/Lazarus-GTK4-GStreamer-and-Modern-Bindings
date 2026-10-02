
unit cpl_list;
interface

{
  Automatically converted by H2Pas 1.0.0 from cpl_list.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cpl_list.h
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
PCPLList  = ^CPLList;
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


function CPLListAppend(psList:PCPLList; pData:pointer):PCPLList;cdecl;external;
function CPLListInsert(psList:PCPLList; pData:pointer; nPosition:longint):PCPLList;cdecl;external;
function CPLListGetLast(psList:PCPLList):PCPLList;cdecl;external;
(* Const before declarator ignored *)
function CPLListGet(psList:PCPLList; nPosition:longint):PCPLList;cdecl;external;
(* Const before type ignored *)
function CPLListCount(psList:PCPLList):longint;cdecl;external;
function CPLListRemove(psList:PCPLList; nPosition:longint):PCPLList;cdecl;external;
procedure CPLListDestroy(psList:PCPLList);cdecl;external;
(* Const before type ignored *)
function CPLListGetNext(psElement:PCPLList):PCPLList;cdecl;external;
(* Const before type ignored *)
function CPLListGetData(psElement:PCPLList):pointer;cdecl;external;
{$endif}
{ CPL_LIST_H_INCLUDED  }

implementation


end.
