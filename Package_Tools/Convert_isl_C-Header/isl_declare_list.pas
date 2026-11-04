unit isl_declare_list;

interface

uses
  Classes, SysUtils;

function Convert_ISL_DECLARE_LIST(const s: string): string;


implementation


function ISL_DECLARE_EXPORTED_LIST_FN(const s: string): string;
var
  sa: TAnsiStringArray;
  EL: string;
begin
  if Pos('ISL_DECLARE_EXPORTED_LIST_FN(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    EL := sa[1];

    Result:=
    'isl_ctx *isl_'+EL+'_list_get_ctx( isl_'+EL+'_list *list);	'#10+

    ' isl_'+EL+'_list *isl_'+EL+'_to_list( isl_'+EL+' *el);'#10+
    ' isl_'+EL+'_list *isl_'+EL+'_list_from_'+EL+'(			'#10+
    '	 isl_'+EL+' *el);					'#10+
    ' isl_'+EL+'_list *isl_'+EL+'_list_alloc(isl_ctx *ctx, int n);	'#10+
    ' isl_'+EL+'_list *isl_'+EL+'_list_copy(			'#10+
    '	 isl_'+EL+'_list *list);				'#10+
    ' isl_'+EL+'_list *isl_'+EL+'_list_free(			'#10+
    '	 isl_'+EL+'_list *list);				'#10+

    ' isl_'+EL+'_list *isl_'+EL+'_list_add(			'#10+
    '	 isl_'+EL+'_list *list,				'#10+
    '	 isl_'+EL+' *el);					'#10+

    ' isl_'+EL+'_list *isl_'+EL+'_list_insert(			'#10+
    '	 isl_'+EL+'_list *list, unsigned pos,			'#10+
    '	 isl_'+EL+' *el);					'#10+

    ' isl_'+EL+'_list *isl_'+EL+'_list_drop(			'#10+
    '	 isl_'+EL+'_list *list, unsigned first, unsigned n);	'#10+

    ' isl_'+EL+'_list *isl_'+EL+'_list_clear(			'#10+
    '	 isl_'+EL+'_list *list);				'#10+
    ' isl_'+EL+'_list *isl_'+EL+'_list_swap(			'#10+
    '	 isl_'+EL+'_list *list, unsigned pos1,		'#10+
    '	unsigned pos2);							'#10+
    ' isl_'+EL+'_list *isl_'+EL+'_list_reverse(			'#10+
    '	 isl_'+EL+'_list *list);				'#10+

    ' isl_'+EL+'_list *isl_'+EL+'_list_concat(			'#10+
    '	 isl_'+EL+'_list *list1,				'#10+
    '	 isl_'+EL+'_list *list2);				'#10+

    'isl_size isl_'+EL+'_list_size( isl_'+EL+'_list *list);	'#10+
    'isl_size isl_'+EL+'_list_n_'+EL+'( isl_'+EL+'_list *list);	'#10+

    ' isl_'+EL+' *isl_'+EL+'_list_get_at(				'#10+
    '	 isl_'+EL+'_list *list, int index);			'#10+
    ' struct isl_'+EL+' *isl_'+EL+'_list_get_'+EL+'(			'#10+
    '	 isl_'+EL+'_list *list, int index);			'#10+

    ' isl_'+EL+'_list *isl_'+EL+'_list_set_at(			'#10+
    '	 isl_'+EL+'_list *list, int index,			'#10+
    '	 isl_'+EL+' *el);					'#10+
    ' struct isl_'+EL+'_list *isl_'+EL+'_list_set_'+EL+'(		'#10+
    '	 struct isl_'+EL+'_list *list, int index,		'#10+
    '	 struct isl_'+EL+' *el);				'#10+

    'isl_stat isl_'+EL+'_list_foreach( isl_'+EL+'_list *list,	'#10+
    '	isl_stat (*fn)( isl_'+EL+' *el, void *user),		'#10+
    '	void *user);							'#10+
    'isl_bool isl_'+EL+'_list_every( isl_'+EL+'_list *list,	'#10+
    '	isl_bool (*test)( isl_'+EL+' *el, void *user),		'#10+
    '	void *user);							'#10+
    ' isl_'+EL+'_list *isl_'+EL+'_list_map(			'#10+
    '	 isl_'+EL+'_list *list,				'#10+
    '	 isl_'+EL+' * (*fn)( isl_'+EL+' *el,		'#10+
    '		void *user),						'#10+
    '	void *user);							'#10+
    ' isl_'+EL+'_list *isl_'+EL+'_list_sort(			'#10+
    '	 isl_'+EL+'_list *list,				'#10+
    '	int (*cmp)( struct isl_'+EL+' *a,			'#10+
    '		 struct isl_'+EL+' *b,				'#10+
    '		void *user), void *user);				'#10+

    'isl_stat isl_'+EL+'_list_foreach_scc( isl_'+EL+'_list *list,	'#10+
    '	isl_bool (*follows)( isl_'+EL+' *a,			'#10+
    '			 isl_'+EL+' *b, void *user),		'#10+
    '	void *follows_user,						'#10+
    '	isl_stat (*fn)( isl_'+EL+'_list *scc, void *user),	'#10+
    '	void *fn_user);							'#10+
    ' char *isl_'+EL+'_list_to_str(				'#10+
    '	 isl_'+EL+'_list *list);				'#10+
    ' isl_printer *isl_printer_print_'+EL+'_list(			'#10+
    '	 isl_printer *p,  isl_'+EL+'_list *list);	'#10+
    'void isl_'+EL+'_list_dump( isl_'+EL+'_list *list);  ';

  end else begin
    Result := s;
  end;
end;



function ISL_DECLARE_EXPORTED_LIST_FN_READ(const s: string): string;
var
  sa: TAnsiStringArray;
  EL: string;
begin
  if Pos('ISL_DECLARE_EXPORTED_LIST_FN_READ(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    EL := sa[1];

    Result:=
    'isl_'+EL+'_list *isl_'+EL+'_list_read_from_str(		'#10+
    '	isl_ctx *ctx, const char *str);';
  end else begin
    Result := s;
  end;
end;

function ISL_DECLARE_LIST_FN(const s: string): string;
var
  sa: TAnsiStringArray;
  EL: string;
begin
  if Pos('ISL_DECLARE_LIST_FN(', s) = 1 then begin
    sa := s.Split(['(', ')']);
    EL := sa[1];

    Result:=
    'isl_ctx *isl_'+EL+'_list_get_ctx( isl_'+EL+'_list *list);	'#10+

    ' isl_'+EL+'_list *isl_'+EL+'_to_list( isl_'+EL+' *el);'#10+
    ' isl_'+EL+'_list *isl_'+EL+'_list_from_'+EL+'(			'#10+
    '	 isl_'+EL+' *el);					'#10+
    ' isl_'+EL+'_list *isl_'+EL+'_list_alloc(isl_ctx *ctx, int n);	'#10+
    ' isl_'+EL+'_list *isl_'+EL+'_list_copy(			'#10+
    '	 isl_'+EL+'_list *list);				'#10+
    ' isl_'+EL+'_list *isl_'+EL+'_list_free(			'#10+
    '	 isl_'+EL+'_list *list);				'#10+

    ' isl_'+EL+'_list *isl_'+EL+'_list_add(			'#10+
    '	 isl_'+EL+'_list *list,				'#10+
    '	 isl_'+EL+' *el);					'#10+

    ' isl_'+EL+'_list *isl_'+EL+'_list_insert(			'#10+
    '	 isl_'+EL+'_list *list, unsigned pos,			'#10+
    '	 isl_'+EL+' *el);					'#10+

    ' isl_'+EL+'_list *isl_'+EL+'_list_drop(			'#10+
    '	 isl_'+EL+'_list *list, unsigned first, unsigned n);	'#10+

    ' isl_'+EL+'_list *isl_'+EL+'_list_clear(			'#10+
    '	 isl_'+EL+'_list *list);				'#10+
    ' isl_'+EL+'_list *isl_'+EL+'_list_swap(			'#10+
    '	 isl_'+EL+'_list *list, unsigned pos1,		'#10+
    '	unsigned pos2);							'#10+
    ' isl_'+EL+'_list *isl_'+EL+'_list_reverse(			'#10+
    '	 isl_'+EL+'_list *list);				'#10+

    ' isl_'+EL+'_list *isl_'+EL+'_list_concat(			'#10+
    '	 isl_'+EL+'_list *list1,				'#10+
    '	 isl_'+EL+'_list *list2);				'#10+

    'isl_size isl_'+EL+'_list_size( isl_'+EL+'_list *list);	'#10+
    'isl_size isl_'+EL+'_list_n_'+EL+'( isl_'+EL+'_list *list);	'#10+

    ' isl_'+EL+' *isl_'+EL+'_list_get_at(				'#10+
    '	 isl_'+EL+'_list *list, int index);			'#10+
    ' struct isl_'+EL+' *isl_'+EL+'_list_get_'+EL+'(			'#10+
    '	 isl_'+EL+'_list *list, int index);			'#10+

    ' isl_'+EL+'_list *isl_'+EL+'_list_set_at(			'#10+
    '	 isl_'+EL+'_list *list, int index,			'#10+
    '	 isl_'+EL+' *el);					'#10+
    ' struct isl_'+EL+'_list *isl_'+EL+'_list_set_'+EL+'(		'#10+
    '	 struct isl_'+EL+'_list *list, int index,		'#10+
    '	 struct isl_'+EL+' *el);				'#10+

    'isl_stat isl_'+EL+'_list_foreach( isl_'+EL+'_list *list,	'#10+
    '	isl_stat (*fn)( isl_'+EL+' *el, void *user),		'#10+
    '	void *user);							'#10+
    'isl_bool isl_'+EL+'_list_every( isl_'+EL+'_list *list,	'#10+
    '	isl_bool (*test)( isl_'+EL+' *el, void *user),		'#10+
    '	void *user);							'#10+
    ' isl_'+EL+'_list *isl_'+EL+'_list_map(			'#10+
    '	 isl_'+EL+'_list *list,				'#10+
    '	 isl_'+EL+' * (*fn)( isl_'+EL+' *el,		'#10+
    '		void *user),						'#10+
    '	void *user);							'#10+
    ' isl_'+EL+'_list *isl_'+EL+'_list_sort(			'#10+
    '	 isl_'+EL+'_list *list,				'#10+
    '	int (*cmp)( struct isl_'+EL+' *a,			'#10+
    '		 struct isl_'+EL+' *b,				'#10+
    '		void *user), void *user);				'#10+

    'isl_stat isl_'+EL+'_list_foreach_scc( isl_'+EL+'_list *list,	'#10+
    '	isl_bool (*follows)( isl_'+EL+' *a,			'#10+
    '			 isl_'+EL+' *b, void *user),		'#10+
    '	void *follows_user,						'#10+
    '	isl_stat (*fn)( isl_'+EL+'_list *scc, void *user),	'#10+
    '	void *fn_user);							'#10+
    ' char *isl_'+EL+'_list_to_str(				'#10+
    '	 isl_'+EL+'_list *list);				'#10+
    ' isl_printer *isl_printer_print_'+EL+'_list(			'#10+
    '	 isl_printer *p,  isl_'+EL+'_list *list);	'#10+
    'void isl_'+EL+'_list_dump( isl_'+EL+'_list *list);  ';

  end else begin
    Result := s;
  end;
end;




function Convert_ISL_DECLARE_LIST(const s: string): string;
begin
  Result:=s;
  Result := ISL_DECLARE_EXPORTED_LIST_FN(Result);
  Result := ISL_DECLARE_EXPORTED_LIST_FN_READ(Result);
  Result := ISL_DECLARE_LIST_FN(Result);
end;

end.

