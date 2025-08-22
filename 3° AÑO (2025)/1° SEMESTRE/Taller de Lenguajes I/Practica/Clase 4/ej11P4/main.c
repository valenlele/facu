#include <stdio.h>
#include <stdlib.h>

int** reservarMemoria(int, int);

void inicializarMatriz(int**, int, int);

void imprimirMatriz(int**, int, int);

void imprimirPosElemMultiplosDe3(int**, int, int);

void liberarMemoria(int**, int);

int main() {
  int n, m;

  printf("Ingrese la cantidad de filas de la matriz: ");
  scanf("%d", &n);
  printf("Ingrese la cantidad de columnas de la matriz: ");
  scanf("%d", &m);

  int** mat;

  mat = reservarMemoria(n, m);

  printf("\n");

  inicializarMatriz(mat, n, m);

  printf("Matriz generada: \n");
  imprimirMatriz(mat, n, m);

  printf("Posiciones de elementos multiplos de 3: ");
  imprimirPosElemMultiplosDe3(mat, n, m);

  liberarMemoria(mat, n);

  return 0;
}

int** reservarMemoria(int fil, int col) {
  int** aux;
  aux = (int**) calloc(fil,sizeof(int*));

  int f;
  for (f = 0; f < fil; f++) {
    aux[f] = (int*) calloc(col,sizeof(int));
  }

  return aux;
}

void inicializarMatriz(int** mat, int fil, int col) {
  int f, c;
  int num;

  printf("Se inicializa la matriz con valores leidos de teclado: \n");
  for (f = 0; f < fil; f++) {
    for (c = 0; c < col; c++) {
      printf("Ingrese el elemento [%d][%d]: ", f+1, c+1);
      scanf("%d", &num);
      mat[f][c] = num;
    }
  }
}

void imprimirMatriz(int** mat, int fil, int col) {
  int f, c;

  for (f = 0; f < fil; f++) {
    for (c = 0; c < col; c++) {
      printf("[%d][%d] = %d ", f+1, c+1, mat[f][c]);
    }
    printf("\n");
  }
}

void imprimirPosElemMultiplosDe3(int** mat, int fil, int col) {
  int f, c;

  for (f = 0; f < fil; f++) {
    for (c = 0; c < col; c++) {
      if (mat[f][c] % 3 == 0) {
        printf("[%d][%d], ", f+1, c+1);
      }
    }
  }
}

void liberarMemoria(int** mat, int fil) {
  int f;
  for (f = 0; f < fil; f++) {
    free(mat[f]);
  }
  free(mat);
}
