#ifndef ISL_LOCAL_SPACE_H
#define ISL_LOCAL_SPACE_H

#include <isl/aff_type.h>
#include <isl/space_type.h>
#include <isl/printer.h>
#include <isl/map_type.h>

#if defined(__cplusplus)

#endif

struct isl_local_space;
typedef struct isl_local_space isl_local_space;

isl_ctx *isl_local_space_get_ctx( isl_local_space *ls);

 isl_local_space *isl_local_space_from_space(
	 isl_space *space);

 isl_local_space *isl_local_space_copy(
	 isl_local_space *ls);
 isl_local_space *isl_local_space_free(
	 isl_local_space *ls);

isl_bool isl_local_space_is_params( isl_local_space *ls);
isl_bool isl_local_space_is_set( isl_local_space *ls);

 isl_local_space *isl_local_space_set_tuple_id(
	 isl_local_space *ls,
	enum isl_dim_type type,  isl_id *id);

isl_size isl_local_space_dim( isl_local_space *ls,
	enum isl_dim_type type);
isl_bool isl_local_space_has_dim_name( isl_local_space *ls,
	enum isl_dim_type type, unsigned pos);
const char *isl_local_space_get_dim_name( isl_local_space *ls,
	enum isl_dim_type type, unsigned pos);
 isl_local_space *isl_local_space_set_dim_name(
	 isl_local_space *ls,
	enum isl_dim_type type, unsigned pos, const char *s);
isl_bool isl_local_space_has_dim_id( isl_local_space *ls,
	enum isl_dim_type type, unsigned pos);
 isl_id *isl_local_space_get_dim_id( isl_local_space *ls,
	enum isl_dim_type type, unsigned pos);
 isl_local_space *isl_local_space_set_dim_id(
	 isl_local_space *ls,
	enum isl_dim_type type, unsigned pos,  isl_id *id);
 isl_space *isl_local_space_get_space( isl_local_space *ls);
 isl_aff *isl_local_space_get_div( isl_local_space *ls,
	int pos);

int isl_local_space_find_dim_by_name( isl_local_space *ls,
	enum isl_dim_type type, const char *name);

 isl_local_space *isl_local_space_domain(
	 isl_local_space *ls);
 isl_local_space *isl_local_space_range(
	 isl_local_space *ls);
 isl_local_space *isl_local_space_from_domain(
	 isl_local_space *ls);
 isl_local_space *isl_local_space_add_dims(
	 isl_local_space *ls, enum isl_dim_type type, unsigned n);
 isl_local_space *isl_local_space_drop_dims(
	 isl_local_space *ls,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_local_space *isl_local_space_insert_dims(
	 isl_local_space *ls,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_local_space *isl_local_space_set_from_params(
	 isl_local_space *ls);

 isl_local_space *isl_local_space_intersect(
	 isl_local_space *ls1,  isl_local_space *ls2);

 isl_local_space *isl_local_space_wrap(
	 isl_local_space *ls);

isl_bool isl_local_space_is_equal( isl_local_space *ls1,
	 isl_local_space *ls2);

 isl_basic_map *isl_local_space_lifting(
	 isl_local_space *ls);

 isl_local_space *isl_local_space_flatten_domain(
	 isl_local_space *ls);
 isl_local_space *isl_local_space_flatten_range(
	 isl_local_space *ls);

 isl_printer *isl_printer_print_local_space( isl_printer *p,
	 isl_local_space *ls);
void isl_local_space_dump( isl_local_space *ls);



#endif
