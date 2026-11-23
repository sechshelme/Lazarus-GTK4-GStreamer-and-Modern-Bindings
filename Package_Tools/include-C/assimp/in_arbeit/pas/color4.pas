unit color4;

interface

uses
  fp_assimp, defs;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PaiColor4D = ^TaiColor4D;
  TaiColor4D = record
    r: Tai_real;
    g: Tai_real;
    b: Tai_real;
    a: Tai_real;
  end;


  // === Konventiert am: 22-11-26 17:09:00 ===


implementation



end.
