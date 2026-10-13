program project1;

uses
  fp_md4c,
  fp_md4c_html;

type
  TAppdata = record
    f: text;
  end;
  PAppdata = ^TAppdata;

const
  markdown_input =
    '# Mein Markdown-Viewer'#10 +
    '| Produkt | Kategorie | Preis |'#10 +
    '| :--- | :--- | :--- |'#10 +
    '| Apfel | Lebensmittel | 0,50 € |'#10 +
    '| Buch | Medien | 12,95 € |'#10 +
    '| Kaffeetasse | Haushalt | 8,50 € |'#10 +
    ''#10 +

    '```c'#10 +
    '#include <stdio.h>'#10 +
    ''#10 +
    'int main() {'#10 +
    '    // Die Schleife läuft von i = 0 bis i = 4 (insgesamt 5 Mal)'#10 +
    '    for (int i = 0; i < 5; i++) {'#10 +
    '        printf("Hello World (Durchlauf %d)\n", i + 1);'#10 +
    '    }'#10 +
    ''#10 +
    '    return 0; // Signalisiert, dass das Programm erfolgreich lief'#10 +
    '}'#10 +
    '```'#10 +

    '```pascal'#10 +
    'program test'#10 +
    ''#10 +
    'begin'#10 +
    '    // Die Schleife läuft von i = 0 bis i = 4 (insgesamt 5 Mal)'#10 +
    '    Writeln(''Hello World !'');'#10 +
    'end;'#10 +
    '```'#10 +

    'Das ist **fetter Text** und eine [Website](https://example.com).'#10 +
    '* Punkt 1'#10 +
    '* Punkt 2'#10 +
    '* Punkt 3'#10;

  procedure process_output(s: PMD_CHAR; l: TMD_SIZE; userdata: pointer); cdecl;
  var
    AppData: PAppdata absolute userdata;
  begin
    Write(AppData^.f, copy(s, 0, l));
  end;

const
  CDN_BASE = 'https://cdnjs.cloudflare.com/ajax/libs/';
  CSS_GITHUB_MD = CDN_BASE + 'github-markdown-css/5.8.1/github-markdown-light.min.css';
  CSS_CODE_THEME = CDN_BASE + 'highlight.js/11.9.0/styles/github.min.css';
  URL_JS = CDN_BASE + 'highlight.js/11.9.0/highlight.min.js';
  URL_JS_PASCAL = CDN_BASE + 'highlight.js/11.9.0/languages/delphi.min.js';

  HEAD =
    '<!DOCTYPE html><html><head>'#10 +
    '  <meta charset="utf-8">'#10 +
    '  <title>Markdown Viewer</title>'#10 +
    '  <link rel="stylesheet" href="' + CSS_GITHUB_MD + '">'#10 +
    '  <link rel="stylesheet" href="' + CSS_CODE_THEME + '">'#10 +
    '</head>'#10 +
    '<body class="markdown-body">';

  FOOD =
    '  <script src="' + URL_JS + '"></script>'#10 +
    '  <script src="' + URL_JS_PASCAL + '"></script>'#10 + // HIER NEU: Das Pascal-Modul einbinden
    '  <script>hljs.highlightAll();</script>'#10 +
    '</body></html>';

  procedure main;
  var
    res: integer;
    appData: TAppdata;
  begin
    Assign(AppData.f, 'test.html');
    Rewrite(AppData.f);

    WriteLn(appData.f, HEAD);

    res := md_html(markdown_input, Length(markdown_input), @process_output, @appData, MD_DIALECT_GITHUB, 0);

    if res <> 0 then begin
      WriteLn(StdErr, 'Fehler beim Parsen von Markdown.');
      ExitCode := 1;
      Exit;
    end;

    WriteLn(appData.f, FOOD);

    Close(appData.f);
  end;

begin
  main;
end.
