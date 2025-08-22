#include <stdio.h>
#include <stdlib.h>

int main() {

  int *a, *b, c, d, *e;
  c = 10;
  d = c*2;
  a = e;
  e = &c;
  b = a = e;

  *a = 15;

  printf("%d", c);

  return 0;
}
