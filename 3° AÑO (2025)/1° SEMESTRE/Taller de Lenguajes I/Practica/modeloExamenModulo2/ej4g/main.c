#include <stdio.h>

int main() {
   FILE *file = fopen("example1.txt", "a+");
   if (file == NULL) {
      perror("Error opening file");
      return 1;
   }

   int ch = fgetc(file);
   if (ch != EOF) {
      printf("The first character is: %c\n", ch);
   } else {
      printf("No characters to read or error reading file\n");
   }
   fclose(file);
   return 0;
}
