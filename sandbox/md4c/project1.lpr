program project1;

uses
  fp_md4c,
  fp_md4c_html;

const
  markdown_input =
    '# Mein Markdown-Viewer'#10+
    '| Produkt | Kategorie | Preis |'#10+
    '| :--- | :--- | :--- |'#10+
    '| Apfel | Lebensmittel | 0,50 € |'#10+
    '| Buch | Medien | 12,99 € |'#10+
    '| Kaffeetasse | Haushalt | 8,50 € |'#10+

    'Das ist **fetter Text** und eine [Website](https://example.com).'#10 +
    '* Punkt 1'#10 +
    '* Punkt 2'#10 +
    '* Punkt 3'#10;

  procedure process_output(s: PMD_CHAR; l: TMD_SIZE; userdata: pointer); cdecl;
  begin
    Write(copy(s, 0, l));
  end;

  procedure main;
  var
    res: integer;
  begin
    WriteLn( markdown_input);
    halt;

//    res := md_html(pchar(markdown_input), Length(markdown_input), @process_output, nil, MD_DIALECT_COMMONMARK, 0);
    res := md_html(markdown_input, Length(markdown_input), @process_output, nil, MD_DIALECT_GITHUB, 0);
    if res <> 0 then  begin
      WriteLn(StdErr, 'Fehler beim Parsen von Markdown.');
      ExitCode := 1;
    end;
  end;

begin
  main;
end.
