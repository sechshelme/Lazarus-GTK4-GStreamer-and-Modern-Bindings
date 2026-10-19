{$IFDEF read_interface}



type
  PGVirDomainInterfaceStats = ^TGVirDomainInterfaceStats;
  TGVirDomainInterfaceStats = record
    rx_bytes: Tgint64;
    rx_packets: Tgint64;
    rx_errs: Tgint64;
    rx_drop: Tgint64;
    tx_bytes: Tgint64;
    tx_packets: Tgint64;
    tx_errs: Tgint64;
    tx_drop: Tgint64;
  end;

  PGVirDomainInterfacePrivate = type Pointer;

  PGVirDomainInterface = ^TGVirDomainInterface;
  TGVirDomainInterface = record
    parent: TGVirDomainDevice;
    priv: PGVirDomainInterfacePrivate;
  end;

  PGVirDomainInterfaceClass = ^TGVirDomainInterfaceClass;
  TGVirDomainInterfaceClass = record
    parent_class: TGVirDomainDeviceClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_domain_interface_get_type: TGType; cdecl; external libvirtgobject;
function gvir_domain_interface_stats_get_type: TGType; cdecl; external libvirtgobject;
function gvir_domain_interface_get_stats(self: PGVirDomainInterface; err: PPGError): PGVirDomainInterfaceStats; cdecl; external libvirtgobject;

// === Konventiert am: 18-10-26 19:32:30 ===

function GVIR_TYPE_DOMAIN_INTERFACE: TGType;
function GVIR_DOMAIN_INTERFACE(obj: Pointer): PGVirDomainInterface;
function GVIR_DOMAIN_INTERFACE_CLASS(klass: Pointer): PGVirDomainInterfaceClass;
function GVIR_IS_DOMAIN_INTERFACE(obj: Pointer): Tgboolean;
function GVIR_IS_DOMAIN_INTERFACE_CLASS(klass: Pointer): Tgboolean;
function GVIR_DOMAIN_INTERFACE_GET_CLASS(obj: Pointer): PGVirDomainInterfaceClass;

function GVIR_TYPE_DOMAIN_INTERFACE_STATS: TGType;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_TYPE_DOMAIN_INTERFACE: TGType;
begin
  GVIR_TYPE_DOMAIN_INTERFACE := gvir_domain_interface_get_type;
end;

function GVIR_DOMAIN_INTERFACE(obj: Pointer): PGVirDomainInterface;
begin
  Result := PGVirDomainInterface(g_type_check_instance_cast(obj, GVIR_TYPE_DOMAIN_INTERFACE));
end;

function GVIR_DOMAIN_INTERFACE_CLASS(klass: Pointer): PGVirDomainInterfaceClass;
begin
  Result := PGVirDomainInterfaceClass(g_type_check_class_cast(klass, GVIR_TYPE_DOMAIN_INTERFACE));
end;

function GVIR_IS_DOMAIN_INTERFACE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_TYPE_DOMAIN_INTERFACE);
end;

function GVIR_IS_DOMAIN_INTERFACE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_TYPE_DOMAIN_INTERFACE);
end;

function GVIR_DOMAIN_INTERFACE_GET_CLASS(obj: Pointer): PGVirDomainInterfaceClass;
begin
  Result := PGVirDomainInterfaceClass(PGTypeInstance(obj)^.g_class);
end;


function GVIR_TYPE_DOMAIN_INTERFACE_STATS: TGType;
begin
  GVIR_TYPE_DOMAIN_INTERFACE_STATS := gvir_domain_interface_stats_get_type;
end;


{$ENDIF read_implementation}
