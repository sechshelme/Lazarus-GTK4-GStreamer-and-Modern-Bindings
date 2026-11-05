
unit flow;
interface

{
  Automatically converted by H2Pas 1.0.0 from flow.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    flow.h
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
Pchar  = ^char;
PFILE  = ^FILE;
Pisl_access_info  = ^isl_access_info;
Pisl_access_restrict  = ^isl_access_restrict;
Pisl_ctx  = ^isl_ctx;
Pisl_flow  = ^isl_flow;
Pisl_map  = ^isl_map;
Pisl_printer  = ^isl_printer;
Pisl_restriction  = ^isl_restriction;
Pisl_schedule  = ^isl_schedule;
Pisl_set  = ^isl_set;
Pisl_union_access_info  = ^isl_union_access_info;
Pisl_union_flow  = ^isl_union_flow;
Pisl_union_map  = ^isl_union_map;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ISL_FLOW_H}
{$define ISL_FLOW_H}
{$include <stdio.h>}
{$include <isl/set_type.h>}
{$include <isl/map_type.h>}
{$include <isl/union_set_type.h>}
{$include <isl/union_map_type.h>}
{$include <isl/schedule.h>}
{$include <isl/printer.h>}
{$if defined(__cplusplus)}
{$endif}
{ Let n (>= 0) be the number of iterators shared by first and second.
 * If first precedes second textually return 2 * n + 1,
 * otherwise return 2 * n.
  }
type

  Tisl_access_level_before = function (first:pointer; second:pointer):longint;cdecl;
  Pisl_restriction = ^Tisl_restriction;
  Tisl_restriction = record
      {undefined structure}
    end;


function isl_restriction_free(restr:Pisl_restriction):Pisl_restriction;cdecl;external;
function isl_restriction_empty(source_map:Pisl_map):Pisl_restriction;cdecl;external;
function isl_restriction_none(source_map:Pisl_map):Pisl_restriction;cdecl;external;
function isl_restriction_input(source_restr:Pisl_set; sink_restr:Pisl_set):Pisl_restriction;cdecl;external;
function isl_restriction_output(source_restr:Pisl_set):Pisl_restriction;cdecl;external;
function isl_restriction_get_ctx(restr:Pisl_restriction):Pisl_ctx;cdecl;external;
type
  Pisl_access_restrict = ^Tisl_access_restrict;
  Tisl_access_restrict = function (source_map:Pisl_map; sink:Pisl_set; source_user:pointer; user:pointer):Pisl_restriction;cdecl;
  Pisl_access_info = ^Tisl_access_info;
  Tisl_access_info = record
      {undefined structure}
    end;

  Pisl_flow = ^Tisl_flow;
  Tisl_flow = record
      {undefined structure}
    end;


function isl_access_info_alloc(sink:Pisl_map; sink_user:pointer; fn:Tisl_access_level_before; max_source:longint):Pisl_access_info;cdecl;external;
function isl_access_info_set_restrict(acc:Pisl_access_info; fn:Tisl_access_restrict; user:pointer):Pisl_access_info;cdecl;external;
function isl_access_info_add_source(acc:Pisl_access_info; source:Pisl_map; must:longint; source_user:pointer):Pisl_access_info;cdecl;external;
function isl_access_info_free(acc:Pisl_access_info):Pisl_access_info;cdecl;external;
function isl_access_info_get_ctx(acc:Pisl_access_info):Pisl_ctx;cdecl;external;
function isl_access_info_compute_flow(acc:Pisl_access_info):Pisl_flow;cdecl;external;
function isl_flow_foreach(deps:Pisl_flow; fn:function (dep:Pisl_map; must:longint; dep_user:pointer; user:pointer):Tisl_stat; user:pointer):Tisl_stat;cdecl;external;
function isl_flow_get_no_source(deps:Pisl_flow; must:longint):Pisl_map;cdecl;external;
function isl_flow_free(deps:Pisl_flow):Pisl_flow;cdecl;external;
function isl_flow_get_ctx(deps:Pisl_flow):Pisl_ctx;cdecl;external;
type
  Pisl_union_access_info = ^Tisl_union_access_info;
  Tisl_union_access_info = record
      {undefined structure}
    end;

  Pisl_union_flow = ^Tisl_union_flow;
  Tisl_union_flow = record
      {undefined structure}
    end;


function isl_union_access_info_from_sink(sink:Pisl_union_map):Pisl_union_access_info;cdecl;external;
function isl_union_access_info_set_must_source(access:Pisl_union_access_info; must_source:Pisl_union_map):Pisl_union_access_info;cdecl;external;
function isl_union_access_info_set_may_source(access:Pisl_union_access_info; may_source:Pisl_union_map):Pisl_union_access_info;cdecl;external;
function isl_union_access_info_set_kill(access:Pisl_union_access_info; kill:Pisl_union_map):Pisl_union_access_info;cdecl;external;
function isl_union_access_info_set_schedule(access:Pisl_union_access_info; schedule:Pisl_schedule):Pisl_union_access_info;cdecl;external;
function isl_union_access_info_set_schedule_map(access:Pisl_union_access_info; schedule_map:Pisl_union_map):Pisl_union_access_info;cdecl;external;
function isl_union_access_info_copy(access:Pisl_union_access_info):Pisl_union_access_info;cdecl;external;
function isl_union_access_info_free(access:Pisl_union_access_info):Pisl_union_access_info;cdecl;external;
function isl_union_access_info_get_ctx(access:Pisl_union_access_info):Pisl_ctx;cdecl;external;
function isl_union_access_info_read_from_file(ctx:Pisl_ctx; input:PFILE):Pisl_union_access_info;cdecl;external;
function isl_printer_print_union_access_info(p:Pisl_printer; access:Pisl_union_access_info):Pisl_printer;cdecl;external;
function isl_union_access_info_to_str(access:Pisl_union_access_info):Pchar;cdecl;external;
function isl_union_access_info_compute_flow(access:Pisl_union_access_info):Pisl_union_flow;cdecl;external;
function isl_union_flow_get_ctx(flow:Pisl_union_flow):Pisl_ctx;cdecl;external;
function isl_union_flow_copy(flow:Pisl_union_flow):Pisl_union_flow;cdecl;external;
function isl_union_flow_get_must_dependence(flow:Pisl_union_flow):Pisl_union_map;cdecl;external;
function isl_union_flow_get_may_dependence(flow:Pisl_union_flow):Pisl_union_map;cdecl;external;
function isl_union_flow_get_full_must_dependence(flow:Pisl_union_flow):Pisl_union_map;cdecl;external;
function isl_union_flow_get_full_may_dependence(flow:Pisl_union_flow):Pisl_union_map;cdecl;external;
function isl_union_flow_get_must_no_source(flow:Pisl_union_flow):Pisl_union_map;cdecl;external;
function isl_union_flow_get_may_no_source(flow:Pisl_union_flow):Pisl_union_map;cdecl;external;
function isl_union_flow_free(flow:Pisl_union_flow):Pisl_union_flow;cdecl;external;
function isl_printer_print_union_flow(p:Pisl_printer; flow:Pisl_union_flow):Pisl_printer;cdecl;external;
function isl_union_flow_to_str(flow:Pisl_union_flow):Pchar;cdecl;external;
function isl_union_map_compute_flow(sink:Pisl_union_map; must_source:Pisl_union_map; may_source:Pisl_union_map; schedule:Pisl_union_map; must_dep:PPisl_union_map; 
           may_dep:PPisl_union_map; must_no_source:PPisl_union_map; may_no_source:PPisl_union_map):longint;cdecl;external;
{$endif}

implementation


end.
