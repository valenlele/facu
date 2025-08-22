#include <stdio.h>
int main() {
   FILE * arch;
   int valores[10]={3,2,4,1,7,6,5}; //se inicalizan en 0 los restantes 3 valores, entonces fwrite si copia 10 numeros
   int grabados;

   arch = fopen("AccesoDirecto", "wb");

   if (arch) {
      grabados = fwrite(valores, sizeof(int), 10, arch);

      printf("Se escribieron correctamente %d"
             " numeros enteros\n", grabados);

      fclose(arch);
   }
   return 0;
}
