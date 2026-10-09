unit fp_objc;

interface

const
  {$IFDEF Linux}
  libobjc = 'objc';
  {$ENDIF}

  {$IFDEF Windows}
  libobjc = 'libobjc-4.dll';
  {$ENDIF}

type
  Tsize_t = SizeUInt;
  Tptrdiff_t = PtrInt;

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
