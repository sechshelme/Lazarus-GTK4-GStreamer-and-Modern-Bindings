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
    function FindFuncName(const s: string): string;
    function OneLines(const sl: TStringList; lines: Integer): string;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

function TForm1.FindFuncName(const s: string): string;
var
  sa: TAnsiStringArray;
begin
  sa := s.Split([' ', '(', ':', ';']);
  if Length(sa) >= 2 then begin
    Result := sa[1];
  end else begin
    Result := '';
  end;
end;

function TForm1.OneLines(const sl: TStringList; lines:Integer): string;
var
  k: Integer;
begin
  Result:=sl[lines];
  k := lines + 1;
  while (sl[k] <> '') and (sl[k][1] = ' ') do begin
    Result := Result + ' ' + Trim(sl[k]);
    k := k + 1;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  slFile, slHeader: TStringList;
  i, j: integer;
  s, link: string;
  LibHandle: HMODULE;
  addr: Pointer;
const
//  srcPath = '/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Packages_2024/gtk-4.14.2';
//  soPath = '/usr/lib/x86_64-linux-gnu/libgtk-4.so';
  srcPath = '/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/SDL-3/packages/SDL3';
  soPath = '/usr/local/lib/libSDL3.so';
begin

  LibHandle := SafeLoadLibrary(soPath);
  if LibHandle <> 0 then begin
    Memo1.Clear;
    slFile := FindAllFiles(srcPath, '*.inc;*.pas', True);
    Memo1.Lines := slFile;

    WriteLn(slFile.Count);

    for i := 0 to slFile.Count - 1 do begin
      slHeader := TStringList.Create;
      slHeader.LoadFromFile(slFile[i]);

      WriteLn(i, '/', slFile.Count - 1, '         ', slFile[i]);

      for j:=0 to  slHeader.Count-1 do begin
        if (pos('procedure', slHeader[j]) = 1) or (pos('function', slHeader[j]) = 1) then begin
          s:=OneLines(slHeader, j);
          if Pos('external', s) > 0 then begin
            link := FindFuncName(s);

            if link <> '' then begin
              addr := GetProcAddress(LibHandle, link);
              if addr = nil then begin
                Write(link, '   ');
                WriteLn('NOT FOUND');
              end else begin
//                Write(link, '   ');
//                WriteLn('found');
              end;
            end;
          end;

        end;

      end;
      slHeader.Free;
    end;

    slFile.Free;
    FreeLibrary(LibHandle);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Height := 1000;
  Width := 1000;
end;


end.
