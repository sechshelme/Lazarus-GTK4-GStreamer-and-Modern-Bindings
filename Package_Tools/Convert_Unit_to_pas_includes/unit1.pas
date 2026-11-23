unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, FileUtil;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure Scan(old:Boolean);

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

const
  srcPath = '/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Package_Tools/include-C';

  destPath = '/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/packagesxx';

procedure TForm1.Scan(old: Boolean);
var
  slFile, unit_source, inc_dest: TStringList;
  i, j: integer;
  s, path: string;
  p: SizeInt;
begin
  Memo1.Clear;
  slFile := FindAllFiles(srcPath, '*.pas',True);

  for i := 0 to slFile.Count - 1 do begin
    unit_source := TStringList.Create;
    inc_dest := TStringList.Create;
    unit_source.LoadFromFile(slFile[i]);

    j := 0;

    WriteLn('file; ', i: 4, '/', slFile.Count - 1);

    // $PACKRECORDS C suchen
    repeat
      s := unit_source[j];
      p := pos('{$PACKRECORDS C}', s);
      if p <> 0 then begin
        Inc(j);
      end;
      Inc(j);
      //      WriteLn('rows; ',j:4 ,'/', unit_source.Count);
      if j >= unit_source.Count then begin
        WriteLn('Überlauf  {$PACKRECORDS C}');
        WriteLn(slFile[i]);
        halt;
      end;
    until p <> 0;

if old then    inc_dest.Add('{$IFDEF read_interface}');

    // implementation C suchen
    repeat
      s := unit_source[j];
      p := pos('implementation', s);
      if p = 1 then begin
        Inc(j);
      end else begin
        inc_dest.Add(unit_source[j]);
      end;
      Inc(j);
      if j >= unit_source.Count then begin
        WriteLn('Überlauf  implementation');
        WriteLn(slFile[i]);
        halt;
      end;
    until p = 1;


if old then begin
    inc_dest.Add('{$ENDIF read_interface}');
    inc_dest.Add('');
    end;
    inc_dest.Add('');
    inc_dest.Add('{$IFDEF read_implementation}');
    inc_dest.Add('');

    // end. C suchen
    repeat
      s := unit_source[j];
      p := pos('end.', s);
      if p = 1 then begin
      end else begin
        inc_dest.Add(unit_source[j]);
      end;

      Inc(j);
      if (j >= unit_source.Count) and (p <> 1) then begin
        WriteLn(slFile[i], '    Überlauf  end.');
        //        halt;
      end;
    until p = 1;

    inc_dest.Add('{$ENDIF read_implementation}');

    path := StringReplace(slFile[i], srcPath, '', []);
    path := ChangeFileExt(path, '.inc');
    path := destPath + path;

    ForceDirectories(ExtractFilePath(path));

    Memo1.Lines.Add(path);
    inc_dest.SaveToFile(path);

    inc_dest.Free;
    unit_source.Free;
  end;

  slFile.Free;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
   Scan(False);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Scan(True);
end;




procedure TForm1.FormCreate(Sender: TObject);
begin
  Height := 1000;
  Width := 1000;
end;

end.
