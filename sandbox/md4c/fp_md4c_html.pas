unit fp_md4c_html;

interface

uses
  fp_md4c;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  MD_HTML_FLAG_DEBUG = $0001;
  MD_HTML_FLAG_VERBATIM_ENTITIES = $0002;
  MD_HTML_FLAG_SKIP_UTF8_BOM = $0004;
  MD_HTML_FLAG_XHTML = $0008;

type
  Tmd_html_func = procedure(s: PMD_CHAR; l: TMD_SIZE; userdata: pointer); cdecl;

function md_html(input: PMD_CHAR; input_size: TMD_SIZE; process_output: Tmd_html_func; userdata: pointer; parser_flags: dword;
  renderer_flags: dword): longint; cdecl; external libmd4c_html;

// === Konventiert am: 11-10-26 13:31:49 ===


implementation



end.
