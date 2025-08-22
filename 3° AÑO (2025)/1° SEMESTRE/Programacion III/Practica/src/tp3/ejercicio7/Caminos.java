package tp3.ejercicio7;

import tp3.ejercicio1.*;
import java.util.List;
import java.util.ArrayList;

public class Caminos {

  private GeneralTree<Integer> ab = null;
  
  public Caminos(GeneralTree<Integer> ab) {
    this.ab = ab;   
  }
  
  public Caminos() {
	  
  }
  
  //recorrer el arbol completo
  
    //caso base: llego a una hoja
  
    //calcular la maxima profundidad
  
      //guardarme el camino con la maxima profundiad
   
  public List<Integer> caminoAHojaMasLejana() {
    if (ab!=null) return caminoAHojaMasLejanaRecursivo(ab);	
    return null;
  }
  
  private List<Integer> caminoAHojaMasLejanaRecursivo(GeneralTree<Integer> nodo) {  
    if (nodo.isLeaf()) {
      List<Integer> listaCamino = new ArrayList<>();
      listaCamino.add(nodo.getData());
      return listaCamino;
    }
    
    else {  
      
      List<Integer> listaCaminoMaxProf = new ArrayList<>();	
      List<GeneralTree<Integer>> children = nodo.getChildren();
      
      for (GeneralTree<Integer> child : children) {
        List<Integer> caminoHijo = caminoAHojaMasLejanaRecursivo(child);  	  
        if (caminoHijo.size()>listaCaminoMaxProf.size()) {
          listaCaminoMaxProf = caminoHijo;
        }
      }
      
      listaCaminoMaxProf.add(0,nodo.getData());
      return listaCaminoMaxProf;
    }

  }
	
}
