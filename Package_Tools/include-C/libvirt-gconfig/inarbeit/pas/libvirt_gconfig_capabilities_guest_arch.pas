unit libvirt_gconfig_capabilities_guest_arch;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_object;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigCapabilitiesGuestArchPrivate = type Pointer;

  PGVirConfigCapabilitiesGuestArch = ^TGVirConfigCapabilitiesGuestArch;
  TGVirConfigCapabilitiesGuestArch = record
    parent: TGVirConfigObject;
    priv: PGVirConfigCapabilitiesGuestArchPrivate;
  end;

  PGVirConfigCapabilitiesGuestArchClass = ^TGVirConfigCapabilitiesGuestArchClass;
  TGVirConfigCapabilitiesGuestArchClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_capabilities_guest_arch_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_capabilities_guest_arch_get_name(arch: PGVirConfigCapabilitiesGuestArch): Pgchar; cdecl; external libvirtgconfig;
function gvir_config_capabilities_guest_arch_get_domains(arch: PGVirConfigCapabilitiesGuestArch): PGList; cdecl; external libvirtgconfig;
function gvir_config_capabilities_guest_arch_get_emulator(arch: PGVirConfigCapabilitiesGuestArch): Pgchar; cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 19:52:25 ===

function GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_ARCH: TGType;
function GVIR_CONFIG_CAPABILITIES_GUEST_ARCH(obj: Pointer): PGVirConfigCapabilitiesGuestArch;
function GVIR_CONFIG_CAPABILITIES_GUEST_ARCH_CLASS(klass: Pointer): PGVirConfigCapabilitiesGuestArchClass;
function GVIR_CONFIG_IS_CAPABILITIES_GUEST_ARCH(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_CAPABILITIES_GUEST_ARCH_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_CAPABILITIES_GUEST_ARCH_GET_CLASS(obj: Pointer): PGVirConfigCapabilitiesGuestArchClass;

implementation

function GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_ARCH: TGType;
begin
  GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_ARCH := gvir_config_capabilities_guest_arch_get_type;
end;

function GVIR_CONFIG_CAPABILITIES_GUEST_ARCH(obj: Pointer): PGVirConfigCapabilitiesGuestArch;
begin
  Result := PGVirConfigCapabilitiesGuestArch(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_ARCH));
end;

function GVIR_CONFIG_CAPABILITIES_GUEST_ARCH_CLASS(klass: Pointer): PGVirConfigCapabilitiesGuestArchClass;
begin
  Result := PGVirConfigCapabilitiesGuestArchClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_ARCH));
end;

function GVIR_CONFIG_IS_CAPABILITIES_GUEST_ARCH(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_ARCH);
end;

function GVIR_CONFIG_IS_CAPABILITIES_GUEST_ARCH_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_ARCH);
end;

function GVIR_CONFIG_CAPABILITIES_GUEST_ARCH_GET_CLASS(obj: Pointer): PGVirConfigCapabilitiesGuestArchClass;
begin
  Result := PGVirConfigCapabilitiesGuestArchClass(PGTypeInstance(obj)^.g_class);
end;



end.
