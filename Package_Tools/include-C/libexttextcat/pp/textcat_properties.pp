
unit textcat_properties;
interface

{
  Automatically converted by H2Pas 1.0.0 from textcat_properties.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    textcat_properties.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Ptextcat_Bool_s  = ^textcat_Bool_s;
Ptextcat_Property  = ^textcat_Property;
Ptextcat_Property_s  = ^textcat_Property_s;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _TEXTCAT_PROPERTIES_H_}
{$define _TEXTCAT_PROPERTIES_H_}
type
  Ttextcat_Property_s =  Longint;
  Const
    TCPROP_UTF8AWARE = 0;
    TCPROP_MINIMUM_DOCUMENT_SIZE = 1;
    TCPROP_LAST = 2;

type
  Ttextcat_Bool_s =  Longint;
  Const
    TC_FALSE = 0;
    TC_TRUE = 1;

type
  Ptextcat_Property = ^Ttextcat_Property;
  Ttextcat_Property = Ttextcat_Property_s;
{$endif}

implementation


end.
