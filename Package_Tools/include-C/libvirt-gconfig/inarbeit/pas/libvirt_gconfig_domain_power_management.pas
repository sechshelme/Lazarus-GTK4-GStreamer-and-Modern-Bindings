unit libvirt_gconfig_domain_power_management;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_object;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigDomainPowerManagementPrivate = type Pointer;

  PGVirConfigDomainPowerManagement = ^TGVirConfigDomainPowerManagement;
  TGVirConfigDomainPowerManagement = record
    parent: TGVirConfigObject;
    priv: PGVirConfigDomainPowerManagementPrivate;
  end;

  PGVirConfigDomainPowerManagementClass = ^TGVirConfigDomainPowerManagementClass;
  TGVirConfigDomainPowerManagementClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_power_management_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_power_management_new: PGVirConfigDomainPowerManagement; cdecl; external libvirtgconfig;
function gvir_config_domain_power_management_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainPowerManagement; cdecl; external libvirtgconfig;
procedure gvir_config_domain_power_management_set_mem_suspend_enabled(pm: PGVirConfigDomainPowerManagement; enabled: Tgboolean); cdecl; external libvirtgconfig;
procedure gvir_config_domain_power_management_set_disk_suspend_enabled(pm: PGVirConfigDomainPowerManagement; enabled: Tgboolean); cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:47:14 ===

function GVIR_CONFIG_TYPE_DOMAIN_POWER_MANAGEMENT: TGType;
function GVIR_CONFIG_DOMAIN_POWER_MANAGEMENT(obj: Pointer): PGVirConfigDomainPowerManagement;
function GVIR_CONFIG_DOMAIN_POWER_MANAGEMENT_CLASS(klass: Pointer): PGVirConfigDomainPowerManagementClass;
function GVIR_CONFIG_IS_DOMAIN_POWER_MANAGEMENT(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_POWER_MANAGEMENT_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_POWER_MANAGEMENT_GET_CLASS(obj: Pointer): PGVirConfigDomainPowerManagementClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_POWER_MANAGEMENT: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_POWER_MANAGEMENT := gvir_config_domain_power_management_get_type;
end;

function GVIR_CONFIG_DOMAIN_POWER_MANAGEMENT(obj: Pointer): PGVirConfigDomainPowerManagement;
begin
  Result := PGVirConfigDomainPowerManagement(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_POWER_MANAGEMENT));
end;

function GVIR_CONFIG_DOMAIN_POWER_MANAGEMENT_CLASS(klass: Pointer): PGVirConfigDomainPowerManagementClass;
begin
  Result := PGVirConfigDomainPowerManagementClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_POWER_MANAGEMENT));
end;

function GVIR_CONFIG_IS_DOMAIN_POWER_MANAGEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_POWER_MANAGEMENT);
end;

function GVIR_CONFIG_IS_DOMAIN_POWER_MANAGEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_POWER_MANAGEMENT);
end;

function GVIR_CONFIG_DOMAIN_POWER_MANAGEMENT_GET_CLASS(obj: Pointer): PGVirConfigDomainPowerManagementClass;
begin
  Result := PGVirConfigDomainPowerManagementClass(PGTypeInstance(obj)^.g_class);
end;



end.
