unit stride_info;

interface

uses
  fp_isl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Use of this software is governed by the MIT license
  }
{$ifndef ISL_STRIDE_INFO_H}
{$define ISL_STRIDE_INFO_H}
{$include <isl/val_type.h>}
{$include <isl/aff_type.h>}
{$if defined(__cplusplus)}
{$endif}
type
  Pisl_stride_info = ^Tisl_stride_info;
  Tisl_stride_info = record
      {undefined structure}
    end;


function isl_stride_info_get_ctx(si:Pisl_stride_info):Pisl_ctx;cdecl;external libisl;
function isl_stride_info_get_stride(si:Pisl_stride_info):Pisl_val;cdecl;external libisl;
function isl_stride_info_get_offset(si:Pisl_stride_info):Pisl_aff;cdecl;external libisl;
function isl_stride_info_free(si:Pisl_stride_info):Pisl_stride_info;cdecl;external libisl;
function isl_stride_info_copy(si:Pisl_stride_info):Pisl_stride_info;cdecl;external libisl;
{$endif}

// === Konventiert am: 5-11-26 16:53:26 ===


implementation



end.
