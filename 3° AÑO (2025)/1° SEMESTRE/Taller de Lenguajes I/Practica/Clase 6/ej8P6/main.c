#include <stdlib.h>

#define DEBUG 0

int main(){
    int x= 15;

    while (x<50){
        #if DEBUG
          printf("x= %d", x);
          y= y+1;
        #endif
        x++;
    }
    return 0;
}

//a) con debug = 0 el codigo si compila ya que en este caso se eliminaria la seccion del if en la etapa de preprocesamiento, y por lo tanto no 'veria' que
//la variable 'y' no esta declarada. sin embargo, si cambiamos debug a un numero distinto de 0, el compilador si se daria cuenta que 'y' no esta declarada
//y daria un error

//b) si se cambia el valor de debug a 1 el compilador daria un error ya que 'y' no esta declarada. la ventaja de la compilacion condicional es que permite
//ejecutar secciones de un programa dependiendo del valor de una constante simbolica, pudiendo asi alterar el comportamiento del programa sin cambiar el codigo

//c) no

//d) si se usara #ifdef el valor de la constante debug no importaria ya que ifdef pregunta si la constante esta definida, no si la sentencia luego del if
//es verdadera
