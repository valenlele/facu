#include <stdio.h>
#include <stdlib.h>

typedef struct {
  char nombre[30];
  int edad;
} persona;

int main() {
  persona* vecPersonas = (persona*) malloc(5*sizeof(persona));

  char nom[30];
  int edad;
  printf("Se ingresan datos de 5 personas: \n");
  int i;
  for (i = 0; i < 5; i++) {
    printf("Nombre: ");
    scanf("%s", &nom);
    strcpy(vecPersonas[i].nombre, nom);
    printf("Edad: ");
    scanf("%d", &edad);
    vecPersonas[i].edad = edad;
  }

  printf("Nombres de personas con mas de 21 anios: \n");
  for (i = 0; i < 5; i++) {
    if (vecPersonas[i].edad > 21) printf("%s \n", vecPersonas[i].nombre);
  }
  return 0;
}
