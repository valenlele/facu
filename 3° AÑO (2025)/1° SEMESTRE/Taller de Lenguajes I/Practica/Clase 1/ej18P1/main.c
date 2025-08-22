#include <stdio.h>
#include <stdlib.h>

int main() {
  int nroRandom;
  srand(time(NULL));
  for (int i=1; i<=15; i++) {
    nroRandom = rand();
    printf("Numero random = %d \n" ,nroRandom);
  }
}
