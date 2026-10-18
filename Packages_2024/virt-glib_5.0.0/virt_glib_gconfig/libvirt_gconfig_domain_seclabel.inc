{$IFDEF read_interface}


type
  PGVirConfigDomainSeclabelPrivate = type Pointer;

  PGVirConfigDomainSeclabel = ^TGVirConfigDomainSeclabel;
  TGVirConfigDomainSeclabel = record
    parent: TGVirConfigObject;
    priv: PGVirConfigDomainSeclabelPrivate;
  end;

  PGVirConfigDomainSeclabelClass = ^TGVirConfigDomainSeclabelClass;
  TGVirConfigDomainSeclabelClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

type
  PGVirConfigDomainSeclabelType = ^TGVirConfigDomainSeclabelType;
  TGVirConfigDomainSeclabelType = longint;
const
  GVIR_CONFIG_DOMAIN_SECLABEL_DYNAMIC = 0;
  GVIR_CONFIG_DOMAIN_SECLABEL_STATIC = 1;

function gvir_config_domain_seclabel_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_seclabel_new: PGVirConfigDomainSeclabel; cdecl; external libvirtgconfig;
function gvir_config_domain_seclabel_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainSeclabel; cdecl; external libvirtgconfig;
procedure gvir_config_domain_seclabel_set_type(seclabel: PGVirConfigDomainSeclabel; _type: TGVirConfigDomainSeclabelType); cdecl; external libvirtgconfig;
procedure gvir_config_domain_seclabel_set_model(seclabel: PGVirConfigDomainSeclabel; model: Pgchar); cdecl; external libvirtgconfig;
procedure gvir_config_domain_seclabel_set_baselabel(seclabel: PGVirConfigDomainSeclabel; _label: Pgchar); cdecl; external libvirtgconfig;
procedure gvir_config_domain_seclabel_set_label(seclabel: PGVirConfigDomainSeclabel; _label: Pgchar); cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:47:09 ===

function GVIR_CONFIG_TYPE_DOMAIN_SECLABEL: TGType;
function GVIR_CONFIG_DOMAIN_SECLABEL(obj: Pointer): PGVirConfigDomainSeclabel;
function GVIR_CONFIG_DOMAIN_SECLABEL_CLASS(klass: Pointer): PGVirConfigDomainSeclabelClass;
function GVIR_CONFIG_IS_DOMAIN_SECLABEL(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_SECLABEL_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_SECLABEL_GET_CLASS(obj: Pointer): PGVirConfigDomainSeclabelClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_DOMAIN_SECLABEL: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_SECLABEL := gvir_config_domain_seclabel_get_type;
end;

function GVIR_CONFIG_DOMAIN_SECLABEL(obj: Pointer): PGVirConfigDomainSeclabel;
begin
  Result := PGVirConfigDomainSeclabel(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_SECLABEL));
end;

function GVIR_CONFIG_DOMAIN_SECLABEL_CLASS(klass: Pointer): PGVirConfigDomainSeclabelClass;
begin
  Result := PGVirConfigDomainSeclabelClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_SECLABEL));
end;

function GVIR_CONFIG_IS_DOMAIN_SECLABEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_SECLABEL);
end;

function GVIR_CONFIG_IS_DOMAIN_SECLABEL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_SECLABEL);
end;

function GVIR_CONFIG_DOMAIN_SECLABEL_GET_CLASS(obj: Pointer): PGVirConfigDomainSeclabelClass;
begin
  Result := PGVirConfigDomainSeclabelClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
