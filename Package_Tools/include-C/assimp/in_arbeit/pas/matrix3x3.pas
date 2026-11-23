unit matrix3x3;

interface

uses
  fp_assimp, defs;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PaiMatrix3x3 = ^TaiMatrix3x3;
  TaiMatrix3x3 = record
    a1: Tai_real;
    a2: Tai_real;
    a3: Tai_real;
    b1: Tai_real;
    b2: Tai_real;
    b3: Tai_real;
    c1: Tai_real;
    c2: Tai_real;
    c3: Tai_real;
  end;


  // === Konventiert am: 22-11-26 17:30:22 ===


implementation



end.
