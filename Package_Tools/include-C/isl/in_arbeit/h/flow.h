#ifndef ISL_FLOW_H
#define ISL_FLOW_H

#include <stdio.h>

#include <isl/set_type.h>
#include <isl/map_type.h>
#include <isl/union_set_type.h>
#include <isl/union_map_type.h>
#include <isl/schedule.h>
#include <isl/printer.h>

#if defined(__cplusplus)

#endif

/* Let n (>= 0) be the number of iterators shared by first and second.
 * If first precedes second textually return 2 * n + 1,
 * otherwise return 2 * n.
 */
typedef int (*isl_access_level_before)(void *first, void *second);

struct isl_restriction;
typedef struct isl_restriction isl_restriction;

 isl_restriction *isl_restriction_free(
	 isl_restriction *restr);
 isl_restriction *isl_restriction_empty(
	 isl_map *source_map);
 isl_restriction *isl_restriction_none(
	 isl_map *source_map);
 isl_restriction *isl_restriction_input(
	 isl_set *source_restr,  isl_set *sink_restr);
 isl_restriction *isl_restriction_output(
	 isl_set *source_restr);

isl_ctx *isl_restriction_get_ctx( isl_restriction *restr);

typedef  isl_restriction *(*isl_access_restrict)(
	 isl_map *source_map,  isl_set *sink,
	void *source_user, void *user);

struct isl_access_info;
typedef struct isl_access_info isl_access_info;
struct isl_flow;
typedef struct isl_flow isl_flow;

 isl_access_info *isl_access_info_alloc( isl_map *sink,
	void *sink_user, isl_access_level_before fn, int max_source);
 isl_access_info *isl_access_info_set_restrict(
	 isl_access_info *acc, isl_access_restrict fn, void *user);
 isl_access_info *isl_access_info_add_source(
	 isl_access_info *acc,  isl_map *source,
	int must, void *source_user);
 isl_access_info *isl_access_info_free(
	 isl_access_info *acc);

isl_ctx *isl_access_info_get_ctx( isl_access_info *acc);

 isl_flow *isl_access_info_compute_flow( isl_access_info *acc);
isl_stat isl_flow_foreach( isl_flow *deps,
	isl_stat (*fn)( isl_map *dep, int must, void *dep_user,
		void *user),
	void *user);
 isl_map *isl_flow_get_no_source( isl_flow *deps, int must);
 isl_flow *isl_flow_free( isl_flow *deps);

isl_ctx *isl_flow_get_ctx( isl_flow *deps);

struct  isl_union_access_info;
typedef struct isl_union_access_info isl_union_access_info;
struct  isl_union_flow;
typedef struct isl_union_flow isl_union_flow;


 isl_union_access_info *isl_union_access_info_from_sink(
	 isl_union_map *sink);
extern
 isl_union_access_info *isl_union_access_info_set_must_source(
	 isl_union_access_info *access,
	 isl_union_map *must_source);
extern
 isl_union_access_info *isl_union_access_info_set_may_source(
	 isl_union_access_info *access,
	 isl_union_map *may_source);
extern
 isl_union_access_info *isl_union_access_info_set_kill(
	 isl_union_access_info *access,
	 isl_union_map *kill);
extern
 isl_union_access_info *isl_union_access_info_set_schedule(
	 isl_union_access_info *access,
	 isl_schedule *schedule);
extern
 isl_union_access_info *isl_union_access_info_set_schedule_map(
	 isl_union_access_info *access,
	 isl_union_map *schedule_map);
 isl_union_access_info *isl_union_access_info_copy(
	 isl_union_access_info *access);
 isl_union_access_info *isl_union_access_info_free(
	 isl_union_access_info *access);

isl_ctx *isl_union_access_info_get_ctx(
	 isl_union_access_info *access);

 isl_union_access_info *isl_union_access_info_read_from_file(
	isl_ctx *ctx, FILE *input);
 isl_printer *isl_printer_print_union_access_info(
	 isl_printer *p,  isl_union_access_info *access);
 char *isl_union_access_info_to_str(
	 isl_union_access_info *access);

extern
 isl_union_flow *isl_union_access_info_compute_flow(
	 isl_union_access_info *access);

isl_ctx *isl_union_flow_get_ctx( isl_union_flow *flow);
 isl_union_flow *isl_union_flow_copy(
	 isl_union_flow *flow);
extern
 isl_union_map *isl_union_flow_get_must_dependence(
	 isl_union_flow *flow);
extern
 isl_union_map *isl_union_flow_get_may_dependence(
	 isl_union_flow *flow);
extern
 isl_union_map *isl_union_flow_get_full_must_dependence(
	 isl_union_flow *flow);
extern
 isl_union_map *isl_union_flow_get_full_may_dependence(
	 isl_union_flow *flow);
extern
 isl_union_map *isl_union_flow_get_must_no_source(
	 isl_union_flow *flow);
extern
 isl_union_map *isl_union_flow_get_may_no_source(
	 isl_union_flow *flow);
 isl_union_flow *isl_union_flow_free( isl_union_flow *flow);

 isl_printer *isl_printer_print_union_flow(
	 isl_printer *p,  isl_union_flow *flow);
 char *isl_union_flow_to_str( isl_union_flow *flow);

int isl_union_map_compute_flow( isl_union_map *sink,
	 isl_union_map *must_source,
	 isl_union_map *may_source,
	 isl_union_map *schedule,
	 isl_union_map **must_dep,  isl_union_map **may_dep,
	 isl_union_map **must_no_source,
	 isl_union_map **may_no_source);


#endif
