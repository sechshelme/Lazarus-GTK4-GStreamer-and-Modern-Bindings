unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, FileUtil,
  isl_declare_multi, isl_declare_list;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

//  nm -D /usr/lib/x86_64-linux-gnu/libisl.so | grep isl_union_pw_aff_list_read_from_str



procedure TForm1.Button1Click(Sender: TObject);
var
  slFile, slHeader: TStringList;
  i, j, v, a: integer;
  s: string;
begin
  Memo1.Clear;
  slFile := FindAllFiles('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Package_Tools/include-C/isl', '*.h', True);
  Memo1.Lines := slFile;

  for i := 0 to slFile.Count - 1 do begin
    slHeader := TStringList.Create;
    slHeader.LoadFromFile(slFile[i]);

    WriteLn(i, '/', slFile.Count - 1, '         ', slFile[i]);


    for j := 0 to slHeader.Count - 1 do begin
      slHeader[j] := StringReplace(slHeader[j], 'extern "C" {', '', [rfReplaceAll]);

      slHeader[j] := StringReplace(slHeader[j], '__isl_export', 'extern', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], '__isl_overload', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], '__isl_give', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], '__isl_null', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], '__isl_take', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], '__isl_keep', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], '__isl_constructor', '', [rfReplaceAll]);

      slHeader[j] := StringReplace(slHeader[j], 'EXPORT									\', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'CONSTRUCTOR', '', [rfReplaceAll]);

      slHeader[j] := Convert_ISL_DECLARE_MULTI(slHeader[j]);
      slHeader[j] := Convert_ISL_DECLARE_LIST(slHeader[j]);
    end;

    for j := 0 to slHeader.Count - 1 do begin
      //if pos('struct', slHeader[j]) = 1 then begin
      //  s:=slHeader[j];
      //  WriteLn('s: ',s);
      //  Delete(s, 1, 6);
      //  WriteLn('s: ',s);
      //  slHeader[j]:=s;
      //end;
      if pos(' struct', slHeader[j]) = 1 then begin
        s:=slHeader[j];
        WriteLn('s: ',s);
        Delete(s, 1, 7);
        WriteLn('s: ',s);
        slHeader[j]:=s;
      end;

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
