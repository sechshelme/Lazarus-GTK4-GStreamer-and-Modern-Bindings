unit fp_vnc;

interface

const
  {$IFDEF Linux}
  libvncserver = 'vncserver';
  libvncclient = 'vncclient';
  {$ENDIF}

  {$IFDEF Windows}
  {$FATAL This binding only supports 64-bit Linux. Due to terrible C structure layouts (nested mutexes and zlib arrays), the Windows memory offsets differ. Use a C wrapper for Windows support!}
  {$ENDIF}

type
  Tuint8_t = uint8;
  Puint8_t = ^Tuint8_t;
  PPuint8_t = ^Puint8_t;
  Tuint16_t = uint16;
  Puint16_t = ^Tuint16_t;
  PPuint16_t = ^Puint16_t;
  Tuint32_t = uint32;
  Puint32_t = ^Tuint32_t;
  PPuint32_t = ^Puint32_t;
  Tuint64_t = uint64;
  Puint64_t = ^Tuint64_t;
  PPuint64_t = ^Puint64_t;

  Tint8_t = int8;
  Pint8_t = ^Tint8_t;
  PPint8_t = ^Pint8_t;
  Tint16_t = int16;
  Pint16_t = ^Tint16_t;
  PPint16_t = ^Pint16_t;
  Tint32_t = int32;
  Pint32_t = ^Tint32_t;
  PPint32_t = ^Pint32_t;
  Tint64_t = int64;
  Pint64_t = ^Tint64_t;
  PPint64_t = ^Pint64_t;

  PFILE = type Pointer;

  Ttime_t = int64;
  Tsuseconds_t = int32;

  Ttimeval = record
    tv_sec: Ttime_t;
    tv_usec: Tsuseconds_t;
  end;


  Tz_stream = array[0..111] of byte;
  TMUTEX = array[0..39] of byte;
  TCOND = array[0..47] of byte;



  Tfd_set = record
    fds_bits: array[0..31] of longint;
  end;

  Tpthread_t = uint64;

type
  Tsockaddr_in = record
    sin_family: int16;
    sin_port: int16;
    sin_addr: int32;
    sin_zero: array [0..7] of byte;
  end;


  Pjpeg_source_mgr = Pointer;
  Psasl_conn_t = Pointer;
  Psasl_secret_t = Pointer;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include rfb/keysym.inc}
  {$include rfb/rfbconfig.inc}
  {$include rfb/rfbproto.inc}
  {$include rfb/rfbclient.inc}
  {$include rfb/rfb.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include rfb/keysym.inc}
{$include rfb/rfbconfig.inc}
{$include rfb/rfbproto.inc}
{$include rfb/rfbclient.inc}
{$include rfb/rfb.inc}
{$UNDEF read_implementation}

end.
