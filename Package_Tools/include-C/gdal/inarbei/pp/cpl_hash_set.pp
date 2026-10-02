
unit cpl_hash_set;
interface

{
  Automatically converted by H2Pas 1.0.0 from cpl_hash_set.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cpl_hash_set.h
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
PCPLHashSet  = ^CPLHashSet;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*********************************************************************
 * $Id$
 *
 * Name:     cpl_hash_set.h
 * Project:  CPL - Common Portability Library
 * Purpose:  Hash set functions.
 * Author:   Even Rouault, <even dot rouault at spatialys.com>
 *
 **********************************************************************
 * Copyright (c) 2008-2009, Even Rouault <even dot rouault at spatialys.com>
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
{$ifndef CPL_HASH_SET_H_INCLUDED}
{$define CPL_HASH_SET_H_INCLUDED}
{$include "cpl_port.h"}
{*
 * \file cpl_hash_set.h
 *
 * Hash set implementation.
 *
 * An hash set is a data structure that holds elements that are unique
 * according to a comparison function. Operations on the hash set, such as
 * insertion, removal or lookup, are supposed to be fast if an efficient
 * "hash" function is provided.
  }
{ Types  }
{* Opaque type for a hash set  }
type
{* CPLHashSetHashFunc  }
(* Const before type ignored *)

  TCPLHashSetHashFunc = function (elt:pointer):dword;cdecl;
{* CPLHashSetEqualFunc  }
(* Const before type ignored *)
(* Const before type ignored *)

  TCPLHashSetEqualFunc = function (elt1:pointer; elt2:pointer):longint;cdecl;
{* CPLHashSetFreeEltFunc  }

  TCPLHashSetFreeEltFunc = procedure (elt:pointer);cdecl;
{* CPLHashSetIterEltFunc  }

  TCPLHashSetIterEltFunc = function (elt:pointer; user_data:pointer):longint;cdecl;
{ Functions  }

function CPLHashSetNew(fnHashFunc:TCPLHashSetHashFunc; fnEqualFunc:TCPLHashSetEqualFunc; fnFreeEltFunc:TCPLHashSetFreeEltFunc):PCPLHashSet;cdecl;external;
procedure CPLHashSetDestroy(set:PCPLHashSet);cdecl;external;
procedure CPLHashSetClear(set:PCPLHashSet);cdecl;external;
(* Const before type ignored *)
function CPLHashSetSize(set:PCPLHashSet):longint;cdecl;external;
procedure CPLHashSetForeach(set:PCPLHashSet; fnIterFunc:TCPLHashSetIterEltFunc; user_data:pointer);cdecl;external;
function CPLHashSetInsert(set:PCPLHashSet; elt:pointer):longint;cdecl;external;
(* Const before type ignored *)
function CPLHashSetLookup(set:PCPLHashSet; elt:pointer):pointer;cdecl;external;
(* Const before type ignored *)
function CPLHashSetRemove(set:PCPLHashSet; elt:pointer):longint;cdecl;external;
(* Const before type ignored *)
function CPLHashSetRemoveDeferRehash(set:PCPLHashSet; elt:pointer):longint;cdecl;external;
(* Const before type ignored *)
function CPLHashSetHashPointer(elt:pointer):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CPLHashSetEqualPointer(elt1:pointer; elt2:pointer):longint;cdecl;external;
(* Const before type ignored *)
function CPLHashSetHashStr(pszStr:pointer):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CPLHashSetEqualStr(pszStr1:pointer; pszStr2:pointer):longint;cdecl;external;
{$endif}
{ CPL_HASH_SET_H_INCLUDED  }

implementation


end.
