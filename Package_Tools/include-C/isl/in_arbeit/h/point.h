#ifndef ISL_POINT_H
#define ISL_POINT_H

#include <stdio.h>
#include <isl/space_type.h>
#include <isl/val_type.h>

#if defined(__cplusplus)

#endif

struct  isl_point;
typedef struct isl_point isl_point;

isl_ctx *isl_point_get_ctx( isl_point *pnt);
 isl_space *isl_point_get_space( isl_point *pnt);

 isl_point *isl_point_zero( isl_space *space);
 isl_point *isl_point_copy( isl_point *pnt);
 isl_point *isl_point_free( isl_point *pnt);

 isl_val *isl_point_get_coordinate_val( isl_point *pnt,
	enum isl_dim_type type, int pos);
 isl_point *isl_point_set_coordinate_val( isl_point *pnt,
	enum isl_dim_type type, int pos,  isl_val *v);
extern
 isl_multi_val *isl_point_get_multi_val( isl_point *pnt);

 isl_point *isl_point_add_ui( isl_point *pnt,
	enum isl_dim_type type, int pos, unsigned val);
 isl_point *isl_point_sub_ui( isl_point *pnt,
	enum isl_dim_type type, int pos, unsigned val);

 isl_point *isl_point_void( isl_space *space);
isl_bool isl_point_is_void( isl_point *pnt);

 isl_printer *isl_printer_print_point(
	 isl_printer *printer,  isl_point *pnt);
 char *isl_point_to_str( isl_point *pnt);
void isl_point_dump( isl_point *pnt);


#endif
