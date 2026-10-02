
unit cpl_minixml;
interface

{
  Automatically converted by H2Pas 1.0.0 from cpl_minixml.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cpl_minixml.h
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
PCPLXMLNode  = ^CPLXMLNode;
PCPLXMLNodeType  = ^CPLXMLNodeType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*********************************************************************
 * $Id$
 *
 * Project:  CPL - Common Portability Library
 * Purpose:  Declarations for MiniXML Handler.
 * Author:   Frank Warmerdam, warmerdam@pobox.com
 *
 **********************************************************************
 * Copyright (c) 2001, Frank Warmerdam
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *************************************************************************** }
{$ifndef CPL_MINIXML_H_INCLUDED}
{$define CPL_MINIXML_H_INCLUDED}
{$include "cpl_port.h"}
{*
 * \file cpl_minixml.h
 *
 * Definitions for CPL mini XML Parser/Serializer.
  }
{* XML node type  }
{! Node is an element  }{! Node is a raw text value  }{! Node is attribute  }{! Node is an XML comment.  }{! Node is a special literal  }type
  PCPLXMLNodeType = ^TCPLXMLNodeType;
  TCPLXMLNodeType =  Longint;
  Const
    CXT_Element = 0;
    CXT_Text = 1;
    CXT_Attribute = 2;
    CXT_Comment = 3;
    CXT_Literal = 4;
;
{! @cond Doxygen_Suppress  }
type
{! @endcond  }
{*
 * Document node structure.
 *
 * This C structure is used to hold a single text fragment representing a
 * component of the document when parsed.   It should be allocated with the
 * appropriate CPL function, and freed with CPLDestroyXMLNode().  The structure
 * contents should not normally be altered by application code, but may be
 * freely examined by application code.
 *
 * Using the psChild and psNext pointers, a hierarchical tree structure
 * for a document can be represented as a tree of CPLXMLNode structures.
  }
{*
     * \brief Node type
     *
     * One of CXT_Element, CXT_Text, CXT_Attribute, CXT_Comment,
     * or CXT_Literal.
      }
{*
     * \brief Node value
     *
     * For CXT_Element this is the name of the element, without the angle
     * brackets.  Note there is a single CXT_Element even when the document
     * contains a start and end element tag.  The node represents the pair.
     * All text or other elements between the start and end tag will appear
     * as children nodes of this CXT_Element node.
     *
     * For CXT_Attribute the pszValue is the attribute name.  The value of
     * the attribute will be a CXT_Text child.
     *
     * For CXT_Text this is the text itself (value of an attribute, or a
     * text fragment between an element start and end tags.
     *
     * For CXT_Literal it is all the literal text.  Currently this is just
     * used for !DOCTYPE lines, and the value would be the entire line.
     *
     * For CXT_Comment the value is all the literal text within the comment,
     * but not including the comment start/end indicators ("<--" and "-->").
      }
{*
     * \brief Next sibling.
     *
     * Pointer to next sibling, that is the next node appearing after this
     * one that has the same parent as this node.  NULL if this node is the
     * last child of the parent element.
      }
{*
     * \brief Child node.
     *
     * Pointer to first child node, if any.  Only CXT_Element and CXT_Attribute
     * nodes should have children.  For CXT_Attribute it should be a single
     * CXT_Text value node, while CXT_Element can have any kind of child.
     * The full list of children for a node are identified by walking the
     * psNext's starting with the psChild node.
      }
  PCPLXMLNode = ^TCPLXMLNode;
  TCPLXMLNode = record
      eType : TCPLXMLNodeType;
      pszValue : Pchar;
      psNext : PCPLXMLNode;
      psChild : PCPLXMLNode;
    end;

(* Const before type ignored *)

function CPLParseXMLString(para1:Pchar):PCPLXMLNode;cdecl;external;
procedure CPLDestroyXMLNode(para1:PCPLXMLNode);cdecl;external;
(* Const before type ignored *)
function CPLGetXMLNode(poRoot:PCPLXMLNode; pszPath:Pchar):PCPLXMLNode;cdecl;external;
(* Const before type ignored *)
function CPLSearchXMLNode(poRoot:PCPLXMLNode; pszTarget:Pchar):PCPLXMLNode;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function CPLGetXMLValue(poRoot:PCPLXMLNode; pszPath:Pchar; pszDefault:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function CPLCreateXMLNode(poParent:PCPLXMLNode; eType:TCPLXMLNodeType; pszText:Pchar):PCPLXMLNode;cdecl;external;
(* Const before type ignored *)
function CPLSerializeXMLTree(psNode:PCPLXMLNode):Pchar;cdecl;external;
procedure CPLAddXMLChild(psParent:PCPLXMLNode; psChild:PCPLXMLNode);cdecl;external;
function CPLRemoveXMLChild(psParent:PCPLXMLNode; psChild:PCPLXMLNode):longint;cdecl;external;
procedure CPLAddXMLSibling(psOlderSibling:PCPLXMLNode; psNewSibling:PCPLXMLNode);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CPLCreateXMLElementAndValue(psParent:PCPLXMLNode; pszName:Pchar; pszValue:Pchar):PCPLXMLNode;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure CPLAddXMLAttributeAndValue(psParent:PCPLXMLNode; pszName:Pchar; pszValue:Pchar);cdecl;external;
(* Const before type ignored *)
function CPLCloneXMLTree(psTree:PCPLXMLNode):PCPLXMLNode;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CPLSetXMLValue(psRoot:PCPLXMLNode; pszPath:Pchar; pszValue:Pchar):longint;cdecl;external;
(* Const before type ignored *)
procedure CPLStripXMLNamespace(psRoot:PCPLXMLNode; pszNameSpace:Pchar; bRecurse:longint);cdecl;external;
procedure CPLCleanXMLElementName(para1:Pchar);cdecl;external;
(* Const before type ignored *)
function CPLParseXMLFile(pszFilename:Pchar):PCPLXMLNode;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CPLSerializeXMLTreeToFile(psTree:PCPLXMLNode; pszFilename:Pchar):longint;cdecl;external;

implementation


end.
