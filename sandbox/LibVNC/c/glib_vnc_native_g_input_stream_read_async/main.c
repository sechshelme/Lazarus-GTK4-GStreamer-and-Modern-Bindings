


// gcc main.c -o main  `pkg-config --cflags --libs gtk4 gobject-2.0`


#include <gio/gio.h>
#include <glib.h>
#include <stdio.h>
#include <string.h>

// Globale Zustandsvariablen für den VNC-Stream
typedef struct {
    GMainLoop *loop;
    GInputStream *input;
    GOutputStream *output;
    guint16 width;
    guint16 height;
    
    // Netzwerk-Puffer für die verschiedenen Phasen
    guint8 header_buf[4];
    guint8 rect_buf[12];
    guint8 *pixel_buf;
    
    // Zähler für die Schleifen innerhalb der Callbacks
    guint16 current_rect;
    guint16 num_rectangles;
} VncClientState;

// Vorwärtsdeklarationen der asynchronen Kette
static void starte_naechsten_request(VncClientState *state);
static void on_update_header_received(GObject *source, GAsyncResult *res, gpointer user_data);
static void on_rect_header_received(GObject *source, GAsyncResult *res, gpointer user_data);
static void on_pixels_received(GObject *source, GAsyncResult *res, gpointer user_data);

/**
 * GUARD: Prüft vorab, ob der Port offen ist und sich mit "RFB " meldet.
 */
gboolean sicherer_vnc_check(const gchar *ip, guint16 port) {
    GError *error = NULL;
    GSocketClient *client = g_socket_client_new();
    g_socket_client_set_timeout(client, 2);

    g_print("[Guard] Prüfe %s:%d...\n", ip, port);
    GSocketConnection *conn = g_socket_client_connect_to_host(client, ip, port, NULL, &error);

    if (error != NULL) {
        g_printerr("[Guard] Port-Fehler (geschlossen/unerreichbar): %s\n", error->message);
        g_clear_error(&error);
        g_object_unref(client);
        return FALSE; 
    }

    GInputStream *input = g_io_stream_get_input_stream(G_IO_STREAM(conn));
    char pruef_puffer[4];
    memset(pruef_puffer, 0, 4);

    gssize gelesene_bytes = g_input_stream_read(input, pruef_puffer, 4, NULL, &error);
    g_io_stream_close(G_IO_STREAM(conn), NULL, NULL);
    g_object_unref(conn);
    g_object_unref(client);

    if (error != NULL || gelesene_bytes < 4) {
        g_printerr("[Guard] Dienst-Timeout oder Fremddienst (z.B. Dropbox).\n");
        if (error) g_clear_error(&error);
        return FALSE; 
    }

    if (strncmp(pruef_puffer, "RFB ", 4) == 0) {
        g_print("[Guard] ECHTER VNC-Server gefunden!\n");
        return TRUE;
    }
    g_printerr("[Guard] Unbekanntes Protokoll auf diesem Port!\n");
    return FALSE;
}

/**
 * Sendet ein FramebufferUpdateRequest (Inkrementell) an den Server
 */
static void starte_naechsten_request(VncClientState *state) {
    guint8 update_req[10];
    update_req[0] = 3;  // Message-Type: FramebufferUpdateRequest
    update_req[1] = 1;  // 1 = Inkrementell (Nur Änderungen)
    
    update_req[2] = 0; update_req[3] = 0; // X = 0
    update_req[4] = 0; update_req[5] = 0; // Y = 0
    
    update_req[6] = (state->width >> 8) & 0xFF;
    update_req[7] = state->width & 0xFF;
    update_req[8] = (state->height >> 8) & 0xFF;
    update_req[9] = state->height & 0xFF;

    g_output_stream_write(state->output, update_req, 10, NULL, NULL);

    // Jetzt asynchron auf die 4 Bytes des Update-Headers lauschen
    g_input_stream_read_async(
        state->input, state->header_buf, 4, 
        G_PRIORITY_DEFAULT, NULL, on_update_header_received, state
    );
}

/**
 * Schritt A: Der 4-Byte Antwort-Header vom Server wurde empfangen
 */
static void on_update_header_received(GObject *source, GAsyncResult *res, gpointer user_data) {
    VncClientState *state = (VncClientState *)user_data;
    GError *error = NULL;

    gssize bytes = g_input_stream_read_finish(G_INPUT_STREAM(source), res, &error);
    if (error != NULL || bytes < 4) {
        g_printerr("[Async-Loop] Verbindung abgebrochen.\n");
        g_main_loop_quit(state->loop);
        return;
    }

    if (state->header_buf[0] != 0) {
        g_printerr("[Async-Loop] Unerwarteter Message-Type: %d\n", state->header_buf[0]);
        g_main_loop_quit(state->loop);
        return;
    }

    state->num_rectangles = (state->header_buf[2] << 8) | state->header_buf[3];
    state->current_rect = 0;

    if (state->num_rectangles > 0) {
        g_print("[Async] Empfange Paket mit %d Rechteck(en)...\n", state->num_rectangles);
        // Direkt das erste Rechteck (12-Byte Header) asynchron anfordern
        g_input_stream_read_async(
            state->input, state->rect_buf, 12, 
            G_PRIORITY_DEFAULT, NULL, on_rect_header_received, state
        );
    } else {
        // Keine Änderungen? 33ms schlafen, dann neu anfordern via Timer-Event im Loop
        g_usleep(33000);
        starte_naechsten_request(state);
    }
}

/**
 * Schritt B: Ein 12-Byte Rechteck-Header wurde eingelesen
 */
static void on_rect_header_received(GObject *source, GAsyncResult *res, gpointer user_data) {
    VncClientState *state = (VncClientState *)user_data;
    GError *error = NULL;

    gssize bytes = g_input_stream_read_finish(G_INPUT_STREAM(source), res, &error);
    if (error != NULL || bytes < 12) {
        g_main_loop_quit(state->loop);
        return;
    }

    guint16 rect_x   = (state->rect_buf[0] << 8) | state->rect_buf[1];
    guint16 rect_y   = (state->rect_buf[2] << 8) | state->rect_buf[3];
    guint16 rect_w   = (state->rect_buf[4] << 8) | state->rect_buf[5];
    guint16 rect_h   = (state->rect_buf[6] << 8) | state->rect_buf[7];
    gint32  rect_enc = (state->rect_buf[8] << 24) | (state->rect_buf[9] << 16) | 
                       (state->rect_buf[10] << 8) | state->rect_buf[11];

    if (rect_enc == 0) { // RAW-Grafikpixel
        guint32 pixel_bytes = rect_w * rect_h * 4;
        g_print("   -> [%d/%d] Pixel-Update bei (%d,%d) Größe: %dx%d\n", 
                state->current_rect + 1, state->num_rectangles, rect_x, rect_y, rect_w, rect_h);

        state->pixel_buf = g_malloc(pixel_bytes);
        
        // Pixel-Bytes asynchron vollständig einlesen (g_input_stream_read_all_async)
        g_input_stream_read_all_async(
            state->input, state->pixel_buf, pixel_bytes, 
            G_PRIORITY_DEFAULT, NULL, on_pixels_received, state
        );
    } 
    else if (rect_enc == -223) { // DesktopSize Pseudo-Encoding
        g_print("\n[Async-INFO] Auflösungsänderung erkannt: %d x %d Pixel\n\n", rect_w, rect_h);
        state->width = rect_w;
        state->height = rect_h;

        // Keine Pixeldaten vorhanden. Direkt zum nächsten Rechteck oder nächsten Request springen
        state->current_rect++;
        if (state->current_rect < state->num_rectangles) {
            g_input_stream_read_async(state->input, state->rect_buf, 12, G_PRIORITY_DEFAULT, NULL, on_rect_header_received, state);
        } else {
            g_usleep(33000);
            starte_naechsten_request(state);
        }
    }
}

/**
 * Schritt C: Die rohen Pixeldaten für das aktuelle Rechteck wurden komplett geladen
 */
static void on_pixels_received(GObject *source, GAsyncResult *res, gpointer user_data) {
    VncClientState *state = (VncClientState *)user_data;
    GError *error = NULL;
    gsize bytes_read;

    g_input_stream_read_all_finish(G_INPUT_STREAM(source), res, &bytes_read, &error);
    
    // TIPP: state->pixel_buf enthält jetzt die fertigen Bilddaten für die GUI!
    g_free(state->pixel_buf); 
    state->pixel_buf = NULL;

    if (error != NULL) {
        g_main_loop_quit(state->loop);
        return;
    }

    state->current_rect++;
    if (state->current_rect < state->num_rectangles) {
        // Es gibt noch mehr Rechtecke in diesem Paket -> Nächsten Header lesen
        g_input_stream_read_async(
            state->input, state->rect_buf, 12, 
            G_PRIORITY_DEFAULT, NULL, on_rect_header_received, state
        );
    } else {
        // Paket komplett abgearbeitet -> 33ms schlafen, dann von vorne anfordern
        g_usleep(33000);
        starte_naechsten_request(state);
    }
}

int main(int argc, char *argv[]) {
    const gchar *ziel_ip = "127.0.0.1";
    guint16 ziel_port = 5900;

    if (!sicherer_vnc_check(ziel_ip, ziel_port)) {
        return 1;
    }

    GError *error = NULL;
    GSocketClient *client = g_socket_client_new();
    g_print("Verbinde mit VNC-Server...\n");
    GSocketConnection *conn = g_socket_client_connect_to_host(client, ziel_ip, ziel_port, NULL, &error);

    if (error != NULL) {
        g_printerr("Verbindungsfehler: %s\n", error->message);
        return 1;
    }

    VncClientState state;
    state.input = g_io_stream_get_input_stream(G_IO_STREAM(conn));
    state.output = g_io_stream_get_output_stream(G_IO_STREAM(conn));
    state.pixel_buf = NULL;

    // =========================================================================
    // SYNCHRONER HANDSHAKE (Nur einmalig beim Starten)
    // =========================================================================
    char version[12];
    g_input_stream_read(state.input, version, 12, NULL, &error);
    g_output_stream_write(state.output, version, 12, NULL, &error);

    guint8 num_sec = 0;
    g_input_stream_read(state.input, &num_sec, 1, NULL, &error);
    guint8 *sec_types = g_new(guint8, num_sec);
    g_input_stream_read(state.input, sec_types, num_sec, NULL, &error);
    
    guint8 sel_type = 1; // Wir erzwingen "None" Authentifizierung für QEMU local
    g_output_stream_write(state.output, &sel_type, 1, NULL, &error);
    g_free(sec_types);

    guint32 sec_res = 0;
    g_input_stream_read(state.input, &sec_res, 4, NULL, &error);

    guint8 shared = 1;
    g_output_stream_write(state.output, &shared, 1, NULL, &error);

    guint8 size_buf[4];
    g_input_stream_read(state.input, size_buf, 4, NULL, &error);
    state.width = (size_buf[0] << 8) | size_buf[1];
    state.height = (size_buf[2] << 8) | size_buf[3];

    // Restlichen ServerInit-Initialisierungsmüll verwerfen
    guint8 junk[20];
    g_input_stream_read(state.input, junk, 20, NULL, &error);
    guint32 name_len = (junk[16] << 24) | (junk[17] << 16) | (junk[18] << 8) | junk[19];
    if (name_len > 0 && name_len < 512) {
        gchar *name = g_new(gchar, name_len + 1);
        g_input_stream_read(state.input, name, name_len, NULL, &error);

        g_print("Verbunden mit VM: %s (%dx%d)\n", name, state.width, state.height);
g_free(name);
}
// =========================================================================
// ASYNCHRONER LIVE-LOOP START über GMainLoop
// =========================================================================
state.loop = g_main_loop_new(NULL, FALSE);
g_print("\n[System] Starte asynchrone Ereignisschleife (GMainLoop)...\n");
// Den ersten asynchronen Request anstoßen: ab hier übernehmen die Callbacks!
starte_naechsten_request(&state);
// Die Hauptschleife blockiert das Programm hocheffizient bei 0% CPU
g_main_loop_run(state.loop);
// Nach dem Beenden sauber aufräumen
g_print("[System] Beende Programm.\n");
g_main_loop_unref(state.loop);
g_io_stream_close(G_IO_STREAM(conn), NULL, NULL);
g_object_unref(conn);
g_object_unref(client);
return 0;
}

