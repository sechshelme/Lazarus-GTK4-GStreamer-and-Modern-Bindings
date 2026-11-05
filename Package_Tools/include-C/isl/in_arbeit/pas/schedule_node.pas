unit schedule_node;

interface

uses
  fp_isl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ISL_SCHEDULE_NODE_H}
{$define ISL_SCHEDULE_NODE_H}
{$include <isl/schedule_type.h>}
{$include <isl/union_set_type.h>}
{$include <isl/aff_type.h>}
{$include <isl/ast_type.h>}
{$include <isl/val_type.h>}
{$include <isl/space_type.h>}
{$include <isl/id_type.h>}
{$include <isl/set_type.h>}
{$if defined(__cplusplus)}
{$endif}

function isl_schedule_node_from_domain(domain:Pisl_union_set):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_from_extension(extension:Pisl_union_map):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_copy(node:Pisl_schedule_node):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_free(node:Pisl_schedule_node):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_is_equal(node1:Pisl_schedule_node; node2:Pisl_schedule_node):Tisl_bool;cdecl;external libisl;
function isl_schedule_node_get_ctx(node:Pisl_schedule_node):Pisl_ctx;cdecl;external libisl;
function isl_schedule_node_get_type(node:Pisl_schedule_node):Tisl_schedule_node_type;cdecl;external libisl;
function isl_schedule_node_get_parent_type(node:Pisl_schedule_node):Tisl_schedule_node_type;cdecl;external libisl;
function isl_schedule_node_get_schedule(node:Pisl_schedule_node):Pisl_schedule;cdecl;external libisl;
function isl_schedule_node_foreach_descendant_top_down(node:Pisl_schedule_node; fn:function (node:Pisl_schedule_node; user:pointer):Tisl_bool; user:pointer):Tisl_stat;cdecl;external libisl;
function isl_schedule_node_every_descendant(node:Pisl_schedule_node; test:function (node:Pisl_schedule_node; user:pointer):Tisl_bool; user:pointer):Tisl_bool;cdecl;external libisl;
function isl_schedule_node_foreach_ancestor_top_down(node:Pisl_schedule_node; fn:function (node:Pisl_schedule_node; user:pointer):Tisl_stat; user:pointer):Tisl_stat;cdecl;external libisl;
function isl_schedule_node_map_descendant_bottom_up(node:Pisl_schedule_node; fn:function (node:Pisl_schedule_node; user:pointer):Pisl_schedule_node; user:pointer):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_get_tree_depth(node:Pisl_schedule_node):Tisl_size;cdecl;external libisl;
function isl_schedule_node_has_parent(node:Pisl_schedule_node):Tisl_bool;cdecl;external libisl;
function isl_schedule_node_has_children(node:Pisl_schedule_node):Tisl_bool;cdecl;external libisl;
function isl_schedule_node_has_previous_sibling(node:Pisl_schedule_node):Tisl_bool;cdecl;external libisl;
function isl_schedule_node_has_next_sibling(node:Pisl_schedule_node):Tisl_bool;cdecl;external libisl;
function isl_schedule_node_n_children(node:Pisl_schedule_node):Tisl_size;cdecl;external libisl;
function isl_schedule_node_get_child_position(node:Pisl_schedule_node):Tisl_size;cdecl;external libisl;
function isl_schedule_node_get_ancestor_child_position(node:Pisl_schedule_node; ancestor:Pisl_schedule_node):Tisl_size;cdecl;external libisl;
function isl_schedule_node_get_child(node:Pisl_schedule_node; pos:longint):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_get_shared_ancestor(node1:Pisl_schedule_node; node2:Pisl_schedule_node):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_root(node:Pisl_schedule_node):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_parent(node:Pisl_schedule_node):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_grandparent(node:Pisl_schedule_node):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_ancestor(node:Pisl_schedule_node; generation:longint):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_child(node:Pisl_schedule_node; pos:longint):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_grandchild(node:Pisl_schedule_node; pos1:longint; pos2:longint):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_first_child(node:Pisl_schedule_node):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_previous_sibling(node:Pisl_schedule_node):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_next_sibling(node:Pisl_schedule_node):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_is_subtree_anchored(node:Pisl_schedule_node):Tisl_bool;cdecl;external libisl;
function isl_schedule_node_group(node:Pisl_schedule_node; group_id:Pisl_id):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_sequence_splice_child(node:Pisl_schedule_node; pos:longint):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_sequence_splice_children(node:Pisl_schedule_node):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_band_get_space(node:Pisl_schedule_node):Pisl_space;cdecl;external libisl;
function isl_schedule_node_band_get_partial_schedule(node:Pisl_schedule_node):Pisl_multi_union_pw_aff;cdecl;external libisl;
function isl_schedule_node_band_get_partial_schedule_union_map(node:Pisl_schedule_node):Pisl_union_map;cdecl;external libisl;
function isl_schedule_node_band_member_get_ast_loop_type(node:Pisl_schedule_node; pos:longint):Tisl_ast_loop_type;cdecl;external libisl;
function isl_schedule_node_band_member_set_ast_loop_type(node:Pisl_schedule_node; pos:longint; _type:Tisl_ast_loop_type):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_band_member_get_isolate_ast_loop_type(node:Pisl_schedule_node; pos:longint):Tisl_ast_loop_type;cdecl;external libisl;
function isl_schedule_node_band_member_set_isolate_ast_loop_type(node:Pisl_schedule_node; pos:longint; _type:Tisl_ast_loop_type):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_band_get_ast_build_options(node:Pisl_schedule_node):Pisl_union_set;cdecl;external libisl;
function isl_schedule_node_band_set_ast_build_options(node:Pisl_schedule_node; options:Pisl_union_set):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_band_get_ast_isolate_option(node:Pisl_schedule_node):Pisl_set;cdecl;external libisl;
function isl_schedule_node_band_n_member(node:Pisl_schedule_node):Tisl_size;cdecl;external libisl;
function isl_schedule_node_band_member_get_coincident(node:Pisl_schedule_node; pos:longint):Tisl_bool;cdecl;external libisl;
function isl_schedule_node_band_member_set_coincident(node:Pisl_schedule_node; pos:longint; coincident:longint):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_band_get_permutable(node:Pisl_schedule_node):Tisl_bool;cdecl;external libisl;
function isl_schedule_node_band_set_permutable(node:Pisl_schedule_node; permutable:longint):Pisl_schedule_node;cdecl;external libisl;
function isl_options_set_tile_scale_tile_loops(ctx:Pisl_ctx; val:longint):Tisl_stat;cdecl;external libisl;
function isl_options_get_tile_scale_tile_loops(ctx:Pisl_ctx):longint;cdecl;external libisl;
function isl_options_set_tile_shift_point_loops(ctx:Pisl_ctx; val:longint):Tisl_stat;cdecl;external libisl;
function isl_options_get_tile_shift_point_loops(ctx:Pisl_ctx):longint;cdecl;external libisl;
function isl_schedule_node_band_scale(node:Pisl_schedule_node; mv:Pisl_multi_val):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_band_scale_down(node:Pisl_schedule_node; mv:Pisl_multi_val):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_band_mod(node:Pisl_schedule_node; mv:Pisl_multi_val):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_band_shift(node:Pisl_schedule_node; shift:Pisl_multi_union_pw_aff):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_band_tile(node:Pisl_schedule_node; sizes:Pisl_multi_val):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_band_sink(node:Pisl_schedule_node):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_band_split(node:Pisl_schedule_node; pos:longint):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_context_get_context(node:Pisl_schedule_node):Pisl_set;cdecl;external libisl;
function isl_schedule_node_domain_get_domain(node:Pisl_schedule_node):Pisl_union_set;cdecl;external libisl;
function isl_schedule_node_expansion_get_expansion(node:Pisl_schedule_node):Pisl_union_map;cdecl;external libisl;
function isl_schedule_node_expansion_get_contraction(node:Pisl_schedule_node):Pisl_union_pw_multi_aff;cdecl;external libisl;
function isl_schedule_node_extension_get_extension(node:Pisl_schedule_node):Pisl_union_map;cdecl;external libisl;
function isl_schedule_node_filter_get_filter(node:Pisl_schedule_node):Pisl_union_set;cdecl;external libisl;
function isl_schedule_node_guard_get_guard(node:Pisl_schedule_node):Pisl_set;cdecl;external libisl;
function isl_schedule_node_mark_get_id(node:Pisl_schedule_node):Pisl_id;cdecl;external libisl;
function isl_schedule_node_get_schedule_depth(node:Pisl_schedule_node):Tisl_size;cdecl;external libisl;
function isl_schedule_node_get_domain(node:Pisl_schedule_node):Pisl_union_set;cdecl;external libisl;
function isl_schedule_node_get_universe_domain(node:Pisl_schedule_node):Pisl_union_set;cdecl;external libisl;
function isl_schedule_node_get_prefix_schedule_multi_union_pw_aff(node:Pisl_schedule_node):Pisl_multi_union_pw_aff;cdecl;external libisl;
function isl_schedule_node_get_prefix_schedule_union_pw_multi_aff(node:Pisl_schedule_node):Pisl_union_pw_multi_aff;cdecl;external libisl;
function isl_schedule_node_get_prefix_schedule_union_map(node:Pisl_schedule_node):Pisl_union_map;cdecl;external libisl;
function isl_schedule_node_get_prefix_schedule_relation(node:Pisl_schedule_node):Pisl_union_map;cdecl;external libisl;
function isl_schedule_node_get_subtree_schedule_union_map(node:Pisl_schedule_node):Pisl_union_map;cdecl;external libisl;
function isl_schedule_node_get_subtree_expansion(node:Pisl_schedule_node):Pisl_union_map;cdecl;external libisl;
function isl_schedule_node_get_subtree_contraction(node:Pisl_schedule_node):Pisl_union_pw_multi_aff;cdecl;external libisl;
function isl_schedule_node_insert_context(node:Pisl_schedule_node; context:Pisl_set):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_insert_partial_schedule(node:Pisl_schedule_node; schedule:Pisl_multi_union_pw_aff):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_insert_filter(node:Pisl_schedule_node; filter:Pisl_union_set):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_insert_guard(node:Pisl_schedule_node; context:Pisl_set):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_insert_mark(node:Pisl_schedule_node; mark:Pisl_id):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_insert_sequence(node:Pisl_schedule_node; filters:Pisl_union_set_list):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_insert_set(node:Pisl_schedule_node; filters:Pisl_union_set_list):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_cut(node:Pisl_schedule_node):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_delete(node:Pisl_schedule_node):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_order_before(node:Pisl_schedule_node; filter:Pisl_union_set):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_order_after(node:Pisl_schedule_node; filter:Pisl_union_set):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_graft_before(node:Pisl_schedule_node; graft:Pisl_schedule_node):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_graft_after(node:Pisl_schedule_node; graft:Pisl_schedule_node):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_reset_user(node:Pisl_schedule_node):Pisl_schedule_node;cdecl;external libisl;
function isl_schedule_node_align_params(node:Pisl_schedule_node; space:Pisl_space):Pisl_schedule_node;cdecl;external libisl;
function isl_printer_print_schedule_node(p:Pisl_printer; node:Pisl_schedule_node):Pisl_printer;cdecl;external libisl;
procedure isl_schedule_node_dump(node:Pisl_schedule_node);cdecl;external libisl;
function isl_schedule_node_to_str(node:Pisl_schedule_node):Pchar;cdecl;external libisl;
{$endif}

// === Konventiert am: 5-11-26 15:53:54 ===


implementation



end.
