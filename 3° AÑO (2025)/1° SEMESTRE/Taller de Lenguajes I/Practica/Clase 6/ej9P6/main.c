#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define dimF 1000

#ifndef DEBUG //si debug ya esta definido por la linea de comandos, no entra a este if
#define DEBUG 0
#endif

void inicializarVector(int*);

void imprimirVector(int*);

int posVector(int*, int, int*);

int main() {
  int vec[dimF];
  int num;
  int accesos = 0;

  inicializarVector(vec);

  imprimirVector(vec);

  printf("Ingrese un entero para saber en que posicion del vector se encuentra: \n");
  scanf("%d", &num);

  int pos = posVector(vec, num, &accesos);
  if (pos != -1) printf("El numero %d se encuentra en la posicion %d \n", num, pos);
  else printf("El numero %d no se encuentra en el vector \n", num);

  #if DEBUG
    printf("La cantidad de veces que se debio acceder al arreglo para encontrar el elemento es: %d", accesos);
  #endif

  return 0;
}

void inicializarVector(int* vec) {
  srand(time(NULL));

  int i;
  for (i = 0; i < dimF; i++) {
    *(vec+i) = (float) rand() / RAND_MAX * (1000);
  }
}

void imprimirVector(int* vec) {
  printf("Vector de 1000 enteros al azar: \n");
  int i;
  for (i = 0; i < dimF; i++) {
    printf("v[%d] = %d \n", i + 1, *(vec+i));
  }
}

int posVector(int* vec, int num, int* accesos) {
  int i;
  for (i = 0; i < dimF; i++) {
    (*accesos)++;
    if (vec[i] == num) return i + 1;
  }
  return -1;
}
