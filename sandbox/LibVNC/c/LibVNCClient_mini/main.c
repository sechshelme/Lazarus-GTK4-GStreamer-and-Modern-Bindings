


// gcc main.c -o main -lvncclient -lvncserver

#include <rfb/rfbclient.h>


#include <stdio.h>

void save_buffer_to_bmp(rfbClient* client, const char* filename) {
    int width = client->width;
    int height = client->height;
    int channels = 4; // 32-Bit (RGBA/BGRA)

    FILE* f = fopen(filename, "wb");
    if (!f) {
        fprintf(stderr, "Fehler beim Öffnen der Datei %s zum Schreiben!\n", filename);
        return;
    }

    // BMP Header Strukturen (Windows Format)
    unsigned char file_header[14] = {
        'B', 'M',           // Magische Nummern
        0, 0, 0, 0,         // Dateigrösse (wird gleich berechnet)
        0, 0, 0, 0,         // Reserviert
        54, 0, 0, 0         // Offset bis zu den Pixeldaten
    };

    unsigned char info_header[40] = {
        40, 0, 0, 0,        // Grösse dieses Headers
        0, 0, 0, 0,         // Breite (wird gleich berechnet)
        0, 0, 0, 0,         // Höhe (wird gleich berechnet)
        1, 0,               // Anzahl der Farbebenen
        32, 0,              // Bits pro Pixel (32-Bit)
        0, 0, 0, 0,         // Kompression (0 = Unkomprimiert)
        0, 0, 0, 0,         // Bildgrösse
        0, 0, 0, 0,         // X-Auflösung
        0, 0, 0, 0,         // Y-Auflösung
        0, 0, 0, 0,         // Farben in Farbpalette
        0, 0, 0, 0          // Wichtige Farben
    };

    int data_size = width * height * channels;
    int file_size = 54 + data_size;

    // Dateigrösse in den Header eintragen
    file_header[2] = (unsigned char)(file_size);
    file_header[3] = (unsigned char)(file_size >> 8);
    file_header[4] = (unsigned char)(file_size >> 16);
    file_header[5] = (unsigned char)(file_size >> 24);

    // Breite und Höhe eintragen
    info_header[4] = (unsigned char)(width);
    info_header[5] = (unsigned char)(width >> 8);
    info_header[6] = (unsigned char)(width >> 16);
    info_header[7] = (unsigned char)(width >> 24);

    // Wichtig: Negative Höhe im BMP-Header bewirkt, dass das Bild von OBEN nach UNTEN gelesen wird.
    // Standard-BMPs sind sonst "kopfüber".
    int neg_height = -height;
    info_header[8] = (unsigned char)(neg_height);
    info_header[9] = (unsigned char)(neg_height >> 8);
    info_header[10] = (unsigned char)(neg_height >> 16);
    info_header[11] = (unsigned char)(neg_height >> 24);

    // Header in Datei schreiben
    fwrite(file_header, 1, 14, f);
    fwrite(info_header, 1, 40, f);

    // VNC liefert die Daten standardmässig als RGB(A) oder BGR(A) aus.
    // Windows BMP erwartet zwingend BGRA (Blau, Grün, Rot, Alpha).
    // Da du in update_screen_size 'redShift=16' und 'blueShift=0' definiert hast,
    // liegen deine Daten bereits im BGRA/BGRX Format vor und können direkt kopiert werden.
    fwrite(client->frameBuffer, 1, data_size, f);

    fclose(f);
    printf("[VNC] Screenshot erfolgreich gespeichert unter: %s\n", filename);
}


rfbClient* vnc_client = NULL;

static rfbBool update_screen_size(rfbClient* client) {
    int width = client->width;
    int height = client->height;

    printf("[VNC] Bildschirmauflösung geändert: %dx%d\n", width, height);

    client->frameBuffer = realloc(client->frameBuffer, width * height * 4);
    
    client->format.bitsPerPixel = 32;
    client->format.depth = 24;
    client->format.bigEndian = FALSE;
    client->format.trueColour = TRUE;
    client->format.redMax = 255;
    client->format.greenMax = 255;
    client->format.blueMax = 255;
    client->format.redShift = 16;
    client->format.greenShift = 8;
    client->format.blueShift = 0;

    return TRUE;
}

static void handle_update(rfbClient* client, int x, int y, int w, int h) {
    static int screenshot_done = 0;
 

  printf("handle_update x: %d  y: %d  w: %d  h: %d\n",x,y,w,h);

    if (screenshot_done = 10) {
        save_buffer_to_bmp(client, "vnc_screenshot.bmp");
        screenshot_done = 11; 

        printf("fertig geschrieben\n");
    } else {
      screenshot_done += 1; 
    }
}


int main(int argc, char* argv[]) {
    vnc_client = rfbGetClient(8, 3, 4);
    vnc_client->serverHost = "127.0.0.1";
    vnc_client->serverPort = 5900;
    vnc_client->MallocFrameBuffer = update_screen_size;
    vnc_client->GotFrameBufferUpdate = handle_update;

    printf("Verbinde zu VNC auf %s:%d...\n", vnc_client->serverHost, vnc_client->serverPort);
    if (!rfbInitClient(vnc_client, NULL, NULL)) {
        fprintf(stderr, "VNC: Verbindung fehlgeschlagen!\n");
        exit(1);
    }

    SendFramebufferUpdateRequest(vnc_client, 0, 0, vnc_client->width, vnc_client->height, FALSE);

    printf("Starte Event-Loop. Warte auf Updates...\n");
    
    while (1) {
    if (WaitForMessage(vnc_client, 0) > 0) {
        if (!HandleRFBServerMessage(vnc_client)) {
            printf("VNC Verbindung abgebrochen.\n");
        }
    }
}
        
    rfbClientCleanup(vnc_client); // [1.10]
    return 0;

}

