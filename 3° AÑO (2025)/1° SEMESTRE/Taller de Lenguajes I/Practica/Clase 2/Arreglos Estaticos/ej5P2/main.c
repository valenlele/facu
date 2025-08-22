#include <stdio.h>
#include <time.h>
#define FIL 3
#define COL 3

void crearMatriz(int matriz[][COL]);

void imprimirMatriz(int matriz[][COL]);

void sumarMatrices(int matrizA[][COL], int matrizB[][COL], int matrizC[][COL]);

int main() {
  srand(time(NULL));
  int matrizA[FIL][COL];
  int matrizB[FIL][COL];
  int matrizC[FIL][COL];

  crearMatriz(matrizA);
  crearMatriz(matrizB);

  printf("Matriz A: \n");
  imprimirMatriz(matrizA);

  printf("Matriz B: \n");
  imprimirMatriz(matrizB);

  sumarMatrices(matrizA,matrizB,matrizC);

  printf("La suma de la matriz A y B es: \n");

  imprimirMatriz(matrizC);

  return 0;
}

void crearMatriz(int matriz[][COL]) {
  int i,j;

  for (i=0; i<FIL; i++)
    for (j=0; j<COL; j++)
      matriz[i][j] = rand();
}

void imprimirMatriz(int matriz[][COL]) {
  int i,j;

  for (i=0; i<FIL; i++) {
    for (j=0; j<COL; j++) {
      printf("[%d][%d]: %d ", i, j, matriz[i][j]);
    }
    printf("\n");
  }
}

void sumarMatrices(int matrizA[][COL], int matrizB[][COL], int matrizC[][COL]) {
  int i,j;

  for (i=0; i<FIL; i++) {
    for (j=0; j<COL; j++) {
      matrizC[i][j]=matrizA[i][j] + matrizB[i][j];
    }
  }
}
