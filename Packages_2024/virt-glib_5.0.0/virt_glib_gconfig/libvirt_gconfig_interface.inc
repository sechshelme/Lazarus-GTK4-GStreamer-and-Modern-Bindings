{$IFDEF read_interface}


type
  PGVirConfigInterfacePrivate = type Pointer;

  PGVirConfigInterface = ^TGVirConfigInterface;
  TGVirConfigInterface = record
    parent: TGVirConfigObject;
    priv: PGVirConfigInterfacePrivate;
  end;

  PGVirConfigInterfaceClass = ^TGVirConfigInterfaceClass;
  TGVirConfigInterfaceClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_interface_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_interface_new: PGVirConfigInterface; cdecl; external libvirtgconfig;
function gvir_config_interface_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigInterface; cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:53:22 ===

function GVIR_CONFIG_TYPE_INTERFACE: TGType;
function GVIR_CONFIG_INTERFACE(obj: Pointer): PGVirConfigInterface;
function GVIR_CONFIG_INTERFACE_CLASS(klass: Pointer): PGVirConfigInterfaceClass;
function GVIR_CONFIG_IS_INTERFACE(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_INTERFACE_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_INTERFACE_GET_CLASS(obj: Pointer): PGVirConfigInterfaceClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_INTERFACE: TGType;
begin
  GVIR_CONFIG_TYPE_INTERFACE := gvir_config_interface_get_type;
end;

function GVIR_CONFIG_INTERFACE(obj: Pointer): PGVirConfigInterface;
begin
  Result := PGVirConfigInterface(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_INTERFACE));
end;

function GVIR_CONFIG_INTERFACE_CLASS(klass: Pointer): PGVirConfigInterfaceClass;
begin
  Result := PGVirConfigInterfaceClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_INTERFACE));
end;

function GVIR_CONFIG_IS_INTERFACE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_INTERFACE);
end;

function GVIR_CONFIG_IS_INTERFACE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_INTERFACE);
end;

function GVIR_CONFIG_INTERFACE_GET_CLASS(obj: Pointer): PGVirConfigInterfaceClass;
begin
  Result := PGVirConfigInterfaceClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
