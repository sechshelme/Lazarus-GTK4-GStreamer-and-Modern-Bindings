
unit Documentation;
interface

{
  Automatically converted by H2Pas 1.0.0 from Documentation.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Documentation.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PCXAPISet  = ^CXAPISet;
PCXAPISetImpl  = ^CXAPISetImpl;
PCXComment  = ^CXComment;
PCXCommentInlineCommandRenderKind  = ^CXCommentInlineCommandRenderKind;
PCXCommentKind  = ^CXCommentKind;
PCXCommentParamPassDirection  = ^CXCommentParamPassDirection;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{==-- clang-c/Documentation.h - Utilities for comment processing -*- C -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This header provides a supplementary interface for inspecting              *|
|* documentation comments.                                                    *|
|*                                                                            *|
\*===----------------------------------------------------------------------=== }
{$ifndef LLVM_CLANG_C_DOCUMENTATION_H}
{$define LLVM_CLANG_C_DOCUMENTATION_H}
{$include "clang-c/CXErrorCode.h"}
{$include "clang-c/ExternC.h"}
{$include "clang-c/Index.h"}
{*
 * \defgroup CINDEX_COMMENT Comment introspection
 *
 * The routines in this group provide access to information in documentation
 * comments. These facilities are distinct from the core and may be subject to
 * their own schedule of stability and deprecation.
 *
 * @
  }
{*
 * A parsed comment.
  }
(* Const before type ignored *)
type
  PCXComment = ^TCXComment;
  TCXComment = record
      ASTNode : pointer;
      TranslationUnit : TCXTranslationUnit;
    end;
{*
 * Given a cursor that represents a documentable entity (e.g.,
 * declaration), return the associated parsed comment as a
 * \c CXComment_FullComment AST node.
  }

function clang_Cursor_getParsedComment(C:TCXCursor):TCXComment;cdecl;external;
{*
 * Describes the type of the comment AST node (\c CXComment).  A comment
 * node can be considered block content (e. g., paragraph), inline content
 * (plain text) or neither (the root AST node).
  }
{*
   * Null comment.  No AST node is constructed at the requested location
   * because there is no text or a syntax error.
    }
{*
   * Plain text.  Inline content.
    }
{*
   * A command with word-like arguments that is considered inline content.
   *
   * For example: \\c command.
    }
{*
   * HTML start tag with attributes (name-value pairs).  Considered
   * inline content.
   *
   * For example:
   * \verbatim
   * <br> <br /> <a href="http://example.org/">
   * \endverbatim
    }
{*
   * HTML end tag.  Considered inline content.
   *
   * For example:
   * \verbatim
   * </a>
   * \endverbatim
    }
{*
   * A paragraph, contains inline comment.  The paragraph itself is
   * block content.
    }
{*
   * A command that has zero or more word-like arguments (number of
   * word-like arguments depends on command name) and a paragraph as an
   * argument.  Block command is block content.
   *
   * Paragraph argument is also a child of the block command.
   *
   * For example: \has 0 word-like arguments and a paragraph argument.
   *
   * AST nodes of special kinds that parser knows about (e. g., \\param
   * command) have their own node kinds.
    }
{*
   * A \\param or \\arg command that describes the function parameter
   * (name, passing direction, description).
   *
   * For example: \\param [in] ParamName description.
    }
{*
   * A \\tparam command that describes a template parameter (name and
   * description).
   *
   * For example: \\tparam T description.
    }
{*
   * A verbatim block command (e. g., preformatted code).  Verbatim
   * block has an opening and a closing command and contains multiple lines of
   * text (\c CXComment_VerbatimBlockLine child nodes).
   *
   * For example:
   * \\verbatim
   * aaa
   * \\endverbatim
    }
{*
   * A line of text that is contained within a
   * CXComment_VerbatimBlockCommand node.
    }
{*
   * A verbatim line command.  Verbatim line has an opening command,
   * a single line of text (up to the newline after the opening command) and
   * has no closing command.
    }
{*
   * A full comment attached to a declaration, contains block content.
    }
type
  TCXCommentKind =  Longint;
  Const
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

{*
 * The most appropriate rendering mode for an inline command, chosen on
 * command semantics in Doxygen.
  }
{*
   * Command argument should be rendered in a normal font.
    }
{*
   * Command argument should be rendered in a bold font.
    }
{*
   * Command argument should be rendered in a monospaced font.
    }
{*
   * Command argument should be rendered emphasized (typically italic
   * font).
    }
{*
   * Command argument should not be rendered (since it only defines an anchor).
    }
type
  TCXCommentInlineCommandRenderKind =  Longint;
  Const
    CXCommentInlineCommandRenderKind_Normal = 0;
    CXCommentInlineCommandRenderKind_Bold = 1;
    CXCommentInlineCommandRenderKind_Monospaced = 2;
    CXCommentInlineCommandRenderKind_Emphasized = 3;
    CXCommentInlineCommandRenderKind_Anchor = 4;

{*
 * Describes parameter passing direction for \\param or \\arg command.
  }
{*
   * The parameter is an input parameter.
    }
{*
   * The parameter is an output parameter.
    }
{*
   * The parameter is an input and output parameter.
    }
type
  TCXCommentParamPassDirection =  Longint;
  Const
    CXCommentParamPassDirection_In = 0;
    CXCommentParamPassDirection_Out = 1;
    CXCommentParamPassDirection_InOut = 2;

{*
 * \param Comment AST node of any kind.
 *
 * \returns the type of the AST node.
  }

function clang_Comment_getKind(Comment:TCXComment):TCXCommentKind;cdecl;external;
{*
 * \param Comment AST node of any kind.
 *
 * \returns number of children of the AST node.
  }
function clang_Comment_getNumChildren(Comment:TCXComment):dword;cdecl;external;
{*
 * \param Comment AST node of any kind.
 *
 * \param ChildIdx child index (zero-based).
 *
 * \returns the specified child of the AST node.
  }
function clang_Comment_getChild(Comment:TCXComment; ChildIdx:dword):TCXComment;cdecl;external;
{*
 * A \c CXComment_Paragraph node is considered whitespace if it contains
 * only \c CXComment_Text nodes that are empty or whitespace.
 *
 * Other AST nodes (except \c CXComment_Paragraph and \c CXComment_Text) are
 * never considered whitespace.
 *
 * \returns non-zero if \c Comment is whitespace.
  }
function clang_Comment_isWhitespace(Comment:TCXComment):dword;cdecl;external;
{*
 * \returns non-zero if \c Comment is inline content and has a newline
 * immediately following it in the comment text.  Newlines between paragraphs
 * do not count.
  }
function clang_InlineContentComment_hasTrailingNewline(Comment:TCXComment):dword;cdecl;external;
{*
 * \param Comment a \c CXComment_Text AST node.
 *
 * \returns text contained in the AST node.
  }
function clang_TextComment_getText(Comment:TCXComment):TCXString;cdecl;external;
{*
 * \param Comment a \c CXComment_InlineCommand AST node.
 *
 * \returns name of the inline command.
  }
function clang_InlineCommandComment_getCommandName(Comment:TCXComment):TCXString;cdecl;external;
{*
 * \param Comment a \c CXComment_InlineCommand AST node.
 *
 * \returns the most appropriate rendering mode, chosen on command
 * semantics in Doxygen.
  }
function clang_InlineCommandComment_getRenderKind(Comment:TCXComment):TCXCommentInlineCommandRenderKind;cdecl;external;
{*
 * \param Comment a \c CXComment_InlineCommand AST node.
 *
 * \returns number of command arguments.
  }
function clang_InlineCommandComment_getNumArgs(Comment:TCXComment):dword;cdecl;external;
{*
 * \param Comment a \c CXComment_InlineCommand AST node.
 *
 * \param ArgIdx argument index (zero-based).
 *
 * \returns text of the specified argument.
  }
function clang_InlineCommandComment_getArgText(Comment:TCXComment; ArgIdx:dword):TCXString;cdecl;external;
{*
 * \param Comment a \c CXComment_HTMLStartTag or \c CXComment_HTMLEndTag AST
 * node.
 *
 * \returns HTML tag name.
  }
function clang_HTMLTagComment_getTagName(Comment:TCXComment):TCXString;cdecl;external;
{*
 * \param Comment a \c CXComment_HTMLStartTag AST node.
 *
 * \returns non-zero if tag is self-closing (for example, &lt;br /&gt;).
  }
function clang_HTMLStartTagComment_isSelfClosing(Comment:TCXComment):dword;cdecl;external;
{*
 * \param Comment a \c CXComment_HTMLStartTag AST node.
 *
 * \returns number of attributes (name-value pairs) attached to the start tag.
  }
function clang_HTMLStartTag_getNumAttrs(Comment:TCXComment):dword;cdecl;external;
{*
 * \param Comment a \c CXComment_HTMLStartTag AST node.
 *
 * \param AttrIdx attribute index (zero-based).
 *
 * \returns name of the specified attribute.
  }
function clang_HTMLStartTag_getAttrName(Comment:TCXComment; AttrIdx:dword):TCXString;cdecl;external;
{*
 * \param Comment a \c CXComment_HTMLStartTag AST node.
 *
 * \param AttrIdx attribute index (zero-based).
 *
 * \returns value of the specified attribute.
  }
function clang_HTMLStartTag_getAttrValue(Comment:TCXComment; AttrIdx:dword):TCXString;cdecl;external;
{*
 * \param Comment a \c CXComment_BlockCommand AST node.
 *
 * \returns name of the block command.
  }
function clang_BlockCommandComment_getCommandName(Comment:TCXComment):TCXString;cdecl;external;
{*
 * \param Comment a \c CXComment_BlockCommand AST node.
 *
 * \returns number of word-like arguments.
  }
function clang_BlockCommandComment_getNumArgs(Comment:TCXComment):dword;cdecl;external;
{*
 * \param Comment a \c CXComment_BlockCommand AST node.
 *
 * \param ArgIdx argument index (zero-based).
 *
 * \returns text of the specified word-like argument.
  }
function clang_BlockCommandComment_getArgText(Comment:TCXComment; ArgIdx:dword):TCXString;cdecl;external;
{*
 * \param Comment a \c CXComment_BlockCommand or
 * \c CXComment_VerbatimBlockCommand AST node.
 *
 * \returns paragraph argument of the block command.
  }
function clang_BlockCommandComment_getParagraph(Comment:TCXComment):TCXComment;cdecl;external;
{*
 * \param Comment a \c CXComment_ParamCommand AST node.
 *
 * \returns parameter name.
  }
function clang_ParamCommandComment_getParamName(Comment:TCXComment):TCXString;cdecl;external;
{*
 * \param Comment a \c CXComment_ParamCommand AST node.
 *
 * \returns non-zero if the parameter that this AST node represents was found
 * in the function prototype and \c clang_ParamCommandComment_getParamIndex
 * function will return a meaningful value.
  }
function clang_ParamCommandComment_isParamIndexValid(Comment:TCXComment):dword;cdecl;external;
{*
 * \param Comment a \c CXComment_ParamCommand AST node.
 *
 * \returns zero-based parameter index in function prototype.
  }
function clang_ParamCommandComment_getParamIndex(Comment:TCXComment):dword;cdecl;external;
{*
 * \param Comment a \c CXComment_ParamCommand AST node.
 *
 * \returns non-zero if parameter passing direction was specified explicitly in
 * the comment.
  }
function clang_ParamCommandComment_isDirectionExplicit(Comment:TCXComment):dword;cdecl;external;
{*
 * \param Comment a \c CXComment_ParamCommand AST node.
 *
 * \returns parameter passing direction.
  }
function clang_ParamCommandComment_getDirection(Comment:TCXComment):TCXCommentParamPassDirection;cdecl;external;
{*
 * \param Comment a \c CXComment_TParamCommand AST node.
 *
 * \returns template parameter name.
  }
function clang_TParamCommandComment_getParamName(Comment:TCXComment):TCXString;cdecl;external;
{*
 * \param Comment a \c CXComment_TParamCommand AST node.
 *
 * \returns non-zero if the parameter that this AST node represents was found
 * in the template parameter list and
 * \c clang_TParamCommandComment_getDepth and
 * \c clang_TParamCommandComment_getIndex functions will return a meaningful
 * value.
  }
function clang_TParamCommandComment_isParamPositionValid(Comment:TCXComment):dword;cdecl;external;
{*
 * \param Comment a \c CXComment_TParamCommand AST node.
 *
 * \returns zero-based nesting depth of this parameter in the template parameter list.
 *
 * For example,
 * \verbatim
 *     template<typename C, template<typename T> class TT>
 *     void test(TT<int> aaa);
 * \endverbatim
 * for C and TT nesting depth is 0,
 * for T nesting depth is 1.
  }
function clang_TParamCommandComment_getDepth(Comment:TCXComment):dword;cdecl;external;
{*
 * \param Comment a \c CXComment_TParamCommand AST node.
 *
 * \returns zero-based parameter index in the template parameter list at a
 * given nesting depth.
 *
 * For example,
 * \verbatim
 *     template<typename C, template<typename T> class TT>
 *     void test(TT<int> aaa);
 * \endverbatim
 * for C and TT nesting depth is 0, so we can ask for index at depth 0:
 * at depth 0 C's index is 0, TT's index is 1.
 *
 * For T nesting depth is 1, so we can ask for index at depth 0 and 1:
 * at depth 0 T's index is 1 (same as TT's),
 * at depth 1 T's index is 0.
  }
function clang_TParamCommandComment_getIndex(Comment:TCXComment; Depth:dword):dword;cdecl;external;
{*
 * \param Comment a \c CXComment_VerbatimBlockLine AST node.
 *
 * \returns text contained in the AST node.
  }
function clang_VerbatimBlockLineComment_getText(Comment:TCXComment):TCXString;cdecl;external;
{*
 * \param Comment a \c CXComment_VerbatimLine AST node.
 *
 * \returns text contained in the AST node.
  }
function clang_VerbatimLineComment_getText(Comment:TCXComment):TCXString;cdecl;external;
{*
 * Convert an HTML tag AST node to string.
 *
 * \param Comment a \c CXComment_HTMLStartTag or \c CXComment_HTMLEndTag AST
 * node.
 *
 * \returns string containing an HTML tag.
  }
function clang_HTMLTagComment_getAsString(Comment:TCXComment):TCXString;cdecl;external;
{*
 * Convert a given full parsed comment to an HTML fragment.
 *
 * Specific details of HTML layout are subject to change.  Don't try to parse
 * this HTML back into an AST, use other APIs instead.
 *
 * Currently the following CSS classes are used:
 * \li "para-brief" for \paragraph and equivalent commands;
 * \li "para-returns" for \\returns paragraph and equivalent commands;
 * \li "word-returns" for the "Returns" word in \\returns paragraph.
 *
 * Function argument documentation is rendered as a \<dl\> list with arguments
 * sorted in function prototype order.  CSS classes used:
 * \li "param-name-index-NUMBER" for parameter name (\<dt\>);
 * \li "param-descr-index-NUMBER" for parameter description (\<dd\>);
 * \li "param-name-index-invalid" and "param-descr-index-invalid" are used if
 * parameter index is invalid.
 *
 * Template parameter documentation is rendered as a \<dl\> list with
 * parameters sorted in template parameter list order.  CSS classes used:
 * \li "tparam-name-index-NUMBER" for parameter name (\<dt\>);
 * \li "tparam-descr-index-NUMBER" for parameter description (\<dd\>);
 * \li "tparam-name-index-other" and "tparam-descr-index-other" are used for
 * names inside template template parameters;
 * \li "tparam-name-index-invalid" and "tparam-descr-index-invalid" are used if
 * parameter position is invalid.
 *
 * \param Comment a \c CXComment_FullComment AST node.
 *
 * \returns string containing an HTML fragment.
  }
function clang_FullComment_getAsHTML(Comment:TCXComment):TCXString;cdecl;external;
{*
 * Convert a given full parsed comment to an XML document.
 *
 * A Relax NG schema for the XML can be found in comment-xml-schema.rng file
 * inside clang source tree.
 *
 * \param Comment a \c CXComment_FullComment AST node.
 *
 * \returns string containing an XML document.
  }
function clang_FullComment_getAsXML(Comment:TCXComment):TCXString;cdecl;external;
{*
 * CXAPISet is an opaque type that represents a data structure containing all
 * the API information for a given translation unit. This can be used for a
 * single symbol symbol graph for a given symbol.
  }
type
  PCXAPISet = ^TCXAPISet;
  TCXAPISet = PCXAPISetImpl;
{*
 * Traverses the translation unit to create a \c CXAPISet.
 *
 * \param tu is the \c CXTranslationUnit to build the \c CXAPISet for.
 *
 * \param out_api is a pointer to the output of this function. It is needs to be
 * disposed of by calling clang_disposeAPISet.
 *
 * \returns Error code indicating success or failure of the APISet creation.
  }

function clang_createAPISet(tu:TCXTranslationUnit; out_api:PCXAPISet):TCXErrorCode;cdecl;external;
{*
 * Dispose of an APISet.
 *
 * The provided \c CXAPISet can not be used after this function is called.
  }
procedure clang_disposeAPISet(api:TCXAPISet);cdecl;external;
{*
 * Generate a single symbol symbol graph for the given USR. Returns a null
 * string if the associated symbol can not be found in the provided \c CXAPISet.
 *
 * The output contains the symbol graph as well as some additional information
 * about related symbols.
 *
 * \param usr is a string containing the USR of the symbol to generate the
 * symbol graph for.
 *
 * \param api the \c CXAPISet to look for the symbol in.
 *
 * \returns a string containing the serialized symbol graph representation for
 * the symbol being queried or a null string if it can not be found in the
 * APISet.
  }
(* Const before type ignored *)
function clang_getSymbolGraphForUSR(usr:Pchar; api:TCXAPISet):TCXString;cdecl;external;
{*
 * Generate a single symbol symbol graph for the declaration at the given
 * cursor. Returns a null string if the AST node for the cursor isn't a
 * declaration.
 *
 * The output contains the symbol graph as well as some additional information
 * about related symbols.
 *
 * \param cursor the declaration for which to generate the single symbol symbol
 * graph.
 *
 * \returns a string containing the serialized symbol graph representation for
 * the symbol being queried or a null string if it can not be found in the
 * APISet.
  }
function clang_getSymbolGraphForCursor(cursor:TCXCursor):TCXString;cdecl;external;
{*
 * @
  }
{$endif}
{ CLANG_C_DOCUMENTATION_H  }

implementation


end.
