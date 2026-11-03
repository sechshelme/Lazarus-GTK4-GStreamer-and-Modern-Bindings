#ifndef ISL_SCHEDULE_NODE_H
#define ISL_SCHEDULE_NODE_H

#include <isl/schedule_type.h>
#include <isl/union_set_type.h>
#include <isl/aff_type.h>
#include <isl/ast_type.h>
#include <isl/val_type.h>
#include <isl/space_type.h>
#include <isl/id_type.h>
#include <isl/set_type.h>

#if defined(__cplusplus)

#endif

extern
 isl_schedule_node *isl_schedule_node_from_domain(
	 isl_union_set *domain);
extern
 isl_schedule_node *isl_schedule_node_from_extension(
	 isl_union_map *extension);
 isl_schedule_node *isl_schedule_node_copy(
	 isl_schedule_node *node);
 isl_schedule_node *isl_schedule_node_free(
	 isl_schedule_node *node);

extern
isl_bool isl_schedule_node_is_equal( isl_schedule_node *node1,
	 isl_schedule_node *node2);

isl_ctx *isl_schedule_node_get_ctx( isl_schedule_node *node);
__isl_subclass(isl_schedule_node)
enum isl_schedule_node_type isl_schedule_node_get_type(
	 isl_schedule_node *node);
enum isl_schedule_node_type isl_schedule_node_get_parent_type(
	 isl_schedule_node *node);
extern
 isl_schedule *isl_schedule_node_get_schedule(
	 isl_schedule_node *node);

extern
isl_stat isl_schedule_node_foreach_descendant_top_down(
	 isl_schedule_node *node,
	isl_bool (*fn)( isl_schedule_node *node, void *user),
	void *user);
extern
isl_bool isl_schedule_node_every_descendant( isl_schedule_node *node,
	isl_bool (*test)( isl_schedule_node *node, void *user),
	void *user);
extern
isl_stat isl_schedule_node_foreach_ancestor_top_down(
	 isl_schedule_node *node,
	isl_stat (*fn)( isl_schedule_node *node, void *user),
	void *user);
extern
 isl_schedule_node *isl_schedule_node_map_descendant_bottom_up(
	 isl_schedule_node *node,
	 isl_schedule_node *(*fn)( isl_schedule_node *node,
		void *user), void *user);

extern
isl_size isl_schedule_node_get_tree_depth( isl_schedule_node *node);
extern
isl_bool isl_schedule_node_has_parent( isl_schedule_node *node);
extern
isl_bool isl_schedule_node_has_children( isl_schedule_node *node);
extern
isl_bool isl_schedule_node_has_previous_sibling(
	 isl_schedule_node *node);
extern
isl_bool isl_schedule_node_has_next_sibling( isl_schedule_node *node);
extern
isl_size isl_schedule_node_n_children( isl_schedule_node *node);
extern
isl_size isl_schedule_node_get_child_position(
	 isl_schedule_node *node);
extern
isl_size isl_schedule_node_get_ancestor_child_position(
	 isl_schedule_node *node,
	 isl_schedule_node *ancestor);
 isl_schedule_node *isl_schedule_node_get_child(
	 isl_schedule_node *node, int pos);
extern
 isl_schedule_node *isl_schedule_node_get_shared_ancestor(
	 isl_schedule_node *node1,
	 isl_schedule_node *node2);

extern
 isl_schedule_node *isl_schedule_node_root(
	 isl_schedule_node *node);
extern
 isl_schedule_node *isl_schedule_node_parent(
	 isl_schedule_node *node);
 isl_schedule_node *isl_schedule_node_grandparent(
	 isl_schedule_node *node);
extern
 isl_schedule_node *isl_schedule_node_ancestor(
	 isl_schedule_node *node, int generation);
extern
 isl_schedule_node *isl_schedule_node_child(
	 isl_schedule_node *node, int pos);
 isl_schedule_node *isl_schedule_node_grandchild(
	 isl_schedule_node *node, int pos1, int pos2);
extern
 isl_schedule_node *isl_schedule_node_first_child(
	 isl_schedule_node *node);
extern
 isl_schedule_node *isl_schedule_node_previous_sibling(
	 isl_schedule_node *node);
extern
 isl_schedule_node *isl_schedule_node_next_sibling(
	 isl_schedule_node *node);

extern
isl_bool isl_schedule_node_is_subtree_anchored(
	 isl_schedule_node *node);

 isl_schedule_node *isl_schedule_node_group(
	 isl_schedule_node *node,  isl_id *group_id);

 isl_schedule_node *isl_schedule_node_sequence_splice_child(
	 isl_schedule_node *node, int pos);
 isl_schedule_node *isl_schedule_node_sequence_splice_children(
	 isl_schedule_node *node);

 isl_space *isl_schedule_node_band_get_space(
	 isl_schedule_node *node);
extern
 isl_multi_union_pw_aff *isl_schedule_node_band_get_partial_schedule(
	 isl_schedule_node *node);
 isl_union_map *isl_schedule_node_band_get_partial_schedule_union_map(
	 isl_schedule_node *node);
enum isl_ast_loop_type isl_schedule_node_band_member_get_ast_loop_type(
	 isl_schedule_node *node, int pos);
extern
 isl_schedule_node *isl_schedule_node_band_member_set_ast_loop_type(
	 isl_schedule_node *node, int pos,
	enum isl_ast_loop_type type);
enum isl_ast_loop_type isl_schedule_node_band_member_get_isolate_ast_loop_type(
	 isl_schedule_node *node, int pos);
 isl_schedule_node *
isl_schedule_node_band_member_set_isolate_ast_loop_type(
	 isl_schedule_node *node, int pos,
	enum isl_ast_loop_type type);
extern
 isl_union_set *isl_schedule_node_band_get_ast_build_options(
	 isl_schedule_node *node);
extern
 isl_schedule_node *isl_schedule_node_band_set_ast_build_options(
	 isl_schedule_node *node,  isl_union_set *options);
extern
 isl_set *isl_schedule_node_band_get_ast_isolate_option(
	 isl_schedule_node *node);
extern
isl_size isl_schedule_node_band_n_member( isl_schedule_node *node);
extern
isl_bool isl_schedule_node_band_member_get_coincident(
	 isl_schedule_node *node, int pos);
extern
 isl_schedule_node *isl_schedule_node_band_member_set_coincident(
	 isl_schedule_node *node, int pos, int coincident);
extern
isl_bool isl_schedule_node_band_get_permutable(
	 isl_schedule_node *node);
extern
 isl_schedule_node *isl_schedule_node_band_set_permutable(
	 isl_schedule_node *node, int permutable);

isl_stat isl_options_set_tile_scale_tile_loops(isl_ctx *ctx, int val);
int isl_options_get_tile_scale_tile_loops(isl_ctx *ctx);
isl_stat isl_options_set_tile_shift_point_loops(isl_ctx *ctx, int val);
int isl_options_get_tile_shift_point_loops(isl_ctx *ctx);

extern
 isl_schedule_node *isl_schedule_node_band_scale(
	 isl_schedule_node *node,  isl_multi_val *mv);
extern
 isl_schedule_node *isl_schedule_node_band_scale_down(
	 isl_schedule_node *node,  isl_multi_val *mv);
extern
 isl_schedule_node *isl_schedule_node_band_mod(
	 isl_schedule_node *node,  isl_multi_val *mv);
extern
 isl_schedule_node *isl_schedule_node_band_shift(
	 isl_schedule_node *node,
	 isl_multi_union_pw_aff *shift);
extern
 isl_schedule_node *isl_schedule_node_band_tile(
	 isl_schedule_node *node,  isl_multi_val *sizes);
 isl_schedule_node *isl_schedule_node_band_sink(
	 isl_schedule_node *node);
extern
 isl_schedule_node *isl_schedule_node_band_split(
	 isl_schedule_node *node, int pos);

extern
 isl_set *isl_schedule_node_context_get_context(
	 isl_schedule_node *node);
extern
 isl_union_set *isl_schedule_node_domain_get_domain(
	 isl_schedule_node *node);
extern
 isl_union_map *isl_schedule_node_expansion_get_expansion(
	 isl_schedule_node *node);
extern
 isl_union_pw_multi_aff *isl_schedule_node_expansion_get_contraction(
	 isl_schedule_node *node);
extern
 isl_union_map *isl_schedule_node_extension_get_extension(
	 isl_schedule_node *node);
extern
 isl_union_set *isl_schedule_node_filter_get_filter(
	 isl_schedule_node *node);
extern
 isl_set *isl_schedule_node_guard_get_guard(
	 isl_schedule_node *node);
 isl_id *isl_schedule_node_mark_get_id(
	 isl_schedule_node *node);

isl_size isl_schedule_node_get_schedule_depth(
	 isl_schedule_node *node);
 isl_union_set *isl_schedule_node_get_domain(
	 isl_schedule_node *node);
 isl_union_set *isl_schedule_node_get_universe_domain(
	 isl_schedule_node *node);
extern
 isl_multi_union_pw_aff *
isl_schedule_node_get_prefix_schedule_multi_union_pw_aff(
	 isl_schedule_node *node);
extern
 isl_union_pw_multi_aff *
isl_schedule_node_get_prefix_schedule_union_pw_multi_aff(
	 isl_schedule_node *node);
extern
 isl_union_map *isl_schedule_node_get_prefix_schedule_union_map(
	 isl_schedule_node *node);
 isl_union_map *isl_schedule_node_get_prefix_schedule_relation(
	 isl_schedule_node *node);
 isl_union_map *isl_schedule_node_get_subtree_schedule_union_map(
	 isl_schedule_node *node);
 isl_union_map *isl_schedule_node_get_subtree_expansion(
	 isl_schedule_node *node);
 isl_union_pw_multi_aff *isl_schedule_node_get_subtree_contraction(
	 isl_schedule_node *node);

extern
 isl_schedule_node *isl_schedule_node_insert_context(
	 isl_schedule_node *node,  isl_set *context);
extern
 isl_schedule_node *isl_schedule_node_insert_partial_schedule(
	 isl_schedule_node *node,
	 isl_multi_union_pw_aff *schedule);
extern
 isl_schedule_node *isl_schedule_node_insert_filter(
	 isl_schedule_node *node,  isl_union_set *filter);
extern
 isl_schedule_node *isl_schedule_node_insert_guard(
	 isl_schedule_node *node,  isl_set *context);
extern
 isl_schedule_node *isl_schedule_node_insert_mark(
	 isl_schedule_node *node,  isl_id *mark);
extern
 isl_schedule_node *isl_schedule_node_insert_sequence(
	 isl_schedule_node *node,
	 isl_union_set_list *filters);
extern
 isl_schedule_node *isl_schedule_node_insert_set(
	 isl_schedule_node *node,
	 isl_union_set_list *filters);

 isl_schedule_node *isl_schedule_node_cut(
	 isl_schedule_node *node);
 isl_schedule_node *isl_schedule_node_delete(
	 isl_schedule_node *node);

extern
 isl_schedule_node *isl_schedule_node_order_before(
	 isl_schedule_node *node,  isl_union_set *filter);
extern
 isl_schedule_node *isl_schedule_node_order_after(
	 isl_schedule_node *node,  isl_union_set *filter);

extern
 isl_schedule_node *isl_schedule_node_graft_before(
	 isl_schedule_node *node,
	 isl_schedule_node *graft);
extern
 isl_schedule_node *isl_schedule_node_graft_after(
	 isl_schedule_node *node,
	 isl_schedule_node *graft);

 isl_schedule_node *isl_schedule_node_reset_user(
	 isl_schedule_node *node);
 isl_schedule_node *isl_schedule_node_align_params(
	 isl_schedule_node *node,  isl_space *space);

 isl_printer *isl_printer_print_schedule_node(
	 isl_printer *p,  isl_schedule_node *node);
void isl_schedule_node_dump( isl_schedule_node *node);
 char *isl_schedule_node_to_str( isl_schedule_node *node);

#if defined(__cplusplus)
}
#endif

#endif
