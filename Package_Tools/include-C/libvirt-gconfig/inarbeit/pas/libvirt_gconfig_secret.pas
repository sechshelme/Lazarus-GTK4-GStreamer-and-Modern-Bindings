unit libvirt_gconfig_secret;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_object;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigSecretPrivate = type Pointer;

  PGVirConfigSecret = ^TGVirConfigSecret;
  TGVirConfigSecret = record
    parent: TGVirConfigObject;
    priv: PGVirConfigSecretPrivate;
  end;

  PGVirConfigSecretClass = ^TGVirConfigSecretClass;
  TGVirConfigSecretClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_secret_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_secret_new: PGVirConfigSecret; cdecl; external libvirtgconfig;
function gvir_config_secret_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigSecret; cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:53:02 ===

function GVIR_CONFIG_TYPE_SECRET: TGType;
function GVIR_CONFIG_SECRET(obj: Pointer): PGVirConfigSecret;
function GVIR_CONFIG_SECRET_CLASS(klass: Pointer): PGVirConfigSecretClass;
function GVIR_CONFIG_IS_SECRET(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_SECRET_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_SECRET_GET_CLASS(obj: Pointer): PGVirConfigSecretClass;

implementation

function GVIR_CONFIG_TYPE_SECRET: TGType;
begin
  GVIR_CONFIG_TYPE_SECRET := gvir_config_secret_get_type;
end;

function GVIR_CONFIG_SECRET(obj: Pointer): PGVirConfigSecret;
begin
  Result := PGVirConfigSecret(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_SECRET));
end;

function GVIR_CONFIG_SECRET_CLASS(klass: Pointer): PGVirConfigSecretClass;
begin
  Result := PGVirConfigSecretClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_SECRET));
end;

function GVIR_CONFIG_IS_SECRET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_SECRET);
end;

function GVIR_CONFIG_IS_SECRET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_SECRET);
end;

function GVIR_CONFIG_SECRET_GET_CLASS(obj: Pointer): PGVirConfigSecretClass;
begin
  Result := PGVirConfigSecretClass(PGTypeInstance(obj)^.g_class);
end;



end.
