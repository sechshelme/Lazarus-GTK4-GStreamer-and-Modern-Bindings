#ifndef ISL_AST_BUILD_H
#define ISL_AST_BUILD_H

#include <isl/ctx.h>
#include <isl/set.h>
#include <isl/ast.h>
#include <isl/schedule.h>

#if defined(__cplusplus)

#endif

struct extern isl_ast_build;
typedef struct isl_ast_build isl_ast_build;


isl_stat isl_options_set_ast_build_atomic_upper_bound(isl_ctx *ctx, int val);
int isl_options_get_ast_build_atomic_upper_bound(isl_ctx *ctx);

isl_stat isl_options_set_ast_build_prefer_pdiv(isl_ctx *ctx, int val);
int isl_options_get_ast_build_prefer_pdiv(isl_ctx *ctx);

isl_stat isl_options_set_ast_build_detect_min_max(isl_ctx *ctx, int val);
int isl_options_get_ast_build_detect_min_max(isl_ctx *ctx);

isl_stat isl_options_set_ast_build_exploit_nested_bounds(isl_ctx *ctx, int val);
int isl_options_get_ast_build_exploit_nested_bounds(isl_ctx *ctx);

isl_stat isl_options_set_ast_build_group_coscheduled(isl_ctx *ctx, int val);
int isl_options_get_ast_build_group_coscheduled(isl_ctx *ctx);

#define ISL_AST_BUILD_SEPARATION_BOUNDS_EXPLICIT		0
#define ISL_AST_BUILD_SEPARATION_BOUNDS_IMPLICIT		1
isl_stat isl_options_set_ast_build_separation_bounds(isl_ctx *ctx, int val);
int isl_options_get_ast_build_separation_bounds(isl_ctx *ctx);

isl_stat isl_options_set_ast_build_scale_strides(isl_ctx *ctx, int val);
int isl_options_get_ast_build_scale_strides(isl_ctx *ctx);

isl_stat isl_options_set_ast_build_allow_else(isl_ctx *ctx, int val);
int isl_options_get_ast_build_allow_else(isl_ctx *ctx);

isl_stat isl_options_set_ast_build_allow_or(isl_ctx *ctx, int val);
int isl_options_get_ast_build_allow_or(isl_ctx *ctx);

isl_ctx *isl_ast_build_get_ctx( isl_ast_build *build);


 isl_ast_build *isl_ast_build_alloc(isl_ctx *ctx);
extern
 isl_ast_build *isl_ast_build_from_context( isl_set *set);

 isl_space *isl_ast_build_get_schedule_space(
	 isl_ast_build *build);
extern
 isl_union_map *isl_ast_build_get_schedule(
	 isl_ast_build *build);

 isl_ast_build *isl_ast_build_restrict(
	 isl_ast_build *build,  isl_set *set);

 isl_ast_build *isl_ast_build_copy(
	 isl_ast_build *build);
 isl_ast_build *isl_ast_build_free(
	 isl_ast_build *build);

 isl_ast_build *isl_ast_build_set_options(
	 isl_ast_build *build,
	 isl_union_map *options);
 isl_ast_build *isl_ast_build_set_iterators(
	 isl_ast_build *build,
	 isl_id_list *iterators);
extern
 isl_ast_build *isl_ast_build_set_at_each_domain(
	 isl_ast_build *build,
	 isl_ast_node *(*fn)( isl_ast_node *node,
		 isl_ast_build *build, void *user), void *user);
 isl_ast_build *isl_ast_build_set_before_each_for(
	 isl_ast_build *build,
	 isl_id *(*fn)( isl_ast_build *build,
		void *user), void *user);
 isl_ast_build *isl_ast_build_set_after_each_for(
	 isl_ast_build *build,
	 isl_ast_node *(*fn)( isl_ast_node *node,
		 isl_ast_build *build, void *user), void *user);
 isl_ast_build *isl_ast_build_set_before_each_mark(
	 isl_ast_build *build,
	isl_stat (*fn)( isl_id *mark,  isl_ast_build *build,
		void *user), void *user);
 isl_ast_build *isl_ast_build_set_after_each_mark(
	 isl_ast_build *build,
	 isl_ast_node *(*fn)( isl_ast_node *node,
		 isl_ast_build *build, void *user), void *user);
 isl_ast_build *isl_ast_build_set_create_leaf(
	 isl_ast_build *build,
	 isl_ast_node *(*fn)( isl_ast_build *build,
		void *user), void *user);


 isl_ast_expr *isl_ast_build_expr_from_set(
	 isl_ast_build *build,  isl_set *set);

 isl_ast_expr *isl_ast_build_expr_from_pw_aff(
	 isl_ast_build *build,  isl_pw_aff *pa);

 isl_ast_expr *isl_ast_build_access_from_pw_multi_aff(
	 isl_ast_build *build,  isl_pw_multi_aff *pma);

 isl_ast_expr *isl_ast_build_access_from_multi_pw_aff(
	 isl_ast_build *build,  isl_multi_pw_aff *mpa);

 isl_ast_expr *isl_ast_build_call_from_pw_multi_aff(
	 isl_ast_build *build,  isl_pw_multi_aff *pma);

 isl_ast_expr *isl_ast_build_call_from_multi_pw_aff(
	 isl_ast_build *build,  isl_multi_pw_aff *mpa);


 isl_ast_node *isl_ast_build_node_from_schedule(
	 isl_ast_build *build,  isl_schedule *schedule);
extern
 isl_ast_node *isl_ast_build_node_from_schedule_map(
	 isl_ast_build *build,  isl_union_map *schedule);
 isl_ast_node *isl_ast_build_ast_from_schedule(
	 isl_ast_build *build,  isl_union_map *schedule);

#if defined(__cplusplus)
}
#endif

#endif
