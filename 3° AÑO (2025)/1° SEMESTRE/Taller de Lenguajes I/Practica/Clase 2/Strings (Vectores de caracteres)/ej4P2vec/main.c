#include <stdio.h>
#include <stdlib.h>
#define dimF 10

int strlen(char*);

int main() {
  char cadenaCar[dimF];

  scanf("%s", cadenaCar);

  printf("Cadena de caracteres generada: %s \n",cadenaCar);

  printf("La longitud del string es: %d", strlen(cadenaCar));

  return 0;
}

int strlen(char *cadenaCar) {
  int cantCar = 0;
  int i = 0;

  while (cadenaCar[i] != '\0') {
    cantCar++;
    i++;
  }

  return cantCar;
}
