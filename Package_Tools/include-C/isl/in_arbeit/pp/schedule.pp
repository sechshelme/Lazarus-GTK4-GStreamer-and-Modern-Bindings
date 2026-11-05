
unit schedule;
interface

{
  Automatically converted by H2Pas 1.0.0 from schedule.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    schedule.h
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
Pisl_ctx  = ^isl_ctx;
Pisl_multi_union_pw_aff  = ^isl_multi_union_pw_aff;
Pisl_printer  = ^isl_printer;
Pisl_schedule  = ^isl_schedule;
Pisl_schedule_constraints  = ^isl_schedule_constraints;
Pisl_schedule_node  = ^isl_schedule_node;
Pisl_set  = ^isl_set;
Pisl_space  = ^isl_space;
Pisl_union_map  = ^isl_union_map;
Pisl_union_pw_multi_aff  = ^isl_union_pw_multi_aff;
Pisl_union_set  = ^isl_union_set;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ISL_SCHEDULE_H}
{$define ISL_SCHEDULE_H}
{$include <isl/union_set_type.h>}
{$include <isl/union_map_type.h>}
{$include <isl/schedule_type.h>}
{$include <isl/aff_type.h>}
{$include <isl/space_type.h>}
{$include <isl/set_type.h>}
{$include <isl/list.h>}
{$include <isl/printer_type.h>}
{$if defined(__cplusplus)}
{$endif}
type
  Pisl_schedule_constraints = ^Tisl_schedule_constraints;
  Tisl_schedule_constraints = record
      {undefined structure}
    end;


function isl_options_set_schedule_max_coefficient(ctx:Pisl_ctx; val:longint):Tisl_stat;cdecl;external;
function isl_options_get_schedule_max_coefficient(ctx:Pisl_ctx):longint;cdecl;external;
function isl_options_set_schedule_max_constant_term(ctx:Pisl_ctx; val:longint):Tisl_stat;cdecl;external;
function isl_options_get_schedule_max_constant_term(ctx:Pisl_ctx):longint;cdecl;external;
function isl_options_set_schedule_maximize_band_depth(ctx:Pisl_ctx; val:longint):Tisl_stat;cdecl;external;
function isl_options_get_schedule_maximize_band_depth(ctx:Pisl_ctx):longint;cdecl;external;
function isl_options_set_schedule_maximize_coincidence(ctx:Pisl_ctx; val:longint):Tisl_stat;cdecl;external;
function isl_options_get_schedule_maximize_coincidence(ctx:Pisl_ctx):longint;cdecl;external;
function isl_options_set_schedule_outer_coincidence(ctx:Pisl_ctx; val:longint):Tisl_stat;cdecl;external;
function isl_options_get_schedule_outer_coincidence(ctx:Pisl_ctx):longint;cdecl;external;
function isl_options_set_schedule_split_scaled(ctx:Pisl_ctx; val:longint):Tisl_stat;cdecl;external;
function isl_options_get_schedule_split_scaled(ctx:Pisl_ctx):longint;cdecl;external;
function isl_options_set_schedule_treat_coalescing(ctx:Pisl_ctx; val:longint):Tisl_stat;cdecl;external;
function isl_options_get_schedule_treat_coalescing(ctx:Pisl_ctx):longint;cdecl;external;
function isl_options_set_schedule_separate_components(ctx:Pisl_ctx; val:longint):Tisl_stat;cdecl;external;
function isl_options_get_schedule_separate_components(ctx:Pisl_ctx):longint;cdecl;external;
function isl_options_set_schedule_serialize_sccs(ctx:Pisl_ctx; val:longint):Tisl_stat;cdecl;external;
function isl_options_get_schedule_serialize_sccs(ctx:Pisl_ctx):longint;cdecl;external;
function isl_options_set_schedule_whole_component(ctx:Pisl_ctx; val:longint):Tisl_stat;cdecl;external;
function isl_options_get_schedule_whole_component(ctx:Pisl_ctx):longint;cdecl;external;
function isl_options_set_schedule_carry_self_first(ctx:Pisl_ctx; val:longint):Tisl_stat;cdecl;external;
function isl_options_get_schedule_carry_self_first(ctx:Pisl_ctx):longint;cdecl;external;
function isl_schedule_constraints_copy(sc:Pisl_schedule_constraints):Pisl_schedule_constraints;cdecl;external;
function isl_schedule_constraints_on_domain(domain:Pisl_union_set):Pisl_schedule_constraints;cdecl;external;
function isl_schedule_constraints_set_context(sc:Pisl_schedule_constraints; context:Pisl_set):Pisl_schedule_constraints;cdecl;external;
function isl_schedule_constraints_set_validity(sc:Pisl_schedule_constraints; validity:Pisl_union_map):Pisl_schedule_constraints;cdecl;external;
function isl_schedule_constraints_set_coincidence(sc:Pisl_schedule_constraints; coincidence:Pisl_union_map):Pisl_schedule_constraints;cdecl;external;
function isl_schedule_constraints_set_proximity(sc:Pisl_schedule_constraints; proximity:Pisl_union_map):Pisl_schedule_constraints;cdecl;external;
function isl_schedule_constraints_set_conditional_validity(sc:Pisl_schedule_constraints; condition:Pisl_union_map; validity:Pisl_union_map):Pisl_schedule_constraints;cdecl;external;
function isl_schedule_constraints_free(sc:Pisl_schedule_constraints):Pisl_schedule_constraints;cdecl;external;
function isl_schedule_constraints_get_ctx(sc:Pisl_schedule_constraints):Pisl_ctx;cdecl;external;
function isl_schedule_constraints_get_domain(sc:Pisl_schedule_constraints):Pisl_union_set;cdecl;external;
function isl_schedule_constraints_get_context(sc:Pisl_schedule_constraints):Pisl_set;cdecl;external;
function isl_schedule_constraints_get_validity(sc:Pisl_schedule_constraints):Pisl_union_map;cdecl;external;
function isl_schedule_constraints_get_coincidence(sc:Pisl_schedule_constraints):Pisl_union_map;cdecl;external;
function isl_schedule_constraints_get_proximity(sc:Pisl_schedule_constraints):Pisl_union_map;cdecl;external;
function isl_schedule_constraints_get_conditional_validity(sc:Pisl_schedule_constraints):Pisl_union_map;cdecl;external;
function isl_schedule_constraints_get_conditional_validity_condition(sc:Pisl_schedule_constraints):Pisl_union_map;cdecl;external;
function isl_schedule_constraints_apply(sc:Pisl_schedule_constraints; umap:Pisl_union_map):Pisl_schedule_constraints;cdecl;external;
(* Const before type ignored *)
function isl_schedule_constraints_read_from_str(ctx:Pisl_ctx; str:Pchar):Pisl_schedule_constraints;cdecl;external;
function isl_schedule_constraints_read_from_file(ctx:Pisl_ctx; input:PFILE):Pisl_schedule_constraints;cdecl;external;
function isl_printer_print_schedule_constraints(p:Pisl_printer; sc:Pisl_schedule_constraints):Pisl_printer;cdecl;external;
procedure isl_schedule_constraints_dump(sc:Pisl_schedule_constraints);cdecl;external;
function isl_schedule_constraints_to_str(sc:Pisl_schedule_constraints):Pchar;cdecl;external;
function isl_schedule_constraints_compute_schedule(sc:Pisl_schedule_constraints):Pisl_schedule;cdecl;external;
function isl_union_set_compute_schedule(domain:Pisl_union_set; validity:Pisl_union_map; proximity:Pisl_union_map):Pisl_schedule;cdecl;external;
function isl_schedule_empty(space:Pisl_space):Pisl_schedule;cdecl;external;
function isl_schedule_from_domain(domain:Pisl_union_set):Pisl_schedule;cdecl;external;
function isl_schedule_copy(sched:Pisl_schedule):Pisl_schedule;cdecl;external;
function isl_schedule_free(sched:Pisl_schedule):Pisl_schedule;cdecl;external;
function isl_schedule_get_map(sched:Pisl_schedule):Pisl_union_map;cdecl;external;
function isl_schedule_get_ctx(sched:Pisl_schedule):Pisl_ctx;cdecl;external;
function isl_schedule_plain_is_equal(schedule1:Pisl_schedule; schedule2:Pisl_schedule):Tisl_bool;cdecl;external;
function isl_schedule_get_root(schedule:Pisl_schedule):Pisl_schedule_node;cdecl;external;
function isl_schedule_get_domain(schedule:Pisl_schedule):Pisl_union_set;cdecl;external;
function isl_schedule_foreach_schedule_node_top_down(sched:Pisl_schedule; fn:function (node:Pisl_schedule_node; user:pointer):Tisl_bool; user:pointer):Tisl_stat;cdecl;external;
function isl_schedule_map_schedule_node_bottom_up(schedule:Pisl_schedule; fn:function (node:Pisl_schedule_node; user:pointer):Pisl_schedule_node; user:pointer):Pisl_schedule;cdecl;external;
function isl_schedule_insert_context(schedule:Pisl_schedule; context:Pisl_set):Pisl_schedule;cdecl;external;
function isl_schedule_insert_partial_schedule(schedule:Pisl_schedule; partial:Pisl_multi_union_pw_aff):Pisl_schedule;cdecl;external;
function isl_schedule_insert_guard(schedule:Pisl_schedule; guard:Pisl_set):Pisl_schedule;cdecl;external;
function isl_schedule_sequence(schedule1:Pisl_schedule; schedule2:Pisl_schedule):Pisl_schedule;cdecl;external;
function isl_schedule_set(schedule1:Pisl_schedule; schedule2:Pisl_schedule):Pisl_schedule;cdecl;external;
function isl_schedule_intersect_domain(schedule:Pisl_schedule; domain:Pisl_union_set):Pisl_schedule;cdecl;external;
function isl_schedule_gist_domain_params(schedule:Pisl_schedule; context:Pisl_set):Pisl_schedule;cdecl;external;
function isl_schedule_reset_user(schedule:Pisl_schedule):Pisl_schedule;cdecl;external;
function isl_schedule_align_params(schedule:Pisl_schedule; space:Pisl_space):Pisl_schedule;cdecl;external;
function isl_schedule_pullback_union_pw_multi_aff(schedule:Pisl_schedule; upma:Pisl_union_pw_multi_aff):Pisl_schedule;cdecl;external;
function isl_schedule_expand(schedule:Pisl_schedule; contraction:Pisl_union_pw_multi_aff; expansion:Pisl_schedule):Pisl_schedule;cdecl;external;
function isl_schedule_read_from_file(ctx:Pisl_ctx; input:PFILE):Pisl_schedule;cdecl;external;
(* Const before type ignored *)
function isl_schedule_read_from_str(ctx:Pisl_ctx; str:Pchar):Pisl_schedule;cdecl;external;
function isl_printer_print_schedule(p:Pisl_printer; schedule:Pisl_schedule):Pisl_printer;cdecl;external;
procedure isl_schedule_dump(schedule:Pisl_schedule);cdecl;external;
function isl_schedule_to_str(schedule:Pisl_schedule):Pchar;cdecl;external;
{$endif}

implementation


end.
