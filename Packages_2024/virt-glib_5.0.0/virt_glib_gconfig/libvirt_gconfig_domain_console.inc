{$IFDEF read_interface}


type
  PGVirConfigDomainConsolePrivate = type Pointer;

  PGVirConfigDomainConsole = ^TGVirConfigDomainConsole;
  TGVirConfigDomainConsole = record
    parent: TGVirConfigDomainChardev;
    priv: PGVirConfigDomainConsolePrivate;
  end;

  PGVirConfigDomainConsoleClass = ^TGVirConfigDomainConsoleClass;
  TGVirConfigDomainConsoleClass = record
    parent_class: TGVirConfigDomainChardevClass;
    padding: array[0..19] of Tgpointer;
  end;

type
  PGVirConfigDomainConsoleTargetType = ^TGVirConfigDomainConsoleTargetType;
  TGVirConfigDomainConsoleTargetType = longint;
const
  GVIR_CONFIG_DOMAIN_CONSOLE_TARGET_XEN = 0;
  GVIR_CONFIG_DOMAIN_CONSOLE_TARGET_SERIAL = 1;
  GVIR_CONFIG_DOMAIN_CONSOLE_TARGET_UML = 2;
  GVIR_CONFIG_DOMAIN_CONSOLE_TARGET_VIRTIO = 3;
  GVIR_CONFIG_DOMAIN_CONSOLE_TARGET_LXC = 4;
  GVIR_CONFIG_DOMAIN_CONSOLE_TARGET_OPENVZ = 5;

function gvir_config_domain_console_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_console_new: PGVirConfigDomainConsole; cdecl; external libvirtgconfig;
function gvir_config_domain_console_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainConsole; cdecl; external libvirtgconfig;
procedure gvir_config_domain_console_set_target_type(console: PGVirConfigDomainConsole; _type: TGVirConfigDomainConsoleTargetType); cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 19:59:48 ===

function GVIR_CONFIG_TYPE_DOMAIN_CONSOLE: TGType;
function GVIR_CONFIG_DOMAIN_CONSOLE(obj: Pointer): PGVirConfigDomainConsole;
function GVIR_CONFIG_DOMAIN_CONSOLE_CLASS(klass: Pointer): PGVirConfigDomainConsoleClass;
function GVIR_CONFIG_IS_DOMAIN_CONSOLE(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_CONSOLE_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_CONSOLE_GET_CLASS(obj: Pointer): PGVirConfigDomainConsoleClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_DOMAIN_CONSOLE: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_CONSOLE := gvir_config_domain_console_get_type;
end;

function GVIR_CONFIG_DOMAIN_CONSOLE(obj: Pointer): PGVirConfigDomainConsole;
begin
  Result := PGVirConfigDomainConsole(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_CONSOLE));
end;

function GVIR_CONFIG_DOMAIN_CONSOLE_CLASS(klass: Pointer): PGVirConfigDomainConsoleClass;
begin
  Result := PGVirConfigDomainConsoleClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_CONSOLE));
end;

function GVIR_CONFIG_IS_DOMAIN_CONSOLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_CONSOLE);
end;

function GVIR_CONFIG_IS_DOMAIN_CONSOLE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_CONSOLE);
end;

function GVIR_CONFIG_DOMAIN_CONSOLE_GET_CLASS(obj: Pointer): PGVirConfigDomainConsoleClass;
begin
  Result := PGVirConfigDomainConsoleClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
