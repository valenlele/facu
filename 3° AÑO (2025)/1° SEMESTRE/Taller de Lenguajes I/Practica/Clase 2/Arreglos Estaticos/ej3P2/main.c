#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define FIL 3
#define COL 3

void crearMatriz(int matriz[][COL]);

void imprimirMatriz(int matriz[][COL]);

void escalarMatriz(int matriz[][COL], int c);

int main() {
  int matriz[FIL][COL];
  int c;
  srand(time(NULL));

  crearMatriz(matriz);

  imprimirMatriz(matriz);

  printf("Se ingresa un numero por el que multiplica la matriz: \n");
  scanf("%d", &c);

  escalarMatriz(matriz,c);

  printf("La matriz escalada es: \n");

  imprimirMatriz(matriz);

  return 0;
}

void crearMatriz(int matriz[][COL]) {
  int i,j;

  for (i=0; i<COL; i++)
    for (j=0; j<FIL; j++)
      matriz[j][i] = rand();
}

void imprimirMatriz(int matriz[][COL]) {
  int i,j;

  for (i=0; i<COL; i++) {
    for (j=0; j<FIL; j++) {
      printf("Numero pos %d %d: %d \n", j, i, matriz[j][i]);
    }
  }
}

void escalarMatriz(int matriz[][COL], int c) {
  int i,j;

  for (i=0; i<COL; i++) {
    for (j=0; j<FIL; j++) {
      matriz[j][i] *= c;
    }
  }
}
