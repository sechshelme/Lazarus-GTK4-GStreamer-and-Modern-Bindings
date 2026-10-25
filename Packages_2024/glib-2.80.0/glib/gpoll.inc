
{$IFDEF read_interface}

type
  PGPollFD = ^TGPollFD;

  TGPollFunc = function(ufds: PGPollFD; nfsd: Tguint; timeout_: Tgint): Tgint; cdecl;

  TGPollFD = record
    {$IFDEF windows}
    fd: Tgint64;
    {$ELSE}
    fd: Tgint;
    {$ENDIF}
    events: Tgushort;
    revents: Tgushort;
  end;

function g_poll(fds: PGPollFD; nfds: Tguint; timeout: Tgint): Tgint; cdecl; external libglib2;

// === Konventiert am: 7-8-24 17:17:52 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
