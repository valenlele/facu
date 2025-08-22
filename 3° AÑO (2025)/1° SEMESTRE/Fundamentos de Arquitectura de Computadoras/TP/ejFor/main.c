#include <stdio.h>
#include <stdlib.h>

int main() {

  int n;

  scanf("%d", &n);

  while (n != 0) {
    if ((n % 2) == 0) n+= 5;
    else n -= 3;
  }

  return 0;
}
