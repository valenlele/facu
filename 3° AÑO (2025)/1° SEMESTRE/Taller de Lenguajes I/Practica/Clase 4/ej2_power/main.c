#include <stdio.h>
#include <stdlib.h>

int main() {

  float peso;
  float* vecPesos;
  int cant = 10;
  int i = 0;

  vecPesos = (float*) malloc(10*(sizeof(float)));

  do {

    printf("Ingrese el peso de una persona: ");
    scanf("%f", &peso);

    if ((peso <= 0) || (peso > 250)) break;

    if (i == cant) {
      cant += 10;
      vecPesos = (float*) realloc(vecPesos,(cant)*sizeof(float));
    }

    vecPesos[i] = peso;
    i++;

  } while ((peso > 0) && (peso<=250));

  printf("Pesos del vectos: \n");
  for (int j = 0; j < i; j++) {
    printf("Peso %d: %.1f \n", j+1, vecPesos[j]);
  }

  free(vecPesos);

  return 0;
}
