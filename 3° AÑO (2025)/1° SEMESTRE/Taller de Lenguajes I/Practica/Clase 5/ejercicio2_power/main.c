#include <stdio.h>
#include <stdlib.h>

int main() {
  FILE* arch;

  arch = fopen("prueba.txt", "w");

  if (arch == NULL) {
    printf("Error al abrir el archivo \n");
    return -1;
  }

  printf("El archivo esta abierto para escritura \n");

  fprintf(arch, "Prueba de archivo \n");
  fprintf(arch, "buenos dias");
  fclose(arch);

  arch = fopen("prueba.txt", "r");

  if (arch == NULL) {
    printf("Error al abrir el archivo \n");
    return -1;
  }

  printf("El archivo esta abierto para lectura. Contenido: \n");

  printf("%c", fgetc(arch));
  while (!feof(arch)) {
    printf("%c", fgetc(arch));
  }

  printf("\n");

  fclose(arch);
  printf("El archivo esta cerrado");

  return 0;
}
