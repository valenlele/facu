package parciales;

import tp3.ejercicio1.*;
import java.util.List;
import java.util.ArrayList;

public class Parcial2_2020 {

  public boolean resolver(GeneralTree<Integer> arbol) {
    if (arbol !=null) {
      List<Integer> listaCamino = new ArrayList<>();	
      return resolverR(arbol,listaCamino);
    }
    return false;
  }
  
  private boolean resolverR(GeneralTree<Integer> nodo, List<Integer> listaCamino) {
    if (listaCamino.contains(nodo.getData())) {
      return true;  	
    }
    
    listaCamino.add(nodo.getData()); 
    List<GeneralTree<Integer>> children = nodo.getChildren();
    for (GeneralTree<Integer> child : children) {
      if(resolverR(child,listaCamino)) return true;
    }
    listaCamino.remove(listaCamino.size()-1);
    return false;
  }
	
}
