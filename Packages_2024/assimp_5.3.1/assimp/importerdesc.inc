{$IFDEF read_interface}


type
  TaiImporterFlags = longint;
const
  aiImporterFlags_SupportTextFlavour = $1;
  aiImporterFlags_SupportBinaryFlavour = $2;
  aiImporterFlags_SupportCompressedFlavour = $4;
  aiImporterFlags_LimitedSupport = $8;
  aiImporterFlags_Experimental = $10;

type
  PaiImporterDesc = ^TaiImporterDesc;
  TaiImporterDesc = record
    mName: Pchar;
    mAuthor: Pchar;
    mMaintainer: Pchar;
    mComments: Pchar;
    mFlags: dword;
    mMinMajor: dword;
    mMinMinor: dword;
    mMaxMajor: dword;
    mMaxMinor: dword;
    mFileExtensions: Pchar;
  end;

function aiGetImporterDesc(extension: Pchar): PaiImporterDesc; cdecl; external libassimp;

// === Konventiert am: 22-11-26 17:15:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
