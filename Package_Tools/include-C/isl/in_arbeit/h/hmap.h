#include <isl/ctx.h>
#include <isl/maybe.h>
#include <isl/printer.h>

#if defined(__cplusplus)

#endif


struct  ISL_HMAP;
typedef struct ISL_HMAP	ISL_HMAP;


/* xxxxxxxxx
#define ISL_xFN(TYPE,NAME) TYPE ## _ ## NAME
#define ISL_FN(TYPE,NAME) ISL_xFN(TYPE,NAME)

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
*/

isl_id_to_id *isl_id_to_id_alloc(isl_ctx *ctx, int min_size);
isl_id_to_id *isl_id_to_id_copy(isl_id_to_id *hmap);
isl_id_to_id *isl_id_to_id_free(isl_id_to_id *hmap);

isl_ctx *isl_id_to_id_get_ctx(isl_id_to_id *hmap);

 isl_maybe_isl_id isl_id_to_id_try_get(isl_id_to_id *hmap, isl_id *key);
isl_bool isl_id_to_id_has(isl_id_to_id *hmap, isl_id *key);
isl_id *isl_id_to_id_get(isl_id_to_id *hmap, isl_id *key);

extern isl_id_to_id *isl_id_to_id_set(isl_id_to_id *hmap, isl_id *key, isl_id *val);
isl_id_to_id *isl_id_to_id_drop(isl_id_to_id *hmap, isl_id *key);

isl_stat isl_id_to_id_foreach(isl_id_to_id *hmap,
	isl_stat (*fn)(isl_id *key, isl_id *val, void *user), void *user);
isl_bool isl_id_to_id_every(isl_id_to_id *hmap,
	isl_bool (*test)(isl_id *key, isl_id *val, void *user), void *user);

// Falls ISL_HMAP_IS_EQUAL definiert ist (hier: isl_id_to_id_is_equal)
extern isl_bool isl_id_to_id_is_equal(isl_id_to_id *hmap1, isl_id_to_id *hmap2);

// Falls ISL_HMAP_HAVE_READ_FROM_STR definiert ist
isl_id_to_id *isl_id_to_id_read_from_str(isl_ctx *ctx, const char *str);

char *isl_id_to_id_to_str(isl_id_to_id *hmap);

// WICHTIG: Das Suffix für den Printer wird separat definiert, z.B. #define ISL_HMAP_SUFFIX id_to_id
isl_printer *isl_printer_print_id_to_id(isl_printer *p, isl_id_to_id *hmap);
void isl_id_to_id_dump(isl_id_to_id *hmap);

// ====  xxxxxxxxxxxxxxxxxxxxxxx

isl_id_to_ast_expr *isl_id_to_ast_expr_alloc(isl_ctx *ctx, int min_size);
isl_id_to_ast_expr *isl_id_to_ast_expr_copy(isl_id_to_ast_expr *hmap);
isl_id_to_ast_expr *isl_id_to_ast_expr_free(isl_id_to_ast_expr *hmap);

isl_ctx *isl_id_to_ast_expr_get_ctx(isl_id_to_ast_expr *hmap);

isl_maybe_isl_ast_expr isl_id_to_ast_expr_try_get(isl_id_to_ast_expr *hmap, isl_id *key);
isl_bool isl_id_to_ast_expr_has(isl_id_to_ast_expr *hmap, isl_id *key);
isl_ast_expr *isl_id_to_ast_expr_get(isl_id_to_ast_expr *hmap, isl_id *key);

extern isl_id_to_ast_expr *isl_id_to_ast_expr_set(isl_id_to_ast_expr *hmap, isl_id *key, isl_ast_expr *val);
isl_id_to_ast_expr *isl_id_to_ast_expr_drop(isl_id_to_ast_expr *hmap, isl_id *key);

isl_stat isl_id_to_ast_expr_foreach(isl_id_to_ast_expr *hmap,
	isl_stat (*fn)(isl_id *key, isl_ast_expr *val, void *user), void *user);
isl_bool isl_id_to_ast_expr_every(isl_id_to_ast_expr *hmap,
	isl_bool (*test)(isl_id *key, isl_ast_expr *val, void *user), void *user);

// Aktiviert durch #define ISL_HMAP_IS_EQUAL
extern isl_bool isl_id_to_ast_expr_is_equal(isl_id_to_ast_expr *hmap1, isl_id_to_ast_expr *hmap2);

// Aktiviert durch #define ISL_HMAP_HAVE_READ_FROM_STR
isl_id_to_ast_expr *isl_id_to_ast_expr_read_from_str(isl_ctx *ctx, const char *str);

char *isl_id_to_ast_expr_to_str(isl_id_to_ast_expr *hmap);

// Aktiviert durch #define ISL_HMAP_SUFFIX id_to_ast_expr
isl_printer *isl_printer_print_id_to_ast_expr(isl_printer *p, isl_id_to_ast_expr *hmap);
void isl_id_to_ast_expr_dump(isl_id_to_ast_expr *hmap);

// ====  xxxxxxxxxxxxxxxxxxxxxxx

isl_id_to_pw_aff *isl_id_to_pw_aff_alloc(isl_ctx *ctx, int min_size);
isl_id_to_pw_aff *isl_id_to_pw_aff_copy(isl_id_to_pw_aff *hmap);
isl_id_to_pw_aff *isl_id_to_pw_aff_free(isl_id_to_pw_aff *hmap);

isl_ctx *isl_id_to_pw_aff_get_ctx(isl_id_to_pw_aff *hmap);

 isl_maybe_isl_pw_aff isl_id_to_pw_aff_try_get(isl_id_to_pw_aff *hmap, isl_id *key);
isl_bool isl_id_to_pw_aff_has(isl_id_to_pw_aff *hmap, isl_id *key);
isl_pw_aff *isl_id_to_pw_aff_get(isl_id_to_pw_aff *hmap, isl_id *key);

extern isl_id_to_pw_aff *isl_id_to_pw_aff_set(isl_id_to_pw_aff *hmap, isl_id *key, isl_pw_aff *val);
isl_id_to_pw_aff *isl_id_to_pw_aff_drop(isl_id_to_pw_aff *hmap, isl_id *key);

isl_stat isl_id_to_pw_aff_foreach(isl_id_to_pw_aff *hmap,
	isl_stat (*fn)(isl_id *key, isl_pw_aff *val, void *user), void *user);
isl_bool isl_id_to_pw_aff_every(isl_id_to_pw_aff *hmap,
	isl_bool (*test)(isl_id *key, isl_pw_aff *val, void *user), void *user);

// ACHTUNG: Hier greift die Namensänderung aus dem Makro!
extern isl_bool isl_id_to_pw_aff_plain_is_equal(isl_id_to_pw_aff *hmap1, isl_id_to_pw_aff *hmap2);

// Aktiviert durch #define ISL_HMAP_HAVE_READ_FROM_STR
isl_id_to_pw_aff *isl_id_to_pw_aff_read_from_str(isl_ctx *ctx, const char *str);

char *isl_id_to_pw_aff_to_str(isl_id_to_pw_aff *hmap);

// Aktiviert durch #define ISL_HMAP_SUFFIX id_to_pw_aff
isl_printer *isl_printer_print_id_to_pw_aff(isl_printer *p, isl_id_to_pw_aff *hmap);
void isl_id_to_pw_aff_dump(isl_id_to_pw_aff *hmap);

// ====  xxxxxxxxxxxxxxxxxxxxxxx

isl_map_to_basic_set *isl_map_to_basic_set_alloc(isl_ctx *ctx, int min_size);
isl_map_to_basic_set *isl_map_to_basic_set_copy(isl_map_to_basic_set *hmap);
isl_map_to_basic_set *isl_map_to_basic_set_free(isl_map_to_basic_set *hmap);

isl_ctx *isl_map_to_basic_set_get_ctx(isl_map_to_basic_set *hmap);

 isl_maybe_isl_basic_set isl_map_to_basic_set_try_get(isl_map_to_basic_set *hmap, isl_map *key);
isl_bool isl_map_to_basic_set_has(isl_map_to_basic_set *hmap, isl_map *key);
isl_basic_set *isl_map_to_basic_set_get(isl_map_to_basic_set *hmap, isl_map *key);

extern isl_map_to_basic_set *isl_map_to_basic_set_set(isl_map_to_basic_set *hmap, isl_map *key, isl_basic_set *val);
isl_map_to_basic_set *isl_map_to_basic_set_drop(isl_map_to_basic_set *hmap, isl_map *key);

isl_stat isl_map_to_basic_set_foreach(isl_map_to_basic_set *hmap,
	isl_stat (*fn)(isl_map *key, isl_basic_set *val, void *user), void *user);
isl_bool isl_map_to_basic_set_every(isl_map_to_basic_set *hmap,
	isl_bool (*test)(isl_map *key, isl_basic_set *val, void *user), void *user);

// Beachten Sie wieder den "plain"-Zusatz aus dem Makro
extern isl_bool isl_map_to_basic_set_plain_is_equal(isl_map_to_basic_set *hmap1, isl_map_to_basic_set *hmap2);

// Aktiviert durch #define ISL_HMAP_HAVE_READ_FROM_STR
isl_map_to_basic_set *isl_map_to_basic_set_read_from_str(isl_ctx *ctx, const char *str);

char *isl_map_to_basic_set_to_str(isl_map_to_basic_set *hmap);

// Aktiviert durch #define ISL_HMAP_SUFFIX map_to_basic_set
isl_printer *isl_printer_print_map_to_basic_set(isl_printer *p, isl_map_to_basic_set *hmap);
void isl_map_to_basic_set_dump(isl_map_to_basic_set *hmap);




