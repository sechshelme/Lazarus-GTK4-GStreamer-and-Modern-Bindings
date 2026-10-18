unit libvirt_gconfig_domain_timer_hpet;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_object, libvirt_gconfig_domain_timer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigDomainTimerHpetPrivate = type Pointer;

  PGVirConfigDomainTimerHpet = ^TGVirConfigDomainTimerHpet;
  TGVirConfigDomainTimerHpet = record
    parent: TGVirConfigDomainTimer;
    priv: PGVirConfigDomainTimerHpetPrivate;
  end;

  PGVirConfigDomainTimerHpetClass = ^TGVirConfigDomainTimerHpetClass;
  TGVirConfigDomainTimerHpetClass = record
    parent_class: TGVirConfigDomainTimerClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_timer_hpet_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_timer_hpet_new: PGVirConfigDomainTimerHpet; cdecl; external libvirtgconfig;
function gvir_config_domain_timer_hpet_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainTimerHpet; cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:49:38 ===

function GVIR_CONFIG_TYPE_DOMAIN_TIMER_HPET: TGType;
function GVIR_CONFIG_DOMAIN_TIMER_HPET(obj: Pointer): PGVirConfigDomainTimerHpet;
function GVIR_CONFIG_DOMAIN_TIMER_HPET_CLASS(klass: Pointer): PGVirConfigDomainTimerHpetClass;
function GVIR_CONFIG_IS_DOMAIN_TIMER_HPET(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_TIMER_HPET_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_TIMER_HPET_GET_CLASS(obj: Pointer): PGVirConfigDomainTimerHpetClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_TIMER_HPET: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_TIMER_HPET := gvir_config_domain_timer_hpet_get_type;
end;

function GVIR_CONFIG_DOMAIN_TIMER_HPET(obj: Pointer): PGVirConfigDomainTimerHpet;
begin
  Result := PGVirConfigDomainTimerHpet(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_TIMER_HPET));
end;

function GVIR_CONFIG_DOMAIN_TIMER_HPET_CLASS(klass: Pointer): PGVirConfigDomainTimerHpetClass;
begin
  Result := PGVirConfigDomainTimerHpetClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_TIMER_HPET));
end;

function GVIR_CONFIG_IS_DOMAIN_TIMER_HPET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_TIMER_HPET);
end;

function GVIR_CONFIG_IS_DOMAIN_TIMER_HPET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_TIMER_HPET);
end;

function GVIR_CONFIG_DOMAIN_TIMER_HPET_GET_CLASS(obj: Pointer): PGVirConfigDomainTimerHpetClass;
begin
  Result := PGVirConfigDomainTimerHpetClass(PGTypeInstance(obj)^.g_class);
end;



end.
