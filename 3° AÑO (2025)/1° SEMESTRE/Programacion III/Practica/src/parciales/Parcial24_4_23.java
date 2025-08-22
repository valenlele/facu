package parciales;

import tp2.ejercicio1.*;
import java.util.List;
import java.util.ArrayList;

public class Parcial24_4_23 {

  private BinaryTree<Integer> ab;	
	
  public Valores procesar() {
    return procesarRecursivo(this.ab);
  }
  
  private Valores procesarRecursivo(BinaryTree<Integer> ab) {
	Valores v = new Valores();
	
	if (ab != null) {
	 
      Valores vIzq = new Valores();
      Valores vDer = new Valores();
      
      vIzq = procesarRecursivo(ab.getLeftChild());
      vDer = procesarRecursivo(ab.getRightChild());
      
      //termino de procesar los hijos del nodo y proceso lo que me devolvieron
      int cantImpar = vIzq.getCantImapar() + vDer.getCantImapar();
      List<Integer> lista = new ArrayList<>();
      lista.addAll(vIzq.getLista());
      lista.addAll(vDer.getLista());
      
      //proceso el nodo actual
      if (ab.getData() % 2 != 0) {
        cantImpar++;
        if (this.tieneUnSoloHijo(ab)) lista.add(ab.getData());
      }
       
      v.setLista(lista);
      v.setCantImapar(cantImpar);
    }
	return v;
  }
  
  private boolean tieneUnSoloHijo(BinaryTree<Integer> ab) {
    return ((ab.hasLeftChild() && !ab.hasRightChild()) || (!ab.hasLeftChild() && ab.hasRightChild()));  
  }
  
}
