#ifndef RFB_H
#define RFB_H
/**
 * @defgroup libvncserver_api LibVNCServer API Reference
 * @{
 */

/**
 * @file rfb.h
 */

/*
 *  Copyright (C) 2005 Rohit Kumar <rokumar@novell.com>,
 *                     Johannes E. Schindelin <johannes.schindelin@gmx.de>
 *  Copyright (C) 2002 RealVNC Ltd.
 *  OSXvnc Copyright (C) 2001 Dan McGuirk <mcguirk@incompleteness.net>.
 *  Original Xvnc code Copyright (C) 1999 AT&T Laboratories Cambridge.  
 *  All Rights Reserved.
 *
 *  This is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This software is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this software; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307,
 *  USA.
 */


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <rfb/rfbproto.h>

#if defined(ANDROID) || defined(LIBVNCSERVER_HAVE_ANDROID)
#include <arpa/inet.h>
#include <sys/select.h>
#endif

#ifdef LIBVNCSERVER_HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif

#ifdef WIN32
typedef UINT32 in_addr_t;
#include <winsock2.h>
#ifdef LIBVNCSERVER_HAVE_WS2TCPIP_H
#undef socklen_t
#include <ws2tcpip.h>
#endif
#ifdef _MSC_VER
#pragma warning(disable:4996)
#endif
#endif

#include <rfb/threading.h>

/* if you use pthreads, but don't define LIBVNCSERVER_HAVE_LIBPTHREAD, the structs
   get all mixed up. So this gives a linker error reminding you to compile
   the library and your application (at least the parts including rfb.h)
   with the same support for pthreads. */
#ifdef LIBVNCSERVER_HAVE_LIBPTHREAD
#ifdef LIBVNCSERVER_HAVE_LIBZ
#define rfbInitServer rfbInitServerWithPthreadsAndZRLE
#else
#define rfbInitServer rfbInitServerWithPthreadsButWithoutZRLE
#endif
#else
#ifdef LIBVNCSERVER_HAVE_LIBZ
#define rfbInitServer rfbInitServerWithoutPthreadsButWithZRLE
#else
#define rfbInitServer rfbInitServerWithoutPthreadsAndZRLE
#endif
#endif

struct _rfbClientRec;
struct _rfbScreenInfo;
struct rfbCursor;

enum rfbNewClientAction {
	RFB_CLIENT_ACCEPT,
	RFB_CLIENT_ON_HOLD,
	RFB_CLIENT_REFUSE
};

enum rfbSocketState {
	RFB_SOCKET_INIT,
	RFB_SOCKET_READY,
	RFB_SOCKET_SHUTDOWN
};

typedef void (*rfbKbdAddEventProcPtr) (rfbBool down, rfbKeySym keySym, struct _rfbClientRec* cl);
typedef void (*rfbKbdReleaseAllKeysProcPtr) (struct _rfbClientRec* cl);
typedef void (*rfbPtrAddEventProcPtr) (int buttonMask, int x, int y, struct _rfbClientRec* cl);
typedef void (*rfbSetXCutTextProcPtr) (char* str,int len, struct _rfbClientRec* cl);
#ifdef LIBVNCSERVER_HAVE_LIBZ
typedef void (*rfbSetXCutTextUTF8ProcPtr) (char* str,int len, struct _rfbClientRec* cl);
#endif
typedef struct rfbCursor* (*rfbGetCursorProcPtr) (struct _rfbClientRec* pScreen);
typedef rfbBool (*rfbSetTranslateFunctionProcPtr)(struct _rfbClientRec* cl);
typedef rfbBool (*rfbPasswordCheckProcPtr)(struct _rfbClientRec* cl,const char* encryptedPassWord,int len);
typedef enum rfbNewClientAction (*rfbNewClientHookPtr)(struct _rfbClientRec* cl);
typedef void (*rfbDisplayHookPtr)(struct _rfbClientRec* cl);
typedef void (*rfbDisplayFinishedHookPtr)(struct _rfbClientRec* cl, int result);
/** support the capability to view the caps/num/scroll states of the X server */
typedef int  (*rfbGetKeyboardLedStateHookPtr)(struct _rfbScreenInfo* screen);
typedef rfbBool (*rfbXvpHookPtr)(struct _rfbClientRec* cl, uint8_t, uint8_t);
typedef int (*rfbSetDesktopSizeHookPtr)(int width, int height, int numScreens, struct rfbExtDesktopScreen* extDesktopScreens, struct _rfbClientRec* cl);
typedef int (*rfbNumberOfExtDesktopScreensPtr)(struct _rfbClientRec* cl);
typedef rfbBool (*rfbGetExtDesktopScreenPtr)(int seqnumber, struct rfbExtDesktopScreen *extDesktopScreen, struct _rfbClientRec* cl);
/**
 * If x==1 and y==1 then set the whole display
 * else find the window underneath x and y and set the framebuffer to the dimensions
 * of that window
 */
typedef void (*rfbSetSingleWindowProcPtr) (struct _rfbClientRec* cl, int x, int y);
/**
 * Status determines if the X11 server permits input from the local user
 * status==0 or 1
 */
typedef void (*rfbSetServerInputProcPtr) (struct _rfbClientRec* cl, int status);
/**
 * Permit the server to allow or deny filetransfers.   This is defaulted to deny
 * It is called when a client initiates a connection to determine if it is permitted.
 */
typedef int  (*rfbFileTransferPermitted) (struct _rfbClientRec* cl);
/** Handle the textchat messages */
typedef void (*rfbSetTextChat) (struct _rfbClientRec* cl, int length, char *string);

typedef struct {
  uint32_t count;
  rfbBool is16; /**< is the data format short? */
  union {
    uint8_t* bytes;
    uint16_t* shorts;
  } data; /**< there have to be count*3 entries */
} rfbColourMap;

/**
 * Security handling (RFB protocol version 3.7)
 */

typedef struct _rfbSecurity {
	uint8_t type;
	void (*handler)(struct _rfbClientRec* cl);
	struct _rfbSecurity* next;
} rfbSecurityHandler;

/**
 * Protocol extension handling.
 */

typedef struct _rfbProtocolExtension {
	/** returns FALSE if extension should be deactivated for client.
	   if newClient == NULL, it is always deactivated. */
	rfbBool (*newClient)(struct _rfbClientRec* client, void** data);
	/** returns FALSE if extension should be deactivated for client.
	   if init == NULL, it stays activated. */
	rfbBool (*init)(struct _rfbClientRec* client, void* data);
	/** if pseudoEncodings is not NULL, it contains a 0 terminated
	   list of the pseudo encodings handled by this extension. */
	int *pseudoEncodings;
	/** returns TRUE if that pseudo encoding is handled by the extension.
	   encodingNumber==0 means "reset encodings". */
	rfbBool (*enablePseudoEncoding)(struct _rfbClientRec* client,
			void** data, int encodingNumber);
	/** returns TRUE if message was handled */
	rfbBool (*handleMessage)(struct _rfbClientRec* client,
				void* data,
				const rfbClientToServerMsg* message);
	void (*close)(struct _rfbClientRec* client, void* data);
	void (*usage)(void);
	/** processArguments returns the number of handled arguments */
	int (*processArgument)(int argc, char *argv[]);
	struct _rfbProtocolExtension* next;
} rfbProtocolExtension;

typedef struct _rfbExtensionData {
	rfbProtocolExtension* extension;
	void* data;
	struct _rfbExtensionData* next;
} rfbExtensionData;

/**
 * Per-screen (framebuffer) structure.  There can be as many as you wish,
 * each serving different clients. However, you have to call
 * rfbProcessEvents for each of these.
 */

typedef struct _rfbScreenInfo
{
    /** this structure has children that are scaled versions of this screen */
    struct _rfbScreenInfo *scaledScreenNext;
    int scaledScreenRefCount;

    int width;
    int paddedWidthInBytes;
    int height;
    int depth;
    int bitsPerPixel;
    int sizeInBytes;

    rfbPixel blackPixel;
    rfbPixel whitePixel;

    /**
     * some screen specific data can be put into a struct where screenData
     * points to. You need this if you have more than one screen at the
     * same time while using the same functions.
     */
    void* screenData;

    /* additions by libvncserver */

    rfbPixelFormat serverFormat;
    rfbColourMap colourMap; /**< set this if rfbServerFormat.trueColour==FALSE */
    const char* desktopName;
    char thisHost[255];

    rfbBool autoPort;
    int port;
    rfbSocket listenSock;
    int maxSock;
    int maxFd;
#ifdef WIN32
    struct fd_set allFds;
#else
    fd_set allFds;
#endif

    enum rfbSocketState socketState;
    rfbSocket inetdSock;
    rfbBool inetdInitDone;

    int udpPort;
    rfbSocket udpSock;
    struct _rfbClientRec* udpClient;
    rfbBool udpSockConnected;
    struct sockaddr_in udpRemoteAddr;

    int maxClientWait;

    /* http stuff */
    rfbBool httpInitDone;
    rfbBool httpEnableProxyConnect;
    int httpPort;
    char* httpDir;
    rfbSocket httpListenSock;
    rfbSocket httpSock;

    rfbPasswordCheckProcPtr passwordCheck;
    void* authPasswdData;
    /** If rfbAuthPasswdData is given a list, this is the first
        view only password. */
    int authPasswdFirstViewOnly;

    /** send only this many rectangles in one update */
    int maxRectsPerUpdate;
    /** this is the amount of milliseconds to wait at least before sending
     * an update. */
    int deferUpdateTime;
    rfbBool alwaysShared;
    rfbBool neverShared;
    rfbBool dontDisconnect;
    struct _rfbClientRec* clientHead;
    struct _rfbClientRec* pointerClient;  /**< "Mutex" for pointer events */


    /* cursor */
    int cursorX, cursorY,underCursorBufferLen;
    char* underCursorBuffer;
    rfbBool dontConvertRichCursorToXCursor;
    struct rfbCursor* cursor;

    /**
     * the frameBuffer has to be supplied by the serving process.
     * The buffer will not be freed by
     */
    char* frameBuffer;
    rfbKbdAddEventProcPtr kbdAddEvent;
    rfbKbdReleaseAllKeysProcPtr kbdReleaseAllKeys;
    rfbPtrAddEventProcPtr ptrAddEvent;
    rfbSetXCutTextProcPtr setXCutText;
    rfbGetCursorProcPtr getCursorPtr;
    rfbSetTranslateFunctionProcPtr setTranslateFunction;
    rfbSetSingleWindowProcPtr setSingleWindow;
    rfbSetServerInputProcPtr  setServerInput;
    rfbFileTransferPermitted  getFileTransferPermission;
    rfbSetTextChat            setTextChat;

    /** newClientHook is called just after a new client is created */
    rfbNewClientHookPtr newClientHook;
    /** displayHook is called just before a frame buffer update */
    rfbDisplayHookPtr displayHook;

    /** These hooks are called to pass keyboard state back to the client */
    rfbGetKeyboardLedStateHookPtr getKeyboardLedStateHook;

    MUTEX(cursorMutex);
    rfbBool backgroundLoop;

    /** if TRUE, an ignoring signal handler is installed for SIGPIPE */
    rfbBool ignoreSIGPIPE;

    /** if not zero, only a slice of this height is processed every time
     * an update should be sent. This should make working on a slow
     * link more interactive. */
    int progressiveSliceHeight;

    in_addr_t listenInterface;
    int deferPtrUpdateTime;

    /** handle as many input events as possible (default off) */
    rfbBool handleEventsEagerly;

    /** rfbEncodingServerIdentity */
    char *versionString;

    /** What does the server tell the new clients which version it supports */
    int protocolMajorVersion;
    int protocolMinorVersion;

    /** command line authorization of file transfers */
    rfbBool permitFileTransfer;

    /** displayFinishedHook is called just after a frame buffer update */
    rfbDisplayFinishedHookPtr displayFinishedHook;
    /** xvpHook is called to handle an xvp client message */
    rfbXvpHookPtr xvpHook;
    char *sslkeyfile;
    char *sslcertfile;
    int ipv6port; /**< The port to listen on when using IPv6.  */
    char* listen6Interface;
    /* We have an additional IPv6 listen socket since there are systems that
       don't support dual binding sockets under *any* circumstances, for
       instance OpenBSD */
    rfbSocket listen6Sock;
    int http6Port;
    rfbSocket httpListen6Sock;
    /** hook to let client set resolution */
    rfbSetDesktopSizeHookPtr setDesktopSizeHook;
    /** Optional hooks to query ExtendedDesktopSize screen information.
     * If not set it is assumed only one screen is present spanning entire fb */
    rfbNumberOfExtDesktopScreensPtr numberOfExtDesktopScreensHook;
    rfbGetExtDesktopScreenPtr getExtDesktopScreenHook;
    /** This value between 0 and 1.0 defines which fraction of the maximum number
	of file descriptors LibVNCServer uses before denying new client connections.
	It is set to 0.5 per default. */
    float fdQuota;
    pthread_t listener_thread;
    int pipe_notify_listener_thread[2];
    rfbSetXCutTextUTF8ProcPtr setXCutTextUTF8;
} rfbScreenInfo, *rfbScreenInfoPtr;


/**
 * rfbTranslateFnType is the type of translation functions.
 */

typedef void (*rfbTranslateFnType)(char *table, rfbPixelFormat *in,
                                   rfbPixelFormat *out,
                                   char *iptr, char *optr,
                                   int bytesBetweenInputLines,
                                   int width, int height);


/* region stuff */

struct sraRegion;
typedef struct sraRegion* sraRegionPtr;

/*
 * Per-client structure.
 */

typedef void (*ClientGoneHookPtr)(struct _rfbClientRec* cl);
typedef void (*ClientFramebufferUpdateRequestHookPtr)(struct _rfbClientRec* cl, rfbFramebufferUpdateRequestMsg* furMsg);

typedef struct _rfbFileTransferData {
  int fd;
  int compressionEnabled;
  int fileSize;
  int numPackets;
  int receiving;
  int sending;
} rfbFileTransferData;


typedef struct _rfbStatList {
    uint32_t type;
    uint32_t sentCount;
    uint32_t bytesSent;
    uint32_t bytesSentIfRaw;
    uint32_t rcvdCount;
    uint32_t bytesRcvd;
    uint32_t bytesRcvdIfRaw;
    struct _rfbStatList *Next;
} rfbStatList;

typedef struct _rfbSslCtx rfbSslCtx;
typedef struct _wsCtx wsCtx;

#define UPDATE_BUF_SIZE 32768

typedef struct _rfbClientRec {
    rfbScreenInfoPtr screen;
     rfbScreenInfoPtr scaledScreen;
     rfbBool PalmVNC;
    void* clientData;
    ClientGoneHookPtr clientGoneHook;

    rfbSocket sock;
    char *host;

    int protocolMajorVersion;
    int protocolMinorVersion;

    pthread_t client_thread;

    enum {
        RFB_PROTOCOL_VERSION,  
	RFB_SECURITY_TYPE,     
        RFB_AUTHENTICATION,  
        RFB_INITIALISATION,  
        RFB_NORMAL,          
        RFB_INITIALISATION_SHARED, 
        RFB_SHUTDOWN          
    } state;

    rfbBool reverseConnection;
    rfbBool onHold;
    rfbBool readyForSetColourMapEntries;
    rfbBool useCopyRect;
    int preferredEncoding;
    int correMaxWidth, correMaxHeight;

    rfbBool viewOnly;

    uint8_t authChallenge[CHALLENGESIZE];

    sraRegionPtr copyRegion;	
    int copyDX, copyDY;	

    sraRegionPtr modifiedRegion;
    sraRegionPtr requestedRegion;
      struct timeval startDeferring;
      struct timeval startPtrDeferring;
      int lastPtrX;
      int lastPtrY;
      int lastPtrButtons;
    rfbTranslateFnType translateFn;
    char *translateLookupTable;
    rfbPixelFormat format;
    char updateBuf[UPDATE_BUF_SIZE];
    int ublen;

    struct _rfbStatList *statEncList;
    struct _rfbStatList *statMsgList;
    int rawBytesEquivalent;
    int bytesSent;

    struct z_stream_s compStream;
    rfbBool compStreamInited;
    uint32_t zlibCompressLevel;
    int tightQualityLevel;

    z_stream zsStruct[4];
    rfbBool zsActive[4];
    int zsLevel[4];
    int tightCompressLevel;

    rfbBool compStreamInitedLZO;
    char *lzoWrkMem;

    rfbFileTransferData fileTransfer;

    int     lastKeyboardLedState;     
    rfbBool enableSupportedMessages;  
    rfbBool enableSupportedEncodings; 
    rfbBool enableServerIdentity;     
    rfbBool enableKeyboardLedState;   
    rfbBool enableLastRectEncoding;   
    rfbBool enableCursorShapeUpdates; 
    rfbBool enableCursorPosUpdates;   
    rfbBool useRichCursorEncoding;    
    rfbBool cursorWasChanged;         
    rfbBool cursorWasMoved;           
    int cursorX,cursorY;	   

    rfbBool useNewFBSize;       
    rfbBool newFBSizePending;   

    struct _rfbClientRec *prev;
    struct _rfbClientRec *next;

    int refCount;
    MUTEX(refCountMutex);
    COND(deleteCond);

    MUTEX(outputMutex);
    MUTEX(updateMutex);
    COND(updateCond);

    void* zrleData;
    int zywrleLevel;
    int zywrleBuf[rfbZRLETileWidth * rfbZRLETileHeight];

    int progressiveSliceY;

    rfbExtensionData* extensions;

    char *zrleBeforeBuf;
    void *paletteHelper;

    MUTEX(sendMutex);

  char *beforeEncBuf;
  int beforeEncBufSize;
  char *afterEncBuf;
  int afterEncBufSize;
  int afterEncBufLen;
    uint32_t tightEncoding;  
    int turboSubsampLevel;
    int turboQualityLevel;
    rfbSslCtx *sslctx;
    wsCtx     *wsctx;
    char *wspath;         
    int pipe_notify_client_thread[2];
    ClientFramebufferUpdateRequestHookPtr clientFramebufferUpdateRequestHook;

    rfbBool useExtDesktopSize;
    int requestedDesktopSizeChange;
    int lastDesktopSizeChangeError;

    rfbBool enableExtendedClipboard;
    uint32_t extClipboardUserCap;
    uint32_t extClipboardMaxUnsolicitedSize;
    char *extClipboardData;
    int extClipboardDataSize;

    rfbBool tightUsePixelFormat24;
    void *tightTJ;
    int tightPngDstDataLen;
} rfbClientRec, *rfbClientPtr;

/**
 * This macro is used to test whether there is a framebuffer update needing to
 * be sent to the client.
 */


/*
 * Macros for endian swapping.
 */


/* sockets.c */

extern int rfbMaxClientWait;

extern void rfbInitSockets(rfbScreenInfoPtr rfbScreen);
extern void rfbShutdownSockets(rfbScreenInfoPtr rfbScreen);
extern void rfbDisconnectUDPSock(rfbScreenInfoPtr rfbScreen);
extern void rfbCloseClient(rfbClientPtr cl);
extern int rfbReadExact(rfbClientPtr cl, char *buf, int len);
extern int rfbReadExactTimeout(rfbClientPtr cl, char *buf, int len,int timeout);
extern int rfbPeekExactTimeout(rfbClientPtr cl, char *buf, int len,int timeout);
extern int rfbWriteExact(rfbClientPtr cl, const char *buf, int len);
extern int rfbCheckFds(rfbScreenInfoPtr rfbScreen,long usec);
extern rfbSocket rfbConnect(rfbScreenInfoPtr rfbScreen, char* host, int port);
extern rfbSocket rfbConnectToTcpAddr(char* host, int port);
extern rfbSocket rfbListenOnTCPPort(int port, in_addr_t iface);
extern rfbSocket rfbListenOnTCP6Port(int port, const char* iface);
extern rfbSocket rfbListenOnUDPPort(int port, in_addr_t iface);
extern int rfbStringToAddr(char* string,in_addr_t* addr);
extern rfbBool rfbSetNonBlocking(rfbSocket sock);

#ifdef LIBVNCSERVER_WITH_WEBSOCKETS
/* websockets.c */

extern rfbBool webSocketsCheck(rfbClientPtr cl);
extern rfbBool webSocketCheckDisconnect(rfbClientPtr cl);
extern int webSocketsEncode(rfbClientPtr cl, const char *src, int len, char **dst);
extern int webSocketsDecode(rfbClientPtr cl, char *dst, int len);
extern rfbBool webSocketsHasDataInBuffer(rfbClientPtr cl);
#endif

/* rfbserver.c */

/* Routines to iterate over the client list in a thread-safe way.
   Only a single iterator can be in use at a time process-wide. */
typedef struct rfbClientIterator *rfbClientIteratorPtr;

extern void rfbClientListInit(rfbScreenInfoPtr rfbScreen);
extern rfbClientIteratorPtr rfbGetClientIterator(rfbScreenInfoPtr rfbScreen);
extern rfbClientPtr rfbClientIteratorNext(rfbClientIteratorPtr iterator);
extern void rfbReleaseClientIterator(rfbClientIteratorPtr iterator);
extern void rfbIncrClientRef(rfbClientPtr cl);
extern void rfbDecrClientRef(rfbClientPtr cl);

extern void rfbNewClientConnection(rfbScreenInfoPtr rfbScreen,rfbSocket sock);
extern rfbClientPtr rfbNewClient(rfbScreenInfoPtr rfbScreen,rfbSocket sock);
extern rfbClientPtr rfbNewUDPClient(rfbScreenInfoPtr rfbScreen);
extern rfbClientPtr rfbReverseConnection(rfbScreenInfoPtr rfbScreen,char *host, int port);
extern void rfbClientConnectionGone(rfbClientPtr cl);
extern void rfbProcessClientMessage(rfbClientPtr cl);
extern void rfbClientConnFailed(rfbClientPtr cl, const char *reason);
extern void rfbNewUDPConnection(rfbScreenInfoPtr rfbScreen,rfbSocket sock);
extern void rfbProcessUDPInput(rfbScreenInfoPtr rfbScreen);
extern rfbBool rfbSendFramebufferUpdate(rfbClientPtr cl, sraRegionPtr updateRegion);
extern rfbBool rfbSendRectEncodingRaw(rfbClientPtr cl, int x,int y,int w,int h);
extern rfbBool rfbSendUpdateBuf(rfbClientPtr cl);
extern void rfbSendServerCutText(rfbScreenInfoPtr rfbScreen,char *str, int len);
#ifdef LIBVNCSERVER_HAVE_LIBZ
extern void rfbSendServerCutTextUTF8(rfbScreenInfoPtr rfbScreen,char *str, int len, char *fallbackLatin1Str, int latin1Len);
#endif
extern rfbBool rfbSendCopyRegion(rfbClientPtr cl,sraRegionPtr reg,int dx,int dy);
extern rfbBool rfbSendLastRectMarker(rfbClientPtr cl);
extern rfbBool rfbSendNewFBSize(rfbClientPtr cl, int w, int h);
extern rfbBool rfbSendExtDesktopSize(rfbClientPtr cl, int w, int h);
extern rfbBool rfbSendSetColourMapEntries(rfbClientPtr cl, int firstColour, int nColours);
extern void rfbSendBell(rfbScreenInfoPtr rfbScreen);

extern char *rfbProcessFileTransferReadBuffer(rfbClientPtr cl, uint32_t length);
extern rfbBool rfbSendFileTransferChunk(rfbClientPtr cl);
extern rfbBool rfbSendDirContent(rfbClientPtr cl, int length, char *buffer);
extern rfbBool rfbSendFileTransferMessage(rfbClientPtr cl, uint8_t contentType, uint8_t contentParam, uint32_t size, uint32_t length, const char *buffer);
extern char *rfbProcessFileTransferReadBuffer(rfbClientPtr cl, uint32_t length);
extern rfbBool rfbProcessFileTransfer(rfbClientPtr cl, uint8_t contentType, uint8_t contentParam, uint32_t size, uint32_t length);

void rfbGotXCutText(rfbScreenInfoPtr rfbScreen, char *str, int len);

/* translate.c */

extern rfbBool rfbEconomicTranslate;

extern void rfbTranslateNone(char *table, rfbPixelFormat *in,
                             rfbPixelFormat *out,
                             char *iptr, char *optr,
                             int bytesBetweenInputLines,
                             int width, int height);
extern rfbBool rfbSetTranslateFunction(rfbClientPtr cl);
extern rfbBool rfbSetClientColourMap(rfbClientPtr cl, int firstColour, int nColours);
extern void rfbSetClientColourMaps(rfbScreenInfoPtr rfbScreen, int firstColour, int nColours);

/* httpd.c */

extern void rfbHttpInitSockets(rfbScreenInfoPtr rfbScreen);
extern void rfbHttpShutdownSockets(rfbScreenInfoPtr rfbScreen);
extern void rfbHttpCheckFds(rfbScreenInfoPtr rfbScreen);



/* auth.c */

extern void rfbAuthNewClient(rfbClientPtr cl);
extern void rfbProcessClientSecurityType(rfbClientPtr cl);
extern void rfbAuthProcessClientMessage(rfbClientPtr cl);
extern void rfbRegisterSecurityHandler(rfbSecurityHandler* handler);
extern void rfbUnregisterSecurityHandler(rfbSecurityHandler* handler);

/* rre.c */

extern rfbBool rfbSendRectEncodingRRE(rfbClientPtr cl, int x,int y,int w,int h);


/* corre.c */

extern rfbBool rfbSendRectEncodingCoRRE(rfbClientPtr cl, int x,int y,int w,int h);


/* hextile.c */

extern rfbBool rfbSendRectEncodingHextile(rfbClientPtr cl, int x, int y, int w,
                                       int h);

/* ultra.c */

/* Set maximum ultra rectangle size in pixels.  Always allow at least
 * two scan lines.
 */
#define ULTRA_MAX_RECT_SIZE (128*256)

extern rfbBool rfbSendRectEncodingUltra(rfbClientPtr cl, int x,int y,int w,int h);


#ifdef LIBVNCSERVER_HAVE_LIBZ
/* zlib.c */

/** Minimum zlib rectangle size in bytes.  Anything smaller will
 * not compress well due to overhead.
 */
#define VNC_ENCODE_ZLIB_MIN_COMP_SIZE (17)

/* Set maximum zlib rectangle size in pixels.  Always allow at least
 * two scan lines.
 */
#define ZLIB_MAX_RECT_SIZE (128*256)

extern rfbBool rfbSendRectEncodingZlib(rfbClientPtr cl, int x, int y, int w,
				    int h);

#ifdef LIBVNCSERVER_HAVE_LIBJPEG
/* tight.c */

#define TIGHT_DEFAULT_COMPRESSION  6
#define TURBO_DEFAULT_SUBSAMP 0

extern int rfbNumCodedRectsTight(rfbClientPtr cl, int x,int y,int w,int h);

extern rfbBool rfbSendRectEncodingTight(rfbClientPtr cl, int x,int y,int w,int h);
extern rfbBool rfbSendTightHeader(rfbClientPtr cl, int x, int y, int w, int h);
extern rfbBool rfbSendCompressedDataTight(rfbClientPtr cl, char *buf, int compressedLen);

#if defined(LIBVNCSERVER_HAVE_LIBPNG)
extern rfbBool rfbSendRectEncodingTightPng(rfbClientPtr cl, int x,int y,int w,int h);
#endif

#endif
#endif


/* cursor.c */

typedef struct rfbCursor {
    /** set this to true if LibVNCServer has to free this cursor */
    rfbBool cleanup, cleanupSource, cleanupMask, cleanupRichSource;
    unsigned char *source;			/**< points to bits */
    unsigned char *mask;			/**< points to bits */
    unsigned short width, height, xhot, yhot;	/**< metrics */
    unsigned short foreRed, foreGreen, foreBlue; /**< device-independent colour */
    unsigned short backRed, backGreen, backBlue; /**< device-independent colour */
    unsigned char *richSource; /**< source bytes for a rich cursor */
    unsigned char *alphaSource; /**< source for alpha blending info */
    rfbBool alphaPreMultiplied; /**< if richSource already has alpha applied */
} rfbCursor, *rfbCursorPtr;
extern unsigned char rfbReverseByte[0x100];

extern rfbBool rfbSendCursorShape(rfbClientPtr cl/*, rfbScreenInfoPtr pScreen*/);
extern rfbBool rfbSendCursorPos(rfbClientPtr cl);
extern void rfbConvertLSBCursorBitmapOrMask(int width,int height,unsigned char* bitmap);
extern rfbCursorPtr rfbMakeXCursor(int width,int height,char* cursorString,char* maskString);
extern char* rfbMakeMaskForXCursor(int width,int height,char* cursorString);
extern char* rfbMakeMaskFromAlphaSource(int width,int height,unsigned char* alphaSource);
extern void rfbMakeXCursorFromRichCursor(rfbScreenInfoPtr rfbScreen,rfbCursorPtr cursor);
extern void rfbMakeRichCursorFromXCursor(rfbScreenInfoPtr rfbScreen,rfbCursorPtr cursor);
extern void rfbFreeCursor(rfbCursorPtr cursor);
extern void rfbSetCursor(rfbScreenInfoPtr rfbScreen,rfbCursorPtr c);

/** cursor handling for the pointer */
extern void rfbDefaultPtrAddEvent(int buttonMask,int x,int y,rfbClientPtr cl);

/* zrle.c */
#ifdef LIBVNCSERVER_HAVE_LIBZ
extern rfbBool rfbSendRectEncodingZRLE(rfbClientPtr cl, int x, int y, int w,int h);
#endif

/* stats.c */

extern void rfbResetStats(rfbClientPtr cl);
extern void rfbPrintStats(rfbClientPtr cl);

/* font.c */

typedef struct rfbFontData {
  unsigned char* data;
  /**
    metaData is a 256*5 array:
    for each character
    (offset,width,height,x,y)
  */
  int* metaData;
} rfbFontData,* rfbFontDataPtr;

int rfbDrawChar(rfbScreenInfoPtr rfbScreen,rfbFontDataPtr font,int x,int y,unsigned char c,rfbPixel colour);
void rfbDrawString(rfbScreenInfoPtr rfbScreen,rfbFontDataPtr font,int x,int y,const char* string,rfbPixel colour);
/** if colour==backColour, background is transparent */
int rfbDrawCharWithClip(rfbScreenInfoPtr rfbScreen,rfbFontDataPtr font,int x,int y,unsigned char c,int x1,int y1,int x2,int y2,rfbPixel colour,rfbPixel backColour);
void rfbDrawStringWithClip(rfbScreenInfoPtr rfbScreen,rfbFontDataPtr font,int x,int y,const char* string,int x1,int y1,int x2,int y2,rfbPixel colour,rfbPixel backColour);
int rfbWidthOfString(rfbFontDataPtr font,const char* string);
int rfbWidthOfChar(rfbFontDataPtr font,unsigned char c);
void rfbFontBBox(rfbFontDataPtr font,unsigned char c,int* x1,int* y1,int* x2,int* y2);
/** this returns the smallest box enclosing any character of font. */
void rfbWholeFontBBox(rfbFontDataPtr font,int *x1, int *y1, int *x2, int *y2);

/** dynamically load a linux console font (4096 bytes, 256 glyphs a 8x16 */
rfbFontDataPtr rfbLoadConsoleFont(char *filename);
/** free a dynamically loaded font */
void rfbFreeFont(rfbFontDataPtr font);

/* draw.c */

void rfbFillRect(rfbScreenInfoPtr s,int x1,int y1,int x2,int y2,rfbPixel col);
void rfbDrawPixel(rfbScreenInfoPtr s,int x,int y,rfbPixel col);
void rfbDrawLine(rfbScreenInfoPtr s,int x1,int y1,int x2,int y2,rfbPixel col);

/* selbox.c */

/** this opens a modal select box. list is an array of strings, the end marked
   with a NULL.
   It returns the index in the list or -1 if cancelled or something else
   wasn't kosher. */
typedef void (*SelectionChangedHookPtr)(int _index);
extern int rfbSelectBox(rfbScreenInfoPtr rfbScreen,
			rfbFontDataPtr font, char** list,
			int x1, int y1, int x2, int y2,
			rfbPixel foreColour, rfbPixel backColour,
			int border,SelectionChangedHookPtr selChangedHook);

/* cargs.c */

extern void rfbUsage(void);
extern void rfbPurgeArguments(int* argc,int* position,int count,char *argv[]);
extern rfbBool rfbProcessArguments(rfbScreenInfoPtr rfbScreen,int* argc, char *argv[]);
extern rfbBool rfbProcessSizeArguments(int* width,int* height,int* bpp,int* argc, char *argv[]);

/* main.c */

extern void rfbLogEnable(int enabled);
typedef void (*rfbLogProc)(const char *format, ...);
extern rfbLogProc rfbLog, rfbErr;
extern void rfbLogPerror(const char *str);

void rfbScheduleCopyRect(rfbScreenInfoPtr rfbScreen,int x1,int y1,int x2,int y2,int dx,int dy);
void rfbScheduleCopyRegion(rfbScreenInfoPtr rfbScreen,sraRegionPtr copyRegion,int dx,int dy);

void rfbDoCopyRect(rfbScreenInfoPtr rfbScreen,int x1,int y1,int x2,int y2,int dx,int dy);
void rfbDoCopyRegion(rfbScreenInfoPtr rfbScreen,sraRegionPtr copyRegion,int dx,int dy);

void rfbMarkRectAsModified(rfbScreenInfoPtr rfbScreen,int x1,int y1,int x2,int y2);
void rfbMarkRegionAsModified(rfbScreenInfoPtr rfbScreen,sraRegionPtr modRegion);
void rfbDoNothingWithClient(rfbClientPtr cl);
rfbNewClientAction defaultNewClientHook(rfbClientPtr cl);
void rfbRegisterProtocolExtension(rfbProtocolExtension* extension);
void rfbUnregisterProtocolExtension(rfbProtocolExtension* extension);
 _rfbProtocolExtension* rfbGetExtensionIterator(void);
void rfbReleaseExtensionIterator(void);
rfbBool rfbEnableExtension(rfbClientPtr cl, rfbProtocolExtension* extension,
	void* data);
rfbBool rfbDisableExtension(rfbClientPtr cl, rfbProtocolExtension* extension);
void* rfbGetExtensionClientData(rfbClientPtr cl, rfbProtocolExtension* extension);

/** to check against plain passwords */
rfbBool rfbCheckPasswordByList(rfbClientPtr cl,const char* response,int len);

/* functions to make a vnc server */
extern rfbScreenInfoPtr rfbGetScreen(int* argc,char** argv,
 int width,int height,int bitsPerSample,int samplesPerPixel,
 int bytesPerPixel);
extern void rfbInitServer(rfbScreenInfoPtr rfbScreen);
extern void rfbShutdownServer(rfbScreenInfoPtr rfbScreen,rfbBool disconnectClients);
extern void rfbNewFramebuffer(rfbScreenInfoPtr rfbScreen,char *framebuffer,
 int width,int height, int bitsPerSample,int samplesPerPixel,
 int bytesPerPixel);

extern void rfbScreenCleanup(rfbScreenInfoPtr screenInfo);
extern void rfbSetServerVersionIdentity(rfbScreenInfoPtr screen, char *fmt, ...);

/* functions to accept/refuse a client that has been put on hold
   by a NewClientHookPtr function. Must not be called in other
   situations. */
extern void rfbStartOnHoldClient(rfbClientPtr cl);
extern void rfbRefuseOnHoldClient(rfbClientPtr cl);

/* call one of these two functions to service the vnc clients.
 usec are the microseconds the select on the fds waits.
 if you are using the event loop, set this to some value > 0, so the
 server doesn't get a high load just by listening.
 rfbProcessEvents() returns TRUE if an update was pending. */

extern void rfbRunEventLoop(rfbScreenInfoPtr screenInfo, long usec, rfbBool runInBackground);
extern rfbBool rfbProcessEvents(rfbScreenInfoPtr screenInfo,long usec);
extern rfbBool rfbIsActive(rfbScreenInfoPtr screenInfo);

/**
 * Register the TightVNC-1.3.x file transfer extension.
 * NB That TightVNC-2.x uses a different, incompatible file transfer protocol.
 */
void rfbRegisterTightVNCFileTransferExtension(void);
/**
 * Unregister the TightVNC-1.3.x file transfer extension.
 * NB That TightVNC-2.x uses a different, incompatible file transfer protocol.
 */
void rfbUnregisterTightVNCFileTransferExtension(void);

/* Statistics */
extern char *messageNameServer2Client(uint32_t type, char *buf, int len);
extern char *messageNameClient2Server(uint32_t type, char *buf, int len);
extern char *encodingName(uint32_t enc, char *buf, int len);

extern rfbStatList *rfbStatLookupEncoding(rfbClientPtr cl, uint32_t type);
extern rfbStatList *rfbStatLookupMessage(rfbClientPtr cl, uint32_t type);

/* Each call to rfbStatRecord* adds one to the rect count for that type */
extern void rfbStatRecordEncodingSent(rfbClientPtr cl, uint32_t type, int byteCount, int byteIfRaw);
extern void rfbStatRecordEncodingSentAdd(rfbClientPtr cl, uint32_t type, int byteCount); /* Specifically for tight encoding */
extern void rfbStatRecordEncodingRcvd(rfbClientPtr cl, uint32_t type, int byteCount, int byteIfRaw);
extern void rfbStatRecordMessageSent(rfbClientPtr cl, uint32_t type, int byteCount, int byteIfRaw);
extern void rfbStatRecordMessageRcvd(rfbClientPtr cl, uint32_t type, int byteCount, int byteIfRaw);
extern void rfbResetStats(rfbClientPtr cl);
extern void rfbPrintStats(rfbClientPtr cl);

extern int rfbStatGetSentBytes(rfbClientPtr cl);
extern int rfbStatGetSentBytesIfRaw(rfbClientPtr cl);
extern int rfbStatGetRcvdBytes(rfbClientPtr cl);
extern int rfbStatGetRcvdBytesIfRaw(rfbClientPtr cl);
extern int rfbStatGetMessageCountSent(rfbClientPtr cl, uint32_t type);
extern int rfbStatGetMessageCountRcvd(rfbClientPtr cl, uint32_t type);
extern int rfbStatGetEncodingCountSent(rfbClientPtr cl, uint32_t type);
extern int rfbStatGetEncodingCountRcvd(rfbClientPtr cl, uint32_t type);

/** Set which version you want to advertise 3.3, 3.6, 3.7 and 3.8 are currently supported*/
extern void rfbSetProtocolVersion(rfbScreenInfoPtr rfbScreen, int major_, int minor_);

/** send a TextChat message to a client */
extern rfbBool rfbSendTextChatMessage(rfbClientPtr cl, uint32_t length, char *buffer);


/*
 * Additions for Qt event loop integration
 * Original idea taken from vino.
 */
rfbBool rfbProcessNewConnection(rfbScreenInfoPtr rfbScreen);
rfbBool rfbUpdateClient(rfbClientPtr cl);




