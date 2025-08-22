#include <stdio.h>
#include <stdlib.h>
#define fin "ZZZ"

typedef struct {
  char nombre[10];
  char apellido[20];
  int sucursal;
  float sueldo;
} empleado;

int main() {
  FILE* arch;
  arch = fopen("empleados.txt", "w+");

  if (!arch) {
    printf("Error al abrir el archivo");
    return -1;
  }

  empleado e;

  printf("Se ingresa informacion de empleados para ingresar en un archivo: \n");
  printf("Nombre: ");
  scanf("%s", e.nombre);
  while (strcmp(e.nombre, fin)) {
    printf("Apellido: ");
    scanf("%s", e.apellido);
    printf("Sucursal: ");
    scanf("%d", &e.sucursal);
    printf("Sueldo: ");
    scanf("%f", &e.sueldo);

    fprintf(arch, "%s \t %s \t %d \t %f \t \n", e.nombre, e.apellido, e.sucursal, e.sueldo);

    printf("\n");

    printf("Nombre: ");
    scanf("%s", e.nombre);
  }

  fseek(arch, 0, SEEK_SET);

  fscanf(arch, "%s \t %s \t %d \t %f \t \n", e.nombre, e.apellido, &e.sucursal, &e.sueldo);
  printf("Empleado: %s %s %d %.2f \n", e.nombre, e.apellido, e.sucursal, e.sueldo);
  while (!feof(arch)) {
    fscanf(arch, "%s \t %s \t %d \t %f \t \n", e.nombre, e.apellido, &e.sucursal, &e.sueldo);
    printf("Empleado: %s %s %d %.2f \n", e.nombre, e.apellido, e.sucursal, e.sueldo);
  }

  printf("\n");

  printf("Se ingresan mas empleados: \n");
  printf("Nombre: ");
  scanf("%s", e.nombre);
  while (strcmp(e.nombre, fin)) {
    printf("Apellido: ");
    scanf("%s", e.apellido);
    printf("Sucursal: ");
    scanf("%d", &e.sucursal);
    printf("Sueldo: ");
    scanf("%f", &e.sueldo);

    fprintf(arch, "%s \t %s \t %d \t %f \t \n", e.nombre, e.apellido, e.sucursal, e.sueldo);

    printf("\n");

    printf("Nombre: ");
    scanf("%s", e.nombre);
  }

  fseek(arch, 0, SEEK_SET);

  fscanf(arch, "%s \t %s \t %d \t %f \t \n", e.nombre, e.apellido, &e.sucursal, &e.sueldo);
  printf("Empleado: %s %s %d %.2f \n", e.nombre, e.apellido, e.sucursal, e.sueldo);
  while (!feof(arch)) {
    fscanf(arch, "%s \t %s \t %d \t %f \t \n", e.nombre, e.apellido, &e.sucursal, &e.sueldo);
    printf("Empleado: %s %s %d %.2f \n", e.nombre, e.apellido, e.sucursal, e.sueldo);
  }

  return 0;
}

//crear archivo con w
//verificar si se abrio

//generar archivo con info de empleados

//posicionarse al principio del archivo

//recorrer archivo con info de empleados e imprimir su info

//posicionarse al final del archivo

//agregar mas empleados

//cerrar archivo
