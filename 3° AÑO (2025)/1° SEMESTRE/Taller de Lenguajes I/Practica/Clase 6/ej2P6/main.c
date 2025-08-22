#include <stdio.h>
#include <stdlib.h>

int main(int argc, char * argv[]) {
  if (argc != 5) {
    printf("Cantidad de parametros incorrecta");
    return -1;
  }

  else {
    int i;
    int tot = 0;
    for (i = 1; i < argc; i++) {
      tot += atoi(argv[i]);
    }
    printf("Promedio: %.2f", (float) tot / (argc-1));
  }

  return 0;
}
