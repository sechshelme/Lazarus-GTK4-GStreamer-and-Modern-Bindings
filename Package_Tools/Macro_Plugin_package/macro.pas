unit macro;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,
  Forms, Controls, StdCtrls, Dialogs, ExtCtrls,
  LazIDEIntf,
  LazarusPackageIntf, SrcEditorIntf, MenuIntf;

procedure Register;

type

  { TMacroForm }

  TMacroForm = class(TForm)
    constructor CreateNew(TheOwner: TComponent; num: integer); override;
  private
    procedure btnClick(Sender: TObject);
    procedure CreateButton(x, y: integer; macros_Str: pchar);
    procedure CreateLabel(x, y: integer; cap: pchar);
  end;

implementation

constructor TMacroForm.CreateNew(TheOwner: TComponent; num: integer);
begin
  inherited CreateNew(TheOwner, 0);

  Left := Screen.Width div 3 * 2;
  Top := Screen.Height div 3 * 2;
  Width := 320;
  Height := 150;

  CreateLabel(1, 0, 'IFDEF');
  CreateLabel(2, 0, 'ENDIF');
  CreateLabel(4, 0, 'DEFINE');
  CreateLabel(5, 0, 'UNDEF');

  CreateLabel(0, 1, 'enum');
  CreateLabel(0, 2, 'struct');
  CreateLabel(0, 3, 'func');
  CreateLabel(0, 4, 'impl');

  CreateButton(1, 1, '{$IFDEF read_enum}');
  CreateButton(2, 1, '{$ENDIF read_enum}');
  CreateButton(4, 1, '{$DEFINE read_enum}');
  CreateButton(5, 1, '{$UNDEF read_enum}');

  CreateButton(1, 2, '{$IFDEF read_struct}');
  CreateButton(2, 2, '{$ENDIF read_struct}');
  CreateButton(4, 2, '{$DEFINE read_struct}');
  CreateButton(5, 2, '{$UNDEF read_struct}');

  CreateButton(1, 3, '{$IFDEF read_function}');
  CreateButton(2, 3, '{$ENDIF read_function}');
  CreateButton(4, 3, '{$DEFINE read_function}');
  CreateButton(5, 3, '{$UNDEF read_function}');

  CreateButton(1, 4, '{$IFDEF read_implementation}');
  CreateButton(2, 4, '{$ENDIF read_implementation}');
  CreateButton(4, 4, '{$DEFINE read_implementation}');
  CreateButton(5, 4, '{$UNDEF read_implementation}');
end;

procedure TMacroForm.btnClick(Sender: TObject);
var
  Editor: TSourceEditorInterface;
begin
  Editor := SourceEditorManagerIntf.ActiveEditor;

  if Editor <> nil then  begin
    Editor.Selection := pchar(TComponent(Sender).Tag);
    LazarusIDE.DoOpenEditorFile(Editor.FileName, -1, -1, [ofRegularFile, ofOnlyIfExists]);
  end;
end;

procedure TMacroForm.CreateButton(x, y: integer; macros_Str: pchar);
var
  btn: TButton;
begin
  btn := TButton.Create(Self);
  btn.Caption := '';
  btn.Parent := Self;
  btn.Width := 50;
  btn.Left := x * 50 + 5;
  btn.Top := y * 25 + 5;

  btn.OnClick := @btnClick;
  btn.Tag := PtrInt(macros_Str);
end;

procedure TMacroForm.CreateLabel(x, y: integer; cap: pchar);
var
  lab: TLabel;
begin
  lab := TLabel.Create(Self);
  lab.Caption := cap;
  lab.Parent := Self;
  lab.Width := 50;
  lab.Left := x * 50 + 5;
  lab.Top := y * 25 + 5;
end;

procedure ShowMacroDialog(Sender: TObject);
const
  form: TMacroForm = nil;
begin
  if form = nil then begin
    form := TMacroForm.CreateNew(nil, 0);
  end;
  form.Show;
end;

procedure CloseAllPackageWindows(Sender: TObject);
var
  i: integer;
begin
  for i := Screen.FormCount - 1 downto 0 do begin
    if Screen.Forms[i].ClassNameIs('TPackageEditorForm') then begin
      Screen.Forms[i].Close;
    end;
  end;
end;

procedure Macro_Key_Register;
begin
  RegisterIdeMenuCommand(mnuTools, 'Create Macro', '[Create Macro...]', nil, @ShowMacroDialog);
  RegisterIdeMenuCommand(mnuWindow, 'Close All Package Windows', '[Alle Package-Fenster schliessen]', nil, @CloseAllPackageWindows);
end;

procedure Register;
begin
  RegisterUnit('macro', @Macro_Key_Register);
end;

end.
