#include <stdio.h>
#include <stdlib.h>

typedef struct alu {
  char apellido[50];
  char nombre[50];
  char legajo[8];

} alumno;

void inicializarAlumno(alumno* a);

int main() {

  alumno arregloAlumnos[10];

  int i;
  for (i = 0; i < 10; i++) {
    inicializarAlumno(&arregloAlumnos[i]);
  }

  for (i = 0; i < 10; i++) {
    printf("Apellido y nombre: %s, %s | Legajo: %s\n", arregloAlumnos[i].apellido, arregloAlumnos[i].nombre, arregloAlumnos[i].legajo);
  }

  return 0;
}

void inicializarAlumno(alumno* a) {
  printf("Se ingresa informacion de un alumno: \n");
  printf("Apellido: ");
  scanf("%s",a->apellido);
  printf("Nombre: ");
  scanf("%s",a->nombre);
  printf("Legajo: ");
  scanf("%s",a->legajo);
}
