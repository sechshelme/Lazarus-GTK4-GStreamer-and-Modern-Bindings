unit libvirt_gconfig_domain_interface_filterref;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_object, libvirt_gconfig_domain_interface_filterref_parameter;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigDomainInterfaceFilterrefPrivate = type Pointer;

  PGVirConfigDomainInterfaceFilterref = ^TGVirConfigDomainInterfaceFilterref;
  TGVirConfigDomainInterfaceFilterref = record
    parent: TGVirConfigObject;
    priv: PGVirConfigDomainInterfaceFilterrefPrivate;
  end;

  PGVirConfigDomainInterfaceFilterrefClass = ^TGVirConfigDomainInterfaceFilterrefClass;
  TGVirConfigDomainInterfaceFilterrefClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_interface_filterref_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_interface_filterref_new: PGVirConfigDomainInterfaceFilterref; cdecl; external libvirtgconfig;
function gvir_config_domain_interface_filterref_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainInterfaceFilterref; cdecl; external libvirtgconfig;
procedure gvir_config_domain_interface_filterref_set_name(filterref: PGVirConfigDomainInterfaceFilterref; filter: pchar); cdecl; external libvirtgconfig;
function gvir_config_domain_interface_filterref_get_name(filterref: PGVirConfigDomainInterfaceFilterref): pchar; cdecl; external libvirtgconfig;
procedure gvir_config_domain_interface_filterref_add_parameter(filterref: PGVirConfigDomainInterfaceFilterref; parameter: PGVirConfigDomainInterfaceFilterrefParameter); cdecl; external libvirtgconfig;
function gvir_config_domain_interface_filterref_get_parameters(filterref: PGVirConfigDomainInterfaceFilterref): PGList; cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:43:19 ===

function GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_FILTERREF: TGType;
function GVIR_CONFIG_DOMAIN_INTERFACE_FILTERREF(obj: Pointer): PGVirConfigDomainInterfaceFilterref;
function GVIR_CONFIG_DOMAIN_INTERFACE_FILTERREF_CLASS(klass: Pointer): PGVirConfigDomainInterfaceFilterrefClass;
function GVIR_CONFIG_IS_DOMAIN_INTERFACE_FILTERREF(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_INTERFACE_FILTERREF_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_INTERFACE_FILTERREF_GET_CLASS(obj: Pointer): PGVirConfigDomainInterfaceFilterrefClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_FILTERREF: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_FILTERREF := gvir_config_domain_interface_filterref_get_type;
end;

function GVIR_CONFIG_DOMAIN_INTERFACE_FILTERREF(obj: Pointer): PGVirConfigDomainInterfaceFilterref;
begin
  Result := PGVirConfigDomainInterfaceFilterref(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_FILTERREF));
end;

function GVIR_CONFIG_DOMAIN_INTERFACE_FILTERREF_CLASS(klass: Pointer): PGVirConfigDomainInterfaceFilterrefClass;
begin
  Result := PGVirConfigDomainInterfaceFilterrefClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_FILTERREF));
end;

function GVIR_CONFIG_IS_DOMAIN_INTERFACE_FILTERREF(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_FILTERREF);
end;

function GVIR_CONFIG_IS_DOMAIN_INTERFACE_FILTERREF_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_FILTERREF);
end;

function GVIR_CONFIG_DOMAIN_INTERFACE_FILTERREF_GET_CLASS(obj: Pointer): PGVirConfigDomainInterfaceFilterrefClass;
begin
  Result := PGVirConfigDomainInterfaceFilterrefClass(PGTypeInstance(obj)^.g_class);
end;



end.
