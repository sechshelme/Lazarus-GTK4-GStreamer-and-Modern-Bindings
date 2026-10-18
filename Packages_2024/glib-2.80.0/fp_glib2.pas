unit fp_glib2;

interface

const
  {$IFDEF Linux}
  libglib2 = 'libglib-2.0';
  libgobject2_0 = 'libgobject-2.0';
  libgio2 = 'libgio-2.0';
  libgmodule = 'libgmodule-2.0';
  {$ENDIF}

  {$IFDEF Windows}
  libglib2 = 'libglib-2.0-0.dll';
  libgobject2_0 = 'libgobject-2.0-0.dll';
  libgio2 = 'libgio-2.0-0.dll';
  libgmodule = 'libgmodule-2.0-0.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  // ==== glib2
type
  {$IFDEF Linux}
  TLongDouble = extended;
  {$ENDIF}
  {$IFDEF Windows}
  TLongDouble = double;
  {$ENDIF}
  PLongDouble = ^TLongDouble;

  Tsize_t = SizeUInt;
  Ttime_t = int64; // types.h
  Ptime_t = ^Ttime_t;

  Tva_list = Pointer;
  Pva_list = ^Tva_list;

  // /usr/include/x86_64-linux-gnu/bits/types.h
  Tpid_t = int32;
  Tuid_t = uint32;

  //  /usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h
  PFILE = type Pointer;

  //  /usr/include/x86_64-linux-gnu/bits/types/struct_tm.h
  Ptm = type Pointer;

  // /usr/include/linux/time.h
type
  Ttimespec = record
    tv_sec: int64;
    tv_nsec: int64;
  end;

  // /usr/include/pwd.h
type
  Ppasswd = type Pointer;

  // ==== Wayland  ( GDK4 & GST )
type
  Pwl_surface = type Pointer;
  Pwl_seat = type Pointer;
  Pwl_output = type Pointer;
  Pwl_display = type Pointer;
  Pwl_compositor = type Pointer;
  Pwl_pointer = type Pointer;
  Pwl_keyboard = type Pointer;
  Pxkb_keymap = type Pointer;
  Pwl_callback_listener = type Pointer;
  Pwl_callback = type Pointer;
  PPwl_callback = ^Pwl_callback;
  Pwl_event_queue = type Pointer;
  Pwl_subcompositor = type Pointer;
  Pwl_shm = type Pointer;
  Pwl_subsurface = type Pointer;
  Pwl_buffer = type Pointer;
  Pxdg_wm_base = type Pointer;
  Pzwp_fullscreen_shell_v1 = type Pointer;
  Pwp_viewporter = type Pointer;
  Pzwp_linux_dmabuf_v1 = type Pointer;
  Pwp_single_pixel_buffer_manager_v1 = type Pointer;
  Pwl_registry = type Pointer;
  Pwl_shell = type Pointer;
  Twl_shm_format = longint;
  Pwl_shm_format = ^Twl_shm_format;

  Pwp_color_manager_v1 = type Pointer;
  Pwp_color_representation_manager_v1 = type Pointer;
  Twl_output_subpixel = longint;
  Twl_output_transform = longint;


  {$DEFINE read_interface}
  {$include glibconfig.inc}
  {$include fp_glib2_includes.inc}
  {$include fp_gobject2_includes.inc}
  {$include fp_gio2_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include glibconfig.inc}
{$include fp_glib2_includes.inc}
{$include fp_gobject2_includes.inc}
{$include fp_gio2_includes.inc}
{$UNDEF read_implementation}

// wegen "division_by_zero" in den clibs
{$IF defined(CPUX86) or defined(CPUX64)}
{$asmmode intel}
procedure SetMXCSR;
var
  w2: word = 8064;
begin
  asm
           Ldmxcsr w2
  end;
end;
{$ENDIF}

begin
  {$IF defined(CPUX86) or defined(CPUX64)}
  SetMXCSR;
  {$ENDIF}
end.
