unit libvirt_gconfig_capabilities_guest;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_object, libvirt_gconfig_domain_os, libvirt_gconfig_capabilities_guest_arch;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigCapabilitiesGuestPrivate = type Pointer;

  PGVirConfigCapabilitiesGuest = ^TGVirConfigCapabilitiesGuest;
  TGVirConfigCapabilitiesGuest = record
    parent: TGVirConfigObject;
    priv: PGVirConfigCapabilitiesGuestPrivate;
  end;

  PGVirConfigCapabilitiesGuestClass = ^TGVirConfigCapabilitiesGuestClass;
  TGVirConfigCapabilitiesGuestClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_capabilities_guest_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_capabilities_guest_get_os_type(guest: PGVirConfigCapabilitiesGuest): TGVirConfigDomainOsType; cdecl; external libvirtgconfig;
function gvir_config_capabilities_guest_get_arch(guest: PGVirConfigCapabilitiesGuest): PGVirConfigCapabilitiesGuestArch; cdecl; external libvirtgconfig;
function gvir_config_capabilities_guest_get_features(guest: PGVirConfigCapabilitiesGuest): PGList; cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 19:52:29 ===

function GVIR_CONFIG_TYPE_CAPABILITIES_GUEST: TGType;
function GVIR_CONFIG_CAPABILITIES_GUEST(obj: Pointer): PGVirConfigCapabilitiesGuest;
function GVIR_CONFIG_CAPABILITIES_GUEST_CLASS(klass: Pointer): PGVirConfigCapabilitiesGuestClass;
function GVIR_CONFIG_IS_CAPABILITIES_GUEST(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_CAPABILITIES_GUEST_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_CAPABILITIES_GUEST_GET_CLASS(obj: Pointer): PGVirConfigCapabilitiesGuestClass;

implementation

function GVIR_CONFIG_TYPE_CAPABILITIES_GUEST: TGType;
begin
  GVIR_CONFIG_TYPE_CAPABILITIES_GUEST := gvir_config_capabilities_guest_get_type;
end;

function GVIR_CONFIG_CAPABILITIES_GUEST(obj: Pointer): PGVirConfigCapabilitiesGuest;
begin
  Result := PGVirConfigCapabilitiesGuest(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_CAPABILITIES_GUEST));
end;

function GVIR_CONFIG_CAPABILITIES_GUEST_CLASS(klass: Pointer): PGVirConfigCapabilitiesGuestClass;
begin
  Result := PGVirConfigCapabilitiesGuestClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_CAPABILITIES_GUEST));
end;

function GVIR_CONFIG_IS_CAPABILITIES_GUEST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_CAPABILITIES_GUEST);
end;

function GVIR_CONFIG_IS_CAPABILITIES_GUEST_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_CAPABILITIES_GUEST);
end;

function GVIR_CONFIG_CAPABILITIES_GUEST_GET_CLASS(obj: Pointer): PGVirConfigCapabilitiesGuestClass;
begin
  Result := PGVirConfigCapabilitiesGuestClass(PGTypeInstance(obj)^.g_class);
end;



end.
