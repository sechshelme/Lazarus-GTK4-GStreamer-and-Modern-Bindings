unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, FileUtil;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}


function Convert_ISL_DECLARE_MULTI(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result:=
    'isl_ctx *isl_multi_'+BASE+'_get_ctx(					'#10+
    '	 isl_multi_'+BASE+' *multi);				'#10+
    'extern								'#10+
    ' isl_space *isl_multi_'+BASE+'_get_space(			'#10+
    '	 isl_multi_'+BASE+' *multi);				'#10+
    ' isl_space *isl_multi_'+BASE+'_get_domain_space(		'#10+
    '	 isl_multi_'+BASE+' *multi);				'#10+
    'extern								'#10+
    ' isl_'+BASE+'_list *isl_multi_'+BASE+'_get_list(		'#10+
    '	 isl_multi_'+BASE+' *multi);				'#10+
    '							'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_from_'+BASE+'_list(	'#10+
    '	 isl_space *space,  isl_'+BASE+'_list *list); '#10+
    'extern								'#10+
    ' isl_multi_'+BASE+' *isl_space_multi_'+BASE+'(			'#10+
    '	 isl_space *space,  isl_'+BASE+'_list *list); '#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_copy(			'#10+
    '	 isl_multi_'+BASE+' *multi);				'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_free(			'#10+
    '	 isl_multi_'+BASE+' *multi);				'#10+
    'extern								'#10+
    'isl_bool isl_multi_'+BASE+'_plain_is_equal(				'#10+
    '	 isl_multi_'+BASE+' *multi1,				'#10+
    '	 isl_multi_'+BASE+' *multi2);				'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_reset_user(		'#10+
    '	 isl_multi_'+BASE+' *multi);				'#10+
    'extern								'#10+
    'isl_size isl_multi_'+BASE+'_size( isl_multi_'+BASE+' *multi);	'#10+
    'extern								'#10+
    ' isl_'+BASE+' *isl_multi_'+BASE+'_get_at(			'#10+
    '	 isl_multi_'+BASE+' *multi, int pos);			'#10+
    ' isl_'+BASE+' *isl_multi_'+BASE+'_get_'+BASE+'(			'#10+
    '	 isl_multi_'+BASE+' *multi, int pos);			'#10+
    'extern								'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_set_at(			'#10+
    '	 isl_multi_'+BASE+' *multi, int pos,			'#10+
    '	 isl_'+BASE+' *el);					'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_set_'+BASE+'(		'#10+
    '	 isl_multi_'+BASE+' *multi, int pos,			'#10+
    '	 isl_'+BASE+' *el);					'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_range_splice(		'#10+
    '	 isl_multi_'+BASE+' *multi1, unsigned pos,		'#10+
    '	 isl_multi_'+BASE+' *multi2);				'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_flatten_range(		'#10+
    '	 isl_multi_'+BASE+' *multi);				'#10+
    'extern								'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_flat_range_product(	'#10+
    '	 isl_multi_'+BASE+' *multi1,				'#10+
    '	 isl_multi_'+BASE+' *multi2);				'#10+
    'extern								'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_range_product(		'#10+
    '	 isl_multi_'+BASE+' *multi1,				'#10+
    '	 isl_multi_'+BASE+' *multi2);				'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_factor_range(		'#10+
    '	 isl_multi_'+BASE+' *multi);				'#10+
    'isl_bool isl_multi_'+BASE+'_range_is_wrapping(				'#10+
    '	 isl_multi_'+BASE+' *multi);				'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_range_factor_domain(	'#10+
    '	 isl_multi_'+BASE+' *multi);				'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_range_factor_range(	'#10+
    '	 isl_multi_'+BASE+' *multi);				'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_align_params(		'#10+
    '	 isl_multi_'+BASE+' *multi,				'#10+
    '	 isl_space *model);					'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_from_range(		'#10+
    '	 isl_multi_'+BASE+' *multi);               ';
  end else begin
    Result := s;
  end;
end;

function Convert_ISL_DECLARE_MULTI_IDENTITY(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_IDENTITY(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result:=
   ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_identity_multi_'+BASE+'(	'#10+
   '	 isl_multi_'+BASE+' *multi);				'#10+
   ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_identity(		'#10+
   '	 isl_space *space);					'#10+
   '								'#10+
   ' isl_multi_'+BASE+' *						'#10+
   'isl_multi_'+BASE+'_identity_on_domain_space(				'#10+
   '	 isl_space *space);					'#10+
   'extern								'#10+
   ' isl_multi_'+BASE+' *						'#10+
   'isl_space_identity_multi_'+BASE+'_on_domain(				'#10+
   '	 isl_space *space);   ';
  end else begin
    Result := s;
  end;
end;

function Convert_ISL_DECLARE_MULTI_CMP(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_CMP(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result:=
    'int isl_multi_'+BASE+'_plain_cmp( isl_multi_'+BASE+' *multi1,	'#10+
    '	 isl_multi_'+BASE+' *multi2);';
  end else begin
    Result := s;
  end;
end;


function Convert_ISL_DECLARE_MULTI_ARITH(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_ARITH(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result:=
   ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_scale_val(		'#10+
   '	 isl_multi_'+BASE+' *multi,  isl_val *v);	'#10+
   '								'#10+
   ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_scale_down_val(		'#10+
   '	 isl_multi_'+BASE+' *multi,  isl_val *v);	'#10+
   '								'#10+
   ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_scale_multi_val(	'#10+
   '	 isl_multi_'+BASE+' *multi,				'#10+
   '	 isl_multi_val *mv);					'#10+
   '								'#10+
   ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_scale_down_multi_val(	'#10+
   '	 isl_multi_'+BASE+' *multi,				'#10+
   '	 isl_multi_val *mv);					'#10+
   ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_mod_multi_val(		'#10+
   '	 isl_multi_'+BASE+' *multi,				'#10+
   '	 isl_multi_val *mv);					'#10+
   'extern								'#10+
   ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_add(			'#10+
   '	 isl_multi_'+BASE+' *multi1,				'#10+
   '	 isl_multi_'+BASE+' *multi2);				'#10+
   'extern								'#10+
   ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_sub(			'#10+
   '	 isl_multi_'+BASE+' *multi1,				'#10+
   '	 isl_multi_'+BASE+' *multi2);				'#10+
   'extern								'#10+
   ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_neg(		 	'#10+
   '	 isl_multi_'+BASE+' *multi);      ';
  end else begin
    Result := s;
  end;
end;


function Convert_ISL_DECLARE_MULTI_MIN_MAX(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_MIN_MAX(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result:=
    'extern								'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_min(			'#10+
    '	 isl_multi_'+BASE+' *multi1,				'#10+
    '	 isl_multi_'+BASE+' *multi2);				'#10+
    'extern								'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_max(			'#10+
    '	 isl_multi_'+BASE+' *multi1,				'#10+
    '	 isl_multi_'+BASE+' *multi2);  ';

  end else begin
    Result := s;
  end;
end;


function Convert_ISL_DECLARE_MULTI_ADD_CONSTANT(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_ADD_CONSTANT(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result:=
     'isl_multi_'+BASE+' *isl_multi_'+BASE+'_add_constant_val(	'#10+
    '	 isl_multi_'+BASE+' *mpa,  isl_val *v);	'#10+
    '								'#10+
     'isl_multi_'+BASE+' *isl_multi_'+BASE+'_add_constant_multi_val(	'#10+
    '	 isl_multi_'+BASE+' *mpa,  isl_multi_val *mv);';
  end else begin
    Result := s;
  end;
end;


function Convert_ISL_DECLARE_MULTI_ZERO(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_ZERO(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result:=
    'extern								'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_zero(			'#10+
    '	 isl_space *space);					'#10+
    'extern								'#10+
    ' isl_multi_'+BASE+' *isl_space_zero_multi_'+BASE+'(		'#10+
    '	 isl_space *space);';
  end else begin
    Result := s;
  end;
end;


function Convert_ISL_DECLARE_MULTI_NAN(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_NAN(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result:=
    'extern								'#10+
    'isl_bool isl_multi_'+BASE+'_involves_nan(				'#10+
    '	 isl_multi_'+BASE+' *multi);       ';
  end else begin
    Result := s;
  end;
end;


function Convert_ISL_DECLARE_MULTI_DROP_DIMS(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_DROP_DIMS(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result:=
    'isl_size isl_multi_'+BASE+'_dim( isl_multi_'+BASE+' *multi,	'#10+
    '	enum isl_dim_type type);					'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_drop_dims(		'#10+
    '	 isl_multi_'+BASE+' *multi, enum isl_dim_type type,	'#10+
    '	unsigned first, unsigned n);';
  end else begin
    Result := s;
  end;
end;


function Convert_ISL_DECLARE_MULTI_DIMS(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_IDENTITY(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result:=
//    ISL_DECLARE_MULTI_DROP_DIMS(BASE)
'isl_size isl_multi_'+BASE+'_dim( isl_multi_'+BASE+' *multi,	'#10+
'	enum isl_dim_type type);					'#10+
' isl_multi_'+BASE+' *isl_multi_'+BASE+'_drop_dims(		'#10+
'	 isl_multi_'+BASE+' *multi, enum isl_dim_type type,	'#10+
'	unsigned first, unsigned n);'#10+

    'isl_bool isl_multi_'+BASE+'_involves_dims(				'#10+
    '	 isl_multi_'+BASE+' *multi, enum isl_dim_type type,	'#10+
    '	unsigned first, unsigned n);					'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_insert_dims(		'#10+
    '	 isl_multi_'+BASE+' *multi, enum isl_dim_type type,	'#10+
    '	unsigned first, unsigned n);					'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_add_dims(		'#10+
    '	 isl_multi_'+BASE+' *multi, enum isl_dim_type type,	'#10+
    '	unsigned n);							'#10+
    ' isl_multi_'+BASE+' *						'#10+
    'isl_multi_'+BASE+'_project_domain_on_params(				'#10+
    '	 isl_multi_'+BASE+' *multi);           ';
  end else begin
    Result := s;
  end;
end;


function Convert_ISL_DECLARE_MULTI_INSERT_DOMAIN(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_INSERT_DOMAIN(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result:=
    'extern								'#10+
    ' isl_multi_'+BASE+' *						'#10+
    'isl_multi_'+BASE+'_insert_domain( isl_multi_'+BASE+' *multi,	'#10+
    '	 isl_space *domain);     ';
  end else begin
    Result := s;
  end;
end;


function Convert_ISL_DECLARE_MULTI_LOCALS(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_LOCALS(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result:=
    'extern								'#10+
    'isl_bool isl_multi_'+BASE+'_involves_locals(				'#10+
    '	 isl_multi_'+BASE+' *multi); ';
  end else begin
    Result := s;
  end;
end;

function Convert_ISL_DECLARE_MULTI_DIM_ID(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_DIM_ID(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result:=
    'int isl_multi_'+BASE+'_find_dim_by_name(				'#10+
    '	 isl_multi_'+BASE+' *multi,				'#10+
    '	enum isl_dim_type type, const char *name);			'#10+
    'int isl_multi_'+BASE+'_find_dim_by_id(					'#10+
    '	 isl_multi_'+BASE+' *multi, enum isl_dim_type type,	'#10+
    '	 isl_id *id);						'#10+
    ' isl_id *isl_multi_'+BASE+'_get_dim_id(			'#10+
    '	 isl_multi_'+BASE+' *multi,				'#10+
    '	enum isl_dim_type type, unsigned pos);				'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_set_dim_name(		'#10+
    '	 isl_multi_'+BASE+' *multi,				'#10+
    '	enum isl_dim_type type, unsigned pos, const char *s);		'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_set_dim_id(		'#10+
    '	 isl_multi_'+BASE+' *multi,				'#10+
    '	enum isl_dim_type type, unsigned pos,  isl_id *id);   ';
  end else begin
    Result := s;
  end;
end;

function Convert_ISL_DECLARE_MULTI_TUPLE_ID(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_TUPLE_ID(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result:=
    'const char *isl_multi_'+BASE+'_get_tuple_name(				'#10+
    '	 isl_multi_'+BASE+' *multi, enum isl_dim_type type);	'#10+
    'extern								'#10+
    'isl_bool isl_multi_'+BASE+'_has_range_tuple_id(				'#10+
    '	 isl_multi_'+BASE+' *multi);				'#10+
    'isl_bool isl_multi_'+BASE+'_has_tuple_id(				'#10+
    '	 isl_multi_'+BASE+' *multi, enum isl_dim_type type);	'#10+
    'extern								'#10+
    ' isl_id *isl_multi_'+BASE+'_get_range_tuple_id(		'#10+
    '	 isl_multi_'+BASE+' *multi);				'#10+
    ' isl_id *isl_multi_'+BASE+'_get_tuple_id(			'#10+
    '	 isl_multi_'+BASE+' *multi, enum isl_dim_type type);	'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_set_tuple_name(		'#10+
    '	 isl_multi_'+BASE+' *multi,				'#10+
    '	enum isl_dim_type type, const char *s);				'#10+
    '								'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_set_range_tuple_id(	'#10+
    '	 isl_multi_'+BASE+' *multi,   isl_id *id);	'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_set_tuple_id(		'#10+
    '	 isl_multi_'+BASE+' *multi,				'#10+
    '	enum isl_dim_type type,  isl_id *id);			'#10+
    'extern								'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_reset_range_tuple_id(	'#10+
    '	 isl_multi_'+BASE+' *multi);				'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_reset_tuple_id(		'#10+
    '	 isl_multi_'+BASE+' *multi, enum isl_dim_type type);    ';
  end else begin
    Result := s;
  end;
end;

function Convert_ISL_DECLARE_MULTI_WITH_DOMAIN(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_WITH_DOMAIN(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result:=
    'extern								'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_product(		'#10+
    '	 isl_multi_'+BASE+' *multi1,				'#10+
    '	 isl_multi_'+BASE+' *multi2);				'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_splice(			'#10+
    '	 isl_multi_'+BASE+' *multi1, unsigned in_pos,		'#10+
    '	unsigned out_pos,  isl_multi_'+BASE+' *multi2);  ';
  end else begin
    Result := s;
  end;
end;

function Convert_ISL_DECLARE_MULTI_BIND_DOMAIN(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_BIND_DOMAIN(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result:=
    'extern								'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_bind_domain(		'#10+
    '	 isl_multi_'+BASE+' *multi,				'#10+
    '	 isl_multi_id *tuple);				'#10+
    'extern								'#10+
    ' isl_multi_'+BASE+' *						'#10+
    'isl_multi_'+BASE+'_bind_domain_wrapped_domain(				'#10+
    '	 isl_multi_'+BASE+' *multi,				'#10+
    '	 isl_multi_id *tuple);     ';
  end else begin
    Result := s;
  end;
end;

function Convert_ISL_DECLARE_MULTI_UNBIND_PARAMS(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_UNBIND_PARAMS(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result:=
    'extern								'#10+
    ' isl_multi_'+BASE+' *						'#10+
    'isl_multi_'+BASE+'_unbind_params_insert_domain(				'#10+
    '	 isl_multi_'+BASE+' *multi,				'#10+
    '	 isl_multi_id *domain);';
  end else begin
    Result := s;
  end;
end;


function Convert_ISL_DECLARE_MULTI_PARAM(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_PARAM(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result:=
    'isl_bool isl_multi_'+BASE+'_involves_param_id(				'#10+
    '	 isl_multi_'+BASE+' *multi,  isl_id *id);	'#10+
    '								'#10+
    'isl_bool isl_multi_'+BASE+'_involves_param_id_list(			'#10+
    '	 isl_multi_'+BASE+' *multi,				'#10+
    '	 isl_id_list *list);    ';
  end else begin
    Result := s;
  end;
end;


function Convert_ISL_DECLARE_MULTI_DOMAIN_REVERSE(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_DOMAIN_REVERSE(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result:=
    'extern								'#10+
    ' isl_multi_'+BASE+' *isl_multi_'+BASE+'_domain_reverse(		'#10+
    '	 isl_multi_'+BASE+' *multi);';
  end else begin
    Result := s;
  end;
end;



procedure TForm1.Button1Click(Sender: TObject);
var
  slFile, slHeader: TStringList;
  i, j, v, a: integer;
  s: string;
begin
  Memo1.Clear;
  slFile := FindAllFiles('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Package_Tools/include-C/isl', '*.h', True);
  Memo1.Lines := slFile;

  for i := 0 to slFile.Count - 1 do begin
    slHeader := TStringList.Create;
    slHeader.LoadFromFile(slFile[i]);

    WriteLn(i, '/', slFile.Count - 1, '         ', slFile[i]);


    for j := 0 to slHeader.Count - 1 do begin
      slHeader[j] := StringReplace(slHeader[j], 'extern "C" {', '', [rfReplaceAll]);

      slHeader[j] := StringReplace(slHeader[j], '__isl_export', 'extern', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], '__isl_overload', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], '__isl_give', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], '__isl_null', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], '__isl_take', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], '__isl_keep', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], '__isl_constructor', '', [rfReplaceAll]);


// Convert_ISL_DECLARE_MULTI(slHeader[j]);
      slHeader[j] := Convert_ISL_DECLARE_MULTI(slHeader[j]);

      slHeader[j] := Convert_ISL_DECLARE_MULTI_IDENTITY(slHeader[j]);
      slHeader[j] := Convert_ISL_DECLARE_MULTI_CMP(slHeader[j]);
      slHeader[j] := Convert_ISL_DECLARE_MULTI_ARITH(slHeader[j]);
      slHeader[j] := Convert_ISL_DECLARE_MULTI_MIN_MAX(slHeader[j]);
      slHeader[j] := Convert_ISL_DECLARE_MULTI_ADD_CONSTANT(slHeader[j]);
      slHeader[j] := Convert_ISL_DECLARE_MULTI_ZERO(slHeader[j]);
      slHeader[j] := Convert_ISL_DECLARE_MULTI_NAN(slHeader[j]);
      slHeader[j] := Convert_ISL_DECLARE_MULTI_DROP_DIMS(slHeader[j]);
      slHeader[j] := Convert_ISL_DECLARE_MULTI_DIMS(slHeader[j]);
      slHeader[j] := Convert_ISL_DECLARE_MULTI_INSERT_DOMAIN(slHeader[j]);
      slHeader[j] := Convert_ISL_DECLARE_MULTI_LOCALS(slHeader[j]);
      slHeader[j] := Convert_ISL_DECLARE_MULTI_DIM_ID(slHeader[j]);
      slHeader[j] := Convert_ISL_DECLARE_MULTI_TUPLE_ID(slHeader[j]);
      slHeader[j] := Convert_ISL_DECLARE_MULTI_WITH_DOMAIN(slHeader[j]);
      slHeader[j] := Convert_ISL_DECLARE_MULTI_BIND_DOMAIN(slHeader[j]);
      slHeader[j] := Convert_ISL_DECLARE_MULTI_UNBIND_PARAMS(slHeader[j]);
      slHeader[j] := Convert_ISL_DECLARE_MULTI_PARAM(slHeader[j]);
      slHeader[j] := Convert_ISL_DECLARE_MULTI_DOMAIN_REVERSE(slHeader[j]);

    end;
    slHeader.SaveToFile(slFile[i]);
    slHeader.Free;
  end;

  slFile.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Height := 1000;
  Width := 1000;
end;


end.
