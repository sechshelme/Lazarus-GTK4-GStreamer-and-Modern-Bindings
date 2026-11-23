{$IFDEF read_interface}


const
  AI_SCENE_FLAGS_INCOMPLETE = $1;
  AI_SCENE_FLAGS_VALIDATED = $2;
  AI_SCENE_FLAGS_VALIDATION_WARNING = $4;
  AI_SCENE_FLAGS_NON_VERBOSE_FORMAT = $8;
  AI_SCENE_FLAGS_TERRAIN = $10;
  AI_SCENE_FLAGS_ALLOW_SHARED = $20;

type
  PaiScene = ^TaiScene;
  TaiScene = record
    mFlags: dword;
    mRootNode: PaiNode;
    mNumMeshes: dword;
    mMeshes: PPaiMesh;
    mNumMaterials: dword;
    mMaterials: ^PaiMaterial;
    mNumAnimations: dword;
    mAnimations: ^PaiAnimation;
    mNumTextures: dword;
    mTextures: ^PaiTexture;
    mNumLights: dword;
    mLights: ^PaiLight;
    mNumCameras: dword;
    mCameras: ^PaiCamera;
    mMetaData: PaiMetadata;
    mName: TaiString;
    mNumSkeletons: dword;
    mSkeletons:PPaiSkeleton;
    mPrivate: Pchar;
  end;


  // === Konventiert am: 22-11-26 17:34:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
