
unit libvirt_gconfig_domain_smartcard_host_certificates;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_domain_smartcard_host_certificates.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_domain_smartcard_host_certificates.h
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
Pchar  = ^char;
Pgchar  = ^gchar;
PGError  = ^GError;
PGVirConfigDomainSmartcardHostCertificates  = ^GVirConfigDomainSmartcardHostCertificates;
PGVirConfigDomainSmartcardHostCertificatesClass  = ^GVirConfigDomainSmartcardHostCertificatesClass;
PGVirConfigDomainSmartcardHostCertificatesPrivate  = ^GVirConfigDomainSmartcardHostCertificatesPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-smartcard-host-certificates.h: libvirt domain smartcard host-certificates configuration
 *
 * Copyright (C) 2012 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see
 * <http://www.gnu.org/licenses/>.
 *
 * Author: Alexander Larsson <alexl@redhat.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST_CERTIFICATES : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_SMARTCARD_HOST_CERTIFICATES(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_SMARTCARD_HOST_CERTIFICATES_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_SMARTCARD_HOST_CERTIFICATES(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_SMARTCARD_HOST_CERTIFICATES_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_SMARTCARD_HOST_CERTIFICATES_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirConfigDomainSmartcardHostCertificates = ^TGVirConfigDomainSmartcardHostCertificates;
  TGVirConfigDomainSmartcardHostCertificates = record
      parent : TGVirConfigDomainSmartcard;
      priv : PGVirConfigDomainSmartcardHostCertificatesPrivate;
    end;

  PGVirConfigDomainSmartcardHostCertificatesClass = ^TGVirConfigDomainSmartcardHostCertificatesClass;
  TGVirConfigDomainSmartcardHostCertificatesClass = record
      parent_class : TGVirConfigDomainSmartcardClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_smartcard_host_certificates_get_type:TGType;cdecl;external;
function gvir_config_domain_smartcard_host_certificates_new:PGVirConfigDomainSmartcardHostCertificates;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_smartcard_host_certificates_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainSmartcardHostCertificates;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_smartcard_host_certificates_set_database(smartcard:PGVirConfigDomainSmartcardHostCertificates; path:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gvir_config_domain_smartcard_host_certificates_set_certificates(smartcard:PGVirConfigDomainSmartcardHostCertificates; cert1:Pchar; cert2:Pchar; cert3:Pchar);cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST_CERTIFICATES : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST_CERTIFICATES:=gvir_config_domain_smartcard_host_certificates_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_SMARTCARD_HOST_CERTIFICATES(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_SMARTCARD_HOST_CERTIFICATES:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST_CERTIFICATES,GVirConfigDomainSmartcardHostCertificates);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_SMARTCARD_HOST_CERTIFICATES_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_SMARTCARD_HOST_CERTIFICATES_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST_CERTIFICATES,GVirConfigDomainSmartcardHostCertificatesClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_SMARTCARD_HOST_CERTIFICATES(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_SMARTCARD_HOST_CERTIFICATES:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST_CERTIFICATES);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_SMARTCARD_HOST_CERTIFICATES_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_SMARTCARD_HOST_CERTIFICATES_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST_CERTIFICATES);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_SMARTCARD_HOST_CERTIFICATES_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_SMARTCARD_HOST_CERTIFICATES_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST_CERTIFICATES,GVirConfigDomainSmartcardHostCertificatesClass);
end;


end.
