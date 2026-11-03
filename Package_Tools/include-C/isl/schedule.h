#ifndef ISL_SCHEDULE_H
#define ISL_SCHEDULE_H

#include <isl/union_set_type.h>
#include <isl/union_map_type.h>
#include <isl/schedule_type.h>
#include <isl/aff_type.h>
#include <isl/space_type.h>
#include <isl/set_type.h>
#include <isl/list.h>
#include <isl/printer_type.h>

#if defined(__cplusplus)

#endif

struct extern isl_schedule_constraints;
typedef struct isl_schedule_constraints isl_schedule_constraints;

isl_stat isl_options_set_schedule_max_coefficient(isl_ctx *ctx, int val);
int isl_options_get_schedule_max_coefficient(isl_ctx *ctx);

isl_stat isl_options_set_schedule_max_constant_term(isl_ctx *ctx, int val);
int isl_options_get_schedule_max_constant_term(isl_ctx *ctx);

isl_stat isl_options_set_schedule_maximize_band_depth(isl_ctx *ctx, int val);
int isl_options_get_schedule_maximize_band_depth(isl_ctx *ctx);

isl_stat isl_options_set_schedule_maximize_coincidence(isl_ctx *ctx, int val);
int isl_options_get_schedule_maximize_coincidence(isl_ctx *ctx);

isl_stat isl_options_set_schedule_outer_coincidence(isl_ctx *ctx, int val);
int isl_options_get_schedule_outer_coincidence(isl_ctx *ctx);

isl_stat isl_options_set_schedule_split_scaled(isl_ctx *ctx, int val);
int isl_options_get_schedule_split_scaled(isl_ctx *ctx);

isl_stat isl_options_set_schedule_treat_coalescing(isl_ctx *ctx, int val);
int isl_options_get_schedule_treat_coalescing(isl_ctx *ctx);

isl_stat isl_options_set_schedule_separate_components(isl_ctx *ctx, int val);
int isl_options_get_schedule_separate_components(isl_ctx *ctx);

isl_stat isl_options_set_schedule_serialize_sccs(isl_ctx *ctx, int val);
int isl_options_get_schedule_serialize_sccs(isl_ctx *ctx);

isl_stat isl_options_set_schedule_whole_component(isl_ctx *ctx, int val);
int isl_options_get_schedule_whole_component(isl_ctx *ctx);

isl_stat isl_options_set_schedule_carry_self_first(isl_ctx *ctx, int val);
int isl_options_get_schedule_carry_self_first(isl_ctx *ctx);

 isl_schedule_constraints *isl_schedule_constraints_copy(
	 isl_schedule_constraints *sc);
extern
 isl_schedule_constraints *isl_schedule_constraints_on_domain(
	 isl_union_set *domain);
extern
 isl_schedule_constraints *isl_schedule_constraints_set_context(
	 isl_schedule_constraints *sc,  isl_set *context);
extern
 isl_schedule_constraints *isl_schedule_constraints_set_validity(
	 isl_schedule_constraints *sc,
	 isl_union_map *validity);
extern
 isl_schedule_constraints *isl_schedule_constraints_set_coincidence(
	 isl_schedule_constraints *sc,
	 isl_union_map *coincidence);
extern
 isl_schedule_constraints *isl_schedule_constraints_set_proximity(
	 isl_schedule_constraints *sc,
	 isl_union_map *proximity);
extern
 isl_schedule_constraints *
isl_schedule_constraints_set_conditional_validity(
	 isl_schedule_constraints *sc,
	 isl_union_map *condition,
	 isl_union_map *validity);
 isl_schedule_constraints *isl_schedule_constraints_free(
	 isl_schedule_constraints *sc);

isl_ctx *isl_schedule_constraints_get_ctx(
	 isl_schedule_constraints *sc);
extern
 isl_union_set *isl_schedule_constraints_get_domain(
	 isl_schedule_constraints *sc);
extern
 isl_set *isl_schedule_constraints_get_context(
	 isl_schedule_constraints *sc);
extern
 isl_union_map *isl_schedule_constraints_get_validity(
	 isl_schedule_constraints *sc);
extern
 isl_union_map *isl_schedule_constraints_get_coincidence(
	 isl_schedule_constraints *sc);
extern
 isl_union_map *isl_schedule_constraints_get_proximity(
	 isl_schedule_constraints *sc);
extern
 isl_union_map *isl_schedule_constraints_get_conditional_validity(
	 isl_schedule_constraints *sc);
extern
 isl_union_map *
isl_schedule_constraints_get_conditional_validity_condition(
	 isl_schedule_constraints *sc);

 isl_schedule_constraints *isl_schedule_constraints_apply(
	 isl_schedule_constraints *sc,
	 isl_union_map *umap);


 isl_schedule_constraints *isl_schedule_constraints_read_from_str(
	isl_ctx *ctx, const char *str);
 isl_schedule_constraints *isl_schedule_constraints_read_from_file(
	isl_ctx *ctx, FILE *input);
 isl_printer *isl_printer_print_schedule_constraints(
	 isl_printer *p,  isl_schedule_constraints *sc);
void isl_schedule_constraints_dump( isl_schedule_constraints *sc);
 char *isl_schedule_constraints_to_str(
	 isl_schedule_constraints *sc);

extern
 isl_schedule *isl_schedule_constraints_compute_schedule(
	 isl_schedule_constraints *sc);

 isl_schedule *isl_union_set_compute_schedule(
	 isl_union_set *domain,
	 isl_union_map *validity,
	 isl_union_map *proximity);

 isl_schedule *isl_schedule_empty( isl_space *space);
extern
 isl_schedule *isl_schedule_from_domain(
	 isl_union_set *domain);
 isl_schedule *isl_schedule_copy( isl_schedule *sched);
 isl_schedule *isl_schedule_free( isl_schedule *sched);
extern
 isl_union_map *isl_schedule_get_map( isl_schedule *sched);

isl_ctx *isl_schedule_get_ctx( isl_schedule *sched);
isl_bool isl_schedule_plain_is_equal( isl_schedule *schedule1,
	 isl_schedule *schedule2);

extern
 isl_schedule_node *isl_schedule_get_root(
	 isl_schedule *schedule);
extern
 isl_union_set *isl_schedule_get_domain(
	 isl_schedule *schedule);

isl_stat isl_schedule_foreach_schedule_node_top_down(
	 isl_schedule *sched,
	isl_bool (*fn)( isl_schedule_node *node, void *user),
	void *user);
 isl_schedule *isl_schedule_map_schedule_node_bottom_up(
	 isl_schedule *schedule,
	 isl_schedule_node *(*fn)(
		 isl_schedule_node *node, void *user), void *user);

 isl_schedule *isl_schedule_insert_context(
	 isl_schedule *schedule,  isl_set *context);
 isl_schedule *isl_schedule_insert_partial_schedule(
	 isl_schedule *schedule,
	 isl_multi_union_pw_aff *partial);
 isl_schedule *isl_schedule_insert_guard(
	 isl_schedule *schedule,  isl_set *guard);
 isl_schedule *isl_schedule_sequence(
	 isl_schedule *schedule1,  isl_schedule *schedule2);
 isl_schedule *isl_schedule_set(
	 isl_schedule *schedule1,  isl_schedule *schedule2);
 isl_schedule *isl_schedule_intersect_domain(
	 isl_schedule *schedule,  isl_union_set *domain);
 isl_schedule *isl_schedule_gist_domain_params(
	 isl_schedule *schedule,  isl_set *context);

 isl_schedule *isl_schedule_reset_user(
	 isl_schedule *schedule);
 isl_schedule *isl_schedule_align_params(
	 isl_schedule *schedule,  isl_space *space);

 isl_schedule *isl_schedule_pullback_union_pw_multi_aff(
	 isl_schedule *schedule,
	 isl_union_pw_multi_aff *upma);
 isl_schedule *isl_schedule_expand( isl_schedule *schedule,
	 isl_union_pw_multi_aff *contraction,
	 isl_schedule *expansion);

 isl_schedule *isl_schedule_read_from_file(isl_ctx *ctx, FILE *input);

 isl_schedule *isl_schedule_read_from_str(isl_ctx *ctx,
	const char *str);
 isl_printer *isl_printer_print_schedule( isl_printer *p,
	 isl_schedule *schedule);
void isl_schedule_dump( isl_schedule *schedule);
 char *isl_schedule_to_str( isl_schedule *schedule);

#if defined(__cplusplus)
}
#endif

#endif
