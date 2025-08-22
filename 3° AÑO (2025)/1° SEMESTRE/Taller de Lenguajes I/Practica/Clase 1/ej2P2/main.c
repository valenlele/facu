#include <stdio.h>

int main(){

  char c = 'a';
  int x = 64;
  printf("char x = %d\n", x);
  printf("int c = %c\n", c);

  float f = 123654;
  double d = 1276543;

  printf("float f = %f\n", f);
  printf("double d = %lf\n", d);

  x = 2*32+10%2-1;
  printf("x = %d\n", x);

  printf("\n");

  printf("El caracter c ocupa %d bytes\n", sizeof(c));
  printf("El entero x ocupa %d bytes\n", sizeof(x));
  printf("El flotante f ocupa %d bytes\n", sizeof(f));
  printf("El double d ocupa %d bytes\n", sizeof(d));

  return 0;
}
