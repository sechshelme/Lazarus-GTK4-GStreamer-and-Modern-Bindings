{$IFDEF read_interface}


type
  Pisl_ast_build = type Pointer;

function isl_options_set_ast_build_atomic_upper_bound(ctx: Pisl_ctx; val: longint): Tisl_stat; cdecl; external libisl;
function isl_options_get_ast_build_atomic_upper_bound(ctx: Pisl_ctx): longint; cdecl; external libisl;
function isl_options_set_ast_build_prefer_pdiv(ctx: Pisl_ctx; val: longint): Tisl_stat; cdecl; external libisl;
function isl_options_get_ast_build_prefer_pdiv(ctx: Pisl_ctx): longint; cdecl; external libisl;
function isl_options_set_ast_build_detect_min_max(ctx: Pisl_ctx; val: longint): Tisl_stat; cdecl; external libisl;
function isl_options_get_ast_build_detect_min_max(ctx: Pisl_ctx): longint; cdecl; external libisl;
function isl_options_set_ast_build_exploit_nested_bounds(ctx: Pisl_ctx; val: longint): Tisl_stat; cdecl; external libisl;
function isl_options_get_ast_build_exploit_nested_bounds(ctx: Pisl_ctx): longint; cdecl; external libisl;
function isl_options_set_ast_build_group_coscheduled(ctx: Pisl_ctx; val: longint): Tisl_stat; cdecl; external libisl;
function isl_options_get_ast_build_group_coscheduled(ctx: Pisl_ctx): longint; cdecl; external libisl;

const
  ISL_AST_BUILD_SEPARATION_BOUNDS_EXPLICIT = 0;
  ISL_AST_BUILD_SEPARATION_BOUNDS_IMPLICIT = 1;

function isl_options_set_ast_build_separation_bounds(ctx: Pisl_ctx; val: longint): Tisl_stat; cdecl; external libisl;
function isl_options_get_ast_build_separation_bounds(ctx: Pisl_ctx): longint; cdecl; external libisl;
function isl_options_set_ast_build_scale_strides(ctx: Pisl_ctx; val: longint): Tisl_stat; cdecl; external libisl;
function isl_options_get_ast_build_scale_strides(ctx: Pisl_ctx): longint; cdecl; external libisl;
function isl_options_set_ast_build_allow_else(ctx: Pisl_ctx; val: longint): Tisl_stat; cdecl; external libisl;
function isl_options_get_ast_build_allow_else(ctx: Pisl_ctx): longint; cdecl; external libisl;
function isl_options_set_ast_build_allow_or(ctx: Pisl_ctx; val: longint): Tisl_stat; cdecl; external libisl;
function isl_options_get_ast_build_allow_or(ctx: Pisl_ctx): longint; cdecl; external libisl;
function isl_ast_build_get_ctx(build: Pisl_ast_build): Pisl_ctx; cdecl; external libisl;
function isl_ast_build_alloc(ctx: Pisl_ctx): Pisl_ast_build; cdecl; external libisl;
function isl_ast_build_from_context(set_: Pisl_set): Pisl_ast_build; cdecl; external libisl;
function isl_ast_build_get_schedule_space(build: Pisl_ast_build): Pisl_space; cdecl; external libisl;
function isl_ast_build_get_schedule(build: Pisl_ast_build): Pisl_union_map; cdecl; external libisl;
function isl_ast_build_restrict(build: Pisl_ast_build; set_: Pisl_set): Pisl_ast_build; cdecl; external libisl;
function isl_ast_build_copy(build: Pisl_ast_build): Pisl_ast_build; cdecl; external libisl;
function isl_ast_build_free(build: Pisl_ast_build): Pisl_ast_build; cdecl; external libisl;
function isl_ast_build_set_options(build: Pisl_ast_build; options: Pisl_union_map): Pisl_ast_build; cdecl; external libisl;
function isl_ast_build_set_iterators(build: Pisl_ast_build; iterators: Pisl_id_list): Pisl_ast_build; cdecl; external libisl;

type
  Tast_build_func1 = function(node: Pisl_ast_node; build: Pisl_ast_build; user: pointer): Pisl_ast_node; cdecl;
  Tast_build_func2 = function(build: Pisl_ast_build; user: pointer): Pisl_id; cdecl;
  Tast_build_func3 = function(mark: Pisl_id; build: Pisl_ast_build; user: pointer): Tisl_stat; cdecl;
  Tast_build_func4 = function(build: Pisl_ast_build; user: pointer): Pisl_ast_node; cdecl;

function isl_ast_build_set_at_each_domain(build: Pisl_ast_build; fn: Tast_build_func1; user: pointer): Pisl_ast_build; cdecl; external libisl;
function isl_ast_build_set_before_each_for(build: Pisl_ast_build; fn: Tast_build_func2; user: pointer): Pisl_ast_build; cdecl; external libisl;
function isl_ast_build_set_after_each_for(build: Pisl_ast_build; fn: Tast_build_func1; user: pointer): Pisl_ast_build; cdecl; external libisl;
function isl_ast_build_set_before_each_mark(build: Pisl_ast_build; fn: Tast_build_func3; user: pointer): Pisl_ast_build; cdecl; external libisl;
function isl_ast_build_set_after_each_mark(build: Pisl_ast_build; fn: Tast_build_func1; user: pointer): Pisl_ast_build; cdecl; external libisl;
function isl_ast_build_set_create_leaf(build: Pisl_ast_build; fn: Tast_build_func4; user: pointer): Pisl_ast_build; cdecl; external libisl;
function isl_ast_build_expr_from_set(build: Pisl_ast_build; set_: Pisl_set): Pisl_ast_expr; cdecl; external libisl;
function isl_ast_build_expr_from_pw_aff(build: Pisl_ast_build; pa: Pisl_pw_aff): Pisl_ast_expr; cdecl; external libisl;
function isl_ast_build_access_from_pw_multi_aff(build: Pisl_ast_build; pma: Pisl_pw_multi_aff): Pisl_ast_expr; cdecl; external libisl;
function isl_ast_build_access_from_multi_pw_aff(build: Pisl_ast_build; mpa: Pisl_multi_pw_aff): Pisl_ast_expr; cdecl; external libisl;
function isl_ast_build_call_from_pw_multi_aff(build: Pisl_ast_build; pma: Pisl_pw_multi_aff): Pisl_ast_expr; cdecl; external libisl;
function isl_ast_build_call_from_multi_pw_aff(build: Pisl_ast_build; mpa: Pisl_multi_pw_aff): Pisl_ast_expr; cdecl; external libisl;
function isl_ast_build_node_from_schedule(build: Pisl_ast_build; schedule: Pisl_schedule): Pisl_ast_node; cdecl; external libisl;
function isl_ast_build_node_from_schedule_map(build: Pisl_ast_build; schedule: Pisl_union_map): Pisl_ast_node; cdecl; external libisl;
function isl_ast_build_ast_from_schedule(build: Pisl_ast_build; schedule: Pisl_union_map): Pisl_ast_node; cdecl; external libisl;

// === Konventiert am: 4-11-26 19:46:35 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
