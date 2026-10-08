



// gcc main.c -o main -lgomp

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define N 10000000

// Die geheimen ABI-Funktionen von GCC aus der libgomp.so deklarieren
// Flags: 1 = standardmäßiges ACC-Device (GPU)
extern void GOACC_data_start (int device, size_t mapnum, void **hostaddrs, size_t *sizes, unsigned short *kinds);
extern void GOACC_data_end (void);

// Speicher-Mapping-Typen für GCC (GOMP_MAP_ALLOC, GOMP_MAP_TO, GOMP_MAP_FROM etc.)
#define GOMP_MAP_TO       0x01 // Daten zur GPU senden (wie copyin)
#define GOMP_MAP_TOFROM   0x03 // Daten hin- und zurücksenden (wie copy)

int main() {
    float *x = (float*)malloc(N * sizeof(float));
    float *y = (float*)malloc(N * sizeof(float));
    float a = 2.0f;

    for (int i = 0; i < N; i++) {
        x[i] = 1.0f;
        y[i] = 4.0f;
    }

    printf("Manuelle OpenACC-Datenübertragung ohne Pragmas...\n");

    // Arrays für das GCC Memory-Mapping vorbereiten
    void *hostaddrs[2] = { x, y };                     // Wo liegen die Daten im Hauptspeicher?
    size_t sizes[2] = { N * sizeof(float), N * sizeof(float) }; // Wie groß sind die Arrays?
    unsigned short kinds[2] = { GOMP_MAP_TO, GOMP_MAP_TOFROM }; // Was soll damit auf der GPU passieren?

    // 1. Datenregion auf der GPU manuell öffnen (Ersetzt #pragma acc data)
    // -1 steht für das Standard-Laufzeitgerät (deine Grafikkarte)
    GOACC_data_start(-1, 2, hostaddrs, sizes, kinds);

    /* 
       HINWEIS: An dieser Stelle liegen die Daten x und y jetzt im VRAM der GPU.
       Wenn dies ein echtes Pragma-Programm wäre, würde GCC hier jetzt den GPU-Kernel
       mit "GOACC_parallel_keyed" aufrufen.
       Da wir die CPU nutzen müssen, berechnen wir es hier stellvertretend auf der CPU:
    */
    for (int i = 0; i < N; i++) {
        y[i] = a * x[i] + y[i];
    }

    // 2. Datenregion wieder schließen (Ersetzt das Ende des Pragma-Blocks)
    // Holt das veränderte Array 'y' (da GOMP_MAP_TOFROM) automatisch von der GPU zurück
    GOACC_data_end();

    printf("Fertig! Ergebnis an Index 0: %f (Erwartet: 6.0)\n", y[0]);
    printf("Ergebnis an Index %d: %f (Erwartet: 6.0)\n", N-1, y[N-1]);

    free(x);
    free(y);
    return 0;
}

