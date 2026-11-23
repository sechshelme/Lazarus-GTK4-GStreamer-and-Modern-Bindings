{$IFDEF read_interface}


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


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
