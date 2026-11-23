unit texture;

interface

uses
  fp_assimp, types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  AI_EMBEDDED_TEXNAME_PREFIX = '*';

type
  PaiTexel = ^TaiTexel;
  TaiTexel = record
    b: byte;
    g: byte;
    r: byte;
    a: byte;
  end;

const
  HINTMAXTEXTURELEN = 9;

type
  PaiTexture = ^TaiTexture;
  TaiTexture = record
    mWidth: dword;
    mHeight: dword;
    achFormatHint: array[0..(HINTMAXTEXTURELEN) - 1] of char;
    pcData: PaiTexel;
    mFilename: TaiString;
  end;

  // === Konventiert am: 22-11-26 17:34:17 ===


implementation



end.
