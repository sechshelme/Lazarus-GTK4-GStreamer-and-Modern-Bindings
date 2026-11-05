#ifndef ISL_POLYNOMIAL_TYPE_H
#define ISL_POLYNOMIAL_TYPE_H

#include <isl/ctx.h>
#include <isl/list.h>

struct isl_qpolynomial;
typedef struct isl_qpolynomial isl_qpolynomial;

struct isl_qpolynomial;							
struct isl_qpolynomial_list;					
typedef struct isl_qpolynomial_list isl_qpolynomial_list;

struct isl_term;
typedef struct isl_term isl_term;

struct  isl_pw_qpolynomial;
typedef struct isl_pw_qpolynomial isl_pw_qpolynomial;

struct isl_pw_qpolynomial;							
struct isl_pw_qpolynomial_list;					
typedef struct isl_pw_qpolynomial_list isl_pw_qpolynomial_list;

enum isl_fold {
	isl_fold_error = -1,
	isl_fold_min,
	isl_fold_max,
	isl_fold_list
};

struct isl_qpolynomial_fold;
typedef struct isl_qpolynomial_fold isl_qpolynomial_fold;

struct isl_pw_qpolynomial_fold;
typedef struct isl_pw_qpolynomial_fold isl_pw_qpolynomial_fold;

struct isl_pw_qpolynomial_fold;							
struct isl_pw_qpolynomial_fold_list;					
typedef struct isl_pw_qpolynomial_fold_list isl_pw_qpolynomial_fold_list;

struct  isl_union_pw_qpolynomial;
typedef struct isl_union_pw_qpolynomial isl_union_pw_qpolynomial;

struct isl_union_pw_qpolynomial_fold;
typedef struct isl_union_pw_qpolynomial_fold isl_union_pw_qpolynomial_fold;

#endif
