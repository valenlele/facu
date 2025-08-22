#include <stdio.h>
#include <stdlib.h>

int main() {
  FILE* arch;
  char linea[256];

  arch = fopen("Lectura1.txt", "r");
  if (arch == NULL) printf("Error al abrir el archivo");
  else {
    fgets(linea, 10, arch);   //lee 10 caracteres de arch y los copia a linea
    while (!feof(arch)) {
      fputs(linea, stdout);   //imprime el contenido de linea
      fgets(linea, 10, arch); //lee otros 10 caracteres de arch y los copia en linea
    }
    fclose(arch);
  }

  //printf("%s", linea);

  return 0;
}
