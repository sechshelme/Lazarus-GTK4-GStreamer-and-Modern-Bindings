#include <isl/ctx.h>
#include <isl/maybe.h>

/* xxxxxxxxxxxx
struct ISL_MAYBE(ISL_TYPE) {
	isl_bool	valid;
	ISL_TYPE	*value;
};
typedef struct ISL_MAYBE(ISL_TYPE) ISL_MAYBE(ISL_TYPE);

 */

struct isl_maybe_isl_id {
	isl_bool    valid;   // Ist isl_bool_true, wenn der Key existierte
	isl_id      *value;  // Der gefundene Wert (oder NULL)
};
typedef struct isl_maybe_isl_id isl_maybe_isl_id;


struct isl_maybe_isl_ast_expr {
	isl_bool      valid;
	isl_ast_expr  *value;
};
typedef struct isl_maybe_isl_ast_expr isl_maybe_isl_ast_expr;


struct isl_maybe_isl_pw_aff {
	isl_bool    valid;
	isl_pw_aff  *value;
};
typedef struct isl_maybe_isl_pw_aff isl_maybe_isl_pw_aff;

struct isl_maybe_isl_basic_set {
	isl_bool       valid;   // Ist isl_bool_true, wenn der Key existierte
	isl_basic_set  *value;  // Zeiger auf das gefundene Basic Set
};
typedef struct isl_maybe_isl_basic_set isl_maybe_isl_basic_set;


