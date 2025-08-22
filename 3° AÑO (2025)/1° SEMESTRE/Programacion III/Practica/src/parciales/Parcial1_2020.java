package parciales;

import tp3.ejercicio1.*;
import java.util.List;
import java.util.ArrayList;

public class Parcial1_2020 {

  public boolean resolver(GeneralTree<Integer> arbol) {
    if (arbol !=null) {
      List<Integer> listaSumas = new ArrayList<>();	
      return resolverR(arbol,listaSumas,0);
    }
    return false;
  }
  
  private boolean resolverR(GeneralTree<Integer> nodo, List<Integer> listaSumas, int suma) {
	suma += nodo.getData();  
	
    if (nodo.isLeaf()) {
      for (int i = 0; i < listaSumas.size(); i++) {
        if (suma == listaSumas.get(i)) return true;	  
      }
      listaSumas.add(suma);
      return false;
    }
    
    else {
      List<GeneralTree<Integer>> children = nodo.getChildren();
      for (GeneralTree<Integer> child : children) {
        if(resolverR(child,listaSumas,suma)) return true;
      }
      return false;
    }
  }
	
}
