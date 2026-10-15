unit libvirt_domain_checkpoint;

interface

uses
  fp_virt, libvirt_domain, libvirt_host;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PPvirDomainCheckpointPtr = ^PvirDomainCheckpointPtr;
  PvirDomainCheckpointPtr = ^TvirDomainCheckpointPtr;
  TvirDomainCheckpointPtr = type Pointer;

function virDomainCheckpointGetName(checkpoint: TvirDomainCheckpointPtr): pchar; cdecl; external libvirt;
function virDomainCheckpointGetDomain(checkpoint: TvirDomainCheckpointPtr): TvirDomainPtr; cdecl; external libvirt;
function virDomainCheckpointGetConnect(checkpoint: TvirDomainCheckpointPtr): TvirConnectPtr; cdecl; external libvirt;

type
  PvirDomainCheckpointCreateFlags = ^TvirDomainCheckpointCreateFlags;
  TvirDomainCheckpointCreateFlags = longint;
const
  VIR_DOMAIN_CHECKPOINT_CREATE_REDEFINE = 1 shl 0;
  VIR_DOMAIN_CHECKPOINT_CREATE_QUIESCE = 1 shl 1;
  VIR_DOMAIN_CHECKPOINT_CREATE_REDEFINE_VALIDATE = 1 shl 2;

function virDomainCheckpointCreateXML(domain: TvirDomainPtr; xmlDesc: pchar; flags: dword): TvirDomainCheckpointPtr; cdecl; external libvirt;

type
  PvirDomainCheckpointXMLFlags = ^TvirDomainCheckpointXMLFlags;
  TvirDomainCheckpointXMLFlags = longint;
const
  VIR_DOMAIN_CHECKPOINT_XML_SECURE = 1 shl 0;
  VIR_DOMAIN_CHECKPOINT_XML_NO_DOMAIN = 1 shl 1;
  VIR_DOMAIN_CHECKPOINT_XML_SIZE = 1 shl 2;

function virDomainCheckpointGetXMLDesc(checkpoint: TvirDomainCheckpointPtr; flags: dword): pchar; cdecl; external libvirt;

type
  PvirDomainCheckpointListFlags = ^TvirDomainCheckpointListFlags;
  TvirDomainCheckpointListFlags = longint;
const
  VIR_DOMAIN_CHECKPOINT_LIST_ROOTS = 1 shl 0;
  VIR_DOMAIN_CHECKPOINT_LIST_DESCENDANTS = 1 shl 0;
  VIR_DOMAIN_CHECKPOINT_LIST_TOPOLOGICAL = 1 shl 1;
  VIR_DOMAIN_CHECKPOINT_LIST_LEAVES = 1 shl 2;
  VIR_DOMAIN_CHECKPOINT_LIST_NO_LEAVES = 1 shl 3;

function virDomainListAllCheckpoints(domain: TvirDomainPtr; checkpoints: PPvirDomainCheckpointPtr; flags: dword): longint; cdecl; external libvirt;
function virDomainCheckpointListAllChildren(checkpoint: TvirDomainCheckpointPtr; children: PPvirDomainCheckpointPtr; flags: dword): longint; cdecl; external libvirt;
function virDomainCheckpointLookupByName(domain: TvirDomainPtr; name: pchar; flags: dword): TvirDomainCheckpointPtr; cdecl; external libvirt;
function virDomainCheckpointGetParent(checkpoint: TvirDomainCheckpointPtr; flags: dword): TvirDomainCheckpointPtr; cdecl; external libvirt;

type
  PvirDomainCheckpointDeleteFlags = ^TvirDomainCheckpointDeleteFlags;
  TvirDomainCheckpointDeleteFlags = longint;
const
  VIR_DOMAIN_CHECKPOINT_DELETE_CHILDREN = 1 shl 0;
  VIR_DOMAIN_CHECKPOINT_DELETE_METADATA_ONLY = 1 shl 1;
  VIR_DOMAIN_CHECKPOINT_DELETE_CHILDREN_ONLY = 1 shl 2;

function virDomainCheckpointDelete(checkpoint: TvirDomainCheckpointPtr; flags: dword): longint; cdecl; external libvirt;
function virDomainCheckpointRef(checkpoint: TvirDomainCheckpointPtr): longint; cdecl; external libvirt;
function virDomainCheckpointFree(checkpoint: TvirDomainCheckpointPtr): longint; cdecl; external libvirt;

// === Konventiert am: 14-10-26 19:34:49 ===


implementation



end.
