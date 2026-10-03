unit cpl_minixml;

interface

uses
  fp_gdal;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PCPLXMLNodeType = ^TCPLXMLNodeType;
  TCPLXMLNodeType = longint;
const
  CXT_Element = 0;
  CXT_Text = 1;
  CXT_Attribute = 2;
  CXT_Comment = 3;
  CXT_Literal = 4;

type
  PCPLXMLNode = ^TCPLXMLNode;
  TCPLXMLNode = record
    eType: TCPLXMLNodeType;
    pszValue: pchar;
    psNext: PCPLXMLNode;
    psChild: PCPLXMLNode;
  end;

function CPLParseXMLString(para1: pchar): PCPLXMLNode; cdecl; external libgdal;
procedure CPLDestroyXMLNode(para1: PCPLXMLNode); cdecl; external libgdal;
function CPLGetXMLNode(poRoot: PCPLXMLNode; pszPath: pchar): PCPLXMLNode; cdecl; external libgdal;
function CPLSearchXMLNode(poRoot: PCPLXMLNode; pszTarget: pchar): PCPLXMLNode; cdecl; external libgdal;
function CPLGetXMLValue(poRoot: PCPLXMLNode; pszPath: pchar; pszDefault: pchar): pchar; cdecl; external libgdal;
function CPLCreateXMLNode(poParent: PCPLXMLNode; eType: TCPLXMLNodeType; pszText: pchar): PCPLXMLNode; cdecl; external libgdal;
function CPLSerializeXMLTree(psNode: PCPLXMLNode): pchar; cdecl; external libgdal;
procedure CPLAddXMLChild(psParent: PCPLXMLNode; psChild: PCPLXMLNode); cdecl; external libgdal;
function CPLRemoveXMLChild(psParent: PCPLXMLNode; psChild: PCPLXMLNode): longint; cdecl; external libgdal;
procedure CPLAddXMLSibling(psOlderSibling: PCPLXMLNode; psNewSibling: PCPLXMLNode); cdecl; external libgdal;
function CPLCreateXMLElementAndValue(psParent: PCPLXMLNode; pszName: pchar; pszValue: pchar): PCPLXMLNode; cdecl; external libgdal;
procedure CPLAddXMLAttributeAndValue(psParent: PCPLXMLNode; pszName: pchar; pszValue: pchar); cdecl; external libgdal;
function CPLCloneXMLTree(psTree: PCPLXMLNode): PCPLXMLNode; cdecl; external libgdal;
function CPLSetXMLValue(psRoot: PCPLXMLNode; pszPath: pchar; pszValue: pchar): longint; cdecl; external libgdal;
procedure CPLStripXMLNamespace(psRoot: PCPLXMLNode; pszNameSpace: pchar; bRecurse: longint); cdecl; external libgdal;
procedure CPLCleanXMLElementName(para1: pchar); cdecl; external libgdal;
function CPLParseXMLFile(pszFilename: pchar): PCPLXMLNode; cdecl; external libgdal;
function CPLSerializeXMLTreeToFile(psTree: PCPLXMLNode; pszFilename: pchar): longint; cdecl; external libgdal;

// === Konventiert am: 2-10-26 16:20:12 ===


implementation



end.
