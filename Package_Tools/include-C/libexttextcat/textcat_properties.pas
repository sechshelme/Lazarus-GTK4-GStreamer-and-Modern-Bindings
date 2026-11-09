unit textcat_properties;

interface

uses
  fp_exetextcat;

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

// === Konventiert am: 9-11-26 19:45:27 ===


implementation



end.
