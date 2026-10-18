{$IFDEF read_interface}


type
  PGVirConfigObjectPrivate = type Pointer;

  PGVirConfigObject = ^TGVirConfigObject;
  TGVirConfigObject = record
    parent: TGObject;
    priv: PGVirConfigObjectPrivate;
  end;

  PGVirConfigObjectClass = ^TGVirConfigObjectClass;
  TGVirConfigObjectClass = record
    parent_class: TGObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_object_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_object_new(_type: TGType; root_name: pchar; schema: pchar): PGVirConfigObject; cdecl; external libvirtgconfig;
function gvir_config_object_new_from_xml(_type: TGType; root_name: pchar; schema: pchar; xml: Pgchar; error: PPGError): PGVirConfigObject; cdecl; external libvirtgconfig;
procedure gvir_config_object_validate(config: PGVirConfigObject; err: PPGError); cdecl; external libvirtgconfig;
function gvir_config_object_to_xml(config: PGVirConfigObject): Pgchar; cdecl; external libvirtgconfig;
function gvir_config_object_get_schema(config: PGVirConfigObject): Pgchar; cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:53:04 ===

function GVIR_CONFIG_TYPE_OBJECT: TGType;
function GVIR_CONFIG_OBJECT(obj: Pointer): PGVirConfigObject;
function GVIR_CONFIG_OBJECT_CLASS(klass: Pointer): PGVirConfigObjectClass;
function GVIR_CONFIG_IS_OBJECT(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_OBJECT_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_OBJECT_GET_CLASS(obj: Pointer): PGVirConfigObjectClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_OBJECT: TGType;
begin
  GVIR_CONFIG_TYPE_OBJECT := gvir_config_object_get_type;
end;

function GVIR_CONFIG_OBJECT(obj: Pointer): PGVirConfigObject;
begin
  Result := PGVirConfigObject(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_OBJECT));
end;

function GVIR_CONFIG_OBJECT_CLASS(klass: Pointer): PGVirConfigObjectClass;
begin
  Result := PGVirConfigObjectClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_OBJECT));
end;

function GVIR_CONFIG_IS_OBJECT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_OBJECT);
end;

function GVIR_CONFIG_IS_OBJECT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_OBJECT);
end;

function GVIR_CONFIG_OBJECT_GET_CLASS(obj: Pointer): PGVirConfigObjectClass;
begin
  Result := PGVirConfigObjectClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
