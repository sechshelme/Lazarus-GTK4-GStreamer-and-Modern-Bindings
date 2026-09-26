unit atspi_application;

interface

uses
  fp_glib2, fp_atspi;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAtspiApplication = ^TAtspiApplication;
  TAtspiApplication = record
    parent: TGObject;
    hash: PGHashTable;
    bus_name: pchar;
    bus: PDBusConnection;
    root: PAtspiAccessible;
    cache: TAtspiCache;
    toolkit_name: Pgchar;
    toolkit_version: Pgchar;
    atspi_version: Pgchar;
    time_added: Ttimeval;
  end;

  PAtspiApplicationClass = ^TAtspiApplicationClass;
  TAtspiApplicationClass = record
    parent_class: TGObjectClass;
  end;

function _atspi_application_new(bus_name: pchar): PAtspiApplication; cdecl; external libatspi;
function atspi_application_get_type: TGType; cdecl; external libatspi;

// === Konventiert am: 26-9-26 12:56:45 ===

function ATSPI_TYPE_APPLICATION: TGType;
function ATSPI_APPLICATION(obj: Pointer): PAtspiApplication;
function ATSPI_APPLICATION_CLASS(klass: Pointer): PAtspiAccessibleClass;
function ATSPI_IS_APPLICATION(obj: Pointer): Tgboolean;
function ATSPI_IS_APPLICATION_CLASS(klass: Pointer): Tgboolean;
function ATSPI_APPLICATION_GET_CLASS(obj: Pointer): PAtspiAccessibleClass;

implementation

function ATSPI_TYPE_APPLICATION: TGType;
begin
  ATSPI_TYPE_APPLICATION := atspi_application_get_type;
end;

function ATSPI_APPLICATION(obj: Pointer): PAtspiApplication;
begin
  Result := PAtspiApplication(g_type_check_instance_cast(obj, ATSPI_TYPE_APPLICATION));
end;

function ATSPI_APPLICATION_CLASS(klass: Pointer): PAtspiAccessibleClass;
begin
  Result := PAtspiAccessibleClass(g_type_check_class_cast(klass, ATSPI_TYPE_APPLICATION));
end;

function ATSPI_IS_APPLICATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ATSPI_TYPE_APPLICATION);
end;

function ATSPI_IS_APPLICATION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ATSPI_TYPE_APPLICATION);
end;

function ATSPI_APPLICATION_GET_CLASS(obj: Pointer): PAtspiAccessibleClass;
begin
  Result := PAtspiAccessibleClass(PGTypeInstance(obj)^.g_class);
end;



end.
