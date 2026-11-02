program project1;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  PVTermColor = ^TVTermColor;
  TVTermColor = record
    _type: uint32;
  end;

type
  PVTermScreenCellAttrs = ^TVTermScreenCellAttrs;
  TVTermScreenCellAttrs = bitpacked record
    bold: 0..1;
    underline: 0..3;
    italic: 0..1;
    blink: 0..1;
    reverse: 0..1;
    conceal: 0..1;
    strike: 0..1;
    font: 0..15;
    dwl: 0..1;
    dhl: 0..3;
    small: 0..1;
    baseline: 0..3;
    pad:Byte;
  end;


type
  PVTermScreenCell = ^TVTermScreenCell;
  TVTermScreenCell = record
    c: char;
    attrs: TVTermScreenCellAttrs;
    b:Integer;
    i:Integer;
    fg: byte;
    bg: byte;
  end;

  var
    scr:TVTermScreenCell;
    basis: PtrUInt;

begin
  WriteLn('size screen: ',SizeOf(scr));
  WriteLn();
  basis:=PtrUInt(@scr);

//  WriteLn('ofs chars: ',PtrUInt(@scr.chars)-basis);
  WriteLn('ofs width: ',PtrUInt(@scr.c)-basis);
  WriteLn('ofs attrs: ',PtrUInt(@scr.attrs)-basis);
  WriteLn('ofs i:     ',PtrUInt(@scr.i)-basis);
  WriteLn('ofs fg:    ',PtrUInt(@scr.fg)-basis);
  WriteLn('ofs bg:    ',PtrUInt(@scr.bg)-basis);
end.

