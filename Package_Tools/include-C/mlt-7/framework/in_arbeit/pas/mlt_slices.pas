unit mlt_slices;

interface

uses
  fp_mlt;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file mlt_slices.h
 * \brief sliced threading processing helper
 * \see mlt_slices_s
 *
 * Copyright (C) 2016-2022 Meltytech, LLC
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
  }
{$ifndef MLT_SLICES_H}
{$define MLT_SLICES_H}
{$include "mlt_types.h"}
{*
 * \envvar \em MLT_SLICES_COUNT Set the number of slices to use, which
 * defaults to number of CPUs found.
  }
type
  Pmlt_slices_s = ^Tmlt_slices_s;
  Tmlt_slices_s = record
      {undefined structure}
    end;


  Tmlt_slices_proc = function (id:longint; idx:longint; jobs:longint; cookie:pointer):longint;cdecl;

function mlt_slices_count_normal:longint;cdecl;external libmlt;
function mlt_slices_count_rr:longint;cdecl;external libmlt;
function mlt_slices_count_fifo:longint;cdecl;external libmlt;
procedure mlt_slices_run_normal(jobs:longint; proc:Tmlt_slices_proc; cookie:pointer);cdecl;external libmlt;
procedure mlt_slices_run_rr(jobs:longint; proc:Tmlt_slices_proc; cookie:pointer);cdecl;external libmlt;
procedure mlt_slices_run_fifo(jobs:longint; proc:Tmlt_slices_proc; cookie:pointer);cdecl;external libmlt;
function mlt_slices_size_slice(jobs:longint; index:longint; input_size:longint; start:Plongint):longint;cdecl;external libmlt;
{$endif}

// === Konventiert am: 30-9-26 19:44:49 ===


implementation



end.
