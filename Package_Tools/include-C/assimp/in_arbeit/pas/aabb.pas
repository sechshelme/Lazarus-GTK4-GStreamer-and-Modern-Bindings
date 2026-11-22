unit aabb;

interface

uses
  fp_assimp, vector3;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PaiAABB = ^TaiAABB;
  TaiAABB = record
    mMin: TaiVector3D;
    mMax: TaiVector3D;
  end;


  // === Konventiert am: 22-11-26 17:01:02 ===


implementation



end.
