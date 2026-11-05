unit ilp;

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
{$ifndef ISL_ILP_H}
{$define ISL_ILP_H}
{$include <isl/aff_type.h>}
{$include <isl/set_type.h>}
{$include <isl/union_set_type.h>}
{$include <isl/val_type.h>}
{$include <isl/vec.h>}
{$if defined(__cplusplus)}
{$endif}

function isl_basic_set_max_val(bset:Pisl_basic_set; obj:Pisl_aff):Pisl_val;cdecl;external libisl;
function isl_set_min_val(set:Pisl_set; obj:Pisl_aff):Pisl_val;cdecl;external libisl;
function isl_set_max_val(set:Pisl_set; obj:Pisl_aff):Pisl_val;cdecl;external libisl;
function isl_union_set_min_multi_union_pw_aff(uset:Pisl_union_set; obj:Pisl_multi_union_pw_aff):Pisl_multi_val;cdecl;external libisl;
function isl_pw_aff_min_val(pa:Pisl_pw_aff):Pisl_val;cdecl;external libisl;
function isl_pw_aff_max_val(pa:Pisl_pw_aff):Pisl_val;cdecl;external libisl;
function isl_pw_multi_aff_min_multi_val(pma:Pisl_pw_multi_aff):Pisl_multi_val;cdecl;external libisl;
function isl_pw_multi_aff_max_multi_val(pma:Pisl_pw_multi_aff):Pisl_multi_val;cdecl;external libisl;
function isl_multi_pw_aff_min_multi_val(mpa:Pisl_multi_pw_aff):Pisl_multi_val;cdecl;external libisl;
function isl_multi_pw_aff_max_multi_val(mpa:Pisl_multi_pw_aff):Pisl_multi_val;cdecl;external libisl;
function isl_union_pw_aff_min_val(upa:Pisl_union_pw_aff):Pisl_val;cdecl;external libisl;
function isl_union_pw_aff_max_val(upa:Pisl_union_pw_aff):Pisl_val;cdecl;external libisl;
function isl_multi_union_pw_aff_min_multi_val(mupa:Pisl_multi_union_pw_aff):Pisl_multi_val;cdecl;external libisl;
function isl_multi_union_pw_aff_max_multi_val(mupa:Pisl_multi_union_pw_aff):Pisl_multi_val;cdecl;external libisl;
function isl_basic_set_dim_max_val(bset:Pisl_basic_set; pos:longint):Pisl_val;cdecl;external libisl;
function isl_set_dim_min_val(set:Pisl_set; pos:longint):Pisl_val;cdecl;external libisl;
function isl_set_dim_max_val(set:Pisl_set; pos:longint):Pisl_val;cdecl;external libisl;
{$endif}

// === Konventiert am: 5-11-26 15:28:57 ===


implementation



end.
