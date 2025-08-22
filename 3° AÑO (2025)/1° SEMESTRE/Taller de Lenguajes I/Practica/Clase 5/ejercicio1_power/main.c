#include <stdio.h>
#include <stdlib.h>

int main() {

  FILE* arch;

  char carac[20];

  arch = fopen("prueba.txt", "w");

  if (arch == NULL) {
    printf("Error al abrir el archivo \n");
    return 1;
  }

  printf("El archivo esta abierto \n");

  printf("Ingrese caracteres para agregar al final del archivo: ");
  scanf("%s", carac);
  while (strcmp(carac, "FIN")) {
    fprintf(arch, carac);
    printf("Ingrese caracteres para agregar al final del archivo: ");
    scanf("%s", carac);
  }

  fclose(arch);
  printf("El archivo esta cerrado");

  return 0;
}
