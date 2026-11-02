


// gcc main.c -o main

#include <stdio.h>
#include <string.h>
#include <stddef.h>
#include <stdint.h>

typedef struct {
  uint32_t type;
} VTermColor;


typedef struct {
    unsigned int bold      : 1;
    unsigned int underline : 2;
    unsigned int italic    : 1;
    unsigned int blink     : 1;
    unsigned int reverse   : 1;
    unsigned int conceal   : 1;
    unsigned int strike    : 1;
    unsigned int font      : 4; 
    unsigned int dwl       : 1; 
    unsigned int dhl       : 2; 
    unsigned int small     : 1;
    unsigned int baseline  : 2;
} VTermScreenCellAttrs;

typedef struct {
//  uint32_t chars[6];
  char     width;
  VTermScreenCellAttrs attrs;
  int fg, bg;
} VTermScreenCell;



int main() {
    printf("size screen: %zu\n", sizeof(VTermScreenCell));

//    printf("ofs chars: %zu\n", offsetof(VTermScreenCell, chars));
    printf("ofs width: %zu\n", offsetof(VTermScreenCell, width));
    printf("ofs attrs: %zu\n", offsetof(VTermScreenCell, attrs));
    printf("ofs fg:    %zu\n", offsetof(VTermScreenCell, fg));
    printf("ofs bg:    %zu\n", offsetof(VTermScreenCell, bg));

    return 0;
}

