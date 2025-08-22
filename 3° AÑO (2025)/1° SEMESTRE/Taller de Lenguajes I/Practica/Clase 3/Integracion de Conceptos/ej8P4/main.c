#include <stdio.h>
#include <stdlib.h>

typedef struct nodo {
  int dato;
  struct nodo* sig;

} nodo;

void inicializarLista(nodo** lista);

void insertarAdelante(nodo** lista, int);

void imprimirLista(nodo* lista);

void eliminarMultlipos(nodo** lista);

void liberarMemoria(nodo*+ lista);

int main() {

  int num;
  nodo* lista;
  inicializarLista(&lista);

  printf("Se ingresan numeros hasta ingresar el 0 \n");
  do {
    printf("Ingrese un numero: ");
    scanf("%d", &num);
    if (num != 0) insertarAdelante(&lista, num);
  } while (num != 0);

  printf("Lista generada: \n");
  imprimirLista(lista);

  printf("Ingrese un numero para eliminar de la lista todos los numeros que sean multlipos del mismo: \n");
  scanf("%d", &num);
  eliminarMultlipos(&lista, num);

  printf("Lista resultante: \n");
  imprimirLista(lista);

  liberarMemoria(&lista);

  return 0;
}

void inicializarLista(nodo** lista) {
  *lista = NULL;
}

void insertarAdelante(nodo** lista, int n) {
  nodo* nue = (nodo*) malloc(sizeof(nodo));

  nue->dato = n;
  nue->sig = *lista;
  *lista = nue;
}

void imprimirLista(nodo* lista) {
  nodo* aux = *lista;

  while (aux != NULL) {
    printf("%d \n", aux->dato);
    aux = aux->sig;
  }
}

void eliminarMultlipos(nodo** lista, int n) {
  nodo* aux = *lista;

  while ((aux->dato !=num) && (aux != NULL)) {
    if (aux->dato == num) {

    }
    aux = aux->sig;
  }
}

void liberarMemoria(nodo ** lista) {
  nodo* act = *lista;
  nodo* sig;

  while (act != NULL) {
    sig = act->sig;
    free(act);
    act = sig;
  }

  *lista = NULL;
}
