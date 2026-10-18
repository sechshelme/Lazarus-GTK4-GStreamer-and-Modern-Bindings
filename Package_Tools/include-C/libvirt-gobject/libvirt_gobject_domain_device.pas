unit libvirt_gobject_domain_device;

interface

uses
  fp_glib2, fp_virt_glib, libvirt_gobject_domain;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirDomainDevicePrivate = type Pointer;

  PGVirDomainDevice = ^TGVirDomainDevice;
  TGVirDomainDevice = record
    parent: TGObject;
    priv: PGVirDomainDevicePrivate;
  end;

  PGVirDomainDeviceClass = ^TGVirDomainDeviceClass;
  TGVirDomainDeviceClass = record
    parent_class: TGObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_domain_device_get_type: TGType; cdecl; external libvirtgobject;
function gvir_domain_device_get_domain(device: PGVirDomainDevice): PGVirDomain; cdecl; external libvirtgobject;
function gvir_domain_device_get_config(device: PGVirDomainDevice): PGVirConfigDomainDevice; cdecl; external libvirtgobject;

// === Konventiert am: 18-10-26 19:32:36 ===

function GVIR_TYPE_DOMAIN_DEVICE: TGType;
function GVIR_DOMAIN_DEVICE(obj: Pointer): PGVirDomainDevice;
function GVIR_DOMAIN_DEVICE_CLASS(klass: Pointer): PGVirDomainDeviceClass;
function GVIR_IS_DOMAIN_DEVICE(obj: Pointer): Tgboolean;
function GVIR_IS_DOMAIN_DEVICE_CLASS(klass: Pointer): Tgboolean;
function GVIR_DOMAIN_DEVICE_GET_CLASS(obj: Pointer): PGVirDomainDeviceClass;

implementation

function GVIR_TYPE_DOMAIN_DEVICE: TGType;
begin
  GVIR_TYPE_DOMAIN_DEVICE := gvir_domain_device_get_type;
end;

function GVIR_DOMAIN_DEVICE(obj: Pointer): PGVirDomainDevice;
begin
  Result := PGVirDomainDevice(g_type_check_instance_cast(obj, GVIR_TYPE_DOMAIN_DEVICE));
end;

function GVIR_DOMAIN_DEVICE_CLASS(klass: Pointer): PGVirDomainDeviceClass;
begin
  Result := PGVirDomainDeviceClass(g_type_check_class_cast(klass, GVIR_TYPE_DOMAIN_DEVICE));
end;

function GVIR_IS_DOMAIN_DEVICE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_TYPE_DOMAIN_DEVICE);
end;

function GVIR_IS_DOMAIN_DEVICE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_TYPE_DOMAIN_DEVICE);
end;

function GVIR_DOMAIN_DEVICE_GET_CLASS(obj: Pointer): PGVirDomainDeviceClass;
begin
  Result := PGVirDomainDeviceClass(PGTypeInstance(obj)^.g_class);
end;



end.
