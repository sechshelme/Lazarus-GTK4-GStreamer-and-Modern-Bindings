unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,
  fp_liblas;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  Color := clBlack;
end;

procedure TForm1.FormPaint(Sender: TObject);
// LiDAR-Daten
const
  filename = '/home/tux/Schreibtisch/von_Git/liblas/libLAS/test/data/TO_core_last_zoom.las';
  //  filename = '/home/tux/Schreibtisch/2711_1245.las';
var
  reader: TLASReaderH;
  header: TLASHeaderH;
  points_count: DWord;
  version_major, version_minor, cl: byte;
  p: TLASPointH;
  i, winW, winH, winZ: integer;
  px, py, pz: int64;
  minX, maxX, minY, maxY, rangeX, rangeY, minZ, maxZ, rangeZ: double;
  col: TColor;
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

  WriteLn('Lese Punkte...');

  winW := ClientWidth;
  winH := ClientHeight;
  winZ := 255;

  minX := LASHeader_GetMinX(header);
  maxX := LASHeader_GetMaxX(header);
  minY := LASHeader_GetMinY(header);
  maxY := LASHeader_GetMaxY(header);
  minZ := LASHeader_GetMinZ(header);
  maxZ := LASHeader_GetMaxZ(header);

  rangeX := maxX - minX;
  rangeY := maxY - minY;
  rangeZ := maxZ - minZ;

  for i := 0 to points_count - 1 do begin
    p := LASReader_GetNextPoint(reader);
    if p = nil then begin
      break;
    end;

    if rangeX > 0 then begin
      px := Trunc(((LASPoint_GetX(p) - minX) / rangeX) * winW);
    end;

    if rangeY > 0 then begin
      py := winH - Trunc(((LASPoint_GetY(p) - minY) / rangeY) * winH);
    end;

    if rangeZ > 0 then begin
      pz := Trunc(((LASPoint_GetZ(p) - minZ) / rangeZ) * winZ);
    end;

    cl := LASPoint_GetClassification(p);

    WriteLn(px, ' x ', py, '   ', pz);
    case cl of
      1: begin
        col := pz;
      end;
      2: begin
        col := pz * $100;
      end;
      else begin
        col := pz * $10000;
      end;
    end;
    Canvas.Pixels[px, py] := col;

    WriteLn('P ', i: 2, ': X=', LASPoint_GetX(p): 0: 2, ' Y=', LASPoint_GetY(p): 0: 2, ' Z=', LASPoint_GetZ(p): 0: 2,
      ' | Int: ', LASPoint_GetIntensity(p), ' | Class: ', LASPoint_GetClassification(p));
  end;

  LASHeader_Destroy(header);


  LASReader_Destroy(reader);

end;

end.
