#include <stdio.h>
#include <stdlib.h>
#define LONG 300

int main(){
        FILE *f;
        char linea[LONG];

        // Abrir el archivo
        f = fopen("prueba.txt", "r");

        if (f == NULL){
            printf ("\nError al abrir archivo fuente\n");
            return 1;
        }

        /*while (!feof(f)){
            // leer una linea del archivo
            fgets(linea,LONG,f);
            // imprimir la linea en la pantalla
            puts(linea);
        } //fgets se ejecuta una vez de mas ya que feof se hace verdadero dentro del while.
        //feof devuelve true una vez que la ultima lectura ya alcanzo el final del archivo. no sabe cuando va a terminar */

        while (fgets(linea, LONG, f) != NULL) {
          puts(linea);
        }

        fclose(f);
        return 0;
}
