#include <stdio.h>
#include <stdlib.h>

typedef struct {
  unsigned int Red : 8;
  unsigned int Green : 8;
  unsigned int Blue : 8;
} RGB24;

typedef struct {
  unsigned int Red : 5;
  unsigned int Green : 6;
  unsigned int Blue : 5;
} RGB16;

void escalar24_16(RGB24);

void escalar16_24(RGB16);

int main() {

  RGB24 rgb24;
  RGB16 rgb16;

  escalar24_16(rgb24);

  escalar16_24(rgb16);

  return 0;
}

void escalar24_16(RGB24 rgb24) {
  RGB16 aux;

  aux.Red =  rgb24.Red * 31 / 255;
  aux.Green =  rgb24.Green * 63 / 255;
  aux.Blue =  rgb24.Blue * 31 / 255;
}

void escalar16_24(RGB16 rgb16) {
  RGB24 aux;

  aux.Red = rgb16.Red * 255 / 31;
  aux.Green = rgb16.Green * 255 / 63;
  aux.Blue = rgb16.Blue * 255 / 31;

}
