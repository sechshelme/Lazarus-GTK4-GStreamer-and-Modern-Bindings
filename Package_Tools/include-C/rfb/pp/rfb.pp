
unit rfb;
interface

{
  Automatically converted by H2Pas 1.0.0 from rfb.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rfb
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pbyte  = ^byte;
Pchar  = ^char;
Pin_addr_t  = ^in_addr_t;
Plongint  = ^longint;
PrfbClientIterator  = ^rfbClientIterator;
PrfbClientIteratorPtr  = ^rfbClientIteratorPtr;
PrfbClientPtr  = ^rfbClientPtr;
PrfbClientRec  = ^rfbClientRec;
PrfbClientToServerMsg  = ^rfbClientToServerMsg;
PrfbColourMap  = ^rfbColourMap;
PrfbCursor  = ^rfbCursor;
PrfbCursorPtr  = ^rfbCursorPtr;
PrfbExtDesktopScreen  = ^rfbExtDesktopScreen;
PrfbExtensionData  = ^rfbExtensionData;
PrfbFileTransferData  = ^rfbFileTransferData;
PrfbFontData  = ^rfbFontData;
PrfbFontDataPtr  = ^rfbFontDataPtr;
PrfbFramebufferUpdateRequestMsg  = ^rfbFramebufferUpdateRequestMsg;
PrfbGetCursorProcPtr  = ^rfbGetCursorProcPtr;
PrfbNewClientAction  = ^rfbNewClientAction;
PrfbPixelFormat  = ^rfbPixelFormat;
PrfbProtocolExtension  = ^rfbProtocolExtension;
PrfbScreenInfo  = ^rfbScreenInfo;
PrfbScreenInfoPtr  = ^rfbScreenInfoPtr;
PrfbSecurity  = ^rfbSecurity;
PrfbSecurityHandler  = ^rfbSecurityHandler;
PrfbSocketState  = ^rfbSocketState;
PrfbSslCtx  = ^rfbSslCtx;
PrfbStatList  = ^rfbStatList;
PsraRegion  = ^sraRegion;
PsraRegionPtr  = ^sraRegionPtr;
Puint16_t  = ^uint16_t;
Puint8_t  = ^uint8_t;
PwsCtx  = ^wsCtx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef RFB_H}
{$define RFB_H}
{*
 * @defgroup libvncserver_api LibVNCServer API Reference
 * @
  }
{*
 * @file rfb.h
  }
{
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
  }
{$include <stdio.h>}
{$include <stdlib.h>}
{$include <string.h>}
{$include <rfb/rfbproto.h>}
{$if defined(ANDROID) || defined(LIBVNCSERVER_HAVE_ANDROID)}
{$include <arpa/inet.h>}
{$include <sys/select.h>}
{$endif}
{$ifdef LIBVNCSERVER_HAVE_SYS_TYPES_H}
{$include <sys/types.h>}
{$endif}
{$ifdef WIN32}
type
  Pin_addr_t = ^Tin_addr_t;
  Tin_addr_t = TUINT32;
{$include <winsock2.h>}
{$ifdef LIBVNCSERVER_HAVE_WS2TCPIP_H}
{$undef socklen_t}
{$include <ws2tcpip.h>}
{$endif}
{$ifdef _MSC_VER}
(** unsupported pragma#pragma warning(disable:4996)*)
{$endif}
{$endif}
{$include <rfb/threading.h>}
{ if you use pthreads, but don't define LIBVNCSERVER_HAVE_LIBPTHREAD, the structs
   get all mixed up. So this gives a linker error reminding you to compile
   the library and your application (at least the parts including rfb.h)
   with the same support for pthreads.  }
{$ifdef LIBVNCSERVER_HAVE_LIBPTHREAD}
{$ifdef LIBVNCSERVER_HAVE_LIBZ}

const
  rfbInitServer = rfbInitServerWithPthreadsAndZRLE;  
{$else}

const
  rfbInitServer = rfbInitServerWithPthreadsButWithoutZRLE;  
{$endif}
{$else}
{$ifdef LIBVNCSERVER_HAVE_LIBZ}

const
  rfbInitServer = rfbInitServerWithoutPthreadsButWithZRLE;  
{$else}

const
  rfbInitServer = rfbInitServerWithoutPthreadsAndZRLE;  
{$endif}
{$endif}
type
  PrfbClientRec = ^TrfbClientRec;
  TrfbClientRec = record
      {undefined structure}
    end;

  PrfbScreenInfo = ^TrfbScreenInfo;
  TrfbScreenInfo = record
      {undefined structure}
    end;

  PrfbCursor = ^TrfbCursor;
  TrfbCursor = record
      {undefined structure}
    end;

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

  TrfbKbdAddEventProcPtr = procedure (down:TrfbBool; keySym:TrfbKeySym; cl:PrfbClientRec);cdecl;

  TrfbKbdReleaseAllKeysProcPtr = procedure (cl:PrfbClientRec);cdecl;

  TrfbPtrAddEventProcPtr = procedure (buttonMask:longint; x:longint; y:longint; cl:PrfbClientRec);cdecl;

  TrfbSetXCutTextProcPtr = procedure (str:Pchar; len:longint; cl:PrfbClientRec);cdecl;
{$ifdef LIBVNCSERVER_HAVE_LIBZ}

  TrfbSetXCutTextUTF8ProcPtr = procedure (str:Pchar; len:longint; cl:PrfbClientRec);cdecl;
{$endif}
type
  PrfbGetCursorProcPtr = ^TrfbGetCursorProcPtr;
  TrfbGetCursorProcPtr = function (pScreen:PrfbClientRec):PrfbCursor;cdecl;

  TrfbSetTranslateFunctionProcPtr = function (cl:PrfbClientRec):TrfbBool;cdecl;
(* Const before type ignored *)

  TrfbPasswordCheckProcPtr = function (cl:PrfbClientRec; encryptedPassWord:Pchar; len:longint):TrfbBool;cdecl;

  TrfbNewClientHookPtr = function (cl:PrfbClientRec):TrfbNewClientAction;cdecl;

  TrfbDisplayHookPtr = procedure (cl:PrfbClientRec);cdecl;

  TrfbDisplayFinishedHookPtr = procedure (cl:PrfbClientRec; result:longint);cdecl;
{* support the capability to view the caps/num/scroll states of the X server  }

  TrfbGetKeyboardLedStateHookPtr = function (screen:PrfbScreenInfo):longint;cdecl;

  TrfbXvpHookPtr = function (cl:PrfbClientRec; para2:Tuint8_t; para3:Tuint8_t):TrfbBool;cdecl;

  TrfbSetDesktopSizeHookPtr = function (width:longint; height:longint; numScreens:longint; extDesktopScreens:PrfbExtDesktopScreen; cl:PrfbClientRec):longint;cdecl;

  TrfbNumberOfExtDesktopScreensPtr = function (cl:PrfbClientRec):longint;cdecl;

  TrfbGetExtDesktopScreenPtr = function (seqnumber:longint; extDesktopScreen:PrfbExtDesktopScreen; cl:PrfbClientRec):TrfbBool;cdecl;
{*
 * If x==1 and y==1 then set the whole display
 * else find the window underneath x and y and set the framebuffer to the dimensions
 * of that window
  }

  TrfbSetSingleWindowProcPtr = procedure (cl:PrfbClientRec; x:longint; y:longint);cdecl;
{*
 * Status determines if the X11 server permits input from the local user
 * status==0 or 1
  }

  TrfbSetServerInputProcPtr = procedure (cl:PrfbClientRec; status:longint);cdecl;
{*
 * Permit the server to allow or deny filetransfers.   This is defaulted to deny
 * It is called when a client initiates a connection to determine if it is permitted.
  }

  TrfbFileTransferPermitted = function (cl:PrfbClientRec):longint;cdecl;
{* Handle the textchat messages  }

  TrfbSetTextChat = procedure (cl:PrfbClientRec; length:longint; _string:Pchar);cdecl;
{*< is the data format short?  }
{*< there have to be count*3 entries  }

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
{*
 * Security handling (RFB protocol version 3.7)
  }

  PrfbSecurity = ^TrfbSecurity;
  TrfbSecurity = record
      _type : Tuint8_t;
      handler : procedure (cl:PrfbClientRec);cdecl;
      next : PrfbSecurity;
    end;
  TrfbSecurityHandler = TrfbSecurity;
  PrfbSecurityHandler = ^TrfbSecurityHandler;
{*
 * Protocol extension handling.
  }
{* returns FALSE if extension should be deactivated for client.
	   if newClient == NULL, it is always deactivated.  }
{* returns FALSE if extension should be deactivated for client.
	   if init == NULL, it stays activated.  }
{* if pseudoEncodings is not NULL, it contains a 0 terminated
	   list of the pseudo encodings handled by this extension.  }
{* returns TRUE if that pseudo encoding is handled by the extension.
	   encodingNumber==0 means "reset encodings".  }
{* returns TRUE if message was handled  }
(* Const before type ignored *)
{* processArguments returns the number of handled arguments  }

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
{*
 * Per-screen (framebuffer) structure.  There can be as many as you wish,
 * each serving different clients. However, you have to call
 * rfbProcessEvents for each of these.
  }
{* this structure has children that are scaled versions of this screen  }
{*
     * some screen specific data can be put into a struct where screenData
     * points to. You need this if you have more than one screen at the
     * same time while using the same functions.
      }
{ additions by libvncserver  }
{*< set this if rfbServerFormat.trueColour==FALSE  }
(* Const before type ignored *)
{$ifdef WIN32}
{$else}
{$endif}
{ http stuff  }
{* If rfbAuthPasswdData is given a list, this is the first
        view only password.  }
{* send only this many rectangles in one update  }
{* this is the amount of milliseconds to wait at least before sending
     * an update.  }
{*< "Mutex" for pointer events  }
{ cursor  }
{*
     * the frameBuffer has to be supplied by the serving process.
     * The buffer will not be freed by
      }
{* newClientHook is called just after a new client is created  }
{* displayHook is called just before a frame buffer update  }
{* These hooks are called to pass keyboard state back to the client  }
{* if TRUE, an ignoring signal handler is installed for SIGPIPE  }
{* if not zero, only a slice of this height is processed every time
     * an update should be sent. This should make working on a slow
     * link more interactive.  }
{* handle as many input events as possible (default off)  }
{* rfbEncodingServerIdentity  }
{* What does the server tell the new clients which version it supports  }
{* command line authorization of file transfers  }
{* displayFinishedHook is called just after a frame buffer update  }
{* xvpHook is called to handle an xvp client message  }
{*< The port to listen on when using IPv6.   }
{ We have an additional IPv6 listen socket since there are systems that
       don't support dual binding sockets under *any* circumstances, for
       instance OpenBSD  }
{* hook to let client set resolution  }
{* Optional hooks to query ExtendedDesktopSize screen information.
     * If not set it is assumed only one screen is present spanning entire fb  }
{* This value between 0 and 1.0 defines which fraction of the maximum number
	of file descriptors LibVNCServer uses before denying new client connections.
	It is set to 0.5 per default.  }
type
  PrfbScreenInfo = ^TrfbScreenInfo;
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
{*
 * rfbTranslateFnType is the type of translation functions.
  }

  TrfbTranslateFnType = procedure (table:Pchar; in:PrfbPixelFormat; out:PrfbPixelFormat; iptr:Pchar; optr:Pchar; 
                bytesBetweenInputLines:longint; width:longint; height:longint);cdecl;
{ region stuff  }
  PsraRegion = ^TsraRegion;
  TsraRegion = record
      {undefined structure}
    end;


  PsraRegionPtr = ^TsraRegionPtr;
  TsraRegionPtr = PsraRegion;
{
 * Per-client structure.
  }

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
{* back pointer to the screen  }
{* points to a scaled version of the screen buffer in cl->scaledScreenList  }
{* how did the client tell us it wanted the screen changed?  Ultra style or palm style?  }
{* private data. You should put any application client specific data
     * into a struct and let clientData point to it. Don't forget to
     * free the struct via clientGoneHook!
     *
     * This is useful if the IO functions have to behave client specific.
      }
{ RFB protocol minor version number  }
{* Possible client states:  }
{*< establishing protocol version  }
{*< negotiating security (RFB v.3.7)  }
{*< authenticating  }
{*< sending initialisation messages  }
{*< normal protocol messages  }
{ Ephemeral internal-use states that will never be seen by software
         * using LibVNCServer to provide services:  }
{*< sending initialisation messages with implicit shared-flag already true  }
{*< Client is shutting down  }
{ The following member is only used during VNC authentication  }
{ The following members represent the update needed to get the client's
       framebuffer from its present state to the current state of our
       framebuffer.

       If the client does not accept CopyRect encoding then the update is
       simply represented as the region of the screen which has been modified
       (modifiedRegion).

       If the client does accept CopyRect encoding, then the update consists of
       two parts.  First we have a single copy from one region of the screen to
       another (the destination of the copy is copyRegion), and second we have
       the region of the screen which has been modified in some other way
       (modifiedRegion).

       Although the copy is of a single region, this region may have many
       rectangles.  When sending an update, the copyRegion is always sent
       before the modifiedRegion.  This is because the modifiedRegion may
       overlap parts of the screen which are in the source of the copy.

       In fact during normal processing, the modifiedRegion may even overlap
       the destination copyRegion.  Just before an update is sent we remove
       from the copyRegion anything in the modifiedRegion.  }
{*< the destination region of the copy  }
{*< the translation by which the copy happens  }
{* As part of the FramebufferUpdateRequest, a client can express interest
       in a subrectangle of the whole framebuffer.  This is stored in the
       requestedRegion member.  In the normal case this is the whole
       framebuffer if the client is ready, empty if it's not.  }
{* The following member represents the state of the "deferred update" timer
       - when the framebuffer is modified and the client is ready, in most
       cases it is more efficient to defer sending the update by a few
       milliseconds so that several changes to the framebuffer can be combined
       into a single update.  }
{* translateFn points to the translation function which is used to copy
       and translate a rectangle from the framebuffer to an output buffer.  }
{*
     * UPDATE_BUF_SIZE must be big enough to send at least one whole line of the
     * framebuffer.  So for a max screen width of say 2K with 32-bit pixels this
     * means 8K minimum.
      }
{ statistics  }
{* the quality level is also used by ZYWRLE and TightPng  }
{ tight encoding -- preserve zlib streams' state for each client  }
{ Ultra Encoding support  }
{*< keep track of last value so we can send *change* events  }
{*< client supports SupportedMessages encoding  }
{*< client supports SupportedEncodings encoding  }
{*< client supports ServerIdentity encoding  }
{*< client supports KeyboardState encoding  }
{*< client supports LastRect encoding  }
{*< client supports cursor shape updates  }
{*< client supports cursor position updates  }
{*< rfbEncodingRichCursor is preferred  }
{*< cursor shape update should be sent  }
{*< cursor position update should be sent  }
{*< the coordinates of the cursor,
					 if enableCursorShapeUpdates = FALSE  }
{*< client supports NewFBSize encoding  }
{*< framebuffer size was changed  }
{* whenever a client is referenced, the refCount has to be incremented
       and afterwards decremented, so that the client is not cleaned up
       while being referenced.
       Use the functions rfbIncrClientRef(cl) and rfbDecrClientRef(cl);
     }
{* if progressive updating is on, this variable holds the current
     * y coordinate of the progressive slice.  }
{* for threaded zrle  }
{* for thread safety for rfbSendFBUpdate()  }
{ buffers to hold pixel data before and after encoding.
     per-client for thread safety  }
{ rfbEncodingTight or rfbEncodingTightPng  }
{ TurboVNC Encoding support (extends TightVNC)  }
{ 1-100 scale  }
{ Requests path component  }
type
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
      Const
        RFB_PROTOCOL_VERSION = 0;
        RFB_SECURITY_TYPE = 1;
        RFB_AUTHENTICATION = 2;
        RFB_INITIALISATION = 3;
        RFB_NORMAL = 4;
        RFB_INITIALISATION_SHARED = 5;
        RFB_SHUTDOWN = 6;
;
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
      compStream : Tz_stream_s;
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
{*
 * This macro is used to test whether there is a framebuffer update needing to
 * be sent to the client.
  }
{
 * Macros for endian swapping.
  }
{ sockets.c  }
  var
    rfbMaxClientWait : longint;cvar;external;

procedure rfbInitSockets(rfbScreen:TrfbScreenInfoPtr);cdecl;external;
procedure rfbShutdownSockets(rfbScreen:TrfbScreenInfoPtr);cdecl;external;
procedure rfbDisconnectUDPSock(rfbScreen:TrfbScreenInfoPtr);cdecl;external;
procedure rfbCloseClient(cl:TrfbClientPtr);cdecl;external;
function rfbReadExact(cl:TrfbClientPtr; buf:Pchar; len:longint):longint;cdecl;external;
function rfbReadExactTimeout(cl:TrfbClientPtr; buf:Pchar; len:longint; timeout:longint):longint;cdecl;external;
function rfbPeekExactTimeout(cl:TrfbClientPtr; buf:Pchar; len:longint; timeout:longint):longint;cdecl;external;
(* Const before type ignored *)
function rfbWriteExact(cl:TrfbClientPtr; buf:Pchar; len:longint):longint;cdecl;external;
function rfbCheckFds(rfbScreen:TrfbScreenInfoPtr; usec:longint):longint;cdecl;external;
function rfbConnect(rfbScreen:TrfbScreenInfoPtr; host:Pchar; port:longint):TrfbSocket;cdecl;external;
function rfbConnectToTcpAddr(host:Pchar; port:longint):TrfbSocket;cdecl;external;
function rfbListenOnTCPPort(port:longint; iface:Tin_addr_t):TrfbSocket;cdecl;external;
(* Const before type ignored *)
function rfbListenOnTCP6Port(port:longint; iface:Pchar):TrfbSocket;cdecl;external;
function rfbListenOnUDPPort(port:longint; iface:Tin_addr_t):TrfbSocket;cdecl;external;
function rfbStringToAddr(_string:Pchar; addr:Pin_addr_t):longint;cdecl;external;
function rfbSetNonBlocking(sock:TrfbSocket):TrfbBool;cdecl;external;
{$ifdef LIBVNCSERVER_WITH_WEBSOCKETS}
{ websockets.c  }
function webSocketsCheck(cl:TrfbClientPtr):TrfbBool;cdecl;external;
function webSocketCheckDisconnect(cl:TrfbClientPtr):TrfbBool;cdecl;external;
(* Const before type ignored *)
function webSocketsEncode(cl:TrfbClientPtr; src:Pchar; len:longint; dst:PPchar):longint;cdecl;external;
function webSocketsDecode(cl:TrfbClientPtr; dst:Pchar; len:longint):longint;cdecl;external;
function webSocketsHasDataInBuffer(cl:TrfbClientPtr):TrfbBool;cdecl;external;
{$endif}
{ rfbserver.c  }
{ Routines to iterate over the client list in a thread-safe way.
   Only a single iterator can be in use at a time process-wide.  }
type
  PrfbClientIteratorPtr = ^TrfbClientIteratorPtr;
  TrfbClientIteratorPtr = PrfbClientIterator;

procedure rfbClientListInit(rfbScreen:TrfbScreenInfoPtr);cdecl;external;
function rfbGetClientIterator(rfbScreen:TrfbScreenInfoPtr):TrfbClientIteratorPtr;cdecl;external;
function rfbClientIteratorNext(iterator:TrfbClientIteratorPtr):TrfbClientPtr;cdecl;external;
procedure rfbReleaseClientIterator(iterator:TrfbClientIteratorPtr);cdecl;external;
procedure rfbIncrClientRef(cl:TrfbClientPtr);cdecl;external;
procedure rfbDecrClientRef(cl:TrfbClientPtr);cdecl;external;
procedure rfbNewClientConnection(rfbScreen:TrfbScreenInfoPtr; sock:TrfbSocket);cdecl;external;
function rfbNewClient(rfbScreen:TrfbScreenInfoPtr; sock:TrfbSocket):TrfbClientPtr;cdecl;external;
function rfbNewUDPClient(rfbScreen:TrfbScreenInfoPtr):TrfbClientPtr;cdecl;external;
function rfbReverseConnection(rfbScreen:TrfbScreenInfoPtr; host:Pchar; port:longint):TrfbClientPtr;cdecl;external;
procedure rfbClientConnectionGone(cl:TrfbClientPtr);cdecl;external;
procedure rfbProcessClientMessage(cl:TrfbClientPtr);cdecl;external;
(* Const before type ignored *)
procedure rfbClientConnFailed(cl:TrfbClientPtr; reason:Pchar);cdecl;external;
procedure rfbNewUDPConnection(rfbScreen:TrfbScreenInfoPtr; sock:TrfbSocket);cdecl;external;
procedure rfbProcessUDPInput(rfbScreen:TrfbScreenInfoPtr);cdecl;external;
function rfbSendFramebufferUpdate(cl:TrfbClientPtr; updateRegion:TsraRegionPtr):TrfbBool;cdecl;external;
function rfbSendRectEncodingRaw(cl:TrfbClientPtr; x:longint; y:longint; w:longint; h:longint):TrfbBool;cdecl;external;
function rfbSendUpdateBuf(cl:TrfbClientPtr):TrfbBool;cdecl;external;
procedure rfbSendServerCutText(rfbScreen:TrfbScreenInfoPtr; str:Pchar; len:longint);cdecl;external;
{$ifdef LIBVNCSERVER_HAVE_LIBZ}
procedure rfbSendServerCutTextUTF8(rfbScreen:TrfbScreenInfoPtr; str:Pchar; len:longint; fallbackLatin1Str:Pchar; latin1Len:longint);cdecl;external;
{$endif}

function rfbSendCopyRegion(cl:TrfbClientPtr; reg:TsraRegionPtr; dx:longint; dy:longint):TrfbBool;cdecl;external;
function rfbSendLastRectMarker(cl:TrfbClientPtr):TrfbBool;cdecl;external;
function rfbSendNewFBSize(cl:TrfbClientPtr; w:longint; h:longint):TrfbBool;cdecl;external;
function rfbSendExtDesktopSize(cl:TrfbClientPtr; w:longint; h:longint):TrfbBool;cdecl;external;
function rfbSendSetColourMapEntries(cl:TrfbClientPtr; firstColour:longint; nColours:longint):TrfbBool;cdecl;external;
procedure rfbSendBell(rfbScreen:TrfbScreenInfoPtr);cdecl;external;
function rfbProcessFileTransferReadBuffer(cl:TrfbClientPtr; length:Tuint32_t):Pchar;cdecl;external;
function rfbSendFileTransferChunk(cl:TrfbClientPtr):TrfbBool;cdecl;external;
function rfbSendDirContent(cl:TrfbClientPtr; length:longint; buffer:Pchar):TrfbBool;cdecl;external;
(* Const before type ignored *)
function rfbSendFileTransferMessage(cl:TrfbClientPtr; contentType:Tuint8_t; contentParam:Tuint8_t; size:Tuint32_t; length:Tuint32_t; 
           buffer:Pchar):TrfbBool;cdecl;external;
function rfbProcessFileTransferReadBuffer(cl:TrfbClientPtr; length:Tuint32_t):Pchar;cdecl;external;
function rfbProcessFileTransfer(cl:TrfbClientPtr; contentType:Tuint8_t; contentParam:Tuint8_t; size:Tuint32_t; length:Tuint32_t):TrfbBool;cdecl;external;
procedure rfbGotXCutText(rfbScreen:TrfbScreenInfoPtr; str:Pchar; len:longint);cdecl;external;
{ translate.c  }
  var
    rfbEconomicTranslate : TrfbBool;cvar;external;

procedure rfbTranslateNone(table:Pchar; in:PrfbPixelFormat; out:PrfbPixelFormat; iptr:Pchar; optr:Pchar; 
            bytesBetweenInputLines:longint; width:longint; height:longint);cdecl;external;
function rfbSetTranslateFunction(cl:TrfbClientPtr):TrfbBool;cdecl;external;
function rfbSetClientColourMap(cl:TrfbClientPtr; firstColour:longint; nColours:longint):TrfbBool;cdecl;external;
procedure rfbSetClientColourMaps(rfbScreen:TrfbScreenInfoPtr; firstColour:longint; nColours:longint);cdecl;external;
{ httpd.c  }
procedure rfbHttpInitSockets(rfbScreen:TrfbScreenInfoPtr);cdecl;external;
procedure rfbHttpShutdownSockets(rfbScreen:TrfbScreenInfoPtr);cdecl;external;
procedure rfbHttpCheckFds(rfbScreen:TrfbScreenInfoPtr);cdecl;external;
{ auth.c  }
procedure rfbAuthNewClient(cl:TrfbClientPtr);cdecl;external;
procedure rfbProcessClientSecurityType(cl:TrfbClientPtr);cdecl;external;
procedure rfbAuthProcessClientMessage(cl:TrfbClientPtr);cdecl;external;
procedure rfbRegisterSecurityHandler(handler:PrfbSecurityHandler);cdecl;external;
procedure rfbUnregisterSecurityHandler(handler:PrfbSecurityHandler);cdecl;external;
{ rre.c  }
function rfbSendRectEncodingRRE(cl:TrfbClientPtr; x:longint; y:longint; w:longint; h:longint):TrfbBool;cdecl;external;
{ corre.c  }
function rfbSendRectEncodingCoRRE(cl:TrfbClientPtr; x:longint; y:longint; w:longint; h:longint):TrfbBool;cdecl;external;
{ hextile.c  }
function rfbSendRectEncodingHextile(cl:TrfbClientPtr; x:longint; y:longint; w:longint; h:longint):TrfbBool;cdecl;external;
{ ultra.c  }
{ Set maximum ultra rectangle size in pixels.  Always allow at least
 * two scan lines.
  }
const
  ULTRA_MAX_RECT_SIZE = 128*256;  

function rfbSendRectEncodingUltra(cl:TrfbClientPtr; x:longint; y:longint; w:longint; h:longint):TrfbBool;cdecl;external;
{$ifdef LIBVNCSERVER_HAVE_LIBZ}
{ zlib.c  }
{* Minimum zlib rectangle size in bytes.  Anything smaller will
 * not compress well due to overhead.
  }
const
  VNC_ENCODE_ZLIB_MIN_COMP_SIZE = 17;  
{ Set maximum zlib rectangle size in pixels.  Always allow at least
 * two scan lines.
  }
  ZLIB_MAX_RECT_SIZE = 128*256;  

function rfbSendRectEncodingZlib(cl:TrfbClientPtr; x:longint; y:longint; w:longint; h:longint):TrfbBool;cdecl;external;
{$ifdef LIBVNCSERVER_HAVE_LIBJPEG}
{ tight.c  }
const
  TIGHT_DEFAULT_COMPRESSION = 6;  
  TURBO_DEFAULT_SUBSAMP = 0;  

function rfbNumCodedRectsTight(cl:TrfbClientPtr; x:longint; y:longint; w:longint; h:longint):longint;cdecl;external;
function rfbSendRectEncodingTight(cl:TrfbClientPtr; x:longint; y:longint; w:longint; h:longint):TrfbBool;cdecl;external;
function rfbSendTightHeader(cl:TrfbClientPtr; x:longint; y:longint; w:longint; h:longint):TrfbBool;cdecl;external;
function rfbSendCompressedDataTight(cl:TrfbClientPtr; buf:Pchar; compressedLen:longint):TrfbBool;cdecl;external;
{$if defined(LIBVNCSERVER_HAVE_LIBPNG)}

function rfbSendRectEncodingTightPng(cl:TrfbClientPtr; x:longint; y:longint; w:longint; h:longint):TrfbBool;cdecl;external;
{$endif}
{$endif}
{$endif}
{ cursor.c  }
{* set this to true if LibVNCServer has to free this cursor  }
{*< points to bits  }
{*< points to bits  }
{*< metrics  }
{*< device-independent colour  }
{*< device-independent colour  }
{*< source bytes for a rich cursor  }
{*< source for alpha blending info  }
{*< if richSource already has alpha applied  }
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
  var
    rfbReverseByte : array[0..255] of byte;cvar;external;
{, rfbScreenInfoPtr pScreen }
function rfbSendCursorShape(cl:TrfbClientPtr):TrfbBool;cdecl;external;
function rfbSendCursorPos(cl:TrfbClientPtr):TrfbBool;cdecl;external;
procedure rfbConvertLSBCursorBitmapOrMask(width:longint; height:longint; bitmap:Pbyte);cdecl;external;
function rfbMakeXCursor(width:longint; height:longint; cursorString:Pchar; maskString:Pchar):TrfbCursorPtr;cdecl;external;
function rfbMakeMaskForXCursor(width:longint; height:longint; cursorString:Pchar):Pchar;cdecl;external;
function rfbMakeMaskFromAlphaSource(width:longint; height:longint; alphaSource:Pbyte):Pchar;cdecl;external;
procedure rfbMakeXCursorFromRichCursor(rfbScreen:TrfbScreenInfoPtr; cursor:TrfbCursorPtr);cdecl;external;
procedure rfbMakeRichCursorFromXCursor(rfbScreen:TrfbScreenInfoPtr; cursor:TrfbCursorPtr);cdecl;external;
procedure rfbFreeCursor(cursor:TrfbCursorPtr);cdecl;external;
procedure rfbSetCursor(rfbScreen:TrfbScreenInfoPtr; c:TrfbCursorPtr);cdecl;external;
{* cursor handling for the pointer  }
procedure rfbDefaultPtrAddEvent(buttonMask:longint; x:longint; y:longint; cl:TrfbClientPtr);cdecl;external;
{ zrle.c  }
{$ifdef LIBVNCSERVER_HAVE_LIBZ}
function rfbSendRectEncodingZRLE(cl:TrfbClientPtr; x:longint; y:longint; w:longint; h:longint):TrfbBool;cdecl;external;
{$endif}
{ stats.c  }

procedure rfbResetStats(cl:TrfbClientPtr);cdecl;external;
procedure rfbPrintStats(cl:TrfbClientPtr);cdecl;external;
{ font.c  }
{*
    metaData is a 256*5 array:
    for each character
    (offset,width,height,x,y)
   }
type
  PrfbFontData = ^TrfbFontData;
  TrfbFontData = record
      data : Pbyte;
      metaData : Plongint;
    end;
  TrfbFontDataPtr = PrfbFontData;
  PrfbFontDataPtr = ^TrfbFontDataPtr;

function rfbDrawChar(rfbScreen:TrfbScreenInfoPtr; font:TrfbFontDataPtr; x:longint; y:longint; c:byte; 
           colour:TrfbPixel):longint;cdecl;external;
(* Const before type ignored *)
procedure rfbDrawString(rfbScreen:TrfbScreenInfoPtr; font:TrfbFontDataPtr; x:longint; y:longint; _string:Pchar; 
            colour:TrfbPixel);cdecl;external;
{* if colour==backColour, background is transparent  }
function rfbDrawCharWithClip(rfbScreen:TrfbScreenInfoPtr; font:TrfbFontDataPtr; x:longint; y:longint; c:byte; 
           x1:longint; y1:longint; x2:longint; y2:longint; colour:TrfbPixel; 
           backColour:TrfbPixel):longint;cdecl;external;
(* Const before type ignored *)
procedure rfbDrawStringWithClip(rfbScreen:TrfbScreenInfoPtr; font:TrfbFontDataPtr; x:longint; y:longint; _string:Pchar; 
            x1:longint; y1:longint; x2:longint; y2:longint; colour:TrfbPixel; 
            backColour:TrfbPixel);cdecl;external;
(* Const before type ignored *)
function rfbWidthOfString(font:TrfbFontDataPtr; _string:Pchar):longint;cdecl;external;
function rfbWidthOfChar(font:TrfbFontDataPtr; c:byte):longint;cdecl;external;
procedure rfbFontBBox(font:TrfbFontDataPtr; c:byte; x1:Plongint; y1:Plongint; x2:Plongint; 
            y2:Plongint);cdecl;external;
{* this returns the smallest box enclosing any character of font.  }
procedure rfbWholeFontBBox(font:TrfbFontDataPtr; x1:Plongint; y1:Plongint; x2:Plongint; y2:Plongint);cdecl;external;
{* dynamically load a linux console font (4096 bytes, 256 glyphs a 8x16  }
function rfbLoadConsoleFont(filename:Pchar):TrfbFontDataPtr;cdecl;external;
{* free a dynamically loaded font  }
procedure rfbFreeFont(font:TrfbFontDataPtr);cdecl;external;
{ draw.c  }
procedure rfbFillRect(s:TrfbScreenInfoPtr; x1:longint; y1:longint; x2:longint; y2:longint; 
            col:TrfbPixel);cdecl;external;
procedure rfbDrawPixel(s:TrfbScreenInfoPtr; x:longint; y:longint; col:TrfbPixel);cdecl;external;
procedure rfbDrawLine(s:TrfbScreenInfoPtr; x1:longint; y1:longint; x2:longint; y2:longint; 
            col:TrfbPixel);cdecl;external;
{ selbox.c  }
{* this opens a modal select box. list is an array of strings, the end marked
   with a NULL.
   It returns the index in the list or -1 if cancelled or something else
   wasn't kosher.  }
type

  TSelectionChangedHookPtr = procedure (_index:longint);cdecl;

function rfbSelectBox(rfbScreen:TrfbScreenInfoPtr; font:TrfbFontDataPtr; list:PPchar; x1:longint; y1:longint; 
           x2:longint; y2:longint; foreColour:TrfbPixel; backColour:TrfbPixel; border:longint; 
           selChangedHook:TSelectionChangedHookPtr):longint;cdecl;external;
{ cargs.c  }
procedure rfbUsage;cdecl;external;
procedure rfbPurgeArguments(argc:Plongint; position:Plongint; count:longint; argv:PPchar);cdecl;external;
function rfbProcessArguments(rfbScreen:TrfbScreenInfoPtr; argc:Plongint; argv:PPchar):TrfbBool;cdecl;external;
function rfbProcessSizeArguments(width:Plongint; height:Plongint; bpp:Plongint; argc:Plongint; argv:PPchar):TrfbBool;cdecl;external;
{ main.c  }
procedure rfbLogEnable(enabled:longint);cdecl;external;
(* Const before type ignored *)
type

  TrfbLogProc = procedure (format:Pchar; args:array of const);cdecl;
  var
    rfbLog : TrfbLogProc;cvar;external;
(* Const before type ignored *)

procedure rfbLogPerror(str:Pchar);cdecl;external;
procedure rfbScheduleCopyRect(rfbScreen:TrfbScreenInfoPtr; x1:longint; y1:longint; x2:longint; y2:longint; 
            dx:longint; dy:longint);cdecl;external;
procedure rfbScheduleCopyRegion(rfbScreen:TrfbScreenInfoPtr; copyRegion:TsraRegionPtr; dx:longint; dy:longint);cdecl;external;
procedure rfbDoCopyRect(rfbScreen:TrfbScreenInfoPtr; x1:longint; y1:longint; x2:longint; y2:longint; 
            dx:longint; dy:longint);cdecl;external;
procedure rfbDoCopyRegion(rfbScreen:TrfbScreenInfoPtr; copyRegion:TsraRegionPtr; dx:longint; dy:longint);cdecl;external;
procedure rfbMarkRectAsModified(rfbScreen:TrfbScreenInfoPtr; x1:longint; y1:longint; x2:longint; y2:longint);cdecl;external;
procedure rfbMarkRegionAsModified(rfbScreen:TrfbScreenInfoPtr; modRegion:TsraRegionPtr);cdecl;external;
procedure rfbDoNothingWithClient(cl:TrfbClientPtr);cdecl;external;
function defaultNewClientHook(cl:TrfbClientPtr):TrfbNewClientAction;cdecl;external;
procedure rfbRegisterProtocolExtension(extension:PrfbProtocolExtension);cdecl;external;
procedure rfbUnregisterProtocolExtension(extension:PrfbProtocolExtension);cdecl;external;
function rfbGetExtensionIterator:PrfbProtocolExtension;cdecl;external;
procedure rfbReleaseExtensionIterator;cdecl;external;
function rfbEnableExtension(cl:TrfbClientPtr; extension:PrfbProtocolExtension; data:pointer):TrfbBool;cdecl;external;
function rfbDisableExtension(cl:TrfbClientPtr; extension:PrfbProtocolExtension):TrfbBool;cdecl;external;
function rfbGetExtensionClientData(cl:TrfbClientPtr; extension:PrfbProtocolExtension):pointer;cdecl;external;
{* to check against plain passwords  }
(* Const before type ignored *)
function rfbCheckPasswordByList(cl:TrfbClientPtr; response:Pchar; len:longint):TrfbBool;cdecl;external;
{ functions to make a vnc server  }
function rfbGetScreen(argc:Plongint; argv:PPchar; width:longint; height:longint; bitsPerSample:longint; 
           samplesPerPixel:longint; bytesPerPixel:longint):TrfbScreenInfoPtr;cdecl;external;
procedure rfbInitServer(rfbScreen:TrfbScreenInfoPtr);cdecl;external;
procedure rfbShutdownServer(rfbScreen:TrfbScreenInfoPtr; disconnectClients:TrfbBool);cdecl;external;
procedure rfbNewFramebuffer(rfbScreen:TrfbScreenInfoPtr; framebuffer:Pchar; width:longint; height:longint; bitsPerSample:longint; 
            samplesPerPixel:longint; bytesPerPixel:longint);cdecl;external;
procedure rfbScreenCleanup(screenInfo:TrfbScreenInfoPtr);cdecl;external;
procedure rfbSetServerVersionIdentity(screen:TrfbScreenInfoPtr; fmt:Pchar; args:array of const);cdecl;external;
procedure rfbSetServerVersionIdentity(screen:TrfbScreenInfoPtr; fmt:Pchar);cdecl;external;
{ functions to accept/refuse a client that has been put on hold
   by a NewClientHookPtr function. Must not be called in other
   situations.  }
procedure rfbStartOnHoldClient(cl:TrfbClientPtr);cdecl;external;
procedure rfbRefuseOnHoldClient(cl:TrfbClientPtr);cdecl;external;
{ call one of these two functions to service the vnc clients.
 usec are the microseconds the select on the fds waits.
 if you are using the event loop, set this to some value > 0, so the
 server doesn't get a high load just by listening.
 rfbProcessEvents() returns TRUE if an update was pending.  }
procedure rfbRunEventLoop(screenInfo:TrfbScreenInfoPtr; usec:longint; runInBackground:TrfbBool);cdecl;external;
function rfbProcessEvents(screenInfo:TrfbScreenInfoPtr; usec:longint):TrfbBool;cdecl;external;
function rfbIsActive(screenInfo:TrfbScreenInfoPtr):TrfbBool;cdecl;external;
{*
 * Register the TightVNC-1.3.x file transfer extension.
 * NB That TightVNC-2.x uses a different, incompatible file transfer protocol.
  }
procedure rfbRegisterTightVNCFileTransferExtension;cdecl;external;
{*
 * Unregister the TightVNC-1.3.x file transfer extension.
 * NB That TightVNC-2.x uses a different, incompatible file transfer protocol.
  }
procedure rfbUnregisterTightVNCFileTransferExtension;cdecl;external;
{ Statistics  }
function messageNameServer2Client(_type:Tuint32_t; buf:Pchar; len:longint):Pchar;cdecl;external;
function messageNameClient2Server(_type:Tuint32_t; buf:Pchar; len:longint):Pchar;cdecl;external;
function encodingName(enc:Tuint32_t; buf:Pchar; len:longint):Pchar;cdecl;external;
function rfbStatLookupEncoding(cl:TrfbClientPtr; _type:Tuint32_t):PrfbStatList;cdecl;external;
function rfbStatLookupMessage(cl:TrfbClientPtr; _type:Tuint32_t):PrfbStatList;cdecl;external;
{ Each call to rfbStatRecord* adds one to the rect count for that type  }
procedure rfbStatRecordEncodingSent(cl:TrfbClientPtr; _type:Tuint32_t; byteCount:longint; byteIfRaw:longint);cdecl;external;
procedure rfbStatRecordEncodingSentAdd(cl:TrfbClientPtr; _type:Tuint32_t; byteCount:longint);cdecl;external;
{ Specifically for tight encoding  }
procedure rfbStatRecordEncodingRcvd(cl:TrfbClientPtr; _type:Tuint32_t; byteCount:longint; byteIfRaw:longint);cdecl;external;
procedure rfbStatRecordMessageSent(cl:TrfbClientPtr; _type:Tuint32_t; byteCount:longint; byteIfRaw:longint);cdecl;external;
procedure rfbStatRecordMessageRcvd(cl:TrfbClientPtr; _type:Tuint32_t; byteCount:longint; byteIfRaw:longint);cdecl;external;
procedure rfbResetStats(cl:TrfbClientPtr);cdecl;external;
procedure rfbPrintStats(cl:TrfbClientPtr);cdecl;external;
function rfbStatGetSentBytes(cl:TrfbClientPtr):longint;cdecl;external;
function rfbStatGetSentBytesIfRaw(cl:TrfbClientPtr):longint;cdecl;external;
function rfbStatGetRcvdBytes(cl:TrfbClientPtr):longint;cdecl;external;
function rfbStatGetRcvdBytesIfRaw(cl:TrfbClientPtr):longint;cdecl;external;
function rfbStatGetMessageCountSent(cl:TrfbClientPtr; _type:Tuint32_t):longint;cdecl;external;
function rfbStatGetMessageCountRcvd(cl:TrfbClientPtr; _type:Tuint32_t):longint;cdecl;external;
function rfbStatGetEncodingCountSent(cl:TrfbClientPtr; _type:Tuint32_t):longint;cdecl;external;
function rfbStatGetEncodingCountRcvd(cl:TrfbClientPtr; _type:Tuint32_t):longint;cdecl;external;
{* Set which version you want to advertise 3.3, 3.6, 3.7 and 3.8 are currently supported }
procedure rfbSetProtocolVersion(rfbScreen:TrfbScreenInfoPtr; major_:longint; minor_:longint);cdecl;external;
{* send a TextChat message to a client  }
function rfbSendTextChatMessage(cl:TrfbClientPtr; length:Tuint32_t; buffer:Pchar):TrfbBool;cdecl;external;
{
 * Additions for Qt event loop integration
 * Original idea taken from vino.
  }
function rfbProcessNewConnection(rfbScreen:TrfbScreenInfoPtr):TrfbBool;cdecl;external;
function rfbUpdateClient(cl:TrfbClientPtr):TrfbBool;cdecl;external;
{*
 * @
  }
{*
 @page libvncserver_doc LibVNCServer Documentation
 @tableofcontents
 @section create_server Creating a server instance
 To make a server, you just have to initialise a server structure using the
 function rfbGetScreen(), like
 @code
   rfbScreenInfoPtr screen =
     rfbGetScreen(argc,argv,screenwidth,screenheight,8,3,bpp);
 @endcode
 where byte per pixel should be 1, 2 or 4. If performance doesn't matter,
 you may try bpp=3 (internally one cannot use native data types in this
 case; if you want to use this, look at pnmshow24.c).

 You then can set hooks and io functions (see @ref making_it_interactive) or other
 options (see @ref server_options).

 And you allocate the frame buffer like this:
 @code
     screen->frameBuffer = (char*)malloc(screenwidth*screenheight*bpp);
 @endcode
 After that, you initialize the server, like
 @code
   rfbInitServer(screen);
 @endcode
 You can use a blocking event loop, a background (pthread based) event loop,
 or implement your own using the rfbProcessEvents() function.

 @subsection server_options Optional Server Features

 These options have to be set between rfbGetScreen() and rfbInitServer().

 If you already have a socket to talk to, just set rfbScreenInfo::inetdSock
 (originally this is for inetd handling, but why not use it for your purpose?).

 To also start an HTTP server (running on port 5800+display_number), you have
 to set rfbScreenInfo::httpDir to a directory containing vncviewer.jar and
 index.vnc (like the included "webclients" directory).

 @section making_it_interactive Making it interactive

 Whenever you draw something, you have to call
 @code
  rfbMarkRectAsModified(screen,x1,y1,x2,y2).
 @endcode
 This tells LibVNCServer to send updates to all connected clients.

 There exist the following IO functions as members of rfbScreen:
 rfbScreenInfo::kbdAddEvent(), rfbScreenInfo::kbdReleaseAllKeys(), rfbScreenInfo::ptrAddEvent(),
 rfbScreenInfo::setXCutText() and rfbScreenInfo::setXCutTextUTF8()

 rfbScreenInfo::kbdAddEvent()
   is called when a key is pressed.
 rfbScreenInfo::kbdReleaseAllKeys()
   is not called at all (maybe in the future).
 rfbScreenInfo::ptrAddEvent()
   is called when the mouse moves or a button is pressed.
   WARNING: if you want to have proper cursor handling, call
	rfbDefaultPtrAddEvent()
   in your own function. This sets the coordinates of the cursor.
 rfbScreenInfo::setXCutText()
   is called when the selection changes.
 rfbScreenInfo::setXCutTextUTF8()
   is called when the selection changes and the ExtendedClipboard extension is enabled.

 There are only two hooks:
 rfbScreenInfo::newClientHook()
   is called when a new client has connected.
 rfbScreenInfo::displayHook()
   is called just before a frame buffer update is sent.

 You can also override the following methods:
 rfbScreenInfo::getCursorPtr()
   This could be used to make an animated cursor (if you really want ...)
 rfbScreenInfo::setTranslateFunction()
   If you insist on colour maps or something more obscure, you have to
   implement this. Default is a trueColour mapping.

 @section cursor_handling Cursor handling

 The screen holds a pointer
  rfbScreenInfo::cursor
 to the current cursor. Whenever you set it, remember that any dynamically
 created cursor (like return value from rfbMakeXCursor()) is not free'd!

 The rfbCursor structure consists mainly of a mask and a source. The rfbCursor::mask
 describes, which pixels are drawn for the cursor (a cursor needn't be
 rectangular). The rfbCursor::source describes, which colour those pixels should have.

 The standard is an XCursor: a cursor with a foreground and a background
 colour (stored in backRed,backGreen,backBlue and the same for foreground
 in a range from 0-0xffff). Therefore, the arrays "mask" and "source"
 contain pixels as single bits stored in bytes in MSB order. The rows are
 padded, such that each row begins with a new byte (i.e. a 10x4
 cursor's mask has 2x4 bytes, because 2 bytes are needed to hold 10 bits).

 It is however very easy to make a cursor like this:
 @code
 char* cur="    "
           " xx "
	   " x  "
	   "    ";
 char* mask="xxxx"
            "xxxx"
            "xxxx"
            "xxx ";
 rfbCursorPtr c=rfbMakeXCursor(4,4,cur,mask);
 @endcode
 You can even set rfbCursor::mask to NULL in this call and LibVNCServer will calculate
 a mask for you (dynamically, so you have to free it yourself).

 There is also an array named rfbCursor::richSource for colourful cursors. They have
 the same format as the frameBuffer (i.e. if the server is 32 bit,
 a 10x4 cursor has 4x10x4 bytes).

 @section screen_client_difference What is the difference between rfbScreenInfoPtr and rfbClientPtr?

 The rfbScreenInfoPtr is a pointer to a rfbScreenInfo structure, which
 holds information about the server, like pixel format, io functions,
 frame buffer etc. The rfbClientPtr is a pointer to an rfbClientRec structure, which holds
 information about a client, like pixel format, socket of the
 connection, etc. A server can have several clients, but needn't have any. So, if you
 have a server and three clients are connected, you have one instance
 of a rfbScreenInfo and three instances of rfbClientRec's.

 The rfbClientRec structure holds a member rfbClientRec::screen which points to the server.
 So, to access the server from the client structure, you use client->screen.

 To access all clients from a server be sure to use the provided iterator
  rfbGetClientIterator()
 with
  rfbClientIteratorNext()
 and
  rfbReleaseClientIterator()
 to prevent thread clashes.

 @section example_code Example Code

 There are two documented examples included:
  - example.c, a shared scribble sheet
  - pnmshow.c, a program to show PNMs (pictures) over the net.

 The examples are not too well documented, but easy straight forward and a
 good starting point.

 Try example.c: it outputs on which port it listens (default: 5900), so it is
 display 0. To view, call @code	vncviewer :0 @endcode
 You should see a sheet with a gradient and "Hello World!" written on it. Try
 to paint something. Note that every time you click, there is some bigger blot,
 whereas when you drag the mouse while clicked you draw a line. The size of the
 blot depends on the mouse button you click. Open a second vncviewer with
 the same parameters and watch it as you paint in the other window. This also
 works over internet. You just have to know either the name or the IP of your
 machine. Then it is @code vncviewer machine.where.example.runs.com:0 @endcode
 or similar for the remote client. Now you are ready to type something. Be sure
 that your mouse sits still, because every time the mouse moves, the cursor is
 reset to the position of the pointer! If you are done with that demo, press
 the down or up arrows. If your viewer supports it, then the dimensions of the
 sheet change. Just press Escape in the viewer. Note that the server still
 runs, even if you closed both windows. When you reconnect now, everything you
 painted and wrote is still there. You can press "Page Up" for a blank page.

 The demo pnmshow.c is much simpler: you either provide a filename as argument
 or pipe a file through stdin. Note that the file has to be a raw pnm/ppm file,
 i.e. a truecolour graphics. Only the Escape key is implemented. This may be
 the best starting point if you want to learn how to use LibVNCServer. You
 are confronted with the fact that the bytes per pixel can only be 8, 16 or 32.
 }
{$endif}

implementation


end.
