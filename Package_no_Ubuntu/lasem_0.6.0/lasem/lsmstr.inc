{$IFDEF read_interface}


function lsm_str_is_uri(str: pchar): Tgboolean; cdecl; external liblasem;
function lsm_str_to_uri(str: pchar): pchar; cdecl; external liblasem;
function lsm_str_parse_double(str: PPchar; x: Pdouble): Tgboolean; cdecl; external liblasem;
function lsm_str_parse_double_list(str: PPchar; n_values: dword; values: Pdouble): dword; cdecl; external liblasem;
procedure lsm_str_point_list_exents(point_list: pchar; extents: PLsmExtents); cdecl; external liblasem;

procedure lsm_str_skip_spaces(str: PPChar); inline;
procedure lsm_str_skip_char(str: PPChar; c: Char); inline;
procedure lsm_str_skip_comma_and_spaces(str: PPChar); inline;
procedure lsm_str_skip_semicolon_and_spaces(str: PPChar); inline;
procedure lsm_str_skip_colon_and_spaces(str: PPChar); inline;
procedure lsm_str_consolidate(str: PChar); inline;


// === Konventiert am: 3-3-26 15:55:46 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

procedure lsm_str_skip_spaces(str: PPChar); inline;
begin
  while g_ascii_isspace(str^^) do begin
    Inc(str^);
  end;
end;

procedure lsm_str_skip_char(str: PPChar; c: char); inline;
begin
  while str^^ = c do begin
    Inc(str^);
  end;
end;

procedure lsm_str_skip_comma_and_spaces(str: PPChar); inline;
begin
  while g_ascii_isspace(str^^) or (str^^ = ',') do begin
    Inc(str^);
  end;
end;

procedure lsm_str_skip_semicolon_and_spaces(str: PPChar); inline;
begin
  while g_ascii_isspace(str^^) or (str^^ = ';') do begin
    Inc(str^);
  end;
end;

procedure lsm_str_skip_colon_and_spaces(str: PPChar); inline;
begin
  while g_ascii_isspace(str^^) or (str^^ = ':') do begin
    Inc(str^);
  end;
end;

procedure lsm_str_consolidate(str: pchar);
var
  to_ptr, from_ptr: pchar;
begin
  if str = nil then begin
    Exit;
  end;

  from_ptr := str;
  to_ptr := str;
  while from_ptr^ <> #0 do begin
    if g_ascii_isspace(from_ptr^) then  begin
      if (to_ptr <> str) and ((to_ptr - 1)^ <> ' ') then begin
        to_ptr^ := ' ';
        Inc(to_ptr);
      end;
    end else begin
      to_ptr^ := from_ptr^;
      Inc(to_ptr);
    end;
    Inc(from_ptr);
  end;

  if (to_ptr <> str) and ((to_ptr - 1)^ = ' ') then begin
    (to_ptr - 1)^ := #0;
  end else begin
    to_ptr^ := #0;
  end;
end;

{$ENDIF read_implementation}
