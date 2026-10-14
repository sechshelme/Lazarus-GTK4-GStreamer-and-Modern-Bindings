
unit libvirt_host;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_host.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_host.h
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
Pbyte  = ^byte;
Pchar  = ^char;
Pdword  = ^dword;
Plongint  = ^longint;
Pqword  = ^qword;
PvirConnect  = ^virConnect;
PvirConnectAuth  = ^virConnectAuth;
PvirConnectAuthPtr  = ^virConnectAuthPtr;
PvirConnectBaselineCPUFlags  = ^virConnectBaselineCPUFlags;
PvirConnectCompareCPUFlags  = ^virConnectCompareCPUFlags;
PvirConnectCredential  = ^virConnectCredential;
PvirConnectCredentialPtr  = ^virConnectCredentialPtr;
PvirConnectCredentialType  = ^virConnectCredentialType;
PvirConnectFlags  = ^virConnectFlags;
PvirConnectPtr  = ^virConnectPtr;
PvirCPUCompareResult  = ^virCPUCompareResult;
PvirNodeAllocPagesFlags  = ^virNodeAllocPagesFlags;
PvirNodeCPUStats  = ^virNodeCPUStats;
PvirNodeCPUStatsPtr  = ^virNodeCPUStatsPtr;
PvirNodeGetCPUStatsAllCPUs  = ^virNodeGetCPUStatsAllCPUs;
PvirNodeGetMemoryStatsAllCells  = ^virNodeGetMemoryStatsAllCells;
PvirNodeInfo  = ^virNodeInfo;
PvirNodeInfoPtr  = ^virNodeInfoPtr;
PvirNodeMemoryStats  = ^virNodeMemoryStats;
PvirNodeMemoryStatsPtr  = ^virNodeMemoryStatsPtr;
PvirNodeSuspendTarget  = ^virNodeSuspendTarget;
PvirSecurityLabel  = ^virSecurityLabel;
PvirSecurityLabelPtr  = ^virSecurityLabelPtr;
PvirSecurityModel  = ^virSecurityModel;
PvirSecurityModelPtr  = ^virSecurityModelPtr;
PvirStream  = ^virStream;
PvirStreamPtr  = ^virStreamPtr;
PvirTypedParameterPtr  = ^virTypedParameterPtr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-host.h
 * Summary: APIs for management of hosts
 * Description: Provides APIs for the management of hosts
 *
 * Copyright (C) 2006-2014 Red Hat, Inc.
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
 * License along with this library.  If not, see
 * <http://www.gnu.org/licenses/>.
  }
{$ifndef LIBVIRT_HOST_H}
{$define LIBVIRT_HOST_H}
{$ifndef __VIR_LIBVIRT_H_INCLUDES__}
{$error "Don't include this file directly, only use libvirt/libvirt.h"}
{$endif}
{*
 * virConnect:
 *
 * a virConnect is a private structure representing a connection to
 * the Hypervisor.
 *
 * Since: 0.0.1
  }
type
{*
 * virConnectPtr:
 *
 * a virConnectPtr is pointer to a virConnect private structure, this is the
 * type used to reference a connection to the Hypervisor in the API.
 *
 * Since: 0.0.1
  }

  PvirConnectPtr = ^TvirConnectPtr;
  TvirConnectPtr = PvirConnect;
{*
 * virNodeSuspendTarget:
 *
 * Flags to indicate which system-wide sleep state the host must be
 * transitioned to.
 *
 * Since: 0.9.8
  }
{ (Since: 0.9.8)  }
{ (Since: 0.9.8)  }
{ (Since: 0.9.8)  }
{$ifdef VIR_ENUM_SENTINELS}
{ This constant is subject to change (Since: 0.9.8)  }
{$endif}
type
  PvirNodeSuspendTarget = ^TvirNodeSuspendTarget;
  TvirNodeSuspendTarget =  Longint;
  Const
    VIR_NODE_SUSPEND_TARGET_MEM = 0;
    VIR_NODE_SUSPEND_TARGET_DISK = 1;
    VIR_NODE_SUSPEND_TARGET_HYBRID = 2;
    VIR_NODE_SUSPEND_TARGET_LAST = 3;
;
{*
 * virStream:
 *
 * a virStream is a private structure representing a data stream.
 *
 * Since: 0.7.2
  }
type
{*
 * virStreamPtr:
 *
 * a virStreamPtr is pointer to a virStream private structure, this is the
 * type used to reference a data stream in the API.
 *
 * Since: 0.7.2
  }

  PvirStreamPtr = ^TvirStreamPtr;
  TvirStreamPtr = PvirStream;
{*
 * VIR_SECURITY_LABEL_BUFLEN:
 *
 * Macro providing the maximum length of the virSecurityLabel label string.
 * Note that this value is based on that used by Labeled NFS.
 *
 * Since: 0.6.1
  }

const
  VIR_SECURITY_LABEL_BUFLEN = 4096+1;  
{*
 * virSecurityLabel:
 *
 * a virSecurityLabel is a structure filled by virDomainGetSecurityLabel(),
 * providing the security label and associated attributes for the specified
 * domain.
 *
 * Since: 0.6.1
  }
type
{ security label string  }
{ 1 if security policy is being enforced for domain  }
  PvirSecurityLabel = ^TvirSecurityLabel;
  TvirSecurityLabel = record
      _label : array[0..(VIR_SECURITY_LABEL_BUFLEN)-1] of char;
      enforcing : longint;
    end;

{*
 * virSecurityLabelPtr:
 *
 * a virSecurityLabelPtr is a pointer to a virSecurityLabel.
 *
 * Since: 0.6.1
  }

  PvirSecurityLabelPtr = ^TvirSecurityLabelPtr;
  TvirSecurityLabelPtr = PvirSecurityLabel;
{*
 * VIR_SECURITY_MODEL_BUFLEN:
 *
 * Macro providing the maximum length of the virSecurityModel model string.
 *
 * Since: 0.6.1
  }

const
  VIR_SECURITY_MODEL_BUFLEN = 256+1;  
{*
 * VIR_SECURITY_DOI_BUFLEN:
 *
 * Macro providing the maximum length of the virSecurityModel doi string.
 *
 * Since: 0.6.1
  }
  VIR_SECURITY_DOI_BUFLEN = 256+1;  
{*
 * virSecurityModel:
 *
 * a virSecurityModel is a structure filled by virNodeGetSecurityModel(),
 * providing the per-hypervisor security model and DOI attributes for the
 * specified domain.
 *
 * Since: 0.6.1
  }
type
{ security model string  }
{ domain of interpretation  }
  PvirSecurityModel = ^TvirSecurityModel;
  TvirSecurityModel = record
      model : array[0..(VIR_SECURITY_MODEL_BUFLEN)-1] of char;
      doi : array[0..(VIR_SECURITY_DOI_BUFLEN)-1] of char;
    end;

{*
 * virSecurityModelPtr:
 *
 * a virSecurityModelPtr is a pointer to a virSecurityModel.
 *
 * Since: 0.6.1
  }

  PvirSecurityModelPtr = ^TvirSecurityModelPtr;
  TvirSecurityModelPtr = PvirSecurityModel;
{ data types related to virNodePtr  }
{*
 * virNodeInfo:
 *
 * a virNodeInfo is a structure filled by virNodeGetInfo() and providing
 * the information for the Node.
 *
 * Note that the information in this struct is not guaranteed to be an
 * accurate relection of the system hardware. See the virNodeGetInfo()
 * API documentation for further guidance.
 *
 * Since: 0.1.0
  }
{ string indicating the CPU model  }
{ memory size in kilobytes  }
{ the number of active CPUs  }
{ expected CPU frequency, 0 if not known or
                             on unusual architectures  }
{ the number of NUMA cell, 1 for unusual NUMA
                             topologies or uniform memory access; check
                             capabilities XML for the actual NUMA topology  }
{ number of CPU sockets per node if nodes > 1,
                             1 in case of unusual NUMA topology  }
{ number of cores per socket, total number of
                             processors in case of unusual NUMA topology  }
{ number of threads per core, 1 in case of
                             unusual numa topology  }
  PvirNodeInfo = ^TvirNodeInfo;
  TvirNodeInfo = record
      model : array[0..31] of char;
      memory : dword;
      cpus : dword;
      mhz : dword;
      nodes : dword;
      sockets : dword;
      cores : dword;
      threads : dword;
    end;

{*
 * VIR_NODE_CPU_STATS_FIELD_LENGTH:
 *
 * Macro providing the field length of virNodeCPUStats
 *
 * Since: 0.9.3
  }

const
  VIR_NODE_CPU_STATS_FIELD_LENGTH = 80;  
{*
 * virNodeGetCPUStatsAllCPUs:
 *
 * Value for specifying request for the total CPU time/utilization
 *
 * Since: 0.9.8
  }
{ (Since: 0.9.3)  }
type
  PvirNodeGetCPUStatsAllCPUs = ^TvirNodeGetCPUStatsAllCPUs;
  TvirNodeGetCPUStatsAllCPUs =  Longint;
  Const
    VIR_NODE_CPU_STATS_ALL_CPUS = -(1);
;
{*
 * VIR_NODE_CPU_STATS_KERNEL:
 *
 * Macro for the cumulative CPU time which was spent by the kernel,
 * since the node booting up (in nanoseconds).
 *
 * Since: 0.9.3
  }
  VIR_NODE_CPU_STATS_KERNEL = 'kernel';  
{*
 * VIR_NODE_CPU_STATS_USER:
 *
 * The cumulative CPU time which was spent by user processes,
 * since the node booting up (in nanoseconds).
 *
 * Since: 0.9.3
  }
  VIR_NODE_CPU_STATS_USER = 'user';  
{*
 * VIR_NODE_CPU_STATS_IDLE:
 *
 * The cumulative idle CPU time,
 * since the node booting up (in nanoseconds).
 *
 * Since: 0.9.3
  }
  VIR_NODE_CPU_STATS_IDLE = 'idle';  
{*
 * VIR_NODE_CPU_STATS_IOWAIT:
 *
 * The cumulative I/O wait CPU time,
 * since the node booting up (in nanoseconds).
 *
 * Since: 0.9.3
  }
  VIR_NODE_CPU_STATS_IOWAIT = 'iowait';  
{*
 * VIR_NODE_CPU_STATS_INTR:
 *
 * The cumulative interrupt CPU time,
 * since the node booting up (in nanoseconds).
 *
 * Since: 1.2.2
  }
  VIR_NODE_CPU_STATS_INTR = 'intr';  
{*
 * VIR_NODE_CPU_STATS_UTILIZATION:
 *
 * The CPU utilization of a node.
 * The usage value is in percent and 100% represents all CPUs of
 * the node.
 *
 * Since: 0.9.3
  }
  VIR_NODE_CPU_STATS_UTILIZATION = 'utilization';  
{*
 * virNodeCPUStats:
 *
 * a virNodeCPUStats is a structure filled by virNodeGetCPUStats()
 * providing information about the CPU stats of the node.
 *
 * Since: 0.9.3
  }
type
  PvirNodeCPUStats = ^TvirNodeCPUStats;
  TvirNodeCPUStats = record
      field : array[0..(VIR_NODE_CPU_STATS_FIELD_LENGTH)-1] of char;
      value : qword;
    end;

{*
 * VIR_NODE_MEMORY_STATS_FIELD_LENGTH:
 *
 * Macro providing the field length of virNodeMemoryStats
 *
 * Since: 0.9.3
  }

const
  VIR_NODE_MEMORY_STATS_FIELD_LENGTH = 80;  
{*
 * virNodeGetMemoryStatsAllCells:
 *
 * Value for specifying request for the total memory of all cells.
 *
 * Since: 0.9.8
  }
{ (Since: 0.9.3)  }
type
  PvirNodeGetMemoryStatsAllCells = ^TvirNodeGetMemoryStatsAllCells;
  TvirNodeGetMemoryStatsAllCells =  Longint;
  Const
    VIR_NODE_MEMORY_STATS_ALL_CELLS = -(1);
;
{*
 * VIR_NODE_MEMORY_STATS_TOTAL:
 *
 * Macro for the total memory of specified cell:
 * it represents the maximum memory.
 *
 * Since: 0.9.3
  }
  VIR_NODE_MEMORY_STATS_TOTAL = 'total';  
{*
 * VIR_NODE_MEMORY_STATS_FREE:
 *
 * Macro for the free memory of specified cell:
 * On Linux, it includes buffer and cached memory, in case of
 * VIR_NODE_MEMORY_STATS_ALL_CELLS.
 *
 * Since: 0.9.3
  }
  VIR_NODE_MEMORY_STATS_FREE = 'free';  
{*
 * VIR_NODE_MEMORY_STATS_BUFFERS:
 *
 * Macro for the buffer memory: On Linux, it is only returned in case of
 * VIR_NODE_MEMORY_STATS_ALL_CELLS.
 *
 * Since: 0.9.3
  }
  VIR_NODE_MEMORY_STATS_BUFFERS = 'buffers';  
{*
 * VIR_NODE_MEMORY_STATS_CACHED:
 *
 * Macro for the cached memory: On Linux, it is only returned in case of
 * VIR_NODE_MEMORY_STATS_ALL_CELLS.
 *
 * Since: 0.9.3
  }
  VIR_NODE_MEMORY_STATS_CACHED = 'cached';  
{*
 * virNodeMemoryStats:
 *
 * a virNodeMemoryStats is a structure filled by virNodeGetMemoryStats()
 * providing information about the memory of the node.
 *
 * Since: 0.9.3
  }
type
  PvirNodeMemoryStats = ^TvirNodeMemoryStats;
  TvirNodeMemoryStats = record
      field : array[0..(VIR_NODE_MEMORY_STATS_FIELD_LENGTH)-1] of char;
      value : qword;
    end;

{
 * VIR_NODE_MEMORY_SHARED_PAGES_TO_SCAN:
 *
 * Macro for typed parameter that represents how many present pages
 * to scan before the shared memory service goes to sleep.
 *
 * Since: 0.10.2
  }

const
  VIR_NODE_MEMORY_SHARED_PAGES_TO_SCAN = 'shm_pages_to_scan';  
{
 * VIR_NODE_MEMORY_SHARED_SLEEP_MILLISECS:
 *
 * Macro for typed parameter that represents how many milliseconds
 * the shared memory service should sleep before next scan.
 *
 * Since: 0.10.2
  }
  VIR_NODE_MEMORY_SHARED_SLEEP_MILLISECS = 'shm_sleep_millisecs';  
{
 * VIR_NODE_MEMORY_SHARED_PAGES_SHARED:
 *
 * Macro for typed parameter that represents how many the shared
 * memory pages are being used.
 *
 * Since: 0.10.2
  }
  VIR_NODE_MEMORY_SHARED_PAGES_SHARED = 'shm_pages_shared';  
{
 * VIR_NODE_MEMORY_SHARED_PAGES_SHARING:
 *
 * Macro for typed parameter that represents how many sites are
 * sharing the pages i.e. how much saved.
 *
 * Since: 0.10.2
  }
  VIR_NODE_MEMORY_SHARED_PAGES_SHARING = 'shm_pages_sharing';  
{
 * VIR_NODE_MEMORY_SHARED_PAGES_UNSHARED:
 *
 * Macro for typed parameter that represents how many pages unique
 * but repeatedly checked for merging.
 *
 * Since: 0.10.2
  }
  VIR_NODE_MEMORY_SHARED_PAGES_UNSHARED = 'shm_pages_unshared';  
{
 * VIR_NODE_MEMORY_SHARED_PAGES_VOLATILE:
 *
 * Macro for typed parameter that represents how many pages changing
 * too fast to be placed in a tree.
 *
 * Since: 0.10.2
  }
  VIR_NODE_MEMORY_SHARED_PAGES_VOLATILE = 'shm_pages_volatile';  
{
 * VIR_NODE_MEMORY_SHARED_FULL_SCANS:
 *
 * Macro for typed parameter that represents how many times all
 * mergeable areas have been scanned.
 *
 * Since: 0.10.2
  }
  VIR_NODE_MEMORY_SHARED_FULL_SCANS = 'shm_full_scans';  
{
 * VIR_NODE_MEMORY_SHARED_MERGE_ACROSS_NODES:
 *
 * Macro for typed parameter that represents whether pages from
 * different NUMA nodes can be merged. The parameter has type int,
 * when its value is 0, only pages which physically reside in the
 * memory area of same NUMA node are merged; When its value is 1,
 * pages from all nodes can be merged. Other values are reserved
 * for future use.
 *
 * Since: 1.0.0
  }
  VIR_NODE_MEMORY_SHARED_MERGE_ACROSS_NODES = 'shm_merge_across_nodes';  

function virNodeGetMemoryParameters(conn:TvirConnectPtr; params:TvirTypedParameterPtr; nparams:Plongint; flags:dword):longint;cdecl;external;
function virNodeSetMemoryParameters(conn:TvirConnectPtr; params:TvirTypedParameterPtr; nparams:longint; flags:dword):longint;cdecl;external;
{
 *  node CPU map
  }
function virNodeGetCPUMap(conn:TvirConnectPtr; cpumap:PPbyte; online:Pdword; flags:dword):longint;cdecl;external;
{*
 * VIR_NODEINFO_MAXCPUS:
 * @nodeinfo: virNodeInfo instance
 *
 * This macro is to calculate the total number of CPUs supported
 * but not necessary active in the host.
 *
 * Since: 0.1.4
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIR_NODEINFO_MAXCPUS(nodeinfo : longint) : longint;

{*
 * virNodeInfoPtr:
 *
 * a virNodeInfoPtr is a pointer to a virNodeInfo structure.
 *
 * Since: 0.1.0
  }
type
  PvirNodeInfoPtr = ^TvirNodeInfoPtr;
  TvirNodeInfoPtr = PvirNodeInfo;
{*
 * virNodeCPUStatsPtr:
 *
 * a virNodeCPUStatsPtr is a pointer to a virNodeCPUStats structure.
 *
 * Since: 0.9.3
  }

  PvirNodeCPUStatsPtr = ^TvirNodeCPUStatsPtr;
  TvirNodeCPUStatsPtr = PvirNodeCPUStats;
{*
 * virNodeMemoryStatsPtr:
 *
 * a virNodeMemoryStatsPtr is a pointer to a virNodeMemoryStats structure.
 *
 * Since: 0.9.3
  }

  PvirNodeMemoryStatsPtr = ^TvirNodeMemoryStatsPtr;
  TvirNodeMemoryStatsPtr = PvirNodeMemoryStats;
{*
 *
 * SEV Parameters
  }
{*
 * VIR_NODE_SEV_PDH:
 *
 * Macro represents the Platform Diffie-Hellman key, as VIR_TYPED_PARAMS_STRING.
 *
 * Since: 4.5.0
  }

const
  VIR_NODE_SEV_PDH = 'pdh';  
{*
 * VIR_NODE_SEV_CERT_CHAIN:
 *
 * Macro represents the platform certificate chain that includes the platform
 * endorsement key (PEK), owner certificate authority (OCD) and chip
 * endorsement key (CEK), as VIR_TYPED_PARAMS_STRING.
 *
 * Since: 4.5.0
  }
  VIR_NODE_SEV_CERT_CHAIN = 'cert-chain';  
{*
 * VIR_NODE_SEV_CPU0_ID:
 *
 * Macro represents the unique ID of CPU0 (socket 0) needed to retrieve
 * the signed CEK of the CPU from AMD's Key Distribution Service (KDS),
 * as VIR_TYPED_PARAMS_STRING.
 *
 * Since: 8.4.0
  }
  VIR_NODE_SEV_CPU0_ID = 'cpu0-id';  
{*
 * VIR_NODE_SEV_CBITPOS:
 *
 * Macro represents the CBit Position used by hypervisor when SEV is enabled.
 *
 * Since: 4.5.0
  }
  VIR_NODE_SEV_CBITPOS = 'cbitpos';  
{*
 * VIR_NODE_SEV_REDUCED_PHYS_BITS:
 *
 * Macro represents the number of bits we lose in physical address space
 * when SEV is enabled in the guest.
 *
 * Since: 4.5.0
  }
  VIR_NODE_SEV_REDUCED_PHYS_BITS = 'reduced-phys-bits';  
{*
 * VIR_NODE_SEV_MAX_GUESTS:
 *
 * Macro represents the number of SEV guests that can
 * be run on the host, as a VIR_TYPED_PARAM_UINT.
 *
 * Since: 8.0.0
  }
  VIR_NODE_SEV_MAX_GUESTS = 'max-guests';  
{*
 * VIR_NODE_SEV_MAX_ES_GUESTS:
 *
 * Macro represents the number of SEV-ES guests that can
 * be run on the host, as a VIR_TYPED_PARAM_UINT.
 *
 * Since: 8.0.0
  }
  VIR_NODE_SEV_MAX_ES_GUESTS = 'max-es-guests';  

function virNodeGetSEVInfo(conn:TvirConnectPtr; params:PvirTypedParameterPtr; nparams:Plongint; flags:dword):longint;cdecl;external;
{*
 * virConnectFlags:
 *
 * Flags when opening a connection to a hypervisor
 *
 * Since: 0.4.1
  }
{ A readonly connection (Since: 0.4.1)  }
{ Don't try to resolve URI aliases (Since: 0.9.7)  }
type
  PvirConnectFlags = ^TvirConnectFlags;
  TvirConnectFlags =  Longint;
  Const
    VIR_CONNECT_RO = 1 shl 0;
    VIR_CONNECT_NO_ALIASES = 1 shl 1;
;
{*
 * virConnectCredentialType:
 *
 * Since: 0.4.1
  }
{ Identity to act as (Since: 0.4.1)  }
{ Identify to authorize as (Since: 0.4.1)  }
{ RFC 1766 languages, comma separated (Since: 0.4.1)  }
{ client supplies a nonce (Since: 0.4.1)  }
{ Passphrase secret (Since: 0.4.1)  }
{ Challenge response (Since: 0.4.1)  }
{ Challenge response (Since: 0.4.1)  }
{ Authentication realm (Since: 0.4.1)  }
{ Externally managed credential (Since: 0.4.1)  }
{$ifdef VIR_ENUM_SENTINELS}
{ More may be added - expect the unexpected (Since: 0.9.10)  }
{$endif}
type
  PvirConnectCredentialType = ^TvirConnectCredentialType;
  TvirConnectCredentialType =  Longint;
  Const
    VIR_CRED_USERNAME = 1;
    VIR_CRED_AUTHNAME = 2;
    VIR_CRED_LANGUAGE = 3;
    VIR_CRED_CNONCE = 4;
    VIR_CRED_PASSPHRASE = 5;
    VIR_CRED_ECHOPROMPT = 6;
    VIR_CRED_NOECHOPROMPT = 7;
    VIR_CRED_REALM = 8;
    VIR_CRED_EXTERNAL = 9;
    VIR_CRED_LAST = 10;
;
{ One of virConnectCredentialType constants  }
(* Const before type ignored *)
{ Prompt to show to user  }
(* Const before type ignored *)
{ Additional challenge to show  }
(* Const before type ignored *)
{ Optional default result  }
{ Result to be filled with user response (or defresult)  }
{ Length of the result  }
type
  PvirConnectCredential = ^TvirConnectCredential;
  TvirConnectCredential = record
      _type : longint;
      prompt : Pchar;
      challenge : Pchar;
      defresult : Pchar;
      result : Pchar;
      resultlen : dword;
    end;

{*
 * virConnectCredential:
 *
 * Since: 0.4.1
  }
{*
 * virConnectCredentialPtr:
 *
 * Since: 0.4.1
  }

  PvirConnectCredentialPtr = ^TvirConnectCredentialPtr;
  TvirConnectCredentialPtr = PvirConnectCredential;
{*
 * virConnectAuthCallbackPtr:
 * @cred: list of virConnectCredential object to fetch from user
 * @ncred: size of cred list
 * @cbdata: opaque data passed to virConnectOpenAuth
 *
 * When authentication requires one or more interactions, this callback
 * is invoked. For each interaction supplied, data must be gathered
 * from the user and filled in to the 'result' and 'resultlen' fields.
 * If an interaction cannot be filled, fill in NULL and 0.
 *
 * Returns 0 if all interactions were filled, or -1 upon error
 *
 * Since: 0.4.1
  }

  TvirConnectAuthCallbackPtr = function (cred:TvirConnectCredentialPtr; ncred:dword; cbdata:pointer):longint;cdecl;
{ List of supported virConnectCredentialType values  }
{ Callback used to collect credentials  }
  PvirConnectAuth = ^TvirConnectAuth;
  TvirConnectAuth = record
      credtype : Plongint;cdecl;
      ncredtype : dword;
      cb : TvirConnectAuthCallbackPtr;
      cbdata : pointer;
    end;

{*
 * virConnectAuth:
 *
 * Since: 0.4.1
  }
{*
 * virConnectAuthPtr:
 *
 * Since: 0.4.1
  }

  PvirConnectAuthPtr = ^TvirConnectAuthPtr;
  TvirConnectAuthPtr = PvirConnectAuth;
{
 * virConnectAuthPtrDefault:
 *
 * A default implementation of the authentication callbacks. This
 * implementation is suitable for command line based tools. It will
 * prompt for username, passwords, realm and one time keys as needed.
 * It will print on STDOUT, and read from STDIN. If this is not
 * suitable for the application's needs an alternative implementation
 * should be provided.
 *
 * Since: 0.4.1
  }
  var
    virConnectAuthPtrDefault : TvirConnectAuthPtr;cvar;external;
{*
 * VIR_UUID_BUFLEN:
 *
 * This macro provides the length of the buffer required
 * for virDomainGetUUID()
 *
 * Since: 0.2.0
  }

const
  VIR_UUID_BUFLEN = 16;  
{*
 * VIR_UUID_STRING_BUFLEN:
 *
 * This macro provides the length of the buffer required
 * for virDomainGetUUIDString()
 *
 * Since: 0.2.0
  }
  VIR_UUID_STRING_BUFLEN = 36+1;  
(* Const before type ignored *)

function virGetVersion(libVer:Pdword; _type:Pchar; typeVer:Pdword):longint;cdecl;external;
{
 * Connection and disconnections to the Hypervisor
  }
function virInitialize:longint;cdecl;external;
(* Const before type ignored *)
function virConnectOpen(name:Pchar):TvirConnectPtr;cdecl;external;
(* Const before type ignored *)
function virConnectOpenReadOnly(name:Pchar):TvirConnectPtr;cdecl;external;
(* Const before type ignored *)
function virConnectOpenAuth(name:Pchar; auth:TvirConnectAuthPtr; flags:dword):TvirConnectPtr;cdecl;external;
function virConnectRef(conn:TvirConnectPtr):longint;cdecl;external;
function virConnectClose(conn:TvirConnectPtr):longint;cdecl;external;
{*
 * VIR_CONNECT_IDENTITY_USER_NAME:
 *
 * The operating system user name as VIR_TYPED_PARAM_STRING.
 *
 * Since: 5.8.0
  }
const
  VIR_CONNECT_IDENTITY_USER_NAME = 'user-name';  
{*
 * VIR_CONNECT_IDENTITY_UNIX_USER_ID:
 *
 * The UNIX user ID as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 5.8.0
  }
  VIR_CONNECT_IDENTITY_UNIX_USER_ID = 'unix-user-id';  
{*
 * VIR_CONNECT_IDENTITY_GROUP_NAME:
 *
 * The operating system group name as VIR_TYPED_PARAM_STRING.
 *
 * Since: 5.8.0
  }
  VIR_CONNECT_IDENTITY_GROUP_NAME = 'group-name';  
{*
 * VIR_CONNECT_IDENTITY_UNIX_GROUP_ID:
 *
 * The UNIX group ID as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 5.8.0
  }
  VIR_CONNECT_IDENTITY_UNIX_GROUP_ID = 'unix-group-id';  
{*
 * VIR_CONNECT_IDENTITY_PROCESS_ID:
 *
 * The operating system process ID as VIR_TYPED_PARAM_LLONG.
 *
 * Since: 5.8.0
  }
  VIR_CONNECT_IDENTITY_PROCESS_ID = 'process-id';  
{*
 * VIR_CONNECT_IDENTITY_PROCESS_TIME:
 *
 * The operating system process start time as VIR_TYPED_PARAM_ULLONG.
 *
 * The units the time is measured in vary according to the
 * host operating system. On Linux this is usually clock
 * ticks (as reported in /proc/$PID/stat field 22).
 *
 * Since: 5.8.0
  }
  VIR_CONNECT_IDENTITY_PROCESS_TIME = 'process-time';  
{*
 * VIR_CONNECT_IDENTITY_SASL_USER_NAME:
 *
 * The SASL authenticated username as VIR_TYPED_PARAM_STRING
 *
 * Since: 5.8.0
  }
  VIR_CONNECT_IDENTITY_SASL_USER_NAME = 'sasl-user-name';  
{*
 * VIR_CONNECT_IDENTITY_X509_DISTINGUISHED_NAME:
 *
 * The TLS x509 certificate distinguished named as VIR_TYPED_PARAM_STRING
 *
 * Since: 5.8.0
  }
  VIR_CONNECT_IDENTITY_X509_DISTINGUISHED_NAME = 'x509-distinguished-name';  
{*
 * VIR_CONNECT_IDENTITY_SELINUX_CONTEXT:
 *
 * The application's SELinux context as VIR_TYPED_PARAM_STRING.
 *
 * Since: 5.8.0
  }
  VIR_CONNECT_IDENTITY_SELINUX_CONTEXT = 'selinux-context';  

function virConnectSetIdentity(conn:TvirConnectPtr; params:TvirTypedParameterPtr; nparams:longint; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
function virConnectGetType(conn:TvirConnectPtr):Pchar;cdecl;external;
function virConnectGetVersion(conn:TvirConnectPtr; hvVer:Pdword):longint;cdecl;external;
function virConnectGetLibVersion(conn:TvirConnectPtr; libVer:Pdword):longint;cdecl;external;
function virConnectGetHostname(conn:TvirConnectPtr):Pchar;cdecl;external;
function virConnectGetURI(conn:TvirConnectPtr):Pchar;cdecl;external;
function virConnectGetSysinfo(conn:TvirConnectPtr; flags:dword):Pchar;cdecl;external;
function virConnectSetKeepAlive(conn:TvirConnectPtr; interval:longint; count:dword):longint;cdecl;external;
{*
 * virConnectCloseFunc:
 * @conn: virConnect connection
 * @reason: reason why the connection was closed (one of virConnectCloseReason)
 * @opaque: opaque user data
 *
 * A callback function to be registered, and called when the connection
 * is closed.
 *
 * Since: 0.10.0
  }
type

  TvirConnectCloseFunc = procedure (conn:TvirConnectPtr; reason:longint; opaque:pointer);cdecl;

function virConnectRegisterCloseCallback(conn:TvirConnectPtr; cb:TvirConnectCloseFunc; opaque:pointer; freecb:TvirFreeCallback):longint;cdecl;external;
function virConnectUnregisterCloseCallback(conn:TvirConnectPtr; cb:TvirConnectCloseFunc):longint;cdecl;external;
{
 * Capabilities of the connection / driver.
  }
(* Const before type ignored *)
function virConnectGetMaxVcpus(conn:TvirConnectPtr; _type:Pchar):longint;cdecl;external;
function virNodeGetInfo(conn:TvirConnectPtr; info:TvirNodeInfoPtr):longint;cdecl;external;
function virConnectGetCapabilities(conn:TvirConnectPtr):Pchar;cdecl;external;
function virNodeGetCPUStats(conn:TvirConnectPtr; cpuNum:longint; params:TvirNodeCPUStatsPtr; nparams:Plongint; flags:dword):longint;cdecl;external;
function virNodeGetMemoryStats(conn:TvirConnectPtr; cellNum:longint; params:TvirNodeMemoryStatsPtr; nparams:Plongint; flags:dword):longint;cdecl;external;
function virNodeGetFreeMemory(conn:TvirConnectPtr):qword;cdecl;external;
function virNodeGetSecurityModel(conn:TvirConnectPtr; secmodel:TvirSecurityModelPtr):longint;cdecl;external;
function virNodeSuspendForDuration(conn:TvirConnectPtr; target:dword; duration:qword; flags:dword):longint;cdecl;external;
{
 * NUMA support
  }
function virNodeGetCellsFreeMemory(conn:TvirConnectPtr; freeMems:Pqword; startCell:longint; maxCells:longint):longint;cdecl;external;
function virConnectIsEncrypted(conn:TvirConnectPtr):longint;cdecl;external;
function virConnectIsSecure(conn:TvirConnectPtr):longint;cdecl;external;
function virConnectIsAlive(conn:TvirConnectPtr):longint;cdecl;external;
{
 * CPU specification API
  }
{*
 * virCPUCompareResult:
 *
 * Since: 0.7.5
  }
{ (Since: 0.7.5)  }
{ (Since: 0.7.5)  }
{ (Since: 0.7.5)  }
{ (Since: 0.7.5)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 0.9.10)  }
{$endif}
type
  PvirCPUCompareResult = ^TvirCPUCompareResult;
  TvirCPUCompareResult =  Longint;
  Const
    VIR_CPU_COMPARE_ERROR = -(1);
    VIR_CPU_COMPARE_INCOMPATIBLE = 0;
    VIR_CPU_COMPARE_IDENTICAL = 1;
    VIR_CPU_COMPARE_SUPERSET = 2;
    VIR_CPU_COMPARE_LAST = 3;
;
{*
 * virConnectCompareCPUFlags:
 *
 * Since: 1.2.6
  }
{ treat incompatible
                                                             CPUs as failure (Since: 1.2.6)  }
{ validate the xml
                                                        document (Since: 6.9.0)  }
type
  PvirConnectCompareCPUFlags = ^TvirConnectCompareCPUFlags;
  TvirConnectCompareCPUFlags =  Longint;
  Const
    VIR_CONNECT_COMPARE_CPU_FAIL_INCOMPATIBLE = 1 shl 0;
    VIR_CONNECT_COMPARE_CPU_VALIDATE_XML = 1 shl 1;
;
(* Const before type ignored *)

function virConnectCompareCPU(conn:TvirConnectPtr; xmlDesc:Pchar; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function virConnectCompareHypervisorCPU(conn:TvirConnectPtr; emulator:Pchar; arch:Pchar; machine:Pchar; virttype:Pchar; 
           xmlCPU:Pchar; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
function virConnectGetCPUModelNames(conn:TvirConnectPtr; arch:Pchar; models:PPPchar; flags:dword):longint;cdecl;external;
{*
 * virConnectBaselineCPUFlags:
 *
 * Flags when getting XML description of a computed CPU
 *
 * Since: 1.1.2
  }
{ show all features (Since: 1.1.2)  }
{ filter out non-migratable features (Since: 1.2.14)  }
type
  PvirConnectBaselineCPUFlags = ^TvirConnectBaselineCPUFlags;
  TvirConnectBaselineCPUFlags =  Longint;
  Const
    VIR_CONNECT_BASELINE_CPU_EXPAND_FEATURES = 1 shl 0;
    VIR_CONNECT_BASELINE_CPU_MIGRATABLE = 1 shl 1;
;
(* Const before type ignored *)

function virConnectBaselineCPU(conn:TvirConnectPtr; xmlCPUs:PPchar; ncpus:dword; flags:dword):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function virConnectBaselineHypervisorCPU(conn:TvirConnectPtr; emulator:Pchar; arch:Pchar; machine:Pchar; virttype:Pchar; 
           xmlCPUs:PPchar; ncpus:dword; flags:dword):Pchar;cdecl;external;
function virNodeGetFreePages(conn:TvirConnectPtr; npages:dword; pages:Pdword; startcell:longint; cellcount:dword; 
           counts:Pqword; flags:dword):longint;cdecl;external;
{*
 * virNodeAllocPagesFlags:
 *
 * Since: 1.2.9
  }
{ Add @pageCounts to the pages pool. This
                                     can be used only to size up the pool. (Since: 1.2.9)  }
{ Don't add @pageCounts, instead set
                                            passed number of pages. This can be
                                            used to free allocated pages. (Since: 1.2.9)  }
type
  PvirNodeAllocPagesFlags = ^TvirNodeAllocPagesFlags;
  TvirNodeAllocPagesFlags =  Longint;
  Const
    VIR_NODE_ALLOC_PAGES_ADD = 0;
    VIR_NODE_ALLOC_PAGES_SET = 1 shl 0;
;

function virNodeAllocPages(conn:TvirConnectPtr; npages:dword; pageSizes:Pdword; pageCounts:Pqword; startCell:longint; 
           cellCount:dword; flags:dword):longint;cdecl;external;
{$endif}
{ LIBVIRT_HOST_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIR_NODEINFO_MAXCPUS(nodeinfo : longint) : longint;
begin
  VIR_NODEINFO_MAXCPUS:=(((nodeinfo.nodes)*(nodeinfo.sockets))*(nodeinfo.cores))*(nodeinfo.threads);
end;


end.
