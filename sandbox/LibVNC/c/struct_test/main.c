


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

int main(int argc, char* argv[]) {

printf("gz_header %ld\n", sizeof(gz_header));   // 80
printf("z_stream %ld\n", sizeof(z_stream));   // 80
//printf("MUTEX(tlsRwMutex) %ld\n", sizeof(MUTEX(tlsRwMutex)));
printf("pthread_mutex_t size: %ld\n", sizeof(pthread_mutex_t));  // 40

printf("ZLIB_BUFFER_SIZE %d\n", ZLIB_BUFFER_SIZE);   // 80

printf("\n");
printf("\n");
printf("\n");

   printf("rfbClient size: %zu\n", sizeof(rfbClient));   // 360032

printf("\n");

	printf("=== Offsets für Struktur rfbClient ===\n");
	printf("frameBuffer: %zu\n", offsetof(rfbClient, frameBuffer));
	printf("width: %zu\n", offsetof(rfbClient, width));
	printf("height: %zu\n", offsetof(rfbClient, height));
	printf("endianTest: %zu\n", offsetof(rfbClient, endianTest));
	printf("appData: %zu\n", offsetof(rfbClient, appData));
	printf("programName: %zu\n", offsetof(rfbClient, programName));
	printf("serverHost: %zu\n", offsetof(rfbClient, serverHost));
	printf("serverPort: %zu\n", offsetof(rfbClient, serverPort));
	printf("listenSpecified: %zu\n", offsetof(rfbClient, listenSpecified));
	printf("listenPort: %zu\n", offsetof(rfbClient, listenPort));
	printf("flashPort: %zu\n", offsetof(rfbClient, flashPort));
	printf("updateRect: %zu\n", offsetof(rfbClient, updateRect));
	printf("buffer: %zu\n", offsetof(rfbClient, buffer));
	printf("sock: %zu\n", offsetof(rfbClient, sock));
	printf("canUseCoRRE: %zu\n", offsetof(rfbClient, canUseCoRRE));
	printf("canUseHextile: %zu\n", offsetof(rfbClient, canUseHextile));
	printf("desktopName: %zu\n", offsetof(rfbClient, desktopName));
	printf("format: %zu\n", offsetof(rfbClient, format));
	printf("si: %zu\n", offsetof(rfbClient, si));
	printf("buf: %zu\n", offsetof(rfbClient, buf));
	printf("bufoutptr: %zu\n", offsetof(rfbClient, bufoutptr));
	printf("buffered: %zu\n", offsetof(rfbClient, buffered));
	printf("ultra_buffer_size: %zu\n", offsetof(rfbClient, ultra_buffer_size));
	printf("ultra_buffer: %zu\n", offsetof(rfbClient, ultra_buffer));
	printf("raw_buffer_size: %zu\n", offsetof(rfbClient, raw_buffer_size));
	printf("raw_buffer: %zu\n", offsetof(rfbClient, raw_buffer));
	printf("decompStream: %zu\n", offsetof(rfbClient, decompStream));
	printf("decompStreamInited: %zu\n", offsetof(rfbClient, decompStreamInited));
	printf("zlib_buffer: %zu\n", offsetof(rfbClient, zlib_buffer));
	printf("zlibStream: %zu\n", offsetof(rfbClient, zlibStream));
	printf("zlibStreamActive: %zu\n", offsetof(rfbClient, zlibStreamActive));
	printf("cutZeros: %zu\n", offsetof(rfbClient, cutZeros));
	printf("rectWidth: %zu\n", offsetof(rfbClient, rectWidth));
	printf("rectColors: %zu\n", offsetof(rfbClient, rectColors));
	printf("tightPalette: %zu\n", offsetof(rfbClient, tightPalette));
	printf("tightPrevRow: %zu\n", offsetof(rfbClient, tightPrevRow));
	printf("jpegError: %zu\n", offsetof(rfbClient, jpegError));
	printf("jpegSrcManager: %zu\n", offsetof(rfbClient, jpegSrcManager));
	printf("jpegBufferPtr: %zu\n", offsetof(rfbClient, jpegBufferPtr));
	printf("jpegBufferLen: %zu\n", offsetof(rfbClient, jpegBufferLen));
	printf("rcSource: %zu\n", offsetof(rfbClient, rcSource));
	printf("rcMask: %zu\n", offsetof(rfbClient, rcMask));
	printf("clientData: %zu\n", offsetof(rfbClient, clientData));
	printf("vncRec: %zu\n", offsetof(rfbClient, vncRec));
	printf("KeyboardLedStateEnabled: %zu\n", offsetof(rfbClient, KeyboardLedStateEnabled));
	printf("CurrentKeyboardLedState: %zu\n", offsetof(rfbClient, CurrentKeyboardLedState));
	printf("canHandleNewFBSize: %zu\n", offsetof(rfbClient, canHandleNewFBSize));
	printf("HandleTextChat: %zu\n", offsetof(rfbClient, HandleTextChat));
	printf("HandleKeyboardLedState: %zu\n", offsetof(rfbClient, HandleKeyboardLedState));
	printf("HandleCursorPos: %zu\n", offsetof(rfbClient, HandleCursorPos));
	printf("SoftCursorLockArea: %zu\n", offsetof(rfbClient, SoftCursorLockArea));
	printf("SoftCursorUnlockScreen: %zu\n", offsetof(rfbClient, SoftCursorUnlockScreen));
	printf("GotFrameBufferUpdate: %zu\n", offsetof(rfbClient, GotFrameBufferUpdate));
	printf("GetPassword: %zu\n", offsetof(rfbClient, GetPassword));
	printf("MallocFrameBuffer: %zu\n", offsetof(rfbClient, MallocFrameBuffer));
	printf("GotXCutText: %zu\n", offsetof(rfbClient, GotXCutText));
	printf("Bell: %zu\n", offsetof(rfbClient, Bell));
	printf("GotCursorShape: %zu\n", offsetof(rfbClient, GotCursorShape));
	printf("GotCopyRect: %zu\n", offsetof(rfbClient, GotCopyRect));
	printf("supportedMessages: %zu\n", offsetof(rfbClient, supportedMessages));
	printf("major: %zu\n", offsetof(rfbClient, major));
	printf("minor: %zu\n", offsetof(rfbClient, minor));
	printf("authScheme: %zu\n", offsetof(rfbClient, authScheme));
	printf("subAuthScheme: %zu\n", offsetof(rfbClient, subAuthScheme));
	printf("tlsSession: %zu\n", offsetof(rfbClient, tlsSession));
	printf("GetCredential: %zu\n", offsetof(rfbClient, GetCredential));
	printf("clientAuthSchemes: %zu\n", offsetof(rfbClient, clientAuthSchemes));
	printf("destHost: %zu\n", offsetof(rfbClient, destHost));
	printf("destPort: %zu\n", offsetof(rfbClient, destPort));
	printf("QoS_DSCP: %zu\n", offsetof(rfbClient, QoS_DSCP));
	printf("HandleXvpMsg: %zu\n", offsetof(rfbClient, HandleXvpMsg));
	printf("listenSock: %zu\n", offsetof(rfbClient, listenSock));
	printf("FinishedFrameBufferUpdate: %zu\n", offsetof(rfbClient, FinishedFrameBufferUpdate));
	printf("listenAddress: %zu\n", offsetof(rfbClient, listenAddress));
	printf("listen6Sock: %zu\n", offsetof(rfbClient, listen6Sock));
	printf("listen6Address: %zu\n", offsetof(rfbClient, listen6Address));
printf("\n");
	printf("listen6Port: %zu\n", offsetof(rfbClient, listen6Port));
	printf("outputWindow: %zu\n", offsetof(rfbClient, outputWindow));
	printf("LockWriteToTLS: %zu\n", offsetof(rfbClient, LockWriteToTLS));
	printf("UnlockWriteToTLS: %zu\n", offsetof(rfbClient, UnlockWriteToTLS));
	printf("GotFillRect: %zu\n", offsetof(rfbClient, GotFillRect));
	printf("GotBitmap: %zu\n", offsetof(rfbClient, GotBitmap));
	printf("GotJpeg: %zu\n", offsetof(rfbClient, GotJpeg));
	printf("saslconn: %zu\n", offsetof(rfbClient, saslconn));
	printf("saslDecoded: %zu\n", offsetof(rfbClient, saslDecoded));
	printf("saslDecodedLength: %zu\n", offsetof(rfbClient, saslDecodedLength));
	printf("saslDecodedOffset: %zu\n", offsetof(rfbClient, saslDecodedOffset));
	printf("saslSecret: %zu\n", offsetof(rfbClient, saslSecret));


    return 0;
}

