program project1;

uses
  fp_pcre2_8;

  procedure main;
  var
    pattern, subject: PChar;
    subject_length: SizeInt;
    re: Ppcre2_code;
    errornumber, rc: longint;
    erroroffset: Tsize_t;
    buffer: pbyte;
    match_data: Ppcre2_match_data;
    ovector: Psize_t;

  begin
    pattern := '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}';

    subject := 'Hallo, meine E-Mail lautet tux@example.com und hier ist Text.';
    subject_length := Length(subject);

    re := pcre2_compile(pattern, PCRE2_ZERO_TERMINATED, 0, @errornumber, @erroroffset, nil);

    if re = nil then begin
      Getmem(buffer, 256);
      pcre2_get_error_message(errornumber, pbyte(buffer), 256);
      WriteLn('Regex-Fehler an Stelle ', erroroffset, ': ', PChar(buffer));
      Freemem(buffer);
      Exit;
    end;

    match_data := pcre2_match_data_create_from_pattern(re, nil);
    rc := pcre2_match(re, subject, subject_length, 0, 0, match_data, nil);

    if rc < 0 then begin
      if rc = PCRE2_ERROR_NOMATCH then begin
        WriteLn('Keinen Treffer gefunden.');
      end else begin
        WriteLn('Suchfehler: ', rc);
      end;
    end else begin
      ovector := pcre2_get_ovector_pointer(match_data);

      WriteLn('Treffer gefunden von Zeichen ', ovector[0], ' bis ', ovector[1]);
      WriteLn('Gefundener Text: ', Copy((subject), ovector[0] + 1, ovector[1] - ovector[0]));
    end;
    pcre2_match_data_free(match_data);
    pcre2_code_free(re);
  end;

begin
  main;
end.
