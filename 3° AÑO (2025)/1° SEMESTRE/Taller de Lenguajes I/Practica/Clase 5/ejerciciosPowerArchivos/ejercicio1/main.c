#include <stdio.h>
#include <stdlib.h>
#define fin "FIN"

int main() {
  FILE* arch;
  arch = fopen("prueba.txt", "a");

  if (!arch) {
    printf("Error al abrir el archivo");
    return -1;
  }
  char palabra[30];

  printf("Se ingresan palabras para insertar al final del archivo: \n");
  scanf("%s", palabra);
  while (strcmp(palabra, fin)) {
    fprintf(arch, palabra);
    printf("Se ingresan palabras para insertar al final del archivo: \n");
    scanf("%s", palabra);
  }

  fclose(arch);

  return 0;
}

  //abrir archivo prueba txt con a
  //verificar que se abrio

  //escribir palabras hasta ingresar FIN
  //ingresarlas en el archivo

  //cerrarlo
