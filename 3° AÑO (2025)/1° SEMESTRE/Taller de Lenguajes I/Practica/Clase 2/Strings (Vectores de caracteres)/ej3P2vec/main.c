#include <stdio.h>
#include <stdlib.h>
#define dimF 50
#define fin ' '

void generarCadenaDeCaracteres(char []);

void car1ConCar2(char*, char car1, char car2);

int main() {
  char cadenaCar[dimF];
  char car1;
  char car2;

  generarCadenaDeCaracteres(cadenaCar);

  printf("Cadena de caracteres generada: %s \n",cadenaCar);

  printf("Ingrese el primer caracter: ");
  scanf(" %c",&car1);

  printf("Ingrese el segundo caracter: ");
  scanf(" %c",&car2);

  car1ConCar2(cadenaCar,car1,car2);

  printf("Cadena de caracteres resultante: %s \n",cadenaCar);

  return 0;
}

void generarCadenaDeCaracteres(char cadenaCar[]) {
  char car;
  int i = 0;

  printf("Se escriben caracteres hasta ingresar un espacio: \n");
  scanf("%c",&car);

  while ((i < dimF-1) && (car != fin)) {
    cadenaCar[i] = car;
    i++;
    scanf("%c",&car);
  }
  cadenaCar[i] = '\0';
}

void car1ConCar2(char *cadenaCar, char car1, char car2) {
  int i = 0;

  while (cadenaCar[i] != '\0') {
    if  (cadenaCar[i] == car1 ) {
      (cadenaCar[i]) = car2;
    }
    i++;
  }
}
