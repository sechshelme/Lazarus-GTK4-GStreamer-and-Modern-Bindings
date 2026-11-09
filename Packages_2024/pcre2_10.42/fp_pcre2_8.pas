unit fp_pcre2_8;

interface

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PPCRE2_UCHAR = ^TPCRE2_UCHAR;
  TPCRE2_UCHAR = Char;

  PPCRE2_SPTR = ^TPCRE2_SPTR;
  TPCRE2_SPTR = PChar;

  {$include pcre2.inc}

function pcre2_config(para1: Tuint32_t; para2: pointer): longint; cdecl; external libpcre2_8 name 'pcre2_config_8';

function pcre2_general_context_copy(para1: Ppcre2_general_context): Ppcre2_general_context; cdecl; external libpcre2_8 name 'pcre2_general_context_copy_8';
function pcre2_general_context_create(para1: Pcontext_copy_func1; para2: Tcontext_copy_func2; para3: pointer): Ppcre2_general_context; cdecl; external libpcre2_8 name 'pcre2_general_context_create_8';
procedure pcre2_general_context_free(para1: Ppcre2_general_context); cdecl; external libpcre2_8 name 'pcre2_general_context_free_8';

function pcre2_compile_context_copy(para1: Ppcre2_compile_context): Ppcre2_compile_context; cdecl; external libpcre2_8 name 'pcre2_compile_context_copy_8';
function pcre2_compile_context_create(para1: Ppcre2_general_context): Ppcre2_compile_context; cdecl; external libpcre2_8 name 'pcre2_compile_context_create_8';
procedure pcre2_compile_context_free(para1: Ppcre2_compile_context); cdecl; external libpcre2_8 name 'pcre2_compile_context_free_8';
function pcre2_set_bsr(para1: Ppcre2_compile_context; para2: Tuint32_t): longint; cdecl; external libpcre2_8 name 'pcre2_set_bsr_8';
function pcre2_set_character_tables(para1: Ppcre2_compile_context; para2: Puint8_t): longint; cdecl; external libpcre2_8 name 'pcre2_set_character_tables_8';
function pcre2_set_compile_extra_options(para1: Ppcre2_compile_context; para2: Tuint32_t): longint; cdecl; external libpcre2_8 name 'pcre2_set_compile_extra_options_8';
function pcre2_set_max_pattern_length(para1: Ppcre2_compile_context; para2: Tsize_t): longint; cdecl; external libpcre2_8 name 'pcre2_set_max_pattern_length_8';
function pcre2_set_newline(para1: Ppcre2_compile_context; para2: Tuint32_t): longint; cdecl; external libpcre2_8 name 'pcre2_set_newline_8';
function pcre2_set_parens_nest_limit(para1: Ppcre2_compile_context; para2: Tuint32_t): longint; cdecl; external libpcre2_8 name 'pcre2_set_parens_nest_limit_8';
function pcre2_set_compile_recursion_guard(para1: Ppcre2_compile_context; para2: Trecursion_guard_func; para3: pointer): longint; cdecl; external libpcre2_8 name 'pcre2_set_compile_recursion_guard_8';

function pcre2_convert_context_copy(para1: Ppcre2_convert_context): Ppcre2_convert_context; cdecl; external libpcre2_8 name 'pcre2_convert_context_copy_8';
function pcre2_convert_context_create(para1: Ppcre2_general_context): Ppcre2_convert_context; cdecl; external libpcre2_8 name 'pcre2_convert_context_create_8';
procedure pcre2_convert_context_free(para1: Ppcre2_convert_context); cdecl; external libpcre2_8 name 'pcre2_convert_context_free_8';
function pcre2_set_glob_escape(para1: Ppcre2_convert_context; para2: Tuint32_t): longint; cdecl; external libpcre2_8 name 'pcre2_set_glob_escape_8';
function pcre2_set_glob_separator(para1: Ppcre2_convert_context; para2: Tuint32_t): longint; cdecl; external libpcre2_8 name 'pcre2_set_glob_separator_8';

function pcre2_pattern_convert(para1: TPCRE2_SPTR; para2: Tsize_t; para3: Tuint32_t; para4: PPuint8_t; para5: Psize_t; para6: Ppcre2_convert_context): longint; cdecl; external libpcre2_8 name 'pcre2_pattern_convert_8';
procedure pcre2_converted_pattern_free(para1: Puint8_t); cdecl; external libpcre2_8 name 'pcre2_converted_pattern_free_8';

function pcre2_match_context_copy(para1: Ppcre2_match_context): Ppcre2_match_context; cdecl; external libpcre2_8 name 'pcre2_match_context_copy_8';
function pcre2_match_context_create(para1: Ppcre2_general_context): Ppcre2_match_context; cdecl; external libpcre2_8 name 'pcre2_match_context_create_8';
procedure pcre2_match_context_free(para1: Ppcre2_match_context); cdecl; external libpcre2_8 name 'pcre2_match_context_free_8';
function pcre2_set_callout(para1: Ppcre2_match_context; para2: Tset_callout_func; para3: pointer): longint; cdecl; external libpcre2_8 name 'pcre2_set_callout_8';
function pcre2_set_substitute_callout(para1: Ppcre2_match_context; para2: Tset_substitute_callout_func; para3: pointer): longint; cdecl; external libpcre2_8 name 'pcre2_set_substitute_callout_8';
function pcre2_set_depth_limit(para1: Ppcre2_match_context; para2: Tuint32_t): longint; cdecl; external libpcre2_8 name 'pcre2_set_depth_limit_8';
function pcre2_set_heap_limit(para1: Ppcre2_match_context; para2: Tuint32_t): longint; cdecl; external libpcre2_8 name 'pcre2_set_heap_limit_8';
function pcre2_set_match_limit(para1: Ppcre2_match_context; para2: Tuint32_t): longint; cdecl; external libpcre2_8 name 'pcre2_set_match_limit_8';
function pcre2_set_offset_limit(para1: Ppcre2_match_context; para2: Tsize_t): longint; cdecl; external libpcre2_8 name 'pcre2_set_offset_limit_8';
function pcre2_set_recursion_limit(para1: Ppcre2_match_context; para2: Tuint32_t): longint; cdecl; external libpcre2_8 name 'pcre2_set_recursion_limit_8';

function pcre2_set_recursion_memory_management(para1: Ppcre2_match_context; para2: Precursion_memory_management_func1; para3: Trecursion_memory_management_func2; para4: pointer): longint; cdecl; external libpcre2_8 name 'pcre2_set_recursion_memory_management_8';

function pcre2_compile(para1: TPCRE2_SPTR; para2: Tsize_t; para3: Tuint32_t; para4: Plongint; para5: Psize_t; para6: Ppcre2_compile_context): Ppcre2_code; cdecl; external libpcre2_8 name 'pcre2_compile_8';
procedure pcre2_code_free(para1: Ppcre2_code); cdecl; external libpcre2_8 name 'pcre2_code_free_8';
function pcre2_code_copy(para1: Ppcre2_code): Ppcre2_code; cdecl; external libpcre2_8 name 'pcre2_code_copy_8';
function pcre2_code_copy_with_tables(para1: Ppcre2_code): Ppcre2_code; cdecl; external libpcre2_8 name 'pcre2_code_copy_with_tables_8';

function pcre2_pattern_info(para1: Ppcre2_code; para2: Tuint32_t; para3: pointer): longint; cdecl; external libpcre2_8 name 'pcre2_pattern_info_8';
function pcre2_callout_enumerate(para1: Ppcre2_code; para2: Tcallout_enumerate_func; para3: pointer): longint; cdecl; external libpcre2_8 name 'pcre2_callout_enumerate_8';

function pcre2_match_data_create(para1: Tuint32_t; para2: Ppcre2_general_context): Ppcre2_match_data; cdecl; external libpcre2_8 name 'pcre2_match_data_create_8';
function pcre2_match_data_create_from_pattern(para1: Ppcre2_code; para2: Ppcre2_general_context): Ppcre2_match_data; cdecl; external libpcre2_8 name 'pcre2_match_data_create_from_pattern_8';
function pcre2_dfa_match(para1: Ppcre2_code; para2: TPCRE2_SPTR; para3: Tsize_t; para4: Tsize_t; para5: Tuint32_t; para6: Ppcre2_match_data; para7: Ppcre2_match_context; para8: Plongint; para9: Tsize_t): longint; cdecl; external libpcre2_8 name 'pcre2_dfa_match_8';
function pcre2_match(para1: Ppcre2_code; para2: TPCRE2_SPTR; para3: Tsize_t; para4: Tsize_t; para5: Tuint32_t; para6: Ppcre2_match_data; para7: Ppcre2_match_context): longint; cdecl; external libpcre2_8 name 'pcre2_match_8';
procedure pcre2_match_data_free(para1: Ppcre2_match_data); cdecl; external libpcre2_8 name 'pcre2_match_data_free_8';
function pcre2_get_mark(para1: Ppcre2_match_data): TPCRE2_SPTR; cdecl; external libpcre2_8 name 'pcre2_get_mark_8';
function pcre2_get_match_data_size(para1: Ppcre2_match_data): Tsize_t; cdecl; external libpcre2_8 name 'pcre2_get_match_data_size_8';
function pcre2_get_ovector_count(para1: Ppcre2_match_data): Tuint32_t; cdecl; external libpcre2_8 name 'pcre2_get_ovector_count_8';
function pcre2_get_ovector_pointer(para1: Ppcre2_match_data): Psize_t; cdecl; external libpcre2_8 name 'pcre2_get_ovector_pointer_8';
function pcre2_get_startchar(para1: Ppcre2_match_data): Tsize_t; cdecl; external libpcre2_8 name 'pcre2_get_startchar_8';

function pcre2_substring_copy_byname(para1: Ppcre2_match_data; para2: TPCRE2_SPTR; para3: Puint8_t; para4: Psize_t): longint; cdecl; external libpcre2_8 name 'pcre2_substring_copy_byname_8';
function pcre2_substring_copy_bynumber(para1: Ppcre2_match_data; para2: Tuint32_t; para3: Puint8_t; para4: Psize_t): longint; cdecl; external libpcre2_8 name 'pcre2_substring_copy_bynumber_8';
procedure pcre2_substring_free(para1: Puint8_t); cdecl; external libpcre2_8 name 'pcre2_substring_free_8';
function pcre2_substring_get_byname(para1: Ppcre2_match_data; para2: TPCRE2_SPTR; para3: PPuint8_t; para4: Psize_t): longint; cdecl; external libpcre2_8 name 'pcre2_substring_get_byname_8';
function pcre2_substring_get_bynumber(para1: Ppcre2_match_data; para2: Tuint32_t; para3: PPuint8_t; para4: Psize_t): longint; cdecl; external libpcre2_8 name 'pcre2_substring_get_bynumber_8';
function pcre2_substring_length_byname(para1: Ppcre2_match_data; para2: TPCRE2_SPTR; para3: Psize_t): longint; cdecl; external libpcre2_8 name 'pcre2_substring_length_byname_8';
function pcre2_substring_length_bynumber(para1: Ppcre2_match_data; para2: Tuint32_t; para3: Psize_t): longint; cdecl; external libpcre2_8 name 'pcre2_substring_length_bynumber_8';
function pcre2_substring_nametable_scan(para1: Ppcre2_code; para2: TPCRE2_SPTR; para3: PPCRE2_SPTR; para4: PPCRE2_SPTR): longint; cdecl; external libpcre2_8 name 'pcre2_substring_nametable_scan_8';
function pcre2_substring_number_from_name(para1: Ppcre2_code; para2: TPCRE2_SPTR): longint; cdecl; external libpcre2_8 name 'pcre2_substring_number_from_name_8';
procedure pcre2_substring_list_free(para1: PPCRE2_SPTR); cdecl; external libpcre2_8 name 'pcre2_substring_list_free_8';
function pcre2_substring_list_get(para1: Ppcre2_match_data; para2: PPPuint8_t; para3: PPsize_t): longint; cdecl; external libpcre2_8 name 'pcre2_substring_list_get_8';

function pcre2_serialize_encode(para1: PPpcre2_code; para2: Tint32_t; para3: PPuint8_t; para4: Psize_t; para5: Ppcre2_general_context): Tint32_t; cdecl; external libpcre2_8 name 'pcre2_serialize_encode_8';
function pcre2_serialize_decode(para1: PPpcre2_code; para2: Tint32_t; para3: Puint8_t; para4: Ppcre2_general_context): Tint32_t; cdecl; external libpcre2_8 name 'pcre2_serialize_decode_8';
function pcre2_serialize_get_number_of_codes(para1: Puint8_t): Tint32_t; cdecl; external libpcre2_8 name 'pcre2_serialize_get_number_of_codes_8';
procedure pcre2_serialize_free(para1: Puint8_t); cdecl; external libpcre2_8 name 'pcre2_serialize_free_8';

function pcre2_substitute(para1: Ppcre2_code; para2: TPCRE2_SPTR; para3: Tsize_t; para4: Tsize_t; para5: Tuint32_t; para6: Ppcre2_match_data; para7: Ppcre2_match_context; para8: TPCRE2_SPTR; para9: Tsize_t; para10: Puint8_t; para11: Psize_t): longint; cdecl; external libpcre2_8 name 'pcre2_substitute_8';

function pcre2_jit_compile(para1: Ppcre2_code; para2: Tuint32_t): longint; cdecl; external libpcre2_8 name 'pcre2_jit_compile_8';
function pcre2_jit_match(para1: Ppcre2_code; para2: TPCRE2_SPTR; para3: Tsize_t; para4: Tsize_t; para5: Tuint32_t; para6: Ppcre2_match_data; para7: Ppcre2_match_context): longint; cdecl; external libpcre2_8 name 'pcre2_jit_match_8';
procedure pcre2_jit_free_unused_memory(para1: Ppcre2_general_context); cdecl; external libpcre2_8 name 'pcre2_jit_free_unused_memory_8';
function pcre2_jit_stack_create(para1: Tsize_t; para2: Tsize_t; para3: Ppcre2_general_context): Ppcre2_jit_stack; cdecl; external libpcre2_8 name 'pcre2_jit_stack_create_8';
procedure pcre2_jit_stack_assign(para1: Ppcre2_match_context; para2: Tpcre2_jit_callback; para3: pointer); cdecl; external libpcre2_8 name 'pcre2_jit_stack_assign_8';
procedure pcre2_jit_stack_free(para1: Ppcre2_jit_stack); cdecl; external libpcre2_8 name 'pcre2_jit_stack_free_8';

function pcre2_get_error_message(para1: longint; para2: Puint8_t; para3: Tsize_t): longint; cdecl; external libpcre2_8 name 'pcre2_get_error_message_8';
function pcre2_maketables(para1: Ppcre2_general_context): Puint8_t; cdecl; external libpcre2_8 name 'pcre2_maketables_8';
procedure pcre2_maketables_free(para1: Ppcre2_general_context; para2: Puint8_t); cdecl; external libpcre2_8 name 'pcre2_maketables_free_8';

// === Konventiert am: 8-11-26 15:59:52 ===


implementation



end.
