{$IFDEF read_interface}


type
  PGVirConfigDomainInterfaceUserPrivate = type Pointer;

  PGVirConfigDomainInterfaceUser = ^TGVirConfigDomainInterfaceUser;
  TGVirConfigDomainInterfaceUser = record
    parent: TGVirConfigDomainInterface;
    priv: PGVirConfigDomainInterfaceUserPrivate;
  end;

  PGVirConfigDomainInterfaceUserClass = ^TGVirConfigDomainInterfaceUserClass;
  TGVirConfigDomainInterfaceUserClass = record
    parent_class: TGVirConfigDomainInterfaceClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_interface_user_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_interface_user_new: PGVirConfigDomainInterfaceUser; cdecl; external libvirtgconfig;
function gvir_config_domain_interface_user_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainInterfaceUser; cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:43:09 ===

function GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_USER: TGType;
function GVIR_CONFIG_DOMAIN_INTERFACE_USER(obj: Pointer): PGVirConfigDomainInterfaceUser;
function GVIR_CONFIG_DOMAIN_INTERFACE_USER_CLASS(klass: Pointer): PGVirConfigDomainInterfaceUserClass;
function GVIR_CONFIG_IS_DOMAIN_INTERFACE_USER(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_INTERFACE_USER_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_INTERFACE_USER_GET_CLASS(obj: Pointer): PGVirConfigDomainInterfaceUserClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_USER: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_USER := gvir_config_domain_interface_user_get_type;
end;

function GVIR_CONFIG_DOMAIN_INTERFACE_USER(obj: Pointer): PGVirConfigDomainInterfaceUser;
begin
  Result := PGVirConfigDomainInterfaceUser(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_USER));
end;

function GVIR_CONFIG_DOMAIN_INTERFACE_USER_CLASS(klass: Pointer): PGVirConfigDomainInterfaceUserClass;
begin
  Result := PGVirConfigDomainInterfaceUserClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_USER));
end;

function GVIR_CONFIG_IS_DOMAIN_INTERFACE_USER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_USER);
end;

function GVIR_CONFIG_IS_DOMAIN_INTERFACE_USER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_USER);
end;

function GVIR_CONFIG_DOMAIN_INTERFACE_USER_GET_CLASS(obj: Pointer): PGVirConfigDomainInterfaceUserClass;
begin
  Result := PGVirConfigDomainInterfaceUserClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
