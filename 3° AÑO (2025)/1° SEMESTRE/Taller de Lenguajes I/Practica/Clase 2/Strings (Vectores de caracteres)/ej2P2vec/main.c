#include <stdio.h>
#include <stdlib.h>
#define dimF 50
#define fin "XXX"

int main() {
  char palabra[dimF];
  int cantPalabras_o = 0;

  printf("Se ingresan palabras hasta ingresar XXX: \n");

  scanf("%s", palabra);
  while (strcmp(palabra,fin)) {
    if (palabra[strlen(palabra)-1] == 'o') cantPalabras_o++;
    scanf("%s", palabra);
  }

  printf("Cantidad de palabras que terminan en 'o': %d", cantPalabras_o);

  return 0;
}
