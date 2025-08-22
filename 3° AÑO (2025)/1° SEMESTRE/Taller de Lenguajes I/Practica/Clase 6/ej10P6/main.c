#include <stdio.h>
#include <stdlib.h>
#include "imath.h"

int main() {
  int num;

  printf("Se ingresan numeros enteros hasta ingresar el 0: \n");
  printf("Ingrese un numero: ");
  scanf("%d", &num);
  while (num != 0) {

    if (par(num)) {
      printf("El cuadrado de %d es: %d \n", num, cuadrado(num));
      printf("El cubo de %d es: %d \n", num, cubo(num));
    }
    else {
      printf("El factorial de %d es: %d \n", num, factorial(num));
    }

    printf("Ingrese un numero: ");
    scanf("%d", &num);
  }

  return 0;
}
