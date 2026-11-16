{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit fp_raylib_package;

{$warn 5023 off : no warning about unused units}
interface

uses
  fp_raylib, fp_rlgl, fp_raymath, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('fp_raylib_package', @Register);
end.
