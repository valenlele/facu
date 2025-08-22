#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int** reservarMemoria(int);

int main() {
  srand(time(NULL));
  int n;
  printf("Ingrese el orden de la matriz triangular inferior: ");
  scanf("%d", &n);

  printf("\n");

  int** m = reservarMemoria(n);
  printf("Memoria reservada para matriz triangular inferior de %dx%d \n\n", n, n);

  printf("Se inicializa la matriz con numeros aleatorios.\n\n");
  inicializar(m, n);

  printf("Matriz generada: \n");
  imprimir(m, n);

  liberarMemoria(m, n);

  return 0;
}

int** reservarMemoria(int n) {
  int** aux = (int**) calloc(n, sizeof(int*));

  int i;
  for (i = 0; i < n; i++) {
    aux[i] = (int*) calloc(i + 1, sizeof(int));
  }

  return aux;
}

void inicializar(int** m, int n) {
  int f, c;
  for (f = 0; f < n; f++) {
    for (c = 0; c < f + 1; c++) {
      m[f][c] = rand() % 20;
    }
  }
}

void imprimir(int** m, int n) {
  int f, c, ceros;
  for (f = 0; f < n; f++) {
    for (c = 0; c < f + 1; c++) {
      printf("%d \t", m[f][c]);
    }
    for (ceros = c; ceros < n; ceros++) {
      printf("0 \t");
    }
    printf("\n");
  }
}

void liberarMemoria(int** m, int n) {
  int i;
  for (i = 0; i < n; i++) {
    free(m[i]);
  }
  free(m);
}
