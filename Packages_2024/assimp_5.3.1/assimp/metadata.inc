{$IFDEF read_interface}


type
  PaiMetadataType = ^TaiMetadataType;
  TaiMetadataType = longint;
const
  AI_BOOL = 0;
  AI_INT32 = 1;
  AI_UINT64 = 2;
  AI_FLOAT = 3;
  AI_DOUBLE = 4;
  AI_AISTRING = 5;
  AI_AIVECTOR3D = 6;
  AI_AIMETADATA = 7;
  AI_INT64 = 8;
  AI_UINT32 = 9;
  AI_META_MAX = 10;
  FORCE_32BIT = MaxInt;

type
  PaiMetadataEntry = ^TaiMetadataEntry;
  TaiMetadataEntry = record
    mType: TaiMetadataType;
    mData: pointer;
  end;

  PaiMetadata = ^TaiMetadata;
  TaiMetadata = record
    mNumProperties: dword;
    mKeys: PaiString;
    mValues: PaiMetadataEntry;
  end;

  // === Konventiert am: 22-11-26 17:30:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
