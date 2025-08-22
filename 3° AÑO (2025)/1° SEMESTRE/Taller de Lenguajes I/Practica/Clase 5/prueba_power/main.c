#include <stdio.h>

int main() {
  FILE * arch;

  arch = fopen ("pruebaA.txt", "w");

  if (arch == NULL) {
    fprintf (stdout, "Error al abrir el archivo!\n");
    return 1;
  }
  fprintf (stdout, "El archivo está abierto\n");

  fprintf (arch, "Este es mi primer archivo \n");
  fprintf (arch, "creado desde un programa C.") ;

  fclose (arch) ;
  fprintf (stdout, "El archivo esta cerrado\n");

  return 0;
}
