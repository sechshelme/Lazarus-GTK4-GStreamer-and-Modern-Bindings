


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
    printf("rfbScreenInfo Gesamtgroesse: %zu\n\n", sizeof(rfbScreenInfo));
    printf("=== Offsets fuer Struktur _rfbScreenInfo ===\n");
    
    printf("scaledScreenNext: %zu\n", offsetof(rfbScreenInfo, scaledScreenNext));
    printf("scaledScreenRefCount: %zu\n", offsetof(rfbScreenInfo, scaledScreenRefCount));
    printf("width: %zu\n", offsetof(rfbScreenInfo, width));
    printf("paddedWidthInBytes: %zu\n", offsetof(rfbScreenInfo, paddedWidthInBytes));
    printf("height: %zu\n", offsetof(rfbScreenInfo, height));
    printf("depth: %zu\n", offsetof(rfbScreenInfo, depth));
    printf("bitsPerPixel: %zu\n", offsetof(rfbScreenInfo, bitsPerPixel));
    printf("sizeInBytes: %zu\n", offsetof(rfbScreenInfo, sizeInBytes));
    printf("blackPixel: %zu\n", offsetof(rfbScreenInfo, blackPixel));
    printf("whitePixel: %zu\n", offsetof(rfbScreenInfo, whitePixel));
    printf("screenData: %zu\n", offsetof(rfbScreenInfo, screenData));
    printf("serverFormat: %zu\n", offsetof(rfbScreenInfo, serverFormat));
    printf("colourMap: %zu\n", offsetof(rfbScreenInfo, colourMap));
    printf("desktopName: %zu\n", offsetof(rfbScreenInfo, desktopName));
    printf("thisHost: %zu\n", offsetof(rfbScreenInfo, thisHost));
    printf("autoPort: %zu\n", offsetof(rfbScreenInfo, autoPort));
    printf("port: %zu\n", offsetof(rfbScreenInfo, port));
    printf("listenSock: %zu\n", offsetof(rfbScreenInfo, listenSock));
    printf("maxSock: %zu\n", offsetof(rfbScreenInfo, maxSock));
    printf("maxFd: %zu\n", offsetof(rfbScreenInfo, maxFd));
    printf("allFds: %zu\n", offsetof(rfbScreenInfo, allFds));
    printf("socketState: %zu\n", offsetof(rfbScreenInfo, socketState));
    printf("inetdSock: %zu\n", offsetof(rfbScreenInfo, inetdSock));
    printf("inetdInitDone: %zu\n", offsetof(rfbScreenInfo, inetdInitDone));
    printf("udpPort: %zu\n", offsetof(rfbScreenInfo, udpPort));
    printf("udpSock: %zu\n", offsetof(rfbScreenInfo, udpSock));
    printf("udpClient: %zu\n", offsetof(rfbScreenInfo, udpClient));
    printf("udpSockConnected: %zu\n", offsetof(rfbScreenInfo, udpSockConnected));
    printf("udpRemoteAddr: %zu\n", offsetof(rfbScreenInfo, udpRemoteAddr));
    printf("maxClientWait: %zu\n", offsetof(rfbScreenInfo, maxClientWait));
    printf("httpInitDone: %zu\n", offsetof(rfbScreenInfo, httpInitDone));
    printf("httpEnableProxyConnect: %zu\n", offsetof(rfbScreenInfo, httpEnableProxyConnect));
    printf("httpPort: %zu\n", offsetof(rfbScreenInfo, httpPort));
    printf("httpDir: %zu\n", offsetof(rfbScreenInfo, httpDir));
    printf("httpListenSock: %zu\n", offsetof(rfbScreenInfo, httpListenSock));
    printf("httpSock: %zu\n", offsetof(rfbScreenInfo, httpSock));
    printf("passwordCheck: %zu\n", offsetof(rfbScreenInfo, passwordCheck));
    printf("authPasswdData: %zu\n", offsetof(rfbScreenInfo, authPasswdData));
    printf("authPasswdFirstViewOnly: %zu\n", offsetof(rfbScreenInfo, authPasswdFirstViewOnly));
    printf("maxRectsPerUpdate: %zu\n", offsetof(rfbScreenInfo, maxRectsPerUpdate));
    printf("deferUpdateTime: %zu\n", offsetof(rfbScreenInfo, deferUpdateTime));
    printf("alwaysShared: %zu\n", offsetof(rfbScreenInfo, alwaysShared));
    printf("neverShared: %zu\n", offsetof(rfbScreenInfo, neverShared));
    printf("dontDisconnect: %zu\n", offsetof(rfbScreenInfo, dontDisconnect));
    printf("clientHead: %zu\n", offsetof(rfbScreenInfo, clientHead));
    printf("pointerClient: %zu\n", offsetof(rfbScreenInfo, pointerClient));
    printf("cursorX: %zu\n", offsetof(rfbScreenInfo, cursorX));
    printf("cursorY: %zu\n", offsetof(rfbScreenInfo, cursorY));
    printf("underCursorBufferLen: %zu\n", offsetof(rfbScreenInfo, underCursorBufferLen));
    printf("underCursorBuffer: %zu\n", offsetof(rfbScreenInfo, underCursorBuffer));
    printf("dontConvertRichCursorToXCursor: %zu\n", offsetof(rfbScreenInfo, dontConvertRichCursorToXCursor));
    printf("cursor: %zu\n", offsetof(rfbScreenInfo, cursor));
    printf("frameBuffer: %zu\n", offsetof(rfbScreenInfo, frameBuffer));
    printf("kbdAddEvent: %zu\n", offsetof(rfbScreenInfo, kbdAddEvent));
    printf("kbdReleaseAllKeys: %zu\n", offsetof(rfbScreenInfo, kbdReleaseAllKeys));
    printf("ptrAddEvent: %zu\n", offsetof(rfbScreenInfo, ptrAddEvent));
    printf("setXCutText: %zu\n", offsetof(rfbScreenInfo, setXCutText));
    printf("getCursorPtr: %zu\n", offsetof(rfbScreenInfo, getCursorPtr));
    printf("setTranslateFunction: %zu\n", offsetof(rfbScreenInfo, setTranslateFunction));
    printf("setSingleWindow: %zu\n", offsetof(rfbScreenInfo, setSingleWindow));
    printf("setServerInput: %zu\n", offsetof(rfbScreenInfo, setServerInput));
    printf("getFileTransferPermission: %zu\n", offsetof(rfbScreenInfo, getFileTransferPermission));
    printf("setTextChat: %zu\n", offsetof(rfbScreenInfo, setTextChat));
    printf("newClientHook: %zu\n", offsetof(rfbScreenInfo, newClientHook));
    printf("displayHook: %zu\n", offsetof(rfbScreenInfo, displayHook));
    printf("getKeyboardLedStateHook: %zu\n", offsetof(rfbScreenInfo, getKeyboardLedStateHook));
printf("cursorMutex: %zu\n", offsetof(rfbScreenInfo, cursorMutex));
printf("backgroundLoop: %zu\n", offsetof(rfbScreenInfo, backgroundLoop));
printf("ignoreSIGPIPE: %zu\n", offsetof(rfbScreenInfo, ignoreSIGPIPE));
printf("progressiveSliceHeight: %zu\n", offsetof(rfbScreenInfo, progressiveSliceHeight));
printf("listenInterface: %zu\n", offsetof(rfbScreenInfo, listenInterface));
printf("deferPtrUpdateTime: %zu\n", offsetof(rfbScreenInfo, deferPtrUpdateTime));
printf("handleEventsEagerly: %zu\n", offsetof(rfbScreenInfo, handleEventsEagerly));
printf("versionString: %zu\n", offsetof(rfbScreenInfo, versionString));
printf("protocolMajorVersion: %zu\n", offsetof(rfbScreenInfo, protocolMajorVersion));
printf("protocolMinorVersion: %zu\n", offsetof(rfbScreenInfo, protocolMinorVersion));
printf("permitFileTransfer: %zu\n", offsetof(rfbScreenInfo, permitFileTransfer));
printf("displayFinishedHook: %zu\n", offsetof(rfbScreenInfo, displayFinishedHook));
printf("xvpHook: %zu\n", offsetof(rfbScreenInfo, xvpHook));
printf("sslkeyfile: %zu\n", offsetof(rfbScreenInfo, sslkeyfile));
printf("sslcertfile: %zu\n", offsetof(rfbScreenInfo, sslcertfile));
printf("ipv6port: %zu\n", offsetof(rfbScreenInfo, ipv6port));
printf("listen6Interface: %zu\n", offsetof(rfbScreenInfo, listen6Interface));
printf("listen6Sock: %zu\n", offsetof(rfbScreenInfo, listen6Sock));
printf("http6Port: %zu\n", offsetof(rfbScreenInfo, http6Port));
printf("httpListen6Sock: %zu\n", offsetof(rfbScreenInfo, httpListen6Sock));
printf("setDesktopSizeHook: %zu\n", offsetof(rfbScreenInfo, setDesktopSizeHook));
printf("numberOfExtDesktopScreensHook: %zu\n", offsetof(rfbScreenInfo, numberOfExtDesktopScreensHook));
printf("getExtDesktopScreenHook: %zu\n", offsetof(rfbScreenInfo, getExtDesktopScreenHook));
printf("fdQuota: %zu\n", offsetof(rfbScreenInfo, fdQuota));
printf("listener_thread: %zu\n", offsetof(rfbScreenInfo, listener_thread));
printf("pipe_notify_listener_thread: %zu\n", offsetof(rfbScreenInfo, pipe_notify_listener_thread));
printf("setXCutTextUTF8: %zu\n", offsetof(rfbScreenInfo, setXCutTextUTF8));
return 0;
}
