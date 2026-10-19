{$IFDEF read_interface}


type
  PGVirDomainDiskStats = ^TGVirDomainDiskStats;
  TGVirDomainDiskStats = record
    rd_req: Tgint64;
    rd_bytes: Tgint64;
    wr_req: Tgint64;
    wr_bytes: Tgint64;
    errs: Tgint64;
  end;

  PGVirDomainDiskPrivate = type Pointer;

  PGVirDomainDisk = ^TGVirDomainDisk;
  TGVirDomainDisk = record
    parent: TGVirDomainDevice;
    priv: PGVirDomainDiskPrivate;
  end;

  PGVirDomainDiskClass = ^TGVirDomainDiskClass;
  TGVirDomainDiskClass = record
    parent_class: TGVirDomainDeviceClass;
    padding: array[0..19] of Tgpointer;
  end;


function gvir_domain_disk_get_type: TGType; cdecl; external libvirtgobject;
function gvir_domain_disk_stats_get_type: TGType; cdecl; external libvirtgobject;
function gvir_domain_disk_get_stats(self: PGVirDomainDisk; err: PPGError): PGVirDomainDiskStats; cdecl; external libvirtgobject;
function gvir_domain_disk_resize(self: PGVirDomainDisk; size: Tguint64; flags: Tguint; err: PPGError): Tgboolean; cdecl; external libvirtgobject;

// === Konventiert am: 18-10-26 19:32:33 ===

function GVIR_TYPE_DOMAIN_DISK: TGType;
function GVIR_DOMAIN_DISK(obj: Pointer): PGVirDomainDisk;
function GVIR_DOMAIN_DISK_CLASS(klass: Pointer): PGVirDomainDiskClass;
function GVIR_IS_DOMAIN_DISK(obj: Pointer): Tgboolean;
function GVIR_IS_DOMAIN_DISK_CLASS(klass: Pointer): Tgboolean;
function GVIR_DOMAIN_DISK_GET_CLASS(obj: Pointer): PGVirDomainDiskClass;

function GVIR_TYPE_DOMAIN_DISK_STATS: TGType;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_TYPE_DOMAIN_DISK: TGType;
begin
  GVIR_TYPE_DOMAIN_DISK := gvir_domain_disk_get_type;
end;

function GVIR_DOMAIN_DISK(obj: Pointer): PGVirDomainDisk;
begin
  Result := PGVirDomainDisk(g_type_check_instance_cast(obj, GVIR_TYPE_DOMAIN_DISK));
end;

function GVIR_DOMAIN_DISK_CLASS(klass: Pointer): PGVirDomainDiskClass;
begin
  Result := PGVirDomainDiskClass(g_type_check_class_cast(klass, GVIR_TYPE_DOMAIN_DISK));
end;

function GVIR_IS_DOMAIN_DISK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_TYPE_DOMAIN_DISK);
end;

function GVIR_IS_DOMAIN_DISK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_TYPE_DOMAIN_DISK);
end;

function GVIR_DOMAIN_DISK_GET_CLASS(obj: Pointer): PGVirDomainDiskClass;
begin
  Result := PGVirDomainDiskClass(PGTypeInstance(obj)^.g_class);
end;


function GVIR_TYPE_DOMAIN_DISK_STATS: TGType;
begin
  GVIR_TYPE_DOMAIN_DISK_STATS := gvir_domain_disk_stats_get_type;
end;


{$ENDIF read_implementation}
