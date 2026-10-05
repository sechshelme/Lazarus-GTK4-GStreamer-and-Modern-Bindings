unit Rewrite;

interface

uses
  fp_clang, Index, CXSourceLocation;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PCXRewriter = ^TCXRewriter;
  TCXRewriter = pointer;

function clang_CXRewriter_create(TU: TCXTranslationUnit): TCXRewriter; cdecl; external libclang;
procedure clang_CXRewriter_insertTextBefore(Rew: TCXRewriter; Loc: TCXSourceLocation; Insert: pchar); cdecl; external libclang;
procedure clang_CXRewriter_replaceText(Rew: TCXRewriter; ToBeReplaced: TCXSourceRange; Replacement: pchar); cdecl; external libclang;
procedure clang_CXRewriter_removeText(Rew: TCXRewriter; ToBeRemoved: TCXSourceRange); cdecl; external libclang;
function clang_CXRewriter_overwriteChangedFiles(Rew: TCXRewriter): longint; cdecl; external libclang;
procedure clang_CXRewriter_writeMainFileToStdOut(Rew: TCXRewriter); cdecl; external libclang;
procedure clang_CXRewriter_dispose(Rew: TCXRewriter); cdecl; external libclang;

// === Konventiert am: 4-10-26 17:29:41 ===


implementation



end.
