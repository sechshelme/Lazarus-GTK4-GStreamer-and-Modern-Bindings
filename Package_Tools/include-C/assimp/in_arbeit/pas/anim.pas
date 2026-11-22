unit anim;

interface

uses
  fp_assimp, vector3, quaternion, config, types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PaiVectorKey = ^TaiVectorKey;
  TaiVectorKey = record
    mTime: double;
    mValue: TaiVector3D;
  end;

  PaiQuatKey = ^TaiQuatKey;
  TaiQuatKey = record
    mTime: double;
    mValue: TaiQuaternion;
  end;

  PaiMeshKey = ^TaiMeshKey;
  TaiMeshKey = record
    mTime: double;
    mValue: dword;
  end;

  PaiMeshMorphKey = ^TaiMeshMorphKey;
  TaiMeshMorphKey = record
    mTime: double;
    mValues: Pdword;
    mWeights: Pdouble;
    mNumValuesAndWeights: dword;
  end;

type
  TaiAnimBehaviour = longint;
const
  aiAnimBehaviour_DEFAULT = $0;
  aiAnimBehaviour_CONSTANT = $1;
  aiAnimBehaviour_LINEAR = $2;
  aiAnimBehaviour_REPEAT = $3;
  _aiAnimBehaviour_Force32Bit = MaxInt;

type
  PaiNodeAnim = ^TaiNodeAnim;
  TaiNodeAnim = record
    mNodeName: TaiString;
    mNumPositionKeys: dword;
    mPositionKeys: PaiVectorKey;
    mNumRotationKeys: dword;
    mRotationKeys: PaiQuatKey;
    mNumScalingKeys: dword;
    mScalingKeys: PaiVectorKey;
    mPreState: TaiAnimBehaviour;
    mPostState: TaiAnimBehaviour;
  end;

  PaiMeshAnim = ^TaiMeshAnim;
  TaiMeshAnim = record
    mName: TaiString;
    mNumKeys: dword;
    mKeys: PaiMeshKey;
  end;

  PaiMeshMorphAnim = ^TaiMeshMorphAnim;
  TaiMeshMorphAnim = record
    mName: TaiString;
    mNumKeys: dword;
    mKeys: PaiMeshMorphKey;
  end;

  PaiAnimation = ^TaiAnimation;
  TaiAnimation = record
    mName: TaiString;
    mDuration: double;
    mTicksPerSecond: double;
    mNumChannels: dword;
    mChannels: ^PaiNodeAnim;
    mNumMeshChannels: dword;
    mMeshChannels: ^PaiMeshAnim;
    mNumMorphMeshChannels: dword;
    mMorphMeshChannels: ^PaiMeshMorphAnim;
  end;


  // === Konventiert am: 22-11-26 17:00:59 ===


implementation



end.
