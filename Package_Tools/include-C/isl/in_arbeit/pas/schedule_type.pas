unit schedule_type;

interface

uses
  fp_isl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ISL_SCHEDULE_TYPE_H}
{$define ISL_SCHEDULE_TYPE_H}
{$if defined(__cplusplus)}
{$endif}
type
  Tisl_schedule_node_type =  Longint;
  Const
    isl_schedule_node_error = -(1);
    isl_schedule_node_band = (-(1))+1;
    isl_schedule_node_context = (-(1))+2;
    isl_schedule_node_domain = (-(1))+3;
    isl_schedule_node_expansion = (-(1))+4;
    isl_schedule_node_extension = (-(1))+5;
    isl_schedule_node_filter = (-(1))+6;
    isl_schedule_node_leaf = (-(1))+7;
    isl_schedule_node_guard = (-(1))+8;
    isl_schedule_node_mark = (-(1))+9;
    isl_schedule_node_sequence = (-(1))+10;
    isl_schedule_node_set = (-(1))+11;

type
  Pisl_schedule_node = ^Tisl_schedule_node;
  Tisl_schedule_node = record
      {undefined structure}
    end;

  Pisl_schedule = ^Tisl_schedule;
  Tisl_schedule = record
      {undefined structure}
    end;

{$endif}

// === Konventiert am: 5-11-26 15:53:51 ===


implementation



end.
