unit atspi_object;

interface

uses
  fp_glib2, fp_atspi;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAtspiObject = ^TAtspiObject;
  TAtspiObject = record
    parent: TGObject;
    app: PAtspiApplication;
    path: pchar;
  end;

  PAtspiObjectClass = ^TAtspiObjectClass;
  TAtspiObjectClass = record
    parent_class: TGObjectClass;
  end;

function atspi_object_get_type: TGType; cdecl; external libatspi;

// === Konventiert am: 26-9-26 13:15:58 ===

function ATSPI_TYPE_OBJECT: TGType;
function ATSPI_OBJECT(obj: Pointer): PAtspiObject;
function ATSPI_OBJECT_CLASS(klass: Pointer): PAtspiObjectClass;
function ATSPI_IS_OBJECT(obj: Pointer): Tgboolean;
function ATSPI_IS_OBJECT_CLASS(klass: Pointer): Tgboolean;
function ATSPI_OBJECT_GET_CLASS(obj: Pointer): PAtspiObjectClass;

implementation

function ATSPI_TYPE_OBJECT: TGType;
begin
  ATSPI_TYPE_OBJECT := atspi_object_get_type;
end;

function ATSPI_OBJECT(obj: Pointer): PAtspiObject;
begin
  Result := PAtspiObject(g_type_check_instance_cast(obj, ATSPI_TYPE_OBJECT));
end;

function ATSPI_OBJECT_CLASS(klass: Pointer): PAtspiObjectClass;
begin
  Result := PAtspiObjectClass(g_type_check_class_cast(klass, ATSPI_TYPE_OBJECT));
end;

function ATSPI_IS_OBJECT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ATSPI_TYPE_OBJECT);
end;

function ATSPI_IS_OBJECT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ATSPI_TYPE_OBJECT);
end;

function ATSPI_OBJECT_GET_CLASS(obj: Pointer): PAtspiObjectClass;
begin
  Result := PAtspiObjectClass(PGTypeInstance(obj)^.g_class);
end;



end.
