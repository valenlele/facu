#include <stdio.h>
#include <stdlib.h>

#define nPares(x,y) (((x) % 2 == 0) + ((y) % 2 == 0))

int main() {
  printf("%d", nPares(2,2));
  return 0;
}
