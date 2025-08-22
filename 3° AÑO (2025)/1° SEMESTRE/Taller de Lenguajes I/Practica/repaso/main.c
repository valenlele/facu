#include <stdio.h>
#include <stdlib.h>

void sumaColumnas(const int * const, int, int, int * const);

void mostrar(const int [], int);

int main() {
  enum {N=3, M=2}
  int Mat[N][M] = {10,20,30,40,50,60};
  int sumas[M] = {0};

  sumaColumnas(Mat, N, M, sumas);
  mostrar(sumas, M);

  return 0;
}

void sumaColumnas(const int * const Mat, int N, int M, int * const sumas) {
  int i,j;

  for (i = 0; i < M; i++) {
    for (j = 0; j < N; j++) {
      sumas[i] += Mat[j * M + i]; //como paso la matriz como un puntero, tengo que hacer yo el calculo de la posicion
    }
  }
}

void mostrar(const int sumas[], int M) {
  int i;

  for (i = 0; i < M; i++) {
    printf("%d ", sumas[i]);
  }
}
