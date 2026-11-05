
unit obj;
interface

{
  Automatically converted by H2Pas 1.0.0 from obj.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    obj.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pisl_obj  = ^isl_obj;
Pisl_obj_type  = ^isl_obj_type;
Pisl_obj_vtable  = ^isl_obj_vtable;
Pisl_printer  = ^isl_printer;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ISL_OBJ_H}
{$define ISL_OBJ_H}
{$include <isl/set_type.h>}
{$include <isl/map_type.h>}
{$include <isl/union_set_type.h>}
{$include <isl/union_map_type.h>}
{$include <isl/polynomial_type.h>}
{$include <isl/printer.h>}
{$if defined(__cplusplus)}
{$endif}
type
  Pisl_obj_vtable = ^Tisl_obj_vtable;
  Tisl_obj_vtable = record
      copy : function (v1:pointer):pointer;cdecl;
      add : function (v1:pointer; v2:pointer):pointer;cdecl;
      print : function (p:Pisl_printer; v:pointer):Pisl_printer;cdecl;
      free : procedure (v:pointer);cdecl;
    end;


  Pisl_obj_type = ^Tisl_obj_type;
  Tisl_obj_type = Pisl_obj_vtable;
  var
    isl_obj_none_vtable : Tisl_obj_vtable;cvar;external;

{ was #define dname def_expr }
function isl_obj_none : longint; { return type might be wrong }

  var
    isl_obj_int_vtable : Tisl_obj_vtable;cvar;external;

{ was #define dname def_expr }
function isl_obj_int : longint; { return type might be wrong }

  var
    isl_obj_val_vtable : Tisl_obj_vtable;cvar;external;

{ was #define dname def_expr }
function isl_obj_val : longint; { return type might be wrong }

  var
    isl_obj_set_vtable : Tisl_obj_vtable;cvar;external;

{ was #define dname def_expr }
function isl_obj_set : longint; { return type might be wrong }

  var
    isl_obj_union_set_vtable : Tisl_obj_vtable;cvar;external;

{ was #define dname def_expr }
function isl_obj_union_set : longint; { return type might be wrong }

  var
    isl_obj_map_vtable : Tisl_obj_vtable;cvar;external;

{ was #define dname def_expr }
function isl_obj_map : longint; { return type might be wrong }

  var
    isl_obj_union_map_vtable : Tisl_obj_vtable;cvar;external;

{ was #define dname def_expr }
function isl_obj_union_map : longint; { return type might be wrong }

  var
    isl_obj_pw_multi_aff_vtable : Tisl_obj_vtable;cvar;external;

{ was #define dname def_expr }
function isl_obj_pw_multi_aff : longint; { return type might be wrong }

  var
    isl_obj_pw_qpolynomial_vtable : Tisl_obj_vtable;cvar;external;

{ was #define dname def_expr }
function isl_obj_pw_qpolynomial : longint; { return type might be wrong }

  var
    isl_obj_union_pw_qpolynomial_vtable : Tisl_obj_vtable;cvar;external;

{ was #define dname def_expr }
function isl_obj_union_pw_qpolynomial : longint; { return type might be wrong }

  var
    isl_obj_pw_qpolynomial_fold_vtable : Tisl_obj_vtable;cvar;external;

{ was #define dname def_expr }
function isl_obj_pw_qpolynomial_fold : longint; { return type might be wrong }

  var
    isl_obj_union_pw_qpolynomial_fold_vtable : Tisl_obj_vtable;cvar;external;

{ was #define dname def_expr }
function isl_obj_union_pw_qpolynomial_fold : longint; { return type might be wrong }

  var
    isl_obj_schedule_vtable : Tisl_obj_vtable;cvar;external;

{ was #define dname def_expr }
function isl_obj_schedule : longint; { return type might be wrong }

type
  Pisl_obj = ^Tisl_obj;
  Tisl_obj = record
      _type : Tisl_obj_type;
      v : pointer;
    end;

{$endif}

implementation

{ was #define dname def_expr }
function isl_obj_none : longint; { return type might be wrong }
  begin
    isl_obj_none:=@(isl_obj_none_vtable);
  end;

{ was #define dname def_expr }
function isl_obj_int : longint; { return type might be wrong }
  begin
    isl_obj_int:=@(isl_obj_int_vtable);
  end;

{ was #define dname def_expr }
function isl_obj_val : longint; { return type might be wrong }
  begin
    isl_obj_val:=@(isl_obj_val_vtable);
  end;

{ was #define dname def_expr }
function isl_obj_set : longint; { return type might be wrong }
  begin
    isl_obj_set:=@(isl_obj_set_vtable);
  end;

{ was #define dname def_expr }
function isl_obj_union_set : longint; { return type might be wrong }
  begin
    isl_obj_union_set:=@(isl_obj_union_set_vtable);
  end;

{ was #define dname def_expr }
function isl_obj_map : longint; { return type might be wrong }
  begin
    isl_obj_map:=@(isl_obj_map_vtable);
  end;

{ was #define dname def_expr }
function isl_obj_union_map : longint; { return type might be wrong }
  begin
    isl_obj_union_map:=@(isl_obj_union_map_vtable);
  end;

{ was #define dname def_expr }
function isl_obj_pw_multi_aff : longint; { return type might be wrong }
  begin
    isl_obj_pw_multi_aff:=@(isl_obj_pw_multi_aff_vtable);
  end;

{ was #define dname def_expr }
function isl_obj_pw_qpolynomial : longint; { return type might be wrong }
  begin
    isl_obj_pw_qpolynomial:=@(isl_obj_pw_qpolynomial_vtable);
  end;

{ was #define dname def_expr }
function isl_obj_union_pw_qpolynomial : longint; { return type might be wrong }
  begin
    isl_obj_union_pw_qpolynomial:=@(isl_obj_union_pw_qpolynomial_vtable);
  end;

{ was #define dname def_expr }
function isl_obj_pw_qpolynomial_fold : longint; { return type might be wrong }
  begin
    isl_obj_pw_qpolynomial_fold:=@(isl_obj_pw_qpolynomial_fold_vtable);
  end;

{ was #define dname def_expr }
function isl_obj_union_pw_qpolynomial_fold : longint; { return type might be wrong }
  begin
    isl_obj_union_pw_qpolynomial_fold:=@(isl_obj_union_pw_qpolynomial_fold_vtable);
  end;

{ was #define dname def_expr }
function isl_obj_schedule : longint; { return type might be wrong }
  begin
    isl_obj_schedule:=@(isl_obj_schedule_vtable);
  end;


end.
