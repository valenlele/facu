#include <stdio.h>
#include <stdlib.h>

struct persona {  //define un struct persona con dos campos
  char nombre[50];
  long int DNI;
} unaPersona; //declara una variable de tipo persona
typedef struct persona persona_t; //crea una alias para persona

typedef struct persona { //define un struct persona con dos campos
  char nombre[50];
  long int DNI;
} persona_t;  //se crea el alias persona_t con el typedef

int main() {
  return 0;
}
