unit hmap;

interface

uses
  fp_isl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$include <isl/ctx.h>}
{$include <isl/maybe.h>}
{$include <isl/printer.h>}
{$if defined(__cplusplus)}
{$endif}
type
  PISL_HMAP = ^TISL_HMAP;
  TISL_HMAP = record
      {undefined structure}
    end;

{ xxxxxxxxx
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
 }

function isl_id_to_id_alloc(ctx:Pisl_ctx; min_size:longint):Pisl_id_to_id;cdecl;external libisl;
function isl_id_to_id_copy(hmap:Pisl_id_to_id):Pisl_id_to_id;cdecl;external libisl;
function isl_id_to_id_free(hmap:Pisl_id_to_id):Pisl_id_to_id;cdecl;external libisl;
function isl_id_to_id_get_ctx(hmap:Pisl_id_to_id):Pisl_ctx;cdecl;external libisl;
function isl_id_to_id_try_get(hmap:Pisl_id_to_id; key:Pisl_id):Tisl_maybe_isl_id;cdecl;external libisl;
function isl_id_to_id_has(hmap:Pisl_id_to_id; key:Pisl_id):Tisl_bool;cdecl;external libisl;
function isl_id_to_id_get(hmap:Pisl_id_to_id; key:Pisl_id):Pisl_id;cdecl;external libisl;
function isl_id_to_id_set(hmap:Pisl_id_to_id; key:Pisl_id; val:Pisl_id):Pisl_id_to_id;cdecl;external libisl;
function isl_id_to_id_drop(hmap:Pisl_id_to_id; key:Pisl_id):Pisl_id_to_id;cdecl;external libisl;
function isl_id_to_id_foreach(hmap:Pisl_id_to_id; fn:function (key:Pisl_id; val:Pisl_id; user:pointer):Tisl_stat; user:pointer):Tisl_stat;cdecl;external libisl;
function isl_id_to_id_every(hmap:Pisl_id_to_id; test:function (key:Pisl_id; val:Pisl_id; user:pointer):Tisl_bool; user:pointer):Tisl_bool;cdecl;external libisl;
{ Falls ISL_HMAP_IS_EQUAL definiert ist (hier: isl_id_to_id_is_equal) }
function isl_id_to_id_is_equal(hmap1:Pisl_id_to_id; hmap2:Pisl_id_to_id):Tisl_bool;cdecl;external libisl;
{ Falls ISL_HMAP_HAVE_READ_FROM_STR definiert ist }
function isl_id_to_id_read_from_str(ctx:Pisl_ctx; str:Pchar):Pisl_id_to_id;cdecl;external libisl;
function isl_id_to_id_to_str(hmap:Pisl_id_to_id):Pchar;cdecl;external libisl;
{ WICHTIG: Das Suffix für den Printer wird separat definiert, z.B. #define ISL_HMAP_SUFFIX id_to_id }
function isl_printer_print_id_to_id(p:Pisl_printer; hmap:Pisl_id_to_id):Pisl_printer;cdecl;external libisl;
procedure isl_id_to_id_dump(hmap:Pisl_id_to_id);cdecl;external libisl;
{ ====  xxxxxxxxxxxxxxxxxxxxxxx }
function isl_id_to_ast_expr_alloc(ctx:Pisl_ctx; min_size:longint):Pisl_id_to_ast_expr;cdecl;external libisl;
function isl_id_to_ast_expr_copy(hmap:Pisl_id_to_ast_expr):Pisl_id_to_ast_expr;cdecl;external libisl;
function isl_id_to_ast_expr_free(hmap:Pisl_id_to_ast_expr):Pisl_id_to_ast_expr;cdecl;external libisl;
function isl_id_to_ast_expr_get_ctx(hmap:Pisl_id_to_ast_expr):Pisl_ctx;cdecl;external libisl;
function isl_id_to_ast_expr_try_get(hmap:Pisl_id_to_ast_expr; key:Pisl_id):Tisl_maybe_isl_ast_expr;cdecl;external libisl;
function isl_id_to_ast_expr_has(hmap:Pisl_id_to_ast_expr; key:Pisl_id):Tisl_bool;cdecl;external libisl;
function isl_id_to_ast_expr_get(hmap:Pisl_id_to_ast_expr; key:Pisl_id):Pisl_ast_expr;cdecl;external libisl;
function isl_id_to_ast_expr_set(hmap:Pisl_id_to_ast_expr; key:Pisl_id; val:Pisl_ast_expr):Pisl_id_to_ast_expr;cdecl;external libisl;
function isl_id_to_ast_expr_drop(hmap:Pisl_id_to_ast_expr; key:Pisl_id):Pisl_id_to_ast_expr;cdecl;external libisl;
function isl_id_to_ast_expr_foreach(hmap:Pisl_id_to_ast_expr; fn:function (key:Pisl_id; val:Pisl_ast_expr; user:pointer):Tisl_stat; user:pointer):Tisl_stat;cdecl;external libisl;
function isl_id_to_ast_expr_every(hmap:Pisl_id_to_ast_expr; test:function (key:Pisl_id; val:Pisl_ast_expr; user:pointer):Tisl_bool; user:pointer):Tisl_bool;cdecl;external libisl;
{ Aktiviert durch #define ISL_HMAP_IS_EQUAL }
function isl_id_to_ast_expr_is_equal(hmap1:Pisl_id_to_ast_expr; hmap2:Pisl_id_to_ast_expr):Tisl_bool;cdecl;external libisl;
{ Aktiviert durch #define ISL_HMAP_HAVE_READ_FROM_STR }
function isl_id_to_ast_expr_read_from_str(ctx:Pisl_ctx; str:Pchar):Pisl_id_to_ast_expr;cdecl;external libisl;
function isl_id_to_ast_expr_to_str(hmap:Pisl_id_to_ast_expr):Pchar;cdecl;external libisl;
{ Aktiviert durch #define ISL_HMAP_SUFFIX id_to_ast_expr }
function isl_printer_print_id_to_ast_expr(p:Pisl_printer; hmap:Pisl_id_to_ast_expr):Pisl_printer;cdecl;external libisl;
procedure isl_id_to_ast_expr_dump(hmap:Pisl_id_to_ast_expr);cdecl;external libisl;
{ ====  xxxxxxxxxxxxxxxxxxxxxxx }
function isl_id_to_pw_aff_alloc(ctx:Pisl_ctx; min_size:longint):Pisl_id_to_pw_aff;cdecl;external libisl;
function isl_id_to_pw_aff_copy(hmap:Pisl_id_to_pw_aff):Pisl_id_to_pw_aff;cdecl;external libisl;
function isl_id_to_pw_aff_free(hmap:Pisl_id_to_pw_aff):Pisl_id_to_pw_aff;cdecl;external libisl;
function isl_id_to_pw_aff_get_ctx(hmap:Pisl_id_to_pw_aff):Pisl_ctx;cdecl;external libisl;
function isl_id_to_pw_aff_try_get(hmap:Pisl_id_to_pw_aff; key:Pisl_id):Tisl_maybe_isl_pw_aff;cdecl;external libisl;
function isl_id_to_pw_aff_has(hmap:Pisl_id_to_pw_aff; key:Pisl_id):Tisl_bool;cdecl;external libisl;
function isl_id_to_pw_aff_get(hmap:Pisl_id_to_pw_aff; key:Pisl_id):Pisl_pw_aff;cdecl;external libisl;
function isl_id_to_pw_aff_set(hmap:Pisl_id_to_pw_aff; key:Pisl_id; val:Pisl_pw_aff):Pisl_id_to_pw_aff;cdecl;external libisl;
function isl_id_to_pw_aff_drop(hmap:Pisl_id_to_pw_aff; key:Pisl_id):Pisl_id_to_pw_aff;cdecl;external libisl;
function isl_id_to_pw_aff_foreach(hmap:Pisl_id_to_pw_aff; fn:function (key:Pisl_id; val:Pisl_pw_aff; user:pointer):Tisl_stat; user:pointer):Tisl_stat;cdecl;external libisl;
function isl_id_to_pw_aff_every(hmap:Pisl_id_to_pw_aff; test:function (key:Pisl_id; val:Pisl_pw_aff; user:pointer):Tisl_bool; user:pointer):Tisl_bool;cdecl;external libisl;
{ ACHTUNG: Hier greift die Namensänderung aus dem Makro! }
function isl_id_to_pw_aff_plain_is_equal(hmap1:Pisl_id_to_pw_aff; hmap2:Pisl_id_to_pw_aff):Tisl_bool;cdecl;external libisl;
{ Aktiviert durch #define ISL_HMAP_HAVE_READ_FROM_STR }
function isl_id_to_pw_aff_read_from_str(ctx:Pisl_ctx; str:Pchar):Pisl_id_to_pw_aff;cdecl;external libisl;
function isl_id_to_pw_aff_to_str(hmap:Pisl_id_to_pw_aff):Pchar;cdecl;external libisl;
{ Aktiviert durch #define ISL_HMAP_SUFFIX id_to_pw_aff }
function isl_printer_print_id_to_pw_aff(p:Pisl_printer; hmap:Pisl_id_to_pw_aff):Pisl_printer;cdecl;external libisl;
procedure isl_id_to_pw_aff_dump(hmap:Pisl_id_to_pw_aff);cdecl;external libisl;
{ ====  xxxxxxxxxxxxxxxxxxxxxxx }
function isl_map_to_basic_set_alloc(ctx:Pisl_ctx; min_size:longint):Pisl_map_to_basic_set;cdecl;external libisl;
function isl_map_to_basic_set_copy(hmap:Pisl_map_to_basic_set):Pisl_map_to_basic_set;cdecl;external libisl;
function isl_map_to_basic_set_free(hmap:Pisl_map_to_basic_set):Pisl_map_to_basic_set;cdecl;external libisl;
function isl_map_to_basic_set_get_ctx(hmap:Pisl_map_to_basic_set):Pisl_ctx;cdecl;external libisl;
function isl_map_to_basic_set_try_get(hmap:Pisl_map_to_basic_set; key:Pisl_map):Tisl_maybe_isl_basic_set;cdecl;external libisl;
function isl_map_to_basic_set_has(hmap:Pisl_map_to_basic_set; key:Pisl_map):Tisl_bool;cdecl;external libisl;
function isl_map_to_basic_set_get(hmap:Pisl_map_to_basic_set; key:Pisl_map):Pisl_basic_set;cdecl;external libisl;
function isl_map_to_basic_set_set(hmap:Pisl_map_to_basic_set; key:Pisl_map; val:Pisl_basic_set):Pisl_map_to_basic_set;cdecl;external libisl;
function isl_map_to_basic_set_drop(hmap:Pisl_map_to_basic_set; key:Pisl_map):Pisl_map_to_basic_set;cdecl;external libisl;
function isl_map_to_basic_set_foreach(hmap:Pisl_map_to_basic_set; fn:function (key:Pisl_map; val:Pisl_basic_set; user:pointer):Tisl_stat; user:pointer):Tisl_stat;cdecl;external libisl;
function isl_map_to_basic_set_every(hmap:Pisl_map_to_basic_set; test:function (key:Pisl_map; val:Pisl_basic_set; user:pointer):Tisl_bool; user:pointer):Tisl_bool;cdecl;external libisl;
{ Beachten Sie wieder den "plain"-Zusatz aus dem Makro }
function isl_map_to_basic_set_plain_is_equal(hmap1:Pisl_map_to_basic_set; hmap2:Pisl_map_to_basic_set):Tisl_bool;cdecl;external libisl;
{ Aktiviert durch #define ISL_HMAP_HAVE_READ_FROM_STR }
function isl_map_to_basic_set_read_from_str(ctx:Pisl_ctx; str:Pchar):Pisl_map_to_basic_set;cdecl;external libisl;
function isl_map_to_basic_set_to_str(hmap:Pisl_map_to_basic_set):Pchar;cdecl;external libisl;
{ Aktiviert durch #define ISL_HMAP_SUFFIX map_to_basic_set }
function isl_printer_print_map_to_basic_set(p:Pisl_printer; hmap:Pisl_map_to_basic_set):Pisl_printer;cdecl;external libisl;
procedure isl_map_to_basic_set_dump(hmap:Pisl_map_to_basic_set);cdecl;external libisl;

// === Konventiert am: 5-11-26 15:58:46 ===


implementation



end.
