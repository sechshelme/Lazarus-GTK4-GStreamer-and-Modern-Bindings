
unit cpl_config_extras;
interface

{
  Automatically converted by H2Pas 1.0.0 from cpl_config_extras.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cpl_config_extras.h
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


{ $Id$  }
{$ifndef INCLUDED_CPL_CONFIG_EXTRAS}
{$define INCLUDED_CPL_CONFIG_EXTRAS}
{$if defined(__APPLE__)}
{$ifdef __LP64__}

const
  SIZEOF_UNSIGNED_LONG = 8;  
{$else}

const
  SIZEOF_UNSIGNED_LONG = 4;  
{$endif}
{$ifdef __LP64__}

const
  SIZEOF_VOIDP = 8;  
{$else}

const
  SIZEOF_VOIDP = 4;  
{$endif}
{$ifdef __BIG_ENDIAN__}

const
  WORDS_BIGENDIAN = 1;  
{$else}
{$undef WORDS_BIGENDIAN}
{$endif}
{$undef VSI_STAT64}
{$undef VSI_STAT64_T}

const
  VSI_STAT64 = stat;  
  VSI_STAT64_T = stat;  
{$endif}
{ APPLE }
{$endif}
{ INCLUDED_CPL_CONFIG_EXTRAS }

implementation


end.
