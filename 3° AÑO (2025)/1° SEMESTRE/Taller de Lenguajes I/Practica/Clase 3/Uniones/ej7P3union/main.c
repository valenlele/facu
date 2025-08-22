#include <stdio.h>
#include <stdlib.h>

typedef union {
  unsigned long int dni;
  char pasaporte[20];
} t_id;

typedef struct {
  char apellido[20];
  char nombre[20];
  char legajo[15];
  char tipoId;
  t_id id;
} t_estudiante;

void cargarEstudiante(t_estudiante *);

void imprimirEstudiante(t_estudiante);

int main() {

  t_estudiante estudiante;

  cargarEstudiante(&estudiante);

  imprimirEstudiante(estudiante);

  return 0;
}

void cargarEstudiante(t_estudiante *estudiante) {
  char tipo;

  printf("Se ingresan datos de un estudiante: \n");
  printf("Apellido: ");
  scanf("%s",(estudiante->apellido));
  printf("Nombre: ");
  scanf("%s",(estudiante->nombre));
  printf("Legajo: ");
  scanf("%s",(estudiante->legajo));

  do {
    printf("Tipo de identificacion (D si es argentino, P si es extranjero): ");
    scanf(" %c",&tipo);
  } while ((tipo != 'D') && (tipo != 'P'));

  estudiante->tipoId = tipo;

  if (tipo == 'D') {
    printf("DNI: ");
    scanf("%lu",&(estudiante->id.dni));
  }
  else {
    printf("Pasaporte: ");
    scanf("%s",&(estudiante->id.pasaporte));
  }
}

void imprimirEstudiante(t_estudiante estudiante) {
  printf("Apellido: %s \n", estudiante.apellido);
  printf("Nombre: %s \n", estudiante.nombre);
  printf("Legajo: %s \n", estudiante.legajo);

  if (estudiante.tipoId == 'D') {
    printf("DNI: %lu", estudiante.id.dni);
  }
  else {
    printf("Pasaporte: %s", estudiante.id.pasaporte);
  }
}
