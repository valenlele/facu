#include <stdio.h>
#include <stdlib.h>

int main() {
  FILE* f;
  char c;
  int mm, dia = 1, max_mm = -1, max_dia;

  f = fopen("precipitaciones.txt", "r");

  if (f == NULL) {
    printf("Error al abrir el archivo \n");
    return 1;
  }
  printf("Archivo abierto con exito \n");

  fscanf(f, "%d-", &mm);
  while (!feof(f)) {
    printf("Dia %d: %d \n", dia, mm);
    if (mm > max_mm) {
      max_mm = mm;
      max_dia = dia;
    }
    fscanf(f, "%d-", &mm);
    dia++;
  }

  if (!fclose(f)) {
    printf("Archivo cerrado con exito \n");
  }
  else printf("Error al cerrar el archivo \n");

  printf("El dia con mayor precipitacion fue: %d", max_dia);

  return 0;
}
