#include <stdio.h>
#include <stdlib.h>

int main() {
  float* vPesos = (float*) calloc(10, sizeof(float));
  float peso;
  int cant = 10;
  int i = 0;

  printf("Se ingresa el peso de una persona: ");
  scanf("%f", &peso);
  while ((peso > 0) && (peso <= 250)) {

    while ((peso > 0) && (peso <= 250) && (i != cant)) {
      vPesos[i] = peso;
      printf("Se ingresa el peso de una persona: ");
      scanf("%f", &peso);
      i++;
    }

    if (i == cant) {
      cant+=10;
      vPesos = (float*) realloc(vPesos, cant*sizeof(float));
    }

  }

  int j = 0;
  while (j < i) {
    printf("v[%d] = %.2f \n", j + 1, vPesos[j]);
    j++;
  }

  return 0;
}
