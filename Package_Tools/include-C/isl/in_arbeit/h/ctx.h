/*
 * Copyright 2008-2009 Katholieke Universiteit Leuven
 *
 * Use of this software is governed by the MIT license
 *
 * Written by Sven Verdoolaege, K.U.Leuven, Departement
 * Computerwetenschappen, Celestijnenlaan 200A, B-3001 Leuven, Belgium
 */

#ifndef ISL_CTX_H
#define ISL_CTX_H

#include <stdio.h>
#include <stdlib.h>

#include <isl/arg.h>

struct isl_stats {
	long	gbr_solved_lps;
};
enum isl_error {
	isl_error_none = 0,
	isl_error_abort,
	isl_error_alloc,
	isl_error_unknown,
	isl_error_internal,
	isl_error_invalid,
	isl_error_quota,
	isl_error_unsupported
};
typedef enum {
	isl_stat_error = -1,
	isl_stat_ok = 0
} isl_stat;
isl_stat isl_stat_non_null(void *obj);
typedef enum {
	isl_bool_error = -1,
	isl_bool_false = 0,
	isl_bool_true = 1
} isl_bool;
isl_bool isl_bool_not(isl_bool b);
isl_bool isl_bool_ok(int b);
typedef int	isl_size;
#define isl_size_error	((int) -1)
struct isl_ctx;
typedef struct isl_ctx isl_ctx;

/* Some helper macros */


void *isl_malloc_or_die(isl_ctx *ctx, size_t size);
void *isl_calloc_or_die(isl_ctx *ctx, size_t nmemb, size_t size);
void *isl_realloc_or_die(isl_ctx *ctx, void *ptr, size_t size);



void isl_handle_error(isl_ctx *ctx, enum isl_error error, const char *msg,
	const char *file, int line);


/* struct isl_ctx functions */

 isl_options *isl_ctx_options(isl_ctx *ctx);

isl_ctx *isl_ctx_alloc_with_options(struct isl_args *args,
	 void *opt);
isl_ctx *isl_ctx_alloc(void);
void *isl_ctx_peek_options(isl_ctx *ctx, struct isl_args *args);
int isl_ctx_parse_options(isl_ctx *ctx, int argc, char **argv, unsigned flags);
void isl_ctx_ref(struct isl_ctx *ctx);
void isl_ctx_deref(struct isl_ctx *ctx);
void isl_ctx_free(isl_ctx *ctx);

void isl_ctx_abort(isl_ctx *ctx);
void isl_ctx_resume(isl_ctx *ctx);
int isl_ctx_aborted(isl_ctx *ctx);

void isl_ctx_set_max_operations(isl_ctx *ctx, unsigned long max_operations);
unsigned long isl_ctx_get_max_operations(isl_ctx *ctx);
void isl_ctx_reset_operations(isl_ctx *ctx);

 isl_error isl_ctx_last_error(isl_ctx *ctx);
const char *isl_ctx_last_error_msg(isl_ctx *ctx);
const char *isl_ctx_last_error_file(isl_ctx *ctx);
int isl_ctx_last_error_line(isl_ctx *ctx);
void isl_ctx_reset_error(isl_ctx *ctx);
void isl_ctx_set_error(isl_ctx *ctx, enum isl_error error);


