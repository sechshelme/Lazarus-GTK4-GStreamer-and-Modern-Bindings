unit vncconnection;

interface

uses
  fp_glib2, fp_gvnc;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GTK VNC Widget
 *
 * Copyright (C) 2006  Anthony Liguori <anthony@codemonkey.ws>
 * Copyright (C) 2009-2010 Daniel P. Berrange <dan@berrange.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.0 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
  }
{$ifndef VNC_CONNECTION_H}
{$define VNC_CONNECTION_H}
{$include <glib.h>}
{$include <gio/gio.h>}
{$include <vncframebuffer.h>}
{$include <vnccursor.h>}
{$include <vncutil.h>}
{$include <vncaudio.h>}

{ identical to the ledstate bits  }
const
  VNC_LEDSTATE_SCROLL_LOCK = 1 shl 0;  
  VNC_LEDSTATE_NUM_LOCK = 1 shl 1;  
  VNC_LEDSTATE_CAPS_LOCK = 1 shl 2;  
type
{ Do not add fields to this struct  }
  PVncConnection = ^TVncConnection;
  TVncConnection = record
      parent : TGObject;
      priv : PVncConnectionPrivate;
    end;

{ Signals  }
{
     * If adding fields to this struct, remove corresponding
     * amount of padding to avoid changing overall struct size
      }
  PVncConnectionClass = ^TVncConnectionClass;
  TVncConnectionClass = record
      parent_class : TGObjectClass;
      vnc_cursor_changed : procedure (conn:PVncConnection; cursor:PVncCursor);cdecl;
      vnc_pointer_mode_changed : procedure (conn:PVncConnection; absPointer:Tgboolean);cdecl;
      vnc_bell : procedure (conn:PVncConnection);cdecl;
      vnc_server_cut_text : procedure (conn:PVncConnection; text:PGString);cdecl;
      vnc_framebuffer_update : procedure (conn:PVncConnection; x:Tguint16; y:Tguint16; width:Tguint16; height:Tguint16);cdecl;
      vnc_desktop_resize : procedure (conn:PVncConnection; width:Tguint16; height:Tguint16);cdecl;
      vnc_pixel_format_changed : procedure (conn:PVncConnection; format:PVncPixelFormat);cdecl;
      vnc_auth_failure : procedure (conn:PVncConnection; reason:Pchar);cdecl;
      vnc_auth_unsupported : procedure (conn:PVncConnection; authType:dword);cdecl;
      vnc_auth_credential : procedure (conn:PVncConnection; creds:PGValueArray);cdecl;
      vnc_auth_choose_type : procedure (conn:PVncConnection; types:PGValueArray);cdecl;
      vnc_auth_choose_subtype : procedure (conn:PVncConnection; _type:dword; subtypes:PGValueArray);cdecl;
      vnc_connected : procedure (conn:PVncConnection);cdecl;
      vnc_initialized : procedure (conn:PVncConnection);cdecl;
      vnc_disconnected : procedure (conn:PVncConnection);cdecl;
      vnc_led_state : procedure (conn:PVncConnection);cdecl;
      vnc_error : procedure (conn:PVncConnection; message:Pchar);cdecl;
      vnc_power_control_initialized : procedure (conn:PVncConnection);cdecl;
      vnc_power_control_failed : procedure (conn:PVncConnection);cdecl;
      vnc_desktop_rename : procedure (conn:PVncConnection; name:Pchar);cdecl;
      _vnc_reserved : array[0..(VNC_PADDING_LARGE-5)-1] of Tgpointer;
    end;

{ Tight JPEG quality levels  }
{ Pseudo encodings  }

  PVncConnectionEncoding = ^TVncConnectionEncoding;
  TVncConnectionEncoding =  Longint;
  Const
    VNC_CONNECTION_ENCODING_RAW = 0;
    VNC_CONNECTION_ENCODING_COPY_RECT = 1;
    VNC_CONNECTION_ENCODING_RRE = 2;
    VNC_CONNECTION_ENCODING_CORRE = 4;
    VNC_CONNECTION_ENCODING_HEXTILE = 5;
    VNC_CONNECTION_ENCODING_TIGHT = 7;
    VNC_CONNECTION_ENCODING_ZRLE = 16;
    VNC_CONNECTION_ENCODING_TIGHT_JPEG0 = -(32);
    VNC_CONNECTION_ENCODING_TIGHT_JPEG1 = -(31);
    VNC_CONNECTION_ENCODING_TIGHT_JPEG2 = -(30);
    VNC_CONNECTION_ENCODING_TIGHT_JPEG3 = -(29);
    VNC_CONNECTION_ENCODING_TIGHT_JPEG4 = -(28);
    VNC_CONNECTION_ENCODING_TIGHT_JPEG5 = -(27);
    VNC_CONNECTION_ENCODING_TIGHT_JPEG6 = -(26);
    VNC_CONNECTION_ENCODING_TIGHT_JPEG7 = -(25);
    VNC_CONNECTION_ENCODING_TIGHT_JPEG8 = -(24);
    VNC_CONNECTION_ENCODING_TIGHT_JPEG9 = -(23);
    VNC_CONNECTION_ENCODING_DESKTOP_RESIZE = -(223);
    VNC_CONNECTION_ENCODING_LAST_RECT = -(224);
    VNC_CONNECTION_ENCODING_WMVi = $574D5669;
    VNC_CONNECTION_ENCODING_CURSOR_POS = -(232);
    VNC_CONNECTION_ENCODING_RICH_CURSOR = -(239);
    VNC_CONNECTION_ENCODING_XCURSOR = -(240);
    VNC_CONNECTION_ENCODING_POINTER_CHANGE = -(257);
    VNC_CONNECTION_ENCODING_EXT_KEY_EVENT = -(258);
    VNC_CONNECTION_ENCODING_AUDIO = -(259);
    VNC_CONNECTION_ENCODING_LED_STATE = -(261);
    VNC_CONNECTION_ENCODING_DESKTOP_NAME = -(307);
    VNC_CONNECTION_ENCODING_EXTENDED_DESKTOP_RESIZE = -(308);
    VNC_CONNECTION_ENCODING_XVP = -(309);
    VNC_CONNECTION_ENCODING_ALPHA_CURSOR = -(314);
;
{*
 * VncConnectionAuth:
 * @VNC_CONNECTION_AUTH_INVALID:
 * @VNC_CONNECTION_AUTH_NONE: No authentication is needed and protocol data is to be sent unencrypted.
 * @VNC_CONNECTION_AUTH_VNC: VNC authentication is to be used and protocol data is to be sent unencrypted.
 * @VNC_CONNECTION_AUTH_RA2: RealVNC authentication.
 * @VNC_CONNECTION_AUTH_RA2NE: RealVNC authentication.
 * @VNC_CONNECTION_AUTH_TIGHT: The Tight security type is a generic protocol extension.
 * @VNC_CONNECTION_AUTH_ULTRA: Ultra authentication.
 * @VNC_CONNECTION_AUTH_TLS: TLS authentication.
 * @VNC_CONNECTION_AUTH_VENCRYPT: The VeNCrypt security type is a generic authentication method which encapsulates multiple authentication subtypes.
 * @VNC_CONNECTION_AUTH_SASL: SASL authentication.
 * @VNC_CONNECTION_AUTH_ARD: Apple remote desktop (screen sharing) authentication.
 * @VNC_CONNECTION_AUTH_MSLOGONII: Authentication used by UltraVNC.
 * @VNC_CONNECTION_AUTH_MSLOGON: Authentication used by UltraVNC.
  }
{ Used by VINO  }
{ Used by VeNCrypt and QEMU  }
{ SASL type used by VINO and QEMU  }
{ Apple remote desktop (screen sharing)  }
{ Used by UltraVNC  }
{ (aka 250 when converted to U8), Used by UltraVNC  }
type
  PVncConnectionAuth = ^TVncConnectionAuth;
  TVncConnectionAuth =  Longint;
  Const
    VNC_CONNECTION_AUTH_INVALID = 0;
    VNC_CONNECTION_AUTH_NONE = 1;
    VNC_CONNECTION_AUTH_VNC = 2;
    VNC_CONNECTION_AUTH_RA2 = 5;
    VNC_CONNECTION_AUTH_RA2NE = 6;
    VNC_CONNECTION_AUTH_TIGHT = 16;
    VNC_CONNECTION_AUTH_ULTRA = 17;
    VNC_CONNECTION_AUTH_TLS = 18;
    VNC_CONNECTION_AUTH_VENCRYPT = 19;
    VNC_CONNECTION_AUTH_SASL = 20;
    VNC_CONNECTION_AUTH_ARD = 30;
    VNC_CONNECTION_AUTH_MSLOGONII = $71;
    VNC_CONNECTION_AUTH_MSLOGON = $fffffffa;
;
type
  PVncConnectionAuthVencrypt = ^TVncConnectionAuthVencrypt;
  TVncConnectionAuthVencrypt =  Longint;
  Const
    VNC_CONNECTION_AUTH_VENCRYPT_PLAIN = 256;
    VNC_CONNECTION_AUTH_VENCRYPT_TLSNONE = 257;
    VNC_CONNECTION_AUTH_VENCRYPT_TLSVNC = 258;
    VNC_CONNECTION_AUTH_VENCRYPT_TLSPLAIN = 259;
    VNC_CONNECTION_AUTH_VENCRYPT_X509NONE = 260;
    VNC_CONNECTION_AUTH_VENCRYPT_X509VNC = 261;
    VNC_CONNECTION_AUTH_VENCRYPT_X509PLAIN = 262;
    VNC_CONNECTION_AUTH_VENCRYPT_X509SASL = 263;
    VNC_CONNECTION_AUTH_VENCRYPT_TLSSASL = 264;
;
type
  PVncConnectionCredential = ^TVncConnectionCredential;
  TVncConnectionCredential =  Longint;
  Const
    VNC_CONNECTION_CREDENTIAL_PASSWORD = 0;
    VNC_CONNECTION_CREDENTIAL_USERNAME = 1;
    VNC_CONNECTION_CREDENTIAL_CLIENTNAME = 2;
;
type
  PVncConnectionPowerAction = ^TVncConnectionPowerAction;
  TVncConnectionPowerAction =  Longint;
  Const
    VNC_CONNECTION_POWER_ACTION_SHUTDOWN = 2;
    VNC_CONNECTION_POWER_ACTION_REBOOT = 3;
    VNC_CONNECTION_POWER_ACTION_RESET = 4;
;
type
  PVncConnectionResizeStatus = ^TVncConnectionResizeStatus;
  TVncConnectionResizeStatus =  Longint;
  Const
    VNC_CONNECTION_RESIZE_STATUS_UNSUPPORTED = -(1);
    VNC_CONNECTION_RESIZE_STATUS_OK = 0;
    VNC_CONNECTION_RESIZE_STATUS_ADMIN_PROHIBITED = 1;
    VNC_CONNECTION_RESIZE_STATUS_OUT_OF_RESOURCES = 2;
    VNC_CONNECTION_RESIZE_STATUS_INVALID_LAOUT = 3;
    VNC_CONNECTION_RESIZE_STATUS_FORWARDED = 4;
;

function vnc_connection_get_type:TGType;cdecl;external libgvnc;
function vnc_connection_new:PVncConnection;cdecl;external libgvnc;
function vnc_connection_open_fd(conn:PVncConnection; fd:longint):Tgboolean;cdecl;external libgvnc;
function vnc_connection_open_fd_with_hostname(conn:PVncConnection; fd:longint; hostname:Pchar):Tgboolean;cdecl;external libgvnc;
function vnc_connection_open_host(conn:PVncConnection; host:Pchar; port:Pchar):Tgboolean;cdecl;external libgvnc;
function vnc_connection_open_addr(conn:PVncConnection; addr:PGSocketAddress; hostname:Pchar):Tgboolean;cdecl;external libgvnc;
function vnc_connection_is_open(conn:PVncConnection):Tgboolean;cdecl;external libgvnc;
procedure vnc_connection_shutdown(conn:PVncConnection);cdecl;external libgvnc;
function vnc_connection_set_auth_type(conn:PVncConnection; _type:dword):Tgboolean;cdecl;external libgvnc;
function vnc_connection_set_auth_subtype(conn:PVncConnection; _type:dword):Tgboolean;cdecl;external libgvnc;
function vnc_connection_set_credential(conn:PVncConnection; _type:longint; data:Pgchar):Tgboolean;cdecl;external libgvnc;
function vnc_connection_is_initialized(conn:PVncConnection):Tgboolean;cdecl;external libgvnc;
function vnc_connection_client_cut_text(conn:PVncConnection; data:pointer; length:Tsize_t):Tgboolean;cdecl;external libgvnc;
function vnc_connection_pointer_event(conn:PVncConnection; button_mask:Tguint8; x:Tguint16; y:Tguint16):Tgboolean;cdecl;external libgvnc;
function vnc_connection_key_event(conn:PVncConnection; down_flag:Tgboolean; key:Tguint32; scancode:Tguint16):Tgboolean;cdecl;external libgvnc;
function vnc_connection_framebuffer_update_request(conn:PVncConnection; incremental:Tgboolean; x:Tguint16; y:Tguint16; width:Tguint16; 
           height:Tguint16):Tgboolean;cdecl;external libgvnc;
function vnc_connection_set_encodings(conn:PVncConnection; n_encoding:longint; encoding:Pgint32):Tgboolean;cdecl;external libgvnc;
function vnc_connection_set_pixel_format(conn:PVncConnection; fmt:PVncPixelFormat):Tgboolean;cdecl;external libgvnc;
function vnc_connection_get_pixel_format(conn:PVncConnection):PVncPixelFormat;cdecl;external libgvnc;
function vnc_connection_set_shared(conn:PVncConnection; shared:Tgboolean):Tgboolean;cdecl;external libgvnc;
function vnc_connection_get_shared(conn:PVncConnection):Tgboolean;cdecl;external libgvnc;
function vnc_connection_has_error(conn:PVncConnection):Tgboolean;cdecl;external libgvnc;
function vnc_connection_set_framebuffer(conn:PVncConnection; fb:PVncFramebuffer):Tgboolean;cdecl;external libgvnc;
function vnc_connection_get_name(conn:PVncConnection):Pchar;cdecl;external libgvnc;
function vnc_connection_get_width(conn:PVncConnection):longint;cdecl;external libgvnc;
function vnc_connection_get_height(conn:PVncConnection):longint;cdecl;external libgvnc;
function vnc_connection_get_cursor(conn:PVncConnection):PVncCursor;cdecl;external libgvnc;
function vnc_connection_get_abs_pointer(conn:PVncConnection):Tgboolean;cdecl;external libgvnc;
function vnc_connection_get_ext_key_event(conn:PVncConnection):Tgboolean;cdecl;external libgvnc;
function vnc_connection_get_power_control(conn:PVncConnection):Tgboolean;cdecl;external libgvnc;
function vnc_connection_get_ledstate(conn:PVncConnection):longint;cdecl;external libgvnc;
function vnc_connection_set_audio(conn:PVncConnection; audio:PVncAudio):Tgboolean;cdecl;external libgvnc;
function vnc_connection_set_audio_format(conn:PVncConnection; fmt:PVncAudioFormat):Tgboolean;cdecl;external libgvnc;
function vnc_connection_get_audio_format(conn:PVncConnection):PVncAudioFormat;cdecl;external libgvnc;
function vnc_connection_audio_enable(conn:PVncConnection):Tgboolean;cdecl;external libgvnc;
function vnc_connection_audio_disable(conn:PVncConnection):Tgboolean;cdecl;external libgvnc;
function vnc_connection_power_control(conn:PVncConnection; action:TVncConnectionPowerAction):Tgboolean;cdecl;external libgvnc;
function vnc_connection_set_size(conn:PVncConnection; width:Tguint; height:Tguint):TVncConnectionResizeStatus;cdecl;external libgvnc;
{$endif}
{ VNC_CONNECTION_H  }

// === Konventiert am: 20-10-26 19:50:52 ===

function VNC_TYPE_CONNECTION : TGType;
function VNC_CONNECTION(obj : Pointer) : PVncConnection;
function VNC_CONNECTION_CLASS(klass : Pointer) : PVncConnectionClass;
function VNC_IS_CONNECTION(obj : Pointer) : Tgboolean;
function VNC_IS_CONNECTION_CLASS(klass : Pointer) : Tgboolean;
function VNC_CONNECTION_GET_CLASS(obj : Pointer) : PVncConnectionClass;

implementation

function VNC_TYPE_CONNECTION : TGType;
  begin
    VNC_TYPE_CONNECTION:=vnc_connection_get_type;
  end;

function VNC_CONNECTION(obj : Pointer) : PVncConnection;
begin
  Result := PVncConnection(g_type_check_instance_cast(obj, VNC_TYPE_CONNECTION));
end;

function VNC_CONNECTION_CLASS(klass : Pointer) : PVncConnectionClass;
begin
  Result := PVncConnectionClass(g_type_check_class_cast(klass, VNC_TYPE_CONNECTION));
end;

function VNC_IS_CONNECTION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  VNC_TYPE_CONNECTION);
end;

function VNC_IS_CONNECTION_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  VNC_TYPE_CONNECTION);
end;

function VNC_CONNECTION_GET_CLASS(obj : Pointer) : PVncConnectionClass;
begin
  Result := PVncConnectionClass(PGTypeInstance(obj)^.g_class);
end;



end.
