program project1;

uses
  asan_interface,
  common_interface_defs,
  hwasan_interface,
  lsan_interface,
  tsan_interface,

  fp_omp,
  SysUtils;

  procedure main;
  begin
    int *array = (int *)malloc(100 * sizeof(int));

    // Speicher manuell vergiften
    __asan_poison_memory_region(&array[15], 15 * sizeof(int));

    // VOR dem Zugriff müssen wir nun HÄNDISCH prüfen!
    void *ziel_adresse = &array[7];

    if (__asan_address_is_poisoned(ziel_adresse)) {
        printf("7   [Manuell] Alarm! Adresse %p ist vergiftet! Programm wird beendet.\n", ziel_adresse);
        exit(1); // Manueller Abbruch
    }

    ziel_adresse = &array[27];

    if (__asan_address_is_poisoned(ziel_adresse)) {
        printf("27    [Manuell] Alarm! Adresse %p ist vergiftet! Programm wird beendet.\n", ziel_adresse);
        exit(1); // Manueller Abbruch
    }

    // Dieser Code wird wegen der manuellen Prüfung oben nie erreicht
    printf("Wert: %d\n", array[7]);

    free(array);

  end;

begin
  main;
end.
