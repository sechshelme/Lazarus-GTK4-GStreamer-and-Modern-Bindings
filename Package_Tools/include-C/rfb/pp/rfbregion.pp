
unit rfbregion;
interface

{
  Automatically converted by H2Pas 1.0.0 from rfbregion.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rfbregion.h
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
Plongint  = ^longint;
Prect  = ^rect;
PsraRect  = ^sraRect;
PsraRectangleIterator  = ^sraRectangleIterator;
PsraRegion  = ^sraRegion;
PsraSpan  = ^sraSpan;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef SRAREGION_H}
{$define SRAREGION_H}
{ -=- SRA - Simple Region Algorithm
 * A simple rectangular region implementation.
 * Copyright (c) 2001 James "Wez" Weatherall, Johannes E. Schindelin
  }
{ -=- sraRect  }
type
  Prect = ^Trect;
  Trect = record
      x1 : longint;
      y1 : longint;
      x2 : longint;
      y2 : longint;
    end;
  TsraRect = Trect;
  PsraRect = ^TsraRect;
{ -=- Region manipulation functions  }

function sraRgnCreate:PsraRegion;cdecl;external;
function sraRgnCreateRect(x1:longint; y1:longint; x2:longint; y2:longint):PsraRegion;cdecl;external;
(* Const before type ignored *)
function sraRgnCreateRgn(src:PsraRegion):PsraRegion;cdecl;external;
procedure sraRgnDestroy(rgn:PsraRegion);cdecl;external;
procedure sraRgnMakeEmpty(rgn:PsraRegion);cdecl;external;
(* Const before type ignored *)
function sraRgnAnd(dst:PsraRegion; src:PsraRegion):TrfbBool;cdecl;external;
(* Const before type ignored *)
procedure sraRgnOr(dst:PsraRegion; src:PsraRegion);cdecl;external;
(* Const before type ignored *)
function sraRgnSubtract(dst:PsraRegion; src:PsraRegion):TrfbBool;cdecl;external;
procedure sraRgnOffset(dst:PsraRegion; dx:longint; dy:longint);cdecl;external;
function sraRgnPopRect(region:PsraRegion; rect:PsraRect; flags:dword):TrfbBool;cdecl;external;
(* Const before type ignored *)
function sraRgnCountRects(rgn:PsraRegion):dword;cdecl;external;
(* Const before type ignored *)
function sraRgnEmpty(rgn:PsraRegion):TrfbBool;cdecl;external;
(* Const before type ignored *)
function sraRgnBBox(src:PsraRegion):PsraRegion;cdecl;external;
{ -=- rectangle iterator  }
type
  PsraRectangleIterator = ^TsraRectangleIterator;
  TsraRectangleIterator = record
      reverseX : TrfbBool;
      reverseY : TrfbBool;
      ptrSize : longint;
      ptrPos : longint;
      sPtrs : ^PsraSpan;
    end;

function sraRgnGetIterator(s:PsraRegion):PsraRectangleIterator;cdecl;external;
function sraRgnGetReverseIterator(s:PsraRegion; reverseX:TrfbBool; reverseY:TrfbBool):PsraRectangleIterator;cdecl;external;
function sraRgnIteratorNext(i:PsraRectangleIterator; r:PsraRect):TrfbBool;cdecl;external;
procedure sraRgnReleaseIterator(i:PsraRectangleIterator);cdecl;external;
(* Const before type ignored *)
procedure sraRgnPrint(s:PsraRegion);cdecl;external;
{ -=- Rectangle clipper (for speed)  }
function sraClipRect(x:Plongint; y:Plongint; w:Plongint; h:Plongint; cx:longint; 
           cy:longint; cw:longint; ch:longint):TrfbBool;cdecl;external;
function sraClipRect2(x:Plongint; y:Plongint; x2:Plongint; y2:Plongint; cx:longint; 
           cy:longint; cx2:longint; cy2:longint):TrfbBool;cdecl;external;
{$endif}

implementation


end.
