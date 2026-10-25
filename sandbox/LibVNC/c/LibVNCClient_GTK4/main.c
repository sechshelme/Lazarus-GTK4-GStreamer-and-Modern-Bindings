


// gcc main.c -o main `pkg-config --cflags --libs gtk4` -lvncclient -lvncserver

#include <gtk/gtk.h>
#include <rfb/rfbclient.h>
#include <gdk/gdkkeysyms.h>



#include <gtk/gtk.h>
#include <gio/gio.h>

// Prüft mithilfe von GIO, ob auf einem Port ein VNC-Server lauscht
static gboolean check_vnc_port_glib(const char* ip, int port) {
    GSocketClient* client = g_socket_client_new();
    
    // Setze einen kurzen Timeout (z. B. 50 Millisekunden)
    g_socket_client_set_timeout(client, 50);

    GError* error = NULL;
    // Versuche eine synchrone Verbindung aufzubauen (reicht für den schnellen Start-Scan)
    GSocketConnection* connection = g_socket_client_connect_to_host(
        client, ip, port, NULL, &error
    );

    gboolean active = FALSE;

    if (connection != NULL) {
        // Verbindung war erfolgreich! Wir lesen kurz an, ob es sich um VNC handelt
        GInputStream* input = g_io_stream_get_input_stream(G_IO_STREAM(connection));
        char buffer[12];
        gssize bytes_read = g_input_stream_read(input, buffer, sizeof(buffer), NULL, NULL);

        // Das VNC-Protokoll startet immer mit der Kennung "RFB 003..."
        if (bytes_read >= 3 && g_str_has_prefix(buffer, "RFB")) {
            active = TRUE;
        }

        // Ressourcen sauber freigeben
        g_object_unref(connection);
    }

    if (error) {
        g_error_free(error); // Verwirft Fehlermeldungen wie "Connection refused"
    }
    
    g_object_unref(client);
    return active;
}

// Scant den Bereich von 5900 bis 5910 mit GLib-Mitteln
static int find_active_vnc_port() {
    const char* target_ip = "127.0.0.1";
    
    for (int port = 5900; port <= 5910; port++) {
        g_print("[GLib Scan] Prüfe Port %d...\n", port);
        if (check_vnc_port_glib(target_ip, port)) {
            g_print("[GLib Scan] VNC-Server auf Port %d erkannt!\n", port);
//            return port;
        }
    }
    
    return -1;
}

// =================================================0




// Globale Variablen für VNC und GTK-Widgets
rfbClient* vnc_client = NULL;
GtkWidget* drawing_area = NULL;
cairo_surface_t* cairo_surface = NULL;
int mouse_mask = 0;

// Hilfsfunktion: Mapping von GTK/GDK Keyval auf VNC Keysyms
static uint32_t gtk_key_to_vnc(guint keyval) {
    switch (keyval) {
        case GDK_KEY_BackSpace: return 0xff08;
        case GDK_KEY_Tab:       return 0xff09;
        case GDK_KEY_Return:    return 0xff0d;
        case GDK_KEY_Escape:    return 0xff1b;
        case GDK_KEY_Insert:    return 0xff63;
        case GDK_KEY_Delete:    return 0xffff;
        case GDK_KEY_Home:      return 0xff50;
        case GDK_KEY_End:       return 0xff57;
        case GDK_KEY_Page_Up:   return 0xff55;
        case GDK_KEY_Page_Down: return 0xff56;
        case GDK_KEY_Left:      return 0xff51;
        case GDK_KEY_Up:        return 0xff52;
        case GDK_KEY_Right:     return 0xff53;
        case GDK_KEY_Down:      return 0xff54;
        case GDK_KEY_F1:        return 0xffbe;
        case GDK_KEY_F2:        return 0xffbf;
        case GDK_KEY_F3:        return 0xffc0;
        case GDK_KEY_F4:        return 0xffc1;
        case GDK_KEY_F5:        return 0xffc2;
        case GDK_KEY_F6:        return 0xffc3;
        case GDK_KEY_F7:        return 0xffc4;
        case GDK_KEY_F8:        return 0xffc5;
        case GDK_KEY_F9:        return 0xffc6;
        case GDK_KEY_F10:       return 0xffc7;
        case GDK_KEY_F11:       return 0xffc8;
        case GDK_KEY_F12:       return 0xffc9;
        case GDK_KEY_Control_L: return 0xffe3;
        case GDK_KEY_Shift_L:   return 0xffe1;
        case GDK_KEY_Alt_L:     return 0xffe9;
        default:                return keyval; 
    }
}

// LibVNCClient-Callback bei Größenänderung des Desktops
static rfbBool update_screen_size(rfbClient* client) {
    int width = client->width;
    int height = client->height;

    printf("[VNC] Bildschirmauflösung geändert: %dx%d\n", width, height);

    if (cairo_surface) {
        cairo_surface_destroy(cairo_surface);
    }

    client->frameBuffer = realloc(client->frameBuffer, width * height * 4);
    
    // Pixelformat für Cairo (GDK_MEMORY_DEFAULT / CAIRO_FORMAT_ARGB32) setzen
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

    // Cairo Surface direkt über das Raw-Array stülpen
    cairo_surface = cairo_image_surface_create_for_data(
//        client->frameBuffer, CAIRO_FORMAT_ARGB32, width, height, width * 4
        client->frameBuffer, CAIRO_FORMAT_RGB24, width, height, width * 4
 
    );

    if (drawing_area) {
        gtk_drawing_area_set_content_width(GTK_DRAWING_AREA(drawing_area), width);
        gtk_drawing_area_set_content_height(GTK_DRAWING_AREA(drawing_area), height);
        gtk_widget_queue_draw(drawing_area);
    }

    return TRUE;
}

// LibVNCClient-Callback bei eintreffenden Pixel-Updates
static void handle_update(rfbClient* client, int x, int y, int w, int h) {
    if (drawing_area) {
        // GTK signalisieren, dass der Bildschirm neu gezeichnet werden muss
        gtk_widget_queue_draw(drawing_area);
    }
printf("handle_update\n");

}

// Render-Funktion für GTK4 DrawingArea
static void draw_func(GtkDrawingArea* area, cairo_t* cr, int width, int height, gpointer data) {
    if (cairo_surface) {
        cairo_set_source_surface(cr, cairo_surface, 0, 0);
        cairo_paint(cr);
    }
printf("draw_func\n");
}

// Regelmäßiges Abfragen der Netzwerk-Sockets im GTK Main Loop (Non-blocking)
static gboolean vnc_loop_step(gpointer data) {
    // Falls das Widget oder das VNC-Objekt gelöscht wurde, Idle-Loop sofort stoppen!
    if (!drawing_area || !GTK_IS_WIDGET(drawing_area) || !vnc_client) {
        return G_SOURCE_REMOVE;
    }

    int fd = vnc_client->sock;
    
    // Sicherstellen, dass die Socket-ID gültig ist
    if (fd < 0) return G_SOURCE_REMOVE;

    // GLib-Struktur für die Socket-Abfrage vorbereiten
    GPollFD pfd;
    pfd.fd = fd;
    pfd.events = G_IO_IN | G_IO_HUP | G_IO_ERR; // Auf Daten, Trennung oder Fehler prüfen
    pfd.revents = 0;

    // g_poll mit einem Timeout von 0 Millisekunden (reines Abfragen ohne Blockieren)
    if (g_poll(&pfd, 1, 0) > 0) {
        // Prüfen, ob wirklich Daten bereitstehen oder ein Fehler vorliegt
        if (pfd.revents & (G_IO_IN | G_IO_HUP | G_IO_ERR)) {
            if (!HandleRFBServerMessage(vnc_client)) {
                printf("VNC: Verbindung vom Server getrennt.\n");
                vnc_client = NULL; // Verhindert weitere Zugriffe
                GtkApplication* app = GTK_APPLICATION(data);
                g_application_quit(G_APPLICATION(app));
                return G_SOURCE_REMOVE;
            }
        }
    }
    return G_SOURCE_CONTINUE;
}


// --- INPUT HANDLERS (GTK4 Event Controllers) ---

static void on_motion(GtkEventControllerMotion* controller, double x, double y, gpointer data) {
    SendPointerEvent(vnc_client, (int)x, (int)y, mouse_mask);
}

static void on_pressed(GtkGestureClick* gesture, int n_press, double x, double y, gpointer data) {
    guint button = gtk_gesture_single_get_current_button(GTK_GESTURE_SINGLE(gesture));
    int button_bit = 0;
    if (button == GDK_BUTTON_PRIMARY)   button_bit = rfbButton1Mask;
    if (button == GDK_BUTTON_MIDDLE)    button_bit = rfbButton2Mask;
    if (button == GDK_BUTTON_SECONDARY) button_bit = rfbButton3Mask;

    mouse_mask |= button_bit;
    SendPointerEvent(vnc_client, (int)x, (int)y, mouse_mask);
}

static void on_released(GtkGestureClick* gesture, int n_press, double x, double y, gpointer data) {
    guint button = gtk_gesture_single_get_current_button(GTK_GESTURE_SINGLE(gesture));
    int button_bit = 0;
    if (button == GDK_BUTTON_PRIMARY)   button_bit = rfbButton1Mask;
    if (button == GDK_BUTTON_MIDDLE)    button_bit = rfbButton2Mask;
    if (button == GDK_BUTTON_SECONDARY) button_bit = rfbButton3Mask;

    mouse_mask &= ~button_bit;
    SendPointerEvent(vnc_client, (int)x, (int)y, mouse_mask);
}

static gboolean on_key_pressed(GtkEventControllerKey* controller, guint keyval, guint keycode, GdkModifierType state, gpointer data) {
    uint32_t vnc_key = gtk_key_to_vnc(keyval);
    SendKeyEvent(vnc_client, vnc_key, TRUE);
    return TRUE;
}

static void on_key_released(GtkEventControllerKey* controller, guint keyval, guint keycode, GdkModifierType state, gpointer data) {
    uint32_t vnc_key = gtk_key_to_vnc(keyval);
    SendKeyEvent(vnc_client, vnc_key, FALSE);
}

// --- APP INITIALISIERUNG ---

static void activate(GtkApplication* app, gpointer user_data) {
    GtkWidget* window = gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), "RetroPC Client (GTK4)");

    drawing_area = gtk_drawing_area_new();
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), draw_func, NULL, NULL);
    gtk_window_set_child(GTK_WINDOW(window), drawing_area);

    // VNC-Initialisierung
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

    // Setze initiale Canvas-Größe basierend auf dem Server-Handshake
    gtk_drawing_area_set_content_width(GTK_DRAWING_AREA(drawing_area), vnc_client->width);
    gtk_drawing_area_set_content_height(GTK_DRAWING_AREA(drawing_area), vnc_client->height);
    SendFramebufferUpdateRequest(vnc_client, 0, 0, vnc_client->width, vnc_client->height, FALSE);

    // --- Event Controller in GTK4 registrieren ---
    
    // Mausbewegung
    GtkEventController* motion_ctrl = gtk_event_controller_motion_new();
    g_signal_connect(motion_ctrl, "motion", G_CALLBACK(on_motion), NULL);
    gtk_widget_add_controller(drawing_area, motion_ctrl);

    // Mausklicks (Pressed / Released)
    GtkGesture* click_gesture = gtk_gesture_click_new();
    gtk_gesture_single_set_button(GTK_GESTURE_SINGLE(click_gesture), 0); // Reagiert auf alle Maustasten
    g_signal_connect(click_gesture, "pressed", G_CALLBACK(on_pressed), NULL);
    g_signal_connect(click_gesture, "released", G_CALLBACK(on_released), NULL);
    gtk_widget_add_controller(drawing_area, GTK_EVENT_CONTROLLER(click_gesture));

    // Tastatur (Muss auf das Fenster angewendet werden)
    GtkEventController* key_ctrl = gtk_event_controller_key_new();
    g_signal_connect(key_ctrl, "key-pressed", G_CALLBACK(on_key_pressed), NULL);
    g_signal_connect(key_ctrl, "key-released", G_CALLBACK(on_key_released), NULL);
    gtk_widget_add_controller(window, key_ctrl);

    // VNC-Netzwerk-Schleife an den GTK Main-Loop hängen
    g_idle_add(vnc_loop_step, app);

    gtk_window_present(GTK_WINDOW(window));
}

int main(int argc, char* argv[]) {
find_active_vnc_port() ;

    GtkApplication* app = gtk_application_new("de.retropc.vncclient", G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, "activate", G_CALLBACK(activate), NULL);
    
    int status = g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

printf("vor bummmmm\n");

   // --- ABSICHERUNG BEIM BEENDEN ---
    
    // 1. Zuerst die globale Widget-Referenz trennen, damit kein Idle-Loop mehr feuert
   drawing_area = NULL;

    // 1. Zuerst die Cairo-Oberfläche zerstören (löst die Verbindung zum Buffer)
    if (cairo_surface) {
        cairo_surface_destroy(cairo_surface);
        cairo_surface = NULL;
    }

    // 2. VNC-Client aufräumen, aber vorher den Buffer-Pointer auf NULL setzen!
    if (vnc_client) {
        vnc_client->frameBuffer = NULL; // Verhindert, dass LibVNC intern free() aufruft
        rfbClientCleanup(vnc_client);
        vnc_client = NULL;
    }

    // 3. Jetzt geben wir den Speicher zu 100% sicher und genau EINMAL frei
//    if (local_framebuffer) {
//        free(local_framebuffer);
//        local_framebuffer = NULL;
//    }

    printf("Programm sauber beendet.\n");
    return status;
}

