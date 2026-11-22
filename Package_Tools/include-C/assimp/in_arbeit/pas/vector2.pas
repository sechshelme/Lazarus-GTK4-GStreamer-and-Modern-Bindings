unit vector2;

interface

uses
  fp_assimp, defs;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PaiVector2D = ^TaiVector2D;
  TaiVector2D = record
    x: Tai_real;
    y: Tai_real;
  end;

  // === Konventiert am: 22-11-26 17:34:12 ===


implementation



end.
