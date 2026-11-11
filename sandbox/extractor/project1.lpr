program project1;

uses
  fp_extractor;

  function print_meta(cls: pointer; plugin_name: Pchar; _type: TEXTRACTOR_MetaType; format: TEXTRACTOR_MetaFormat; data_mime_type: Pchar; data: Pchar; data_len: Tsize_t): longint; cdecl;
  var
    type_str: PChar;
  begin
    type_str := EXTRACTOR_metatype_to_string(_type);

    case format of
      EXTRACTOR_METAFORMAT_UTF8, EXTRACTOR_METAFORMAT_C_STRING: begin
        WriteLn(plugin_name, ' ', type_str, ' ', data);
      end;
      else begin
        WriteLn('unknow');
      end;
    end;
    Result := 0;
  end;

procedure Print;
var
  i: Integer;
begin
    for i := 0 to Ord(EXTRACTOR_metatype_get_max) - 1 do
  begin
    WriteLn(i, ': ', EXTRACTOR_metatype_to_string(TEXTRACTOR_MetaType(i)));
  end;
    end;

  procedure main;
  const
    path = '/home/tux/Downloads/Fuchs.mp4';
  var
    plugins: PEXTRACTOR_PluginList;
  begin
    Print;

    plugins := EXTRACTOR_plugin_add_defaults(EXTRACTOR_OPTION_DEFAULT_POLICY);

    if plugins = nil then begin
      WriteLn('Fehler: Plugins konnten nicht geladen werden.');
      Exit;
    end;

    WriteLn('Analysiere Datei: '#10);

    EXTRACTOR_extract(plugins, path, nil, 0, @print_meta, nil);
    EXTRACTOR_plugin_remove_all(plugins);
  end;

begin
  main;
end.
