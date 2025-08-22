package parciales;

import tp3.ejercicio1.*;

public class Parcial1eraFecha2024T1 {

  public Integer buscarArchivo(GeneralTree<String> arbol, String texto) {
   
    if (arbol.isLeaf()) {
      if (arbol.getData().contains(texto)) return 1;
      return 0;
    }
    
    int cant = 0;
    
    for (GeneralTree<String> child : arbol.getChildren()) {
      cant += buscarArchivo(child,texto);	
    }
    
    return cant;
	  
  }
	
}
