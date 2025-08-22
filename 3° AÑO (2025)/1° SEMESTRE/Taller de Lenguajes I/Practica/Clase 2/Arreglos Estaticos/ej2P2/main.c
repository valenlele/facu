#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define DIMF 10

void crearArreglo(float nros[]);

void imprimirArreglo(float nros[]);

float valorPromedioArreglo(float nros[]);

float valorMinimoArreglo(float nros[]);

int posValorMaximo(float nros[]);

int main() {
  float nros[DIMF];
  srand(time(NULL));

  crearArreglo(nros);

  imprimirArreglo(nros);

  printf("\n");

  printf("El promedio de los valores del vector es: %.2f\n", valorPromedioArreglo(nros));

  printf("\n");

  printf("El valor minimo del arreglo es: %.2f\n",valorMinimoArreglo(nros));

  printf("\n");

  printf("La posicion del valor maximo es: %d",posValorMaximo(nros));

  return 0;
}

void crearArreglo(float nros[]) {
  int i;

  for (i=0; i<DIMF; i++) {
    nros[i] = (float) rand()/RAND_MAX*(10-5)+5; //crea vector random de floats con valores entre 0 y 5
  }
}

void imprimirArreglo(float nros[]) {
  int i;

  for (i=0; i<DIMF; i++) {
    printf("Numero en la posicion %d: %.2f \n",i, nros[i]);
  }
}

float valorPromedioArreglo(float nros[]) {
  float suma = 0;
  int i;

  for (i=0; i<DIMF; i++) {
    suma += nros[i];
  }

  return (float) suma/DIMF;
}

float valorMinimoArreglo(float nros[]) {
  float min=999999;
  int i;

  for (i=0; i<DIMF; i++) {
    if (nros[i]<min) min = nros[i];
  }
  return min;
}

int posValorMaximo(float nros[]) {
  int i;
  int numMax = -1;
  int posMax;

  for (i=0; i<DIMF; i++) {
    if (nros[i]>numMax) {
      numMax = nros[i];
      posMax = i;
    }
  }

  return posMax;

}
