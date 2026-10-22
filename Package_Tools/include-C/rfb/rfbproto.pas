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

const
  LIBVNCSERVER_WORDS_BIGENDIAN = 1;  


function rfbMax(a,b : longint) : longint;

const
  rfbSocket = SOCKET;  
  RFB_INVALID_SOCKET = INVALID_SOCKET;  
  _rfbCloseSocket = closesocket;  

const
  rfbSocket = longint;  
  SOCKET = longint;
  RFB_INVALID_SOCKET = -(1);  
  _rfbCloseSocket = close;  

type
  PrfbKeySym = ^TrfbKeySym;
  TrfbKeySym = Tuint32_t;

  PrfbPixel = ^TrfbPixel;
  TrfbPixel = Tuint32_t;

  Pin_addr_t = ^Tin_addr_t;
  Tin_addr_t = Tuint32_t;
{$endif}
{$ifndef INADDR_NONE}

{ was #define dname def_expr }
function INADDR_NONE : Tin_addr_t;  

{$endif}

const
  MAX_ENCODINGS = 64;  
{****************************************************************************
 *
 * Structures used in several messages
 *
 **************************************************************************** }
{-----------------------------------------------------------------------------
 * Structure used to specify a rectangle.  This structure is a multiple of 4
 * bytes so that it can be interspersed with 32-bit pixel data without
 * affecting alignment.
  }
type
  PrfbRectangle = ^TrfbRectangle;
  TrfbRectangle = record
      x : Tuint16_t;
      y : Tuint16_t;
      w : Tuint16_t;
      h : Tuint16_t;
    end;

const
  sz_rfbRectangle = 8;  
{-----------------------------------------------------------------------------
 * Structure used to specify pixel format.
  }
{ 8,16,32 only  }
{ 8 to 32  }
{ True if multi-byte pixels are interpreted
				   as big endian, or if single-bit-per-pixel
				   has most significant bit of the byte
				   corresponding to first (leftmost) pixel. Of
				   course this is meaningless for 8 bits/pix  }
{ If false then we need a "colour map" to
				   convert pixels to RGB.  If true, xxxMax and
				   xxxShift specify bits used for red, green
				   and blue  }
{ the following fields are only meaningful if trueColour is true  }
{ maximum red value (= 2^n - 1 where n is the
				   number of bits used for red). Note this
				   value is always in big endian order.  }
{ similar for green  }
{ and blue  }
{ number of shifts needed to get the red
				   value in a pixel to the least significant
				   bit. To find the red value from a given
				   pixel, do the following:
				   1) Swap pixel value according to bigEndian
				      (e.g. if bigEndian is false and host byte
				      order is big endian, then swap).
				   2) Shift right by redShift.
				   3) AND with redMax (in host byte order).
				   4) You now have the red value between 0 and
				      redMax.  }
{ similar for green  }
{ and blue  }
type
  PrfbPixelFormat = ^TrfbPixelFormat;
  TrfbPixelFormat = record
      bitsPerPixel : Tuint8_t;
      depth : Tuint8_t;
      bigEndian : Tuint8_t;
      trueColour : Tuint8_t;
      redMax : Tuint16_t;
      greenMax : Tuint16_t;
      blueMax : Tuint16_t;
      redShift : Tuint8_t;
      greenShift : Tuint8_t;
      blueShift : Tuint8_t;
      pad1 : Tuint8_t;
      pad2 : Tuint16_t;
    end;

const
  sz_rfbPixelFormat = 16;  
{ UltraVNC: Color settings values  }
  rfbPFFullColors = 0;  
  rfbPF256Colors = 1;  
  rfbPF64Colors = 2;  
  rfbPF8Colors = 3;  
  rfbPF8GreyColors = 4;  
  rfbPF4GreyColors = 5;  
  rfbPF2GreyColors = 6;  
{****************************************************************************
 *
 * Initial handshaking messages
 *
 **************************************************************************** }
{-----------------------------------------------------------------------------
 * Protocol Version
 *
 * The server always sends 12 bytes to start which identifies the latest RFB
 * protocol version number which it supports.  These bytes are interpreted
 * as a string of 12 ASCII characters in the format "RFB xxx.yyy\n" where
 * xxx and yyy are the major and minor version numbers (for version 3.3
 * this is "RFB 003.003\n").
 *
 * The client then replies with a similar 12-byte message giving the version
 * number of the protocol which should actually be used (which may be different
 * to that quoted by the server).
 *
 * It is intended that both clients and servers may provide some level of
 * backwards compatibility by this mechanism.  Servers in particular should
 * attempt to provide backwards compatibility, and even forwards compatibility
 * to some extent.  For example if a client demands version 3.1 of the
 * protocol, a 3.0 server can probably assume that by ignoring requests for
 * encoding types it doesn't understand, everything will still work OK.  This
 * will probably not be the case for changes in the major version number.
 *
 * The format string below can be used in sprintf or sscanf to generate or
 * decode the version string respectively.
  }
  rfbProtocolVersionFormat = 'RFB %03d.%03d\n';  
  rfbProtocolMajorVersion = 3;  
  rfbProtocolMinorVersion = 8;  
{ UltraVNC Viewer examines rfbProtocolMinorVersion number (4, and 6)
 * to identify if the server supports File Transfer
  }
type
  PrfbProtocolVersionMsg = ^TrfbProtocolVersionMsg;
  TrfbProtocolVersionMsg = array[0..12] of char;
{ allow extra byte for null  }

const
  sz_rfbProtocolVersionMsg = 12;  
{
 * Negotiation of the security type (protocol version 3.7)
 *
 * Once the protocol version has been decided, the server either sends a list
 * of supported security types, or informs the client about an error (when the
 * number of security types is 0).  Security type rfbSecTypeTight is used to
 * enable TightVNC-specific protocol extensions.  The value rfbSecTypeVncAuth
 * stands for classic VNC authentication.
 *
 * The client selects a particular security type from the list provided by the
 * server.
  }
  rfbSecTypeInvalid = 0;  
  rfbSecTypeNone = 1;  
  rfbSecTypeVncAuth = 2;  
{-----------------------------------------------------------------------------
 * Authentication
 *
 * Once the protocol version has been decided, the server then sends a 32-bit
 * word indicating whether any authentication is needed on the connection.
 * The value of this word determines the authentication scheme in use.  For
 * version 3.0 of the protocol this may have one of the following values:
  }
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
{ UNIMPLEMENTED  }
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
{
 * rfbConnFailed:	For some reason the connection failed (e.g. the server
 *			cannot support the desired protocol version).  This is
 *			followed by a string describing the reason (where a
 *			string is specified as a 32-bit length followed by that
 *			many ASCII characters).
 *
 * rfbNoAuth:		No authentication is needed.
 *
 * rfbVncAuth:		The VNC authentication scheme is to be used.  A 16-byte
 *			challenge follows, which the client encrypts as
 *			appropriate using the password and sends the resulting
 *			16-byte response.  If the response is correct, the
 *			server sends the 32-bit word rfbVncAuthOK.  If a simple
 *			failure happens, the server sends rfbVncAuthFailed and
 *			closes the connection. If the server decides that too
 *			many failures have occurred, it sends rfbVncAuthTooMany
 *			and closes the connection.  In the latter case, the
 *			server should not allow an immediate reconnection by
 *			the client.
  }
  rfbVncAuthOK = 0;  
  rfbVncAuthFailed = 1;  
  rfbVncAuthTooMany = 2;  
{-----------------------------------------------------------------------------
 * Client Initialisation Message
 *
 * Once the client and server are sure that they're happy to talk to one
 * another, the client sends an initialisation message.  At present this
 * message only consists of a boolean indicating whether the server should try
 * to share the desktop by leaving other clients connected, or give exclusive
 * access to this client by disconnecting all other clients.
  }
type
  PrfbClientInitMsg = ^TrfbClientInitMsg;
  TrfbClientInitMsg = record
      shared : Tuint8_t;
    end;

const
  sz_rfbClientInitMsg = 1;  
{-----------------------------------------------------------------------------
 * Server Initialisation Message
 *
 * After the client initialisation message, the server sends one of its own.
 * This tells the client the width and height of the server's framebuffer,
 * its pixel format and the name associated with the desktop.
  }
{ the server's preferred pixel format  }
{ followed by char name[nameLength]  }
type
  PrfbServerInitMsg = ^TrfbServerInitMsg;
  TrfbServerInitMsg = record
      framebufferWidth : Tuint16_t;
      framebufferHeight : Tuint16_t;
      format : TrfbPixelFormat;
      nameLength : Tuint32_t;
    end;

const
  sz_rfbServerInitMsg = 8+sz_rfbPixelFormat;  
{
 * Following the server initialisation message it's up to the client to send
 * whichever protocol messages it wants.  Typically it will send a
 * SetPixelFormat message and a SetEncodings message, followed by a
 * FramebufferUpdateRequest.  From then on the server will send
 * FramebufferUpdate messages in response to the client's
 * FramebufferUpdateRequest messages.  The client should send
 * FramebufferUpdateRequest messages with incremental set to true when it has
 * finished processing one FramebufferUpdate and is ready to process another.
 * With a fast client, the rate at which FramebufferUpdateRequests are sent
 * should be regulated to avoid hogging the network.
  }
{****************************************************************************
 *
 * Message types
 *
 **************************************************************************** }
{ server -> client  }
  rfbFramebufferUpdate = 0;  
  rfbSetColourMapEntries = 1;  
  rfbBell = 2;  
  rfbServerCutText = 3;  
{ Modif sf@2002  }
  rfbResizeFrameBuffer = 4;  
  rfbPalmVNCReSizeFrameBuffer = $F;  
{ client -> server  }
  rfbSetPixelFormat = 0;  
{ not currently supported  }
  rfbFixColourMapEntries = 1;  
  rfbSetEncodings = 2;  
  rfbFramebufferUpdateRequest = 3;  
  rfbKeyEvent = 4;  
  rfbPointerEvent = 5;  
  rfbClientCutText = 6;  
{ Modif sf@2002 - actually bidirectionnal  }
  rfbFileTransfer = 7;  
{ Modif sf@2002  }
  rfbSetScale = 8;  
{ Modif rdv@2002  }
  rfbSetServerInput = 9;  
{ Modif rdv@2002  }
  rfbSetSW = 10;  
{ Modif sf@2002 - TextChat - Bidirectionnal  }
  rfbTextChat = 11;  
{ Modif cs@2005  }
{ PalmVNC 1.4 & 2.0 SetScale Factor message  }
  rfbPalmVNCSetScaleFactor = $F;  
{ Xvp message - bidirectional  }
  rfbXvp = 250;  
{ SetDesktopSize client -> server message  }
  rfbSetDesktopSize = 251;  
  rfbQemuEvent = 255;  
{****************************************************************************
 *
 * Encoding types
 *
 **************************************************************************** }
  rfbEncodingRaw = 0;  
  rfbEncodingCopyRect = 1;  
  rfbEncodingRRE = 2;  
  rfbEncodingCoRRE = 4;  
  rfbEncodingHextile = 5;  
  rfbEncodingZlib = 6;  
  rfbEncodingTight = 7;  
{ -260  }
  rfbEncodingTightPng = $FFFFFEFC;  
  rfbEncodingZlibHex = 8;  
  rfbEncodingUltra = 9;  
  rfbEncodingTRLE = 15;  
  rfbEncodingZRLE = 16;  
  rfbEncodingZYWRLE = 17;  
  rfbEncodingH264 = $48323634;  
{ Cache & XOR-Zlib - rdv@2002  }
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
{ Xvp pseudo-encoding  }
  rfbEncodingXvp = $FFFFFECB;  
{
 * Special encoding numbers:
 *   0xFFFFFD00 .. 0xFFFFFD05 -- subsampling level
 *   0xFFFFFE00 .. 0xFFFFFE64 -- fine-grained quality level (0-100 scale)
 *   0xFFFFFF00 .. 0xFFFFFF0F -- encoding-specific compression levels;
 *   0xFFFFFF10 .. 0xFFFFFF1F -- mouse cursor shape data;
 *   0xFFFFFF20 .. 0xFFFFFF2F -- various protocol extensions;
 *   0xFFFFFF30 .. 0xFFFFFFDF -- not allocated yet;
 *   0xFFFFFFE0 .. 0xFFFFFFEF -- quality level for JPEG compressor;
 *   0xFFFFFFF0 .. 0xFFFFFFFF -- cross-encoding compression levels.
  }
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
{ -258  }
  rfbEncodingQemuExtendedKeyEvent = $FFFFFEFE;  
  rfbEncodingExtendedClipboard = $C0A1E5CE;  
{ LibVNCServer additions.   We claim 0xFFFE0000 - 0xFFFE00FF  }
  rfbEncodingKeyboardLedState = $FFFE0000;  
  rfbEncodingSupportedMessages = $FFFE0001;  
  rfbEncodingSupportedEncodings = $FFFE0002;  
  rfbEncodingServerIdentity = $FFFE0003;  
{****************************************************************************
 *
 * Server -> client message definitions
 *
 **************************************************************************** }
{-----------------------------------------------------------------------------
 * FramebufferUpdate - a block of rectangles to be copied to the framebuffer.
 *
 * This message consists of a header giving the number of rectangles of pixel
 * data followed by the rectangles themselves.  The header is padded so that
 * together with the type byte it is an exact multiple of 4 bytes (to help
 * with alignment of 32-bit pixels):
  }
{ always rfbFramebufferUpdate  }
{ followed by nRects rectangles  }
type
  PrfbFramebufferUpdateMsg = ^TrfbFramebufferUpdateMsg;
  TrfbFramebufferUpdateMsg = record
      _type : Tuint8_t;
      pad : Tuint8_t;
      nRects : Tuint16_t;
    end;

const
  sz_rfbFramebufferUpdateMsg = 4;  
{
 * Each rectangle of pixel data consists of a header describing the position
 * and size of the rectangle and a type word describing the encoding of the
 * pixel data, followed finally by the pixel data.  Note that if the client has
 * not sent a SetEncodings message then it will only receive raw pixel data.
 * Also note again that this structure is a multiple of 4 bytes.
  }
{ one of the encoding types rfbEncoding...  }
type
  PrfbFramebufferUpdateRectHeader = ^TrfbFramebufferUpdateRectHeader;
  TrfbFramebufferUpdateRectHeader = record
      r : TrfbRectangle;
      encoding : Tuint32_t;
    end;

const
  sz_rfbFramebufferUpdateRectHeader = sz_rfbRectangle+4;  
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 * Supported Messages Encoding.  This encoding does not contain any pixel data.
 * Instead, it contains 2 sets of bitflags.  These bitflags indicate what messages
 * are supported by the server.
 * rect->w contains byte count
  }
{ maximum of 256 message types (256/8)=32  }
{ maximum of 256 message types (256/8)=32  }
type
  PrfbSupportedMessages = ^TrfbSupportedMessages;
  TrfbSupportedMessages = record
      client2server : array[0..31] of Tuint8_t;
      server2client : array[0..31] of Tuint8_t;
    end;

const
  sz_rfbSupportedMessages = 64;  
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 * Supported Encodings Encoding.  This encoding does not contain any pixel data.
 * Instead, it contains a list of (uint32_t) Encodings supported by this server.
 * rect->w contains byte count
 * rect->h contains encoding count
  }
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 * Server Identity Encoding.  This encoding does not contain any pixel data.
 * Instead, it contains a text string containing information about the server.
 * ie: "x11vnc: 0.8.1 lastmod: 2006-04-25 (libvncserver 0.9pre)\0"
 * rect->w contains byte count
  }
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 * Raw Encoding.  Pixels are sent in top-to-bottom scanline order,
 * left-to-right within a scanline with no padding in between.
  }
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 * KeyboardLedState Encoding.  The X coordinate contains the Locked Modifiers
 * so that a remote troubleshooter can identify that the users 'Caps Lock' 
 * is set...   (It helps a *lot* when the users are untrained)
  }
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
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 * CopyRect Encoding.  The pixels are specified simply by the x and y position
 * of the source rectangle.
  }
type
  PrfbCopyRect = ^TrfbCopyRect;
  TrfbCopyRect = record
      srcX : Tuint16_t;
      srcY : Tuint16_t;
    end;

const
  sz_rfbCopyRect = 4;  
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 * RRE - Rise-and-Run-length Encoding.  We have an rfbRREHeader structure
 * giving the number of subrectangles following.  Finally the data follows in
 * the form [<bgpixel><subrect><subrect>...] where each <subrect> is
 * [<pixel><rfbRectangle>].
  }
type
  PrfbRREHeader = ^TrfbRREHeader;
  TrfbRREHeader = record
      nSubrects : Tuint32_t;
    end;

const
  sz_rfbRREHeader = 4;  
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 * CoRRE - Compact RRE Encoding.  We have an rfbRREHeader structure giving
 * the number of subrectangles following.  Finally the data follows in the form
 * [<bgpixel><subrect><subrect>...] where each <subrect> is
 * [<pixel><rfbCoRRERectangle>].  This means that
 * the whole rectangle must be at most 255x255 pixels.
  }
type
  PrfbCoRRERectangle = ^TrfbCoRRERectangle;
  TrfbCoRRERectangle = record
      x : Tuint8_t;
      y : Tuint8_t;
      w : Tuint8_t;
      h : Tuint8_t;
    end;

const
  sz_rfbCoRRERectangle = 4;  
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 * Hextile Encoding.  The rectangle is divided up into "tiles" of 16x16 pixels,
 * starting at the top left going in left-to-right, top-to-bottom order.  If
 * the width of the rectangle is not an exact multiple of 16 then the width of
 * the last tile in each row will be correspondingly smaller.  Similarly if the
 * height is not an exact multiple of 16 then the height of each tile in the
 * final row will also be smaller.  Each tile begins with a "subencoding" type
 * byte, which is a mask made up of a number of bits.  If the Raw bit is set
 * then the other bits are irrelevant; w*h pixel values follow (where w and h
 * are the width and height of the tile).  Otherwise the tile is encoded in a
 * similar way to RRE, except that the position and size of each subrectangle
 * can be specified in just two bytes.  The other bits in the mask are as
 * follows:
 *
 * BackgroundSpecified - if set, a pixel value follows which specifies
 *    the background colour for this tile.  The first non-raw tile in a
 *    rectangle must have this bit set.  If this bit isn't set then the
 *    background is the same as the last tile.
 *
 * ForegroundSpecified - if set, a pixel value follows which specifies
 *    the foreground colour to be used for all subrectangles in this tile.
 *    If this bit is set then the SubrectsColoured bit must be zero.
 *
 * AnySubrects - if set, a single byte follows giving the number of
 *    subrectangles following.  If not set, there are no subrectangles (i.e.
 *    the whole tile is just solid background colour).
 *
 * SubrectsColoured - if set then each subrectangle is preceded by a pixel
 *    value giving the colour of that subrectangle.  If not set, all
 *    subrectangles are the same colour, the foreground colour;  if the
 *    ForegroundSpecified bit wasn't set then the foreground is the same as
 *    the last tile.
 *
 * The position and size of each subrectangle is specified in two bytes.  The
 * Pack macros below can be used to generate the two bytes from x, y, w, h,
 * and the Extract macros can be used to extract the x, y, w, h values from
 * the two bytes.
  }
  rfbHextileRaw = 1 shl 0;  
  rfbHextileBackgroundSpecified = 1 shl 1;  
  rfbHextileForegroundSpecified = 1 shl 2;  
  rfbHextileAnySubrects = 1 shl 3;  
  rfbHextileSubrectsColoured = 1 shl 4;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function rfbHextilePackXY(x,y : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function rfbHextilePackWH(w,h : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function rfbHextileExtractX(byte : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function rfbHextileExtractY(byte : longint) : Tbyte;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function rfbHextileExtractW(byte : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function rfbHextileExtractH(byte : longint) : longint;

{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 * zlib - zlib compressed Encoding.  We have an rfbZlibHeader structure
 * giving the number of bytes following.  Finally the data follows is
 * zlib compressed version of the raw pixel data as negotiated.
 * (NOTE: also used by Ultra Encoding)
  }
type
  PrfbZlibHeader = ^TrfbZlibHeader;
  TrfbZlibHeader = record
      nBytes : Tuint32_t;
    end;

const
  sz_rfbZlibHeader = 4;  
{$ifdef LIBVNCSERVER_HAVE_LIBZ}
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 * Tight and TightPng Encoding.
 *
 *-- TightPng is like Tight but basic compression is not used, instead PNG
 *   data is sent.
 *
 *-- The first byte of each Tight-encoded rectangle is a "compression control
 *   byte". Its format is as follows (bit 0 is the least significant one):
 *
 *   bit 0:    if 1, then compression stream 0 should be reset;
 *   bit 1:    if 1, then compression stream 1 should be reset;
 *   bit 2:    if 1, then compression stream 2 should be reset;
 *   bit 3:    if 1, then compression stream 3 should be reset;
 *   bits 7-4: if 1000 (0x08), then the compression type is "fill",
 *             if 1001 (0x09), then the compression type is "jpeg",
 *             (Tight only) if 1010 (0x0A), then the compression type is
 *               "basic" and no Zlib compression was used,
 *             (Tight only) if 1110 (0x0E), then the compression type is
 *               "basic", no Zlib compression was used, and a "filter id" byte
 *               follows this byte,
 *             (TightPng only) if 1010 (0x0A), then the compression type is
 *               "png",
 *             if 0xxx, then the compression type is "basic" and Zlib
 *               compression was used,
 *             values greater than 1010 are not valid.
 *
 * If the compression type is "basic" and Zlib compression was used, then bits
 * 6..4 of the compression control byte (those xxx in 0xxx) specify the
 * following:
 *
 *   bits 5-4:  decimal representation is the index of a particular zlib
 *              stream which should be used for decompressing the data;
 *   bit 6:     if 1, then a "filter id" byte is following this byte.
 *
 *-- The data that follows after the compression control byte described
 * above depends on the compression type ("fill", "jpeg", "png" or "basic").
 *
 *-- If the compression type is "fill", then the only pixel value follows, in
 * client pixel format (see NOTE 1). This value applies to all pixels of the
 * rectangle.
 *
 *-- If the compression type is "jpeg" or "png", the following data stream
 * looks like this:
 *
 *   1..3 bytes:  data size (N) in compact representation;
 *   N bytes:     JPEG or PNG image.
 *
 * Data size is compactly represented in one, two or three bytes, according
 * to the following scheme:
 *
 *  0xxxxxxx                    (for values 0..127)
 *  1xxxxxxx 0yyyyyyy           (for values 128..16383)
 *  1xxxxxxx 1yyyyyyy zzzzzzzz  (for values 16384..4194303)
 *
 * Here each character denotes one bit, xxxxxxx are the least significant 7
 * bits of the value (bits 0-6), yyyyyyy are bits 7-13, and zzzzzzzz are the
 * most significant 8 bits (bits 14-21). For example, decimal value 10000
 * should be represented as two bytes: binary 10010000 01001110, or
 * hexadecimal 90 4E.
 *
 *-- If the compression type is "basic" and bit 6 of the compression control
 * byte was set to 1, then the next (second) byte specifies "filter id" which
 * tells the decoder what filter type was used by the encoder to pre-process
 * pixel data before the compression. The "filter id" byte can be one of the
 * following:
 *
 *   0:  no filter ("copy" filter);
 *   1:  "palette" filter;
 *   2:  "gradient" filter.
 *
 *-- If bit 6 of the compression control byte is set to 0 (no "filter id"
 * byte), or if the filter id is 0, then raw pixel values in the client
 * format (see NOTE 1) will be compressed. See below details on the
 * compression.
 *
 *-- The "gradient" filter pre-processes pixel data with a simple algorithm
 * which converts each color component to a difference between a "predicted"
 * intensity and the actual intensity. Such a technique does not affect
 * uncompressed data size, but helps to compress photo-like images better. 
 * Pseudo-code for converting intensities to differences is the following:
 *
 *   P[i,j] := V[i-1,j] + V[i,j-1] - V[i-1,j-1];
 *   if (P[i,j] < 0) then P[i,j] := 0;
 *   if (P[i,j] > MAX) then P[i,j] := MAX;
 *   D[i,j] := V[i,j] - P[i,j];
 *
 * Here V[i,j] is the intensity of a color component for a pixel at
 * coordinates (i,j). MAX is the maximum value of intensity for a color
 * component.
 *
 *-- The "palette" filter converts true-color pixel data to indexed colors
 * and a palette which can consist of 2..256 colors. If the number of colors
 * is 2, then each pixel is encoded in 1 bit, otherwise 8 bits is used to
 * encode one pixel. 1-bit encoding is performed such way that the most
 * significant bits correspond to the leftmost pixels, and each raw of pixels
 * is aligned to the byte boundary. When "palette" filter is used, the
 * palette is sent before the pixel data. The palette begins with an unsigned
 * byte which value is the number of colors in the palette minus 1 (i.e. 1
 * means 2 colors, 255 means 256 colors in the palette). Then follows the
 * palette itself which consist of pixel values in client pixel format (see
 * NOTE 1).
 *
 *-- The pixel data is compressed using the zlib library. But if the data
 * size after applying the filter but before the compression is less then 12,
 * then the data is sent as is, uncompressed. Four separate zlib streams
 * (0..3) can be used and the decoder should read the actual stream id from
 * the compression control byte (see NOTE 2).
 *
 * If the compression is not used, then the pixel data is sent as is,
 * otherwise the data stream looks like this:
 *
 *   1..3 bytes:  data size (N) in compact representation;
 *   N bytes:     zlib-compressed data.
 *
 * Data size is compactly represented in one, two or three bytes, just like
 * in the "jpeg" compression method (see above).
 *
 *-- NOTE 1. If the color depth is 24, and all three color components are
 * 8-bit wide, then one pixel in Tight encoding is always represented by
 * three bytes, where the first byte is red component, the second byte is
 * green component, and the third byte is blue component of the pixel color
 * value. This applies to colors in palettes as well.
 *
 *-- NOTE 2. The decoder must reset compression streams' states before
 * decoding the rectangle, if some of bits 0,1,2,3 in the compression control
 * byte are set to 1. Note that the decoder must reset zlib streams even if
 * the compression type is "fill", "jpeg" or "png".
 *
 *-- NOTE 3. The "gradient" filter and "jpeg" compression may be used only
 * when bits-per-pixel value is either 16 or 32, not 8.
 *
 *-- NOTE 4. The width of any Tight-encoded rectangle cannot exceed 2048
 * pixels. If a rectangle is wider, it must be split into several rectangles
 * and each one should be encoded separately.
 *
  }
  rfbTightExplicitFilter = $04;  
  rfbTightFill = $08;  
  rfbTightJpeg = $09;  
  rfbTightNoZlib = $0A;  
  rfbTightPng = $0A;  
  rfbTightMaxSubencoding = $0A;  
{ Filters to improve compression efficiency  }
  rfbTightFilterCopy = $00;  
  rfbTightFilterPalette = $01;  
  rfbTightFilterGradient = $02;  
{$endif}
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 * XCursor encoding. This is a special encoding used to transmit X-style
 * cursor shapes from server to clients. Note that for this encoding,
 * coordinates in rfbFramebufferUpdateRectHeader structure hold hotspot
 * position (r.x, r.y) and cursor size (r.w, r.h). If (w * h != 0), two RGB
 * samples are sent after header in the rfbXCursorColors structure. They
 * denote foreground and background colors of the cursor. If a client
 * supports only black-and-white cursors, it should ignore these colors and
 * assume that foreground is black and background is white. Next, two bitmaps
 * (1 bits per pixel) follow: first one with actual data (value 0 denotes
 * background color, value 1 denotes foreground color), second one with
 * transparency data (bits with zero value mean that these pixels are
 * transparent). Both bitmaps represent cursor data in a byte stream, from
 * left to right, from top to bottom, and each row is byte-aligned. Most
 * significant bits correspond to leftmost pixels. The number of bytes in
 * each row can be calculated as ((w + 7) / 8). If (w * h == 0), cursor
 * should be hidden (or default local cursor should be set by the client).
  }
type
  PrfbXCursorColors = ^TrfbXCursorColors;
  TrfbXCursorColors = record
      foreRed : Tuint8_t;
      foreGreen : Tuint8_t;
      foreBlue : Tuint8_t;
      backRed : Tuint8_t;
      backGreen : Tuint8_t;
      backBlue : Tuint8_t;
    end;

const
  sz_rfbXCursorColors = 6;  
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 * RichCursor encoding. This is a special encoding used to transmit cursor
 * shapes from server to clients. It is similar to the XCursor encoding but
 * uses client pixel format instead of two RGB colors to represent cursor
 * image. For this encoding, coordinates in rfbFramebufferUpdateRectHeader
 * structure hold hotspot position (r.x, r.y) and cursor size (r.w, r.h).
 * After header, two pixmaps follow: first one with cursor image in current
 * client pixel format (like in raw encoding), second with transparency data
 * (1 bit per pixel, exactly the same format as used for transparency bitmap
 * in the XCursor encoding). If (w * h == 0), cursor should be hidden (or
 * default local cursor should be set by the client).
  }
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 * ZRLE - encoding combining Zlib compression, tiling, palettisation and
 * run-length encoding.
  }
type
  PrfbZRLEHeader = ^TrfbZRLEHeader;
  TrfbZRLEHeader = record
      length : Tuint32_t;
    end;

const
  sz_rfbZRLEHeader = 4;  
  rfbZRLETileWidth = 64;  
  rfbZRLETileHeight = 64;  
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 * ZLIBHEX - zlib compressed Hextile Encoding.  Essentially, this is the
 * hextile encoding with zlib compression on the tiles that can not be
 * efficiently encoded with one of the other hextile subencodings.  The
 * new zlib subencoding uses two bytes to specify the length of the
 * compressed tile and then the compressed data follows.  As with the
 * raw sub-encoding, the zlib subencoding invalidates the other
 * values, if they are also set.
  }
  rfbHextileZlibRaw = 1 shl 5;  
  rfbHextileZlibHex = 1 shl 6;  
  rfbHextileZlibMono = 1 shl 7;  
{-----------------------------------------------------------------------------
 * SetColourMapEntries - these messages are only sent if the pixel
 * format uses a "colour map" (i.e. trueColour false) and the client has not
 * fixed the entire colour map using FixColourMapEntries.  In addition they
 * will only start being sent after the client has sent its first
 * FramebufferUpdateRequest.  So if the client always tells the server to use
 * trueColour then it never needs to process this type of message.
  }
{ always rfbSetColourMapEntries  }
{ Followed by nColours * 3 * uint16_t
       r1, g1, b1, r2, g2, b2, r3, g3, b3, ..., rn, bn, gn  }
type
  PrfbSetColourMapEntriesMsg = ^TrfbSetColourMapEntriesMsg;
  TrfbSetColourMapEntriesMsg = record
      _type : Tuint8_t;
      pad : Tuint8_t;
      firstColour : Tuint16_t;
      nColours : Tuint16_t;
    end;

const
  sz_rfbSetColourMapEntriesMsg = 6;  
{-----------------------------------------------------------------------------
 * Bell - ring a bell on the client if it has one.
  }
{ always rfbBell  }
type
  PrfbBellMsg = ^TrfbBellMsg;
  TrfbBellMsg = record
      _type : Tuint8_t;
    end;

const
  sz_rfbBellMsg = 1;  
{-----------------------------------------------------------------------------
 * ServerCutText - the server has new text in its cut buffer.
  }
{ always rfbServerCutText  }
{ followed by char text[length]  }
type
  PrfbServerCutTextMsg = ^TrfbServerCutTextMsg;
  TrfbServerCutTextMsg = record
      _type : Tuint8_t;
      pad1 : Tuint8_t;
      pad2 : Tuint16_t;
      length : Tuint32_t;
    end;

const
  sz_rfbServerCutTextMsg = 8;  
{-----------------------------------------------------------------------------
 * //  Modif sf@2002
 * FileTransferMsg - The client sends FileTransfer message.
 * Bidirectional message - Files can be sent from client to server & vice versa
  }
{ always rfbFileTransfer  }
{  See defines below  }
{  Other possible content classification (Dir or File name, etc..)  }
{ It appears that UltraVNC *forgot* to Swap16IfLE(contentParam)  }
{  FileSize or packet index or error or other   }
{  uint32_t sizeH;		 Additional 32Bits params to handle big values. Only for V2 (we want backward compatibility between all V1 versions)  }
{ followed by data char text[length]  }
type
  PrfbFileTransferMsg = ^TrfbFileTransferMsg;
  TrfbFileTransferMsg = record
      _type : Tuint8_t;
      contentType : Tuint8_t;
      contentParam : Tuint8_t;
      pad : Tuint8_t;
      size : Tuint32_t;
      length : Tuint32_t;
    end;

const
  sz_rfbFileTransferMsg = 12;  
{  v1 is the old FT version ( <= 1.0.0 RC18 versions)  }
  rfbFileTransferVersion = 2;  
{  FileTransfer Content types and Params defines  }
{  Client asks for the content of a given Server directory  }
  rfbDirContentRequest = 1;  
{  Full directory name or full file name.  }
  rfbDirPacket = 2;  
{  Null content means end of Directory  }
{  Client asks the server for the transfer of a given file  }
  rfbFileTransferRequest = 3;  
{  First packet of a file transfer, containing file's features  }
  rfbFileHeader = 4;  
{  One chunk of the file  }
  rfbFilePacket = 5;  
{  End of file transfer (the file has been received or error)  }
  rfbEndOfFile = 6;  
{  The file transfer must be aborted, whatever the state  }
  rfbAbortFileTransfer = 7;  
{  The client offers to send a file to the server  }
  rfbFileTransferOffer = 8;  
{  The server accepts or rejects the file  }
  rfbFileAcceptHeader = 9;  
{  The Client sends a simple command (File Delete, Dir create etc...)  }
  rfbCommand = 10;  
{  The Client receives the server's answer about a simple command  }
  rfbCommandReturn = 11;  
{  The zipped checksums of the destination file (Delta Transfer)  }
  rfbFileChecksums = 12;  
{  Request FileTransfer authorization  }
  rfbFileTransferAccess = 14;  
{  rfbDirContentRequest client Request - content params   }
{  Request a Server Directory contents  }
  rfbRDirContent = 1;  
{  Request the server's drives list  }
  rfbRDrivesList = 2;  
{  Request a server directory content recursive sorted list  }
  rfbRDirRecursiveList = 3;  
{  Request a server directory content recursive size  }
  rfbRDirRecursiveSize = 4;  
{  rfbDirPacket & rfbCommandReturn  server Answer - content params  }
{  Reception of a directory name  }
  rfbADirectory = 1;  
{  Reception of a file name   }
  rfbAFile = 2;  
{  Reception of a list of drives  }
  rfbADrivesList = 3;  
{  Response to a create dir command   }
  rfbADirCreate = 4;  
{  Response to a delete dir command   }
  rfbADirDelete = 5;  
{  Response to a create file command   }
  rfbAFileCreate = 6;  
{  Response to a delete file command   }
  rfbAFileDelete = 7;  
{  Response to a rename file command   }
  rfbAFileRename = 8;  
{  Response to a rename dir command   }
  rfbADirRename = 9;  
  rfbADirRecursiveListItem = 10;  
  rfbADirRecursiveSize = 11;  
{  rfbCommand Command - content params  }
{  Request the server to create the given directory  }
  rfbCDirCreate = 1;  
{  Request the server to delete the given directory  }
  rfbCDirDelete = 2;  
{  Request the server to create the given file  }
  rfbCFileCreate = 3;  
{  Request the server to delete the given file  }
  rfbCFileDelete = 4;  
{  Request the server to rename the given file   }
  rfbCFileRename = 5;  
{  Request the server to rename the given directory  }
  rfbCDirRename = 6;  
{  Errors - content params or "size" field  }
{  Unknown FileTransfer command.  }
  rfbRErrorUnknownCmd = 1;  
{  Error when a command fails on remote side (ret in "size" field)  }
  rfbRErrorCmd = $FFFFFFFF;  
{  Size of a File Transfer packet (before compression)  }
  sz_rfbBlockSize = 8192;  
{  Transferred directory are zipped in a file with this prefix. Must end with "-"  }
  rfbZipDirectoryPrefix = '!UVNCDIR-\0';  
  sz_rfbZipDirectoryPrefix = 9;  
  rfbDirPrefix = '[ ';  
  rfbDirSuffix = ' ]';  
{-----------------------------------------------------------------------------
 * Modif sf@2002
 * TextChatMsg - Utilized to order the TextChat mode on server or client
 * Bidirectional message
  }
{ always rfbTextChat  }
{  Could be used later as an additionnal param  }
{  Could be used later as text offset, for instance  }
{  Specific values for Open, close, finished (-1, -2, -3)  }
{ followed by char text[length]  }
type
  PrfbTextChatMsg = ^TrfbTextChatMsg;
  TrfbTextChatMsg = record
      _type : Tuint8_t;
      pad1 : Tuint8_t;
      pad2 : Tuint16_t;
      length : Tuint32_t;
    end;

const
  sz_rfbTextChatMsg = 8;  
  rfbTextMaxSize = 4096;  
  rfbTextChatOpen = $FFFFFFFF;  
  rfbTextChatClose = $FFFFFFFE;  
  rfbTextChatFinished = $FFFFFFFD;  
{-----------------------------------------------------------------------------
 * Xvp Message
 * Bidirectional message
 * A server which supports the xvp extension declares this by sending a message
 * with an Xvp_INIT xvp-message-code when it receives a request from the client
 * to use the xvp Pseudo-encoding. The server must specify in this message the
 * highest xvp-extension-version it supports: the client may assume that the
 * server supports all versions from 1 up to this value. The client is then
 * free to use any supported version. Currently, only version 1 is defined.
 *
 * A server which subsequently receives an xvp Client Message requesting an
 * operation which it is unable to perform, informs the client of this by
 * sending a message with an Xvp_FAIL xvp-message-code, and the same
 * xvp-extension-version as included in the client's operation request.
 *
 * A client supporting the xvp extension sends this to request that the server
 * initiate a clean shutdown, clean reboot or abrupt reset of the system whose
 * framebuffer the client is displaying.
  }
{ always rfbXvp  }
{ xvp extension version  }
{ xvp message code  }
type
  PrfbXvpMsg = ^TrfbXvpMsg;
  TrfbXvpMsg = record
      _type : Tuint8_t;
      pad : Tuint8_t;
      version : Tuint8_t;
      code : Tuint8_t;
    end;

const
  sz_rfbXvpMsg = 4;  
{ server message codes  }
  rfbXvp_Fail = 0;  
  rfbXvp_Init = 1;  
{ client message codes  }
  rfbXvp_Shutdown = 2;  
  rfbXvp_Reboot = 3;  
  rfbXvp_Reset = 4;  
{-----------------------------------------------------------------------------
 * ExtendedDesktopSize server -> client message
 *
 * Informs the client of (re)size of framebuffer, provides information about
 * physical screens attached, and lets the client knows it can request
 * resolution changes using SetDesktopSize.
  }
{ Followed by rfbExtDesktopScreen[numberOfScreens]  }
type
  PrfbExtDesktopSizeMsg = ^TrfbExtDesktopSizeMsg;
  TrfbExtDesktopSizeMsg = record
      numberOfScreens : Tuint8_t;
      pad : array[0..2] of Tuint8_t;
    end;

  PrfbExtDesktopScreen = ^TrfbExtDesktopScreen;
  TrfbExtDesktopScreen = record
      id : Tuint32_t;
      x : Tuint16_t;
      y : Tuint16_t;
      width : Tuint16_t;
      height : Tuint16_t;
      flags : Tuint32_t;
    end;

const
  sz_rfbExtDesktopSizeMsg = 4;  
  sz_rfbExtDesktopScreen = 16;  
{ x - reason for the change  }
  rfbExtDesktopSize_GenericChange = 0;  
  rfbExtDesktopSize_ClientRequestedChange = 1;  
  rfbExtDesktopSize_OtherClientRequestedChange = 2;  
{ y - status code for change  }
  rfbExtDesktopSize_Success = 0;  
  rfbExtDesktopSize_ResizeProhibited = 1;  
  rfbExtDesktopSize_OutOfResources = 2;  
  rfbExtDesktopSize_InvalidScreenLayout = 3;  
{-----------------------------------------------------------------------------
 * SetDesktopSize client -> server message
 *
 * Allows the client to request that the framebuffer and physical screen
 * resolutions are changed.
  }
{ always rfbSetDesktopSize  }
{ Followed by rfbExtDesktopScreen[numberOfScreens]  }
type
  PrfbSetDesktopSizeMsg = ^TrfbSetDesktopSizeMsg;
  TrfbSetDesktopSizeMsg = record
      _type : Tuint8_t;
      pad1 : Tuint8_t;
      width : Tuint16_t;
      height : Tuint16_t;
      numberOfScreens : Tuint8_t;
      pad2 : Tuint8_t;
    end;

const
  sz_rfbSetDesktopSizeMsg = 8;  
{-----------------------------------------------------------------------------
 * Modif sf@2002
 * ResizeFrameBuffer - The Client must change the size of its framebuffer  
  }
{ always rfbResizeFrameBuffer  }
{  FrameBuffer width  }
{  FrameBuffer height  }
type
  PrfbResizeFrameBufferMsg = ^TrfbResizeFrameBufferMsg;
  TrfbResizeFrameBufferMsg = record
      _type : Tuint8_t;
      pad1 : Tuint8_t;
      framebufferWidth : Tuint16_t;
      framebufferHeigth : Tuint16_t;
    end;

const
  sz_rfbResizeFrameBufferMsg = 6;  
{-----------------------------------------------------------------------------
 * Copyright (C) 2001 Harakan Software
 * PalmVNC 1.4 & 2.? ResizeFrameBuffer message
 * ReSizeFrameBuffer - tell the RFB client to alter its framebuffer, either
 * due to a resize of the server desktop or a client-requested scaling factor.
 * The pixel format remains unchanged.
  }
{ always rfbReSizeFrameBuffer  }
{ Desktop width  }
{ Desktop height  }
{ FrameBuffer width  }
{ Framebuffer height  }
type
  PrfbPalmVNCReSizeFrameBufferMsg = ^TrfbPalmVNCReSizeFrameBufferMsg;
  TrfbPalmVNCReSizeFrameBufferMsg = record
      _type : Tuint8_t;
      pad1 : Tuint8_t;
      desktop_w : Tuint16_t;
      desktop_h : Tuint16_t;
      buffer_w : Tuint16_t;
      buffer_h : Tuint16_t;
      pad2 : Tuint16_t;
    end;

const
  sz_rfbPalmVNCReSizeFrameBufferMsg = 12;  
{-----------------------------------------------------------------------------
 * Union of all server->client messages.
  }
type
  PrfbServerToClientMsg = ^TrfbServerToClientMsg;
  TrfbServerToClientMsg = record
      case longint of
        0 : ( _type : Tuint8_t );
        1 : ( fu : TrfbFramebufferUpdateMsg );
        2 : ( scme : TrfbSetColourMapEntriesMsg );
        3 : ( b : TrfbBellMsg );
        4 : ( sct : TrfbServerCutTextMsg );
        5 : ( rsfb : TrfbResizeFrameBufferMsg );
        6 : ( prsfb : TrfbPalmVNCReSizeFrameBufferMsg );
        7 : ( ft : TrfbFileTransferMsg );
        8 : ( tc : TrfbTextChatMsg );
        9 : ( xvp : TrfbXvpMsg );
        10 : ( eds : TrfbExtDesktopSizeMsg );
      end;
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 * RDV Cache Encoding.  
 * special is not used at this point, can be used to reset cache or other specials
 * just put it to make sure we don't have to change the encoding again.  
  }

  PrfbCacheRect = ^TrfbCacheRect;
  TrfbCacheRect = record
      special : Tuint16_t;
    end;

const
  sz_rfbCacheRect = 2;  
{****************************************************************************
 *
 * Message definitions (client -> server)
 *
 **************************************************************************** }
{-----------------------------------------------------------------------------
 * SetPixelFormat - tell the RFB server the format in which the client wants
 * pixels sent.
  }
{ always rfbSetPixelFormat  }
type
  PrfbSetPixelFormatMsg = ^TrfbSetPixelFormatMsg;
  TrfbSetPixelFormatMsg = record
      _type : Tuint8_t;
      pad1 : Tuint8_t;
      pad2 : Tuint16_t;
      format : TrfbPixelFormat;
    end;

const
  sz_rfbSetPixelFormatMsg = sz_rfbPixelFormat+4;  
{-----------------------------------------------------------------------------
 * FixColourMapEntries - when the pixel format uses a "colour map", fix
 * read-only colour map entries.
 *
 *    ***************** NOT CURRENTLY SUPPORTED *****************
  }
{ always rfbFixColourMapEntries  }
{ Followed by nColours * 3 * uint16_t
       r1, g1, b1, r2, g2, b2, r3, g3, b3, ..., rn, bn, gn  }
type
  PrfbFixColourMapEntriesMsg = ^TrfbFixColourMapEntriesMsg;
  TrfbFixColourMapEntriesMsg = record
      _type : Tuint8_t;
      pad : Tuint8_t;
      firstColour : Tuint16_t;
      nColours : Tuint16_t;
    end;

const
  sz_rfbFixColourMapEntriesMsg = 6;  
{-----------------------------------------------------------------------------
 * SetEncodings - tell the RFB server which encoding types we accept.  Put them
 * in order of preference, if we have any.  We may always receive raw
 * encoding, even if we don't specify it here.
  }
{ always rfbSetEncodings  }
{ followed by nEncodings * uint32_t encoding types  }
type
  PrfbSetEncodingsMsg = ^TrfbSetEncodingsMsg;
  TrfbSetEncodingsMsg = record
      _type : Tuint8_t;
      pad : Tuint8_t;
      nEncodings : Tuint16_t;
    end;

const
  sz_rfbSetEncodingsMsg = 4;  
{-----------------------------------------------------------------------------
 * FramebufferUpdateRequest - request for a framebuffer update.  If incremental
 * is true then the client just wants the changes since the last update.  If
 * false then it wants the whole of the specified rectangle.
  }
{ always rfbFramebufferUpdateRequest  }
type
  PrfbFramebufferUpdateRequestMsg = ^TrfbFramebufferUpdateRequestMsg;
  TrfbFramebufferUpdateRequestMsg = record
      _type : Tuint8_t;
      incremental : Tuint8_t;
      x : Tuint16_t;
      y : Tuint16_t;
      w : Tuint16_t;
      h : Tuint16_t;
    end;

const
  sz_rfbFramebufferUpdateRequestMsg = 10;  
{-----------------------------------------------------------------------------
 * KeyEvent - key press or release
 *
 * Keys are specified using the "keysym" values defined by the X Window System.
 * For most ordinary keys, the keysym is the same as the corresponding ASCII
 * value.  Other common keys are:
 *
 * BackSpace		0xff08
 * Tab			0xff09
 * Return or Enter	0xff0d
 * Escape		0xff1b
 * Insert		0xff63
 * Delete		0xffff
 * Home			0xff50
 * End			0xff57
 * Page Up		0xff55
 * Page Down		0xff56
 * Left			0xff51
 * Up			0xff52
 * Right		0xff53
 * Down			0xff54
 * F1			0xffbe
 * F2			0xffbf
 * ...			...
 * F12			0xffc9
 * Shift		0xffe1
 * Control		0xffe3
 * Meta			0xffe7
 * Alt			0xffe9
  }
{ always rfbKeyEvent  }
{ true if down (press), false if up  }
{ key is specified as an X keysym  }
type
  PrfbKeyEventMsg = ^TrfbKeyEventMsg;
  TrfbKeyEventMsg = record
      _type : Tuint8_t;
      down : Tuint8_t;
      pad : Tuint16_t;
      key : Tuint32_t;
    end;

const
  sz_rfbKeyEventMsg = 8;  
{ always rfbQemuEvent  }
{ always 0  }
{ keysym is specified as an X keysym, may be 0  }
{ keycode is specified as XT key code  }
type
  PrfbQemuExtendedKeyEventMsg = ^TrfbQemuExtendedKeyEventMsg;
  TrfbQemuExtendedKeyEventMsg = record
      _type : Tuint8_t;
      subtype : Tuint8_t;
      down : Tuint16_t;
      keysym : Tuint32_t;
      keycode : Tuint32_t;
    end;

const
  sz_rfbQemuExtendedKeyEventMsg = 12;  
{-----------------------------------------------------------------------------
 * PointerEvent - mouse/pen move and/or button press.
  }
{ always rfbPointerEvent  }
{ bits 0-7 are buttons 1-8, 0=up, 1=down  }
type
  PrfbPointerEventMsg = ^TrfbPointerEventMsg;
  TrfbPointerEventMsg = record
      _type : Tuint8_t;
      buttonMask : Tuint8_t;
      x : Tuint16_t;
      y : Tuint16_t;
    end;

const
  rfbButton1Mask = 1;  
  rfbButton2Mask = 2;  
  rfbButton3Mask = 4;  
  rfbButton4Mask = 8;  
  rfbButton5Mask = 16;  
{ RealVNC 335 method  }
  rfbWheelUpMask = rfbButton4Mask;  
  rfbWheelDownMask = rfbButton5Mask;  
  sz_rfbPointerEventMsg = 6;  
{-----------------------------------------------------------------------------
 * ClientCutText - the client has new text in its cut buffer.
  }
{ always rfbClientCutText  }
{ followed by char text[length]  }
type
  PrfbClientCutTextMsg = ^TrfbClientCutTextMsg;
  TrfbClientCutTextMsg = record
      _type : Tuint8_t;
      pad1 : Tuint8_t;
      pad2 : Tuint16_t;
      length : Tuint32_t;
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
{-----------------------------------------------------------------------------
 * sf@2002 - Set Server Scale
 * SetServerScale - Server must change the scale of the client buffer.
  }
{ always rfbSetScale  }
{ Scale value 1<sv<n  }
type
  PrfbSetScaleMsg = ^TrfbSetScaleMsg;
  TrfbSetScaleMsg = record
      _type : Tuint8_t;
      scale : Tuint8_t;
      pad : Tuint16_t;
    end;

const
  sz_rfbSetScaleMsg = 4;  
{-----------------------------------------------------------------------------
 * Copyright (C) 2001 Harakan Software
 * PalmVNC 1.4 & 2.? SetScale Factor message 
 * SetScaleFactor - tell the RFB server to alter the scale factor for the
 * client buffer.
  }
{ always rfbPalmVNCSetScaleFactor  }
{ Scale factor (positive non-zero integer)  }
type
  PrfbPalmVNCSetScaleFactorMsg = ^TrfbPalmVNCSetScaleFactorMsg;
  TrfbPalmVNCSetScaleFactorMsg = record
      _type : Tuint8_t;
      scale : Tuint8_t;
      pad2 : Tuint16_t;
    end;

const
  sz_rfbPalmVNCSetScaleFactorMsg = 4;  
{-----------------------------------------------------------------------------
 * rdv@2002 - Set input status
 * SetServerInput - Server input is dis/enabled
  }
{ always rfbSetScale  }
{ Scale value 1<sv<n  }
type
  PrfbSetServerInputMsg = ^TrfbSetServerInputMsg;
  TrfbSetServerInputMsg = record
      _type : Tuint8_t;
      status : Tuint8_t;
      pad : Tuint16_t;
    end;

const
  sz_rfbSetServerInputMsg = 4;  
{-----------------------------------------------------------------------------
 * rdv@2002 - Set SW
 * SetSW - Server SW/full desktop
  }
{ always rfbSetSW  }
type
  PrfbSetSWMsg = ^TrfbSetSWMsg;
  TrfbSetSWMsg = record
      _type : Tuint8_t;
      status : Tuint8_t;
      x : Tuint16_t;
      y : Tuint16_t;
    end;

const
  sz_rfbSetSWMsg = 6;  
{-----------------------------------------------------------------------------
 * Union of all client->server messages.
  }
type
  PrfbClientToServerMsg = ^TrfbClientToServerMsg;
  TrfbClientToServerMsg = record
      case longint of
        0 : ( _type : Tuint8_t );
        1 : ( spf : TrfbSetPixelFormatMsg );
        2 : ( fcme : TrfbFixColourMapEntriesMsg );
        3 : ( se : TrfbSetEncodingsMsg );
        4 : ( fur : TrfbFramebufferUpdateRequestMsg );
        5 : ( ke : TrfbKeyEventMsg );
        6 : ( pe : TrfbPointerEventMsg );
        7 : ( cct : TrfbClientCutTextMsg );
        8 : ( ssc : TrfbSetScaleMsg );
        9 : ( pssf : TrfbPalmVNCSetScaleFactorMsg );
        10 : ( sim : TrfbSetServerInputMsg );
        11 : ( ft : TrfbFileTransferMsg );
        12 : ( sw : TrfbSetSWMsg );
        13 : ( tc : TrfbTextChatMsg );
        14 : ( xvp : TrfbXvpMsg );
        15 : ( sdm : TrfbSetDesktopSizeMsg );
      end;
{ 
 * vncauth.h - describes the functions provided by the vncauth library.
  }

const
  MAXPWLEN = 8;  
  CHALLENGESIZE = 16;  

function rfbEncryptAndStorePasswd(passwd:Pchar; fname:Pchar):longint;cdecl;external libvncclient;
function rfbDecryptPasswdFromFile(fname:Pchar):Pchar;cdecl;external libvncclient;
procedure rfbRandomBytes(bytes:Pbyte);cdecl;external libvncclient;
procedure rfbEncryptBytes(bytes:Pbyte; passwd:Pchar);cdecl;external libvncclient;
{$endif}

// === Konventiert am: 22-10-26 19:43:20 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function rfbMax(a,b : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if a>b then
    if_local1:=a
  else
    if_local1:=b;
  rfbMax:=if_local1;
end;

{ was #define dname def_expr }
function INADDR_NONE : Tin_addr_t;
  begin
    INADDR_NONE:=Tin_addr_t($ffffffff);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function rfbHextilePackXY(x,y : longint) : longint;
begin
  rfbHextilePackXY:=(x shl 4) or y;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function rfbHextilePackWH(w,h : longint) : longint;
begin
  rfbHextilePackWH:=((Tw(-(1))) shl 4) or (Th(-(1)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function rfbHextileExtractX(byte : longint) : longint;
begin
  rfbHextileExtractX:=byte shr 4;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function rfbHextileExtractY(byte : longint) : Tbyte;
begin
  rfbHextileExtractY:=Tbyte(@($f));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function rfbHextileExtractW(byte : longint) : longint;
begin
  rfbHextileExtractW:=(byte shr 4)+1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function rfbHextileExtractH(byte : longint) : longint;
begin
  rfbHextileExtractH:=(Tbyte(@($f)))+1;
end;


end.
