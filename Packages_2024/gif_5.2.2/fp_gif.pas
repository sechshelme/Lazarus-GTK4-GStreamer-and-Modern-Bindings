unit fp_gif;

interface

const
  {$IFDEF Linux}
  libgif = 'gif';
  {$ENDIF}

  {$IFDEF Windows}
  libgif = 'libgif-7.dll';
  {$ENDIF}

type
  Tsize_t = SizeUInt;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  _GIF_LIB_H_ = 1;
  GIFLIB_MAJOR = 5;
  GIFLIB_MINOR = 2;
  GIFLIB_RELEASE = 2;
  GIF_ERROR = 0;
  GIF_OK = 1;

const
  GIF_STAMP = 'GIFVER';
  GIF_STAMP_LEN = sizeof(GIF_STAMP);

const
  GIF_VERSION_POS = 3;
  GIF87_STAMP = 'GIF87a';
  GIF89_STAMP = 'GIF89a';

type
  PGifPixelType = ^TGifPixelType;
  TGifPixelType = byte;

  PGifRowType = ^TGifRowType;
  TGifRowType = pbyte;

  PPGifByteType = ^PGifByteType;
  PGifByteType = ^TGifByteType;
  TGifByteType = byte;

  PGifPrefixType = ^TGifPrefixType;
  TGifPrefixType = dword;

  PGifWord = ^TGifWord;
  TGifWord = longint;

  PGifColorType = ^TGifColorType;
  TGifColorType = record
    Red: TGifByteType;
    Green: TGifByteType;
    Blue: TGifByteType;
  end;

  PColorMapObject = ^TColorMapObject;
  TColorMapObject = record
    ColorCount: longint;
    BitsPerPixel: longint;
    SortFlag: boolean;
    Colors: PGifColorType;
  end;

  PGifImageDesc = ^TGifImageDesc;
  TGifImageDesc = record
    Left: TGifWord;
    Top: TGifWord;
    Width: TGifWord;
    Height: TGifWord;
    Interlace: boolean;
    ColorMap: PColorMapObject;
  end;

const
  CONTINUE_EXT_FUNC_CODE = $00;
  COMMENT_EXT_FUNC_CODE = $fe;
  GRAPHICS_EXT_FUNC_CODE = $f9;
  PLAINTEXT_EXT_FUNC_CODE = $01;
  APPLICATION_EXT_FUNC_CODE = $ff;

type
  PPExtensionBlock = ^PExtensionBlock;
  PExtensionBlock = ^TExtensionBlock;
  TExtensionBlock = record
    ByteCount: longint;
    Bytes: PGifByteType;
    _Function: longint;
  end;

  PSavedImage = ^TSavedImage;
  TSavedImage = record
    ImageDesc: TGifImageDesc;
    RasterBits: PGifByteType;
    ExtensionBlockCount: longint;
    ExtensionBlocks: PExtensionBlock;
  end;

  PGifFileType = ^TGifFileType;
  TGifFileType = record
    SWidth: TGifWord;
    SHeight: TGifWord;
    SColorResolution: TGifWord;
    SBackGroundColor: TGifWord;
    AspectByte: TGifByteType;
    SColorMap: PColorMapObject;
    ImageCount: longint;
    Image: TGifImageDesc;
    SavedImages: PSavedImage;
    ExtensionBlockCount: longint;
    ExtensionBlocks: PExtensionBlock;
    Error: longint;
    UserData: pointer;
    Private_: pointer;
  end;

function GIF_ASPECT_RATIO(n: double): double;

type
  PGifRecordType = ^TGifRecordType;
  TGifRecordType = longint;
const
  UNDEFINED_RECORD_TYPE = 0;
  SCREEN_DESC_RECORD_TYPE = 1;
  IMAGE_DESC_RECORD_TYPE = 2;
  EXTENSION_RECORD_TYPE = 3;
  TERMINATE_RECORD_TYPE = 4;

type
  TInputFunc = function(para1: PGifFileType; para2: PGifByteType; para3: longint): longint; cdecl;
  TOutputFunc = function(para1: PGifFileType; para2: PGifByteType; para3: longint): longint; cdecl;

const
  DISPOSAL_UNSPECIFIED = 0;
  DISPOSE_DO_NOT = 1;
  DISPOSE_BACKGROUND = 2;
  DISPOSE_PREVIOUS = 3;
  NO_TRANSPARENT_COLOR = -(1);

type
  PGraphicsControlBlock = ^TGraphicsControlBlock;
  TGraphicsControlBlock = record
    DisposalMode: longint;
    UserInputFlag: boolean;
    DelayTime: longint;
    TransparentColor: longint;
  end;

function EGifOpenFileName(GifFileName: pchar; GifTestExistence: boolean; Error: Plongint): PGifFileType; cdecl; external libgif;
function EGifOpenFileHandle(GifFileHandle: longint; Error: Plongint): PGifFileType; cdecl; external libgif;
function EGifOpen(userPtr: pointer; writeFunc: TOutputFunc; Error: Plongint): PGifFileType; cdecl; external libgif;
function EGifSpew(GifFile: PGifFileType): longint; cdecl; external libgif;
function EGifGetGifVersion(GifFile: PGifFileType): pchar; cdecl; external libgif;
function EGifCloseFile(GifFile: PGifFileType; ErrorCode: Plongint): longint; cdecl; external libgif;

const
  E_GIF_SUCCEEDED = 0;
  E_GIF_ERR_OPEN_FAILED = 1;
  E_GIF_ERR_WRITE_FAILED = 2;
  E_GIF_ERR_HAS_SCRN_DSCR = 3;
  E_GIF_ERR_HAS_IMAG_DSCR = 4;
  E_GIF_ERR_NO_COLOR_MAP = 5;
  E_GIF_ERR_DATA_TOO_BIG = 6;
  E_GIF_ERR_NOT_ENOUGH_MEM = 7;
  E_GIF_ERR_DISK_IS_FULL = 8;
  E_GIF_ERR_CLOSE_FAILED = 9;
  E_GIF_ERR_NOT_WRITEABLE = 10;

function EGifPutScreenDesc(GifFile: PGifFileType; GifWidth: longint; GifHeight: longint; GifColorRes: longint; GifBackGround: longint;
  GifColorMap: PColorMapObject): longint; cdecl; external libgif;
function EGifPutImageDesc(GifFile: PGifFileType; GifLeft: longint; GifTop: longint; GifWidth: longint; GifHeight: longint;
  GifInterlace: boolean; GifColorMap: PColorMapObject): longint; cdecl; external libgif;
procedure EGifSetGifVersion(GifFile: PGifFileType; gif89: boolean); cdecl; external libgif;
function EGifPutLine(GifFile: PGifFileType; GifLine: PGifPixelType; GifLineLen: longint): longint; cdecl; external libgif;
function EGifPutPixel(GifFile: PGifFileType; GifPixel: TGifPixelType): longint; cdecl; external libgif;
function EGifPutComment(GifFile: PGifFileType; GifComment: pchar): longint; cdecl; external libgif;
function EGifPutExtensionLeader(GifFile: PGifFileType; GifExtCode: longint): longint; cdecl; external libgif;
function EGifPutExtensionBlock(GifFile: PGifFileType; GifExtLen: longint; GifExtension: pointer): longint; cdecl; external libgif;
function EGifPutExtensionTrailer(GifFile: PGifFileType): longint; cdecl; external libgif;
function EGifPutExtension(GifFile: PGifFileType; GifExtCode: longint; GifExtLen: longint; GifExtension: pointer): longint; cdecl; external libgif;
function EGifPutCode(GifFile: PGifFileType; GifCodeSize: longint; GifCodeBlock: PGifByteType): longint; cdecl; external libgif;
function EGifPutCodeNext(GifFile: PGifFileType; GifCodeBlock: PGifByteType): longint; cdecl; external libgif;

function DGifOpenFileName(GifFileName: pchar; Error: Plongint): PGifFileType; cdecl; external libgif;
function DGifOpenFileHandle(GifFileHandle: longint; Error: Plongint): PGifFileType; cdecl; external libgif;
function DGifSlurp(GifFile: PGifFileType): longint; cdecl; external libgif;
function DGifOpen(userPtr: pointer; readFunc: TInputFunc; Error: Plongint): PGifFileType; cdecl; external libgif;
function DGifCloseFile(GifFile: PGifFileType; ErrorCode: Plongint): longint; cdecl; external libgif;

const
  D_GIF_SUCCEEDED = 0;
  D_GIF_ERR_OPEN_FAILED = 101;
  D_GIF_ERR_READ_FAILED = 102;
  D_GIF_ERR_NOT_GIF_FILE = 103;
  D_GIF_ERR_NO_SCRN_DSCR = 104;
  D_GIF_ERR_NO_IMAG_DSCR = 105;
  D_GIF_ERR_NO_COLOR_MAP = 106;
  D_GIF_ERR_WRONG_RECORD = 107;
  D_GIF_ERR_DATA_TOO_BIG = 108;
  D_GIF_ERR_NOT_ENOUGH_MEM = 109;
  D_GIF_ERR_CLOSE_FAILED = 110;
  D_GIF_ERR_NOT_READABLE = 111;
  D_GIF_ERR_IMAGE_DEFECT = 112;
  D_GIF_ERR_EOF_TOO_SOON = 113;

function DGifGetScreenDesc(GifFile: PGifFileType): longint; cdecl; external libgif;
function DGifGetRecordType(GifFile: PGifFileType; GifType: PGifRecordType): longint; cdecl; external libgif;
function DGifGetImageHeader(GifFile: PGifFileType): longint; cdecl; external libgif;
function DGifGetImageDesc(GifFile: PGifFileType): longint; cdecl; external libgif;
function DGifGetLine(GifFile: PGifFileType; GifLine: PGifPixelType; GifLineLen: longint): longint; cdecl; external libgif;
function DGifGetPixel(GifFile: PGifFileType; GifPixel: TGifPixelType): longint; cdecl; external libgif;
function DGifGetExtension(GifFile: PGifFileType; GifExtCode: Plongint; GifExtension: PPGifByteType): longint; cdecl; external libgif;
function DGifGetExtensionNext(GifFile: PGifFileType; GifExtension: PPGifByteType): longint; cdecl; external libgif;
function DGifGetCode(GifFile: PGifFileType; GifCodeSize: Plongint; GifCodeBlock: PPGifByteType): longint; cdecl; external libgif;
function DGifGetCodeNext(GifFile: PGifFileType; GifCodeBlock: PPGifByteType): longint; cdecl; external libgif;
function DGifGetLZCodes(GifFile: PGifFileType; GifCode: Plongint): longint; cdecl; external libgif;
function DGifGetGifVersion(GifFile: PGifFileType): pchar; cdecl; external libgif;

function GifQuantizeBuffer(Width: dword; Height: dword; ColorMapSize: Plongint; RedInput: PGifByteType; GreenInput: PGifByteType;
  BlueInput: PGifByteType; OutputBuffer: PGifByteType; OutputColorMap: PGifColorType): longint; cdecl; external libgif;

function GifErrorString(ErrorCode: longint): pchar; cdecl; external libgif;

function GifMakeMapObject(ColorCount: longint; ColorMap: PGifColorType): PColorMapObject; cdecl; external libgif;
procedure GifFreeMapObject(Obj: PColorMapObject); cdecl; external libgif;
function GifUnionColorMap(ColorIn1: PColorMapObject; ColorIn2: PColorMapObject; ColorTransIn2: PGifPixelType): PColorMapObject; cdecl; external libgif;
function GifBitSize(n: longint): longint; cdecl; external libgif;

procedure GifApplyTranslation(Image: PSavedImage; Translation: PGifPixelType); cdecl; external libgif;
function GifAddExtensionBlock(ExtensionBlock_Count: Plongint; ExtensionBlocks: PPExtensionBlock; _Function: longint; Len: dword; ExtData: pbyte): longint; cdecl; external libgif;
procedure GifFreeExtensions(ExtensionBlock_Count: Plongint; ExtensionBlocks: PPExtensionBlock); cdecl; external libgif;
function GifMakeSavedImage(GifFile: PGifFileType; CopyFrom: PSavedImage): PSavedImage; cdecl; external libgif;
procedure GifFreeSavedImages(GifFile: PGifFileType); cdecl; external libgif;

function DGifExtensionToGCB(GifExtensionLength: Tsize_t; GifExtension: PGifByteType; GCB: PGraphicsControlBlock): longint; cdecl; external libgif;
function EGifGCBToExtension(GCB: PGraphicsControlBlock; GifExtension: PGifByteType): Tsize_t; cdecl; external libgif;
function DGifSavedExtensionToGCB(GifFile: PGifFileType; ImageIndex: longint; GCB: PGraphicsControlBlock): longint; cdecl; external libgif;
function EGifGCBToSavedExtension(GCB: PGraphicsControlBlock; GifFile: PGifFileType; ImageIndex: longint): longint; cdecl; external libgif;

const
  GIF_FONT_WIDTH = 8;
  GIF_FONT_HEIGHT = 8;

procedure GifDrawText8x8(Image: PSavedImage; x: longint; y: longint; legend: pchar; color: longint); cdecl; external libgif;
procedure GifDrawBox(Image: PSavedImage; x: longint; y: longint; w: longint; d: longint;
  color: longint); cdecl; external libgif;
procedure GifDrawRectangle(Image: PSavedImage; x: longint; y: longint; w: longint; d: longint;
  color: longint); cdecl; external libgif;
procedure GifDrawBoxedText8x8(Image: PSavedImage; x: longint; y: longint; legend: pchar; border: longint;
  bg: longint; fg: longint); cdecl; external libgif;

// === Konventiert am: 28-9-26 16:56:45 ===


implementation

function GIF_ASPECT_RATIO(n: double): double;
begin
  GIF_ASPECT_RATIO := n + 15.0 / 64.0;
end;


end.
