


// gcc main.c -o main `pkg-config --cflags --libs sdl2` -lvncclient -lvncserver

// virt-viewer --connect vnc://127.0.0.1:5901

// remote-viewer vnc://127.0.0.1:5901

#include <zlib.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <rfb/rfb.h>
#include <rfb/rfbclient.h>

#include <stdio.h>
#include <stddef.h>
#include <stdint.h>
// Hier den Pfad zu deinen originalen LibVNCServer-Headern eintragen
// #include <rfb/rfb.h> 

// Falls du die Header nicht direkt einbinden willst, nutze die Struktur so:
typedef struct _rfbClientRec rfbClientRec; 

int main() {
   printf("rfbClientRec Gesamtgroesse: %zu\n\n", sizeof(rfbClientRec));
    printf("=== Offsets fuer Struktur _rfbClientRec ===\n");
    
    printf("screen: %zu\n", offsetof(rfbClientRec, screen));
    printf("scaledScreen: %zu\n", offsetof(rfbClientRec, scaledScreen));
    printf("PalmVNC: %zu\n", offsetof(rfbClientRec, PalmVNC));
    printf("clientData: %zu\n", offsetof(rfbClientRec, clientData));
    printf("clientGoneHook: %zu\n", offsetof(rfbClientRec, clientGoneHook));
    printf("sock: %zu\n", offsetof(rfbClientRec, sock));
    printf("host: %zu\n", offsetof(rfbClientRec, host));
    printf("protocolMajorVersion: %zu\n", offsetof(rfbClientRec, protocolMajorVersion));
    printf("protocolMinorVersion: %zu\n", offsetof(rfbClientRec, protocolMinorVersion));
    printf("client_thread: %zu\n", offsetof(rfbClientRec, client_thread));
    printf("state: %zu\n", offsetof(rfbClientRec, state));
    printf("reverseConnection: %zu\n", offsetof(rfbClientRec, reverseConnection));
    printf("onHold: %zu\n", offsetof(rfbClientRec, onHold));
    printf("readyForSetColourMapEntries: %zu\n", offsetof(rfbClientRec, readyForSetColourMapEntries));
    printf("useCopyRect: %zu\n", offsetof(rfbClientRec, useCopyRect));
    printf("preferredEncoding: %zu\n", offsetof(rfbClientRec, preferredEncoding));
    printf("correMaxWidth: %zu\n", offsetof(rfbClientRec, correMaxWidth));
    printf("correMaxHeight: %zu\n", offsetof(rfbClientRec, correMaxHeight));
    printf("viewOnly: %zu\n", offsetof(rfbClientRec, viewOnly));
    printf("authChallenge: %zu\n", offsetof(rfbClientRec, authChallenge));
    printf("copyRegion: %zu\n", offsetof(rfbClientRec, copyRegion));
    printf("copyDX: %zu\n", offsetof(rfbClientRec, copyDX));
    printf("copyDY: %zu\n", offsetof(rfbClientRec, copyDY));
    printf("modifiedRegion: %zu\n", offsetof(rfbClientRec, modifiedRegion));
    printf("requestedRegion: %zu\n", offsetof(rfbClientRec, requestedRegion));
    printf("startDeferring: %zu\n", offsetof(rfbClientRec, startDeferring));
    printf("startPtrDeferring: %zu\n", offsetof(rfbClientRec, startPtrDeferring));
    printf("lastPtrX: %zu\n", offsetof(rfbClientRec, lastPtrX));
    printf("lastPtrY: %zu\n", offsetof(rfbClientRec, lastPtrY));
    printf("lastPtrButtons: %zu\n", offsetof(rfbClientRec, lastPtrButtons));
    printf("translateFn: %zu\n", offsetof(rfbClientRec, translateFn));
    printf("translateLookupTable: %zu\n", offsetof(rfbClientRec, translateLookupTable));
    printf("format: %zu\n", offsetof(rfbClientRec, format));
    printf("updateBuf: %zu\n", offsetof(rfbClientRec, updateBuf));
    printf("ublen: %zu\n", offsetof(rfbClientRec, ublen));
    printf("statEncList: %zu\n", offsetof(rfbClientRec, statEncList));
    printf("statMsgList: %zu\n", offsetof(rfbClientRec, statMsgList));
    printf("rawBytesEquivalent: %zu\n", offsetof(rfbClientRec, rawBytesEquivalent));
    printf("bytesSent: %zu\n", offsetof(rfbClientRec, bytesSent));
    printf("compStream: %zu\n", offsetof(rfbClientRec, compStream));
    printf("compStreamInited: %zu\n", offsetof(rfbClientRec, compStreamInited));
    printf("zlibCompressLevel: %zu\n", offsetof(rfbClientRec, zlibCompressLevel));
    printf("tightQualityLevel: %zu\n", offsetof(rfbClientRec, tightQualityLevel));
    printf("zsStruct: %zu\n", offsetof(rfbClientRec, zsStruct));
    printf("zsActive: %zu\n", offsetof(rfbClientRec, zsActive));
    printf("zsLevel: %zu\n", offsetof(rfbClientRec, zsLevel));
    printf("tightCompressLevel: %zu\n", offsetof(rfbClientRec, tightCompressLevel));
    printf("compStreamInitedLZO: %zu\n", offsetof(rfbClientRec, compStreamInitedLZO));
    printf("lzoWrkMem: %zu\n", offsetof(rfbClientRec, lzoWrkMem));
    printf("fileTransfer: %zu\n", offsetof(rfbClientRec, fileTransfer));
    printf("lastKeyboardLedState: %zu\n", offsetof(rfbClientRec, lastKeyboardLedState));
    printf("enableSupportedMessages: %zu\n", offsetof(rfbClientRec, enableSupportedMessages));
    printf("enableSupportedEncodings: %zu\n", offsetof(rfbClientRec, enableSupportedEncodings));
    printf("enableServerIdentity: %zu\n", offsetof(rfbClientRec, enableServerIdentity));
    printf("enableKeyboardLedState: %zu\n", offsetof(rfbClientRec, enableKeyboardLedState));
    printf("enableLastRectEncoding: %zu\n", offsetof(rfbClientRec, enableLastRectEncoding));
    printf("enableCursorShapeUpdates: %zu\n", offsetof(rfbClientRec, enableCursorShapeUpdates));
    printf("enableCursorPosUpdates: %zu\n", offsetof(rfbClientRec, enableCursorPosUpdates));
    printf("useRichCursorEncoding: %zu\n", offsetof(rfbClientRec, useRichCursorEncoding));
    printf("cursorWasChanged: %zu\n", offsetof(rfbClientRec, cursorWasChanged));
    printf("cursorWasMoved: %zu\n", offsetof(rfbClientRec, cursorWasMoved));
    printf("cursorX: %zu\n", offsetof(rfbClientRec, cursorX));
    printf("cursorY: %zu\n", offsetof(rfbClientRec, cursorY));
    printf("useNewFBSize: %zu\n", offsetof(rfbClientRec, useNewFBSize));
    printf("newFBSizePending: %zu\n", offsetof(rfbClientRec, newFBSizePending));
    printf("prev: %zu\n", offsetof(rfbClientRec, prev));
    printf("next: %zu\n", offsetof(rfbClientRec, next));
    printf("refCount: %zu\n", offsetof(rfbClientRec, refCount));
    printf("refCountMutex: %zu\n", offsetof(rfbClientRec, refCountMutex));
    printf("deleteCond: %zu\n", offsetof(rfbClientRec, deleteCond));
    printf("outputMutex: %zu\n", offsetof(rfbClientRec, outputMutex));
printf("updateMutex: %zu\n", offsetof(rfbClientRec, updateMutex));
printf("updateCond: %zu\n", offsetof(rfbClientRec, updateCond));
printf("zrleData: %zu\n", offsetof(rfbClientRec, zrleData));
printf("zywrleLevel: %zu\n", offsetof(rfbClientRec, zywrleLevel));
printf("zywrleBuf: %zu\n", offsetof(rfbClientRec, zywrleBuf));
printf("progressiveSliceY: %zu\n", offsetof(rfbClientRec, progressiveSliceY));
printf("extensions: %zu\n", offsetof(rfbClientRec, extensions));
printf("zrleBeforeBuf: %zu\n", offsetof(rfbClientRec, zrleBeforeBuf));
printf("paletteHelper: %zu\n", offsetof(rfbClientRec, paletteHelper));
printf("sendMutex: %zu\n", offsetof(rfbClientRec, sendMutex));
printf("beforeEncBuf: %zu\n", offsetof(rfbClientRec, beforeEncBuf));
printf("beforeEncBufSize: %zu\n", offsetof(rfbClientRec, beforeEncBufSize));
printf("afterEncBuf: %zu\n", offsetof(rfbClientRec, afterEncBuf));
printf("afterEncBufSize: %zu\n", offsetof(rfbClientRec, afterEncBufSize));
printf("afterEncBufLen: %zu\n", offsetof(rfbClientRec, afterEncBufLen));
printf("tightEncoding: %zu\n", offsetof(rfbClientRec, tightEncoding));
printf("turboSubsampLevel: %zu\n", offsetof(rfbClientRec, turboSubsampLevel));
printf("turboQualityLevel: %zu\n", offsetof(rfbClientRec, turboQualityLevel));
printf("sslctx: %zu\n", offsetof(rfbClientRec, sslctx));
printf("wsctx: %zu\n", offsetof(rfbClientRec, wsctx));
printf("wspath: %zu\n", offsetof(rfbClientRec, wspath));
printf("pipe_notify_client_thread: %zu\n", offsetof(rfbClientRec, pipe_notify_client_thread));
printf("clientFramebufferUpdateRequestHook: %zu\n", offsetof(rfbClientRec, clientFramebufferUpdateRequestHook));
printf("useExtDesktopSize: %zu\n", offsetof(rfbClientRec, useExtDesktopSize));
printf("requestedDesktopSizeChange: %zu\n", offsetof(rfbClientRec, requestedDesktopSizeChange));
printf("lastDesktopSizeChangeError: %zu\n", offsetof(rfbClientRec, lastDesktopSizeChangeError));
printf("enableExtendedClipboard: %zu\n", offsetof(rfbClientRec, enableExtendedClipboard));
printf("extClipboardUserCap: %zu\n", offsetof(rfbClientRec, extClipboardUserCap));
printf("extClipboardMaxUnsolicitedSize: %zu\n", offsetof(rfbClientRec, extClipboardMaxUnsolicitedSize));
printf("extClipboardData: %zu\n", offsetof(rfbClientRec, extClipboardData));
printf("extClipboardDataSize: %zu\n", offsetof(rfbClientRec, extClipboardDataSize));
printf("tightUsePixelFormat24: %zu\n", offsetof(rfbClientRec, tightUsePixelFormat24));
printf("tightTJ: %zu\n", offsetof(rfbClientRec, tightTJ));
printf("tightPngDstDataLen: %zu\n", offsetof(rfbClientRec, tightPngDstDataLen));
return 0;}

