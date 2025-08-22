#include <stdio.h>
#include <stdlib.h>

void imprimirElemVector(int*, int);

int main() {
  int dimL;
  int num;

  printf("Ingrese la cantidad de numeros a leer: ");
  scanf("%d", &dimL);
  int v[dimL];

  int i;
  for (i = 0; i < dimL; i++) {
    printf("Ingrese un numero: ");
    scanf("%d", &num);
    v[i] = num;
  }

  imprimirElemVector(v, dimL);
}

void imprimirElemVector(int* v, int dimL) {
  int i;
  for (i = 0; i < dimL; i++) {
    printf("v[%d] = %d \n", i + 1, v[i]);
  }
}
