


// gcc main.c -o main `pkg-config --cflags --libs sdl2` -lvncclient -lvncserver

// virt-viewer --connect vnc://127.0.0.1:5901

// remote-viewer vnc://127.0.0.1:5901


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <rfb/rfb.h>

int main(int argc, char* argv[]) {
    int width = 640;
    int height = 480;
    int bpp = 4; // 4 Bytes pro Pixel (32-bit ARGB)

    // 1. Eigene Argumente für LibVNCServer vorbereiten, falls keine übergeben wurden.
    // Das verhindert, dass wir manuell in server->port oder server->desktopName schreiben müssen.
    char* default_argv[] = { 
        argv[0], 
        "-rfbport", "5901", 
        "-desktop", "Mein eigener C-VNC-Server", 
        NULL 
    };
    int fake_argc = 5;
    char** active_argv = argv;
    int* active_argc = &argc;

    if (argc == 1) { // Keine Argumente vom Terminal übergeben? Dann nimm die Defaults.
        active_argv = default_argv;
        active_argc = &fake_argc;
    }

    // 2. Framebuffer reservieren
    uint32_t* framebuffer = malloc(width * height * bpp);
    if (!framebuffer) {
        fprintf(stderr, "Konnte Speicher für Framebuffer nicht reservieren.\n");
        return 1;
    }
    memset(framebuffer, 0, width * height * bpp);

    // 3. LibVNCServer initialisieren (parst active_argv automatisch)
    rfbScreenInfoPtr server = rfbGetScreen(active_argc, active_argv, width, height, 8, 3, bpp);
    if (!server) {
        free(framebuffer);
        return 1;
    }

    // --- HIER IST DER SETTER ---
    // Ersetzt: server->frameBuffer = (char*)framebuffer;
    // Parameter: screen, buffer, width, height, bitsPerSample, samplesPerPixel, bytesPerPixel
    rfbNewFramebuffer(server, (char*)framebuffer, width, height, 8, 3, bpp);

    // Server starten
    rfbInitServer(server);

    printf("VNC-Server wurde erfolgreich initialisiert...\n");

    // Animations-Variablen
    int box_x = 50, box_y = 50;
    int box_size = 100;
    int speed_x = 4, speed_y = 3;

    // 4. Hauptschleife
    while (rfbIsActive(server)) {
        
        // Bildschirm leeren
        memset(framebuffer, 0, width * height * bpp);

        // Position für den nächsten Frame berechnen
        box_x += speed_x;
        box_y += speed_y;

        // Kollision prüfen UND Position sofort einschränken
        if (box_x < 0) { box_x = 0; speed_x = -speed_x; }
        if (box_x + box_size > width) { box_x = width - box_size; speed_x = -speed_x; }
        
        if (box_y < 0) { box_y = 0; speed_y = -speed_y; }
        if (box_y + box_size > height) { box_y = height - box_size; speed_y = -speed_y; }

        // Das Quadrat sicher zeichnen
        for (int y = box_y; y < box_y + box_size; y++) {
            for (int x = box_x; x < box_x + box_size; x++) {
                int pixel_index = y * width + x;
                framebuffer[pixel_index] = 0x00FF00FF; // Blau
            }
        }

        // Updates signalisieren
        rfbMarkRectAsModified(server, 0, 0, width, height);

        // Netzwerk-Events abarbeiten (20ms)
        rfbProcessEvents(server, 20000);
    }

    rfbScreenCleanup(server);
    free(framebuffer);
    return 0;
}

