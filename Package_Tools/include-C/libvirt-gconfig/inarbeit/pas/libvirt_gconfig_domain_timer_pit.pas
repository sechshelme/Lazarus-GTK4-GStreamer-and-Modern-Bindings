unit libvirt_gconfig_domain_timer_pit;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_object, libvirt_gconfig_domain_timer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigDomainTimerPitPrivate = type Pointer;

  PGVirConfigDomainTimerPit = ^TGVirConfigDomainTimerPit;
  TGVirConfigDomainTimerPit = record
    parent: TGVirConfigDomainTimer;
    priv: PGVirConfigDomainTimerPitPrivate;
  end;

  PGVirConfigDomainTimerPitClass = ^TGVirConfigDomainTimerPitClass;
  TGVirConfigDomainTimerPitClass = record
    parent_class: TGVirConfigDomainTimerClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_timer_pit_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_timer_pit_new: PGVirConfigDomainTimerPit; cdecl; external libvirtgconfig;
function gvir_config_domain_timer_pit_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainTimerPit; cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:49:36 ===

function GVIR_CONFIG_TYPE_DOMAIN_TIMER_PIT: TGType;
function GVIR_CONFIG_DOMAIN_TIMER_PIT(obj: Pointer): PGVirConfigDomainTimerPit;
function GVIR_CONFIG_DOMAIN_TIMER_PIT_CLASS(klass: Pointer): PGVirConfigDomainTimerPitClass;
function GVIR_CONFIG_IS_DOMAIN_TIMER_PIT(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_TIMER_PIT_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_TIMER_PIT_GET_CLASS(obj: Pointer): PGVirConfigDomainTimerPitClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_TIMER_PIT: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_TIMER_PIT := gvir_config_domain_timer_pit_get_type;
end;

function GVIR_CONFIG_DOMAIN_TIMER_PIT(obj: Pointer): PGVirConfigDomainTimerPit;
begin
  Result := PGVirConfigDomainTimerPit(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_TIMER_PIT));
end;

function GVIR_CONFIG_DOMAIN_TIMER_PIT_CLASS(klass: Pointer): PGVirConfigDomainTimerPitClass;
begin
  Result := PGVirConfigDomainTimerPitClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_TIMER_PIT));
end;

function GVIR_CONFIG_IS_DOMAIN_TIMER_PIT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_TIMER_PIT);
end;

function GVIR_CONFIG_IS_DOMAIN_TIMER_PIT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_TIMER_PIT);
end;

function GVIR_CONFIG_DOMAIN_TIMER_PIT_GET_CLASS(obj: Pointer): PGVirConfigDomainTimerPitClass;
begin
  Result := PGVirConfigDomainTimerPitClass(PGTypeInstance(obj)^.g_class);
end;



end.
