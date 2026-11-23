unit light;

interface

uses
  fp_assimp, vector3, vector2, types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TaiLightSourceType = longint;
const
  aiLightSource_UNDEFINED = $0;
  aiLightSource_DIRECTIONAL = $1;
  aiLightSource_POINT = $2;
  aiLightSource_SPOT = $3;
  aiLightSource_AMBIENT = $4;
  aiLightSource_AREA = $5;
  _aiLightSource_Force32Bit = MaxInt;

type
  PaiLight = ^TaiLight;
  TaiLight = record
    mName: TaiString;
    mType: TaiLightSourceType;
    mPosition: TaiVector3D;
    mDirection: TaiVector3D;
    mUp: TaiVector3D;
    mAttenuationConstant: single;
    mAttenuationLinear: single;
    mAttenuationQuadratic: single;
    mColorDiffuse: TaiColor3D;
    mColorSpecular: TaiColor3D;
    mColorAmbient: TaiColor3D;
    mAngleInnerCone: single;
    mAngleOuterCone: single;
    mSize: TaiVector2D;
  end;


  // === Konventiert am: 22-11-26 17:15:16 ===


implementation



end.
