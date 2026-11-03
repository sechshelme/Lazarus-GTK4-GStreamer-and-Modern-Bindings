program project1;

  {$IFDEF FPC}
//  {$PACKRECORDS C}
  {$ENDIF}

    {$CODEALIGN LOCALMIN=4}
  {$ALIGN 4}


type
  TBitRec = bitpacked record
    bit1: 0..1;
    bit2: 0..1;
    a, b, c: byte;
  end;

type
  TTestRec = record
    c: char;
    bitrec: TBitRec;
    i: integer;
  end;

var
  scr: TTestRec;
  basis: PtrUInt;

begin
  WriteLn('size screen: ', SizeOf(scr));
  WriteLn();
  basis := PtrUInt(@scr);

  WriteLn('ofs c:     ', PtrUInt(@scr.c) - basis);         // -> 0
  WriteLn('ofs bitrec ', PtrUInt(@scr.bitrec) - basis);    // -> 1
  WriteLn('ofs i:     ', PtrUInt(@scr.i) - basis);         // -> 8
end.
