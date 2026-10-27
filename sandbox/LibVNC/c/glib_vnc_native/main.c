


// gcc main.c -o main  `pkg-config --cflags --libs gtk4 gobject-2.0`


#include <gio/gio.h>
#include <glib.h>
#include <stdio.h>
#include <string.h>

/**
 * GUARD: Prüft crash-sicher und hang-sicher, ob ein echter VNC-Server antwortet.
 */
gboolean sicherer_vnc_check(const gchar *ip, guint16 port) {
    GError *error = NULL;
    GSocketClient *client = g_socket_client_new();
    
    // Maximal 2 Sekunden auf Verbindung & Daten warten (schützt vor Endlosschleifen)
    g_socket_client_set_timeout(client, 2);

    g_print("[Guard] Prüfe %s:%d...\n", ip, port);
    
    // 1. TCP-Handshake (Fängt geschlossene Ports ab)
    GSocketConnection *connection = g_socket_client_connect_to_host(
        client, ip, port, NULL, &error
    );

    if (error != NULL) {
        g_printerr("[Guard] Port-Fehler (geschlossen/unerreichbar): %s\n", error->message);
        g_clear_error(&error);
        g_object_unref(client);
        return FALSE; 
    }

    // 2. Protokoll-Check (Fängt Fremddienste wie Dropbox ab)
    GInputStream *input = g_io_stream_get_input_stream(G_IO_STREAM(connection));
    char pruef_puffer[4];
    memset(pruef_puffer, 0, 4);

    gssize gelesene_bytes = g_input_stream_read(input, pruef_puffer, 4, NULL, &error);

    // Verbindung sofort wieder schliessen
    g_io_stream_close(G_IO_STREAM(connection), NULL, NULL);
    g_object_unref(connection);
    g_object_unref(client);

    if (error != NULL) {
        g_printerr("[Guard] Dienst-Timeout (Port offen, aber antwortet nicht wie VNC): %s\n", error->message);
        g_clear_error(&error);
        return FALSE; 
    }

    if (gelesene_bytes < 4) {
        g_printerr("[Guard] Zu wenig Daten empfangen.\n");
        return FALSE;
    }

    // 3. Das finale VNC-Zertifikat prüfen
    if (strncmp(pruef_puffer, "RFB ", 4) == 0) {
        g_print("[Guard] ECHTER VNC-Server gefunden! Sicher zum Initialisieren.\n");
        return TRUE;
    } else {
        g_printerr("[Guard] Port offen, aber es antwortet ein fremdes Protokoll!\n");
        return FALSE;
    }
}

int main(int argc, char *argv[]) {
    #if !GLIB_CHECK_VERSION(2, 35, 0)
    g_type_init();
    #endif

    const gchar *ziel_ip = "127.0.0.1";
    guint16 ziel_port = 5900; // Dein QEMU-VNC-Port

    // 1. Sicherheits-Schutzstufe vorschalten
    if (!sicherer_vnc_check(ziel_ip, ziel_port)) {
        g_printerr("\n[STOP] Verbindung abgelehnt. Abbruch vor Protokoll-Initialisierung.\n");
        return 1;
    }

    GError *error = NULL;
    GSocketConnection *connection = NULL;
    guint8 *security_types = NULL;
    gchar *desktop_name = NULL;
    
    GSocketClient *client = g_socket_client_new();
    
    g_print("Verbinde mit VNC-Server auf %s:%d...\n", ziel_ip, ziel_port);
    connection = g_socket_client_connect_to_host(client, ziel_ip, ziel_port, NULL, &error);

    if (error != NULL) {
        g_printerr("Unerwarteter Verbindungsfehler: %s\n", error->message);
        g_clear_error(&error);
        g_object_unref(client);
        return 1;
    }

    GInputStream *input = g_io_stream_get_input_stream(G_IO_STREAM(connection));
    GOutputStream *output = g_io_stream_get_output_stream(G_IO_STREAM(connection));

    // 2. Handshake: Version lesen
    char version_buffer[13];
    gssize bytes_read = g_input_stream_read(input, version_buffer, 12, NULL, &error);
    if (error != NULL || bytes_read < 12) goto cleanup;
    version_buffer[12] = '\0';
    g_print("Server meldet VNC-Protokollversion: %s", version_buffer);
    
    // Version zurückspiegeln
    g_output_stream_write(output, version_buffer, 12, NULL, &error);
    if (error != NULL) goto cleanup;

    // 3. Security-Typen lesen
    guint8 num_security_types = 0;
    g_input_stream_read(input, &num_security_types, 1, NULL, &error);
    if (error != NULL || num_security_types == 0) goto cleanup;

    security_types = g_new(guint8, num_security_types);
    g_input_stream_read(input, security_types, num_security_types, NULL, &error);

    guint8 selected_type = 0;
    for (int i = 0; i < num_security_types; i++) {
        if (security_types[i] == 1) { // None / Keine Authentifizierung
            selected_type = 1;
            break;
        }
    }

    if (selected_type != 1) {
        g_printerr("Fehler: Server verlangt Passwort oder nicht unterstützte Security.\n");
        goto cleanup;
    }

    // Typ an Server senden
    g_output_stream_write(output, &selected_type, 1, NULL, &error);

    // SecurityResult lesen (4 Bytes)
    guint32 security_result = 0;
    g_input_stream_read(input, &security_result, 4, NULL, &error);
    security_result = GUINT32_FROM_BE(security_result);
    if (security_result != 0) {
        g_printerr("Authentifizierung fehlgeschlagen!\n");
        goto cleanup;
    }
    g_print("Authentifizierung ERFOLGREICH!\n");

    // 4. ClientInit senden
    guint8 shared_flag = 1; 
    g_output_stream_write(output, &shared_flag, 1, NULL, &error);

    // 5. ServerInit lesen (Erste Basis-Auflösung holen)
    guint8 size_buffer[4];
    g_input_stream_read(input, size_buffer, 4, NULL, &error);
    if (error != NULL) goto cleanup;

    guint16 width = (size_buffer[0] << 8) | size_buffer[1];
    guint16 height = (size_buffer[2] << 8) | size_buffer[3];

    // Restlichen ServerInit-Daten-Müll absaugen
    guint8 pixel_format_and_len[20];
    g_input_stream_read(input, pixel_format_and_len, 20, NULL, &error);
    guint32 name_length = (pixel_format_and_len[16] << 24) | (pixel_format_and_len[17] << 16) | 
                          (pixel_format_and_len[18] << 8)  | pixel_format_and_len[19];

    if (name_length > 0 && name_length < 1024) {
        desktop_name = g_new(gchar, name_length + 1);
        g_input_stream_read(input, desktop_name, name_length, NULL, &error);
        desktop_name[name_length] = '\0';
    }

    g_print("\n========================================\n");
    g_print(" VNC SERVER DETAILS GEFUNDEN:\n");
    g_print(" -> Name der VM:  %s\n", desktop_name ? desktop_name : "Unbekannt");
    g_print(" -> Start-Größe:  %d x %d Pixel\n", width, height);
    g_print("========================================\n\n");

    // =========================================================================
    // 6. DER LIVE-HAUPTLOOP (HIER IST DIE GESUCHTE SCHLEIFE)
    // =========================================================================
    g_print("Starte kontinuierlichen Live-Bildempfang (Beenden mit Strg+C)...\n");

    gboolean erster_durchlauf = TRUE;

    while (TRUE) {
        guint8 update_req[10];
        update_req[0] = 3;  // Message-Type: FramebufferUpdateRequest
        
        // Beim ersten Mal das Vollbild (0), danach NUR noch Änderungen (1)
        if (erster_durchlauf) {
            update_req[1] = 0; 
            erster_durchlauf = FALSE;
        } else {
            update_req[1] = 1; // 1 = Inkrementell (Der ressourcenschonende Praxisweg!)
        }
        
        // X-Position und Y-Position auf 0 (16-Bit Big-Endian)
        update_req[2] = 0; update_req[3] = 0;
        update_req[4] = 0; update_req[5] = 0;
        
        // Die (ggf. aktualisierte) Breite und Höhe eintragen (16-Bit Big-Endian)
        update_req[6] = (width >> 8) & 0xFF;
        update_req[7] = width & 0xFF;
        update_req[8] = (height >> 8) & 0xFF;
        update_req[9] = height & 0xFF;

        // Anfrage an QEMU senden
        g_output_stream_write(output, update_req, 10, NULL, &error);
        if (error != NULL) {
            g_printerr("Fehler beim Senden der Live-Anfrage: %s\n", error->message);
            goto cleanup;
        }

        // Antwort-Header vom Server lesen (4 Bytes)
        guint8 update_header[4];
        bytes_read = g_input_stream_read(input, update_header, 4, NULL, &error);

        if (error != NULL || bytes_read < 4) {
            g_printerr("Verbindung im Live-Loop abgebrochen.\n");
            goto cleanup;
        }

        if (update_header[0] != 0) {
            g_printerr("Unerwarteter Message-Type im Live-Loop: %d\n", update_header[0]);
            goto cleanup;
        }

        // Anzahl der Rechtecke in diesem spezifischen Update-Paket ermitteln
        guint16 num_rectangles = (update_header[2] << 8) | update_header[3];
        
        if (num_rectangles > 0) {
            g_print("[Live] Empfange Paket mit %d geänderten Bildschirm-Rechtecken...\n", num_rectangles);
        }

        // Alle Rechtecke dieses Pakets nacheinander aus dem Stream "absaugen"
        for (int i = 0; i < num_rectangles; i++) {
            guint8 rect_header[12];
            g_input_stream_read(input, rect_header, 12, NULL, &error);
            if (error != NULL) goto cleanup;

            guint16 rect_x   = (rect_header[0] << 8) | rect_header[1];
            guint16 rect_y   = (rect_header[2] << 8) | rect_header[3];
            guint16 rect_w   = (rect_header[4] << 8) | rect_header[5];
            guint16 rect_h   = (rect_header[6] << 8) | rect_header[7];
            gint32  rect_enc = (rect_header[8] << 24) | (rect_header[9] << 16) | 
                               (rect_header[10] << 8) | rect_header[11];

            // Typ A: Echte, geänderte Grafikdaten (Raw-Farb-Pixel)
            if (rect_enc == 0) { 
                guint32 pixel_bytes = rect_w * rect_h * 4;
                guint8 *pixel_buffer = g_malloc(pixel_bytes);
                
                gsize bytes_read_actual;
                g_input_stream_read_all(input, pixel_buffer, pixel_bytes, &bytes_read_actual, NULL, &error);
                
                if (error != NULL) {
                    g_free(pixel_buffer);
                    goto cleanup;
                }

                g_print("   -> Teilbild %d: Pixel aktualisiert auf Koordinaten (%d,%d) | Größe: %dx%d\n", 
                        i+1, rect_x, rect_y, rect_w, rect_h);

                // TIPP FÜR SPÄTER: Hier greift man sich 'pixel_buffer' und wirft ihn in Cairo/GTK!
                
                g_free(pixel_buffer);
            } 


           // Typ B: Die virtuelle Maschine hat ihre Auflösung geändert!
           else if (rect_enc == -223) {
             g_print("\n[Live-INFO] QEMU hat die Bildschirmauflösung geändert!\n");
             width = rect_w;
             height = rect_h;
             g_print("   -> Neue Dimensionen für den nächsten Loop: %d x %d Pixel\n\n", width, height);
           }
        }
        // 33 Millisekunden schlafen, um die CPU zu schonen (~30 Frames pro Sekunde)
        g_usleep(33000);
    }
    cleanup:
    if (error != NULL) {
       g_printerr("Fehler aufgetreten: %s\n", error->message);
       g_clear_error(&error);
    }
    g_free(security_types);
    g_free(desktop_name);
    if (connection) g_object_unref(connection);
    g_object_unref(client);
    return 0;
}

