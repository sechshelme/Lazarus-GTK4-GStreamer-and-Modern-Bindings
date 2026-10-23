unit rfb;

interface

uses
  fp_vnc, rfbproto, rfbclient;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  //PrfbClientRec = ^TrfbClientRec;
  //TrfbClientRec = record
  //    {undefined structure}
  //  end;
  //
  //PrfbScreenInfo = ^TrfbScreenInfo;
  //TrfbScreenInfo = record
  //    {undefined structure}
  //  end;
  //
  //PrfbCursor = ^TrfbCursor;
  //TrfbCursor = record
  //    {undefined structure}
  //  end;

  TrfbNewClientAction =  Longint;
  Const
    RFB_CLIENT_ACCEPT = 0;
    RFB_CLIENT_ON_HOLD = 1;
    RFB_CLIENT_REFUSE = 2;

type
  TrfbSocketState =  Longint;
  Const
    RFB_SOCKET_INIT = 0;
    RFB_SOCKET_READY = 1;
    RFB_SOCKET_SHUTDOWN = 2;

  type
    PrfbCursor = ^TrfbCursor;
    TrfbCursor = record
        cleanup : TrfbBool;
        cleanupSource : TrfbBool;
        cleanupMask : TrfbBool;
        cleanupRichSource : TrfbBool;
        source : Pbyte;
        mask : Pbyte;
        width : word;
        height : word;
        xhot : word;
        yhot : word;
        foreRed : word;
        foreGreen : word;
        foreBlue : word;
        backRed : word;
        backGreen : word;
        backBlue : word;
        richSource : Pbyte;
        alphaSource : Pbyte;
        alphaPreMultiplied : TrfbBool;
      end;
    TrfbCursorPtr = PrfbCursor;
    PrfbCursorPtr = ^TrfbCursorPtr;

type
  PrfbScreenInfo = ^TrfbScreenInfo;

  TrfbKbdAddEventProcPtr = procedure (down:TrfbBool; keySym:TrfbKeySym; cl:PrfbClientRec);cdecl;
  TrfbKbdReleaseAllKeysProcPtr = procedure (cl:PrfbClientRec);cdecl;
  TrfbPtrAddEventProcPtr = procedure (buttonMask:longint; x:longint; y:longint; cl:PrfbClientRec);cdecl;
  TrfbSetXCutTextProcPtr = procedure (str:Pchar; len:longint; cl:PrfbClientRec);cdecl;
  TrfbSetXCutTextUTF8ProcPtr = procedure (str:Pchar; len:longint; cl:PrfbClientRec);cdecl;
  TrfbGetCursorProcPtr = function (pScreen:PrfbClientRec):PrfbCursor;cdecl;
  TrfbSetTranslateFunctionProcPtr = function (cl:PrfbClientRec):TrfbBool;cdecl;
  TrfbPasswordCheckProcPtr = function (cl:PrfbClientRec; encryptedPassWord:Pchar; len:longint):TrfbBool;cdecl;
  TrfbNewClientHookPtr = function (cl:PrfbClientRec):TrfbNewClientAction;cdecl;
  TrfbDisplayHookPtr = procedure (cl:PrfbClientRec);cdecl;
  TrfbDisplayFinishedHookPtr = procedure (cl:PrfbClientRec; result:longint);cdecl;
  TrfbGetKeyboardLedStateHookPtr = function (screen:PrfbScreenInfo):longint;cdecl;
  TrfbXvpHookPtr = function (cl:PrfbClientRec; para2:Tuint8_t; para3:Tuint8_t):TrfbBool;cdecl;
  TrfbSetDesktopSizeHookPtr = function (width:longint; height:longint; numScreens:longint; extDesktopScreens:PrfbExtDesktopScreen; cl:PrfbClientRec):longint;cdecl;
  TrfbNumberOfExtDesktopScreensPtr = function (cl:PrfbClientRec):longint;cdecl;
  TrfbGetExtDesktopScreenPtr = function (seqnumber:longint; extDesktopScreen:PrfbExtDesktopScreen; cl:PrfbClientRec):TrfbBool;cdecl;
  TrfbSetSingleWindowProcPtr = procedure (cl:PrfbClientRec; x:longint; y:longint);cdecl;
  TrfbSetServerInputProcPtr = procedure (cl:PrfbClientRec; status:longint);cdecl;
  TrfbFileTransferPermitted = function (cl:PrfbClientRec):longint;cdecl;
  TrfbSetTextChat = procedure (cl:PrfbClientRec; length:longint; _string:Pchar);cdecl;

  PrfbColourMap = ^TrfbColourMap;
  TrfbColourMap = record
      count : Tuint32_t;
      is16 : TrfbBool;
      data : record
          case longint of
            0 : ( bytes : Puint8_t );
            1 : ( shorts : Puint16_t );
          end;
    end;

  PrfbSecurity = ^TrfbSecurity;
  TrfbSecurity = record
      _type : Tuint8_t;
      handler : procedure (cl:PrfbClientRec);cdecl;
      next : PrfbSecurity;
    end;
  TrfbSecurityHandler = TrfbSecurity;
  PrfbSecurityHandler = ^TrfbSecurityHandler;

  PrfbProtocolExtension = ^TrfbProtocolExtension;
  TrfbProtocolExtension = record
      newClient : function (client:PrfbClientRec; data:Ppointer):TrfbBool;cdecl;
      init : function (client:PrfbClientRec; data:pointer):TrfbBool;cdecl;
      pseudoEncodings : Plongint;
      enablePseudoEncoding : function (client:PrfbClientRec; data:Ppointer; encodingNumber:longint):TrfbBool;cdecl;
      handleMessage : function (client:PrfbClientRec; data:pointer; message:PrfbClientToServerMsg):TrfbBool;cdecl;
      close : procedure (client:PrfbClientRec; data:pointer);cdecl;
      usage : procedure ;cdecl;
      processArgument : function (argc:longint; argv:PPchar):longint;cdecl;
      next : PrfbProtocolExtension;
    end;

  PrfbExtensionData = ^TrfbExtensionData;
  TrfbExtensionData = record
      extension : PrfbProtocolExtension;
      data : pointer;
      next : PrfbExtensionData;
    end;

  TrfbScreenInfo = record
      scaledScreenNext : PrfbScreenInfo;
      scaledScreenRefCount : longint;
      width : longint;
      paddedWidthInBytes : longint;
      height : longint;
      depth : longint;
      bitsPerPixel : longint;
      sizeInBytes : longint;
      blackPixel : TrfbPixel;
      whitePixel : TrfbPixel;
      screenData : pointer;
      serverFormat : TrfbPixelFormat;
      colourMap : TrfbColourMap;
      desktopName : Pchar;
      thisHost : array[0..254] of char;
      autoPort : TrfbBool;
      port : longint;
      listenSock : TrfbSocket;
      maxSock : longint;
      maxFd : longint;
      allFds : Tfd_set;
      socketState : TrfbSocketState;
      inetdSock : TrfbSocket;
      inetdInitDone : TrfbBool;
      udpPort : longint;
      udpSock : TrfbSocket;
      udpClient : PrfbClientRec;
      udpSockConnected : TrfbBool;
      udpRemoteAddr : Tsockaddr_in;
      maxClientWait : longint;
      httpInitDone : TrfbBool;
      httpEnableProxyConnect : TrfbBool;
      httpPort : longint;
      httpDir : Pchar;
      httpListenSock : TrfbSocket;
      httpSock : TrfbSocket;
      passwordCheck : TrfbPasswordCheckProcPtr;
      authPasswdData : pointer;
      authPasswdFirstViewOnly : longint;
      maxRectsPerUpdate : longint;
      deferUpdateTime : longint;
      alwaysShared : TrfbBool;
      neverShared : TrfbBool;
      dontDisconnect : TrfbBool;
      clientHead : PrfbClientRec;
      pointerClient : PrfbClientRec;
      cursorX : longint;
      cursorY : longint;
      underCursorBufferLen : longint;
      underCursorBuffer : Pchar;
      dontConvertRichCursorToXCursor : TrfbBool;
      cursor : PrfbCursor;
      frameBuffer : Pchar;
      kbdAddEvent : TrfbKbdAddEventProcPtr;
      kbdReleaseAllKeys : TrfbKbdReleaseAllKeysProcPtr;
      ptrAddEvent : TrfbPtrAddEventProcPtr;
      setXCutText : TrfbSetXCutTextProcPtr;
      getCursorPtr : TrfbGetCursorProcPtr;
      setTranslateFunction : TrfbSetTranslateFunctionProcPtr;
      setSingleWindow : TrfbSetSingleWindowProcPtr;
      setServerInput : TrfbSetServerInputProcPtr;
      getFileTransferPermission : TrfbFileTransferPermitted;
      setTextChat : TrfbSetTextChat;
      newClientHook : TrfbNewClientHookPtr;
      displayHook : TrfbDisplayHookPtr;
      getKeyboardLedStateHook : TrfbGetKeyboardLedStateHookPtr;
      cursorMutex : TMUTEX;
      backgroundLoop : TrfbBool;
      ignoreSIGPIPE : TrfbBool;
      progressiveSliceHeight : longint;
      listenInterface : Tin_addr_t;
      deferPtrUpdateTime : longint;
      handleEventsEagerly : TrfbBool;
      versionString : Pchar;
      protocolMajorVersion : longint;
      protocolMinorVersion : longint;
      permitFileTransfer : TrfbBool;
      displayFinishedHook : TrfbDisplayFinishedHookPtr;
      xvpHook : TrfbXvpHookPtr;
      sslkeyfile : Pchar;
      sslcertfile : Pchar;
      ipv6port : longint;
      listen6Interface : Pchar;
      listen6Sock : TrfbSocket;
      http6Port : longint;
      httpListen6Sock : TrfbSocket;
      setDesktopSizeHook : TrfbSetDesktopSizeHookPtr;
      numberOfExtDesktopScreensHook : TrfbNumberOfExtDesktopScreensPtr;
      getExtDesktopScreenHook : TrfbGetExtDesktopScreenPtr;
      fdQuota : single;
      listener_thread : Tpthread_t;
      pipe_notify_listener_thread : array[0..1] of longint;
      setXCutTextUTF8 : TrfbSetXCutTextUTF8ProcPtr;
    end;
  TrfbScreenInfoPtr = PrfbScreenInfo;
  PrfbScreenInfoPtr = ^TrfbScreenInfoPtr;

  TrfbTranslateFnType = procedure (table:Pchar; in_:PrfbPixelFormat; out_:PrfbPixelFormat; iptr:Pchar; optr:Pchar;                 bytesBetweenInputLines:longint; width:longint; height:longint);cdecl;

  PsraRegion = ^TsraRegion;
  TsraRegion = record
      {undefined structure}
    end;


  PsraRegionPtr = ^TsraRegionPtr;
  TsraRegionPtr = PsraRegion;

  TClientGoneHookPtr = procedure (cl:PrfbClientRec);cdecl;
  TClientFramebufferUpdateRequestHookPtr = procedure (cl:PrfbClientRec; furMsg:PrfbFramebufferUpdateRequestMsg);cdecl;

  PrfbFileTransferData = ^TrfbFileTransferData;
  TrfbFileTransferData = record
      fd : longint;
      compressionEnabled : longint;
      fileSize : longint;
      numPackets : longint;
      receiving : longint;
      sending : longint;
    end;

  PrfbStatList = ^TrfbStatList;
  TrfbStatList = record
      _type : Tuint32_t;
      sentCount : Tuint32_t;
      bytesSent : Tuint32_t;
      bytesSentIfRaw : Tuint32_t;
      rcvdCount : Tuint32_t;
      bytesRcvd : Tuint32_t;
      bytesRcvdIfRaw : Tuint32_t;
      Next : PrfbStatList;
    end;

const
  UPDATE_BUF_SIZE = 32768;

Const
  RFB_PROTOCOL_VERSION = 0;
  RFB_SECURITY_TYPE = 1;
  RFB_AUTHENTICATION = 2;
  RFB_INITIALISATION = 3;
  RFB_NORMAL = 4;
  RFB_INITIALISATION_SHARED = 5;
  RFB_SHUTDOWN = 6;

type
  PrfbSslCtx=type Pointer;
  PwsCtx=type Pointer;

  PrfbClientRec = ^TrfbClientRec;
  TrfbClientRec = record
      screen : TrfbScreenInfoPtr;
      scaledScreen : TrfbScreenInfoPtr;
      PalmVNC : TrfbBool;
      clientData : pointer;
      clientGoneHook : TClientGoneHookPtr;
      sock : TrfbSocket;
      host : Pchar;
      protocolMajorVersion : longint;
      protocolMinorVersion : longint;
      client_thread : Tpthread_t;
      state :  Longint;
      reverseConnection : TrfbBool;
      onHold : TrfbBool;
      readyForSetColourMapEntries : TrfbBool;
      useCopyRect : TrfbBool;
      preferredEncoding : longint;
      correMaxWidth : longint;
      correMaxHeight : longint;
      viewOnly : TrfbBool;
      authChallenge : array[0..(CHALLENGESIZE)-1] of Tuint8_t;
      copyRegion : TsraRegionPtr;
      copyDX : longint;
      copyDY : longint;
      modifiedRegion : TsraRegionPtr;
      requestedRegion : TsraRegionPtr;
      startDeferring : Ttimeval;
      startPtrDeferring : Ttimeval;
      lastPtrX : longint;
      lastPtrY : longint;
      lastPtrButtons : longint;
      translateFn : TrfbTranslateFnType;
      translateLookupTable : Pchar;
      format : TrfbPixelFormat;
      updateBuf : array[0..(UPDATE_BUF_SIZE)-1] of char;
      ublen : longint;
      statEncList : PrfbStatList;
      statMsgList : PrfbStatList;
      rawBytesEquivalent : longint;
      bytesSent : longint;
      compStream : Tz_stream;
      compStreamInited : TrfbBool;
      zlibCompressLevel : Tuint32_t;
      tightQualityLevel : longint;
      zsStruct : array[0..3] of Tz_stream;
      zsActive : array[0..3] of TrfbBool;
      zsLevel : array[0..3] of longint;
      tightCompressLevel : longint;
      compStreamInitedLZO : TrfbBool;
      lzoWrkMem : Pchar;
      fileTransfer : TrfbFileTransferData;
      lastKeyboardLedState : longint;
      enableSupportedMessages : TrfbBool;
      enableSupportedEncodings : TrfbBool;
      enableServerIdentity : TrfbBool;
      enableKeyboardLedState : TrfbBool;
      enableLastRectEncoding : TrfbBool;
      enableCursorShapeUpdates : TrfbBool;
      enableCursorPosUpdates : TrfbBool;
      useRichCursorEncoding : TrfbBool;
      cursorWasChanged : TrfbBool;
      cursorWasMoved : TrfbBool;
      cursorX : longint;
      cursorY : longint;
      useNewFBSize : TrfbBool;
      newFBSizePending : TrfbBool;
      prev : PrfbClientRec;
      next : PrfbClientRec;
      refCount : longint;
      refCountMutex : TMUTEX;
      deleteCond : TCOND;
      outputMutex : TMUTEX;
      updateMutex : TMUTEX;
      updateCond : TCOND;
      zrleData : pointer;
      zywrleLevel : longint;
      zywrleBuf : array[0..(rfbZRLETileWidth*rfbZRLETileHeight)-1] of longint;
      progressiveSliceY : longint;
      extensions : PrfbExtensionData;
      zrleBeforeBuf : Pchar;
      paletteHelper : pointer;
      sendMutex : TMUTEX;
      beforeEncBuf : Pchar;
      beforeEncBufSize : longint;
      afterEncBuf : Pchar;
      afterEncBufSize : longint;
      afterEncBufLen : longint;
      tightEncoding : Tuint32_t;
      turboSubsampLevel : longint;
      turboQualityLevel : longint;
      sslctx : PrfbSslCtx;
      wsctx : PwsCtx;
      wspath : Pchar;
      pipe_notify_client_thread : array[0..1] of longint;
      clientFramebufferUpdateRequestHook : TClientFramebufferUpdateRequestHookPtr;
      useExtDesktopSize : TrfbBool;
      requestedDesktopSizeChange : longint;
      lastDesktopSizeChangeError : longint;
      enableExtendedClipboard : TrfbBool;
      extClipboardUserCap : Tuint32_t;
      extClipboardMaxUnsolicitedSize : Tuint32_t;
      extClipboardData : Pchar;
      extClipboardDataSize : longint;
      tightUsePixelFormat24 : TrfbBool;
      tightTJ : pointer;
      tightPngDstDataLen : longint;
    end;
 TrfbClientPtr = PrfbClientRec;
  PrfbClientPtr = ^TrfbClientPtr;

var
    rfbMaxClientWait : longint;cvar;external libvncserver;

procedure rfbInitSockets(rfbScreen:TrfbScreenInfoPtr);cdecl;external libvncserver;
procedure rfbShutdownSockets(rfbScreen:TrfbScreenInfoPtr);cdecl;external libvncserver;
procedure rfbDisconnectUDPSock(rfbScreen:TrfbScreenInfoPtr);cdecl;external libvncserver;
procedure rfbCloseClient(cl:TrfbClientPtr);cdecl;external libvncserver;
function rfbReadExact(cl:TrfbClientPtr; buf:Pchar; len:longint):longint;cdecl;external libvncserver;
function rfbReadExactTimeout(cl:TrfbClientPtr; buf:Pchar; len:longint; timeout:longint):longint;cdecl;external libvncserver;
function rfbPeekExactTimeout(cl:TrfbClientPtr; buf:Pchar; len:longint; timeout:longint):longint;cdecl;external libvncserver;
function rfbWriteExact(cl:TrfbClientPtr; buf:Pchar; len:longint):longint;cdecl;external libvncserver;
function rfbCheckFds(rfbScreen:TrfbScreenInfoPtr; usec:longint):longint;cdecl;external libvncserver;
function rfbConnect(rfbScreen:TrfbScreenInfoPtr; host:Pchar; port:longint):TrfbSocket;cdecl;external libvncserver;
function rfbConnectToTcpAddr(host:Pchar; port:longint):TrfbSocket;cdecl;external libvncserver;
function rfbListenOnTCPPort(port:longint; iface:Tin_addr_t):TrfbSocket;cdecl;external libvncserver;
function rfbListenOnTCP6Port(port:longint; iface:Pchar):TrfbSocket;cdecl;external libvncserver;
function rfbListenOnUDPPort(port:longint; iface:Tin_addr_t):TrfbSocket;cdecl;external libvncserver;
function rfbStringToAddr(_string:Pchar; addr:Pin_addr_t):longint;cdecl;external libvncserver;
function rfbSetNonBlocking(sock:TrfbSocket):TrfbBool;cdecl;external libvncserver;

function webSocketsCheck(cl:TrfbClientPtr):TrfbBool;cdecl;external libvncserver;
function webSocketCheckDisconnect(cl:TrfbClientPtr):TrfbBool;cdecl;external libvncserver;
function webSocketsEncode(cl:TrfbClientPtr; src:Pchar; len:longint; dst:PPchar):longint;cdecl;external libvncserver;
function webSocketsDecode(cl:TrfbClientPtr; dst:Pchar; len:longint):longint;cdecl;external libvncserver;
function webSocketsHasDataInBuffer(cl:TrfbClientPtr):TrfbBool;cdecl;external libvncserver;

type
  PrfbClientIteratorPtr = ^TrfbClientIteratorPtr;
  TrfbClientIteratorPtr = type Pointer;

procedure rfbClientListInit(rfbScreen:TrfbScreenInfoPtr);cdecl;external libvncserver;
function rfbGetClientIterator(rfbScreen:TrfbScreenInfoPtr):TrfbClientIteratorPtr;cdecl;external libvncserver;
function rfbClientIteratorNext(iterator:TrfbClientIteratorPtr):TrfbClientPtr;cdecl;external libvncserver;
procedure rfbReleaseClientIterator(iterator:TrfbClientIteratorPtr);cdecl;external libvncserver;
procedure rfbIncrClientRef(cl:TrfbClientPtr);cdecl;external libvncserver;
procedure rfbDecrClientRef(cl:TrfbClientPtr);cdecl;external libvncserver;
procedure rfbNewClientConnection(rfbScreen:TrfbScreenInfoPtr; sock:TrfbSocket);cdecl;external libvncserver;
function rfbNewClient(rfbScreen:TrfbScreenInfoPtr; sock:TrfbSocket):TrfbClientPtr;cdecl;external libvncserver;
function rfbNewUDPClient(rfbScreen:TrfbScreenInfoPtr):TrfbClientPtr;cdecl;external libvncserver;
function rfbReverseConnection(rfbScreen:TrfbScreenInfoPtr; host:Pchar; port:longint):TrfbClientPtr;cdecl;external libvncserver;
procedure rfbClientConnectionGone(cl:TrfbClientPtr);cdecl;external libvncserver;
procedure rfbProcessClientMessage(cl:TrfbClientPtr);cdecl;external libvncserver;
procedure rfbClientConnFailed(cl:TrfbClientPtr; reason:Pchar);cdecl;external libvncserver;
procedure rfbNewUDPConnection(rfbScreen:TrfbScreenInfoPtr; sock:TrfbSocket);cdecl;external libvncserver;
procedure rfbProcessUDPInput(rfbScreen:TrfbScreenInfoPtr);cdecl;external libvncserver;
function rfbSendFramebufferUpdate(cl:TrfbClientPtr; updateRegion:TsraRegionPtr):TrfbBool;cdecl;external libvncserver;
function rfbSendRectEncodingRaw(cl:TrfbClientPtr; x:longint; y:longint; w:longint; h:longint):TrfbBool;cdecl;external libvncserver;
function rfbSendUpdateBuf(cl:TrfbClientPtr):TrfbBool;cdecl;external libvncserver;
procedure rfbSendServerCutText(rfbScreen:TrfbScreenInfoPtr; str:Pchar; len:longint);cdecl;external libvncserver;

procedure rfbSendServerCutTextUTF8(rfbScreen:TrfbScreenInfoPtr; str:Pchar; len:longint; fallbackLatin1Str:Pchar; latin1Len:longint);cdecl;external libvncserver;

function rfbSendCopyRegion(cl:TrfbClientPtr; reg:TsraRegionPtr; dx:longint; dy:longint):TrfbBool;cdecl;external libvncserver;
function rfbSendLastRectMarker(cl:TrfbClientPtr):TrfbBool;cdecl;external libvncserver;
function rfbSendNewFBSize(cl:TrfbClientPtr; w:longint; h:longint):TrfbBool;cdecl;external libvncserver;
function rfbSendExtDesktopSize(cl:TrfbClientPtr; w:longint; h:longint):TrfbBool;cdecl;external libvncserver;
function rfbSendSetColourMapEntries(cl:TrfbClientPtr; firstColour:longint; nColours:longint):TrfbBool;cdecl;external libvncserver;
procedure rfbSendBell(rfbScreen:TrfbScreenInfoPtr);cdecl;external libvncserver;
function rfbProcessFileTransferReadBuffer(cl:TrfbClientPtr; length:Tuint32_t):Pchar;cdecl;external libvncserver;
function rfbSendFileTransferChunk(cl:TrfbClientPtr):TrfbBool;cdecl;external libvncserver;
function rfbSendDirContent(cl:TrfbClientPtr; length:longint; buffer:Pchar):TrfbBool;cdecl;external libvncserver;
function rfbSendFileTransferMessage(cl:TrfbClientPtr; contentType:Tuint8_t; contentParam:Tuint8_t; size:Tuint32_t; length:Tuint32_t; 
           buffer:Pchar):TrfbBool;cdecl;external libvncserver;
function rfbProcessFileTransferReadBuffer(cl:TrfbClientPtr; length:Tuint32_t):Pchar;cdecl;external libvncserver;
function rfbProcessFileTransfer(cl:TrfbClientPtr; contentType:Tuint8_t; contentParam:Tuint8_t; size:Tuint32_t; length:Tuint32_t):TrfbBool;cdecl;external libvncserver;
procedure rfbGotXCutText(rfbScreen:TrfbScreenInfoPtr; str:Pchar; len:longint);cdecl;external libvncserver;

var
    rfbEconomicTranslate : TrfbBool;cvar;external libvncserver;

procedure rfbTranslateNone(table:Pchar; in_:PrfbPixelFormat; out_:PrfbPixelFormat; iptr:Pchar; optr:Pchar; 
            bytesBetweenInputLines:longint; width:longint; height:longint);cdecl;external libvncserver;
function rfbSetTranslateFunction(cl:TrfbClientPtr):TrfbBool;cdecl;external libvncserver;
function rfbSetClientColourMap(cl:TrfbClientPtr; firstColour:longint; nColours:longint):TrfbBool;cdecl;external libvncserver;
procedure rfbSetClientColourMaps(rfbScreen:TrfbScreenInfoPtr; firstColour:longint; nColours:longint);cdecl;external libvncserver;
procedure rfbHttpInitSockets(rfbScreen:TrfbScreenInfoPtr);cdecl;external libvncserver;
procedure rfbHttpShutdownSockets(rfbScreen:TrfbScreenInfoPtr);cdecl;external libvncserver;
procedure rfbHttpCheckFds(rfbScreen:TrfbScreenInfoPtr);cdecl;external libvncserver;
procedure rfbAuthNewClient(cl:TrfbClientPtr);cdecl;external libvncserver;
procedure rfbProcessClientSecurityType(cl:TrfbClientPtr);cdecl;external libvncserver;
procedure rfbAuthProcessClientMessage(cl:TrfbClientPtr);cdecl;external libvncserver;
procedure rfbRegisterSecurityHandler(handler:PrfbSecurityHandler);cdecl;external libvncserver;
procedure rfbUnregisterSecurityHandler(handler:PrfbSecurityHandler);cdecl;external libvncserver;
function rfbSendRectEncodingRRE(cl:TrfbClientPtr; x:longint; y:longint; w:longint; h:longint):TrfbBool;cdecl;external libvncserver;
function rfbSendRectEncodingCoRRE(cl:TrfbClientPtr; x:longint; y:longint; w:longint; h:longint):TrfbBool;cdecl;external libvncserver;
function rfbSendRectEncodingHextile(cl:TrfbClientPtr; x:longint; y:longint; w:longint; h:longint):TrfbBool;cdecl;external libvncserver;

const
  ULTRA_MAX_RECT_SIZE = 128*256;  

function rfbSendRectEncodingUltra(cl:TrfbClientPtr; x:longint; y:longint; w:longint; h:longint):TrfbBool;cdecl;external libvncserver;

const
  VNC_ENCODE_ZLIB_MIN_COMP_SIZE = 17;  
  ZLIB_MAX_RECT_SIZE = 128*256;

function rfbSendRectEncodingZlib(cl:TrfbClientPtr; x:longint; y:longint; w:longint; h:longint):TrfbBool;cdecl;external libvncserver;

const
  TIGHT_DEFAULT_COMPRESSION = 6;  
  TURBO_DEFAULT_SUBSAMP = 0;  

function rfbNumCodedRectsTight(cl:TrfbClientPtr; x:longint; y:longint; w:longint; h:longint):longint;cdecl;external libvncserver;
function rfbSendRectEncodingTight(cl:TrfbClientPtr; x:longint; y:longint; w:longint; h:longint):TrfbBool;cdecl;external libvncserver;
function rfbSendTightHeader(cl:TrfbClientPtr; x:longint; y:longint; w:longint; h:longint):TrfbBool;cdecl;external libvncserver;
function rfbSendCompressedDataTight(cl:TrfbClientPtr; buf:Pchar; compressedLen:longint):TrfbBool;cdecl;external libvncserver;

function rfbSendRectEncodingTightPng(cl:TrfbClientPtr; x:longint; y:longint; w:longint; h:longint):TrfbBool;cdecl;external libvncserver;

  var
    rfbReverseByte : array[0..255] of byte;cvar;external libvncserver;

    function rfbSendCursorShape(cl:TrfbClientPtr):TrfbBool;cdecl;external libvncserver;
function rfbSendCursorPos(cl:TrfbClientPtr):TrfbBool;cdecl;external libvncserver;
procedure rfbConvertLSBCursorBitmapOrMask(width:longint; height:longint; bitmap:Pbyte);cdecl;external libvncserver;
function rfbMakeXCursor(width:longint; height:longint; cursorString:Pchar; maskString:Pchar):TrfbCursorPtr;cdecl;external libvncserver;
function rfbMakeMaskForXCursor(width:longint; height:longint; cursorString:Pchar):Pchar;cdecl;external libvncserver;
function rfbMakeMaskFromAlphaSource(width:longint; height:longint; alphaSource:Pbyte):Pchar;cdecl;external libvncserver;
procedure rfbMakeXCursorFromRichCursor(rfbScreen:TrfbScreenInfoPtr; cursor:TrfbCursorPtr);cdecl;external libvncserver;
procedure rfbMakeRichCursorFromXCursor(rfbScreen:TrfbScreenInfoPtr; cursor:TrfbCursorPtr);cdecl;external libvncserver;
procedure rfbFreeCursor(cursor:TrfbCursorPtr);cdecl;external libvncserver;
procedure rfbSetCursor(rfbScreen:TrfbScreenInfoPtr; c:TrfbCursorPtr);cdecl;external libvncserver;

procedure rfbDefaultPtrAddEvent(buttonMask:longint; x:longint; y:longint; cl:TrfbClientPtr);cdecl;external libvncserver;
function rfbSendRectEncodingZRLE(cl:TrfbClientPtr; x:longint; y:longint; w:longint; h:longint):TrfbBool;cdecl;external libvncserver;

procedure rfbResetStats(cl:TrfbClientPtr);cdecl;external libvncserver;
procedure rfbPrintStats(cl:TrfbClientPtr);cdecl;external libvncserver;

type
  PrfbFontData = ^TrfbFontData;
  TrfbFontData = record
      data : Pbyte;
      metaData : Plongint;
    end;
  TrfbFontDataPtr = PrfbFontData;
  PrfbFontDataPtr = ^TrfbFontDataPtr;

function rfbDrawChar(rfbScreen:TrfbScreenInfoPtr; font:TrfbFontDataPtr; x:longint; y:longint; c:byte; 
           colour:TrfbPixel):longint;cdecl;external libvncserver;
procedure rfbDrawString(rfbScreen:TrfbScreenInfoPtr; font:TrfbFontDataPtr; x:longint; y:longint; _string:Pchar; 
            colour:TrfbPixel);cdecl;external libvncserver;
function rfbDrawCharWithClip(rfbScreen:TrfbScreenInfoPtr; font:TrfbFontDataPtr; x:longint; y:longint; c:byte;
           x1:longint; y1:longint; x2:longint; y2:longint; colour:TrfbPixel; 
           backColour:TrfbPixel):longint;cdecl;external libvncserver;
procedure rfbDrawStringWithClip(rfbScreen:TrfbScreenInfoPtr; font:TrfbFontDataPtr; x:longint; y:longint; _string:Pchar; 
            x1:longint; y1:longint; x2:longint; y2:longint; colour:TrfbPixel; 
            backColour:TrfbPixel);cdecl;external libvncserver;
function rfbWidthOfString(font:TrfbFontDataPtr; _string:Pchar):longint;cdecl;external libvncserver;
function rfbWidthOfChar(font:TrfbFontDataPtr; c:byte):longint;cdecl;external libvncserver;
procedure rfbFontBBox(font:TrfbFontDataPtr; c:byte; x1:Plongint; y1:Plongint; x2:Plongint; 
            y2:Plongint);cdecl;external libvncserver;
procedure rfbWholeFontBBox(font:TrfbFontDataPtr; x1:Plongint; y1:Plongint; x2:Plongint; y2:Plongint);cdecl;external libvncserver;
function rfbLoadConsoleFont(filename:Pchar):TrfbFontDataPtr;cdecl;external libvncserver;
procedure rfbFreeFont(font:TrfbFontDataPtr);cdecl;external libvncserver;
procedure rfbFillRect(s:TrfbScreenInfoPtr; x1:longint; y1:longint; x2:longint; y2:longint;
            col:TrfbPixel);cdecl;external libvncserver;
procedure rfbDrawPixel(s:TrfbScreenInfoPtr; x:longint; y:longint; col:TrfbPixel);cdecl;external libvncserver;
procedure rfbDrawLine(s:TrfbScreenInfoPtr; x1:longint; y1:longint; x2:longint; y2:longint; 
            col:TrfbPixel);cdecl;external libvncserver;

type
  TSelectionChangedHookPtr = procedure (_index:longint);cdecl;

function rfbSelectBox(rfbScreen:TrfbScreenInfoPtr; font:TrfbFontDataPtr; list:PPchar; x1:longint; y1:longint; 
           x2:longint; y2:longint; foreColour:TrfbPixel; backColour:TrfbPixel; border:longint; 
           selChangedHook:TSelectionChangedHookPtr):longint;cdecl;external libvncserver;
procedure rfbUsage;cdecl;external libvncserver;
procedure rfbPurgeArguments(argc:Plongint; position:Plongint; count:longint; argv:PPchar);cdecl;external libvncserver;
function rfbProcessArguments(rfbScreen:TrfbScreenInfoPtr; argc:Plongint; argv:PPchar):TrfbBool;cdecl;external libvncserver;
function rfbProcessSizeArguments(width:Plongint; height:Plongint; bpp:Plongint; argc:Plongint; argv:PPchar):TrfbBool;cdecl;external libvncserver;
procedure rfbLogEnable(enabled:longint);cdecl;external libvncserver;
type
  TrfbLogProc = procedure (format:Pchar; args:array of const);cdecl;

var
    rfbLog : TrfbLogProc;cvar;external libvncserver;

procedure rfbLogPerror(str:Pchar);cdecl;external libvncserver;
procedure rfbScheduleCopyRect(rfbScreen:TrfbScreenInfoPtr; x1:longint; y1:longint; x2:longint; y2:longint; 
            dx:longint; dy:longint);cdecl;external libvncserver;
procedure rfbScheduleCopyRegion(rfbScreen:TrfbScreenInfoPtr; copyRegion:TsraRegionPtr; dx:longint; dy:longint);cdecl;external libvncserver;
procedure rfbDoCopyRect(rfbScreen:TrfbScreenInfoPtr; x1:longint; y1:longint; x2:longint; y2:longint; 
            dx:longint; dy:longint);cdecl;external libvncserver;
procedure rfbDoCopyRegion(rfbScreen:TrfbScreenInfoPtr; copyRegion:TsraRegionPtr; dx:longint; dy:longint);cdecl;external libvncserver;
procedure rfbMarkRectAsModified(rfbScreen:TrfbScreenInfoPtr; x1:longint; y1:longint; x2:longint; y2:longint);cdecl;external libvncserver;
procedure rfbMarkRegionAsModified(rfbScreen:TrfbScreenInfoPtr; modRegion:TsraRegionPtr);cdecl;external libvncserver;
procedure rfbDoNothingWithClient(cl:TrfbClientPtr);cdecl;external libvncserver;
function defaultNewClientHook(cl:TrfbClientPtr):TrfbNewClientAction;cdecl;external libvncserver;
procedure rfbRegisterProtocolExtension(extension:PrfbProtocolExtension);cdecl;external libvncserver;
procedure rfbUnregisterProtocolExtension(extension:PrfbProtocolExtension);cdecl;external libvncserver;
function rfbGetExtensionIterator:PrfbProtocolExtension;cdecl;external libvncserver;
procedure rfbReleaseExtensionIterator;cdecl;external libvncserver;
function rfbEnableExtension(cl:TrfbClientPtr; extension:PrfbProtocolExtension; data:pointer):TrfbBool;cdecl;external libvncserver;
function rfbDisableExtension(cl:TrfbClientPtr; extension:PrfbProtocolExtension):TrfbBool;cdecl;external libvncserver;
function rfbGetExtensionClientData(cl:TrfbClientPtr; extension:PrfbProtocolExtension):pointer;cdecl;external libvncserver;
function rfbCheckPasswordByList(cl:TrfbClientPtr; response:Pchar; len:longint):TrfbBool;cdecl;external libvncserver;
function rfbGetScreen(argc:Plongint; argv:PPchar; width:longint; height:longint; bitsPerSample:longint;
           samplesPerPixel:longint; bytesPerPixel:longint):TrfbScreenInfoPtr;cdecl;external libvncserver;
procedure rfbInitServer(rfbScreen:TrfbScreenInfoPtr);cdecl;external libvncserver;
procedure rfbShutdownServer(rfbScreen:TrfbScreenInfoPtr; disconnectClients:TrfbBool);cdecl;external libvncserver;
procedure rfbNewFramebuffer(rfbScreen:TrfbScreenInfoPtr; framebuffer:Pchar; width:longint; height:longint; bitsPerSample:longint; 
            samplesPerPixel:longint; bytesPerPixel:longint);cdecl;external libvncserver;
procedure rfbScreenCleanup(screenInfo:TrfbScreenInfoPtr);cdecl;external libvncserver;
procedure rfbSetServerVersionIdentity(screen:TrfbScreenInfoPtr; fmt:Pchar);cdecl;varargs;external libvncserver;
procedure rfbStartOnHoldClient(cl:TrfbClientPtr);cdecl;external libvncserver;
procedure rfbRefuseOnHoldClient(cl:TrfbClientPtr);cdecl;external libvncserver;
procedure rfbRunEventLoop(screenInfo:TrfbScreenInfoPtr; usec:longint; runInBackground:TrfbBool);cdecl;external libvncserver;
function rfbProcessEvents(screenInfo:TrfbScreenInfoPtr; usec:longint):TrfbBool;cdecl;external libvncserver;
function rfbIsActive(screenInfo:TrfbScreenInfoPtr):TrfbBool;cdecl;external libvncserver;
procedure rfbRegisterTightVNCFileTransferExtension;cdecl;external libvncserver;
procedure rfbUnregisterTightVNCFileTransferExtension;cdecl;external libvncserver;
function messageNameServer2Client(_type:Tuint32_t; buf:Pchar; len:longint):Pchar;cdecl;external libvncserver;
function messageNameClient2Server(_type:Tuint32_t; buf:Pchar; len:longint):Pchar;cdecl;external libvncserver;
function encodingName(enc:Tuint32_t; buf:Pchar; len:longint):Pchar;cdecl;external libvncserver;
function rfbStatLookupEncoding(cl:TrfbClientPtr; _type:Tuint32_t):PrfbStatList;cdecl;external libvncserver;
function rfbStatLookupMessage(cl:TrfbClientPtr; _type:Tuint32_t):PrfbStatList;cdecl;external libvncserver;
procedure rfbStatRecordEncodingSent(cl:TrfbClientPtr; _type:Tuint32_t; byteCount:longint; byteIfRaw:longint);cdecl;external libvncserver;
procedure rfbStatRecordEncodingSentAdd(cl:TrfbClientPtr; _type:Tuint32_t; byteCount:longint);cdecl;external libvncserver;
procedure rfbStatRecordEncodingRcvd(cl:TrfbClientPtr; _type:Tuint32_t; byteCount:longint; byteIfRaw:longint);cdecl;external libvncserver;
procedure rfbStatRecordMessageSent(cl:TrfbClientPtr; _type:Tuint32_t; byteCount:longint; byteIfRaw:longint);cdecl;external libvncserver;
procedure rfbStatRecordMessageRcvd(cl:TrfbClientPtr; _type:Tuint32_t; byteCount:longint; byteIfRaw:longint);cdecl;external libvncserver;
procedure rfbResetStats(cl:TrfbClientPtr);cdecl;external libvncserver;
procedure rfbPrintStats(cl:TrfbClientPtr);cdecl;external libvncserver;
function rfbStatGetSentBytes(cl:TrfbClientPtr):longint;cdecl;external libvncserver;
function rfbStatGetSentBytesIfRaw(cl:TrfbClientPtr):longint;cdecl;external libvncserver;
function rfbStatGetRcvdBytes(cl:TrfbClientPtr):longint;cdecl;external libvncserver;
function rfbStatGetRcvdBytesIfRaw(cl:TrfbClientPtr):longint;cdecl;external libvncserver;
function rfbStatGetMessageCountSent(cl:TrfbClientPtr; _type:Tuint32_t):longint;cdecl;external libvncserver;
function rfbStatGetMessageCountRcvd(cl:TrfbClientPtr; _type:Tuint32_t):longint;cdecl;external libvncserver;
function rfbStatGetEncodingCountSent(cl:TrfbClientPtr; _type:Tuint32_t):longint;cdecl;external libvncserver;
function rfbStatGetEncodingCountRcvd(cl:TrfbClientPtr; _type:Tuint32_t):longint;cdecl;external libvncserver;
procedure rfbSetProtocolVersion(rfbScreen:TrfbScreenInfoPtr; major_:longint; minor_:longint);cdecl;external libvncserver;
function rfbSendTextChatMessage(cl:TrfbClientPtr; length:Tuint32_t; buffer:Pchar):TrfbBool;cdecl;external libvncserver;
function rfbProcessNewConnection(rfbScreen:TrfbScreenInfoPtr):TrfbBool;cdecl;external libvncserver;
function rfbUpdateClient(cl:TrfbClientPtr):TrfbBool;cdecl;external libvncserver;

// === Konventiert am: 22-10-26 19:42:47 ===


implementation



end.
