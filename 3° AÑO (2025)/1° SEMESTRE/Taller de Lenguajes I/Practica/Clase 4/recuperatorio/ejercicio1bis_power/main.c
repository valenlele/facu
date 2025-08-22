#include <stdio.h>
#include <stdlib.h>

typedef struct nodo {
  int dato;
  struct nodo* ant;
} nodo;

int main() {
  int num;
  nodo* pila = NULL, *aux;

  printf("Se ingresan numeros hasta ingresar el 0: \n");
  scanf("%d", &num);
  while (num != 0) {
    aux = (nodo*) malloc(sizeof(nodo)); //reservo espacio para un nodo
    aux->dato = num;
    aux->ant = pila;
    pila = aux;

    scanf("%d", &num);
  }

  printf("Numeros almacenados: \n");
  aux = pila;
  while (aux != NULL) {
    printf("%d \n", aux->dato);
    aux = aux->ant;
  }
  return 0;
}
