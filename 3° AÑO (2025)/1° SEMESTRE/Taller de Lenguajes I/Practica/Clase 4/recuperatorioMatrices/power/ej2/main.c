#include <stdio.h>
#include <stdlib.h>

void cargarMatrizBloque(int*, int, int);

void mostrarMatrizBloque(int*, int, int);

void imprimirValoresSumasFilasMatrizBloques(int*, int, int);

int** reservarMemoriaMatrizVectorPunteros(int, int);

void cargarMatrizVectorPunteros(int**, int, int);

int main() {
  int N, M;
  printf("Ingrese la cantidad de filas: ");
  scanf("%d", &N);
  printf("Ingrese la cantidad de columnas: ");
  scanf("%d", &M);

  //como bloque homogeneo
  /*int* m = (int*) malloc(N*M*sizeof(int));
  cargarMatrizBloque(m, N, M); //no necesito pasarlo como &m porque estaria modificando la direccion de memoria donde esta almacenada m.
                               //m ya es un puntero, solo necesito modificar su contenido
  mostrarMatrizBloque(m, N, M);
  imprimirValoresSumasFilasMatrizBloques(m, N, M);
  free(m);*/

  //como vector de punteros a filas
  int** mat = reservarMemoriaMatrizVectorPunteros(N, M);
  cargarMatrizVectorPunteros(mat, N, M);
  mostrarMatrizVectorPunteros(mat, N, M);
  imprimirValoresSumasFilasMatrizVectorPunteros(mat, N, M);
  liberarMemoria(mat, N, M);

  return 0;
}

void cargarMatrizBloque(int* m, int fil, int col) {
  int i;
  printf("Ingrese valores: \n");
  for (i = 0; i < fil*col; i++) {
    scanf("%d", &m[i]);
  }
}

void mostrarMatrizBloque(int* m, int fil, int col) {
  int f, c;
  printf("Se muestra la matriz: \n");
  for (f = 0; f < fil; f++) {
    for (c = 0; c < col; c++) {
      printf("M[%d][%d] = %d \t", f + 1, c + 1, m[(f * col) + c]);
    }
    printf("\n");
  }
}

void imprimirValoresSumasFilasMatrizBloques(int* m, int fil, int col) {
  int f, c, sumFila;
  for (f = 0; f < fil; f++) {
    sumFila = 0;
    for (c = 0; c < col; c++) {
      sumFila += m[(f * col) + c];
    }
    printf("Suma valores fila %d: %d \n", f + 1, sumFila);
  }
}

int** reservarMemoriaMatrizVectorPunteros(int fil, int col) {
  int** aux = (int**) calloc(fil, sizeof(int*));
  int i;
  for (i = 0; i < fil; i++) {
    aux[i] = (int*) calloc(col, sizeof(int));
  }

  return aux;
}

void cargarMatrizVectorPunteros(int** mat, int fil, int col) {
  int f, c;
  printf("Se carga la matriz: \n");
  for (f = 0; f < fil; f++) {
    for (c = 0; c < col; c++) {
      scanf("%d", &mat[f][c]);
    }
  }
}

void mostrarMatrizVectorPunteros(int** mat, int fil, int col) {
  int f, c;
  printf("Matriz cargada: \n");
  for (f = 0; f < fil; f++) {
    for (c = 0; c < col; c++) {
      printf("M[%d][%d] = %d \t", f + 1, c + 1, mat[f][c]);
    }
    printf("\n");
  }
}

void imprimirValoresSumasFilasMatrizVectorPunteros(int** mat, int fil, int col) {
  int f, c;
  int sumFila;
  for (f = 0; f < fil; f++) {
    sumFila = 0;
    for (c = 0; c < col; c++) {
      sumFila += mat[f][c];
    }
    printf("Suma valores fila %d: %d \n", f + 1, sumFila);
  }
}

void liberarMemoria(int** mat, int fil, int col) {
  int i;
  for (i = 0; i < fil; i++) {
    free(mat[i]);
  }
  free(mat);
}
