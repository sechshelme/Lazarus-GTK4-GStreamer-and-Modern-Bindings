unit fp_md4c;

interface

const
  {$IFDEF Linux}
  libmd4c = 'md4c';
  libmd4c_html = 'md4c-html';
  {$ENDIF}

  {$IFDEF Windows}
  libmd4c = 'md4c.dll';
  libmd4c_html = 'md4c-html.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PMD_CHAR = ^TMD_CHAR;
  TMD_CHAR = char;
type
  PMD_SIZE = ^TMD_SIZE;
  TMD_SIZE = dword;

  PMD_OFFSET = ^TMD_OFFSET;
  TMD_OFFSET = dword;

type
  PMD_BLOCKTYPE = ^TMD_BLOCKTYPE;
  TMD_BLOCKTYPE = longint;
const
  MD_BLOCK_DOC = 0;
  MD_BLOCK_QUOTE = 1;
  MD_BLOCK_UL = 2;
  MD_BLOCK_OL = 3;
  MD_BLOCK_LI = 4;
  MD_BLOCK_HR = 5;
  MD_BLOCK_H = 6;
  MD_BLOCK_CODE = 7;
  MD_BLOCK_HTML = 8;
  MD_BLOCK_P = 9;
  MD_BLOCK_TABLE = 10;
  MD_BLOCK_THEAD = 11;
  MD_BLOCK_TBODY = 12;
  MD_BLOCK_TR = 13;
  MD_BLOCK_TH = 14;
  MD_BLOCK_TD = 15;

type
  PMD_SPANTYPE = ^TMD_SPANTYPE;
  TMD_SPANTYPE = longint;
const
  MD_SPAN_EM = 0;
  MD_SPAN_STRONG = 1;
  MD_SPAN_A = 2;
  MD_SPAN_IMG = 3;
  MD_SPAN_CODE = 4;
  MD_SPAN_DEL = 5;
  MD_SPAN_LATEXMATH = 6;
  MD_SPAN_LATEXMATH_DISPLAY = 7;
  MD_SPAN_WIKILINK = 8;
  MD_SPAN_U = 9;

type
  PMD_TEXTTYPE = ^TMD_TEXTTYPE;
  TMD_TEXTTYPE = longint;
const
  MD_TEXT_NORMAL = 0;
  MD_TEXT_NULLCHAR = 1;
  MD_TEXT_BR = 2;
  MD_TEXT_SOFTBR = 3;
  MD_TEXT_ENTITY = 4;
  MD_TEXT_CODE = 5;
  MD_TEXT_HTML = 6;
  MD_TEXT_LATEXMATH = 7;

type
  PMD_ALIGN = ^TMD_ALIGN;
  TMD_ALIGN = longint;
const
  MD_ALIGN_DEFAULT = 0;
  MD_ALIGN_LEFT = 1;
  MD_ALIGN_CENTER = 2;
  MD_ALIGN_RIGHT = 3;

type
  PMD_ATTRIBUTE = ^TMD_ATTRIBUTE;
  TMD_ATTRIBUTE = record
    text: PMD_CHAR;
    size: TMD_SIZE;
    substr_types: PMD_TEXTTYPE;
    substr_offsets: PMD_OFFSET;
  end;

  PMD_BLOCK_UL_DETAIL = ^TMD_BLOCK_UL_DETAIL;
  TMD_BLOCK_UL_DETAIL = record
    is_tight: longint;
    mark: TMD_CHAR;
  end;

  PMD_BLOCK_OL_DETAIL = ^TMD_BLOCK_OL_DETAIL;
  TMD_BLOCK_OL_DETAIL = record
    start: dword;
    is_tight: longint;
    mark_delimiter: TMD_CHAR;
  end;

  PMD_BLOCK_LI_DETAIL = ^TMD_BLOCK_LI_DETAIL;
  TMD_BLOCK_LI_DETAIL = record
    is_task: longint;
    task_mark: TMD_CHAR;
    task_mark_offset: TMD_OFFSET;
  end;

  PMD_BLOCK_H_DETAIL = ^TMD_BLOCK_H_DETAIL;
  TMD_BLOCK_H_DETAIL = record
    level: dword;
  end;

  PMD_BLOCK_CODE_DETAIL = ^TMD_BLOCK_CODE_DETAIL;
  TMD_BLOCK_CODE_DETAIL = record
    info: TMD_ATTRIBUTE;
    lang: TMD_ATTRIBUTE;
    fence_char: TMD_CHAR;
  end;

  PMD_BLOCK_TABLE_DETAIL = ^TMD_BLOCK_TABLE_DETAIL;
  TMD_BLOCK_TABLE_DETAIL = record
    col_count: dword;
    head_row_count: dword;
    body_row_count: dword;
  end;

  PMD_BLOCK_TD_DETAIL = ^TMD_BLOCK_TD_DETAIL;
  TMD_BLOCK_TD_DETAIL = record
    align: TMD_ALIGN;
  end;

  PMD_SPAN_A_DETAIL = ^TMD_SPAN_A_DETAIL;
  TMD_SPAN_A_DETAIL = record
    href: TMD_ATTRIBUTE;
    title: TMD_ATTRIBUTE;
  end;

  PMD_SPAN_IMG_DETAIL = ^TMD_SPAN_IMG_DETAIL;
  TMD_SPAN_IMG_DETAIL = record
    src: TMD_ATTRIBUTE;
    title: TMD_ATTRIBUTE;
  end;

  PMD_SPAN_WIKILINK = ^TMD_SPAN_WIKILINK;
  TMD_SPAN_WIKILINK = record
    target: TMD_ATTRIBUTE;
  end;
  TMD_SPAN_WIKILINK_DETAIL = TMD_SPAN_WIKILINK;
  PMD_SPAN_WIKILINK_DETAIL = ^TMD_SPAN_WIKILINK_DETAIL;

const
  MD_FLAG_COLLAPSEWHITESPACE = $0001;
  MD_FLAG_PERMISSIVEATXHEADERS = $0002;
  MD_FLAG_PERMISSIVEURLAUTOLINKS = $0004;
  MD_FLAG_PERMISSIVEEMAILAUTOLINKS = $0008;
  MD_FLAG_NOINDENTEDCODEBLOCKS = $0010;
  MD_FLAG_NOHTMLBLOCKS = $0020;
  MD_FLAG_NOHTMLSPANS = $0040;
  MD_FLAG_TABLES = $0100;
  MD_FLAG_STRIKETHROUGH = $0200;
  MD_FLAG_PERMISSIVEWWWAUTOLINKS = $0400;
  MD_FLAG_TASKLISTS = $0800;
  MD_FLAG_LATEXMATHSPANS = $1000;
  MD_FLAG_WIKILINKS = $2000;
  MD_FLAG_UNDERLINE = $4000;
  MD_FLAG_PERMISSIVEAUTOLINKS = (MD_FLAG_PERMISSIVEEMAILAUTOLINKS or MD_FLAG_PERMISSIVEURLAUTOLINKS) or MD_FLAG_PERMISSIVEWWWAUTOLINKS;
  MD_FLAG_NOHTML = MD_FLAG_NOHTMLBLOCKS or MD_FLAG_NOHTMLSPANS;
  MD_DIALECT_COMMONMARK = 0;
  MD_DIALECT_GITHUB = ((MD_FLAG_PERMISSIVEAUTOLINKS or MD_FLAG_TABLES) or MD_FLAG_STRIKETHROUGH) or MD_FLAG_TASKLISTS;

type
  PMD_PARSER = ^TMD_PARSER;
  TMD_PARSER = record
    abi_version: dword;
    flags: dword;
    enter_block: function(para1: TMD_BLOCKTYPE; para2: pointer; para3: pointer): longint; cdecl;
    leave_block: function(para1: TMD_BLOCKTYPE; para2: pointer; para3: pointer): longint; cdecl;
    enter_span: function(para1: TMD_SPANTYPE; para2: pointer; para3: pointer): longint; cdecl;
    leave_span: function(para1: TMD_SPANTYPE; para2: pointer; para3: pointer): longint; cdecl;
    text: function(para1: TMD_TEXTTYPE; para2: PMD_CHAR; para3: TMD_SIZE; para4: pointer): longint; cdecl;
    debug_log: procedure(para1: pchar; para2: pointer); cdecl;
    syntax: procedure; cdecl;
  end;

  PMD_RENDERER = ^TMD_RENDERER;
  TMD_RENDERER = TMD_PARSER;

function md_parse(text: PMD_CHAR; size: TMD_SIZE; parser: PMD_PARSER; userdata: pointer): longint; cdecl; external libmd4c;

// === Konventiert am: 11-10-26 13:31:46 ===


implementation



end.
