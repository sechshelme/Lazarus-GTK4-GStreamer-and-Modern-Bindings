



// gcc main.c -o main -lgomp


// sudo update-alternatives --config gnuplot 

// /usr/lib/gcc/x86_64-linux-gnu/14/include


#include <stdio.h>
#include <stdlib.h>
#include <openacc.h> // Der offizielle OpenACC-Header

#define N 10000000 // 10 Millionen Elemente

int main() {
    // Speicher auf dem Host (CPU) reservieren
    float *x = (float*)malloc(N * sizeof(float));
    float *y = (float*)malloc(N * sizeof(float));
    float a = 2.0f;

    // Vektoren auf der CPU initialisieren
    for (int i = 0; i < N; i++) {
        x[i] = 1.0f;
        y[i] = 4.0f;
    }

    printf("Starte Berechnung auf dem OpenACC-Beschleuniger...\n");

    // Hier beginnt die OpenACC-Magie:
    // 1. "data": Kopiert x und y hin zur GPU, und kopiert das Ergebnis y am Ende zurück.
    // 2. "parallel loop": Sagt dem Compiler, er soll die Schleife parallel auf GPU-Kerne aufteilen.
    #pragma acc data copyin(x[0:N]) copy(y[0:N]) //
    {
        #pragma acc parallel loop //
        for (int i = 0; i < N; i++) {
            y[i] = a * x[i] + y[i];
        }
    }

    // Ergebnis stichprobenartig prüfen
    printf("Fertig! Ergebnis an Index 0: %f (Erwartet: 6.0)\n", y[0]);
    printf("Ergebnis an Index %d: %f (Erwartet: 6.0)\n", N-1, y[N-1]);

    free(x);
    free(y);
    return 0;
}

