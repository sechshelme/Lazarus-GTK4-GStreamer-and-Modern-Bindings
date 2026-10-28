


// gcc main.c -o main  `pkg-config --cflags --libs gtk4 gobject-2.0`


#include <gio/gio.h>
#include <glib.h>

#define WIDTH 640
#define HEIGHT 480
#define BPP 4 // 4 Bytes pro Pixel (32-bit ARGB/XRGB)

typedef struct {
    GSocketConnection *connection;
    GOutputStream *out;
    GInputStream *in;
    guint32 *framebuffer;
    gint box_x, box_y;
    gint speed_x, speed_y;
} ClientState;

// Hilfsfunktion zum Senden mit GLib-Typen
gboolean send_all(GOutputStream *stream, const void *buffer, gsize count, GError **error) {
    gsize bytes_written = 0;
    return g_output_stream_write_all(stream, buffer, count, &bytes_written, NULL, error);
}

// Berechnet die Animation und zeichnet das Quadrat
void render_frame(ClientState *cs) {
    gint box_size = 100;
    
    gulong total_pixels = WIDTH * HEIGHT;
    for (gulong i = 0; i < total_pixels; i++) {
        cs->framebuffer[i] = 0;
    }

    cs->box_x += cs->speed_x;
    cs->box_y += cs->speed_y;

    if (cs->box_x < 0) { cs->box_x = 0; cs->speed_x = -cs->speed_x; }
    if (cs->box_x + box_size > WIDTH) { cs->box_x = WIDTH - box_size; cs->speed_x = -cs->speed_x; }
    if (cs->box_y < 0) { cs->box_y = 0; cs->speed_y = -cs->speed_y; }
    if (cs->box_y + box_size > HEIGHT) { cs->box_y = HEIGHT - box_size; cs->speed_y = -cs->speed_y; }

    for (gint y = cs->box_y; y < cs->box_y + box_size; y++) {
        for (gint x = cs->box_x; x < cs->box_x + box_size; x++) {
            // VNC erwartet standardmäßig XRGB (Big Endian im Protokoll).
            // 0xFFFF0000 setzt hier ein sattes Rot.
            cs->framebuffer[y * WIDTH + x] = 0xFFFF0000;
        }
    }
}

// Diese Funktion läuft periodisch im GLib Main Loop
gboolean update_network_and_render(gpointer user_data) {
    ClientState *cs = (ClientState *)user_data;
    GError *error = NULL;

    render_frame(cs);

    // 1. FramebufferUpdate Header (VNC-Protokoll Typ 0)
    guint8 update_header[4] = {
        0,    // Message Type: FramebufferUpdate
        0,    // Padding
        0, 1  // Anzahl der Rechtecke: 1 (Big Endian)
    };
    if (!send_all(cs->out, update_header, sizeof(update_header), &error)) goto error_struct;

    // 2. Rechteck-Header (Position, Größe und Encoding)
    // Werte müssen zwingend mittels GUINT16_TO_BE konvertiert werden!
    guint16 x_pos = GUINT16_TO_BE(0);
    guint16 y_pos = GUINT16_TO_BE(0);
    guint16 w_val = GUINT16_TO_BE(WIDTH);
    guint16 h_val = GUINT16_TO_BE(HEIGHT);
    gint32 enc_val = GINT32_TO_BE(0); // Encoding 0 = Raw

    if (!send_all(cs->out, &x_pos, 2, &error)) goto error_struct;
    if (!send_all(cs->out, &y_pos, 2, &error)) goto error_struct;
    if (!send_all(cs->out, &w_val, 2, &error)) goto error_struct;
    if (!send_all(cs->out, &h_val, 2, &error)) goto error_struct;
    if (!send_all(cs->out, &enc_val, 4, &error)) goto error_struct;

    // 3. Die rohen Pixeldaten senden
    if (!send_all(cs->out, cs->framebuffer, WIDTH * HEIGHT * BPP, &error)) goto error_struct;

    return TRUE;

error_struct:
    g_printerr("Verbindung zum Client verloren: %s\n", error ? error->message : "Unbekannt");
    g_clear_error(&error);
    g_object_unref(cs->connection);
    g_free(cs->framebuffer);
    g_free(cs);
    return FALSE;
}

// Wird aufgerufen, sobald sich ein VNC-Client verbindet
gboolean on_new_connection(GSocketService *service, GSocketConnection *connection, GObject *source_object, gpointer user_data) {
    g_print("Client hat sich verbunden. Starte VNC-Handshake...\n");

    GInputStream *in = g_io_stream_get_input_stream(G_IO_STREAM(connection));
    GOutputStream *out = g_io_stream_get_output_stream(G_IO_STREAM(connection));
    GError *error = NULL;
    gchar buffer[12];
    gsize bytes_read = 0;

    // --- SCHRITT 1: Protokoll-Version aushandeln ---
    if (!send_all(out, "RFB 003.008\n", 12, &error)) goto fail;
    g_input_stream_read_all(in, buffer, 12, &bytes_read, NULL, &error);

    // --- SCHRITT 2: Security Typ festlegen (1 = Keine Authentifizierung) ---
    guint8 sec_types[2] = {1, 1}; 
    if (!send_all(out, sec_types, 2, &error)) goto fail;

    guint8 chosen_sec = 0;
    g_input_stream_read_all(in, &chosen_sec, 1, &bytes_read, NULL, &error);

    // Security Result senden (0 = OK)
    guint32 sec_result = 0;
    if (!send_all(out, &sec_result, 4, &error)) goto fail;

    // --- SCHRITT 3: Client Init lesen ---
    guint8 shared_flag = 0;
    g_input_stream_read_all(in, &shared_flag, 1, &bytes_read, NULL, &error);

    // --- SCHRITT 4: Server Init senden (Bildschirm-Eigenschaften) ---
    // Auch hier nutzen wir strukturierte Variablen, um Endian-Fehler zu vermeiden
    guint16 s_width = GUINT16_TO_BE(WIDTH);
    guint16 s_height = GUINT16_TO_BE(HEIGHT);
    
    guint8 pix_fmt[16] = {
        32, 24, // Bits-per-pixel (32), Depth (24)
        0,      // Big-Endian Flag (0 = Little Endian lokale Pixelstruktur)
        1,      // True-Color Flag (1)
        0, 255, // Rot-Maximalwert (Big Endian)
        0, 255, // Grün-Maximalwert (Big Endian)
        0, 255, // Blau-Maximalwert (Big Endian)
        16,     // Rot-Shift
        8,      // Grün-Shift
        0,      // Blau-Shift
        0, 0, 0 // Padding
    };

    if (!send_all(out, &s_width, 2, &error)) goto fail;
    if (!send_all(out, &s_height, 2, &error)) goto fail;
    if (!send_all(out, pix_fmt, 16, &error)) goto fail;

    // Desktop-Namen senden (Länge + Text)
    guint32 name_len = GUINT32_TO_BE(14);
    if (!send_all(out, &name_len, 4, &error)) goto fail;
    if (!send_all(out, "GIO VNC Server", 14, &error)) goto fail;

    g_print("Handshake erfolgreich. Starte Render-Loop...\n");

    ClientState *cs = g_new0(ClientState, 1);
    cs->connection = g_object_ref(connection);
    cs->in = in;
    cs->out = out;
    cs->framebuffer = g_malloc(WIDTH * HEIGHT * BPP);
    cs->box_x = 50; cs->box_y = 50;
    cs->speed_x = 4; cs->speed_y = 3;

    g_timeout_add(33, update_network_and_render, cs);

    return TRUE;

fail:
    g_printerr("Fehler beim Handshake: %s\n", error ? error->message : "Unbekannt");
    g_clear_error(&error);
    return FALSE;
}

int main(int argc, char *argv[]) {
    GMainLoop *loop = g_main_loop_new(NULL, FALSE);
    GSocketService *service = g_socket_service_new();
    GError *error = NULL;

    if (!g_socket_listener_add_inet_port(G_SOCKET_LISTENER(service), 5901, NULL, &error)) {
        g_printerr("Konnte Port 5901 nicht öffnen: %s\n", error->message);
        g_clear_error(&error);
        g_object_unref(service);
        g_main_loop_unref(loop);
        return 1;
    }

    g_signal_connect(service, "incoming", G_CALLBACK(on_new_connection), NULL);

    g_print("VNC-Server läuft stabil auf vnc://127.0.0.1:5901 ...\n");
    g_main_loop_run(loop);

    g_object_unref(service);
    g_main_loop_unref(loop);
    return 0;
}

