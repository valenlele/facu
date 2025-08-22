package parciales;

import tp3.ejercicio1.*;
import java.util.List;
import java.util.ArrayList;

public class Parcial3_2020 {

  public List<Integer> resolver(GeneralTree<Integer> arbol) {
    if (arbol !=null) {
      List<Integer> lista = new ArrayList<>();	
      resolverR(arbol,lista);
      return lista;
    }
    return null;
  }
  
  private void resolverR(GeneralTree<Integer> nodo, List<Integer> lista) {
	if (nodo.getData() != -1) {
    
      if (!lista.contains(nodo.getData())) {
        lista.add(nodo.getData());	
      }
    
      List<GeneralTree<Integer>> children = nodo.getChildren();
      for (GeneralTree<Integer> child : children) {
        resolverR(child,lista);
      }
    }
  }
	
}
