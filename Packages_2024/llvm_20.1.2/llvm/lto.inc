{$IFDEF read_interface}


type
  Plto_bool_t = ^Tlto_bool_t;
  Tlto_bool_t = boolean;

const
  LTO_API_VERSION_ = 29;

type
  Plto_symbol_attributes = ^Tlto_symbol_attributes;
  Tlto_symbol_attributes = longint;
const
  LTO_SYMBOL_ALIGNMENT_MASK = $0000001F;
  LTO_SYMBOL_PERMISSIONS_MASK = $000000E0;
  LTO_SYMBOL_PERMISSIONS_CODE = $000000A0;
  LTO_SYMBOL_PERMISSIONS_DATA = $000000C0;
  LTO_SYMBOL_PERMISSIONS_RODATA = $00000080;
  LTO_SYMBOL_DEFINITION_MASK = $00000700;
  LTO_SYMBOL_DEFINITION_REGULAR = $00000100;
  LTO_SYMBOL_DEFINITION_TENTATIVE = $00000200;
  LTO_SYMBOL_DEFINITION_WEAK = $00000300;
  LTO_SYMBOL_DEFINITION_UNDEFINED = $00000400;
  LTO_SYMBOL_DEFINITION_WEAKUNDEF = $00000500;
  LTO_SYMBOL_SCOPE_MASK = $00003800;
  LTO_SYMBOL_SCOPE_INTERNAL = $00000800;
  LTO_SYMBOL_SCOPE_HIDDEN = $00001000;
  LTO_SYMBOL_SCOPE_PROTECTED = $00002000;
  LTO_SYMBOL_SCOPE_DEFAULT = $00001800;
  LTO_SYMBOL_SCOPE_DEFAULT_CAN_BE_HIDDEN = $00002800;
  LTO_SYMBOL_COMDAT = $00004000;
  LTO_SYMBOL_ALIAS = $00008000;

type
  Plto_debug_model = ^Tlto_debug_model;
  Tlto_debug_model = longint;
const
  LTO_DEBUG_MODEL_NONE = 0;
  LTO_DEBUG_MODEL_DWARF = 1;

type
  Plto_codegen_model = ^Tlto_codegen_model;
  Tlto_codegen_model = longint;
const
  LTO_CODEGEN_PIC_MODEL_STATIC = 0;
  LTO_CODEGEN_PIC_MODEL_DYNAMIC = 1;
  LTO_CODEGEN_PIC_MODEL_DYNAMIC_NO_PIC = 2;
  LTO_CODEGEN_PIC_MODEL_DEFAULT = 3;

type
  Plto_module_t = ^Tlto_module_t;
  Tlto_module_t = type Pointer;

  Plto_code_gen_t = ^Tlto_code_gen_t;
  Tlto_code_gen_t = type Pointer;

  Pthinlto_code_gen_t = ^Tthinlto_code_gen_t;
  Tthinlto_code_gen_t = type Pointer;

function lto_get_version: pchar; cdecl; external libllvm;
function lto_get_error_message: pchar; cdecl; external libllvm;
function lto_module_is_object_file(path: pchar): Tlto_bool_t; cdecl; external libllvm;
function lto_module_is_object_file_for_target(path: pchar; target_triple_prefix: pchar): Tlto_bool_t; cdecl; external libllvm;
function lto_module_has_objc_category(mem: pointer; length: Tsize_t): Tlto_bool_t; cdecl; external libllvm;
function lto_module_is_object_file_in_memory(mem: pointer; length: Tsize_t): Tlto_bool_t; cdecl; external libllvm;
function lto_module_is_object_file_in_memory_for_target(mem: pointer; length: Tsize_t; target_triple_prefix: pchar): Tlto_bool_t; cdecl; external libllvm;
function lto_module_create(path: pchar): Tlto_module_t; cdecl; external libllvm;
function lto_module_create_from_memory(mem: pointer; length: Tsize_t): Tlto_module_t; cdecl; external libllvm;
function lto_module_create_from_memory_with_path(mem: pointer; length: Tsize_t; path: pchar): Tlto_module_t; cdecl; external libllvm;
function lto_module_create_in_local_context(mem: pointer; length: Tsize_t; path: pchar): Tlto_module_t; cdecl; external libllvm;
function lto_module_create_in_codegen_context(mem: pointer; length: Tsize_t; path: pchar; cg: Tlto_code_gen_t): Tlto_module_t; cdecl; external libllvm;
function lto_module_create_from_fd(fd: longint; path: pchar; file_size: Tsize_t): Tlto_module_t; cdecl; external libllvm;
function lto_module_create_from_fd_at_offset(fd: longint; path: pchar; file_size: Tsize_t; map_size: Tsize_t; offset: Toff_t): Tlto_module_t; cdecl; external libllvm;
procedure lto_module_dispose(mod_: Tlto_module_t); cdecl; external libllvm;
function lto_module_get_target_triple(mod_: Tlto_module_t): pchar; cdecl; external libllvm;
procedure lto_module_set_target_triple(mod_: Tlto_module_t; triple: pchar); cdecl; external libllvm;
function lto_module_get_num_symbols(mod_: Tlto_module_t): dword; cdecl; external libllvm;
function lto_module_get_symbol_name(mod_: Tlto_module_t; index: dword): pchar; cdecl; external libllvm;
function lto_module_get_symbol_attribute(mod_: Tlto_module_t; index: dword): Tlto_symbol_attributes; cdecl; external libllvm;
function lto_module_get_linkeropts(mod_: Tlto_module_t): pchar; cdecl; external libllvm;
function lto_module_get_macho_cputype(mod_: Tlto_module_t; out_cputype: Pdword; out_cpusubtype: Pdword): Tlto_bool_t; cdecl; external libllvm;
function lto_module_has_ctor_dtor(mod_: Tlto_module_t): Tlto_bool_t; cdecl; external libllvm;

type
  Plto_codegen_diagnostic_severity_t = ^Tlto_codegen_diagnostic_severity_t;
  Tlto_codegen_diagnostic_severity_t = longint;
const
  LTO_DS_ERROR = 0;
  LTO_DS_WARNING = 1;
  LTO_DS_REMARK = 3;
  LTO_DS_NOTE = 2;

type
  Tlto_diagnostic_handler_t = procedure(severity: Tlto_codegen_diagnostic_severity_t; diag: pchar; ctxt: pointer); cdecl;

procedure lto_codegen_set_diagnostic_handler(para1: Tlto_code_gen_t; para2: Tlto_diagnostic_handler_t; para3: pointer); cdecl; external libllvm;
function lto_codegen_create: Tlto_code_gen_t; cdecl; external libllvm;
function lto_codegen_create_in_local_context: Tlto_code_gen_t; cdecl; external libllvm;
procedure lto_codegen_dispose(para1: Tlto_code_gen_t); cdecl; external libllvm;
function lto_codegen_add_module(cg: Tlto_code_gen_t; mod_: Tlto_module_t): Tlto_bool_t; cdecl; external libllvm;
procedure lto_codegen_set_module(cg: Tlto_code_gen_t; mod_: Tlto_module_t); cdecl; external libllvm;
function lto_codegen_set_debug_model(cg: Tlto_code_gen_t; para2: Tlto_debug_model): Tlto_bool_t; cdecl; external libllvm;
function lto_codegen_set_pic_model(cg: Tlto_code_gen_t; para2: Tlto_codegen_model): Tlto_bool_t; cdecl; external libllvm;
procedure lto_codegen_set_cpu(cg: Tlto_code_gen_t; cpu: pchar); cdecl; external libllvm;
procedure lto_codegen_set_assembler_path(cg: Tlto_code_gen_t; path: pchar); cdecl; external libllvm;
procedure lto_codegen_set_assembler_args(cg: Tlto_code_gen_t; args: PPchar; nargs: longint); cdecl; external libllvm;
procedure lto_codegen_add_must_preserve_symbol(cg: Tlto_code_gen_t; symbol: pchar); cdecl; external libllvm;
function lto_codegen_write_merged_modules(cg: Tlto_code_gen_t; path: pchar): Tlto_bool_t; cdecl; external libllvm;
function lto_codegen_compile(cg: Tlto_code_gen_t; length: Psize_t): pointer; cdecl; external libllvm;
function lto_codegen_compile_to_file(cg: Tlto_code_gen_t; name: PPchar): Tlto_bool_t; cdecl; external libllvm;
function lto_codegen_optimize(cg: Tlto_code_gen_t): Tlto_bool_t; cdecl; external libllvm;
function lto_codegen_compile_optimized(cg: Tlto_code_gen_t; length: Psize_t): pointer; cdecl; external libllvm;
function lto_api_version: dword; cdecl; external libllvm;
procedure lto_set_debug_options(options: PPchar; number: longint); cdecl; external libllvm;
procedure lto_codegen_debug_options(cg: Tlto_code_gen_t; para2: pchar); cdecl; external libllvm;
procedure lto_codegen_debug_options_array(cg: Tlto_code_gen_t; para2: PPchar; number: longint); cdecl; external libllvm;
procedure lto_initialize_disassembler; cdecl; external libllvm;
procedure lto_codegen_set_should_internalize(cg: Tlto_code_gen_t; ShouldInternalize: Tlto_bool_t); cdecl; external libllvm;
procedure lto_codegen_set_should_embed_uselists(cg: Tlto_code_gen_t; ShouldEmbedUselists: Tlto_bool_t); cdecl; external libllvm;

type
  Plto_input_t = ^Tlto_input_t;
  Tlto_input_t = type Pointer;

function lto_input_create(buffer: pointer; buffer_size: Tsize_t; path: pchar): Tlto_input_t; cdecl; external libllvm;
procedure lto_input_dispose(input: Tlto_input_t); cdecl; external libllvm;
function lto_input_get_num_dependent_libraries(input: Tlto_input_t): dword; cdecl; external libllvm;
function lto_input_get_dependent_library(input: Tlto_input_t; index: Tsize_t; size: Psize_t): pchar; cdecl; external libllvm;
function lto_runtime_lib_symbols_list(size: Psize_t): Ppchar; cdecl; external libllvm;

type
  PLTOObjectBuffer = ^TLTOObjectBuffer;
  TLTOObjectBuffer = record
    Buffer: pchar;
    Size: Tsize_t;
  end;

function thinlto_create_codegen: Tthinlto_code_gen_t; cdecl; external libllvm;
procedure thinlto_codegen_dispose(cg: Tthinlto_code_gen_t); cdecl; external libllvm;
procedure thinlto_codegen_add_module(cg: Tthinlto_code_gen_t; identifier: pchar; data: pchar; length: longint); cdecl; external libllvm;
procedure thinlto_codegen_process(cg: Tthinlto_code_gen_t); cdecl; external libllvm;
function thinlto_module_get_num_objects(cg: Tthinlto_code_gen_t): dword; cdecl; external libllvm;
function thinlto_module_get_object(cg: Tthinlto_code_gen_t; index: dword): TLTOObjectBuffer; cdecl; external libllvm;
function thinlto_module_get_num_object_files(cg: Tthinlto_code_gen_t): dword; cdecl; external libllvm;
function thinlto_module_get_object_file(cg: Tthinlto_code_gen_t; index: dword): pchar; cdecl; external libllvm;
function thinlto_codegen_set_pic_model(cg: Tthinlto_code_gen_t; para2: Tlto_codegen_model): Tlto_bool_t; cdecl; external libllvm;
procedure thinlto_codegen_set_savetemps_dir(cg: Tthinlto_code_gen_t; save_temps_dir: pchar); cdecl; external libllvm;
procedure thinlto_set_generated_objects_dir(cg: Tthinlto_code_gen_t; save_temps_dir: pchar); cdecl; external libllvm;
procedure thinlto_codegen_set_cpu(cg: Tthinlto_code_gen_t; cpu: pchar); cdecl; external libllvm;
procedure thinlto_codegen_disable_codegen(cg: Tthinlto_code_gen_t; disable: Tlto_bool_t); cdecl; external libllvm;
procedure thinlto_codegen_set_codegen_only(cg: Tthinlto_code_gen_t; codegen_only: Tlto_bool_t); cdecl; external libllvm;
procedure thinlto_debug_options(options: PPchar; number: longint); cdecl; external libllvm;
function lto_module_is_thinlto(mod_: Tlto_module_t): Tlto_bool_t; cdecl; external libllvm;
procedure thinlto_codegen_add_must_preserve_symbol(cg: Tthinlto_code_gen_t; name: pchar; length: longint); cdecl; external libllvm;
procedure thinlto_codegen_add_cross_referenced_symbol(cg: Tthinlto_code_gen_t; name: pchar; length: longint); cdecl; external libllvm;
procedure thinlto_codegen_set_cache_dir(cg: Tthinlto_code_gen_t; cache_dir: pchar); cdecl; external libllvm;
procedure thinlto_codegen_set_cache_pruning_interval(cg: Tthinlto_code_gen_t; interval: longint); cdecl; external libllvm;
procedure thinlto_codegen_set_final_cache_size_relative_to_available_space(cg: Tthinlto_code_gen_t; percentage: dword); cdecl; external libllvm;
procedure thinlto_codegen_set_cache_entry_expiration(cg: Tthinlto_code_gen_t; expiration: dword); cdecl; external libllvm;
procedure thinlto_codegen_set_cache_size_bytes(cg: Tthinlto_code_gen_t; max_size_bytes: dword); cdecl; external libllvm;
procedure thinlto_codegen_set_cache_size_megabytes(cg: Tthinlto_code_gen_t; max_size_megabytes: dword); cdecl; external libllvm;
procedure thinlto_codegen_set_cache_size_files(cg: Tthinlto_code_gen_t; max_size_files: dword); cdecl; external libllvm;

// === Konventiert am: 20-9-26 17:11:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
