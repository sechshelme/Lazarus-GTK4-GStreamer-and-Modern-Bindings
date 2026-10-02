unit cpl_hash_set;

interface

uses
  fp_gdal;

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

  TCPLHashSetHashFunc = function (elt:pointer):dword;cdecl;
{* CPLHashSetEqualFunc  }

  TCPLHashSetEqualFunc = function (elt1:pointer; elt2:pointer):longint;cdecl;
{* CPLHashSetFreeEltFunc  }

  TCPLHashSetFreeEltFunc = procedure (elt:pointer);cdecl;
{* CPLHashSetIterEltFunc  }

  TCPLHashSetIterEltFunc = function (elt:pointer; user_data:pointer):longint;cdecl;
{ Functions  }

function CPLHashSetNew(fnHashFunc:TCPLHashSetHashFunc; fnEqualFunc:TCPLHashSetEqualFunc; fnFreeEltFunc:TCPLHashSetFreeEltFunc):PCPLHashSet;cdecl;external libgdal;
procedure CPLHashSetDestroy(set:PCPLHashSet);cdecl;external libgdal;
procedure CPLHashSetClear(set:PCPLHashSet);cdecl;external libgdal;
function CPLHashSetSize(set:PCPLHashSet):longint;cdecl;external libgdal;
procedure CPLHashSetForeach(set:PCPLHashSet; fnIterFunc:TCPLHashSetIterEltFunc; user_data:pointer);cdecl;external libgdal;
function CPLHashSetInsert(set:PCPLHashSet; elt:pointer):longint;cdecl;external libgdal;
function CPLHashSetLookup(set:PCPLHashSet; elt:pointer):pointer;cdecl;external libgdal;
function CPLHashSetRemove(set:PCPLHashSet; elt:pointer):longint;cdecl;external libgdal;
function CPLHashSetRemoveDeferRehash(set:PCPLHashSet; elt:pointer):longint;cdecl;external libgdal;
function CPLHashSetHashPointer(elt:pointer):dword;cdecl;external libgdal;
function CPLHashSetEqualPointer(elt1:pointer; elt2:pointer):longint;cdecl;external libgdal;
function CPLHashSetHashStr(pszStr:pointer):dword;cdecl;external libgdal;
function CPLHashSetEqualStr(pszStr1:pointer; pszStr2:pointer):longint;cdecl;external libgdal;
{$endif}
{ CPL_HASH_SET_H_INCLUDED  }

// === Konventiert am: 2-10-26 15:57:13 ===


implementation



end.
