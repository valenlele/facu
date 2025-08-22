package tp3.ejercicio6;

import tp3.ejercicio1.*;
import java.util.List;

public class RedDeAguaPotable {
	
  private GeneralTree<String> red = null;
  
  public RedDeAguaPotable(GeneralTree<String> red) {
    this.red = red;	  
  }
  
  public RedDeAguaPotable() {
	  
  }
	
  public double minimoCaudal(double caudal) {
    if (red!=null) {
      return minimoCaudalPorNiveles(red,caudal);	
    }
    return -1;
  }
  
  private double minimoCaudalPorNiveles(GeneralTree<String> red, double caudal) {
    if (red.isLeaf()) {
      return caudal;	
    }
	  
	int cantHijos = red.getChildren().size();
    double caudalDividido = caudal / cantHijos;
    double min = Double.MAX_VALUE;
    
    List<GeneralTree<String>> children = red.getChildren();
    for (GeneralTree<String> child : children) {
      double caudalNodo = minimoCaudalPorNiveles(child,caudalDividido);    	
      if (caudalNodo<min) {
        min = caudalNodo;	  
      }
    }
    
    return min;
  }
}
