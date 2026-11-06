unit obj;

interface

uses
  fp_isl, printer_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pisl_obj_vtable = ^Tisl_obj_vtable;
  Tisl_obj_vtable = record
    copy: function(v1: pointer): pointer; cdecl;
    add: function(v1: pointer; v2: pointer): pointer; cdecl;
    print: function(p: Pisl_printer; v: pointer): Pisl_printer; cdecl;
    free: procedure(v: pointer); cdecl;
  end;

type
  Pisl_obj_type = ^Tisl_obj_type;
  Tisl_obj_type = Pisl_obj_vtable;

var
  isl_obj_none_vtable: Tisl_obj_vtable; cvar;external libisl;

function isl_obj_none: Pisl_obj_vtable;

var
  isl_obj_int_vtable: Tisl_obj_vtable; cvar;external libisl;

function isl_obj_int: Pisl_obj_vtable;

var
  isl_obj_val_vtable: Tisl_obj_vtable; cvar;external libisl;

function isl_obj_val: Pisl_obj_vtable;

var
  isl_obj_set_vtable: Tisl_obj_vtable; cvar;external libisl;

function isl_obj_set: Pisl_obj_vtable;

var
  isl_obj_union_set_vtable: Tisl_obj_vtable; cvar;external libisl;

function isl_obj_union_set: Pisl_obj_vtable;

var
  isl_obj_map_vtable: Tisl_obj_vtable; cvar;external libisl;

function isl_obj_map: Pisl_obj_vtable;

var
  isl_obj_union_map_vtable: Tisl_obj_vtable; cvar;external libisl;

function isl_obj_union_map: Pisl_obj_vtable;

var
  isl_obj_pw_multi_aff_vtable: Tisl_obj_vtable; cvar;external libisl;

function isl_obj_pw_multi_aff: Pisl_obj_vtable;

var
  isl_obj_pw_qpolynomial_vtable: Tisl_obj_vtable; cvar;external libisl;

function isl_obj_pw_qpolynomial: Pisl_obj_vtable;

var
  isl_obj_union_pw_qpolynomial_vtable: Tisl_obj_vtable; cvar;external libisl;

function isl_obj_union_pw_qpolynomial: Pisl_obj_vtable;

var
  isl_obj_pw_qpolynomial_fold_vtable: Tisl_obj_vtable; cvar;external libisl;

function isl_obj_pw_qpolynomial_fold: Pisl_obj_vtable;

var
  isl_obj_union_pw_qpolynomial_fold_vtable: Tisl_obj_vtable; cvar;external libisl;

function isl_obj_union_pw_qpolynomial_fold: Pisl_obj_vtable;

var
  isl_obj_schedule_vtable: Tisl_obj_vtable; cvar;external libisl;

function isl_obj_schedule: Pisl_obj_vtable;

type
  Pisl_obj = ^Tisl_obj;
  Tisl_obj = record
    _type: Tisl_obj_type;
    v: pointer;
  end;

  // === Konventiert am: 5-11-26 15:45:06 ===


implementation


function isl_obj_none: Pisl_obj_vtable;
begin
  isl_obj_none := @(isl_obj_none_vtable);
end;

function isl_obj_int: Pisl_obj_vtable;
begin
  isl_obj_int := @(isl_obj_int_vtable);
end;

function isl_obj_val: Pisl_obj_vtable;
begin
  isl_obj_val := @(isl_obj_val_vtable);
end;

function isl_obj_set: Pisl_obj_vtable;
begin
  isl_obj_set := @(isl_obj_set_vtable);
end;

function isl_obj_union_set: Pisl_obj_vtable;
begin
  isl_obj_union_set := @(isl_obj_union_set_vtable);
end;

function isl_obj_map: Pisl_obj_vtable;
begin
  isl_obj_map := @(isl_obj_map_vtable);
end;

function isl_obj_union_map: Pisl_obj_vtable;
begin
  isl_obj_union_map := @(isl_obj_union_map_vtable);
end;

function isl_obj_pw_multi_aff: Pisl_obj_vtable;
begin
  isl_obj_pw_multi_aff := @(isl_obj_pw_multi_aff_vtable);
end;

function isl_obj_pw_qpolynomial: Pisl_obj_vtable;
begin
  isl_obj_pw_qpolynomial := @(isl_obj_pw_qpolynomial_vtable);
end;

function isl_obj_union_pw_qpolynomial: Pisl_obj_vtable;
begin
  isl_obj_union_pw_qpolynomial := @(isl_obj_union_pw_qpolynomial_vtable);
end;

function isl_obj_pw_qpolynomial_fold: Pisl_obj_vtable;
begin
  isl_obj_pw_qpolynomial_fold := @(isl_obj_pw_qpolynomial_fold_vtable);
end;

function isl_obj_union_pw_qpolynomial_fold: Pisl_obj_vtable;
begin
  isl_obj_union_pw_qpolynomial_fold := @(isl_obj_union_pw_qpolynomial_fold_vtable);
end;

function isl_obj_schedule: Pisl_obj_vtable;
begin
  isl_obj_schedule := @(isl_obj_schedule_vtable);
end;


end.
