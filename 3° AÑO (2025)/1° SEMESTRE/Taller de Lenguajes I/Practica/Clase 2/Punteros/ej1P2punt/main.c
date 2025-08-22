#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define dimF 10

void cargarArreglo(float arreglo[dimF]);

void imprimirArreglo(float arreglo[dimF]);

void operacionesArreglo(float arreglo[], float *prom, float *min, int *maxPos);

int main() {
  srand(time(NULL));
  float arreglo[dimF];
  float prom, min = 99999;
  int maxPos;

  cargarArreglo(arreglo);

  imprimirArreglo(arreglo);

  printf("\n");

  operacionesArreglo(arreglo, &prom, &min, &maxPos);

  printf("El promedio de los valores del arreglo es: %.2f \n", prom);
  printf("El valor minimo del arreglo es: %.2f \n", min);
  printf("La posicion del valor maximo es: %d \n", maxPos);

  return 0;
}

void cargarArreglo(float arreglo[dimF]) {
  int i;

  for (i=0; i<dimF; i++) {
    arreglo[i]=rand();
  }
}

void imprimirArreglo(float arreglo[]) {
  int i;

  for (i=0; i<dimF; i++) {
    printf("Numero en la posicion %d: %.2f \n",i, arreglo[i]);
  }
}

void operacionesArreglo(float arreglo[], float *prom, float *min, int *maxPos) {
  int i;
  float tot = 0, max = -1;

  for (i=0; i<dimF; i++) {
    tot += arreglo[i];
    if (arreglo[i]<*min) *min = arreglo[i];
    if (arreglo[i]>max) {
      max = arreglo[i];
      *maxPos = i;
    }
  }

  *prom = tot/dimF;
}
