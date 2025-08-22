#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define M_PI 3.14159265358979323846

typedef enum {CIRCULO = 1, ELIPSE, TRIANGULO, CUADRADO, RECTANGULO} nombre_figura;

typedef struct {
  float radio;

} t_circulo;

typedef struct {
  float a;
  float b;

} t_elipse;

typedef struct {
  float base;
  float altura;

} t_triangulo;

typedef struct {
  float lado;

} t_cuadrado;

typedef struct {
  float base;
  float altura;

} t_rectangulo;

typedef union {
  t_circulo circulo;
  t_elipse elipse;
  t_triangulo triangulo;
  t_cuadrado cuadrado;
  t_rectangulo rectangulo;

} datos_figura;

typedef struct {
  nombre_figura nombre;
  datos_figura datos;

} t_figuraBidimensional;

float calcularSuperficie(t_figuraBidimensional);

int main() {

  t_figuraBidimensional figura;
  int n;

  printf("Ingrese un numero del 1 al 5 que indique una figura (1 circulo, 2 elipse, 3 triángulo, 4 cuadrado, 5 rectángulo): \n");
  scanf("%d",&n);

  figura.nombre = n;

  switch (n) {
    case CIRCULO : {
      int r;
      printf("Ingrese el radio: \n");
      scanf("%d",&r);
      figura.datos.circulo.radio = r;
      break;
    }
    case ELIPSE : {
      int a,b;
      printf("Ingrese el eje mayor: \n");
      scanf("%d",&a);
      printf("Ingrese el eje menor: \n");
      scanf("%d",&b);
      figura.datos.elipse.a = a;
      figura.datos.elipse.b = b;
      break;
    }
    case TRIANGULO : {
      int b,h;
      printf("Ingrese la base: \n");
      scanf("%d",&b);
      printf("Ingrese la altura: \n");
      scanf("%d",&h);
      figura.datos.triangulo.base = b;
      figura.datos.triangulo.altura = h;
      break;
    }
    case CUADRADO : {
      int l;
      printf("Ingrese el lado: \n");
      scanf("%d",&l);
      figura.datos.cuadrado.lado = l;
      break;
    }
    case RECTANGULO : {
      int b,h;
      printf("Ingrese la base: \n");
      scanf("%d",&b);
      printf("Ingrese la altura: \n");
      scanf("%d",&h);
      figura.datos.rectangulo.base = b;
      figura.datos.rectangulo.altura = h;
      break;
    }
  }

  printf("La superficie de la figura %d es: %.2f", figura.nombre, calcularSuperficie(figura));

  return 0;
}

float calcularSuperficie(t_figuraBidimensional figura) {

  float sup;

  switch (figura.nombre) {
    case CIRCULO : {
      sup = M_PI * figura.datos.circulo.radio * figura.datos.circulo.radio;
      return sup;
      break;
    }
    case ELIPSE : {
      sup = M_PI * figura.datos.elipse.a * figura.datos.elipse.b;
      return sup;
      break;
    }
    case TRIANGULO : {
      sup = (figura.datos.triangulo.base * figura.datos.triangulo.altura) / 2;
      return sup;
      break;
    }
    case CUADRADO : {
      sup = figura.datos.cuadrado.lado * figura.datos.cuadrado.lado;
      return sup;
      break;
    }
    case RECTANGULO : {
      sup = figura.datos.rectangulo.base * figura.datos.rectangulo.altura;
      return sup;
      break;
    }
  }

}
