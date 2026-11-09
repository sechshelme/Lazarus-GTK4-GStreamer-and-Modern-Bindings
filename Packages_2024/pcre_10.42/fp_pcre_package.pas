{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit fp_pcre_package;

{$warn 5023 off : no warning about unused units}
interface

uses
  fp_pcre2_8, fp_pcre2_16, fp_pcre2_32, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('fp_pcre_package', @Register);
end.
