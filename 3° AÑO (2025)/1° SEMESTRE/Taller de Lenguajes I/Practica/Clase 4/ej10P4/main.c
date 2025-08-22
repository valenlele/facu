#include <stdio.h>
#include <stdlib.h>

void reservarMemoria(double**, int);

void inicializarArreglo(double[], int);

void inicializarArregloPunt(double[], int);

void imprimirArreglo(double*, int);

void imprimirPromedioArreglo(double[], int);

void imprimirPromedioArregloPunt(double[], int);

void liberarMemoria(double[]);

int main() {
  int n;
  double *arreglo = NULL;

  printf("Ingrese un entero n para reservar memoria dinamica para n elementos double: ");
  scanf("%d", &n);

  reservarMemoria(&arreglo, n);

  printf("Se ingresan numeros: \n");
  //inicializarArreglo(arreglo, n);
  inicializarArregloPunt(arreglo, n);

  printf("Arreglo generado: \n");
  imprimirArreglo(arreglo, n);

  //imprimirPromedioArreglo(arreglo, n);
  imprimirPromedioArregloPunt(arreglo, n);

  liberarMemoria(arreglo);

  return 0;
}

void reservarMemoria(double** arreglo, int n) {
  *arreglo = (double*) calloc(n,sizeof(double));
}

void inicializarArreglo(double arreglo[], int n) {
  double num;

  int i;
  for (i = 0; i < n; i++) {
    printf("Ingrese un numero: ");
    scanf("%lf", &num);
    arreglo[i] = num;
  }
}

void inicializarArregloPunt(double arreglo[], int n) {
  double num;

  int i;
  for (i = 0; i < n; i++) {
    printf("Ingrese un numero: ");
    scanf("%lf", &num);
    *(arreglo+i) = num;
  }
}

void imprimirArreglo(double* arreglo, int n) {
  int i;
  for (i = 0; i < n; i++) {
    printf("%.1lf \n", arreglo[i]);
  }
}

void imprimirPromedioArreglo(double arreglo[], int n) {
  double tot = 0;

  int i;
  for (i = 0; i < n; i++) {
    tot += arreglo[i];
  }
  printf("El promedio del arreglo es: %.1lf", tot/n);
}

void imprimirPromedioArregloPunt(double arreglo[], int n) {
  double tot = 0;

  int i;
  for (i = 0; i < n; i++) {
    tot += *(arreglo+i);
  }
  printf("El promedio del arreglo es: %.1lf", tot/n);
}

void liberarMemoria(double arreglo[]) {
  free(arreglo);
}
