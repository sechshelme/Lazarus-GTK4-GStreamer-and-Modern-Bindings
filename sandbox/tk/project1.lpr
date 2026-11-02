program project1;

uses
  fp_tcl;

  function printSelection(clientData: TClientData; interp: PTcl_Interp; argc: longint; argv: PPchar): longint; cdecl;
  var
    selectedIndex, selectedItem: pchar;
  begin
    if Tcl_Eval(interp, 'package require Tk; canvas .c -width 200 -height 200; pack .c; .c create oval 50 50 150 150') <> TCL_OK then begin
      WriteLn('Fehler beim Erstellen des Eingabefeldes: ', Tcl_GetStringResult(interp));
      Exit(1);
    end;

    // Hole den Index des ausgewählten Elements
    if Tcl_Eval(interp, 'set selectedIndex [.listbox curselection]') <> TCL_OK then begin
      WriteLn('Fehler beim Auslesen der Auswahl: ', Tcl_GetStringResult(interp));
      Exit(TCL_ERROR);
    end;

    selectedIndex := Tcl_GetVar(interp, 'selectedIndex', TCL_GLOBAL_ONLY);

    // Hole den Text des ausgewählten Elements
    if Tcl_Eval(interp, 'set selectedItem [.listbox get $selectedIndex]') <> TCL_OK then begin
      WriteLn(stderr, 'Fehler beim Auslesen des Elements: ', Tcl_GetStringResult(interp));
      Exit(TCL_ERROR);
    end;
    selectedItem := Tcl_GetVar(interp, 'selectedItem', TCL_GLOBAL_ONLY);

    // Gib das ausgewählte Element aus
    WriteLn('Ausgewähltes Element: ', selectedItem);
    WriteLn('Ausgewähltes Index: ', selectedIndex);
    Exit(TCL_OK);
  end;


  procedure MoveCircle(clientData: TClientData); cdecl;
  var
    interp: PTcl_Interp absolute clientData;
  const
    x1: integer = 50;
    y1: integer = 100;
    x2: integer = 60;
    y2: integer = 150;
    dx: integer = 2;
  var
    cmd: string;
  begin
    x1 += dx;
    x2 += dx * 2;
    if (x1 > 150) or (x1 < 50) then begin
      dx := -dx;
    end;

    Tcl_Eval(interp, '.c delete circle');

    WriteStr(cmd, '.c create oval ', x1 - 20, ' ', y1 - 20, ' ', x1 + 20, ' ', y1 + 20, ' -outline black -fill yellow -tags circle');
    if Tcl_Eval(interp, PChar(cmd)) <> TCL_OK then begin
      WriteLn('Fehler beim Erstellen des Kreises: ', Tcl_GetStringResult(interp));
    end;
    WriteStr(cmd, '.c create oval ', x2 - 20, ' ', y2 - 20, ' ', x2 + 20, ' ', y2 + 20, ' -outline black -fill green -tags circle');
    if Tcl_Eval(interp, PChar(cmd)) <> TCL_OK then begin
      WriteLn('Fehler beim Erstellen des Kreises: ', Tcl_GetStringResult(interp));
    end;

    Tcl_CreateTimerHandler(30, @MoveCircle, interp);
  end;

  function main(argc: integer; argv: PPChar): integer;
  var
    mainWindow: TTk_Window;
    interp: PTcl_Interp;
  begin
    interp := Tcl_CreateInterp();
    if Tcl_Init(interp) = TCL_ERROR then begin
      WriteLn('Tcl_Init Fehler: ', Tcl_GetStringResult(interp));
      Exit(1);
    end;

    if Tk_Init(interp) = TCL_ERROR then begin
      WriteLn('Tk_Init Fehler: ', Tcl_GetStringResult(interp));
      Exit(1);
    end;

    mainWindow := Tk_MainWindow(interp);
    if mainWindow = nil then begin
      WriteLn('Fehler beim Erstellen des Hauptfensters: ', Tcl_GetStringResult(interp));
      Exit(1);
    end;
    Tk_SetAppName(mainWindow, 'Listbox Beispiel');

    // Erstelle die Listbox
    if Tcl_Eval(interp, 'listbox .listbox -height 10 -selectmode browse; pack .listbox -side top -padx 10 -pady 10') <> TCL_OK then begin
      WriteLn('Fehler beim Erstellen der Listbox: ', Tcl_GetStringResult(interp));
      Exit(1);
    end;

    // Füge Elemente zur Listbox hinzu
    if Tcl_Eval(interp, '.listbox insert end "Apfel" "Orange" "Banane" "Pfirsich" "Traube" "Birne"') <> TCL_OK then begin
      WriteLn('Fehler beim Hinzufügen von Elementen: ', Tcl_GetStringResult(interp));
      Exit(1);
    end;

    // Registriere die Funktion `printSelection` als Tcl-Befehl
    if Tcl_CreateCommand(interp, 'printSelection', @printSelection, nil, nil) = nil then begin
      WriteLn('Fehler beim Registrieren der printSelection-Funktion.');
      Exit(1);
    end;

    // Erstelle den Button zum Beenden der Anwendung
    if Tcl_Eval(interp, 'button .quit -text "Quit" -command {exit}; pack .quit -side left -padx 10 -pady 10') <> TCL_OK then begin
      WriteLn('Fehler beim Erstellen des Quit-Buttons: ', Tcl_GetStringResult(interp));
      Exit(1);
    end;

    // Erstelle den Button zum Ausgeben der Auswahl
    if Tcl_Eval(interp, 'button .print -text "Print Selection" -command printSelection; pack .print -side left -padx 10 -pady 10') <> TCL_OK then begin
      WriteLn('Fehler beim Erstellen des Print-Buttons: ', Tcl_GetStringResult(interp));
      Exit(1);
    end;

    // ================

    Tcl_Eval(interp, 'pack [canvas .c -width 200 -height 200]');

    Tcl_Eval(interp, 'set ida1 [.c create oval 10 10 60 60 -fill red]');
    Tcl_Eval(interp, 'set id2 [.c create oval 100 100 150 150 -fill blue]');

    WriteLn('id1: ', Tcl_GetVar(interp, 'id1', TCL_GLOBAL_ONLY));

    Tcl_CreateTimerHandler(30, @MoveCircle, interp);


    // Erstelle ein Eingabefeld
    if Tcl_Eval(interp, 'entry .entry -width 30; pack .entry -side top -padx 10 -pady 10') <> TCL_OK then begin
      WriteLn('Fehler beim Erstellen des Eingabefeldes: ', Tcl_GetStringResult(interp));
      Exit(1);
    end;

    // =====================0



    // Starte die Haupt-Ereignisschleife
    Tk_MainLoop();

    // Aufräumen
    Tcl_DeleteInterp(interp);

    Result := 0;

  end;

  procedure timper_cp(clientData: TClientData); cdecl;
  const
    counter: integer = 0;
  begin
    Inc(counter);

    if counter < 10 then begin
      Tcl_CreateTimerHandler(100, @timper_cp, nil);
    end;

    WriteLn('counter: ', counter);
  end;

  procedure Test;
  var
    interp: PTcl_Interp;
    f: double;
  begin
    interp := Tcl_CreateInterp; // Tcl-Interpreter erzeugen

    if Tcl_Init(interp) = TCL_ERROR then begin
      WriteLn('Tcl_Init error: ', Tcl_GetStringResult(interp));
      Exit;
    end;

    if Tcl_ExprString(interp, '3 * (7 + 2)') <> TCL_OK then begin
      WriteLn('Fehler: ', Tcl_GetStringResult(interp));
    end else begin
      WriteLn('Ergebniss: ', Tcl_GetStringResult(interp));
    end;

    if Tcl_ExprDouble(interp, 'sin(0.5) + pow(3, 4) / sqrt(2)', @f) <> TCL_OK then begin
      WriteLn('Fehler: ', Tcl_GetStringResult(interp));
    end else begin
      WriteLn('Ergebniss: ', f: 4: 2);
    end;


    // Einfache Tcl-Anweisung ausführen
    if Tcl_Eval(interp, 'set hw "Hello World! ( Tcl_Eval )"; puts $hw') = TCL_ERROR then begin
      WriteLn('Tcl_Eval error: ', Tcl_GetStringResult(interp));
      Tcl_DeleteInterp(interp);
      Exit;
    end;

    if Tcl_EvalFile(interp, 'text.tcl') = TCL_ERROR then begin
      WriteLn('Tcl_EvalFile error: ', Tcl_GetStringResult(interp));
      Tcl_DeleteInterp(interp);
      Exit;
    end;


    // Ergebnis auslesen
    WriteLn('Tcl result: ', Tcl_GetStringResult(interp));


    Tcl_CreateTimerHandler(100, @timper_cp, nil);

    Tcl_DeleteInterp(interp); // Interpreter freigeben

  end;

function DoubleCmd(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl;
var
  num1, num2: Double;
  ch: PChar;
begin
  WriteLn('args: ', objc);

  if objc <> 3 then begin
      Tcl_WrongNumArgs(interp, 1, objv, 'Zahl');
      WriteLn('cmd error 1');
      Exit(TCL_ERROR);
  end;

  ch:=Tcl_GetString(objv[0]);
  WriteLn('objv[i]: ',ch);

  if Tcl_GetDoubleFromObj(interp, objv[1], @num1) <> TCL_OK then begin
      WriteLn('cmd error 2');
      Exit(TCL_ERROR);
  end;

  if Tcl_GetDoubleFromObj(interp, objv[2], @num2) <> TCL_OK then begin
      WriteLn('cmd error 2');
      Exit(TCL_ERROR);
  end;

  Tcl_SetObjResult(interp, Tcl_NewDoubleObj(num1 + num2));
  Exit(TCL_OK);
end;

procedure doubleTest;
var
  interp: PTcl_Interp;
begin
  interp := Tcl_CreateInterp; // Tcl-Interpreter erzeugen

  Tcl_Init(interp);

  Tcl_CreateObjCommand(interp, 'double', @DoubleCmd, nil, nil);

  Tcl_Eval(interp, 'puts [double 3.3 6.7]');


  Tcl_DeleteInterp(interp); // Interpreter freigeben
  end;

begin
  test;
  doubleTest;
  main(0, nil);

end.
