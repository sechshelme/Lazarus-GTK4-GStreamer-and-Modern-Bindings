unit rfbclient;

interface

uses
  fp_vnc, rfbproto;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  FLASH_PORT_OFFSET = 5400;
  LISTEN_PORT_OFFSET = 5500;
  TUNNEL_PORT_OFFSET = 5500;
  SERVER_PORT_OFFSET = 5900;
  DEFAULT_CONNECT_TIMEOUT = 60;
  DEFAULT_READ_TIMEOUT = 0;
  DEFAULT_SSH_CMD = '/usr/bin/ssh';
  DEFAULT_TUNNEL_CMD = DEFAULT_SSH_CMD + ' -f -L %L:localhost:%R %H sleep 20';
  DEFAULT_VIA_CMD = DEFAULT_SSH_CMD + ' -f -L %L:%H:%R %G sleep 20';

type
  PrfbVNCRec = ^TrfbVNCRec;
  TrfbVNCRec = record
    file_: PFILE;
    tv: Ttimeval;
    readTimestamp: TrfbBool;
    doNotSleep: TrfbBool;
  end;

  PrfbClientData = ^TrfbClientData;
  TrfbClientData = record
    tag: pointer;
    data: pointer;
    next: PrfbClientData;
  end;

  PAppData = ^TAppData;
  TAppData = record
    shareDesktop: TrfbBool;
    viewOnly: TrfbBool;
    encodingsString: pchar;
    useBGR233: TrfbBool;
    nColours: longint;
    forceOwnCmap: TrfbBool;
    forceTrueColour: TrfbBool;
    requestedDepth: longint;
    compressLevel: longint;
    qualityLevel: longint;
    enableJPEG: TrfbBool;
    useRemoteCursor: TrfbBool;
    palmVNC: TrfbBool;
    scaleSetting: longint;
  end;

  PrfbCredential = ^TrfbCredential;
  TrfbCredential = record
    case longint of
      0: (x509Credential: record
          x509CACertFile: pchar;
          x509CACrlFile: pchar;
          x509ClientCertFile: pchar;
          x509ClientKeyFile: pchar;
          x509CrlVerifyMode: Tuint8_t;
          end);
      1: (userCredential: record
          username: pchar;
          password: pchar;
          end);
  end;

const
  rfbCredentialTypeX509 = 1;
  rfbCredentialTypeUser = 2;
  rfbX509CrlVerifyNone = 0;
  rfbX509CrlVerifyClient = 1;
  rfbX509CrlVerifyAll = 2;

const
  RFB_BUFFER_SIZE = 640 * 480;
  RFB_BUF_SIZE = 8192;
  ZLIB_BUFFER_SIZE = 30000;
  TIGHT_GRADIENT_MAX_WIDTH = 2048;

type
  PrfbClient = ^TrfbClient;
  PrfbClientRec = PrfbClient;

  THandleTextChatProc = procedure(client: PrfbClient; value: longint; text: pchar); cdecl;
  THandleXvpMsgProc = procedure(client: PrfbClient; version: Tuint8_t; opcode: Tuint8_t); cdecl;
  THandleKeyboardLedStateProc = procedure(client: PrfbClient; value: longint; pad: longint); cdecl;
  THandleCursorPosProc = function(client: PrfbClient; x: longint; y: longint): TrfbBool; cdecl;
  TSoftCursorLockAreaProc = procedure(client: PrfbClient; x: longint; y: longint; w: longint; h: longint); cdecl;
  TSoftCursorUnlockScreenProc = procedure(client: PrfbClient); cdecl;
  TGotFrameBufferUpdateProc = procedure(client: PrfbClient; x: longint; y: longint; w: longint; h: longint); cdecl;
  TFinishedFrameBufferUpdateProc = procedure(client: PrfbClient); cdecl;
  TGetPasswordProc = function(client: PrfbClient): pchar; cdecl;
  TGetCredentialProc = function(client: PrfbClient; credentialType: longint): PrfbCredential; cdecl;
  TMallocFrameBufferProc = function(client: PrfbClient): TrfbBool; cdecl;
  TGotXCutTextProc = procedure(client: PrfbClient; text: pchar; textlen: longint); cdecl;
  TBellProc = procedure(client: PrfbClient); cdecl;
  TGotCursorShapeProc = procedure(client: PrfbClient; xhot: longint; yhot: longint; width: longint; height: longint; bytesPerPixel: longint); cdecl;
  TGotCopyRectProc = procedure(client: PrfbClient; src_x: longint; src_y: longint; w: longint; h: longint; dest_x: longint; dest_y: longint); cdecl;
  TGotFillRectProc = procedure(client: PrfbClient; x: longint; y: longint; w: longint; h: longint; colour: Tuint32_t); cdecl;
  TGotBitmapProc = procedure(client: PrfbClient; buffer: Puint8_t; x: longint; y: longint; w: longint; h: longint); cdecl;
  TGotJpegProc = function(client: PrfbClient; buffer: Puint8_t; length: longint; x: longint; y: longint; w: longint; h: longint): TrfbBool; cdecl;
  TLockWriteToTLSProc = function(client: PrfbClient): TrfbBool; cdecl;
  TUnlockWriteToTLSProc = function(client: PrfbClient): TrfbBool; cdecl;
  TGetUserProc = function(client: PrfbClient): pchar; cdecl;
  TGetSASLMechanismProc = function(client: PrfbClient; mechlist: pchar): pchar; cdecl;

  // Pads eingefügt
  TrfbClient = record
    frameBuffer: Puint8_t;
    width: longint;
    height: longint;
    endianTest: longint;
    appData: TAppData;
    programName: pchar;
    serverHost: pchar;
    serverPort: longint;
    listenSpecified: TrfbBool;
    listenPort: longint;
    flashPort: longint;
    updateRect: record
      x: longint;
      y: longint;
      w: longint;
      h: longint;
      end;
    buffer: array[0..(RFB_BUFFER_SIZE) - 1] of char;
    sock: TrfbSocket;
    canUseCoRRE: TrfbBool;
    canUseHextile: TrfbBool;
    desktopName: pchar;
    format: TrfbPixelFormat;
    si: TrfbServerInitMsg;
    buf: array[0..(RFB_BUF_SIZE) - 1] of char;
    bufoutptr: pchar;
    buffered: dword;
    ultra_buffer_size: longint;
    ultra_buffer: pchar;
    raw_buffer_size: longint;
    raw_buffer: pchar;
    decompStream: Tz_stream;
    decompStreamInited: TrfbBool;
    zlib_buffer: array[0..(ZLIB_BUFFER_SIZE) - 1] of char;
    pad1___: array[0..6] of byte;
    zlibStream: array[0..3] of Tz_stream;
    zlibStreamActive: array[0..3] of TrfbBool;
    cutZeros: TrfbBool;
    rectWidth: longint;
    rectColors: longint;
    tightPalette: array[0..(256 * 4) - 1] of char;
    tightPrevRow: array[0..((TIGHT_GRADIENT_MAX_WIDTH * 3) * (sizeof(Tuint16_t))) - 1] of Tuint8_t;
    jpegError: TrfbBool;
    jpegSrcManager: Pjpeg_source_mgr;
    jpegBufferPtr: pointer;
    jpegBufferLen: Tsize_t;
    rcSource: Puint8_t;
    rcMask: Puint8_t;
    clientData: PrfbClientData;
    vncRec: PrfbVNCRec;
    KeyboardLedStateEnabled: longint;
    CurrentKeyboardLedState: longint;
    canHandleNewFBSize: longint;
    HandleTextChat: THandleTextChatProc;
    HandleKeyboardLedState: THandleKeyboardLedStateProc;
    HandleCursorPos: THandleCursorPosProc;
    SoftCursorLockArea: TSoftCursorLockAreaProc;
    SoftCursorUnlockScreen: TSoftCursorUnlockScreenProc;
    GotFrameBufferUpdate: TGotFrameBufferUpdateProc;
    GetPassword: TGetPasswordProc;
    MallocFrameBuffer: TMallocFrameBufferProc;
    GotXCutText: TGotXCutTextProc;
    Bell: TBellProc;
    GotCursorShape: TGotCursorShapeProc;
    GotCopyRect: TGotCopyRectProc;
    supportedMessages: TrfbSupportedMessages;
    major: longint;
    minor: longint;
    authScheme: Tuint32_t;
    subAuthScheme: Tuint32_t;
    tlsSession: pointer;
    GetCredential: TGetCredentialProc;
    clientAuthSchemes: Puint32_t;
    destHost: pchar;
    destPort: longint;
    QoS_DSCP: longint;
    HandleXvpMsg: THandleXvpMsgProc;
    listenSock: TrfbSocket;
    FinishedFrameBufferUpdate: TFinishedFrameBufferUpdateProc;
    listenAddress: pchar;
    listen6Sock: TrfbSocket;
    listen6Address: pchar;
    listen6Port: longint;
    pad2___: array[0..2] of byte;
    outputWindow: dword;
    LockWriteToTLS: TLockWriteToTLSProc;
    UnlockWriteToTLS: TUnlockWriteToTLSProc;
    GotFillRect: TGotFillRectProc;
    GotBitmap: TGotBitmapProc;
    GotJpeg: TGotJpegProc;
    saslconn: Psasl_conn_t;
    saslDecoded: pchar;
    saslDecodedLength: dword;
    saslDecodedOffset: dword;
    saslSecret: Psasl_secret_t;
    GetSASLMechanism: TGetSASLMechanismProc;
    GetUser: TGetUserProc;
    tjhnd: pointer;
    connectTimeout: dword;
    readTimeout: dword;
    tlsRwMutex: TMUTEX;
    requestedResize: TrfbBool;
    screen: TrfbExtDesktopScreen;
  end;

function HandleCursorShape(client: PrfbClient; xhot: longint; yhot: longint; width: longint; height: longint;
  enc: Tuint32_t): TrfbBool; cdecl; external libvncclient;
procedure listenForIncomingConnections(viewer: PrfbClient); cdecl; external libvncclient;
function listenForIncomingConnectionsNoFork(viewer: PrfbClient; usec_timeout: longint): longint; cdecl; external libvncclient;

var
  rfbEnableClientLogging: TrfbBool; cvar;external libvncclient;

type
  TrfbClientLogProc = procedure(format: pchar; args: array of const); cdecl;

var
  rfbClientLog: TrfbClientLogProc; cvar;external libvncclient;

function ConnectToRFBServer(client: PrfbClient; hostname: pchar; port: longint): TrfbBool; cdecl; external libvncclient;
function ConnectToRFBRepeater(client: PrfbClient; repeaterHost: pchar; repeaterPort: longint; destHost: pchar; destPort: longint): TrfbBool; cdecl; external libvncclient;
procedure SetClientAuthSchemes(client: PrfbClient; authSchemes: Puint32_t; size: longint); cdecl; external libvncclient;
function InitialiseRFBConnection(client: PrfbClient): TrfbBool; cdecl; external libvncclient;
function SetFormatAndEncodings(client: PrfbClient): TrfbBool; cdecl; external libvncclient;
function SendIncrementalFramebufferUpdateRequest(client: PrfbClient): TrfbBool; cdecl; external libvncclient;
function SendFramebufferUpdateRequest(client: PrfbClient; x: longint; y: longint; w: longint; h: longint;
  incremental: TrfbBool): TrfbBool; cdecl; external libvncclient;
function SendScaleSetting(client: PrfbClient; scaleSetting: longint): TrfbBool; cdecl; external libvncclient;
function SendPointerEvent(client: PrfbClient; x: longint; y: longint; buttonMask: longint): TrfbBool; cdecl; external libvncclient;
function SendExtDesktopSize(client: PrfbClient; width: Tuint16_t; height: Tuint16_t): TrfbBool; cdecl; external libvncclient;
function SendKeyEvent(client: PrfbClient; key: Tuint32_t; down: TrfbBool): TrfbBool; cdecl; external libvncclient;
function SendExtendedKeyEvent(client: PrfbClient; keysym: Tuint32_t; keycode: Tuint32_t; down: TrfbBool): TrfbBool; cdecl; external libvncclient;
function SendClientCutText(client: PrfbClient; str: pchar; len: longint): TrfbBool; cdecl; external libvncclient;
function HandleRFBServerMessage(client: PrfbClient): TrfbBool; cdecl; external libvncclient;
function TextChatSend(client: PrfbClient; text: pchar): TrfbBool; cdecl; external libvncclient;
function TextChatOpen(client: PrfbClient): TrfbBool; cdecl; external libvncclient;
function TextChatClose(client: PrfbClient): TrfbBool; cdecl; external libvncclient;
function TextChatFinish(client: PrfbClient): TrfbBool; cdecl; external libvncclient;
function PermitServerInput(client: PrfbClient; enabled: longint): TrfbBool; cdecl; external libvncclient;
function SendXvpMsg(client: PrfbClient; version: Tuint8_t; code: Tuint8_t): TrfbBool; cdecl; external libvncclient;
procedure PrintPixelFormat(format: PrfbPixelFormat); cdecl; external libvncclient;
function SupportsClient2Server(client: PrfbClient; messageType: longint): TrfbBool; cdecl; external libvncclient;
function SupportsServer2Client(client: PrfbClient; messageType: longint): TrfbBool; cdecl; external libvncclient;
procedure rfbClientSetClientData(client: PrfbClient; tag: pointer; data: pointer); cdecl; external libvncclient;
function rfbClientGetClientData(client: PrfbClient; tag: pointer): pointer; cdecl; external libvncclient;

type
  PrfbClientProtocolExtension = ^TrfbClientProtocolExtension;
  TrfbClientProtocolExtension = record
    encodings: Plongint;
    handleEncoding: function(cl: PrfbClient; rect: PrfbFramebufferUpdateRectHeader): TrfbBool; cdecl;
    handleMessage: function(cl: PrfbClient; message: PrfbServerToClientMsg): TrfbBool; cdecl;
    next: PrfbClientProtocolExtension;
    securityTypes: Puint32_t;
    handleAuthentication: function(cl: PrfbClient; authScheme: Tuint32_t): TrfbBool; cdecl;
  end;

procedure rfbClientRegisterExtension(e: PrfbClientProtocolExtension); cdecl; external libvncclient;
var
  errorMessageOnReadFailure: TrfbBool; cvar;external libvncclient;

function ReadFromRFBServer(client: PrfbClient; out_: pchar; n: dword): TrfbBool; cdecl; external libvncclient;
function WriteToRFBServer(client: PrfbClient; buf: pchar; n: dword): TrfbBool; cdecl; external libvncclient;
function FindFreeTcpPort: longint; cdecl; external libvncclient;
function ListenAtTcpPort(port: longint): TrfbSocket; cdecl; external libvncclient;
function ListenAtTcpPortAndAddress(port: longint; address: pchar): TrfbSocket; cdecl; external libvncclient;
function ConnectClientToTcpAddr(host: dword; port: longint): TrfbSocket; cdecl; external libvncclient;
function ConnectClientToTcpAddr6(hostname: pchar; port: longint): TrfbSocket; cdecl; external libvncclient;
function ConnectClientToUnixSock(sockFile: pchar): TrfbSocket; cdecl; external libvncclient;
function ConnectClientToTcpAddrWithTimeout(host: dword; port: longint; timeout: dword): TrfbSocket; cdecl; external libvncclient;
function ConnectClientToTcpAddr6WithTimeout(hostname: pchar; port: longint; timeout: dword): TrfbSocket; cdecl; external libvncclient;
function ConnectClientToUnixSockWithTimeout(sockFile: pchar; timeout: dword): TrfbSocket; cdecl; external libvncclient;
function AcceptTcpConnection(listenSock: TrfbSocket): TrfbSocket; cdecl; external libvncclient;
function SetNonBlocking(sock: TrfbSocket): TrfbBool; cdecl; external libvncclient;
function SetBlocking(sock: TrfbSocket): TrfbBool; cdecl; external libvncclient;
function SetDSCP(sock: TrfbSocket; dscp: longint): TrfbBool; cdecl; external libvncclient;
function StringToIPAddr(str: pchar; addr: Pdword): TrfbBool; cdecl; external libvncclient;
function SameMachine(sock: TrfbSocket): TrfbBool; cdecl; external libvncclient;
function WaitForMessage(client: PrfbClient; usecs: dword): longint; cdecl; external libvncclient;
function rfbGetClient(bitsPerSample: longint; samplesPerPixel: longint; bytesPerPixel: longint): PrfbClient; cdecl; external libvncclient;
function rfbInitClient(client: PrfbClient; argc: Plongint; argv: PPchar): TrfbBool; cdecl; external libvncclient;
procedure rfbClientCleanup(client: PrfbClient); cdecl; external libvncclient;

// === Konventiert am: 22-10-26 19:42:53 ===


implementation



end.
