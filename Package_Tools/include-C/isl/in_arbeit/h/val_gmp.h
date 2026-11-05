#ifndef ISL_VAL_GMP_H
#define ISL_VAL_GMP_H

#include <gmp.h>
#include <isl/val_type.h>

#if defined(__cplusplus)

#endif

 isl_val *isl_val_int_from_gmp(isl_ctx *ctx, mpz_t z);
 isl_val *isl_val_from_gmp(isl_ctx *ctx,
	const mpz_t n, const mpz_t d);
int isl_val_get_num_gmp( isl_val *v, mpz_t z);
int isl_val_get_den_gmp( isl_val *v, mpz_t z);


#endif
