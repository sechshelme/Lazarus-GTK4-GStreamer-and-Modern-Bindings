unit rfbproto;

interface

uses
  fp_vnc;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PrfbBool = ^TrfbBool;
  TrfbBool = Boolean8;

const
  Z_NULL = nil;
  LIBVNCSERVER_WORDS_BIGENDIAN = 1;

type
  TrfbSocket = longint;

const
  RFB_INVALID_SOCKET = -(1);

type
  PrfbKeySym = ^TrfbKeySym;
  TrfbKeySym = Tuint32_t;

  PrfbPixel = ^TrfbPixel;
  TrfbPixel = Tuint32_t;

  Pin_addr_t = ^Tin_addr_t;
  Tin_addr_t = Tuint32_t;

const
  INADDR_NONE: Tin_addr_t = $ffffffff;
  MAX_ENCODINGS = 64;

type
  TrfbRectangle = record
    x: Tuint16_t;
    y: Tuint16_t;
    w: Tuint16_t;
    h: Tuint16_t;
  end;
  PrfbRectangle = ^TrfbRectangle;

const
  sz_rfbRectangle = 8;

type
  PrfbPixelFormat = ^TrfbPixelFormat;
  TrfbPixelFormat = record
    bitsPerPixel: Tuint8_t;
    depth: Tuint8_t;
    bigEndian: Tuint8_t;
    trueColour: Tuint8_t;
    redMax: Tuint16_t;
    greenMax: Tuint16_t;
    blueMax: Tuint16_t;
    redShift: Tuint8_t;
    greenShift: Tuint8_t;
    blueShift: Tuint8_t;
    pad1: Tuint8_t;
    pad2: Tuint16_t;
  end;

const
  sz_rfbPixelFormat = 16;
  rfbPFFullColors = 0;
  rfbPF256Colors = 1;
  rfbPF64Colors = 2;
  rfbPF8Colors = 3;
  rfbPF8GreyColors = 4;
  rfbPF4GreyColors = 5;
  rfbPF2GreyColors = 6;

  rfbProtocolVersionFormat = 'RFB %03d.%03d\n';
  rfbProtocolMajorVersion = 3;
  rfbProtocolMinorVersion = 8;

type
  PrfbProtocolVersionMsg = ^TrfbProtocolVersionMsg;
  TrfbProtocolVersionMsg = array[0..12] of char;

const
  sz_rfbProtocolVersionMsg = 12;

  rfbSecTypeInvalid = 0;
  rfbSecTypeNone = 1;
  rfbSecTypeVncAuth = 2;

  rfbConnFailed = 0;
  rfbNoAuth = 1;
  rfbVncAuth = 2;
  rfbRA2 = 5;
  rfbRA2ne = 6;
  rfbSSPI = 7;
  rfbSSPIne = 8;
  rfbTight = 16;
  rfbUltra = 17;
  rfbTLS = 18;
  rfbVeNCrypt = 19;
  rfbSASL = 20;
  rfbARD = 30;

  rfbUltraMSLogonI = $70;
  rfbUltraMSLogonII = $71;
  rfbMSLogon = $fffffffa;
  rfbVeNCryptPlain = 256;
  rfbVeNCryptTLSNone = 257;
  rfbVeNCryptTLSVNC = 258;
  rfbVeNCryptTLSPlain = 259;
  rfbVeNCryptX509None = 260;
  rfbVeNCryptX509VNC = 261;
  rfbVeNCryptX509Plain = 262;
  rfbVeNCryptX509SASL = 263;
  rfbVeNCryptTLSSASL = 264;

  rfbVncAuthOK = 0;
  rfbVncAuthFailed = 1;
  rfbVncAuthTooMany = 2;

type
  PrfbClientInitMsg = ^TrfbClientInitMsg;
  TrfbClientInitMsg = record
    shared: Tuint8_t;
  end;

const
  sz_rfbClientInitMsg = 1;

type
  PrfbServerInitMsg = ^TrfbServerInitMsg;
  TrfbServerInitMsg = record
    framebufferWidth: Tuint16_t;
    framebufferHeight: Tuint16_t;
    format: TrfbPixelFormat;
    nameLength: Tuint32_t;
  end;

const
  sz_rfbServerInitMsg = 8 + sz_rfbPixelFormat;

  rfbFramebufferUpdate = 0;
  rfbSetColourMapEntries = 1;
  rfbBell = 2;
  rfbServerCutText = 3;
  rfbResizeFrameBuffer = 4;
  rfbPalmVNCReSizeFrameBuffer = $F;
  rfbSetPixelFormat = 0;
  rfbFixColourMapEntries = 1;
  rfbSetEncodings = 2;
  rfbFramebufferUpdateRequest = 3;
  rfbKeyEvent = 4;
  rfbPointerEvent = 5;
  rfbClientCutText = 6;
  rfbFileTransfer = 7;
  rfbSetScale = 8;
  rfbSetServerInput = 9;
  rfbSetSW = 10;
  rfbTextChat = 11;
  rfbPalmVNCSetScaleFactor = $F;
  rfbXvp = 250;
  rfbSetDesktopSize = 251;
  rfbQemuEvent = 255;

  rfbEncodingRaw = 0;
  rfbEncodingCopyRect = 1;
  rfbEncodingRRE = 2;
  rfbEncodingCoRRE = 4;
  rfbEncodingHextile = 5;
  rfbEncodingZlib = 6;
  rfbEncodingTight = 7;
  rfbEncodingTightPng = $FFFFFEFC;
  rfbEncodingZlibHex = 8;
  rfbEncodingUltra = 9;
  rfbEncodingTRLE = 15;
  rfbEncodingZRLE = 16;
  rfbEncodingZYWRLE = 17;
  rfbEncodingH264 = $48323634;
  rfbEncodingCache = $FFFF0000;
  rfbEncodingCacheEnable = $FFFF0001;
  rfbEncodingXOR_Zlib = $FFFF0002;
  rfbEncodingXORMonoColor_Zlib = $FFFF0003;
  rfbEncodingXORMultiColor_Zlib = $FFFF0004;
  rfbEncodingSolidColor = $FFFF0005;
  rfbEncodingXOREnable = $FFFF0006;
  rfbEncodingCacheZip = $FFFF0007;
  rfbEncodingSolMonoZip = $FFFF0008;
  rfbEncodingUltraZip = $FFFF0009;
  rfbEncodingXvp = $FFFFFECB;
  rfbEncodingFineQualityLevel0 = $FFFFFE00;
  rfbEncodingFineQualityLevel100 = $FFFFFE64;
  rfbEncodingSubsamp1X = $FFFFFD00;
  rfbEncodingSubsamp4X = $FFFFFD01;
  rfbEncodingSubsamp2X = $FFFFFD02;
  rfbEncodingSubsampGray = $FFFFFD03;
  rfbEncodingSubsamp8X = $FFFFFD04;
  rfbEncodingSubsamp16X = $FFFFFD05;
  rfbEncodingCompressLevel0 = $FFFFFF00;
  rfbEncodingCompressLevel1 = $FFFFFF01;
  rfbEncodingCompressLevel2 = $FFFFFF02;
  rfbEncodingCompressLevel3 = $FFFFFF03;
  rfbEncodingCompressLevel4 = $FFFFFF04;
  rfbEncodingCompressLevel5 = $FFFFFF05;
  rfbEncodingCompressLevel6 = $FFFFFF06;
  rfbEncodingCompressLevel7 = $FFFFFF07;
  rfbEncodingCompressLevel8 = $FFFFFF08;
  rfbEncodingCompressLevel9 = $FFFFFF09;
  rfbEncodingXCursor = $FFFFFF10;
  rfbEncodingRichCursor = $FFFFFF11;
  rfbEncodingPointerPos = $FFFFFF18;
  rfbEncodingLastRect = $FFFFFF20;
  rfbEncodingNewFBSize = $FFFFFF21;
  rfbEncodingExtDesktopSize = $FFFFFECC;
  rfbEncodingQualityLevel0 = $FFFFFFE0;
  rfbEncodingQualityLevel1 = $FFFFFFE1;
  rfbEncodingQualityLevel2 = $FFFFFFE2;
  rfbEncodingQualityLevel3 = $FFFFFFE3;
  rfbEncodingQualityLevel4 = $FFFFFFE4;
  rfbEncodingQualityLevel5 = $FFFFFFE5;
  rfbEncodingQualityLevel6 = $FFFFFFE6;
  rfbEncodingQualityLevel7 = $FFFFFFE7;
  rfbEncodingQualityLevel8 = $FFFFFFE8;
  rfbEncodingQualityLevel9 = $FFFFFFE9;
  rfbEncodingQemuExtendedKeyEvent = $FFFFFEFE;
  rfbEncodingExtendedClipboard = $C0A1E5CE;
  rfbEncodingKeyboardLedState = $FFFE0000;
  rfbEncodingSupportedMessages = $FFFE0001;
  rfbEncodingSupportedEncodings = $FFFE0002;
  rfbEncodingServerIdentity = $FFFE0003;

type
  PrfbFramebufferUpdateMsg = ^TrfbFramebufferUpdateMsg;
  TrfbFramebufferUpdateMsg = record
    _type: Tuint8_t;
    pad: Tuint8_t;
    nRects: Tuint16_t;
  end;

const
  sz_rfbFramebufferUpdateMsg = 4;

type
  PrfbFramebufferUpdateRectHeader = ^TrfbFramebufferUpdateRectHeader;
  TrfbFramebufferUpdateRectHeader = record
    r: TrfbRectangle;
    encoding: Tuint32_t;
  end;

const
  sz_rfbFramebufferUpdateRectHeader = sz_rfbRectangle + 4;

type
  PrfbSupportedMessages = ^TrfbSupportedMessages;
  TrfbSupportedMessages = record
    client2server: array[0..31] of Tuint8_t;
    server2client: array[0..31] of Tuint8_t;
  end;

const
  sz_rfbSupportedMessages = 64;

  rfbKeyboardMaskShift = 1;
  rfbKeyboardMaskCapsLock = 2;
  rfbKeyboardMaskControl = 4;
  rfbKeyboardMaskAlt = 8;
  rfbKeyboardMaskMeta = 16;
  rfbKeyboardMaskSuper = 32;
  rfbKeyboardMaskHyper = 64;
  rfbKeyboardMaskNumLock = 128;
  rfbKeyboardMaskScrollLock = 256;
  rfbKeyboardMaskAltGraph = 512;

type
  PrfbCopyRect = ^TrfbCopyRect;
  TrfbCopyRect = record
    srcX: Tuint16_t;
    srcY: Tuint16_t;
  end;

const
  sz_rfbCopyRect = 4;

type
  PrfbRREHeader = ^TrfbRREHeader;
  TrfbRREHeader = record
    nSubrects: Tuint32_t;
  end;

const
  sz_rfbRREHeader = 4;

type
  PrfbCoRRERectangle = ^TrfbCoRRERectangle;
  TrfbCoRRERectangle = record
    x: Tuint8_t;
    y: Tuint8_t;
    w: Tuint8_t;
    h: Tuint8_t;
  end;

const
  sz_rfbCoRRERectangle = 4;

  rfbHextileRaw = 1 shl 0;
  rfbHextileBackgroundSpecified = 1 shl 1;
  rfbHextileForegroundSpecified = 1 shl 2;
  rfbHextileAnySubrects = 1 shl 3;
  rfbHextileSubrectsColoured = 1 shl 4;

function rfbHextilePackXY(x, y: byte): byte;
function rfbHextilePackWH(w, h: byte): byte;
function rfbHextileExtractX(b: byte): byte;
function rfbHextileExtractY(b: byte): byte;
function rfbHextileExtractW(b: byte): byte;
function rfbHextileExtractH(b: byte): byte;

type
  PrfbZlibHeader = ^TrfbZlibHeader;
  TrfbZlibHeader = record
    nBytes: Tuint32_t;
  end;

const
  sz_rfbZlibHeader = 4;

  rfbTightExplicitFilter = $04;
  rfbTightFill = $08;
  rfbTightJpeg = $09;
  rfbTightNoZlib = $0A;
  rfbTightPng = $0A;
  rfbTightMaxSubencoding = $0A;

  rfbTightFilterCopy = $00;
  rfbTightFilterPalette = $01;
  rfbTightFilterGradient = $02;

type
  PrfbXCursorColors = ^TrfbXCursorColors;
  TrfbXCursorColors = record
    foreRed: Tuint8_t;
    foreGreen: Tuint8_t;
    foreBlue: Tuint8_t;
    backRed: Tuint8_t;
    backGreen: Tuint8_t;
    backBlue: Tuint8_t;
  end;

const
  sz_rfbXCursorColors = 6;

type
  PrfbZRLEHeader = ^TrfbZRLEHeader;
  TrfbZRLEHeader = record
    length: Tuint32_t;
  end;

const
  sz_rfbZRLEHeader = 4;
  rfbZRLETileWidth = 64;
  rfbZRLETileHeight = 64;

  rfbHextileZlibRaw = 1 shl 5;
  rfbHextileZlibHex = 1 shl 6;
  rfbHextileZlibMono = 1 shl 7;

type
  PrfbSetColourMapEntriesMsg = ^TrfbSetColourMapEntriesMsg;
  TrfbSetColourMapEntriesMsg = record
    _type: Tuint8_t;
    pad: Tuint8_t;
    firstColour: Tuint16_t;
    nColours: Tuint16_t;
  end;

const
  sz_rfbSetColourMapEntriesMsg = 6;

type
  PrfbBellMsg = ^TrfbBellMsg;
  TrfbBellMsg = record
    _type: Tuint8_t;
  end;

const
  sz_rfbBellMsg = 1;

type
  PrfbServerCutTextMsg = ^TrfbServerCutTextMsg;
  TrfbServerCutTextMsg = record
    _type: Tuint8_t;
    pad1: Tuint8_t;
    pad2: Tuint16_t;
    length: Tuint32_t;
  end;

const
  sz_rfbServerCutTextMsg = 8;

type
  PrfbFileTransferMsg = ^TrfbFileTransferMsg;
  TrfbFileTransferMsg = record
    _type: Tuint8_t;
    contentType: Tuint8_t;
    contentParam: Tuint8_t;
    pad: Tuint8_t;
    size: Tuint32_t;
    length: Tuint32_t;
  end;

const
  sz_rfbFileTransferMsg = 12;
  rfbFileTransferVersion = 2;
  rfbDirContentRequest = 1;
  rfbDirPacket = 2;
  rfbFileTransferRequest = 3;
  rfbFileHeader = 4;
  rfbFilePacket = 5;
  rfbEndOfFile = 6;
  rfbAbortFileTransfer = 7;
  rfbFileTransferOffer = 8;
  rfbFileAcceptHeader = 9;
  rfbCommand = 10;
  rfbCommandReturn = 11;
  rfbFileChecksums = 12;
  rfbFileTransferAccess = 14;

  rfbRDirContent = 1;
  rfbRDrivesList = 2;
  rfbRDirRecursiveList = 3;
  rfbRDirRecursiveSize = 4;

  rfbADirectory = 1;
  rfbAFile = 2;
  rfbADrivesList = 3;
  rfbADirCreate = 4;
  rfbADirDelete = 5;
  rfbAFileCreate = 6;
  rfbAFileDelete = 7;
  rfbAFileRename = 8;
  rfbADirRename = 9;
  rfbADirRecursiveListItem = 10;
  rfbADirRecursiveSize = 11;

  rfbCDirCreate = 1;
  rfbCDirDelete = 2;
  rfbCFileCreate = 3;
  rfbCFileDelete = 4;
  rfbCFileRename = 5;
  rfbCDirRename = 6;

  rfbRErrorUnknownCmd = 1;
  rfbRErrorCmd = $FFFFFFFF;
  sz_rfbBlockSize = 8192;
  rfbZipDirectoryPrefix = '!UVNCDIR-\0';
  sz_rfbZipDirectoryPrefix = 9;
  rfbDirPrefix = '[ ';
  rfbDirSuffix = ' ]';

type
  PrfbTextChatMsg = ^TrfbTextChatMsg;
  TrfbTextChatMsg = record
    _type: Tuint8_t;
    pad1: Tuint8_t;
    pad2: Tuint16_t;
    length: Tuint32_t;
  end;

const
  sz_rfbTextChatMsg = 8;
  rfbTextMaxSize = 4096;
  rfbTextChatOpen = $FFFFFFFF;
  rfbTextChatClose = $FFFFFFFE;
  rfbTextChatFinished = $FFFFFFFD;

type
  PrfbXvpMsg = ^TrfbXvpMsg;
  TrfbXvpMsg = record
    _type: Tuint8_t;
    pad: Tuint8_t;
    version: Tuint8_t;
    code: Tuint8_t;
  end;

const
  sz_rfbXvpMsg = 4;

  rfbXvp_Fail = 0;
  rfbXvp_Init = 1;
  rfbXvp_Shutdown = 2;
  rfbXvp_Reboot = 3;
  rfbXvp_Reset = 4;

type
  PrfbExtDesktopSizeMsg = ^TrfbExtDesktopSizeMsg;
  TrfbExtDesktopSizeMsg = record
    numberOfScreens: Tuint8_t;
    pad: array[0..2] of Tuint8_t;
  end;

  PrfbExtDesktopScreen = ^TrfbExtDesktopScreen;
  TrfbExtDesktopScreen = record
    id: Tuint32_t;
    x: Tuint16_t;
    y: Tuint16_t;
    width: Tuint16_t;
    height: Tuint16_t;
    flags: Tuint32_t;
  end;

const
  sz_rfbExtDesktopSizeMsg = 4;
  sz_rfbExtDesktopScreen = 16;

  rfbExtDesktopSize_GenericChange = 0;
  rfbExtDesktopSize_ClientRequestedChange = 1;
  rfbExtDesktopSize_OtherClientRequestedChange = 2;
  rfbExtDesktopSize_Success = 0;
  rfbExtDesktopSize_ResizeProhibited = 1;
  rfbExtDesktopSize_OutOfResources = 2;
  rfbExtDesktopSize_InvalidScreenLayout = 3;

type
  PrfbSetDesktopSizeMsg = ^TrfbSetDesktopSizeMsg;
  TrfbSetDesktopSizeMsg = record
    _type: Tuint8_t;
    pad1: Tuint8_t;
    width: Tuint16_t;
    height: Tuint16_t;
    numberOfScreens: Tuint8_t;
    pad2: Tuint8_t;
  end;

const
  sz_rfbSetDesktopSizeMsg = 8;

type
  PrfbResizeFrameBufferMsg = ^TrfbResizeFrameBufferMsg;
  TrfbResizeFrameBufferMsg = record
    _type: Tuint8_t;
    pad1: Tuint8_t;
    framebufferWidth: Tuint16_t;
    framebufferHeigth: Tuint16_t;
  end;

const
  sz_rfbResizeFrameBufferMsg = 6;

type
  PrfbPalmVNCReSizeFrameBufferMsg = ^TrfbPalmVNCReSizeFrameBufferMsg;
  TrfbPalmVNCReSizeFrameBufferMsg = record
    _type: Tuint8_t;
    pad1: Tuint8_t;
    desktop_w: Tuint16_t;
    desktop_h: Tuint16_t;
    buffer_w: Tuint16_t;
    buffer_h: Tuint16_t;
    pad2: Tuint16_t;
  end;

const
  sz_rfbPalmVNCReSizeFrameBufferMsg = 12;

type
  PrfbServerToClientMsg = ^TrfbServerToClientMsg;
  TrfbServerToClientMsg = record
    case longint of
      0: (_type: Tuint8_t);
      1: (fu: TrfbFramebufferUpdateMsg);
      2: (scme: TrfbSetColourMapEntriesMsg);
      3: (b: TrfbBellMsg);
      4: (sct: TrfbServerCutTextMsg);
      5: (rsfb: TrfbResizeFrameBufferMsg);
      6: (prsfb: TrfbPalmVNCReSizeFrameBufferMsg);
      7: (ft: TrfbFileTransferMsg);
      8: (tc: TrfbTextChatMsg);
      9: (xvp: TrfbXvpMsg);
      10: (eds: TrfbExtDesktopSizeMsg);
  end;

  PrfbCacheRect = ^TrfbCacheRect;
  TrfbCacheRect = record
    special: Tuint16_t;
  end;

const
  sz_rfbCacheRect = 2;

type
  PrfbSetPixelFormatMsg = ^TrfbSetPixelFormatMsg;
  TrfbSetPixelFormatMsg = record
    _type: Tuint8_t;
    pad1: Tuint8_t;
    pad2: Tuint16_t;
    format: TrfbPixelFormat;
  end;

const
  sz_rfbSetPixelFormatMsg = sz_rfbPixelFormat + 4;

type
  PrfbFixColourMapEntriesMsg = ^TrfbFixColourMapEntriesMsg;
  TrfbFixColourMapEntriesMsg = record
    _type: Tuint8_t;
    pad: Tuint8_t;
    firstColour: Tuint16_t;
    nColours: Tuint16_t;
  end;

const
  sz_rfbFixColourMapEntriesMsg = 6;

type
  PrfbSetEncodingsMsg = ^TrfbSetEncodingsMsg;
  TrfbSetEncodingsMsg = record
    _type: Tuint8_t;
    pad: Tuint8_t;
    nEncodings: Tuint16_t;
  end;

const
  sz_rfbSetEncodingsMsg = 4;

type
  PrfbFramebufferUpdateRequestMsg = ^TrfbFramebufferUpdateRequestMsg;
  TrfbFramebufferUpdateRequestMsg = record
    _type: Tuint8_t;
    incremental: Tuint8_t;
    x: Tuint16_t;
    y: Tuint16_t;
    w: Tuint16_t;
    h: Tuint16_t;
  end;

const
  sz_rfbFramebufferUpdateRequestMsg = 10;

type
  PrfbKeyEventMsg = ^TrfbKeyEventMsg;
  TrfbKeyEventMsg = record
    _type: Tuint8_t;
    down: Tuint8_t;
    pad: Tuint16_t;
    key: Tuint32_t;
  end;

const
  sz_rfbKeyEventMsg = 8;

type
  PrfbQemuExtendedKeyEventMsg = ^TrfbQemuExtendedKeyEventMsg;
  TrfbQemuExtendedKeyEventMsg = record
    _type: Tuint8_t;
    subtype: Tuint8_t;
    down: Tuint16_t;
    keysym: Tuint32_t;
    keycode: Tuint32_t;
  end;

const
  sz_rfbQemuExtendedKeyEventMsg = 12;

type
  PrfbPointerEventMsg = ^TrfbPointerEventMsg;
  TrfbPointerEventMsg = record
    _type: Tuint8_t;
    buttonMask: Tuint8_t;
    x: Tuint16_t;
    y: Tuint16_t;
  end;

const
  rfbButton1Mask = 1;
  rfbButton2Mask = 2;
  rfbButton3Mask = 4;
  rfbButton4Mask = 8;
  rfbButton5Mask = 16;

  rfbWheelUpMask = rfbButton4Mask;
  rfbWheelDownMask = rfbButton5Mask;
  sz_rfbPointerEventMsg = 6;

type
  PrfbClientCutTextMsg = ^TrfbClientCutTextMsg;
  TrfbClientCutTextMsg = record
    _type: Tuint8_t;
    pad1: Tuint8_t;
    pad2: Tuint16_t;
    length: Tuint32_t;
  end;

const
  rfbExtendedClipboard_Text = 1;
  rfbExtendedClipboard_RTF = 2;
  rfbExtendedClipboard_HTML = 4;
  rfbExtendedClipboard_DIB = 8;
  rfbExtendedClipboard_Files = 16;
  rfbExtendedClipboard_Caps = 1 shl 24;
  rfbExtendedClipboard_Request = 1 shl 25;
  rfbExtendedClipboard_Peek = 1 shl 26;
  rfbExtendedClipboard_Notify = 1 shl 27;
  rfbExtendedClipboard_Provide = 1 shl 28;

  sz_rfbClientCutTextMsg = 8;

type
  PrfbSetScaleMsg = ^TrfbSetScaleMsg;
  TrfbSetScaleMsg = record
    _type: Tuint8_t;
    scale: Tuint8_t;
    pad: Tuint16_t;
  end;

const
  sz_rfbSetScaleMsg = 4;

type
  PrfbPalmVNCSetScaleFactorMsg = ^TrfbPalmVNCSetScaleFactorMsg;
  TrfbPalmVNCSetScaleFactorMsg = record
    _type: Tuint8_t;
    scale: Tuint8_t;
    pad2: Tuint16_t;
  end;

const
  sz_rfbPalmVNCSetScaleFactorMsg = 4;

type
  PrfbSetServerInputMsg = ^TrfbSetServerInputMsg;
  TrfbSetServerInputMsg = record
    _type: Tuint8_t;
    status: Tuint8_t;
    pad: Tuint16_t;
  end;

const
  sz_rfbSetServerInputMsg = 4;

type
  PrfbSetSWMsg = ^TrfbSetSWMsg;
  TrfbSetSWMsg = record
    _type: Tuint8_t;
    status: Tuint8_t;
    x: Tuint16_t;
    y: Tuint16_t;
  end;

const
  sz_rfbSetSWMsg = 6;

type
  PrfbClientToServerMsg = ^TrfbClientToServerMsg;
  TrfbClientToServerMsg = record
    case longint of
      0: (_type: Tuint8_t);
      1: (spf: TrfbSetPixelFormatMsg);
      2: (fcme: TrfbFixColourMapEntriesMsg);
      3: (se: TrfbSetEncodingsMsg);
      4: (fur: TrfbFramebufferUpdateRequestMsg);
      5: (ke: TrfbKeyEventMsg);
      6: (pe: TrfbPointerEventMsg);
      7: (cct: TrfbClientCutTextMsg);
      8: (ssc: TrfbSetScaleMsg);
      9: (pssf: TrfbPalmVNCSetScaleFactorMsg);
      10: (sim: TrfbSetServerInputMsg);
      11: (ft: TrfbFileTransferMsg);
      12: (sw: TrfbSetSWMsg);
      13: (tc: TrfbTextChatMsg);
      14: (xvp: TrfbXvpMsg);
      15: (sdm: TrfbSetDesktopSizeMsg);
  end;

const
  MAXPWLEN = 8;
  CHALLENGESIZE = 16;

function rfbEncryptAndStorePasswd(passwd: pchar; fname: pchar): longint; cdecl; external libvncserver;
function rfbDecryptPasswdFromFile(fname: pchar): pchar; cdecl; external libvncserver;
procedure rfbRandomBytes(bytes: pbyte); cdecl; external libvncserver;
procedure rfbEncryptBytes(bytes: pbyte; passwd: pchar); cdecl; external libvncserver;

// === Konventiert am: 23-10-26 15:24:34 ===


implementation

function rfbHextilePackXY(x, y: byte): byte;
begin
  rfbHextilePackXY := (x shl 4) or y;
end;

function rfbHextilePackWH(w, h: byte): byte;
begin
  rfbHextilePackWH := ((w - 1) shl 4) or (h - 1);
end;

function rfbHextileExtractX(b: byte): byte;
begin
  rfbHextileExtractX := b shr 4;
end;

function rfbHextileExtractY(b: byte): byte;
begin
  rfbHextileExtractY := b and $f;
end;

function rfbHextileExtractW(b: byte): byte;
begin
  rfbHextileExtractW := b shr 4 + 1;
end;

function rfbHextileExtractH(b: byte): byte;
begin
  rfbHextileExtractH := b and $f + 1;
end;


end.
