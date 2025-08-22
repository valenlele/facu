#include <stdio.h>
#include <stdlib.h>

int main() {
  FILE* arch1;
  FILE* arch2;

  arch1 = fopen("Lectura1.txt", "r");
  arch2 = fopen("Lectura2.txt", "r");

  if (!arch1) {
    printf("Error al abrir archivo1");
    return -1;
  }
  if (!arch2) {
    printf("Error al abrir archivo2");
    return -1;
  }

  int linea = 1;
  int columna = 1;
  char c1 = fgetc(arch1);
  char c2 = fgetc(arch2);

  while ((!feof(arch1)) && (!feof(arch2)) && (c1 == c2)) {
    c1 = fgetc(arch1);
    c2 = fgetc(arch2);
    if ((c1 == '\n') || (c2 == '\n')) {
      linea++;
      columna = 1;
    }
    else {
      columna++;
    }
  }

  if ((!feof(arch1)) || (!feof(arch2))) {
    printf("Ubicacion primer caracter diferente. Linea %d Columna %d: ", linea, columna);
  }
  else {
    printf("Los archivos tienen el mismo contenido");
  }

  fclose(arch1);
  fclose(arch2);

  return 0;
}
//abrir lectura1 y lectura 2
//verificar que se abrieron

//comparar con fgetc() si son iguales


//cerrar archivos
