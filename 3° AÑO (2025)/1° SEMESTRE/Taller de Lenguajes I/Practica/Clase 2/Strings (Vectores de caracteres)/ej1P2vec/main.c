#include <stdio.h>
#include <stdlib.h>
#define dimF 50
#define fin "ZZZ"

int main() {
  char palabra[50];
  int cantPalabras5 = 0;

  printf("Se ingresan palabras hasta ingresar ZZZ: \n");

  scanf("%s", palabra);
  while (strcmp(palabra,fin)) {
    if (strlen(palabra) == 5) cantPalabras5++;
    scanf("%s", palabra);
  }

  printf("Cantidad de palabras de longitud 5: %d", cantPalabras5);

  return 0;
}
