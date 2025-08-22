#include <stdio.h>
#include <stdlib.h>

int main() {
  FILE* f;
  int cant = 0;
  char c;

  f = fopen("prueba.txt", "w+");

  if (f == NULL) {
    printf("Error al abrir el archivo");
    return 1;
  }

  printf("Archivo abierto con exito \n");

  fprintf(f, "Hola esto es una prueba \n");
  fprintf(f, "Hola Esto Es Una Prueba \n");
  fprintf(f, "Hola 5oy un numero 345 \n");

  fseek(f, 0, SEEK_SET);

  c = fgetc(f);

  while (!feof(f)) {
    if (((c>='a') && (c<='z')) || ((c>='A') && (c<='Z')) || ((c>='0') && (c<='9'))) cant++;
    c = fgetc(f);
  }

  fclose(f);

  printf("Cantidad de minusculas, mayusculas y digitos: %d", cant);

  return 0;
}
