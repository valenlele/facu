package tp3.ejercicio10;

import java.util.List;
import tp3.ejercicio1.*;
import java.util.ArrayList;

public class Parcial {

  public static List<Integer> resolver(GeneralTree<Integer> arbol) {
    if (arbol!=null) { 
      List<Integer> caminoMax = new ArrayList<>();
      List<Integer> caminoFVM = new ArrayList<>();
      resolverRecursivo(arbol,caminoFVM,caminoMax,0,0,-1);	
      return caminoMax;
    }
    return null;
  }
  
  private static int resolverRecursivo(GeneralTree<Integer> nodo, List<Integer> caminoAux, List<Integer> caminoMax, int nivel, int suma, int maxSuma) {
    if (nodo.getData()==1) caminoAux.add(nodo.getData()); //agrego solo los 1 en la lista auxiliar
    suma += nodo.getData()*nivel; //actualizo la suma del camino en el que estoy
    
    if (!nodo.isLeaf()) {	
    	
      nivel++;	  
      
      for (GeneralTree<Integer> child : nodo.getChildren()) {
        maxSuma = resolverRecursivo(child,caminoAux,caminoMax,nivel,suma,maxSuma);  
      }
      
    }
    
    else if (suma>maxSuma) {
      caminoMax.clear();
      caminoMax.addAll(caminoAux);
      maxSuma = suma;
    }
    
    if (nodo.getData() != 0) caminoAux.removeLast(); //como voy a recorrer los otros hijos, saco de la lista el que acabo de analizar
    return maxSuma;
  }
	
}
