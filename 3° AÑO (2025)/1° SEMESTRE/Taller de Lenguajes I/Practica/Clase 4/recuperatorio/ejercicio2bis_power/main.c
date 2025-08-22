#include <stdio.h>
#include <stdlib.h>

typedef struct nodo {
  int dato;
  struct nodo* sig;
} nodo;

int main() {
  int num;

  nodo* lista;
  inicializarLista(&lista);
  printf("Se ingresan numeros hasta ingresar el 0: \n");
  scanf("%d", &num);
  while (num != 0) {
    insertarLista(&lista, num);
    scanf("%d", &num);
  }
  printf("Numeros ingresados: \n");
  imprimirLista(lista);

  /*int* v;
  int i = 0;
  int cant = 10;
  inicializarArreglo(&v);
  printf("Se ingresan numeros hasta ingresar el 0: \n");
  scanf("%d", &num);
  while (num != 0) {
    insertarArreglo(&v, num, i, &cant);
    i++;
    scanf("%d", &num);
  }
  printf("Numeros ingresados: \n");
  imprimirArreglo(v, i);*/

  return 0;
}

void inicializarLista(nodo** l) {
  *l = NULL;
}

void insertarLista(nodo** l, int num) {
  nodo* nue = (nodo*) malloc(sizeof(nodo));
  nodo* ult = *l;

  nue->dato = num;
  nue->sig = NULL;

  if (*l == NULL) {
    *l = nue;
    return;
  }

  while (ult->sig != NULL) {
    ult = ult->sig;
  }

  ult->sig = nue;
}

void imprimirLista(nodo* l) {
  nodo* aux = l;
  while (aux != NULL) {
    printf("%d \n", aux->dato);
    aux = aux->sig;
  }
}

void inicializarArreglo(int** v) {
  *v = (int*) calloc(10, sizeof(int));
}

void insertarArreglo(int** v, int num, int i, int* cant) {
  if (i == *cant) {
    *(cant)+=10;
    *v = (int*) realloc(*v, (*cant)*sizeof(int));
  }
  (*v)[i] = num;
}

void imprimirArreglo(int* v, int i) {
  int j;
  for (j = 0; j < i; j++) {
    printf("v[%d] = %d \n", j + 1, v[j]);
  }
}
