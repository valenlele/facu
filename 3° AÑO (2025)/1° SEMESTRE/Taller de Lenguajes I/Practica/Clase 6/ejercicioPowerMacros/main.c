#include <stdio.h>
#include <stdlib.h>

#define MIN_DOS_VALORES(n1,n2) (((n1) < (n2)) ? (n1) : (n2))

#define MIN_TRES_VALORES(n1,n2,n3) (MIN_DOS_VALORES(MIN_DOS_VALORES((n1),(n2)),(n3)))


int main() {
  int n1,n2,n3;
  printf("Se ingresan tres valores: \n");
  scanf("%d %d %d", &n1, &n2, &n3);

  printf("El menor de los tres valores es: %d", MIN_TRES_VALORES(n1,n2,n3));

  return 0;
}
