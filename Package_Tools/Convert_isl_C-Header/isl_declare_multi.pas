unit isl_declare_multi;

interface

uses
  Classes, SysUtils;

function Convert_ISL_DECLARE_MULTI(const s: string): string;

implementation


function ISL_DECLARE_MULTI(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];
    Result :=
      #10'isl_ctx *isl_multi_' + BASE + '_get_ctx(					'#10 +
      '	 isl_multi_' + BASE + ' *multi);				'#10 +
      'extern								'#10 +
      ' isl_space *isl_multi_' + BASE + '_get_space(			'#10 +
      '	 isl_multi_' + BASE + ' *multi);				'#10 +
      ' isl_space *isl_multi_' + BASE + '_get_domain_space(		'#10 +
      '	 isl_multi_' + BASE + ' *multi);				'#10 +
      'extern								'#10 +
      ' isl_' + BASE + '_list *isl_multi_' + BASE + '_get_list(		'#10 +
      '	 isl_multi_' + BASE + ' *multi);				'#10 +
      '							'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_from_' + BASE + '_list(	'#10 +
      '	 isl_space *space,  isl_' + BASE + '_list *list); '#10 +
      'extern								'#10 +
      ' isl_multi_' + BASE + ' *isl_space_multi_' + BASE + '(			'#10 +
      '	 isl_space *space,  isl_' + BASE + '_list *list); '#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_copy(			'#10 +
      '	 isl_multi_' + BASE + ' *multi);				'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_free(			'#10 +
      '	 isl_multi_' + BASE + ' *multi);				'#10 +
      'extern								'#10 +
      'isl_bool isl_multi_' + BASE + '_plain_is_equal(				'#10 +
      '	 isl_multi_' + BASE + ' *multi1,				'#10 +
      '	 isl_multi_' + BASE + ' *multi2);				'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_reset_user(		'#10 +
      '	 isl_multi_' + BASE + ' *multi);				'#10 +
      'extern								'#10 +
      'isl_size isl_multi_' + BASE + '_size( isl_multi_' + BASE + ' *multi);	'#10 +
      'extern								'#10 +
      ' isl_' + BASE + ' *isl_multi_' + BASE + '_get_at(			'#10 +
      '	 isl_multi_' + BASE + ' *multi, int pos);			'#10 +
      ' isl_' + BASE + ' *isl_multi_' + BASE + '_get_' + BASE + '(			'#10 +
      '	 isl_multi_' + BASE + ' *multi, int pos);			'#10 +
      'extern								'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_set_at(			'#10 +
      '	 isl_multi_' + BASE + ' *multi, int pos,			'#10 +
      '	 isl_' + BASE + ' *el);					'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_set_' + BASE + '(		'#10 +
      '	 isl_multi_' + BASE + ' *multi, int pos,			'#10 +
      '	 isl_' + BASE + ' *el);					'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_range_splice(		'#10 +
      '	 isl_multi_' + BASE + ' *multi1, unsigned pos,		'#10 +
      '	 isl_multi_' + BASE + ' *multi2);				'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_flatten_range(		'#10 +
      '	 isl_multi_' + BASE + ' *multi);				'#10 +
      'extern								'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_flat_range_product(	'#10 +
      '	 isl_multi_' + BASE + ' *multi1,				'#10 +
      '	 isl_multi_' + BASE + ' *multi2);				'#10 +
      'extern								'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_range_product(		'#10 +
      '	 isl_multi_' + BASE + ' *multi1,				'#10 +
      '	 isl_multi_' + BASE + ' *multi2);				'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_factor_range(		'#10 +
      '	 isl_multi_' + BASE + ' *multi);				'#10 +
      'isl_bool isl_multi_' + BASE + '_range_is_wrapping(				'#10 +
      '	 isl_multi_' + BASE + ' *multi);				'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_range_factor_domain(	'#10 +
      '	 isl_multi_' + BASE + ' *multi);				'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_range_factor_range(	'#10 +
      '	 isl_multi_' + BASE + ' *multi);				'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_align_params(		'#10 +
      '	 isl_multi_' + BASE + ' *multi,				'#10 +
      '	 isl_space *model);					'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_from_range(		'#10 +
      '	 isl_multi_' + BASE + ' *multi);               '#10;
  end else begin
    Result := s;
  end;
end;

function ISL_DECLARE_MULTI_IDENTITY(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_IDENTITY(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result :=
      #10' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_identity_multi_' + BASE + '(	'#10 +
      '	 isl_multi_' + BASE + ' *multi);				'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_identity(		'#10 +
      '	 isl_space *space);					'#10 +
      '								'#10 +
      ' isl_multi_' + BASE + ' *						'#10 +
      'isl_multi_' + BASE + '_identity_on_domain_space(				'#10 +
      '	 isl_space *space);					'#10 +
      'extern								'#10 +
      ' isl_multi_' + BASE + ' *						'#10 +
      'isl_space_identity_multi_' + BASE + '_on_domain(				'#10 +
      '	 isl_space *space);   '#10;
  end else begin
    Result := s;
  end;
end;

function ISL_DECLARE_MULTI_CMP(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_CMP(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result :=
      #10'int isl_multi_' + BASE + '_plain_cmp( isl_multi_' + BASE + ' *multi1,	'#10 +
      '	 isl_multi_' + BASE + ' *multi2);'#10;
  end else begin
    Result := s;
  end;
end;


function ISL_DECLARE_MULTI_ARITH(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_ARITH(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result :=
      #10' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_scale_val(		'#10 +
      '	 isl_multi_' + BASE + ' *multi,  isl_val *v);	'#10 +
      '								'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_scale_down_val(		'#10 +
      '	 isl_multi_' + BASE + ' *multi,  isl_val *v);	'#10 +
      '								'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_scale_multi_val(	'#10 +
      '	 isl_multi_' + BASE + ' *multi,				'#10 +
      '	 isl_multi_val *mv);					'#10 +
      '								'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_scale_down_multi_val(	'#10 +
      '	 isl_multi_' + BASE + ' *multi,				'#10 +
      '	 isl_multi_val *mv);					'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_mod_multi_val(		'#10 +
      '	 isl_multi_' + BASE + ' *multi,				'#10 +
      '	 isl_multi_val *mv);					'#10 +
      'extern								'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_add(			'#10 +
      '	 isl_multi_' + BASE + ' *multi1,				'#10 +
      '	 isl_multi_' + BASE + ' *multi2);				'#10 +
      'extern								'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_sub(			'#10 +
      '	 isl_multi_' + BASE + ' *multi1,				'#10 +
      '	 isl_multi_' + BASE + ' *multi2);				'#10 +
      'extern								'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_neg(		 	'#10 +
      '	 isl_multi_' + BASE + ' *multi);      '#10;
  end else begin
    Result := s;
  end;
end;


function ISL_DECLARE_MULTI_MIN_MAX(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_MIN_MAX(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result :=
      #10'extern								'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_min(			'#10 +
      '	 isl_multi_' + BASE + ' *multi1,				'#10 +
      '	 isl_multi_' + BASE + ' *multi2);				'#10 +
      'extern								'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_max(			'#10 +
      '	 isl_multi_' + BASE + ' *multi1,				'#10 +
      '	 isl_multi_' + BASE + ' *multi2);  '#10;
  end else begin
    Result := s;
  end;
end;


function ISL_DECLARE_MULTI_ADD_CONSTANT(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_ADD_CONSTANT(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result :=
      #10'isl_multi_' + BASE + ' *isl_multi_' + BASE + '_add_constant_val(	'#10 +
      '	 isl_multi_' + BASE + ' *mpa,  isl_val *v);	'#10 +
      '								'#10 +
      'isl_multi_' + BASE + ' *isl_multi_' + BASE + '_add_constant_multi_val(	'#10 +
      '	 isl_multi_' + BASE + ' *mpa,  isl_multi_val *mv);'#10;
  end else begin
    Result := s;
  end;
end;


function ISL_DECLARE_MULTI_ZERO(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_ZERO(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result :=
      #10'extern								'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_zero(			'#10 +
      '	 isl_space *space);					'#10 +
      'extern								'#10 +
      ' isl_multi_' + BASE + ' *isl_space_zero_multi_' + BASE + '(		'#10 +
      '	 isl_space *space);'#10;
  end else begin
    Result := s;
  end;
end;


function ISL_DECLARE_MULTI_NAN(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_NAN(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result :=
      #10'extern								'#10 +
      'isl_bool isl_multi_' + BASE + '_involves_nan(				'#10 +
      '	 isl_multi_' + BASE + ' *multi);       '#10;
  end else begin
    Result := s;
  end;
end;


function ISL_DECLARE_MULTI_DROP_DIMS(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_DROP_DIMS(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result :=
      #10'isl_size isl_multi_' + BASE + '_dim( isl_multi_' + BASE + ' *multi,	'#10 +
      '	enum isl_dim_type type);					'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_drop_dims(		'#10 +
      '	 isl_multi_' + BASE + ' *multi, enum isl_dim_type type,	'#10 +
      '	unsigned first, unsigned n);'#10;
  end else begin
    Result := s;
  end;
end;


function ISL_DECLARE_MULTI_DIMS(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_DIMS(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result :=
      //    ISL_DECLARE_MULTI_DROP_DIMS(BASE)
      #10'isl_size isl_multi_' + BASE + '_dim( isl_multi_' + BASE + ' *multi,	'#10 +
      '	enum isl_dim_type type);					'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_drop_dims(		'#10 +
      '	 isl_multi_' + BASE + ' *multi, enum isl_dim_type type,	'#10 +
      '	unsigned first, unsigned n);'#10 +

      'isl_bool isl_multi_' + BASE + '_involves_dims(				'#10 +
      '	 isl_multi_' + BASE + ' *multi, enum isl_dim_type type,	'#10 +
      '	unsigned first, unsigned n);					'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_insert_dims(		'#10 +
      '	 isl_multi_' + BASE + ' *multi, enum isl_dim_type type,	'#10 +
      '	unsigned first, unsigned n);					'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_add_dims(		'#10 +
      '	 isl_multi_' + BASE + ' *multi, enum isl_dim_type type,	'#10 +
      '	unsigned n);							'#10 +
      ' isl_multi_' + BASE + ' *						'#10 +
      'isl_multi_' + BASE + '_project_domain_on_params(				'#10 +
      '	 isl_multi_' + BASE + ' *multi);           '#10;
  end else begin
    Result := s;
  end;
end;


function ISL_DECLARE_MULTI_INSERT_DOMAIN(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_INSERT_DOMAIN(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result :=
      #10'extern								'#10 +
      ' isl_multi_' + BASE + ' *						'#10 +
      'isl_multi_' + BASE + '_insert_domain( isl_multi_' + BASE + ' *multi,	'#10 +
      '	 isl_space *domain);     '#10;
  end else begin
    Result := s;
  end;
end;


function ISL_DECLARE_MULTI_LOCALS(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_LOCALS(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result :=
      #10'extern								'#10 +
      'isl_bool isl_multi_' + BASE + '_involves_locals(				'#10 +
      '	 isl_multi_' + BASE + ' *multi); '#10;
  end else begin
    Result := s;
  end;
end;

function ISL_DECLARE_MULTI_DIM_ID(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_DIM_ID(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result :=
      #10'int isl_multi_' + BASE + '_find_dim_by_name(				'#10 +
      '	 isl_multi_' + BASE + ' *multi,				'#10 +
      '	enum isl_dim_type type, const char *name);			'#10 +
      'int isl_multi_' + BASE + '_find_dim_by_id(					'#10 +
      '	 isl_multi_' + BASE + ' *multi, enum isl_dim_type type,	'#10 +
      '	 isl_id *id);						'#10 +
      ' isl_id *isl_multi_' + BASE + '_get_dim_id(			'#10 +
      '	 isl_multi_' + BASE + ' *multi,				'#10 +
      '	enum isl_dim_type type, unsigned pos);				'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_set_dim_name(		'#10 +
      '	 isl_multi_' + BASE + ' *multi,				'#10 +
      '	enum isl_dim_type type, unsigned pos, const char *s);		'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_set_dim_id(		'#10 +
      '	 isl_multi_' + BASE + ' *multi,				'#10 +
      '	enum isl_dim_type type, unsigned pos,  isl_id *id);   '#10;
  end else begin
    Result := s;
  end;
end;

function ISL_DECLARE_MULTI_TUPLE_ID(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_TUPLE_ID(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result :=
      #10'const char *isl_multi_' + BASE + '_get_tuple_name(				'#10 +
      '	 isl_multi_' + BASE + ' *multi, enum isl_dim_type type);	'#10 +
      'extern								'#10 +
      'isl_bool isl_multi_' + BASE + '_has_range_tuple_id(				'#10 +
      '	 isl_multi_' + BASE + ' *multi);				'#10 +
      'isl_bool isl_multi_' + BASE + '_has_tuple_id(				'#10 +
      '	 isl_multi_' + BASE + ' *multi, enum isl_dim_type type);	'#10 +
      'extern								'#10 +
      ' isl_id *isl_multi_' + BASE + '_get_range_tuple_id(		'#10 +
      '	 isl_multi_' + BASE + ' *multi);				'#10 +
      ' isl_id *isl_multi_' + BASE + '_get_tuple_id(			'#10 +
      '	 isl_multi_' + BASE + ' *multi, enum isl_dim_type type);	'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_set_tuple_name(		'#10 +
      '	 isl_multi_' + BASE + ' *multi,				'#10 +
      '	enum isl_dim_type type, const char *s);				'#10 +
      '								'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_set_range_tuple_id(	'#10 +
      '	 isl_multi_' + BASE + ' *multi,   isl_id *id);	'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_set_tuple_id(		'#10 +
      '	 isl_multi_' + BASE + ' *multi,				'#10 +
      '	enum isl_dim_type type,  isl_id *id);			'#10 +
      'extern								'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_reset_range_tuple_id(	'#10 +
      '	 isl_multi_' + BASE + ' *multi);				'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_reset_tuple_id(		'#10 +
      '	 isl_multi_' + BASE + ' *multi, enum isl_dim_type type);    '#10;
  end else begin
    Result := s;
  end;
end;

function ISL_DECLARE_MULTI_WITH_DOMAIN(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_WITH_DOMAIN(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result :=
      #10'extern								'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_product(		'#10 +
      '	 isl_multi_' + BASE + ' *multi1,				'#10 +
      '	 isl_multi_' + BASE + ' *multi2);				'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_splice(			'#10 +
      '	 isl_multi_' + BASE + ' *multi1, unsigned in_pos,		'#10 +
      '	unsigned out_pos,  isl_multi_' + BASE + ' *multi2);  '#10;
  end else begin
    Result := s;
  end;
end;

function ISL_DECLARE_MULTI_BIND_DOMAIN(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_BIND_DOMAIN(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result :=
      #10'extern								'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_bind_domain(		'#10 +
      '	 isl_multi_' + BASE + ' *multi,				'#10 +
      '	 isl_multi_id *tuple);				'#10 +
      'extern								'#10 +
      ' isl_multi_' + BASE + ' *						'#10 +
      'isl_multi_' + BASE + '_bind_domain_wrapped_domain(				'#10 +
      '	 isl_multi_' + BASE + ' *multi,				'#10 +
      '	 isl_multi_id *tuple);     '#10;
  end else begin
    Result := s;
  end;
end;

function ISL_DECLARE_MULTI_UNBIND_PARAMS(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_UNBIND_PARAMS(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result :=
      #10'extern								'#10 +
      ' isl_multi_' + BASE + ' *						'#10 +
      'isl_multi_' + BASE + '_unbind_params_insert_domain(				'#10 +
      '	 isl_multi_' + BASE + ' *multi,				'#10 +
      '	 isl_multi_id *domain);'#10;
  end else begin
    Result := s;
  end;
end;


function ISL_DECLARE_MULTI_PARAM(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_PARAM(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result :=
      #10'isl_bool isl_multi_' + BASE + '_involves_param_id(				'#10 +
      '	 isl_multi_' + BASE + ' *multi,  isl_id *id);	'#10 +
      '								'#10 +
      'isl_bool isl_multi_' + BASE + '_involves_param_id_list(			'#10 +
      '	 isl_multi_' + BASE + ' *multi,				'#10 +
      '	 isl_id_list *list);    '#10;
  end else begin
    Result := s;
  end;
end;


function ISL_DECLARE_MULTI_DOMAIN_REVERSE(const s: string): string;
var
  sa: TAnsiStringArray;
  BASE: string;
begin
  if Pos('ISL_DECLARE_MULTI_DOMAIN_REVERSE(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    BASE := sa[1];

    Result :=
      #10'extern								'#10 +
      ' isl_multi_' + BASE + ' *isl_multi_' + BASE + '_domain_reverse(		'#10 +
      '	 isl_multi_' + BASE + ' *multi);'#10;
  end else begin
    Result := s;
  end;
end;

function Convert_ISL_DECLARE_MULTI(const s: string): string;
begin
  Result := s;
  Result := ISL_DECLARE_MULTI(Result);
  Result := ISL_DECLARE_MULTI_IDENTITY(Result);
  Result := ISL_DECLARE_MULTI_CMP(Result);
  Result := ISL_DECLARE_MULTI_ARITH(Result);
  Result := ISL_DECLARE_MULTI_MIN_MAX(Result);
  Result := ISL_DECLARE_MULTI_ADD_CONSTANT(Result);
  Result := ISL_DECLARE_MULTI_ZERO(Result);
  Result := ISL_DECLARE_MULTI_NAN(Result);
  Result := ISL_DECLARE_MULTI_DROP_DIMS(Result);
  Result := ISL_DECLARE_MULTI_DIMS(Result);
  Result := ISL_DECLARE_MULTI_INSERT_DOMAIN(Result);
  Result := ISL_DECLARE_MULTI_LOCALS(Result);
  Result := ISL_DECLARE_MULTI_DIM_ID(Result);
  Result := ISL_DECLARE_MULTI_TUPLE_ID(Result);
  Result := ISL_DECLARE_MULTI_WITH_DOMAIN(Result);
  Result := ISL_DECLARE_MULTI_BIND_DOMAIN(Result);
  Result := ISL_DECLARE_MULTI_UNBIND_PARAMS(Result);
  Result := ISL_DECLARE_MULTI_PARAM(Result);
  Result := ISL_DECLARE_MULTI_DOMAIN_REVERSE(Result);
end;


end.
