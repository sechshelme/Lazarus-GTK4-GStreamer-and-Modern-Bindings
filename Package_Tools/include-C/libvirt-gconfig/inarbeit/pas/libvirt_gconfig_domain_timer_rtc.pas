unit libvirt_gconfig_domain_timer_rtc;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_object, libvirt_gconfig_domain_timer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigDomainTimerRtcPrivate = type Pointer;

  PGVirConfigDomainTimerRtc = ^TGVirConfigDomainTimerRtc;
  TGVirConfigDomainTimerRtc = record
    parent: TGVirConfigDomainTimer;
    priv: PGVirConfigDomainTimerRtcPrivate;
  end;

  PGVirConfigDomainTimerRtcClass = ^TGVirConfigDomainTimerRtcClass;
  TGVirConfigDomainTimerRtcClass = record
    parent_class: TGVirConfigDomainTimerClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_timer_rtc_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_timer_rtc_new: PGVirConfigDomainTimerRtc; cdecl; external libvirtgconfig;
function gvir_config_domain_timer_rtc_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainTimerRtc; cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:49:33 ===

function GVIR_CONFIG_TYPE_DOMAIN_TIMER_RTC: TGType;
function GVIR_CONFIG_DOMAIN_TIMER_RTC(obj: Pointer): PGVirConfigDomainTimerRtc;
function GVIR_CONFIG_DOMAIN_TIMER_RTC_CLASS(klass: Pointer): PGVirConfigDomainTimerRtcClass;
function GVIR_CONFIG_IS_DOMAIN_TIMER_RTC(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_TIMER_RTC_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_TIMER_RTC_GET_CLASS(obj: Pointer): PGVirConfigDomainTimerRtcClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_TIMER_RTC: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_TIMER_RTC := gvir_config_domain_timer_rtc_get_type;
end;

function GVIR_CONFIG_DOMAIN_TIMER_RTC(obj: Pointer): PGVirConfigDomainTimerRtc;
begin
  Result := PGVirConfigDomainTimerRtc(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_TIMER_RTC));
end;

function GVIR_CONFIG_DOMAIN_TIMER_RTC_CLASS(klass: Pointer): PGVirConfigDomainTimerRtcClass;
begin
  Result := PGVirConfigDomainTimerRtcClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_TIMER_RTC));
end;

function GVIR_CONFIG_IS_DOMAIN_TIMER_RTC(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_TIMER_RTC);
end;

function GVIR_CONFIG_IS_DOMAIN_TIMER_RTC_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_TIMER_RTC);
end;

function GVIR_CONFIG_DOMAIN_TIMER_RTC_GET_CLASS(obj: Pointer): PGVirConfigDomainTimerRtcClass;
begin
  Result := PGVirConfigDomainTimerRtcClass(PGTypeInstance(obj)^.g_class);
end;



end.
