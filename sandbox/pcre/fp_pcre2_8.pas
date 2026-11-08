unit fp_pcre2_8;

interface

const
  {$IFDEF Linux}
  libpcre2_8 = 'pcre2-8';
  {$ENDIF}

  {$IFDEF Windows}
  libpcre2_8 = 'libpcre2-8.dll';
  {$ENDIF}

  type
  Tuint8_t = uint8;
  Puint8_t = ^Tuint8_t;
  PPuint8_t = ^Puint8_t;
  Tuint16_t = uint16;
  Puint16_t = ^Tuint16_t;
  PPuint16_t = ^Puint16_t;
  Tuint32_t = uint32;
  Puint32_t = ^Tuint32_t;
  PPuint32_t = ^Puint32_t;
  Tuint64_t = uint64;
  Puint64_t = ^Tuint64_t;
  PPuint64_t = ^Puint64_t;

  Tint8_t = int8;
  Pint8_t = ^Tint8_t;
  PPint8_t = ^Pint8_t;
  Tint16_t = int16;
  Pint16_t = ^Tint16_t;
  PPint16_t = ^Pint16_t;
  Tint32_t = int32;
  Pint32_t = ^Tint32_t;
  PPint32_t = ^Pint32_t;
  Tint64_t = int64;
  Pint64_t = ^Tint64_t;
  PPint64_t = ^Pint64_t;

  Tsize_t=SizeUInt;

  {$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


const
  PCRE2_MAJOR = 10;  
  PCRE2_MINOR = 42;  

const
  PCRE2_ANCHORED = $80000000;  
  PCRE2_NO_UTF_CHECK = $40000000;  
  PCRE2_ENDANCHORED = $20000000;

  PCRE2_ALLOW_EMPTY_CLASS = $00000001;
  PCRE2_ALT_BSUX = $00000002;
  PCRE2_AUTO_CALLOUT = $00000004;
  PCRE2_CASELESS = $00000008;
  PCRE2_DOLLAR_ENDONLY = $00000010;
  PCRE2_DOTALL = $00000020;
  PCRE2_DUPNAMES = $00000040;
  PCRE2_EXTENDED = $00000080;
  PCRE2_FIRSTLINE = $00000100;
  PCRE2_MATCH_UNSET_BACKREF = $00000200;
  PCRE2_MULTILINE = $00000400;
  PCRE2_NEVER_UCP = $00000800;
  PCRE2_NEVER_UTF = $00001000;
  PCRE2_NO_AUTO_CAPTURE = $00002000;
  PCRE2_NO_AUTO_POSSESS = $00004000;
  PCRE2_NO_DOTSTAR_ANCHOR = $00008000;
  PCRE2_NO_START_OPTIMIZE = $00010000;
  PCRE2_UCP = $00020000;
  PCRE2_UNGREEDY = $00040000;
  PCRE2_UTF = $00080000;
  PCRE2_NEVER_BACKSLASH_C = $00100000;
  PCRE2_ALT_CIRCUMFLEX = $00200000;
  PCRE2_ALT_VERBNAMES = $00400000;
  PCRE2_USE_OFFSET_LIMIT = $00800000;
  PCRE2_EXTENDED_MORE = $01000000;
  PCRE2_LITERAL = $02000000;
  PCRE2_MATCH_INVALID_UTF = $04000000;

  PCRE2_EXTRA_ALLOW_SURROGATE_ESCAPES = $00000001;
  PCRE2_EXTRA_BAD_ESCAPE_IS_LITERAL = $00000002;
  PCRE2_EXTRA_MATCH_WORD = $00000004;
  PCRE2_EXTRA_MATCH_LINE = $00000008;
  PCRE2_EXTRA_ESCAPED_CR_IS_LF = $00000010;
  PCRE2_EXTRA_ALT_BSUX = $00000020;
  PCRE2_EXTRA_ALLOW_LOOKAROUND_BSK = $00000040;

  PCRE2_JIT_COMPLETE = $00000001;
  PCRE2_JIT_PARTIAL_SOFT = $00000002;  
  PCRE2_JIT_PARTIAL_HARD = $00000004;  
  PCRE2_JIT_INVALID_UTF = $00000100;  

  PCRE2_NOTBOL = $00000001;
  PCRE2_NOTEOL = $00000002;  
  PCRE2_NOTEMPTY = $00000004;
  PCRE2_NOTEMPTY_ATSTART = $00000008;
  PCRE2_PARTIAL_SOFT = $00000010;  
  PCRE2_PARTIAL_HARD = $00000020;  
  PCRE2_DFA_RESTART = $00000040;
  PCRE2_DFA_SHORTEST = $00000080;
  PCRE2_SUBSTITUTE_GLOBAL = $00000100;
  PCRE2_SUBSTITUTE_EXTENDED = $00000200;
  PCRE2_SUBSTITUTE_UNSET_EMPTY = $00000400;
  PCRE2_SUBSTITUTE_UNKNOWN_UNSET = $00000800;
  PCRE2_SUBSTITUTE_OVERFLOW_LENGTH = $00001000;
  PCRE2_NO_JIT = $00002000;
  PCRE2_COPY_MATCHED_SUBJECT = $00004000;  
  PCRE2_SUBSTITUTE_LITERAL = $00008000;
  PCRE2_SUBSTITUTE_MATCHED = $00010000;
  PCRE2_SUBSTITUTE_REPLACEMENT_ONLY = $00020000;

  PCRE2_CONVERT_UTF = $00000001;
  PCRE2_CONVERT_NO_UTF_CHECK = $00000002;  
  PCRE2_CONVERT_POSIX_BASIC = $00000004;  
  PCRE2_CONVERT_POSIX_EXTENDED = $00000008;  
  PCRE2_CONVERT_GLOB = $00000010;  
  PCRE2_CONVERT_GLOB_NO_WILD_SEPARATOR = $00000030;  
  PCRE2_CONVERT_GLOB_NO_STARSTAR = $00000050;  

  PCRE2_NEWLINE_CR = 1;
  PCRE2_NEWLINE_LF = 2;  
  PCRE2_NEWLINE_CRLF = 3;  
  PCRE2_NEWLINE_ANY = 4;  
  PCRE2_NEWLINE_ANYCRLF = 5;  
  PCRE2_NEWLINE_NUL = 6;  
  PCRE2_BSR_UNICODE = 1;  
  PCRE2_BSR_ANYCRLF = 2;  

  PCRE2_ERROR_END_BACKSLASH = 101;
  PCRE2_ERROR_END_BACKSLASH_C = 102;  
  PCRE2_ERROR_UNKNOWN_ESCAPE = 103;  
  PCRE2_ERROR_QUANTIFIER_OUT_OF_ORDER = 104;  
  PCRE2_ERROR_QUANTIFIER_TOO_BIG = 105;  
  PCRE2_ERROR_MISSING_SQUARE_BRACKET = 106;  
  PCRE2_ERROR_ESCAPE_INVALID_IN_CLASS = 107;  
  PCRE2_ERROR_CLASS_RANGE_ORDER = 108;  
  PCRE2_ERROR_QUANTIFIER_INVALID = 109;  
  PCRE2_ERROR_INTERNAL_UNEXPECTED_REPEAT = 110;  
  PCRE2_ERROR_INVALID_AFTER_PARENS_QUERY = 111;  
  PCRE2_ERROR_POSIX_CLASS_NOT_IN_CLASS = 112;  
  PCRE2_ERROR_POSIX_NO_SUPPORT_COLLATING = 113;  
  PCRE2_ERROR_MISSING_CLOSING_PARENTHESIS = 114;  
  PCRE2_ERROR_BAD_SUBPATTERN_REFERENCE = 115;  
  PCRE2_ERROR_NULL_PATTERN = 116;  
  PCRE2_ERROR_BAD_OPTIONS = 117;  
  PCRE2_ERROR_MISSING_COMMENT_CLOSING = 118;  
  PCRE2_ERROR_PARENTHESES_NEST_TOO_DEEP = 119;  
  PCRE2_ERROR_PATTERN_TOO_LARGE = 120;  
  PCRE2_ERROR_HEAP_FAILED = 121;  
  PCRE2_ERROR_UNMATCHED_CLOSING_PARENTHESIS = 122;  
  PCRE2_ERROR_INTERNAL_CODE_OVERFLOW = 123;  
  PCRE2_ERROR_MISSING_CONDITION_CLOSING = 124;  
  PCRE2_ERROR_LOOKBEHIND_NOT_FIXED_LENGTH = 125;  
  PCRE2_ERROR_ZERO_RELATIVE_REFERENCE = 126;  
  PCRE2_ERROR_TOO_MANY_CONDITION_BRANCHES = 127;  
  PCRE2_ERROR_CONDITION_ASSERTION_EXPECTED = 128;  
  PCRE2_ERROR_BAD_RELATIVE_REFERENCE = 129;  
  PCRE2_ERROR_UNKNOWN_POSIX_CLASS = 130;  
  PCRE2_ERROR_INTERNAL_STUDY_ERROR = 131;  
  PCRE2_ERROR_UNICODE_NOT_SUPPORTED = 132;  
  PCRE2_ERROR_PARENTHESES_STACK_CHECK = 133;  
  PCRE2_ERROR_CODE_POINT_TOO_BIG = 134;  
  PCRE2_ERROR_LOOKBEHIND_TOO_COMPLICATED = 135;  
  PCRE2_ERROR_LOOKBEHIND_INVALID_BACKSLASH_C = 136;  
  PCRE2_ERROR_UNSUPPORTED_ESCAPE_SEQUENCE = 137;  
  PCRE2_ERROR_CALLOUT_NUMBER_TOO_BIG = 138;  
  PCRE2_ERROR_MISSING_CALLOUT_CLOSING = 139;  
  PCRE2_ERROR_ESCAPE_INVALID_IN_VERB = 140;  
  PCRE2_ERROR_UNRECOGNIZED_AFTER_QUERY_P = 141;  
  PCRE2_ERROR_MISSING_NAME_TERMINATOR = 142;  
  PCRE2_ERROR_DUPLICATE_SUBPATTERN_NAME = 143;  
  PCRE2_ERROR_INVALID_SUBPATTERN_NAME = 144;  
  PCRE2_ERROR_UNICODE_PROPERTIES_UNAVAILABLE = 145;  
  PCRE2_ERROR_MALFORMED_UNICODE_PROPERTY = 146;  
  PCRE2_ERROR_UNKNOWN_UNICODE_PROPERTY = 147;  
  PCRE2_ERROR_SUBPATTERN_NAME_TOO_LONG = 148;  
  PCRE2_ERROR_TOO_MANY_NAMED_SUBPATTERNS = 149;  
  PCRE2_ERROR_CLASS_INVALID_RANGE = 150;  
  PCRE2_ERROR_OCTAL_BYTE_TOO_BIG = 151;  
  PCRE2_ERROR_INTERNAL_OVERRAN_WORKSPACE = 152;  
  PCRE2_ERROR_INTERNAL_MISSING_SUBPATTERN = 153;  
  PCRE2_ERROR_DEFINE_TOO_MANY_BRANCHES = 154;  
  PCRE2_ERROR_BACKSLASH_O_MISSING_BRACE = 155;  
  PCRE2_ERROR_INTERNAL_UNKNOWN_NEWLINE = 156;  
  PCRE2_ERROR_BACKSLASH_G_SYNTAX = 157;  
  PCRE2_ERROR_PARENS_QUERY_R_MISSING_CLOSING = 158;  
  PCRE2_ERROR_VERB_ARGUMENT_NOT_ALLOWED = 159;
  PCRE2_ERROR_VERB_UNKNOWN = 160;  
  PCRE2_ERROR_SUBPATTERN_NUMBER_TOO_BIG = 161;  
  PCRE2_ERROR_SUBPATTERN_NAME_EXPECTED = 162;  
  PCRE2_ERROR_INTERNAL_PARSED_OVERFLOW = 163;  
  PCRE2_ERROR_INVALID_OCTAL = 164;  
  PCRE2_ERROR_SUBPATTERN_NAMES_MISMATCH = 165;  
  PCRE2_ERROR_MARK_MISSING_ARGUMENT = 166;  
  PCRE2_ERROR_INVALID_HEXADECIMAL = 167;  
  PCRE2_ERROR_BACKSLASH_C_SYNTAX = 168;  
  PCRE2_ERROR_BACKSLASH_K_SYNTAX = 169;  
  PCRE2_ERROR_INTERNAL_BAD_CODE_LOOKBEHINDS = 170;  
  PCRE2_ERROR_BACKSLASH_N_IN_CLASS = 171;  
  PCRE2_ERROR_CALLOUT_STRING_TOO_LONG = 172;  
  PCRE2_ERROR_UNICODE_DISALLOWED_CODE_POINT = 173;  
  PCRE2_ERROR_UTF_IS_DISABLED = 174;  
  PCRE2_ERROR_UCP_IS_DISABLED = 175;  
  PCRE2_ERROR_VERB_NAME_TOO_LONG = 176;  
  PCRE2_ERROR_BACKSLASH_U_CODE_POINT_TOO_BIG = 177;  
  PCRE2_ERROR_MISSING_OCTAL_OR_HEX_DIGITS = 178;  
  PCRE2_ERROR_VERSION_CONDITION_SYNTAX = 179;  
  PCRE2_ERROR_INTERNAL_BAD_CODE_AUTO_POSSESS = 180;  
  PCRE2_ERROR_CALLOUT_NO_STRING_DELIMITER = 181;  
  PCRE2_ERROR_CALLOUT_BAD_STRING_DELIMITER = 182;  
  PCRE2_ERROR_BACKSLASH_C_CALLER_DISABLED = 183;  
  PCRE2_ERROR_QUERY_BARJX_NEST_TOO_DEEP = 184;  
  PCRE2_ERROR_BACKSLASH_C_LIBRARY_DISABLED = 185;  
  PCRE2_ERROR_PATTERN_TOO_COMPLICATED = 186;  
  PCRE2_ERROR_LOOKBEHIND_TOO_LONG = 187;  
  PCRE2_ERROR_PATTERN_STRING_TOO_LONG = 188;  
  PCRE2_ERROR_INTERNAL_BAD_CODE = 189;  
  PCRE2_ERROR_INTERNAL_BAD_CODE_IN_SKIP = 190;  
  PCRE2_ERROR_NO_SURROGATES_IN_UTF16 = 191;  
  PCRE2_ERROR_BAD_LITERAL_OPTIONS = 192;  
  PCRE2_ERROR_SUPPORTED_ONLY_IN_UNICODE = 193;  
  PCRE2_ERROR_INVALID_HYPHEN_IN_OPTIONS = 194;  
  PCRE2_ERROR_ALPHA_ASSERTION_UNKNOWN = 195;  
  PCRE2_ERROR_SCRIPT_RUN_NOT_AVAILABLE = 196;  
  PCRE2_ERROR_TOO_MANY_CAPTURES = 197;  
  PCRE2_ERROR_CONDITION_ATOMIC_ASSERTION_EXPECTED = 198;  
  PCRE2_ERROR_BACKSLASH_K_IN_LOOKAROUND = 199;  

  PCRE2_ERROR_NOMATCH = -(1);
  PCRE2_ERROR_PARTIAL = -(2);  
  PCRE2_ERROR_UTF8_ERR1 = -(3);
  PCRE2_ERROR_UTF8_ERR2 = -(4);  
  PCRE2_ERROR_UTF8_ERR3 = -(5);  
  PCRE2_ERROR_UTF8_ERR4 = -(6);  
  PCRE2_ERROR_UTF8_ERR5 = -(7);  
  PCRE2_ERROR_UTF8_ERR6 = -(8);  
  PCRE2_ERROR_UTF8_ERR7 = -(9);  
  PCRE2_ERROR_UTF8_ERR8 = -(10);  
  PCRE2_ERROR_UTF8_ERR9 = -(11);  
  PCRE2_ERROR_UTF8_ERR10 = -(12);  
  PCRE2_ERROR_UTF8_ERR11 = -(13);  
  PCRE2_ERROR_UTF8_ERR12 = -(14);  
  PCRE2_ERROR_UTF8_ERR13 = -(15);  
  PCRE2_ERROR_UTF8_ERR14 = -(16);  
  PCRE2_ERROR_UTF8_ERR15 = -(17);  
  PCRE2_ERROR_UTF8_ERR16 = -(18);  
  PCRE2_ERROR_UTF8_ERR17 = -(19);  
  PCRE2_ERROR_UTF8_ERR18 = -(20);  
  PCRE2_ERROR_UTF8_ERR19 = -(21);  
  PCRE2_ERROR_UTF8_ERR20 = -(22);  
  PCRE2_ERROR_UTF8_ERR21 = -(23);  
  PCRE2_ERROR_UTF16_ERR1 = -(24);
  PCRE2_ERROR_UTF16_ERR2 = -(25);  
  PCRE2_ERROR_UTF16_ERR3 = -(26);  
  PCRE2_ERROR_UTF32_ERR1 = -(27);
  PCRE2_ERROR_UTF32_ERR2 = -(28);  
  PCRE2_ERROR_BADDATA = -(29);
  PCRE2_ERROR_MIXEDTABLES = -(30);
  PCRE2_ERROR_BADMAGIC = -(31);  
  PCRE2_ERROR_BADMODE = -(32);  
  PCRE2_ERROR_BADOFFSET = -(33);  
  PCRE2_ERROR_BADOPTION = -(34);  
  PCRE2_ERROR_BADREPLACEMENT = -(35);  
  PCRE2_ERROR_BADUTFOFFSET = -(36);  
  PCRE2_ERROR_CALLOUT = -(37);
  PCRE2_ERROR_DFA_BADRESTART = -(38);  
  PCRE2_ERROR_DFA_RECURSE = -(39);  
  PCRE2_ERROR_DFA_UCOND = -(40);  
  PCRE2_ERROR_DFA_UFUNC = -(41);  
  PCRE2_ERROR_DFA_UITEM = -(42);  
  PCRE2_ERROR_DFA_WSSIZE = -(43);  
  PCRE2_ERROR_INTERNAL = -(44);  
  PCRE2_ERROR_JIT_BADOPTION = -(45);  
  PCRE2_ERROR_JIT_STACKLIMIT = -(46);  
  PCRE2_ERROR_MATCHLIMIT = -(47);  
  PCRE2_ERROR_NOMEMORY = -(48);  
  PCRE2_ERROR_NOSUBSTRING = -(49);  
  PCRE2_ERROR_NOUNIQUESUBSTRING = -(50);  
  PCRE2_ERROR_NULL = -(51);  
  PCRE2_ERROR_RECURSELOOP = -(52);  
  PCRE2_ERROR_DEPTHLIMIT = -(53);  
  PCRE2_ERROR_RECURSIONLIMIT = -(53);
  PCRE2_ERROR_UNAVAILABLE = -(54);  
  PCRE2_ERROR_UNSET = -(55);  
  PCRE2_ERROR_BADOFFSETLIMIT = -(56);  
  PCRE2_ERROR_BADREPESCAPE = -(57);  
  PCRE2_ERROR_REPMISSINGBRACE = -(58);  
  PCRE2_ERROR_BADSUBSTITUTION = -(59);  
  PCRE2_ERROR_BADSUBSPATTERN = -(60);  
  PCRE2_ERROR_TOOMANYREPLACE = -(61);  
  PCRE2_ERROR_BADSERIALIZEDDATA = -(62);  
  PCRE2_ERROR_HEAPLIMIT = -(63);  
  PCRE2_ERROR_CONVERT_SYNTAX = -(64);  
  PCRE2_ERROR_INTERNAL_DUPMATCH = -(65);  
  PCRE2_ERROR_DFA_UINVALID_UTF = -(66);  

  PCRE2_INFO_ALLOPTIONS = 0;
  PCRE2_INFO_ARGOPTIONS = 1;  
  PCRE2_INFO_BACKREFMAX = 2;  
  PCRE2_INFO_BSR = 3;  
  PCRE2_INFO_CAPTURECOUNT = 4;  
  PCRE2_INFO_FIRSTCODEUNIT = 5;  
  PCRE2_INFO_FIRSTCODETYPE = 6;  
  PCRE2_INFO_FIRSTBITMAP = 7;  
  PCRE2_INFO_HASCRORLF = 8;  
  PCRE2_INFO_JCHANGED = 9;  
  PCRE2_INFO_JITSIZE = 10;  
  PCRE2_INFO_LASTCODEUNIT = 11;  
  PCRE2_INFO_LASTCODETYPE = 12;  
  PCRE2_INFO_MATCHEMPTY = 13;  
  PCRE2_INFO_MATCHLIMIT = 14;  
  PCRE2_INFO_MAXLOOKBEHIND = 15;  
  PCRE2_INFO_MINLENGTH = 16;  
  PCRE2_INFO_NAMECOUNT = 17;  
  PCRE2_INFO_NAMEENTRYSIZE = 18;  
  PCRE2_INFO_NAMETABLE = 19;  
  PCRE2_INFO_NEWLINE = 20;  
  PCRE2_INFO_DEPTHLIMIT = 21;  
  PCRE2_INFO_RECURSIONLIMIT = 21;
  PCRE2_INFO_SIZE = 22;  
  PCRE2_INFO_HASBACKSLASHC = 23;  
  PCRE2_INFO_FRAMESIZE = 24;  
  PCRE2_INFO_HEAPLIMIT = 25;  
  PCRE2_INFO_EXTRAOPTIONS = 26;  

  PCRE2_CONFIG_BSR = 0;
  PCRE2_CONFIG_JIT = 1;  
  PCRE2_CONFIG_JITTARGET = 2;  
  PCRE2_CONFIG_LINKSIZE = 3;  
  PCRE2_CONFIG_MATCHLIMIT = 4;  
  PCRE2_CONFIG_NEWLINE = 5;  
  PCRE2_CONFIG_PARENSLIMIT = 6;  
  PCRE2_CONFIG_DEPTHLIMIT = 7;  
  PCRE2_CONFIG_RECURSIONLIMIT = 7;
  PCRE2_CONFIG_STACKRECURSE = 8;
  PCRE2_CONFIG_UNICODE = 9;  
  PCRE2_CONFIG_UNICODE_VERSION = 10;  
  PCRE2_CONFIG_VERSION = 11;  
  PCRE2_CONFIG_HEAPLIMIT = 12;  
  PCRE2_CONFIG_NEVER_BACKSLASH_C = 13;  
  PCRE2_CONFIG_COMPILED_WIDTHS = 14;  
  PCRE2_CONFIG_TABLES_LENGTH = 15;  

type
  PPCRE2_UCHAR8 = ^TPCRE2_UCHAR8;
  TPCRE2_UCHAR8 = Tuint8_t;

  PPCRE2_UCHAR16 = ^TPCRE2_UCHAR16;
  TPCRE2_UCHAR16 = Tuint16_t;

  PPCRE2_UCHAR32 = ^TPCRE2_UCHAR32;
  TPCRE2_UCHAR32 = Tuint32_t;

  PPCRE2_SPTR8 = ^TPCRE2_SPTR8;
  TPCRE2_SPTR8 = PPCRE2_UCHAR8;

  PPCRE2_SPTR16 = ^TPCRE2_SPTR16;
  TPCRE2_SPTR16 = PPCRE2_UCHAR16;

  PPCRE2_SPTR32 = ^TPCRE2_SPTR32;
  TPCRE2_SPTR32 = PPCRE2_UCHAR32;

  PPCRE2_UCHAR = ^TPCRE2_UCHAR;
  TPCRE2_UCHAR = Tuint8_t;

  PPCRE2_SPTR = ^TPCRE2_SPTR;
  TPCRE2_SPTR = Puint8_t;

  TPCRE2_SIZE = Tsize_t;


const
  PCRE2_SIZE_MAX = 18446744073709551615;

  PCRE2_ZERO_TERMINATED= not (Tsize_t(0));
  PCRE2_UNSET= not (Tsize_t(0));

type
  Ppcre2_real_general_context_8 = type Pointer;
  Tpcre2_real_general_context_8 = Tpcre2_general_context_8;

  Ppcre2_real_compile_context_8 = = type Pointer;

  Tpcre2_real_compile_context_8 = Tpcre2_compile_context_8;
  Ppcre2_real_match_context_8 = = type Pointer;

  Tpcre2_real_match_context_8 = Tpcre2_match_context_8;
  Ppcre2_real_convert_context_8 = = type Pointer;

  Tpcre2_real_convert_context_8 = Tpcre2_convert_context_8;
  Ppcre2_real_code_8 = = type Pointer;

  Tpcre2_real_code_8 = Tpcre2_code_8;
  Ppcre2_real_match_data_8 = = type Pointer;

  Tpcre2_real_match_data_8 = Tpcre2_match_data_8;
  Ppcre2_real_jit_stack_8 = = type Pointer;

  Tpcre2_real_jit_stack_8 = Tpcre2_jit_stack_8;
  Tpcre2_real_code_8 = Tpcre2_code;
  Tpcre2_real_general_context_8 = Tpcre2_general_context;
  Tpcre2_real_compile_context_8 = Tpcre2_compile_context;
  Tpcre2_real_convert_context_8 = Tpcre2_convert_context;
  Tpcre2_real_match_context_8 = Tpcre2_match_context;
  Tpcre2_real_match_data_8 = Tpcre2_match_data;
  Tpcre2_real_jit_stack_8 = Tpcre2_jit_stack;

  Ppcre2_jit_callback_8 = ^Tpcre2_jit_callback_8;
  Tpcre2_jit_callback_8 = function (para1:pointer):Ppcre2_jit_stack_8;cdecl;

  Ppcre2_jit_callback = ^Tpcre2_jit_callback;
  Tpcre2_jit_callback = function (para1:pointer):Ppcre2_jit_stack_8;cdecl;

  Ppcre2_callout_block_8 = ^Tpcre2_callout_block_8;
  Tpcre2_callout_block_8 = record
      version : Tuint32_t;
      callout_number : Tuint32_t;
      capture_top : Tuint32_t;
      capture_last : Tuint32_t;
      offset_vector : Psize_t;
      mark : TPCRE2_SPTR;
      subject : TPCRE2_SPTR;
      subject_length : Tsize_t;
      start_match : Tsize_t;
      current_position : Tsize_t;
      pattern_position : Tsize_t;
      next_item_length : Tsize_t;
      callout_string_offset : Tsize_t;
      callout_string_length : Tsize_t;
      callout_string : TPCRE2_SPTR;
      callout_flags : Tuint32_t;
    end;
  Tpcre2_callout_block_8 = Tpcre2_callout_block;

  Ppcre2_callout_enumerate_block_8 = ^Tpcre2_callout_enumerate_block_8;
  Tpcre2_callout_enumerate_block_8 = record
      version : Tuint32_t;
      pattern_position : Tsize_t;
      next_item_length : Tsize_t;
      callout_number : Tuint32_t;
      callout_string_offset : Tsize_t;
      callout_string_length : Tsize_t;
      callout_string : TPCRE2_SPTR;
    end;
  Tpcre2_callout_enumerate_block_8 = Tpcre2_callout_enumerate_block;

  Ppcre2_substitute_callout_block_8 = ^Tpcre2_substitute_callout_block_8;
  Tpcre2_substitute_callout_block_8 = record
      version : Tuint32_t;
      input : TPCRE2_SPTR;
      output : TPCRE2_SPTR;
      output_offsets : array[0..1] of Tsize_t;
      ovector : Psize_t;
      oveccount : Tuint32_t;
      subscount : Tuint32_t;
    end;
  Tpcre2_substitute_callout_block_8 = Tpcre2_substitute_callout_block;
{ --- Aufgelöste Funktionsprototypen (8-Bit / UTF-8) ---  }

function pcre2_config_8(para1:Tuint32_t; para2:pointer):longint;cdecl;external libisl;
const
  pcre2_config = pcre2_config_8;  

function pcre2_general_context_copy_8(para1:Ppcre2_general_context_8):Ppcre2_general_context_8;cdecl;external libisl;
function pcre2_general_context_create_8(para1:Pprocedure (para1:Tsize_t; para2:pointer); para2:procedure (para1:pointer; para2:pointer); para3:pointer):Ppcre2_general_context_8;cdecl;external libisl;
procedure pcre2_general_context_free_8(para1:Ppcre2_general_context_8);cdecl;external libisl;
const
  pcre2_general_context_copy = pcre2_general_context_copy_8;  
  pcre2_general_context_create = pcre2_general_context_create_8;  
  pcre2_general_context_free = pcre2_general_context_free_8;  

function pcre2_compile_context_copy_8(para1:Ppcre2_compile_context_8):Ppcre2_compile_context_8;cdecl;external libisl;
function pcre2_compile_context_create_8(para1:Ppcre2_general_context_8):Ppcre2_compile_context_8;cdecl;external libisl;
procedure pcre2_compile_context_free_8(para1:Ppcre2_compile_context_8);cdecl;external libisl;
function pcre2_set_bsr_8(para1:Ppcre2_compile_context_8; para2:Tuint32_t):longint;cdecl;external libisl;
function pcre2_set_character_tables_8(para1:Ppcre2_compile_context_8; para2:Puint8_t):longint;cdecl;external libisl;
function pcre2_set_compile_extra_options_8(para1:Ppcre2_compile_context_8; para2:Tuint32_t):longint;cdecl;external libisl;
function pcre2_set_max_pattern_length_8(para1:Ppcre2_compile_context_8; para2:Tsize_t):longint;cdecl;external libisl;
function pcre2_set_newline_8(para1:Ppcre2_compile_context_8; para2:Tuint32_t):longint;cdecl;external libisl;
function pcre2_set_parens_nest_limit_8(para1:Ppcre2_compile_context_8; para2:Tuint32_t):longint;cdecl;external libisl;
function pcre2_set_compile_recursion_guard_8(para1:Ppcre2_compile_context_8; para2:function (para1:Tuint32_t; para2:pointer):longint; para3:pointer):longint;cdecl;external libisl;
const
  pcre2_compile_context_copy = pcre2_compile_context_copy_8;  
  pcre2_compile_context_create = pcre2_compile_context_create_8;  
  pcre2_compile_context_free = pcre2_compile_context_free_8;  
  pcre2_set_bsr = pcre2_set_bsr_8;  
  pcre2_set_character_tables = pcre2_set_character_tables_8;  
  pcre2_set_compile_extra_options = pcre2_set_compile_extra_options_8;  
  pcre2_set_max_pattern_length = pcre2_set_max_pattern_length_8;  
  pcre2_set_newline = pcre2_set_newline_8;  
  pcre2_set_parens_nest_limit = pcre2_set_parens_nest_limit_8;  
  pcre2_set_compile_recursion_guard = pcre2_set_compile_recursion_guard_8;  

function pcre2_convert_context_copy_8(para1:Ppcre2_convert_context_8):Ppcre2_convert_context_8;cdecl;external libisl;
function pcre2_convert_context_create_8(para1:Ppcre2_general_context_8):Ppcre2_convert_context_8;cdecl;external libisl;
procedure pcre2_convert_context_free_8(para1:Ppcre2_convert_context_8);cdecl;external libisl;
function pcre2_set_glob_escape_8(para1:Ppcre2_convert_context_8; para2:Tuint32_t):longint;cdecl;external libisl;
function pcre2_set_glob_separator_8(para1:Ppcre2_convert_context_8; para2:Tuint32_t):longint;cdecl;external libisl;
const
  pcre2_convert_context_copy = pcre2_convert_context_copy_8;  
  pcre2_convert_context_create = pcre2_convert_context_create_8;  
  pcre2_convert_context_free = pcre2_convert_context_free_8;  
  pcre2_set_glob_escape = pcre2_set_glob_escape_8;  
  pcre2_set_glob_separator = pcre2_set_glob_separator_8;  

function pcre2_pattern_convert_8(para1:TPCRE2_SPTR; para2:Tsize_t; para3:Tuint32_t; para4:PPuint8_t; para5:Psize_t; 
           para6:Ppcre2_convert_context_8):longint;cdecl;external libisl;
procedure pcre2_converted_pattern_free_8(para1:Puint8_t);cdecl;external libisl;
const
  pcre2_pattern_convert = pcre2_pattern_convert_8;  
  pcre2_converted_pattern_free = pcre2_converted_pattern_free_8;  

function pcre2_match_context_copy_8(para1:Ppcre2_match_context_8):Ppcre2_match_context_8;cdecl;external libisl;
function pcre2_match_context_create_8(para1:Ppcre2_general_context_8):Ppcre2_match_context_8;cdecl;external libisl;
procedure pcre2_match_context_free_8(para1:Ppcre2_match_context_8);cdecl;external libisl;
function pcre2_set_callout_8(para1:Ppcre2_match_context_8; para2:function (para1:Ppcre2_callout_block_8; para2:pointer):longint; para3:pointer):longint;cdecl;external libisl;
function pcre2_set_substitute_callout_8(para1:Ppcre2_match_context_8; para2:function (para1:Ppcre2_substitute_callout_block_8; para2:pointer):longint; para3:pointer):longint;cdecl;external libisl;
function pcre2_set_depth_limit_8(para1:Ppcre2_match_context_8; para2:Tuint32_t):longint;cdecl;external libisl;
function pcre2_set_heap_limit_8(para1:Ppcre2_match_context_8; para2:Tuint32_t):longint;cdecl;external libisl;
function pcre2_set_match_limit_8(para1:Ppcre2_match_context_8; para2:Tuint32_t):longint;cdecl;external libisl;
function pcre2_set_offset_limit_8(para1:Ppcre2_match_context_8; para2:Tsize_t):longint;cdecl;external libisl;
function pcre2_set_recursion_limit_8(para1:Ppcre2_match_context_8; para2:Tuint32_t):longint;cdecl;external libisl;
function pcre2_set_recursion_memory_management_8(para1:Ppcre2_match_context_8; para2:Pprocedure (para1:Tsize_t; para2:pointer); para3:procedure (para1:pointer; para2:pointer); para4:pointer):longint;cdecl;external libisl;
const
  pcre2_match_context_copy = pcre2_match_context_copy_8;  
  pcre2_match_context_create = pcre2_match_context_create_8;  
  pcre2_match_context_free = pcre2_match_context_free_8;  
  pcre2_set_callout = pcre2_set_callout_8;  
  pcre2_set_substitute_callout = pcre2_set_substitute_callout_8;  
  pcre2_set_depth_limit = pcre2_set_depth_limit_8;  
  pcre2_set_heap_limit = pcre2_set_heap_limit_8;  
  pcre2_set_match_limit = pcre2_set_match_limit_8;  
  pcre2_set_offset_limit = pcre2_set_offset_limit_8;  
  pcre2_set_recursion_limit = pcre2_set_recursion_limit_8;  
  pcre2_set_recursion_memory_management = pcre2_set_recursion_memory_management_8;  

function pcre2_compile_8(para1:TPCRE2_SPTR; para2:Tsize_t; para3:Tuint32_t; para4:Plongint; para5:Psize_t; 
           para6:Ppcre2_compile_context_8):Ppcre2_code_8;cdecl;external libisl;
procedure pcre2_code_free_8(para1:Ppcre2_code_8);cdecl;external libisl;
function pcre2_code_copy_8(para1:Ppcre2_code_8):Ppcre2_code_8;cdecl;external libisl;
function pcre2_code_copy_with_tables_8(para1:Ppcre2_code_8):Ppcre2_code_8;cdecl;external libisl;
const
  pcre2_compile = pcre2_compile_8;  
  pcre2_code_free = pcre2_code_free_8;  
  pcre2_code_copy = pcre2_code_copy_8;  
  pcre2_code_copy_with_tables = pcre2_code_copy_with_tables_8;  

function pcre2_pattern_info_8(para1:Ppcre2_code_8; para2:Tuint32_t; para3:pointer):longint;cdecl;external libisl;
function pcre2_callout_enumerate_8(para1:Ppcre2_code_8; para2:function (para1:Ppcre2_callout_enumerate_block_8; para2:pointer):longint; para3:pointer):longint;cdecl;external libisl;
const
  pcre2_pattern_info = pcre2_pattern_info_8;  
  pcre2_callout_enumerate = pcre2_callout_enumerate_8;  

function pcre2_match_data_create_8(para1:Tuint32_t; para2:Ppcre2_general_context_8):Ppcre2_match_data_8;cdecl;external libisl;
function pcre2_match_data_create_from_pattern_8(para1:Ppcre2_code_8; para2:Ppcre2_general_context_8):Ppcre2_match_data_8;cdecl;external libisl;
function pcre2_dfa_match_8(para1:Ppcre2_code_8; para2:TPCRE2_SPTR; para3:Tsize_t; para4:Tsize_t; para5:Tuint32_t; 
           para6:Ppcre2_match_data_8; para7:Ppcre2_match_context_8; para8:Plongint; para9:Tsize_t):longint;cdecl;external libisl;
function pcre2_match_8(para1:Ppcre2_code_8; para2:TPCRE2_SPTR; para3:Tsize_t; para4:Tsize_t; para5:Tuint32_t; 
           para6:Ppcre2_match_data_8; para7:Ppcre2_match_context_8):longint;cdecl;external libisl;
procedure pcre2_match_data_free_8(para1:Ppcre2_match_data_8);cdecl;external libisl;
function pcre2_get_mark_8(para1:Ppcre2_match_data_8):TPCRE2_SPTR;cdecl;external libisl;
function pcre2_get_match_data_size_8(para1:Ppcre2_match_data_8):Tsize_t;cdecl;external libisl;
function pcre2_get_ovector_count_8(para1:Ppcre2_match_data_8):Tuint32_t;cdecl;external libisl;
function pcre2_get_ovector_pointer_8(para1:Ppcre2_match_data_8):Psize_t;cdecl;external libisl;
function pcre2_get_startchar_8(para1:Ppcre2_match_data_8):Tsize_t;cdecl;external libisl;
const
  pcre2_match_data_create = pcre2_match_data_create_8;  
  pcre2_match_data_create_from_pattern = pcre2_match_data_create_from_pattern_8;  
  pcre2_dfa_match = pcre2_dfa_match_8;  
  pcre2_match = pcre2_match_8;  
  pcre2_match_data_free = pcre2_match_data_free_8;  
  pcre2_get_mark = pcre2_get_mark_8;  
  pcre2_get_match_data_size = pcre2_get_match_data_size_8;  
  pcre2_get_ovector_count = pcre2_get_ovector_count_8;  
  pcre2_get_ovector_pointer = pcre2_get_ovector_pointer_8;  
  pcre2_get_startchar = pcre2_get_startchar_8;  

function pcre2_substring_copy_byname_8(para1:Ppcre2_match_data_8; para2:TPCRE2_SPTR; para3:Puint8_t; para4:Psize_t):longint;cdecl;external libisl;
function pcre2_substring_copy_bynumber_8(para1:Ppcre2_match_data_8; para2:Tuint32_t; para3:Puint8_t; para4:Psize_t):longint;cdecl;external libisl;
procedure pcre2_substring_free_8(para1:Puint8_t);cdecl;external libisl;
function pcre2_substring_get_byname_8(para1:Ppcre2_match_data_8; para2:TPCRE2_SPTR; para3:PPuint8_t; para4:Psize_t):longint;cdecl;external libisl;
function pcre2_substring_get_bynumber_8(para1:Ppcre2_match_data_8; para2:Tuint32_t; para3:PPuint8_t; para4:Psize_t):longint;cdecl;external libisl;
function pcre2_substring_length_byname_8(para1:Ppcre2_match_data_8; para2:TPCRE2_SPTR; para3:Psize_t):longint;cdecl;external libisl;
function pcre2_substring_length_bynumber_8(para1:Ppcre2_match_data_8; para2:Tuint32_t; para3:Psize_t):longint;cdecl;external libisl;
function pcre2_substring_nametable_scan_8(para1:Ppcre2_code_8; para2:TPCRE2_SPTR; para3:PPCRE2_SPTR; para4:PPCRE2_SPTR):longint;cdecl;external libisl;
function pcre2_substring_number_from_name_8(para1:Ppcre2_code_8; para2:TPCRE2_SPTR):longint;cdecl;external libisl;
procedure pcre2_substring_list_free_8(para1:PPCRE2_SPTR);cdecl;external libisl;
function pcre2_substring_list_get_8(para1:Ppcre2_match_data_8; para2:PPPuint8_t; para3:PPsize_t):longint;cdecl;external libisl;
const
  pcre2_substring_copy_byname = pcre2_substring_copy_byname_8;  
  pcre2_substring_copy_bynumber = pcre2_substring_copy_bynumber_8;  
  pcre2_substring_free = pcre2_substring_free_8;  
  pcre2_substring_get_byname = pcre2_substring_get_byname_8;  
  pcre2_substring_get_bynumber = pcre2_substring_get_bynumber_8;  
  pcre2_substring_length_byname = pcre2_substring_length_byname_8;  
  pcre2_substring_length_bynumber = pcre2_substring_length_bynumber_8;  
  pcre2_substring_nametable_scan = pcre2_substring_nametable_scan_8;  
  pcre2_substring_number_from_name = pcre2_substring_number_from_name_8;  
  pcre2_substring_list_free = pcre2_substring_list_free_8;  
  pcre2_substring_list_get = pcre2_substring_list_get_8;  

function pcre2_serialize_encode_8(para1:PPpcre2_code_8; para2:Tint32_t; para3:PPuint8_t; para4:Psize_t; para5:Ppcre2_general_context_8):Tint32_t;cdecl;external libisl;
function pcre2_serialize_decode_8(para1:PPpcre2_code_8; para2:Tint32_t; para3:Puint8_t; para4:Ppcre2_general_context_8):Tint32_t;cdecl;external libisl;
function pcre2_serialize_get_number_of_codes_8(para1:Puint8_t):Tint32_t;cdecl;external libisl;
procedure pcre2_serialize_free_8(para1:Puint8_t);cdecl;external libisl;
const
  pcre2_serialize_encode = pcre2_serialize_encode_8;  
  pcre2_serialize_decode = pcre2_serialize_decode_8;  
  pcre2_serialize_get_number_of_codes = pcre2_serialize_get_number_of_codes_8;  
  pcre2_serialize_free = pcre2_serialize_free_8;  

function pcre2_substitute_8(para1:Ppcre2_code_8; para2:TPCRE2_SPTR; para3:Tsize_t; para4:Tsize_t; para5:Tuint32_t; 
           para6:Ppcre2_match_data_8; para7:Ppcre2_match_context_8; para8:TPCRE2_SPTR; para9:Tsize_t; para10:Puint8_t; 
           para11:Psize_t):longint;cdecl;external libisl;
const
  pcre2_substitute = pcre2_substitute_8;  

function pcre2_jit_compile_8(para1:Ppcre2_code_8; para2:Tuint32_t):longint;cdecl;external libisl;
function pcre2_jit_match_8(para1:Ppcre2_code_8; para2:TPCRE2_SPTR; para3:Tsize_t; para4:Tsize_t; para5:Tuint32_t; 
           para6:Ppcre2_match_data_8; para7:Ppcre2_match_context_8):longint;cdecl;external libisl;
procedure pcre2_jit_free_unused_memory_8(para1:Ppcre2_general_context_8);cdecl;external libisl;
function pcre2_jit_stack_create_8(para1:Tsize_t; para2:Tsize_t; para3:Ppcre2_general_context_8):Ppcre2_jit_stack_8;cdecl;external libisl;
procedure pcre2_jit_stack_assign_8(para1:Ppcre2_match_context_8; para2:Tpcre2_jit_callback_8; para3:pointer);cdecl;external libisl;
procedure pcre2_jit_stack_free_8(para1:Ppcre2_jit_stack_8);cdecl;external libisl;
const
  pcre2_jit_compile = pcre2_jit_compile_8;  
  pcre2_jit_match = pcre2_jit_match_8;  
  pcre2_jit_free_unused_memory = pcre2_jit_free_unused_memory_8;  
  pcre2_jit_stack_create = pcre2_jit_stack_create_8;  
  pcre2_jit_stack_assign = pcre2_jit_stack_assign_8;  
  pcre2_jit_stack_free = pcre2_jit_stack_free_8;  

function pcre2_get_error_message_8(para1:longint; para2:Puint8_t; para3:Tsize_t):longint;cdecl;external libisl;
function pcre2_maketables_8(para1:Ppcre2_general_context_8):Puint8_t;cdecl;external libisl;
procedure pcre2_maketables_free_8(para1:Ppcre2_general_context_8; para2:Puint8_t);cdecl;external libisl;
const
  pcre2_get_error_message = pcre2_get_error_message_8;  
  pcre2_maketables = pcre2_maketables_8;  
  pcre2_maketables_free = pcre2_maketables_free_8;  
{ C++ end of extern C conditionnal removed }
{$endif}
{ PCRE2_H_IDEMPOTENT_GUARD  }

// === Konventiert am: 8-11-26 15:59:52 ===


implementation



end.
