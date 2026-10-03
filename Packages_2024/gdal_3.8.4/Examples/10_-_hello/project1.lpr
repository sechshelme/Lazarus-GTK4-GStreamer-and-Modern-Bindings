program project1;

uses
  fp_gdal;

  procedure main;
  var
    hSrcDataset, hDstDataset: TGDALDatasetH;
    width, height: longint;
    hSrcBand, hDstBand: TGDALRasterBandH;
    hDriver: TGDALDriverH;
    adfGeoTransform: array[0..5] of double;
    rowBuffer: pbyte;
    y, x: longint;
    readErr, writeErr: TCPLErr;
  begin
    GDALAllRegister;

    hSrcDataset := GDALOpen('/home/tux/Schreibtisch/gdal/cea.tif', GA_ReadOnly);
    if hSrcDataset = nil then begin
      WriteLn('Originalbild konnte nicht geöffnet werden.');
      Exit;
    end;

    width := GDALGetRasterXSize(hSrcDataset);
    height := GDALGetRasterYSize(hSrcDataset);
    hSrcBand := GDALGetRasterBand(hSrcDataset, 1);

    WriteLn('Breite (w):       ', width, ' Pixel');
    WriteLn('Höhe   (h):       ', height, ' Pixel');
    WriteLn('Anzahl Bänder:    ', GDALGetRasterCount(hSrcDataset));
    WriteLn('Pixel-Datentyp:   ', GDALGetDataTypeName(GDALGetRasterDataType(hSrcBand)));
    WriteLn('Projektion (WKT): ', GDALGetProjectionRef(hSrcDataset));

    if GDALGetGeoTransform(hSrcDataset, @adfGeoTransform) = CE_None then begin
      WriteLn('--- Georeferenzierung ---');
      WriteLn('Koordinaten Ursprung (Oben Links):');
      WriteLn('  X: ', adfGeoTransform[0]: 0: 3);
      WriteLn('  Y: ', adfGeoTransform[3]: 0: 3);
      WriteLn('Pixel-Auflösung (Grösse eines Pixels):');
      WriteLn('  Breite: ', adfGeoTransform[1]: 0: 3, ' Einheiten');
      WriteLn('  Höhe:   ', adfGeoTransform[5]: 0: 3, ' Einheiten (meist negativ)');
    end else begin
      WriteLn('Bild besitzt keine Geotransformations-Daten.');
    end;


    hDriver := GDALGetDriverByName('GTiff');
    if hDriver = nil then begin
      WriteLn('GeoTIFF-Treiber nicht gefunden.');
      GDALClose(hSrcDataset);
      Exit;
    end;

    hDstDataset := GDALCreate(hDriver, '/tmp/negativ.tif', width, height, 1, GDT_Byte, nil);
    if hDstDataset = nil then begin
      WriteLn('Ausgabedatei konnte nicht erstellt werden.');
      GDALClose(hSrcDataset);
      Exit;
    end;

    if GDALGetGeoTransform(hSrcDataset, @adfGeoTransform[0]) = CE_None then begin
      GDALSetGeoTransform(hDstDataset, @adfGeoTransform[0]);
    end;
    hDstBand := GDALGetRasterBand(hDstDataset, 1);

    GetMem(rowBuffer, width);
    for y := 0 to height - 1 do begin
      readErr := GDALRasterIO(hSrcBand, GF_Read, 0, y, width, 1, rowBuffer, width, 1, GDT_Byte, 0, 0);
      if readErr <> CE_None then begin
        WriteLn('Fehler beim Lesen der Zeile ', y);
        Break;
      end;

      for x := 0 to width - 1 do begin
        rowBuffer[x] := 255 - rowBuffer[x];
      end;

      writeErr := GDALRasterIO(hDstBand, GF_Write, 0, y, width, 1, rowBuffer, width, 1, GDT_Byte, 0, 0);
      if writeErr <> CE_None then begin
        WriteLn('Fehler beim Schreiben der Zeile ', y);
        Break;
      end;
    end;

    WriteLn('Neues Bild ''negativ.tif'' erfolgreich erstellt!');
    FreeMem(rowBuffer);
    GDALClose(hSrcDataset);
    GDALClose(hDstDataset);
  end;

begin
  main;
end.
