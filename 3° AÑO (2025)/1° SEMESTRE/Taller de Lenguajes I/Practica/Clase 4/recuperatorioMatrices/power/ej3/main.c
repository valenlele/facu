#include <stdio.h>
#include <stdlib.h>
#define equipos 2
#define integrantes 2

typedef struct {
  char nombre[20];
  int edad;
} persona;

persona** reservarMemoria();

int main() {

  persona** mat = reservarMemoria();

  cargarMatriz(mat);

  imprimirMatriz(mat);

  return 0;
}

persona** reservarMemoria() {
  persona** aux = (persona**) calloc(equipos, sizeof(persona*));

  int i;
  for (i = 0; i < integrantes; i++) {
    aux[i] = (persona*) calloc(integrantes, sizeof(persona));
  }

  return aux;
}

void leerPersona(persona* p) {
  printf("Nombre: ");
  scanf("%s", &p->nombre);
  printf("Edad: ");
  scanf("%d", &p->edad);
}

void cargarMatriz(persona** mat) {
  int e, i;
  persona p;
  printf("Se carga la matriz: \n");
  for (e = 0; e < equipos; e++) {
    for (i = 0; i < integrantes; i++) {
      printf("Equipo %d Integrante %d: \n", e + 1, i + 1);
      leerPersona(&p);
      mat[e][i] = p;
    }
  }
}

void imprimirMatriz(persona** mat) {
  int e, i;
  printf("Matriz cargada: \n");
  for (e = 0; e < equipos; e++) {
    for (i = 0; i < integrantes; i++) {
      printf("Equipo %d Integrante %d: ", e + 1, i + 1);
      printf("Nombre: %s. Edad: %d", mat[e][i].nombre, mat[e][i].edad);
      printf("\n");
    }
  }
}
