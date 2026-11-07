{$IFDEF read_interface}


type
  Tisl_access_level_before = function(first: pointer; second: pointer): longint; cdecl;
  Pisl_restriction = type Pointer;

function isl_restriction_free(restr: Pisl_restriction): Pisl_restriction; cdecl; external libisl;
function isl_restriction_empty(source_map: Pisl_map): Pisl_restriction; cdecl; external libisl;
function isl_restriction_none(source_map: Pisl_map): Pisl_restriction; cdecl; external libisl;
function isl_restriction_input(source_restr: Pisl_set; sink_restr: Pisl_set): Pisl_restriction; cdecl; external libisl;
function isl_restriction_output(source_restr: Pisl_set): Pisl_restriction; cdecl; external libisl;
function isl_restriction_get_ctx(restr: Pisl_restriction): Pisl_ctx; cdecl; external libisl;

type
  Tisl_access_restrict = function(source_map: Pisl_map; sink: Pisl_set; source_user: pointer; user: pointer): Pisl_restriction; cdecl;
  Pisl_access_info = type Pointer;
  Pisl_flow = type Pointer;

  TAccess_func = function(dep: Pisl_map; must: longint; dep_user: pointer; user: pointer): Tisl_stat; cdecl;

function isl_access_info_alloc(sink: Pisl_map; sink_user: pointer; fn: Tisl_access_level_before; max_source: longint): Pisl_access_info; cdecl; external libisl;
function isl_access_info_set_restrict(acc: Pisl_access_info; fn: Tisl_access_restrict; user: pointer): Pisl_access_info; cdecl; external libisl;
function isl_access_info_add_source(acc: Pisl_access_info; source: Pisl_map; must: longint; source_user: pointer): Pisl_access_info; cdecl; external libisl;
function isl_access_info_free(acc: Pisl_access_info): Pisl_access_info; cdecl; external libisl;
function isl_access_info_get_ctx(acc: Pisl_access_info): Pisl_ctx; cdecl; external libisl;
function isl_access_info_compute_flow(acc: Pisl_access_info): Pisl_flow; cdecl; external libisl;
function isl_flow_foreach(deps: Pisl_flow; fn: TAccess_func; user: pointer): Tisl_stat; cdecl; external libisl;
function isl_flow_get_no_source(deps: Pisl_flow; must: longint): Pisl_map; cdecl; external libisl;
function isl_flow_free(deps: Pisl_flow): Pisl_flow; cdecl; external libisl;
function isl_flow_get_ctx(deps: Pisl_flow): Pisl_ctx; cdecl; external libisl;

type
  Pisl_union_access_info = type Pointer;
  Pisl_union_flow = type Pointer;

function isl_union_access_info_from_sink(sink: Pisl_union_map): Pisl_union_access_info; cdecl; external libisl;
function isl_union_access_info_set_must_source(access: Pisl_union_access_info; must_source: Pisl_union_map): Pisl_union_access_info; cdecl; external libisl;
function isl_union_access_info_set_may_source(access: Pisl_union_access_info; may_source: Pisl_union_map): Pisl_union_access_info; cdecl; external libisl;
function isl_union_access_info_set_kill(access: Pisl_union_access_info; kill: Pisl_union_map): Pisl_union_access_info; cdecl; external libisl;
function isl_union_access_info_set_schedule(access: Pisl_union_access_info; schedule: Pisl_schedule): Pisl_union_access_info; cdecl; external libisl;
function isl_union_access_info_set_schedule_map(access: Pisl_union_access_info; schedule_map: Pisl_union_map): Pisl_union_access_info; cdecl; external libisl;
function isl_union_access_info_copy(access: Pisl_union_access_info): Pisl_union_access_info; cdecl; external libisl;
function isl_union_access_info_free(access: Pisl_union_access_info): Pisl_union_access_info; cdecl; external libisl;
function isl_union_access_info_get_ctx(access: Pisl_union_access_info): Pisl_ctx; cdecl; external libisl;
function isl_union_access_info_read_from_file(ctx: Pisl_ctx; input: PFILE): Pisl_union_access_info; cdecl; external libisl;
function isl_printer_print_union_access_info(p: Pisl_printer; access: Pisl_union_access_info): Pisl_printer; cdecl; external libisl;
function isl_union_access_info_to_str(access: Pisl_union_access_info): Pchar; cdecl; external libisl;
function isl_union_access_info_compute_flow(access: Pisl_union_access_info): Pisl_union_flow; cdecl; external libisl;
function isl_union_flow_get_ctx(flow: Pisl_union_flow): Pisl_ctx; cdecl; external libisl;
function isl_union_flow_copy(flow: Pisl_union_flow): Pisl_union_flow; cdecl; external libisl;
function isl_union_flow_get_must_dependence(flow: Pisl_union_flow): Pisl_union_map; cdecl; external libisl;
function isl_union_flow_get_may_dependence(flow: Pisl_union_flow): Pisl_union_map; cdecl; external libisl;
function isl_union_flow_get_full_must_dependence(flow: Pisl_union_flow): Pisl_union_map; cdecl; external libisl;
function isl_union_flow_get_full_may_dependence(flow: Pisl_union_flow): Pisl_union_map; cdecl; external libisl;
function isl_union_flow_get_must_no_source(flow: Pisl_union_flow): Pisl_union_map; cdecl; external libisl;
function isl_union_flow_get_may_no_source(flow: Pisl_union_flow): Pisl_union_map; cdecl; external libisl;
function isl_union_flow_free(flow: Pisl_union_flow): Pisl_union_flow; cdecl; external libisl;
function isl_printer_print_union_flow(p: Pisl_printer; flow: Pisl_union_flow): Pisl_printer; cdecl; external libisl;
function isl_union_flow_to_str(flow: Pisl_union_flow): Pchar; cdecl; external libisl;
function isl_union_map_compute_flow(sink: Pisl_union_map; must_source: Pisl_union_map; may_source: Pisl_union_map; schedule: Pisl_union_map; must_dep: PPisl_union_map;
  may_dep: PPisl_union_map; must_no_source: PPisl_union_map; may_no_source: PPisl_union_map): longint; cdecl; external libisl;

// === Konventiert am: 4-11-26 20:16:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
