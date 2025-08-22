#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define dimF 5
#define rangoRand 20

void cargarVector(int vecNumeros[]);

void imprimirVector(int vecNumeros[]);

void swap(int *a, int *b);

void invertirVector(int vecNumeros[]);

int main() {
  srand(time(NULL));
  int vecNumeros[dimF];

  cargarVector(vecNumeros);

  printf("Vector generado: \n");
  imprimirVector(vecNumeros);

  invertirVector(vecNumeros);

  printf("Vector invertido: \n");
  imprimirVector(vecNumeros);

  return 0;
}

void cargarVector(int vecNumeros[]) {
  int i;
  for (i=0; i<dimF; i++) {
    vecNumeros[i] = rand();
  }
}

void imprimirVector(int vecNumeros[]) {
  int i;
  for (i=0; i<dimF; i++) {
    printf("[%d] = %d \n", i+1, vecNumeros[i]);
  }
}

void swap(int *a, int *b) {
  int tmp;

  tmp = *a; // guarda el valor de a
  *a = *b;   // almacena b en a
  *b = tmp; // almacena a en b
}

void invertirVector(int vecNumeros[]) {
  int *i;
  int *j;
  //i = vec;
  i = &vecNumeros[0];

  //j = vec + dimF-1;
  j = &vecNumeros[dimF-1];

  while (i < j) {
    swap(i,j);
    i++;
    j--;
  }
}
