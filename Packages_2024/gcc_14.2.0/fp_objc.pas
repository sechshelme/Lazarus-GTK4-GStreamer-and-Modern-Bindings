unit fp_objc;

interface

uses
  fp_gcc_common;

const
  {$IFDEF Linux}
  libobjc = 'objc';
  {$ENDIF}

  {$IFDEF Windows}
  libobjc = 'libobjc-4.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include objc/objc.inc}
  {$include objc/runtime.inc}
  {$include objc/message.inc}
  {$include objc/objc_exception.inc}
  {$include objc/objc_sync.inc}
  {$include objc/thr.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include objc/objc.inc}
{$include objc/runtime.inc}
{$include objc/message.inc}
{$include objc/objc_exception.inc}
{$include objc/objc_sync.inc}
{$include objc/thr.inc}
{$UNDEF read_implementation}

end.
