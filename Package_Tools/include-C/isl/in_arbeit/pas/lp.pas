unit lp;

interface

uses
  fp_isl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2008-2009 Katholieke Universiteit Leuven
 *
 * Use of this software is governed by the MIT license
 *
 * Written by Sven Verdoolaege, K.U.Leuven, Departement
 * Computerwetenschappen, Celestijnenlaan 200A, B-3001 Leuven, Belgium
  }
{$ifndef ISL_LP_H}
{$define ISL_LP_H}
{$include <isl/aff.h>}
{$include <isl/val_type.h>}
{$include <isl/set_type.h>}
type
  Tisl_lp_result =  Longint;
  Const
    isl_lp_error = -(1);
    isl_lp_ok = 0;
    isl_lp_unbounded = 1;
    isl_lp_empty = 2;

{$if defined(__cplusplus)}
{$endif}

function isl_basic_set_min_lp_val(bset:Pisl_basic_set; obj:Pisl_aff):Pisl_val;cdecl;external libisl;
function isl_basic_set_max_lp_val(bset:Pisl_basic_set; obj:Pisl_aff):Pisl_val;cdecl;external libisl;
{$endif}

// === Konventiert am: 5-11-26 15:29:02 ===


implementation



end.
