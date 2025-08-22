#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void reservarMemoria(int* *, int);

void inicializarArreglo(int*, int);

int calcularMaximo(int*, int);

int main() {

  int n;
  int *arreglo = NULL;

  printf("Ingrese el tamano del arreglo: \n");
  scanf("%d", &n);

  reservarMemoria(&arreglo,n); //paso un puntero del puntero. quiero que se modifique la direccion de memoria donde esta almacenado (quiero pasar de que apunte a NULL a un lugar en memoria donde pueda apuntar a n int's)

  inicializarArreglo(arreglo,n);

  printf("Numeros almacenados: \n");
  for (int i = 0; i < n; i++) {
    printf("%d \n", arreglo[i]);
  }

  printf("El maximo numero almacenado en el arreglo es: %d", calcularMaximo(arreglo,n));

  free(arreglo);

  return 0;
}

void reservarMemoria(int* * arreglo, int n) {
  *arreglo = (int*) malloc(n * sizeof(int));
}

void inicializarArreglo(int* arreglo, int n) {

  srand(time(NULL));

  int i;
  for (i = 0; i < n; i++) {
    arreglo[i] = rand() % (100 + 1 - 0) + 0; //rand() % (max_number + 1 - minimum_number) + minimum_number
  }
}

int calcularMaximo(int* arreglo, int n) {
  int max = -1;
  int i;
  for (i = 0; i < n; i++) {
    if (arreglo[i] > max) max = arreglo[i];
  }
  return max;
}
