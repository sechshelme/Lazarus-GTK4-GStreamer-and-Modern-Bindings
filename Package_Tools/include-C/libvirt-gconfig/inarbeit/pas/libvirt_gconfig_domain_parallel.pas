unit libvirt_gconfig_domain_parallel;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_domain_chardev;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigDomainParallelPrivate = type Pointer;

  PGVirConfigDomainParallel = ^TGVirConfigDomainParallel;
  TGVirConfigDomainParallel = record
    parent: TGVirConfigDomainChardev;
    priv: PGVirConfigDomainParallelPrivate;
  end;

  PGVirConfigDomainParallelClass = ^TGVirConfigDomainParallelClass;
  TGVirConfigDomainParallelClass = record
    parent_class: TGVirConfigDomainChardevClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_parallel_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_parallel_new: PGVirConfigDomainParallel; cdecl; external libvirtgconfig;
function gvir_config_domain_parallel_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainParallel; cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:47:16 ===

function GVIR_CONFIG_TYPE_DOMAIN_PARALLEL: TGType;
function GVIR_CONFIG_DOMAIN_PARALLEL(obj: Pointer): PGVirConfigDomainParallel;
function GVIR_CONFIG_DOMAIN_PARALLEL_CLASS(klass: Pointer): PGVirConfigDomainParallelClass;
function GVIR_CONFIG_IS_DOMAIN_PARALLEL(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_PARALLEL_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_PARALLEL_GET_CLASS(obj: Pointer): PGVirConfigDomainParallelClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_PARALLEL: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_PARALLEL := gvir_config_domain_parallel_get_type;
end;

function GVIR_CONFIG_DOMAIN_PARALLEL(obj: Pointer): PGVirConfigDomainParallel;
begin
  Result := PGVirConfigDomainParallel(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_PARALLEL));
end;

function GVIR_CONFIG_DOMAIN_PARALLEL_CLASS(klass: Pointer): PGVirConfigDomainParallelClass;
begin
  Result := PGVirConfigDomainParallelClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_PARALLEL));
end;

function GVIR_CONFIG_IS_DOMAIN_PARALLEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_PARALLEL);
end;

function GVIR_CONFIG_IS_DOMAIN_PARALLEL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_PARALLEL);
end;

function GVIR_CONFIG_DOMAIN_PARALLEL_GET_CLASS(obj: Pointer): PGVirConfigDomainParallelClass;
begin
  Result := PGVirConfigDomainParallelClass(PGTypeInstance(obj)^.g_class);
end;



end.
