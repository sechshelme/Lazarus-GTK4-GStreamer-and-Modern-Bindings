unit Documentation;

interface

uses
  fp_clang, Index, CXString, CXErrorCode;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PCXComment = ^TCXComment;
  TCXComment = record
    ASTNode: pointer;
    TranslationUnit: TCXTranslationUnit;
  end;

function clang_Cursor_getParsedComment(C: TCXCursor): TCXComment; cdecl; external libclang;

type
  TCXCommentKind = longint;
const
  CXComment_Null = 0;
  CXComment_Text = 1;
  CXComment_InlineCommand = 2;
  CXComment_HTMLStartTag = 3;
  CXComment_HTMLEndTag = 4;
  CXComment_Paragraph = 5;
  CXComment_BlockCommand = 6;
  CXComment_ParamCommand = 7;
  CXComment_TParamCommand = 8;
  CXComment_VerbatimBlockCommand = 9;
  CXComment_VerbatimBlockLine = 10;
  CXComment_VerbatimLine = 11;
  CXComment_FullComment = 12;

type
  TCXCommentInlineCommandRenderKind = longint;
const
  CXCommentInlineCommandRenderKind_Normal = 0;
  CXCommentInlineCommandRenderKind_Bold = 1;
  CXCommentInlineCommandRenderKind_Monospaced = 2;
  CXCommentInlineCommandRenderKind_Emphasized = 3;
  CXCommentInlineCommandRenderKind_Anchor = 4;

type
  TCXCommentParamPassDirection = longint;
const
  CXCommentParamPassDirection_In = 0;
  CXCommentParamPassDirection_Out = 1;
  CXCommentParamPassDirection_InOut = 2;

function clang_Comment_getKind(Comment: TCXComment): TCXCommentKind; cdecl; external libclang;
function clang_Comment_getNumChildren(Comment: TCXComment): dword; cdecl; external libclang;
function clang_Comment_getChild(Comment: TCXComment; ChildIdx: dword): TCXComment; cdecl; external libclang;
function clang_Comment_isWhitespace(Comment: TCXComment): dword; cdecl; external libclang;
function clang_InlineContentComment_hasTrailingNewline(Comment: TCXComment): dword; cdecl; external libclang;
function clang_TextComment_getText(Comment: TCXComment): TCXString; cdecl; external libclang;
function clang_InlineCommandComment_getCommandName(Comment: TCXComment): TCXString; cdecl; external libclang;
function clang_InlineCommandComment_getRenderKind(Comment: TCXComment): TCXCommentInlineCommandRenderKind; cdecl; external libclang;
function clang_InlineCommandComment_getNumArgs(Comment: TCXComment): dword; cdecl; external libclang;
function clang_InlineCommandComment_getArgText(Comment: TCXComment; ArgIdx: dword): TCXString; cdecl; external libclang;
function clang_HTMLTagComment_getTagName(Comment: TCXComment): TCXString; cdecl; external libclang;
function clang_HTMLStartTagComment_isSelfClosing(Comment: TCXComment): dword; cdecl; external libclang;
function clang_HTMLStartTag_getNumAttrs(Comment: TCXComment): dword; cdecl; external libclang;
function clang_HTMLStartTag_getAttrName(Comment: TCXComment; AttrIdx: dword): TCXString; cdecl; external libclang;
function clang_HTMLStartTag_getAttrValue(Comment: TCXComment; AttrIdx: dword): TCXString; cdecl; external libclang;
function clang_BlockCommandComment_getCommandName(Comment: TCXComment): TCXString; cdecl; external libclang;
function clang_BlockCommandComment_getNumArgs(Comment: TCXComment): dword; cdecl; external libclang;
function clang_BlockCommandComment_getArgText(Comment: TCXComment; ArgIdx: dword): TCXString; cdecl; external libclang;
function clang_BlockCommandComment_getParagraph(Comment: TCXComment): TCXComment; cdecl; external libclang;
function clang_ParamCommandComment_getParamName(Comment: TCXComment): TCXString; cdecl; external libclang;
function clang_ParamCommandComment_isParamIndexValid(Comment: TCXComment): dword; cdecl; external libclang;
function clang_ParamCommandComment_getParamIndex(Comment: TCXComment): dword; cdecl; external libclang;
function clang_ParamCommandComment_isDirectionExplicit(Comment: TCXComment): dword; cdecl; external libclang;
function clang_ParamCommandComment_getDirection(Comment: TCXComment): TCXCommentParamPassDirection; cdecl; external libclang;
function clang_TParamCommandComment_getParamName(Comment: TCXComment): TCXString; cdecl; external libclang;
function clang_TParamCommandComment_isParamPositionValid(Comment: TCXComment): dword; cdecl; external libclang;
function clang_TParamCommandComment_getDepth(Comment: TCXComment): dword; cdecl; external libclang;
function clang_TParamCommandComment_getIndex(Comment: TCXComment; Depth: dword): dword; cdecl; external libclang;
function clang_VerbatimBlockLineComment_getText(Comment: TCXComment): TCXString; cdecl; external libclang;
function clang_VerbatimLineComment_getText(Comment: TCXComment): TCXString; cdecl; external libclang;
function clang_HTMLTagComment_getAsString(Comment: TCXComment): TCXString; cdecl; external libclang;
function clang_FullComment_getAsHTML(Comment: TCXComment): TCXString; cdecl; external libclang;
function clang_FullComment_getAsXML(Comment: TCXComment): TCXString; cdecl; external libclang;

type
  PCXAPISet = ^TCXAPISet;
  TCXAPISet = type Pointer;

function clang_createAPISet(tu: TCXTranslationUnit; out_api: PCXAPISet): TCXErrorCode; cdecl; external libclang;
procedure clang_disposeAPISet(api: TCXAPISet); cdecl; external libclang;
function clang_getSymbolGraphForUSR(usr: pchar; api: TCXAPISet): TCXString; cdecl; external libclang;
function clang_getSymbolGraphForCursor(cursor: TCXCursor): TCXString; cdecl; external libclang;

// === Konventiert am: 4-10-26 17:29:47 ===


implementation



end.
