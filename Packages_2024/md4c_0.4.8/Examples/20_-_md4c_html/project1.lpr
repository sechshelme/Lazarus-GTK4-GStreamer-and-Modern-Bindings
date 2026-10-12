program project1;

uses
  fp_md4c,
  fp_md4c_html;

const
  markdown_input =
    '# Mein Markdown-Viewer'#10 +
    '| Produkt | Kategorie | Preis |'#10 +
    '| :--- | :--- | :--- |'#10 +
    '| Apfel | Lebensmittel | 0,50 € |'#10 +
    '| Buch | Medien | 12,99 € |'#10 +
    '| Kaffeetasse | Haushalt | 8,50 € |'#10 +
    ''#10 +
    '```c'#10 +
    '#include <stdio.h>'#10 +
    ''#10 +
    'int main() {'#10 +
    '    // Die Schleife läuft von i = 0 bis i = 4 (insgesamt 5 Mal)'#10 +
    '    for (int i = 0; i < 5; i++) {' + #10 +
    '        printf("Hello World (Durchlauf %d)\n", i + 1);'#10 +
    '    }'#10 +
    ''#10 +
    '    return 0; // Signalisiert, dass das Programm erfolgreich lief'#10 +
    '}'#10 +
    '```'#10 +
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
  cdn_host, url_css_dark, url_js: string;
begin
  cdn_host     := 'cdnjs.' + 'cloudflare.' + 'com';
  // Jetzt laden wir das offizielle "github-dark" Stylesheet
  url_css_dark := 'https://' + cdn_host + '/ajax/libs/highlight.js/11.9.0/styles/github-dark.min.css';
  url_js       := 'https://' + cdn_host + '/ajax/libs/highlight.js/11.9.0/highlight.min.js';

  // 1. HTML-Header ausgeben
  WriteLn('<!DOCTYPE html>');
  WriteLn('<html>');
  WriteLn('<head>');
  WriteLn('  <meta charset="utf-8">');
  WriteLn('  <title>Markdown Viewer (Dark Mode)</title>');

  // Bindet das dunkle Code-Theme ein
  WriteLn('  <link rel="stylesheet" href="' + url_css_dark + '">');

  // Unser angepasstes CSS für den globalen Dark Mode
  WriteLn('  <style>');
  WriteLn('    body { font-family: sans-serif; margin: 30px; line-height: 1.5; background-color: #0d1117; color: #c9d1d9; }');
  WriteLn('    h1 { color: #f0f6fc; border-bottom: 1px solid #21262d; padding-bottom: 10px; }');
  WriteLn('    table { border-collapse: collapse; margin: 15px 0; font-size: 14px; background-color: #161b22; width: 100%; }');
  WriteLn('    th, td { border: 1px solid #30363d; padding: 6px 12px; text-align: left; }');
  WriteLn('    th { background-color: #21262d; color: #f0f6fc; }');
  WriteLn('    pre { background: #161b22; padding: 12px; border-radius: 6px; border: 1px solid #30363d; }');
  WriteLn('    a { color: #58a6ff; }');
  WriteLn('  </style>');
  WriteLn('</head>');
  WriteLn('<body>');

  // 2. Den Markdown-Body über MD4C parsen
  res := md_html(markdown_input, Length(markdown_input), @process_output, nil, MD_DIALECT_GITHUB, 0);

  if res <> 0 then begin
    WriteLn(StdErr, 'Fehler beim Parsen von Markdown.');
    ExitCode := 1;
    Exit;
  end;

  // 3. HTML-Footer ausgeben und Highlighting aktivieren
  WriteLn('');
  WriteLn('  <script src="' + url_js + '"></script>');
  WriteLn('  <script>hljs.highlightAll();</script>');
  WriteLn('</body>');
  WriteLn('</html>');
end;

begin
  main;
end.
