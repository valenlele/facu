package tp3.ejercicio8;

import tp3.ejercicio1.*;
import java.util.List;

public class Navidad {

  private GeneralTree<Integer> ab = null;	
	
  public Navidad(GeneralTree<Integer> ab) {
    this.ab = ab;  
  }
  
  public Navidad() {
	  
  }
  
  public String esAbetoNavidenio() {
    if (ab!=null) {
      boolean res = esAbetoNavidenioRecursivo(ab);	
      if (res)  return "Yes";	   
      else return "No";
    }
    return "No";
  }
  
  private boolean esAbetoNavidenioRecursivo(GeneralTree<Integer> vertice) {    
    if (!vertice.isLeaf()) {
    	
      int cantHojas = 0;
      List<GeneralTree<Integer>> children = vertice.getChildren();
      
      for (GeneralTree<Integer> child : children) {
    	  
        if (child.isLeaf()) cantHojas++; //necestio saber si los hijos directos/inmediatos son hojas, no la cantidad de hojas totales en su subarbol	  
        else if (!esAbetoNavidenioRecursivo(child)) return false;	
        
      }
      if (cantHojas < 3) return false;  
    }
    return true;
  }
  
}
