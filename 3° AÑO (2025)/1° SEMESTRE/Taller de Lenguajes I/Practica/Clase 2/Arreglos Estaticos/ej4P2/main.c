#include <stdio.h>
#include <time.h>
#define FIL 3
#define COL 3

void crearMatriz(int matriz[][COL]);

void imprimirMatriz(int matriz[][COL]);

int main() {
  srand(time(NULL));
  int matriz[FIL][COL];
  int matrizTraspuesta[FIL][COL];

  crearMatriz(matriz);

  imprimirMatriz(matriz);

  trasponerMatriz(matriz,matrizTraspuesta);

  printf("\n");

  printf("Matriz traspuesta: \n");

  imprimirMatriz(matrizTraspuesta);

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

void trasponerMatriz(int matriz[][COL], int matrizTraspuesta[][COL]) {
  int i,j;
  for (i=0; i<FIL; i++) {
    for (j=0; j<COL; j++) {
      matrizTraspuesta[i][j]=matriz[j][i];
    }
  }
}
