#include <stdio.h>
#include <stdlib.h>
#define FIN "ZZZ"

void reservarMemoria(char***, int);

int cargarLista(char***, int*);

int existePalabra(char**, int, char*);

void buscarPalabras(char**, int);

void liberarMemoria(char***, int);

int main() {

  char** arreglo = NULL; //arreglo de punteros que apuntan a palabras
  int dimL = 0; //cantidad de palabras almacenadas hasta el momento

  if (cargarLista(&arreglo, &dimL) != -1) buscarPalabras(arreglo, dimL);

  liberarMemoria(&arreglo, dimL);

  return 0;
}

void reservarMemoria(char*** arreglo, int n) {
  (*arreglo) = (char**) realloc(*arreglo, n*sizeof(char*)); //reservo memoria para un puntero que apunta a un puntero que apunta a un char
}

int cargarLista(char*** arreglo, int* dimL) {
  FILE* f = fopen("diccionario.txt", "r");
  char palabra[30];
  int dimF = 0; //cantidad de palabras reservadas totales

  if (f == NULL) {
    printf("Error al abrir el archivo \n");
    return -1;
  }

  while (fscanf(f, "%s", palabra) == 1) {
    if (dimF == (*dimL)) {
      reservarMemoria(&(*arreglo), (*dimL) + 5); //reserva memoria para una nueva palabra. por que el arreglo se pasa de esa manera?
      dimF += 5;
    }

    *(*arreglo + (*dimL)) = (char*) malloc(30 * sizeof(char)); //reservo memoria para una palabra en el arreglo
    strcpy(*(*arreglo + (*dimL)), palabra); //copio el contendio de la palabra en el arreglo
    (*dimL)++;
  }

  fclose(f);

  return 0;
}

int existePalabra(char** arreglo, int dimL, char* palabra) {
  for (int i = 0; i < dimL; i++) {
    if (!strcmp(*(arreglo + i), palabra)) return 1;
  }
  return 0;
}

void buscarPalabras(char** arreglo, int dimL) {
  char palabra[30];

  printf("Ingrese una palabra para saber si esta en el diccionario: \n");
  scanf("%s", palabra);

  while (strcmp(palabra,FIN)) {
    if (existePalabra(arreglo, dimL, palabra)) printf("La palabra %s se encuentra en el diccionario \n", palabra);
    else printf("La palabra %s no se encuentra en el diccionario \n");

    printf("Ingrese una palabra para saber si esta en el diccionario: \n");
    scanf("%s", palabra);
  }
}

void liberarMemoria(char*** arreglo, int dimL) {
  for (int i = 0; i < dimL; i++) {
    free((*arreglo)[i]);
  }
  free(*arreglo);
}

/*
   arreglo es char*** (puntero a puntero a puntero)
   *arreglo es char** (el arreglo de punteros)
   (*arreglo)[i] es char* (la palabra en la posición i)
   *(arreglo[i]) no tiene sentido porque arreglo[i] trata a arreglo como un arreglo, pero es un puntero triple
*/
