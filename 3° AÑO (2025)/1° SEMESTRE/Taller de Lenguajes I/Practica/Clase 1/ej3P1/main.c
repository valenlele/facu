#include <stdio.h>
#include <stdlib.h>

int main()
{
  short int si = 16543;
  unsigned short int usi = 60120;
  int i = 1167763987;
  unsigned int ui = 3452367465;
  long int li = 3167763987;
  long unsigned int lui = 5452367465;

  printf("El short int ocupa %d bytes\n", sizeof(si));
  printf("El unsigned short int ocupa %d bytes\n", sizeof(usi));
  printf("El entero ocupa %d bytes\n", sizeof(i));
  printf("El unsigned int ocupa %d bytes\n", sizeof(ui));
  printf("El long int ocupa %d bytes\n", sizeof(li));
  printf("El long unsigned int ocupa %d bytes\n", sizeof(lui));

  printf("%ld\n", li);
  printf("%lu\n", lui);

}
