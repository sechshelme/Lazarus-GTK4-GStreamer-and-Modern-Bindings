unit quaternion;

interface

uses
  fp_assimp, defs;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PaiQuaternion = ^TaiQuaternion;
  TaiQuaternion = record
    w: Tai_real;
    x: Tai_real;
    y: Tai_real;
    z: Tai_real;
  end;


  // === Konventiert am: 22-11-26 17:34:21 ===


implementation



end.
