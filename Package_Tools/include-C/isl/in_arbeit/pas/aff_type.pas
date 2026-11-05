unit aff_type;

interface

uses
  fp_isl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ISL_AFF_TYPE_H}
{$define ISL_AFF_TYPE_H}
{$include <isl/list.h>}
{$if defined(__cplusplus)}
{$endif}
type
  Pisl_aff = ^Tisl_aff;
  Tisl_aff = record
      {undefined structure}
    end;

  Pisl_aff = ^Tisl_aff;
  Tisl_aff = record
      {undefined structure}
    end;

  Pisl_pw_aff = ^Tisl_pw_aff;
  Tisl_pw_aff = record
      {undefined structure}
    end;

  Pisl_pw_aff_list = ^Tisl_pw_aff_list;
  Tisl_pw_aff_list = record
      {undefined structure}
    end;

  Pisl_union_pw_aff = ^Tisl_union_pw_aff;
  Tisl_union_pw_aff = record
      {undefined structure}
    end;

  Pisl_union_pw_aff_list = ^Tisl_union_pw_aff_list;
  Tisl_union_pw_aff_list = record
      {undefined structure}
    end;

  Pisl_multi_aff = ^Tisl_multi_aff;
  Tisl_multi_aff = record
      {undefined structure}
    end;

  Pisl_pw_multi_aff = ^Tisl_pw_multi_aff;
  Tisl_pw_multi_aff = record
      {undefined structure}
    end;

  Pisl_pw_multi_aff = ^Tisl_pw_multi_aff;
  Tisl_pw_multi_aff = record
      {undefined structure}
    end;

  Pisl_pw_multi_aff_list = ^Tisl_pw_multi_aff_list;
  Tisl_pw_multi_aff_list = record
      {undefined structure}
    end;

  Pisl_union_pw_multi_aff = ^Tisl_union_pw_multi_aff;
  Tisl_union_pw_multi_aff = record
      {undefined structure}
    end;

  Pisl_union_pw_multi_aff = ^Tisl_union_pw_multi_aff;
  Tisl_union_pw_multi_aff = record
      {undefined structure}
    end;

  Pisl_union_pw_multi_aff_list = ^Tisl_union_pw_multi_aff_list;
  Tisl_union_pw_multi_aff_list = record
      {undefined structure}
    end;

  Pisl_multi_pw_aff = ^Tisl_multi_pw_aff;
  Tisl_multi_pw_aff = record
      {undefined structure}
    end;

  Pisl_multi_union_pw_aff = ^Tisl_multi_union_pw_aff;
  Tisl_multi_union_pw_aff = record
      {undefined structure}
    end;

{$endif}

// === Konventiert am: 4-11-26 19:46:44 ===


implementation



end.
