#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define AREA_CIRCULO(r) (3.141592654*(r)*(r))

int main() {
  srand(time(NULL));

  printf("Se generan aleatoriamente 10 valores de radios de circulos para calcular su area: \n");
  float r;
  float rMax = 10, rMin = 0.5;

  int i;
  for (i = 0; i < 10; i++) {
    r = (float) rand() / RAND_MAX *(rMax - rMin);
    printf("Area de circulo con radio %.2f: %.2f \n", r, AREA_CIRCULO(r));
  }

  return 0;
}
