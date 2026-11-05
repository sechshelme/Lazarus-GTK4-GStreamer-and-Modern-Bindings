#ifndef ISL_AFF_TYPE_H
#define ISL_AFF_TYPE_H

#include <isl/list.h>

#if defined(__cplusplus)

#endif

struct  isl_aff;

struct isl_aff;							
typedef struct isl_aff_list isl_aff_list;


struct isl_pw_aff;							
struct isl_pw_aff_list;					
typedef struct isl_pw_aff_list isl_pw_aff_list;

typedef struct isl_union_pw_aff isl_union_pw_aff;

struct isl_union_pw_aff;							
struct isl_union_pw_aff_list;					
typedef struct isl_union_pw_aff_list isl_union_pw_aff_list;

struct 
	isl_multi_aff;
typedef struct isl_multi_aff isl_multi_aff;

struct 
	isl_pw_multi_aff;
typedef struct isl_pw_multi_aff isl_pw_multi_aff;

struct isl_pw_multi_aff;							
struct  isl_pw_multi_aff_list;					
typedef struct isl_pw_multi_aff_list isl_pw_multi_aff_list;

struct  isl_union_pw_multi_aff;
typedef struct isl_union_pw_multi_aff isl_union_pw_multi_aff;

struct isl_union_pw_multi_aff;							
struct isl_union_pw_multi_aff_list;					
typedef struct isl_union_pw_multi_aff_list isl_union_pw_multi_aff_list;

struct  isl_multi_pw_aff;
typedef struct isl_multi_pw_aff isl_multi_pw_aff;

struct  isl_multi_union_pw_aff;
typedef struct isl_multi_union_pw_aff isl_multi_union_pw_aff;


#endif
