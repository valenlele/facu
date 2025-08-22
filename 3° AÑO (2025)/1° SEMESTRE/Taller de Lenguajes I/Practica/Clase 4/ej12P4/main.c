#include <stdio.h>
#include <stdlib.h>

void* reservarMemoria(int, int);

void inicializarMatriz(int*, int , int);

void imprimirMatriz(int*, int, int);

void imprimirPosMultiplosDe3(int*, int, int);

void liberarMemoria(int**);

int main() {
  int n, m;

  int* mat;

  printf("Ingrese la cantidad de filas de la matriz: ");
  scanf("%d", &n);
  printf("Ingrese la cantidad de columnas de la matriz: ");
  scanf("%d", &m);

  mat = reservarMemoria(n, m);

  printf("\n");

  printf("Se inicializa la matriz: \n");

  inicializarMatriz(mat, n, m);

  printf("\n");

  printf("Matriz generada: \n");
  imprimirMatriz(mat, n, m);

  printf("Posiciones de elementos multiplos de 3: \n");
  imprimirPosMultiplosDe3(mat, n, m);

  liberarMemoria(&mat); //creo que no funciona liberar memoria haciendolo como funcion

  /*printf("%d \n", mat[1*m + 1]);

  printf("%d \n", mat[2*m + 1]);*/

  return 0;
}

void* reservarMemoria(int n, int m) {
  void* aux;

  aux = (int*) malloc(n*m*sizeof(int)); //es necesario el caste0??

  return aux;
}

void inicializarMatriz(int* mat, int n, int m) {
  int i, j, num;

  for (i = 0; i < n; i++) {
    for (j = 0; j < m; j++) {
      printf("Ingrese el elemento en la pos [%d][%d]: ", i+1, j+1);
      scanf("%d", &num);
      mat[i*m + j] = num;
    }
  }

  /*for (i = 0; i < n*m; i++) {
    printf("Ingrese el elemento en la pos %d: ", n*m);
    scanf("%d", &num);
    mat[i] = num;
  }*/
}

void imprimirMatriz(int* mat, int n, int m) {
  int i, j;

  for (i = 0; i < n; i++) {
    for (j = 0; j < m; j++) {
      printf("Elemento en la pos [%d][%d]: %d \n", i+1, j+1, mat[i*m + j]);
    }
  }
}

void imprimirPosMultiplosDe3(int* mat, int n, int m) {
  int i, j;

  for (i = 0; i < n; i++) {
    for (j = 0; j < m; j++) {
      if (mat[i*m + j] % 3 == 0) {
        printf("[%d][%d] \n", i+1, j+1);
      }
    }
  }
}

void liberarMemoria(int** mat) {
  free(&mat);
}
