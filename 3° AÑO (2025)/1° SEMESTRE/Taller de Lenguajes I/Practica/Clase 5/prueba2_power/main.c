#include <stdio.h>
int main() {
  FILE *arch;

  char nombre [10] = "datos.txt";

  unsigned int i;
  arch = fopen( nombre, "w" ) ;

  if( !arch ) {
    printf( "Error (NO ABIERTO) \n" );
    return 1;
  }

  fprintf ( arch, "Ejemplo de la funcion \'fprintf\'\n" ) ;
  fprintf( arch, "\t 2\t 3\t 4\n" );
  fprintf( arch, "x\tx\tx\tx\n\n" );

  for( i=1; i <= 10; i++ )
    fprintf( arch, "%d\t%d\t%d\t%d\n", i, i*i, i*i*i, i*i*i*i );

  fprintf ( stdout, "Datos guardados en el archivo: %s\n", nombre ) ;
  fclose (arch) ;
return 0;
}

//En pantalla muestra --> "Datos guardados en el archivo: datos.txt

/*En el archivo guarda las potencias del 1 al 4 de los numeros del 1 al 10
