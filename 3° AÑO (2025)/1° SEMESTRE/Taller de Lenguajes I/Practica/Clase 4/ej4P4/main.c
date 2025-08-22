#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void reservarMemoria(float* *, int);

void inicializarArreglo(float*, int);

int calcularPromedio(float*, int);

int main() {

  int n;
  float *arreglo = NULL;

  printf("Ingrese el tamano del arreglo: \n");
  scanf("%d", &n);

  reservarMemoria(&arreglo,n); //paso un puntero del puntero. quiero que se modifique la direccion de memoria donde esta almacenado (quiero pasar de que apunte a NULL a un lugar en memoria donde pueda apuntar a n int's)

  inicializarArreglo(arreglo,n);

  printf("Numeros almacenados: \n");
  for (int i = 0; i < n; i++) {
    printf("%.1f \n", arreglo[i]);
  }

  printf("El promedio de los numeros almacenados en el arreglo es: %d", calcularPromedio(arreglo,n));

  free(arreglo);

  return 0;
}

void reservarMemoria(float* * arreglo, int n) {
  *arreglo = (float*) malloc(n * sizeof(float));
}

void inicializarArreglo(float* arreglo, int n) {
  float num;

  int i;
  printf("Se ingresan %d numeros: \n", n);
  for (i = 0; i < n; i++) {
    scanf("%f", &num);
    arreglo[i] = num;
  }
}

int calcularPromedio(float* arreglo, int n) {
  float sumaNum = 0;

  int i;
  for (i = 0; i < n; i++) {
    sumaNum += arreglo[i];
  }

  return (float) sumaNum / n;
}
