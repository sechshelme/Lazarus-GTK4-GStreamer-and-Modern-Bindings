


// gcc main.c -o main `pkg-config --cflags --libs sdl2` -lvncclient
// gcc main.c -o main `pkg-config --cflags --libs sdl2` -lvncclient -lvncserver



#include <stdio.h>
#include <stdlib.h>
#include <SDL2/SDL.h>
#include <rfb/rfbclient.h>

SDL_Window* window = NULL;
SDL_Renderer* renderer = NULL;
SDL_Texture* texture = NULL;

static rfbBool update_screen_size(rfbClient* client) {
    int width = client->width;
    int height = client->height;

    printf("[VNC] Bildschirmauflösung geändert: %dx%d\n", width, height);

    if (texture) SDL_DestroyTexture(texture);

    texture = SDL_CreateTexture(renderer, SDL_PIXELFORMAT_ARGB8888, 
                                 SDL_TEXTUREACCESS_STREAMING, width, height);
    if (!texture) {
        fprintf(stderr, "SDL: Konnte Textur nicht erstellen: %s\n", SDL_GetError());
        return FALSE;
    }

    SDL_SetWindowSize(window, width, height);

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
    if (texture) {
        SDL_UpdateTexture(texture, NULL, client->frameBuffer, client->width * 4);
    }
}

// Hilfsfunktion: Mapping von SDL-Sondertasten zu VNC Keysyms
static uint32_t sdl_key_to_vnc(SDL_Keycode key) {
    switch (key) {
        case SDLK_BACKSPACE: return 0xff08;
        case SDLK_TAB:       return 0xff09;
        case SDLK_RETURN:    return 0xff0d;
        case SDLK_ESCAPE:    return 0xff1b;
        case SDLK_INSERT:    return 0xff63;
        case SDLK_DELETE:    return 0xffff;
        case SDLK_HOME:      return 0xff50;
        case SDLK_END:       return 0xff57;
        case SDLK_PAGEUP:    return 0xff55;
        case SDLK_PAGEDOWN:  return 0xff56;
        case SDLK_LEFT:      return 0xff51;
        case SDLK_UP:        return 0xff52;
        case SDLK_RIGHT:     return 0xff53;
        case SDLK_DOWN:      return 0xff54;
        case SDLK_F1:        return 0xffbe;
        case SDLK_F2:        return 0xffbf;
        case SDLK_F3:        return 0xffc0;
        case SDLK_F4:        return 0xffc1;
        case SDLK_F5:        return 0xffc2;
        case SDLK_F6:        return 0xffc3;
        case SDLK_F7:        return 0xffc4;
        case SDLK_F8:        return 0xffc5;
        case SDLK_F9:        return 0xffc6;
        case SDLK_F10:       return 0xffc7;
        case SDLK_F11:       return 0xffc8;
        case SDLK_F12:       return 0xffc9;
        case SDLK_LCTRL:     return 0xffe3;
        case SDLK_LSHIFT:    return 0xffe1;
        case SDLK_LALT:      return 0xffe9;
        default:             return key; // Normale Zeichen (a-z, 0-9) stimmen überein
    }
}

int main(int argc, char* argv[]) {
    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        fprintf(stderr, "SDL: Initialisierung fehlgeschlagen: %s\n", SDL_GetError());
        return 1;
    }

    window = SDL_CreateWindow("RetroPC Client (SDL2)", SDL_WINDOWPOS_CENTERED, 
                              SDL_WINDOWPOS_CENTERED, 800, 600, SDL_WINDOW_SHOWN);
    if (!window) {
        SDL_Quit();
        return 1;
    }

    renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
    if (!renderer) {
        SDL_DestroyWindow(window);
        SDL_Quit();
        return 1;
    }

    rfbClient* client = rfbGetClient(8, 3, 4);
    client->serverHost = "127.0.0.1";
    client->serverPort = 5901; 
    
    client->MallocFrameBuffer = update_screen_size;
    client->GotFrameBufferUpdate = handle_update;

    printf("Verbinde zu VNC auf %s:%d...\n", client->serverHost, client->serverPort);
    if (!rfbInitClient(client, NULL, NULL)) {
        fprintf(stderr, "VNC: Verbindung fehlgeschlagen!\n");
        SDL_DestroyRenderer(renderer);
        SDL_DestroyWindow(window);
        SDL_Quit();
        return 1;
    }

    SendFramebufferUpdateRequest(client, 0, 0, client->width, client->height, FALSE);

    int running = 1;
    SDL_Event event;
    int mouse_mask = 0; // Speichert den Zustand der Maustasten

    while (running) {
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) {
                running = 0;
            }
            
            // --- MAUS-EINGABE ---
            else if (event.type == SDL_MOUSEMOTION) {
                // HIER: rfbSendPointerEvent -> SendPointerEvent
                SendPointerEvent(client, event.motion.x, event.motion.y, mouse_mask);
            }
            else if (event.type == SDL_MOUSEBUTTONDOWN || event.type == SDL_MOUSEBUTTONUP) {
                int button_bit = 0;
                if (event.button.button == SDL_BUTTON_LEFT)   button_bit = rfbButton1Mask;
                if (event.button.button == SDL_BUTTON_MIDDLE) button_bit = rfbButton2Mask;
                if (event.button.button == SDL_BUTTON_RIGHT)  button_bit = rfbButton3Mask;

                if (event.type == SDL_MOUSEBUTTONDOWN) {
                    mouse_mask |= button_bit; 
                } else {
                    mouse_mask &= ~button_bit; 
                }
                // HIER: rfbSendPointerEvent -> SendPointerEvent
                SendPointerEvent(client, event.button.x, event.button.y, mouse_mask);
            }

            // --- TASTATUR-EINGABE ---
            else if (event.type == SDL_KEYDOWN || event.type == SDL_KEYUP) {
                rfbBool down = (event.type == SDL_KEYDOWN) ? TRUE : FALSE;
                uint32_t vnc_key = sdl_key_to_vnc(event.key.keysym.sym);
                
                // HIER: rfbSendKeyEvent -> SendKeyEvent
                SendKeyEvent(client, vnc_key, down);
            }
        }

        // Netzwerk-Daten holen
        struct timeval tv = {0, 10000}; 
        int fd = client->sock;
        fd_set fds;
        FD_ZERO(&fds);
        FD_SET(fd, &fds);

        if (select(fd + 1, &fds, NULL, NULL, &tv) > 0) {
            if (!HandleRFBServerMessage(client)) {
                printf("VNC: Verbindung vom Server getrennt.\n");
                running = 0;
            }
        }

        SDL_RenderClear(renderer);
        if (texture) {
            SDL_RenderCopy(renderer, texture, NULL, NULL);
        }
        SDL_RenderPresent(renderer);
    }

    if (texture) SDL_DestroyTexture(texture);
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();
    
    printf("Programm sauber beendet.\n");
    return 0;
}

