#include <stdio.h>
#include <stdlib.h>
#define dimF 10

void strcopy(char*, char*);

int main() {

  char cadena1[dimF];
  char cadena2[dimF];

  printf("Se ingresa la primera cadena: ");
  scanf("%s", cadena1);

  printf("Se ingresa la segunda cadena: ");
  scanf("%s", cadena2);

  strcopy(cadena1,cadena2);

  printf("Primera cadena copiada en la segunda: %s", cadena1);

  return 0;
}

void strcopy(char *cadena1, char *cadena2) {
  int i = 0;

  while (cadena2[i] != '\0') {
    cadena1[i] = cadena2[i];
    i++;
  }

  cadena1[i] = '\0';
}
