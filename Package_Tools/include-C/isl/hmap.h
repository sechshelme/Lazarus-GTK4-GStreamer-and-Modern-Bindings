#include <isl/ctx.h>
#include <isl/maybe.h>
#include <isl/printer.h>

#if defined(__cplusplus)

#endif

#define ISL_xCAT(A,B) A ## B
#define ISL_CAT(A,B) ISL_xCAT(A,B)
#define ISL_xFN(TYPE,NAME) TYPE ## _ ## NAME
#define ISL_FN(TYPE,NAME) ISL_xFN(TYPE,NAME)

struct extern ISL_HMAP;
typedef struct ISL_HMAP	ISL_HMAP;


 ISL_HMAP *ISL_FN(ISL_HMAP,alloc)(isl_ctx *ctx, int min_size);
 ISL_HMAP *ISL_FN(ISL_HMAP,copy)( ISL_HMAP *hmap);
 ISL_HMAP *ISL_FN(ISL_HMAP,free)( ISL_HMAP *hmap);

isl_ctx *ISL_FN(ISL_HMAP,get_ctx)( ISL_HMAP *hmap);

 ISL_MAYBE(ISL_VAL) ISL_FN(ISL_HMAP,try_get)(
	 ISL_HMAP *hmap,  ISL_KEY *key);
isl_bool ISL_FN(ISL_HMAP,has)( ISL_HMAP *hmap,
	 ISL_KEY *key);
 ISL_VAL *ISL_FN(ISL_HMAP,get)( ISL_HMAP *hmap,
	 ISL_KEY *key);
extern
 ISL_HMAP *ISL_FN(ISL_HMAP,set)( ISL_HMAP *hmap,
	 ISL_KEY *key,  ISL_VAL *val);
 ISL_HMAP *ISL_FN(ISL_HMAP,drop)( ISL_HMAP *hmap,
	 ISL_KEY *key);

isl_stat ISL_FN(ISL_HMAP,foreach)( ISL_HMAP *hmap,
	isl_stat (*fn)( ISL_KEY *key,  ISL_VAL *val,
		void *user),
	void *user);
isl_bool ISL_FN(ISL_HMAP,every)( ISL_HMAP *hmap,
	isl_bool (*test)( ISL_KEY *key,  ISL_VAL *val,
		void *user),
	void *user);

#ifdef ISL_HMAP_IS_EQUAL
extern
isl_bool ISL_HMAP_IS_EQUAL( ISL_HMAP *hmap1,
	 ISL_HMAP *hmap2);
#endif

#ifdef ISL_HMAP_HAVE_READ_FROM_STR

 ISL_HMAP *ISL_FN(ISL_HMAP,read_from_str)(isl_ctx *ctx,
	const char *str);
#endif
 char *ISL_FN(ISL_HMAP,to_str)( ISL_HMAP *hmap);
 isl_printer *ISL_FN(isl_printer_print,ISL_HMAP_SUFFIX)(
	 isl_printer *p,  ISL_HMAP *hmap);
void ISL_FN(ISL_HMAP,dump)( ISL_HMAP *hmap);

#undef ISL_xCAT
#undef ISL_CAT
#undef ISL_KEY
#undef ISL_VAL
#undef ISL_xFN
#undef ISL_FN
#undef ISL_xHMAP
#undef ISL_yHMAP
#undef ISL_HMAP

#if defined(__cplusplus)
}
#endif
