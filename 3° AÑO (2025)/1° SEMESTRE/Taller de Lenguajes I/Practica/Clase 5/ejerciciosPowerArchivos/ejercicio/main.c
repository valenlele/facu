#include <stdio.h>
#include <stdlib.h>

int main() {
  FILE* arch;
  arch = fopen("prueba.txt", "r");

  if (!arch) {
    printf("Error al abrir el archivo");
    return -1;
  }

  char c = fgetc(arch);
  printf("%c", c);
  while (!feof(arch)) {
    char c = fgetc(arch);
    printf("%c", c);
  }

  fclose(arch);

  return 0;
}
