
unit rfbclient;
interface

{
  Automatically converted by H2Pas 1.0.0 from rfbclient.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rfbclient.h
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
PAppData  = ^AppData;
Pchar  = ^char;
Pdword  = ^dword;
PFILE  = ^FILE;
PGetCredentialProc  = ^GetCredentialProc;
PGetPasswordProc  = ^GetPasswordProc;
PGetSASLMechanismProc  = ^GetSASLMechanismProc;
PGetUserProc  = ^GetUserProc;
Pjpeg_source_mgr  = ^jpeg_source_mgr;
Plongint  = ^longint;
PrfbClient  = ^rfbClient;
PrfbClientData  = ^rfbClientData;
PrfbClientProtocolExtension  = ^rfbClientProtocolExtension;
PrfbCredential  = ^rfbCredential;
PrfbFramebufferUpdateRectHeader  = ^rfbFramebufferUpdateRectHeader;
PrfbPixelFormat  = ^rfbPixelFormat;
PrfbServerToClientMsg  = ^rfbServerToClientMsg;
PrfbVNCRec  = ^rfbVNCRec;
Psasl_conn_t  = ^sasl_conn_t;
Psasl_secret_t  = ^sasl_secret_t;
Puint32_t  = ^uint32_t;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef RFBCLIENT_H}
{$define RFBCLIENT_H}
{*
 * @defgroup libvncclient_api LibVNCClient API Reference
 * @
  }
{
 *  Copyright (C) 2017 D. R. Commander.  All Rights Reserved.
 *  Copyright (C) 2000, 2001 Const Kaplinsky.  All Rights Reserved.
 *  Copyright (C) 2000 Tridia Corporation.  All Rights Reserved.
 *  Copyright (C) 1999 AT&T Laboratories Cambridge.  All Rights Reserved.
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
{*
 * @file rfbclient.h
  }
{$ifdef WIN32}
{ Prevent loading any Winsock 1.x headers from windows.h  }
{$define WIN32_LEAN_AND_MEAN}
{$ifdef _MSC_VER}
(** unsupported pragma#pragma warning(disable:4996)*)
{$endif}
{$endif}
{$if defined(ANDROID) || defined(LIBVNCSERVER_HAVE_ANDROID)}
{$include <arpa/inet.h>}
{$include <sys/select.h>}
{$endif}
{$include <stdio.h>}
{$include <stdlib.h>}
{$include <string.h>}
{$if LIBVNCSERVER_HAVE_SYS_TIME_H}
{$include <sys/time.h>}
{$endif}
{$if LIBVNCSERVER_HAVE_UNISTD_H}
{$include <unistd.h>}
{$endif}
{$include <rfb/rfbproto.h>}
{$include <rfb/keysym.h>}
{$include <rfb/threading.h>}
{$ifdef LIBVNCSERVER_HAVE_SASL}
{$include <sasl/sasl.h>}
{$endif}
{ LIBVNCSERVER_HAVE_SASL  }

const
  FLASH_PORT_OFFSET = 5400;  
  LISTEN_PORT_OFFSET = 5500;  
  TUNNEL_PORT_OFFSET = 5500;  
  SERVER_PORT_OFFSET = 5900;  
  DEFAULT_CONNECT_TIMEOUT = 60;  
  DEFAULT_READ_TIMEOUT = 0;  
  DEFAULT_SSH_CMD = '/usr/bin/ssh';  
  DEFAULT_TUNNEL_CMD = DEFAULT_SSH_CMD+' -f -L %L:localhost:%R %H sleep 20';  
  DEFAULT_VIA_CMD = DEFAULT_SSH_CMD+' -f -L %L:%H:%R %G sleep 20';  
{* vncrec  }
type
  PrfbVNCRec = ^TrfbVNCRec;
  TrfbVNCRec = record
      file : PFILE;
      tv : Ttimeval;
      readTimestamp : TrfbBool;
      doNotSleep : TrfbBool;
    end;
{* client data  }

  PrfbClientData = ^TrfbClientData;
  TrfbClientData = record
      tag : pointer;
      data : pointer;
      next : PrfbClientData;
    end;
{* app data (belongs into rfbClient?)  }
(* Const before type ignored *)
{*< use palmvnc specific SetScale (vs ultravnc)  }
{*< 0 means no scale set, else 1/scaleSetting  }

  PAppData = ^TAppData;
  TAppData = record
      shareDesktop : TrfbBool;
      viewOnly : TrfbBool;
      encodingsString : Pchar;
      useBGR233 : TrfbBool;
      nColours : longint;
      forceOwnCmap : TrfbBool;
      forceTrueColour : TrfbBool;
      requestedDepth : longint;
      compressLevel : longint;
      qualityLevel : longint;
      enableJPEG : TrfbBool;
      useRemoteCursor : TrfbBool;
      palmVNC : TrfbBool;
      scaleSetting : longint;
    end;
{* For GetCredentialProc callback function to return  }
{* X509 (VeNCrypt)  }
{ Only required for OpenSSL - see meanings below  }
{* Plain (VeNCrypt), MSLogon (UltraVNC)  }

  PrfbCredential = ^TrfbCredential;
  TrfbCredential = record
      case longint of
        0 : ( x509Credential : record
            x509CACertFile : Pchar;
            x509CACrlFile : Pchar;
            x509ClientCertFile : Pchar;
            x509ClientKeyFile : Pchar;
            x509CrlVerifyMode : Tuint8_t;
          end );
        1 : ( userCredential : record
            username : Pchar;
            password : Pchar;
          end );
      end;

const
  rfbCredentialTypeX509 = 1;  
  rfbCredentialTypeUser = 2;  
{ When using OpenSSL, CRLs can be included in both the x509CACrlFile and appended
   to the x509CACertFile as is common with OpenSSL.  When rfbX509CrlVerifyAll is
   specified the CRL list must include CRLs for all certificates in the chain  }
{ No CRL checking is performed  }
  rfbX509CrlVerifyNone = 0;  
{ Only the leaf server certificate is checked  }
  rfbX509CrlVerifyClient = 1;  
{ All certificates in the server chain are checked  }
  rfbX509CrlVerifyAll = 2;  
type
  PrfbClient = ^TrfbClient;
  TrfbClient = record
      {undefined structure}
    end;

{*
 * Handles a text chat message. If your application should accept text messages
 * from the server, define a function with this prototype and set
 * client->HandleTextChat to a pointer to that function subsequent to your
 * rfbGetClient() call.
 * @param client The client which called the text chat handler
 * @param value  text length if text != NULL, or one of rfbTextChatOpen,
 * rfbTextChatClose, rfbTextChatFinished if text == NULL
 * @param text The text message from the server
  }

  THandleTextChatProc = procedure (client:PrfbClient; value:longint; text:Pchar);cdecl;
{*
 * Handles XVP server messages. If your application sends XVP messages to the
 * server, you'll want to handle the server's XVP_FAIL and XVP_INIT responses.
 * Define a function with this prototype and set client->HandleXvpMsg to a
 * pointer to that function subsequent to your rfbGetClient() call.
 * @param client The client which called the XVP message handler
 * @param version The highest XVP extension version that the server supports
 * @param opcode The opcode. 0 is XVP_FAIL, 1 is XVP_INIT
  }

  THandleXvpMsgProc = procedure (client:PrfbClient; version:Tuint8_t; opcode:Tuint8_t);cdecl;

  THandleKeyboardLedStateProc = procedure (client:PrfbClient; value:longint; pad:longint);cdecl;

  THandleCursorPosProc = function (client:PrfbClient; x:longint; y:longint):TrfbBool;cdecl;

  TSoftCursorLockAreaProc = procedure (client:PrfbClient; x:longint; y:longint; w:longint; h:longint);cdecl;

  TSoftCursorUnlockScreenProc = procedure (client:PrfbClient);cdecl;
{*
   Callback indicating that a rectangular area of the client's framebuffer was updated.
   As a server will usually send several rects per rfbFramebufferUpdate message, this
   callback is usually called multiple times per rfbFramebufferUpdate message.
   @param client The client whose framebuffer was (partially) updated
   @param x The x-coordinate of the upper left corner of the updated rectangle
   @param y The y-coordinate of the upper left corner of the updated rectangle
   @param w The width of the updated rectangle
   @param h The heigth of the updated rectangle
  }

  TGotFrameBufferUpdateProc = procedure (client:PrfbClient; x:longint; y:longint; w:longint; h:longint);cdecl;
{*
   Callback indicating that a client has completely processed an rfbFramebufferUpdate
   message sent by a server.
   This is called exactly once per each handled rfbFramebufferUpdate message.
   @param client The client which finished processing an rfbFramebufferUpdate
  }

  TFinishedFrameBufferUpdateProc = procedure (client:PrfbClient);cdecl;

  PGetPasswordProc = ^TGetPasswordProc;
  TGetPasswordProc = function (client:PrfbClient):Pchar;cdecl;

  PGetCredentialProc = ^TGetCredentialProc;
  TGetCredentialProc = function (client:PrfbClient; credentialType:longint):PrfbCredential;cdecl;

  TMallocFrameBufferProc = function (client:PrfbClient):TrfbBool;cdecl;
(* Const before type ignored *)

  TGotXCutTextProc = procedure (client:PrfbClient; text:Pchar; textlen:longint);cdecl;

  TBellProc = procedure (client:PrfbClient);cdecl;
{*
    Called when a cursor shape update was received from the server. The decoded cursor shape
    will be in client->rcSource. It's up to the application to do something with this, e.g. draw
    into a viewer's window. If you want the server to draw the cursor into the framebuffer, be
    careful not to announce remote cursor support, i.e. not include rfbEncodingXCursor or
    rfbEncodingRichCursor in SetFormatAndEncodings().
 }

  TGotCursorShapeProc = procedure (client:PrfbClient; xhot:longint; yhot:longint; width:longint; height:longint; 
                bytesPerPixel:longint);cdecl;

  TGotCopyRectProc = procedure (client:PrfbClient; src_x:longint; src_y:longint; w:longint; h:longint; 
                dest_x:longint; dest_y:longint);cdecl;

  TGotFillRectProc = procedure (client:PrfbClient; x:longint; y:longint; w:longint; h:longint; 
                colour:Tuint32_t);cdecl;
(* Const before type ignored *)

  TGotBitmapProc = procedure (client:PrfbClient; buffer:Puint8_t; x:longint; y:longint; w:longint; 
                h:longint);cdecl;
(* Const before type ignored *)

  TGotJpegProc = function (client:PrfbClient; buffer:Puint8_t; length:longint; x:longint; y:longint; 
               w:longint; h:longint):TrfbBool;cdecl;

  TLockWriteToTLSProc = function (client:PrfbClient):TrfbBool;cdecl;
{* @deprecated  }

  TUnlockWriteToTLSProc = function (client:PrfbClient):TrfbBool;cdecl;
{* @deprecated  }
{$ifdef LIBVNCSERVER_HAVE_SASL}

  PGetUserProc = ^TGetUserProc;
  TGetUserProc = function (client:PrfbClient):Pchar;cdecl;

  PGetSASLMechanismProc = ^TGetSASLMechanismProc;
  TGetSASLMechanismProc = function (client:PrfbClient; mechlist:Pchar):Pchar;cdecl;
{$endif}
{ LIBVNCSERVER_HAVE_SASL  }

const
  RFB_BUFFER_SIZE = 640*480;  
  RFB_BUF_SIZE = 8192;  
  ZLIB_BUFFER_SIZE = 30000;  
  TIGHT_GRADIENT_MAX_WIDTH = 2048;  
{/ xxxxxx LIBVNCSERVER_HAVE_SASL bwi win raus }
(* Const before type ignored *)
{$ifdef LIBVNCSERVER_HAVE_SASL}
(* Const before type ignored *)
{$endif}
type
  PrfbClient = ^TrfbClient;
  TrfbClient = record
      frameBuffer : Puint8_t;
      width : longint;
      height : longint;
      endianTest : longint;
      appData : TAppData;
      programName : Pchar;
      serverHost : Pchar;
      serverPort : longint;
      listenSpecified : TrfbBool;
      listenPort : longint;
      flashPort : longint;
      updateRect : record
          x : longint;
          y : longint;
          w : longint;
          h : longint;
        end;
      buffer : array[0..(RFB_BUFFER_SIZE)-1] of char;
      sock : TrfbSocket;
      canUseCoRRE : TrfbBool;
      canUseHextile : TrfbBool;
      desktopName : Pchar;
      format : TrfbPixelFormat;
      si : TrfbServerInitMsg;
      buf : array[0..(RFB_BUF_SIZE)-1] of char;
      bufoutptr : Pchar;
      buffered : dword;
      ultra_buffer_size : longint;
      ultra_buffer : Pchar;
      raw_buffer_size : longint;
      raw_buffer : Pchar;
      decompStream : Tz_stream;
      decompStreamInited : TrfbBool;
      zlib_buffer : array[0..(ZLIB_BUFFER_SIZE)-1] of char;
      zlibStream : array[0..3] of Tz_stream;
      zlibStreamActive : array[0..3] of TrfbBool;
      cutZeros : TrfbBool;
      rectWidth : longint;
      rectColors : longint;
      tightPalette : array[0..(256*4)-1] of char;
      tightPrevRow : array[0..((TIGHT_GRADIENT_MAX_WIDTH*3)*(sizeof(uint16_t)))-1] of Tuint8_t;
      jpegError : TrfbBool;
      jpegSrcManager : Pjpeg_source_mgr;
      jpegBufferPtr : pointer;
      jpegBufferLen : Tsize_t;
      rcSource : Puint8_t;
      rcMask : Puint8_t;
      clientData : PrfbClientData;
      vncRec : PrfbVNCRec;
      KeyboardLedStateEnabled : longint;
      CurrentKeyboardLedState : longint;
      canHandleNewFBSize : longint;
      HandleTextChat : THandleTextChatProc;
      HandleKeyboardLedState : THandleKeyboardLedStateProc;
      HandleCursorPos : THandleCursorPosProc;
      SoftCursorLockArea : TSoftCursorLockAreaProc;
      SoftCursorUnlockScreen : TSoftCursorUnlockScreenProc;
      GotFrameBufferUpdate : TGotFrameBufferUpdateProc;
      GetPassword : TGetPasswordProc;
      MallocFrameBuffer : TMallocFrameBufferProc;
      GotXCutText : TGotXCutTextProc;
      Bell : TBellProc;
      GotCursorShape : TGotCursorShapeProc;
      GotCopyRect : TGotCopyRectProc;
      supportedMessages : TrfbSupportedMessages;
      major : longint;
      minor : longint;
      authScheme : Tuint32_t;
      subAuthScheme : Tuint32_t;
      tlsSession : pointer;
      GetCredential : TGetCredentialProc;
      clientAuthSchemes : Puint32_t;
      destHost : Pchar;
      destPort : longint;
      QoS_DSCP : longint;
      HandleXvpMsg : THandleXvpMsgProc;
      listenSock : TrfbSocket;
      FinishedFrameBufferUpdate : TFinishedFrameBufferUpdateProc;
      listenAddress : Pchar;
      listen6Sock : TrfbSocket;
      listen6Address : Pchar;
      listen6Port : longint;
      outputWindow : dword;
      LockWriteToTLS : TLockWriteToTLSProc;
      UnlockWriteToTLS : TUnlockWriteToTLSProc;
      GotFillRect : TGotFillRectProc;
      GotBitmap : TGotBitmapProc;
      GotJpeg : TGotJpegProc;
      saslconn : Psasl_conn_t;
      saslDecoded : Pchar;
      saslDecodedLength : dword;
      saslDecodedOffset : dword;
      saslSecret : Psasl_secret_t;
      GetSASLMechanism : TGetSASLMechanismProc;
      GetUser : TGetUserProc;
      tjhnd : pointer;
      connectTimeout : dword;
      readTimeout : dword;
      tlsRwMutex : TMUTEX;
      requestedResize : TrfbBool;
      screen : TrfbExtDesktopScreen;
    end;
{ cursor.c  }
{*
 * Handles XCursor and RichCursor shape updates from the server.
 * We emulate cursor operating on the frame buffer (that is
 * why we call it "software cursor"). This decodes the received cursor
 * shape and hands it over to GotCursorShapeProc, if set.
  }

function HandleCursorShape(client:PrfbClient; xhot:longint; yhot:longint; width:longint; height:longint; 
           enc:Tuint32_t):TrfbBool;cdecl;external;
{ listen.c  }
procedure listenForIncomingConnections(viewer:PrfbClient);cdecl;external;
function listenForIncomingConnectionsNoFork(viewer:PrfbClient; usec_timeout:longint):longint;cdecl;external;
{ rfbproto.c  }
  var
    rfbEnableClientLogging : TrfbBool;cvar;external;
(* Const before type ignored *)
type

  TrfbClientLogProc = procedure (format:Pchar; args:array of const);cdecl;
  var
    rfbClientLog : TrfbClientLogProc;cvar;external;
(* Const before type ignored *)

function ConnectToRFBServer(client:PrfbClient; hostname:Pchar; port:longint):TrfbBool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ConnectToRFBRepeater(client:PrfbClient; repeaterHost:Pchar; repeaterPort:longint; destHost:Pchar; destPort:longint):TrfbBool;cdecl;external;
(* Const before type ignored *)
procedure SetClientAuthSchemes(client:PrfbClient; authSchemes:Puint32_t; size:longint);cdecl;external;
function InitialiseRFBConnection(client:PrfbClient):TrfbBool;cdecl;external;
{*
 * Sends format and encoding parameters to the server. Your application can
 * modify the 'client' data structure directly. However some changes to this
 * structure must be communicated back to the server. For instance, if you
 * change the encoding to hextile, the server needs to know that it should send
 * framebuffer updates in hextile format. Likewise if you change the pixel
 * format of the framebuffer, the server must be notified about this as well.
 * Call this function to propagate your changes of the local 'client' structure
 * over to the server.
 * @li Encoding type
 * @li RFB protocol extensions announced via pseudo-encodings
 * @li Framebuffer pixel format (like RGB vs ARGB)
 * @li Remote cursor support
 * @param client The client in which the format or encodings have been changed
 * @return true if the format or encodings were sent to the server successfully,
 * false otherwise
  }
function SetFormatAndEncodings(client:PrfbClient):TrfbBool;cdecl;external;
function SendIncrementalFramebufferUpdateRequest(client:PrfbClient):TrfbBool;cdecl;external;
{*
 * Sends a framebuffer update request to the server. A VNC client may request an
 * update from the server at any time. You can also specify which portions of
 * the screen you want updated. This can be handy if a pointer is at certain
 * location and the user pressed a mouse button, for instance. Then you can
 * immediately request an update of the region around the pointer from the
 * server.
 * @note The coordinate system is a left-handed Cartesian coordinate system with
 * the Z axis (unused) pointing out of the screen. Alternately you can think of
 * it as a right-handed Cartesian coordinate system with the Z axis pointing
 * into the screen. The origin is at the upper left corner of the framebuffer.
 * @param client The client through which to send the request
 * @param x The horizontal position of the update request rectangle
 * @param y The vertical position of the update request rectangle
 * @param w The width of the update request rectangle
 * @param h The height of the update request rectangle
 * @param incremental false: server sends rectangle even if nothing changed.
 * true: server only sends changed parts of rectangle.
 * @return true if the update request was sent successfully, false otherwise
  }
function SendFramebufferUpdateRequest(client:PrfbClient; x:longint; y:longint; w:longint; h:longint; 
           incremental:TrfbBool):TrfbBool;cdecl;external;
function SendScaleSetting(client:PrfbClient; scaleSetting:longint):TrfbBool;cdecl;external;
{*
 * Sends a pointer event to the server. A pointer event includes a cursor
 * location and a button mask. The button mask indicates which buttons on the
 * pointing device are pressed. Each button is represented by a bit in the
 * button mask. A 1 indicates the button is pressed while a 0 indicates that it
 * is not pressed. You may use these pre-defined button masks by ORing them
 * together: rfbButton1Mask, rfbButton2Mask, rfbButton3Mask, rfbButton4Mask
 * rfbButton5Mask
 * @note  The cursor location is relative to the client's framebuffer, not the
 * client's screen itself.
 * @note The coordinate system is a left-handed Cartesian coordinate system with
 * the Z axis (unused) pointing out of the screen. Alternately you can think of
 * it as a right-handed Cartesian coordinate system with the Z axis pointing
 * into the screen. The origin is at the upper left corner of the screen.
 * @param client The client through which to send the pointer event
 * @param x the horizontal location of the cursor
 * @param y the vertical location of the cursor
 * @param buttonMask the button mask indicating which buttons are pressed
 * @return true if the pointer event was sent successfully, false otherwise
  }
function SendPointerEvent(client:PrfbClient; x:longint; y:longint; buttonMask:longint):TrfbBool;cdecl;external;
{*
 * Sends a SetDesktopSize event to the server.
 * @param client The client through which to send the SetDesktopSize event
 * @param width The width of the update request rectangle
 * @param height The height of the update request rectangle
 * @return true if the SetDesktopSize event was send successfully, false otherwise
  }
function SendExtDesktopSize(client:PrfbClient; width:Tuint16_t; height:Tuint16_t):TrfbBool;cdecl;external;
{*
 * Sends a key event to the server. If your application is not merely a VNC
 * viewer (i.e. it controls the server), you'll want to send the keys that the
 * user presses to the server. Use this function to do that.
 * @param client The client through which to send the key event
 * @param key An rfbKeySym defined in rfb/keysym.h
 * @param down true if this was a key down event, false otherwise
 * @return true if the key event was send successfully, false otherwise
  }
function SendKeyEvent(client:PrfbClient; key:Tuint32_t; down:TrfbBool):TrfbBool;cdecl;external;
{*
 * The same as SendKeyEvent, except a key code will be sent along with the
 * symbol if the server supports extended key events.
 * @param client The client through which to send the key event
 * @param keysym An rfbKeySym defined in rfb/keysym.h
 * @param keycode An XT key code
 * @param down true if this was a key down event, false otherwise
 * @return true if the extended key event is supported and was sent
 * successfully, false otherwise
  }
function SendExtendedKeyEvent(client:PrfbClient; keysym:Tuint32_t; keycode:Tuint32_t; down:TrfbBool):TrfbBool;cdecl;external;
{*
 * Places a string on the server's clipboard. Use this function if you want to
 * be able to copy and paste between the server and your application. For
 * instance, when your application is notified that the user copied some text
 * onto the clipboard, you would call this function to synchronize the server's
 * clipboard with your local clipboard.
 * @param client The client structure through which to send the client cut text
 * message
 * @param str The string to send (doesn't need to be NULL terminated)
 * @param len The length of the string
 * @return true if the client cut message was sent successfully, false otherwise
  }
function SendClientCutText(client:PrfbClient; str:Pchar; len:longint):TrfbBool;cdecl;external;
{*
 * Handles messages from the RFB server. You must call this function
 * intermittently so LibVNCClient can parse messages from the server. For
 * example, if your app has a draw loop, you could place a call to this
 * function within that draw loop.
 * @note You must call WaitForMessage() before you call this function.
 * @param client The client which will handle the RFB server messages
 * @return true if the client was able to handle the RFB server messages, false
 * otherwise
  }
function HandleRFBServerMessage(client:PrfbClient):TrfbBool;cdecl;external;
{*
 * Sends a text chat message to the server.
 * @param client The client through which to send the message
 * @param text The text to send
 * @return true if the text was sent successfully, false otherwise
  }
function TextChatSend(client:PrfbClient; text:Pchar):TrfbBool;cdecl;external;
{*
 * Opens a text chat window on the server.
 * @param client The client through which to send the message
 * @return true if the window was opened successfully, false otherwise
  }
function TextChatOpen(client:PrfbClient):TrfbBool;cdecl;external;
{*
 * Closes the text chat window on the server.
 * @param client The client through which to send the message
 * @return true if the window was closed successfully, false otherwise
  }
function TextChatClose(client:PrfbClient):TrfbBool;cdecl;external;
function TextChatFinish(client:PrfbClient):TrfbBool;cdecl;external;
function PermitServerInput(client:PrfbClient; enabled:longint):TrfbBool;cdecl;external;
function SendXvpMsg(client:PrfbClient; version:Tuint8_t; code:Tuint8_t):TrfbBool;cdecl;external;
procedure PrintPixelFormat(format:PrfbPixelFormat);cdecl;external;
function SupportsClient2Server(client:PrfbClient; messageType:longint):TrfbBool;cdecl;external;
function SupportsServer2Client(client:PrfbClient; messageType:longint):TrfbBool;cdecl;external;
{ client data  }
{*
 * Associates a client data tag with the given pointer. LibVNCClient has
 * several events to which you can associate your own handlers. These handlers
 * have the client structure as one of their parameters. Sometimes, you may want
 * to make data from elsewhere in your application available to these handlers
 * without using a global variable. To do this, you call
 * rfbClientSetClientData() and associate the data with a tag. Then, your
 * handler can call rfbClientGetClientData() and get the a pointer to the data
 * associated with that tag.
 * @param client The client in which to set the client data
 * @param tag A unique tag which identifies the data
 * @param data A pointer to the data to associate with the tag
  }
procedure rfbClientSetClientData(client:PrfbClient; tag:pointer; data:pointer);cdecl;external;
{*
 * Returns a pointer to the client data associated with the given tag. See the
 * the documentation for rfbClientSetClientData() for a discussion of how you
 * can use client data.
 * @param client The client from which to get the client data
 * @param tag The tag which identifies the client data
 * @return a pointer to the client data
  }
function rfbClientGetClientData(client:PrfbClient; tag:pointer):pointer;cdecl;external;
{ protocol extensions  }
{* returns TRUE if the encoding was handled  }
{* returns TRUE if it handled the message  }
(* Const before declarator ignored *)
{* returns TRUE if it handled the authentication  }
type
  PrfbClientProtocolExtension = ^TrfbClientProtocolExtension;
  TrfbClientProtocolExtension = record
      encodings : Plongint;
      handleEncoding : function (cl:PrfbClient; rect:PrfbFramebufferUpdateRectHeader):TrfbBool;cdecl;
      handleMessage : function (cl:PrfbClient; message:PrfbServerToClientMsg):TrfbBool;cdecl;
      next : PrfbClientProtocolExtension;
      securityTypes : Puint32_t;
      handleAuthentication : function (cl:PrfbClient; authScheme:Tuint32_t):TrfbBool;cdecl;
    end;

procedure rfbClientRegisterExtension(e:PrfbClientProtocolExtension);cdecl;external;
{ sockets.c  }
  var
    errorMessageOnReadFailure : TrfbBool;cvar;external;

function ReadFromRFBServer(client:PrfbClient; out:Pchar; n:dword):TrfbBool;cdecl;external;
(* Const before type ignored *)
function WriteToRFBServer(client:PrfbClient; buf:Pchar; n:dword):TrfbBool;cdecl;external;
function FindFreeTcpPort:longint;cdecl;external;
function ListenAtTcpPort(port:longint):TrfbSocket;cdecl;external;
(* Const before type ignored *)
function ListenAtTcpPortAndAddress(port:longint; address:Pchar):TrfbSocket;cdecl;external;
{*
   Tries to connect to an IPv4 host.
   @param host Binary IPv4 address
   @param port Port
   @return A blocking socket or RFB_INVALID_SOCKET if the connection failed
 }
function ConnectClientToTcpAddr(host:dword; port:longint):TrfbSocket;cdecl;external;
{*
   Tries to connect to an IPv4 or IPv6 host.
   @param hostname A hostname or IP address
   @param port Port
   @return A blocking socket or RFB_INVALID_SOCKET if the connection failed
 }
(* Const before type ignored *)
function ConnectClientToTcpAddr6(hostname:Pchar; port:longint):TrfbSocket;cdecl;external;
{*
   Tries to connect to a Unix socket.
   @param sockFile Path of the socket file
   @return A blocking socket or RFB_INVALID_SOCKET if the connection failed
 }
(* Const before type ignored *)
function ConnectClientToUnixSock(sockFile:Pchar):TrfbSocket;cdecl;external;
{*
   Tries to connect to an IPv4 host using the given timeout value.
   @param host Binary IPv4 address
   @param port Port
   @param timeout The time in seconds to wait for a connection
   @return A nonblocking socket or RFB_INVALID_SOCKET if the connection failed
 }
function ConnectClientToTcpAddrWithTimeout(host:dword; port:longint; timeout:dword):TrfbSocket;cdecl;external;
{*
   Tries to connect to an IPv4 or IPv6 host using the given timeout value.
   @param hostname A hostname or IP address
   @param port Port
   @param timeout The time in seconds to wait for a connection
   @return A nonblocking socket or RFB_INVALID_SOCKET if the connection failed
 }
(* Const before type ignored *)
function ConnectClientToTcpAddr6WithTimeout(hostname:Pchar; port:longint; timeout:dword):TrfbSocket;cdecl;external;
{*
   Tries to connect to a Unix socket using the given timeout value.
   @param sockFile Path of the socket file
   @param timeout The time in seconds to wait for a connection
   @return A nonblocking socket or RFB_INVALID_SOCKET if the connection failed
 }
(* Const before type ignored *)
function ConnectClientToUnixSockWithTimeout(sockFile:Pchar; timeout:dword):TrfbSocket;cdecl;external;
function AcceptTcpConnection(listenSock:TrfbSocket):TrfbSocket;cdecl;external;
function SetNonBlocking(sock:TrfbSocket):TrfbBool;cdecl;external;
function SetBlocking(sock:TrfbSocket):TrfbBool;cdecl;external;
function SetDSCP(sock:TrfbSocket; dscp:longint):TrfbBool;cdecl;external;
(* Const before type ignored *)
function StringToIPAddr(str:Pchar; addr:Pdword):TrfbBool;cdecl;external;
function SameMachine(sock:TrfbSocket):TrfbBool;cdecl;external;
{*
 * Waits for an RFB message to arrive from the server. Before handling a message
 * with HandleRFBServerMessage(), you must wait for your client to receive one.
 * This function blocks until a message is received. You may specify a timeout
 * in microseconds. Once this number of microseconds have elapsed, the function
 * will return.
 * @param client The client to cause to wait until a message is received
 * @param usecs The timeout in microseconds
 * @return the return value of the underlying select() call
  }
function WaitForMessage(client:PrfbClient; usecs:dword):longint;cdecl;external;
{ vncviewer.c  }
{*
 * Allocates and returns a pointer to an rfbClient structure. This will probably
 * be the first LibVNCClient function your client code calls. Most libVNCClient
 * functions operate on an rfbClient structure, and this function allocates
 * memory for that structure. When you're done with the rfbClient structure
 * pointer this function returns, you should free the memory rfbGetClient()
 * allocated by calling rfbClientCleanup().
 *
 * A pixel is one dot on the screen. The number of bytes in a pixel will depend
 * on the number of samples in that pixel and the number of bits in each sample.
 * A sample represents one of the primary colors in a color model. The RGB
 * color model uses red, green, and blue samples respectively. Suppose you
 * wanted to use 16-bit RGB color: You would have three samples per pixel (one
 * for each primary color), five bits per sample (the quotient of 16 RGB bits
 * divided by three samples), and two bytes per pixel (the smallest multiple of
 * eight bits in which the 16-bit pixel will fit). If you wanted 32-bit RGB
 * color, you would have three samples per pixel again, eight bits per sample
 * (since that's how 32-bit color is defined), and four bytes per pixel (the
 * smallest multiple of eight bits in which the 32-bit pixel will fit.
 * @param bitsPerSample The number of bits in a sample
 * @param samplesPerPixel The number of samples in a pixel
 * @param bytesPerPixel The number of bytes in a pixel
 * @return a pointer to the allocated rfbClient structure
  }
function rfbGetClient(bitsPerSample:longint; samplesPerPixel:longint; bytesPerPixel:longint):PrfbClient;cdecl;external;
{*
 * Initializes the client. The format is PROGRAM_NAME, [OPTIONS]..., HOST. This
 * function does not initialize the program name if the rfbClient's program
 * name is set already. The options are as follows:
 * <table>
 * <tr><th>Option</th><th>Description</th></tr>
 * <tr><td>-listen</td><td>Listen for incoming connections.</td></tr>
 * <tr><td>-listennofork</td><td>Listen for incoming connections without forking.
 * </td></tr>
 * <tr><td>-play</td><td>Set this client to replay a previously recorded session.</td></tr>
 * <tr><td>-encodings</td><td>Set the encodings to use. The next item in the
 * argv array is the encodings string, consisting of comma separated encodings like 'tight,ultra,raw'.</td></tr>
 * <tr><td>-compress</td><td>Set the compression level. The next item in the
 * argv array is the compression level as an integer. Ranges from 0 (lowest) to 9 (highest).
 * </td></tr>
 * <tr><td>-scale</td><td>Set the scaling level. The next item in the
 * argv array is the scaling level as an integer. The screen will be scaled down by this factor.</td></tr>
 * <tr><td>-qosdscp</td><td>Set the Quality of Service Differentiated Services
 * Code Point (QoS DSCP). The next item in the argv array is the code point as
 * an integer.</td></tr>
 * <tr><td>-repeaterdest</td><td>Set a VNC repeater address. The next item in the argv array is
 * the repeater's address as a string.</td></tr>
 * </table>
 *
 * The host may include a port number (delimited by a ':').
 * @param client The client to initialize
 * @param argc The number of arguments to the initializer
 * @param argv The arguments to the initializer as an array of NULL terminated
 * strings
 * @return true if the client was initialized successfully, false otherwise.
  }
function rfbInitClient(client:PrfbClient; argc:Plongint; argv:PPchar):TrfbBool;cdecl;external;
{*
 * Cleans up the client structure and releases the memory allocated for it. You
 * should call this when you're done with the rfbClient structure that you
 * allocated with rfbGetClient().
 * @note rfbClientCleanup() does not touch client->frameBuffer.
 * @param client The client to clean up
  }
procedure rfbClientCleanup(client:PrfbClient);cdecl;external;
{*
 * @
  }
{*
 @page libvncclient_doc LibVNCClient Documentation
 @section example_code Example Code
 See SDLvncviewer.c for a rather complete client example.
 }
{$endif}

implementation


end.
