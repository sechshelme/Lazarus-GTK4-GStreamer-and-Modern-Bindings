
unit exttextcat_version;
interface

{
  Automatically converted by H2Pas 1.0.0 from exttextcat_version.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    exttextcat_version.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EXTTEXTCAT_VERSION_H}
{$define EXTTEXTCAT_VERSION_H}

const
  EXTTEXTCAT_VERSION = '3.4.7';  
  EXTTEXTCAT_VERSION_MAJOR = 3;  
  EXTTEXTCAT_VERSION_MINOR = 4;  
  EXTTEXTCAT_VERSION_MICRO = 7;  
{$endif}

implementation


end.
