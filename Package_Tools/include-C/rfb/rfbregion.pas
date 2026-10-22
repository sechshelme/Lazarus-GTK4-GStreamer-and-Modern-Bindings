unit rfbregion;

interface

uses
  fp_vnc;

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

function sraRgnCreate:PsraRegion;cdecl;external libvncserver;
function sraRgnCreateRect(x1:longint; y1:longint; x2:longint; y2:longint):PsraRegion;cdecl;external libvncserver;
function sraRgnCreateRgn(src:PsraRegion):PsraRegion;cdecl;external libvncserver;
procedure sraRgnDestroy(rgn:PsraRegion);cdecl;external libvncserver;
procedure sraRgnMakeEmpty(rgn:PsraRegion);cdecl;external libvncserver;
function sraRgnAnd(dst:PsraRegion; src:PsraRegion):TrfbBool;cdecl;external libvncserver;
procedure sraRgnOr(dst:PsraRegion; src:PsraRegion);cdecl;external libvncserver;
function sraRgnSubtract(dst:PsraRegion; src:PsraRegion):TrfbBool;cdecl;external libvncserver;
procedure sraRgnOffset(dst:PsraRegion; dx:longint; dy:longint);cdecl;external libvncserver;
function sraRgnPopRect(region:PsraRegion; rect:PsraRect; flags:dword):TrfbBool;cdecl;external libvncserver;
function sraRgnCountRects(rgn:PsraRegion):dword;cdecl;external libvncserver;
function sraRgnEmpty(rgn:PsraRegion):TrfbBool;cdecl;external libvncserver;
function sraRgnBBox(src:PsraRegion):PsraRegion;cdecl;external libvncserver;
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

function sraRgnGetIterator(s:PsraRegion):PsraRectangleIterator;cdecl;external libvncserver;
function sraRgnGetReverseIterator(s:PsraRegion; reverseX:TrfbBool; reverseY:TrfbBool):PsraRectangleIterator;cdecl;external libvncserver;
function sraRgnIteratorNext(i:PsraRectangleIterator; r:PsraRect):TrfbBool;cdecl;external libvncserver;
procedure sraRgnReleaseIterator(i:PsraRectangleIterator);cdecl;external libvncserver;
procedure sraRgnPrint(s:PsraRegion);cdecl;external libvncserver;
{ -=- Rectangle clipper (for speed)  }
function sraClipRect(x:Plongint; y:Plongint; w:Plongint; h:Plongint; cx:longint; 
           cy:longint; cw:longint; ch:longint):TrfbBool;cdecl;external libvncserver;
function sraClipRect2(x:Plongint; y:Plongint; x2:Plongint; y2:Plongint; cx:longint; 
           cy:longint; cx2:longint; cy2:longint):TrfbBool;cdecl;external libvncserver;
{$endif}

// === Konventiert am: 22-10-26 19:44:58 ===


implementation



end.
