#include <stdio.h>
#include <stdlib.h>

typedef struct nodo {
  int dato;
  struct nodo* sig;

} nodo;

void inicializarLista(nodo**);

void eliminarElemLista(nodo**);

void agregarAdelante(nodo**, int);

void agregarFinal(nodo**, int);

int cantElemLista(nodo*);

void imprimirLista(nodo*);

int main() {

  nodo *lista; //creamos variable tipo nodo llamada lista

  inicializarLista(&lista); //pasamos la direccion de memoria de lista (la direccion de memoria donde esta almacenado el puntero)

  int n;

  printf("Se ingresa un elemento al principio de la lista: ");
  scanf("%d",&n);

  agregarAdelante(&lista,n);

  printf("Se ingresa un elemento al final de la lista: ");
  scanf("%d",&n);

  agregarFinal(&lista,n);

  printf("La cantidad de elementos de la lista es: %d \n", cantElemLista(lista));

  imprimirLista(lista);

  eliminarElemLista(&lista);

  return 0;
}

void inicializarLista(nodo** lista) {
  *lista = NULL;
}

void eliminarElemLista(nodo** lista) {
  nodo* act = *lista;
  nodo* sig;

  while (act != NULL) {
    sig = act->sig;
    free(act);
    act = sig;
  }

  *lista = NULL;
}

void agregarAdelante(nodo** lista, int n) {
  nodo* nue = (nodo*) malloc(sizeof(nodo));
  nue->dato = n;
  nue->sig = *lista;
  *lista = nue;
}

void agregarFinal(nodo** lista, int n) {
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

int cantElemLista(nodo* lista) {
  int cant = 0;
  nodo* act = lista;

  while (act != NULL) {
    cant++;
    act = act->sig;
  }

  return cant;
}

void imprimirLista(nodo* lista) {
  nodo* act = lista;

  printf("Elementos de la lista: \n");
  while (act != NULL) {
    printf("%d, ", act->dato);
    act = act->sig;
  }
}
