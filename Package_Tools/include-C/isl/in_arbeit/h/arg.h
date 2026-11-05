/*
 * Copyright 2008-2009 Katholieke Universiteit Leuven
 *
 * Use of this software is governed by the MIT license
 *
 * Written by Sven Verdoolaege, K.U.Leuven, Departement
 * Computerwetenschappen, Celestijnenlaan 200A, B-3001 Leuven, Belgium
 */

#ifndef ISL_ARG_H
#define ISL_ARG_H

#include <stddef.h>
#include <stdlib.h>

#if defined(__cplusplus)

#endif

struct isl_arg_choice {
	const char	*name;
	unsigned	 value;
};

struct isl_arg_flags {
	const char	*name;
	unsigned	 mask;
	unsigned	 value;
};

enum isl_arg_type {
	isl_arg_end,
	isl_arg_alias,
	isl_arg_arg,
	isl_arg_bool,
	isl_arg_child,
	isl_arg_choice,
	isl_arg_flags,
	isl_arg_footer,
	isl_arg_int,
	isl_arg_user,
	isl_arg_long,
	isl_arg_ulong,
	isl_arg_str,
	isl_arg_str_list,
	isl_arg_version
};

struct isl_args;

#define ISL_ARG_OFFSET_NONE	((size_t) -1)
#define ISL_ARG_SINGLE_DASH	(1 << 0)
#define ISL_ARG_BOOL_ARG	(1 << 1)
#define ISL_ARG_HIDDEN		(1 << 2)

struct isl_arg {
	enum isl_arg_type	 type;
	char			 short_name;
	const char		*long_name;
	const char		*argument_name;
	size_t			 offset;
	const char		*help_msg;
	unsigned		 flags;
	union {
	struct {
		struct isl_arg_choice	*choice;
		unsigned	 	 default_value;
		unsigned	 	 default_selected;
		int (*set)(void *opt, unsigned val);
	} choice;
	struct {
		struct isl_arg_flags	*flags;
		unsigned	 	 default_value;
	} flags;
	struct {
		unsigned		 default_value;
		int (*set)(void *opt, unsigned val);
	} b;
	struct {
		int			default_value;
	} i;
	struct {
		long		 	default_value;
		long		 	default_selected;
		int (*set)(void *opt, long val);
	} l;
	struct {
		unsigned long		default_value;
	} ul;
	struct {
		const char		*default_value;
	} str;
	struct {
		size_t			 offset_n;
	} str_list;
	struct {
		struct isl_args		*child;
	} child;
	struct {
		void (*print_version)(void);
	} version;
	struct {
		int (*init)(void*);
		void (*clear)(void*);
	} user;
	} u;
};

struct isl_args {
	size_t			 options_size;
	 isl_arg		*args;
};


#define ISL_ARG_ALL		(1 << 0)
#define ISL_ARG_SKIP_HELP	(1 << 1)

void isl_args_set_defaults(struct isl_args *args, void *opt);
void isl_args_free(struct isl_args *args, void *opt);
int isl_args_parse(struct isl_args *args, int argc, char **argv, void *opt,
	unsigned flags);


