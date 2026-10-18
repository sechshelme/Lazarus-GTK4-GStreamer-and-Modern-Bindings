{$IFDEF read_interface}


type
  PGVirConfigDomainTimerPrivate = type Pointer;

  PGVirConfigDomainTimer = ^TGVirConfigDomainTimer;
  TGVirConfigDomainTimer = record
    parent: TGVirConfigObject;
    priv: PGVirConfigDomainTimerPrivate;
  end;

  PGVirConfigDomainTimerClass = ^TGVirConfigDomainTimerClass;
  TGVirConfigDomainTimerClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

type
  PGVirConfigDomainTimerTickPolicy = ^TGVirConfigDomainTimerTickPolicy;
  TGVirConfigDomainTimerTickPolicy = longint;
const
  GVIR_CONFIG_DOMAIN_TIMER_TICK_POLICY_DELAY = 0;
  GVIR_CONFIG_DOMAIN_TIMER_TICK_POLICY_CATCHUP = 1;
  GVIR_CONFIG_DOMAIN_TIMER_TICK_POLICY_MERGE = 2;
  GVIR_CONFIG_DOMAIN_TIMER_TICK_POLICY_DISCARD = 3;

function gvir_config_domain_timer_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_timer_get_tick_policy(timer: PGVirConfigDomainTimer): TGVirConfigDomainTimerTickPolicy; cdecl; external libvirtgconfig;
procedure gvir_config_domain_timer_set_tick_policy(timer: PGVirConfigDomainTimer; policy: TGVirConfigDomainTimerTickPolicy); cdecl; external libvirtgconfig;
function gvir_config_domain_timer_get_present(timer: PGVirConfigDomainTimer): Tgboolean; cdecl; external libvirtgconfig;
procedure gvir_config_domain_timer_set_present(timer: PGVirConfigDomainTimer; present: Tgboolean); cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:49:40 ===

function GVIR_CONFIG_TYPE_DOMAIN_TIMER: TGType;
function GVIR_CONFIG_DOMAIN_TIMER(obj: Pointer): PGVirConfigDomainTimer;
function GVIR_CONFIG_DOMAIN_TIMER_CLASS(klass: Pointer): PGVirConfigDomainTimerClass;
function GVIR_CONFIG_IS_DOMAIN_TIMER(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_TIMER_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_TIMER_GET_CLASS(obj: Pointer): PGVirConfigDomainTimerClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_DOMAIN_TIMER: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_TIMER := gvir_config_domain_timer_get_type;
end;

function GVIR_CONFIG_DOMAIN_TIMER(obj: Pointer): PGVirConfigDomainTimer;
begin
  Result := PGVirConfigDomainTimer(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_TIMER));
end;

function GVIR_CONFIG_DOMAIN_TIMER_CLASS(klass: Pointer): PGVirConfigDomainTimerClass;
begin
  Result := PGVirConfigDomainTimerClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_TIMER));
end;

function GVIR_CONFIG_IS_DOMAIN_TIMER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_TIMER);
end;

function GVIR_CONFIG_IS_DOMAIN_TIMER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_TIMER);
end;

function GVIR_CONFIG_DOMAIN_TIMER_GET_CLASS(obj: Pointer): PGVirConfigDomainTimerClass;
begin
  Result := PGVirConfigDomainTimerClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
