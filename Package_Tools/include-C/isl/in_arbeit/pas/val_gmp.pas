unit val_gmp;

interface

uses
  fp_isl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ISL_VAL_GMP_H}
{$define ISL_VAL_GMP_H}
{$include <gmp.h>}
{$include <isl/val_type.h>}
{$if defined(__cplusplus)}
{$endif}

function isl_val_int_from_gmp(ctx:Pisl_ctx; z:Tmpz_t):Pisl_val;cdecl;external libisl;
function isl_val_from_gmp(ctx:Pisl_ctx; n:Tmpz_t; d:Tmpz_t):Pisl_val;cdecl;external libisl;
function isl_val_get_num_gmp(v:Pisl_val; z:Tmpz_t):longint;cdecl;external libisl;
function isl_val_get_den_gmp(v:Pisl_val; z:Tmpz_t):longint;cdecl;external libisl;
{$endif}

// === Konventiert am: 5-11-26 16:55:36 ===


implementation



end.
