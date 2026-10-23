


// gcc main.c -o main `pkg-config --cflags --libs sdl2` -lvncclient -lvncserver

// virt-viewer --connect vnc://127.0.0.1:5901

// remote-viewer vnc://127.0.0.1:5901

#include <zlib.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <rfb/rfb.h>
#include <rfb/rfbclient.h>

int main(int argc, char* argv[]) {

printf("gz_header %ld\n", sizeof(gz_header));   // 80
//printf("MUTEX(tlsRwMutex) %ld\n", sizeof(MUTEX(tlsRwMutex)));
printf("pthread_mutex_t size: %ld\n", sizeof(pthread_mutex_t));  // 40
printf("\n");

   printf("rfbClient size: %zu\n", sizeof(rfbClient));   // 360032


    return 0;
}

