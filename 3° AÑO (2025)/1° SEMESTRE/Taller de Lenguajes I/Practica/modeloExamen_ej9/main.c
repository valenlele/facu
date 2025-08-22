#include <stdio.h>
#include <stdlib.h>
#define PI 3.1415

typedef enum {CUADRADO = 1, TRIANGULO_RECT, CIRCULO} t_nombreFigura;

typedef struct {
  float lado;

} t_datosCuadrado;

typedef struct {
  float base;
  float altura;

} t_datosTrianguloRect;

typedef struct {
  float radio;

} t_datosCirculo;

typedef union {
  t_datosCuadrado cuadrado;
  t_datosTrianguloRect trianguloRect;
  t_datosCirculo circulo;

} t_datosFigura;

typedef struct {
  t_nombreFigura nombre;
  char color[20];
  t_datosFigura datos;

} t_figura;

void imprimirFigura(t_figura figura);

int main() {

  t_figura figura;
  int n;

  printf("Se ingresan datos de una figura: \n");
  printf("Nombre (1 cuadrado, 2 triangulo rectangulo, 3 circulo): \n");
  scanf("%d", &n);

  if ((n >=1) && (n<=3)) {
    figura.nombre = n;
  }
  else printf("Nombre de figura no valido");

  printf("Color: ");
  scanf("%s", figura.color);

  printf("Datos de la figura: \n");

  switch (figura.nombre) {
    case CUADRADO : {
      printf("Lado: ");
      scanf("%f", &figura.datos.cuadrado.lado);
      break;
    }
    case TRIANGULO_RECT : {
      printf("Base: ");
      scanf("%f", &figura.datos.trianguloRect.base);
      printf("Altura: ");
      scanf("%f", &figura.datos.trianguloRect.altura);
      break;
    }
    case CIRCULO : {
      printf("Radio: ");
      scanf("%f", &figura.datos.circulo.radio);
      break;
    }
  }

  printf("\n");

  imprimirFigura(figura);

  return 0;
}

void imprimirFigura(t_figura figura) {
  switch (figura.nombre) {
    case CUADRADO : {
      printf("Nombre: cuadrado \n");
      printf("Color: %s \n", figura.color);
      printf("Area: %.2f", figura.datos.cuadrado.lado * figura.datos.cuadrado.lado);
      break;
    }
    case TRIANGULO_RECT : {
      printf("Nombre: triangulo rectangulo \n");
      printf("Color: %s \n", figura.color);
      printf("Area: %.2f", (figura.datos.trianguloRect.base * figura.datos.trianguloRect.altura) / 2);
      break;
    }
    case CIRCULO : {
      printf("Nombre: circulo \n");
      printf("Color: %s \n", figura.color);
      printf("Area: %.2f", PI * (figura.datos.circulo.radio * figura.datos.circulo.radio));
      break;
    }
  }
}

void comprimir_rle(const char in[], char out[]) {

  int i = 0;
  int pos = 0; //posicion de out

  while (in[i] != '\0') {
    char carAct = in[i];
    int cont = 0;

    while (in[i] == carAct) {
      cont++;
      i++;
    }

    out[pos++] = carAct; //al salir del while es porque termine de procesar el caracter actual, entonces lo primero que hago es agregarlo a out

    if (cont > 1) {

      int temp = cont;
      int digs[10]; //aca guardamos cont. cada digito de cont va en una posicion de dig
      int d = 0;

      while (temp > 0) {
        digs[d++] = temp % 10;
        temp /= 10;
      }  //guardamos los digitos en orden inverso

      int j;
      for (j = d - 1; d >=0; j--) {
        out[pos++] = digs[j] + '0'; //esto me da el numero equivalente en la tabla ASCII del numero que quiero almacenar en out
      }
    }
  }

  out[pos] = '\0';

}
