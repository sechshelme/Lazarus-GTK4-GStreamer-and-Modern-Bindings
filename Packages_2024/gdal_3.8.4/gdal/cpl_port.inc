{$IFDEF read_interface}


type
  PGInt32 = ^TGInt32;
  TGInt32 = int32;

  PGUInt32 = ^TGUInt32;
  TGUInt32 = uint32;

  PGInt16 = ^TGInt16;
  TGInt16 = int16;

  PGUInt16 = ^TGUInt16;
  TGUInt16 = uint16;

  PPGByte = ^PGByte;
  PGByte = ^TGByte;
  TGByte = byte;

  PGInt8 = ^TGInt8;
  TGInt8 = char;

type
  PGBool = ^TGBool;
  TGBool = Boolean32;

type
  PGIntBig = ^TGIntBig;
  TGIntBig = int64;

  PPGUIntBig = ^PGUIntBig;
  PGUIntBig = ^TGUIntBig;
  TGUIntBig = uint64;

const
  CPL_HAS_GINT64 = 1;

type
  PGInt64 = ^TGInt64;
  TGInt64 = TGIntBig;

  PGUInt64 = ^TGUInt64;
  TGUInt64 = TGUIntBig;

type
  PGPtrDiff_t = ^TGPtrDiff_t;
  TGPtrDiff_t = TGIntBig;

  TCSLConstList = PPChar;

  // === Konventiert am: 2-10-26 17:19:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
