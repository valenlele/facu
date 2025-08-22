#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char* argv[]) {
  if (argc == 1) {
    printf("Numero incorrecto de parametros");
    return -1;
  }

  char cat[100] = "";

  int i;
  for (i = 1; i < argc; i++) {
    strcat(cat, argv[i]);
    strcat(cat, " ");
  }

  printf("%s", cat);

  return 0;
}
