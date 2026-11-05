/*
 * Copyright 2008-2009 Katholieke Universiteit Leuven
 *
 * Use of this software is governed by the MIT license
 *
 * Written by Sven Verdoolaege, K.U.Leuven, Departement
 * Computerwetenschappen, Celestijnenlaan 200A, B-3001 Leuven, Belgium
 */

#ifndef ISL_STREAM_H
#define ISL_STREAM_H

#include <stdio.h>
#include <isl/hash.h>
#include <isl/aff_type.h>
#include <isl/obj.h>
#include <isl/val_type.h>
#include <isl/schedule_type.h>

#if defined(__cplusplus)

#endif

enum isl_token_type { ISL_TOKEN_ERROR = -1,
			ISL_TOKEN_UNKNOWN = 256, ISL_TOKEN_VALUE,
			ISL_TOKEN_IDENT, ISL_TOKEN_GE,
			ISL_TOKEN_LE, ISL_TOKEN_GT, ISL_TOKEN_LT,
			ISL_TOKEN_NE, ISL_TOKEN_EQ_EQ,
			ISL_TOKEN_LEX_GE, ISL_TOKEN_LEX_LE,
			ISL_TOKEN_LEX_GT, ISL_TOKEN_LEX_LT,
			ISL_TOKEN_TO, ISL_TOKEN_AND,
			ISL_TOKEN_OR, ISL_TOKEN_EXISTS, ISL_TOKEN_NOT,
			ISL_TOKEN_DEF, ISL_TOKEN_INFTY, ISL_TOKEN_NAN,
			ISL_TOKEN_MIN, ISL_TOKEN_MAX, ISL_TOKEN_RAT,
			ISL_TOKEN_TRUE, ISL_TOKEN_FALSE,
			ISL_TOKEN_CEILD, ISL_TOKEN_FLOORD, ISL_TOKEN_MOD,
			ISL_TOKEN_STRING,
			ISL_TOKEN_MAP, ISL_TOKEN_AFF,
			ISL_TOKEN_CEIL, ISL_TOKEN_FLOOR,
			ISL_TOKEN_IMPLIES,
			ISL_TOKEN_INT_DIV,
			ISL_TOKEN_LAST };

struct isl_token;

 isl_val *isl_token_get_val(isl_ctx *ctx, struct isl_token *tok);
isl_bool isl_token_has_str(struct isl_token *tok);
 char *isl_token_get_str(isl_ctx *ctx, struct isl_token *tok);
int isl_token_get_type(struct isl_token *tok);
void isl_token_free(struct isl_token *tok);

struct isl_stream;
typedef struct isl_stream isl_stream;

 isl_stream *isl_stream_new_file(isl_ctx *ctx, FILE *file);
 isl_stream *isl_stream_new_str(isl_ctx *ctx, const char *str);
void isl_stream_free( isl_stream *s);

isl_ctx *isl_stream_get_ctx( isl_stream *s);

void isl_stream_error( isl_stream *s, struct isl_token *tok,
	char *msg);

 isl_token *isl_stream_next_token( isl_stream *s);
 isl_token *isl_stream_next_token_on_same_line( isl_stream *s);
int isl_stream_next_token_is( isl_stream *s, int type);
void isl_stream_push_token( isl_stream *s, struct isl_token *tok);
void isl_stream_flush_tokens( isl_stream *s);
int isl_stream_eat_if_available( isl_stream *s, int type);
char *isl_stream_read_ident_if_available( isl_stream *s);
int isl_stream_eat( isl_stream *s, int type);
int isl_stream_is_empty( isl_stream *s);
int isl_stream_skip_line( isl_stream *s);

 isl_token_type isl_stream_register_keyword( isl_stream *s,
	const char *name);

 isl_obj isl_stream_read_obj( isl_stream *s);
 isl_id *isl_stream_read_id( isl_stream *s);
 isl_val *isl_stream_read_val( isl_stream *s);
 isl_multi_val *isl_stream_read_multi_val( isl_stream *s);
 isl_multi_aff *isl_stream_read_multi_aff( isl_stream *s);
 isl_map *isl_stream_read_map( isl_stream *s);
 isl_set *isl_stream_read_set( isl_stream *s);
 isl_basic_set *isl_stream_read_basic_set( isl_stream *s);
 isl_pw_qpolynomial *isl_stream_read_pw_qpolynomial(
	 isl_stream *s);
 isl_union_set *isl_stream_read_union_set( isl_stream *s);
 isl_union_map *isl_stream_read_union_map( isl_stream *s);
 isl_schedule *isl_stream_read_schedule(isl_stream *s);

isl_stat isl_stream_yaml_read_start_mapping( isl_stream *s);
isl_stat isl_stream_yaml_read_end_mapping( isl_stream *s);
isl_stat isl_stream_yaml_read_start_sequence( isl_stream *s);
isl_stat isl_stream_yaml_read_end_sequence( isl_stream *s);
isl_bool isl_stream_yaml_next( isl_stream *s);


#endif
