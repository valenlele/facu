#include <stdio.h>
#include <stdlib.h>

typedef struct nodo {
  int dato;
  struct nodo* sig;

} nodo;

void inicializarLista(nodo**);

void insertarFinal(nodo**, int);

void insertarAdelante(nodo**, int);

void recorrerEinsertar(nodo**, nodo*);

void imprimirLista(nodo* lista);

int cantElemLista(nodo*);

void liberarMemoria(nodo**);

int main() {
  int num;
  nodo* lista;
  inicializarLista(&lista);

  printf("Se ingresan numeros enteros hasta ingresar el 0: \n");
  do {
    printf("Ingrese un numero: ");
    scanf("%d", &num);
    if (num!= 0) insertarFinal(&lista, num);
  } while (num != 0);

  nodo* listaInvertida;
  inicializarLista(&listaInvertida);

  recorrerEinsertar(&listaInvertida, lista);

  printf("\n");

  printf("Elementos lista: \n");
  imprimirLista(lista);
  printf("Cantidad elementos lista: %d \n", cantElemLista(lista));

  printf("\n");

  printf("Elementos lista invertida: \n");
  imprimirLista(listaInvertida);
  printf("Cantidad elementos lista invertida: %d", cantElemLista(listaInvertida));

  liberarMemoria(&lista);

  liberarMemoria(&listaInvertida);

  printf("\n");

  return 0;
}

void inicializarLista(nodo** lista) {
  *lista = NULL;
}

void insertarFinal(nodo** lista, int n) {
  nodo* nue = (nodo*) malloc(sizeof(nodo));
  nodo* ult = *lista;

  nue->dato = n;
  nue->sig = NULL;

  if (*lista == NULL) {
    *lista = nue;
    return;
  }

  while (ult->sig != NULL) {
    ult = ult->sig;
  }

  ult->sig = nue;
}

void insertarAdelante(nodo** lista, int n) {
  nodo* nue = (nodo*) malloc(sizeof(nodo));
  nue->dato = n;
  nue->sig = *lista;
  *lista = nue;
}

void recorrerEinsertar(nodo** listaInvertida, nodo* lista) {
  nodo* aux = (nodo*) malloc(sizeof(nodo));
  aux = lista;

  while (aux != NULL) {
    insertarAdelante(listaInvertida, aux->dato);
    aux = aux->sig;
  }
}

void imprimirLista(nodo* lista) {
  nodo* aux = lista;;

  while (aux != NULL) {
    printf("%d \n", aux->dato);
    aux = aux->sig;
  }
}

int cantElemLista(nodo* lista) {
  int cant = 0;
  nodo* aux = lista;

  while (aux != NULL) {
    cant++;
    aux = aux->sig;
  }

  return cant;
}

void liberarMemoria(nodo** lista) {
  nodo* act = *lista;
  nodo* sig;

  while (act != NULL) {
    sig = act->sig;
    free(act);
    act = sig;
  }

  *lista = NULL;
}

