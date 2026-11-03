/*
 * Use of this software is governed by the MIT license
 */

#ifndef ISL_FIXED_BOX_H
#define ISL_FIXED_BOX_H

#include <isl/ctx.h>
#include <isl/val_type.h>
#include <isl/space_type.h>
#include <isl/aff_type.h>

#if defined(__cplusplus)

#endif

struct extern isl_fixed_box;
typedef struct isl_fixed_box isl_fixed_box;

isl_ctx *isl_fixed_box_get_ctx( isl_fixed_box *box);
extern
 isl_space *isl_fixed_box_get_space( isl_fixed_box *box);
extern
isl_bool isl_fixed_box_is_valid( isl_fixed_box *box);
extern
 isl_multi_aff *isl_fixed_box_get_offset(
	 isl_fixed_box *box);
extern
 isl_multi_val *isl_fixed_box_get_size( isl_fixed_box *box);

 isl_fixed_box *isl_fixed_box_copy( isl_fixed_box *box);
 isl_fixed_box *isl_fixed_box_free( isl_fixed_box *box);


 isl_fixed_box *isl_fixed_box_read_from_str(isl_ctx *ctx,
	const char *str);
 isl_printer *isl_printer_print_fixed_box(
	 isl_printer *p,  isl_fixed_box *box);
 char *isl_fixed_box_to_str( isl_fixed_box *box);
void isl_fixed_box_dump( isl_fixed_box *box);

#if defined(__cplusplus)
}
#endif

#endif
