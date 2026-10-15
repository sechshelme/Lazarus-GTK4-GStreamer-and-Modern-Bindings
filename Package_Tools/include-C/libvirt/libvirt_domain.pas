unit libvirt_domain;

interface

uses
  fp_virt, libvirt_common, libvirt_host;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  PPvirDomainPtr = ^PvirDomainPtr;
  PvirDomainPtr = ^TvirDomainPtr;
  TvirDomainPtr = type Pointer;

type
  PvirDomainState = ^TvirDomainState;
  TvirDomainState =  Longint;
  Const
    VIR_DOMAIN_NOSTATE = 0;
    VIR_DOMAIN_RUNNING = 1;
    VIR_DOMAIN_BLOCKED = 2;
    VIR_DOMAIN_PAUSED = 3;
    VIR_DOMAIN_SHUTDOWN = 4;
    VIR_DOMAIN_SHUTOFF = 5;
    VIR_DOMAIN_CRASHED = 6;
    VIR_DOMAIN_PMSUSPENDED = 7;
    VIR_DOMAIN_LAST = 8;

  type
  PvirDomainNostateReason = ^TvirDomainNostateReason;
  TvirDomainNostateReason =  Longint;
  Const
    VIR_DOMAIN_NOSTATE_UNKNOWN = 0;
    VIR_DOMAIN_NOSTATE_LAST = 1;

  type
  PvirDomainRunningReason = ^TvirDomainRunningReason;
  TvirDomainRunningReason =  Longint;
  Const
    VIR_DOMAIN_RUNNING_UNKNOWN = 0;
    VIR_DOMAIN_RUNNING_BOOTED = 1;
    VIR_DOMAIN_RUNNING_MIGRATED = 2;
    VIR_DOMAIN_RUNNING_RESTORED = 3;
    VIR_DOMAIN_RUNNING_FROM_SNAPSHOT = 4;
    VIR_DOMAIN_RUNNING_UNPAUSED = 5;
    VIR_DOMAIN_RUNNING_MIGRATION_CANCELED = 6;
    VIR_DOMAIN_RUNNING_SAVE_CANCELED = 7;
    VIR_DOMAIN_RUNNING_WAKEUP = 8;
    VIR_DOMAIN_RUNNING_CRASHED = 9;
    VIR_DOMAIN_RUNNING_POSTCOPY = 10;
    VIR_DOMAIN_RUNNING_POSTCOPY_FAILED = 11;
    VIR_DOMAIN_RUNNING_LAST = 12;

  type
  PvirDomainBlockedReason = ^TvirDomainBlockedReason;
  TvirDomainBlockedReason =  Longint;
  Const
    VIR_DOMAIN_BLOCKED_UNKNOWN = 0;
    VIR_DOMAIN_BLOCKED_LAST = 1;

  type
  PvirDomainPausedReason = ^TvirDomainPausedReason;
  TvirDomainPausedReason =  Longint;
  Const
    VIR_DOMAIN_PAUSED_UNKNOWN = 0;
    VIR_DOMAIN_PAUSED_USER = 1;
    VIR_DOMAIN_PAUSED_MIGRATION = 2;
    VIR_DOMAIN_PAUSED_SAVE = 3;
    VIR_DOMAIN_PAUSED_DUMP = 4;
    VIR_DOMAIN_PAUSED_IOERROR = 5;
    VIR_DOMAIN_PAUSED_WATCHDOG = 6;
    VIR_DOMAIN_PAUSED_FROM_SNAPSHOT = 7;
    VIR_DOMAIN_PAUSED_SHUTTING_DOWN = 8;
    VIR_DOMAIN_PAUSED_SNAPSHOT = 9;
    VIR_DOMAIN_PAUSED_CRASHED = 10;
    VIR_DOMAIN_PAUSED_STARTING_UP = 11;
    VIR_DOMAIN_PAUSED_POSTCOPY = 12;
    VIR_DOMAIN_PAUSED_POSTCOPY_FAILED = 13;
    VIR_DOMAIN_PAUSED_API_ERROR = 14;
    VIR_DOMAIN_PAUSED_LAST = 15;

  type
  PvirDomainShutdownReason = ^TvirDomainShutdownReason;
  TvirDomainShutdownReason =  Longint;
  Const
    VIR_DOMAIN_SHUTDOWN_UNKNOWN = 0;
    VIR_DOMAIN_SHUTDOWN_USER = 1;
    VIR_DOMAIN_SHUTDOWN_LAST = 2;

  type
  PvirDomainShutoffReason = ^TvirDomainShutoffReason;
  TvirDomainShutoffReason =  Longint;
  Const
    VIR_DOMAIN_SHUTOFF_UNKNOWN = 0;
    VIR_DOMAIN_SHUTOFF_SHUTDOWN = 1;
    VIR_DOMAIN_SHUTOFF_DESTROYED = 2;
    VIR_DOMAIN_SHUTOFF_CRASHED = 3;
    VIR_DOMAIN_SHUTOFF_MIGRATED = 4;
    VIR_DOMAIN_SHUTOFF_SAVED = 5;
    VIR_DOMAIN_SHUTOFF_FAILED = 6;
    VIR_DOMAIN_SHUTOFF_FROM_SNAPSHOT = 7;
    VIR_DOMAIN_SHUTOFF_DAEMON = 8;
    VIR_DOMAIN_SHUTOFF_LAST = 9;

  type
  PvirDomainCrashedReason = ^TvirDomainCrashedReason;
  TvirDomainCrashedReason =  Longint;
  Const
    VIR_DOMAIN_CRASHED_UNKNOWN = 0;
    VIR_DOMAIN_CRASHED_PANICKED = 1;
    VIR_DOMAIN_CRASHED_LAST = 2;

  type
  PvirDomainPMSuspendedReason = ^TvirDomainPMSuspendedReason;
  TvirDomainPMSuspendedReason =  Longint;
  Const
    VIR_DOMAIN_PMSUSPENDED_UNKNOWN = 0;
    VIR_DOMAIN_PMSUSPENDED_LAST = 1;

  type
  PvirDomainPMSuspendedDiskReason = ^TvirDomainPMSuspendedDiskReason;
  TvirDomainPMSuspendedDiskReason =  Longint;
  Const
    VIR_DOMAIN_PMSUSPENDED_DISK_UNKNOWN = 0;
    VIR_DOMAIN_PMSUSPENDED_DISK_LAST = 1;

  type
  PvirDomainControlState = ^TvirDomainControlState;
  TvirDomainControlState =  Longint;
  Const
    VIR_DOMAIN_CONTROL_OK = 0;
    VIR_DOMAIN_CONTROL_JOB = 1;
    VIR_DOMAIN_CONTROL_OCCUPIED = 2;
    VIR_DOMAIN_CONTROL_ERROR = 3;
    VIR_DOMAIN_CONTROL_LAST = 4;

  type
  PvirDomainControlErrorReason = ^TvirDomainControlErrorReason;
  TvirDomainControlErrorReason =  Longint;
  Const
    VIR_DOMAIN_CONTROL_ERROR_REASON_NONE = 0;
    VIR_DOMAIN_CONTROL_ERROR_REASON_UNKNOWN = 1;
    VIR_DOMAIN_CONTROL_ERROR_REASON_MONITOR = 2;
    VIR_DOMAIN_CONTROL_ERROR_REASON_INTERNAL = 3;
    VIR_DOMAIN_CONTROL_ERROR_REASON_LAST = 4;

    type
    PvirDomainControlInfo = ^TvirDomainControlInfo;
  TvirDomainControlInfo = record
      state : dword;
      details : dword;
      stateTime : qword;       end;

  PvirDomainControlInfoPtr = ^TvirDomainControlInfoPtr;
  TvirDomainControlInfoPtr = PvirDomainControlInfo;

  type
  PvirDomainModificationImpact = ^TvirDomainModificationImpact;
  TvirDomainModificationImpact =  Longint;
  Const
    VIR_DOMAIN_AFFECT_CURRENT = 0;
    VIR_DOMAIN_AFFECT_LIVE = 1 shl 0;
    VIR_DOMAIN_AFFECT_CONFIG = 1 shl 1;

  type
  PvirDomainInfo = ^TvirDomainInfo;
  TvirDomainInfo = record
      state : byte;
      maxMem : dword;
      memory : dword;
      nrVirtCpu : word;
      cpuTime : qword;
    end;
  PvirDomainInfoPtr = ^TvirDomainInfoPtr;
  TvirDomainInfoPtr = PvirDomainInfo;

  type
  PvirDomainCreateFlags = ^TvirDomainCreateFlags;
  TvirDomainCreateFlags =  Longint;
  Const
    VIR_DOMAIN_NONE = 0;
    VIR_DOMAIN_START_PAUSED = 1 shl 0;
    VIR_DOMAIN_START_AUTODESTROY = 1 shl 1;
    VIR_DOMAIN_START_BYPASS_CACHE = 1 shl 2;
    VIR_DOMAIN_START_FORCE_BOOT = 1 shl 3;
    VIR_DOMAIN_START_VALIDATE = 1 shl 4;
    VIR_DOMAIN_START_RESET_NVRAM = 1 shl 5;

    const
    VIR_DOMAIN_SCHEDULER_CPU_SHARES = 'cpu_shares';
  VIR_DOMAIN_SCHEDULER_GLOBAL_PERIOD = 'global_period';
  VIR_DOMAIN_SCHEDULER_GLOBAL_QUOTA = 'global_quota';
  VIR_DOMAIN_SCHEDULER_VCPU_PERIOD = 'vcpu_period';
  VIR_DOMAIN_SCHEDULER_VCPU_QUOTA = 'vcpu_quota';
  VIR_DOMAIN_SCHEDULER_EMULATOR_PERIOD = 'emulator_period';
  VIR_DOMAIN_SCHEDULER_EMULATOR_QUOTA = 'emulator_quota';
  VIR_DOMAIN_SCHEDULER_IOTHREAD_PERIOD = 'iothread_period';
  VIR_DOMAIN_SCHEDULER_IOTHREAD_QUOTA = 'iothread_quota';
  VIR_DOMAIN_SCHEDULER_WEIGHT = 'weight';
  VIR_DOMAIN_SCHEDULER_CAP = 'cap';
  VIR_DOMAIN_SCHEDULER_RESERVATION = 'reservation';
  VIR_DOMAIN_SCHEDULER_LIMIT = 'limit';
  VIR_DOMAIN_SCHEDULER_SHARES = 'shares';

function virDomainGetSchedulerParameters(domain:TvirDomainPtr; params:TvirTypedParameterPtr; nparams:Plongint):longint;cdecl;external libvirt;
function virDomainGetSchedulerParametersFlags(domain:TvirDomainPtr; params:TvirTypedParameterPtr; nparams:Plongint; flags:dword):longint;cdecl;external libvirt;

function virDomainSetSchedulerParameters(domain:TvirDomainPtr; params:TvirTypedParameterPtr; nparams:longint):longint;cdecl;external libvirt;
function virDomainSetSchedulerParametersFlags(domain:TvirDomainPtr; params:TvirTypedParameterPtr; nparams:longint; flags:dword):longint;cdecl;external libvirt;

type
  PvirDomainBlockStats = ^TvirDomainBlockStats;
  TvirDomainBlockStats = record
      rd_req : int64;
      rd_bytes : int64;
      wr_req : int64;
      wr_bytes : int64;
      errs : int64;
    end;
  PvirDomainBlockStatsPtr = ^TvirDomainBlockStatsPtr;
  TvirDomainBlockStatsPtr = PvirDomainBlockStats;

const
  VIR_DOMAIN_BLOCK_STATS_FIELD_LENGTH = VIR_TYPED_PARAM_FIELD_LENGTH;  
  VIR_DOMAIN_BLOCK_STATS_READ_BYTES = 'rd_bytes';
  VIR_DOMAIN_BLOCK_STATS_READ_REQ = 'rd_operations';
  VIR_DOMAIN_BLOCK_STATS_READ_TOTAL_TIMES = 'rd_total_times';
  VIR_DOMAIN_BLOCK_STATS_WRITE_BYTES = 'wr_bytes';
  VIR_DOMAIN_BLOCK_STATS_WRITE_REQ = 'wr_operations';
  VIR_DOMAIN_BLOCK_STATS_WRITE_TOTAL_TIMES = 'wr_total_times';
  VIR_DOMAIN_BLOCK_STATS_FLUSH_REQ = 'flush_operations';
  VIR_DOMAIN_BLOCK_STATS_FLUSH_TOTAL_TIMES = 'flush_total_times';
  VIR_DOMAIN_BLOCK_STATS_ERRS = 'errs';

type
  PvirDomainInterfaceStats = ^TvirDomainInterfaceStats;
  TvirDomainInterfaceStats = record
      rx_bytes : int64;
      rx_packets : int64;
      rx_errs : int64;
      rx_drop : int64;
      tx_bytes : int64;
      tx_packets : int64;
      tx_errs : int64;
      tx_drop : int64;
    end;
  PvirDomainInterfaceStatsPtr = ^TvirDomainInterfaceStatsPtr;
  TvirDomainInterfaceStatsPtr = PvirDomainInterfaceStats;

type
  PvirDomainMemoryStatTags = ^TvirDomainMemoryStatTags;
  TvirDomainMemoryStatTags =  Longint;
  Const
    VIR_DOMAIN_MEMORY_STAT_SWAP_IN = 0;
    VIR_DOMAIN_MEMORY_STAT_SWAP_OUT = 1;
    VIR_DOMAIN_MEMORY_STAT_MAJOR_FAULT = 2;
    VIR_DOMAIN_MEMORY_STAT_MINOR_FAULT = 3;
    VIR_DOMAIN_MEMORY_STAT_UNUSED = 4;
    VIR_DOMAIN_MEMORY_STAT_AVAILABLE = 5;
    VIR_DOMAIN_MEMORY_STAT_ACTUAL_BALLOON = 6;
    VIR_DOMAIN_MEMORY_STAT_RSS = 7;
    VIR_DOMAIN_MEMORY_STAT_USABLE = 8;
    VIR_DOMAIN_MEMORY_STAT_LAST_UPDATE = 9;
    VIR_DOMAIN_MEMORY_STAT_DISK_CACHES = 10;
    VIR_DOMAIN_MEMORY_STAT_HUGETLB_PGALLOC = 11;
    VIR_DOMAIN_MEMORY_STAT_HUGETLB_PGFAIL = 12;
    VIR_DOMAIN_MEMORY_STAT_NR = 13;
    VIR_DOMAIN_MEMORY_STAT_LAST = VIR_DOMAIN_MEMORY_STAT_NR;

  type
  PvirDomainMemoryStat = ^TvirDomainMemoryStat;
  TvirDomainMemoryStat = record
      tag : longint;
      val : qword;
    end;
  PvirDomainMemoryStatPtr = ^TvirDomainMemoryStatPtr;
  TvirDomainMemoryStatPtr = PvirDomainMemoryStat;

  type
  PvirDomainCoreDumpFlags = ^TvirDomainCoreDumpFlags;
  TvirDomainCoreDumpFlags =  Longint;
  Const
    VIR_DUMP_CRASH = 1 shl 0;
    VIR_DUMP_LIVE = 1 shl 1;
    VIR_DUMP_BYPASS_CACHE = 1 shl 2;
    VIR_DUMP_RESET = 1 shl 3;
    VIR_DUMP_MEMORY_ONLY = 1 shl 4;

  type
  PvirDomainCoreDumpFormat = ^TvirDomainCoreDumpFormat;
  TvirDomainCoreDumpFormat =  Longint;
  Const
    VIR_DOMAIN_CORE_DUMP_FORMAT_RAW = 0;
    VIR_DOMAIN_CORE_DUMP_FORMAT_KDUMP_ZLIB = 1;
    VIR_DOMAIN_CORE_DUMP_FORMAT_KDUMP_LZO = 2;
    VIR_DOMAIN_CORE_DUMP_FORMAT_KDUMP_SNAPPY = 3;
    VIR_DOMAIN_CORE_DUMP_FORMAT_WIN_DMP = 4;
    VIR_DOMAIN_CORE_DUMP_FORMAT_LAST = 5;

  type
  PvirDomainMigrateFlags = ^TvirDomainMigrateFlags;
  TvirDomainMigrateFlags =  Longint;
  Const
    VIR_MIGRATE_LIVE = 1 shl 0;
    VIR_MIGRATE_PEER2PEER = 1 shl 1;
    VIR_MIGRATE_TUNNELLED = 1 shl 2;
    VIR_MIGRATE_PERSIST_DEST = 1 shl 3;
    VIR_MIGRATE_UNDEFINE_SOURCE = 1 shl 4;
    VIR_MIGRATE_PAUSED = 1 shl 5;
    VIR_MIGRATE_NON_SHARED_DISK = 1 shl 6;
    VIR_MIGRATE_NON_SHARED_INC = 1 shl 7;
    VIR_MIGRATE_CHANGE_PROTECTION = 1 shl 8;
    VIR_MIGRATE_UNSAFE = 1 shl 9;
    VIR_MIGRATE_OFFLINE = 1 shl 10;
    VIR_MIGRATE_COMPRESSED = 1 shl 11;
    VIR_MIGRATE_ABORT_ON_ERROR = 1 shl 12;
    VIR_MIGRATE_AUTO_CONVERGE = 1 shl 13;
    VIR_MIGRATE_RDMA_PIN_ALL = 1 shl 14;
    VIR_MIGRATE_POSTCOPY = 1 shl 15;
    VIR_MIGRATE_TLS = 1 shl 16;
    VIR_MIGRATE_PARALLEL = 1 shl 17;
    VIR_MIGRATE_NON_SHARED_SYNCHRONOUS_WRITES = 1 shl 18;
    VIR_MIGRATE_POSTCOPY_RESUME = 1 shl 19;
    VIR_MIGRATE_ZEROCOPY = 1 shl 20;

    const
    VIR_MIGRATE_PARAM_URI = 'migrate_uri';
  VIR_MIGRATE_PARAM_DEST_NAME = 'destination_name';
  VIR_MIGRATE_PARAM_DEST_XML = 'destination_xml';
  VIR_MIGRATE_PARAM_PERSIST_XML = 'persistent_xml';
  VIR_MIGRATE_PARAM_BANDWIDTH = 'bandwidth';
  VIR_MIGRATE_PARAM_BANDWIDTH_POSTCOPY = 'bandwidth.postcopy';
  VIR_MIGRATE_PARAM_GRAPHICS_URI = 'graphics_uri';
  VIR_MIGRATE_PARAM_LISTEN_ADDRESS = 'listen_address';
  VIR_MIGRATE_PARAM_MIGRATE_DISKS = 'migrate_disks';
  VIR_MIGRATE_PARAM_DISKS_PORT = 'disks_port';
  VIR_MIGRATE_PARAM_DISKS_URI = 'disks_uri';
  VIR_MIGRATE_PARAM_COMPRESSION = 'compression';
  VIR_MIGRATE_PARAM_COMPRESSION_MT_LEVEL = 'compression.mt.level';
  VIR_MIGRATE_PARAM_COMPRESSION_MT_THREADS = 'compression.mt.threads';
  VIR_MIGRATE_PARAM_COMPRESSION_MT_DTHREADS = 'compression.mt.dthreads';
  VIR_MIGRATE_PARAM_COMPRESSION_XBZRLE_CACHE = 'compression.xbzrle.cache';
  VIR_MIGRATE_PARAM_COMPRESSION_ZLIB_LEVEL = 'compression.zlib.level';
  VIR_MIGRATE_PARAM_COMPRESSION_ZSTD_LEVEL = 'compression.zstd.level';
  VIR_MIGRATE_PARAM_AUTO_CONVERGE_INITIAL = 'auto_converge.initial';
  VIR_MIGRATE_PARAM_AUTO_CONVERGE_INCREMENT = 'auto_converge.increment';
  VIR_MIGRATE_PARAM_PARALLEL_CONNECTIONS = 'parallel.connections';
  VIR_MIGRATE_PARAM_TLS_DESTINATION = 'tls.destination';

function virDomainMigrate(domain:TvirDomainPtr; dconn:TvirConnectPtr; flags:dword; dname:Pchar; uri:Pchar; 
           bandwidth:dword):TvirDomainPtr;cdecl;external libvirt;
function virDomainMigrate2(domain:TvirDomainPtr; dconn:TvirConnectPtr; dxml:Pchar; flags:dword; dname:Pchar; 
           uri:Pchar; bandwidth:dword):TvirDomainPtr;cdecl;external libvirt;
function virDomainMigrate3(domain:TvirDomainPtr; dconn:TvirConnectPtr; params:TvirTypedParameterPtr; nparams:dword; flags:dword):TvirDomainPtr;cdecl;external libvirt;
function virDomainMigrateToURI(domain:TvirDomainPtr; duri:Pchar; flags:dword; dname:Pchar; bandwidth:dword):longint;cdecl;external libvirt;
function virDomainMigrateToURI2(domain:TvirDomainPtr; dconnuri:Pchar; miguri:Pchar; dxml:Pchar; flags:dword; 
           dname:Pchar; bandwidth:dword):longint;cdecl;external libvirt;
function virDomainMigrateToURI3(domain:TvirDomainPtr; dconnuri:Pchar; params:TvirTypedParameterPtr; nparams:dword; flags:dword):longint;cdecl;external libvirt;
function virDomainMigrateGetMaxDowntime(domain:TvirDomainPtr; downtime:Pqword; flags:dword):longint;cdecl;external libvirt;
function virDomainMigrateSetMaxDowntime(domain:TvirDomainPtr; downtime:qword; flags:dword):longint;cdecl;external libvirt;
function virDomainMigrateGetCompressionCache(domain:TvirDomainPtr; cacheSize:Pqword; flags:dword):longint;cdecl;external libvirt;
function virDomainMigrateSetCompressionCache(domain:TvirDomainPtr; cacheSize:qword; flags:dword):longint;cdecl;external libvirt;

type
  PvirDomainMigrateMaxSpeedFlags = ^TvirDomainMigrateMaxSpeedFlags;
  TvirDomainMigrateMaxSpeedFlags =  Longint;
  Const
    VIR_DOMAIN_MIGRATE_MAX_SPEED_POSTCOPY = 1 shl 0;

function virDomainMigrateSetMaxSpeed(domain:TvirDomainPtr; bandwidth:dword; flags:dword):longint;cdecl;external libvirt;
function virDomainMigrateGetMaxSpeed(domain:TvirDomainPtr; bandwidth:Pdword; flags:dword):longint;cdecl;external libvirt;
function virDomainMigrateStartPostCopy(domain:TvirDomainPtr; flags:dword):longint;cdecl;external libvirt;
function virConnectGetDomainCapabilities(conn:TvirConnectPtr; emulatorbin:Pchar; arch:Pchar; machine:Pchar; virttype:Pchar; 
           flags:dword):Pchar;cdecl;external libvirt;
function virConnectListDomains(conn:TvirConnectPtr; ids:Plongint; maxids:longint):longint;cdecl;external libvirt;
function virConnectNumOfDomains(conn:TvirConnectPtr):longint;cdecl;external libvirt;
function virDomainGetConnect(domain:TvirDomainPtr):TvirConnectPtr;cdecl;external libvirt;
function virDomainCreateXML(conn:TvirConnectPtr; xmlDesc:Pchar; flags:dword):TvirDomainPtr;cdecl;external libvirt;
function virDomainCreateXMLWithFiles(conn:TvirConnectPtr; xmlDesc:Pchar; nfiles:dword; files:Plongint; flags:dword):TvirDomainPtr;cdecl;external libvirt;
function virDomainLookupByName(conn:TvirConnectPtr; name:Pchar):TvirDomainPtr;cdecl;external libvirt;
function virDomainLookupByID(conn:TvirConnectPtr; id:longint):TvirDomainPtr;cdecl;external libvirt;
function virDomainLookupByUUID(conn:TvirConnectPtr; uuid:Pbyte):TvirDomainPtr;cdecl;external libvirt;
function virDomainLookupByUUIDString(conn:TvirConnectPtr; uuid:Pchar):TvirDomainPtr;cdecl;external libvirt;

type
  PvirDomainShutdownFlagValues = ^TvirDomainShutdownFlagValues;
  TvirDomainShutdownFlagValues =  Longint;
  Const
    VIR_DOMAIN_SHUTDOWN_DEFAULT = 0;
    VIR_DOMAIN_SHUTDOWN_ACPI_POWER_BTN = 1 shl 0;
    VIR_DOMAIN_SHUTDOWN_GUEST_AGENT = 1 shl 1;
    VIR_DOMAIN_SHUTDOWN_INITCTL = 1 shl 2;
    VIR_DOMAIN_SHUTDOWN_SIGNAL = 1 shl 3;
    VIR_DOMAIN_SHUTDOWN_PARAVIRT = 1 shl 4;

function virDomainShutdown(domain:TvirDomainPtr):longint;cdecl;external libvirt;
function virDomainShutdownFlags(domain:TvirDomainPtr; flags:dword):longint;cdecl;external libvirt;

type
  PvirDomainRebootFlagValues = ^TvirDomainRebootFlagValues;
  TvirDomainRebootFlagValues =  Longint;
  Const
    VIR_DOMAIN_REBOOT_DEFAULT = 0;
    VIR_DOMAIN_REBOOT_ACPI_POWER_BTN = 1 shl 0;
    VIR_DOMAIN_REBOOT_GUEST_AGENT = 1 shl 1;
    VIR_DOMAIN_REBOOT_INITCTL = 1 shl 2;
    VIR_DOMAIN_REBOOT_SIGNAL = 1 shl 3;
    VIR_DOMAIN_REBOOT_PARAVIRT = 1 shl 4;

function virDomainReboot(domain:TvirDomainPtr; flags:dword):longint;cdecl;external libvirt;
function virDomainReset(domain:TvirDomainPtr; flags:dword):longint;cdecl;external libvirt;
function virDomainDestroy(domain:TvirDomainPtr):longint;cdecl;external libvirt;

type
  PvirDomainDestroyFlagsValues = ^TvirDomainDestroyFlagsValues;
  TvirDomainDestroyFlagsValues =  Longint;
  Const
    VIR_DOMAIN_DESTROY_DEFAULT = 0;
    VIR_DOMAIN_DESTROY_GRACEFUL = 1 shl 0;
    VIR_DOMAIN_DESTROY_REMOVE_LOGS = 1 shl 1;

function virDomainDestroyFlags(domain:TvirDomainPtr; flags:dword):longint;cdecl;external libvirt;
function virDomainRef(domain:TvirDomainPtr):longint;cdecl;external libvirt;
function virDomainFree(domain:TvirDomainPtr):longint;cdecl;external libvirt;

function virDomainSuspend(domain:TvirDomainPtr):longint;cdecl;external libvirt;
function virDomainResume(domain:TvirDomainPtr):longint;cdecl;external libvirt;
function virDomainPMSuspendForDuration(domain:TvirDomainPtr; target:dword; duration:qword; flags:dword):longint;cdecl;external libvirt;
function virDomainPMWakeup(domain:TvirDomainPtr; flags:dword):longint;cdecl;external libvirt;

type
  PvirDomainSaveRestoreFlags = ^TvirDomainSaveRestoreFlags;
  TvirDomainSaveRestoreFlags =  Longint;
  Const
    VIR_DOMAIN_SAVE_BYPASS_CACHE = 1 shl 0;
    VIR_DOMAIN_SAVE_RUNNING = 1 shl 1;
    VIR_DOMAIN_SAVE_PAUSED = 1 shl 2;
    VIR_DOMAIN_SAVE_RESET_NVRAM = 1 shl 3;

function virDomainSave(domain:TvirDomainPtr; to_:Pchar):longint;cdecl;external libvirt;
function virDomainSaveFlags(domain:TvirDomainPtr; to_:Pchar; dxml:Pchar; flags:dword):longint;cdecl;external libvirt;
function virDomainSaveParams(domain:TvirDomainPtr; params:TvirTypedParameterPtr; nparams:longint; flags:dword):longint;cdecl;external libvirt;
function virDomainRestore(conn:TvirConnectPtr; from:Pchar):longint;cdecl;external libvirt;
function virDomainRestoreFlags(conn:TvirConnectPtr; from:Pchar; dxml:Pchar; flags:dword):longint;cdecl;external libvirt;
function virDomainRestoreParams(conn:TvirConnectPtr; params:TvirTypedParameterPtr; nparams:longint; flags:dword):longint;cdecl;external libvirt;

const
  VIR_DOMAIN_SAVE_PARAM_FILE = 'file';  
  VIR_DOMAIN_SAVE_PARAM_DXML = 'dxml';

function virDomainSaveImageGetXMLDesc(conn:TvirConnectPtr; file_:Pchar; flags:dword):Pchar;cdecl;external libvirt;
function virDomainSaveImageDefineXML(conn:TvirConnectPtr; file_:Pchar; dxml:Pchar; flags:dword):longint;cdecl;external libvirt;
function virDomainManagedSave(dom:TvirDomainPtr; flags:dword):longint;cdecl;external libvirt;
function virDomainHasManagedSaveImage(dom:TvirDomainPtr; flags:dword):longint;cdecl;external libvirt;
function virDomainManagedSaveRemove(dom:TvirDomainPtr; flags:dword):longint;cdecl;external libvirt;
function virDomainManagedSaveGetXMLDesc(domain:TvirDomainPtr; flags:dword):Pchar;cdecl;external libvirt;
function virDomainManagedSaveDefineXML(domain:TvirDomainPtr; dxml:Pchar; flags:dword):longint;cdecl;external libvirt;
function virDomainCoreDump(domain:TvirDomainPtr; to_:Pchar; flags:dword):longint;cdecl;external libvirt;
function virDomainCoreDumpWithFormat(domain:TvirDomainPtr; to_:Pchar; dumpformat:dword; flags:dword):longint;cdecl;external libvirt;
function virDomainScreenshot(domain:TvirDomainPtr; stream:TvirStreamPtr; screen:dword; flags:dword):Pchar;cdecl;external libvirt;

function virDomainGetInfo(domain:TvirDomainPtr; info:TvirDomainInfoPtr):longint;cdecl;external libvirt;
function virDomainGetState(domain:TvirDomainPtr; state:Plongint; reason:Plongint; flags:dword):longint;cdecl;external libvirt;

const
  VIR_DOMAIN_CPU_STATS_CPUTIME = 'cpu_time';  
  VIR_DOMAIN_CPU_STATS_USERTIME = 'user_time';
  VIR_DOMAIN_CPU_STATS_SYSTEMTIME = 'system_time';
  VIR_DOMAIN_CPU_STATS_VCPUTIME = 'vcpu_time';

function virDomainGetCPUStats(domain:TvirDomainPtr; params:TvirTypedParameterPtr; nparams:dword; start_cpu:longint; ncpus:dword; 
           flags:dword):longint;cdecl;external libvirt;
function virDomainGetControlInfo(domain:TvirDomainPtr; info:TvirDomainControlInfoPtr; flags:dword):longint;cdecl;external libvirt;
function virDomainGetSchedulerType(domain:TvirDomainPtr; nparams:Plongint):Pchar;cdecl;external libvirt;

const
  VIR_DOMAIN_BLKIO_WEIGHT = 'weight';  
  VIR_DOMAIN_BLKIO_DEVICE_WEIGHT = 'device_weight';
  VIR_DOMAIN_BLKIO_DEVICE_READ_IOPS = 'device_read_iops_sec';
  VIR_DOMAIN_BLKIO_DEVICE_WRITE_IOPS = 'device_write_iops_sec';
  VIR_DOMAIN_BLKIO_DEVICE_READ_BPS = 'device_read_bytes_sec';
  VIR_DOMAIN_BLKIO_DEVICE_WRITE_BPS = 'device_write_bytes_sec';

function virDomainSetBlkioParameters(domain:TvirDomainPtr; params:TvirTypedParameterPtr; nparams:longint; flags:dword):longint;cdecl;external libvirt;
function virDomainGetBlkioParameters(domain:TvirDomainPtr; params:TvirTypedParameterPtr; nparams:Plongint; flags:dword):longint;cdecl;external libvirt;

const
  VIR_DOMAIN_MEMORY_PARAM_UNLIMITED = 9007199254740991;  
  VIR_DOMAIN_MEMORY_HARD_LIMIT = 'hard_limit';
  VIR_DOMAIN_MEMORY_SOFT_LIMIT = 'soft_limit';
  VIR_DOMAIN_MEMORY_MIN_GUARANTEE = 'min_guarantee';
  VIR_DOMAIN_MEMORY_SWAP_HARD_LIMIT = 'swap_hard_limit';

function virDomainSetMemoryParameters(domain:TvirDomainPtr; params:TvirTypedParameterPtr; nparams:longint; flags:dword):longint;cdecl;external libvirt;
function virDomainGetMemoryParameters(domain:TvirDomainPtr; params:TvirTypedParameterPtr; nparams:Plongint; flags:dword):longint;cdecl;external libvirt;

type
  PvirDomainMemoryModFlags = ^TvirDomainMemoryModFlags;
  TvirDomainMemoryModFlags =  Longint;
  Const
    VIR_DOMAIN_MEM_CURRENT = VIR_DOMAIN_AFFECT_CURRENT;
    VIR_DOMAIN_MEM_LIVE = VIR_DOMAIN_AFFECT_LIVE;
    VIR_DOMAIN_MEM_CONFIG = VIR_DOMAIN_AFFECT_CONFIG;
    VIR_DOMAIN_MEM_MAXIMUM = 1 shl 2;

  type
  PvirDomainNumatuneMemMode = ^TvirDomainNumatuneMemMode;
  TvirDomainNumatuneMemMode =  Longint;
  Const
    VIR_DOMAIN_NUMATUNE_MEM_STRICT = 0;
    VIR_DOMAIN_NUMATUNE_MEM_PREFERRED = 1;
    VIR_DOMAIN_NUMATUNE_MEM_INTERLEAVE = 2;
    VIR_DOMAIN_NUMATUNE_MEM_RESTRICTIVE = 3;
    VIR_DOMAIN_NUMATUNE_MEM_LAST = 4;

    const
    VIR_DOMAIN_NUMA_NODESET = 'numa_nodeset';
  VIR_DOMAIN_NUMA_MODE = 'numa_mode';

function virDomainSetNumaParameters(domain:TvirDomainPtr; params:TvirTypedParameterPtr; nparams:longint; flags:dword):longint;cdecl;external libvirt;
function virDomainGetNumaParameters(domain:TvirDomainPtr; params:TvirTypedParameterPtr; nparams:Plongint; flags:dword):longint;cdecl;external libvirt;

function virDomainGetName(domain:TvirDomainPtr):Pchar;cdecl;external libvirt;
function virDomainGetID(domain:TvirDomainPtr):dword;cdecl;external libvirt;
function virDomainGetUUID(domain:TvirDomainPtr; uuid:Pbyte):longint;cdecl;external libvirt;
function virDomainGetUUIDString(domain:TvirDomainPtr; buf:Pchar):longint;cdecl;external libvirt;
function virDomainGetOSType(domain:TvirDomainPtr):Pchar;cdecl;external libvirt;
function virDomainGetMaxMemory(domain:TvirDomainPtr):dword;cdecl;external libvirt;
function virDomainSetMaxMemory(domain:TvirDomainPtr; memory:dword):longint;cdecl;external libvirt;
function virDomainSetMemory(domain:TvirDomainPtr; memory:dword):longint;cdecl;external libvirt;
function virDomainSetMemoryFlags(domain:TvirDomainPtr; memory:dword; flags:dword):longint;cdecl;external libvirt;
function virDomainSetMemoryStatsPeriod(domain:TvirDomainPtr; period:longint; flags:dword):longint;cdecl;external libvirt;
function virDomainGetMaxVcpus(domain:TvirDomainPtr):longint;cdecl;external libvirt;
function virDomainGetSecurityLabel(domain:TvirDomainPtr; seclabel:TvirSecurityLabelPtr):longint;cdecl;external libvirt;

type
  PvirDomainGetHostnameFlags = ^TvirDomainGetHostnameFlags;
  TvirDomainGetHostnameFlags =  Longint;
  Const
    VIR_DOMAIN_GET_HOSTNAME_LEASE = 1 shl 0;
    VIR_DOMAIN_GET_HOSTNAME_AGENT = 1 shl 1;

function virDomainGetHostname(domain:TvirDomainPtr; flags:dword):Pchar;cdecl;external libvirt;
function virDomainGetSecurityLabelList(domain:TvirDomainPtr; seclabels:PvirSecurityLabelPtr):longint;cdecl;external libvirt;

type
  PvirDomainMetadataType = ^TvirDomainMetadataType;
  TvirDomainMetadataType =  Longint;
  Const
    VIR_DOMAIN_METADATA_DESCRIPTION = 0;
    VIR_DOMAIN_METADATA_TITLE = 1;
    VIR_DOMAIN_METADATA_ELEMENT = 2;
    VIR_DOMAIN_METADATA_LAST = 3;

function virDomainSetMetadata(domain:TvirDomainPtr; _type:longint; metadata:Pchar; key:Pchar; uri:Pchar; 
           flags:dword):longint;cdecl;external libvirt;
function virDomainGetMetadata(domain:TvirDomainPtr; _type:longint; uri:Pchar; flags:dword):Pchar;cdecl;external libvirt;

type
  PvirDomainXMLFlags = ^TvirDomainXMLFlags;
  TvirDomainXMLFlags =  Longint;
  Const
    VIR_DOMAIN_XML_SECURE = 1 shl 0;
    VIR_DOMAIN_XML_INACTIVE = 1 shl 1;
    VIR_DOMAIN_XML_UPDATE_CPU = 1 shl 2;
    VIR_DOMAIN_XML_MIGRATABLE = 1 shl 3;

  type
  PvirDomainSaveImageXMLFlags = ^TvirDomainSaveImageXMLFlags;
  TvirDomainSaveImageXMLFlags =  Longint;
  Const
    VIR_DOMAIN_SAVE_IMAGE_XML_SECURE = VIR_DOMAIN_XML_SECURE;

function virDomainGetXMLDesc(domain:TvirDomainPtr; flags:dword):Pchar;cdecl;external libvirt;
function virConnectDomainXMLFromNative(conn:TvirConnectPtr; nativeFormat:Pchar; nativeConfig:Pchar; flags:dword):Pchar;cdecl;external libvirt;
function virConnectDomainXMLToNative(conn:TvirConnectPtr; nativeFormat:Pchar; domainXml:Pchar; flags:dword):Pchar;cdecl;external libvirt;
function virDomainBlockStats(dom:TvirDomainPtr; disk:Pchar; stats:TvirDomainBlockStatsPtr; size:Tsize_t):longint;cdecl;external libvirt;
function virDomainBlockStatsFlags(dom:TvirDomainPtr; disk:Pchar; params:TvirTypedParameterPtr; nparams:Plongint; flags:dword):longint;cdecl;external libvirt;
function virDomainInterfaceStats(dom:TvirDomainPtr; device:Pchar; stats:TvirDomainInterfaceStatsPtr; size:Tsize_t):longint;cdecl;external libvirt;

const
  VIR_DOMAIN_BANDWIDTH_IN_AVERAGE = 'inbound.average';  
  VIR_DOMAIN_BANDWIDTH_IN_PEAK = 'inbound.peak';
  VIR_DOMAIN_BANDWIDTH_IN_BURST = 'inbound.burst';
  VIR_DOMAIN_BANDWIDTH_IN_FLOOR = 'inbound.floor';
  VIR_DOMAIN_BANDWIDTH_OUT_AVERAGE = 'outbound.average';
  VIR_DOMAIN_BANDWIDTH_OUT_PEAK = 'outbound.peak';
  VIR_DOMAIN_BANDWIDTH_OUT_BURST = 'outbound.burst';

function virDomainSetInterfaceParameters(dom:TvirDomainPtr; device:Pchar; params:TvirTypedParameterPtr; nparams:longint; flags:dword):longint;cdecl;external libvirt;
function virDomainGetInterfaceParameters(dom:TvirDomainPtr; device:Pchar; params:TvirTypedParameterPtr; nparams:Plongint; flags:dword):longint;cdecl;external libvirt;
function virDomainBlockPeek(dom:TvirDomainPtr; disk:Pchar; offset:qword; size:Tsize_t; buffer:pointer;
           flags:dword):longint;cdecl;external libvirt;

type
  PvirDomainBlockResizeFlags = ^TvirDomainBlockResizeFlags;
  TvirDomainBlockResizeFlags =  Longint;
  Const
    VIR_DOMAIN_BLOCK_RESIZE_BYTES = 1 shl 0;
    VIR_DOMAIN_BLOCK_RESIZE_CAPACITY = 1 shl 1;

function virDomainBlockResize(dom:TvirDomainPtr; disk:Pchar; size:qword; flags:dword):longint;cdecl;external libvirt;

type
  PvirDomainBlockInfo = ^TvirDomainBlockInfo;
  TvirDomainBlockInfo = record
      capacity : qword;
      allocation : qword;
      physical : qword;
    end;
  PvirDomainBlockInfoPtr = ^TvirDomainBlockInfoPtr;
  TvirDomainBlockInfoPtr = PvirDomainBlockInfo;

function virDomainGetBlockInfo(dom:TvirDomainPtr; disk:Pchar; info:TvirDomainBlockInfoPtr; flags:dword):longint;cdecl;external libvirt;
function virDomainMemoryStats(dom:TvirDomainPtr; stats:TvirDomainMemoryStatPtr; nr_stats:dword; flags:dword):longint;cdecl;external libvirt;

type
  PvirDomainMemoryFlags = ^TvirDomainMemoryFlags;
  TvirDomainMemoryFlags =  Longint;
  Const
    VIR_MEMORY_VIRTUAL = 1 shl 0;
    VIR_MEMORY_PHYSICAL = 1 shl 1;

function virDomainMemoryPeek(dom:TvirDomainPtr; start:qword; size:Tsize_t; buffer:pointer; flags:dword):longint;cdecl;external libvirt;

type
  PvirDomainDefineFlags = ^TvirDomainDefineFlags;
  TvirDomainDefineFlags =  Longint;
  Const
    VIR_DOMAIN_DEFINE_VALIDATE = 1 shl 0;

function virDomainDefineXML(conn:TvirConnectPtr; xml:Pchar):TvirDomainPtr;cdecl;external libvirt;
function virDomainDefineXMLFlags(conn:TvirConnectPtr; xml:Pchar; flags:dword):TvirDomainPtr;cdecl;external libvirt;
function virDomainUndefine(domain:TvirDomainPtr):longint;cdecl;external libvirt;

type
  PvirDomainUndefineFlagsValues = ^TvirDomainUndefineFlagsValues;
  TvirDomainUndefineFlagsValues =  Longint;
  Const
    VIR_DOMAIN_UNDEFINE_MANAGED_SAVE = 1 shl 0;
    VIR_DOMAIN_UNDEFINE_SNAPSHOTS_METADATA = 1 shl 1;
    VIR_DOMAIN_UNDEFINE_NVRAM = 1 shl 2;
    VIR_DOMAIN_UNDEFINE_KEEP_NVRAM = 1 shl 3;
    VIR_DOMAIN_UNDEFINE_CHECKPOINTS_METADATA = 1 shl 4;
    VIR_DOMAIN_UNDEFINE_TPM = 1 shl 5;
    VIR_DOMAIN_UNDEFINE_KEEP_TPM = 1 shl 6;

function virDomainUndefineFlags(domain:TvirDomainPtr; flags:dword):longint;cdecl;external libvirt;
function virConnectNumOfDefinedDomains(conn:TvirConnectPtr):longint;cdecl;external libvirt;
function virConnectListDefinedDomains(conn:TvirConnectPtr; names:PPchar; maxnames:longint):longint;cdecl;external libvirt;

type
  PvirConnectListAllDomainsFlags = ^TvirConnectListAllDomainsFlags;
  TvirConnectListAllDomainsFlags =  Longint;
  Const
    VIR_CONNECT_LIST_DOMAINS_ACTIVE = 1 shl 0;
    VIR_CONNECT_LIST_DOMAINS_INACTIVE = 1 shl 1;
    VIR_CONNECT_LIST_DOMAINS_PERSISTENT = 1 shl 2;
    VIR_CONNECT_LIST_DOMAINS_TRANSIENT = 1 shl 3;
    VIR_CONNECT_LIST_DOMAINS_RUNNING = 1 shl 4;
    VIR_CONNECT_LIST_DOMAINS_PAUSED = 1 shl 5;
    VIR_CONNECT_LIST_DOMAINS_SHUTOFF = 1 shl 6;
    VIR_CONNECT_LIST_DOMAINS_OTHER = 1 shl 7;
    VIR_CONNECT_LIST_DOMAINS_MANAGEDSAVE = 1 shl 8;
    VIR_CONNECT_LIST_DOMAINS_NO_MANAGEDSAVE = 1 shl 9;
    VIR_CONNECT_LIST_DOMAINS_AUTOSTART = 1 shl 10;
    VIR_CONNECT_LIST_DOMAINS_NO_AUTOSTART = 1 shl 11;
    VIR_CONNECT_LIST_DOMAINS_HAS_SNAPSHOT = 1 shl 12;
    VIR_CONNECT_LIST_DOMAINS_NO_SNAPSHOT = 1 shl 13;
    VIR_CONNECT_LIST_DOMAINS_HAS_CHECKPOINT = 1 shl 14;
    VIR_CONNECT_LIST_DOMAINS_NO_CHECKPOINT = 1 shl 15;

function virConnectListAllDomains(conn:TvirConnectPtr; domains:PPvirDomainPtr; flags:dword):longint;cdecl;external libvirt;
function virDomainCreate(domain:TvirDomainPtr):longint;cdecl;external libvirt;
function virDomainCreateWithFlags(domain:TvirDomainPtr; flags:dword):longint;cdecl;external libvirt;
function virDomainCreateWithFiles(domain:TvirDomainPtr; nfiles:dword; files:Plongint; flags:dword):longint;cdecl;external libvirt;
function virDomainGetAutostart(domain:TvirDomainPtr; autostart:Plongint):longint;cdecl;external libvirt;
function virDomainSetAutostart(domain:TvirDomainPtr; autostart:longint):longint;cdecl;external libvirt;

type
  PvirVcpuState = ^TvirVcpuState;
  TvirVcpuState =  Longint;
  Const
    VIR_VCPU_OFFLINE = 0;
    VIR_VCPU_RUNNING = 1;
    VIR_VCPU_BLOCKED = 2;
    VIR_VCPU_LAST = 3;

  type
  PvirVcpuHostCpuState = ^TvirVcpuHostCpuState;
  TvirVcpuHostCpuState =  Longint;
  Const
    VIR_VCPU_INFO_CPU_OFFLINE = -(1);
    VIR_VCPU_INFO_CPU_UNAVAILABLE = -(2);

  type
  PvirVcpuInfo = ^TvirVcpuInfo;
  TvirVcpuInfo = record
      number : dword;
      state : longint;
      cpuTime : qword;
      cpu : longint;
    end;
  PvirVcpuInfoPtr = ^TvirVcpuInfoPtr;
  TvirVcpuInfoPtr = PvirVcpuInfo;

  type
  PvirDomainVcpuFlags = ^TvirDomainVcpuFlags;
  TvirDomainVcpuFlags =  Longint;
  Const
    VIR_DOMAIN_VCPU_CURRENT = VIR_DOMAIN_AFFECT_CURRENT;
    VIR_DOMAIN_VCPU_LIVE = VIR_DOMAIN_AFFECT_LIVE;
    VIR_DOMAIN_VCPU_CONFIG = VIR_DOMAIN_AFFECT_CONFIG;
    VIR_DOMAIN_VCPU_MAXIMUM = 1 shl 2;
    VIR_DOMAIN_VCPU_GUEST = 1 shl 3;
    VIR_DOMAIN_VCPU_HOTPLUGGABLE = 1 shl 4;

function virDomainSetVcpus(domain:TvirDomainPtr; nvcpus:dword):longint;cdecl;external libvirt;
function virDomainSetVcpusFlags(domain:TvirDomainPtr; nvcpus:dword; flags:dword):longint;cdecl;external libvirt;
function virDomainGetVcpusFlags(domain:TvirDomainPtr; flags:dword):longint;cdecl;external libvirt;
function virDomainPinVcpu(domain:TvirDomainPtr; vcpu:dword; cpumap:Pbyte; maplen:longint):longint;cdecl;external libvirt;
function virDomainPinVcpuFlags(domain:TvirDomainPtr; vcpu:dword; cpumap:Pbyte; maplen:longint; flags:dword):longint;cdecl;external libvirt;
function virDomainGetVcpuPinInfo(domain:TvirDomainPtr; ncpumaps:longint; cpumaps:Pbyte; maplen:longint; flags:dword):longint;cdecl;external libvirt;
function virDomainPinEmulator(domain:TvirDomainPtr; cpumap:Pbyte; maplen:longint; flags:dword):longint;cdecl;external libvirt;
function virDomainGetEmulatorPinInfo(domain:TvirDomainPtr; cpumaps:Pbyte; maplen:longint; flags:dword):longint;cdecl;external libvirt;

type
  PvirDomainIOThreadInfo = ^TvirDomainIOThreadInfo;
  TvirDomainIOThreadInfo = record
      iothread_id : dword;
      cpumap : Pbyte;
      cpumaplen : longint;
    end;
  PPvirDomainIOThreadInfoPtr = ^PvirDomainIOThreadInfoPtr;
  PvirDomainIOThreadInfoPtr = ^TvirDomainIOThreadInfoPtr;
  TvirDomainIOThreadInfoPtr = PvirDomainIOThreadInfo;

procedure virDomainIOThreadInfoFree(info:TvirDomainIOThreadInfoPtr);cdecl;external libvirt;
function virDomainGetIOThreadInfo(domain:TvirDomainPtr; info:PPvirDomainIOThreadInfoPtr; flags:dword):longint;cdecl;external libvirt;
function virDomainPinIOThread(domain:TvirDomainPtr; iothread_id:dword; cpumap:Pbyte; maplen:longint; flags:dword):longint;cdecl;external libvirt;
function virDomainAddIOThread(domain:TvirDomainPtr; iothread_id:dword; flags:dword):longint;cdecl;external libvirt;
function virDomainDelIOThread(domain:TvirDomainPtr; iothread_id:dword; flags:dword):longint;cdecl;external libvirt;

const
  VIR_DOMAIN_IOTHREAD_POLL_MAX_NS = 'poll_max_ns';  
  VIR_DOMAIN_IOTHREAD_POLL_GROW = 'poll_grow';
  VIR_DOMAIN_IOTHREAD_POLL_SHRINK = 'poll_shrink';
  VIR_DOMAIN_IOTHREAD_THREAD_POOL_MIN = 'thread_pool_min';
  VIR_DOMAIN_IOTHREAD_THREAD_POOL_MAX = 'thread_pool_max';
  f
function virDomainSetIOThreadParams(domain:TvirDomainPtr; iothread_id:dword; params:TvirTypedParameterPtr; nparams:longint; flags:dword):longint;cdecl;external libvirt;
{* xxxxx
# define VIR_USE_CPU(cpumap, cpu) ((cpumap)[(cpu) / 8] |= (1 << ((cpu) % 8)))
# define VIR_UNUSE_CPU(cpumap, cpu) ((cpumap)[(cpu) / 8] &= ~(1 << ((cpu) % 8)))
# define VIR_CPU_USED(cpumap, cpu) ((cpumap)[(cpu) / 8] & (1 << ((cpu) % 8)))
# define VIR_CPU_MAPLEN(cpu) (((cpu) + 7) / 8)

 }
function virDomainGetVcpus(domain:TvirDomainPtr; info:TvirVcpuInfoPtr; maxinfo:longint; cpumaps:Pbyte; maplen:longint):longint;cdecl;external libvirt;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIR_CPU_USABLE(cpumaps,maplen,vcpu,cpu : longint) : longint;

{*
 * VIR_COPY_CPUMAP:
 * @cpumaps: pointer to an array of cpumap (in 8-bit bytes) (IN)
 * @maplen: the length (in bytes) of one cpumap
 * @vcpu: the virtual CPU number
 * @cpumap: pointer to a cpumap (in 8-bit bytes) (OUT)
 *      This cpumap must be previously allocated by the caller
 *      (ie: malloc(maplen))
 *
 * This macro is to be used in conjunction with virDomainGetVcpus() and
 * virDomainPinVcpu() APIs. VIR_COPY_CPUMAP macro extracts the cpumap of
 * the specified vcpu from cpumaps array and copies it into cpumap to be used
 * later by virDomainPinVcpu() API.
 *
 * Since: 0.1.4
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIR_COPY_CPUMAP(cpumaps,maplen,vcpu,cpumap : longint) : longint;

{* xxxxxxxxxxxxxxxx
# define VIR_GET_CPUMAP(cpumaps, maplen, vcpu) (&((cpumaps)[(vcpu) * (maplen)]))
  }
{ See virDomainModificationImpact (Since: 0.7.7)  }
{ See virDomainModificationImpact (Since: 0.7.7)  }
{ See virDomainModificationImpact (Since: 0.7.7)  }
{ Forcibly modify device (ex. force eject a cdrom) (Since: 0.8.6)  }
type
  PvirDomainDeviceModifyFlags = ^TvirDomainDeviceModifyFlags;
  TvirDomainDeviceModifyFlags =  Longint;
  Const
    VIR_DOMAIN_DEVICE_MODIFY_CURRENT = VIR_DOMAIN_AFFECT_CURRENT;
    VIR_DOMAIN_DEVICE_MODIFY_LIVE = VIR_DOMAIN_AFFECT_LIVE;
    VIR_DOMAIN_DEVICE_MODIFY_CONFIG = VIR_DOMAIN_AFFECT_CONFIG;
    VIR_DOMAIN_DEVICE_MODIFY_FORCE = 1 shl 2;
;

function virDomainAttachDevice(domain:TvirDomainPtr; xml:Pchar):longint;cdecl;external libvirt;
function virDomainDetachDevice(domain:TvirDomainPtr; xml:Pchar):longint;cdecl;external libvirt;
function virDomainAttachDeviceFlags(domain:TvirDomainPtr; xml:Pchar; flags:dword):longint;cdecl;external libvirt;
function virDomainDetachDeviceFlags(domain:TvirDomainPtr; xml:Pchar; flags:dword):longint;cdecl;external libvirt;
function virDomainUpdateDeviceFlags(domain:TvirDomainPtr; xml:Pchar; flags:dword):longint;cdecl;external libvirt;
function virDomainDetachDeviceAlias(domain:TvirDomainPtr; alias:Pchar; flags:dword):longint;cdecl;external libvirt;
{*
 * virDomainStatsRecord:
 *
 * Since: 1.2.8
  }
type
{*
 * virDomainStatsRecordPtr:
 *
 * Since: 1.2.8
  }

  PvirDomainStatsRecordPtr = ^TvirDomainStatsRecordPtr;
  TvirDomainStatsRecordPtr = PvirDomainStatsRecord;
  PvirDomainStatsRecord = ^TvirDomainStatsRecord;
  TvirDomainStatsRecord = record
      dom : TvirDomainPtr;
      params : TvirTypedParameterPtr;
      nparams : longint;
    end;

{*
 * virDomainStatsTypes:
 *
 * Since: 1.2.8
  }
{ return domain state (Since: 1.2.8)  }
{ return domain CPU info (Since: 1.2.9)  }
{ return domain balloon info (Since: 1.2.9)  }
{ return domain virtual CPU info (Since: 1.2.9)  }
{ return domain interfaces info (Since: 1.2.9)  }
{ return domain block info (Since: 1.2.9)  }
{ return domain perf event info (Since: 1.3.3)  }
{ return iothread poll info (Since: 4.10.0)  }
{ return domain memory info (Since: 6.0.0)  }
{ return domain dirty rate info (Since: 7.2.0)  }
{ return vm info (Since: 8.9.0)  }

  PvirDomainStatsTypes = ^TvirDomainStatsTypes;
  TvirDomainStatsTypes =  Longint;
  Const
    VIR_DOMAIN_STATS_STATE = 1 shl 0;
    VIR_DOMAIN_STATS_CPU_TOTAL = 1 shl 1;
    VIR_DOMAIN_STATS_BALLOON = 1 shl 2;
    VIR_DOMAIN_STATS_VCPU = 1 shl 3;
    VIR_DOMAIN_STATS_INTERFACE = 1 shl 4;
    VIR_DOMAIN_STATS_BLOCK = 1 shl 5;
    VIR_DOMAIN_STATS_PERF = 1 shl 6;
    VIR_DOMAIN_STATS_IOTHREAD = 1 shl 7;
    VIR_DOMAIN_STATS_MEMORY = 1 shl 8;
    VIR_DOMAIN_STATS_DIRTYRATE = 1 shl 9;
    VIR_DOMAIN_STATS_VM = 1 shl 10;
;
{*
 * virConnectGetAllDomainStatsFlags:
 *
 * Since: 1.2.8
  }
{ (Since: 1.2.8)  }
{ (Since: 1.2.8)  }
{ (Since: 1.2.8)  }
{ (Since: 1.2.8)  }
{ (Since: 1.2.8)  }
{ (Since: 1.2.8)  }
{ (Since: 1.2.8)  }
{ (Since: 1.2.8)  }
{ report statistics that can be obtained
                                                           immediately without any blocking (Since: 4.5.0)  }
{ include backing chain for block stats (Since: 1.2.12)  }
{ enforce requested stats (Since: 1.2.8)  }
type
  PvirConnectGetAllDomainStatsFlags = ^TvirConnectGetAllDomainStatsFlags;
  TvirConnectGetAllDomainStatsFlags =  Longint;
  Const
    VIR_CONNECT_GET_ALL_DOMAINS_STATS_ACTIVE = VIR_CONNECT_LIST_DOMAINS_ACTIVE;
    VIR_CONNECT_GET_ALL_DOMAINS_STATS_INACTIVE = VIR_CONNECT_LIST_DOMAINS_INACTIVE;
    VIR_CONNECT_GET_ALL_DOMAINS_STATS_PERSISTENT = VIR_CONNECT_LIST_DOMAINS_PERSISTENT;
    VIR_CONNECT_GET_ALL_DOMAINS_STATS_TRANSIENT = VIR_CONNECT_LIST_DOMAINS_TRANSIENT;
    VIR_CONNECT_GET_ALL_DOMAINS_STATS_RUNNING = VIR_CONNECT_LIST_DOMAINS_RUNNING;
    VIR_CONNECT_GET_ALL_DOMAINS_STATS_PAUSED = VIR_CONNECT_LIST_DOMAINS_PAUSED;
    VIR_CONNECT_GET_ALL_DOMAINS_STATS_SHUTOFF = VIR_CONNECT_LIST_DOMAINS_SHUTOFF;
    VIR_CONNECT_GET_ALL_DOMAINS_STATS_OTHER = VIR_CONNECT_LIST_DOMAINS_OTHER;
    VIR_CONNECT_GET_ALL_DOMAINS_STATS_NOWAIT = 1 shl 29;
    VIR_CONNECT_GET_ALL_DOMAINS_STATS_BACKING = 1 shl 30;
    VIR_CONNECT_GET_ALL_DOMAINS_STATS_ENFORCE_STATS = 1 shl 31;
;

function virConnectGetAllDomainStats(conn:TvirConnectPtr; stats:dword; retStats:PPvirDomainStatsRecordPtr; flags:dword):longint;cdecl;external libvirt;
function virDomainListGetStats(doms:PvirDomainPtr; stats:dword; retStats:PPvirDomainStatsRecordPtr; flags:dword):longint;cdecl;external libvirt;
procedure virDomainStatsRecordListFree(stats:PvirDomainStatsRecordPtr);cdecl;external libvirt;
{
 * Perf Event API
  }
{*
 * VIR_PERF_PARAM_CMT:
 *
 * Macro for typed parameter name that represents CMT perf event
 * which can be used to measure the usage of cache (bytes) by
 * applications running on the platform. It corresponds to the
 * "perf.cmt" field in the *Stats APIs.
 *
 * Since: 1.3.3
  }
const
  VIR_PERF_PARAM_CMT = 'cmt';  
{*
 * VIR_PERF_PARAM_MBMT:
 *
 * Macro for typed parameter name that represents MBMT perf event
 * which can be used to monitor total system bandwidth (bytes/s)
 * from one level of cache to another. It corresponds to the
 * "perf.mbmt" field in the *Stats APIs.
 *
 * Since: 1.3.5
  }
  VIR_PERF_PARAM_MBMT = 'mbmt';  
{*
 * VIR_PERF_PARAM_MBML:
 *
 * Macro for typed parameter name that represents MBML perf event
 * which can be used to monitor the amount of data (bytes/s) sent
 * through the memory controller on the socket. It corresponds to
 * the "perf.mbml" field in the *Stats APIs.
 *
 * Since: 1.3.5
  }
  VIR_PERF_PARAM_MBML = 'mbml';  
{*
 * VIR_PERF_PARAM_CACHE_MISSES:
 *
 * Macro for typed parameter name that represents cache_misses perf
 * event which can be used to measure the count of cache misses by
 * applications running on the platform. It corresponds to the
 * "perf.cache_misses" field in the *Stats APIs.
 *
 * Since: 2.3.0
  }
  VIR_PERF_PARAM_CACHE_MISSES = 'cache_misses';  
{*
 * VIR_PERF_PARAM_CACHE_REFERENCES:
 *
 * Macro for typed parameter name that represents cache_references
 * perf event which can be used to measure the count of cache hits
 * by applications running on the platform. It corresponds to the
 * "perf.cache_references" field in the *Stats APIs.
 *
 * Since: 2.3.0
  }
  VIR_PERF_PARAM_CACHE_REFERENCES = 'cache_references';  
{*
 * VIR_PERF_PARAM_INSTRUCTIONS:
 *
 * Macro for typed parameter name that represents instructions perf
 * event which can be used to measure the count of instructions
 * by applications running on the platform. It corresponds to the
 * "perf.instructions" field in the *Stats APIs.
 *
 * Since: 2.3.0
  }
  VIR_PERF_PARAM_INSTRUCTIONS = 'instructions';  
{*
 * VIR_PERF_PARAM_CPU_CYCLES:
 *
 * Macro for typed parameter name that represents cpu_cycles perf event
 * describing the total/elapsed cpu cycles. This can be used to measure
 * how many cpu cycles one instruction needs.
 * It corresponds to the "perf.cpu_cycles" field in the *Stats APIs.
 *
 * Since: 2.3.0
  }
  VIR_PERF_PARAM_CPU_CYCLES = 'cpu_cycles';  
{*
 * VIR_PERF_PARAM_BRANCH_INSTRUCTIONS:
 *
 * Macro for typed parameter name that represents branch_instructions
 * perf event which can be used to measure the count of branch instructions
 * by applications running on the platform. It corresponds to the
 * "perf.branch_instructions" field in the *Stats APIs.
 *
 * Since: 3.0.0
  }
  VIR_PERF_PARAM_BRANCH_INSTRUCTIONS = 'branch_instructions';  
{*
 * VIR_PERF_PARAM_BRANCH_MISSES:
 *
 * Macro for typed parameter name that represents branch_misses
 * perf event which can be used to measure the count of branch misses
 * by applications running on the platform. It corresponds to the
 * "perf.branch_misses" field in the *Stats APIs.
 *
 * Since: 3.0.0
  }
  VIR_PERF_PARAM_BRANCH_MISSES = 'branch_misses';  
{*
 * VIR_PERF_PARAM_BUS_CYCLES:
 *
 * Macro for typed parameter name that represents bus_cycles
 * perf event which can be used to measure the count of bus cycles
 * by applications running on the platform. It corresponds to the
 * "perf.bus_cycles" field in the *Stats APIs.
 *
 * Since: 3.0.0
  }
  VIR_PERF_PARAM_BUS_CYCLES = 'bus_cycles';  
{*
 * VIR_PERF_PARAM_STALLED_CYCLES_FRONTEND:
 *
 * Macro for typed parameter name that represents stalled_cycles_frontend
 * perf event which can be used to measure the count of stalled cpu cycles
 * in the frontend of the instruction processor pipeline by applications
 * running on the platform. It corresponds to the
 * "perf.stalled_cycles_frontend" field in the *Stats APIs.
 *
 * Since: 3.0.0
  }
  VIR_PERF_PARAM_STALLED_CYCLES_FRONTEND = 'stalled_cycles_frontend';  
{*
 * VIR_PERF_PARAM_STALLED_CYCLES_BACKEND:
 *
 * Macro for typed parameter name that represents stalled_cycles_backend
 * perf event which can be used to measure the count of stalled cpu cycles
 * in the backend of the instruction processor pipeline by application
 * running on the platform. It corresponds to the
 * "perf.stalled_cycles_backend" field in the *Stats APIs.
 *
 * Since: 3.0.0
  }
  VIR_PERF_PARAM_STALLED_CYCLES_BACKEND = 'stalled_cycles_backend';  
{*
 * VIR_PERF_PARAM_REF_CPU_CYCLES:
 *
 * Macro for typed parameter name that represents ref_cpu_cycles
 * perf event which can be used to measure the count of total cpu
 * cycles not affected by CPU frequency scaling by applications
 * running on the platform. It corresponds to the
 * "perf.ref_cpu_cycles" field in the *Stats APIs.
 *
 * Since: 3.0.0
  }
  VIR_PERF_PARAM_REF_CPU_CYCLES = 'ref_cpu_cycles';  
{*
 * VIR_PERF_PARAM_CPU_CLOCK:
 *
 * Macro for typed parameter name that represents cpu_clock
 * perf event which can be used to measure the count of cpu
 * clock time by applications running on the platform. It
 * corresponds to the "perf.cpu_clock" field in the *Stats
 * APIs.
 *
 * Since: 3.2.0
  }
  VIR_PERF_PARAM_CPU_CLOCK = 'cpu_clock';  
{*
 * VIR_PERF_PARAM_TASK_CLOCK:
 *
 * Macro for typed parameter name that represents task_clock
 * perf event which can be used to measure the count of task
 * clock time by applications running on the platform. It
 * corresponds to the "perf.task_clock" field in the *Stats
 * APIs.
 *
 * Since: 3.2.0
  }
  VIR_PERF_PARAM_TASK_CLOCK = 'task_clock';  
{*
 * VIR_PERF_PARAM_PAGE_FAULTS:
 *
 * Macro for typed parameter name that represents page_faults
 * perf event which can be used to measure the count of page
 * faults by applications running on the platform. It corresponds
 * to the "perf.page_faults" field in the *Stats APIs.
 *
 * Since: 3.2.0
  }
  VIR_PERF_PARAM_PAGE_FAULTS = 'page_faults';  
{*
 * VIR_PERF_PARAM_CONTEXT_SWITCHES:
 *
 * Macro for typed parameter name that represents context_switches
 * perf event which can be used to measure the count of context
 * switches by applications running on the platform. It corresponds
 * to the "perf.context_switches" field in the *Stats APIs.
 *
 * Since: 3.2.0
  }
  VIR_PERF_PARAM_CONTEXT_SWITCHES = 'context_switches';  
{*
 * VIR_PERF_PARAM_CPU_MIGRATIONS:
 *
 * Macro for typed parameter name that represents cpu_migrations
 * perf event which can be used to measure the count of cpu
 * migrations by applications running on the platform. It corresponds
 * to the "perf.cpu_migrations" field in the *Stats APIs.
 *
 * Since: 3.2.0
  }
  VIR_PERF_PARAM_CPU_MIGRATIONS = 'cpu_migrations';  
{*
 * VIR_PERF_PARAM_PAGE_FAULTS_MIN:
 *
 * Macro for typed parameter name that represents page_faults_min
 * perf event which can be used to measure the count of minor page
 * faults by applications running on the platform. It corresponds
 * to the "perf.page_faults_min" field in the *Stats APIs.
 *
 * Since: 3.2.0
  }
  VIR_PERF_PARAM_PAGE_FAULTS_MIN = 'page_faults_min';  
{*
 * VIR_PERF_PARAM_PAGE_FAULTS_MAJ:
 *
 * Macro for typed parameter name that represents page_faults_maj
 * perf event which can be used to measure the count of major page
 * faults by applications running on the platform. It corresponds
 * to the "perf.page_faults_maj" field in the *Stats APIs.
 *
 * Since: 3.2.0
  }
  VIR_PERF_PARAM_PAGE_FAULTS_MAJ = 'page_faults_maj';  
{*
 * VIR_PERF_PARAM_ALIGNMENT_FAULTS:
 *
 * Macro for typed parameter name that represents alignment_faults
 * perf event which can be used to measure the count of alignment
 * faults by applications running on the platform. It corresponds
 * to the "perf.alignment_faults" field in the *Stats APIs.
 *
 * Since: 3.2.0
  }
  VIR_PERF_PARAM_ALIGNMENT_FAULTS = 'alignment_faults';  
{*
 * VIR_PERF_PARAM_EMULATION_FAULTS:
 *
 * Macro for typed parameter name that represents emulation_faults
 * perf event which can be used to measure the count of emulation
 * faults by applications running on the platform. It corresponds
 * to the "perf.emulation_faults" field in the *Stats APIs.
 *
 * Since: 3.2.0
  }
  VIR_PERF_PARAM_EMULATION_FAULTS = 'emulation_faults';  

function virDomainGetPerfEvents(dom:TvirDomainPtr; params:PvirTypedParameterPtr; nparams:Plongint; flags:dword):longint;cdecl;external libvirt;
function virDomainSetPerfEvents(dom:TvirDomainPtr; params:TvirTypedParameterPtr; nparams:longint; flags:dword):longint;cdecl;external libvirt;
{
 * BlockJob API
  }
{*
 * virDomainBlockJobType:
 *
 * Describes various possible block jobs.
 *
 * Since: 0.9.4
  }
{ Placeholder (Since: 0.9.4)  }
{ Block Pull (virDomainBlockPull, or virDomainBlockRebase without
     * flags), job ends on completion
     *
     * Since: 0.9.4
      }
{ Block Copy (virDomainBlockCopy, or virDomainBlockRebase with
     * flags), job exists as long as mirroring is active
     *
     * Since: 0.9.12
      }
{ Block Commit (virDomainBlockCommit without flags), job ends on
     * completion
     *
     * Since: 0.10.2
      }
{ Active Block Commit (virDomainBlockCommit with flags), job
     * exists as long as sync is active
     *
     * Since: 1.2.6
      }
{ Backup (virDomainBackupBegin)
     *
     * Since: 6.0.0
      }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 0.9.10)  }
{$endif}
type
  PvirDomainBlockJobType = ^TvirDomainBlockJobType;
  TvirDomainBlockJobType =  Longint;
  Const
    VIR_DOMAIN_BLOCK_JOB_TYPE_UNKNOWN = 0;
    VIR_DOMAIN_BLOCK_JOB_TYPE_PULL = 1;
    VIR_DOMAIN_BLOCK_JOB_TYPE_COPY = 2;
    VIR_DOMAIN_BLOCK_JOB_TYPE_COMMIT = 3;
    VIR_DOMAIN_BLOCK_JOB_TYPE_ACTIVE_COMMIT = 4;
    VIR_DOMAIN_BLOCK_JOB_TYPE_BACKUP = 5;
    VIR_DOMAIN_BLOCK_JOB_TYPE_LAST = 6;
;
{*
 * virDomainBlockJobAbortFlags:
 *
 * VIR_DOMAIN_BLOCK_JOB_ABORT_ASYNC: Request only, do not wait for completion
 * VIR_DOMAIN_BLOCK_JOB_ABORT_PIVOT: Pivot to new file when ending a copy or
 *                                   active commit job
 *
 * Since: 0.9.12
  }
{ (Since: 0.9.12)  }
{ (Since: 0.9.12)  }
type
  PvirDomainBlockJobAbortFlags = ^TvirDomainBlockJobAbortFlags;
  TvirDomainBlockJobAbortFlags =  Longint;
  Const
    VIR_DOMAIN_BLOCK_JOB_ABORT_ASYNC = 1 shl 0;
    VIR_DOMAIN_BLOCK_JOB_ABORT_PIVOT = 1 shl 1;
;

function virDomainBlockJobAbort(dom:TvirDomainPtr; disk:Pchar; flags:dword):longint;cdecl;external libvirt;
{*
 * virDomainBlockJobInfoFlags:
 *
 * Flags for use with virDomainGetBlockJobInfo
 *
 * Since: 1.2.9
  }
{ bandwidth in bytes/s
                                                           instead of MiB/s (Since: 1.2.9)  }
type
  PvirDomainBlockJobInfoFlags = ^TvirDomainBlockJobInfoFlags;
  TvirDomainBlockJobInfoFlags =  Longint;
  Const
    VIR_DOMAIN_BLOCK_JOB_INFO_BANDWIDTH_BYTES = 1 shl 0;
;
{*
 * virDomainBlockJobCursor:
 *
 * An iterator for monitoring block job operations
 *
 * Since: 0.9.4
  }
type
  PvirDomainBlockJobCursor = ^TvirDomainBlockJobCursor;
  TvirDomainBlockJobCursor = qword;
{*
 * virDomainBlockJobInfo:
 *
 * Since: 0.9.4
  }
{ virDomainBlockJobType  }
{ either bytes/s or MiB/s, according to flags  }
{
     * The following fields provide an indication of block job progress.  @cur
     * indicates the current position and will be between 0 and @end.  @end is
     * the final cursor position for this operation and represents completion.
     * To approximate progress, divide @cur by @end.
      }
  PvirDomainBlockJobInfo = ^TvirDomainBlockJobInfo;
  TvirDomainBlockJobInfo = record
      _type : longint;
      bandwidth : dword;
      cur : TvirDomainBlockJobCursor;
      end : TvirDomainBlockJobCursor;
    end;

{*
 * virDomainBlockJobInfoPtr:
 *
 * Since: 0.9.4
  }

  PvirDomainBlockJobInfoPtr = ^TvirDomainBlockJobInfoPtr;
  TvirDomainBlockJobInfoPtr = PvirDomainBlockJobInfo;

function virDomainGetBlockJobInfo(dom:TvirDomainPtr; disk:Pchar; info:TvirDomainBlockJobInfoPtr; flags:dword):longint;cdecl;external libvirt;
{*
 * virDomainBlockJobSetSpeedFlags:
 *
 * Flags for use with virDomainBlockJobSetSpeed
 *
 * Since: 1.2.9
  }
{ bandwidth in bytes/s
                                                            instead of MiB/s (Since: 1.2.9)  }
type
  PvirDomainBlockJobSetSpeedFlags = ^TvirDomainBlockJobSetSpeedFlags;
  TvirDomainBlockJobSetSpeedFlags =  Longint;
  Const
    VIR_DOMAIN_BLOCK_JOB_SPEED_BANDWIDTH_BYTES = 1 shl 0;
;

function virDomainBlockJobSetSpeed(dom:TvirDomainPtr; disk:Pchar; bandwidth:dword; flags:dword):longint;cdecl;external libvirt;
{*
 * virDomainBlockPullFlags:
 *
 * Flags for use with virDomainBlockPull (values chosen to be a subset of the
 * flags for virDomainBlockRebase)
 *
 * Since: 1.2.9
  }
{ bandwidth in bytes/s
                                                       instead of MiB/s (Since: 1.2.9)  }
type
  PvirDomainBlockPullFlags = ^TvirDomainBlockPullFlags;
  TvirDomainBlockPullFlags =  Longint;
  Const
    VIR_DOMAIN_BLOCK_PULL_BANDWIDTH_BYTES = 1 shl 6;
;

function virDomainBlockPull(dom:TvirDomainPtr; disk:Pchar; bandwidth:dword; flags:dword):longint;cdecl;external libvirt;
{*
 * virDomainBlockRebaseFlags:
 *
 * Flags available for virDomainBlockRebase().
 *
 * Since: 0.9.12
  }
{ Limit copy to top of source
                                                   backing chain (Since: 0.9.12)  }
{ Reuse existing external
                                                   file for a copy (Since: 0.9.12)  }
{ Make destination file raw (Since: 0.9.12)  }
{ Start a copy job (Since: 0.9.12)  }
{ Keep backing chain
                                                   referenced using relative
                                                   names (Since: 1.2.7)  }
{ Treat destination as block
                                                   device instead of file (Since: 1.2.9)  }
{ bandwidth in bytes/s
                                                         instead of MiB/s (Since: 1.2.9)  }
type
  PvirDomainBlockRebaseFlags = ^TvirDomainBlockRebaseFlags;
  TvirDomainBlockRebaseFlags =  Longint;
  Const
    VIR_DOMAIN_BLOCK_REBASE_SHALLOW = 1 shl 0;
    VIR_DOMAIN_BLOCK_REBASE_REUSE_EXT = 1 shl 1;
    VIR_DOMAIN_BLOCK_REBASE_COPY_RAW = 1 shl 2;
    VIR_DOMAIN_BLOCK_REBASE_COPY = 1 shl 3;
    VIR_DOMAIN_BLOCK_REBASE_RELATIVE = 1 shl 4;
    VIR_DOMAIN_BLOCK_REBASE_COPY_DEV = 1 shl 5;
    VIR_DOMAIN_BLOCK_REBASE_BANDWIDTH_BYTES = 1 shl 6;
;

function virDomainBlockRebase(dom:TvirDomainPtr; disk:Pchar; base:Pchar; bandwidth:dword; flags:dword):longint;cdecl;external libvirt;
{*
 * virDomainBlockCopyFlags:
 *
 * Flags available for virDomainBlockCopy().
 *
 * Since: 1.2.8
  }
{ Limit copy to top of source backing chain (Since: 1.2.8)  }
{ Reuse existing external file for a copy (Since: 1.2.8)  }
{ Don't force usage of recoverable job for the copy operation (Since: 3.5.0)  }
{ Force the copy job to synchronously propagate guest writes into
     * the destination image, so that the copy is guaranteed to converge
     *
     * Since: 8.0.0
      }
type
  PvirDomainBlockCopyFlags = ^TvirDomainBlockCopyFlags;
  TvirDomainBlockCopyFlags =  Longint;
  Const
    VIR_DOMAIN_BLOCK_COPY_SHALLOW = 1 shl 0;
    VIR_DOMAIN_BLOCK_COPY_REUSE_EXT = 1 shl 1;
    VIR_DOMAIN_BLOCK_COPY_TRANSIENT_JOB = 1 shl 2;
    VIR_DOMAIN_BLOCK_COPY_SYNCHRONOUS_WRITES = 1 shl 3;
;
{*
 * VIR_DOMAIN_BLOCK_COPY_BANDWIDTH:
 * Macro for the virDomainBlockCopy bandwidth tunable: it represents
 * the maximum bandwidth in bytes/s, and is used while getting the
 * copy operation into the mirrored phase, with a type of ullong.  For
 * compatibility with virDomainBlockJobSetSpeed(), values larger than
 * 2^52 bytes/sec (a 32-bit MiB/s value) may be rejected on input due
 * to overflow considerations (but do you really have an interface
 * with that much bandwidth?), and values larger than 2^31 bytes/sec
 * may cause overflow problems if queried in bytes/sec.  Hypervisors
 * may further restrict the set of valid values. Specifying 0 is the
 * same as omitting this parameter, to request no bandwidth limiting.
 * Some hypervisors may lack support for this parameter, while still
 * allowing a subsequent change of bandwidth via
 * virDomainBlockJobSetSpeed().  The actual speed can be determined
 * with virDomainGetBlockJobInfo().
 *
 * Since: 1.2.8
  }
  VIR_DOMAIN_BLOCK_COPY_BANDWIDTH = 'bandwidth';  
{*
 * VIR_DOMAIN_BLOCK_COPY_GRANULARITY:
 * Macro for the virDomainBlockCopy granularity tunable: it represents
 * the granularity in bytes at which the copy operation recognizes
 * dirty blocks that need copying, as an unsigned int.  Hypervisors may
 * restrict this to be a power of two or fall within a certain
 * range. Specifying 0 is the same as omitting this parameter, to
 * request the hypervisor default.
 *
 * Since: 1.2.8
  }
  VIR_DOMAIN_BLOCK_COPY_GRANULARITY = 'granularity';  
{*
 * VIR_DOMAIN_BLOCK_COPY_BUF_SIZE:
 * Macro for the virDomainBlockCopy buffer size tunable: it represents
 * how much data in bytes can be in flight between source and destination,
 * as an unsigned long long. Specifying 0 is the same as omitting this
 * parameter, to request the hypervisor default.
 *
 * Since: 1.2.8
  }
  VIR_DOMAIN_BLOCK_COPY_BUF_SIZE = 'buf-size';  

function virDomainBlockCopy(dom:TvirDomainPtr; disk:Pchar; destxml:Pchar; params:TvirTypedParameterPtr; nparams:longint; 
           flags:dword):longint;cdecl;external libvirt;
{*
 * virDomainBlockCommitFlags:
 *
 * Flags available for virDomainBlockCommit().
 *
 * Since: 0.10.2
  }
{ NULL base means next backing
                                                 file, not whole chain (Since: 0.10.2)  }
{ Delete any files that are now
                                                 invalid after their contents
                                                 have been committed (Since: 0.10.2)  }
{ Allow a two-phase commit when
                                                 top is the active layer (Since: 1.2.6)  }
{ keep the backing chain
                                                  referenced using relative
                                                  names (Since: 1.2.7)  }
{ bandwidth in bytes/s
                                                         instead of MiB/s (Since: 1.2.9)  }
type
  PvirDomainBlockCommitFlags = ^TvirDomainBlockCommitFlags;
  TvirDomainBlockCommitFlags =  Longint;
  Const
    VIR_DOMAIN_BLOCK_COMMIT_SHALLOW = 1 shl 0;
    VIR_DOMAIN_BLOCK_COMMIT_DELETE = 1 shl 1;
    VIR_DOMAIN_BLOCK_COMMIT_ACTIVE = 1 shl 2;
    VIR_DOMAIN_BLOCK_COMMIT_RELATIVE = 1 shl 3;
    VIR_DOMAIN_BLOCK_COMMIT_BANDWIDTH_BYTES = 1 shl 4;
;

function virDomainBlockCommit(dom:TvirDomainPtr; disk:Pchar; base:Pchar; top:Pchar; bandwidth:dword; 
           flags:dword):longint;cdecl;external libvirt;
{ Block I/O throttling support  }
{*
 * VIR_DOMAIN_BLOCK_IOTUNE_TOTAL_BYTES_SEC:
 *
 * Macro for the BlockIoTune tunable weight: it represents the total
 * bytes per second permitted through a block device, as a ullong.
 *
 * Since: 0.9.8
  }
const
  VIR_DOMAIN_BLOCK_IOTUNE_TOTAL_BYTES_SEC = 'total_bytes_sec';  
{*
 * VIR_DOMAIN_BLOCK_IOTUNE_READ_BYTES_SEC:
 *
 * Macro for the BlockIoTune tunable weight: it represents the read
 * bytes per second permitted through a block device, as a ullong.
 *
 * Since: 0.9.8
  }
  VIR_DOMAIN_BLOCK_IOTUNE_READ_BYTES_SEC = 'read_bytes_sec';  
{*
 * VIR_DOMAIN_BLOCK_IOTUNE_WRITE_BYTES_SEC:
 *
 * Macro for the BlockIoTune tunable weight: it represents the write
 * bytes per second permitted through a block device, as a ullong.
 *
 * Since: 0.9.8
  }
  VIR_DOMAIN_BLOCK_IOTUNE_WRITE_BYTES_SEC = 'write_bytes_sec';  
{*
 * VIR_DOMAIN_BLOCK_IOTUNE_TOTAL_IOPS_SEC:
 *
 * Macro for the BlockIoTune tunable weight: it represents the total
 * I/O operations per second permitted through a block device, as a ullong.
 *
 * Since: 0.9.8
  }
  VIR_DOMAIN_BLOCK_IOTUNE_TOTAL_IOPS_SEC = 'total_iops_sec';  
{*
 * VIR_DOMAIN_BLOCK_IOTUNE_READ_IOPS_SEC:
 *
 * Macro for the BlockIoTune tunable weight: it represents the read
 * I/O operations per second permitted through a block device, as a ullong.
 *
 * Since: 0.9.8
  }
  VIR_DOMAIN_BLOCK_IOTUNE_READ_IOPS_SEC = 'read_iops_sec';  
{*
 * VIR_DOMAIN_BLOCK_IOTUNE_WRITE_IOPS_SEC:
 * Macro for the BlockIoTune tunable weight: it represents the write
 * I/O operations per second permitted through a block device, as a ullong.
 *
 * Since: 0.9.8
  }
  VIR_DOMAIN_BLOCK_IOTUNE_WRITE_IOPS_SEC = 'write_iops_sec';  
{*
 * VIR_DOMAIN_BLOCK_IOTUNE_TOTAL_BYTES_SEC_MAX:
 *
 * Macro for the BlockIoTune tunable weight: it represents the maximum total
 * bytes per second permitted through a block device, as a ullong.
 *
 * Since: 1.2.11
  }
  VIR_DOMAIN_BLOCK_IOTUNE_TOTAL_BYTES_SEC_MAX = 'total_bytes_sec_max';  
{*
 * VIR_DOMAIN_BLOCK_IOTUNE_READ_BYTES_SEC_MAX:
 *
 * Macro for the BlockIoTune tunable weight: it represents the maximum read
 * bytes per second permitted through a block device, as a ullong.
 *
 * Since: 1.2.11
  }
  VIR_DOMAIN_BLOCK_IOTUNE_READ_BYTES_SEC_MAX = 'read_bytes_sec_max';  
{*
 * VIR_DOMAIN_BLOCK_IOTUNE_WRITE_BYTES_SEC_MAX:
 *
 * Macro for the BlockIoTune tunable weight: it represents the maximum write
 * bytes per second permitted through a block device, as a ullong.
 *
 * Since: 1.2.11
  }
  VIR_DOMAIN_BLOCK_IOTUNE_WRITE_BYTES_SEC_MAX = 'write_bytes_sec_max';  
{*
 * VIR_DOMAIN_BLOCK_IOTUNE_TOTAL_IOPS_SEC_MAX:
 *
 * Macro for the BlockIoTune tunable weight: it represents the maximum
 * I/O operations per second permitted through a block device, as a ullong.
 *
 * Since: 1.2.11
  }
  VIR_DOMAIN_BLOCK_IOTUNE_TOTAL_IOPS_SEC_MAX = 'total_iops_sec_max';  
{*
 * VIR_DOMAIN_BLOCK_IOTUNE_READ_IOPS_SEC_MAX:
 *
 * Macro for the BlockIoTune tunable weight: it represents the maximum read
 * I/O operations per second permitted through a block device, as a ullong.
 *
 * Since: 1.2.11
  }
  VIR_DOMAIN_BLOCK_IOTUNE_READ_IOPS_SEC_MAX = 'read_iops_sec_max';  
{*
 * VIR_DOMAIN_BLOCK_IOTUNE_WRITE_IOPS_SEC_MAX:
 * Macro for the BlockIoTune tunable weight: it represents the maximum write
 * I/O operations per second permitted through a block device, as a ullong.
 *
 * Since: 1.2.11
  }
  VIR_DOMAIN_BLOCK_IOTUNE_WRITE_IOPS_SEC_MAX = 'write_iops_sec_max';  
{*
 * VIR_DOMAIN_BLOCK_IOTUNE_TOTAL_BYTES_SEC_MAX_LENGTH:
 *
 * Macro for the BlockIoTune tunable weight: it represents the duration in
 * seconds for the burst allowed by total_bytes_sec_max, as a ullong.
 *
 * Since: 2.4.0
  }
  VIR_DOMAIN_BLOCK_IOTUNE_TOTAL_BYTES_SEC_MAX_LENGTH = 'total_bytes_sec_max_length';  
{*
 * VIR_DOMAIN_BLOCK_IOTUNE_READ_BYTES_SEC_MAX_LENGTH:
 *
 * Macro for the BlockIoTune tunable weight: it represents the duration in
 * seconds for the burst allowed by read_bytes_sec_max, as a ullong.
 *
 * Since: 2.4.0
  }
  VIR_DOMAIN_BLOCK_IOTUNE_READ_BYTES_SEC_MAX_LENGTH = 'read_bytes_sec_max_length';  
{*
 * VIR_DOMAIN_BLOCK_IOTUNE_WRITE_BYTES_SEC_MAX_LENGTH:
 *
 * Macro for the BlockIoTune tunable weight: it represents the duration in
 * seconds for the burst allowed by write_bytes_sec_max, as a ullong.
 *
 * Since: 2.4.0
  }
  VIR_DOMAIN_BLOCK_IOTUNE_WRITE_BYTES_SEC_MAX_LENGTH = 'write_bytes_sec_max_length';  
{*
 * VIR_DOMAIN_BLOCK_IOTUNE_TOTAL_IOPS_SEC_MAX_LENGTH:
 *
 * Macro for the BlockIoTune tunable weight: it represents the duration in
 * seconds for the burst allowed by total_iops_sec_max, as a ullong.
 *
 * Since: 2.4.0
  }
  VIR_DOMAIN_BLOCK_IOTUNE_TOTAL_IOPS_SEC_MAX_LENGTH = 'total_iops_sec_max_length';  
{*
 * VIR_DOMAIN_BLOCK_IOTUNE_READ_IOPS_SEC_MAX_LENGTH:
 *
 * Macro for the BlockIoTune tunable weight: it represents the duration in
 * seconds for the burst allowed by read_iops_sec_max, as a ullong.
 *
 * Since: 2.4.0
  }
  VIR_DOMAIN_BLOCK_IOTUNE_READ_IOPS_SEC_MAX_LENGTH = 'read_iops_sec_max_length';  
{*
 * VIR_DOMAIN_BLOCK_IOTUNE_WRITE_IOPS_SEC_MAX_LENGTH:
 *
 * Macro for the BlockIoTune tunable weight: it represents the duration in
 * seconds for the burst allowed by write_iops_sec_max, as a ullong.
 *
 * Since: 2.4.0
  }
  VIR_DOMAIN_BLOCK_IOTUNE_WRITE_IOPS_SEC_MAX_LENGTH = 'write_iops_sec_max_length';  
{*
 * VIR_DOMAIN_BLOCK_IOTUNE_SIZE_IOPS_SEC:
 * Macro for the BlockIoTune tunable weight: it represents the size
 * I/O operations per second permitted through a block device, as a ullong.
 *
 * Since: 1.2.11
  }
  VIR_DOMAIN_BLOCK_IOTUNE_SIZE_IOPS_SEC = 'size_iops_sec';  
{*
 * VIR_DOMAIN_BLOCK_IOTUNE_GROUP_NAME:
 * Macro for the BlockIoTune tunable weight: it represents a group name to
 * allow sharing of I/O throttling quota between multiple drives, as a string.
 *
 * Since: 3.0.0
  }
  VIR_DOMAIN_BLOCK_IOTUNE_GROUP_NAME = 'group_name';  

function virDomainSetBlockIoTune(dom:TvirDomainPtr; disk:Pchar; params:TvirTypedParameterPtr; nparams:longint; flags:dword):longint;cdecl;external libvirt;
function virDomainGetBlockIoTune(dom:TvirDomainPtr; disk:Pchar; params:TvirTypedParameterPtr; nparams:Plongint; flags:dword):longint;cdecl;external libvirt;
{*
 * virDomainDiskErrorCode:
 *
 * Disk I/O error.
 *
 * Since: 0.9.10
  }
{ no error (Since: 0.9.10)  }
{ unspecified I/O error (Since: 0.9.10)  }
{ no space left on the device (Since: 0.9.10)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 0.9.10)  }
{$endif}
type
  PvirDomainDiskErrorCode = ^TvirDomainDiskErrorCode;
  TvirDomainDiskErrorCode =  Longint;
  Const
    VIR_DOMAIN_DISK_ERROR_NONE = 0;
    VIR_DOMAIN_DISK_ERROR_UNSPEC = 1;
    VIR_DOMAIN_DISK_ERROR_NO_SPACE = 2;
    VIR_DOMAIN_DISK_ERROR_LAST = 3;
;
{*
 * virDomainDiskError:
 *
 * Since: 0.9.10
  }
type
{*
 * virDomainDiskErrorPtr:
 *
 * Since: 0.9.10
  }

  PvirDomainDiskErrorPtr = ^TvirDomainDiskErrorPtr;
  TvirDomainDiskErrorPtr = PvirDomainDiskError;
{ disk target  }
{ virDomainDiskErrorCode  }
  PvirDomainDiskError = ^TvirDomainDiskError;
  TvirDomainDiskError = record
      disk : Pchar;
      error : longint;
    end;


function virDomainGetDiskErrors(dom:TvirDomainPtr; errors:TvirDomainDiskErrorPtr; maxerrors:dword; flags:dword):longint;cdecl;external libvirt;
{*
 * virKeycodeSet:
 *
 * Enum to specify which keycode mapping is in use for virDomainSendKey().
 *
 * Since: 0.9.3
  }
{ (Since: 0.9.3)  }
{ (Since: 0.9.3)  }
{ (Since: 0.9.3)  }
{ (Since: 0.9.3)  }
{ (Since: 0.9.3)  }
{ (Since: 0.9.4)  }
{ (Since: 0.9.4)  }
{ (Since: 0.9.4)  }
{ (Since: 0.9.4)  }
{ (Since: 4.2.0)  }
{$ifdef VIR_ENUM_SENTINELS}
{
     * NB: this enum value will increase over time as new keycode sets are
     * added to the libvirt API. It reflects the last keycode set supported
     * by this version of the libvirt API.
     *
     * Since: 0.9.4
      }
{$endif}
type
  PvirKeycodeSet = ^TvirKeycodeSet;
  TvirKeycodeSet =  Longint;
  Const
    VIR_KEYCODE_SET_LINUX = 0;
    VIR_KEYCODE_SET_XT = 1;
    VIR_KEYCODE_SET_ATSET1 = 2;
    VIR_KEYCODE_SET_ATSET2 = 3;
    VIR_KEYCODE_SET_ATSET3 = 4;
    VIR_KEYCODE_SET_OSX = 5;
    VIR_KEYCODE_SET_XT_KBD = 6;
    VIR_KEYCODE_SET_USB = 7;
    VIR_KEYCODE_SET_WIN32 = 8;
    VIR_KEYCODE_SET_QNUM = 9;
    VIR_KEYCODE_SET_LAST = 10;
;
{*
 * VIR_KEYCODE_SET_RFB:
 *
 * Compatibility alias for VIR_KEYCODE_SET_QNUM, which replaced it since 4.2.0.
 *
 * Since: 0.9.5
  }
  VIR_KEYCODE_SET_RFB = VIR_KEYCODE_SET_QNUM;  
{*
 * VIR_DOMAIN_SEND_KEY_MAX_KEYS:
 *
 * Maximum number of keycodes that can be sent in one virDomainSendKey() call.
 *
 * Since: 0.9.3
  }
  VIR_DOMAIN_SEND_KEY_MAX_KEYS = 16;  

function virDomainSendKey(domain:TvirDomainPtr; codeset:dword; holdtime:dword; keycodes:Pdword; nkeycodes:longint; 
           flags:dword):longint;cdecl;external libvirt;
{*
 * virDomainProcessSignal:
 *
 * These just happen to match Linux signal numbers. The numbers
 * will be mapped to whatever the SIGNUM is in the guest OS in
 * question by the agent delivering the signal. The names are
 * based on the POSIX / XSI signal standard though.
 *
 * Do not rely on all values matching Linux though. It is possible
 * this enum might be extended with new signals which have no
 * mapping in Linux.
 *
 * Since: 1.0.1
  }
{ No constant in POSIX/Linux (Since: 1.0.1)  }
{ SIGHUP (Since: 1.0.1)  }
{ SIGINT (Since: 1.0.1)  }
{ SIGQUIT (Since: 1.0.1)  }
{ SIGILL (Since: 1.0.1)  }
{ SIGTRAP (Since: 1.0.1)  }
{ SIGABRT (Since: 1.0.1)  }
{ SIGBUS (Since: 1.0.1)  }
{ SIGFPE (Since: 1.0.1)  }
{ SIGKILL (Since: 1.0.1)  }
{ SIGUSR1 (Since: 1.0.1)  }
{ SIGSEGV (Since: 1.0.1)  }
{ SIGUSR2 (Since: 1.0.1)  }
{ SIGPIPE (Since: 1.0.1)  }
{ SIGALRM (Since: 1.0.1)  }
{ SIGTERM (Since: 1.0.1)  }
{ Not in POSIX (SIGSTKFLT on Linux (Since: 1.0.1) ) }
{ SIGCHLD (Since: 1.0.1)  }
{ SIGCONT (Since: 1.0.1)  }
{ SIGSTOP (Since: 1.0.1)  }
{ SIGTSTP (Since: 1.0.1)  }
{ SIGTTIN (Since: 1.0.1)  }
{ SIGTTOU (Since: 1.0.1)  }
{ SIGURG (Since: 1.0.1)  }
{ SIGXCPU (Since: 1.0.1)  }
{ SIGXFSZ (Since: 1.0.1)  }
{ SIGVTALRM (Since: 1.0.1)  }
{ SIGPROF (Since: 1.0.1)  }
{ Not in POSIX (SIGWINCH on Linux) (Since: 1.0.1)  }
{ SIGPOLL (also known as SIGIO on Linux) (Since: 1.0.1)  }
{ Not in POSIX (SIGPWR on Linux) (Since: 1.0.1)  }
{ SIGSYS (also known as SIGUNUSED on Linux) (Since: 1.0.1)  }
{ SIGRTMIN (Since: 1.0.1)  }
{ SIGRTMIN + 1 (Since: 1.0.1)  }
{ SIGRTMIN + 2 (Since: 1.0.1)  }
{ SIGRTMIN + 3 (Since: 1.0.1)  }
{ SIGRTMIN + 4 (Since: 1.0.1)  }
{ SIGRTMIN + 5 (Since: 1.0.1)  }
{ SIGRTMIN + 6 (Since: 1.0.1)  }
{ SIGRTMIN + 7 (Since: 1.0.1)  }
{ SIGRTMIN + 8 (Since: 1.0.1)  }
{ SIGRTMIN + 9 (Since: 1.0.1)  }
{ SIGRTMIN + 10 (Since: 1.0.1)  }
{ SIGRTMIN + 11 (Since: 1.0.1)  }
{ SIGRTMIN + 12 (Since: 1.0.1)  }
{ SIGRTMIN + 13 (Since: 1.0.1)  }
{ SIGRTMIN + 14 (Since: 1.0.1)  }
{ SIGRTMIN + 15 (Since: 1.0.1)  }
{ SIGRTMIN + 16 (Since: 1.0.1)  }
{ SIGRTMIN + 17 (Since: 1.0.1)  }
{ SIGRTMIN + 18 (Since: 1.0.1)  }
{ SIGRTMIN + 19 (Since: 1.0.1)  }
{ SIGRTMIN + 20 (Since: 1.0.1)  }
{ SIGRTMIN + 21 (Since: 1.0.1)  }
{ SIGRTMIN + 22 (Since: 1.0.1)  }
{ SIGRTMIN + 23 (Since: 1.0.1)  }
{ SIGRTMIN + 24 (Since: 1.0.1)  }
{ SIGRTMIN + 25 (Since: 1.0.1)  }
{ SIGRTMIN + 26 (Since: 1.0.1)  }
{ SIGRTMIN + 27 (Since: 1.0.1)  }
{ SIGRTMIN + 28 (Since: 1.0.1)  }
{ SIGRTMIN + 29 (Since: 1.0.1)  }
{ SIGRTMIN + 30 (Since: 1.0.1)  }
{ SIGRTMIN + 31 (Since: 1.0.1)  }
{ SIGRTMIN + 32 / SIGRTMAX (Since: 1.0.1)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 1.0.1)  }
{$endif}
type
  PvirDomainProcessSignal = ^TvirDomainProcessSignal;
  TvirDomainProcessSignal =  Longint;
  Const
    VIR_DOMAIN_PROCESS_SIGNAL_NOP = 0;
    VIR_DOMAIN_PROCESS_SIGNAL_HUP = 1;
    VIR_DOMAIN_PROCESS_SIGNAL_INT = 2;
    VIR_DOMAIN_PROCESS_SIGNAL_QUIT = 3;
    VIR_DOMAIN_PROCESS_SIGNAL_ILL = 4;
    VIR_DOMAIN_PROCESS_SIGNAL_TRAP = 5;
    VIR_DOMAIN_PROCESS_SIGNAL_ABRT = 6;
    VIR_DOMAIN_PROCESS_SIGNAL_BUS = 7;
    VIR_DOMAIN_PROCESS_SIGNAL_FPE = 8;
    VIR_DOMAIN_PROCESS_SIGNAL_KILL = 9;
    VIR_DOMAIN_PROCESS_SIGNAL_USR1 = 10;
    VIR_DOMAIN_PROCESS_SIGNAL_SEGV = 11;
    VIR_DOMAIN_PROCESS_SIGNAL_USR2 = 12;
    VIR_DOMAIN_PROCESS_SIGNAL_PIPE = 13;
    VIR_DOMAIN_PROCESS_SIGNAL_ALRM = 14;
    VIR_DOMAIN_PROCESS_SIGNAL_TERM = 15;
    VIR_DOMAIN_PROCESS_SIGNAL_STKFLT = 16;
    VIR_DOMAIN_PROCESS_SIGNAL_CHLD = 17;
    VIR_DOMAIN_PROCESS_SIGNAL_CONT = 18;
    VIR_DOMAIN_PROCESS_SIGNAL_STOP = 19;
    VIR_DOMAIN_PROCESS_SIGNAL_TSTP = 20;
    VIR_DOMAIN_PROCESS_SIGNAL_TTIN = 21;
    VIR_DOMAIN_PROCESS_SIGNAL_TTOU = 22;
    VIR_DOMAIN_PROCESS_SIGNAL_URG = 23;
    VIR_DOMAIN_PROCESS_SIGNAL_XCPU = 24;
    VIR_DOMAIN_PROCESS_SIGNAL_XFSZ = 25;
    VIR_DOMAIN_PROCESS_SIGNAL_VTALRM = 26;
    VIR_DOMAIN_PROCESS_SIGNAL_PROF = 27;
    VIR_DOMAIN_PROCESS_SIGNAL_WINCH = 28;
    VIR_DOMAIN_PROCESS_SIGNAL_POLL = 29;
    VIR_DOMAIN_PROCESS_SIGNAL_PWR = 30;
    VIR_DOMAIN_PROCESS_SIGNAL_SYS = 31;
    VIR_DOMAIN_PROCESS_SIGNAL_RT0 = 32;
    VIR_DOMAIN_PROCESS_SIGNAL_RT1 = 33;
    VIR_DOMAIN_PROCESS_SIGNAL_RT2 = 34;
    VIR_DOMAIN_PROCESS_SIGNAL_RT3 = 35;
    VIR_DOMAIN_PROCESS_SIGNAL_RT4 = 36;
    VIR_DOMAIN_PROCESS_SIGNAL_RT5 = 37;
    VIR_DOMAIN_PROCESS_SIGNAL_RT6 = 38;
    VIR_DOMAIN_PROCESS_SIGNAL_RT7 = 39;
    VIR_DOMAIN_PROCESS_SIGNAL_RT8 = 40;
    VIR_DOMAIN_PROCESS_SIGNAL_RT9 = 41;
    VIR_DOMAIN_PROCESS_SIGNAL_RT10 = 42;
    VIR_DOMAIN_PROCESS_SIGNAL_RT11 = 43;
    VIR_DOMAIN_PROCESS_SIGNAL_RT12 = 44;
    VIR_DOMAIN_PROCESS_SIGNAL_RT13 = 45;
    VIR_DOMAIN_PROCESS_SIGNAL_RT14 = 46;
    VIR_DOMAIN_PROCESS_SIGNAL_RT15 = 47;
    VIR_DOMAIN_PROCESS_SIGNAL_RT16 = 48;
    VIR_DOMAIN_PROCESS_SIGNAL_RT17 = 49;
    VIR_DOMAIN_PROCESS_SIGNAL_RT18 = 50;
    VIR_DOMAIN_PROCESS_SIGNAL_RT19 = 51;
    VIR_DOMAIN_PROCESS_SIGNAL_RT20 = 52;
    VIR_DOMAIN_PROCESS_SIGNAL_RT21 = 53;
    VIR_DOMAIN_PROCESS_SIGNAL_RT22 = 54;
    VIR_DOMAIN_PROCESS_SIGNAL_RT23 = 55;
    VIR_DOMAIN_PROCESS_SIGNAL_RT24 = 56;
    VIR_DOMAIN_PROCESS_SIGNAL_RT25 = 57;
    VIR_DOMAIN_PROCESS_SIGNAL_RT26 = 58;
    VIR_DOMAIN_PROCESS_SIGNAL_RT27 = 59;
    VIR_DOMAIN_PROCESS_SIGNAL_RT28 = 60;
    VIR_DOMAIN_PROCESS_SIGNAL_RT29 = 61;
    VIR_DOMAIN_PROCESS_SIGNAL_RT30 = 62;
    VIR_DOMAIN_PROCESS_SIGNAL_RT31 = 63;
    VIR_DOMAIN_PROCESS_SIGNAL_RT32 = 64;
    VIR_DOMAIN_PROCESS_SIGNAL_LAST = 65;
;

function virDomainSendProcessSignal(domain:TvirDomainPtr; pid_value:int64; signum:dword; flags:dword):longint;cdecl;external libvirt;
{
 * Deprecated calls
  }
function virDomainCreateLinux(conn:TvirConnectPtr; xmlDesc:Pchar; flags:dword):TvirDomainPtr;cdecl;external libvirt;
{
 * Domain Event Notification
  }
{*
 * virDomainEventType:
 *
 * a virDomainEventType is emitted during domain lifecycle events
 *
 * Since: 0.5.0
  }
{ (Since: 0.5.0)  }
{ (Since: 0.5.0)  }
{ (Since: 0.5.0)  }
{ (Since: 0.5.0)  }
{ (Since: 0.5.0)  }
{ (Since: 0.5.0)  }
{ (Since: 0.9.8)  }
{ (Since: 0.10.2)  }
{ (Since: 1.1.1)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 0.9.10)  }
{$endif}
type
  PvirDomainEventType = ^TvirDomainEventType;
  TvirDomainEventType =  Longint;
  Const
    VIR_DOMAIN_EVENT_DEFINED = 0;
    VIR_DOMAIN_EVENT_UNDEFINED = 1;
    VIR_DOMAIN_EVENT_STARTED = 2;
    VIR_DOMAIN_EVENT_SUSPENDED = 3;
    VIR_DOMAIN_EVENT_RESUMED = 4;
    VIR_DOMAIN_EVENT_STOPPED = 5;
    VIR_DOMAIN_EVENT_SHUTDOWN = 6;
    VIR_DOMAIN_EVENT_PMSUSPENDED = 7;
    VIR_DOMAIN_EVENT_CRASHED = 8;
    VIR_DOMAIN_EVENT_LAST = 9;
;
{*
 * virDomainEventDefinedDetailType:
 *
 * Details on the cause of a 'defined' lifecycle event
 *
 * Since: 0.5.0
  }
{ Newly created config file (Since: 0.5.0)  }
{ Changed config file (Since: 0.5.0)  }
{ Domain was renamed (Since: 1.2.19)  }
{ Config was restored from a snapshot (Since: 1.3.3)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 0.9.10)  }
{$endif}
type
  PvirDomainEventDefinedDetailType = ^TvirDomainEventDefinedDetailType;
  TvirDomainEventDefinedDetailType =  Longint;
  Const
    VIR_DOMAIN_EVENT_DEFINED_ADDED = 0;
    VIR_DOMAIN_EVENT_DEFINED_UPDATED = 1;
    VIR_DOMAIN_EVENT_DEFINED_RENAMED = 2;
    VIR_DOMAIN_EVENT_DEFINED_FROM_SNAPSHOT = 3;
    VIR_DOMAIN_EVENT_DEFINED_LAST = 4;
;
{*
 * virDomainEventUndefinedDetailType:
 *
 * Details on the cause of an 'undefined' lifecycle event
 *
 * Since: 0.5.0
  }
{ Deleted the config file (Since: 0.5.0)  }
{ Domain was renamed (Since: 1.2.19)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 0.9.10)  }
{$endif}
type
  PvirDomainEventUndefinedDetailType = ^TvirDomainEventUndefinedDetailType;
  TvirDomainEventUndefinedDetailType =  Longint;
  Const
    VIR_DOMAIN_EVENT_UNDEFINED_REMOVED = 0;
    VIR_DOMAIN_EVENT_UNDEFINED_RENAMED = 1;
    VIR_DOMAIN_EVENT_UNDEFINED_LAST = 2;
;
{*
 * virDomainEventStartedDetailType:
 *
 * Details on the cause of a 'started' lifecycle event
 *
 * Since: 0.5.0
  }
{ Normal startup from boot (Since: 0.5.0)  }
{ Incoming migration from another host (Since: 0.5.0)  }
{ Restored from a state file (Since: 0.5.0)  }
{ Restored from snapshot (Since: 0.8.0)  }
{ Started due to wakeup event (Since: 0.9.11)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 0.9.10)  }
{$endif}
type
  PvirDomainEventStartedDetailType = ^TvirDomainEventStartedDetailType;
  TvirDomainEventStartedDetailType =  Longint;
  Const
    VIR_DOMAIN_EVENT_STARTED_BOOTED = 0;
    VIR_DOMAIN_EVENT_STARTED_MIGRATED = 1;
    VIR_DOMAIN_EVENT_STARTED_RESTORED = 2;
    VIR_DOMAIN_EVENT_STARTED_FROM_SNAPSHOT = 3;
    VIR_DOMAIN_EVENT_STARTED_WAKEUP = 4;
    VIR_DOMAIN_EVENT_STARTED_LAST = 5;
;
{*
 * virDomainEventSuspendedDetailType:
 *
 * Details on the cause of a 'suspended' lifecycle event
 *
 * Since: 0.5.0
  }
{ Normal suspend due to admin pause (Since: 0.5.0)  }
{ Suspended for offline migration (Since: 0.5.0)  }
{ Suspended due to a disk I/O error (Since: 0.8.0)  }
{ Suspended due to a watchdog firing (Since: 0.8.0)  }
{ Restored from paused state file (Since: 0.9.5)  }
{ Restored from paused snapshot (Since: 0.9.5)  }
{ Some APIs (e.g., migration, snapshot) internally need to suspend a domain. This event detail is used when resume operation at the end of such API fails. (Since: 1.0.1)  }
{ suspended for post-copy migration (Since: 1.3.3)  }
{ suspended after failed post-copy (Since: 1.3.3)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 0.9.10)  }
{$endif}
type
  PvirDomainEventSuspendedDetailType = ^TvirDomainEventSuspendedDetailType;
  TvirDomainEventSuspendedDetailType =  Longint;
  Const
    VIR_DOMAIN_EVENT_SUSPENDED_PAUSED = 0;
    VIR_DOMAIN_EVENT_SUSPENDED_MIGRATED = 1;
    VIR_DOMAIN_EVENT_SUSPENDED_IOERROR = 2;
    VIR_DOMAIN_EVENT_SUSPENDED_WATCHDOG = 3;
    VIR_DOMAIN_EVENT_SUSPENDED_RESTORED = 4;
    VIR_DOMAIN_EVENT_SUSPENDED_FROM_SNAPSHOT = 5;
    VIR_DOMAIN_EVENT_SUSPENDED_API_ERROR = 6;
    VIR_DOMAIN_EVENT_SUSPENDED_POSTCOPY = 7;
    VIR_DOMAIN_EVENT_SUSPENDED_POSTCOPY_FAILED = 8;
    VIR_DOMAIN_EVENT_SUSPENDED_LAST = 9;
;
{*
 * virDomainEventResumedDetailType:
 *
 * Details on the cause of a 'resumed' lifecycle event
 *
 * Since: 0.5.0
  }
{ Normal resume due to admin unpause (Since: 0.5.0)  }
{ Resumed for completion of migration (Since: 0.5.0)  }
{ Resumed from snapshot (Since: 0.9.5)  }
{ Resumed, but migration is still
                                                running in post-copy mode (Since: 1.3.3)  }
{ Running, but migration failed in post-copy (Since: 8.5.0)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 0.9.10)  }
{$endif}
type
  PvirDomainEventResumedDetailType = ^TvirDomainEventResumedDetailType;
  TvirDomainEventResumedDetailType =  Longint;
  Const
    VIR_DOMAIN_EVENT_RESUMED_UNPAUSED = 0;
    VIR_DOMAIN_EVENT_RESUMED_MIGRATED = 1;
    VIR_DOMAIN_EVENT_RESUMED_FROM_SNAPSHOT = 2;
    VIR_DOMAIN_EVENT_RESUMED_POSTCOPY = 3;
    VIR_DOMAIN_EVENT_RESUMED_POSTCOPY_FAILED = 4;
    VIR_DOMAIN_EVENT_RESUMED_LAST = 5;
;
{*
 * virDomainEventStoppedDetailType:
 *
 * Details on the cause of a 'stopped' lifecycle event
 *
 * Since: 0.5.0
  }
{ Normal shutdown (Since: 0.5.0)  }
{ Forced poweroff from host (Since: 0.5.0)  }
{ Guest crashed (Since: 0.5.0)  }
{ Migrated off to another host (Since: 0.5.0)  }
{ Saved to a state file (Since: 0.5.0)  }
{ Host emulator/mgmt failed (Since: 0.5.0)  }
{ offline snapshot loaded (Since: 0.8.0)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 0.9.10)  }
{$endif}
type
  PvirDomainEventStoppedDetailType = ^TvirDomainEventStoppedDetailType;
  TvirDomainEventStoppedDetailType =  Longint;
  Const
    VIR_DOMAIN_EVENT_STOPPED_SHUTDOWN = 0;
    VIR_DOMAIN_EVENT_STOPPED_DESTROYED = 1;
    VIR_DOMAIN_EVENT_STOPPED_CRASHED = 2;
    VIR_DOMAIN_EVENT_STOPPED_MIGRATED = 3;
    VIR_DOMAIN_EVENT_STOPPED_SAVED = 4;
    VIR_DOMAIN_EVENT_STOPPED_FAILED = 5;
    VIR_DOMAIN_EVENT_STOPPED_FROM_SNAPSHOT = 6;
    VIR_DOMAIN_EVENT_STOPPED_LAST = 7;
;
{*
 * virDomainEventShutdownDetailType:
 *
 * Details on the cause of a 'shutdown' lifecycle event
 *
 * Since: 0.9.8
  }
{ Guest finished shutdown sequence (Since: 0.9.8)  }
{ Domain finished shutting down after request from the guest itself
     * (e.g. hardware-specific action) (Since: 3.4.0)  }
{ Domain finished shutting down after request from the host (e.g. killed by
     * a signal)
     *
     * Since: 3.4.0
      }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 0.9.10)  }
{$endif}
type
  PvirDomainEventShutdownDetailType = ^TvirDomainEventShutdownDetailType;
  TvirDomainEventShutdownDetailType =  Longint;
  Const
    VIR_DOMAIN_EVENT_SHUTDOWN_FINISHED = 0;
    VIR_DOMAIN_EVENT_SHUTDOWN_GUEST = 1;
    VIR_DOMAIN_EVENT_SHUTDOWN_HOST = 2;
    VIR_DOMAIN_EVENT_SHUTDOWN_LAST = 3;
;
{*
 * virDomainEventPMSuspendedDetailType:
 *
 * Details on the cause of a 'pmsuspended' lifecycle event
 *
 * Since: 0.10.2
  }
{ Guest was PM suspended to memory (Since: 0.10.2)  }
{ Guest was PM suspended to disk (Since: 1.0.0)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 0.10.2)  }
{$endif}
type
  PvirDomainEventPMSuspendedDetailType = ^TvirDomainEventPMSuspendedDetailType;
  TvirDomainEventPMSuspendedDetailType =  Longint;
  Const
    VIR_DOMAIN_EVENT_PMSUSPENDED_MEMORY = 0;
    VIR_DOMAIN_EVENT_PMSUSPENDED_DISK = 1;
    VIR_DOMAIN_EVENT_PMSUSPENDED_LAST = 2;
;
{*
 * virDomainEventCrashedDetailType:
 *
 * Details on the cause of a 'crashed' lifecycle event
 *
 * Since: 1.1.1
  }
{ Guest was panicked (Since: 1.1.1)  }
{ Guest was crashloaded (Since: 6.1.0)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 1.1.1)  }
{$endif}
type
  PvirDomainEventCrashedDetailType = ^TvirDomainEventCrashedDetailType;
  TvirDomainEventCrashedDetailType =  Longint;
  Const
    VIR_DOMAIN_EVENT_CRASHED_PANICKED = 0;
    VIR_DOMAIN_EVENT_CRASHED_CRASHLOADED = 1;
    VIR_DOMAIN_EVENT_CRASHED_LAST = 2;
;
{*
 * virDomainMemoryFailureRecipientType:
 *
 * Recipient of a memory failure event.
 *
 * Since: 6.9.0
  }
{ memory failure at hypersivor memory address space (Since: 6.9.0)  }
{ memory failure at guest memory address space (Since: 6.9.0)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 6.9.0)  }
{$endif}
type
  PvirDomainMemoryFailureRecipientType = ^TvirDomainMemoryFailureRecipientType;
  TvirDomainMemoryFailureRecipientType =  Longint;
  Const
    VIR_DOMAIN_EVENT_MEMORY_FAILURE_RECIPIENT_HYPERVISOR = 0;
    VIR_DOMAIN_EVENT_MEMORY_FAILURE_RECIPIENT_GUEST = 1;
    VIR_DOMAIN_EVENT_MEMORY_FAILURE_RECIPIENT_LAST = 2;
;
{*
 * virDomainMemoryFailureActionType:
 *
 * Action of a memory failure event.
 *
 * Since: 6.9.0
  }
{ the memory failure could be ignored. This will only be the case for
     * action-optional failures.
     *
     * Since: 6.9.0
      }
{ memory failure occurred in guest memory, the guest enabled MCE handling
     * mechanism, and hypervisor could inject the MCE into the guest
     * successfully.
     *
     * Since: 6.9.0
      }
{ the failure is unrecoverable.  This occurs for action-required failures
     * if the recipient is the hypervisor; hypervisor will exit.
     *
     * Since: 6.9.0
      }
{ the failure is unrecoverable but confined to the guest. This occurs if
     * the recipient is a guest which is not ready to handle memory failures.
     *
     * Since: 6.9.0
      }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 6.9.0)  }
{$endif}
type
  PvirDomainMemoryFailureActionType = ^TvirDomainMemoryFailureActionType;
  TvirDomainMemoryFailureActionType =  Longint;
  Const
    VIR_DOMAIN_EVENT_MEMORY_FAILURE_ACTION_IGNORE = 0;
    VIR_DOMAIN_EVENT_MEMORY_FAILURE_ACTION_INJECT = 1;
    VIR_DOMAIN_EVENT_MEMORY_FAILURE_ACTION_FATAL = 2;
    VIR_DOMAIN_EVENT_MEMORY_FAILURE_ACTION_RESET = 3;
    VIR_DOMAIN_EVENT_MEMORY_FAILURE_ACTION_LAST = 4;
;
{*
 * virDomainMemoryFailureFlags:
 *
 * Since: 6.9.0
  }
{ whether a memory failure event is action-required or action-optional
     * (e.g. a failure during memory scrub). (Since: 6.9.0)  }
{ whether the failure occurred while the previous failure was still in
     * progress.
     *
     * Since: 6.9.0
      }
type
  PvirDomainMemoryFailureFlags = ^TvirDomainMemoryFailureFlags;
  TvirDomainMemoryFailureFlags =  Longint;
  Const
    VIR_DOMAIN_MEMORY_FAILURE_ACTION_REQUIRED = 1 shl 0;
    VIR_DOMAIN_MEMORY_FAILURE_RECURSIVE = 1 shl 1;
;
{*
 * virConnectDomainEventCallback:
 * @conn: virConnect connection
 * @dom: The domain on which the event occurred
 * @event: The specific virDomainEventType which occurred
 * @detail: event specific detail information (virDomainEvent*DetailType)
 * @opaque: opaque user data
 *
 * A callback function to be registered, and called when a domain event occurs
 *
 * Returns 0 (the return value is currently ignored)
 *
 * Since: 0.5.0
  }
type

  TvirConnectDomainEventCallback = function (conn:TvirConnectPtr; dom:TvirDomainPtr; event:longint; detail:longint; opaque:pointer):longint;cdecl;

function virConnectDomainEventRegister(conn:TvirConnectPtr; cb:TvirConnectDomainEventCallback; opaque:pointer; freecb:TvirFreeCallback):longint;cdecl;external libvirt;
function virConnectDomainEventDeregister(conn:TvirConnectPtr; cb:TvirConnectDomainEventCallback):longint;cdecl;external libvirt;
function virDomainIsActive(dom:TvirDomainPtr):longint;cdecl;external libvirt;
function virDomainIsPersistent(dom:TvirDomainPtr):longint;cdecl;external libvirt;
function virDomainIsUpdated(dom:TvirDomainPtr):longint;cdecl;external libvirt;
{*
 * virDomainJobType:
 *
 * Since: 0.7.7
  }
{ No job is active (Since: 0.7.7)  }
{ Job with a finite completion time (Since: 0.7.7)  }
{ Job without a finite completion time (Since: 0.7.7)  }
{ Job has finished, but isn't cleaned up (Since: 0.7.7)  }
{ Job hit error, but isn't cleaned up (Since: 0.7.7)  }
{ Job was aborted, but isn't cleaned up (Since: 0.7.7)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 0.9.10)  }
{$endif}
type
  PvirDomainJobType = ^TvirDomainJobType;
  TvirDomainJobType =  Longint;
  Const
    VIR_DOMAIN_JOB_NONE = 0;
    VIR_DOMAIN_JOB_BOUNDED = 1;
    VIR_DOMAIN_JOB_UNBOUNDED = 2;
    VIR_DOMAIN_JOB_COMPLETED = 3;
    VIR_DOMAIN_JOB_FAILED = 4;
    VIR_DOMAIN_JOB_CANCELLED = 5;
    VIR_DOMAIN_JOB_LAST = 6;
;
{*
 * virDomainJobInfo:
 *
 * Since: 0.7.7
  }
type
{*
 * virDomainJobInfoPtr:
 *
 * Since: 0.7.7
  }

  PvirDomainJobInfoPtr = ^TvirDomainJobInfoPtr;
  TvirDomainJobInfoPtr = PvirDomainJobInfo;
{ One of virDomainJobType  }
{ Time is measured in milliseconds  }
{ Always set  }
{ Only for VIR_DOMAIN_JOB_BOUNDED  }
{ Data is measured in bytes unless otherwise specified
     * and is measuring the job as a whole.
     *
     * For VIR_DOMAIN_JOB_UNBOUNDED, dataTotal may be less
     * than the final sum of dataProcessed + dataRemaining
     * in the event that the hypervisor has to repeat some
     * data, such as due to dirtied pages during migration.
     *
     * For VIR_DOMAIN_JOB_BOUNDED, dataTotal shall always
     * equal the sum of dataProcessed + dataRemaining.
      }
{ As above, but only tracking guest memory progress  }
{ As above, but only tracking guest disk file progress  }
  PvirDomainJobInfo = ^TvirDomainJobInfo;
  TvirDomainJobInfo = record
      _type : longint;
      timeElapsed : qword;
      timeRemaining : qword;
      dataTotal : qword;
      dataProcessed : qword;
      dataRemaining : qword;
      memTotal : qword;
      memProcessed : qword;
      memRemaining : qword;
      fileTotal : qword;
      fileProcessed : qword;
      fileRemaining : qword;
    end;

{*
 * virDomainGetJobStatsFlags:
 *
 * Flags OR'ed together to provide specific behavior when querying domain
 * job statistics.
 *
 * Since: 1.2.9
  }
{ return stats of a recently
                                              * completed job (Since: 1.2.9)  }
{ don't remove completed
                                                     stats when reading them (Since: 6.0.0)  }

  PvirDomainGetJobStatsFlags = ^TvirDomainGetJobStatsFlags;
  TvirDomainGetJobStatsFlags =  Longint;
  Const
    VIR_DOMAIN_JOB_STATS_COMPLETED = 1 shl 0;
    VIR_DOMAIN_JOB_STATS_KEEP_COMPLETED = 1 shl 1;
;

function virDomainGetJobInfo(dom:TvirDomainPtr; info:TvirDomainJobInfoPtr):longint;cdecl;external libvirt;
function virDomainGetJobStats(domain:TvirDomainPtr; _type:Plongint; params:PvirTypedParameterPtr; nparams:Plongint; flags:dword):longint;cdecl;external libvirt;
function virDomainAbortJob(dom:TvirDomainPtr):longint;cdecl;external libvirt;
{*
 * virDomainAbortJobFlagsValues:
 *
 * Flags OR'ed together to provide specific behavior when aborting a domain job.
 *
 * Since: 8.5.0
  }
{ Interrupt post-copy migration. Since migration in a post-copy phase
     * cannot be aborted without losing the domain (none of the hosts involved
     * in migration has a complete state of the domain), the migration will be
     * suspended and it can later be resumed using virDomainMigrate* APIs with
     * VIR_MIGRATE_POSTCOPY_RESUME flag. (Since: 8.5.0)  }
type
  PvirDomainAbortJobFlagsValues = ^TvirDomainAbortJobFlagsValues;
  TvirDomainAbortJobFlagsValues =  Longint;
  Const
    VIR_DOMAIN_ABORT_JOB_POSTCOPY = 1 shl 0;
;

function virDomainAbortJobFlags(dom:TvirDomainPtr; flags:dword):longint;cdecl;external libvirt;
{*
 * virDomainJobOperation:
 *
 * Since: 3.3.0
  }
{ (Since: 3.3.0)  }
{ (Since: 3.3.0)  }
{ (Since: 3.3.0)  }
{ (Since: 3.3.0)  }
{ (Since: 3.3.0)  }
{ (Since: 3.3.0)  }
{ (Since: 3.3.0)  }
{ (Since: 3.3.0)  }
{ (Since: 3.3.0)  }
{ (Since: 6.0.0)  }
{ (Since: 9.0.0)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 3.3.0)  }
{$endif}
type
  PvirDomainJobOperation = ^TvirDomainJobOperation;
  TvirDomainJobOperation =  Longint;
  Const
    VIR_DOMAIN_JOB_OPERATION_UNKNOWN = 0;
    VIR_DOMAIN_JOB_OPERATION_START = 1;
    VIR_DOMAIN_JOB_OPERATION_SAVE = 2;
    VIR_DOMAIN_JOB_OPERATION_RESTORE = 3;
    VIR_DOMAIN_JOB_OPERATION_MIGRATION_IN = 4;
    VIR_DOMAIN_JOB_OPERATION_MIGRATION_OUT = 5;
    VIR_DOMAIN_JOB_OPERATION_SNAPSHOT = 6;
    VIR_DOMAIN_JOB_OPERATION_SNAPSHOT_REVERT = 7;
    VIR_DOMAIN_JOB_OPERATION_DUMP = 8;
    VIR_DOMAIN_JOB_OPERATION_BACKUP = 9;
    VIR_DOMAIN_JOB_OPERATION_SNAPSHOT_DELETE = 10;
    VIR_DOMAIN_JOB_OPERATION_LAST = 11;
;
{*
 * VIR_DOMAIN_JOB_OPERATION:
 *
 * virDomainGetJobStats field: the operation which started the job as
 * VIR_TYPED_PARAM_INT. The values correspond to the items in
 * virDomainJobOperation enum.
 *
 * Since: 3.3.0
  }
  VIR_DOMAIN_JOB_OPERATION = 'operation';  
{*
 * VIR_DOMAIN_JOB_TIME_ELAPSED:
 *
 * virDomainGetJobStats field: time (ms) since the beginning of the
 * job, as VIR_TYPED_PARAM_ULLONG.
 *
 * This field corresponds to timeElapsed field in virDomainJobInfo.
 *
 * Since: 1.0.3
  }
  VIR_DOMAIN_JOB_TIME_ELAPSED = 'time_elapsed';  
{*
 * VIR_DOMAIN_JOB_TIME_ELAPSED_NET:
 *
 * virDomainGetJobStats field: time (ms) since the beginning of the
 * migration job NOT including the time required to transfer control
 * flow from the source host to the destination host,
 * as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 1.2.15
  }
  VIR_DOMAIN_JOB_TIME_ELAPSED_NET = 'time_elapsed_net';  
{*
 * VIR_DOMAIN_JOB_TIME_REMAINING:
 *
 * virDomainGetJobStats field: remaining time (ms) for VIR_DOMAIN_JOB_BOUNDED
 * jobs, as VIR_TYPED_PARAM_ULLONG.
 *
 * This field corresponds to timeRemaining field in virDomainJobInfo.
 *
 * Since: 1.0.3
  }
  VIR_DOMAIN_JOB_TIME_REMAINING = 'time_remaining';  
{*
 * VIR_DOMAIN_JOB_DOWNTIME:
 *
 * virDomainGetJobStats field: downtime (ms) that is expected to happen
 * during migration, as VIR_TYPED_PARAM_ULLONG. The real computed downtime
 * between the time guest CPUs were paused and the time they were resumed
 * is reported for completed migration.
 *
 * Since: 1.0.3
  }
  VIR_DOMAIN_JOB_DOWNTIME = 'downtime';  
{*
 * VIR_DOMAIN_JOB_DOWNTIME_NET:
 *
 * virDomainGetJobStats field: real measured downtime (ms) NOT including
 * the time required to transfer control flow from the source host to the
 * destination host, as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 1.2.15
  }
  VIR_DOMAIN_JOB_DOWNTIME_NET = 'downtime_net';  
{*
 * VIR_DOMAIN_JOB_SETUP_TIME:
 *
 * virDomainGetJobStats field: total time in milliseconds spent preparing
 * the migration in the 'setup' phase before the iterations begin, as
 * VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 1.2.9
  }
  VIR_DOMAIN_JOB_SETUP_TIME = 'setup_time';  
{*
 * VIR_DOMAIN_JOB_DATA_TOTAL:
 *
 * virDomainGetJobStats field: total number of bytes supposed to be
 * transferred, as VIR_TYPED_PARAM_ULLONG. For VIR_DOMAIN_JOB_UNBOUNDED
 * jobs, this may be less than the sum of VIR_DOMAIN_JOB_DATA_PROCESSED and
 * VIR_DOMAIN_JOB_DATA_REMAINING in the event that the hypervisor has to
 * repeat some data, e.g., due to dirtied pages during migration. For
 * VIR_DOMAIN_JOB_BOUNDED jobs, VIR_DOMAIN_JOB_DATA_TOTAL shall always equal
 * VIR_DOMAIN_JOB_DATA_PROCESSED + VIR_DOMAIN_JOB_DATA_REMAINING.
 *
 * This field corresponds to dataTotal field in virDomainJobInfo.
 *
 * Since: 1.0.3
  }
  VIR_DOMAIN_JOB_DATA_TOTAL = 'data_total';  
{*
 * VIR_DOMAIN_JOB_DATA_PROCESSED:
 *
 * virDomainGetJobStats field: number of bytes transferred from the
 * beginning of the job, as VIR_TYPED_PARAM_ULLONG.
 *
 * This field corresponds to dataProcessed field in virDomainJobInfo.
 *
 * Since: 1.0.3
  }
  VIR_DOMAIN_JOB_DATA_PROCESSED = 'data_processed';  
{*
 * VIR_DOMAIN_JOB_DATA_REMAINING:
 *
 * virDomainGetJobStats field: number of bytes that still need to be
 * transferred, as VIR_TYPED_PARAM_ULLONG.
 *
 * This field corresponds to dataRemaining field in virDomainJobInfo.
 *
 * Since: 1.0.3
  }
  VIR_DOMAIN_JOB_DATA_REMAINING = 'data_remaining';  
{*
 * VIR_DOMAIN_JOB_MEMORY_TOTAL:
 *
 * virDomainGetJobStats field: as VIR_DOMAIN_JOB_DATA_TOTAL but only
 * tracking guest memory progress, as VIR_TYPED_PARAM_ULLONG.
 *
 * This field corresponds to memTotal field in virDomainJobInfo.
 *
 * Since: 1.0.3
  }
  VIR_DOMAIN_JOB_MEMORY_TOTAL = 'memory_total';  
{*
 * VIR_DOMAIN_JOB_MEMORY_PROCESSED:
 *
 * virDomainGetJobStats field: as VIR_DOMAIN_JOB_DATA_PROCESSED but only
 * tracking guest memory progress, as VIR_TYPED_PARAM_ULLONG.
 *
 * This field corresponds to memProcessed field in virDomainJobInfo.
 *
 * Since: 1.0.3
  }
  VIR_DOMAIN_JOB_MEMORY_PROCESSED = 'memory_processed';  
{*
 * VIR_DOMAIN_JOB_MEMORY_REMAINING:
 *
 * virDomainGetJobStats field: as VIR_DOMAIN_JOB_DATA_REMAINING but only
 * tracking guest memory progress, as VIR_TYPED_PARAM_ULLONG.
 *
 * This field corresponds to memRemaining field in virDomainJobInfo.
 *
 * Since: 1.0.3
  }
  VIR_DOMAIN_JOB_MEMORY_REMAINING = 'memory_remaining';  
{*
 * VIR_DOMAIN_JOB_MEMORY_CONSTANT:
 *
 * virDomainGetJobStats field: number of pages filled with a constant
 * byte (all bytes in a single page are identical) transferred since the
 * beginning of the migration job, as VIR_TYPED_PARAM_ULLONG.
 *
 * The most common example of such pages are zero pages, i.e., pages filled
 * with zero bytes.
 *
 * Since: 1.0.3
  }
  VIR_DOMAIN_JOB_MEMORY_CONSTANT = 'memory_constant';  
{*
 * VIR_DOMAIN_JOB_MEMORY_NORMAL:
 *
 * virDomainGetJobStats field: number of pages that were transferred without
 * any kind of compression (i.e., pages which were not filled with a constant
 * byte and which could not be compressed) transferred since the beginning
 * of the migration job, as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 1.0.3
  }
  VIR_DOMAIN_JOB_MEMORY_NORMAL = 'memory_normal';  
{*
 * VIR_DOMAIN_JOB_MEMORY_NORMAL_BYTES:
 *
 * virDomainGetJobStats field: number of bytes transferred as normal pages,
 * as VIR_TYPED_PARAM_ULLONG.
 *
 * See VIR_DOMAIN_JOB_MEMORY_NORMAL for more details.
 *
 * Since: 1.0.3
  }
  VIR_DOMAIN_JOB_MEMORY_NORMAL_BYTES = 'memory_normal_bytes';  
{*
 * VIR_DOMAIN_JOB_MEMORY_BPS:
 *
 * virDomainGetJobStats field: network throughput used while migrating
 * memory in Bytes per second, as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 1.2.9
  }
  VIR_DOMAIN_JOB_MEMORY_BPS = 'memory_bps';  
{* VIR_DOMAIN_JOB_MEMORY_DIRTY_RATE:
 *
 * virDomainGetJobStats field: number of memory pages dirtied by the guest
 * per second, as VIR_TYPED_PARAM_ULLONG. This statistics makes sense only
 * when live migration is running.
 *
 * Since: 1.3.1
  }
  VIR_DOMAIN_JOB_MEMORY_DIRTY_RATE = 'memory_dirty_rate';  
{*
 * VIR_DOMAIN_JOB_MEMORY_PAGE_SIZE:
 *
 * virDomainGetJobStats field: memory page size in bytes, as
 * VIR_TYPED_PARAM_ULLONG. If present, this parameter can be used to
 * convert other page based statistics, such as
 * VIR_DOMAIN_JOB_MEMORY_DIRTY_RATE or VIR_DOMAIN_JOB_COMPRESSION_PAGES
 * to bytes.
 *
 * Since: 3.9.0
  }
  VIR_DOMAIN_JOB_MEMORY_PAGE_SIZE = 'memory_page_size';  
{*
 * VIR_DOMAIN_JOB_MEMORY_ITERATION:
 *
 * virDomainGetJobStats field: current iteration over domain's memory
 * during live migration, as VIR_TYPED_PARAM_ULLONG. This is set to zero
 * when memory starts to be transferred and the value is increased by one
 * every time a new iteration is started to transfer memory pages dirtied
 * since the last iteration.
 *
 * Since: 1.3.1
  }
  VIR_DOMAIN_JOB_MEMORY_ITERATION = 'memory_iteration';  
{*
 * VIR_DOMAIN_JOB_MEMORY_POSTCOPY_REQS:
 *
 * virDomainGetJobStats field: number page requests received from the
 * destination host during post-copy migration, as VIR_TYPED_PARAM_ULLONG.
 * This counter is incremented whenever the migrated domain tries to access
 * a memory page which has not been transferred from the source host yet.
 *
 * Since: 5.0.0
  }
  VIR_DOMAIN_JOB_MEMORY_POSTCOPY_REQS = 'memory_postcopy_requests';  
{*
 * VIR_DOMAIN_JOB_DISK_TOTAL:
 *
 * virDomainGetJobStats field: as VIR_DOMAIN_JOB_DATA_TOTAL but only
 * tracking guest disk progress, as VIR_TYPED_PARAM_ULLONG.
 *
 * This field corresponds to fileTotal field in virDomainJobInfo.
 *
 * Since: 1.0.3
  }
  VIR_DOMAIN_JOB_DISK_TOTAL = 'disk_total';  
{*
 * VIR_DOMAIN_JOB_DISK_PROCESSED:
 *
 * virDomainGetJobStats field: as VIR_DOMAIN_JOB_DATA_PROCESSED but only
 * tracking guest disk progress, as VIR_TYPED_PARAM_ULLONG.
 *
 * This field corresponds to fileProcessed field in virDomainJobInfo.
 *
 * Since: 1.0.3
  }
  VIR_DOMAIN_JOB_DISK_PROCESSED = 'disk_processed';  
{*
 * VIR_DOMAIN_JOB_DISK_REMAINING:
 *
 * virDomainGetJobStats field: as VIR_DOMAIN_JOB_DATA_REMAINING but only
 * tracking guest disk progress, as VIR_TYPED_PARAM_ULLONG.
 *
 * This field corresponds to fileRemaining field in virDomainJobInfo.
 *
 * Since: 1.0.3
  }
  VIR_DOMAIN_JOB_DISK_REMAINING = 'disk_remaining';  
{*
 * VIR_DOMAIN_JOB_DISK_BPS:
 *
 * virDomainGetJobStats field: network throughput used while migrating
 * disks in Bytes per second, as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 1.2.9
  }
  VIR_DOMAIN_JOB_DISK_BPS = 'disk_bps';  
{*
 * VIR_DOMAIN_JOB_COMPRESSION_CACHE:
 *
 * virDomainGetJobStats field: size of the cache (in bytes) used for
 * compressing repeatedly transferred memory pages during live migration,
 * as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 1.0.3
  }
  VIR_DOMAIN_JOB_COMPRESSION_CACHE = 'compression_cache';  
{*
 * VIR_DOMAIN_JOB_COMPRESSION_BYTES:
 *
 * virDomainGetJobStats field: number of compressed bytes transferred
 * since the beginning of migration, as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 1.0.3
  }
  VIR_DOMAIN_JOB_COMPRESSION_BYTES = 'compression_bytes';  
{*
 * VIR_DOMAIN_JOB_COMPRESSION_PAGES:
 *
 * virDomainGetJobStats field: number of compressed pages transferred
 * since the beginning of migration, as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 1.0.3
  }
  VIR_DOMAIN_JOB_COMPRESSION_PAGES = 'compression_pages';  
{*
 * VIR_DOMAIN_JOB_COMPRESSION_CACHE_MISSES:
 *
 * virDomainGetJobStats field: number of repeatedly changing pages that
 * were not found in compression cache and thus could not be compressed,
 * as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 1.0.3
  }
  VIR_DOMAIN_JOB_COMPRESSION_CACHE_MISSES = 'compression_cache_misses';  
{*
 * VIR_DOMAIN_JOB_COMPRESSION_OVERFLOW:
 *
 * virDomainGetJobStats field: number of repeatedly changing pages that
 * were found in compression cache but were sent uncompressed because
 * the result of compression was larger than the original page as a whole,
 * as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 1.0.3
  }
  VIR_DOMAIN_JOB_COMPRESSION_OVERFLOW = 'compression_overflow';  
{*
 * VIR_DOMAIN_JOB_AUTO_CONVERGE_THROTTLE:
 *
 * virDomainGetJobStats field: current percentage guest CPUs are throttled
 * to when auto-convergence decided migration was not converging, as
 * VIR_TYPED_PARAM_INT.
 *
 * Since: 2.0.0
  }
  VIR_DOMAIN_JOB_AUTO_CONVERGE_THROTTLE = 'auto_converge_throttle';  
{*
 * VIR_DOMAIN_JOB_SUCCESS:
 *
 * virDomainGetJobStats field: Present only in statistics for a completed job.
 * Successful completion of the job as VIR_TYPED_PARAM_BOOLEAN.
 *
 * Since: 6.0.0
  }
  VIR_DOMAIN_JOB_SUCCESS = 'success';  
{*
 * VIR_DOMAIN_JOB_ERRMSG:
 *
 * virDomainGetJobStats field: Present only in statistics for a completed job.
 * Optional error message for a failed job.
 *
 * Since: 6.3.0
  }
  VIR_DOMAIN_JOB_ERRMSG = 'errmsg';  
{*
 * VIR_DOMAIN_JOB_DISK_TEMP_USED:
 * virDomainGetJobStats field: current usage of temporary disk space for the
 * job in bytes as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 6.0.0
  }
  VIR_DOMAIN_JOB_DISK_TEMP_USED = 'disk_temp_used';  
{*
 * VIR_DOMAIN_JOB_DISK_TEMP_TOTAL:
 * virDomainGetJobStats field: possible total temporary disk space for the
 * job in bytes as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 6.0.0
  }
  VIR_DOMAIN_JOB_DISK_TEMP_TOTAL = 'disk_temp_total';  
{*
 * virConnectDomainEventGenericCallback:
 * @conn: the connection pointer
 * @dom: the domain pointer
 * @opaque: application specified data
 *
 * A generic domain event callback handler, for use with
 * virConnectDomainEventRegisterAny(). Specific events usually
 * have a customization with extra parameters, often with @opaque being
 * passed in a different parameter position; use VIR_DOMAIN_EVENT_CALLBACK()
 * when registering an appropriate handler.
 *
 * Since: 0.8.0
  }
type

  TvirConnectDomainEventGenericCallback = procedure (conn:TvirConnectPtr; dom:TvirDomainPtr; opaque:pointer);cdecl;
{*
 * virConnectDomainEventRTCChangeCallback:
 * @conn: connection object
 * @dom: domain on which the event occurred
 * @utcoffset: the new RTC offset from UTC, measured in seconds
 * @opaque: application specified data
 *
 * The callback signature to use when registering for an event of type
 * VIR_DOMAIN_EVENT_ID_RTC_CHANGE with virConnectDomainEventRegisterAny()
 *
 * Since: 0.8.0
  }

  TvirConnectDomainEventRTCChangeCallback = procedure (conn:TvirConnectPtr; dom:TvirDomainPtr; utcoffset:int64; opaque:pointer);cdecl;
{*
 * virDomainEventWatchdogAction:
 *
 * The action that is to be taken due to the watchdog device firing
 *
 * Since: 0.8.0
  }
{ No action, watchdog ignored (Since: 0.8.0)  }
{ Guest CPUs are paused (Since: 0.8.0)  }
{ Guest CPUs are reset (Since: 0.8.0)  }
{ Guest is forcibly powered off (Since: 0.8.0)  }
{ Guest is requested to gracefully shutdown (Since: 0.8.0)  }
{ No action, a debug message logged (Since: 0.8.0)  }
{ Inject a non-maskable interrupt into guest (Since: 1.2.17)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 0.9.10)  }
{$endif}
type
  PvirDomainEventWatchdogAction = ^TvirDomainEventWatchdogAction;
  TvirDomainEventWatchdogAction =  Longint;
  Const
    VIR_DOMAIN_EVENT_WATCHDOG_NONE = 0;
    VIR_DOMAIN_EVENT_WATCHDOG_PAUSE = 1;
    VIR_DOMAIN_EVENT_WATCHDOG_RESET = 2;
    VIR_DOMAIN_EVENT_WATCHDOG_POWEROFF = 3;
    VIR_DOMAIN_EVENT_WATCHDOG_SHUTDOWN = 4;
    VIR_DOMAIN_EVENT_WATCHDOG_DEBUG = 5;
    VIR_DOMAIN_EVENT_WATCHDOG_INJECTNMI = 6;
    VIR_DOMAIN_EVENT_WATCHDOG_LAST = 7;
;
{*
 * virConnectDomainEventWatchdogCallback:
 * @conn: connection object
 * @dom: domain on which the event occurred
 * @action: action that is to be taken due to watchdog firing (virDomainEventWatchdogAction)
 * @opaque: application specified data
 *
 * The callback signature to use when registering for an event of type
 * VIR_DOMAIN_EVENT_ID_WATCHDOG with virConnectDomainEventRegisterAny()
 *
 * Since: 0.8.0
  }
type

  TvirConnectDomainEventWatchdogCallback = procedure (conn:TvirConnectPtr; dom:TvirDomainPtr; action:longint; opaque:pointer);cdecl;
{*
 * virDomainEventIOErrorAction:
 *
 * The action that is to be taken due to an IO error occurring
 *
 * Since: 0.8.0
  }
{ No action, IO error ignored (Since: 0.8.0)  }
{ Guest CPUs are paused (Since: 0.8.0)  }
{ IO error reported to guest OS (Since: 0.8.0)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 0.9.10)  }
{$endif}
type
  PvirDomainEventIOErrorAction = ^TvirDomainEventIOErrorAction;
  TvirDomainEventIOErrorAction =  Longint;
  Const
    VIR_DOMAIN_EVENT_IO_ERROR_NONE = 0;
    VIR_DOMAIN_EVENT_IO_ERROR_PAUSE = 1;
    VIR_DOMAIN_EVENT_IO_ERROR_REPORT = 2;
    VIR_DOMAIN_EVENT_IO_ERROR_LAST = 3;
;
{*
 * virConnectDomainEventIOErrorCallback:
 * @conn: connection object
 * @dom: domain on which the event occurred
 * @srcPath: The host file on which the IO error occurred
 * @devAlias: The guest device alias associated with the path
 * @action: action that is to be taken due to the IO error (virDomainEventIOErrorAction)
 * @opaque: application specified data
 *
 * The callback signature to use when registering for an event of type
 * VIR_DOMAIN_EVENT_ID_IO_ERROR with virConnectDomainEventRegisterAny()
 *
 * Since: 0.8.0
  }
type

  TvirConnectDomainEventIOErrorCallback = procedure (conn:TvirConnectPtr; dom:TvirDomainPtr; srcPath:Pchar; devAlias:Pchar; action:longint; 
                opaque:pointer);cdecl;
{*
 * virConnectDomainEventIOErrorReasonCallback:
 * @conn: connection object
 * @dom: domain on which the event occurred
 * @srcPath: The host file on which the IO error occurred
 * @devAlias: The guest device alias associated with the path
 * @action: action that is to be taken due to the IO error (virDomainEventIOErrorAction)
 * @reason: the cause of the IO error
 * @opaque: application specified data
 *
 * The callback signature to use when registering for an event of type
 * VIR_DOMAIN_EVENT_ID_IO_ERROR_REASON with virConnectDomainEventRegisterAny()
 *
 * If the I/O error is known to be caused by an ENOSPC condition in
 * the host (where resizing the disk to be larger will allow the guest
 * to be resumed as if nothing happened), @reason will be "enospc".
 * Otherwise, @reason will be "", although future strings may be added
 * if determination of other error types becomes possible.
 *
 * Since: 0.8.1
  }

  TvirConnectDomainEventIOErrorReasonCallback = procedure (conn:TvirConnectPtr; dom:TvirDomainPtr; srcPath:Pchar; devAlias:Pchar; action:longint; 
                reason:Pchar; opaque:pointer);cdecl;
{*
 * virDomainEventGraphicsPhase:
 *
 * The phase of the graphics client connection
 *
 * Since: 0.8.0
  }
{ Initial socket connection established (Since: 0.8.0)  }
{ Authentication & setup completed (Since: 0.8.0)  }
{ Final socket disconnection (Since: 0.8.0)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 0.9.10)  }
{$endif}
type
  PvirDomainEventGraphicsPhase = ^TvirDomainEventGraphicsPhase;
  TvirDomainEventGraphicsPhase =  Longint;
  Const
    VIR_DOMAIN_EVENT_GRAPHICS_CONNECT = 0;
    VIR_DOMAIN_EVENT_GRAPHICS_INITIALIZE = 1;
    VIR_DOMAIN_EVENT_GRAPHICS_DISCONNECT = 2;
    VIR_DOMAIN_EVENT_GRAPHICS_LAST = 3;
;
{*
 * virDomainEventGraphicsAddressType:
 *
 * The type of address for the connection
 *
 * Since: 0.8.0
  }
{ IPv4 address (Since: 0.8.0)  }
{ IPv6 address (Since: 0.8.0)  }
{ UNIX socket path (Since: 0.9.7)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 0.9.10)  }
{$endif}
type
  PvirDomainEventGraphicsAddressType = ^TvirDomainEventGraphicsAddressType;
  TvirDomainEventGraphicsAddressType =  Longint;
  Const
    VIR_DOMAIN_EVENT_GRAPHICS_ADDRESS_IPV4 = 0;
    VIR_DOMAIN_EVENT_GRAPHICS_ADDRESS_IPV6 = 1;
    VIR_DOMAIN_EVENT_GRAPHICS_ADDRESS_UNIX = 2;
    VIR_DOMAIN_EVENT_GRAPHICS_ADDRESS_LAST = 3;
;
{*
 * _virDomainEventGraphicsAddress:
 *
 * The data structure containing connection address details
 *
 * Since: 1.0.0
  }
{ Address family, virDomainEventGraphicsAddressType  }
{ Address of node (eg IP address, or UNIX path)  }
{ Service name/number (eg TCP port, or NULL)  }
type
  PvirDomainEventGraphicsAddress = ^TvirDomainEventGraphicsAddress;
  TvirDomainEventGraphicsAddress = record
      family : longint;
      node : Pchar;
      service : Pchar;
    end;

{*
 * virDomainEventGraphicsAddress:
 *
 * Since: 0.8.0
  }
{*
 * virDomainEventGraphicsAddressPtr:
 *
 * Since: 0.8.0
  }

  PvirDomainEventGraphicsAddressPtr = ^TvirDomainEventGraphicsAddressPtr;
  TvirDomainEventGraphicsAddressPtr = PvirDomainEventGraphicsAddress;
{*
 * _virDomainEventGraphicsSubjectIdentity:
 *
 * The data structure representing a single identity
 *
 * The types of identity differ according to the authentication scheme,
 * some examples are 'x509dname' and 'saslUsername'.
  }
{ Type of identity  }
{ Identity value  }
  PvirDomainEventGraphicsSubjectIdentity = ^TvirDomainEventGraphicsSubjectIdentity;
  TvirDomainEventGraphicsSubjectIdentity = record
      _type : Pchar;
      name : Pchar;
    end;

{*
 * virDomainEventGraphicsSubjectIdentity:
 *
 * Since: 0.8.0
  }
{*
 * virDomainEventGraphicsSubjectIdentityPtr:
 *
 * Since: 0.8.0
  }

  PvirDomainEventGraphicsSubjectIdentityPtr = ^TvirDomainEventGraphicsSubjectIdentityPtr;
  TvirDomainEventGraphicsSubjectIdentityPtr = PvirDomainEventGraphicsSubjectIdentity;
{*
 * virDomainEventGraphicsSubject:
 *
 * The data structure representing an authenticated subject
 *
 * A subject will have zero or more identities. The types of
 * identity differ according to the authentication scheme
 *
 * Since: 0.8.0
  }
{ Number of identities in array }
{ Array of identities for subject  }
  PvirDomainEventGraphicsSubject = ^TvirDomainEventGraphicsSubject;
  TvirDomainEventGraphicsSubject = record
      nidentity : longint;
      identities : TvirDomainEventGraphicsSubjectIdentityPtr;
    end;

{*
 * virDomainEventGraphicsSubject:
 *
 * Since: 0.8.0
  }
{*
 * virDomainEventGraphicsSubjectPtr:
 *
 * Since: 0.8.0
  }

  PvirDomainEventGraphicsSubjectPtr = ^TvirDomainEventGraphicsSubjectPtr;
  TvirDomainEventGraphicsSubjectPtr = PvirDomainEventGraphicsSubject;
{*
 * virConnectDomainEventGraphicsCallback:
 * @conn: connection object
 * @dom: domain on which the event occurred
 * @phase: the phase of the connection (virDomainEventGraphicsPhase)
 * @local: the local server address
 * @remote: the remote client address
 * @authScheme: the authentication scheme activated
 * @subject: the authenticated subject (user)
 * @opaque: application specified data
 *
 * The callback signature to use when registering for an event of type
 * VIR_DOMAIN_EVENT_ID_GRAPHICS with virConnectDomainEventRegisterAny()
 *
 * Since: 0.8.0
  }

  TvirConnectDomainEventGraphicsCallback = procedure (conn:TvirConnectPtr; dom:TvirDomainPtr; phase:longint; local:PvirDomainEventGraphicsAddress; remote:PvirDomainEventGraphicsAddress; 
                authScheme:Pchar; subject:PvirDomainEventGraphicsSubject; opaque:pointer);cdecl;
{*
 * virConnectDomainEventBlockJobStatus:
 *
 * Tracks status of a virDomainBlockPull(), virDomainBlockRebase(),
 * virDomainBlockCopy(), or virDomainBlockCommit() operation
 *
 * Since: 0.9.4
  }
{ (Since: 0.9.4)  }
{ (Since: 0.9.4)  }
{ (Since: 0.9.12)  }
{ (Since: 1.0.0)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 0.9.10)  }
{$endif}
type
  PvirConnectDomainEventBlockJobStatus = ^TvirConnectDomainEventBlockJobStatus;
  TvirConnectDomainEventBlockJobStatus =  Longint;
  Const
    VIR_DOMAIN_BLOCK_JOB_COMPLETED = 0;
    VIR_DOMAIN_BLOCK_JOB_FAILED = 1;
    VIR_DOMAIN_BLOCK_JOB_CANCELED = 2;
    VIR_DOMAIN_BLOCK_JOB_READY = 3;
    VIR_DOMAIN_BLOCK_JOB_LAST = 4;
;
{*
 * virConnectDomainEventBlockJobCallback:
 * @conn: connection object
 * @dom: domain on which the event occurred
 * @disk: name associated with the affected disk (filename or target
 *        device, depending on how the callback was registered)
 * @type: type of block job (virDomainBlockJobType)
 * @status: status of the operation (virConnectDomainEventBlockJobStatus)
 * @opaque: application specified data
 *
 * The string returned for @disk can be used in any of the libvirt API
 * that operate on a particular disk of the domain, and depends on what
 * event type was registered with virConnectDomainEventRegisterAny().
 * If the callback was registered using the older type of
 * VIR_DOMAIN_EVENT_ID_BLOCK_JOB, then @disk contains the absolute file
 * name of the host resource for the active layer of the disk; however,
 * this name is unstable (pivoting via block copy or active block commit
 * will change which file is active, giving a different name for the two
 * events associated with the same job) and cannot be relied on if the
 * active layer is associated with a network resource.  If the callback
 * was registered using the newer type of VIR_DOMAIN_EVENT_ID_BLOCK_JOB_2,
 * then @disk will contain the device target shorthand (the <target
 * dev='...'/> sub-element, such as "vda").
 *
 * Since: 0.9.4
  }
type

  TvirConnectDomainEventBlockJobCallback = procedure (conn:TvirConnectPtr; dom:TvirDomainPtr; disk:Pchar; _type:longint; status:longint; 
                opaque:pointer);cdecl;
{*
 * virConnectDomainEventDiskChangeReason:
 *
 * The reason describing why this callback is called
 *
 * Since: 0.9.7
  }
{ Removable media changed to empty according to startup policy as source
     * was missing. oldSrcPath is set, newSrcPath is NULL
     *
     * Since: 0.9.7
     *  }
{ Disk was dropped from domain as source file was missing.
     * oldSrcPath is set, newSrcPath is NULL
     *
     * Since: 1.1.2
     *  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 0.9.10)  }
{$endif}
type
  PvirConnectDomainEventDiskChangeReason = ^TvirConnectDomainEventDiskChangeReason;
  TvirConnectDomainEventDiskChangeReason =  Longint;
  Const
    VIR_DOMAIN_EVENT_DISK_CHANGE_MISSING_ON_START = 0;
    VIR_DOMAIN_EVENT_DISK_DROP_MISSING_ON_START = 1;
    VIR_DOMAIN_EVENT_DISK_CHANGE_LAST = 2;
;
{*
 * virConnectDomainEventDiskChangeCallback:
 * @conn: connection object
 * @dom: domain on which the event occurred
 * @oldSrcPath: old source path
 * @newSrcPath: new source path
 * @devAlias: device alias name
 * @reason: reason why this callback was called; any of
 *          virConnectDomainEventDiskChangeReason
 * @opaque: application specified data
 *
 * This callback occurs when disk gets changed. However,
 * not all @reason will cause both @oldSrcPath and @newSrcPath
 * to be non-NULL. Please see virConnectDomainEventDiskChangeReason
 * for more details.
 *
 * The callback signature to use when registering for an event of type
 * VIR_DOMAIN_EVENT_ID_DISK_CHANGE with virConnectDomainEventRegisterAny()
 *
 * Since: 0.9.7
  }
type

  TvirConnectDomainEventDiskChangeCallback = procedure (conn:TvirConnectPtr; dom:TvirDomainPtr; oldSrcPath:Pchar; newSrcPath:Pchar; devAlias:Pchar; 
                reason:longint; opaque:pointer);cdecl;
{*
 * virDomainEventTrayChangeReason:
 *
 * The reason describing why the callback was called
 *
 * Since: 0.9.11
  }
{ (Since: 0.9.11)  }
{ (Since: 0.9.11)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 0.9.11)  }
{$endif}
type
  PvirDomainEventTrayChangeReason = ^TvirDomainEventTrayChangeReason;
  TvirDomainEventTrayChangeReason =  Longint;
  Const
    VIR_DOMAIN_EVENT_TRAY_CHANGE_OPEN = 0;
    VIR_DOMAIN_EVENT_TRAY_CHANGE_CLOSE = 1;
    VIR_DOMAIN_EVENT_TRAY_CHANGE_LAST = 2;
;
{*
 * virConnectDomainEventTrayChangeCallback:
 * @conn: connection object
 * @dom: domain on which the event occurred
 * @devAlias: device alias
 * @reason: why the tray status was changed? (virDomainEventTrayChangeReason)
 * @opaque: application specified data
 *
 * This callback occurs when the tray of a removable device is moved.
 *
 * The callback signature to use when registering for an event of type
 * VIR_DOMAIN_EVENT_ID_TRAY_CHANGE with virConnectDomainEventRegisterAny()
 *
 * Since: 0.9.11
  }
type

  TvirConnectDomainEventTrayChangeCallback = procedure (conn:TvirConnectPtr; dom:TvirDomainPtr; devAlias:Pchar; reason:longint; opaque:pointer);cdecl;
{*
 * virConnectDomainEventPMWakeupCallback:
 * @conn: connection object
 * @dom: domain on which the event occurred
 * @reason: reason why the callback was called, unused currently,
 *          always passes 0
 * @opaque: application specified data
 *
 * This callback occurs when the guest is woken up.
 *
 * The callback signature to use when registering for an event of type
 * VIR_DOMAIN_EVENT_ID_PMWAKEUP with virConnectDomainEventRegisterAny()
 *
 * Since: 0.9.11
  }

  TvirConnectDomainEventPMWakeupCallback = procedure (conn:TvirConnectPtr; dom:TvirDomainPtr; reason:longint; opaque:pointer);cdecl;
{*
 * virConnectDomainEventPMSuspendCallback:
 * @conn: connection object
 * @dom: domain on which the event occurred
 * @reason: reason why the callback was called, unused currently,
 *          always passes 0
 * @opaque: application specified data
 *
 * This callback occurs when the guest is suspended.
 *
 * The callback signature to use when registering for an event of type
 * VIR_DOMAIN_EVENT_ID_PMSUSPEND with virConnectDomainEventRegisterAny()
 *
 * Since: 0.9.11
  }

  TvirConnectDomainEventPMSuspendCallback = procedure (conn:TvirConnectPtr; dom:TvirDomainPtr; reason:longint; opaque:pointer);cdecl;
{*
 * virConnectDomainEventBalloonChangeCallback:
 * @conn: connection object
 * @dom: domain on which the event occurred
 * @actual: the new balloon level measured in kibibytes(blocks of 1024 bytes)
 * @opaque: application specified data
 *
 * The callback signature to use when registering for an event of type
 * VIR_DOMAIN_EVENT_ID_BALLOON_CHANGE with virConnectDomainEventRegisterAny()
 *
 * Since: 0.10.0
  }

  TvirConnectDomainEventBalloonChangeCallback = procedure (conn:TvirConnectPtr; dom:TvirDomainPtr; actual:qword; opaque:pointer);cdecl;
{*
 * virConnectDomainEventPMSuspendDiskCallback:
 * @conn: connection object
 * @dom: domain on which the event occurred
 * @reason: reason why the callback was called, unused currently,
 *          always passes 0
 * @opaque: application specified data
 *
 * This callback occurs when the guest is suspended to disk.
 *
 * The callback signature to use when registering for an event of type
 * VIR_DOMAIN_EVENT_ID_PMSUSPEND_DISK with virConnectDomainEventRegisterAny()
 *
 * Since: 1.0.0
  }

  TvirConnectDomainEventPMSuspendDiskCallback = procedure (conn:TvirConnectPtr; dom:TvirDomainPtr; reason:longint; opaque:pointer);cdecl;
{*
 * virConnectDomainEventDeviceRemovedCallback:
 * @conn: connection object
 * @dom: domain on which the event occurred
 * @devAlias: device alias
 * @opaque: application specified data
 *
 * This callback occurs when a device is removed from the domain.
 *
 * The callback signature to use when registering for an event of type
 * VIR_DOMAIN_EVENT_ID_DEVICE_REMOVED with virConnectDomainEventRegisterAny()
 *
 * Since: 1.1.1
  }

  TvirConnectDomainEventDeviceRemovedCallback = procedure (conn:TvirConnectPtr; dom:TvirDomainPtr; devAlias:Pchar; opaque:pointer);cdecl;
{*
 * virConnectDomainEventDeviceAddedCallback:
 * @conn: connection object
 * @dom: domain on which the event occurred
 * @devAlias: device alias
 * @opaque: application specified data
 *
 * This callback occurs when a device is added to the domain.
 *
 * The callback signature to use when registering for an event of type
 * VIR_DOMAIN_EVENT_ID_DEVICE_ADDED with virConnectDomainEventRegisterAny()
 *
 * Since: 1.2.15
  }

  TvirConnectDomainEventDeviceAddedCallback = procedure (conn:TvirConnectPtr; dom:TvirDomainPtr; devAlias:Pchar; opaque:pointer);cdecl;
{*
 * virConnectDomainEventDeviceRemovalFailedCallback:
 * @conn: connection object
 * @dom: domain on which the event occurred
 * @devAlias: device alias
 * @opaque: application specified data
 *
 * This callback occurs when it's certain that removal of a device failed.
 *
 * The callback signature to use when registering for an event of type
 * VIR_DOMAIN_EVENT_ID_DEVICE_REMOVAL_FAILED with
 * virConnectDomainEventRegisterAny().
 *
 * Since: 1.3.4
  }

  TvirConnectDomainEventDeviceRemovalFailedCallback = procedure (conn:TvirConnectPtr; dom:TvirDomainPtr; devAlias:Pchar; opaque:pointer);cdecl;
{*
 * virConnectDomainEventMetadataChangeCallback:
 * @conn: connection object
 * @dom: domain on which the event occurred
 * @type: a value from virDomainMetadataTypea
 * @nsuri: XML namespace URI
 * @opaque: application specified data
 *
 * This callback is triggered when the domain XML metadata is changed
 *
 * The callback signature to use when registering for an event of type
 * VIR_DOMAIN_EVENT_ID_METADATA_CHANGE with virConnectDomainEventRegisterAny().
 *
 * Since: 3.0.0
  }

  TvirConnectDomainEventMetadataChangeCallback = procedure (conn:TvirConnectPtr; dom:TvirDomainPtr; _type:longint; nsuri:Pchar; opaque:pointer);cdecl;
{*
 * virConnectDomainEventMigrationIterationCallback:
 * @conn: connection object
 * @dom: domain on which the event occurred
 * @iteration: current iteration over domain's memory
 * @opaque: application specific data
 *
 * This callback occurs during live migration when a new iteration over
 * domain's memory starts. The @iteration value is increased by one every
 * time a new iteration is started to transfer memory pages dirtied since
 * the last iteration.
 *
 * The callback signature to use when registering for an event of type
 * VIR_DOMAIN_EVENT_ID_MIGRATION_ITERATION with
 * virConnectDomainEventRegisterAny().
 *
 * Since: 1.3.2
  }

  TvirConnectDomainEventMigrationIterationCallback = procedure (conn:TvirConnectPtr; dom:TvirDomainPtr; iteration:longint; opaque:pointer);cdecl;
{*
 * virConnectDomainEventJobCompletedCallback:
 * @conn: connection object
 * @dom: domain on which the event occurred
 * @params: job statistics stored as an array of virTypedParameter
 * @nparams: size of the params array
 * @opaque: application specific data
 *
 * This callback occurs when a job (such as migration or backup) running on
 * the domain is completed.
 *
 * The params array will contain statistics of the just completed
 * job as virDomainGetJobStats would return. The callback must not free @params
 * (the array will be freed once the callback finishes).
 *
 * The callback signature to use when registering for an event of type
 * VIR_DOMAIN_EVENT_ID_JOB_COMPLETED with
 * virConnectDomainEventRegisterAny().
 *
 * Since: 1.3.3
  }

  TvirConnectDomainEventJobCompletedCallback = procedure (conn:TvirConnectPtr; dom:TvirDomainPtr; params:TvirTypedParameterPtr; nparams:longint; opaque:pointer);cdecl;
{*
 * VIR_DOMAIN_TUNABLE_CPU_VCPUPIN:
 *
 * Macro represents formatted pinning for one vcpu specified by id which is
 * appended to the parameter name, for example "cputune.vcpupin1",
 * as VIR_TYPED_PARAM_STRING.
 *
 * Since: 1.2.9
  }

const
  VIR_DOMAIN_TUNABLE_CPU_VCPUPIN = 'cputune.vcpupin%u';  
{*
 * VIR_DOMAIN_TUNABLE_CPU_EMULATORPIN:
 *
 * Macro represents formatted pinning for emulator process,
 * as VIR_TYPED_PARAM_STRING.
 *
 * Since: 1.2.9
  }
  VIR_DOMAIN_TUNABLE_CPU_EMULATORPIN = 'cputune.emulatorpin';  
{*
 * VIR_DOMAIN_TUNABLE_CPU_IOTHREADSPIN:
 *
 * Macro represents formatted pinning for one IOThread specified by id which is
 * appended to the parameter name, for example "cputune.iothreadpin1",
 * as VIR_TYPED_PARAM_STRING.
 *
 * Since: 1.2.14
  }
  VIR_DOMAIN_TUNABLE_CPU_IOTHREADSPIN = 'cputune.iothreadpin%u';  
{*
 * VIR_DOMAIN_TUNABLE_CPU_CPU_SHARES:
 *
 * Macro represents proportional weight of the scheduler used on the
 * host cpu, when using the posix scheduler, as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 1.2.9
  }
  VIR_DOMAIN_TUNABLE_CPU_CPU_SHARES = 'cputune.cpu_shares';  
{*
 * VIR_DOMAIN_TUNABLE_CPU_GLOBAL_PERIOD:
 *
 * Macro represents the enforcement period for a quota, in microseconds,
 * for whole domain, when using the posix scheduler, as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 1.3.3
  }
  VIR_DOMAIN_TUNABLE_CPU_GLOBAL_PERIOD = 'cputune.global_period';  
{*
 * VIR_DOMAIN_TUNABLE_CPU_GLOBAL_QUOTA:
 *
 * Macro represents the maximum bandwidth to be used within a period for
 * whole domain, when using the posix scheduler, as VIR_TYPED_PARAM_LLONG.
 *
 * Since: 1.3.3
  }
  VIR_DOMAIN_TUNABLE_CPU_GLOBAL_QUOTA = 'cputune.global_quota';  
{*
 * VIR_DOMAIN_TUNABLE_CPU_VCPU_PERIOD:
 *
 * Macro represents the enforcement period for a quota, in microseconds,
 * for vcpus only, when using the posix scheduler, as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 1.2.9
  }
  VIR_DOMAIN_TUNABLE_CPU_VCPU_PERIOD = 'cputune.vcpu_period';  
{*
 * VIR_DOMAIN_TUNABLE_CPU_VCPU_QUOTA:
 *
 * Macro represents the maximum bandwidth to be used within a period for
 * vcpus only, when using the posix scheduler, as VIR_TYPED_PARAM_LLONG.
 *
 * Since: 1.2.9
  }
  VIR_DOMAIN_TUNABLE_CPU_VCPU_QUOTA = 'cputune.vcpu_quota';  
{*
 * VIR_DOMAIN_TUNABLE_CPU_EMULATOR_PERIOD:
 *
 * Macro represents the enforcement period for a quota in microseconds,
 * when using the posix scheduler, for all emulator activity not tied to
 * vcpus, as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 1.2.9
  }
  VIR_DOMAIN_TUNABLE_CPU_EMULATOR_PERIOD = 'cputune.emulator_period';  
{*
 * VIR_DOMAIN_TUNABLE_CPU_EMULATOR_QUOTA:
 *
 * Macro represents the maximum bandwidth to be used within a period for
 * all emulator activity not tied to vcpus, when using the posix scheduler,
 * as an VIR_TYPED_PARAM_LLONG.
 *
 * Since: 1.2.9
  }
  VIR_DOMAIN_TUNABLE_CPU_EMULATOR_QUOTA = 'cputune.emulator_quota';  
{*
 * VIR_DOMAIN_TUNABLE_CPU_IOTHREAD_PERIOD:
 *
 * Macro represents the enforcement period for a quota, in microseconds, for
 * iothreads only, when using the posix scheduler, as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 2.2.0
  }
  VIR_DOMAIN_TUNABLE_CPU_IOTHREAD_PERIOD = 'cputune.iothread_period';  
{*
 * VIR_DOMAIN_TUNABLE_CPU_IOTHREAD_QUOTA:
 *
 * Macro represents the maximum bandwidth to be used within a period for
 * iothreads only, when using the posix scheduler, as VIR_TYPED_PARAM_LLONG.
 *
 * Since: 2.2.0
  }
  VIR_DOMAIN_TUNABLE_CPU_IOTHREAD_QUOTA = 'cputune.iothread_quota';  
{*
 * VIR_DOMAIN_TUNABLE_BLKDEV_DISK:
 *
 * Macro represents the name of guest disk for which the values are updated,
 * as VIR_TYPED_PARAM_STRING.
 *
 * Since: 1.2.9
  }
  VIR_DOMAIN_TUNABLE_BLKDEV_DISK = 'blkdeviotune.disk';  
{*
 * VIR_DOMAIN_TUNABLE_BLKDEV_TOTAL_BYTES_SEC:
 *
 * Macro represents the total throughput limit in bytes per second,
 * as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 1.2.9
  }
  VIR_DOMAIN_TUNABLE_BLKDEV_TOTAL_BYTES_SEC = 'blkdeviotune.total_bytes_sec';  
{*
 * VIR_DOMAIN_TUNABLE_BLKDEV_READ_BYTES_SEC:
 *
 * Macro represents the read throughput limit in bytes per second,
 * as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 1.2.9
  }
  VIR_DOMAIN_TUNABLE_BLKDEV_READ_BYTES_SEC = 'blkdeviotune.read_bytes_sec';  
{*
 * VIR_DOMAIN_TUNABLE_BLKDEV_WRITE_BYTES_SEC:
 *
 * Macro represents the write throughput limit in bytes per second,
 * as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 1.2.9
  }
  VIR_DOMAIN_TUNABLE_BLKDEV_WRITE_BYTES_SEC = 'blkdeviotune.write_bytes_sec';  
{*
 * VIR_DOMAIN_TUNABLE_BLKDEV_TOTAL_IOPS_SEC:
 *
 * Macro represents the total I/O operations per second,
 * as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 1.2.9
  }
  VIR_DOMAIN_TUNABLE_BLKDEV_TOTAL_IOPS_SEC = 'blkdeviotune.total_iops_sec';  
{*
 * VIR_DOMAIN_TUNABLE_BLKDEV_READ_IOPS_SEC:
 *
 * Macro represents the read I/O operations per second,
 * as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 1.2.9
  }
  VIR_DOMAIN_TUNABLE_BLKDEV_READ_IOPS_SEC = 'blkdeviotune.read_iops_sec';  
{*
 * VIR_DOMAIN_TUNABLE_BLKDEV_WRITE_IOPS_SEC:
 *
 * Macro represents the write I/O operations per second,
 * as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 1.2.9
  }
  VIR_DOMAIN_TUNABLE_BLKDEV_WRITE_IOPS_SEC = 'blkdeviotune.write_iops_sec';  
{*
 * VIR_DOMAIN_TUNABLE_BLKDEV_TOTAL_BYTES_SEC_MAX:
 *
 * Macro represents the total throughput limit during bursts in
 * maximum bytes per second, as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 1.2.11
  }
  VIR_DOMAIN_TUNABLE_BLKDEV_TOTAL_BYTES_SEC_MAX = 'blkdeviotune.total_bytes_sec_max';  
{*
 * VIR_DOMAIN_TUNABLE_BLKDEV_READ_BYTES_SEC_MAX:
 *
 * Macro represents the read throughput limit during bursts in
 * maximum bytes per second, as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 1.2.11
  }
  VIR_DOMAIN_TUNABLE_BLKDEV_READ_BYTES_SEC_MAX = 'blkdeviotune.read_bytes_sec_max';  
{*
 * VIR_DOMAIN_TUNABLE_BLKDEV_WRITE_BYTES_SEC_MAX:
 *
 * Macro represents the write throughput limit during bursts in
 * maximum bytes per second, as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 1.2.11
  }
  VIR_DOMAIN_TUNABLE_BLKDEV_WRITE_BYTES_SEC_MAX = 'blkdeviotune.write_bytes_sec_max';  
{*
 * VIR_DOMAIN_TUNABLE_BLKDEV_TOTAL_IOPS_SEC_MAX:
 *
 * Macro represents the total maximum I/O operations per second during bursts,
 * as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 1.2.11
  }
  VIR_DOMAIN_TUNABLE_BLKDEV_TOTAL_IOPS_SEC_MAX = 'blkdeviotune.total_iops_sec_max';  
{*
 * VIR_DOMAIN_TUNABLE_BLKDEV_READ_IOPS_SEC_MAX:
 *
 * Macro represents the read maximum I/O operations per second during bursts,
 * as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 1.2.11
  }
  VIR_DOMAIN_TUNABLE_BLKDEV_READ_IOPS_SEC_MAX = 'blkdeviotune.read_iops_sec_max';  
{*
 * VIR_DOMAIN_TUNABLE_BLKDEV_WRITE_IOPS_SEC_MAX:
 *
 * Macro represents the write maximum I/O operations per second during bursts,
 * as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 1.2.11
  }
  VIR_DOMAIN_TUNABLE_BLKDEV_WRITE_IOPS_SEC_MAX = 'blkdeviotune.write_iops_sec_max';  
{*
 * VIR_DOMAIN_TUNABLE_BLKDEV_SIZE_IOPS_SEC:
 *
 * Macro represents the size maximum I/O operations per second,
 * as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 1.2.11
  }
  VIR_DOMAIN_TUNABLE_BLKDEV_SIZE_IOPS_SEC = 'blkdeviotune.size_iops_sec';  
{*
 * VIR_DOMAIN_TUNABLE_BLKDEV_GROUP_NAME:
 *
 * Macro represents the group name to be used,
 * as VIR_TYPED_PARAM_STRING.
 *
 * Since: 3.0.0
  }
  VIR_DOMAIN_TUNABLE_BLKDEV_GROUP_NAME = 'blkdeviotune.group_name';  
{*
 * VIR_DOMAIN_TUNABLE_BLKDEV_TOTAL_BYTES_SEC_MAX_LENGTH:
 *
 * Macro represents the length in seconds allowed for a burst period
 * for the blkdeviotune.total_bytes_sec_max,
 * as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 2.4.0
  }
  VIR_DOMAIN_TUNABLE_BLKDEV_TOTAL_BYTES_SEC_MAX_LENGTH = 'blkdeviotune.total_bytes_sec_max_length';  
{*
 * VIR_DOMAIN_TUNABLE_BLKDEV_READ_BYTES_SEC_MAX_LENGTH:
 *
 * Macro represents the length in seconds allowed for a burst period
 * for the blkdeviotune.read_bytes_sec_max
 * as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 2.4.0
  }
  VIR_DOMAIN_TUNABLE_BLKDEV_READ_BYTES_SEC_MAX_LENGTH = 'blkdeviotune.read_bytes_sec_max_length';  
{*
 * VIR_DOMAIN_TUNABLE_BLKDEV_WRITE_BYTES_SEC_MAX_LENGTH:
 *
 * Macro represents the length in seconds allowed for a burst period
 * for the blkdeviotune.write_bytes_sec_max
 * as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 2.4.0
  }
  VIR_DOMAIN_TUNABLE_BLKDEV_WRITE_BYTES_SEC_MAX_LENGTH = 'blkdeviotune.write_bytes_sec_max_length';  
{*
 * VIR_DOMAIN_TUNABLE_BLKDEV_TOTAL_IOPS_SEC_MAX_LENGTH:
 *
 * Macro represents the length in seconds allowed for a burst period
 * for the blkdeviotune.total_iops_sec_max
 * as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 2.4.0
  }
  VIR_DOMAIN_TUNABLE_BLKDEV_TOTAL_IOPS_SEC_MAX_LENGTH = 'blkdeviotune.total_iops_sec_max_length';  
{*
 * VIR_DOMAIN_TUNABLE_BLKDEV_READ_IOPS_SEC_MAX_LENGTH:
 *
 * Macro represents the length in seconds allowed for a burst period
 * for the blkdeviotune.read_iops_sec_max
 * as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 2.4.0
  }
  VIR_DOMAIN_TUNABLE_BLKDEV_READ_IOPS_SEC_MAX_LENGTH = 'blkdeviotune.read_iops_sec_max_length';  
{*
 * VIR_DOMAIN_TUNABLE_BLKDEV_WRITE_IOPS_SEC_MAX_LENGTH:
 *
 * Macro represents the length in seconds allowed for a burst period
 * for the blkdeviotune.write_iops_sec_max
 * as VIR_TYPED_PARAM_ULLONG.
 *
 * Since: 2.4.0
  }
  VIR_DOMAIN_TUNABLE_BLKDEV_WRITE_IOPS_SEC_MAX_LENGTH = 'blkdeviotune.write_iops_sec_max_length';  
{*
 * virConnectDomainEventTunableCallback:
 * @conn: connection object
 * @dom: domain on which the event occurred
 * @params: changed tunable values stored as array of virTypedParameter
 * @nparams: size of the array
 * @opaque: application specified data
 *
 * This callback occurs when tunable values are updated. The params must not
 * be freed in the callback handler as it's done internally after the callback
 * handler is executed.
 *
 * Currently supported name spaces:
 *  "cputune.*"
 *  "blkdeviotune.*"
 *
 * The callback signature to use when registering for an event of type
 * VIR_DOMAIN_EVENT_ID_TUNABLE with virConnectDomainEventRegisterAny()
 *
 * Since: 1.2.9
  }
type

  TvirConnectDomainEventTunableCallback = procedure (conn:TvirConnectPtr; dom:TvirDomainPtr; params:TvirTypedParameterPtr; nparams:longint; opaque:pointer);cdecl;
{*
 * virConnectDomainEventAgentLifecycleState:
 *
 * Since: 1.2.11
  }
{ agent connected (Since: 1.2.11)  }
{ agent disconnected (Since: 1.2.11)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 1.2.11)  }
{$endif}
type
  PvirConnectDomainEventAgentLifecycleState = ^TvirConnectDomainEventAgentLifecycleState;
  TvirConnectDomainEventAgentLifecycleState =  Longint;
  Const
    VIR_CONNECT_DOMAIN_EVENT_AGENT_LIFECYCLE_STATE_CONNECTED = 1;
    VIR_CONNECT_DOMAIN_EVENT_AGENT_LIFECYCLE_STATE_DISCONNECTED = 2;
    VIR_CONNECT_DOMAIN_EVENT_AGENT_LIFECYCLE_STATE_LAST = 3;
;
{*
 * virConnectDomainEventAgentLifecycleReason:
 *
 * Since: 1.2.11
  }
{ unknown state change reason (Since: 1.2.11)  }
{ state changed due to domain start (Since: 1.2.11)  }
{ channel state changed (Since: 1.2.11)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 1.2.11)  }
{$endif}
type
  PvirConnectDomainEventAgentLifecycleReason = ^TvirConnectDomainEventAgentLifecycleReason;
  TvirConnectDomainEventAgentLifecycleReason =  Longint;
  Const
    VIR_CONNECT_DOMAIN_EVENT_AGENT_LIFECYCLE_REASON_UNKNOWN = 0;
    VIR_CONNECT_DOMAIN_EVENT_AGENT_LIFECYCLE_REASON_DOMAIN_STARTED = 1;
    VIR_CONNECT_DOMAIN_EVENT_AGENT_LIFECYCLE_REASON_CHANNEL = 2;
    VIR_CONNECT_DOMAIN_EVENT_AGENT_LIFECYCLE_REASON_LAST = 3;
;
{*
 * virConnectDomainEventAgentLifecycleCallback:
 * @conn: connection object
 * @dom: domain on which the event occurred
 * @state: new state of the guest agent, one of virConnectDomainEventAgentLifecycleState
 * @reason: reason for state change; one of virConnectDomainEventAgentLifecycleReason
 * @opaque: application specified data
 *
 * This callback occurs when libvirt detects a change in the state of a guest
 * agent.
 *
 * The callback signature to use when registering for an event of type
 * VIR_DOMAIN_EVENT_ID_AGENT_LIFECYCLE with virConnectDomainEventRegisterAny()
 *
 * Since: 1.2.11
  }
type

  TvirConnectDomainEventAgentLifecycleCallback = procedure (conn:TvirConnectPtr; dom:TvirDomainPtr; state:longint; reason:longint; opaque:pointer);cdecl;
{*
 * virConnectDomainEventBlockThresholdCallback:
 * @conn: connection object
 * @dom: domain on which the event occurred
 * @dev: name associated with the affected disk or storage backing chain
 *       element
 * @path: for local storage, the path of the backing chain element
 * @threshold: threshold offset in bytes
 * @excess: number of bytes written beyond the threshold
 * @opaque: application specified data
 *
 * The callback occurs when the hypervisor detects that the given storage
 * element was written beyond the point specified by @threshold. The excess
 * data size written beyond @threshold is reported by @excess (if supported
 * by the hypervisor, 0 otherwise). The event is useful for thin-provisioned
 * storage.
 *
 * The threshold size can be set via the virDomainSetBlockThreshold API.
 *
 * The callback signature to use when registering for an event of type
 * VIR_DOMAIN_EVENT_ID_BLOCK_THRESHOLD with virConnectDomainEventRegisterAny()
 *
 * Since: 3.2.0
  }

  TvirConnectDomainEventBlockThresholdCallback = procedure (conn:TvirConnectPtr; dom:TvirDomainPtr; dev:Pchar; path:Pchar; threshold:qword; 
                excess:qword; opaque:pointer);cdecl;
{*
 * virConnectDomainEventMemoryFailureCallback:
 * @conn: connection object
 * @dom: domain on which the event occurred
 * @recipient: the recipient of hardware memory failure
 *             (virDomainMemoryFailureRecipientType)
 * @action: the action of hardware memory failure
 *          (virDomainMemoryFailureActionType)
 * @flags: the flags of hardware memory failure (virDomainMemoryFailureFlags)
 * @opaque: application specified data
 *
 * The callback occurs when the hypervisor handles the hardware memory
 * corrupted event.
 *
 * The callback signature to use when registering for an event of type
 * VIR_DOMAIN_EVENT_ID_MEMORY_FAILURE with virConnectDomainEventRegisterAny()
 *
 * Since: 6.9.0
  }

  TvirConnectDomainEventMemoryFailureCallback = procedure (conn:TvirConnectPtr; dom:TvirDomainPtr; recipient:longint; action:longint; flags:dword; 
                opaque:pointer);cdecl;
{*
 * virConnectDomainEventMemoryDeviceSizeChangeCallback:
 * @conn: connection object
 * @dom: domain on which the event occurred
 * @alias: memory device alias
 * @size: new current size of memory device (in KiB)
 * @opaque: application specified data
 *
 * The callback occurs when the guest acknowledges request to change size of
 * memory device (so far only virtio-mem model supports this). The @size then
 * reflects the new amount of guest visible memory (in kibibytes).
 *
 * The callback signature to use when registering for an event of type
 * VIR_DOMAIN_EVENT_ID_MEMORY_DEVICE_SIZE_CHANGE with
 * virConnectDomainEventRegisterAny().
 *
 * Since: 7.9.0
  }

  TvirConnectDomainEventMemoryDeviceSizeChangeCallback = procedure (conn:TvirConnectPtr; dom:TvirDomainPtr; alias:Pchar; size:qword; opaque:pointer);cdecl;
{*
 * VIR_DOMAIN_EVENT_CALLBACK:
 *
 * Used to cast the event specific callback into the generic one
 * for use for virConnectDomainEventRegisterAny()
 *
 * Since: 0.8.0
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function VIR_DOMAIN_EVENT_CALLBACK(cb : longint) : TvirConnectDomainEventGenericCallback;

{*
 * virDomainEventID:
 *
 * An enumeration of supported eventId parameters for
 * virConnectDomainEventRegisterAny().  Each event id determines which
 * signature of callback function will be used.
 *
 * Since: 0.8.0
  }
{ virConnectDomainEventCallback (Since: 0.8.0)  }
{ virConnectDomainEventGenericCallback (Since: 0.8.0)  }
{ virConnectDomainEventRTCChangeCallback (Since: 0.8.0)  }
{ virConnectDomainEventWatchdogCallback (Since: 0.8.0)  }
{ virConnectDomainEventIOErrorCallback (Since: 0.8.0)  }
{ virConnectDomainEventGraphicsCallback (Since: 0.8.0)  }
{ virConnectDomainEventIOErrorReasonCallback (Since: 0.8.1)  }
{ virConnectDomainEventGenericCallback (Since: 0.9.2)  }
{ virConnectDomainEventBlockJobCallback (Since: 0.9.4)  }
{ virConnectDomainEventDiskChangeCallback (Since: 0.9.7)  }
{ virConnectDomainEventTrayChangeCallback (Since: 0.9.11)  }
{ virConnectDomainEventPMWakeupCallback (Since: 0.9.11)  }
{ virConnectDomainEventPMSuspendCallback (Since: 0.9.11)  }
{ virConnectDomainEventBalloonChangeCallback (Since: 0.10.0)  }
{ virConnectDomainEventPMSuspendDiskCallback (Since: 1.0.0)  }
{ virConnectDomainEventDeviceRemovedCallback (Since: 1.1.1)  }
{ virConnectDomainEventBlockJobCallback (Since: 1.2.6)  }
{ virConnectDomainEventTunableCallback (Since: 1.2.9)  }
{ virConnectDomainEventAgentLifecycleCallback (Since: 1.2.11)  }
{ virConnectDomainEventDeviceAddedCallback (Since: 1.2.15)  }
{ virConnectDomainEventMigrationIterationCallback (Since: 1.3.2)  }
{ virConnectDomainEventJobCompletedCallback (Since: 1.3.3)  }
{ virConnectDomainEventDeviceRemovalFailedCallback (Since: 1.3.4)  }
{ virConnectDomainEventMetadataChangeCallback (Since: 3.0.0)  }
{ virConnectDomainEventBlockThresholdCallback (Since: 3.2.0)  }
{ virConnectDomainEventMemoryFailureCallback (Since: 6.9.0)  }
{ virConnectDomainEventMemoryDeviceSizeChangeCallback (Since: 7.9.0)  }
{$ifdef VIR_ENUM_SENTINELS}
{
     * NB: this enum value will increase over time as new events are
     * added to the libvirt API. It reflects the last event ID supported
     * by this version of the libvirt API.
     *
     * Since: 0.8.0
      }
{$endif}
type
  PvirDomainEventID = ^TvirDomainEventID;
  TvirDomainEventID =  Longint;
  Const
    VIR_DOMAIN_EVENT_ID_LIFECYCLE = 0;
    VIR_DOMAIN_EVENT_ID_REBOOT = 1;
    VIR_DOMAIN_EVENT_ID_RTC_CHANGE = 2;
    VIR_DOMAIN_EVENT_ID_WATCHDOG = 3;
    VIR_DOMAIN_EVENT_ID_IO_ERROR = 4;
    VIR_DOMAIN_EVENT_ID_GRAPHICS = 5;
    VIR_DOMAIN_EVENT_ID_IO_ERROR_REASON = 6;
    VIR_DOMAIN_EVENT_ID_CONTROL_ERROR = 7;
    VIR_DOMAIN_EVENT_ID_BLOCK_JOB = 8;
    VIR_DOMAIN_EVENT_ID_DISK_CHANGE = 9;
    VIR_DOMAIN_EVENT_ID_TRAY_CHANGE = 10;
    VIR_DOMAIN_EVENT_ID_PMWAKEUP = 11;
    VIR_DOMAIN_EVENT_ID_PMSUSPEND = 12;
    VIR_DOMAIN_EVENT_ID_BALLOON_CHANGE = 13;
    VIR_DOMAIN_EVENT_ID_PMSUSPEND_DISK = 14;
    VIR_DOMAIN_EVENT_ID_DEVICE_REMOVED = 15;
    VIR_DOMAIN_EVENT_ID_BLOCK_JOB_2 = 16;
    VIR_DOMAIN_EVENT_ID_TUNABLE = 17;
    VIR_DOMAIN_EVENT_ID_AGENT_LIFECYCLE = 18;
    VIR_DOMAIN_EVENT_ID_DEVICE_ADDED = 19;
    VIR_DOMAIN_EVENT_ID_MIGRATION_ITERATION = 20;
    VIR_DOMAIN_EVENT_ID_JOB_COMPLETED = 21;
    VIR_DOMAIN_EVENT_ID_DEVICE_REMOVAL_FAILED = 22;
    VIR_DOMAIN_EVENT_ID_METADATA_CHANGE = 23;
    VIR_DOMAIN_EVENT_ID_BLOCK_THRESHOLD = 24;
    VIR_DOMAIN_EVENT_ID_MEMORY_FAILURE = 25;
    VIR_DOMAIN_EVENT_ID_MEMORY_DEVICE_SIZE_CHANGE = 26;
    VIR_DOMAIN_EVENT_ID_LAST = 27;
;
{ Use VIR_DOMAIN_EVENT_CALLBACK() to cast the 'cb' parameter   }
{ Optional, to filter  }

function virConnectDomainEventRegisterAny(conn:TvirConnectPtr; dom:TvirDomainPtr; eventID:longint; cb:TvirConnectDomainEventGenericCallback; opaque:pointer; 
           freecb:TvirFreeCallback):longint;cdecl;external libvirt;
function virConnectDomainEventDeregisterAny(conn:TvirConnectPtr; callbackID:longint):longint;cdecl;external libvirt;
{*
 * virDomainConsoleFlags:
 *
 * Since: 0.9.11
  }
{ abort a (possibly) active console
                                            connection to force a new
                                            connection (Since: 0.9.11)  }
{ check if the console driver supports
                                           safe console operations (Since: 0.9.11)  }
type
  PvirDomainConsoleFlags = ^TvirDomainConsoleFlags;
  TvirDomainConsoleFlags =  Longint;
  Const
    VIR_DOMAIN_CONSOLE_FORCE = 1 shl 0;
    VIR_DOMAIN_CONSOLE_SAFE = 1 shl 1;
;

function virDomainOpenConsole(dom:TvirDomainPtr; dev_name:Pchar; st:TvirStreamPtr; flags:dword):longint;cdecl;external libvirt;
{*
 * virDomainChannelFlags:
 *
 * Since: 1.0.2
  }
{ abort a (possibly) active channel
                                            connection to force a new
                                            connection (Since: 1.0.2)  }
type
  PvirDomainChannelFlags = ^TvirDomainChannelFlags;
  TvirDomainChannelFlags =  Longint;
  Const
    VIR_DOMAIN_CHANNEL_FORCE = 1 shl 0;
;

function virDomainOpenChannel(dom:TvirDomainPtr; name:Pchar; st:TvirStreamPtr; flags:dword):longint;cdecl;external libvirt;
{*
 * virDomainOpenGraphicsFlags:
 *
 * Since: 0.9.7
  }
{ (Since: 0.9.7)  }
type
  PvirDomainOpenGraphicsFlags = ^TvirDomainOpenGraphicsFlags;
  TvirDomainOpenGraphicsFlags =  Longint;
  Const
    VIR_DOMAIN_OPEN_GRAPHICS_SKIPAUTH = 1 shl 0;
;

function virDomainOpenGraphics(dom:TvirDomainPtr; idx:dword; fd:longint; flags:dword):longint;cdecl;external libvirt;
function virDomainOpenGraphicsFD(dom:TvirDomainPtr; idx:dword; flags:dword):longint;cdecl;external libvirt;
function virDomainInjectNMI(domain:TvirDomainPtr; flags:dword):longint;cdecl;external libvirt;
function virDomainFSTrim(dom:TvirDomainPtr; mountPoint:Pchar; minimum:qword; flags:dword):longint;cdecl;external libvirt;
function virDomainFSFreeze(dom:TvirDomainPtr; mountpoints:PPchar; nmountpoints:dword; flags:dword):longint;cdecl;external libvirt;
function virDomainFSThaw(dom:TvirDomainPtr; mountpoints:PPchar; nmountpoints:dword; flags:dword):longint;cdecl;external libvirt;
{*
 * virDomainFSInfo:
 *
 * The data structure containing mounted file systems within a guset
 *
 * Since: 1.2.11
  }
type
{*
 * virDomainFSInfoPtr:
 *
 * Since: 1.2.11
  }

  PvirDomainFSInfoPtr = ^TvirDomainFSInfoPtr;
  TvirDomainFSInfoPtr = PvirDomainFSInfo;
{ path to mount point  }
{ device name in the guest (e.g. "sda1")  }
{ filesystem type  }
{ number of elements in devAlias  }
{ array of disk device aliases  }
  PvirDomainFSInfo = ^TvirDomainFSInfo;
  TvirDomainFSInfo = record
      mountpoint : Pchar;
      name : Pchar;
      fstype : Pchar;
      ndevAlias : Tsize_t;
      devAlias : ^Pchar;
    end;


procedure virDomainFSInfoFree(info:TvirDomainFSInfoPtr);cdecl;external libvirt;
function virDomainGetFSInfo(dom:TvirDomainPtr; info:PPvirDomainFSInfoPtr; flags:dword):longint;cdecl;external libvirt;
function virDomainGetTime(dom:TvirDomainPtr; seconds:Pint64; nseconds:Pdword; flags:dword):longint;cdecl;external libvirt;
{*
 * virDomainSetTimeFlags:
 *
 * Since: 1.2.5
  }
{ Re-sync domain time from domain's RTC (Since: 1.2.5)  }
type
  PvirDomainSetTimeFlags = ^TvirDomainSetTimeFlags;
  TvirDomainSetTimeFlags =  Longint;
  Const
    VIR_DOMAIN_TIME_SYNC = 1 shl 0;
;

function virDomainSetTime(dom:TvirDomainPtr; seconds:int64; nseconds:dword; flags:dword):longint;cdecl;external libvirt;
{*
 * virSchedParameterType:
 *
 * A scheduler parameter field type.  Provided for backwards
 * compatibility; virTypedParameterType is the preferred enum
 *
 * Since: 0.2.3
  }
{ (Since: 0.2.3)  }
{ (Since: 0.2.3)  }
{ (Since: 0.2.3)  }
{ (Since: 0.2.3)  }
{ (Since: 0.2.3)  }
{ (Since: 0.2.3)  }
type
  PvirSchedParameterType = ^TvirSchedParameterType;
  TvirSchedParameterType =  Longint;
  Const
    VIR_DOMAIN_SCHED_FIELD_INT = VIR_TYPED_PARAM_INT;
    VIR_DOMAIN_SCHED_FIELD_UINT = VIR_TYPED_PARAM_UINT;
    VIR_DOMAIN_SCHED_FIELD_LLONG = VIR_TYPED_PARAM_LLONG;
    VIR_DOMAIN_SCHED_FIELD_ULLONG = VIR_TYPED_PARAM_ULLONG;
    VIR_DOMAIN_SCHED_FIELD_DOUBLE = VIR_TYPED_PARAM_DOUBLE;
    VIR_DOMAIN_SCHED_FIELD_BOOLEAN = VIR_TYPED_PARAM_BOOLEAN;
;
{*
 * VIR_DOMAIN_SCHED_FIELD_LENGTH:
 *
 * Macro providing the field length of virSchedParameter.  Provided
 * for backwards compatibility; VIR_TYPED_PARAM_FIELD_LENGTH is the
 * preferred value
 *
 * Since: 0.2.3
  }
  VIR_DOMAIN_SCHED_FIELD_LENGTH = VIR_TYPED_PARAM_FIELD_LENGTH;  
{*
 * _virSchedParameter:
 *
 * Since: 0.2.3
  }
  _virSchedParameter = _virTypedParameter;  
{*
 * virSchedParameter:
 *
 * a virSchedParameter is the set of scheduler parameters.
 * Provided for backwards compatibility; virTypedParameter is the
 * preferred alias.
 *
 * Since: 0.2.3
  }
type
  TvirTypedParameter = TvirSchedParameter;
{*
 * virSchedParameterPtr:
 *
 * a virSchedParameterPtr is a pointer to a virSchedParameter structure.
 * Provided for backwards compatibility; virTypedParameterPtr is the
 * preferred alias since 0.9.2.
 *
 * Since: 0.2.3
  }

  PvirSchedParameterPtr = ^TvirSchedParameterPtr;
  TvirSchedParameterPtr = PvirSchedParameter;
{*
 * virBlkioParameterType:
 *
 * A blkio parameter field type.  Provided for backwards
 * compatibility; virTypedParameterType is the preferred enum
 *
 * Since: 0.9.0
  }
{ (Since: 0.9.0)  }
{ (Since: 0.9.0)  }
{ (Since: 0.9.0)  }
{ (Since: 0.9.0)  }
{ (Since: 0.9.0)  }
{ (Since: 0.9.0)  }

  PvirBlkioParameterType = ^TvirBlkioParameterType;
  TvirBlkioParameterType =  Longint;
  Const
    VIR_DOMAIN_BLKIO_PARAM_INT = VIR_TYPED_PARAM_INT;
    VIR_DOMAIN_BLKIO_PARAM_UINT = VIR_TYPED_PARAM_UINT;
    VIR_DOMAIN_BLKIO_PARAM_LLONG = VIR_TYPED_PARAM_LLONG;
    VIR_DOMAIN_BLKIO_PARAM_ULLONG = VIR_TYPED_PARAM_ULLONG;
    VIR_DOMAIN_BLKIO_PARAM_DOUBLE = VIR_TYPED_PARAM_DOUBLE;
    VIR_DOMAIN_BLKIO_PARAM_BOOLEAN = VIR_TYPED_PARAM_BOOLEAN;
;
{*
 * VIR_DOMAIN_BLKIO_FIELD_LENGTH:
 *
 * Macro providing the field length of virBlkioParameter.  Provided
 * for backwards compatibility; VIR_TYPED_PARAM_FIELD_LENGTH is the
 * preferred value.
 *
 * Since: 0.9.0
  }
  VIR_DOMAIN_BLKIO_FIELD_LENGTH = VIR_TYPED_PARAM_FIELD_LENGTH;  
{*
 * _virBlkioParameter:
 *
 * Since: 0.9.0
  }
  _virBlkioParameter = _virTypedParameter;  
{*
 * virBlkioParameter:
 *
 * a virBlkioParameter is the set of blkio parameters.
 * Provided for backwards compatibility; virTypedParameter is the
 * preferred alias.
 *
 * Since: 0.9.0
  }
type
  TvirTypedParameter = TvirBlkioParameter;
{*
 * virBlkioParameterPtr:
 *
 * a virBlkioParameterPtr is a pointer to a virBlkioParameter structure.
 * Provided for backwards compatibility; virTypedParameterPtr is the
 * preferred alias.
 *
 * Since: 0.9.0
  }

  PvirBlkioParameterPtr = ^TvirBlkioParameterPtr;
  TvirBlkioParameterPtr = PvirBlkioParameter;
{*
 * virMemoryParameterType:
 *
 * A memory parameter field type.  Provided for backwards
 * compatibility; virTypedParameterType is the preferred enum
 *
 * Since: 0.8.5
  }
{ (Since: 0.8.5)  }
{ (Since: 0.8.5)  }
{ (Since: 0.8.5)  }
{ (Since: 0.8.5)  }
{ (Since: 0.8.5)  }
{ (Since: 0.8.5)  }

  PvirMemoryParameterType = ^TvirMemoryParameterType;
  TvirMemoryParameterType =  Longint;
  Const
    VIR_DOMAIN_MEMORY_PARAM_INT = VIR_TYPED_PARAM_INT;
    VIR_DOMAIN_MEMORY_PARAM_UINT = VIR_TYPED_PARAM_UINT;
    VIR_DOMAIN_MEMORY_PARAM_LLONG = VIR_TYPED_PARAM_LLONG;
    VIR_DOMAIN_MEMORY_PARAM_ULLONG = VIR_TYPED_PARAM_ULLONG;
    VIR_DOMAIN_MEMORY_PARAM_DOUBLE = VIR_TYPED_PARAM_DOUBLE;
    VIR_DOMAIN_MEMORY_PARAM_BOOLEAN = VIR_TYPED_PARAM_BOOLEAN;
;
{*
 * VIR_DOMAIN_MEMORY_FIELD_LENGTH:
 *
 * Macro providing the field length of virMemoryParameter.  Provided
 * for backwards compatibility; VIR_TYPED_PARAM_FIELD_LENGTH is the
 * preferred value.
 *
 * Since: 0.8.5
  }
  VIR_DOMAIN_MEMORY_FIELD_LENGTH = VIR_TYPED_PARAM_FIELD_LENGTH;  
{*
 * _virMemoryParameter:
 *
 * Since: 0.8.5
  }
  _virMemoryParameter = _virTypedParameter;  
{*
 * virMemoryParameter:
 *
 * a virMemoryParameter is the set of scheduler parameters.
 * Provided for backwards compatibility; virTypedParameter is the
 * preferred alias.
 *
 * Since: 0.8.5
  }
type
  TvirTypedParameter = TvirMemoryParameter;
{*
 * virMemoryParameterPtr:
 *
 * a virMemoryParameterPtr is a pointer to a virMemoryParameter structure.
 * Provided for backwards compatibility; virTypedParameterPtr is the
 * preferred alias.
 *
 * Since: 0.8.5
  }

  PvirMemoryParameterPtr = ^TvirMemoryParameterPtr;
  TvirMemoryParameterPtr = PvirMemoryParameter;
{*
 * virDomainInterfaceAddressesSource:
 *
 * Since: 1.2.14
  }
{ Parse DHCP lease file (Since: 1.2.14)  }
{ Query qemu guest agent (Since: 1.2.14)  }
{ Query ARP tables (Since: 4.2.0)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 1.2.14)  }
{$endif}
type
  PvirDomainInterfaceAddressesSource = ^TvirDomainInterfaceAddressesSource;
  TvirDomainInterfaceAddressesSource =  Longint;
  Const
    VIR_DOMAIN_INTERFACE_ADDRESSES_SRC_LEASE = 0;
    VIR_DOMAIN_INTERFACE_ADDRESSES_SRC_AGENT = 1;
    VIR_DOMAIN_INTERFACE_ADDRESSES_SRC_ARP = 2;
    VIR_DOMAIN_INTERFACE_ADDRESSES_SRC_LAST = 3;
;
{*
 * virDomainIPAddress:
 *
 * Since: 1.2.14
  }
type
  TvirDomainInterfaceIPAddress = TvirDomainIPAddress;
{*
 * virDomainIPAddressPtr:
 *
 * Since: 1.2.14
  }

  PvirDomainIPAddressPtr = ^TvirDomainIPAddressPtr;
  TvirDomainIPAddressPtr = PvirDomainIPAddress;
{ virIPAddrType  }
{ IP address  }
{ IP address prefix  }
  PvirDomainInterfaceIPAddress = ^TvirDomainInterfaceIPAddress;
  TvirDomainInterfaceIPAddress = record
      _type : longint;
      addr : Pchar;
      prefix : dword;
    end;

{*
 * virDomainInterface:
 *
 * Since: 1.2.14
  }
{*
 * virDomainInterfacePtr:
 *
 * Since: 1.2.14
  }

  PvirDomainInterfacePtr = ^TvirDomainInterfacePtr;
  TvirDomainInterfacePtr = PvirDomainInterface;
{ interface name  }
{ hardware address, may be NULL  }
{ number of items in @addrs  }
{ array of IP addresses  }
  PvirDomainInterface = ^TvirDomainInterface;
  TvirDomainInterface = record
      name : Pchar;
      hwaddr : Pchar;
      naddrs : dword;
      addrs : TvirDomainIPAddressPtr;
    end;


function virDomainInterfaceAddresses(dom:TvirDomainPtr; ifaces:PPvirDomainInterfacePtr; source:dword; flags:dword):longint;cdecl;external libvirt;
procedure virDomainInterfaceFree(iface:TvirDomainInterfacePtr);cdecl;external libvirt;
{*
 * virDomainSetUserPasswordFlags:
 *
 * Since: 1.2.16
  }
{ the password is already encrypted (Since: 1.2.16)  }
type
  PvirDomainSetUserPasswordFlags = ^TvirDomainSetUserPasswordFlags;
  TvirDomainSetUserPasswordFlags =  Longint;
  Const
    VIR_DOMAIN_PASSWORD_ENCRYPTED = 1 shl 0;
;

function virDomainSetUserPassword(dom:TvirDomainPtr; user:Pchar; password:Pchar; flags:dword):longint;cdecl;external libvirt;
function virDomainRename(dom:TvirDomainPtr; new_name:Pchar; flags:dword):longint;cdecl;external libvirt;
function virDomainGetGuestVcpus(domain:TvirDomainPtr; params:PvirTypedParameterPtr; nparams:Pdword; flags:dword):longint;cdecl;external libvirt;
function virDomainSetGuestVcpus(domain:TvirDomainPtr; cpumap:Pchar; state:longint; flags:dword):longint;cdecl;external libvirt;
function virDomainSetVcpu(domain:TvirDomainPtr; vcpumap:Pchar; state:longint; flags:dword):longint;cdecl;external libvirt;
function virDomainSetBlockThreshold(domain:TvirDomainPtr; dev:Pchar; threshold:qword; flags:dword):longint;cdecl;external libvirt;
{*
 * virDomainLifecycle:
 *
 * Since: 3.9.0
  }
{ (Since: 3.9.0)  }
{ (Since: 3.9.0)  }
{ (Since: 3.9.0)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 3.9.0)  }
{$endif}
type
  PvirDomainLifecycle = ^TvirDomainLifecycle;
  TvirDomainLifecycle =  Longint;
  Const
    VIR_DOMAIN_LIFECYCLE_POWEROFF = 0;
    VIR_DOMAIN_LIFECYCLE_REBOOT = 1;
    VIR_DOMAIN_LIFECYCLE_CRASH = 2;
    VIR_DOMAIN_LIFECYCLE_LAST = 3;
;
{*
 * virDomainLifecycleAction:
 *
 * Since: 3.9.0
  }
{ (Since: 3.9.0)  }
{ (Since: 3.9.0)  }
{ (Since: 3.9.0)  }
{ (Since: 3.9.0)  }
{ (Since: 3.9.0)  }
{ (Since: 3.9.0)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 3.9.0)  }
{$endif}
type
  PvirDomainLifecycleAction = ^TvirDomainLifecycleAction;
  TvirDomainLifecycleAction =  Longint;
  Const
    VIR_DOMAIN_LIFECYCLE_ACTION_DESTROY = 0;
    VIR_DOMAIN_LIFECYCLE_ACTION_RESTART = 1;
    VIR_DOMAIN_LIFECYCLE_ACTION_RESTART_RENAME = 2;
    VIR_DOMAIN_LIFECYCLE_ACTION_PRESERVE = 3;
    VIR_DOMAIN_LIFECYCLE_ACTION_COREDUMP_DESTROY = 4;
    VIR_DOMAIN_LIFECYCLE_ACTION_COREDUMP_RESTART = 5;
    VIR_DOMAIN_LIFECYCLE_ACTION_LAST = 6;
;

function virDomainSetLifecycleAction(domain:TvirDomainPtr; _type:dword; action:dword; flags:dword):longint;cdecl;external libvirt;
{*
 * Launch Security API
  }
{*
 * VIR_DOMAIN_LAUNCH_SECURITY_SEV_MEASUREMENT:
 *
 * Macro represents the launch measurement of the SEV guest,
 * as VIR_TYPED_PARAM_STRING.
 *
 * Since: 4.5.0
  }
const
  VIR_DOMAIN_LAUNCH_SECURITY_SEV_MEASUREMENT = 'sev-measurement';  
{*

 * VIR_DOMAIN_LAUNCH_SECURITY_SEV_API_MAJOR:
 *
 * Macro represents the API major version of the SEV host,
 * as VIR_TYPED_PARAM_UINT.
 *
 * Since: 8.0.0
  }
  VIR_DOMAIN_LAUNCH_SECURITY_SEV_API_MAJOR = 'sev-api-major';  
{*
 * VIR_DOMAIN_LAUNCH_SECURITY_SEV_API_MINOR:
 *
 * Macro represents the API minor version of the SEV guest,
 * as VIR_TYPED_PARAM_UINT.
 *
 * Since: 8.0.0
  }
  VIR_DOMAIN_LAUNCH_SECURITY_SEV_API_MINOR = 'sev-api-minor';  
{*
 * VIR_DOMAIN_LAUNCH_SECURITY_SEV_BUILD_ID:
 *
 * Macro represents the build ID of the SEV host,
 * as VIR_TYPED_PARAM_UINT.
 *
 * Since: 8.0.0
  }
  VIR_DOMAIN_LAUNCH_SECURITY_SEV_BUILD_ID = 'sev-build-id';  
{*
 * VIR_DOMAIN_LAUNCH_SECURITY_SEV_POLICY:
 *
 * Macro represents the policy of the SEV guest,
 * as VIR_TYPED_PARAM_UINT.
 *
 * Since: 8.0.0
  }
  VIR_DOMAIN_LAUNCH_SECURITY_SEV_POLICY = 'sev-policy';  
{*
 * VIR_DOMAIN_LAUNCH_SECURITY_SEV_SECRET_HEADER:
 *
 * A macro used to represent the SEV launch secret header. The secret header
 * is a base64-encoded VIR_TYPED_PARAM_STRING containing artifacts needed by
 * the SEV firmware to recover the plain text of the launch secret. See
 * section "6.6 LAUNCH_SECRET" in the SEV API specification for a detailed
 * description of the secret header.
 *
 * Since: 8.0.0
  }
  VIR_DOMAIN_LAUNCH_SECURITY_SEV_SECRET_HEADER = 'sev-secret-header';  
{*
 * VIR_DOMAIN_LAUNCH_SECURITY_SEV_SECRET:
 *
 * A macro used to represent the SEV launch secret. The secret is a
 * base64-encoded VIR_TYPED_PARAM_STRING containing an encrypted launch
 * secret. The secret is created by the domain owner after the SEV launch
 * measurement is retrieved and verified.
 *
 * Since: 8.0.0
  }
  VIR_DOMAIN_LAUNCH_SECURITY_SEV_SECRET = 'sev-secret';  
{*
 * VIR_DOMAIN_LAUNCH_SECURITY_SEV_SECRET_SET_ADDRESS:
 *
 * A macro used to represent the physical address within the guest's memory
 * where the secret will be set, as VIR_TYPED_PARAM_ULLONG. If not specified,
 * the address will be determined by the hypervisor.
 *
 * Since: 8.0.0
  }
  VIR_DOMAIN_LAUNCH_SECURITY_SEV_SECRET_SET_ADDRESS = 'sev-secret-set-address';  

function virDomainGetLaunchSecurityInfo(domain:TvirDomainPtr; params:PvirTypedParameterPtr; nparams:Plongint; flags:dword):longint;cdecl;external libvirt;
function virDomainSetLaunchSecurityState(domain:TvirDomainPtr; params:TvirTypedParameterPtr; nparams:longint; flags:dword):longint;cdecl;external libvirt;
{*
 * virDomainGuestInfoTypes:
 *
 * Since: 5.7.0
  }
{ return active users (Since: 5.7.0)  }
{ return OS information (Since: 5.7.0)  }
{ return timezone information (Since: 5.7.0)  }
{ return hostname information (Since: 5.7.0)  }
{ return filesystem information (Since: 5.7.0)  }
{ return disks information (Since: 7.0.0)  }
{ return interfaces information (Since: 7.10.0)  }
type
  PvirDomainGuestInfoTypes = ^TvirDomainGuestInfoTypes;
  TvirDomainGuestInfoTypes =  Longint;
  Const
    VIR_DOMAIN_GUEST_INFO_USERS = 1 shl 0;
    VIR_DOMAIN_GUEST_INFO_OS = 1 shl 1;
    VIR_DOMAIN_GUEST_INFO_TIMEZONE = 1 shl 2;
    VIR_DOMAIN_GUEST_INFO_HOSTNAME = 1 shl 3;
    VIR_DOMAIN_GUEST_INFO_FILESYSTEM = 1 shl 4;
    VIR_DOMAIN_GUEST_INFO_DISKS = 1 shl 5;
    VIR_DOMAIN_GUEST_INFO_INTERFACES = 1 shl 6;
;

function virDomainGetGuestInfo(domain:TvirDomainPtr; types:dword; params:PvirTypedParameterPtr; nparams:Plongint; flags:dword):longint;cdecl;external libvirt;
{*
 * virDomainAgentResponseTimeoutValues:
 *
 * Since: 5.10.0
  }
{ (Since: 5.10.0)  }
{ (Since: 5.10.0)  }
{ (Since: 5.10.0)  }
type
  PvirDomainAgentResponseTimeoutValues = ^TvirDomainAgentResponseTimeoutValues;
  TvirDomainAgentResponseTimeoutValues =  Longint;
  Const
    VIR_DOMAIN_AGENT_RESPONSE_TIMEOUT_BLOCK = -(2);
    VIR_DOMAIN_AGENT_RESPONSE_TIMEOUT_DEFAULT = -(1);
    VIR_DOMAIN_AGENT_RESPONSE_TIMEOUT_NOWAIT = 0;
;

function virDomainAgentSetResponseTimeout(domain:TvirDomainPtr; timeout:longint; flags:dword):longint;cdecl;external libvirt;
{*
 * virDomainBackupBeginFlags:
 *
 * Since: 6.0.0
  }
{ reuse separately
                                                          provided images (Since: 6.0.0)  }
type
  PvirDomainBackupBeginFlags = ^TvirDomainBackupBeginFlags;
  TvirDomainBackupBeginFlags =  Longint;
  Const
    VIR_DOMAIN_BACKUP_BEGIN_REUSE_EXTERNAL = 1 shl 0;
;

function virDomainBackupBegin(domain:TvirDomainPtr; backupXML:Pchar; checkpointXML:Pchar; flags:dword):longint;cdecl;external libvirt;
function virDomainBackupGetXMLDesc(domain:TvirDomainPtr; flags:dword):Pchar;cdecl;external libvirt;
function virDomainAuthorizedSSHKeysGet(domain:TvirDomainPtr; user:Pchar; keys:PPPchar; flags:dword):longint;cdecl;external libvirt;
{*
 * virDomainAuthorizedSSHKeysSetFlags:
 *
 * Since: 6.10.0
  }
{ don't truncate file, just append (Since: 6.10.0)  }
{ remove keys, instead of adding them (Since: 6.10.0)  }
type
  PvirDomainAuthorizedSSHKeysSetFlags = ^TvirDomainAuthorizedSSHKeysSetFlags;
  TvirDomainAuthorizedSSHKeysSetFlags =  Longint;
  Const
    VIR_DOMAIN_AUTHORIZED_SSH_KEYS_SET_APPEND = 1 shl 0;
    VIR_DOMAIN_AUTHORIZED_SSH_KEYS_SET_REMOVE = 1 shl 1;
;

function virDomainAuthorizedSSHKeysSet(domain:TvirDomainPtr; user:Pchar; keys:PPchar; nkeys:dword; flags:dword):longint;cdecl;external libvirt;
{*
 * virDomainMessageType:
 *
 * Since: 7.1.0
  }
{ (Since: 7.1.0)  }
{ (Since: 7.1.0)  }
type
  PvirDomainMessageType = ^TvirDomainMessageType;
  TvirDomainMessageType =  Longint;
  Const
    VIR_DOMAIN_MESSAGE_DEPRECATION = 1 shl 0;
    VIR_DOMAIN_MESSAGE_TAINTING = 1 shl 1;
;

function virDomainGetMessages(domain:TvirDomainPtr; msgs:PPPchar; flags:dword):longint;cdecl;external libvirt;
{*
 * virDomainDirtyRateStatus:
 *
 * Details on the cause of a dirty rate calculation status.
 *
 * Since: 7.2.0
  }
{ the dirtyrate calculation has
                                           not been started (Since: 7.2.0)  }
{ the dirtyrate calculation is
                                           measuring (Since: 7.2.0)  }
{ the dirtyrate calculation is
                                           completed (Since: 7.2.0)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 7.2.0)  }
{$endif}
type
  PvirDomainDirtyRateStatus = ^TvirDomainDirtyRateStatus;
  TvirDomainDirtyRateStatus =  Longint;
  Const
    VIR_DOMAIN_DIRTYRATE_UNSTARTED = 0;
    VIR_DOMAIN_DIRTYRATE_MEASURING = 1;
    VIR_DOMAIN_DIRTYRATE_MEASURED = 2;
    VIR_DOMAIN_DIRTYRATE_LAST = 3;
;
{*
 * virDomainDirtyRateCalcFlags:
 *
 * Flags OR'ed together to provide specific behaviour when calculating dirty page
 * rate for a Domain
 *
 *
 * Since: 8.1.0
  }
{ default mode - page-sampling (Since: 8.1.0)  }
{ dirty-bitmap mode (Since: 8.1.0)  }
{ dirty-ring mode (Since: 8.1.0)  }
type
  PvirDomainDirtyRateCalcFlags = ^TvirDomainDirtyRateCalcFlags;
  TvirDomainDirtyRateCalcFlags =  Longint;
  Const
    VIR_DOMAIN_DIRTYRATE_MODE_PAGE_SAMPLING = 0;
    VIR_DOMAIN_DIRTYRATE_MODE_DIRTY_BITMAP = 1 shl 0;
    VIR_DOMAIN_DIRTYRATE_MODE_DIRTY_RING = 1 shl 1;
;

function virDomainStartDirtyRateCalc(domain:TvirDomainPtr; seconds:longint; flags:dword):longint;cdecl;external libvirt;
{*
 * virDomainFDAssociateFlags:
 *
 * Since: 9.0.0
  }
{ Attempt a best-effort restore of security labels after use (Since: 9.0.0)  }
{ Use a seclabel allowing writes for the FD even if usage implies read-only mode (Since: 9.0.0)  }
type
  PvirDomainFDAssociateFlags = ^TvirDomainFDAssociateFlags;
  TvirDomainFDAssociateFlags =  Longint;
  Const
    VIR_DOMAIN_FD_ASSOCIATE_SECLABEL_RESTORE = 1 shl 0;
    VIR_DOMAIN_FD_ASSOCIATE_SECLABEL_WRITABLE = 1 shl 1;
;

function virDomainFDAssociate(domain:TvirDomainPtr; name:Pchar; nfds:dword; fds:Plongint; flags:dword):longint;cdecl;external libvirt;
{$endif}
{ LIBVIRT_DOMAIN_H  }

// === Konventiert am: 14-10-26 19:34:52 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIR_CPU_USABLE(cpumaps,maplen,vcpu,cpu : longint) : longint;
begin
  VIR_CPU_USABLE:=VIR_CPU_USED(VIR_GET_CPUMAP(cpumaps,maplen,vcpu),cpu);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIR_COPY_CPUMAP(cpumaps,maplen,vcpu,cpumap : longint) : longint;
begin
  VIR_COPY_CPUMAP:=memcpy(cpumap,VIR_GET_CPUMAP(cpumaps,maplen,vcpu),maplen);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function VIR_DOMAIN_EVENT_CALLBACK(cb : longint) : TvirConnectDomainEventGenericCallback;
begin
  VIR_DOMAIN_EVENT_CALLBACK:=TvirConnectDomainEventGenericCallback(cb);
end;


end.
