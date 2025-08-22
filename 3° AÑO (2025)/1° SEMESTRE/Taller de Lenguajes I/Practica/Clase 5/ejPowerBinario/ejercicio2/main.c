#include <stdio.h>
#include <stdlib.h>

typedef struct {
  char nombre[20];
  unsigned short int codigo;
  float precio;
  int cantVendida;
  unsigned short int stock;
} juguete;

int main() {
  FILE* arch;
  arch = fopen("Inventario.dat", "rb+");

  if (!arch) {
    printf("Error al abrir el archivo");
    return -1;
  }

  juguete j;

  printf("Se ingresa informacion de juguetes: \n");
  printf("Codigo: ");
  scanf("%hu", &j.codigo);
  while (j.codigo != 0) {
    printf("Nombre: ");
    scanf("%s", j.nombre);
    printf("Precio: ");
    scanf("%f", &j.precio);
    printf("Cantidad vendida: ");
    scanf("%d", &j.cantVendida);
    j.stock = 50 - j.cantVendida;
    printf("Stock: %hu", j.stock);

    fwrite(&j, sizeof(juguete), 1, arch);

    printf("\n \n");

    printf("Codigo: ");
    scanf("%hu", &j.codigo);
  }

  fseek(arch,0,SEEK_SET);

  printf("Informacion de juguetes generada: \n\n");

  while (fread(&j, sizeof(juguete), 1, arch) == 1) {
    printf("Codigo: %hu \n", j.codigo);
    printf("Nombre: %s \n", j.nombre);
    printf("Precio: %.2f \n", j.precio);
    printf("Cantidad vendida: %d \n", j.cantVendida);
    printf("Stock: %hu \n", j.stock);
    printf("\n\n");
  }

  fclose(arch);

  arch = fopen("Inventario.dat", "rb+");
  if (!arch) {
    printf("Error al abrir el archivo");
    return -1;
  }

  printf("Se aumentan un 25% los juguetes con codigos 2 y 3. \nInformacion de juguetes actualizada: \n");

  int pos;
  while (fread(&j, sizeof(juguete), 1, arch) == 1) {
    if ((j.codigo == 2) || (j.codigo == 3)) {
      j.precio = j.precio + ((25*j.precio) / 100);
      fseek(arch, -sizeof(juguete), SEEK_CUR); //al hacer fread, el fichero del archivo se mueve al siguiente juguete,
                                               //por lo tanto tengo que volver para actualizar el juguete correcto
      fwrite(&j, sizeof(juguete), 1, arch);
    }
  }

  fseek(arch, 0, SEEK_SET);

  while (fread(&j, sizeof(juguete), 1, arch) == 1) {
    printf("Codigo: %hu \n", j.codigo);
    printf("Nombre: %s \n", j.nombre);
    printf("Precio: %.2f \n", j.precio);
    printf("Cantidad vendida: %d \n", j.cantVendida);
    printf("Stock: %hu \n", j.stock);
    printf("\n\n");
  }

  fclose(arch);
  return 0;
}
