#include <stdio.h>
#include <stdlib.h>
#define dimF 2

struct direccion {
  char calle[50];
  char ciudad[30];
  int codigo_postal;
  char pais[40];
};

typedef struct alu {
  char apellido[50];
  char nombre[50];
  char legajo[8];
  float promedio;
  struct direccion domicilio;
} alumno;  //defino el typedef aca y no en el main porque sino las funciones no lo reconocen

typedef struct pun3D {
  float x;
  float y;
  float z;
} punto3D;

void inicializarAlumno(alumno *a);

void calcularMejorPromedio(alumno arregloAlumnos[dimF]);

int main() {

  /* alumno arregloAlumnos[dimF];

  printf("Se ingresa informacion de %d alumnos: \n", dimF);
  int i;
  for (i = 0; i < dimF; i++) {
    printf("Alumno %d: \n", i+1);
    inicializarAlumno(&arregloAlumnos[i]);
  }

  calcularMejorPromedio(arregloAlumnos); */

  printf("%d \n", sizeof(struct pun3D));

  printf("%d \n", sizeof(punto3D));

  punto3D arregloPunto3D[4];

  printf("%d", sizeof(arregloPunto3D));

  return 0;
}

void inicializarAlumno(alumno *a) {
  printf("Apellido: ");
  scanf("%s", a->apellido);
  printf("Nombre: ");
  scanf("%s", a->nombre);
  printf("Legajo: ");
  scanf("%s", a->legajo);
  printf("Promedio: ");
  scanf("%f", &(a->promedio));
  printf("Domicilio: \n");
  printf("Calle: ");
  scanf("%s", a->domicilio.calle);
  printf("Ciudad: ");
  scanf("%s", a->domicilio.ciudad);
  printf("Codigo postal: ");
  scanf("%d", &(a->domicilio.codigo_postal));
  printf("Pais: ");
  scanf("%s", a->domicilio.pais);
}

void calcularMejorPromedio(alumno arregloAlumnos[dimF]) {
  float maxProm = -1;
  alumno maxAlu;

  int i;
  for (i = 0; i < dimF; i++) {
    if (arregloAlumnos[i].promedio > maxProm) {
      maxProm = arregloAlumnos[i].promedio;
      maxAlu = arregloAlumnos[i];
    }
  }

  printf("Informacion del alumno con mayor promedio: \n");
  imprimirAlumno(maxAlu);
}

void imprimirAlumno(alumno a) {
  printf("Apellido: %s \n", a.apellido);
  printf("Nombre: %s \n", a.nombre);
  printf("Legajo: %s \n", a.legajo);
  printf("Promedio: %.2f \n", a.promedio);
  printf("Domicilio: \n");
  printf("Calle: %s \n", a.domicilio.calle);
  printf("Ciudad: %s \n", a.domicilio.ciudad);
  printf("Codigo postal: %d \n", a.domicilio.codigo_postal);
  printf("Pais: %s \n", a.domicilio.pais);
}
