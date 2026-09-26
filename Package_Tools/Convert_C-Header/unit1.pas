unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, FileUtil;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function DeleteLines(const s, delStr: string): string;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

function TForm1.DeleteLines(const s, delStr: string): string;
begin
  if Pos(delStr, s) = 1 then begin
    Result := '';
  end else begin
    Result := s;
  end;
end;

const
  availables: array of string = (
  'NM_AVAILABLE_IN_1_');
//  'GDK_AVAILABLE_IN_4_');
//'CHAFA_AVAILABLE_IN_1',
  //'GDK_PIXBUF_AVAILABLE_IN_2',
  //'GDK_AVAILABLE_IN_4',
  //'GRAPHENE_AVAILABLE_IN',
  //'PANGO_AVAILABLE_IN_1',
  //'PANGO_DEPRECATED_IN_1');

function checkAvaiables(const s: string): string;
var
  i, j: integer;
  ss: string;
begin
  Result := s;
  for i := Length(availables) - 1 downto 0 do begin
    j := 22;
    repeat
      WriteStr(ss, availables[i], j);

      Result := StringReplace(Result, ss, 'extern', []);
      Dec(j, 2);
    until j <= 0;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  slFile, slHeader: TStringList;
  i, j, v, a: integer;
  s: string;
begin
  Memo1.Clear;
  slFile := FindAllFiles('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Package_Tools/include-C/at-spi-2.0/atspi', '*.h', True);
  Memo1.Lines := slFile;

  for i := 0 to slFile.Count - 1 do begin
    slHeader := TStringList.Create;
    slHeader.LoadFromFile(slFile[i]);

    WriteLn(i, '/', slFile.Count - 1, '         ', slFile[i]);


    for j := 0 to slHeader.Count - 1 do begin
      //if pos('long', slHeader[j]) > 0 then begin
      //  WriteLn();
      //  WriteLn(slFile[i]);
      //  WriteLn(slHeader[j]);
      //
      //  WriteLn();
      //  WriteLn();
      //end;

      s := slHeader[j];
      if pos('HPDF_EXPORT(', s) = 1 then begin
        WriteLn(s);
      end;



      slHeader[j] := StringReplace(slHeader[j], 'volatile ', ' ', [rfReplaceAll]);


      slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_FLAG_ENUM', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'G_BEGIN_DECLS', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'G_END_DECLS', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_MALLOC', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_CONST', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_PURE', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_NULL_TERMINATED', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_WARN_UNUSED_RESULT', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'G_DEFINE_AUTOPTR_CLEANUP_FUNC', '//G_DEFINE_AUTOPTR_CLEANUP_FUNC ', [rfReplaceAll]);




      slHeader[j] := checkAvaiables(slHeader[j]);

    end;
    slHeader.SaveToFile(slFile[i]);
    slHeader.Free;
  end;

  slFile.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Height := 1000;
  Width := 1000;
end;


end.
