program project1;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TBitRec = bitpacked record
    bit1: 0..1;
    bit2: 0..1;
    pad :0..1073741823;
//    a, b, c: byte;
  end;

type
  TRec = record
    c: char;
    bitrec: TBitRec;
    i: integer;
  end;

var
  rec: TRec;
  basis: PtrUInt;

begin
  WriteLn('size bitrec: ', SizeOf(Tbitrec));
  WriteLn('size bitrec.bit1: ', SizeOf(Tbitrec.pad));
  WriteLn('size rec: ', SizeOf(Trec));
  WriteLn();
  basis := PtrUInt(@rec);

  WriteLn('ofs c:     ', PtrUInt(@rec.c) - basis);         // -> 0
  WriteLn('ofs bitrec ', PtrUInt(@rec.bitrec) - basis);    // -> 1
  WriteLn('ofs i:     ', PtrUInt(@rec.i) - basis);         // -> 8
end.
