unit libvirt_gconfig_domain_serial;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_domain_chardev;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigDomainSerialPrivate = type Pointer;

  PGVirConfigDomainSerial = ^TGVirConfigDomainSerial;
  TGVirConfigDomainSerial = record
    parent: TGVirConfigDomainChardev;
    priv: PGVirConfigDomainSerialPrivate;
  end;

  PGVirConfigDomainSerialClass = ^TGVirConfigDomainSerialClass;
  TGVirConfigDomainSerialClass = record
    parent_class: TGVirConfigDomainChardevClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_serial_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_serial_new: PGVirConfigDomainSerial; cdecl; external libvirtgconfig;
function gvir_config_domain_serial_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainSerial; cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:47:06 ===

function GVIR_CONFIG_TYPE_DOMAIN_SERIAL: TGType;
function GVIR_CONFIG_DOMAIN_SERIAL(obj: Pointer): PGVirConfigDomainSerial;
function GVIR_CONFIG_DOMAIN_SERIAL_CLASS(klass: Pointer): PGVirConfigDomainSerialClass;
function GVIR_CONFIG_IS_DOMAIN_SERIAL(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_SERIAL_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_SERIAL_GET_CLASS(obj: Pointer): PGVirConfigDomainSerialClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_SERIAL: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_SERIAL := gvir_config_domain_serial_get_type;
end;

function GVIR_CONFIG_DOMAIN_SERIAL(obj: Pointer): PGVirConfigDomainSerial;
begin
  Result := PGVirConfigDomainSerial(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_SERIAL));
end;

function GVIR_CONFIG_DOMAIN_SERIAL_CLASS(klass: Pointer): PGVirConfigDomainSerialClass;
begin
  Result := PGVirConfigDomainSerialClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_SERIAL));
end;

function GVIR_CONFIG_IS_DOMAIN_SERIAL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_SERIAL);
end;

function GVIR_CONFIG_IS_DOMAIN_SERIAL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_SERIAL);
end;

function GVIR_CONFIG_DOMAIN_SERIAL_GET_CLASS(obj: Pointer): PGVirConfigDomainSerialClass;
begin
  Result := PGVirConfigDomainSerialClass(PGTypeInstance(obj)^.g_class);
end;



end.
