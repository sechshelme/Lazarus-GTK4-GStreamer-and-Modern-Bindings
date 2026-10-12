program project1;

uses
  fp_liblas;

  procedure main;
  const
    filename = '/home/tux/Schreibtisch/von_Git/liblas/libLAS/test/data/autzen.las';
  var
    reader: TLASReaderH;
    header: TLASHeaderH;
    points_count: DWord;
    version_major, version_minor: byte;
    p: TLASPointH;
    i: integer;
  begin
    reader := LASReader_Create(filename);
    if reader = nil then begin
      WriteLn('Fehler beim Öffnen!');
      Exit;
    end;

    header := LASReader_GetHeader(reader);

    points_count := LASHeader_GetPointRecordsCount(header);
    version_major := LASHeader_GetVersionMajor(header);
    version_minor := LASHeader_GetVersionMinor(header);

    WriteLn('Datei: ', filename);
    WriteLn('LAS Version:  ', version_major, '.', version_minor);
    WriteLn('Anzahl Punkte: ', points_count);

    LASHeader_Destroy(header);

    WriteLn('Lese Punkte...');

    for i := 0 to points_count - 1 do begin
      p := LASReader_GetNextPoint(reader);
      if p = nil then begin
        break;
      end;
      WriteLn('P ', i: 3, ': X=', LASPoint_GetX(p): 0: 2, ' Y=', LASPoint_GetY(p): 0: 2, ' Z=', LASPoint_GetZ(p): 0: 2,
        ' | Int: ', LASPoint_GetIntensity(p):3, ' | Class: ', LASPoint_GetClassification(p));
    end;

    LASReader_Destroy(reader);
  end;

begin
  main;
end.
