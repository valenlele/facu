#include <stdio.h>
#include <stdlib.h>

int main(int argc, char * argv[]) {
  if (argc != 4) printf("Numero incorrecto de parametros");

  else {
    //debo convertir los operandos a enteros ya que son char
    int n1 = atoi(argv[1]);
    int n2 = atoi(argv[2]);
    char op = *argv[3];
    float res;

    switch (op) {
      case '+' : res = n1 + n2; break;
      case '-' : res = n1 - n2; break;
      case '.' : res = n1 * n2; break;
      case '/' : res = n1 / n2; break;
    }

    if ((op != '+') && (op != '-') && (op != '.') && (op != '/')) {
      printf("Operador no valido");
      return -1;
    }

    printf("%d %c %d = %.2f", n1, op, n2, res);
  }
  return 0;
}
