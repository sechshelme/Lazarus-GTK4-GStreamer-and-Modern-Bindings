program project1;

uses
sysutils,

keysym,
rfbconfig,
rfbproto,
rfbclient,
rfb,
//rfbregion,


fp_vnc;

function OffsetOf(const TargetField; const RecordStart): PtrInt;
begin
  Result := PByte(@TargetField) - PByte(@RecordStart);
end;


var
  // Instanzvariablen werden benötigt, um die Feldadressen zur Laufzeit zu ermitteln
//  gz: Tgz_header;
//  mutex: Tpthread_mutex_t;
  client: TrfbClient;


procedure main;
begin
//  Writeln(Format('gz_header %d', [SizeOf(gz_header)]));
//  Writeln(Format('pthread_mutex_t size: %d', [SizeOf(pthread_mutex_t)]));
  Writeln;
  Writeln;
  Writeln;

  Writeln(Format('rfbClient size: %d', [SizeOf(TrfbClient)]));
  Writeln;

  Writeln('=== Offsets für Struktur rfbClient ===');
  Writeln(Format('frameBuffer: %d', [OffsetOf(client.frameBuffer, client)]));
  Writeln(Format('width: %d', [OffsetOf(client.width, client)]));
  Writeln(Format('height: %d', [OffsetOf(client.height, client)]));
  Writeln(Format('endianTest: %d', [OffsetOf(client.endianTest, client)]));
  Writeln(Format('appData: %d', [OffsetOf(client.appData, client)]));
  Writeln(Format('programName: %d', [OffsetOf(client.programName, client)]));
  Writeln(Format('serverHost: %d', [OffsetOf(client.serverHost, client)]));
  Writeln(Format('serverPort: %d', [OffsetOf(client.serverPort, client)]));
  Writeln(Format('listenSpecified: %d', [OffsetOf(client.listenSpecified, client)]));
  Writeln(Format('listenPort: %d', [OffsetOf(client.listenPort, client)]));
  Writeln(Format('flashPort: %d', [OffsetOf(client.flashPort, client)]));
  Writeln(Format('updateRect: %d', [OffsetOf(client.updateRect, client)]));
  Writeln(Format('buffer: %d', [OffsetOf(client.buffer, client)]));
  Writeln(Format('sock: %d', [OffsetOf(client.sock, client)]));
  Writeln(Format('canUseCoRRE: %d', [OffsetOf(client.canUseCoRRE, client)]));
  Writeln(Format('canUseHextile: %d', [OffsetOf(client.canUseHextile, client)]));
  Writeln(Format('desktopName: %d', [OffsetOf(client.desktopName, client)]));
  Writeln(Format('format: %d', [OffsetOf(client.format, client)]));
  Writeln(Format('si: %d', [OffsetOf(client.si, client)]));
  Writeln(Format('buf: %d', [OffsetOf(client.buf, client)]));
  Writeln(Format('bufoutptr: %d', [OffsetOf(client.bufoutptr, client)]));
  Writeln(Format('buffered: %d', [OffsetOf(client.buffered, client)]));
  Writeln(Format('ultra_buffer_size: %d', [OffsetOf(client.ultra_buffer_size, client)]));
  Writeln(Format('ultra_buffer: %d', [OffsetOf(client.ultra_buffer, client)]));
  Writeln(Format('raw_buffer_size: %d', [OffsetOf(client.raw_buffer_size, client)]));
  Writeln(Format('raw_buffer: %d', [OffsetOf(client.raw_buffer, client)]));
  Writeln(Format('decompStream: %d', [OffsetOf(client.decompStream, client)]));
  Writeln(Format('decompStreamInited: %d', [OffsetOf(client.decompStreamInited, client)]));
  Writeln(Format('zlib_buffer: %d', [OffsetOf(client.zlib_buffer, client)]));
  Writeln(Format('zlibStream: %d', [OffsetOf(client.zlibStream, client)]));
  Writeln(Format('zlibStreamActive: %d', [OffsetOf(client.zlibStreamActive, client)]));
  Writeln(Format('cutZeros: %d', [OffsetOf(client.cutZeros, client)]));
  Writeln(Format('rectWidth: %d', [OffsetOf(client.rectWidth, client)]));
  Writeln(Format('rectColors: %d', [OffsetOf(client.rectColors, client)]));
  Writeln(Format('tightPalette: %d', [OffsetOf(client.tightPalette, client)]));
  Writeln(Format('tightPrevRow: %d', [OffsetOf(client.tightPrevRow, client)]));
  Writeln(Format('jpegError: %d', [OffsetOf(client.jpegError, client)]));
  Writeln(Format('jpegSrcManager: %d', [OffsetOf(client.jpegSrcManager, client)]));
  Writeln(Format('jpegBufferPtr: %d', [OffsetOf(client.jpegBufferPtr, client)]));
  Writeln(Format('jpegBufferLen: %d', [OffsetOf(client.jpegBufferLen, client)]));
  Writeln(Format('rcSource: %d', [OffsetOf(client.rcSource, client)]));
  Writeln(Format('rcMask: %d', [OffsetOf(client.rcMask, client)]));
  Writeln(Format('clientData: %d', [OffsetOf(client.clientData, client)]));
  Writeln(Format('vncRec: %d', [OffsetOf(client.vncRec, client)]));
  Writeln(Format('KeyboardLedStateEnabled: %d', [OffsetOf(client.KeyboardLedStateEnabled, client)]));
  Writeln(Format('CurrentKeyboardLedState: %d', [OffsetOf(client.CurrentKeyboardLedState, client)]));
  Writeln(Format('canHandleNewFBSize: %d', [OffsetOf(client.canHandleNewFBSize, client)]));
  Writeln(Format('HandleTextChat: %d', [OffsetOf(client.HandleTextChat, client)]));
  Writeln(Format('HandleKeyboardLedState: %d', [OffsetOf(client.HandleKeyboardLedState, client)]));
  Writeln(Format('HandleCursorPos: %d', [OffsetOf(client.HandleCursorPos, client)]));
  Writeln(Format('SoftCursorLockArea: %d', [OffsetOf(client.SoftCursorLockArea, client)]));
  Writeln(Format('SoftCursorUnlockScreen: %d', [OffsetOf(client.SoftCursorUnlockScreen, client)]));
  Writeln(Format('GotFrameBufferUpdate: %d', [OffsetOf(client.GotFrameBufferUpdate, client)]));
  Writeln(Format('GetPassword: %d', [OffsetOf(client.GetPassword, client)]));
  Writeln(Format('MallocFrameBuffer: %d', [OffsetOf(client.MallocFrameBuffer, client)]));
  Writeln(Format('GotXCutText: %d', [OffsetOf(client.GotXCutText, client)]));
  Writeln(Format('Bell: %d', [OffsetOf(client.Bell, client)]));
  Writeln(Format('GotCursorShape: %d', [OffsetOf(client.GotCursorShape, client)]));
  Writeln(Format('GotCopyRect: %d', [OffsetOf(client.GotCopyRect, client)]));
  Writeln(Format('supportedMessages: %d', [OffsetOf(client.supportedMessages, client)]));
  Writeln(Format('major: %d', [OffsetOf(client.major, client)]));
  Writeln(Format('minor: %d', [OffsetOf(client.minor, client)]));
  Writeln(Format('authScheme: %d', [OffsetOf(client.authScheme, client)]));
  Writeln(Format('subAuthScheme: %d', [OffsetOf(client.subAuthScheme, client)]));
  Writeln(Format('tlsSession: %d', [OffsetOf(client.tlsSession, client)]));
  Writeln(Format('GetCredential: %d', [OffsetOf(client.GetCredential, client)]));
  Writeln(Format('clientAuthSchemes: %d', [OffsetOf(client.clientAuthSchemes, client)]));
  Writeln(Format('destHost: %d', [OffsetOf(client.destHost, client)]));
  Writeln(Format('destPort: %d', [OffsetOf(client.destPort, client)]));
  Writeln(Format('QoS_DSCP: %d', [OffsetOf(client.QoS_DSCP, client)]));
  Writeln(Format('HandleXvpMsg: %d', [OffsetOf(client.HandleXvpMsg, client)]));
  Writeln(Format('listenSock: %d', [OffsetOf(client.listenSock, client)]));
  Writeln(Format('FinishedFrameBufferUpdate: %d', [OffsetOf(client.FinishedFrameBufferUpdate, client)]));
  Writeln(Format('listenAddress: %d', [OffsetOf(client.listenAddress, client)]));
  Writeln(Format('listen6Sock: %d', [OffsetOf(client.listen6Sock, client)]));
  Writeln(Format('listen6Address: %d', [OffsetOf(client.listen6Address, client)]));
  WriteLn();
  Writeln(Format('listen6Port: %d', [OffsetOf(client.listen6Port, client)]));
  Writeln(Format('outputWindow: %d', [OffsetOf(client.outputWindow, client)]));
  Writeln(Format('LockWriteToTLS: %d', [OffsetOf(client.LockWriteToTLS, client)]));
  Writeln(Format('UnlockWriteToTLS: %d', [OffsetOf(client.UnlockWriteToTLS, client)]));
  Writeln(Format('GotFillRect: %d', [OffsetOf(client.GotFillRect, client)]));
  Writeln(Format('GotBitmap: %d', [OffsetOf(client.GotBitmap, client)]));
  Writeln(Format('GotJpeg: %d', [OffsetOf(client.GotJpeg, client)]));
  Writeln(Format('saslconn: %d', [OffsetOf(client.saslconn, client)]));
  Writeln(Format('saslDecoded: %d', [OffsetOf(client.saslDecoded, client)]));
  Writeln(Format('saslDecodedLength: %d', [OffsetOf(client.saslDecodedLength, client)]));
  Writeln(Format('saslDecodedOffset: %d', [OffsetOf(client.saslDecodedOffset, client)]));
  Writeln(Format('saslSecret: %d', [OffsetOf(client.saslSecret, client)]));

  // Verhindert das sofortige Schliessen des Konsolenfensters unter Windows
  Readln; end;

begin
  main;
end.

