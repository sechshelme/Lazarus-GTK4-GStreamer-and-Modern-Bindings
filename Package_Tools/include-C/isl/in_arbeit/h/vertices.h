#ifndef ISL_VERTICES_H
#define ISL_VERTICES_H

#include <isl/aff_type.h>
#include <isl/set_type.h>

#if defined(__cplusplus)

#endif

struct isl_external_vertex;
typedef struct isl_external_vertex	isl_vertex;

struct isl_cell;
typedef struct isl_cell		isl_cell;

struct isl_vertices;
typedef struct isl_vertices	isl_vertices;

isl_ctx *isl_vertex_get_ctx( isl_vertex *vertex);
isl_size isl_vertex_get_id( isl_vertex *vertex);
 isl_basic_set *isl_vertex_get_domain( isl_vertex *vertex);
 isl_multi_aff *isl_vertex_get_expr( isl_vertex *vertex);
 isl_vertex *isl_vertex_free( isl_vertex *vertex);

 isl_vertices *isl_basic_set_compute_vertices(
	 isl_basic_set *bset);
isl_ctx *isl_vertices_get_ctx( isl_vertices *vertices);
isl_size isl_vertices_get_n_vertices( isl_vertices *vertices);
isl_stat isl_vertices_foreach_vertex( isl_vertices *vertices,
	isl_stat (*fn)( isl_vertex *vertex, void *user), void *user);
 isl_vertices *isl_vertices_free( isl_vertices *vertices);

isl_ctx *isl_cell_get_ctx( isl_cell *cell);
 isl_basic_set *isl_cell_get_domain( isl_cell *cell);
isl_stat isl_cell_foreach_vertex( isl_cell *cell,
	isl_stat (*fn)( isl_vertex *vertex, void *user), void *user);
 isl_cell *isl_cell_free( isl_cell *cell);

isl_stat isl_vertices_foreach_cell( isl_vertices *vertices,
	isl_stat (*fn)( isl_cell *cell, void *user), void *user);


#endif
