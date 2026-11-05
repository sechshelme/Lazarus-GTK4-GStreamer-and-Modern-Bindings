/*
 * Use of this software is governed by the MIT license
 */

#ifndef ISL_STRIDE_INFO_H
#define ISL_STRIDE_INFO_H

#include <isl/val_type.h>
#include <isl/aff_type.h>

#if defined(__cplusplus)

#endif

struct isl_stride_info;
typedef struct isl_stride_info isl_stride_info;

isl_ctx *isl_stride_info_get_ctx( isl_stride_info *si);
 isl_val *isl_stride_info_get_stride( isl_stride_info *si);
 isl_aff *isl_stride_info_get_offset( isl_stride_info *si);
 isl_stride_info *isl_stride_info_free(
	 isl_stride_info *si);
 isl_stride_info *isl_stride_info_copy(
	 isl_stride_info *si);


#endif
