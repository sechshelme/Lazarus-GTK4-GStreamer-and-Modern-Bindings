unit fp_gccjit;

interface

uses
  fp_gcc_common;

const
  {$IFDEF Linux}
  libgccjit = 'gccjit';
  {$ENDIF}

  {$IFDEF Windows}
  libgccjit = 'gccjit-1.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Pgcc_jit_context = type Pointer;
  PPgcc_jit_context = ^Pgcc_jit_context;
  Pgcc_jit_result = type Pointer;
  PPgcc_jit_result = ^Pgcc_jit_result;
  Pgcc_jit_object = type Pointer;
  PPgcc_jit_object = ^Pgcc_jit_object;
  Pgcc_jit_location = type Pointer;
  PPgcc_jit_location = ^Pgcc_jit_location;
  Pgcc_jit_type = type Pointer;
  PPgcc_jit_type = ^Pgcc_jit_type;
  Pgcc_jit_field = type Pointer;
  PPgcc_jit_field = ^Pgcc_jit_field;
  Pgcc_jit_struct = type Pointer;
  PPgcc_jit_struct = ^Pgcc_jit_struct;
  Pgcc_jit_function_type = type Pointer;
  PPgcc_jit_function_type = ^Pgcc_jit_function_type;
  Pgcc_jit_vector_type = type Pointer;
  PPgcc_jit_vector_type = ^Pgcc_jit_vector_type;
  Pgcc_jit_function = type Pointer;
  PPgcc_jit_function = ^Pgcc_jit_function;
  Pgcc_jit_block = type Pointer;
  PPgcc_jit_block = ^Pgcc_jit_block;
  Pgcc_jit_rvalue = type Pointer;
  PPgcc_jit_rvalue = ^Pgcc_jit_rvalue;
  Pgcc_jit_lvalue = type Pointer;
  PPgcc_jit_lvalue = ^Pgcc_jit_lvalue;
  Pgcc_jit_param = type Pointer;
  PPgcc_jit_param = ^Pgcc_jit_param;
  Pgcc_jit_case = type Pointer;
  PPgcc_jit_case = ^Pgcc_jit_case;
  Pgcc_jit_extended_asm = type Pointer;
  PPgcc_jit_extended_asm = ^Pgcc_jit_extended_asm;

function gcc_jit_context_acquire: Pgcc_jit_context; cdecl; external libgccjit;
procedure gcc_jit_context_release(ctxt: Pgcc_jit_context); cdecl; external libgccjit;

type
  Tgcc_jit_str_option = longint;

const
  GCC_JIT_STR_OPTION_PROGNAME = 0;
  GCC_JIT_NUM_STR_OPTIONS = 1;

type
  Tgcc_jit_int_option = longint;

const
  GCC_JIT_INT_OPTION_OPTIMIZATION_LEVEL = 0;
  GCC_JIT_NUM_INT_OPTIONS = 1;

type
  Tgcc_jit_bool_option = longint;

const
  GCC_JIT_BOOL_OPTION_DEBUGINFO = 0;
  GCC_JIT_BOOL_OPTION_DUMP_INITIAL_TREE = 1;
  GCC_JIT_BOOL_OPTION_DUMP_INITIAL_GIMPLE = 2;
  GCC_JIT_BOOL_OPTION_DUMP_GENERATED_CODE = 3;
  GCC_JIT_BOOL_OPTION_DUMP_SUMMARY = 4;
  GCC_JIT_BOOL_OPTION_DUMP_EVERYTHING = 5;
  GCC_JIT_BOOL_OPTION_SELFCHECK_GC = 6;
  GCC_JIT_BOOL_OPTION_KEEP_INTERMEDIATES = 7;
  GCC_JIT_NUM_BOOL_OPTIONS = 8;

procedure gcc_jit_context_set_str_option(ctxt: Pgcc_jit_context; opt: Tgcc_jit_str_option; value: pchar); cdecl; external libgccjit;
procedure gcc_jit_context_set_int_option(ctxt: Pgcc_jit_context; opt: Tgcc_jit_int_option; value: longint); cdecl; external libgccjit;
procedure gcc_jit_context_set_bool_option(ctxt: Pgcc_jit_context; opt: Tgcc_jit_bool_option; value: longint); cdecl; external libgccjit;
procedure gcc_jit_context_set_bool_allow_unreachable_blocks(ctxt: Pgcc_jit_context; bool_value: longint); cdecl; external libgccjit;
procedure gcc_jit_context_set_bool_print_errors_to_stderr(ctxt: Pgcc_jit_context; enabled: longint); cdecl; external libgccjit;
procedure gcc_jit_context_set_bool_use_external_driver(ctxt: Pgcc_jit_context; bool_value: longint); cdecl; external libgccjit;
procedure gcc_jit_context_add_command_line_option(ctxt: Pgcc_jit_context; optname: pchar); cdecl; external libgccjit;
procedure gcc_jit_context_add_driver_option(ctxt: Pgcc_jit_context; optname: pchar); cdecl; external libgccjit;
function gcc_jit_context_compile(ctxt: Pgcc_jit_context): Pgcc_jit_result; cdecl; external libgccjit;

type
  Tgcc_jit_output_kind = longint;

const
  GCC_JIT_OUTPUT_KIND_ASSEMBLER = 0;
  GCC_JIT_OUTPUT_KIND_OBJECT_FILE = 1;
  GCC_JIT_OUTPUT_KIND_DYNAMIC_LIBRARY = 2;
  GCC_JIT_OUTPUT_KIND_EXECUTABLE = 3;

procedure gcc_jit_context_compile_to_file(ctxt: Pgcc_jit_context; output_kind: Tgcc_jit_output_kind; output_path: pchar); cdecl; external libgccjit;
procedure gcc_jit_context_dump_to_file(ctxt: Pgcc_jit_context; path: pchar; update_locations: longint); cdecl; external libgccjit;
procedure gcc_jit_context_set_logfile(ctxt: Pgcc_jit_context; logfile: PFILE; flags: longint; verbosity: longint); cdecl; external libgccjit;
function gcc_jit_context_get_first_error(ctxt: Pgcc_jit_context): pchar; cdecl; external libgccjit;
function gcc_jit_context_get_last_error(ctxt: Pgcc_jit_context): pchar; cdecl; external libgccjit;
function gcc_jit_result_get_code(result: Pgcc_jit_result; funcname: pchar): pointer; cdecl; external libgccjit;
function gcc_jit_result_get_global(result: Pgcc_jit_result; name: pchar): pointer; cdecl; external libgccjit;
procedure gcc_jit_result_release(result: Pgcc_jit_result); cdecl; external libgccjit;

function gcc_jit_object_get_context(obj: Pgcc_jit_object): Pgcc_jit_context; cdecl; external libgccjit;
function gcc_jit_object_get_debug_string(obj: Pgcc_jit_object): pchar; cdecl; external libgccjit;

function gcc_jit_context_new_location(ctxt: Pgcc_jit_context; filename: pchar; line: longint; column: longint): Pgcc_jit_location; cdecl; external libgccjit;
function gcc_jit_location_as_object(loc: Pgcc_jit_location): Pgcc_jit_object; cdecl; external libgccjit;

function gcc_jit_type_as_object(_type: Pgcc_jit_type): Pgcc_jit_object; cdecl; external libgccjit;

type
  Tgcc_jit_types = longint;

const
  GCC_JIT_TYPE_VOID = 0;
  GCC_JIT_TYPE_VOID_PTR = 1;
  GCC_JIT_TYPE_BOOL = 2;
  GCC_JIT_TYPE_CHAR = 3;
  GCC_JIT_TYPE_SIGNED_CHAR = 4;
  GCC_JIT_TYPE_UNSIGNED_CHAR = 5;
  GCC_JIT_TYPE_SHORT = 6;
  GCC_JIT_TYPE_UNSIGNED_SHORT = 7;
  GCC_JIT_TYPE_INT = 8;
  GCC_JIT_TYPE_UNSIGNED_INT = 9;
  GCC_JIT_TYPE_LONG = 10;
  GCC_JIT_TYPE_UNSIGNED_LONG = 11;
  GCC_JIT_TYPE_LONG_LONG = 12;
  GCC_JIT_TYPE_UNSIGNED_LONG_LONG = 13;
  GCC_JIT_TYPE_FLOAT = 14;
  GCC_JIT_TYPE_DOUBLE = 15;
  GCC_JIT_TYPE_LONG_DOUBLE = 16;
  GCC_JIT_TYPE_CONST_CHAR_PTR = 17;
  GCC_JIT_TYPE_SIZE_T = 18;
  GCC_JIT_TYPE_FILE_PTR = 19;
  GCC_JIT_TYPE_COMPLEX_FLOAT = 20;
  GCC_JIT_TYPE_COMPLEX_DOUBLE = 21;
  GCC_JIT_TYPE_COMPLEX_LONG_DOUBLE = 22;
  GCC_JIT_TYPE_UINT8_T = 23;
  GCC_JIT_TYPE_UINT16_T = 24;
  GCC_JIT_TYPE_UINT32_T = 25;
  GCC_JIT_TYPE_UINT64_T = 26;
  GCC_JIT_TYPE_UINT128_T = 27;
  GCC_JIT_TYPE_INT8_T = 28;
  GCC_JIT_TYPE_INT16_T = 29;
  GCC_JIT_TYPE_INT32_T = 30;
  GCC_JIT_TYPE_INT64_T = 31;
  GCC_JIT_TYPE_INT128_T = 32;

function gcc_jit_context_get_type(ctxt: Pgcc_jit_context; type_: Tgcc_jit_types): Pgcc_jit_type; cdecl; external libgccjit;
function gcc_jit_context_get_int_type(ctxt: Pgcc_jit_context; num_bytes: longint; is_signed: longint): Pgcc_jit_type; cdecl; external libgccjit;
function gcc_jit_type_get_pointer(_type: Pgcc_jit_type): Pgcc_jit_type; cdecl; external libgccjit;
function gcc_jit_type_get_const(_type: Pgcc_jit_type): Pgcc_jit_type; cdecl; external libgccjit;
function gcc_jit_type_get_volatile(_type: Pgcc_jit_type): Pgcc_jit_type; cdecl; external libgccjit;
function gcc_jit_type_get_restrict(_type: Pgcc_jit_type): Pgcc_jit_type; cdecl; external libgccjit;
function gcc_jit_compatible_types(ltype: Pgcc_jit_type; rtype: Pgcc_jit_type): longint; cdecl; external libgccjit;
function gcc_jit_type_get_size(_type: Pgcc_jit_type): Tssize_t; cdecl; external libgccjit;
function gcc_jit_context_new_array_type(ctxt: Pgcc_jit_context; loc: Pgcc_jit_location; element_type: Pgcc_jit_type; num_elements: longint): Pgcc_jit_type; cdecl; external libgccjit;
function gcc_jit_context_new_field(ctxt: Pgcc_jit_context; loc: Pgcc_jit_location; _type: Pgcc_jit_type; name: pchar): Pgcc_jit_field; cdecl; external libgccjit;
function gcc_jit_context_new_bitfield(ctxt: Pgcc_jit_context; loc: Pgcc_jit_location; _type: Pgcc_jit_type; width: longint; name: pchar): Pgcc_jit_field; cdecl; external libgccjit;
function gcc_jit_field_as_object(field: Pgcc_jit_field): Pgcc_jit_object; cdecl; external libgccjit;
function gcc_jit_context_new_struct_type(ctxt: Pgcc_jit_context; loc: Pgcc_jit_location; name: pchar; num_fields: longint; fields: PPgcc_jit_field): Pgcc_jit_struct; cdecl; external libgccjit;
function gcc_jit_context_new_opaque_struct(ctxt: Pgcc_jit_context; loc: Pgcc_jit_location; name: pchar): Pgcc_jit_struct; cdecl; external libgccjit;
function gcc_jit_struct_as_type(struct_type: Pgcc_jit_struct): Pgcc_jit_type; cdecl; external libgccjit;
procedure gcc_jit_struct_set_fields(struct_type: Pgcc_jit_struct; loc: Pgcc_jit_location; num_fields: longint; fields: PPgcc_jit_field); cdecl; external libgccjit;
function gcc_jit_struct_get_field(struct_type: Pgcc_jit_struct; index: Tsize_t): Pgcc_jit_field; cdecl; external libgccjit;
function gcc_jit_struct_get_field_count(struct_type: Pgcc_jit_struct): Tsize_t; cdecl; external libgccjit;
function gcc_jit_context_new_union_type(ctxt: Pgcc_jit_context; loc: Pgcc_jit_location; name: pchar; num_fields: longint; fields: PPgcc_jit_field): Pgcc_jit_type; cdecl; external libgccjit;
function gcc_jit_context_new_function_ptr_type(ctxt: Pgcc_jit_context; loc: Pgcc_jit_location; return_type: Pgcc_jit_type; num_params: longint; param_types: PPgcc_jit_type;
  is_variadic: longint): Pgcc_jit_type; cdecl; external libgccjit;

function gcc_jit_context_new_param(ctxt: Pgcc_jit_context; loc: Pgcc_jit_location; _type: Pgcc_jit_type; name: pchar): Pgcc_jit_param; cdecl; external libgccjit;
function gcc_jit_param_as_object(param: Pgcc_jit_param): Pgcc_jit_object; cdecl; external libgccjit;
function gcc_jit_param_as_lvalue(param: Pgcc_jit_param): Pgcc_jit_lvalue; cdecl; external libgccjit;
function gcc_jit_param_as_rvalue(param: Pgcc_jit_param): Pgcc_jit_rvalue; cdecl; external libgccjit;

type
  Tgcc_jit_function_kind = longint;

const
  GCC_JIT_FUNCTION_EXPORTED = 0;
  GCC_JIT_FUNCTION_INTERNAL = 1;
  GCC_JIT_FUNCTION_IMPORTED = 2;
  GCC_JIT_FUNCTION_ALWAYS_INLINE = 3;

type
  Tgcc_jit_tls_model = longint;

const
  GCC_JIT_TLS_MODEL_NONE = 0;
  GCC_JIT_TLS_MODEL_GLOBAL_DYNAMIC = 1;
  GCC_JIT_TLS_MODEL_LOCAL_DYNAMIC = 2;
  GCC_JIT_TLS_MODEL_INITIAL_EXEC = 3;
  GCC_JIT_TLS_MODEL_LOCAL_EXEC = 4;

function gcc_jit_context_new_function(ctxt: Pgcc_jit_context; loc: Pgcc_jit_location; kind: Tgcc_jit_function_kind; return_type: Pgcc_jit_type; name: pchar;
  num_params: longint; params: PPgcc_jit_param; is_variadic: longint): Pgcc_jit_function; cdecl; external libgccjit;
function gcc_jit_context_get_builtin_function(ctxt: Pgcc_jit_context; name: pchar): Pgcc_jit_function; cdecl; external libgccjit;
function gcc_jit_function_as_object(func: Pgcc_jit_function): Pgcc_jit_object; cdecl; external libgccjit;
function gcc_jit_function_get_param(func: Pgcc_jit_function; index: longint): Pgcc_jit_param; cdecl; external libgccjit;
procedure gcc_jit_function_dump_to_dot(func: Pgcc_jit_function; path: pchar); cdecl; external libgccjit;
function gcc_jit_function_new_block(func: Pgcc_jit_function; name: pchar): Pgcc_jit_block; cdecl; external libgccjit;
function gcc_jit_block_as_object(block: Pgcc_jit_block): Pgcc_jit_object; cdecl; external libgccjit;
function gcc_jit_block_get_function(block: Pgcc_jit_block): Pgcc_jit_function; cdecl; external libgccjit;

type
  Tgcc_jit_global_kind = longint;

const
  GCC_JIT_GLOBAL_EXPORTED = 0;
  GCC_JIT_GLOBAL_INTERNAL = 1;
  GCC_JIT_GLOBAL_IMPORTED = 2;

function gcc_jit_context_new_global(ctxt: Pgcc_jit_context; loc: Pgcc_jit_location; kind: Tgcc_jit_global_kind; _type: Pgcc_jit_type; name: pchar): Pgcc_jit_lvalue; cdecl; external libgccjit;
function gcc_jit_context_new_struct_constructor(ctxt: Pgcc_jit_context; loc: Pgcc_jit_location; _type: Pgcc_jit_type; num_values: Tsize_t; fields: PPgcc_jit_field;
  values: PPgcc_jit_rvalue): Pgcc_jit_rvalue; cdecl; external libgccjit;
function gcc_jit_context_new_union_constructor(ctxt: Pgcc_jit_context; loc: Pgcc_jit_location; _type: Pgcc_jit_type; field: Pgcc_jit_field; value: Pgcc_jit_rvalue): Pgcc_jit_rvalue; cdecl; external libgccjit;
function gcc_jit_context_new_array_constructor(ctxt: Pgcc_jit_context; loc: Pgcc_jit_location; _type: Pgcc_jit_type; num_values: Tsize_t; values: PPgcc_jit_rvalue): Pgcc_jit_rvalue; cdecl; external libgccjit;
function gcc_jit_global_set_initializer_rvalue(global: Pgcc_jit_lvalue; init_value: Pgcc_jit_rvalue): Pgcc_jit_lvalue; cdecl; external libgccjit;
function gcc_jit_global_set_initializer(global: Pgcc_jit_lvalue; blob: pointer; num_bytes: Tsize_t): Pgcc_jit_lvalue; cdecl; external libgccjit;

function gcc_jit_lvalue_as_object(lvalue: Pgcc_jit_lvalue): Pgcc_jit_object; cdecl; external libgccjit;
function gcc_jit_lvalue_as_rvalue(lvalue: Pgcc_jit_lvalue): Pgcc_jit_rvalue; cdecl; external libgccjit;
function gcc_jit_rvalue_as_object(rvalue: Pgcc_jit_rvalue): Pgcc_jit_object; cdecl; external libgccjit;
function gcc_jit_rvalue_get_type(rvalue: Pgcc_jit_rvalue): Pgcc_jit_type; cdecl; external libgccjit;

function gcc_jit_context_new_rvalue_from_int(ctxt: Pgcc_jit_context; numeric_type: Pgcc_jit_type; value: longint): Pgcc_jit_rvalue; cdecl; external libgccjit;
function gcc_jit_context_new_rvalue_from_long(ctxt: Pgcc_jit_context; numeric_type: Pgcc_jit_type; value: longint): Pgcc_jit_rvalue; cdecl; external libgccjit;
function gcc_jit_context_zero(ctxt: Pgcc_jit_context; numeric_type: Pgcc_jit_type): Pgcc_jit_rvalue; cdecl; external libgccjit;
function gcc_jit_context_one(ctxt: Pgcc_jit_context; numeric_type: Pgcc_jit_type): Pgcc_jit_rvalue; cdecl; external libgccjit;

function gcc_jit_context_new_rvalue_from_double(ctxt: Pgcc_jit_context; numeric_type: Pgcc_jit_type; value: double): Pgcc_jit_rvalue; cdecl; external libgccjit;

function gcc_jit_context_new_rvalue_from_ptr(ctxt: Pgcc_jit_context; pointer_type: Pgcc_jit_type; value: pointer): Pgcc_jit_rvalue; cdecl; external libgccjit;
function gcc_jit_context_null(ctxt: Pgcc_jit_context; pointer_type: Pgcc_jit_type): Pgcc_jit_rvalue; cdecl; external libgccjit;
function gcc_jit_context_new_sizeof(ctxt: Pgcc_jit_context; _type: Pgcc_jit_type): Pgcc_jit_rvalue; cdecl; external libgccjit;
function gcc_jit_context_new_string_literal(ctxt: Pgcc_jit_context; value: pchar): Pgcc_jit_rvalue; cdecl; external libgccjit;

type
  Tgcc_jit_unary_op = longint;

const
  GCC_JIT_UNARY_OP_MINUS = 0;
  GCC_JIT_UNARY_OP_BITWISE_NEGATE = 1;
  GCC_JIT_UNARY_OP_LOGICAL_NEGATE = 2;
  GCC_JIT_UNARY_OP_ABS = 3;

function gcc_jit_context_new_unary_op(ctxt: Pgcc_jit_context; loc: Pgcc_jit_location; op: Tgcc_jit_unary_op; result_type: Pgcc_jit_type; rvalue: Pgcc_jit_rvalue): Pgcc_jit_rvalue; cdecl; external libgccjit;

type
  Tgcc_jit_binary_op = longint;

const
  GCC_JIT_BINARY_OP_PLUS = 0;
  GCC_JIT_BINARY_OP_MINUS = 1;
  GCC_JIT_BINARY_OP_MULT = 2;
  GCC_JIT_BINARY_OP_DIVIDE = 3;
  GCC_JIT_BINARY_OP_MODULO = 4;
  GCC_JIT_BINARY_OP_BITWISE_AND = 5;
  GCC_JIT_BINARY_OP_BITWISE_XOR = 6;
  GCC_JIT_BINARY_OP_BITWISE_OR = 7;
  GCC_JIT_BINARY_OP_LOGICAL_AND = 8;
  GCC_JIT_BINARY_OP_LOGICAL_OR = 9;
  GCC_JIT_BINARY_OP_LSHIFT = 10;
  GCC_JIT_BINARY_OP_RSHIFT = 11;

function gcc_jit_context_new_binary_op(ctxt: Pgcc_jit_context; loc: Pgcc_jit_location; op: Tgcc_jit_binary_op; result_type: Pgcc_jit_type; a: Pgcc_jit_rvalue;
  b: Pgcc_jit_rvalue): Pgcc_jit_rvalue; cdecl; external libgccjit;

type
  Tgcc_jit_comparison = longint;

const
  GCC_JIT_COMPARISON_EQ = 0;
  GCC_JIT_COMPARISON_NE = 1;
  GCC_JIT_COMPARISON_LT = 2;
  GCC_JIT_COMPARISON_LE = 3;
  GCC_JIT_COMPARISON_GT = 4;
  GCC_JIT_COMPARISON_GE = 5;

function gcc_jit_context_new_comparison(ctxt: Pgcc_jit_context; loc: Pgcc_jit_location; op: Tgcc_jit_comparison; a: Pgcc_jit_rvalue; b: Pgcc_jit_rvalue): Pgcc_jit_rvalue; cdecl; external libgccjit;
function gcc_jit_context_new_call(ctxt: Pgcc_jit_context; loc: Pgcc_jit_location; func: Pgcc_jit_function; numargs: longint; args: PPgcc_jit_rvalue): Pgcc_jit_rvalue; cdecl; external libgccjit;
function gcc_jit_context_new_call_through_ptr(ctxt: Pgcc_jit_context; loc: Pgcc_jit_location; fn_ptr: Pgcc_jit_rvalue; numargs: longint; args: PPgcc_jit_rvalue): Pgcc_jit_rvalue; cdecl; external libgccjit;
function gcc_jit_context_new_cast(ctxt: Pgcc_jit_context; loc: Pgcc_jit_location; rvalue: Pgcc_jit_rvalue; _type: Pgcc_jit_type): Pgcc_jit_rvalue; cdecl; external libgccjit;
function gcc_jit_context_new_bitcast(ctxt: Pgcc_jit_context; loc: Pgcc_jit_location; rvalue: Pgcc_jit_rvalue; _type: Pgcc_jit_type): Pgcc_jit_rvalue; cdecl; external libgccjit;
procedure gcc_jit_lvalue_set_alignment(lvalue: Pgcc_jit_lvalue; bytes: dword); cdecl; external libgccjit;
function gcc_jit_lvalue_get_alignment(lvalue: Pgcc_jit_lvalue): dword; cdecl; external libgccjit;
function gcc_jit_context_new_array_access(ctxt: Pgcc_jit_context; loc: Pgcc_jit_location; ptr: Pgcc_jit_rvalue; index: Pgcc_jit_rvalue): Pgcc_jit_lvalue; cdecl; external libgccjit;
function gcc_jit_lvalue_access_field(struct_or_union: Pgcc_jit_lvalue; loc: Pgcc_jit_location; field: Pgcc_jit_field): Pgcc_jit_lvalue; cdecl; external libgccjit;
function gcc_jit_rvalue_access_field(struct_or_union: Pgcc_jit_rvalue; loc: Pgcc_jit_location; field: Pgcc_jit_field): Pgcc_jit_rvalue; cdecl; external libgccjit;
function gcc_jit_rvalue_dereference_field(ptr: Pgcc_jit_rvalue; loc: Pgcc_jit_location; field: Pgcc_jit_field): Pgcc_jit_lvalue; cdecl; external libgccjit;
function gcc_jit_rvalue_dereference(rvalue: Pgcc_jit_rvalue; loc: Pgcc_jit_location): Pgcc_jit_lvalue; cdecl; external libgccjit;
function gcc_jit_lvalue_get_address(lvalue: Pgcc_jit_lvalue; loc: Pgcc_jit_location): Pgcc_jit_rvalue; cdecl; external libgccjit;
procedure gcc_jit_lvalue_set_tls_model(lvalue: Pgcc_jit_lvalue; model: Tgcc_jit_tls_model); cdecl; external libgccjit;
procedure gcc_jit_lvalue_set_link_section(lvalue: Pgcc_jit_lvalue; section_name: pchar); cdecl; external libgccjit;
procedure gcc_jit_lvalue_set_register_name(lvalue: Pgcc_jit_lvalue; reg_name: pchar); cdecl; external libgccjit;
function gcc_jit_function_new_local(func: Pgcc_jit_function; loc: Pgcc_jit_location; _type: Pgcc_jit_type; name: pchar): Pgcc_jit_lvalue; cdecl; external libgccjit;

procedure gcc_jit_block_add_eval(block: Pgcc_jit_block; loc: Pgcc_jit_location; rvalue: Pgcc_jit_rvalue); cdecl; external libgccjit;
procedure gcc_jit_block_add_assignment(block: Pgcc_jit_block; loc: Pgcc_jit_location; lvalue: Pgcc_jit_lvalue; rvalue: Pgcc_jit_rvalue); cdecl; external libgccjit;
procedure gcc_jit_block_add_assignment_op(block: Pgcc_jit_block; loc: Pgcc_jit_location; lvalue: Pgcc_jit_lvalue; op: Tgcc_jit_binary_op; rvalue: Pgcc_jit_rvalue); cdecl; external libgccjit;
procedure gcc_jit_block_add_comment(block: Pgcc_jit_block; loc: Pgcc_jit_location; text: pchar); cdecl; external libgccjit;
procedure gcc_jit_block_end_with_conditional(block: Pgcc_jit_block; loc: Pgcc_jit_location; boolval: Pgcc_jit_rvalue; on_true: Pgcc_jit_block; on_false: Pgcc_jit_block); cdecl; external libgccjit;
procedure gcc_jit_block_end_with_jump(block: Pgcc_jit_block; loc: Pgcc_jit_location; target: Pgcc_jit_block); cdecl; external libgccjit;
procedure gcc_jit_block_end_with_return(block: Pgcc_jit_block; loc: Pgcc_jit_location; rvalue: Pgcc_jit_rvalue); cdecl; external libgccjit;
procedure gcc_jit_block_end_with_void_return(block: Pgcc_jit_block; loc: Pgcc_jit_location); cdecl; external libgccjit;
function gcc_jit_context_new_case(ctxt: Pgcc_jit_context; min_value: Pgcc_jit_rvalue; max_value: Pgcc_jit_rvalue; dest_block: Pgcc_jit_block): Pgcc_jit_case; cdecl; external libgccjit;
function gcc_jit_case_as_object(case_: Pgcc_jit_case): Pgcc_jit_object; cdecl; external libgccjit;
procedure gcc_jit_block_end_with_switch(block: Pgcc_jit_block; loc: Pgcc_jit_location; expr: Pgcc_jit_rvalue; default_block: Pgcc_jit_block; num_cases: longint;
  cases: PPgcc_jit_case); cdecl; external libgccjit;

function gcc_jit_context_new_child_context(parent_ctxt: Pgcc_jit_context): Pgcc_jit_context; cdecl; external libgccjit;

procedure gcc_jit_context_dump_reproducer_to_file(ctxt: Pgcc_jit_context; path: pchar); cdecl; external libgccjit;
procedure gcc_jit_context_enable_dump(ctxt: Pgcc_jit_context; dumpname: pchar; out_ptr: PPchar); cdecl; external libgccjit;

type
  Pgcc_jit_timer = type Pointer;

function gcc_jit_timer_new: Pgcc_jit_timer; cdecl; external libgccjit;
procedure gcc_jit_timer_release(timer: Pgcc_jit_timer); cdecl; external libgccjit;
procedure gcc_jit_context_set_timer(ctxt: Pgcc_jit_context; timer: Pgcc_jit_timer); cdecl; external libgccjit;
function gcc_jit_context_get_timer(ctxt: Pgcc_jit_context): Pgcc_jit_timer; cdecl; external libgccjit;
procedure gcc_jit_timer_push(timer: Pgcc_jit_timer; item_name: pchar); cdecl; external libgccjit;
procedure gcc_jit_timer_pop(timer: Pgcc_jit_timer; item_name: pchar); cdecl; external libgccjit;
procedure gcc_jit_timer_print(timer: Pgcc_jit_timer; f_out: PFILE); cdecl; external libgccjit;
procedure gcc_jit_rvalue_set_bool_require_tail_call(call: Pgcc_jit_rvalue; require_tail_call: longint); cdecl; external libgccjit;
function gcc_jit_type_get_aligned(_type: Pgcc_jit_type; alignment_in_bytes: Tsize_t): Pgcc_jit_type; cdecl; external libgccjit;
function gcc_jit_type_get_vector(_type: Pgcc_jit_type; num_units: Tsize_t): Pgcc_jit_type; cdecl; external libgccjit;
function gcc_jit_function_get_address(fn: Pgcc_jit_function; loc: Pgcc_jit_location): Pgcc_jit_rvalue; cdecl; external libgccjit;
function gcc_jit_context_new_rvalue_from_vector(ctxt: Pgcc_jit_context; loc: Pgcc_jit_location; vec_type: Pgcc_jit_type; num_elements: Tsize_t; elements: PPgcc_jit_rvalue): Pgcc_jit_rvalue; cdecl; external libgccjit;

function gcc_jit_version_major: longint; cdecl; external libgccjit;
function gcc_jit_version_minor: longint; cdecl; external libgccjit;
function gcc_jit_version_patchlevel: longint; cdecl; external libgccjit;
function gcc_jit_block_add_extended_asm(block: Pgcc_jit_block; loc: Pgcc_jit_location; asm_template: pchar): Pgcc_jit_extended_asm; cdecl; external libgccjit;
function gcc_jit_block_end_with_extended_asm_goto(block: Pgcc_jit_block; loc: Pgcc_jit_location; asm_template: pchar; num_goto_blocks: longint; goto_blocks: PPgcc_jit_block;
  fallthrough_block: Pgcc_jit_block): Pgcc_jit_extended_asm; cdecl; external libgccjit;
function gcc_jit_extended_asm_as_object(ext_asm: Pgcc_jit_extended_asm): Pgcc_jit_object; cdecl; external libgccjit;
procedure gcc_jit_extended_asm_set_volatile_flag(ext_asm: Pgcc_jit_extended_asm; flag: longint); cdecl; external libgccjit;
procedure gcc_jit_extended_asm_set_inline_flag(ext_asm: Pgcc_jit_extended_asm; flag: longint); cdecl; external libgccjit;
procedure gcc_jit_extended_asm_add_output_operand(ext_asm: Pgcc_jit_extended_asm; asm_symbolic_name: pchar; constraint: pchar; dest: Pgcc_jit_lvalue); cdecl; external libgccjit;
procedure gcc_jit_extended_asm_add_input_operand(ext_asm: Pgcc_jit_extended_asm; asm_symbolic_name: pchar; constraint: pchar; src: Pgcc_jit_rvalue); cdecl; external libgccjit;
procedure gcc_jit_extended_asm_add_clobber(ext_asm: Pgcc_jit_extended_asm; victim: pchar); cdecl; external libgccjit;
procedure gcc_jit_context_add_top_level_asm(ctxt: Pgcc_jit_context; loc: Pgcc_jit_location; asm_stmts: pchar); cdecl; external libgccjit;
function gcc_jit_function_get_return_type(func: Pgcc_jit_function): Pgcc_jit_type; cdecl; external libgccjit;
function gcc_jit_function_get_param_count(func: Pgcc_jit_function): Tsize_t; cdecl; external libgccjit;
function gcc_jit_type_dyncast_array(_type: Pgcc_jit_type): Pgcc_jit_type; cdecl; external libgccjit;
function gcc_jit_type_is_bool(_type: Pgcc_jit_type): longint; cdecl; external libgccjit;
function gcc_jit_type_dyncast_function_ptr_type(_type: Pgcc_jit_type): Pgcc_jit_function_type; cdecl; external libgccjit;
function gcc_jit_function_type_get_return_type(function_type: Pgcc_jit_function_type): Pgcc_jit_type; cdecl; external libgccjit;
function gcc_jit_function_type_get_param_count(function_type: Pgcc_jit_function_type): Tsize_t; cdecl; external libgccjit;
function gcc_jit_function_type_get_param_type(function_type: Pgcc_jit_function_type; index: Tsize_t): Pgcc_jit_type; cdecl; external libgccjit;
function gcc_jit_type_is_integral(_type: Pgcc_jit_type): longint; cdecl; external libgccjit;
function gcc_jit_type_is_pointer(_type: Pgcc_jit_type): Pgcc_jit_type; cdecl; external libgccjit;
function gcc_jit_type_dyncast_vector(_type: Pgcc_jit_type): Pgcc_jit_vector_type; cdecl; external libgccjit;
function gcc_jit_type_is_struct(_type: Pgcc_jit_type): Pgcc_jit_struct; cdecl; external libgccjit;
function gcc_jit_vector_type_get_num_units(vector_type: Pgcc_jit_vector_type): Tsize_t; cdecl; external libgccjit;
function gcc_jit_vector_type_get_element_type(vector_type: Pgcc_jit_vector_type): Pgcc_jit_type; cdecl; external libgccjit;
function gcc_jit_type_unqualified(_type: Pgcc_jit_type): Pgcc_jit_type; cdecl; external libgccjit;

type
  Tgcc_jit_fn_attribute = longint;

const
  GCC_JIT_FN_ATTRIBUTE_ALIAS = 0;
  GCC_JIT_FN_ATTRIBUTE_ALWAYS_INLINE = 1;
  GCC_JIT_FN_ATTRIBUTE_INLINE = 2;
  GCC_JIT_FN_ATTRIBUTE_NOINLINE = 3;
  GCC_JIT_FN_ATTRIBUTE_TARGET = 4;
  GCC_JIT_FN_ATTRIBUTE_USED = 5;
  GCC_JIT_FN_ATTRIBUTE_VISIBILITY = 6;
  GCC_JIT_FN_ATTRIBUTE_COLD = 7;
  GCC_JIT_FN_ATTRIBUTE_RETURNS_TWICE = 8;
  GCC_JIT_FN_ATTRIBUTE_PURE = 9;
  GCC_JIT_FN_ATTRIBUTE_CONST = 10;
  GCC_JIT_FN_ATTRIBUTE_WEAK = 11;
  GCC_JIT_FN_ATTRIBUTE_NONNULL = 12;
  GCC_JIT_FN_ATTRIBUTE_MAX = 13;

procedure gcc_jit_function_add_attribute(func: Pgcc_jit_function; attribute: Tgcc_jit_fn_attribute); cdecl; external libgccjit;
procedure gcc_jit_function_add_string_attribute(func: Pgcc_jit_function; attribute: Tgcc_jit_fn_attribute; value: pchar); cdecl; external libgccjit;
procedure gcc_jit_function_add_integer_array_attribute(func: Pgcc_jit_function; attribute: Tgcc_jit_fn_attribute; value: Plongint; length: Tsize_t); cdecl; external libgccjit;

type
  Tgcc_jit_variable_attribute = longint;

const
  GCC_JIT_VARIABLE_ATTRIBUTE_VISIBILITY = 0;
  GCC_JIT_VARIABLE_ATTRIBUTE_MAX = 1;

procedure gcc_jit_lvalue_add_string_attribute(variable: Pgcc_jit_lvalue; attribute: Tgcc_jit_variable_attribute; value: pchar); cdecl; external libgccjit;

// === Konventiert am: 12-10-26 14:21:44 ===


implementation



end.
