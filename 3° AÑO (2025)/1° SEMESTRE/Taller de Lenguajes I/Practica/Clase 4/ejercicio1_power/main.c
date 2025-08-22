#include <stdio.h>
#include <stdlib.h>

void imprimirVector(int [], int);

int main() {

  int cant;
  int* pi;
  int i;
  int num;

  printf("Ingrese la cantidad de elementos a ingresar en el vector: ");
  scanf("%d", &cant);

  pi = (int*) malloc(cant*sizeof(int));

  printf("Se ingresan %d numeros en el vector: \n", cant);
  for (i = 0; i < cant; i++) {
    scanf("%d", &num);
    pi[i] = num;
  }

  imprimirVector(pi, cant);

  free(pi);

  return 0;
}

void imprimirVector(int vec[], int cant) {
  int i;
  for (i = 0; i < cant; i++) {
    printf("Elemento %d del vector: %d \n", i+1, vec[i]);
  }
}
