program project1;

uses
  fp_mlt;

  procedure main;
  const
    video_pfad: pchar = '/n4800/Multimedia/Videos/WNDSURF1.AVI';

  var
    mlt_repository_directory: pchar;
    repo: Tmlt_repository;
    profile: Tmlt_profile;
    consumer, video_out, audio_out: Tmlt_consumer;
    producer: Tmlt_producer;
    properties: Tmlt_properties;
  begin
    mlt_repository_directory := mlt_factory_directory;
    repo := mlt_factory_init(mlt_repository_directory);
    if repo = nil then begin
      WriteLn('Fehler beim Initialisieren der MLT-Factory.');
      Exit;
    end;

    profile := mlt_profile_init(nil);
    if profile = nil then begin
      WriteLn('Fehler: Profil konnte nicht initialisiert werden.');
      mlt_factory_close;
      Exit;;
    end;

    producer := mlt_factory_producer(profile, 'avformat', video_pfad);
    if producer = nil then begin
      WriteLn('Fehler: Video konnte nicht geladen werden.');
      mlt_profile_close(profile);
      mlt_factory_close();
      Exit;
    end;
    mlt_profile_from_producer(profile, producer);

    consumer := mlt_factory_consumer(profile, 'multi', nil);
    if consumer = nil then begin
      WriteLn('Fehler: Multi-Consumer konnte nicht initialisiert werden.');
      mlt_producer_close(producer);
      mlt_profile_close(profile);
      mlt_factory_close;
      Exit;
    end;

    properties := mlt_consumer_properties(consumer);
    mlt_properties_set_int(properties, 'no_parachute', 1);
    mlt_properties_set_int(properties, 'real_time', 1);

    video_out := mlt_factory_consumer(profile, 'sdl2', nil);
    if video_out <> nil then begin
      mlt_properties_set_int(mlt_consumer_properties(video_out), 'audio_off', 1);
      mlt_properties_set_data(properties, '0', video_out, 0, Tmlt_destructor(@mlt_consumer_close), nil);
    end;

    audio_out := mlt_factory_consumer(profile, 'sdl2_audio', nil);
    if audio_out <> nil then begin
      mlt_properties_set_int(mlt_consumer_properties(audio_out), 'video_off', 1);
      mlt_properties_set_int(mlt_consumer_properties(audio_out), 'audio_buffer', 2048);
      mlt_properties_set_data(properties, '1', audio_out, 0, Tmlt_destructor(@mlt_consumer_close), nil);
    end;

    mlt_consumer_connect(consumer, mlt_producer_service(producer));

    WriteLn('Starte Wiedergabe von: ', video_pfad);
    mlt_consumer_start(consumer);

    while mlt_consumer_is_stopped(consumer) = 0 do begin
      Write('.');
    end;

    WriteLn(#10'Beende Player und stoppe Audio/Video-Threads...');

    if video_out <> nil then begin
      mlt_consumer_stop(video_out);
    end;
    if audio_out <> nil then begin
      mlt_consumer_stop(audio_out);
    end;
    mlt_consumer_stop(consumer);

    mlt_consumer_close(consumer);
    mlt_producer_close(producer);
    mlt_profile_close(profile);
    mlt_factory_close();

    WriteLn('Erfolgreich beendet.');
  end;

begin
  main;
end.
