program project1;

uses
  fp_objc;

  procedure main;
  var
    objc_cls, cls: TClass;
  begin
    WriteLn('🔍 Suche libobjc4 Klassen...');

    objc_cls := objc_lookUpClass('NSObject');
    cls := objc_allocateClassPair(objc_cls, 'MyClass', 0);

    if cls = nil then begin
      WriteLn('❌ libobjc4 Runtime nicht initialisiert');
      WriteLn('💡 Lösung: sudo apt install libobjc4');
      Exit;
    end;

    WriteLn('✅ libobjc4 Version: ', class_getName(cls));
    WriteLn('✅ objc_lookUpClass: ', PtrUInt(objc_cls));

    objc_disposeClassPair(cls);

    WriteLn('✅ libobjc4 Runtime Demo erfolgreich!');
  end;

begin
  main;
end.
