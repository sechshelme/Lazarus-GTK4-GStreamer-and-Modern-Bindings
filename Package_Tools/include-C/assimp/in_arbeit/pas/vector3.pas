unit vector3;

interface

uses
  fp_assimp, defs;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PaiVector3D = ^TaiVector3D;
  TaiVector3D = record
    x: Tai_real;
    y: Tai_real;
    z: Tai_real;
  end;


  // === Konventiert am: 22-11-26 17:34:10 ===


implementation



end.
