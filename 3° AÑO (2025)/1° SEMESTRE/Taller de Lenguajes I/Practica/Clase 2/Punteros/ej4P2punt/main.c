int main(){
  int vector[10]={10,20,30,40,50,60,70,80,90,100};
  int i;
  int *p= vector;

  for (i=0; i<10; i++){
    *p += 3; //aumenta en 3 el valor del vector en la pos i
    printf("vector[%d] = %d \n", i, vector[i]);
    p+=2; //aumenta donde apunta p (se va moviendo en el vector)
  }

  //a)imprime 13, 23, 33, etc

  //b) la variable vector de modifica porque se modifica el valor a donde apunta el puntero y este a su vez de va moviendo por el vector

  //c) no cambia (creo). TRUE

  //d) nada

  //e) deberia recorrer el vector de a 2. imprimiria 13, 20, 33, 40, 53, etc. TRUE
  return 0;
}
