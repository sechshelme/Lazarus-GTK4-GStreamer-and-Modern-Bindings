program project1;

{$mode objfpc}{$H+}

uses
  fp_md4c;

const
  markdown_input =
    '# Mein Markdown-Viewer'#10 +
    '| Produkt | Kategorie | Preis |'#10 +
    '| :--- | :--- | :--- |'#10 +
    '| Apfel | Lebensmittel | 0,50 € |'#10 +
    '| Buch | Medien | 12,99 € |'#10 +
    '| Kaffeetasse | Haushalt | 8,50 € |'#10 +

    'Das ist **fetter Text** und eine [Website](https://example.com).'#10 +
    '* Punkt 1'#10 +
    '* Punkt 2'#10 +
    '* Punkt 3'#10;

  function cb_enter_block(blk_type: TMD_BLOCKTYPE; detail: pointer; userdata: pointer): integer; cdecl;
  var
    h_detail: PMD_BLOCK_H_DETAIL;
  begin
    case blk_type of
      MD_BLOCK_H: begin
        h_detail := PMD_BLOCK_H_DETAIL(detail);
        WriteLn('<H', h_detail^.level, ' Start>');
      end;
      MD_BLOCK_P: begin
        WriteLn('<Paragraph Start>');
      end;
      MD_BLOCK_TABLE: begin
        WriteLn('<Tabelle Start>');
      end;
    end;
    Result := 0;
  end;

  function cb_leave_block(blk_type: TMD_BLOCKTYPE; detail: pointer; userdata: pointer): integer; cdecl;
  var
    h_detail: PMD_BLOCK_H_DETAIL;
  begin
    case blk_type of
      MD_BLOCK_H: begin
        h_detail := PMD_BLOCK_H_DETAIL(detail);
        WriteLn('<H', h_detail^.level, ' Ende>');
      end;
      MD_BLOCK_P: begin
        WriteLn('<Paragraph Ende>');
      end;
      MD_BLOCK_TABLE: begin
        WriteLn('<Tabelle Ende>');
      end;
    end;
    Result := 0;
  end;

  function cb_enter_span(span_type: TMD_SPANTYPE; detail: pointer; userdata: pointer): integer; cdecl;
  begin
    case span_type of
      MD_SPAN_STRONG: begin
        Write('[Fett Start]');
      end;
      MD_SPAN_A: begin
        Write('[Link Start]');
      end;
    end;
    Result := 0;
  end;

  function cb_leave_span(span_type: TMD_SPANTYPE; detail: pointer; userdata: pointer): integer; cdecl;
  begin
    case span_type of
      MD_SPAN_STRONG: begin
        Write('[Fett Ende]');
      end;
      MD_SPAN_A: begin
        Write('[Link Ende]');
      end;
    end;
    Result := 0;
  end;

  function cb_text(txt_type: TMD_TEXTTYPE; text: PMD_CHAR; size: TMD_SIZE; userdata: pointer): integer; cdecl;
  var
    s: string;
  begin
    if size > 0 then  begin
      SetLength(s, size);
      Move(text^, s[1], size);
      Write(s);
    end;
    Result := 0;
  end;

  procedure main;
  var
    res: integer;
    parser: TMD_PARSER = ();
  begin
    parser.abi_version := 0;
    parser.flags := MD_DIALECT_GITHUB;
    parser.enter_block := @cb_enter_block;
    parser.leave_block := @cb_leave_block;
    parser.enter_span := @cb_enter_span;
    parser.leave_span := @cb_leave_span;
    parser.text := @cb_text;

    WriteLn('--- Starte Pascal Parsing ---'#10);

    res := md_parse(markdown_input, Length(markdown_input), @parser, nil);
    if res <> 0 then begin
      WriteLn(StdErr, 'Fehler beim Parsen von Markdown.');
      Exit;
    end;

    WriteLn;
    WriteLn('--- Parsing erfolgreich beendet ---');
  end;

begin
  main;
end.
