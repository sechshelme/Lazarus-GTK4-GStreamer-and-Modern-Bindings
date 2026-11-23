unit camera;

interface

uses
  fp_assimp, vector3, types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PaiCamera = ^TaiCamera;
  TaiCamera = record
    mName: TaiString;
    mPosition: TaiVector3D;
    mUp: TaiVector3D;
    mLookAt: TaiVector3D;
    mHorizontalFOV: single;
    mClipPlaneNear: single;
    mClipPlaneFar: single;
    mAspect: single;
    mOrthographicWidth: single;
  end;


  // === Konventiert am: 22-11-26 17:00:57 ===


implementation



end.
