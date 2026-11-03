


// gcc main.c -o main

#include <stdio.h>
#include <string.h>
#include <stddef.h>
#include <stdint.h>

typedef struct {
    int bit1      : 1;
    int bit2      : 1;
} BitRec;

typedef struct {
  char     c;
  BitRec   bitrec;
  int      i;
} Rec;

int main() {
    printf("ofs c:      %zu\n", offsetof(Rec, c));         // -> 0
    printf("ofs bitrec: %zu\n", offsetof(Rec, bitrec));    // -> 4
    printf("ofs i:      %zu\n", offsetof(Rec, i));         // -> 8

    return 0;
}

