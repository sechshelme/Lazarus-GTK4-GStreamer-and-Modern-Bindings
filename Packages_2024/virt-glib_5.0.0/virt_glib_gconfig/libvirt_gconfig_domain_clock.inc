{$IFDEF read_interface}


type
  PGVirConfigDomainClockPrivate = type Pointer;

  PGVirConfigDomainClock = ^TGVirConfigDomainClock;
  TGVirConfigDomainClock = record
    parent: TGVirConfigObject;
    priv: PGVirConfigDomainClockPrivate;
  end;

  PGVirConfigDomainClockClass = ^TGVirConfigDomainClockClass;
  TGVirConfigDomainClockClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

type
  PGVirConfigDomainClockOffset = ^TGVirConfigDomainClockOffset;
  TGVirConfigDomainClockOffset = longint;
const
  GVIR_CONFIG_DOMAIN_CLOCK_UTC = 0;
  GVIR_CONFIG_DOMAIN_CLOCK_LOCALTIME = 1;
  GVIR_CONFIG_DOMAIN_CLOCK_TIMEZONE = 2;
  GVIR_CONFIG_DOMAIN_CLOCK_VARIABLE = 3;

function gvir_config_domain_clock_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_clock_new: PGVirConfigDomainClock; cdecl; external libvirtgconfig;
function gvir_config_domain_clock_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainClock; cdecl; external libvirtgconfig;
function gvir_config_domain_clock_get_offset(klock: PGVirConfigDomainClock): TGVirConfigDomainClockOffset; cdecl; external libvirtgconfig;
procedure gvir_config_domain_clock_set_offset(klock: PGVirConfigDomainClock; offset: TGVirConfigDomainClockOffset); cdecl; external libvirtgconfig;
function gvir_config_domain_clock_get_timezone(klock: PGVirConfigDomainClock): pchar; cdecl; external libvirtgconfig;
procedure gvir_config_domain_clock_set_timezone(klock: PGVirConfigDomainClock; tz: pchar); cdecl; external libvirtgconfig;
function gvir_config_domain_clock_get_variable_offset(klock: PGVirConfigDomainClock): Tgint; cdecl; external libvirtgconfig;
procedure gvir_config_domain_clock_set_variable_offset(klock: PGVirConfigDomainClock; seconds: Tgint); cdecl; external libvirtgconfig;
procedure gvir_config_domain_clock_add_timer(klock: PGVirConfigDomainClock; timer: PGVirConfigDomainTimer); cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 19:59:52 ===

function GVIR_CONFIG_TYPE_DOMAIN_CLOCK: TGType;
function GVIR_CONFIG_DOMAIN_CLOCK(obj: Pointer): PGVirConfigDomainClock;
function GVIR_CONFIG_DOMAIN_CLOCK_CLASS(klass: Pointer): PGVirConfigDomainClockClass;
function GVIR_CONFIG_IS_DOMAIN_CLOCK(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_CLOCK_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_CLOCK_GET_CLASS(obj: Pointer): PGVirConfigDomainClockClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_DOMAIN_CLOCK: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_CLOCK := gvir_config_domain_clock_get_type;
end;

function GVIR_CONFIG_DOMAIN_CLOCK(obj: Pointer): PGVirConfigDomainClock;
begin
  Result := PGVirConfigDomainClock(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_CLOCK));
end;

function GVIR_CONFIG_DOMAIN_CLOCK_CLASS(klass: Pointer): PGVirConfigDomainClockClass;
begin
  Result := PGVirConfigDomainClockClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_CLOCK));
end;

function GVIR_CONFIG_IS_DOMAIN_CLOCK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_CLOCK);
end;

function GVIR_CONFIG_IS_DOMAIN_CLOCK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_CLOCK);
end;

function GVIR_CONFIG_DOMAIN_CLOCK_GET_CLASS(obj: Pointer): PGVirConfigDomainClockClass;
begin
  Result := PGVirConfigDomainClockClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
