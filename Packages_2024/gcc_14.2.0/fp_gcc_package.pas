{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit fp_gcc_package;

{$warn 5023 off : no warning about unused units}
interface

uses
  fp_objc, fp_omp, fp_asan, fp_gcc_common, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('fp_gcc_package', @Register);
end.
