#include <stdio.h>
#include <stdlib.h>

//usamos union porque queremos acceder a los mismos datos de distintas maneras

//nos pide que definamos un rectangulo (que simula a una ventana) de tres maneras distintas:
//(x,y,ancho,alto) --> todas juntas
//[(x1,y1),(x2,y2)] --> con dos puntos
//([x,y,ancho,alto]) --> todas separadas

//en vez de definir 3 struct, definimos una union

union rectangulo{
  struct {
    float x;
    float y;
    float ancho;
    float alto;
  } separadas;

  struct {
    float p1[2]; //x, y
    float p2[2]; //x+ancho, y+alto
  } dosPuntos;

  struct {
    float p[4];  //x,y,ancho,alto
  } juntas;
};

void calcularSegundoPunto(union rectangulo *r) {
  r->dosPuntos.p2[0] = r->separadas.x + r->separadas.ancho;
  r->dosPuntos.p2[1] = r->separadas.y + r->separadas.alto;
}

int main() {

  union rectangulo r;

  r.separadas.x = 2;
  r.separadas.y = 3;
  r.separadas.ancho = 5;
  r.separadas.alto = 6;

  printf("Rectangulo separadas: \n");
  printf("x = %.2f \n", r.separadas.x);
  printf("y = %.2f \n", r.separadas.y);
  printf("ancho = %.2f \n", r.separadas.ancho);
  printf("alto = %.2f \n", r.separadas.alto);

  printf("\n");

  calcularSegundoPunto(&r);

  printf("Rectangulo con dos puntos: \n");
  printf("x = %.2f \n", r.dosPuntos.p1[0]);
  printf("y = %.2f \n", r.dosPuntos.p1[1]);
  printf("ancho = %.2f \n", r.dosPuntos.p2[0]);
  printf("alto = %.2f \n", r.dosPuntos.p2[1]);

  printf("\n");

  printf("Rectangulo todo junto: \n");
  printf("x = %.2f \n", r.juntas.p[0]);
  printf("y = %.2f \n", r.juntas.p[1]);
  printf("ancho = %.2f \n", r.juntas.p[2]);
  printf("alto = %.2f \n", r.juntas.p[3]);

  return 0;
}
