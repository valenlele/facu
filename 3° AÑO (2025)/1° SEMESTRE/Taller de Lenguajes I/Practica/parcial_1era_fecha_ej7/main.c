#include <stdio.h>
#include <stdlib.h>

typedef struct {
  int legajo;
  char carrera[80];
  char nombre[50];
  float promedio;

} estudiante_t;

void cargar_estudiante(estudiante_t*);

int cant_estudiantes_carrera(estudiante_t [], int, const char []);

int main() {

  estudiante_t arregloEstudiantes[3];

  int i;
  for (i = 0; i < 3; i++) {
    cargar_estudiante(&arregloEstudiantes[i]);
  }

  printf("La cantidad de estudiantes de la carrera 'Ingenieria en Computacion' es: %d",cant_estudiantes_carrera(arregloEstudiantes, 3, "IngenieriaEnComputacion"));

  return 0;
}

void cargar_estudiante(estudiante_t* e) {
  printf("Se ingresa informacion de un estudiante: \n");
  printf("Legajo: ");
  scanf("%d", &(e->legajo));
  printf("Carrera: ");
  scanf("%s", (e->carrera));
  printf("Nombre: ");
  scanf("%s", (e->nombre));
  printf("Promedio: ");
  scanf("%f", &(e->promedio));
}

int cant_estudiantes_carrera(estudiante_t arregloEstudiantes[], int cont, const char carrera[]) {
  int cant = 0;

  int i;
  for (i = 0; i < cont; i++) {
    if (strcmp(arregloEstudiantes[i].carrera,carrera) == 0) {
      cant++;
    }
  }

  return cant;
}
