#include <stdio.h>
#include <stdlib.h>
#define fin "FIN"

int main() {

  char palabra[20];
  int min = 99999;
  char minPalabra[20];

  printf("Ingrese una palabra: \n");
  scanf("%s", palabra);
  while (strcmp(palabra,fin)) {
    if (strlen(palabra) < min) {
      min = strlen(palabra);
      strcpy(minPalabra,palabra);
    }
    printf("Ingrese una palabra: \n");
    scanf("%s", palabra);
  }

  printf("La palabra de menor longitud es: %s", minPalabra);

  return 0;
}
